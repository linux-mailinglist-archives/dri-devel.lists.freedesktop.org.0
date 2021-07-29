Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 461403DADF3
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 22:57:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E47896EE72;
	Thu, 29 Jul 2021 20:57:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 483876EE6F;
 Thu, 29 Jul 2021 20:57:35 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10060"; a="234873760"
X-IronPort-AV: E=Sophos;i="5.84,279,1620716400"; d="scan'208";a="234873760"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2021 13:57:34 -0700
X-IronPort-AV: E=Sophos;i="5.84,279,1620716400"; d="scan'208";a="476607717"
Received: from dbailonh-mobl.ger.corp.intel.com (HELO [10.249.34.58])
 ([10.249.34.58])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2021 13:57:32 -0700
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-next
Message-ID: <a753221a-e23e-0dc4-7ca6-8c1b179738d0@linux.intel.com>
Date: Thu, 29 Jul 2021 22:57:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm-misc-next-2021-07-29:
drm-misc-next for v5.15:

UAPI Changes:
- Add modifiers for arm fixed rate compression.

Cross-subsystem Changes:
- Assorted dt binding fixes.
- Convert ssd1307fb to json-schema.
- Update a lot of irc channels to point to OFTC, as everyone moved there.
- Fix the same divide by zero for asilantfb, kyro, rivafb.

Core Changes:
- Document requirements for new atomic properties.
- Add drm_gem_fb_(begin/end)_cpu_access helpers, and use them in some drivers.
- Document drm_property_enum.value for bitfields.
- Add explicit _NO_ for MIPI_DSI flags that disable features.
- Assorted documentation fixes.
- Update fb_damage handling, and move drm_plane_enable_fb_damage_clips to core.
- Add logging and docs to RMFB ioctl.
- Assorted small fixes to dp_mst, master handling.
- Clarify drm lease usage.

Driver Changes:
- Assorted small fixes to panfrost, hibmc, bridge/nwl-dsi, rockchip, vc4.
- More drm -> linux irq conversions.
- Add support for some Logic Technologies and Multi-Inno panels.
- Expose phy-functionality for drm/rockchip, to allow controlling from the media subsystem.
- Add support for 2 AUO panels.
- Add damage handling to ssd1307fb.
- Improve FIFO handling on mxsfb.
- Assorted small fixes to vmwgfx, and bump version to 2.19 for the new ioctls.
- Improve sony acx424akp backlight handling.
The following changes since commit 15d27b15de965043d6f8e23bc7f34386fcd1a772:

  efi: sysfb_efi: fix build when EFI is not set (2021-07-27 11:52:51 +0200)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-2021-07-29

for you to fetch changes up to c7d30623540b6e979d7e8647fab18feab4688808:

  drm/vc4: hdmi: Remove unused struct (2021-07-29 10:41:16 +0200)

----------------------------------------------------------------
drm-misc-next for v5.15:

UAPI Changes:
- Add modifiers for arm fixed rate compression.

Cross-subsystem Changes:
- Assorted dt binding fixes.
- Convert ssd1307fb to json-schema.
- Update a lot of irc channels to point to OFTC, as everyone moved there.
- Fix the same divide by zero for asilantfb, kyro, rivafb.

Core Changes:
- Document requirements for new atomic properties.
- Add drm_gem_fb_(begin/end)_cpu_access helpers, and use them in some drivers.
- Document drm_property_enum.value for bitfields.
- Add explicit _NO_ for MIPI_DSI flags that disable features.
- Assorted documentation fixes.
- Update fb_damage handling, and move drm_plane_enable_fb_damage_clips to core.
- Add logging and docs to RMFB ioctl.
- Assorted small fixes to dp_mst, master handling.
- Clarify drm lease usage.

Driver Changes:
- Assorted small fixes to panfrost, hibmc, bridge/nwl-dsi, rockchip, vc4.
- More drm -> linux irq conversions.
- Add support for some Logic Technologies and Multi-Inno panels.
- Expose phy-functionality for drm/rockchip, to allow controlling from the media subsystem.
- Add support for 2 AUO panels.
- Add damage handling to ssd1307fb.
- Improve FIFO handling on mxsfb.
- Assorted small fixes to vmwgfx, and bump version to 2.19 for the new ioctls.
- Improve sony acx424akp backlight handling.

----------------------------------------------------------------
Alexander Sverdlin (1):
      video: ep93xx: Prepare clock before using it

Alyssa Rosenzweig (2):
      documentation: Update #nouveau IRC channel network
      maintainers: Update freedesktop.org IRC channels

Artjom Vejsel (1):
      dt-bindings: Add QiShenglong vendor prefix

Bjorn Andersson (2):
      dt-bindings: display: simple: Add AUO B133HAN05 & B140HAN06
      drm/panel: simple: Add support for two more AUO panels

Chris Morgan (1):
      drm/panfrost: devfreq: Don't display error for EPROBE_DEFER

Daniel Vetter (3):
      drm/plane: remove drm_helper_get_plane_damage_clips
      drm/plane: check that fb_damage is set up when used
      drm/plane: Move drm_plane_enable_fb_damage_clips into core

Desmond Cheong Zhi Xi (2):
      drm: use the lookup lock in drm_is_current_master
      drm: clarify usage of drm leases

Geert Uytterhoeven (7):
      drm/bridge: nwl-dsi: Avoid potential multiplication overflow on 32-bit
      dt-bindings: display: ssd1307fb: Convert to json-schema
      video: fbdev: ssd1307fb: Propagate errors via ssd1307fb_update_display()
      video: fbdev: ssd1307fb: Simplify ssd1307fb_update_display()
      video: fbdev: ssd1307fb: Extract ssd1307fb_set_{col,page}_range()
      video: fbdev: ssd1307fb: Optimize screen updates
      video: fbdev: ssd1307fb: Cache address ranges

Heiko Stuebner (3):
      drm/rockchip: dsi: add own additional pclk handling
      dt-bindings: display: rockchip-dsi: add optional #phy-cells property
      drm/rockchip: dsi: add ability to work as a phy instead of full dsi

Jagan Teki (1):
      drm/bridge: dw-mipi-dsi: Find the possible DSI devices

Jose Maria Casanova Crespo (1):
      drm/prime: fix comment on PRIME Helpers

Linus Walleij (1):
      drm/panel-sony-acx424akp: Modernize backlight handling

Maarten Lankhorst (1):
      Backmerge remote-tracking branch 'drm/drm-next' into drm-misc-next

Marek Vasut (4):
      drm: mxsfb: Enable recovery on underflow
      drm: mxsfb: Increase number of outstanding requests on V4 and newer HW
      drm: mxsfb: Use bus_format from the nearest bridge if present
      drm: mxsfb: Clear FIFO_CLEAR bit

Maxime Ripard (3):
      Documentation: gpu: Mention the requirements for new properties
      drm/vc4: hdmi: Remove redundant variables
      drm/vc4: hdmi: Remove unused struct

Nicolas Boichat (1):
      drm/dsi: Add _NO_ to MIPI_DSI_* flags disabling features

Normunds Rieksts (1):
      drm/fourcc: Add modifier definitions for Arm Fixed Rate Compression

Oleksij Rempel (1):
      dt-bindings: display: simple: add some Logic Technologies and Multi-Inno panels

Rajkumar Subbiah (1):
      drm/dp_mst: Fix return code on sideband message failure

Simon Ser (3):
      drm: document drm_property_enum.value for bitfields
      drm: add logging for RMFB ioctl
      drm: document DRM_IOCTL_MODE_RMFB

Thomas Zimmermann (9):
      drm/hisilicon/hibmc: Remove variable 'priv' from hibmc_unload()
      drm/gem: Provide drm_gem_fb_{begin,end}_cpu_access() helpers
      drm/udl: Use framebuffer dma-buf helpers
      drm/mipi-dbi: Use framebuffer dma-buf helpers
      drm/gud: Use framebuffer dma-buf helpers
      drm/gm12u320: Use framebuffer dma-buf helpers
      drm/repaper: Use framebuffer dma-buf helpers
      drm/st7586: Use framebuffer dma-buf helpers
      drm/shmobile: Convert to Linux IRQ interfaces

Zack Rusin (4):
      drm/vmwgfx: Switch to using DRM_IOCTL_DEF_DRV
      drm/vmwgfx: Cleanup logging
      drm/vmwgfx: Be a lot more flexible with MOB limits
      drm/vmwgfx: Use 2.19 version number to recognize mks-stats ioctls

Zheyu Ma (3):
      video: fbdev: asiliantfb: Error out if 'pixclock' equals zero
      video: fbdev: kyro: Error out if 'pixclock' equals zero
      video: fbdev: riva: Error out if 'pixclock' equals zero

 .../bindings/display/panel/panel-simple.yaml       |  10 +
 .../display/rockchip/dw_mipi_dsi_rockchip.txt      |   1 +
 .../bindings/display/solomon,ssd1307fb.yaml        | 208 +++++++++++
 .../devicetree/bindings/display/ssd1307fb.txt      |  60 ---
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 .../driver-api/thermal/nouveau_thermal.rst         |   2 +-
 Documentation/gpu/drm-kms.rst                      |  33 +-
 Documentation/gpu/drm-uapi.rst                     |   9 +
 MAINTAINERS                                        |   6 +-
 drivers/gpu/drm/bridge/adv7511/adv7533.c           |   2 +-
 drivers/gpu/drm/bridge/analogix/anx7625.c          |   2 +-
 drivers/gpu/drm/bridge/cdns-dsi.c                  |   4 +-
 drivers/gpu/drm/bridge/lontium-lt8912b.c           |   2 +-
 drivers/gpu/drm/bridge/nwl-dsi.c                   |   2 +-
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c      |  58 ++-
 drivers/gpu/drm/bridge/tc358768.c                  |   2 +-
 drivers/gpu/drm/drm_atomic.c                       |   2 +-
 drivers/gpu/drm/drm_auth.c                         |   9 +-
 drivers/gpu/drm/drm_crtc_internal.h                |   2 +
 drivers/gpu/drm/drm_damage_helper.c                |  56 +--
 drivers/gpu/drm/drm_dp_mst_topology.c              |  10 +-
 drivers/gpu/drm/drm_framebuffer.c                  |  22 +-
 drivers/gpu/drm/drm_gem_framebuffer_helper.c       |  89 +++++
 drivers/gpu/drm/drm_lease.c                        |  51 +++
 drivers/gpu/drm/drm_mipi_dbi.c                     |  20 +-
 drivers/gpu/drm/drm_plane.c                        | 104 ++++++
 drivers/gpu/drm/drm_prime.c                        |   2 +-
 drivers/gpu/drm/exynos/exynos_drm_dsi.c            |   8 +-
 drivers/gpu/drm/gud/gud_pipe.c                     |  13 +-
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c    |   1 -
 drivers/gpu/drm/mcde/mcde_dsi.c                    |   2 +-
 drivers/gpu/drm/mediatek/mtk_dsi.c                 |   4 +-
 drivers/gpu/drm/msm/dsi/dsi_host.c                 |   8 +-
 drivers/gpu/drm/mxsfb/mxsfb_drv.c                  |   3 +
 drivers/gpu/drm/mxsfb/mxsfb_drv.h                  |   1 +
 drivers/gpu/drm/mxsfb/mxsfb_kms.c                  |  72 +++-
 drivers/gpu/drm/mxsfb/mxsfb_regs.h                 |   9 +
 .../gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c   |   2 +-
 drivers/gpu/drm/panel/panel-dsi-cm.c               |   2 +-
 drivers/gpu/drm/panel/panel-elida-kd35t133.c       |   2 +-
 drivers/gpu/drm/panel/panel-khadas-ts050.c         |   2 +-
 drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c |   2 +-
 drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c |   2 +-
 drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c |   2 +-
 drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c   |   2 +-
 drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c      |   4 +-
 drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c    |   2 +-
 drivers/gpu/drm/panel/panel-simple.c               |  68 +++-
 drivers/gpu/drm/panel/panel-sony-acx424akp.c       |  82 ++--
 drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c   |   2 +-
 drivers/gpu/drm/panfrost/panfrost_devfreq.c        |   3 +-
 drivers/gpu/drm/rockchip/Kconfig                   |   2 +
 drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c    | 349 +++++++++++++++++
 drivers/gpu/drm/shmobile/shmob_drm_drv.c           |  14 +-
 drivers/gpu/drm/shmobile/shmob_drm_drv.h           |   1 +
 drivers/gpu/drm/tiny/gm12u320.c                    |  19 +-
 drivers/gpu/drm/tiny/repaper.c                     |  18 +-
 drivers/gpu/drm/tiny/st7586.c                      |  18 +-
 drivers/gpu/drm/udl/udl_modeset.c                  |  29 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c                     |  38 +-
 drivers/gpu/drm/vc4/vc4_hdmi.h                     |   2 -
 drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c                |   3 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c             |   3 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c                | 411 +++++++++++----------
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h                |   9 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c      |  36 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c                |  10 +
 drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c                |   5 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c               |   4 -
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c               |   5 +-
 drivers/video/fbdev/asiliantfb.c                   |   3 +
 drivers/video/fbdev/ep93xx-fb.c                    |   4 +-
 drivers/video/fbdev/kyro/fbdev.c                   |   3 +
 drivers/video/fbdev/riva/fbdev.c                   |   3 +
 drivers/video/fbdev/ssd1307fb.c                    | 151 +++++---
 include/drm/drm_auth.h                             |  67 +++-
 include/drm/drm_damage_helper.h                    |  18 -
 include/drm/drm_gem_framebuffer_helper.h           |   6 +
 include/drm/drm_mipi_dsi.h                         |   8 +-
 include/drm/drm_plane.h                            |  39 +-
 include/drm/drm_property.h                         |   9 +-
 include/drm/drm_rect.h                             |   3 +
 include/uapi/drm/drm.h                             |  10 +
 include/uapi/drm/drm_fourcc.h                      | 109 +++++-
 84 files changed, 1797 insertions(+), 680 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/ssd1307fb.txt
