Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD05713252B
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2020 12:50:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AC2989D8D;
	Tue,  7 Jan 2020 11:50:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89CBE89350;
 Tue,  7 Jan 2020 11:50:18 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Jan 2020 03:50:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,406,1571727600"; d="scan'208";a="271478350"
Received: from unknown (HELO [10.249.36.43]) ([10.249.36.43])
 by FMSMGA003.fm.intel.com with ESMTP; 07 Jan 2020 03:50:15 -0800
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-next
Message-ID: <8eff1e3f-ef0a-2dd9-9a14-6273b1d6f963@linux.intel.com>
Date: Tue, 7 Jan 2020 12:50:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Language: en-US
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm-misc-next-2020-01-07:
drm-misc-next for v5.6:

UAPI Changes:
- Allow overriding number of bootup penguins in fbcon using fbcon=logo-count:n.

Cross-subsystem Changes:
- fbdev fixes for mmp, and make it work with CONFIG_COMPILE_TEST.
- Use devm_platform_ioremap_resource in fbdev drivers.
- Various small fbdev fixes.

Core Changes:
- Support scanline alignment for dumb buffers.
- Add atomic_check() hook to bridge ops, to support bus format negotiation.
- Add gem_create_object() to vram helpers.

Driver Changes:
- Rockchip: Add support for PX30.
- Use generic fbdev code and dumb helpers in hisilicon/hibmc.
- Add support for Leadtek LTK500HD1829 panel, and xinpeng XPP055C272.
- Clock fixes for atmel-hlcdc.
- Various smaller fixes to all drivers.
The following changes since commit f5c547efa16c0ea5abff0596e829f502be11902e:

  Merge tag 'drm-misc-next-2020-01-02' of git://anongit.freedesktop.org/drm/drm-misc into drm-next (2020-01-03 11:43:44 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-2020-01-07

for you to fetch changes up to 3cacb2086e41bbdf4a43e494d47d05db356992b9:

  drm/mgag200: Add module parameter to pin all buffers at offset 0 (2020-01-07 11:53:19 +0100)

----------------------------------------------------------------
drm-misc-next for v5.6:

UAPI Changes:
- Allow overriding number of bootup penguins in fbcon using fbcon=logo-count:n.

Cross-subsystem Changes:
- fbdev fixes for mmp, and make it work with CONFIG_COMPILE_TEST.
- Use devm_platform_ioremap_resource in fbdev drivers.
- Various small fbdev fixes.

Core Changes:
- Support scanline alignment for dumb buffers.
- Add atomic_check() hook to bridge ops, to support bus format negotiation.
- Add gem_create_object() to vram helpers.

Driver Changes:
- Rockchip: Add support for PX30.
- Use generic fbdev code and dumb helpers in hisilicon/hibmc.
- Add support for Leadtek LTK500HD1829 panel, and xinpeng XPP055C272.
- Clock fixes for atmel-hlcdc.
- Various smaller fixes to all drivers.

----------------------------------------------------------------
Andrew F. Davis (1):
      omapfb/dss: remove unneeded conversions to bool

Bartlomiej Zolnierkiewicz (3):
      video: fbdev: mmp: remove duplicated MMP_DISP dependency
      video: fbdev: mmp: add COMPILE_TEST support
      video: fbdev: mmp: fix sparse warnings about using incorrect types

Boris Brezillon (4):
      drm/bridge: Add a drm_bridge_state object
      drm/bridge: Patch atomic hooks to take a drm_bridge_state
      drm/bridge: Add an ->atomic_check() hook
      drm/bridge: Add the necessary bits to support bus format negotiation

Christophe JAILLET (1):
      pxa168fb: Fix the function used to release some memory in an error handling path

Claudiu Beznea (3):
      drm: atmel-hlcdc: use double rate for pixel clock only if supported
      drm: atmel-hlcdc: enable clock before configuring timing engine
      Revert "drm: atmel-hlcdc: enable sys_clk during initalization."

Colin Ian King (1):
      fbdev: matrox: make array wtst_xlat static const, makes object smaller

Geert Uytterhoeven (1):
      drm/mipi_dbi: Fix off-by-one bugs in mipi_dbi_blank()

Gustavo A. R. Silva (1):
      video: fbdev: fsl-diu-fb: mark expected switch fall-throughs

Heiko Stuebner (6):
      dt-bindings: Add vendor prefix for Xinpeng Technology
      dt-bindings: display: panel: Add binding document for Xinpeng XPP055C272
      drm/panel: add panel driver for Xinpeng XPP055C272 panels
      dt-bindings: Add vendor prefix for Leadtek Technology
      dt-bindings: display: panel: Add binding document for Leadtek LTK500HD1829
      drm/panel: add panel driver for Leadtek LTK500HD1829

Julia Lawall (1):
      drm: bridge: dw-hdmi: constify copied structure

Maarten Lankhorst (1):
      Merge drm/drm-next into drm-misc-next

Markus Elfring (2):
      video: ocfb: Use devm_platform_ioremap_resource() in ocfb_probe()
      video: pxafb: Use devm_platform_ioremap_resource() in pxafb_probe()

Miquel Raynal (9):
      dt-bindings: display: rockchip-lvds: Declare PX30 compatible
      dt-bindings: display: rockchip-lvds: Document PX30 PHY
      drm/rockchip: lvds: Fix indentation of a #define
      drm/rockchip: lvds: Harmonize function names
      drm/rockchip: lvds: Change platform data to hold helper_funcs pointer
      drm/rockchip: lvds: Create an RK3288 specific probe function
      drm/rockchip: lvds: improve error handling in helper functions
      drm/rockchip: lvds: move hardware-specific functions together
      drm/rockchip: lvds: Add PX30 support

Nickey Yang (1):
      drm: rockchip: rk3066_hdmi: set edid fifo address

Peter Rosin (4):
      fbdev: fix numbering of fbcon options
      fbdev: fbmem: allow overriding the number of bootup logos
      fbdev: fbmem: avoid exporting fb_center_logo
      drm: atmel-hlcdc: prefer a lower pixel-clock than requested

Sam Ravnborg (1):
      dt-bindings: fix warnings in xinpeng,xpp055c272.yaml

Souptick Joarder (1):
      video/fbdev/68328fb: Remove dead code

Thomas Zimmermann (9):
      drm/hisilicon/hibmc: Switch to generic fbdev emulation
      drm/hisilicon/hibmc: Replace struct hibmc_framebuffer with generic code
      drm/vram: Support scanline alignment for dumb buffers
      drm/hisilicon/hibmc: Implement hibmc_dumb_create() with generic helpers
      drm/hisilicon/hibmc: Export VRAM MM information to debugfs
      drm/vram-helper: Remove interruptible flag from public interface
      drm/vram-helper: Remove BO device from public interface
      drm/vram-helper: Support struct drm_driver.gem_create_object
      drm/mgag200: Add module parameter to pin all buffers at offset 0

YueHaibing (3):
      fbdev: omapfb: use devm_platform_ioremap_resource() to simplify code
      fbdev: s3c-fb: use devm_platform_ioremap_resource() to simplify code
      fbdev/sa1100fb: use devm_platform_ioremap_resource() to simplify code

yu kuai (2):
      drm/bridge: cdns: remove set but not used variable 'bpp'
      drm/bridge: cdns: remove set but not used variable 'nlanes'

zhengbin (1):
      drm: meson: Remove unneeded semicolon

 .../display/panel/leadtek,ltk500hd1829.yaml        |  49 ++
 .../bindings/display/panel/xinpeng,xpp055c272.yaml |  49 ++
 .../bindings/display/rockchip/rockchip-lvds.txt    |   4 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   4 +
 Documentation/fb/fbcon.rst                         |  13 +-
 drivers/gpu/drm/ast/ast_mode.c                     |   3 +-
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c     |  18 +-
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c       |  19 +-
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c |  41 +-
 drivers/gpu/drm/bridge/cdns-dsi.c                  |   6 +-
 .../gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c    |   2 +-
 drivers/gpu/drm/drm_atomic.c                       |  39 ++
 drivers/gpu/drm/drm_atomic_helper.c                |  32 +-
 drivers/gpu/drm/drm_bridge.c                       | 527 +++++++++++++++++++-
 drivers/gpu/drm/drm_gem_vram_helper.c              |  53 +-
 drivers/gpu/drm/drm_mipi_dbi.c                     |   4 +-
 drivers/gpu/drm/hisilicon/hibmc/Makefile           |   2 +-
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c     |   4 +-
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c    |   6 +-
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h    |  26 -
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_fbdev.c  | 240 ----------
 drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c        | 116 +----
 drivers/gpu/drm/meson/meson_crtc.c                 |   2 +-
 drivers/gpu/drm/meson/meson_plane.c                |   2 +-
 drivers/gpu/drm/mgag200/mgag200_cursor.c           |   3 +-
 drivers/gpu/drm/mgag200/mgag200_drv.c              |  17 +-
 drivers/gpu/drm/panel/Kconfig                      |  21 +
 drivers/gpu/drm/panel/Makefile                     |   2 +
 drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c | 531 +++++++++++++++++++++
 drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c   | 398 +++++++++++++++
 drivers/gpu/drm/rcar-du/rcar_lvds.c                |   8 +-
 drivers/gpu/drm/rockchip/rk3066_hdmi.c             |   3 +
 drivers/gpu/drm/rockchip/rockchip_lvds.c           | 488 +++++++++++++------
 drivers/gpu/drm/rockchip/rockchip_lvds.h           |  19 +-
 drivers/video/fbdev/68328fb.c                      |  12 -
 drivers/video/fbdev/core/fbcon.c                   |   7 +
 drivers/video/fbdev/core/fbmem.c                   |  13 +-
 drivers/video/fbdev/fsl-diu-fb.c                   |   2 +
 drivers/video/fbdev/matrox/matroxfb_misc.c         |   5 +-
 drivers/video/fbdev/mmp/Kconfig                    |   2 +-
 drivers/video/fbdev/mmp/fb/Kconfig                 |   4 -
 drivers/video/fbdev/mmp/fb/mmpfb.c                 |   2 +-
 drivers/video/fbdev/mmp/hw/Kconfig                 |   7 +-
 drivers/video/fbdev/mmp/hw/mmp_ctrl.c              |  57 ++-
 drivers/video/fbdev/mmp/hw/mmp_ctrl.h              |  10 +-
 drivers/video/fbdev/mmp/hw/mmp_spi.c               |   6 +-
 drivers/video/fbdev/ocfb.c                         |   9 +-
 drivers/video/fbdev/omap2/omapfb/dss/dispc.c       |   6 +-
 drivers/video/fbdev/omap2/omapfb/vrfb.c            |   4 +-
 drivers/video/fbdev/pxa168fb.c                     |   6 +-
 drivers/video/fbdev/pxafb.c                        |  10 +-
 drivers/video/fbdev/s3c-fb.c                       |   3 +-
 drivers/video/fbdev/sa1100fb.c                     |   4 +-
 include/drm/drm_atomic.h                           |   3 +
 include/drm/drm_bridge.h                           | 275 ++++++++++-
 include/drm/drm_gem_vram_helper.h                  |   7 +-
 include/linux/fb.h                                 |   1 +
 57 files changed, 2454 insertions(+), 752 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/leadtek,ltk500hd1829.yaml
 create mode 100644 Documentation/devicetree/bindings/display/panel/xinpeng,xpp055c272.yaml
 delete mode 100644 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_fbdev.c
 create mode 100644 drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c
 create mode 100644 drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
