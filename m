Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D480255530
	for <lists+dri-devel@lfdr.de>; Fri, 28 Aug 2020 09:29:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5829E6E457;
	Fri, 28 Aug 2020 07:29:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew1-smtp.messagingengine.com (wnew1-smtp.messagingengine.com
 [64.147.123.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AB186EB52;
 Thu, 27 Aug 2020 15:55:25 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id CF4E5D72;
 Thu, 27 Aug 2020 11:55:22 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 27 Aug 2020 11:55:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:mime-version:content-type; s=
 fm3; bh=ehcMRmpr7NM63SZ+NuXAXW5SkjL0S5/le3p3af9LarQ=; b=EiSo0vPZ
 PL/HqTbQNlRNtXQLiPL1jp3ljR+SEdCm6IKsm0a+UyRQWbUX+xZmfCr/NU/K1KqT
 R30Mmk3PNnTllgWiS+y8K9yFPnOMWWh4+zMc5y0ESKTqGgsbe066/JCTZR6kY3Rt
 tKBTkONAz68C71VlZs4J+WOc9RNLVPr+LI+V/abEq37zglzT9z//ymSUTsW1/4h4
 zZslaQPs+6FVfUPQYpjTVsw7e4vTzIunDzvXF4VvWK/n2qah1TDm8LT0eAI51p+f
 R6NxSO9jWWcyAizGuNqlaHCqdztoNfcA3Xj6H8lzjAcDHQQag0OOGsrZjoCVQJkl
 Lx46YhlzfJ/8Ug==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; bh=ehcMRmpr7NM63SZ+NuXAXW5SkjL0S
 5/le3p3af9LarQ=; b=KgmJA5HSEih3urbzNxs9ZaxkRbX/ckZbJDmVO9/1yJ+a7
 2AqH6HN3Ogec7a0Ul6wLMBsoLDj4Asgl9Hkit9xAPUON3KztuVbbXPttG2JSfEYV
 3jBafOa4QQ9/JEQGoaCwusA8hWD7cHWwwiUdzlowSY1oGqexO53jkdFt5/EEv+n1
 FU/a6hlCoisNADJI542qyEPGBvh9fffltZtOw3BlkmZw8zO3l3lBEUepR49UxAdu
 PgRDg69wUs2YQckFP7DRMgmOGnuKObXn7bXRte8wqifRz9Vvfk+Ka2r2m1tzOPBh
 3XTMBjAaA7CHqXIgsJLOI8hg0a2Im/R0u2nOnqPSQ==
X-ME-Sender: <xms:aNdHX1MZhfbDjZ6O_B1sGNShzBcgaB27YIOztOTcJePb7oI7Fhsnkw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedruddvgedgleduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfggtggusehgtderredttddunecuhfhrohhmpeforgigihhmvgcu
 tfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvg
 hrnhephfehtefggeekteffueeileekfeegteetfffggfekleehkeffvedvgedtieetvddu
 necuffhomhgrihhnpehfrhgvvgguvghskhhtohhprdhorhhgnecukfhppeeltddrkeelrd
 eikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
 mhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:aNdHX3925iW0WIg2ebJY0ohh0UzvOYMjjmbX_9QsY3RoxPGAScCuqA>
 <xmx:aNdHX0TmCoixF2BHgDolhkmqXlQuT3UtQFW3SiaxH6rP8T0qCZcshw>
 <xmx:aNdHXxuPGDvqfw9CLijJ0E2Ki107malF1-kvFpcI-B1LbJExucORtw>
 <xmx:atdHX3ueZrAXZ6FfFNYJk0W-rXQ37_XSQLHKBSlrclTznjeZx9ywO7PqGgw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 13F2E3280067;
 Thu, 27 Aug 2020 11:55:19 -0400 (EDT)
Date: Thu, 27 Aug 2020 17:55:17 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-next
Message-ID: <20200827155517.do6emeacetpturli@gilmour.lan>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 28 Aug 2020 07:29:10 +0000
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
Content-Type: multipart/mixed; boundary="===============1595504280=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1595504280==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rudpggdtalyierpi"
Content-Disposition: inline


--rudpggdtalyierpi
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Daniel, Dave,

Here's a re-run of last week's PR (without all the -rc1 churn) plus the
patches that got in this week.

Thanks!
Maxime

drm-misc-next-2020-08-27:
drm-misc-next for 5.10:

UAPI Changes:

Cross-subsystem Changes:

Core Changes:
  - ttm: various cleanups and reworks of the API

Driver Changes:
  - ast: various cleanups
  - gma500: A few fixes, conversion to GPIOd API
  - hisilicon: Change of maintainer, various reworks
  - ingenic: Clock handling and formats support improvements
  - mcde: improvements to the DSI support
  - mgag200: Support G200 desktop cards
  - mxsfb: Support the i.MX7 and i.MX8M and the alpha plane
  - panfrost: support devfreq
  - ps8640: Retrieve the EDID from eDP control, misc improvements
  - tidss: Add a workaround for AM65xx YUV formats handling
  - virtio: a few cleanups, support for virtio-gpu exported resources
  - bridges: Support the chained bridges on more drivers,
    new bridges: Toshiba TC358762, Toshiba TC358775, Lontium LT9611
  - panels: Convert to dev_ based logging, read orientation from the DT,
    various fixes, new panels: Mantix MLAF057WE51-X, Chefree CH101OLHLWH-00=
2,
    Powertip PH800480T013, KingDisplay KD116N21-30NV-A010
The following changes since commit 9123e3a74ec7b934a4a099e98af6a61c2f80bbf5:

  Linux 5.9-rc1 (2020-08-16 13:04:57 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-2020-08-27

for you to fetch changes up to cd6da0b113512b15a4d35f355f9ecd8858297369:

  drm/mgag200: fix spelling mistake "expeced" -> "expected" (2020-08-27 11:=
17:52 +0200)

----------------------------------------------------------------
drm-misc-next for 5.10:

UAPI Changes:

Cross-subsystem Changes:

Core Changes:
  - ttm: various cleanups and reworks of the API

Driver Changes:
  - ast: various cleanups
  - gma500: A few fixes, conversion to GPIOd API
  - hisilicon: Change of maintainer, various reworks
  - ingenic: Clock handling and formats support improvements
  - mcde: improvements to the DSI support
  - mgag200: Support G200 desktop cards
  - mxsfb: Support the i.MX7 and i.MX8M and the alpha plane
  - panfrost: support devfreq
  - ps8640: Retrieve the EDID from eDP control, misc improvements
  - tidss: Add a workaround for AM65xx YUV formats handling
  - virtio: a few cleanups, support for virtio-gpu exported resources
  - bridges: Support the chained bridges on more drivers,
    new bridges: Toshiba TC358762, Toshiba TC358775, Lontium LT9611
  - panels: Convert to dev_ based logging, read orientation from the DT,
    various fixes, new panels: Mantix MLAF057WE51-X, Chefree CH101OLHLWH-00=
2,
    Powertip PH800480T013, KingDisplay KD116N21-30NV-A010

----------------------------------------------------------------
Bernard Zhao (1):
      drm/panel: remove return value of function drm_panel_add

Christian K=F6nig (18):
      drm/radeon: stop using TTM_MEMTYPE_FLAG_MAPPABLE
      drm/amdgpu: stop using TTM_MEMTYPE_FLAG_MAPPABLE
      drm/ttm: remove TTM_MEMTYPE_FLAG_MAPPABLE
      drm/ttm: fix pipelined gutting for evictions v2
      drm/ttm: initialize the system domain with defaults v2
      drm/ttm: remove TTM_MEMTYPE_FLAG_FIXED v2
      drm/radeon: stop implementing init_mem_type
      drm/amdgpu: stop implementing init_mem_type
      drm/vmwgfx: stop implementing init_mem_type v2
      drm/nouveau: stop implementing init_mem_type
      drm/qxl: stop implementing init_mem_type
      drm/vram-helper: stop implementing init_mem_type
      drm/ttm: remove the init_mem_type callback
      drm/amdgpu: make sure userptr ttm is allocated
      drm/ttm: rename ttm_resource_manager_func callbacks
      drm/ttm: give resource functions their own [ch] files
      drm/radeon: drop superflous AGP handling
      drm/ttm: fix broken merge between drm-next and drm-misc-next

Cl=E9ment P=E9ron (10):
      drm/panfrost: avoid static declaration
      drm/panfrost: clean headers in devfreq
      drm/panfrost: don't use pfdevfreq.busy_count to know if hw is idle
      drm/panfrost: introduce panfrost_devfreq struct
      drm/panfrost: use spinlock instead of atomic
      drm/panfrost: properly handle error in probe
      drm/panfrost: rename error labels in device_init
      drm/panfrost: move devfreq_init()/fini() in device
      drm/panfrost: dynamically alloc regulators
      drm/panfrost: add regulators to devfreq

Colin Ian King (4):
      drm/gma500: fix spelling mistake "pannel" -> "panel"
      drm/virtgpu: remove redundant assignments to width and height
      drm/omap: fix spelling mistake "propert" -> "property"
      drm/mgag200: fix spelling mistake "expeced" -> "expected"

Daniel Vetter (1):
      drm/syncobj: Tune down unordered timeline DRM_ERROR

Dave Airlie (64):
      drm/vmwgfx: consolidate ttm object creation and populate
      drm/vmwgfx: drop bo map/unmap dma functions.
      nouveau: use ttm populate mapping functions. (v2)
      qxl/ttm: drop the unusued no wait flag to reserve function
      drm/ttm/amdgpu: consolidate ttm reserve paths
      drm/ttm: use a helper for unlocked moves to the lru tail
      drm/vram-helper: remove populate/unpopulate
      drm/ttm: export memory type debug entrypoint.
      drm/nouveau/ttm: don't fill in blank ttm debug callback
      drm/vmwgfx/gmrid: don't provide pointless ttm debug callback
      drm/qxl/ttm: call ttm manager debug (v2)
      drm/vram-helper: call the ttm manager debug function
      drm/ttm: split the mm manager init code (v2)
      drm/ttm: provide a driver-led init path for range mm manager. (v2)
      drm/amdgpu/ttm: init managers from the driver side.
      drm/radeon: use new ttm man init path
      drm/qxl/ttm: use new init path for manager
      drm/vram_helper: use new ttm manager init function
      drm/nouveau: use new memory manager init paths
      drm/vmwgfx/ttm: convert vram mm init to new code paths
      drm/vmwgfx/ttm: switch gmrid allocator to new init paths.
      drm/ttm: convert system manager init to new code.
      drm/ttm: purge old manager init path.
      drm/ttm: pass man around instead of mem_type in some places
      drm/ttm: make some inline helper functions for cleanup paths. (v2)
      drm/ttm: start allowing drivers to use new takedown path (v2)
      drm/amdgpu/ttm: use new takedown path
      drm/vmwgfx: takedown vram manager
      drm/vram_helper: call explicit mm takedown
      drm/nouveau: use new cleanup paths
      drm/radeon/ttm: use new takedown paths
      drm/qxl/ttm: use new takedown path
      drm/vmwgfx: fix gmrid takedown paths to new interface
      drm/ttm: remove range manager legacy takedown path
      drm/ttm: make TTM responsible for cleaning system only.
      drm/ttm: add wrapper to get manager from bdev.
      drm/amdgfx/ttm: use wrapper to get ttm memory managers
      drm/vram-helper: use wrapper to access memory managers
      drm/nouveau/ttm: use wrapper to access memory managers
      drm/qxl/ttm: use wrapper to access memory manager
      drm/radeon/ttm: use wrapper to access memory manager
      drm/vmwgfx/ttm: use wrapper to access memory manager
      drm/ttm: rename manager variable to make sure wrapper is used.
      drm/ttm: allow drivers to provide their own manager subclasses
      drm/amdgpu/ttm: use bo manager subclassing for vram/gtt mgrs
      drm/ttm: make ttm_range_man_init/takedown take type + args
      drm/ttm: move range manager to subclassed driver allocation
      drm/vmwgfx/ttm: move thp to driver managed
      drm/vmwgfx/gmrid: convert to driver controlled allocation.
      drm/nouveau/ttm: move to driver allocated manager
      drm/ttm: drop priv pointer in memory manager
      drm/amdgpu/ttm: remove man->bdev references.
      drm/ttm: drop man->bdev link.
      drm/ttm: drop list of memory managers from device. (v2)
      drm/ttm: drop type manager has_type
      drm/ttm: add a wrapper for checking if manager is in use
      drm/ttm: rename bo manager to range manager.
      drm/ttm: rename ttm_mem_type_manager -> ttm_resource_manager.
      drm/ttm: rename ttm_mem_reg to ttm_resource.
      drm/amdgpu/ttm: move vram/gtt mgr allocations to mman.
      drm/amdgpu/ttm: drop the adev link from vram mgr
      drm/vmwgfx/ttm: fix the non-THP cleanup path.
      drm/ttm: init mem->bus in common code.
      drm/ttm: drop bus.size from bus placement.

David Stevens (4):
      virtio: add dma-buf support for exported objects
      virtio-gpu: add VIRTIO_GPU_F_RESOURCE_UUID feature
      drm/virtio: Support virtgpu exported resources
      virtio: fix build for configs without dma-bufs

Derek Basehore (2):
      drm/panel: Add helper for reading DT rotation
      drm/panel: Read panel orientation for BOE TV101WUM-NL6

Dmitry Osipenko (2):
      drm/panel: lvds: Read panel orientation
      drm/panel-simple: Read panel orientation

Douglas Anderson (2):
      dt-bindings: display: simple: Add KD116N21-30NV-A010 compatible
      drm: panel: simple: Add KD116N21-30NV-A010

Enric Balletbo i Serra (4):
      drm/bridge_connector: Set default status connected for eDP connectors
      drm/bridge: ps8640: Get the EDID from eDP control
      drm/bridge: ps8640: Return an error for incorrect attach flags
      drm/bridge: ps8640: Print an error if VDO control fails

Gerd Hoffmann (1):
      drm/qxl: don't take vga ports on rev5+

Guido G=FCnther (5):
      dt-bindings: panel: rocktech,jh057n00900: Modernize
      dt-bindings: panel: rocktech,jh057n00900: Add myself as maintainer
      dt-bindings: vendor-prefixes: Add mantix vendor prefix
      dt-bindings: Add Mantix MLAF057WE51-X panel bindings
      drm/panel: Add panel driver for the Mantix MLAF057WE51-X DSI panel

Gurchetan Singh (1):
      drm/virtio: Revert "drm/virtio: Call the right shmem helpers"

Gustavo A. R. Silva (2):
      fbdev: Use fallthrough pseudo-keyword
      drm/virtio: Use struct_size() helper in kmalloc()

Icenowy Zheng (3):
      drm/panel: ilitek-ili9881c: prepare for adding support for extra pane=
ls
      dt-bindings: ili9881c: add compatible string for Feixin K101-IM2BYL02
      drm/panel: ilitek-ili9881c: add support for Feixin K101-IM2BYL02 panel

Joe Perches (1):
      drm: Remove unnecessary drm_panel_attach and drm_panel_detach

Laurent Pinchart (23):
      drm: mxsfb: Remove fbdev leftovers
      drm: mxsfb: Use drm_panel_bridge
      drm: mxsfb: Use BIT() macro to define register bitfields
      drm: mxsfb: Remove unused macros from mxsfb_regs.h
      drm: mxsfb: Clarify format and bus width configuration
      drm: mxsfb: Pass mxsfb_drm_private pointer to mxsfb_reset_block()
      drm: mxsfb: Use LCDC_CTRL register name explicitly
      drm: mxsfb: Remove register definitions from mxsfb_crtc.c
      drm: mxsfb: Remove unneeded includes
      drm: mxsfb: Rename mxsfb_crtc.c to mxsfb_kms.c
      drm: mxsfb: Stop using DRM simple display pipeline helper
      drm: mxsfb: Move vblank event arm to CRTC .atomic_flush()
      drm: mxsfb: Don't touch AXI clock in IRQ context
      drm: mxsfb: Enable vblank handling
      drm: mxsfb: Remove mxsfb_devdata unused fields
      drm: mxsfb: Add i.MX7 and i.MX8M to the list of supported SoCs in Kco=
nfig
      drm: mxsfb: Update internal IP version number for i.MX6SX
      drm: mxsfb: Drop non-OF support
      drm: mxsfb: Turn mxsfb_set_pixel_fmt() into a void function
      drm: mxsfb: Merge mxsfb_set_pixel_fmt() and mxsfb_set_bus_fmt()
      drm: mxsfb: Remove unnecessary spaces after tab
      drm: mxsfb: Support the alpha plane
      drm: panel: Fix bus format for OrtusTech COM43H4M85ULC panel

Linus Walleij (12):
      drm: pl111: Update documentation
      omapfb/dss: Include the right header
      drm/panel-notatek-nt35510: Fix MTP read init
      drm/mcde: Rename flow function
      drm/mcde: Fix display data flow control
      drm/mcde: Improve pixel fetcher FIFO depth setting
      drm/mcde: Support using DSI in LP mode
      drm/mcde: Fix display pipeline restart
      drm/mcde: Enable the DSI link with display
      drm/mcde: Retry DSI read/write transactions
      drm: gma500: Convert to GPIO descriptors
      drm: omapdrm: Delete surplus GPIO includes

Marek Vasut (8):
      dt-bindings: Add vendor prefix for Powertip
      dt-bindings: Add DT bindings for Powertip PH800480T013
      drm/panel: simple: Add Powertip PH800480T013 panel
      dt-bindings: Add vendor prefix for Chefree
      dt-bindings: Add DT bindings for Chefree CH101OLHLWH-002
      drm/panel: simple: Add Chefree CH101OLHLWH-002 panel
      dt-bindings: Add DT bindings for Toshiba TC358762 DSI-to-DPI bridge
      drm/bridge: tc358762: Add basic driver for Toshiba TC358762 DSI-to-DP=
I bridge

Maxime Ripard (1):
      Merge v5.9-rc1 into drm-misc-next

Melissa Wen (2):
      drm/vkms: fix xrgb on compute crc
      drm/vkms: guarantee vblank when capturing crc

Nadezda Lutovinova (1):
      drm/brige/megachips: Add checking if ge_b850v3_lvds_init() is working=
 correctly

Navid Emamdoost (1):
      drm/panfrost: perfcnt: fix ref count leak in panfrost_perfcnt_enable_=
locked

Oleg Vasilev (4):
      drm: report dp downstream port type as a subconnector property
      drm/i915: utilize subconnector property for DP
      drm/amdgpu: utilize subconnector property for DP through atombios
      drm/amdgpu: utilize subconnector property for DP through DisplayManag=
er

Paul Cercueil (12):
      drm/ingenic: Handle errors of drm_atomic_get_plane_state
      drm/ingenic: Validate mode in a .mode_valid callback
      drm/ingenic: ipu: Only restart manually on older SoCs
      drm/ingenic: ipu: Remove YUV422 from supported formats on JZ4725B
      drm/ingenic: ipu: Only enable clock when needed
      drm/panel: novatek,nt39016: Handle backlight the standard way
      drm/panel: novatek,nt39016: Add missing CR to error messages
      drm/panel: simple: Convert sharp,ls020b1dd01d from timings to videomo=
de
      drm/panel: simple: Tweak timings of sharp,ls020b1dd01d for perfect 60=
Hz
      drm/panel: simple: Add 50Hz mode for sharp,ls020b1dd01d
      drm/panel: novatek,nt39016: Reorder calls in probe
      drm/panel: novatek,nt39016: Remove 'dev' field in priv struct

Paul Menzel (3):
      kernel/params.c: Align last argument with a tab
      moduleparams: Add hexint type parameter
      drm/amdgpu: Change type of module param `ppfeaturemask` to hexint

Pekka Paalanen (1):
      drm/doc: device hot-unplug for userspace

Qinglang Miao (3):
      drm/vgem: add missing platform_device_unregister() in vgem_init()
      drm/vkms: add missing platform_device_unregister() in vkms_init()
      drm/v3d: convert to use module_platform_driver

Randy Dunlap (1):
      drm: ast: fix double __iomem sparse warning

Rikard Falkeborn (1):
      drm/sun4i: Constify static structs

Sam Ravnborg (22):
      drm/panel: add connector type to boe,hv070wsa-100 panel
      drm/panel: panel-simple: validate panel description
      drm/panel: panel-simple: add default connector_type
      drm/bridge: tc358764: drop drm_connector_(un)register
      drm/bridge: tc358764: add drm_panel_bridge support
      drm/bridge: parade-ps8622: add drm_panel_bridge support
      drm/bridge: megachips: add helper to create connector
      drm/bridge: megachips: get drm_device from bridge
      drm/bridge: megachips: enable detect bridge operation
      drm/bridge: megachips: add get_edid bridge operation
      drm/bridge: megachips: make connector creation optional
      drm/bridge: tc358767: add detect bridge operation
      drm/bridge: tc358767: add get_edid bridge operation
      drm/bridge: tc358767: add drm_panel_bridge support
      drm/bridge: nxp-ptn3460: add get_edid bridge operation
      drm/bridge: nxp-ptn3460: add drm_panel_bridge support
      drm/mgag200: fix build on alpha arch
      drm/panel: samsung: Use dev_ based logging
      drm/panel: leadtek: Use dev_ based logging
      drm/panel: raydium: Use dev_ based logging
      drm/panel: sitronix: Use dev_ based logging
      drm/panel: Use dev_ based logging

Sidong Yang (1):
      drm/qxl: Replace deprecated function in qxl_display

Thomas Zimmermann (21):
      drm/ast: Embed CRTC and connector in struct ast_private
      drm/ast: Separate DRM driver from PCI code
      drm/ast: Replace driver load/unload functions with device create/dest=
roy
      drm/ast: Replace struct_drm_device.dev_private with to_ast_private()
      drm/ast: Don't use ast->dev if dev is available
      drm/ast: Embed struct drm_device in struct ast_private
      drm/ast: Managed release of ast firmware
      drm/ast: Manage release of firmware backup memory
      drm/ast: Managed device release
      drm/mgag200: Enable caching for SHMEM pages
      drm/mgag200: Move register initialization into helper function
      drm/mgag200: Initialize PCI registers early during device setup
      drm/mgag200: Enable MGA mode during device register initialization
      drm/mgag200: Set MISC memory flags in mm init code
      drm/mgag200: Clear <page> field during MM init
      drm/mgag200: Move G200SE's unique id into model-specific data
      drm/mgag200: Add support for G200 desktop cards
      fbdev: Remove trailing whitespace
      drm/mgag200: Set PCI option register in G200SE models
      Merge drm/drm-next into drm-misc-next
      drm/malidp: Use struct drm_gem_object_funcs.get_sg_table internally

Tian Tao (9):
      drm/hisilicon: Fixed the warning: Assignment of 0/1 to bool variable
      drm/hisilicon: Remove the unused include statements
      drm/hisilicon: Code refactoring for hibmc_drv_de
      drm/hisilicon: Fix build error of no type of module_init
      MAINTAINERS: Change maintainer for hisilicon DRM driver
      drm/hisilicon: Use drm_err instead of DRM_ERROR in hibmc_ttm
      drm/hisilicon: Use drm_err instead of DRM_ERROR in hibmc_drm_vdac
      drm/hisilicon: Use drm_err instead of DRM_ERROR in hibmc_drm_de
      drm/hisilicon: Use drm_err instead of DRM_ERROR in hibmc_drm_drv

Tom Rix (2):
      video: fbdev: pvr2fb: initialize variables
      drm/gma500: fix error check

Tomeu Vizoso (2):
      drm/panfrost: Make sure GPU is powered on when reading GPU_LATEST_FLU=
SH_ID
      drm/panfrost: Add compatible string for bifrost

Tomi Valkeinen (1):
      drm/tidss: implement WA for AM65xx erratum i2000

Ville Syrj=E4l=E4 (1):
      drm/todo: Plumb drm_atomic_state all over

Vinay Simha BN (3):
      dt-binding: Add DSI/LVDS TC358775 bridge bindings
      display/drm/bridge: TC358775 DSI/LVDS driver
      drm/bridge/tc358775: Fix for PTR_ERR

Vinod Koul (3):
      dt-bindings: vendor-prefixes: Add Lontium vendor prefix
      dt-bindings: display: bridge: Add documentation for LT9611
      drm/bridge: Introduce LT9611 DSI to HDMI bridge

 .../bindings/display/bridge/lontium,lt9611.yaml    |  176 +++
 .../bindings/display/bridge/toshiba,tc358762.yaml  |  127 ++
 .../bindings/display/bridge/toshiba,tc358775.yaml  |  215 ++++
 .../bindings/display/panel/ilitek,ili9881c.yaml    |    4 +-
 .../display/panel/mantix,mlaf057we51-x.yaml        |   70 ++
 .../bindings/display/panel/panel-simple.yaml       |    6 +
 .../display/panel/rocktech,jh057n00900.yaml        |   40 +-
 .../devicetree/bindings/vendor-prefixes.yaml       |    8 +
 Documentation/gpu/drm-uapi.rst                     |  114 +-
 Documentation/gpu/pl111.rst                        |    8 +-
 Documentation/gpu/todo.rst                         |   46 +
 MAINTAINERS                                        |   11 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c         |    3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c     |   10 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |    6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |    5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c            |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c        |   92 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c            |   21 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h           |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |   12 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h         |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |  171 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h            |   46 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c       |  112 +-
 drivers/gpu/drm/amd/amdgpu/atombios_dp.c           |   18 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |   41 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |    3 +
 drivers/gpu/drm/arm/malidp_planes.c                |    2 +-
 drivers/gpu/drm/ast/ast_cursor.c                   |   11 +-
 drivers/gpu/drm/ast/ast_dp501.c                    |   23 +-
 drivers/gpu/drm/ast/ast_drv.c                      |   82 +-
 drivers/gpu/drm/ast/ast_drv.h                      |   43 +-
 drivers/gpu/drm/ast/ast_main.c                     |   74 +-
 drivers/gpu/drm/ast/ast_mm.c                       |    2 +-
 drivers/gpu/drm/ast/ast_mode.c                     |   40 +-
 drivers/gpu/drm/ast/ast_post.c                     |    6 +-
 drivers/gpu/drm/bridge/Kconfig                     |   31 +
 drivers/gpu/drm/bridge/Makefile                    |    3 +
 drivers/gpu/drm/bridge/analogix/analogix-anx6345.c |   12 -
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c |    9 -
 drivers/gpu/drm/bridge/lontium-lt9611.c            | 1230 ++++++++++++++++=
++++
 .../drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c   |  109 +-
 drivers/gpu/drm/bridge/nxp-ptn3460.c               |  101 +-
 drivers/gpu/drm/bridge/panel.c                     |    7 -
 drivers/gpu/drm/bridge/parade-ps8622.c             |  100 +-
 drivers/gpu/drm/bridge/parade-ps8640.c             |   29 +-
 drivers/gpu/drm/bridge/tc358762.c                  |  280 +++++
 drivers/gpu/drm/bridge/tc358764.c                  |  109 +-
 drivers/gpu/drm/bridge/tc358767.c                  |  123 +-
 drivers/gpu/drm/bridge/tc358775.c                  |  749 ++++++++++++
 drivers/gpu/drm/bridge/ti-sn65dsi86.c              |    3 -
 drivers/gpu/drm/drm_bridge_connector.c             |    1 +
 drivers/gpu/drm/drm_connector.c                    |   49 +-
 drivers/gpu/drm/drm_dp_helper.c                    |   71 ++
 drivers/gpu/drm/drm_gem_vram_helper.c              |   49 +-
 drivers/gpu/drm/drm_panel.c                        |   85 +-
 drivers/gpu/drm/drm_syncobj.c                      |    2 +-
 drivers/gpu/drm/exynos/exynos_drm_dpi.c            |    8 -
 drivers/gpu/drm/exynos/exynos_drm_dsi.c            |    7 +-
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c          |    9 -
 drivers/gpu/drm/gma500/cdv_intel_dp.c              |    2 +-
 drivers/gpu/drm/gma500/mdfld_device.c              |   20 +
 drivers/gpu/drm/gma500/mdfld_dsi_dpi.c             |    2 +-
 drivers/gpu/drm/gma500/mdfld_dsi_output.c          |   53 +-
 drivers/gpu/drm/gma500/mdfld_dsi_output.h          |    2 +-
 drivers/gpu/drm/gma500/mdfld_output.h              |    2 +-
 drivers/gpu/drm/gma500/psb_intel_drv.h             |    1 -
 drivers/gpu/drm/gma500/psb_intel_sdvo.c            |    2 +-
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c     |   70 +-
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c    |   33 +-
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h    |    3 +-
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c   |    6 +-
 drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c        |    2 +-
 drivers/gpu/drm/i915/display/intel_dp.c            |    8 +
 drivers/gpu/drm/imx/imx-ldb.c                      |   10 -
 drivers/gpu/drm/imx/parallel-display.c             |    6 -
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c          |   41 +-
 drivers/gpu/drm/ingenic/ingenic-ipu.c              |   38 +-
 drivers/gpu/drm/mcde/mcde_display.c                |  220 +++-
 drivers/gpu/drm/mcde/mcde_drm.h                    |   67 +-
 drivers/gpu/drm/mcde/mcde_drv.c                    |   81 +-
 drivers/gpu/drm/mcde/mcde_dsi.c                    |  276 +++--
 drivers/gpu/drm/mgag200/Kconfig                    |   12 +-
 drivers/gpu/drm/mgag200/mgag200_drv.c              |  227 +++-
 drivers/gpu/drm/mgag200/mgag200_drv.h              |   19 +-
 drivers/gpu/drm/mgag200/mgag200_mm.c               |    8 +
 drivers/gpu/drm/mgag200/mgag200_mode.c             |  153 ++-
 drivers/gpu/drm/mgag200/mgag200_reg.h              |    4 +
 .../gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c    |    7 +-
 drivers/gpu/drm/msm/dsi/dsi_manager.c              |    1 -
 drivers/gpu/drm/mxsfb/Kconfig                      |    8 +-
 drivers/gpu/drm/mxsfb/Makefile                     |    2 +-
 drivers/gpu/drm/mxsfb/mxsfb_crtc.c                 |  343 ------
 drivers/gpu/drm/mxsfb/mxsfb_drv.c                  |  254 ++--
 drivers/gpu/drm/mxsfb/mxsfb_drv.h                  |   42 +-
 drivers/gpu/drm/mxsfb/mxsfb_kms.c                  |  571 +++++++++
 drivers/gpu/drm/mxsfb/mxsfb_out.c                  |   99 --
 drivers/gpu/drm/mxsfb/mxsfb_regs.h                 |  103 +-
 drivers/gpu/drm/nouveau/nouveau_bo.c               |  137 +--
 drivers/gpu/drm/nouveau/nouveau_bo.h               |   14 +-
 drivers/gpu/drm/nouveau/nouveau_bo0039.c           |    4 +-
 drivers/gpu/drm/nouveau/nouveau_bo5039.c           |    2 +-
 drivers/gpu/drm/nouveau/nouveau_bo74c1.c           |    2 +-
 drivers/gpu/drm/nouveau/nouveau_bo85b5.c           |    2 +-
 drivers/gpu/drm/nouveau/nouveau_bo9039.c           |    2 +-
 drivers/gpu/drm/nouveau/nouveau_bo90b5.c           |    2 +-
 drivers/gpu/drm/nouveau/nouveau_boa0b5.c           |    2 +-
 drivers/gpu/drm/nouveau/nouveau_drv.h              |    2 +-
 drivers/gpu/drm/nouveau/nouveau_mem.c              |    8 +-
 drivers/gpu/drm/nouveau/nouveau_mem.h              |   10 +-
 drivers/gpu/drm/nouveau/nouveau_sgdma.c            |    4 +-
 drivers/gpu/drm/nouveau/nouveau_ttm.c              |  176 ++-
 drivers/gpu/drm/nouveau/nouveau_ttm.h              |    6 +-
 drivers/gpu/drm/nouveau/nv17_fence.c               |    2 +-
 drivers/gpu/drm/nouveau/nv50_fence.c               |    2 +-
 drivers/gpu/drm/omapdrm/dss/hdmi4.c                |    1 -
 drivers/gpu/drm/omapdrm/dss/hdmi5.c                |    1 -
 drivers/gpu/drm/omapdrm/dss/venc.c                 |    2 +-
 drivers/gpu/drm/omapdrm/omap_drv.c                 |   17 -
 drivers/gpu/drm/panel/Kconfig                      |   11 +
 drivers/gpu/drm/panel/Makefile                     |    1 +
 drivers/gpu/drm/panel/panel-arm-versatile.c        |    4 +-
 .../gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c   |    6 +-
 drivers/gpu/drm/panel/panel-boe-himax8279d.c       |   48 +-
 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c     |   12 +-
 drivers/gpu/drm/panel/panel-elida-kd35t133.c       |   51 +-
 drivers/gpu/drm/panel/panel-feixin-k101-im2ba02.c  |   23 +-
 .../gpu/drm/panel/panel-feiyang-fy07024di26a30d.c  |   25 +-
 drivers/gpu/drm/panel/panel-ilitek-ili9322.c       |    7 +-
 drivers/gpu/drm/panel/panel-ilitek-ili9881c.c      |  277 ++++-
 drivers/gpu/drm/panel/panel-innolux-p079zca.c      |   35 +-
 drivers/gpu/drm/panel/panel-jdi-lt070me05000.c     |    4 +-
 drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c |   37 +-
 drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c |   58 +-
 drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c |   49 +-
 drivers/gpu/drm/panel/panel-lg-lb035q02.c          |    4 +-
 drivers/gpu/drm/panel/panel-lg-lg4573.c            |    4 +-
 drivers/gpu/drm/panel/panel-lvds.c                 |   13 +-
 drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c   |  328 ++++++
 drivers/gpu/drm/panel/panel-nec-nl8048hl11.c       |    4 +-
 drivers/gpu/drm/panel/panel-novatek-nt35510.c      |   60 +-
 drivers/gpu/drm/panel/panel-novatek-nt39016.c      |   46 +-
 drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.c |    4 +-
 drivers/gpu/drm/panel/panel-orisetech-otm8009a.c   |   13 +-
 drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c |    4 +-
 .../gpu/drm/panel/panel-panasonic-vvx10f034n00.c   |    4 +-
 .../gpu/drm/panel/panel-raspberrypi-touchscreen.c  |    6 +-
 drivers/gpu/drm/panel/panel-raydium-rm67191.c      |   37 +-
 drivers/gpu/drm/panel/panel-raydium-rm68200.c      |   18 +-
 drivers/gpu/drm/panel/panel-ronbo-rb070d30.c       |   20 +-
 drivers/gpu/drm/panel/panel-samsung-ld9040.c       |    7 +-
 drivers/gpu/drm/panel/panel-samsung-s6d16d0.c      |   27 +-
 drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c      |    9 +-
 drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c   |    9 +-
 drivers/gpu/drm/panel/panel-samsung-s6e63m0.c      |   26 +-
 .../drm/panel/panel-samsung-s6e88a0-ams452ef01.c   |    6 +-
 drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c      |    7 +-
 drivers/gpu/drm/panel/panel-seiko-43wvf1g.c        |    4 +-
 drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c    |    4 +-
 drivers/gpu/drm/panel/panel-sharp-ls037v7dw01.c    |    4 +-
 drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c    |    4 +-
 drivers/gpu/drm/panel/panel-simple.c               |  201 +++-
 drivers/gpu/drm/panel/panel-sitronix-st7701.c      |   14 +-
 drivers/gpu/drm/panel/panel-sitronix-st7703.c      |   61 +-
 drivers/gpu/drm/panel/panel-sitronix-st7789v.c     |    4 +-
 drivers/gpu/drm/panel/panel-sony-acx424akp.c       |   85 +-
 drivers/gpu/drm/panel/panel-sony-acx565akm.c       |    7 +-
 drivers/gpu/drm/panel/panel-tpo-td028ttec1.c       |    4 +-
 drivers/gpu/drm/panel/panel-tpo-td043mtea1.c       |    6 +-
 drivers/gpu/drm/panel/panel-tpo-tpg110.c           |   42 +-
 drivers/gpu/drm/panel/panel-truly-nt35597.c        |   63 +-
 drivers/gpu/drm/panel/panel-visionox-rm69299.c     |   41 +-
 drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c   |   51 +-
 drivers/gpu/drm/panfrost/panfrost_devfreq.c        |  175 ++-
 drivers/gpu/drm/panfrost/panfrost_devfreq.h        |   30 +-
 drivers/gpu/drm/panfrost/panfrost_device.c         |   61 +-
 drivers/gpu/drm/panfrost/panfrost_device.h         |   14 +-
 drivers/gpu/drm/panfrost/panfrost_drv.c            |   16 +-
 drivers/gpu/drm/panfrost/panfrost_gpu.c            |   14 +-
 drivers/gpu/drm/panfrost/panfrost_job.c            |   10 +-
 drivers/gpu/drm/panfrost/panfrost_perfcnt.c        |   10 +-
 drivers/gpu/drm/pl111/pl111_drv.c                  |   20 +-
 drivers/gpu/drm/qxl/qxl_cmd.c                      |    2 +-
 drivers/gpu/drm/qxl/qxl_display.c                  |   21 +-
 drivers/gpu/drm/qxl/qxl_drv.c                      |    6 +-
 drivers/gpu/drm/qxl/qxl_drv.h                      |    2 +-
 drivers/gpu/drm/qxl/qxl_ioctl.c                    |    2 +-
 drivers/gpu/drm/qxl/qxl_object.c                   |    4 +-
 drivers/gpu/drm/qxl/qxl_object.h                   |    4 +-
 drivers/gpu/drm/qxl/qxl_ttm.c                      |   75 +-
 drivers/gpu/drm/radeon/radeon.h                    |    2 +-
 drivers/gpu/drm/radeon/radeon_gem.c                |    4 +-
 drivers/gpu/drm/radeon/radeon_object.c             |    2 +-
 drivers/gpu/drm/radeon/radeon_object.h             |    2 +-
 drivers/gpu/drm/radeon/radeon_ttm.c                |  123 +-
 drivers/gpu/drm/radeon/radeon_vm.c                 |    2 +-
 drivers/gpu/drm/rcar-du/rcar_lvds.c                |    6 +-
 drivers/gpu/drm/rockchip/rockchip_lvds.c           |    9 -
 drivers/gpu/drm/sti/sti_dvo.c                      |    2 -
 drivers/gpu/drm/sun4i/sun4i_backend.c              |    2 +-
 drivers/gpu/drm/sun4i/sun4i_framebuffer.c          |    2 +-
 drivers/gpu/drm/sun4i/sun4i_frontend.c             |    2 +-
 drivers/gpu/drm/sun4i/sun4i_lvds.c                 |   11 +-
 drivers/gpu/drm/sun4i/sun4i_rgb.c                  |   13 +-
 drivers/gpu/drm/sun4i/sun4i_tcon.c                 |    2 +-
 drivers/gpu/drm/sun4i/sun4i_tv.c                   |    6 +-
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c             |    5 +-
 drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c             |    2 +-
 drivers/gpu/drm/sun4i/sun8i_mixer.c                |    2 +-
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c             |    2 +-
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c             |    2 +-
 drivers/gpu/drm/tegra/dsi.c                        |    4 +-
 drivers/gpu/drm/tegra/output.c                     |   10 -
 drivers/gpu/drm/tidss/tidss_dispc.c                |   32 +-
 drivers/gpu/drm/tidss/tidss_dispc.h                |    4 +
 drivers/gpu/drm/ttm/Makefile                       |    3 +-
 drivers/gpu/drm/ttm/ttm_agp_backend.c              |    2 +-
 drivers/gpu/drm/ttm/ttm_bo.c                       |  345 ++----
 drivers/gpu/drm/ttm/ttm_bo_util.c                  |  104 +-
 drivers/gpu/drm/ttm/ttm_bo_vm.c                    |    8 +-
 drivers/gpu/drm/ttm/ttm_execbuf_util.c             |   12 +-
 .../ttm/{ttm_bo_manager.c =3D> ttm_range_manager.c}  |   89 +-
 drivers/gpu/drm/ttm/ttm_resource.c                 |  151 +++
 drivers/gpu/drm/ttm/ttm_tt.c                       |    6 +-
 drivers/gpu/drm/v3d/v3d_drv.c                      |   13 +-
 drivers/gpu/drm/vgem/vgem_drv.c                    |    2 +-
 drivers/gpu/drm/virtio/Kconfig                     |    1 +
 drivers/gpu/drm/virtio/virtgpu_display.c           |    2 -
 drivers/gpu/drm/virtio/virtgpu_drv.c               |    3 +
 drivers/gpu/drm/virtio/virtgpu_drv.h               |   21 +
 drivers/gpu/drm/virtio/virtgpu_gem.c               |    3 +-
 drivers/gpu/drm/virtio/virtgpu_kms.c               |    4 +
 drivers/gpu/drm/virtio/virtgpu_object.c            |    8 +-
 drivers/gpu/drm/virtio/virtgpu_prime.c             |   96 +-
 drivers/gpu/drm/virtio/virtgpu_vq.c                |   55 +
 drivers/gpu/drm/vkms/vkms_composer.c               |   26 +-
 drivers/gpu/drm/vkms/vkms_drv.c                    |    2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c                 |    4 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c                |   73 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h                |   18 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c      |   75 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_mob.c                |   60 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_resource.c           |    2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_thp.c                |   73 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c         |  121 +-
 drivers/video/fbdev/acornfb.c                      |    2 +-
 drivers/video/fbdev/arcfb.c                        |    2 +-
 drivers/video/fbdev/atmel_lcdfb.c                  |    4 +-
 drivers/video/fbdev/aty/radeon_pm.c                |    6 +-
 drivers/video/fbdev/cirrusfb.c                     |    4 +-
 drivers/video/fbdev/controlfb.c                    |    2 +-
 drivers/video/fbdev/core/fbmem.c                   |   12 +-
 drivers/video/fbdev/fsl-diu-fb.c                   |    4 +-
 drivers/video/fbdev/gxt4500.c                      |    2 +-
 drivers/video/fbdev/i740fb.c                       |    2 +-
 drivers/video/fbdev/offb.c                         |    4 +-
 drivers/video/fbdev/omap/lcdc.c                    |    4 +-
 drivers/video/fbdev/omap/omapfb_main.c             |   20 +-
 drivers/video/fbdev/omap2/omapfb/dss/dispc.c       |    4 +-
 drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c       |    2 +-
 drivers/video/fbdev/omap2/omapfb/dss/hdmi5.c       |    2 +-
 drivers/video/fbdev/omap2/omapfb/omapfb-ioctl.c    |    2 +-
 drivers/video/fbdev/omap2/omapfb/omapfb-main.c     |    2 +-
 drivers/video/fbdev/pm2fb.c                        |    4 +-
 drivers/video/fbdev/pvr2fb.c                       |    2 +
 drivers/video/fbdev/pxafb.c                        |    2 +-
 drivers/video/fbdev/s3c-fb.c                       |    6 +-
 drivers/video/fbdev/sa1100fb.c                     |    2 +-
 drivers/video/fbdev/savage/savagefb_driver.c       |    3 +-
 drivers/video/fbdev/sh_mobile_lcdcfb.c             |    4 +-
 drivers/video/fbdev/sm501fb.c                      |    2 +-
 drivers/video/fbdev/tdfxfb.c                       |    2 +-
 drivers/video/fbdev/xen-fbfront.c                  |    2 +-
 drivers/virtio/Kconfig                             |    7 +
 drivers/virtio/Makefile                            |    1 +
 drivers/virtio/virtio.c                            |    6 +
 drivers/virtio/virtio_dma_buf.c                    |   88 ++
 include/drm/drm_connector.h                        |    3 +
 include/drm/drm_dp_helper.h                        |    8 +
 include/drm/drm_mode_config.h                      |    6 +
 include/drm/drm_panel.h                            |   15 +-
 include/drm/ttm/ttm_bo_api.h                       |  109 +-
 include/drm/ttm/ttm_bo_driver.h                    |  367 ++----
 include/drm/ttm/ttm_resource.h                     |  261 +++++
 include/drm/ttm/ttm_tt.h                           |   10 +-
 include/linux/fb.h                                 |   18 +-
 include/linux/moduleparam.h                        |    7 +-
 include/linux/virtio.h                             |    1 +
 include/linux/virtio_dma_buf.h                     |   37 +
 include/uapi/drm/drm_mode.h                        |   21 +-
 include/uapi/linux/virtio_gpu.h                    |   19 +
 kernel/params.c                                    |   17 +-
 296 files changed, 8745 insertions(+), 4400 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/lontiu=
m,lt9611.yaml
 create mode 100644 Documentation/devicetree/bindings/display/bridge/toshib=
a,tc358762.yaml
 create mode 100644 Documentation/devicetree/bindings/display/bridge/toshib=
a,tc358775.yaml
 create mode 100644 Documentation/devicetree/bindings/display/panel/mantix,=
mlaf057we51-x.yaml
 create mode 100644 drivers/gpu/drm/bridge/lontium-lt9611.c
 create mode 100644 drivers/gpu/drm/bridge/tc358762.c
 create mode 100644 drivers/gpu/drm/bridge/tc358775.c
 delete mode 100644 drivers/gpu/drm/mxsfb/mxsfb_crtc.c
 create mode 100644 drivers/gpu/drm/mxsfb/mxsfb_kms.c
 delete mode 100644 drivers/gpu/drm/mxsfb/mxsfb_out.c
 create mode 100644 drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c
 rename drivers/gpu/drm/ttm/{ttm_bo_manager.c =3D> ttm_range_manager.c} (61=
%)
 create mode 100644 drivers/gpu/drm/ttm/ttm_resource.c
 create mode 100644 drivers/virtio/virtio_dma_buf.c
 create mode 100644 include/drm/ttm/ttm_resource.h
 create mode 100644 include/linux/virtio_dma_buf.h

--rudpggdtalyierpi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX0fXZQAKCRDj7w1vZxhR
xc1JAQCUXOne5+iKP10FNKmsqpIVI7w2nhUTpchGVmXLif417QEA4jTfRbnoHTVu
n+OpCjorGIk8Gho9WvXAeK/YNpXhSQw=
=tjH0
-----END PGP SIGNATURE-----

--rudpggdtalyierpi--

--===============1595504280==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1595504280==--
