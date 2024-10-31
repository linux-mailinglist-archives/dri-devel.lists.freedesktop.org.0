Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2118D9B7BE6
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2024 14:41:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05B1E10E88F;
	Thu, 31 Oct 2024 13:41:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iYIDbIRU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E73310E88F;
 Thu, 31 Oct 2024 13:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730382105; x=1761918105;
 h=message-id:date:mime-version:from:to:cc:subject:
 content-transfer-encoding;
 bh=yqRpyqv/BaHvdtzDi5nTauq7celDweVL23RuUu8Ekkg=;
 b=iYIDbIRURerMJA/rs3xg8zaBkPu95bp//jg7qFmkuh0csGZVH1gmvtPO
 KJ1Jz01bQVS5Y4/MsEetDxxNs8kxjyXJiOIhi/BSNX1egIpIj2DRrjkbm
 t+wOxf9dEgdfaCcUdEVxoxf6kB04QP2yA8Cd55Fy9IV4ZSORyM1WZV2MQ
 VGFAP0x5b4RK+r3dNGo4v3eOuB4Rx1OsP/gxw8lNfxhlxyelf37tARaeV
 97xGvSZTid4P/ZWnWshiBqW5ZeN77H9ZB2K/r93wMgWSsKc1SDc4ShddG
 bPxfG/77LjIA1kvSV5FSN0TyaCVqX0XBnhdUZ42dTplouYDwa7ntBIqRr w==;
X-CSE-ConnectionGUID: rljNKUBUSfCiorAHxIoxZQ==
X-CSE-MsgGUID: O9/OjgzCRv2/Sr/sgLtgXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30283859"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="30283859"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2024 06:41:44 -0700
X-CSE-ConnectionGUID: 0Ucz+OJDQaifcCRHm0s+eg==
X-CSE-MsgGUID: drZH38MTQKiRecziz/B3ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="87419171"
Received: from fpallare-mobl3.ger.corp.intel.com (HELO [10.245.245.197])
 ([10.245.245.197])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2024 06:41:40 -0700
Message-ID: <deeef745-f3fb-4e85-a9d0-e8d38d43c1cf@linux.intel.com>
Date: Thu, 31 Oct 2024 14:41:38 +0100
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
Content-Type: text/plain; charset=UTF-8; format=flowed
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

drm-misc-next-2024-10-31:
drm-misc-next for v6.13:

All of the previous pull request, with MORE!

Core Changes:
- Update documentation for scheduler start/stop and job init.
- Add dedede and sm8350-hdk hardware to ci runs.

Driver Changes:
- Small fixes and cleanups to panfrost, omap, nouveau, ivpu, zynqmp, v3d,
   panthor docs, and leadtek-ltk050h3146w.
- Crashdump support for qaic.
- Support DP compliance in zynqmp.
- Add Samsung S6E88A0-AMS427AP24 panel.
The following changes since commit 134e71bd1edcc7252b64ca31efe88edfef86d784:

   drm/sched: Further optimise drm_sched_entity_push_job (2024-10-17 
12:20:06 +0200)

are available in the Git repository at:

   https://gitlab.freedesktop.org/drm/misc/kernel.git 
tags/drm-misc-next-2024-10-31

for you to fetch changes up to 2e0757012cf4f3c29a671f0981f9aa853a96def6:

   drm/sched: Document purpose of drm_sched_{start,stop} (2024-10-31 
12:48:49 +0100)

----------------------------------------------------------------
drm-misc-next for v6.13:

All of the previous pull request, with MORE!

Core Changes:
- Update documentation for scheduler start/stop and job init.
- Add dedede and sm8350-hdk hardware to ci runs.

Driver Changes:
- Small fixes and cleanups to panfrost, omap, nouveau, ivpu, zynqmp, v3d,
   panthor docs, and leadtek-ltk050h3146w.
- Crashdump support for qaic.
- Support DP compliance in zynqmp.
- Add Samsung S6E88A0-AMS427AP24 panel.

----------------------------------------------------------------
Adrián Larumbe (1):
       Documentation/gpu: Fix Panthor documentation build warnings

Alex Lanzano (2):
       dt-bindings: display: Add Sharp Memory LCD bindings
       drm/tiny: Add driver for Sharp Memory LCD

Alexander Stein (1):
       drm: fsl-dcu: Use dev_err_probe

Andrzej Kacprowski (1):
       accel/ivpu: Remove copy engine support

Arnd Bergmann (2):
       drm/imx: parallel-display: add legacy bridge Kconfig dependency
       drm/imx: legacy-bridge: add MODULE_DESCRIPTION

Chen Ni (1):
       drm/fsl-dcu: Remove redundant dev_err()

Cristian Ciocaltea (3):
       drm/bridge: synopsys: Add DW HDMI QP TX Controller support library
       dt-bindings: display: rockchip: Add schema for RK3588 HDMI TX 
Controller
       drm/rockchip: Add basic RK3588 HDMI output support

Dmitry Baryshkov (7):
       drm/fbdev: fix drm_fb_helper_deferred_io() build failure
       drm/display: bridge_connector: handle ycbcr_420_allowed
       drm/atomic: add interlaced and ycbcr_420 flags to connector's 
state dump
       drm/bridge: display-connector: allow YCbCr 420 for HDMI and DP
       drm/bridge: aux: allow interlaced and YCbCr 420 output
       drm/msm/dp: migrate the ycbcr_420_allowed to drm_bridge
       drm/bridge: dw-hdmi: set bridge's ycbcr_420_allowed flag

Dr. David Alan Gilbert (1):
       drm/omap: Clean up deadcode functions

Dzmitry Sankouski (1):
       drm/panel: s6e3ha8: add static modifier to supply list

Jakob Hauser (5):
       dt-bindings: display: panel: Move flip properties to panel-common
       dt-bindings: display: panel: Add Samsung S6E88A0-AMS427AP24
       drm/panel: samsung-s6e88a0-ams427ap24: Add initial driver
       drm/panel: samsung-s6e88a0-ams427ap24: Add brightness control
       drm/panel: samsung-s6e88a0-ams427ap24: Add flip option

Javier Carrasco (6):
       drm/bridge: dpc3433: Constify struct regmap_config
       drm/fsl-dcu: Constify struct regmap_config
       drm/mediatek: dp: Constify struct regmap_config
       drm/meson: Constify struct regmap_config
       drm/panel: ili9322: Constify struct regmap_bus
       drm/sprd: Constify struct regmap_bus

Jean Delvare (1):
       drm/display: Drop obsolete dependency on COMPILE_TEST

Jeffrey Hugo (1):
       accel/qaic: Add crashdump to Sahara

Karol Wachowski (9):
       accel/ivpu: Do not fail when more than 1 tile is fused
       accel/ivpu: Defer MMU root page table allocation
       accel/ivpu: Clear CDTAB entry in case of failure
       accel/ivpu: Unmap partially mapped BOs in case of errors
       accel/ivpu: Use xa_alloc_cyclic() instead of custom function
       accel/ivpu: Make command queue ID allocated on XArray
       accel/ivpu: Don't allocate preemption buffers when MIP is disabled
       accel/ivpu: Increase DMA address range
       accel/ivpu: Move secondary preemption buffer allocation to DMA range

Krzysztof Kozlowski (3):
       drm/meson: drop unused static dw_hdmi_dwc_write_bits
       dt-bindings: display: bridge: tc358768: switch to bus-width
       drm/bridge: tc358768: switch to bus-width

Li Huafei (1):
       drm/nouveau/gr/gf100: Fix missing unlock in gf100_gr_chan_new()

Liu Ying (1):
       drm/bridge: ite-it66121: Drop hdmi_avi_infoframe_init() function call

Maciej Falkowski (1):
       accel/ivpu: Add debug Kconfig option

Manikandan Muralidharan (2):
       dt-bindings: display: panel-simple: Document support for 
Microchip AC69T88A
       drm/panel: simple: Add Microchip AC69T88A LVDS Display panel

Marek Vasut (1):
       drm/bridge: tc358767: Fix use of unadjusted mode in the driver

Matthias Brugger (1):
       drm/v3d: Drop allocation of object without mountpoint

Matthias Schiffer (1):
       drm: fsl-dcu: enable PIXCLK on LS1021A

Philipp Stanner (3):
       drm/sched: memset() 'job' in drm_sched_job_init()
       drm/sched: warn about drm_sched_job_init()'s partial init
       drm/sched: Document purpose of drm_sched_{start,stop}

Randy Dunlap (1):
       drm/fbdev-dma: remove obsolete kernel-doc references

Ryan Walklin (1):
       drm: panel: nv3052c: correct spi_device_id for RG35XX panel

Sean Anderson (8):
       drm: zynqmp_kms: Unplug DRM device before removal
       drm: zynqmp_dp: Add locking
       drm: zynqmp_dp: Don't retrain the link in our IRQ
       drm: zynqmp_dp: Convert to a hard IRQ
       drm: zynqmp_dp: Use AUX IRQs instead of polling
       drm: zynqmp_dp: Split off several helper functions
       drm: zynqmp_dp: Take dp->lock in zynqmp_dp_hpd_work_func
       drm: zynqmp_dp: Add debugfs interface for compliance testing

Simon Horman (1):
       accel/qaic: Pass string literal as format argument of 
alloc_workqueue()

Steffen Dirkwinkel (2):
       drm: xlnx: zynqmp_disp: layer may be null while releasing
       drm: xlnx: zynqmp_dpsub: fix hotplug detection

Steven Price (1):
       drm/panfrost: Remove unused id_mask from struct panfrost_model

Tejas Vipin (1):
       drm/panel: leadtek-ltk050h3146w: transition to mipi_dsi wrapped 
functions

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

Vignesh Raman (2):
       drm/ci: add dedede
       drm/ci: add sm8350-hdk

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
  .../bindings/display/panel/panel-common.yaml       |   8 +
  .../bindings/display/panel/panel-simple.yaml       |   2 +
  .../display/panel/samsung,s6e88a0-ams427ap24.yaml  |  65 ++
  .../bindings/display/panel/samsung,s6e8aa0.yaml    |  10 +-
  .../rockchip/rockchip,rk3588-dw-hdmi-qp.yaml       | 188 +++++
  .../bindings/display/sharp,ls010b7dh04.yaml        |  92 +++
  Documentation/gpu/drivers.rst                      |   2 +
  Documentation/gpu/drm-client.rst                   |   3 +
  Documentation/gpu/drm-kms-helpers.rst              |   9 -
  Documentation/gpu/drm-usage-stats.rst              |   1 +
  Documentation/gpu/panthor.rst                      |   2 +-
  Documentation/gpu/zynqmp.rst                       | 149 ++++
  MAINTAINERS                                        |   7 +
  drivers/accel/ivpu/Kconfig                         |   9 +
  drivers/accel/ivpu/Makefile                        |   2 +
  drivers/accel/ivpu/ivpu_drv.c                      |  31 +-
  drivers/accel/ivpu/ivpu_drv.h                      |  16 +-
  drivers/accel/ivpu/ivpu_fw.c                       |   8 +-
  drivers/accel/ivpu/ivpu_hw.c                       |  10 +-
  drivers/accel/ivpu/ivpu_hw_btrs.c                  |  12 +-
  drivers/accel/ivpu/ivpu_job.c                      | 148 ++--
  drivers/accel/ivpu/ivpu_job.h                      |   2 +
  drivers/accel/ivpu/ivpu_jsm_msg.c                  |   8 +-
  drivers/accel/ivpu/ivpu_mmu.c                      |  97 +--
  drivers/accel/ivpu/ivpu_mmu.h                      |   4 +-
  drivers/accel/ivpu/ivpu_mmu_context.c              | 158 ++--
  drivers/accel/ivpu/ivpu_mmu_context.h              |   9 +-
  drivers/accel/ivpu/ivpu_pm.c                       |   2 +
  drivers/accel/qaic/qaic_drv.c                      |   4 +-
  drivers/accel/qaic/sahara.c                        | 388 +++++++++-
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
  drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.h       | 834 
++++++++++++++++++++
  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c          |   3 +
  drivers/gpu/drm/bridge/tc358767.c                  |   2 +-
  drivers/gpu/drm/bridge/tc358768.c                  |   4 +-
  drivers/gpu/drm/bridge/ti-dlpc3433.c               |   2 +-
  drivers/gpu/drm/ci/arm64.config                    |   7 +-
  drivers/gpu/drm/ci/build.sh                        |   1 +
  drivers/gpu/drm/ci/test.yml                        |  25 +
  drivers/gpu/drm/ci/xfails/i915-jsl-fails.txt       |  51 ++
  drivers/gpu/drm/ci/xfails/i915-jsl-flakes.txt      |  13 +
  drivers/gpu/drm/ci/xfails/i915-jsl-skips.txt       |  20 +
  drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-fails.txt |  15 +
  .../gpu/drm/ci/xfails/msm-sm8350-hdk-flakes.txt    |   6 +
  drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-skips.txt | 211 ++++++
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
  drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c     |   1 +
  drivers/gpu/drm/omapdrm/dss/dispc.c                | 146 ----
  drivers/gpu/drm/omapdrm/dss/dss.h                  |  13 -
  drivers/gpu/drm/panel/Kconfig                      |  10 +
  drivers/gpu/drm/panel/Makefile                     |   1 +
  drivers/gpu/drm/panel/panel-ilitek-ili9322.c       |   2 +-
  drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c | 339 ++++-----
  drivers/gpu/drm/panel/panel-newvision-nv3052c.c    |   2 +-
  drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c      |   2 +-
  .../drm/panel/panel-samsung-s6e88a0-ams427ap24.c   | 766 
+++++++++++++++++++
  drivers/gpu/drm/panel/panel-simple.c               |  28 +
  drivers/gpu/drm/panfrost/panfrost_gpu.c            |   1 -
  drivers/gpu/drm/radeon/radeon_device.c             |  19 +-
  drivers/gpu/drm/radeon/radeon_fbdev.c              |   6 -
  drivers/gpu/drm/radeon/radeon_mode.h               |   3 -
  drivers/gpu/drm/rockchip/Kconfig                   |   9 +
  drivers/gpu/drm/rockchip/Makefile                  |   1 +
  drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c     | 424 +++++++++++
  drivers/gpu/drm/rockchip/rockchip_drm_drv.c        |   2 +
  drivers/gpu/drm/rockchip/rockchip_drm_drv.h        |   1 +
  drivers/gpu/drm/scheduler/sched_main.c             |  20 +-
  drivers/gpu/drm/sprd/sprd_dsi.c                    |   2 +-
  drivers/gpu/drm/tiny/Kconfig                       |  21 +
  drivers/gpu/drm/tiny/Makefile                      |   1 +
  drivers/gpu/drm/tiny/sharp-memory.c                | 671 ++++++++++++++++
  drivers/gpu/drm/v3d/v3d_bo.c                       |   9 +-
  drivers/gpu/drm/xe/Kconfig                         |   1 +
  drivers/gpu/drm/xlnx/zynqmp_disp.c                 |   3 +
  drivers/gpu/drm/xlnx/zynqmp_dp.c                   | 843 
+++++++++++++++++++--
  drivers/gpu/drm/xlnx/zynqmp_kms.c                  |   6 +-
  include/drm/bridge/dw_hdmi_qp.h                    |  32 +
  include/drm/drm_bridge.h                           |   5 +
  include/drm/drm_client.h                           |  41 +-
  include/drm/drm_client_event.h                     |  27 +
  include/drm/drm_fb_helper.h                        |   4 +
  include/drm/gpu_scheduler.h                        |   8 +
  include/uapi/drm/ivpu_accel.h                      |   6 +-
  130 files changed, 6423 insertions(+), 979 deletions(-)
  create mode 100644 
Documentation/devicetree/bindings/display/panel/samsung,s6e88a0-ams427ap24.yaml
  create mode 100644 
Documentation/devicetree/bindings/display/rockchip/rockchip,rk3588-dw-hdmi-qp.yaml
  create mode 100644 
Documentation/devicetree/bindings/display/sharp,ls010b7dh04.yaml
  create mode 100644 Documentation/gpu/zynqmp.rst
  create mode 100644 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
  create mode 100644 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.h
  create mode 100644 drivers/gpu/drm/ci/xfails/i915-jsl-fails.txt
  create mode 100644 drivers/gpu/drm/ci/xfails/i915-jsl-flakes.txt
  create mode 100644 drivers/gpu/drm/ci/xfails/i915-jsl-skips.txt
  create mode 100644 drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-fails.txt
  create mode 100644 drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-flakes.txt
  create mode 100644 drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-skips.txt
  create mode 100644 drivers/gpu/drm/drm_client_event.c
  create mode 100644 
drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams427ap24.c
  create mode 100644 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
  create mode 100644 drivers/gpu/drm/tiny/sharp-memory.c
  create mode 100644 include/drm/bridge/dw_hdmi_qp.h
  create mode 100644 include/drm/drm_client_event.h
