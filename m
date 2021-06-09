Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 380B13A0DEA
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 09:42:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF00989D49;
	Wed,  9 Jun 2021 07:42:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5385689CE3;
 Wed,  9 Jun 2021 07:42:23 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 080C9219DC;
 Wed,  9 Jun 2021 07:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623224542; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ivckj2mJMI6wxy4FlL9rKevYAblouQ2aOXczIg6ZKnk=;
 b=G65cle2o1ySle+jaRiTSFggab4m9AmIyeR9eiFTLvfeOscFPQzzeQEBBLXcI1MDTGXu+Q2
 +ODnYvidoRIEorZol6z7r9Q4DPNJKwZoVNW9HruQMSxXTZmpnRq1/4N8XL7Ihyf+A2ZHn6
 bn62WXlGlAh+gVuvOx4KGPSoa42xDQU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623224542;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ivckj2mJMI6wxy4FlL9rKevYAblouQ2aOXczIg6ZKnk=;
 b=GlPcLfqHe0fOz3HJ8BTPBgiG8dom0hc8s7SdJMNS2A5ONSyvrsCuNKNfBr5E/F/BxokYhe
 abMuffYhTaU5+HAw==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id BCD70118DD;
 Wed,  9 Jun 2021 07:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623224541; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ivckj2mJMI6wxy4FlL9rKevYAblouQ2aOXczIg6ZKnk=;
 b=fDJWz1f6G17LCLhYuqdKnwD4l/N6hps7cgNBK8rsMIIqi87Qf8vjysrdkRnVguUe970uyE
 T2t2y6Lt7p0RUWzgvFshE/K7u0Nq81kkakaOIiJzoWp3iYvr63gLZRNXwaLXfKI0T1RxkO
 wsbRmD3n4kjzocxw6mTWDHDiSKRqH4o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623224541;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ivckj2mJMI6wxy4FlL9rKevYAblouQ2aOXczIg6ZKnk=;
 b=o5BbATX7hGiiAFTrJXOImlo+8j9rADGnvHrhehTC3k6jDj9f7qOGSceZ8VDm+/vlUTxOcv
 ht/onChLxy5jlsBA==
Received: from director1.suse.de ([192.168.254.71]) by imap3-int with ESMTPSA
 id ka6CLN1wwGBAPgAALh3uQQ
 (envelope-from <tzimmermann@suse.de>); Wed, 09 Jun 2021 07:42:21 +0000
Date: Wed, 9 Jun 2021 09:42:20 +0200
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-next
Message-ID: <YMBw3DF2b9udByfT@linux-uq9g>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
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
Cc: dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave and Daniel,

here's the PR for drm-misc-next for this week. The big highlight is the new
DRM driver for HyperV graphics output. And TTM saw some refactoring to its
internals.

Best regards
Thomas

drm-misc-next-2021-06-09:
drm-misc-next for 5.14:

UAPI Changes:

 * drm/panfrost: Export AFBC_FEATURES register to userspace

Cross-subsystem Changes:

 * dma-buf: Fix debug printing; Rename dma_resv_*() functions + changes
   in callers; Cleanups

Core Changes:

 * Add prefetching memcpy for WC

 * Avoid circular dependency on CONFIG_FB

 * Cleanups

 * Documentation fixes throughout DRM

 * ttm: Make struct ttm_resource the base of all managers + changes
   in all users of TTM; Add a generic memcpy for page-based iomem; Remove
   use of VM_MIXEDMAP; Cleanups

Driver Changes:

 * drm/bridge: Add TI SN65DSI83 and SN65DSI84 + DT bindings

 * drm/hyperv: Add DRM driver for HyperV graphics output

 * drm/msm: Fix module dependencies

 * drm/panel: KD53T133: Support rotation

 * drm/pl111: Fix module dependencies

 * drm/qxl: Fixes

 * drm/stm: Cleanups

 * drm/sun4i: Be explicit about format modifiers

 * drm/vc4: Use struct gpio_desc; Cleanups

 * drm/vgem: Cleanups

 * drm/vmwgfx: Use ttm_bo_move_null() if there's nothing to copy

 * fbdev/mach64: Cleanups

 * fbdev/mb862xx: Use DEVICE_ATTR_RO
The following changes since commit 2e290c8d8d29278b9a20e2765ab8f6df02f2e707:

  drm: document minimum kernel version for DRM_CLIENT_CAP_* (2021-05-31 18:57:22 +0200)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-2021-06-09

for you to fetch changes up to 5b7a2c92b6102447a973f2f1ef19d660ec329881:

  drm/vmwgfx: use ttm_bo_move_null() when there is nothing to move (2021-06-09 09:10:22 +0200)

----------------------------------------------------------------
drm-misc-next for 5.14:

UAPI Changes:

 * drm/panfrost: Export AFBC_FEATURES register to userspace

Cross-subsystem Changes:

 * dma-buf: Fix debug printing; Rename dma_resv_*() functions + changes
   in callers; Cleanups

Core Changes:

 * Add prefetching memcpy for WC

 * Avoid circular dependency on CONFIG_FB

 * Cleanups

 * Documentation fixes throughout DRM

 * ttm: Make struct ttm_resource the base of all managers + changes
   in all users of TTM; Add a generic memcpy for page-based iomem; Remove
   use of VM_MIXEDMAP; Cleanups

Driver Changes:

 * drm/bridge: Add TI SN65DSI83 and SN65DSI84 + DT bindings

 * drm/hyperv: Add DRM driver for HyperV graphics output

 * drm/msm: Fix module dependencies

 * drm/panel: KD53T133: Support rotation

 * drm/pl111: Fix module dependencies

 * drm/qxl: Fixes

 * drm/stm: Cleanups

 * drm/sun4i: Be explicit about format modifiers

 * drm/vc4: Use struct gpio_desc; Cleanups

 * drm/vgem: Cleanups

 * drm/vmwgfx: Use ttm_bo_move_null() if there's nothing to copy

 * fbdev/mach64: Cleanups

 * fbdev/mb862xx: Use DEVICE_ATTR_RO

----------------------------------------------------------------
Alyssa Rosenzweig (2):
      drm/sched: Fix inverted comment for hang_limit
      drm/panfrost: Add AFBC_FEATURES parameter

Arnd Bergmann (1):
      drm/msm/a6xx: add CONFIG_QCOM_LLCC dependency

Chris Morgan (1):
      drm/panel: add rotation support for Elida KD35T133 panels

Christian König (25):
      drm/ttm: rename bo->mem and make it a pointer
      dma-buf: fix inconsistent debug print v2
      dma-buf: add SPDX header and fix style in dma-resv.c
      dma-buf: cleanup dma-resv shared fence debugging a bit v2
      drm/ttm: allocate resource object instead of embedding it v2
      drm/ttm: flip over the range manager to self allocated nodes
      drm/ttm: flip over the sys manager to self allocated nodes
      drm/amdgpu: revert "drm/amdgpu: stop allocating dummy GTT nodes"
      drm/amdkfd: use resource cursor in svm_migrate_copy_to_vram v2
      drm/amdgpu: switch the GTT backend to self alloc
      drm/amdgpu: switch the VRAM backend to self alloc
      drm/nouveau: switch the TTM backends to self alloc
      drm/vmwgfx: switch the TTM backends to self alloc
      drm/ttm: flip the switch for driver allocated resources v2
      dma-buf: add missing EXPORT_SYMBOL
      dma-buf: rename and cleanup dma_resv_get_excl v3
      dma-buf: rename and cleanup dma_resv_get_list v2
      dma-buf: rename dma_resv_get_excl_rcu to _unlocked
      dma-buf: drop the _rcu postfix on function names v3
      drm/ttm: fix missing res assignment in ttm_range_man_alloc
      RDMA/umem: fix missing automated rename
      drm/ttm: fix access to uninitialized variable.
      drm/ttm: fix warning after moving resource to ghost obj
      drm/ttm: fix pipelined gutting v2
      drm/ttm: nuke VM_MIXEDMAP on BO mappings v3

Colin Ian King (1):
      drm: qxl: ensure surf.data is ininitialized

Daniel Vetter (1):
      drm/doc: Include fence chain api

Deepak Rawat (3):
      drm/hyperv: Add DRM driver for hyperv synthetic video device
      drm/hyperv: Handle feature change message from device
      MAINTAINERS: Add maintainer for hyperv video device

Kees Cook (3):
      drm: Avoid circular dependencies for CONFIG_FB
      drm/pl111: depend on CONFIG_VEXPRESS_CONFIG
      drm/pl111: Actually fix CONFIG_VEXPRESS_CONFIG depends

Lee Jones (17):
      drm/vgem/vgem_drv: Standard comment blocks should not use kernel-doc format
      drm/mediatek/mtk_disp_color: Strip incorrect doc and demote header
      drm/mediatek/mtk_disp_gamma: Strip and demote non-conformant kernel-doc header
      drm/mediatek/mtk_disp_ovl: Strip and demote non-conformant header
      drm/mediatek/mtk_disp_rdma: Strip and demote non-conformant kernel-doc header
      drm/sti/sti_hdmi_tx3g4c28phy: Provide function names for kernel-doc headers
      drm/sti/sti_hda: Provide missing function names
      drm/sti/sti_tvout: Provide a bunch of missing function names
      drm/sti/sti_hqvdp: Fix incorrectly named function 'sti_hqvdp_vtg_cb()'
      drm/nouveau/nvkm/subdev/mc/tu102: Make functions called by reference static
      drm/ttm/ttm_tt: Demote non-conformant kernel-doc header
      drm/panel/panel-raspberrypi-touchscreen: Demote kernel-doc abuse
      drm/panel/panel-sitronix-st7701: Demote kernel-doc abuse
      drm/exynos/exynos7_drm_decon: Fix incorrect naming of 'decon_shadow_protect_win()'
      drm/exynos/exynos_drm_ipp: Fix documentation for 'exynos_drm_ipp_get_{caps,res}_ioctl()'
      drm/vboxvideo/hgsmi_base: Place function names into headers
      drm/vboxvideo/modesetting: Provide function names for prototype headers

Marek Vasut (4):
      dt-bindings: drm/bridge: ti-sn65dsi83: Add TI SN65DSI83 and SN65DSI84 bindings
      drm/bridge: ti-sn65dsi83: Add TI SN65DSI83 and SN65DSI84 driver
      drm/bridge: ti-sn65dsi83: Fix syntax formatting issues
      drm/stm: Remove usage of drm_display_mode_to_videomode()

Maxime Ripard (2):
      drm/vc4: hdmi: Fix error path of hpd-gpios
      drm/vc4: hdmi: Convert to gpiod

Nirmoy Das (1):
      drm/vmwgfx: use ttm_bo_move_null() when there is nothing to move

Paul Cercueil (1):
      drm: Fix misleading documentation of drm_gem_cma_create()

Piotr Oniszczuk (1):
      drm/sun4i: de3: Be explicit about supported modifiers

Thomas Hellström (5):
      drm/ttm: Add a generic TTM memcpy move for page-based iomem
      drm: Add a prefetching memcpy_from_wc
      drm/ttm: Use drm_memcpy_from_wc for TTM bo moves
      drm/ttm: Document and optimize ttm_bo_pipeline_gutting()
      drm/ttm, drm/amdgpu: Allow the driver some control over swapping

Zhen Lei (1):
      video: fbdev: mb862xx: use DEVICE_ATTR_RO macro

lijian (1):
      video: fbdev: atyfb: mach64_cursor.c: deleted the repeated word

 .../bindings/display/bridge/ti,sn65dsi83.yaml      | 159 +++++
 Documentation/driver-api/dma-buf.rst               |   9 +
 Documentation/gpu/drm-mm.rst                       |   4 +-
 MAINTAINERS                                        |   8 +
 drivers/dma-buf/dma-buf.c                          |  31 +-
 drivers/dma-buf/dma-resv.c                         | 211 +++---
 drivers/gpu/drm/Kconfig                            |  15 +-
 drivers/gpu/drm/Makefile                           |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c        |   5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c        |  15 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c            |   5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c        |  92 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c            |   5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c             |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |  54 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h         |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h     |   5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c           |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h          |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |  96 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c            |   5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |  23 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c       |  97 +--
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c           |  68 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |   4 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |   5 +-
 drivers/gpu/drm/bridge/Kconfig                     |  10 +
 drivers/gpu/drm/bridge/Makefile                    |   1 +
 drivers/gpu/drm/bridge/ti-sn65dsi83.c              | 709 +++++++++++++++++++++
 drivers/gpu/drm/drm_cache.c                        | 148 +++++
 drivers/gpu/drm/drm_drv.c                          |   2 +
 drivers/gpu/drm/drm_gem.c                          |   7 +-
 drivers/gpu/drm/drm_gem_atomic_helper.c            |   2 +-
 drivers/gpu/drm/drm_gem_cma_helper.c               |   3 +-
 drivers/gpu/drm/drm_gem_ttm_helper.c               |   6 +-
 drivers/gpu/drm/drm_gem_vram_helper.c              |   7 +-
 drivers/gpu/drm/etnaviv/etnaviv_gem.c              |  10 +-
 drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c       |   8 +-
 drivers/gpu/drm/exynos/exynos7_drm_decon.c         |   2 +-
 drivers/gpu/drm/exynos/exynos_drm_ipp.c            |   4 +-
 drivers/gpu/drm/hyperv/Makefile                    |   8 +
 drivers/gpu/drm/hyperv/hyperv_drm.h                |  52 ++
 drivers/gpu/drm/hyperv/hyperv_drm_drv.c            | 311 +++++++++
 drivers/gpu/drm/hyperv/hyperv_drm_modeset.c        | 231 +++++++
 drivers/gpu/drm/hyperv/hyperv_drm_proto.c          | 485 ++++++++++++++
 drivers/gpu/drm/i915/display/intel_display.c       |   2 +-
 drivers/gpu/drm/i915/dma_resv_utils.c              |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_busy.c           |   7 +-
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c     |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.h         |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_userptr.c        |   4 +-
 drivers/gpu/drm/i915/gem/i915_gem_wait.c           |  10 +-
 drivers/gpu/drm/i915/i915_request.c                |   6 +-
 drivers/gpu/drm/i915/i915_sw_fence.c               |   4 +-
 drivers/gpu/drm/mediatek/mtk_disp_color.c          |   3 +-
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c          |   4 +-
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c            |   3 +-
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c           |   4 +-
 drivers/gpu/drm/msm/Kconfig                        |   3 +-
 drivers/gpu/drm/msm/msm_gem.c                      |  11 +-
 drivers/gpu/drm/nouveau/dispnv50/wndw.c            |   2 +-
 drivers/gpu/drm/nouveau/nouveau_abi16.c            |   2 +-
 drivers/gpu/drm/nouveau/nouveau_bo.c               |  40 +-
 drivers/gpu/drm/nouveau/nouveau_chan.c             |   2 +-
 drivers/gpu/drm/nouveau/nouveau_fbcon.c            |   2 +-
 drivers/gpu/drm/nouveau/nouveau_fence.c            |   4 +-
 drivers/gpu/drm/nouveau/nouveau_gem.c              |  20 +-
 drivers/gpu/drm/nouveau/nouveau_mem.c              |  11 +-
 drivers/gpu/drm/nouveau/nouveau_mem.h              |  15 +-
 drivers/gpu/drm/nouveau/nouveau_ttm.c              |  32 +-
 drivers/gpu/drm/nouveau/nouveau_vmm.c              |   4 +-
 drivers/gpu/drm/nouveau/nv17_fence.c               |   2 +-
 drivers/gpu/drm/nouveau/nv50_fence.c               |   2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mc/tu102.c     |   6 +-
 drivers/gpu/drm/panel/panel-elida-kd35t133.c       |   8 +
 .../gpu/drm/panel/panel-raspberrypi-touchscreen.c  |   2 +-
 drivers/gpu/drm/panel/panel-sitronix-st7701.c      |   2 +-
 drivers/gpu/drm/panfrost/panfrost_device.h         |   1 +
 drivers/gpu/drm/panfrost/panfrost_drv.c            |   7 +-
 drivers/gpu/drm/panfrost/panfrost_gpu.c            |   1 +
 drivers/gpu/drm/panfrost/panfrost_job.c            |   2 +-
 drivers/gpu/drm/panfrost/panfrost_regs.h           |   1 +
 drivers/gpu/drm/pl111/Kconfig                      |   1 +
 drivers/gpu/drm/qxl/qxl_debugfs.c                  |   2 +-
 drivers/gpu/drm/qxl/qxl_drv.h                      |   6 +-
 drivers/gpu/drm/qxl/qxl_dumb.c                     |   2 +
 drivers/gpu/drm/qxl/qxl_object.c                   |  10 +-
 drivers/gpu/drm/qxl/qxl_ttm.c                      |   5 +-
 drivers/gpu/drm/radeon/radeon_cs.c                 |   8 +-
 drivers/gpu/drm/radeon/radeon_display.c            |   2 +-
 drivers/gpu/drm/radeon/radeon_gem.c                |  16 +-
 drivers/gpu/drm/radeon/radeon_mn.c                 |   4 +-
 drivers/gpu/drm/radeon/radeon_object.c             |  22 +-
 drivers/gpu/drm/radeon/radeon_object.h             |   4 +-
 drivers/gpu/drm/radeon/radeon_pm.c                 |   2 +-
 drivers/gpu/drm/radeon/radeon_sync.c               |   4 +-
 drivers/gpu/drm/radeon/radeon_trace.h              |   2 +-
 drivers/gpu/drm/radeon/radeon_ttm.c                |   9 +-
 drivers/gpu/drm/radeon/radeon_uvd.c                |   2 +-
 drivers/gpu/drm/sti/sti_hda.c                      |   6 +-
 drivers/gpu/drm/sti/sti_hdmi_tx3g4c28phy.c         |   4 +-
 drivers/gpu/drm/sti/sti_hqvdp.c                    |   2 +-
 drivers/gpu/drm/sti/sti_tvout.c                    |  18 +-
 drivers/gpu/drm/stm/ltdc.c                         |  33 +-
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c             |   7 +-
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c             |   8 +-
 drivers/gpu/drm/ttm/ttm_bo.c                       | 202 +++---
 drivers/gpu/drm/ttm/ttm_bo_util.c                  | 377 +++++------
 drivers/gpu/drm/ttm/ttm_bo_vm.c                    |  64 +-
 drivers/gpu/drm/ttm/ttm_module.c                   |  35 +
 drivers/gpu/drm/ttm/ttm_range_manager.c            |  57 +-
 drivers/gpu/drm/ttm/ttm_resource.c                 | 228 ++++++-
 drivers/gpu/drm/ttm/ttm_sys_manager.c              |  11 +-
 drivers/gpu/drm/ttm/ttm_tt.c                       |  47 +-
 drivers/gpu/drm/vboxvideo/hgsmi_base.c             |  19 +-
 drivers/gpu/drm/vboxvideo/modesetting.c            |  20 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c                     |  26 +-
 drivers/gpu/drm/vc4/vc4_hdmi.h                     |   3 +-
 drivers/gpu/drm/vgem/vgem_drv.c                    |   2 +-
 drivers/gpu/drm/vgem/vgem_fence.c                  |   3 +-
 drivers/gpu/drm/virtio/virtgpu_ioctl.c             |   5 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_blit.c               |   8 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c                 |  42 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c                |  10 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c             |   2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_context.c            |  12 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c            |  10 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c            |  12 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c      |  30 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c         |   8 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_resource.c           |   2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_shader.c             |  12 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_streamoutput.c       |   6 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c            |   6 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_thp.c                |  46 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c         |  12 +-
 drivers/infiniband/core/umem_dmabuf.c              |   2 +-
 drivers/video/fbdev/aty/mach64_cursor.c            |   2 +-
 drivers/video/fbdev/mb862xx/mb862xxfbdrv.c         |   6 +-
 include/drm/drm_cache.h                            |   7 +
 include/drm/gpu_scheduler.h                        |   2 +-
 include/drm/ttm/ttm_bo_api.h                       |   2 +-
 include/drm/ttm/ttm_bo_driver.h                    |  64 +-
 include/drm/ttm/ttm_caching.h                      |   2 +
 include/drm/ttm/ttm_kmap_iter.h                    |  61 ++
 include/drm/ttm/ttm_range_manager.h                |  42 ++
 include/drm/ttm/ttm_resource.h                     | 111 +++-
 include/drm/ttm/ttm_tt.h                           |  29 +
 include/linux/dma-resv.h                           |  75 +--
 include/uapi/drm/panfrost_drm.h                    |   1 +
 153 files changed, 3837 insertions(+), 1253 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
 create mode 100644 drivers/gpu/drm/bridge/ti-sn65dsi83.c
 create mode 100644 drivers/gpu/drm/hyperv/Makefile
 create mode 100644 drivers/gpu/drm/hyperv/hyperv_drm.h
 create mode 100644 drivers/gpu/drm/hyperv/hyperv_drm_drv.c
 create mode 100644 drivers/gpu/drm/hyperv/hyperv_drm_modeset.c
 create mode 100644 drivers/gpu/drm/hyperv/hyperv_drm_proto.c
 create mode 100644 include/drm/ttm/ttm_kmap_iter.h
 create mode 100644 include/drm/ttm/ttm_range_manager.h

--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 Nürnberg, Germany
(HRB 36809, AG Nürnberg)
Geschäftsführer: Felix Imendörffer
