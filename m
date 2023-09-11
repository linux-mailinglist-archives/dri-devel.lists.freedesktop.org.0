Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B20979A7FE
	for <lists+dri-devel@lfdr.de>; Mon, 11 Sep 2023 14:45:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D432310E2E0;
	Mon, 11 Sep 2023 12:45:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EA5F10E2DD;
 Mon, 11 Sep 2023 12:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694436324; x=1725972324;
 h=message-id:date:mime-version:from:to:cc:subject:
 content-transfer-encoding;
 bh=yGqB+cO4oHl1xp//AhLioWKfxeII4gLsZzAZ8XMMB84=;
 b=PdKFO7YPUaNUl1Qn16A90p6SZ3jyisp44QFH6EPadxdyGC/az/ZSHqOQ
 nJjElpbuJlZcm4Hx8bqMB3W4HCTIoAT1s/Hgxy4s7MC5l508iZSjop+TQ
 kmkBSjvwz1Ps02hyUfjcBN7bGCCCkZCagrHB+cR/6vdMbJpj8PfrMflP7
 LP1OP1spk9/BnZL3aL8h4ei0TE1nSKG/ZIRbXKdsJZGSz/fcqPxZ4eQCK
 h5zkrGe4DvYYc5XylwYkgwtpIiOCn6fr7Byev5HxnTKG1oS60iEh9FAt5
 K4x5QX+EwFUpMgX5EY1FoHbgGfxFVcc4GqpnE01fJU28K/54GyH+Tz30V Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="358372892"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; d="scan'208";a="358372892"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2023 05:45:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="778378797"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; d="scan'208";a="778378797"
Received: from jpoulsen-mobl.ger.corp.intel.com (HELO [10.249.254.178])
 ([10.249.254.178])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2023 05:45:02 -0700
Message-ID: <3da6554b-3b47-fe7d-c4ea-21f4f819dbb6@linux.intel.com>
Date: Mon, 11 Sep 2023 14:45:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Dave Airlie <airlied@gmail.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dim-tools@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave, Daniel,

First pull request for next kernel cycle.

Cheers,
~Maarten

drm-misc-next-2023-09-11-1:
drm-misc-next for v6.7-rc1:

UAPI Changes:
- Nouveau changed to not set NO_PREFETCH flag explicitly.

Cross-subsystem Changes:
- Update documentation of dma-buf intro and uapi.
- fbdev/sbus fixes.
- Use initializer macros in a lot of fbdev drivers.
- Add Boris Brezillon as Panfrost driver maintainer.
- Add Jessica Zhang as drm/panel reviewer.
- Make more fbdev drivers use fb_ops helpers for deferred io.
- Small hid trailing whitespace fix.
- Use fb_ops in hid/picolcd

Core Changes:
- Assorted small fixes to ttm tests, drm/mst.
- Documentation updates to bridge.
- Add kunit tests for some drm_fb functions.
- Rework drm_debugfs implementation.
- Update xe documentation to mark todos as completed.

Driver Changes:
- Add support to rockchip for rv1126 mipi-dsi and vop.
- Assorted small fixes to nouveau, bridge/samsung-dsim,
   bridge/lvds-codec, loongson, rockchip, panfrost, gma500, repaper,
   komeda, virtio, ssd130x.
- Add support for simple panels Mitsubishi AA084XE01,
   JDI LPM102A188A,
- Documentation updates to accel/ivpu.
- Some nouveau scheduling/fence fixes.
- Power management related fixes and other fixes to ivpu.
- Assorted bridge/it66121 fixes.
- Make platform drivers return void in remove() callback.
The following changes since commit 2799804ac651da1375ecb9b9a644eba97218df07:

   drm/ttm: Remove two unused function declarations (2023-08-10 09:12:08 
+0200)

are available in the Git repository at:

   git://anongit.freedesktop.org/drm/drm-misc 
tags/drm-misc-next-2023-09-11-1

for you to fetch changes up to 15d30b46573d75f5cb58cfacded8ebab9c76a2b0:

   drm/ssd130x: Use bool for ssd130x_deviceinfo flags (2023-09-10 
09:05:47 +0200)

----------------------------------------------------------------
drm-misc-next for v6.7-rc1:

UAPI Changes:
- Nouveau changed to not set NO_PREFETCH flag explicitly.

Cross-subsystem Changes:
- Update documentation of dma-buf intro and uapi.
- fbdev/sbus fixes.
- Use initializer macros in a lot of fbdev drivers.
- Add Boris Brezillon as Panfrost driver maintainer.
- Add Jessica Zhang as drm/panel reviewer.
- Make more fbdev drivers use fb_ops helpers for deferred io.
- Small hid trailing whitespace fix.
- Use fb_ops in hid/picolcd

Core Changes:
- Assorted small fixes to ttm tests, drm/mst.
- Documentation updates to bridge.
- Add kunit tests for some drm_fb functions.
- Rework drm_debugfs implementation.
- Update xe documentation to mark todos as completed.

Driver Changes:
- Add support to rockchip for rv1126 mipi-dsi and vop.
- Assorted small fixes to nouveau, bridge/samsung-dsim,
   bridge/lvds-codec, loongson, rockchip, panfrost, gma500, repaper,
   komeda, virtio, ssd130x.
- Add support for simple panels Mitsubishi AA084XE01,
   JDI LPM102A188A,
- Documentation updates to accel/ivpu.
- Some nouveau scheduling/fence fixes.
- Power management related fixes and other fixes to ivpu.
- Assorted bridge/it66121 fixes.
- Make platform drivers return void in remove() callback.

----------------------------------------------------------------
Alexander Stein (1):
       drm/bridge: lvds-codec: Implement atomic_get_input_bus_fmts for 
LVDS encoder

Arthur Grillo (8):
       drm/tests: Test default pitch fallback
       drm/tests: Add KUnit tests for drm_fb_swab()
       drm/tests: Add KUnit tests for drm_fb_clip_offset()
       drm/tests: Add KUnit tests for drm_fb_build_fourcc_list()
       drm/tests: Add multi-plane support to conversion_buf_size()
       drm/tests: Add KUnit tests for drm_fb_memcpy()
       drm/debugfs: Add inline to drm_debugfs_dev_init() to suppres 
-Wunused-function
       drm/tests: Zero initialize fourccs_out

Biju Das (5):
       drm: bridge: it66121: Extend match support for OF tables
       drm: bridge: it66121: Simplify probe()
       drm/bridge/analogix/anx78xx: Drop ID table
       drm/bridge: Drop conditionals around of_node pointers
       drm/bridge: Drop CONFIG_OF conditionals around of_node pointers

Christian König (5):
       drm/debugfs: drop debugfs_init() for the render and accel node v2
       drm/debugfs: disallow debugfs access when device isn't registered
       drm/debugfs: rework debugfs directory creation v5
       drm/debugfs: remove dev->debugfs_list and debugfs_mutex v2
       drm/debugfs: rework drm_debugfs_create_files implementation v2

Daniel Stone (2):
       doc: dma-buf: Rewrite intro section a little
       doc: uapi: Add document describing dma-buf semantics

Danilo Krummrich (3):
       drm/nouveau: sched: avoid job races between entities
       drm/nouveau: uvmm: fix unset region pointer on remap
       drm/nouveau: uapi: don't pass NO_PREFETCH flag implicitly

Dave Airlie (1):
       nouveau/u_memcpya: use vmemdup_user

David Heidelberg (2):
       drm/panel: JDI LT070ME05000 drop broken link
       drm/panel: JDI LT070ME05000 simplify with dev_err_probe()

Diogo Ivo (2):
       dt-bindings: display: Add bindings for JDI LPM102A188A
       drm/panel: Add driver for JDI LPM102A188A

Dmitry Osipenko (1):
       MAINTAINERS: Add Boris Brezillon as Panfrost driver maintainer

Douglas Anderson (1):
       drm/bridge: Fix kernel-doc typo in desc of output_bus_cfg in 
drm_bridge_state

Geert Uytterhoeven (2):
       drm/ssd130x: Fix screen clearing
       drm/ssd130x: Use bool for ssd130x_deviceinfo flags

Harshit Mogalapalli (1):
       drm/loongson: Fix error handling in lsdc_pixel_pll_setup()

Jacek Lawrynowicz (3):
       accel/ivpu: Remove duplicated error messages
       accel/ivpu: Move ivpu_fw_load() to ivpu_fw_init()
       accel/ivpu: Move MMU register definitions to ivpu_mmu.c

Jagan Teki (4):
       dt-bindings: display: rockchip-vop: Document rv1126 vop
       drm/rockchip: vop: Add rv1126 vop_lite support
       dt-bindings: display: rockchip-dw-mipi-dsi: Document rv1126 DSI
       drm/rockchip: dsi: Add rv1126 MIPI DSI support

Jai Luthra (1):
       drm: bridge: it66121: Fix invalid connector dereference

Javier Carrasco (1):
       drm/connector: document DRM_MODE_COLORIMETRY_COUNT

Jessica Zhang (1):
       MAINTAINERS: Add Jessica as a reviewer for drm/panel

Jonas Karlman (5):
       drm/rockchip: vop: Fix reset of state in duplicate state crtc funcs
       drm/rockchip: vop: Use cleanup helper directly as destroy funcs
       drm/rockchip: vop: Fix call to crtc reset helper
       drm/rockchip: vop2: Don't crash for invalid duplicate_state
       drm/rockchip: vop2: Add missing call to crtc reset helper

Jorge Maidana (1):
       drm/gma500: remove duplicate macro definitions

Justin Stitt (1):
       drm/repaper: fix -Wvoid-pointer-to-enum-cast warning

Karol Wachowski (1):
       accel/ivpu: Initialize context with SSID = 1

Karolina Stolarek (1):
       drm/ttm/tests: Require MMU when testing

Krystian Pradzynski (1):
       accel/ivpu: Move set autosuspend delay to HW specific code

Liu Ying (1):
       drm/bridge: panel: Add a device link between drm device and panel 
device

Marek Szyprowski (1):
       drm: bridge: samsung-dsim: Fix waiting for empty cmd transfer 
FIFO on older Exynos

Marek Vasut (1):
       drm: bridge: samsung-dsim: Initialize ULPS EXIT for i.MX8M DSIM

Miquel Raynal (1):
       dt-bindings: display: simple: Add Mitsubishi AA084XE01 panel

Randy Dunlap (1):
       drm: bridge: for GENERIC_PHY_MIPI_DPHY also select GENERIC_PHY

Rodrigo Vivi (4):
       drm/doc/rfc: No STAGING out of drivers/staging.
       drm/doc/rfc: Mark Dev_coredump as completed.
       drm/doc/rfc: Mark DRM_VM_BIND as complete.
       drm/doc/rfc: Mark GPU VA as complete.

Ruan Jinjie (1):
       drm/panfrost: Do not check for 0 return after calling 
platform_get_irq_byname()

Stanislaw Gruszka (6):
       accel/ivpu: Document DRM_IVPU_PARAM_CAPABILITIES
       accel/ivpu: Make ivpu_pm_init() void
       accel/ivpu: Add information about context on failure
       accel/ivpu/37xx: Change register rename leftovers
       accel/ivpu/37xx: White space cleanup
       accel/ivpu: Print information about used workarounds

Sui Jingfeng (1):
       drm/gma500: Fix call trace when psb_gem_mm_init() fails

Thomas Weber (1):
       drm/panel: simple: Add support for Mitsubishi AA084XE01

Thomas Zimmermann (19):
       fbdev/sbus: Build sbuslib.o if CONFIG_FB_SBUS has been selected
       fbdev/sbus: Forward declare all necessary structures in header
       fbdev/sbus: Add initializer macros and Kconfig tokens for SBUS 
support
       fbdev/bw2: Use initializer macro for struct fb_ops
       fbdev/cg14: Use initializer macro for struct fb_ops
       fbdev/cg3: Use initializer macro for struct fb_ops
       fbdev/cg6: Use initializer macro for struct fb_ops
       fbdev/ffb: Use initializer macro for struct fb_ops
       fbdev/leo: Use initializer macro for struct fb_ops
       fbdev/p9100: Use initializer macro for struct fb_ops
       fbdev/tcx: Use initializer macro for struct fb_ops
       fbdev/smscufx: Use fb_ops helpers for deferred I/O
       fbdev/udlfb: Use fb_ops helpers for deferred I/O
       fbdev: Add Kconfig macro FB_IOMEM_HELPERS_DEFERRED
       fbdev/hyperv_fb: Use fb_ops helpers for deferred I/O
       hid: Remove trailing whitespace
       hid/picolcd: Use fb_ops helpers for deferred I/O
       staging/fbtft: Initialize fb_op struct as static const
       staging/fbtft: Use fb_ops helpers for deferred I/O

Tomi Valkeinen (4):
       drm/bridge: lt8912b: Fix bridge_detach
       drm/bridge: lt8912b: Fix crash on bridge detach
       drm/bridge: lt8912b: Manually disable HPD only if it was enabled
       drm/bridge: lt8912b: Add missing drm_bridge_attach call

Uwe Kleine-König (7):
       drm/imx/ipuv3: Convert to platform remove callback returning void
       drm/ingenic: Convert to platform remove callback returning void
       drm/mediatek: Convert to platform remove callback returning void
       drm/mediatek: Convert to platform remove callback returning void
       drm/msm: Convert to platform remove callback returning void
       drm/shmobile: Convert to platform remove callback returning void
       drm/ssd130x: Print the PWM's label instead of its number

Wayne Lin (2):
       drm/mst: delete unnecessary case in drm_dp_add_payload_part2()
       drm/mst: Refactor the flow for payload allocation/removement

Yue Haibing (2):
       drm/gma500: Remove unused declarations
       drm/virtio: Remove unused function declarations

baozhu.liu (1):
       drm/komeda: drop all currently held locks if deadlock happens

  .../bindings/display/panel/jdi,lpm102a188a.yaml    |  94 +++
  .../bindings/display/panel/panel-simple.yaml       |   2 +
  .../display/rockchip/rockchip,dw-mipi-dsi.yaml     |   2 +
  .../bindings/display/rockchip/rockchip-vop.yaml    |   1 +
  Documentation/driver-api/dma-buf.rst               |  32 +-
  Documentation/gpu/drm-uapi.rst                     |   7 +
  Documentation/gpu/rfc/xe.rst                       |  89 ++-
  .../userspace-api/dma-buf-alloc-exchange.rst       | 389 ++++++++++
  Documentation/userspace-api/index.rst              |   1 +
  MAINTAINERS                                        |   5 +-
  drivers/accel/drm_accel.c                          |  35 +-
  drivers/accel/ivpu/ivpu_drv.c                      |  65 +-
  drivers/accel/ivpu/ivpu_drv.h                      |  18 +-
  drivers/accel/ivpu/ivpu_fw.c                       |   6 +-
  drivers/accel/ivpu/ivpu_fw.h                       |   2 +-
  drivers/accel/ivpu/ivpu_hw_37xx.c                  |  75 +-
  drivers/accel/ivpu/ivpu_hw_37xx_reg.h              | 187 ++---
  drivers/accel/ivpu/ivpu_hw_40xx.c                  |   7 +
  drivers/accel/ivpu/ivpu_ipc.c                      |  13 +-
  drivers/accel/ivpu/ivpu_mmu.c                      | 117 +--
  drivers/accel/ivpu/ivpu_mmu_context.c              |  18 +-
  drivers/accel/ivpu/ivpu_mmu_context.h              |   2 +
  drivers/accel/ivpu/ivpu_pm.c                       |  16 +-
  drivers/accel/ivpu/ivpu_pm.h                       |   2 +-
  drivers/gpu/drm/Kconfig                            |   2 +-
  .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |  20 +-
  .../drm/arm/display/komeda/komeda_pipeline_state.c |   9 +-
  drivers/gpu/drm/bridge/Kconfig                     |   2 +
  drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c |   9 -
  drivers/gpu/drm/bridge/cadence/Kconfig             |   1 +
  drivers/gpu/drm/bridge/ite-it66121.c               |  29 +-
  drivers/gpu/drm/bridge/lontium-lt8912b.c           |  22 +-
  drivers/gpu/drm/bridge/lvds-codec.c                |  12 +-
  drivers/gpu/drm/bridge/panel.c                     |  18 +-
  drivers/gpu/drm/bridge/samsung-dsim.c              |  20 +-
  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c          |   2 -
  drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c      |   2 -
  drivers/gpu/drm/display/drm_dp_mst_topology.c      | 167 +++--
  drivers/gpu/drm/drm_atomic.c                       |   4 +-
  drivers/gpu/drm/drm_bridge.c                       |   4 +-
  drivers/gpu/drm/drm_client.c                       |   4 +-
  drivers/gpu/drm/drm_crtc_internal.h                |   2 +-
  drivers/gpu/drm/drm_debugfs.c                      | 162 ++--
  drivers/gpu/drm/drm_drv.c                          |  28 +-
  drivers/gpu/drm/drm_framebuffer.c                  |   4 +-
  drivers/gpu/drm/drm_internal.h                     |  25 +-
  drivers/gpu/drm/drm_mode_config.c                  |   2 -
  drivers/gpu/drm/gma500/gma_display.h               |   1 -
  drivers/gpu/drm/gma500/psb_drv.h                   |   9 +-
  drivers/gpu/drm/gma500/psb_intel_drv.h             |  14 -
  drivers/gpu/drm/gma500/psb_irq.c                   |   5 +
  drivers/gpu/drm/i915/display/intel_dp_mst.c        |  18 +-
  drivers/gpu/drm/imx/ipuv3/dw_hdmi-imx.c            |   6 +-
  drivers/gpu/drm/imx/ipuv3/imx-drm-core.c           |   5 +-
  drivers/gpu/drm/imx/ipuv3/imx-ldb.c                |   5 +-
  drivers/gpu/drm/imx/ipuv3/imx-tve.c                |   5 +-
  drivers/gpu/drm/imx/ipuv3/ipuv3-crtc.c             |   5 +-
  drivers/gpu/drm/imx/ipuv3/parallel-display.c       |   6 +-
  drivers/gpu/drm/ingenic/ingenic-drm-drv.c          |   6 +-
  drivers/gpu/drm/ingenic/ingenic-ipu.c              |   5 +-
  drivers/gpu/drm/loongson/lsdc_pixpll.c             |   6 +-
  drivers/gpu/drm/mediatek/mtk_cec.c                 |   5 +-
  drivers/gpu/drm/mediatek/mtk_disp_aal.c            |   6 +-
  drivers/gpu/drm/mediatek/mtk_disp_ccorr.c          |   6 +-
  drivers/gpu/drm/mediatek/mtk_disp_color.c          |   6 +-
  drivers/gpu/drm/mediatek/mtk_disp_gamma.c          |   6 +-
  drivers/gpu/drm/mediatek/mtk_disp_merge.c          |   6 +-
  drivers/gpu/drm/mediatek/mtk_disp_ovl.c            |   6 +-
  drivers/gpu/drm/mediatek/mtk_disp_rdma.c           |   6 +-
  drivers/gpu/drm/mediatek/mtk_dp.c                  |   6 +-
  drivers/gpu/drm/mediatek/mtk_dpi.c                 |   6 +-
  drivers/gpu/drm/mediatek/mtk_drm_drv.c             |   6 +-
  drivers/gpu/drm/mediatek/mtk_dsi.c                 |   6 +-
  drivers/gpu/drm/mediatek/mtk_hdmi.c                |   5 +-
  drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c            |   6 +-
  drivers/gpu/drm/mediatek/mtk_mdp_rdma.c            |   5 +-
  drivers/gpu/drm/msm/adreno/adreno_device.c         |   5 +-
  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   6 +-
  drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c           |   6 +-
  drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c           |   5 +-
  drivers/gpu/drm/msm/dp/dp_display.c                |   6 +-
  drivers/gpu/drm/msm/dsi/dsi.c                      |   6 +-
  drivers/gpu/drm/msm/hdmi/hdmi.c                    |   6 +-
  drivers/gpu/drm/msm/hdmi/hdmi_phy.c                |   6 +-
  drivers/gpu/drm/msm/msm_drv.c                      |   6 +-
  drivers/gpu/drm/msm/msm_mdss.c                     |   6 +-
  drivers/gpu/drm/nouveau/dispnv50/disp.c            |  21 +-
  drivers/gpu/drm/nouveau/nouveau_dma.c              |   7 +-
  drivers/gpu/drm/nouveau/nouveau_dma.h              |   8 +-
  drivers/gpu/drm/nouveau/nouveau_drv.h              |  19 +-
  drivers/gpu/drm/nouveau/nouveau_exec.c             |  19 +-
  drivers/gpu/drm/nouveau/nouveau_gem.c              |   6 +-
  drivers/gpu/drm/nouveau/nouveau_sched.c            |  22 +
  drivers/gpu/drm/nouveau/nouveau_uvmm.c             |   1 +
  drivers/gpu/drm/panel/Kconfig                      |  11 +
  drivers/gpu/drm/panel/Makefile                     |   1 +
  drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c      | 551 ++++++++++++++
  drivers/gpu/drm/panel/panel-jdi-lt070me05000.c     |  40 +-
  drivers/gpu/drm/panel/panel-simple.c               |  29 +
  drivers/gpu/drm/panfrost/panfrost_gpu.c            |   4 +-
  drivers/gpu/drm/panfrost/panfrost_job.c            |   4 +-
  drivers/gpu/drm/panfrost/panfrost_mmu.c            |   4 +-
  drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c   |   6 +-
  drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c    |  20 +
  drivers/gpu/drm/rockchip/rockchip_drm_vop.c        |  24 +-
  drivers/gpu/drm/rockchip/rockchip_drm_vop2.c       |  39 +-
  drivers/gpu/drm/rockchip/rockchip_vop_reg.c        |  55 ++
  drivers/gpu/drm/solomon/ssd130x.c                  |  51 +-
  drivers/gpu/drm/solomon/ssd130x.h                  |   4 +-
  drivers/gpu/drm/tegra/dc.c                         |   9 +-
  drivers/gpu/drm/tegra/dsi.c                        |   1 +
  drivers/gpu/drm/tegra/hdmi.c                       |   3 +-
  drivers/gpu/drm/tegra/sor.c                        |   1 +
  drivers/gpu/drm/tests/drm_format_helper_test.c     | 813 
+++++++++++++++++++--
  drivers/gpu/drm/tiny/repaper.c                     |   2 +-
  drivers/gpu/drm/virtio/virtgpu_drv.h               |   7 -
  drivers/hid/Kconfig                                |   8 +-
  drivers/hid/hid-picolcd_fb.c                       |  73 +-
  drivers/staging/fbtft/Kconfig                      |   6 +-
  drivers/staging/fbtft/fbtft-core.c                 |  99 +--
  drivers/video/fbdev/Kconfig                        |  35 +-
  drivers/video/fbdev/Makefile                       |  17 +-
  drivers/video/fbdev/bw2.c                          |  17 +-
  drivers/video/fbdev/cg14.c                         |  19 +-
  drivers/video/fbdev/cg3.c                          |  17 +-
  drivers/video/fbdev/cg6.c                          |  17 +-
  drivers/video/fbdev/core/Kconfig                   |   6 +
  drivers/video/fbdev/ffb.c                          |  17 +-
  drivers/video/fbdev/hyperv_fb.c                    |  48 +-
  drivers/video/fbdev/leo.c                          |  19 +-
  drivers/video/fbdev/p9100.c                        |  18 +-
  drivers/video/fbdev/sbuslib.h                      |  37 +-
  drivers/video/fbdev/smscufx.c                      |  85 +--
  drivers/video/fbdev/tcx.c                          |  20 +-
  drivers/video/fbdev/udlfb.c                        |  89 +--
  include/drm/bridge/samsung-dsim.h                  |   1 +
  include/drm/display/drm_dp_mst_helper.h            |  23 +-
  include/drm/drm_accel.h                            |   9 +-
  include/drm/drm_atomic.h                           |   2 +-
  include/drm/drm_bridge.h                           |   6 +-
  include/drm/drm_client.h                           |   2 +-
  include/drm/drm_connector.h                        |   3 +-
  include/drm/drm_debugfs.h                          |   4 +-
  include/drm/drm_device.h                           |  14 +-
  include/drm/drm_drv.h                              |   8 +
  include/drm/drm_file.h                             |   4 +-
  include/uapi/drm/ivpu_accel.h                      |  18 +-
  include/uapi/drm/nouveau_drm.h                     |   8 +-
  148 files changed, 3136 insertions(+), 1371 deletions(-)
  create mode 100644 
Documentation/devicetree/bindings/display/panel/jdi,lpm102a188a.yaml
  create mode 100644 Documentation/userspace-api/dma-buf-alloc-exchange.rst
  create mode 100644 drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c
