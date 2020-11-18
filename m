Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74ED52B7DA3
	for <lists+dri-devel@lfdr.de>; Wed, 18 Nov 2020 13:32:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39DBC6E413;
	Wed, 18 Nov 2020 12:32:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DAF06E3DB;
 Wed, 18 Nov 2020 12:32:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5EAEAAC2E;
 Wed, 18 Nov 2020 12:32:33 +0000 (UTC)
Date: Wed, 18 Nov 2020 13:32:21 +0100
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-next
Message-ID: <20201118123221.GA19755@linux-uq9g>
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

Hi Dave and Daniel,

here's this week's PR for drm-misc-next. It's fairly large, but most of
the patches fix kernel build warnings. The rest is the usual mixture of
cleanups and small fixes. The panel code gained support for new devices.

Best regards
Thomas

drm-misc-next-2020-11-18:
drm-misc-next for 5.11:

UAPI Changes:

 * media: Add MEDIA_BUS_FMT_RGB888_3X8_DELTA format

Cross-subsystem Changes:

 * console: Remove unused functions; Store characters-per-font in font-
   descriptor structure instead of hard-coding
 * DT: Add vendor prefix for ShenZhen Asia Better Technology Ltd. (ABT)

Core Changes:

 * Fix build warnings
 * Update debug logging to new interfaces, plus fixes
 * Add error messages for ioctls;
 * Fix kernel docs
 * doc: Fix kernel docs
 * fbcon: Remove accelerated scrolling
 * selftests: Fix build warnings
 * ttm: Fix missing NULL check in new page pool; Fix build warnings
 * video: Fix kernel docs

Driver Changes:

 * armada: Fix build warnings
 * atmel-hlcdc: Fix build warnings
 * exynos: Fix build warnings
 * gma500: Remove 2d framebuffer acceleration
 * lima: Fix build warnings; Cleanups
 * mediatek: Fix build warnings
 * meson: Module removal fixes; Fix build warnings
 * nouveau: Fix build warnings
 * omap: Fix return values
 * panel: Fix build warnings; Add support and DT bindings for OnePlus 6/T; =
Add
   support and DT bindings for ABT Y030XX067A
 * panel/s6e63m0: Add/improve SPi reading/writing; Support 3WIRE protocol; =
Set
   connector display info; Add more comments
 * panfrost: Move GPU reset into separate worker, avoid race conditions
 * pl111: Fix build warnings
 * qxl: Cleanup fbcon acceleration
 * rockchip: Fix build warnings
 * savage: Fix build warnings
 * sti: Fix build warnings
 * udl: Fix missing error code in udl_handle_damage()
 * v3d: Fix build warnings
 * vc4: Fix build warnings
 * via: Fix build warnings
 * virtio: Make dma-buf ops static
The following changes since commit 05481f072787e96d08cc304cda0c10e0d02cdadc:

  drm/kmb: fix spelling mistakes in drm_info and drm_dbg messages (2020-11-=
11 22:00:05 +0100)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-2020-11-18

for you to fetch changes up to fa388231fec99b60346319d56495ae531b666275:

  drm/docs: Fix todo.rst (2020-11-18 11:51:58 +0100)

----------------------------------------------------------------
drm-misc-next for 5.11:

UAPI Changes:

 * media: Add MEDIA_BUS_FMT_RGB888_3X8_DELTA format

Cross-subsystem Changes:

 * console: Remove unused functions; Store characters-per-font in font-
   descriptor structure instead of hard-coding
 * DT: Add vendor prefix for ShenZhen Asia Better Technology Ltd. (ABT)

Core Changes:

 * Fix build warnings
 * Update debug logging to new interfaces, plus fixes
 * Add error messages for ioctls;
 * Fix kernel docs
 * doc: Fix kernel docs
 * fbcon: Remove accelerated scrolling
 * selftests: Fix build warnings
 * ttm: Fix missing NULL check in new page pool; Fix build warnings
 * video: Fix kernel docs

Driver Changes:

 * armada: Fix build warnings
 * atmel-hlcdc: Fix build warnings
 * exynos: Fix build warnings
 * gma500: Remove 2d framebuffer acceleration
 * lima: Fix build warnings; Cleanups
 * mediatek: Fix build warnings
 * meson: Module removal fixes; Fix build warnings
 * nouveau: Fix build warnings
 * omap: Fix return values
 * panel: Fix build warnings; Add support and DT bindings for OnePlus 6/T; =
Add
   support and DT bindings for ABT Y030XX067A
 * panel/s6e63m0: Add/improve SPi reading/writing; Support 3WIRE protocol; =
Set
   connector display info; Add more comments
 * panfrost: Move GPU reset into separate worker, avoid race conditions
 * pl111: Fix build warnings
 * qxl: Cleanup fbcon acceleration
 * rockchip: Fix build warnings
 * savage: Fix build warnings
 * sti: Fix build warnings
 * udl: Fix missing error code in udl_handle_damage()
 * v3d: Fix build warnings
 * vc4: Fix build warnings
 * via: Fix build warnings
 * virtio: Make dma-buf ops static

----------------------------------------------------------------
Boris Brezillon (1):
      drm/panfrost: Move the GPU reset bits outside the timeout handler

Caleb Connolly (2):
      dt-bindings: panel-simple-dsi: add samsung panels for OnePlus 6/T
      drm/panel/samsung-sofef00: Add panel for OnePlus 6/T devices

Christian K=F6nig (1):
      drm/ttm: fix missing NULL check in the new page pool

Dan Carpenter (1):
      drm/udl: Fix missing error code in udl_handle_damage()

Daniel Vetter (4):
      fbcon: Disable accelerated scrolling
      fbcon: Drop EXPORT_SYMBOL
      drm/qxl: Remove fbcon acceleration leftovers
      drm/docs: Fix todo.rst

Lee Jones (44):
      drm/atmel-hlcdc/atmel_hlcdc_crtc: Apply correct formatting to struct =
docs
      drm/atmel-hlcdc/atmel_hlcdc_plane: Staticise local function 'atmel_hl=
cdc_plane_setup_scaler()'
      drm/atmel-hlcdc/atmel_hlcdc_plane: Fix documentation formatting and a=
dd missing description
      drm/savage/savage_bci: Remove set but never used 'aper_rsrc' and 'fb_=
rsrc'
      include: drm: drm_atomic: Artificially use 'crtc' to avoid 'not used'=
 warning
      drm/sti/sti_hdmi: Move 'colorspace_mode_names' array to where its used
      drm/via/via_dma: Remove set but unused variable 'agp_base'
      drm/panel/panel-tpo-tpg110: Correct misnaming and supply missing para=
m description
      drm/lima/lima_drv: Demote kernel-doc formatting abuse
      drm/lima/lima_sched: Remove unused and unnecessary variable 'ret'
      drm/armada/armada_overlay: Staticify local function 'armada_overlay_d=
uplicate_state'
      drm/drm_dp_mst_topology: Remove set but never used variable 'len'
      drm/exynos/exynos7_drm_decon: Supply missing description for param 'c=
tx'
      drm/exynos/exynos_drm_fimd: Add missing description for param 'ctx'
      drm/exynos/exynos_drm_gsc: Supply missing description for 'num_limits'
      drm/mediatek/mtk_dpi: Remove unused struct definition 'mtk_dpi_encode=
r_funcs'
      drm/mediatek/mtk_disp_color: Fix formatting and provide missing membe=
r description
      drm/mediatek/mtk_disp_ovl: Fix formatting and provide missing member =
description
      drm/mediatek/mtk_disp_rdma: Fix formatting and supply missing struct =
member description
      drm/mediatek/mtk_drm_crtc: Demote seriously out-of-date struct header
      drm/mediatek/mtk_drm_drv: Staticise local function invoked by referen=
ce
      drm/meson/meson_venc: Make local function 'meson_venc_hdmi_get_dmt_vm=
ode' static
      drm/meson/meson_vclk: Make two local functions static
      drm/nouveau/nvkm/core/firmware: Fix formatting, provide missing param=
 description
      drm/pl111/pl111_display: Make local function static
      drm/pl111/pl111_debugfs: Make local function 'pl111_debugfs_regs()' s=
tatic
      drm/rockchip/dw-mipi-dsi-rockchip: Demote non-conformant kernel-doc h=
eaders
      drm/rockchip/rockchip_rgb: Consume our own header
      drm/rockchip/rockchip_lvds: Fix struct document formatting
      drm/selftests/test-drm_mm: Mark 'hole_end' as always_unused
      drm/selftests/test-drm_framebuffer: Remove set but unused variable 'f=
b'
      drm/selftests/test-drm_dp_mst_helper: Place 'struct drm_dp_sideband_m=
sg_req_body' onto the heap
      drm/selftests/test-drm_dp_mst_helper: Move 'sideband_msg_req_encode_d=
ecode' onto the heap
      drm/ttm/ttm_bo: Fix one function header - demote lots of kernel-doc a=
buses
      drm/ttm/ttm_range_manager: Demote non-conformant kernel-doc header
      drm/ttm/ttm_tt: Demote kernel-doc header format abuses
      drm/v3d/v3d_drv: Remove unused static variable 'v3d_v3d_pm_ops'
      drm/v3d/v3d_gem: Provide descriptions for 'v3d_lookup_bos's params
      drm/v3d/v3d_sched: Demote non-conformant kernel-doc header
      drm/vc4/vc4_hdmi_regs: Mark some data sets as __maybe_unused
      drm/vc4/vc4_hdmi: Remove set but unused variable 'ret'
      drm/vc4/vc4_v3d: Demote non-conformant kernel-doc headers
      drm/vc4/vc4_debugfs: Demote non-conformant kernel-doc headers
      include/drm/drm_atomic: Make use of 'new_crtc_state'

Linus Walleij (5):
      drm/panel: s6e63m0: Simplify SPI writing
      drm/panel: s6e63m0: Implement reading from panel
      drm/panel: s6e63m0: Add some explanations
      drm/panel: s6e63m0: Support 3WIRE protocol
      drm/panel: s6e63m0: Set up some display info

Liu Shixin (1):
      drm/lima: simplify the return expression of lima_devfreq_target

Marc Zyngier (4):
      drm/meson: Free RDMA resources after tearing down DRM
      drm/meson: Unbind all connectors on module removal
      drm/meson: dw-hdmi: Register a callback to disable the regulator
      drm/meson: dw-hdmi: Ensure that clocks are enabled before touching th=
e TOP registers

Mauro Carvalho Chehab (2):
      video: fix some kernel-doc markups
      drm: fix some kernel-doc markups

Patrik Jakobsson (2):
      drm/gma500: Remove GTT roll support
      drm/gma500: Remove 2D accel code

Paul Cercueil (4):
      dt-bindings: vendor-prefixes: Add abt vendor prefix
      dt-bindings: display: Add ABT Y030XX067A panel bindings
      media: uapi: Add MEDIA_BUS_FMT_RGB888_3X8_DELTA media bus format
      drm/panel: Add ABT Y030XX067A 3.0" 320x480 panel

Peilin Ye (5):
      console: Delete unused con_font_copy() callback implementations
      console: Delete dummy con_font_set() and con_font_default() callback =
implementations
      Fonts: Add charcount field to font_desc
      parisc/sticore: Avoid hard-coding built-in font charcount
      fbcon: Avoid using FNTCHARCNT() and hard-coded built-in font charcount

Simon Ser (3):
      drm: convert drm_atomic_uapi.c to new debug helpers
      drm: add debug logs for drm_mode_atomic_ioctl errors
      drm: fix oops in drm_atomic_set_crtc_for_connector

Viresh Kumar (1):
      drm/lima: Unconditionally call dev_pm_opp_of_remove_table()

Yang Yingliang (2):
      video: fbdev: atmel_lcdfb: fix return error code in atmel_lcdfb_of_in=
it()
      drm/omap: dmm_tiler: fix return error code in omap_dmm_probe()

Zou Wei (1):
      drm/virtio: Make virtgpu_dmabuf_ops with static keyword

 .../bindings/display/panel/abt,y030xx067a.yaml     |  62 ++++
 .../bindings/display/panel/panel-simple-dsi.yaml   |   4 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 Documentation/gpu/todo.rst                         |  21 ++
 drivers/gpu/drm/armada/armada_overlay.c            |   2 +-
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c     |   6 +-
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c    |   7 +-
 drivers/gpu/drm/drm_atomic_state_helper.c          |   2 +-
 drivers/gpu/drm/drm_atomic_uapi.c                  | 136 +++++---
 drivers/gpu/drm/drm_connector.c                    |   3 +-
 drivers/gpu/drm/drm_dp_helper.c                    |   2 +-
 drivers/gpu/drm/drm_dp_mst_topology.c              |   4 +-
 drivers/gpu/drm/drm_framebuffer.c                  |   2 +-
 drivers/gpu/drm/drm_gem.c                          |   4 +-
 drivers/gpu/drm/drm_gem_vram_helper.c              |   2 +-
 drivers/gpu/drm/drm_mode_object.c                  |   2 +-
 drivers/gpu/drm/drm_modes.c                        |   4 +-
 drivers/gpu/drm/drm_scdc_helper.c                  |   2 +-
 drivers/gpu/drm/exynos/exynos7_drm_decon.c         |   1 +
 drivers/gpu/drm/exynos/exynos_drm_fimd.c           |   1 +
 drivers/gpu/drm/exynos/exynos_drm_gsc.c            |   1 +
 drivers/gpu/drm/gma500/accel_2d.c                  | 292 -----------------
 drivers/gpu/drm/gma500/cdv_device.c                |   1 -
 drivers/gpu/drm/gma500/framebuffer.c               | 108 +-----
 drivers/gpu/drm/gma500/gtt.c                       |  52 +--
 drivers/gpu/drm/gma500/gtt.h                       |   3 -
 drivers/gpu/drm/gma500/mdfld_device.c              |   1 -
 drivers/gpu/drm/gma500/oaktrail_device.c           |   1 -
 drivers/gpu/drm/gma500/psb_device.c                |   1 -
 drivers/gpu/drm/gma500/psb_drv.c                   |   1 -
 drivers/gpu/drm/gma500/psb_drv.h                   |   7 -
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c      |   2 +-
 drivers/gpu/drm/i915/i915_gem_evict.c              |   2 +-
 drivers/gpu/drm/i915/i915_perf.c                   |   8 +-
 drivers/gpu/drm/lima/lima_devfreq.c                |  13 +-
 drivers/gpu/drm/lima/lima_devfreq.h                |   1 -
 drivers/gpu/drm/lima/lima_drv.c                    |   2 +-
 drivers/gpu/drm/lima/lima_sched.c                  |   3 +-
 drivers/gpu/drm/mediatek/mtk_disp_color.c          |   5 +-
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c            |   5 +-
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c           |   5 +-
 drivers/gpu/drm/mediatek/mtk_dpi.c                 |   9 -
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c            |   4 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c             |   4 +-
 drivers/gpu/drm/meson/meson_drv.c                  |  12 +-
 drivers/gpu/drm/meson/meson_dw_hdmi.c              |  13 +-
 drivers/gpu/drm/meson/meson_vclk.c                 |   8 +-
 drivers/gpu/drm/meson/meson_venc.c                 |   4 +-
 drivers/gpu/drm/nouveau/nvkm/core/firmware.c       |   9 +-
 drivers/gpu/drm/omapdrm/omap_dmm_tiler.c           |   1 +
 drivers/gpu/drm/panel/Kconfig                      |  21 ++
 drivers/gpu/drm/panel/Makefile                     |   2 +
 drivers/gpu/drm/panel/panel-abt-y030xx067a.c       | 363 +++++++++++++++++=
++++
 drivers/gpu/drm/panel/panel-samsung-s6e63m0-spi.c  |  40 ++-
 drivers/gpu/drm/panel/panel-samsung-s6e63m0.c      |   9 +
 drivers/gpu/drm/panel/panel-samsung-sofef00.c      | 351 +++++++++++++++++=
+++
 drivers/gpu/drm/panel/panel-tpo-tpg110.c           |   3 +-
 drivers/gpu/drm/panfrost/panfrost_device.c         |   1 -
 drivers/gpu/drm/panfrost/panfrost_device.h         |   6 +-
 drivers/gpu/drm/panfrost/panfrost_job.c            | 187 +++++++----
 drivers/gpu/drm/pl111/pl111_debugfs.c              |   2 +-
 drivers/gpu/drm/pl111/pl111_display.c              |   2 +-
 drivers/gpu/drm/qxl/qxl_drv.h                      |  18 +-
 drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c    |   4 +-
 drivers/gpu/drm/rockchip/rockchip_lvds.c           |   2 +-
 drivers/gpu/drm/rockchip/rockchip_rgb.c            |   1 +
 drivers/gpu/drm/savage/savage_bci.c                |  11 -
 drivers/gpu/drm/scheduler/sched_main.c             |   2 +-
 drivers/gpu/drm/selftests/test-drm_dp_mst_helper.c |  40 ++-
 drivers/gpu/drm/selftests/test-drm_framebuffer.c   |   3 +-
 drivers/gpu/drm/selftests/test-drm_mm.c            |   2 +-
 drivers/gpu/drm/sti/sti_hdmi.c                     |   6 +
 drivers/gpu/drm/sti/sti_hdmi.h                     |   6 -
 drivers/gpu/drm/ttm/ttm_bo.c                       |  23 +-
 drivers/gpu/drm/ttm/ttm_pool.c                     |   2 +-
 drivers/gpu/drm/ttm/ttm_range_manager.c            |   2 +-
 drivers/gpu/drm/ttm/ttm_tt.c                       |   4 +-
 drivers/gpu/drm/udl/udl_modeset.c                  |   4 +-
 drivers/gpu/drm/v3d/v3d_drv.c                      |  36 --
 drivers/gpu/drm/v3d/v3d_gem.c                      |   2 +
 drivers/gpu/drm/v3d/v3d_sched.c                    |   2 +-
 drivers/gpu/drm/vc4/vc4_bo.c                       |   2 +-
 drivers/gpu/drm/vc4/vc4_debugfs.c                  |   4 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c                     |   3 +-
 drivers/gpu/drm/vc4/vc4_hdmi_regs.h                |   6 +-
 drivers/gpu/drm/vc4/vc4_v3d.c                      |   4 +-
 drivers/gpu/drm/via/via_dma.c                      |   2 -
 drivers/gpu/drm/virtio/virtgpu_prime.c             |   2 +-
 drivers/usb/misc/sisusbvga/sisusb_con.c            |  21 --
 drivers/video/console/dummycon.c                   |  20 --
 drivers/video/console/sticore.c                    |   8 +-
 drivers/video/fbdev/atmel_lcdfb.c                  |   2 +-
 drivers/video/fbdev/core/bitblit.c                 |   3 -
 drivers/video/fbdev/core/fbcmap.c                  |   2 +-
 drivers/video/fbdev/core/fbcon.c                   | 113 ++-----
 drivers/video/fbdev/core/fbcon_ccw.c               |   1 -
 drivers/video/fbdev/core/fbcon_cw.c                |   1 -
 drivers/video/fbdev/core/fbcon_rotate.c            |   4 +-
 drivers/video/fbdev/core/fbcon_ud.c                |   1 -
 drivers/video/fbdev/core/softcursor.c              |   2 -
 drivers/video/fbdev/core/tileblit.c                |   6 +-
 drivers/video/hdmi.c                               |   3 +-
 include/drm/drm_atomic.h                           |   4 +-
 include/drm/drm_atomic_helper.h                    |   4 +-
 include/drm/drm_connector.h                        |   2 +-
 include/drm/drm_device.h                           |   2 +-
 include/drm/drm_dsc.h                              |   3 +-
 include/drm/drm_gem_vram_helper.h                  |   8 +-
 include/linux/console.h                            |   1 -
 include/linux/font.h                               |   1 +
 include/uapi/linux/kd.h                            |   2 +-
 include/uapi/linux/media-bus-format.h              |   3 +-
 lib/fonts/font_10x18.c                             |   1 +
 lib/fonts/font_6x10.c                              |   1 +
 lib/fonts/font_6x11.c                              |   1 +
 lib/fonts/font_6x8.c                               |   1 +
 lib/fonts/font_7x14.c                              |   1 +
 lib/fonts/font_8x16.c                              |   1 +
 lib/fonts/font_8x8.c                               |   1 +
 lib/fonts/font_acorn_8x8.c                         |   1 +
 lib/fonts/font_mini_4x6.c                          |   1 +
 lib/fonts/font_pearl_8x8.c                         |   1 +
 lib/fonts/font_sun12x22.c                          |   1 +
 lib/fonts/font_sun8x16.c                           |   1 +
 lib/fonts/font_ter16x32.c                          |   1 +
 125 files changed, 1313 insertions(+), 944 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/abt,y03=
0xx067a.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-abt-y030xx067a.c
 create mode 100644 drivers/gpu/drm/panel/panel-samsung-sofef00.c

--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=FCrnberg, Germany
(HRB 36809, AG N=FCrnberg)
Gesch=E4ftsf=FChrer: Felix Imend=F6rffer
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
