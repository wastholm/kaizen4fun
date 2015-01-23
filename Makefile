BROWSER ?= chromium-browser
IMAGE_SIZE_LARGE ?= 960x680
IMAGE_SIZE_MEDIUM ?= 800x640
IMAGE_SIZE_SMALL ?= 120x120

.PHONY: all
all: notes start-30min

.PHONY: pdf
pdf: kaizen4fun.30min.flattened.md images
	revealup server kaizen4fun.30min.flattened.md --port 5000 & \
		sleep 1; \
		$(BROWSER) http://localhost:5000/?print-pdf

kaizen4fun.30min.flattened.md: kaizen4fun.30min.md
	sed -r 's/^___$$/---/' $+ > $@

.PHONY: notes
notes: images kaizen4fun.notes.html

kaizen4fun.notes.html: kaizen4fun.notes.md
	pandoc \
		--from=markdown \
		--to=html5 \
		--standalone \
		--table-of-contents \
		--output=$@ \
		$+

kaizen4fun.notes.md:
	grep -v '{notes}' kaizen4fun.30min.md > $@

.PHONY: start-30min
start-30min: images
	revealup server kaizen4fun.30min.md --port 5000 & \
		sleep 1; \
		$(BROWSER) http://localhost:5000/

images: \
images/by-sa.png \
images/depgraph.png \
images/i-never-finish.19marksdesign_flickr.jpg \
images/kvadrat-logo.jpg \
images/milestone.pikerslanefarm_flickr.jpg \
images/scribe.png \
images/simple-kanban-board.jpg \
images/to-do_list.tmray02_flickr.jpg \
images/to-do-tattoo.robandstephanielevy_flickr.jpg \
images/too-busy.png \
images/trac-kanban.png \
images/trac-roadmap.png \
images/trac-tickets.png \
images/trac-timeline.png \
images/trac-wiki.png \
images/wall-calendar.sundazed_flickr.jpg \
images/whack-a-mole.jennycu_flickr.jpg \
images/yak.jpg \
#

images/by-sa.png:
	mkdir --parents images
	convert \
		"$(@F)" \
		-scale $(IMAGE_SIZE_SMALL) \
		"images/$(@F)"

images/depgraph.png:
	mkdir --parents images
	cp -p $(@F) images/

images/i-never-finish.19marksdesign_flickr.jpg:
	mkdir --parents images
	convert \
		"$(@F)" \
		-scale $(IMAGE_SIZE_MEDIUM) \
		"images/$(@F)"

images/kvadrat-logo.jpg:
	mkdir --parents images
	cp -p $(@F) images/

images/milestone.pikerslanefarm_flickr.jpg:
	mkdir --parents images
	convert \
		"$(@F)" \
		-scale $(IMAGE_SIZE_MEDIUM) \
		"images/$(@F)"

images/scribe.png:
	mkdir --parents images
	convert \
		"$(@F)" \
		-scale $(IMAGE_SIZE_MEDIUM) \
		"images/$(@F)"

images/simple-kanban-board.jpg:
	mkdir --parents images
	convert \
		"$(@F)" \
		-scale $(IMAGE_SIZE_MEDIUM) \
		"images/$(@F)"

images/to-do_list.tmray02_flickr.jpg:
	mkdir --parents images
	convert \
		"$(@F)" \
		-scale $(IMAGE_SIZE_MEDIUM) \
		"images/$(@F)"

images/to-do-tattoo.robandstephanielevy_flickr.jpg:
	mkdir --parents images
	convert \
		"$(@F)" \
		-scale $(IMAGE_SIZE_MEDIUM) \
		"images/$(@F)"

images/too-busy.png:
	mkdir --parents images
	convert \
		"$(@F)" \
		-scale $(IMAGE_SIZE_MEDIUM) \
		"images/$(@F)"

images/trac-kanban.png:
	mkdir --parents images
	convert \
		"$(@F)" \
		-scale $(IMAGE_SIZE_LARGE) \
		"images/$(@F)"

images/trac-roadmap.png:
	mkdir --parents images
	convert \
		"$(@F)" \
		-scale $(IMAGE_SIZE_LARGE) \
		"images/$(@F)"

images/trac-tickets.png:
	mkdir --parents images
	convert \
		"$(@F)" \
		-scale $(IMAGE_SIZE_LARGE) \
		"images/$(@F)"

images/trac-timeline.png:
	mkdir --parents images
	convert \
		"$(@F)" \
		-scale $(IMAGE_SIZE_LARGE) \
		"images/$(@F)"

images/trac-wiki.png:
	mkdir --parents images
	convert \
		"$(@F)" \
		-scale $(IMAGE_SIZE_LARGE) \
		"images/$(@F)"

images/wall-calendar.sundazed_flickr.jpg:
	mkdir --parents images
	convert \
		"$(@F)" \
		-scale $(IMAGE_SIZE_MEDIUM) \
		"images/$(@F)"

images/whack-a-mole.jennycu_flickr.jpg:
	mkdir --parents images
	convert \
		"$(@F)" \
		-scale $(IMAGE_SIZE_MEDIUM) \
		"images/$(@F)"

images/yak.jpg:
	mkdir --parents images
	convert \
		"$(@F)" \
		-scale $(IMAGE_SIZE_MEDIUM) \
		"images/$(@F)"

.PHONY: clean
clean:
	-rm -fr images/
	-rm -fr kaizen4fun.30min/
	-rm kaizen4fun.30min.flattened.md
	-rm kaizen4fun.notes.html
	-rm kaizen4fun.notes.md
