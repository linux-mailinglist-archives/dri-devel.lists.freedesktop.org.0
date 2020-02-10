Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 997D6157EF9
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2020 16:38:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DABE6EC9F;
	Mon, 10 Feb 2020 15:38:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 186816EBA3
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2020 09:34:24 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 01886602A;
 Mon, 10 Feb 2020 04:34:24 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 10 Feb 2020 04:34:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:mime-version:content-type; s=
 fm2; bh=PtVMF+AzKiS6ncpsdWEqIMZg6EtN7Vwp+WdNFC9JUt8=; b=js09ljxF
 FN3IsGX7HW5f7qDFdJ/asqTHEBE364xlDOILuM1E4G6GMi15TaulCZzAigxsJ3Gp
 yGZFSh6h5SmkKVw8TsfFucwwZEfeNHl0lyAscJou7VEc+PNiccMcHGQHvVWvqWlT
 IXcysDPRZFIQ7P6T589oUkKFjfwNAMcRjIqzGrkrdbdXRVespigUbVdP9AjWWXNL
 kRTAFXlYEUq1o5nYFtttVWri9c5ZItsW+E138LkgvpE0mIJ1EAaEEQb2UYgPYSUU
 dP9syM44dZo84E4B9gvQuzNbYP8N48ZjdhXjbH3HsWFo/rF84Rph8IE94nWl+eR2
 1iz6zE8CGUNNIQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=PtVMF+AzKiS6ncpsdWEqIMZg6EtN7
 Vwp+WdNFC9JUt8=; b=XvERLVAliNCdMOt2BYFz5FMX/yX3TKjCzkP0maWlyzrk4
 UjsNa22oEPuuQhIDDWB+8uNUQVDgQAo8ujyif/b4NX7X3jllOBH7cjz+eUvmn/NM
 UrfieN1KXw9rAkRKQSSaVIyJv4+UyvQyMfliwHpz9N0VTE4UHR8vP32plFVaN3oC
 tbB2Z9RzMJhyWmb1tgsPXKMIrP4/plnVjkQhaet7s6J/wK+bOVbH6EuuqpPJWII4
 F4u9YSEilPwpHzLSpsi3+MeOoZTnSP5WCsJ+B9k/cGIWjZ6/h8AzGVjcSrLmui6c
 5IfIOWsY4j6nOgSYF9gjsuFjqzXZm7daDBR79lO1A==
X-ME-Sender: <xms:nyNBXuaBrWAFs8YyJ_18stlUDwLpfAcxy-8rnD9esUY2Y4VnTX2l9w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedriedugddtgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkgggtugesghdtreertddtudenucfhrhhomhepofgrgihimhgvucft
 ihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucffohhmrghinhepfh
 hrvggvuggvshhkthhophdrohhrghenucfkphepledtrdekledrieekrdejieenucevlhhu
 shhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestg
 gvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:nyNBXtvfRwJFngJLuRp-v8GwDRuWf2E1k5kpiwF13hTGGlVVKarI4g>
 <xmx:nyNBXrsbnOKBhQ-WtsY735sfY-xY2eXYH0Cqe1eGPEa62NnDkMF6IA>
 <xmx:nyNBXidwWVAOZNjWTUSNnYfY2fN97pyVBEcUSRexfMtwIRUb6NilDQ>
 <xmx:nyNBXjYMmVyc_I6Ju1dteS-gUWdD7MxIc4RrLqXAb3JsM6JyjEQpMg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0F9393280062;
 Mon, 10 Feb 2020 04:34:22 -0500 (EST)
Date: Mon, 10 Feb 2020 10:34:21 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-next
Message-ID: <20200210093421.xu4sofldm6wm6xq6@gilmour.lan>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 10 Feb 2020 15:38:06 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0398252494=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0398252494==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xa7hxajkz6sqq7my"
Content-Disposition: inline


--xa7hxajkz6sqq7my
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave, Daniel,

Now that -rc1 is out, here's the first drm-misc-next PR. All things
considered it's been pretty quiet, the diffstat being scary mostly
because of the conversion of device tree bindings to YAML and a new
driver.

Maxime

drm-misc-next-2020-02-10:
drm-misc-next for 5.7:

UAPI Changes:
  - lima: Add support for heap buffers

Cross-subsystem Changes:

Core Changes:
  - Implement mode_config mode_valid for memory constrained drivers
  - Bus format negociation between bridges
  - Consolidate fake vblank events for drivers without vblank interrupts
  - drm/bufs: dma_alloc related cleanups
  - drm/dp_mst: Various fixes
  - drm/print: New drm_device based print helpers
  - Thomas is a drm-misc maintainer now!

Driver Changes:
  - DPMS cleanups for atomic drivers
  - Removal of owner field in SPI tinydrm drivers
  - Removal of explicit dependency on DT for tinydrm drivers
  - Conversion to YAML schemas for DT bindings
  - tidss: New driver
  - virtio: various reworks and fixes
  - Our usual dozen or so new panels or bridges
The following changes since commit 44c58c520ffc4b1f75241e5029c5ae6b223d0623:

  drm/panel: simple: Add Satoz SAT050AT40H12R2 panel support (2020-01-09 20=
:27:06 +0100)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-2020-02-10

for you to fetch changes up to 06f749af622ca28c4e1f60c43fabd3917114f95a:

  drm/udl: Clear struct drm_connector_funcs.dpms (2020-02-10 09:24:09 +0100)

----------------------------------------------------------------
drm-misc-next for 5.7:

UAPI Changes:
  - lima: Add support for heap buffers

Cross-subsystem Changes:

Core Changes:
  - Implement mode_config mode_valid for memory constrained drivers
  - Bus format negociation between bridges
  - Consolidate fake vblank events for drivers without vblank interrupts
  - drm/bufs: dma_alloc related cleanups
  - drm/dp_mst: Various fixes
  - drm/print: New drm_device based print helpers
  - Thomas is a drm-misc maintainer now!

Driver Changes:
  - DPMS cleanups for atomic drivers
  - Removal of owner field in SPI tinydrm drivers
  - Removal of explicit dependency on DT for tinydrm drivers
  - Conversion to YAML schemas for DT bindings
  - tidss: New driver
  - virtio: various reworks and fixes
  - Our usual dozen or so new panels or bridges

----------------------------------------------------------------
Andy Shevchenko (4):
      drm/tiny/repaper: Make driver OF-independent
      drm/tiny/repaper: No need to set ->owner for spi_register_driver()
      drm/tiny/st7735r: Make driver OF-independent
      drm/tiny/st7735r: No need to set ->owner for spi_register_driver()

Arnd Bergmann (2):
      drm: panel: fix excessive stack usage in td028ttec1_prepare
      drm/drm_panel: fix export of drm_panel_of_backlight, try #3

Benjamin Gaignard (3):
      drm: fix parameters documentation style in drm_dma
      dt-bindings: panel: Convert raydium,rm68200 to json-schema
      dt-bindings: panel: Convert orisetech,otm8009a to json-schema

Bo YU (1):
      drm/drm_dp_mst:remove set but not used variable 'origlen'

Boris Brezillon (8):
      drm/bridge: Add a drm_bridge_state object
      drm/rcar-du: Plug atomic state hooks to the default implementation
      drm/bridge: analogix: Plug atomic state hooks to the default implemen=
tation
      drm/bridge: Patch atomic hooks to take a drm_bridge_state
      drm/bridge: Add an ->atomic_check() hook
      drm/bridge: Add the necessary bits to support bus format negotiation
      drm/imx: pd: Use bus format/flags provided by the bridge when availab=
le
      drm/panel: simple: Fix the lt089ac29000 bus_format

Chia-I Wu (9):
      drm/virtio: fix a wait_event condition
      drm/virtio: remove incorrect ENOSPC check
      drm/virtio: add virtio_gpu_vbuf_ctrl_hdr
      drm/virtio: no need to pass virtio_gpu_ctrl_hdr
      drm/virtio: unlock object array on errors
      drm/virtio: set up virtqueue sgs before locking
      drm/virtio: move locking into virtio_gpu_queue_ctrl_sgs
      drm/virtio: move the check for vqs_ready earlier
      drm/virtio: move virtqueue_notify into virtio_gpu_queue_ctrl_sgs

Chris Wilson (4):
      drm: Release filp before global lock
      drm: Avoid drm_global_mutex for simple inc/dec of dev->open_count
      drm: Remove PageReserved manipulation from drm_pci_alloc
      drm: Remove the dma_alloc_coherent wrapper for internal usage

Christian K=F6nig (1):
      drm/ttm: nuke invalidate_caches callback

Chuhong Yuan (2):
      video: ssd1307fb: add the missed regulator_disable
      pxa168fb: fix release function mismatch in probe failure

Colin Ian King (3):
      video: hyperv_fb: fix indentation issue
      OMAP: DSS2: remove non-zero check on variable r
      video: fbdev: nvidia: clean up indentation issues and comment block

Dan Carpenter (1):
      fbdev: potential information leak in do_fb_ioctl()

Daniel Stone (1):
      drm: Add getfb2 ioctl

Daniel Vetter (8):
      drm/todo: Add item for the plane->atomic_check confusion
      drm/imx: plane_state->fb iff plane_state->crtc
      drm/rockchip: plane_state->fb iff plane_state->crtc
      drm/vc4: plane_state->fb iff plane_state->crtc
      drm/vkms: plane_state->fb iff plane_state->crtc
      drm/zte: plane_state->fb iff plane_state->crtc
      drm/crc: Actually allow to change the crc source
      drm/auth: Drop master_create/destroy hooks

Derek Basehore (1):
      drm/connector: Split out orientation quirk detection (v2)

Etienne Carriere (1):
      drm/stm: dsi: stm mipi dsi doesn't print error on probe deferral

Ezequiel Garcia (1):
      drm/panfrost: Prefix interrupt handlers' names

Geert Uytterhoeven (5):
      dt-bindings: display: sitronix,st7735r: Convert to DT schema
      dt-bindings: display: sitronix,st7735r: Add Okaya RH128128T
      drm/mipi_dbi: Add support for display offsets
      drm: tiny: st7735r: Prepare for adding support for more displays
      drm: tiny: st7735r: Add support for Okaya RH128128T

Gerd Hoffmann (3):
      drm/virtio: fix vblank handling
      drm/virtio: ratelimit error logging
      drm/virtio: fix ring free check

Hans de Goede (1):
      drm/connector: Hookup the new drm_cmdline_mode panel_orientation memb=
er (v2)

Icenowy Zheng (3):
      dt-bindings: vendor-prefix: add Shenzhen Feixin Photoelectics Co., Ltd
      dt-bindings: panel: add Feixin K101 IM2BA02 MIPI-DSI panel
      drm/panel: Add Feixin K101 IM2BA02 panel

Jani Nikula (2):
      drm: add drm_core_check_all_features() to check for a mask of features
      drm/debugfs: also take per device driver features into account

Jitao Shi (7):
      dt-bindings: display: panel: Add boe tv101wum-n16 panel bindings
      drm/panel: support for boe tv101wum-nl6 wuxga dsi video mode panel
      drm/panel: support for auo, kd101n80-45na wuxga dsi video mode panel
      drm/panel: support for boe, tv101wum-n53 wuxga dsi video mode panel
      drm/panel: support for auo, b101uan08.3 wuxga dsi video mode panel
      Documentation: bridge: Add documentation for ps8640 DT properties
      drm/bridge: Add I2C based driver for ps8640 bridge

Jos=E9 Roberto de Souza (1):
      drm/mst: Some style improvements in drm_dp_mst_topology_mgr_set_mst()

Julia Lawall (3):
      video: sa1100fb: constify copied structure
      fbdev: s1d13xxxfb: use resource_size
      fbdev: cg14fb: use resource_size

Jyri Sarha (5):
      dt-bindings: display: ti,k2g-dss: Add dt-schema yaml binding
      dt-bindings: display: ti,am65x-dss: Add dt-schema yaml binding
      dt-bindings: display: ti,j721e-dss: Add dt-schema yaml binding
      drm/tidss: New driver for TI Keystone platform Display SubSystem
      MAINTAINERS: add entry for tidss

Kamlesh Gurudasani (2):
      dt-bindings: add binding for tft displays based on ilitek,ili9486
      drm/tiny: add support for tft displays based on ilitek,ili9486

Krzysztof Kozlowski (3):
      drm/rockchip: Add missing vmalloc header
      video: Fix Kconfig indentation
      video: exynos: Rename Exynos to lowercase

Lionel Landwerlin (1):
      drm/syncobj: Add documentation for timeline syncobj

Lyude Paul (4):
      Revert "drm/dp_mst: Remove VCPI while disabling topology mgr"
      drm/dp_mst: Fix indenting in drm_dp_mst_topology_mgr_set_mst()
      drm/dp_mst: Fix clearing payload state on topology disable
      drm/dp_mst: Mention max_payloads in proposed_vcpis/payloads docs

Marcel Ziswiler (3):
      dt-bindings: add vendor prefix for logic technologies limited
      dt-bindings: panel-simple: add bindings for logic technologies displa=
ys
      drm/panel: simple: add display timings for logic technologies displays

Marian-Cristian Rotariu (2):
      dt-bindings: display: Add bindings for EDT panel
      drm/panel: simple: Add EDT panel support

Masahiro Yamada (1):
      fbdev: remove object duplication in Makefile

Maxime Ripard (1):
      Merge tag 'topic/drm-warn-2020-01-22' of git://anongit.freedesktop.or=
g/drm/drm-intel into drm-misc-next

Michael Srba (2):
      dt-bindings: display/panel: add bindings for S6E88A0-AMS452EF01
      drm/panel: Add Samsung s6e88a0-ams452ef01 panel driver

Nathan Chancellor (2):
      fbcon: Adjust indentation in set_con2fb_map
      fbmem: Adjust indentation in fb_prepare_logo and fb_blank

Nicolas Boichat (1):
      drm/panel: Fix boe,tv101wum-n53 htotal timing

Oleg Vasilev (2):
      drm: move DP_MAX_DOWNSTREAM_PORTS from i915 to drm core
      drm: always determine branch device with drm_dp_is_branch()

Pankaj Bharadiya (1):
      drm/print: introduce new struct drm_device based WARN* macros

Paul Cercueil (3):
      dt-bindings: vendor-prefixes: Add Shenzhen Frida LCD Co., Ltd.
      dt-bindings: panel-simple: Add compatible for Frida FRD350H54004 LCD
      drm/panel: simple: Add support for the Frida FRD350H54004 panel

Qiang Yu (5):
      drm/lima: update register info
      drm/lima: add lima_vm_map_bo
      drm/lima: support heap buffer creation
      drm/lima: recover task by enlarging heap buffer
      drm/lima: increase driver version to 1.1

Rob Herring (1):
      dt-bindings: display: Convert a bunch of panels to DT schema

Sam Ravnborg (2):
      dt-bindings: restrict properties for sitronix,st7735r
      dt-bindings: one file of all simple DSI panels

Steven Price (1):
      drm/panfrost: Remove core stack power management

Thomas Zimmermann (22):
      drm: Initialize struct drm_crtc_state.no_vblank from device settings
      drm/arc: Remove sending of vblank event
      drm/ast: Don't set struct drm_crtc_state.no_vblank explicitly
      drm/bochs: Remove sending of vblank event
      drm/cirrus: Remove sending of vblank event
      drm/gm12u320: Remove sending of vblank event
      drm/ili9225: Remove sending of vblank event
      drm/mipi-dbi: Remove sending of vblank event
      drm/qxl: Remove sending of vblank event
      drm/repaper: Remove sending of vblank event
      drm/st7586: Remove sending of vblank event
      drm/udl: Don't set struct drm_crtc_state.no_vblank explicitly
      drm/vboxvideo: Remove sending of vblank event
      drm/virtio: Remove sending of vblank event
      drm/xen: Explicitly disable automatic sending of vblank event
      MAINTAINERS: Add Thomas as drm-misc co-maintainer
      drm/vram: Add helpers to validate a display mode's memory requirements
      drm/bochs: Implement struct drm_mode_config_funcs.mode_valid
      drm/hibmc: Implement struct drm_mode_config_funcs.mode_valid
      drm/vboxvideo: Implement struct drm_mode_config_funcs.mode_valid
      drm/bochs: Clear struct drm_connector_funcs.dpms
      drm/udl: Clear struct drm_connector_funcs.dpms

Wambui Karuga (1):
      drm/rockchip: use DIV_ROUND_UP macro for calculations.

Yannick Fertre (2):
      drm/stm: ltdc: add number of interrupts
      drm/stm: ltdc: check crtc state before enabling LIE

xinhui pan (1):
      drm/ttm: flush the fence on the bo after we individualize the reserva=
tion object

 .../devicetree/bindings/display/bridge/ps8640.yaml |  112 +
 .../bindings/display/ilitek,ili9486.yaml           |   73 +
 .../bindings/display/panel/auo,b080uan01.txt       |    7 -
 .../bindings/display/panel/auo,b101aw03.txt        |    7 -
 .../bindings/display/panel/auo,b101ean01.txt       |    7 -
 .../bindings/display/panel/auo,b101xtn01.txt       |    7 -
 .../bindings/display/panel/auo,b116xw03.txt        |    7 -
 .../bindings/display/panel/auo,b133htn01.txt       |    7 -
 .../bindings/display/panel/auo,b133xtn01.txt       |    7 -
 .../bindings/display/panel/auo,g070vvn01.txt       |   29 -
 .../bindings/display/panel/auo,g101evn010.txt      |   12 -
 .../bindings/display/panel/auo,g104sn02.txt        |   12 -
 .../bindings/display/panel/auo,g133han01.txt       |    7 -
 .../bindings/display/panel/auo,g185han01.txt       |    7 -
 .../bindings/display/panel/auo,p320hvn03.txt       |    8 -
 .../bindings/display/panel/auo,t215hvn01.txt       |    7 -
 .../bindings/display/panel/avic,tm070ddh03.txt     |    7 -
 .../bindings/display/panel/boe,hv070wsa-100.txt    |   28 -
 .../bindings/display/panel/boe,nv101wxmn51.txt     |    7 -
 .../bindings/display/panel/boe,tv080wum-nl0.txt    |    7 -
 .../bindings/display/panel/boe,tv101wum-nl6.yaml   |   80 +
 .../display/panel/cdtech,s043wq26h-ct7.txt         |   12 -
 .../display/panel/cdtech,s070wv95-ct16.txt         |   12 -
 .../display/panel/chunghwa,claa070wp03xg.txt       |    7 -
 .../display/panel/chunghwa,claa101wa01a.txt        |    7 -
 .../display/panel/chunghwa,claa101wb03.txt         |    7 -
 .../display/panel/dataimage,scf0700c48ggu18.txt    |    8 -
 .../bindings/display/panel/dlc,dlc1010gig.txt      |   12 -
 .../bindings/display/panel/edt,et-series.txt       |   55 -
 .../display/panel/evervision,vgg804821.txt         |   12 -
 .../display/panel/feixin,k101-im2ba02.yaml         |   55 +
 .../display/panel/foxlink,fl500wvr00-a0t.txt       |    7 -
 .../bindings/display/panel/friendlyarm,hd702e.txt  |   32 -
 .../display/panel/giantplus,gpg482739qs5.txt       |    7 -
 .../bindings/display/panel/hannstar,hsd070pww1.txt |    7 -
 .../bindings/display/panel/hannstar,hsd100pxn1.txt |    7 -
 .../bindings/display/panel/hit,tx23d38vm0caa.txt   |    7 -
 .../bindings/display/panel/innolux,at043tn24.txt   |    7 -
 .../bindings/display/panel/innolux,at070tn92.txt   |    7 -
 .../bindings/display/panel/innolux,g070y2-l01.txt  |   12 -
 .../bindings/display/panel/innolux,g101ice-l01.txt |    7 -
 .../bindings/display/panel/innolux,g121i1-l01.txt  |    7 -
 .../bindings/display/panel/innolux,g121x1-l03.txt  |    7 -
 .../bindings/display/panel/innolux,n116bge.txt     |    7 -
 .../bindings/display/panel/innolux,n156bge-l21.txt |    7 -
 .../bindings/display/panel/innolux,zj070na-01p.txt |    7 -
 .../bindings/display/panel/koe,tx14d24vm1bpa.txt   |   42 -
 .../bindings/display/panel/koe,tx31d200vm0baa.txt  |   25 -
 .../bindings/display/panel/kyo,tcg121xglp.txt      |    7 -
 .../display/panel/lemaker,bl035-rgb-002.txt        |   12 -
 .../bindings/display/panel/lg,lb070wv8.txt         |    7 -
 .../bindings/display/panel/lg,lp079qx1-sp0v.txt    |    7 -
 .../bindings/display/panel/lg,lp097qx1-spa1.txt    |    7 -
 .../bindings/display/panel/lg,lp120up1.txt         |    7 -
 .../bindings/display/panel/lg,lp129qe.txt          |    7 -
 .../display/panel/mitsubishi,aa070mc01.txt         |    7 -
 .../bindings/display/panel/nec,nl12880b20-05.txt   |    8 -
 .../bindings/display/panel/nec,nl4827hc19-05b.txt  |    7 -
 .../bindings/display/panel/netron-dy,e231732.txt   |    7 -
 .../panel/newhaven,nhd-4.3-480272ef-atxl.txt       |    7 -
 .../display/panel/nlt,nl192108ac18-02d.txt         |    8 -
 .../devicetree/bindings/display/panel/nvd,9128.txt |    7 -
 .../display/panel/okaya,rs800480t-7x0gp.txt        |    7 -
 .../display/panel/olimex,lcd-olinuxino-43-ts.txt   |    7 -
 .../bindings/display/panel/ontat,yx700wv03.txt     |    7 -
 .../bindings/display/panel/orisetech,otm8009a.txt  |   23 -
 .../bindings/display/panel/orisetech,otm8009a.yaml |   53 +
 .../display/panel/ortustech,com37h3m05dtc.txt      |   12 -
 .../display/panel/ortustech,com37h3m99dtc.txt      |   12 -
 .../display/panel/ortustech,com43h4m85ulc.txt      |    7 -
 .../display/panel/osddisplays,osd070t1718-19ts.txt |   12 -
 .../display/panel/osddisplays,osd101t2045-53ts.txt |   11 -
 .../display/panel/panasonic,vvx10f004b00.txt       |    7 -
 .../display/panel/panasonic,vvx10f034n00.txt       |   20 -
 .../bindings/display/panel/panel-simple-dsi.yaml   |   67 +
 .../bindings/display/panel/panel-simple.yaml       |  205 ++
 .../display/panel/qiaodian,qd43003c0-40.txt        |    7 -
 .../bindings/display/panel/raydium,rm68200.txt     |   25 -
 .../bindings/display/panel/raydium,rm68200.yaml    |   56 +
 .../display/panel/rocktech,rk070er9427.txt         |   25 -
 .../display/panel/samsung,lsn122dl01-c01.txt       |    7 -
 .../bindings/display/panel/samsung,ltn101nt05.txt  |    7 -
 .../display/panel/samsung,ltn140at29-301.txt       |    7 -
 .../display/panel/samsung,s6e88a0-ams452ef01.yaml  |   50 +
 .../bindings/display/panel/sharp,lq035q7db03.txt   |   12 -
 .../bindings/display/panel/sharp,lq070y3dg3b.txt   |   12 -
 .../bindings/display/panel/sharp,lq101k1ly04.txt   |    7 -
 .../bindings/display/panel/sharp,lq123p1jx31.txt   |    7 -
 .../display/panel/shelly,sca07010-bfn-lnn.txt      |    7 -
 .../bindings/display/panel/starry,kr122ea0sra.txt  |    7 -
 .../bindings/display/panel/tianma,tm070jdhg30.txt  |    7 -
 .../bindings/display/panel/tianma,tm070rvhg71.txt  |   29 -
 .../display/panel/toshiba,lt089ac29000.txt         |    8 -
 .../bindings/display/panel/tpk,f07a-0102.txt       |    8 -
 .../bindings/display/panel/tpk,f10a-0102.txt       |    8 -
 .../bindings/display/panel/urt,umsh-8596md.txt     |   16 -
 .../bindings/display/panel/vl050_8048nt_c01.txt    |   12 -
 .../bindings/display/panel/winstar,wf35ltiacd.txt  |   48 -
 .../bindings/display/sitronix,st7735r.txt          |   35 -
 .../bindings/display/sitronix,st7735r.yaml         |   78 +
 .../bindings/display/ti/ti,am65x-dss.yaml          |  152 ++
 .../bindings/display/ti/ti,j721e-dss.yaml          |  208 ++
 .../devicetree/bindings/display/ti/ti,k2g-dss.yaml |  106 +
 .../devicetree/bindings/vendor-prefixes.yaml       |    6 +
 Documentation/gpu/todo.rst                         |   22 +
 MAINTAINERS                                        |   28 +-
 drivers/gpu/drm/Kconfig                            |    2 +
 drivers/gpu/drm/Makefile                           |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |    6 -
 drivers/gpu/drm/arc/arcpgu_crtc.c                  |   16 -
 drivers/gpu/drm/ast/ast_main.c                     |   24 +-
 drivers/gpu/drm/ast/ast_mode.c                     |    2 -
 drivers/gpu/drm/bochs/bochs_kms.c                  |   31 +-
 drivers/gpu/drm/bridge/Kconfig                     |   11 +
 drivers/gpu/drm/bridge/Makefile                    |    1 +
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c |   44 +-
 drivers/gpu/drm/bridge/parade-ps8640.c             |  348 +++
 drivers/gpu/drm/cirrus/cirrus.c                    |    8 -
 drivers/gpu/drm/drm_atomic.c                       |  116 +
 drivers/gpu/drm/drm_atomic_helper.c                |   83 +-
 drivers/gpu/drm/drm_atomic_state_helper.c          |  103 +
 drivers/gpu/drm/drm_auth.c                         |    8 -
 drivers/gpu/drm/drm_bridge.c                       |  437 ++-
 drivers/gpu/drm/drm_bufs.c                         |   20 +-
 drivers/gpu/drm/drm_connector.c                    |   81 +-
 drivers/gpu/drm/drm_crtc_internal.h                |    2 +
 drivers/gpu/drm/drm_debugfs.c                      |    3 +-
 drivers/gpu/drm/drm_debugfs_crc.c                  |    2 +-
 drivers/gpu/drm/drm_dma.c                          |   21 +-
 drivers/gpu/drm/drm_dp_helper.c                    |    3 +-
 drivers/gpu/drm/drm_dp_mst_topology.c              |   41 +-
 drivers/gpu/drm/drm_file.c                         |   44 +-
 drivers/gpu/drm/drm_framebuffer.c                  |  122 +
 drivers/gpu/drm/drm_gem_vram_helper.c              |   61 +
 drivers/gpu/drm/drm_ioctl.c                        |    1 +
 drivers/gpu/drm/drm_mipi_dbi.c                     |   39 +-
 drivers/gpu/drm/drm_pci.c                          |   36 +-
 drivers/gpu/drm/drm_syncobj.c                      |   87 +-
 drivers/gpu/drm/drm_vblank.c                       |   28 +
 drivers/gpu/drm/drm_vm.c                           |   10 +-
 drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c        |    1 +
 drivers/gpu/drm/i915/display/icl_dsi.c             |    5 +-
 drivers/gpu/drm/i915/display/intel_display_types.h |    2 -
 drivers/gpu/drm/i915/display/intel_dp.c            |   11 +-
 drivers/gpu/drm/i915/display/vlv_dsi.c             |    5 +-
 drivers/gpu/drm/i915/i915_drv.c                    |    2 +-
 drivers/gpu/drm/i915/i915_switcheroo.c             |    2 +-
 drivers/gpu/drm/imx/ipuv3-plane.c                  |    2 +-
 drivers/gpu/drm/imx/parallel-display.c             |  176 +-
 drivers/gpu/drm/lima/lima_drv.c                    |   16 +-
 drivers/gpu/drm/lima/lima_drv.h                    |    1 +
 drivers/gpu/drm/lima/lima_gem.c                    |  134 +-
 drivers/gpu/drm/lima/lima_gem.h                    |    4 +
 drivers/gpu/drm/lima/lima_gp.c                     |   58 +-
 drivers/gpu/drm/lima/lima_mmu.c                    |    5 +
 drivers/gpu/drm/lima/lima_mmu.h                    |    1 +
 drivers/gpu/drm/lima/lima_regs.h                   |    1 +
 drivers/gpu/drm/lima/lima_sched.c                  |   33 +-
 drivers/gpu/drm/lima/lima_sched.h                  |    6 +
 drivers/gpu/drm/lima/lima_vm.c                     |   46 +-
 drivers/gpu/drm/lima/lima_vm.h                     |    1 +
 drivers/gpu/drm/nouveau/nouveau_bo.c               |    8 -
 drivers/gpu/drm/nouveau/nouveau_vga.c              |    2 +-
 drivers/gpu/drm/panel/Kconfig                      |   24 +
 drivers/gpu/drm/panel/Makefile                     |    3 +
 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c     |  854 ++++++
 drivers/gpu/drm/panel/panel-feixin-k101-im2ba02.c  |  526 ++++
 .../drm/panel/panel-samsung-s6e88a0-ams452ef01.c   |  293 +++
 drivers/gpu/drm/panel/panel-simple.c               |  133 +-
 drivers/gpu/drm/panel/panel-tpo-td028ttec1.c       |   17 +-
 drivers/gpu/drm/panfrost/panfrost_gpu.c            |    7 +-
 drivers/gpu/drm/panfrost/panfrost_job.c            |    2 +-
 drivers/gpu/drm/panfrost/panfrost_mmu.c            |    6 +-
 drivers/gpu/drm/qxl/qxl_display.c                  |   14 -
 drivers/gpu/drm/qxl/qxl_ttm.c                      |    6 -
 drivers/gpu/drm/radeon/radeon_device.c             |    2 +-
 drivers/gpu/drm/radeon/radeon_ttm.c                |    6 -
 drivers/gpu/drm/rcar-du/rcar_lvds.c                |   11 +-
 drivers/gpu/drm/rockchip/rockchip_drm_gem.c        |    1 +
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c        |    2 +-
 drivers/gpu/drm/rockchip/rockchip_drm_vop.h        |    2 +-
 drivers/gpu/drm/stm/dw_mipi_dsi-stm.c              |    4 +-
 drivers/gpu/drm/stm/ltdc.c                         |   37 +-
 drivers/gpu/drm/stm/ltdc.h                         |    1 +
 drivers/gpu/drm/tidss/Kconfig                      |   14 +
 drivers/gpu/drm/tidss/Makefile                     |   12 +
 drivers/gpu/drm/tidss/tidss_crtc.c                 |  377 +++
 drivers/gpu/drm/tidss/tidss_crtc.h                 |   46 +
 drivers/gpu/drm/tidss/tidss_dispc.c                | 2768 ++++++++++++++++=
++++
 drivers/gpu/drm/tidss/tidss_dispc.h                |  132 +
 drivers/gpu/drm/tidss/tidss_dispc_regs.h           |  243 ++
 drivers/gpu/drm/tidss/tidss_drv.c                  |  285 ++
 drivers/gpu/drm/tidss/tidss_drv.h                  |   39 +
 drivers/gpu/drm/tidss/tidss_encoder.c              |   88 +
 drivers/gpu/drm/tidss/tidss_encoder.h              |   17 +
 drivers/gpu/drm/tidss/tidss_irq.c                  |  146 ++
 drivers/gpu/drm/tidss/tidss_irq.h                  |   77 +
 drivers/gpu/drm/tidss/tidss_kms.c                  |  249 ++
 drivers/gpu/drm/tidss/tidss_kms.h                  |   15 +
 drivers/gpu/drm/tidss/tidss_plane.c                |  217 ++
 drivers/gpu/drm/tidss/tidss_plane.h                |   25 +
 drivers/gpu/drm/tidss/tidss_scale_coefs.c          |  202 ++
 drivers/gpu/drm/tidss/tidss_scale_coefs.h          |   22 +
 drivers/gpu/drm/tiny/Kconfig                       |   22 +-
 drivers/gpu/drm/tiny/Makefile                      |    1 +
 drivers/gpu/drm/tiny/gm12u320.c                    |    9 -
 drivers/gpu/drm/tiny/ili9225.c                     |    9 -
 drivers/gpu/drm/tiny/ili9486.c                     |  286 ++
 drivers/gpu/drm/tiny/repaper.c                     |   21 +-
 drivers/gpu/drm/tiny/st7586.c                      |    9 -
 drivers/gpu/drm/tiny/st7735r.c                     |   76 +-
 drivers/gpu/drm/ttm/ttm_bo.c                       |   13 +-
 drivers/gpu/drm/udl/udl_connector.c                |    1 -
 drivers/gpu/drm/udl/udl_modeset.c                  |   11 -
 drivers/gpu/drm/vboxvideo/vbox_mode.c              |   13 +-
 drivers/gpu/drm/vc4/vc4_plane.c                    |    2 +-
 drivers/gpu/drm/virtio/virtgpu_debugfs.c           |    1 +
 drivers/gpu/drm/virtio/virtgpu_display.c           |    9 +-
 drivers/gpu/drm/virtio/virtgpu_drv.h               |    1 +
 drivers/gpu/drm/virtio/virtgpu_kms.c               |    3 +
 drivers/gpu/drm/virtio/virtgpu_vq.c                |  203 +-
 drivers/gpu/drm/vkms/vkms_plane.c                  |    2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c         |    6 -
 drivers/gpu/drm/xen/xen_drm_front_kms.c            |   19 +
 drivers/gpu/drm/zte/zx_plane.c                     |    4 +-
 drivers/video/backlight/Kconfig                    |    8 +-
 drivers/video/console/Kconfig                      |   76 +-
 drivers/video/fbdev/cg14.c                         |    3 +-
 drivers/video/fbdev/core/Makefile                  |    1 -
 drivers/video/fbdev/core/fbcon.c                   |   27 +-
 drivers/video/fbdev/core/fbmem.c                   |   38 +-
 drivers/video/fbdev/hyperv_fb.c                    |    4 +-
 drivers/video/fbdev/nvidia/nvidia.c                |   37 +-
 drivers/video/fbdev/omap2/omapfb/omapfb-main.c     |    4 -
 drivers/video/fbdev/pxa168fb.c                     |    2 +-
 drivers/video/fbdev/s1d13xxxfb.c                   |   17 +-
 drivers/video/fbdev/sa1100fb.c                     |    2 +-
 drivers/video/fbdev/ssd1307fb.c                    |    2 +
 include/drm/drm_atomic.h                           |   76 +
 include/drm/drm_atomic_helper.h                    |    8 +
 include/drm/drm_atomic_state_helper.h              |   13 +
 include/drm/drm_bridge.h                           |  179 +-
 include/drm/drm_connector.h                        |    9 +-
 include/drm/drm_crtc.h                             |   34 +-
 include/drm/drm_device.h                           |    2 +-
 include/drm/drm_dp_helper.h                        |    2 +
 include/drm/drm_dp_mst_helper.h                    |    6 +-
 include/drm/drm_drv.h                              |   38 +-
 include/drm/drm_file.h                             |    1 +
 include/drm/drm_gem_vram_helper.h                  |    9 +
 include/drm/drm_legacy.h                           |    6 -
 include/drm/drm_mipi_dbi.h                         |   12 +
 include/drm/drm_panel.h                            |    3 +-
 include/drm/drm_print.h                            |   29 +
 include/drm/drm_simple_kms_helper.h                |    7 +-
 include/drm/drm_vblank.h                           |    1 +
 include/drm/ttm/ttm_bo_driver.h                    |   15 -
 include/uapi/drm/drm.h                             |    2 +
 include/uapi/drm/lima_drm.h                        |    9 +-
 include/video/samsung_fimd.h                       |    2 +-
 261 files changed, 11253 insertions(+), 1839 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/ps8640=
=2Eyaml
 create mode 100644 Documentation/devicetree/bindings/display/ilitek,ili948=
6.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/auo,b08=
0uan01.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/auo,b10=
1aw03.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/auo,b10=
1ean01.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/auo,b10=
1xtn01.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/auo,b11=
6xw03.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/auo,b13=
3htn01.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/auo,b13=
3xtn01.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/auo,g07=
0vvn01.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/auo,g10=
1evn010.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/auo,g10=
4sn02.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/auo,g13=
3han01.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/auo,g18=
5han01.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/auo,p32=
0hvn03.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/auo,t21=
5hvn01.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/avic,tm=
070ddh03.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/boe,hv0=
70wsa-100.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/boe,nv1=
01wxmn51.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/boe,tv0=
80wum-nl0.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/boe,tv1=
01wum-nl6.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/cdtech,=
s043wq26h-ct7.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/cdtech,=
s070wv95-ct16.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/chunghw=
a,claa070wp03xg.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/chunghw=
a,claa101wa01a.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/chunghw=
a,claa101wb03.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/dataima=
ge,scf0700c48ggu18.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/dlc,dlc=
1010gig.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/edt,et-=
series.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/evervis=
ion,vgg804821.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/feixin,=
k101-im2ba02.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/foxlink=
,fl500wvr00-a0t.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/friendl=
yarm,hd702e.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/giantpl=
us,gpg482739qs5.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/hannsta=
r,hsd070pww1.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/hannsta=
r,hsd100pxn1.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/hit,tx2=
3d38vm0caa.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/innolux=
,at043tn24.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/innolux=
,at070tn92.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/innolux=
,g070y2-l01.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/innolux=
,g101ice-l01.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/innolux=
,g121i1-l01.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/innolux=
,g121x1-l03.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/innolux=
,n116bge.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/innolux=
,n156bge-l21.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/innolux=
,zj070na-01p.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/koe,tx1=
4d24vm1bpa.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/koe,tx3=
1d200vm0baa.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/kyo,tcg=
121xglp.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/lemaker=
,bl035-rgb-002.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/lg,lb07=
0wv8.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/lg,lp07=
9qx1-sp0v.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/lg,lp09=
7qx1-spa1.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/lg,lp12=
0up1.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/lg,lp12=
9qe.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/mitsubi=
shi,aa070mc01.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/nec,nl1=
2880b20-05.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/nec,nl4=
827hc19-05b.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/netron-=
dy,e231732.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/newhave=
n,nhd-4.3-480272ef-atxl.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/nlt,nl1=
92108ac18-02d.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/nvd,912=
8.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/okaya,r=
s800480t-7x0gp.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/olimex,=
lcd-olinuxino-43-ts.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/ontat,y=
x700wv03.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/orisete=
ch,otm8009a.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/orisete=
ch,otm8009a.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/ortuste=
ch,com37h3m05dtc.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/ortuste=
ch,com37h3m99dtc.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/ortuste=
ch,com43h4m85ulc.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/osddisp=
lays,osd070t1718-19ts.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/osddisp=
lays,osd101t2045-53ts.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/panason=
ic,vvx10f004b00.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/panason=
ic,vvx10f034n00.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/panel-s=
imple-dsi.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/qiaodia=
n,qd43003c0-40.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/raydium=
,rm68200.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/raydium=
,rm68200.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/rocktec=
h,rk070er9427.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/samsung=
,lsn122dl01-c01.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/samsung=
,ltn101nt05.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/samsung=
,ltn140at29-301.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/samsung=
,s6e88a0-ams452ef01.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/sharp,l=
q035q7db03.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/sharp,l=
q070y3dg3b.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/sharp,l=
q101k1ly04.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/sharp,l=
q123p1jx31.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/shelly,=
sca07010-bfn-lnn.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/starry,=
kr122ea0sra.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/tianma,=
tm070jdhg30.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/tianma,=
tm070rvhg71.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/toshiba=
,lt089ac29000.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/tpk,f07=
a-0102.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/tpk,f10=
a-0102.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/urt,ums=
h-8596md.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/vl050_8=
048nt_c01.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/winstar=
,wf35ltiacd.txt
 delete mode 100644 Documentation/devicetree/bindings/display/sitronix,st77=
35r.txt
 create mode 100644 Documentation/devicetree/bindings/display/sitronix,st77=
35r.yaml
 create mode 100644 Documentation/devicetree/bindings/display/ti/ti,am65x-d=
ss.yaml
 create mode 100644 Documentation/devicetree/bindings/display/ti/ti,j721e-d=
ss.yaml
 create mode 100644 Documentation/devicetree/bindings/display/ti/ti,k2g-dss=
=2Eyaml
 create mode 100644 drivers/gpu/drm/bridge/parade-ps8640.c
 create mode 100644 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
 create mode 100644 drivers/gpu/drm/panel/panel-feixin-k101-im2ba02.c
 create mode 100644 drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams452ef01.c
 create mode 100644 drivers/gpu/drm/tidss/Kconfig
 create mode 100644 drivers/gpu/drm/tidss/Makefile
 create mode 100644 drivers/gpu/drm/tidss/tidss_crtc.c
 create mode 100644 drivers/gpu/drm/tidss/tidss_crtc.h
 create mode 100644 drivers/gpu/drm/tidss/tidss_dispc.c
 create mode 100644 drivers/gpu/drm/tidss/tidss_dispc.h
 create mode 100644 drivers/gpu/drm/tidss/tidss_dispc_regs.h
 create mode 100644 drivers/gpu/drm/tidss/tidss_drv.c
 create mode 100644 drivers/gpu/drm/tidss/tidss_drv.h
 create mode 100644 drivers/gpu/drm/tidss/tidss_encoder.c
 create mode 100644 drivers/gpu/drm/tidss/tidss_encoder.h
 create mode 100644 drivers/gpu/drm/tidss/tidss_irq.c
 create mode 100644 drivers/gpu/drm/tidss/tidss_irq.h
 create mode 100644 drivers/gpu/drm/tidss/tidss_kms.c
 create mode 100644 drivers/gpu/drm/tidss/tidss_kms.h
 create mode 100644 drivers/gpu/drm/tidss/tidss_plane.c
 create mode 100644 drivers/gpu/drm/tidss/tidss_plane.h
 create mode 100644 drivers/gpu/drm/tidss/tidss_scale_coefs.c
 create mode 100644 drivers/gpu/drm/tidss/tidss_scale_coefs.h
 create mode 100644 drivers/gpu/drm/tiny/ili9486.c

--xa7hxajkz6sqq7my
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXkEjnQAKCRDj7w1vZxhR
xR5BAP0arqqZuCuAdY8XLNHHb1wptYYnOH+gp2ZGjeCAuE9ClQEA5hofV7/65TfD
HZtBVSxqbAljjy7kjQ3UX0r9GMjkIQ0=
=TM5c
-----END PGP SIGNATURE-----

--xa7hxajkz6sqq7my--

--===============0398252494==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0398252494==--
