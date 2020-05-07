Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A31AC1C8366
	for <lists+dri-devel@lfdr.de>; Thu,  7 May 2020 09:25:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC9B36E935;
	Thu,  7 May 2020 07:25:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFFB46E932;
 Thu,  7 May 2020 07:25:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E75A0AF48;
 Thu,  7 May 2020 07:25:08 +0000 (UTC)
Date: Thu, 7 May 2020 09:25:03 +0200
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-next
Message-ID: <20200507072503.GA10979@linux-uq9g>
MIME-Version: 1.0
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
Cc: dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Dave, Daniel,

this is the third pull request for drm-misc-next for what will become
v5.8. AFAICT the highlights are the new managed allocation for DRM device
structures; optimizations in drm_mm, and Lima got runtime PM support.

Best regards
Thomas

drm-misc-next-2020-05-07:
drm-misc-next for 5.8:

UAPI Changes:

Cross-subsystem Changes:

 * MAINTAINERS: restore alphabetical order; update cirrus driver
 * Dcomuentation: document visionix, chronteli, ite vendor prefices; update
                  documentation for Chrontel CH7033, IT6505, IVO, BOE,
		  Panasonic, Chunghwa, AUO bindings; convert dw_mipi_dsi.txt
		  to YAML; remove todo item for drm_display_mode.hsync removal;

Core Changes:

 * drm: add devm_drm_dev_alloc() for managed allocations of drm_device;
        use DRM_MODESET_LOCK_ALL_*() in mode-object code; remove
        drm_display_mode.hsync; small cleanups of unused variables,
	compiler warnings and static functions
 * drm/client: dual-lincensing: GPL-2.0 or MIT
 * drm/mm: optimize tree searches in rb_hole_addr()

Driver Changes:

 * drm/{many}: use devm_drm_dev_alloc(); don't use drm_device.dev_private
 * drm/ast: don't double-assign to drm_crtc_funcs.set_config; drop
            drm_connector_register()
 * drm/bochs: drop drm_connector_register()
 * drm/bridge: add support for Chrontel ch7033; fix stack usage with
               old gccs; return error pointer in drm_panel_bridge_add()
 * drm/cirrus: Move to tiny
 * drm/dp_mst: don't use 2nd sideband tx slot; revert "Remove single tx
               msg restriction"
 * drm/lima: support runtime PM;
 * drm/meson: limit modes wrt chipset
 * drm/panel: add support for Visionox rm69299; fix clock on
              boe-tv101wum-n16; fix panel type for AUO G101EVN10;
	      add support for Ivo M133NFW4 R0; add support for BOE
	      NV133FHM-N61; add support for AUO G121EAN01.4, G156XTN01.0,
	      G190EAN01
 * drm/pl111: improve vexpress init; fix module auto-loading
 * drm/stm: read number of endpoints from device tree
 * drm/vboxvideo: use managed PCI functions; drop DRM_MTRR_WC
 * drm/vkms: fix use-after-free in vkms_gem_create(); enable cursor
             support by default
 * fbdev: use boolean values in several drivers
 * fbdev/controlfb: fix COMPILE_TEST
 * fbdev/w100fb: fix double-free bug
The following changes since commit 776d58823a60c689816972b51100cb322a0834ce:

  dma-buf: Couple of documentation typo fixes (2020-04-21 14:37:51 +0200)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-2020-05-07

for you to fetch changes up to 0ea2ea42b31abc1141f2fd3911f952a97d401fcb:

  drm/vkms: Hold gem object while still in-use (2020-05-06 21:51:46 -0400)

----------------------------------------------------------------
drm-misc-next for 5.8:

UAPI Changes:

Cross-subsystem Changes:

 * MAINTAINERS: restore alphabetical order; update cirrus driver
 * Dcomuentation: document visionix, chronteli, ite vendor prefices; update
                  documentation for Chrontel CH7033, IT6505, IVO, BOE,
		  Panasonic, Chunghwa, AUO bindings; convert dw_mipi_dsi.txt
		  to YAML; remove todo item for drm_display_mode.hsync removal;

Core Changes:

 * drm: add devm_drm_dev_alloc() for managed allocations of drm_device;
        use DRM_MODESET_LOCK_ALL_*() in mode-object code; remove
        drm_display_mode.hsync; small cleanups of unused variables,
	compiler warnings and static functions
 * drm/client: dual-lincensing: GPL-2.0 or MIT
 * drm/mm: optimize tree searches in rb_hole_addr()

Driver Changes:

 * drm/{many}: use devm_drm_dev_alloc(); don't use drm_device.dev_private
 * drm/ast: don't double-assign to drm_crtc_funcs.set_config; drop
            drm_connector_register()
 * drm/bochs: drop drm_connector_register()
 * drm/bridge: add support for Chrontel ch7033; fix stack usage with
               old gccs; return error pointer in drm_panel_bridge_add()
 * drm/cirrus: Move to tiny
 * drm/dp_mst: don't use 2nd sideband tx slot; revert "Remove single tx
               msg restriction"
 * drm/lima: support runtime PM;
 * drm/meson: limit modes wrt chipset
 * drm/panel: add support for Visionox rm69299; fix clock on
              boe-tv101wum-n16; fix panel type for AUO G101EVN10;
	      add support for Ivo M133NFW4 R0; add support for BOE
	      NV133FHM-N61; add support for AUO G121EAN01.4, G156XTN01.0,
	      G190EAN01
 * drm/pl111: improve vexpress init; fix module auto-loading
 * drm/stm: read number of endpoints from device tree
 * drm/vboxvideo: use managed PCI functions; drop DRM_MTRR_WC
 * drm/vkms: fix use-after-free in vkms_gem_create(); enable cursor
             support by default
 * fbdev: use boolean values in several drivers
 * fbdev/controlfb: fix COMPILE_TEST
 * fbdev/w100fb: fix double-free bug

----------------------------------------------------------------
Adrian Ratiu (1):
      dt-bindings: display: dw_mipi_dsi.txt: convert to yaml

Arnd Bergmann (1):
      drm/bridge: fix stack usage warning on old gcc

Bartlomiej Zolnierkiewicz (1):
      video: fbdev: controlfb: fix build for COMPILE_TEST=3Dy && PPC_PMAC=
=3Dy && PPC32=3Dn

Bjorn Andersson (4):
      dt-bindings: display: simple: Add BOE NV133FHM-N61
      panel: simple: Add BOE NV133FHM-N61
      dt-bindings: display: simple: Add IVO M133NWF4 R0
      panel: simple: Add Ivo M133NWF4 R0

Christophe JAILLET (1):
      video: fbdev: w100fb: Fix a potential double free.

Daniel Vetter (40):
      drm: Add devm_drm_dev_alloc macro
      drm/vboxvideo: drop DRM_MTRR_WC #define
      drm/vboxvideo: Use devm_drm_dev_alloc
      drm/vboxvideo: Stop using drm_device->dev_private
      drm/vboxvideo: use managed pci functions
      drm/vboxvideo: Use devm_gen_pool_create
      drm/v3d: Don't set drm_device->dev_private
      drm/v3d: Use devm_drm_dev_alloc
      drm/v3d: Delete v3d_dev->dev
      drm/v3d: Delete v3d_dev->pdev
      drm/udl: Use devm_drm_dev_alloc
      drm/udl: don't set drm_device->dev_private
      drm/st7735r: Use devm_drm_dev_alloc
      drm/st7586: Use devm_drm_dev_alloc
      drm/repaper: Use devm_drm_dev_alloc
      drm/mi0283qt: Use devm_drm_dev_alloc
      drm/ili9486: Use devm_drm_dev_alloc
      drm/ili9341: Use devm_drm_dev_alloc
      drm/ili9225: Use devm_drm_dev_alloc
      drm/hx8357d: Use devm_drm_dev_alloc
      drm/gm12u320: Use devm_drm_dev_alloc
      drm/gm12u320: Don't use drm_device->dev_private
      drm/tidss: Use devm_drm_dev_alloc
      drm/tidss: Don't use drm_device->dev_private
      drm/tidss: Delete tidss->saved_state
      drm/mcde: Use devm_drm_dev_alloc
      drm/mcde: Don't use drm_device->dev_private
      drm/ingenic: Use devm_drm_dev_alloc
      drm/ingenic: Don't set drm_device->dev_private
      drm/komeda: use devm_drm_dev_alloc
      drm/cirrus: Use devm_drm_dev_alloc
      drm/cirrus: Don't use drm_device->dev_private
      drm/cirrus: Move to drm/tiny
      drm/aspeed: Drop aspeed_gfx->fbdev
      drm/aspeed: Use devm_drm_dev_alloc
      drm/ast: Drop explicit connector register/unregister
      drm/bochs: Remove explicit drm_connector_register
      drm/qxl: Use devm_drm_dev_alloc
      drm/qxl: Don't use drm_device->dev_private
      drm/i915: Use devm_drm_dev_alloc

David Lu (1):
      drm/panel: boe-tv101wum-n16: fine tune clock

Emmanuel Vadot (1):
      drm/client: Dual licence the header in GPL-2 and MIT

Enric Balletbo i Serra (4):
      drm: panel: Set connector type for LP120UP1
      drm/bridge: ps8640: Let panel to set the connector type
      drm/bridge: panel: Return always an error pointer in drm_panel_bridge=
_add()
      drm/rockchip: cdn-dp-core: Make cdn_dp_core_suspend/resume static

Ezequiel Garcia (1):
      drm/vkms: Hold gem object while still in-use

Harigovindan P (2):
      dt-bindings: documenting compatible string vendor "visionox"
      drm/panel: add support for rm69299 visionox panel

Jason Yan (6):
      drm/ast: remove duplicate assignment of ast_crtc_funcs member
      video: fbdev: i810: use true,false for bool variables
      video: udlfb: use true,false for bool variables
      video: uvesafb: use true,false for bool variables
      fbdev: aty: use true, false for bool variables in atyfb_base.c
      video: fbdev: valkyriefb.c: fix warning comparing pointer to 0

Kenny Levinsen (1):
      drm: make drm_file use keyed wakeups

Lubomir Rintel (3):
      dt-bindings: Add vendor prefix for Chrontel, Inc.
      dt-bindings: display: Add Chrontel CH7033 Video Encoder binding
      drm/bridge: chrontel-ch7033: Add a new driver

Lyude Paul (2):
      Revert "drm/dp_mst: Remove single tx msg restriction."
      drm/dp_mst: Kill the second sideband tx slot, save the world

Maya Rashish (1):
      drm/ttm: Remove reference to the mem_glob member

Melissa Wen (1):
      drm/vkms: enable cursor by default

Michal Orzel (1):
      drm: Replace drm_modeset_lock/unlock_all with DRM_MODESET_LOCK_ALL_* =
helpers

Neil Armstrong (1):
      drm/meson: add mode selection limits against specific SoC revisions

Nirmoy Das (1):
      drm/mm: optimize rb_hole_addr rbtree search

Qiang Yu (10):
      drm/lima: use module_platform_driver helper
      drm/lima: print process name and pid when task error
      drm/lima: check vm !=3D NULL in lima_vm_put
      drm/lima: always set page directory when switch vm
      drm/lima: add lima_devfreq_resume/suspend
      drm/lima: power down ip blocks when pmu exit
      drm/lima: add resume/suspend callback for each ip
      drm/lima: separate clk/regulator enable/disable function
      drm/lima: add pm resume/suspend ops
      drm/lima: enable runtime pm

Rob Herring (3):
      drm: pl111: Fix module autoloading
      drm: pl111: Simplify vexpress init
      drm: pl111: Move VExpress setup into versatile init

Robin Murphy (2):
      drm/lima: Clean up IRQ warnings
      drm/lima: Clean up redundant pdev pointer

Rodrigo Siqueira (1):
      drm: Correct DP DSC macro typo

Sebastian Reichel (3):
      drm/panel: simple: Add support for AUO G190EAN01 panel
      drm/panel: simple: Add support for AUO G156XTN01.0 panel
      drm/panel: simple: Add support for AUO G121EAN01.4 panel

Souptick Joarder (1):
      video/fbdev/riva: Remove dead code

Thierry Reding (1):
      dt-bindings: panel: Document some missing compatible strings

Thomas Zimmermann (1):
      MAINTAINERS: Restore alphabetical sorting

Tomi Valkeinen (3):
      drm/panel: panel-simple: fix AUO G101EVN010 connector/panel type
      drm/omap: change default signal polarities and drives
      drm/tidss: remove AM65x PG1 YUV erratum code

Ville Syrj=E4l=E4 (1):
      drm: Nuke mode->hsync

Yannick Fertre (1):
      drm/stm: ltdc: check number of endpoints

YueHaibing (2):
      drm/panel: remove set but not used variable 'config'
      drm/omap: venc: remove unused variable 'venc_config_pal_bdghi'

Zheng Bin (3):
      drm/panel: ili9322: Remove unneeded semicolon
      drm/rockchip: Remove unneeded semicolon
      drm/meson: Remove unneeded semicolon

Zou Wei (1):
      drm/udl: Make udl_handle_damage static

allen (2):
      dt-bindings: fix vendor prefix for ITE Tech. Inc.
      dt-bindings: Add binding for IT6505.

 .../bindings/display/bridge/chrontel,ch7033.yaml   |  77 +++
 .../bindings/display/bridge/dw_mipi_dsi.txt        |  32 --
 .../bindings/display/bridge/ite,it6505.yaml        |  91 +++
 .../bindings/display/bridge/snps,dw-mipi-dsi.yaml  |  68 +++
 .../bindings/display/panel/panel-simple-dsi.yaml   |   2 +
 .../bindings/display/panel/panel-simple.yaml       |  12 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   8 +-
 Documentation/gpu/todo.rst                         |  12 -
 MAINTAINERS                                        |  31 +-
 drivers/gpu/drm/Kconfig                            |   2 -
 drivers/gpu/drm/Makefile                           |   1 -
 drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c        |   2 +-
 drivers/gpu/drm/arm/display/komeda/komeda_kms.c    |  16 +-
 drivers/gpu/drm/aspeed/aspeed_gfx.h                |   3 +-
 drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c           |   2 +-
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c            |  31 +-
 drivers/gpu/drm/aspeed/aspeed_gfx_out.c            |   2 +-
 drivers/gpu/drm/ast/ast_mode.c                     |   4 -
 drivers/gpu/drm/bochs/bochs_kms.c                  |   1 -
 drivers/gpu/drm/bridge/Kconfig                     |  10 +
 drivers/gpu/drm/bridge/Makefile                    |   1 +
 drivers/gpu/drm/bridge/chrontel-ch7033.c           | 620 +++++++++++++++++=
++++
 drivers/gpu/drm/bridge/panel.c                     |   6 +-
 drivers/gpu/drm/bridge/parade-ps8640.c             |   2 -
 drivers/gpu/drm/bridge/tc358768.c                  |   4 +-
 drivers/gpu/drm/cirrus/Kconfig                     |  19 -
 drivers/gpu/drm/cirrus/Makefile                    |   2 -
 drivers/gpu/drm/drm_dp_mst_topology.c              | 137 ++---
 drivers/gpu/drm/drm_drv.c                          |  23 +
 drivers/gpu/drm/drm_edid.c                         |   8 +
 drivers/gpu/drm/drm_file.c                         |   6 +-
 drivers/gpu/drm/drm_mm.c                           | 133 ++++-
 drivers/gpu/drm/drm_mode_object.c                  |  10 +-
 drivers/gpu/drm/drm_modes.c                        |  26 -
 drivers/gpu/drm/i915/display/intel_display.c       |   1 -
 drivers/gpu/drm/i915/i915_drv.c                    |  17 +-
 drivers/gpu/drm/i915/i915_pci.c                    |   2 -
 drivers/gpu/drm/ingenic/ingenic-drm.c              |  15 +-
 drivers/gpu/drm/lima/lima_bcast.c                  |  25 +-
 drivers/gpu/drm/lima/lima_bcast.h                  |   2 +
 drivers/gpu/drm/lima/lima_devfreq.c                |  31 +-
 drivers/gpu/drm/lima/lima_devfreq.h                |   3 +
 drivers/gpu/drm/lima/lima_device.c                 | 211 +++++--
 drivers/gpu/drm/lima/lima_device.h                 |   6 +-
 drivers/gpu/drm/lima/lima_dlbu.c                   |  17 +-
 drivers/gpu/drm/lima/lima_dlbu.h                   |   2 +
 drivers/gpu/drm/lima/lima_drv.c                    |  41 +-
 drivers/gpu/drm/lima/lima_gp.c                     |  21 +-
 drivers/gpu/drm/lima/lima_gp.h                     |   2 +
 drivers/gpu/drm/lima/lima_l2_cache.c               |  38 +-
 drivers/gpu/drm/lima/lima_l2_cache.h               |   2 +
 drivers/gpu/drm/lima/lima_mmu.c                    |  49 +-
 drivers/gpu/drm/lima/lima_mmu.h                    |   2 +
 drivers/gpu/drm/lima/lima_pmu.c                    |  77 ++-
 drivers/gpu/drm/lima/lima_pmu.h                    |   2 +
 drivers/gpu/drm/lima/lima_pp.c                     |  31 +-
 drivers/gpu/drm/lima/lima_pp.h                     |   4 +
 drivers/gpu/drm/lima/lima_sched.c                  |  63 ++-
 drivers/gpu/drm/lima/lima_vm.h                     |   3 +-
 drivers/gpu/drm/mcde/mcde_display.c                |  10 +-
 drivers/gpu/drm/mcde/mcde_drm.h                    |   2 +
 drivers/gpu/drm/mcde/mcde_drv.c                    |  21 +-
 drivers/gpu/drm/mcde/mcde_dsi.c                    |   2 +-
 drivers/gpu/drm/meson/meson_drv.c                  |  29 +-
 drivers/gpu/drm/meson/meson_drv.h                  |   6 +
 drivers/gpu/drm/meson/meson_dw_hdmi.c              |   2 +-
 drivers/gpu/drm/meson/meson_plane.c                |   2 +-
 drivers/gpu/drm/meson/meson_vclk.c                 |  16 +-
 drivers/gpu/drm/meson/meson_vclk.h                 |   3 +-
 drivers/gpu/drm/omapdrm/dss/dispc.c                |  33 +-
 drivers/gpu/drm/omapdrm/dss/venc.c                 |  43 --
 drivers/gpu/drm/panel/Kconfig                      |   8 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c     |   8 +-
 drivers/gpu/drm/panel/panel-ilitek-ili9322.c       |   4 +-
 drivers/gpu/drm/panel/panel-simple.c               | 160 +++++-
 drivers/gpu/drm/panel/panel-truly-nt35597.c        |   2 -
 drivers/gpu/drm/panel/panel-visionox-rm69299.c     | 302 ++++++++++
 drivers/gpu/drm/pl111/Makefile                     |   1 -
 drivers/gpu/drm/pl111/pl111_drv.c                  |   1 +
 drivers/gpu/drm/pl111/pl111_versatile.c            | 148 +++--
 drivers/gpu/drm/pl111/pl111_vexpress.c             | 138 -----
 drivers/gpu/drm/pl111/pl111_vexpress.h             |  29 -
 drivers/gpu/drm/qxl/qxl_debugfs.c                  |   7 +-
 drivers/gpu/drm/qxl/qxl_display.c                  |  32 +-
 drivers/gpu/drm/qxl/qxl_drv.c                      |  23 +-
 drivers/gpu/drm/qxl/qxl_drv.h                      |   7 +-
 drivers/gpu/drm/qxl/qxl_dumb.c                     |   2 +-
 drivers/gpu/drm/qxl/qxl_gem.c                      |   2 +-
 drivers/gpu/drm/qxl/qxl_ioctl.c                    |  14 +-
 drivers/gpu/drm/qxl/qxl_irq.c                      |   2 +-
 drivers/gpu/drm/qxl/qxl_kms.c                      |  13 +-
 drivers/gpu/drm/qxl/qxl_object.c                   |   2 +-
 drivers/gpu/drm/qxl/qxl_release.c                  |   2 +-
 drivers/gpu/drm/qxl/qxl_ttm.c                      |   2 +-
 drivers/gpu/drm/rockchip/cdn-dp-core.c             |   4 +-
 drivers/gpu/drm/rockchip/cdn-dp-reg.c              |   6 +-
 drivers/gpu/drm/stm/ltdc.c                         | 102 ++--
 drivers/gpu/drm/tidss/tidss_crtc.c                 |  16 +-
 drivers/gpu/drm/tidss/tidss_dispc.c                |  11 +-
 drivers/gpu/drm/tidss/tidss_dispc.h                |   6 -
 drivers/gpu/drm/tidss/tidss_drv.c                  |  17 +-
 drivers/gpu/drm/tidss/tidss_drv.h                  |   4 +-
 drivers/gpu/drm/tidss/tidss_irq.c                  |  12 +-
 drivers/gpu/drm/tidss/tidss_kms.c                  |   2 +-
 drivers/gpu/drm/tidss/tidss_plane.c                |   6 +-
 drivers/gpu/drm/tiny/Kconfig                       |  19 +
 drivers/gpu/drm/tiny/Makefile                      |   1 +
 drivers/gpu/drm/{cirrus =3D> tiny}/cirrus.c          |  22 +-
 drivers/gpu/drm/tiny/gm12u320.c                    |  24 +-
 drivers/gpu/drm/tiny/hx8357d.c                     |  13 +-
 drivers/gpu/drm/tiny/ili9225.c                     |  13 +-
 drivers/gpu/drm/tiny/ili9341.c                     |  13 +-
 drivers/gpu/drm/tiny/ili9486.c                     |  13 +-
 drivers/gpu/drm/tiny/mi0283qt.c                    |  13 +-
 drivers/gpu/drm/tiny/repaper.c                     |  14 +-
 drivers/gpu/drm/tiny/st7586.c                      |  13 +-
 drivers/gpu/drm/tiny/st7735r.c                     |  13 +-
 drivers/gpu/drm/udl/udl_connector.c                |   4 +-
 drivers/gpu/drm/udl/udl_drv.c                      |  27 +-
 drivers/gpu/drm/udl/udl_modeset.c                  |  10 +-
 drivers/gpu/drm/v3d/v3d_debugfs.c                  |  12 +-
 drivers/gpu/drm/v3d/v3d_drv.c                      |  47 +-
 drivers/gpu/drm/v3d/v3d_drv.h                      |   7 +-
 drivers/gpu/drm/v3d/v3d_gem.c                      |  17 +-
 drivers/gpu/drm/v3d/v3d_irq.c                      |  16 +-
 drivers/gpu/drm/v3d/v3d_mmu.c                      |  10 +-
 drivers/gpu/drm/v3d/v3d_sched.c                    |  10 +-
 drivers/gpu/drm/vboxvideo/vbox_drv.c               |  26 +-
 drivers/gpu/drm/vboxvideo/vbox_drv.h               |   1 +
 drivers/gpu/drm/vboxvideo/vbox_irq.c               |   2 +-
 drivers/gpu/drm/vboxvideo/vbox_main.c              |  29 +-
 drivers/gpu/drm/vboxvideo/vbox_mode.c              |  10 +-
 drivers/gpu/drm/vboxvideo/vbox_ttm.c               |  12 -
 drivers/gpu/drm/vkms/vkms_drv.c                    |   2 +-
 drivers/gpu/drm/vkms/vkms_drv.h                    |   5 -
 drivers/gpu/drm/vkms/vkms_gem.c                    |  11 +-
 drivers/video/fbdev/aty/atyfb_base.c               |   4 +-
 drivers/video/fbdev/controlfb.c                    |   2 +-
 drivers/video/fbdev/i810/i810_main.c               |  10 +-
 drivers/video/fbdev/riva/riva_hw.c                 |  18 -
 drivers/video/fbdev/udlfb.c                        |   6 +-
 drivers/video/fbdev/uvesafb.c                      |  12 +-
 drivers/video/fbdev/valkyriefb.c                   |   4 +-
 drivers/video/fbdev/w100fb.c                       |   2 +
 include/drm/drm_client.h                           |   2 +-
 include/drm/drm_dp_helper.h                        |   4 +-
 include/drm/drm_dp_mst_helper.h                    |  24 +-
 include/drm/drm_drv.h                              |  33 ++
 include/drm/drm_mm.h                               |   1 +
 include/drm/drm_modes.h                            |  11 -
 include/drm/ttm/ttm_bo_driver.h                    |   1 -
 152 files changed, 2653 insertions(+), 1246 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/chront=
el,ch7033.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/bridge/dw_mip=
i_dsi.txt
 create mode 100644 Documentation/devicetree/bindings/display/bridge/ite,it=
6505.yaml
 create mode 100644 Documentation/devicetree/bindings/display/bridge/snps,d=
w-mipi-dsi.yaml
 create mode 100644 drivers/gpu/drm/bridge/chrontel-ch7033.c
 delete mode 100644 drivers/gpu/drm/cirrus/Kconfig
 delete mode 100644 drivers/gpu/drm/cirrus/Makefile
 create mode 100644 drivers/gpu/drm/panel/panel-visionox-rm69299.c
 delete mode 100644 drivers/gpu/drm/pl111/pl111_vexpress.c
 delete mode 100644 drivers/gpu/drm/pl111/pl111_vexpress.h
 rename drivers/gpu/drm/{cirrus =3D> tiny}/cirrus.c (97%)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
