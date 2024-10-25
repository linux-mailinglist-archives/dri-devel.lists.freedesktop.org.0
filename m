Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F469AFE32
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 11:30:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECF4F10EA49;
	Fri, 25 Oct 2024 09:30:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EclHZjyZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57E2B10EA47;
 Fri, 25 Oct 2024 09:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729848614; x=1761384614;
 h=message-id:date:mime-version:from:to:cc:subject:
 content-transfer-encoding;
 bh=MLPbtr+Kqh0AfabOMII7RyrjvgNXimfHir0Z4szYJEY=;
 b=EclHZjyZ59aeG/q4Sclci+WvGlQ+myeeZrBy2Znb2AwFP0VzomEoSqVq
 2dtv1JPcyuHx7nOFLa1NS7zWqLeDLjzDnLfbyS04fytEmpHQ0idoGHkJg
 /rvgB3FauswZrnApPINTNRj3TGM51ollAlAafF0XrP6UCGf8jUGz69jhl
 dUZoI7dTiUehmSjbiGK8fkWsvilTWXySiuUX9qSCiCGmzh79p42dRns1K
 1gL+rlQD/7NGSXbWQCck23CzdWtl0oaBkmPoaBBKnAPFr73iyDbclMx1I
 LO8c+JUObht+Dij++LCICwN0qS/dUTXOWHoAQ5h+8kvirsLnL8DXlpt+j w==;
X-CSE-ConnectionGUID: Y+eSuFF+SqmVizvztDitow==
X-CSE-MsgGUID: u8nXFhfZT4Gif/WMU3mlCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="33204045"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="33204045"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2024 02:30:13 -0700
X-CSE-ConnectionGUID: gh9bh76iQcCik3CsVITf+w==
X-CSE-MsgGUID: lLSF7RjPQjiu5ICBVKr5/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; d="scan'208";a="85967743"
Received: from opintica-mobl1 (HELO [10.245.244.181]) ([10.245.244.181])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2024 02:30:08 -0700
Message-ID: <2d42f0f2-a1f9-473c-bd0c-ea3df77b6a3a@linux.intel.com>
Date: Fri, 25 Oct 2024 11:30:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Simona Vetter <simona.vetter@ffwll.ch>, Dave Airlie <airlied@gmail.com>
Cc: dim-tools@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>, Oded Gabbay
 <ogabbay@kernel.org>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>
Subject: [PULL] drm-misc-next
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave, Simona,

A bit late, but here it is!

drm-misc-next-2024-10-25:
drm-misc-next for v6.13:

UAPI Changes:

Cross-subsystem Changes:
- Add DT bindings for Sharp Memory LCD.
- Update DT bindings for tc358768.

Core Changes:
- Make the fbdev emulations a drm-client.
- Add a drm-client lib module.
- drm/display no longer needs COMPILE_TEST dep.
- Build fix for !CONFIG_FB_DEFERRED_IO.
- Small fixes to sched.
- Add YCbCr420 output support for drm/bridge, use it in msm/dp.

Driver Changes:
- Kconfig and driver changes for drm-client.
- Assorted small fixes to a lot of drivers.
- Constify regmap config/bus.
- Add Microchip AC69T88A panel.
- Build meson, mediatek and imx/dcss drivers on x86 when COMPILE_TEST is set.
The following changes since commit 134e71bd1edcc7252b64ca31efe88edfef86d784:

  drm/sched: Further optimise drm_sched_entity_push_job (2024-10-17 12:20:06 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-next-2024-10-25

for you to fetch changes up to d4e4e498bec6c16d303ff55c0211d5c11e81e379:

  drm/meson: Allow build with COMPILE_TEST=y (2024-10-25 10:25:10 +0300)

----------------------------------------------------------------
drm-misc-next for v6.13:

UAPI Changes:

Cross-subsystem Changes:
- Add DT bindings for Sharp Memory LCD.
- Update DT bindings for tc358768.

Core Changes:
- Make the fbdev emulations a drm-client.
- Add a drm-client lib module.
- drm/display no longer needs COMPILE_TEST dep.
- Build fix for !CONFIG_FB_DEFERRED_IO.
- Small fixes to sched.
- Add YCbCr420 output support for drm/bridge, use it in msm/dp.

Driver Changes:
- Kconfig and driver changes for drm-client.
- Assorted small fixes to a lot of drivers.
- Constify regmap config/bus.
- Add Microchip AC69T88A panel.
- Build meson, mediatek and imx/dcss drivers on x86 when COMPILE_TEST is set.

----------------------------------------------------------------
Alex Lanzano (2):
      dt-bindings: display: Add Sharp Memory LCD bindings
      drm/tiny: Add driver for Sharp Memory LCD

Alexander Stein (1):
      drm: fsl-dcu: Use dev_err_probe

Arnd Bergmann (2):
      drm/imx: parallel-display: add legacy bridge Kconfig dependency
      drm/imx: legacy-bridge: add MODULE_DESCRIPTION

Chen Ni (1):
      drm/fsl-dcu: Remove redundant dev_err()

Cristian Ciocaltea (3):
      drm/bridge: synopsys: Add DW HDMI QP TX Controller support library
      dt-bindings: display: rockchip: Add schema for RK3588 HDMI TX Controller
      drm/rockchip: Add basic RK3588 HDMI output support

Dmitry Baryshkov (7):
      drm/fbdev: fix drm_fb_helper_deferred_io() build failure
      drm/display: bridge_connector: handle ycbcr_420_allowed
      drm/atomic: add interlaced and ycbcr_420 flags to connector's state dump
      drm/bridge: display-connector: allow YCbCr 420 for HDMI and DP
      drm/bridge: aux: allow interlaced and YCbCr 420 output
      drm/msm/dp: migrate the ycbcr_420_allowed to drm_bridge
      drm/bridge: dw-hdmi: set bridge's ycbcr_420_allowed flag

Dzmitry Sankouski (1):
      drm/panel: s6e3ha8: add static modifier to supply list

Javier Carrasco (6):
      drm/bridge: dpc3433: Constify struct regmap_config
      drm/fsl-dcu: Constify struct regmap_config
      drm/mediatek: dp: Constify struct regmap_config
      drm/meson: Constify struct regmap_config
      drm/panel: ili9322: Constify struct regmap_bus
      drm/sprd: Constify struct regmap_bus

Jean Delvare (1):
      drm/display: Drop obsolete dependency on COMPILE_TEST

Krzysztof Kozlowski (3):
      drm/meson: drop unused static dw_hdmi_dwc_write_bits
      dt-bindings: display: bridge: tc358768: switch to bus-width
      drm/bridge: tc358768: switch to bus-width

Liu Ying (1):
      drm/bridge: ite-it66121: Drop hdmi_avi_infoframe_init() function call

Manikandan Muralidharan (2):
      dt-bindings: display: panel-simple: Document support for Microchip AC69T88A
      drm/panel: simple: Add Microchip AC69T88A LVDS Display panel

Matthias Schiffer (1):
      drm: fsl-dcu: enable PIXCLK on LS1021A

Philipp Stanner (1):
      drm/sched: memset() 'job' in drm_sched_job_init()

Randy Dunlap (1):
      drm/fbdev-dma: remove obsolete kernel-doc references

Ryan Walklin (1):
      drm: panel: nv3052c: correct spi_device_id for RG35XX panel

Simon Horman (1):
      accel/qaic: Pass string literal as format argument of alloc_workqueue()

Thomas Zimmermann (11):
      drm/i915: Select DRM_CLIENT_SELECTION
      drm/xe: Select DRM_CLIENT_SELECTION
      drm/fbdev-dma: Select FB_DEFERRED_IO
      drm/fbdev: Select fbdev I/O helpers from modules that require them
      drm/client: Move client event handlers to drm_client_event.c
      drm/client: Move suspend/resume into DRM client callbacks
      drm/amdgpu: Suspend and resume internal clients with client helpers
      drm/nouveau: Suspend and resume clients with client helpers
      drm/radeon: Suspend and resume clients with client helpers
      drm/client: Make client support optional
      drm/client: Add client-lib module

Ville Syrjälä (4):
      drm/imx/dcss: Fix 64bit divisions
      drm/imx/dcss: Allow build with COMPILE_TEST=y
      drm/mediatek: Allow build with COMPILE_TEST=y
      drm/meson: Allow build with COMPILE_TEST=y

Wadim Egorov (2):
      dt-bindings: display: bridge: sil,sii9022: Add bus-width
      drm/bridge: sii902x: Set input bus format based on bus-width

 .../bindings/display/bridge/sil,sii9022.yaml       |  15 +-
 .../bindings/display/bridge/toshiba,tc358768.yaml  |   4 +
 .../bindings/display/panel/panel-simple.yaml       |   2 +
 .../rockchip/rockchip,rk3588-dw-hdmi-qp.yaml       | 188 +++++
 .../bindings/display/sharp,ls010b7dh04.yaml        |  92 +++
 Documentation/gpu/drm-client.rst                   |   3 +
 Documentation/gpu/drm-kms-helpers.rst              |   9 -
 MAINTAINERS                                        |   6 +
 drivers/accel/qaic/qaic_drv.c                      |   4 +-
 drivers/gpu/drm/Kconfig                            |  41 +-
 drivers/gpu/drm/Makefile                           |  20 +-
 drivers/gpu/drm/amd/amdgpu/Kconfig                 |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  22 +-
 drivers/gpu/drm/bridge/aux-bridge.c                |   4 +
 drivers/gpu/drm/bridge/aux-hpd-bridge.c            |   4 +
 drivers/gpu/drm/bridge/display-connector.c         |   4 +
 drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c     |   1 +
 drivers/gpu/drm/bridge/ite-it66121.c               |   2 -
 drivers/gpu/drm/bridge/sii902x.c                   |  24 +-
 drivers/gpu/drm/bridge/synopsys/Kconfig            |   8 +
 drivers/gpu/drm/bridge/synopsys/Makefile           |   2 +
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c       | 647 ++++++++++++++++
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.h       | 834 +++++++++++++++++++++
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c          |   3 +
 drivers/gpu/drm/bridge/tc358768.c                  |   4 +-
 drivers/gpu/drm/bridge/ti-dlpc3433.c               |   2 +-
 drivers/gpu/drm/display/Kconfig                    |   2 +-
 drivers/gpu/drm/display/drm_bridge_connector.c     |   6 +-
 drivers/gpu/drm/drm_atomic.c                       |   2 +
 drivers/gpu/drm/drm_client.c                       | 121 ---
 drivers/gpu/drm/drm_client_event.c                 | 197 +++++
 drivers/gpu/drm/drm_client_setup.c                 |   3 +
 drivers/gpu/drm/drm_debugfs.c                      |   1 -
 drivers/gpu/drm/drm_drv.c                          |   2 +-
 drivers/gpu/drm/drm_fb_helper.c                    |   2 +
 drivers/gpu/drm/drm_fbdev_client.c                 |  30 +-
 drivers/gpu/drm/drm_file.c                         |   2 +-
 drivers/gpu/drm/drm_internal.h                     |   8 +
 drivers/gpu/drm/drm_modeset_helper.c               |  14 +-
 drivers/gpu/drm/drm_probe_helper.c                 |   2 +-
 drivers/gpu/drm/fsl-dcu/Kconfig                    |   1 +
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c          |  23 +-
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.h          |   3 +
 drivers/gpu/drm/fsl-dcu/fsl_tcon.c                 |   2 +-
 drivers/gpu/drm/i915/Kconfig                       |   1 +
 .../gpu/drm/i915/display/intel_display_driver.c    |   2 +-
 drivers/gpu/drm/imx/dcss/Kconfig                   |   2 +-
 drivers/gpu/drm/imx/dcss/dcss-scaler.c             |   4 +-
 drivers/gpu/drm/imx/ipuv3/Kconfig                  |   1 +
 drivers/gpu/drm/mediatek/Kconfig                   |   4 +-
 drivers/gpu/drm/mediatek/mtk_dp.c                  |   2 +-
 drivers/gpu/drm/meson/Kconfig                      |   2 +-
 drivers/gpu/drm/meson/meson_drv.c                  |   2 +-
 drivers/gpu/drm/meson/meson_dw_hdmi.c              |  14 -
 drivers/gpu/drm/msm/Kconfig                        |   1 +
 drivers/gpu/drm/msm/dp/dp_display.c                |   4 +-
 drivers/gpu/drm/msm/dp/dp_drm.c                    |  10 +-
 drivers/gpu/drm/msm/dp/dp_drm.h                    |   7 +-
 drivers/gpu/drm/nouveau/nouveau_display.c          |   8 +-
 drivers/gpu/drm/nouveau/nouveau_vga.c              |   2 +-
 drivers/gpu/drm/panel/panel-ilitek-ili9322.c       |   2 +-
 drivers/gpu/drm/panel/panel-newvision-nv3052c.c    |   2 +-
 drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c      |   2 +-
 drivers/gpu/drm/panel/panel-simple.c               |  28 +
 drivers/gpu/drm/radeon/radeon_device.c             |  19 +-
 drivers/gpu/drm/radeon/radeon_fbdev.c              |   6 -
 drivers/gpu/drm/radeon/radeon_mode.h               |   3 -
 drivers/gpu/drm/rockchip/Kconfig                   |   9 +
 drivers/gpu/drm/rockchip/Makefile                  |   1 +
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c     | 424 +++++++++++
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c        |   2 +
 drivers/gpu/drm/rockchip/rockchip_drm_drv.h        |   1 +
 drivers/gpu/drm/scheduler/sched_main.c             |   8 +
 drivers/gpu/drm/sprd/sprd_dsi.c                    |   2 +-
 drivers/gpu/drm/tiny/Kconfig                       |  21 +
 drivers/gpu/drm/tiny/Makefile                      |   1 +
 drivers/gpu/drm/tiny/sharp-memory.c                | 671 +++++++++++++++++
 drivers/gpu/drm/xe/Kconfig                         |   1 +
 include/drm/bridge/dw_hdmi_qp.h                    |  32 +
 include/drm/drm_bridge.h                           |   5 +
 include/drm/drm_client.h                           |  41 +-
 include/drm/drm_client_event.h                     |  27 +
 include/drm/drm_fb_helper.h                        |   4 +
 83 files changed, 3492 insertions(+), 253 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip,rk3588-dw-hdmi-qp.yaml
 create mode 100644 Documentation/devicetree/bindings/display/sharp,ls010b7dh04.yaml
 create mode 100644 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
 create mode 100644 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.h
 create mode 100644 drivers/gpu/drm/drm_client_event.c
 create mode 100644 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
 create mode 100644 drivers/gpu/drm/tiny/sharp-memory.c
 create mode 100644 include/drm/bridge/dw_hdmi_qp.h
 create mode 100644 include/drm/drm_client_event.h
