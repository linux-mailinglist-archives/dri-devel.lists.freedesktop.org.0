Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B25344F7AA5
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 10:59:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF12210E132;
	Thu,  7 Apr 2022 08:59:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C13D89121;
 Thu,  7 Apr 2022 08:59:46 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id A525E320209D;
 Thu,  7 Apr 2022 04:59:44 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 07 Apr 2022 04:59:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to; s=fm3; bh=U
 PEbxSZNGoPkznv6tY2V0ao1UTJuNhv50QJy+Nov4lk=; b=LcCf+TatfUq2HlgQb
 TOUAK0JummHCIbsjr6RCnOoDQ2Y0mGTbDRz7atJWggOK3FG14fsFqcrsHm7qla+z
 4abaNqcXlvm8WdE0AUItHtE2W3FqUAoMaF0BXBYe925wwYxOI1w6/eEJUbFwnacg
 5fVaplyBRe0iTv/B52r8BJXKr5lHudpm7TfWB+i3R6xhtEW5M9p/vK3H6AiNvEDh
 T8eX2bwJiuYrlr4oc0bjLH8J/gZDW8a44pYnYSSYAKwrAvm7NHJ3yHu5ebZLivax
 lxAAqY+VnaWt35ORURgSr4oQtg1xTgzKs8vzWJ54tOmqIYZF5kIdeoQWndOPcxY2
 uRlFQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=UPEbxSZNGoPkznv6tY2V0ao1UTJuNhv50QJy+Nov4
 lk=; b=mskAKWm/TsqUfOsf19I+i0EIl4caPn/hpqxfPX8P1bxUd1Z0OFeJ/kQ+s
 8sHCoeB2LJl2H1qUuNs+b5eSIZuLhUs+FzpWdSOiEZsSNTH0Qq+1Y6KAgMXBTIBU
 QIS8xFHbnqIuC7CDl6oK/T0WLg6NWoIYBPXDtrWGG5Z7uOH/O2QeiDj6bbjg8qdO
 2X/KtG1krY41/j7DtB8m2ngx5kGgyHlPagvwuzTEkBwX4uKOYkYakc2ltHcYFmr3
 QWTqMHeUNOyw/XieGXo0NoUgjIFD4B4E9+YUMdDRFN+1Lt1H4WygV6RBEpTDeel0
 dT9KCPdJSrQs97pN/1DsDP4D/b9QA==
X-ME-Sender: <xms:_6dOYrr-R16-yRWRiuAfzntpfz5TMV8jIdNCxn1pQzcX7NFp9ECqkw>
 <xme:_6dOYlqt8Dqi4hywwwFNS70wekdZ8JS4EDxhIdT0S-6lIhkch_hy-wQI0Cba49TWv
 7W9G-6oBxI5b5S9Hh4>
X-ME-Received: <xmr:_6dOYoMDkSb3BmMtie2fzXBXghzIERr5jPMs1z0cq_LHs1fX5gva6eCp2469eLUejBldeuXJenUCOSM7YD_aUVktKpljZT_2Kr7YknE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudejkedguddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfggtggusehgtderredttddunecuhfhrohhmpeforgigihhmvgcu
 tfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvg
 hrnhephfehtefggeekteffueeileekfeegteetfffggfekleehkeffvedvgedtieetvddu
 necuffhomhgrihhnpehfrhgvvgguvghskhhtohhprdhorhhgnecuvehluhhsthgvrhfuih
 iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordht
 vggthh
X-ME-Proxy: <xmx:_6dOYu6cjdBHymoy3VUxIoz-R_IIHheFMDZRIlmb78SGLz8IBXdVBA>
 <xmx:_6dOYq5p9VItQJgn643wyBLIcOjRcl3ULtsbIvcWXvYa8Y1tEY-_5A>
 <xmx:_6dOYmjvvqDxjyE0S5HXvA3-vRW4bA0dxiGlkZX7hvFqHYCuZYZYlQ>
 <xmx:AKhOYnzDYa7DdY0bvloNStW49BoihOL7X24scNyDlqv39zpEVdp9Vg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 7 Apr 2022 04:59:42 -0400 (EDT)
Date: Thu, 7 Apr 2022 10:59:40 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-next
Message-ID: <20220407085940.pnflvjojs4qw4b77@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ttoaypuzkkqwegvo"
Content-Disposition: inline
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--ttoaypuzkkqwegvo
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave, Daniel,

Here's the first drm-misc-next for 5.19

Maxime

drm-misc-next-2022-04-07:
drm-misc-next for 5.19:

UAPI Changes:

Cross-subsystem Changes:

Core Changes:
  - atomic: Add atomic_print_state to private objects
  - edid: Constify the EDID parsing API, rework of the API
  - dma-buf: Add dma_resv_replace_fences, dma_resv_get_singleton, make
    dma_resv_excl_fence private
  - format: Support monochrome formats
  - fbdev: fixes for cfb_imageblit and sys_imageblit, pagelist
    corruption fix
  - selftests: several small fixes
  - ttm: Rework bulk move handling

Driver Changes:
  - Switch all relevant drivers to drm_mode_copy or drm_mode_duplicate
  - bridge: conversions to devm_drm_of_get_bridge and panel_bridge,
    autosuspend for analogix_dp, audio support for it66121, DSI to DPI
    support for tc358767, PLL fixes and I2C support for icn6211
  - bridge_connector: Enable HPD if supported
  - etnaviv: fencing improvements
  - gma500: GEM and GTT improvements, connector handling fixes
  - komeda: switch to plane reset helper
  - mediatek: MIPI DSI improvements
  - omapdrm: GEM improvements
  - panel: DT bindings fixes for st7735r, few fixes for ssd130x, new
    panels: ltk035c5444t, B133UAN01, NV3052C
  - qxl: Allow to run on arm64
  - sysfb: Kconfig rework, support for VESA graphic mode selection
  - vc4: Add a tracepoint for CL submissions, HDMI YUV output,
    HDMI and clock improvements
  - virtio: Remove restriction of non-zero blob_flags,
  - vmwgfx: support for CursorMob and CursorBypass 4, various
    improvements and small fixes
The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

  Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-2022-04-07

for you to fetch changes up to c8d4c18bfbc4ab467188dbe45cc8155759f49d9e:

  dma-buf/drivers: make reserving a shared slot mandatory v4 (2022-04-06 17=
:38:25 +0200)

----------------------------------------------------------------
drm-misc-next for 5.19:

UAPI Changes:

Cross-subsystem Changes:

Core Changes:
  - atomic: Add atomic_print_state to private objects
  - edid: Constify the EDID parsing API, rework of the API
  - dma-buf: Add dma_resv_replace_fences, dma_resv_get_singleton, make
    dma_resv_excl_fence private
  - format: Support monochrome formats
  - fbdev: fixes for cfb_imageblit and sys_imageblit, pagelist
    corruption fix
  - selftests: several small fixes
  - ttm: Rework bulk move handling

Driver Changes:
  - Switch all relevant drivers to drm_mode_copy or drm_mode_duplicate
  - bridge: conversions to devm_drm_of_get_bridge and panel_bridge,
    autosuspend for analogix_dp, audio support for it66121, DSI to DPI
    support for tc358767, PLL fixes and I2C support for icn6211
  - bridge_connector: Enable HPD if supported
  - etnaviv: fencing improvements
  - gma500: GEM and GTT improvements, connector handling fixes
  - komeda: switch to plane reset helper
  - mediatek: MIPI DSI improvements
  - omapdrm: GEM improvements
  - panel: DT bindings fixes for st7735r, few fixes for ssd130x, new
    panels: ltk035c5444t, B133UAN01, NV3052C
  - qxl: Allow to run on arm64
  - sysfb: Kconfig rework, support for VESA graphic mode selection
  - vc4: Add a tracepoint for CL submissions, HDMI YUV output,
    HDMI and clock improvements
  - virtio: Remove restriction of non-zero blob_flags,
  - vmwgfx: support for CursorMob and CursorBypass 4, various
    improvements and small fixes

----------------------------------------------------------------
Andrey Grodzovsky (1):
      drm/sched: Fix htmldoc warning.

Arunpravin (1):
      drm/selftests: fix a shift-out-of-bounds bug

Brian Norris (2):
      drm/bridge: analogix_dp: Grab runtime PM reference for DP-AUX
      drm/bridge: analogix_dp: Enable autosuspend

Chen-Yu Tsai (2):
      drm: ssd130x: Fix COM scan direction register mask
      drm: ssd130x: Always apply segment remap setting

Christian K=F6nig (21):
      drm/etnaviv: stop using dma_resv_excl_fence v2
      RDMA: use dma_resv_wait() instead of extracting the fence
      dma-buf: add dma_resv_replace_fences v2
      dma-buf: finally make the dma_resv_list private v2
      drm/ttm: move the LRU into resource handling v4
      drm/ttm: add resource iterator v4
      drm/ttm: allow bulk moves for all domains
      drm/ttm: de-inline ttm_bo_pin/unpin
      drm/ttm: rework bulk move handling v5
      drm/amdgpu: drop amdgpu_gtt_node
      dma-buf: drop the DAG approach for the dma_resv object v3
      dma-buf: add dma_resv_get_singleton v2
      drm/vmwgfx: stop using dma_resv_excl_fence v2
      drm/radeon: stop using dma_resv_excl_fence
      drm/amdgpu: use dma_resv_for_each_fence for CS workaround v2
      drm/atomic-helper: support more than one write fence in drm_gem_plane=
_helper_prepare_fb
      drm/amdgpu: use dma_resv_get_singleton in amdgpu_pasid_free_cb
      drm/nouveau: stop using dma_resv_excl_fence
      dma-buf: finally make dma_resv_excl_fence private v2
      drm/nouveau: support more than one write fence in fenv50_wndw_prepare=
_fb
      dma-buf/drivers: make reserving a shared slot mandatory v4

Christophe Branchereau (4):
      dt-bindings: display/panel: Add Leadtek ltk035c5444t
      drm/ingenic: Add ingenic_drm_bridge_atomic_enable and disable
      drm/panel: Add panel driver for NewVision NV3052C based LCDs
      drm/panel: innolux-ej030na and abt-y030xx067a: add .enable and .disab=
le

Chuansheng Liu (1):
      fbdev: defio: fix the pagelist corruption

Colin Ian King (1):
      drm/nouveau: Fix spelling mistake "endianess" -> "endianness"

Cong Liu (1):
      drm/qxl: fix qxl can't use in arm64

Dan Carpenter (1):
      drm/selftests: missing error code in igt_buddy_alloc_smoke()

Daniel Vetter (3):
      drm/etnaviv: Use scheduler dependency handling
      drm/gem: Delete gem array fencing helpers
      drm/sched: Check locking in drm_sched_job_add_implicit_dependencies

Dmitry Baryshkov (1):
      drm/blend: fix typo in the comment

Douglas Anderson (3):
      drm/bridge: Add MAINTAINERS entry for DRM drivers for bridge chip bin=
dings
      drm/bridge: Add myself as a reviewer for the TI SN65DSI86 bridge chip
      drm/bridge: Add myself as a reviewer for the Parade PS8640 bridge chip

Geert Uytterhoeven (5):
      drm: Drop commas after SoC match table sentinels
      drm/format-helper: Rename drm_fb_xrgb8888_to_mono_reversed()
      drm/format-helper: Fix XRGB888 to monochrome conversion
      drm/ssd130x: Fix rectangle updates
      drm/ssd130x: Reduce temporary buffer sizes

Guo Zhengkui (1):
      drm/nouveau/instmem: fix uninitialized_var.cocci warning

Ivaylo Dimitrov (3):
      drm: omapdrm: simplify omap_gem_pin
      drm: omapdrm: Support exporting of non-contiguous GEM BOs
      drm: omapdrm: Do no allocate non-scanout GEMs through DMM/TILER

Jagan Teki (12):
      drm: bridge: tc358764: Use drm panel_bridge API
      drm: bridge: panel: Reset the connector state pointer
      exynos: drm: dsi: Attach in_bridge in MIC driver
      drm: exynos: dsi: Use drm panel_bridge API
      drm: exynos: dsi: Convert to bridge driver
      drm: exynos: dsi: Switch to atomic funcs
      Revert "drm/bridge: dw-mipi-dsi: Find the possible DSI devices"
      drm: bridge: nwl-dsi: Switch to devm_drm_of_get_bridge
      drm: bridge: mtk_dsi: Switch to devm_drm_of_get_bridge
      drm: bridge: dw-mipi-dsi: Switch to devm_drm_of_get_bridge
      drm: bridge: mcde_dsi: Switch to devm_drm_of_get_bridge
      drm: bridge: mcde_dsi: Drop explicit bridge remove

Jani Nikula (25):
      drm/edid: don't modify EDID while parsing
      drm/edid: fix reduced blanking support check
      drm/edid: pass a timing pointer to is_display_descriptor()
      drm/edid: pass a timing pointer to is_detailed_timing_descriptor()
      drm/edid: use struct detailed_timing member access in is_rb()
      drm/edid: use struct detailed_timing member access in gtf2 functions
      drm/edid: constify struct detailed_timing in lower level parsing
      drm/edid: constify struct detailed_timing in parsing callbacks
      drm/edid: constify struct edid passed to detailed blocks
      drm/edid: constify struct edid passed around in callbacks and closure
      drm/edid: add more general struct edid constness in the interfaces
      drm/edid: split drm_add_edid_modes() to two
      drm/edid: fix invalid EDID extension block filtering
      drm/edid: use struct edid * in drm_do_get_edid()
      drm/edid: clean up EDID block checksum functions
      drm/edid: add edid_block_tag() helper to get the EDID extension tag
      drm/edid: make drm_edid_header_is_valid() accept void pointer
      drm/edid: clean up edid_is_zero()
      drm/edid: split out edid_header_fix()
      drm/edid: split drm_edid_block_valid() to check and act parts
      drm/edid: use a better variable name for EDID block read retries
      drm/edid: simplify block check when filtering invalid blocks
      drm/edid: split out invalid block filtering to a separate function
      drm/edid: track invalid blocks in drm_do_get_edid()
      drm/edid: reduce magic when updating the EDID block checksum

Jeffrey Hugo (1):
      drm/doc: Clarify what ioctls can be used on render nodes

Jos=E9 Exp=F3sito (8):
      drm/bridge: nxp-ptn3460: switch to devm_drm_of_get_bridge
      drm/bridge: parade-ps8622: switch to devm_drm_of_get_bridge
      drm/bridge: parade-ps8640: switch to devm_drm_of_get_bridge
      drm/bridge: tc358762: switch to devm_drm_of_get_bridge
      drm/bridge: tc358775: switch to devm_drm_of_get_bridge
      drm/bridge: ti-sn65dsi83: switch to devm_drm_of_get_bridge
      drm/bridge: ti-sn65dsi86: switch to devm_drm_of_get_bridge
      drm/bridge: anx7625: switch to devm_drm_of_get_bridge

Liu Ying (1):
      drm/bridge: nwl-dsi: Drop the drm_of_panel_bridge_remove() function c=
all

Liu Zixian (1):
      drm/virtio: fix NULL pointer dereference in virtio_gpu_conn_get_modes

Lucas Stach (1):
      drm/bridge: adv7511: clean up CEC adapter when probe fails

Marek Vasut (28):
      dt-bindings: display: bridge: tc358867: Document DPI output support
      dt-bindings: display: bridge: tc358867: Document DSI data-lanes prope=
rty
      drm/bridge: tc358767: Change tc_ prefix to tc_edp_ for (e)DP specific=
 functions
      drm/bridge: tc358767: Convert to atomic ops
      drm/bridge: tc358767: Implement atomic_check callback
      drm/bridge: tc358767: Move (e)DP bridge endpoint parsing into dedicat=
ed function
      drm/bridge: tc358767: Wrap (e)DP aux I2C registration into tc_aux_lin=
k_setup()
      drm/bridge: tc358767: Move bridge ops setup into tc_probe_edp_bridge_=
endpoint()
      drm/bridge: tc358767: Detect bridge mode from connected endpoints in =
DT
      drm/bridge: tc358767: Split tc_set_video_mode() into common and (e)DP=
 part
      drm/bridge: tc358767: Add DSI-to-DPI mode support
      drm: bridge: icn6211: Fix register layout
      drm: bridge: icn6211: Fix HFP_HSW_HBP_HI and HFP_MIN handling
      drm: bridge: icn6211: Add HS/VS/DE polarity handling
      drm: bridge: icn6211: Add generic DSI-to-DPI PLL configuration
      drm: bridge: icn6211: Use DSI burst mode without EoT and with LP comm=
and mode
      drm: bridge: icn6211: Disable DPI color swap
      drm: bridge: icn6211: Set SYS_CTRL_1 to value used in examples
      drm: bridge: icn6211: Implement atomic_get_input_bus_fmts
      drm: bridge: icn6211: Add I2C configuration support
      drm: bridge: icn6211: Rework ICN6211_DSI to chipone_writeb()
      drm: bridge: icn6211: Read and validate chip IDs before configuration
      drm/bridge: ti-sn65dsi83: Check link status register after enabling t=
he bridge
      drm/bridge: lt9611: Switch to atomic operations
      drm/bridge: lt9611: Add atomic_get_input_bus_fmts
      drm: bridge: icn6211: Fix DSI-to-DPI PLL configuration
      drm: bridge: icn6211: Mark module exit callback with __exit
      drm: bridge: icn6211: Drop I2C module owner assignment

Martin Krastev (1):
      drm/vmwgfx: Add support for CursorMob and CursorBypass 4

Matthew Auld (1):
      drm/doc: pull in drm_buddy.c

Matthias Kaehlcke (2):
      drm/panel-edp: Add AUO B133UAN01
      drm/panel-edp: Fix AUO B133UAN01 panel id

Maxime Ripard (24):
      drm/komeda: plane: switch to plane reset helper
      drm/komeda: plane: Remove redundant zpos initialisation
      drm/komeda: plane: Remove redundant color encoding and range initiali=
sation
      drm/vc4: hdmi: Rename pixel_rate variable
      drm/vc4: hdmi: Move clock validation to its own function
      drm/vc4: hdmi: Move clock calculation into its own function
      drm/vc4: hdmi: Take the sink maximum TMDS clock into account
      drm/vc4: hdmi: Take bpp into account for the scrambler
      drm/vc4: hdmi: Always try to have the highest bpc
      drm/vc4: hdmi: Support HDMI YUV output
      drm/atomic: Print the state every non-blocking commit
      drm/atomic: Add atomic_print_state to private objects
      drm/vc4: Constify private state accessors
      drm/vc4: Implement atomic_print_state for HVS channel state
      Merge drm/drm-next into drm-misc-next
      drm/vc4: Add logging and comments
      drm/vc4: hdmi: Remove clock rate initialization
      drm/vc4: kms: Take old state core clock rate into account
      drm/vc4: hvs: Fix frame count register readout
      drm/vc4: hvs: Store channel in variable
      drm/vc4: hvs: Remove dlist setup duplication
      drm/vc4: hvs: Move the dlist setup to its own function
      drm/vc4: kms: Ignore atomic_flush if we're disabled
      drm/vc4: hvs: Use pointer to HVS in HVS_READ and HVS_WRITE macros

Melissa Wen (1):
      drm/vc4: add tracepoints for CL submissions

Michal Suchanek (3):
      sysfb: Make config option dependencies explicit
      sysfb: Enable boot time VESA graphic mode selection
      efifb: Remove redundant efifb_setup_from_dmi stub

Nicolas Belin (3):
      dt-bindings: display: bridge: it66121: Add audio support
      drm: bridge: it66121: Fix the register page length
      drm: bridge: it66121: Add audio support

Nikita Yushchenko (1):
      drm/bridge_connector: enable HPD by default if supported

Noralf Tr=F8nnes (3):
      dt-bindings: display: sitronix, st7735r: Fix backlight in example
      dt-bindings: display: sitronix, st7735r: Make reset-gpios optional
      dt-bindings: display: sitronix, st7735r: Remove spi-max-frequency lim=
it

Patrik Jakobsson (11):
      drm/gma500: Remove unused declarations and other cruft
      drm/gma500: Move gma_intel_crtc_funcs into gma_display.c
      drm/gma500: Don't store crtc_funcs in psb_ops
      drm/gma500: Cosmetic cleanup of irq code
      drm/gma500: Use managed drmm_mode_config_init()
      drm/gma500: Uninstall interrupts on driver removal
      drm/gma500: Make use of the drm connector iterator
      drm/gma500: gma500 don't register non-hotpluggable connectors
      drm/gma500: Free the correct connector allocation
      drm/gma500: Declare a few functions static
      drm/gma500: Add crtc prefix to vblank functions

Ramalingam C (1):
      drm/ttm: Add a parameter to add extra pages into ttm_tt

Randy Dunlap (2):
      drm: fix a kernel-doc typo
      drm/format_helper: fix a kernel-doc typo

Rex-BC Chen (3):
      drm/dsi: transfer DSI HS packets ending at the same time
      drm/mediatek: implement the DSI HS packets aligned
      drm/bridge: anx7625: config hs packets end aligned to avoid screen sh=
ift

Rob Clark (1):
      drm/virtio: Remove restriction of non-zero blob_flags

Sankeerth Billakanti (1):
      drm/panel-edp: add LQ140M1JW46 edp panel entry

Sui Jingfeng (2):
      drivers/dma-buf: dma-buf.c: fix a typo
      drm/drm_modeset_helper_vtables.h: fix a typo

Thomas Zimmermann (14):
      drm/gma500: Remove struct psb_gem_object.npage
      drm/gma500: Acquire reservation lock for GEM objects
      drm/gma500: Move GTT locking into GTT helpers
      drm/gma500: Remove struct psb_gtt.sem sempahore
      drm/gma500: Move GTT setup and restoration into helper funtions
      drm/gma500: Move GTT resume logic out of psb_gtt_init()
      drm/gma500: Cleanup GTT uninit and error handling
      drm/gma500: Split GTT init/resume/fini into GTT and GEM functions
      drm/gma500: Inline psb_gtt_restore()
      drm/gma500: Move GEM memory management functions to gem.c
      drm/gma500: Move GTT enable and disable code into helpers
      drm/gma500: Move GTT memory-range setup into helper
      fbdev: Fix sys_imageblit() for arbitrary image widths
      fbdev: Fix cfb_imageblit() for arbitrary image widths

Tom Rix (1):
      drm/bridge: anx7625: check the return on anx7625_aux_trans

Ville Syrj=E4l=E4 (6):
      drm: Add drm_mode_init()
      drm/bridge: Use drm_mode_copy()
      drm/imx: Use drm_mode_duplicate()
      drm/panel: Use drm_mode_duplicate()
      drm/gma500: Use drm_mode_copy()
      drm/tilcdc: Use drm_mode_copy()

Wan Jiabing (1):
      drm/omap: fix NULL but dereferenced coccicheck error

Xiaomeng Tong (5):
      drm/nouveau/kms/nv50-: atom: fix an incorrect NULL check on list iter=
ator
      gma500: fix an incorrect NULL check on list iterator
      tilcdc: tilcdc_external: fix an incorrect NULL check on list iterator
      drm/nouveau/clk: Fix an incorrect NULL check on list iterator
      drm/gma500: fix a missing break in psb_intel_crtc_mode_set

Xin Ji (1):
      drm/bridge: anx7625: Set downstream sink into normal status

Yang Yingliang (1):
      drm/bridge: anx7625: add missing destroy_workqueue() in anx7625_i2c_p=
robe()

YueHaibing (2):
      drm/solomon: Make DRM_SSD130X depends on MMU
      drm/bridge: it6505: Fix build error

Zack Rusin (11):
      drm/vmwgfx: Cleanup multimon initialization code
      drm/vmwgfx: Print capabilities early during the initialization
      drm/vmwgfx: Fix fencing on SVGAv3
      drm/vmwgfx: Allow querying of the SVGA PCI id from the userspace
      drm/vmwgfx: Initialize drm_mode_fb_cmd2
      drm/vmwgfx: Implement MSI/MSI-X support for IRQs
      drm/vmwgfx: Stop using surface dma commands on most configurations
      drm/vmwgfx: Fix an invalid read
      drm/vmwgfx: Fix mob cursor allocation race
      drm/vmwgfx: validate the screen formats
      drm/vmwgfx: Disable command buffers on svga3 without gbobjects

 .../bindings/display/bridge/ite,it66121.yaml       |   3 +
 .../bindings/display/bridge/toshiba,tc358767.yaml  |  22 +-
 .../display/panel/leadtek,ltk035c5444t.yaml        |  59 ++
 .../bindings/display/sitronix,st7735r.yaml         |   6 +-
 Documentation/gpu/drm-mm.rst                       |   9 +
 Documentation/gpu/drm-uapi.rst                     |   4 +-
 MAINTAINERS                                        |  11 +
 arch/x86/Kconfig                                   |   6 +
 arch/x86/boot/video-vesa.c                         |   4 +-
 drivers/dma-buf/dma-buf.c                          |   2 +-
 drivers/dma-buf/dma-resv.c                         | 142 ++++-
 drivers/dma-buf/st-dma-resv.c                      |  64 +--
 drivers/firmware/Kconfig                           |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |  53 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |  15 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c        |  49 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c            |  23 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |   8 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |   1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |  78 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h             |   3 -
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |   2 +-
 drivers/gpu/drm/arm/display/komeda/komeda_plane.c  |  13 +-
 drivers/gpu/drm/bridge/Kconfig                     |   2 +
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c       |   1 +
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c |  20 +-
 drivers/gpu/drm/bridge/analogix/anx7625.c          |  36 +-
 drivers/gpu/drm/bridge/chipone-icn6211.c           | 499 ++++++++++++++--
 drivers/gpu/drm/bridge/ite-it66121.c               | 629 +++++++++++++++++=
+++-
 drivers/gpu/drm/bridge/lontium-lt9611.c            |  49 +-
 drivers/gpu/drm/bridge/nwl-dsi.c                   |  30 +-
 drivers/gpu/drm/bridge/nxp-ptn3460.c               |   7 +-
 drivers/gpu/drm/bridge/panel.c                     |   3 +
 drivers/gpu/drm/bridge/parade-ps8622.c             |   7 +-
 drivers/gpu/drm/bridge/parade-ps8640.c             |   9 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c          |   2 +-
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c      |  51 +-
 drivers/gpu/drm/bridge/tc358762.c                  |   9 +-
 drivers/gpu/drm/bridge/tc358764.c                  | 104 +---
 drivers/gpu/drm/bridge/tc358767.c                  | 605 +++++++++++++++++=
---
 drivers/gpu/drm/bridge/tc358775.c                  |  11 +-
 drivers/gpu/drm/bridge/ti-sn65dsi83.c              |  17 +-
 drivers/gpu/drm/bridge/ti-sn65dsi86.c              |   8 +-
 drivers/gpu/drm/drm_atomic.c                       |  20 +
 drivers/gpu/drm/drm_atomic_uapi.c                  |   4 -
 drivers/gpu/drm/drm_blend.c                        |   2 +-
 drivers/gpu/drm/drm_bridge_connector.c             |   4 +-
 drivers/gpu/drm/drm_edid.c                         | 620 +++++++++++------=
---
 drivers/gpu/drm/drm_format_helper.c                |  76 +--
 drivers/gpu/drm/drm_gem.c                          |  80 ---
 drivers/gpu/drm/drm_gem_atomic_helper.c            |  18 +-
 drivers/gpu/drm/drm_gem_vram_helper.c              |   2 +-
 drivers/gpu/drm/drm_modes.c                        |  17 +
 drivers/gpu/drm/etnaviv/etnaviv_gem.h              |   5 +-
 drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c       |  67 ++-
 drivers/gpu/drm/etnaviv/etnaviv_sched.c            |  63 +--
 drivers/gpu/drm/etnaviv/etnaviv_sched.h            |   3 +-
 drivers/gpu/drm/exynos/exynos_drm_dsi.c            | 241 ++------
 drivers/gpu/drm/exynos/exynos_drm_mic.c            |  22 +
 drivers/gpu/drm/gma500/cdv_device.c                |  11 +-
 drivers/gpu/drm/gma500/cdv_intel_crt.c             |   6 +-
 drivers/gpu/drm/gma500/cdv_intel_display.c         |   9 +-
 drivers/gpu/drm/gma500/cdv_intel_dp.c              |   6 +-
 drivers/gpu/drm/gma500/cdv_intel_hdmi.c            |   5 +-
 drivers/gpu/drm/gma500/cdv_intel_lvds.c            |   5 +-
 drivers/gpu/drm/gma500/framebuffer.c               |  10 +-
 drivers/gpu/drm/gma500/gem.c                       | 161 +++++-
 drivers/gpu/drm/gma500/gem.h                       |  13 +-
 drivers/gpu/drm/gma500/gma_display.c               |  53 +-
 drivers/gpu/drm/gma500/gma_display.h               |  10 +-
 drivers/gpu/drm/gma500/gtt.c                       | 321 +++++------
 drivers/gpu/drm/gma500/gtt.h                       |   8 +-
 drivers/gpu/drm/gma500/oaktrail_crtc.c             |  25 +-
 drivers/gpu/drm/gma500/oaktrail_device.c           |   1 -
 drivers/gpu/drm/gma500/oaktrail_hdmi.c             |   1 -
 drivers/gpu/drm/gma500/oaktrail_lvds.c             |  16 +-
 drivers/gpu/drm/gma500/opregion.c                  |   5 +-
 drivers/gpu/drm/gma500/power.c                     |  15 +-
 drivers/gpu/drm/gma500/psb_device.c                |  29 +-
 drivers/gpu/drm/gma500/psb_drv.c                   |  29 +-
 drivers/gpu/drm/gma500/psb_drv.h                   |  90 +--
 drivers/gpu/drm/gma500/psb_intel_display.c         |  39 +-
 drivers/gpu/drm/gma500/psb_intel_lvds.c            |   5 +-
 drivers/gpu/drm/gma500/psb_intel_sdvo.c            |   6 +-
 drivers/gpu/drm/gma500/psb_irq.c                   |  94 ++-
 drivers/gpu/drm/gma500/psb_irq.h                   |  19 +-
 drivers/gpu/drm/i915/gem/i915_gem_clflush.c        |   3 +-
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c     |  10 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c            |   4 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c       |   6 +-
 .../gpu/drm/i915/gem/selftests/i915_gem_migrate.c  |   5 +-
 drivers/gpu/drm/i915/i915_vma.c                    |  10 +-
 .../gpu/drm/i915/selftests/intel_memory_region.c   |   7 +
 drivers/gpu/drm/imx/imx-ldb.c                      |   3 +-
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c          |  34 +-
 drivers/gpu/drm/lima/lima_gem.c                    |  10 +-
 drivers/gpu/drm/mcde/mcde_dsi.c                    |  43 +-
 drivers/gpu/drm/mediatek/mtk_dsi.c                 |  12 +
 drivers/gpu/drm/meson/meson_drv.c                  |   2 +-
 drivers/gpu/drm/msm/msm_gem_submit.c               |  18 +-
 drivers/gpu/drm/nouveau/dispnv50/atom.h            |   6 +-
 drivers/gpu/drm/nouveau/dispnv50/crc.c             |  27 +-
 drivers/gpu/drm/nouveau/dispnv50/wndw.c            |  14 +-
 drivers/gpu/drm/nouveau/nouveau_bo.c               |   9 +-
 drivers/gpu/drm/nouveau/nouveau_fence.c            |   8 +-
 drivers/gpu/drm/nouveau/nvkm/engine/device/base.c  |   2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c     |   6 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c |   2 +-
 drivers/gpu/drm/omapdrm/omap_gem.c                 | 198 ++++---
 drivers/gpu/drm/omapdrm/omap_gem.h                 |   3 +-
 drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c          |   5 +-
 drivers/gpu/drm/omapdrm/omap_overlay.c             |   2 +-
 drivers/gpu/drm/panel/Kconfig                      |   9 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-abt-y030xx067a.c       |  30 +-
 drivers/gpu/drm/panel/panel-edp.c                  |   2 +
 drivers/gpu/drm/panel/panel-innolux-ej030na.c      |  31 +-
 drivers/gpu/drm/panel/panel-newvision-nv3052c.c    | 484 ++++++++++++++++
 drivers/gpu/drm/panel/panel-truly-nt35597.c        |   3 +-
 drivers/gpu/drm/panel/panel-visionox-rm69299.c     |   4 +-
 drivers/gpu/drm/panfrost/panfrost_job.c            |   4 +
 drivers/gpu/drm/qxl/qxl_kms.c                      |   4 +-
 drivers/gpu/drm/qxl/qxl_release.c                  |   2 +-
 drivers/gpu/drm/qxl/qxl_ttm.c                      |   6 +-
 drivers/gpu/drm/radeon/radeon_cs.c                 |   4 +
 drivers/gpu/drm/radeon/radeon_display.c            |   7 +-
 drivers/gpu/drm/radeon/radeon_object.c             |   8 +
 drivers/gpu/drm/radeon/radeon_vm.c                 |   2 +-
 drivers/gpu/drm/scheduler/sched_main.c             |   2 +
 drivers/gpu/drm/selftests/test-drm_buddy.c         |  10 +-
 drivers/gpu/drm/solomon/Kconfig                    |   2 +-
 drivers/gpu/drm/solomon/ssd130x.c                  |  42 +-
 drivers/gpu/drm/tilcdc/tilcdc_crtc.c               |   2 +-
 drivers/gpu/drm/tilcdc/tilcdc_external.c           |   8 +-
 drivers/gpu/drm/tiny/repaper.c                     |   2 +-
 drivers/gpu/drm/ttm/ttm_agp_backend.c              |   2 +-
 drivers/gpu/drm/ttm/ttm_bo.c                       | 231 ++++----
 drivers/gpu/drm/ttm/ttm_bo_util.c                  |  13 +-
 drivers/gpu/drm/ttm/ttm_device.c                   |  84 ++-
 drivers/gpu/drm/ttm/ttm_execbuf_util.c             |  15 +-
 drivers/gpu/drm/ttm/ttm_resource.c                 | 197 ++++++-
 drivers/gpu/drm/ttm/ttm_tt.c                       |  12 +-
 drivers/gpu/drm/v3d/v3d_gem.c                      |  15 +-
 drivers/gpu/drm/vc4/vc4_crtc.c                     |  14 +-
 drivers/gpu/drm/vc4/vc4_drv.h                      |  15 +-
 drivers/gpu/drm/vc4/vc4_gem.c                      |   9 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c                     | 442 +++++++++++++--
 drivers/gpu/drm/vc4/vc4_hdmi.h                     |  23 +-
 drivers/gpu/drm/vc4/vc4_hdmi_phy.c                 |   2 +-
 drivers/gpu/drm/vc4/vc4_hdmi_regs.h                |   6 +
 drivers/gpu/drm/vc4/vc4_hvs.c                      | 127 +++--
 drivers/gpu/drm/vc4/vc4_irq.c                      |   5 +
 drivers/gpu/drm/vc4/vc4_kms.c                      |  48 +-
 drivers/gpu/drm/vc4/vc4_regs.h                     |  28 +-
 drivers/gpu/drm/vc4/vc4_trace.h                    |  95 ++++
 drivers/gpu/drm/vgem/vgem_fence.c                  |  12 +-
 drivers/gpu/drm/virtio/virtgpu_display.c           |   2 +
 drivers/gpu/drm/virtio/virtgpu_gem.c               |   9 +
 drivers/gpu/drm/virtio/virtgpu_ioctl.c             |   3 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c                 |  16 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c                |  13 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c                |  20 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h                |  23 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_fb.c                 |   2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_fence.c              |  28 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_ioctl.c              |  27 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_irq.c                |  81 ++-
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c                | 457 +++++++++++----
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.h                |  29 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c                |  36 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_resource.c           |  19 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c               |  17 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c               |  27 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c         |   2 +-
 drivers/infiniband/core/umem_dmabuf.c              |   8 +-
 drivers/video/fbdev/Kconfig                        |  14 +-
 drivers/video/fbdev/core/fb_defio.c                |   9 +-
 include/drm/drm_atomic.h                           |  27 +-
 include/drm/drm_edid.h                             |  12 +-
 include/drm/drm_file.h                             |   2 +-
 include/drm/drm_format_helper.h                    |   5 +-
 include/drm/drm_gem.h                              |   5 -
 include/drm/drm_mipi_dsi.h                         |   2 +
 include/drm/drm_modes.h                            |   2 +
 include/drm/drm_modeset_helper_vtables.h           |   2 +-
 include/drm/gpu_scheduler.h                        |   1 +
 include/drm/ttm/ttm_bo_api.h                       |  62 +-
 include/drm/ttm/ttm_bo_driver.h                    |  29 +-
 include/drm/ttm/ttm_device.h                       |  11 -
 include/drm/ttm/ttm_resource.h                     |  74 +++
 include/drm/ttm/ttm_tt.h                           |   4 +-
 include/linux/dma-buf.h                            |   4 +-
 include/linux/dma-resv.h                           |  73 +--
 include/linux/efi.h                                |   4 -
 include/uapi/drm/vmwgfx_drm.h                      |   9 +-
 195 files changed, 5804 insertions(+), 2797 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/leadtek=
,ltk035c5444t.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-newvision-nv3052c.c

--ttoaypuzkkqwegvo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYk6n/AAKCRDj7w1vZxhR
xbryAP92Iw2vQeHRUCWGb/92berjWkJCriuU4yj/PcqYqTUlcwD9HVXBCoGdVuGi
Pw7aL07zagWdq4jmxmsDKfa7t/RPSQE=
=6y92
-----END PGP SIGNATURE-----

--ttoaypuzkkqwegvo--
