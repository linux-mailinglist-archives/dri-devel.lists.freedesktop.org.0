Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE549A2271
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2024 14:38:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4DF210E320;
	Thu, 17 Oct 2024 12:38:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZEIYTgVe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CE9510E12B;
 Thu, 17 Oct 2024 12:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729168712; x=1760704712;
 h=message-id:date:mime-version:from:to:cc:subject:
 content-transfer-encoding;
 bh=bSiCVbXbP1wOe4wUGiOZpVHSf1hk92oOeKwipeyMwlA=;
 b=ZEIYTgVeFUxgOCj25FeziYwA8MyfAQPX1TnWVBQipNFeBJJIv+xtm5ws
 KZIJkwgBWqwGPsJPsprUkd1smRza6meuKhS2mFHIS/WzVSb/gG4iY1SpV
 PPsRWfO+ak+SEHFnZ+h43toLweGyD0xoR7ksUZS7FSwmCuLcl7FdBDhDE
 HBAzgjN2AAVK/LfhudSOHHE7PvcX8E9jkcnK6lbnbJR/xRhJ9szRXKih6
 ztUmoGtQVcsHGWOyMISQXSEbF3ExQSMEBOHlEebGsaebuXhk1Jtf4Ed2Z
 dgBNBG/CS/5t8x20gUkQb/RNpRrp1SrxlBp8NR8PYn8C+sOZGSBXIEVN5 g==;
X-CSE-ConnectionGUID: d0TCKXRNTHCHLLhcqcuyMQ==
X-CSE-MsgGUID: +2ZqwU5KRcK3gIwnEPA91g==
X-IronPort-AV: E=McAfee;i="6700,10204,11227"; a="40052699"
X-IronPort-AV: E=Sophos;i="6.11,210,1725346800"; d="scan'208";a="40052699"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2024 05:38:32 -0700
X-CSE-ConnectionGUID: 3/37ktoWT0mpPIwVOagFmw==
X-CSE-MsgGUID: NCfvydGoSy+mKfv6QiH8zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,210,1725346800"; d="scan'208";a="101845270"
Received: from mlehtone-mobl.ger.corp.intel.com (HELO [10.245.244.115])
 ([10.245.244.115])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2024 05:38:27 -0700
Message-ID: <b9f475d2-d6e0-4f88-b533-1c674a293022@linux.intel.com>
Date: Thu, 17 Oct 2024 14:38:25 +0200
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

A new pull request for drm-misc-next.

Cheers,
Maarten

drm-misc-next-2024-10-17:
drm-misc-next for v6.13:

Cross-subsystem Changes:
- Small fixes to dma-buf.

Core Changes:
- Convert many drivers to use video aperture helpers and remove the DRM
   one.

Driver Changes:
- Add coredump, pantherlake support to accel/ivpu.
- Assorted bugfixes to ivpu, edp-panel, bochs, gcc-15, panel/s6e3ha8.
- Docbook fixes for TTM.
- Add Samsung AMS581VF01
The following changes since commit 26bb2dc102783fef49336b26a94563318f9790d3:

   Merge tag 'drm-xe-next-2024-10-10' of 
https://gitlab.freedesktop.org/drm/xe/kernel into drm-next (2024-10-11 
08:01:16 +1000)

are available in the Git repository at:

   https://gitlab.freedesktop.org/drm/misc/kernel.git 
tags/drm-misc-next-2024-10-17

for you to fetch changes up to 134e71bd1edcc7252b64ca31efe88edfef86d784:

   drm/sched: Further optimise drm_sched_entity_push_job (2024-10-17 
12:20:06 +0200)

----------------------------------------------------------------
drm-misc-next for v6.13:

Cross-subsystem Changes:
- Small fixes to dma-buf.

Core Changes:
- Convert many drivers to use video aperture helpers and remove the DRM
   one.

Driver Changes:
- Add coredump, pantherlake support to accel/ivpu.
- Assorted bugfixes to ivpu, edp-panel, bochs, gcc-15, panel/s6e3ha8.
- Docbook fixes for TTM.
- Add Samsung AMS581VF01

----------------------------------------------------------------
Aleksandrs Vinarskis (1):
       drm/edp-panel: Add panels used by Dell XPS 13 9345

Andrzej Kacprowski (4):
       accel/ivpu: Update VPU FW API headers
       accel/ivpu: Allow reading dvfs_mode debugfs file
       accel/ivpu: Add test_mode bit to force turbo
       accel/ivpu: Fix reset_engine debugfs file logic

Arnd Bergmann (1):
       drm/panel: s6e3ha8: select CONFIG_DRM_DISPLAY_DSC_HELPER

Brahmajit Das (1):
       drm/display: Fix building with GCC 15

Danila Tikhonov (2):
       dt-bindings: display: panel: Add Samsung AMS581VF01
       drm/panel: Add Samsung AMS581VF01 panel driver

Dmitry Baryshkov (1):
       drm/bridge: lt9611: use HDMI Connector helper to set InfoFrames

Dzmitry Sankouski (1):
       drm/mipi-dsi: fix kernel doc on mipi_dsi_compression_mode_multi

Jacek Lawrynowicz (11):
       accel/ivpu: Rename ivpu_log_level to fw_log_level
       accel/ivpu: Refactor functions in ivpu_fw_log.c
       accel/ivpu: Fix fw log printing
       accel/ivpu: Limit FW version string length
       accel/ivpu: Stop using hardcoded DRIVER_DATE
       accel/ivpu: Add auto selection logic for job scheduler
       accel/ivpu: Remove invalid warnings
       accel/ivpu: Increase MS info buffer size
       accel/ivpu: Fix ivpu_jsm_dyndbg_control()
       accel/ivpu: Remove HWS_EXTRA_EVENTS from test modes
       accel/ivpu: Fix typos in ivpu_pm.c

Jakub Pawlak (1):
       accel/ivpu: Add tracing for IPC/PM/JOB

Jeffrey Hugo (2):
       accel/qaic: Add ipc_router channel
       accel/qaic: Add AIC080 support

Karol Wachowski (13):
       accel/ivpu: Add coredump support
       accel/ivpu: Set 500 ns delay between power island TRICKLE and ENABLE
       accel/ivpu: Turn on autosuspend on Simics
       accel/ivpu: Add FW version debugfs entry
       accel/ivpu: Remove 1-tile power up Simics workaround
       accel/ivpu: Add one jiffy to bo_wait_ioctl timeout value
       accel/ivpu: Print JSM message result in case of error
       accel/ivpu: Remove skip of clock own resource ack on Simics
       accel/ivpu: Prevent recovery invocation during probe and resume
       accel/ivpu: Refactor failure diagnostics during boot
       accel/ivpu: Do not fail on cmdq if failed to allocate preemption 
buffers
       accel/ivpu: Use whole user and shave ranges for preemption buffers
       accel/ivpu: Update power island delays

Maaz Mombasawala (1):
       drm/vmwgfx: Stop using dev_private to store driver data.

Maciej Falkowski (1):
       accel/ivpu: Add initial Panther Lake support

Maíra Canal (1):
       MAINTAINERS: Add Maíra to VC4 reviewers

Miguel Ojeda (1):
       drm/panic: Select ZLIB_DEFLATE for DRM_PANIC_SCREEN_QR_CODE

Pintu Kumar (2):
       dma-buf: fix S_IRUGO to 0444, block comments, func declaration
       dma-buf/heaps: replace kmap_atomic with kmap_local_page

Thomas Hellström (1):
       drm/ttm: Fix incorrect use of kernel-doc format

Thomas Zimmermann (30):
       drm/bochs: Return error from correct pointer
       Merge drm/drm-next into drm-misc-next
       drm/amdgpu: Use video aperture helpers
       drm/arm/hdlcd: Use video aperture helpers
       drm/armada: Use video aperture helpers
       drm/ast: Use video aperture helpers
       drm/hisilicon/hibmc: Use video aperture helpers
       drm/hyperv-drm: Use video aperture helpers
       drm/i915: Use video aperture helpers
       drm/loongson: Use video aperture helpers
       drm/meson: Use video aperture helpers
       drm/mgag200: Use video aperture helpers
       drm/msm: Use video aperture helpers
       drm/nouveau: Use video aperture helpers
       drm/ofdrm: Use video aperture helpers
       drm/qxl: Use video aperture helpers
       drm/radeon: Use video aperture helpers
       drm/rockchip: Use video aperture helpers
       drm/simpledrm: Use video aperture helpers
       drm/stm: Use video aperture helpers
       drm/sun4i: Use video aperture helpers
       drm/tegra: Use video aperture helpers
       drm/bochs: Use video aperture helpers
       drm/cirrus: Use video aperture helpers
       drm/vboxvideo: Use video aperture helpers
       drm/vc4: Use video aperture helpers
       drm/virtgpu: Use video aperture helpers
       drm/vmwgfx: Use video aperture helpers
       drm/xe: Use video aperture helpers
       drm: Remove DRM aperture helpers

Tomasz Rusinowicz (3):
       accel/ivpu: Reset fw log on cold boot
       accel/ivpu: Add FW state dump on TDR
       accel/ivpu: Make DB_ID and JOB_ID allocations incremental

Tomi Valkeinen (1):
       drm/bridge: tc358767: Fix link properties discovery

Tvrtko Ursulin (5):
       drm/sched: Optimise drm_sched_entity_push_job
       drm/sched: Stop setting current entity in FIFO mode
       drm/sched: Re-order struct drm_sched_rq members for clarity
       drm/sched: Re-group and rename the entity run-queue lock
       drm/sched: Further optimise drm_sched_entity_push_job

Uros Bizjak (1):
       dma-buf: Use atomic64_inc_return() in dma_buf_getfile()

  Documentation/accel/qaic/aic080.rst                |  14 +
  Documentation/accel/qaic/aic100.rst                |   2 +
  Documentation/accel/qaic/index.rst                 |   1 +
  .../bindings/display/panel/samsung,ams581vf01.yaml |  79 ++++++
  Documentation/gpu/drm-internals.rst                |  12 -
  MAINTAINERS                                        |   3 +-
  drivers/accel/ivpu/Kconfig                         |   1 +
  drivers/accel/ivpu/Makefile                        |   6 +-
  drivers/accel/ivpu/ivpu_coredump.c                 |  39 +++
  drivers/accel/ivpu/ivpu_coredump.h                 |  25 ++
  drivers/accel/ivpu/ivpu_debugfs.c                  |  90 +++---
  drivers/accel/ivpu/ivpu_drv.c                      |  53 ++--
  drivers/accel/ivpu/ivpu_drv.h                      |  23 +-
  drivers/accel/ivpu/ivpu_fw.c                       |  29 +-
  drivers/accel/ivpu/ivpu_fw.h                       |   9 +-
  drivers/accel/ivpu/ivpu_fw_log.c                   | 119 +++++---
  drivers/accel/ivpu/ivpu_fw_log.h                   |  17 +-
  drivers/accel/ivpu/ivpu_gem.c                      |   3 +
  drivers/accel/ivpu/ivpu_hw.c                       |   5 +-
  drivers/accel/ivpu/ivpu_hw.h                       |   1 -
  drivers/accel/ivpu/ivpu_hw_40xx_reg.h              |   2 +
  drivers/accel/ivpu/ivpu_hw_btrs.c                  |   9 -
  drivers/accel/ivpu/ivpu_hw_ip.c                    |  57 ++--
  drivers/accel/ivpu/ivpu_ipc.c                      |  45 ++-
  drivers/accel/ivpu/ivpu_ipc.h                      |   9 +-
  drivers/accel/ivpu/ivpu_job.c                      | 102 ++++---
  drivers/accel/ivpu/ivpu_jsm_msg.c                  |  34 ++-
  drivers/accel/ivpu/ivpu_jsm_msg.h                  |   2 +
  drivers/accel/ivpu/ivpu_ms.c                       |   2 +-
  drivers/accel/ivpu/ivpu_pm.c                       |  24 +-
  drivers/accel/ivpu/ivpu_sysfs.c                    |  24 ++
  drivers/accel/ivpu/ivpu_trace.h                    |  73 +++++
  drivers/accel/ivpu/ivpu_trace_points.c             |   9 +
  drivers/accel/ivpu/vpu_boot_api.h                  |  43 ++-
  drivers/accel/ivpu/vpu_jsm_api.h                   | 303 
++++++++++++++++++---
  drivers/accel/qaic/mhi_controller.c                |  32 +++
  drivers/accel/qaic/qaic_drv.c                      |   4 +-
  drivers/dma-buf/dma-buf.c                          |  14 +-
  drivers/dma-buf/heaps/cma_heap.c                   |   6 +-
  drivers/gpu/drm/Kconfig                            |   1 +
  drivers/gpu/drm/Makefile                           |   1 -
  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |   5 +-
  drivers/gpu/drm/arm/hdlcd_drv.c                    |   4 +-
  drivers/gpu/drm/armada/armada_drv.c                |   4 +-
  drivers/gpu/drm/ast/ast_drv.c                      |   4 +-
  drivers/gpu/drm/bridge/Kconfig                     |   2 +
  drivers/gpu/drm/bridge/lontium-lt9611.c            | 173 ++++++++----
  drivers/gpu/drm/bridge/tc358767.c                  |   7 +
  drivers/gpu/drm/display/drm_dp_dual_mode_helper.c  |   4 +-
  drivers/gpu/drm/drm_aperture.c                     | 192 -------------
  drivers/gpu/drm/drm_mipi_dsi.c                     |   2 +-
  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c    |   4 +-
  drivers/gpu/drm/hyperv/hyperv_drm_drv.c            |   4 +-
  drivers/gpu/drm/i915/i915_driver.c                 |   4 +-
  drivers/gpu/drm/loongson/lsdc_drv.c                |   8 +-
  drivers/gpu/drm/meson/meson_drv.c                  |   4 +-
  drivers/gpu/drm/mgag200/mgag200_drv.c              |   4 +-
  drivers/gpu/drm/msm/msm_kms.c                      |   4 +-
  drivers/gpu/drm/nouveau/nouveau_drm.c              |   4 +-
  drivers/gpu/drm/panel/Kconfig                      |  10 +
  drivers/gpu/drm/panel/Makefile                     |   1 +
  drivers/gpu/drm/panel/panel-edp.c                  |   2 +
  drivers/gpu/drm/panel/panel-samsung-ams581vf01.c   | 283 
+++++++++++++++++++
  drivers/gpu/drm/qxl/qxl_drv.c                      |   4 +-
  drivers/gpu/drm/radeon/radeon_drv.c                |   5 +-
  drivers/gpu/drm/rockchip/rockchip_drm_drv.c        |   4 +-
  drivers/gpu/drm/scheduler/sched_entity.c           |  42 ++-
  drivers/gpu/drm/scheduler/sched_main.c             |  32 +--
  drivers/gpu/drm/stm/drv.c                          |   4 +-
  drivers/gpu/drm/sun4i/sun4i_drv.c                  |   4 +-
  drivers/gpu/drm/tegra/drm.c                        |   4 +-
  drivers/gpu/drm/tiny/bochs.c                       |   6 +-
  drivers/gpu/drm/tiny/cirrus.c                      |   4 +-
  drivers/gpu/drm/tiny/ofdrm.c                       |   4 +-
  drivers/gpu/drm/tiny/simpledrm.c                   |   8 +-
  drivers/gpu/drm/vboxvideo/vbox_drv.c               |   5 +-
  drivers/gpu/drm/vc4/vc4_drv.c                      |   4 +-
  drivers/gpu/drm/virtio/virtgpu_drv.c               |   4 +-
  drivers/gpu/drm/vmwgfx/vmwgfx_drv.c                |   7 +-
  drivers/gpu/drm/vmwgfx/vmwgfx_drv.h                |   2 +-
  drivers/gpu/drm/vmwgfx/vmwgfx_kms.c                |   4 +-
  drivers/gpu/drm/xe/xe_device.c                     |   4 +-
  include/drm/drm_aperture.h                         |  38 ---
  include/drm/gpu_scheduler.h                        |  34 ++-
  include/drm/ttm/ttm_device.h                       |   2 +-
  include/uapi/drm/ivpu_accel.h                      |   3 -
  86 files changed, 1544 insertions(+), 740 deletions(-)
  create mode 100644 Documentation/accel/qaic/aic080.rst
  create mode 100644 
Documentation/devicetree/bindings/display/panel/samsung,ams581vf01.yaml
  create mode 100644 drivers/accel/ivpu/ivpu_coredump.c
  create mode 100644 drivers/accel/ivpu/ivpu_coredump.h
  create mode 100644 drivers/accel/ivpu/ivpu_trace.h
  create mode 100644 drivers/accel/ivpu/ivpu_trace_points.c
  delete mode 100644 drivers/gpu/drm/drm_aperture.c
  create mode 100644 drivers/gpu/drm/panel/panel-samsung-ams581vf01.c
  delete mode 100644 include/drm/drm_aperture.h
