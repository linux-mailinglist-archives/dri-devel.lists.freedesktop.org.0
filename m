Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C075B0FB5C
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jul 2025 22:21:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 633A110E854;
	Wed, 23 Jul 2025 20:21:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="cER45ss0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5503310E854
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 20:21:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 842D25C583A;
 Wed, 23 Jul 2025 20:20:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E11EBC4CEE7;
 Wed, 23 Jul 2025 20:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753302059;
 bh=RCPGXElC2zXgOoXs3F6jxLO36p5e7z4rZAyiHLlakPk=;
 h=From:To:Cc:Subject:Date:From;
 b=cER45ss0BHkFSIejdLkyFokzKAhFlGzIl0DF9vTw4dLGy2M8ynPi33BFv0molRLwD
 4LZ4c7sIaf27QyUCzGhpZFH0KSTYn6/rajAAy1ZzbaIAfwB6vf5HYda9pX8wsddlcS
 ocHRhZUOL10vVBNPWzL6C51IwbNJL3aE7sMu8YS2xBHhIDKkWgV8LFjJBba5C2oyLr
 nrhZHrKcQont/8cJgHl9ZWtbzEMbIrWDSUrI7T9pcPpzp4Oi15WS4virypnY+qqrTr
 nJif6IdjLwIQKt6ODCVwzwptpjNc4artQURLvMrLlN8vHuYIgRPN1wsTgMECsyFhgD
 ARAmpcOyHzNCQ==
From: Bjorn Helgaas <helgaas@kernel.org>
To: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH] drivers/gpu: Fix typos
Date: Wed, 23 Jul 2025 15:20:40 -0500
Message-ID: <20250723202054.2908794-1-helgaas@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
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

From: Bjorn Helgaas <bhelgaas@google.com>

Fix typos, most reported by "codespell drivers/gpu".  Only touches
comments, no code changes.

Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
 Documentation/gpu/amdgpu/driver-core.rst         |  2 +-
 drivers/gpu/drm/amd/amdgpu/Makefile              |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c   |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c       |  8 ++++----
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c          |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_pll.c          |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c          | 14 +++++++-------
 drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c          |  4 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c         |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h         |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c           |  2 +-
 drivers/gpu/drm/amd/amdgpu/cik_sdma.c            |  2 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c           |  2 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c            |  2 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c           |  2 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c           |  2 +-
 drivers/gpu/drm/amd/amdgpu/soc15.c               |  2 +-
 drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c            |  2 +-
 drivers/gpu/drm/amd/amdgpu/uvd_v4_2.c            |  4 ++--
 drivers/gpu/drm/amd/amdgpu/uvd_v5_0.c            |  4 ++--
 drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c            |  4 ++--
 drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c            |  6 +++---
 drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c            |  6 +++---
 drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c            |  4 ++--
 drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c            |  4 ++--
 drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c            |  6 +++---
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c            |  6 +++---
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c          |  4 ++--
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c          |  4 ++--
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c        |  2 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c    | 16 ++++++++--------
 .../amd/display/amdgpu_dm/amdgpu_dm_debugfs.c    |  6 +++---
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c   |  2 +-
 drivers/gpu/drm/amd/display/dc/core/dc.c         |  4 ++--
 drivers/gpu/drm/amd/display/dc/dc_bios_types.h   |  2 +-
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c     |  6 +++---
 drivers/gpu/drm/amd/display/dc/dce/dce_audio.c   |  2 +-
 .../gpu/drm/amd/display/dc/dcn20/dcn20_vmid.c    |  2 +-
 .../display/dc/dio/dcn20/dcn20_stream_encoder.c  |  2 +-
 .../dc/dio/dcn314/dcn314_dio_stream_encoder.c    |  2 +-
 .../dc/dio/dcn32/dcn32_dio_stream_encoder.c      |  2 +-
 .../dc/dio/dcn35/dcn35_dio_stream_encoder.c      |  2 +-
 .../dc/dio/dcn401/dcn401_dio_stream_encoder.c    |  2 +-
 .../display/dc/dml/dcn31/display_mode_vba_31.c   |  2 +-
 .../gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c |  4 ++--
 .../gpu/drm/amd/display/dc/link/link_detection.c |  6 +++---
 .../dc/link/protocols/link_dp_capability.c       |  4 ++--
 .../drm/amd/display/dc/optc/dcn20/dcn20_optc.c   |  4 ++--
 .../display/dc/resource/dcn35/dcn35_resource.c   |  4 ++--
 drivers/gpu/drm/amd/include/atombios.h           |  6 +++---
 drivers/gpu/drm/amd/include/atomfirmware.h       | 10 +++++-----
 drivers/gpu/drm/amd/pm/amdgpu_pm.c               |  2 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h    |  2 +-
 .../swsmu/inc/pmfw_if/smu13_driver_if_v13_0_0.h  |  2 +-
 .../swsmu/inc/pmfw_if/smu13_driver_if_v13_0_7.h  |  2 +-
 drivers/gpu/drm/display/drm_dp_helper.c          |  8 ++++----
 drivers/gpu/drm/display/drm_dp_mst_topology.c    |  6 +++---
 drivers/gpu/drm/drm_atomic.c                     |  2 +-
 drivers/gpu/drm/drm_connector.c                  |  2 +-
 drivers/gpu/drm/drm_gem.c                        |  2 +-
 drivers/gpu/drm/drm_gem_vram_helper.c            |  2 +-
 drivers/gpu/drm/drm_panel.c                      |  2 +-
 drivers/gpu/drm/drm_property.c                   |  2 +-
 drivers/gpu/drm/drm_syncobj.c                    |  2 +-
 drivers/gpu/drm/drm_vblank.c                     |  2 +-
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c            |  2 +-
 drivers/gpu/drm/gma500/psb_intel_drv.h           |  2 +-
 drivers/gpu/drm/i915/display/hsw_ips.c           |  2 +-
 .../gpu/drm/i915/display/intel_backlight_regs.h  |  4 ++--
 drivers/gpu/drm/i915/display/intel_color.c       |  2 +-
 drivers/gpu/drm/i915/display/intel_crt.c         |  2 +-
 drivers/gpu/drm/i915/display/intel_display.c     |  4 ++--
 drivers/gpu/drm/i915/display/intel_dp_hdcp.c     |  2 +-
 drivers/gpu/drm/i915/display/intel_lspcon.c      |  4 ++--
 drivers/gpu/drm/i915/display/intel_tv.c          |  2 +-
 drivers/gpu/drm/i915/gem/i915_gem_context.c      |  2 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.h       |  2 +-
 .../drm/i915/gem/i915_gem_object_frontbuffer.h   |  2 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c          |  2 +-
 .../gpu/drm/i915/gt/intel_execlists_submission.c |  2 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c   |  4 ++--
 drivers/gpu/drm/i915/i915_perf.c                 |  2 +-
 drivers/gpu/drm/i915/i915_request.c              |  2 +-
 drivers/gpu/drm/i915/i915_vma.c                  |  2 +-
 drivers/gpu/drm/i915/pxp/intel_pxp.c             |  2 +-
 drivers/gpu/drm/imagination/pvr_cccb.h           |  2 +-
 drivers/gpu/drm/kmb/kmb_dsi.c                    |  2 +-
 drivers/gpu/drm/kmb/kmb_dsi.h                    |  2 +-
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c        |  2 +-
 drivers/gpu/drm/meson/meson_venc.c               |  2 +-
 drivers/gpu/drm/mgag200/mgag200_drv.h            |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h           |  6 +++---
 drivers/gpu/drm/msm/dp/dp_audio.c                |  2 +-
 drivers/gpu/drm/msm/dsi/dsi_host.c               |  2 +-
 drivers/gpu/drm/msm/msm_drv.h                    |  2 +-
 drivers/gpu/drm/msm/msm_gem.c                    |  2 +-
 drivers/gpu/drm/msm/msm_gpu.h                    |  4 ++--
 drivers/gpu/drm/msm/msm_ringbuffer.h             |  2 +-
 .../gpu/drm/msm/registers/adreno/adreno_pm4.xml  |  2 +-
 drivers/gpu/drm/nouveau/Kconfig                  |  2 +-
 drivers/gpu/drm/nouveau/dispnv04/crtc.c          |  2 +-
 drivers/gpu/drm/nouveau/dispnv50/crc.c           |  2 +-
 drivers/gpu/drm/nouveau/nouveau_display.c        |  2 +-
 drivers/gpu/drm/nouveau/nouveau_exec.c           |  2 +-
 drivers/gpu/drm/nouveau/nouveau_uvmm.c           |  4 ++--
 .../drm/nouveau/nvkm/subdev/pmu/fuc/kernel.fuc   |  2 +-
 drivers/gpu/drm/omapdrm/dss/dispc.c              |  2 +-
 drivers/gpu/drm/omapdrm/omap_gem.c               |  2 +-
 drivers/gpu/drm/panfrost/panfrost_job.h          |  2 +-
 drivers/gpu/drm/qxl/qxl_cmd.c                    |  4 ++--
 drivers/gpu/drm/radeon/atombios.h                |  2 +-
 drivers/gpu/drm/radeon/cik.c                     |  4 ++--
 drivers/gpu/drm/radeon/cik_sdma.c                |  2 +-
 drivers/gpu/drm/radeon/cikd.h                    |  2 +-
 drivers/gpu/drm/radeon/ni_dma.c                  |  2 +-
 drivers/gpu/drm/radeon/r600_dma.c                |  2 +-
 drivers/gpu/drm/radeon/radeon_connectors.c       |  2 +-
 drivers/gpu/drm/radeon/radeon_device.c           |  4 ++--
 drivers/gpu/drm/radeon/radeon_display.c          |  2 +-
 drivers/gpu/drm/radeon/radeon_family.h           |  2 +-
 drivers/gpu/drm/radeon/radeon_gem.c              |  2 +-
 drivers/gpu/drm/radeon/radeon_uvd.c              |  2 +-
 drivers/gpu/drm/radeon/radeon_vce.c              |  2 +-
 drivers/gpu/drm/radeon/radeon_vm.c               |  2 +-
 drivers/gpu/drm/radeon/uvd_v1_0.c                |  6 +++---
 drivers/gpu/drm/radeon/uvd_v2_2.c                |  2 +-
 drivers/gpu/drm/radeon/uvd_v4_2.c                |  2 +-
 drivers/gpu/drm/scheduler/sched_fence.c          |  2 +-
 drivers/gpu/drm/tegra/sor.c                      |  2 +-
 drivers/gpu/drm/tidss/tidss_crtc.c               | 10 +++++-----
 drivers/gpu/drm/vmwgfx/ttm_object.c              |  2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c       |  4 ++--
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c          |  2 +-
 drivers/gpu/drm/xen/xen_drm_front_kms.c          |  2 +-
 135 files changed, 207 insertions(+), 207 deletions(-)

diff --git a/Documentation/gpu/amdgpu/driver-core.rst b/Documentation/gpu/amdgpu/driver-core.rst
index 81256318e93c..bd4be32f2725 100644
--- a/Documentation/gpu/amdgpu/driver-core.rst
+++ b/Documentation/gpu/amdgpu/driver-core.rst
@@ -65,7 +65,7 @@ SDMA (System DMA)
 
 GC (Graphics and Compute)
     This is the graphics and compute engine, i.e., the block that
-    encompasses the 3D pipeline and and shader blocks.  This is by far the
+    encompasses the 3D pipeline and shader blocks.  This is by far the
     largest block on the GPU.  The 3D pipeline has tons of sub-blocks.  In
     addition to that, it also contains the CP microcontrollers (ME, PFP, CE,
     MEC) and the RLC microcontroller.  It's exposed to userspace for user mode
diff --git a/drivers/gpu/drm/amd/amdgpu/Makefile b/drivers/gpu/drm/amd/amdgpu/Makefile
index 87080c06e5fc..84bbcedc8e1d 100644
--- a/drivers/gpu/drm/amd/amdgpu/Makefile
+++ b/drivers/gpu/drm/amd/amdgpu/Makefile
@@ -288,7 +288,7 @@ amdgpu-y += amdgpu_cgs.o
 # GPU scheduler
 amdgpu-y += amdgpu_job.o
 
-# ACP componet
+# ACP component
 ifneq ($(CONFIG_DRM_AMD_ACP),)
 amdgpu-y += amdgpu_acp.o
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index 260165bbe373..e4812f8c6348 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -927,7 +927,7 @@ static int kfd_mem_attach(struct amdgpu_device *adev, struct kgd_mem *mem,
 			ret = create_dmamap_sg_bo(adev, mem, &bo[i]);
 			if (ret)
 				goto unwind;
-		/* Enable acces to GTT and VRAM BOs of peer devices */
+		/* Enable access to GTT and VRAM BOs of peer devices */
 		} else if (mem->domain == AMDGPU_GEM_DOMAIN_GTT ||
 			   mem->domain == AMDGPU_GEM_DOMAIN_VRAM) {
 			attachment[i]->type = KFD_MEM_ATT_DMABUF;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
index 5e375e9c4f5d..3c7699ca3a0e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
@@ -1009,7 +1009,7 @@ static void amdgpu_connector_shared_ddc(enum drm_connector_status *status,
  * If we got no DDC, we do load detection on the DAC encoder object.
  * If we got analog DDC or load detection passes on the DAC encoder
  * we have to check if this analog encoder is shared with anyone else (TV)
- * if its shared we have to set the other connector to disconnected.
+ * if it's shared we have to set the other connector to disconnected.
  */
 static enum drm_connector_status
 amdgpu_connector_dvi_detect(struct drm_connector *connector, bool force)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index e1bab6a96cb6..9c16cc6026c1 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -2377,7 +2377,7 @@ int amdgpu_device_ip_wait_for_idle(struct amdgpu_device *adev,
  * @block_type: Type of hardware IP (SMU, GFX, UVD, etc.)
  *
  * Check if the hardware IP is enable or not.
- * Returns true if it the IP is enable, false if not.
+ * Returns true if the IP is enabled, false if not.
  */
 bool amdgpu_device_ip_is_valid(struct amdgpu_device *adev,
 			       enum amd_ip_block_type block_type)
@@ -2829,7 +2829,7 @@ static int amdgpu_device_ip_early_init(struct amdgpu_device *adev)
 				}
 			}
 
-			/*get pf2vf msg info at it's earliest time*/
+			/*get pf2vf msg info at its earliest time*/
 			if (amdgpu_sriov_vf(adev))
 				amdgpu_virt_init_data_exchange(adev);
 
@@ -6239,7 +6239,7 @@ static void amdgpu_device_gpu_resume(struct amdgpu_device *adev,
 			amdgpu_amdkfd_post_reset(tmp_adev);
 
 		/* kfd_post_reset will do nothing if kfd device is not initialized,
-		 * need to bring up kfd here if it's not be initialized before
+		 * need to bring up kfd here if it's not been initialized before
 		 */
 		if (!adev->kfd.init_complete)
 			amdgpu_amdkfd_device_init(adev);
@@ -6896,7 +6896,7 @@ pci_ers_result_t amdgpu_pci_slot_reset(struct pci_dev *pdev)
  * amdgpu_pci_resume() - resume normal ops after PCI reset
  * @pdev: pointer to PCI device
  *
- * Called when the error recovery driver tells us that its
+ * Called when the error recovery driver tells us that it's
  * OK to resume normal operation.
  */
 void amdgpu_pci_resume(struct pci_dev *pdev)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
index 0ecc88df7208..73c0d298c0ce 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
@@ -653,7 +653,7 @@ unsigned long amdgpu_gem_timeout(uint64_t timeout_ns)
 	unsigned long timeout_jiffies;
 	ktime_t timeout;
 
-	/* clamp timeout if it's to large */
+	/* clamp timeout if it's too large */
 	if (((int64_t)timeout_ns) < 0)
 		return MAX_SCHEDULE_TIMEOUT;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_pll.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_pll.c
index 675aa138ea11..166d0f56c1d1 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_pll.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_pll.c
@@ -105,7 +105,7 @@ static void amdgpu_pll_get_fb_ref_div(struct amdgpu_device *adev, unsigned int n
 }
 
 /**
- * amdgpu_pll_compute - compute PLL paramaters
+ * amdgpu_pll_compute - compute PLL parameters
  *
  * @adev: amdgpu_device pointer
  * @pll: information about the PLL
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
index de0944947eaf..e911d388fd49 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
@@ -407,7 +407,7 @@ static void amdgpu_ras_instance_mask_check(struct amdgpu_device *adev,
  * head has four members, they are block, type, sub_block_index, name.
  * block: which IP will be under control.
  * type: what kind of error will be enabled/disabled/injected.
- * sub_block_index: some IPs have subcomponets. say, GFX, sDMA.
+ * sub_block_index: some IPs have subcomponents. say, GFX, sDMA.
  * name: the name of IP.
  *
  * inject has three more members than head, they are address, value and mask.
@@ -861,7 +861,7 @@ int amdgpu_ras_feature_enable_on_boot(struct amdgpu_device *adev,
 	if (con->flags & AMDGPU_RAS_FLAG_INIT_BY_VBIOS) {
 		if (enable) {
 			/* There is no harm to issue a ras TA cmd regardless of
-			 * the currecnt ras state.
+			 * the current ras state.
 			 * If current state == target state, it will do nothing
 			 * But sometimes it requests driver to reset and repost
 			 * with error code -EAGAIN.
@@ -1629,8 +1629,8 @@ static int amdgpu_ras_query_error_count_helper(struct amdgpu_device *adev,
 /**
  * amdgpu_ras_query_error_count -- Get error counts of all IPs or specific IP
  * @adev: pointer to AMD GPU device
- * @ce_count: pointer to an integer to be set to the count of correctible errors.
- * @ue_count: pointer to an integer to be set to the count of uncorrectible
+ * @ce_count: pointer to an integer to be set to the count of correctable errors.
+ * @ue_count: pointer to an integer to be set to the count of uncorrectable
  * errors.
  * @query_info: pointer to ras_query_if if the query request is only for
  * specific ip block; if info is NULL, then the qurey request is for
@@ -2284,7 +2284,7 @@ static void amdgpu_ras_interrupt_umc_handler(struct ras_manager *obj,
 	amdgpu_ras_set_fed(obj->adev, true);
 	ret = data->cb(obj->adev, &err_data, entry);
 	/* ue will trigger an interrupt, and in that case
-	 * we need do a reset to recovery the whole system.
+	 * we need to do a reset to recover the whole system.
 	 * But leave IP do that recovery, here we just dispatch
 	 * the error.
 	 */
@@ -2397,7 +2397,7 @@ int amdgpu_ras_interrupt_add_handler(struct amdgpu_device *adev,
 	struct amdgpu_ras_block_object *ras_obj;
 
 	if (!obj) {
-		/* in case we registe the IH before enable ras feature */
+		/* in case we register the IH before enable ras feature */
 		obj = amdgpu_ras_create_obj(adev, head);
 		if (!obj)
 			return -EINVAL;
@@ -4143,7 +4143,7 @@ int amdgpu_ras_block_late_init(struct amdgpu_device *adev,
 			return r;
 	}
 
-	/* check for errors on warm reset edc persisant supported ASIC */
+	/* check for errors on warm reset edc persistent supported ASIC */
 	amdgpu_persistent_edc_harvesting(adev, ras_block);
 
 	/* in resume phase, no need to create ras fs node */
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
index 74758b5ffc6c..a271955dd464 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
@@ -938,7 +938,7 @@ static int amdgpu_uvd_cs_pass2(struct amdgpu_uvd_cs_ctx *ctx)
 	cmd = amdgpu_ib_get_value(ctx->ib, ctx->idx) >> 1;
 	if (cmd < 0x4) {
 		if ((end - start) < ctx->buf_sizes[cmd]) {
-			DRM_ERROR("buffer (%d) to small (%d / %d)!\n", cmd,
+			DRM_ERROR("buffer (%d) too small (%d / %d)!\n", cmd,
 				  (unsigned int)(end - start),
 				  ctx->buf_sizes[cmd]);
 			return -EINVAL;
@@ -946,7 +946,7 @@ static int amdgpu_uvd_cs_pass2(struct amdgpu_uvd_cs_ctx *ctx)
 
 	} else if (cmd == 0x206) {
 		if ((end - start) < ctx->buf_sizes[4]) {
-			DRM_ERROR("buffer (%d) to small (%d / %d)!\n", cmd,
+			DRM_ERROR("buffer (%d) too small (%d / %d)!\n", cmd,
 					  (unsigned int)(end - start),
 					  ctx->buf_sizes[4]);
 			return -EINVAL;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
index 13f0cdeb59c4..2c5eabccd894 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
@@ -103,7 +103,7 @@ int amdgpu_virt_request_full_gpu(struct amdgpu_device *adev, bool init)
  * @adev:	amdgpu device.
  * @init:	is driver init time.
  * When finishing driver init/fini, need to release full gpu access.
- * Return: Zero if release success, otherwise will returen error.
+ * Return: Zero if release success, otherwise will return error.
  */
 int amdgpu_virt_release_full_gpu(struct amdgpu_device *adev, bool init)
 {
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h
index 577c6194db78..696d4d2b781b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h
@@ -113,7 +113,7 @@ struct amdgpu_virt_fw_reserve {
 /*
  * Legacy GIM header
  *
- * Defination between PF and VF
+ * Definition between PF and VF
  * Structures forcibly aligned to 4 to keep the same style as PF.
  */
 #define AMDGIM_DATAEXCHANGE_OFFSET		(64 * 1024)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index 3911c78f8282..c760499c2ad4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -2089,7 +2089,7 @@ int amdgpu_vm_bo_clear_mappings(struct amdgpu_device *adev,
  * @vm: the requested VM
  * @addr: the address
  *
- * Find a mapping by it's address.
+ * Find a mapping by its address.
  *
  * Returns:
  * The amdgpu_bo_va_mapping matching for addr or NULL
diff --git a/drivers/gpu/drm/amd/amdgpu/cik_sdma.c b/drivers/gpu/drm/amd/amdgpu/cik_sdma.c
index 9e8715b4739d..456fb68d7bf3 100644
--- a/drivers/gpu/drm/amd/amdgpu/cik_sdma.c
+++ b/drivers/gpu/drm/amd/amdgpu/cik_sdma.c
@@ -86,7 +86,7 @@ static void cik_sdma_free_microcode(struct amdgpu_device *adev)
  * and 2 queues used for compute.
  *
  * The programming model is very similar to the CP
- * (ring buffer, IBs, etc.), but sDMA has it's own
+ * (ring buffer, IBs, etc.), but sDMA has its own
  * packet format that is different from the PM4 format
  * used by the CP. sDMA supports copying data, writing
  * embedded data, solid fills, and a number of other
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
index a3e2787501f1..1c5d47ece013 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
@@ -115,7 +115,7 @@ static int gmc_v10_0_process_interrupt(struct amdgpu_device *adev,
 	if (retry_fault) {
 		/* Returning 1 here also prevents sending the IV to the KFD */
 
-		/* Process it onyl if it's the first fault for this address */
+		/* Process it only if it's the first fault for this address */
 		if (entry->ih != &adev->irq.ih_soft &&
 		    amdgpu_gmc_filter_faults(adev, entry->ih, addr, entry->pasid,
 					     entry->timestamp))
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
index 282197f4ffb1..66b8e9caf4ad 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
@@ -605,7 +605,7 @@ static int gmc_v9_0_process_interrupt(struct amdgpu_device *adev,
 			if (ret)
 				return 1;
 		} else {
-			/* Process it onyl if it's the first fault for this address */
+			/* Process it only if it's the first fault for this address */
 			if (entry->ih != &adev->irq.ih_soft &&
 			    amdgpu_gmc_filter_faults(adev, entry->ih, addr, entry->pasid,
 					     entry->timestamp))
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c b/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c
index 92ce580647cd..35f7604d44f7 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c
@@ -83,7 +83,7 @@ static const u32 iceland_mgcg_cgcg_init[] = {
  * and 2 queues used for compute.
  *
  * The programming model is very similar to the CP
- * (ring buffer, IBs, etc.), but sDMA has it's own
+ * (ring buffer, IBs, etc.), but sDMA has its own
  * packet format that is different from the PM4 format
  * used by the CP. sDMA supports copying data, writing
  * embedded data, solid fills, and a number of other
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c
index 1c076bd1cf73..dccfc805b57e 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c
@@ -187,7 +187,7 @@ static const u32 stoney_mgcg_cgcg_init[] =
  * and 2 queues used for compute.
  *
  * The programming model is very similar to the CP
- * (ring buffer, IBs, etc.), but sDMA has it's own
+ * (ring buffer, IBs, etc.), but sDMA has its own
  * packet format that is different from the PM4 format
  * used by the CP. sDMA supports copying data, writing
  * embedded data, solid fills, and a number of other
diff --git a/drivers/gpu/drm/amd/amdgpu/soc15.c b/drivers/gpu/drm/amd/amdgpu/soc15.c
index c457be3a3c56..b6ff0d724597 100644
--- a/drivers/gpu/drm/amd/amdgpu/soc15.c
+++ b/drivers/gpu/drm/amd/amdgpu/soc15.c
@@ -464,7 +464,7 @@ static int soc15_read_register(struct amdgpu_device *adev, u32 se_num,
  * @regs: pointer to the register array
  * @array_size: size of the register array
  *
- * Programs an array or registers with and and or masks.
+ * Programs an array or registers with AND and OR masks.
  * This is a helper for setting golden registers.
  */
 
diff --git a/drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c b/drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c
index 5dbaebb592b3..3dc56b2a3a3c 100644
--- a/drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c
+++ b/drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c
@@ -235,7 +235,7 @@ static void uvd_v3_1_set_dcm(struct amdgpu_device *adev,
  *
  * @adev: amdgpu_device pointer
  *
- * Let the UVD memory controller know it's offsets
+ * Let the UVD memory controller know its offsets
  */
 static void uvd_v3_1_mc_resume(struct amdgpu_device *adev)
 {
diff --git a/drivers/gpu/drm/amd/amdgpu/uvd_v4_2.c b/drivers/gpu/drm/amd/amdgpu/uvd_v4_2.c
index 4b96fd583772..8329040a30e0 100644
--- a/drivers/gpu/drm/amd/amdgpu/uvd_v4_2.c
+++ b/drivers/gpu/drm/amd/amdgpu/uvd_v4_2.c
@@ -368,7 +368,7 @@ static int uvd_v4_2_start(struct amdgpu_device *adev)
 		return r;
 	}
 
-	/* enable interupt */
+	/* enable interrupt */
 	WREG32_P(mmUVD_MASTINT_EN, 3<<1, ~(3 << 1));
 
 	WREG32_P(mmUVD_STATUS, 0, ~(1<<2));
@@ -569,7 +569,7 @@ static void uvd_v4_2_ring_insert_nop(struct amdgpu_ring *ring, uint32_t count)
  *
  * @adev: amdgpu_device pointer
  *
- * Let the UVD memory controller know it's offsets
+ * Let the UVD memory controller know its offsets
  */
 static void uvd_v4_2_mc_resume(struct amdgpu_device *adev)
 {
diff --git a/drivers/gpu/drm/amd/amdgpu/uvd_v5_0.c b/drivers/gpu/drm/amd/amdgpu/uvd_v5_0.c
index 71409ad8b7ed..feb48bba81bd 100644
--- a/drivers/gpu/drm/amd/amdgpu/uvd_v5_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/uvd_v5_0.c
@@ -275,7 +275,7 @@ static int uvd_v5_0_resume(struct amdgpu_ip_block *ip_block)
  *
  * @adev: amdgpu_device pointer
  *
- * Let the UVD memory controller know it's offsets
+ * Let the UVD memory controller know its offsets
  */
 static void uvd_v5_0_mc_resume(struct amdgpu_device *adev)
 {
@@ -333,7 +333,7 @@ static int uvd_v5_0_start(struct amdgpu_device *adev)
 
 	uvd_v5_0_mc_resume(adev);
 
-	/* disable interupt */
+	/* disable interrupt */
 	WREG32_P(mmUVD_MASTINT_EN, 0, ~(1 << 1));
 
 	/* stall UMC and register bus before resetting VCPU */
diff --git a/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c b/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c
index 1c07b701d0e4..fc7520549f7b 100644
--- a/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c
@@ -599,7 +599,7 @@ static int uvd_v6_0_resume(struct amdgpu_ip_block *ip_block)
  *
  * @adev: amdgpu_device pointer
  *
- * Let the UVD memory controller know it's offsets
+ * Let the UVD memory controller know its offsets
  */
 static void uvd_v6_0_mc_resume(struct amdgpu_device *adev)
 {
@@ -738,7 +738,7 @@ static int uvd_v6_0_start(struct amdgpu_device *adev)
 
 	uvd_v6_0_mc_resume(adev);
 
-	/* disable interupt */
+	/* disable interrupt */
 	WREG32_FIELD(UVD_MASTINT_EN, VCPU_EN, 0);
 
 	/* stall UMC and register bus before resetting VCPU */
diff --git a/drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c b/drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c
index 9d237b5937fb..8d13c78d21fe 100644
--- a/drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c
@@ -667,7 +667,7 @@ static int uvd_v7_0_resume(struct amdgpu_ip_block *ip_block)
  *
  * @adev: amdgpu_device pointer
  *
- * Let the UVD memory controller know it's offsets
+ * Let the UVD memory controller know its offsets
  */
 static void uvd_v7_0_mc_resume(struct amdgpu_device *adev)
 {
@@ -866,7 +866,7 @@ static int uvd_v7_0_sriov_start(struct amdgpu_device *adev)
 			MMSCH_V1_0_INSERT_DIRECT_RD_MOD_WT(SOC15_REG_OFFSET(UVD, i, mmUVD_CGC_CTRL),
 							   ~UVD_CGC_CTRL__DYN_CLOCK_MODE_MASK, 0);
 
-			/* disable interupt */
+			/* disable interrupt */
 			MMSCH_V1_0_INSERT_DIRECT_RD_MOD_WT(SOC15_REG_OFFSET(UVD, i, mmUVD_MASTINT_EN),
 							   ~UVD_MASTINT_EN__VCPU_EN_MASK, 0);
 
@@ -979,7 +979,7 @@ static int uvd_v7_0_start(struct amdgpu_device *adev)
 		WREG32_P(SOC15_REG_OFFSET(UVD, k, mmUVD_CGC_CTRL), 0,
 				~UVD_CGC_CTRL__DYN_CLOCK_MODE_MASK);
 
-		/* disable interupt */
+		/* disable interrupt */
 		WREG32_P(SOC15_REG_OFFSET(UVD, k, mmUVD_MASTINT_EN), 0,
 				~UVD_MASTINT_EN__VCPU_EN_MASK);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c
index c74947705d77..06998716b1bb 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c
@@ -343,7 +343,7 @@ static int vcn_v1_0_resume(struct amdgpu_ip_block *ip_block)
  *
  * @vinst: VCN instance
  *
- * Let the VCN memory controller know it's offsets
+ * Let the VCN memory controller know its offsets
  */
 static void vcn_v1_0_mc_resume_spg_mode(struct amdgpu_vcn_inst *vinst)
 {
@@ -856,7 +856,7 @@ static int vcn_v1_0_start_spg_mode(struct amdgpu_vcn_inst *vinst)
 	/* disable clock gating */
 	vcn_v1_0_disable_clock_gating(vinst);
 
-	/* disable interupt */
+	/* disable interrupt */
 	WREG32_P(SOC15_REG_OFFSET(UVD, 0, mmUVD_MASTINT_EN), 0,
 			~UVD_MASTINT_EN__VCPU_EN_MASK);
 
@@ -1044,7 +1044,7 @@ static int vcn_v1_0_start_dpg_mode(struct amdgpu_vcn_inst *vinst)
 	tmp |= UVD_VCPU_CNTL__MIF_WR_LOW_THRESHOLD_BP_MASK;
 	WREG32_SOC15_DPG_MODE_1_0(UVD, 0, mmUVD_VCPU_CNTL, tmp, 0xFFFFFFFF, 0);
 
-	/* disable interupt */
+	/* disable interrupt */
 	WREG32_SOC15_DPG_MODE_1_0(UVD, 0, mmUVD_MASTINT_EN,
 			0, UVD_MASTINT_EN__VCPU_EN_MASK, 0);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c
index 148b651be7ca..ffe1f3f500cc 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c
@@ -371,7 +371,7 @@ static int vcn_v2_0_resume(struct amdgpu_ip_block *ip_block)
  *
  * @vinst: Pointer to the VCN instance structure
  *
- * Let the VCN memory controller know it's offsets
+ * Let the VCN memory controller know its offsets
  */
 static void vcn_v2_0_mc_resume(struct amdgpu_vcn_inst *vinst)
 {
@@ -873,7 +873,7 @@ static int vcn_v2_0_start_dpg_mode(struct amdgpu_vcn_inst *vinst, bool indirect)
 	WREG32_SOC15_DPG_MODE(0, SOC15_DPG_MODE_OFFSET(
 		UVD, 0, mmUVD_VCPU_CNTL), tmp, 0, indirect);
 
-	/* disable master interupt */
+	/* disable master interrupt */
 	WREG32_SOC15_DPG_MODE(0, SOC15_DPG_MODE_OFFSET(
 		UVD, 0, mmUVD_MASTINT_EN), 0, 0, indirect);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c b/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c
index 58b527a6b795..ca59d5ff6bb0 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c
@@ -602,7 +602,7 @@ static int vcn_v2_5_resume(struct amdgpu_ip_block *ip_block)
  *
  * @vinst: VCN instance
  *
- * Let the VCN memory controller know it's offsets
+ * Let the VCN memory controller know its offsets
  */
 static void vcn_v2_5_mc_resume(struct amdgpu_vcn_inst *vinst)
 {
@@ -1045,7 +1045,7 @@ static int vcn_v2_5_start_dpg_mode(struct amdgpu_vcn_inst *vinst, bool indirect)
 	WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
 		VCN, 0, mmUVD_VCPU_CNTL), tmp, 0, indirect);
 
-	/* disable master interupt */
+	/* disable master interrupt */
 	WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
 		VCN, 0, mmUVD_MASTINT_EN), 0, 0, indirect);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
index 9fb0d5380589..17898d0f3268 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
@@ -512,7 +512,7 @@ static int vcn_v3_0_resume(struct amdgpu_ip_block *ip_block)
  *
  * @vinst: VCN instance
  *
- * Let the VCN memory controller know it's offsets
+ * Let the VCN memory controller know its offsets
  */
 static void vcn_v3_0_mc_resume(struct amdgpu_vcn_inst *vinst)
 {
@@ -1052,7 +1052,7 @@ static int vcn_v3_0_start_dpg_mode(struct amdgpu_vcn_inst *vinst, bool indirect)
 	WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
 		VCN, inst_idx, mmUVD_VCPU_CNTL), tmp, 0, indirect);
 
-	/* disable master interupt */
+	/* disable master interrupt */
 	WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
 		VCN, inst_idx, mmUVD_MASTINT_EN), 0, 0, indirect);
 
@@ -1147,7 +1147,7 @@ static int vcn_v3_0_start_dpg_mode(struct amdgpu_vcn_inst *vinst, bool indirect)
 	WREG32_SOC15(VCN, inst_idx, mmUVD_RBC_RB_RPTR_ADDR,
 		(upper_32_bits(ring->gpu_addr) >> 2));
 
-	/* programm the RB_BASE for ring buffer */
+	/* program the RB_BASE for ring buffer */
 	WREG32_SOC15(VCN, inst_idx, mmUVD_LMI_RBC_RB_64BIT_BAR_LOW,
 		lower_32_bits(ring->gpu_addr));
 	WREG32_SOC15(VCN, inst_idx, mmUVD_LMI_RBC_RB_64BIT_BAR_HIGH,
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
index b5071f77f78d..e0af4fd49f00 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
@@ -453,7 +453,7 @@ static int vcn_v4_0_resume(struct amdgpu_ip_block *ip_block)
  *
  * @vinst: VCN instance
  *
- * Let the VCN memory controller know it's offsets
+ * Let the VCN memory controller know its offsets
  */
 static void vcn_v4_0_mc_resume(struct amdgpu_vcn_inst *vinst)
 {
@@ -515,7 +515,7 @@ static void vcn_v4_0_mc_resume(struct amdgpu_vcn_inst *vinst)
  * @vinst: VCN instance
  * @indirect: indirectly write sram
  *
- * Let the VCN memory controller know it's offsets with dpg mode
+ * Let the VCN memory controller know its offsets with dpg mode
  */
 static void vcn_v4_0_mc_resume_dpg_mode(struct amdgpu_vcn_inst *vinst,
 					bool indirect)
@@ -1033,7 +1033,7 @@ static int vcn_v4_0_start_dpg_mode(struct amdgpu_vcn_inst *vinst, bool indirect)
 	WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
 		VCN, inst_idx, regUVD_VCPU_CNTL), tmp, 0, indirect);
 
-	/* disable master interupt */
+	/* disable master interrupt */
 	WREG32_SOC15_DPG_MODE(inst_idx, SOC15_DPG_MODE_OFFSET(
 		VCN, inst_idx, regUVD_MASTINT_EN), 0, 0, indirect);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c
index 5a33140f5723..53a73819ff7b 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c
@@ -450,7 +450,7 @@ static int vcn_v4_0_3_resume(struct amdgpu_ip_block *ip_block)
  *
  * @vinst: VCN instance
  *
- * Let the VCN memory controller know it's offsets
+ * Let the VCN memory controller know its offsets
  */
 static void vcn_v4_0_3_mc_resume(struct amdgpu_vcn_inst *vinst)
 {
@@ -526,7 +526,7 @@ static void vcn_v4_0_3_mc_resume(struct amdgpu_vcn_inst *vinst)
  * @vinst: VCN instance
  * @indirect: indirectly write sram
  *
- * Let the VCN memory controller know it's offsets with dpg mode
+ * Let the VCN memory controller know its offsets with dpg mode
  */
 static void vcn_v4_0_3_mc_resume_dpg_mode(struct amdgpu_vcn_inst *vinst,
 					  bool indirect)
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c
index 16ade84facc7..83b1a599db6f 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c
@@ -403,7 +403,7 @@ static int vcn_v4_0_5_resume(struct amdgpu_ip_block *ip_block)
  *
  * @vinst: VCN instance
  *
- * Let the VCN memory controller know it's offsets
+ * Let the VCN memory controller know its offsets
  */
 static void vcn_v4_0_5_mc_resume(struct amdgpu_vcn_inst *vinst)
 {
@@ -465,7 +465,7 @@ static void vcn_v4_0_5_mc_resume(struct amdgpu_vcn_inst *vinst)
  * @vinst: VCN instance
  * @indirect: indirectly write sram
  *
- * Let the VCN memory controller know it's offsets with dpg mode
+ * Let the VCN memory controller know its offsets with dpg mode
  */
 static void vcn_v4_0_5_mc_resume_dpg_mode(struct amdgpu_vcn_inst *vinst,
 					  bool indirect)
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_topology.c b/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
index baa2374acdeb..0e6cd88b72e6 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
@@ -1002,7 +1002,7 @@ int kfd_topology_init(void)
 	 * topology_device_list
 	 */
 
-	/* Initialize the head for the both the lists */
+	/* Initialize the head for both lists */
 	INIT_LIST_HEAD(&topology_device_list);
 	INIT_LIST_HEAD(&temp_topology_device_list);
 	init_rwsem(&topology_lock);
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index d3100f641ac6..98425a1843cd 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -5935,7 +5935,7 @@ static void fill_dc_dirty_rects(struct drm_plane *plane,
 	*dirty_regions_changed = false;
 
 	/*
-	 * Cursor plane has it's own dirty rect update interface. See
+	 * Cursor plane has its own dirty rect update interface. See
 	 * dcn10_dmub_update_cursor_data and dmub_cmd_update_cursor_info_data
 	 */
 	if (plane->type == DRM_PLANE_TYPE_CURSOR)
@@ -10537,17 +10537,17 @@ void dm_restore_drm_connector_state(struct drm_device *dev,
  * Grabs all modesetting locks to serialize against any blocking commits,
  * Waits for completion of all non blocking commits.
  */
-static int do_aquire_global_lock(struct drm_device *dev,
-				 struct drm_atomic_state *state)
+static int do_acquire_global_lock(struct drm_device *dev,
+				  struct drm_atomic_state *state)
 {
 	struct drm_crtc *crtc;
 	struct drm_crtc_commit *commit;
 	long ret;
 
 	/*
-	 * Adding all modeset locks to aquire_ctx will
-	 * ensure that when the framework release it the
-	 * extra locks we are locking here will get released to
+	 * Adding all modeset locks to acquire_ctx will
+	 * ensure that when the framework releases it, the
+	 * extra locks we are locking here will get released too
 	 */
 	ret = drm_modeset_lock_all_ctx(dev, state->acquire_ctx);
 	if (ret)
@@ -12107,9 +12107,9 @@ static int amdgpu_dm_atomic_check(struct drm_device *dev,
 			goto fail;
 		}
 
-		ret = do_aquire_global_lock(dev, state);
+		ret = do_acquire_global_lock(dev, state);
 		if (ret) {
-			drm_dbg_atomic(dev, "do_aquire_global_lock() failed\n");
+			drm_dbg_atomic(dev, "do_acquire_global_lock() failed\n");
 			goto fail;
 		}
 
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
index c7d13e743e6c..555a9d498bc5 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
@@ -1231,7 +1231,7 @@ static ssize_t dp_dsc_passthrough_set(struct file *f, const char __user *buf,
  * Returns the HDCP capability of the Display (1.4 for now).
  *
  * NOTE* Not all HDMI displays report their HDCP caps even when they are capable.
- * Since its rare for a display to not be HDCP 1.4 capable, we set HDMI as always capable.
+ * Since it's rare for a display to not be HDCP 1.4 capable, we set HDMI as always capable.
  *
  * Example usage: cat /sys/kernel/debug/dri/0/DP-1/hdcp_sink_capability
  *		or cat /sys/kernel/debug/dri/0/HDMI-A-1/hdcp_sink_capability
@@ -1392,7 +1392,7 @@ static int dp_dsc_fec_support_show(struct seq_file *m, void *data)
 			/* aconnector sets dsc_aux during get_modes call
 			 * if MST connector has it means it can either
 			 * enable DSC on the sink device or on MST branch
-			 * its connected to.
+			 * it's connected to.
 			 */
 			if (aconnector->dsc_aux) {
 				is_fec_supported = true;
@@ -1419,7 +1419,7 @@ static int dp_dsc_fec_support_show(struct seq_file *m, void *data)
  * and enable, and dm connector state update.
  *
  * Retrigger HPD on an existing connector by echoing 1 into
- * its respectful "trigger_hotplug" debugfs entry:
+ * its respective "trigger_hotplug" debugfs entry:
  *
  *	echo 1 > /sys/kernel/debug/dri/0/DP-X/trigger_hotplug
  *
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c
index c16962256514..8ce862aaab70 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c
@@ -627,7 +627,7 @@ static void update_config(void *handle, struct cp_psp_stream_config *config)
  * +----------------------+
  * |   Why it works:      |
  * +----------------------+
- * PSP will only update its srm if its older than the one we are trying to load.
+ * PSP will only update its srm if it's older than the one we are trying to load.
  * Always do set first than get.
  *	-if we try to "1. SET" a older version PSP will reject it and we can "2. GET" the newer
  *	version and save it
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
index 56d011a1323c..19c5e38515a4 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
@@ -1372,10 +1372,10 @@ static void disable_dangling_plane(struct dc *dc, struct dc_state *context)
 				dc->hwss.interdependent_update_lock(dc, dc->current_state, false);
 				dc->hwss.post_unlock_program_front_end(dc, dangling_context);
 			}
-			/* We need to put the phantom OTG back into it's default (disabled) state or we
+			/* We need to put the phantom OTG back into its default (disabled) state or we
 			 * can get corruption when transition from one SubVP config to a different one.
 			 * The OTG is set to disable on falling edge of VUPDATE so the plane disable
-			 * will still get it's double buffer update.
+			 * will still get its double buffer update.
 			 */
 			if (is_phantom) {
 				if (tg->funcs->disable_phantom_crtc)
diff --git a/drivers/gpu/drm/amd/display/dc/dc_bios_types.h b/drivers/gpu/drm/amd/display/dc/dc_bios_types.h
index 5fa5e2b63fb7..928e27d0a302 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_bios_types.h
+++ b/drivers/gpu/drm/amd/display/dc/dc_bios_types.h
@@ -30,7 +30,7 @@
  * Interface file for VBIOS implementations.
  *
  * The default implementation is inside DC.
- * Display Manager (which instantiates DC) has the option to supply it's own
+ * Display Manager (which instantiates DC) has the option to supply its own
  * (external to DC) implementation of VBIOS, which will be called by DC, using
  * this interface.
  * (The intended use is Diagnostics, but other uses may appear.)
diff --git a/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c b/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
index afbcf866520e..bcdd40ba7e94 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
+++ b/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
@@ -740,7 +740,7 @@ static void update_subvp_prefetch_end_to_mall_start(struct dc *dc,
 			(((uint64_t)phantom_timing1->pix_clk_100hz * 100) + dc->caps.subvp_prefetch_end_to_mall_start_us));
 
 	// Whichever SubVP PIPE has the smaller prefetch (including the prefetch end to mall start time)
-	// should increase it's prefetch time to match the other
+	// should increase its prefetch time to match the other
 	if (subvp0_prefetch_us > subvp1_prefetch_us) {
 		pipe_data = &cmd->fw_assisted_mclk_switch_v2.config_data.pipe_data[1];
 		prefetch_delta_us = subvp0_prefetch_us - subvp1_prefetch_us;
@@ -1105,9 +1105,9 @@ void dc_send_update_cursor_info_to_dmu(
 	 * 1st command can view as 2 parts, 1st is for PSR/Replay data, the other
 	 * is to store cursor position info.
 	 *
-	 * Command heaer type must be the same type if using  multi_cmd_pending.
+	 * Command header type must be the same type if using  multi_cmd_pending.
 	 * Besides, while process 2nd command in DMU, the sub type is useless.
-	 * So it's meanless to pass the sub type header with different type.
+	 * So it's meaningless to pass the sub type header with different type.
 	 */
 
 	{
diff --git a/drivers/gpu/drm/amd/display/dc/dce/dce_audio.c b/drivers/gpu/drm/amd/display/dc/dce/dce_audio.c
index eeed840073fe..af06e305f938 100644
--- a/drivers/gpu/drm/amd/display/dc/dce/dce_audio.c
+++ b/drivers/gpu/drm/amd/display/dc/dce/dce_audio.c
@@ -106,7 +106,7 @@ static bool is_audio_format_supported(
 					max_channe_index = index;
 				}
 			} else {
-				/* format found, save it's index */
+				/* format found, save its index */
 				found = true;
 				max_channe_index = index;
 			}
diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_vmid.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_vmid.c
index 5bc3bc60a2ac..ebbe7900205e 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_vmid.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_vmid.c
@@ -46,7 +46,7 @@ static void dcn20_wait_for_vmid_ready(struct dcn20_vmid *vmid)
 	/* According the hardware spec, we need to poll for the lowest
 	 * bit of PAGE_TABLE_BASE_ADDR_LO32 = 1 any time a GPUVM
 	 * context is updated. We can't use REG_WAIT here since we
-	 * don't have a seperate field to wait on.
+	 * don't have a separate field to wait on.
 	 *
 	 * TODO: Confirm timeout / poll interval with hardware team
 	 */
diff --git a/drivers/gpu/drm/amd/display/dc/dio/dcn20/dcn20_stream_encoder.c b/drivers/gpu/drm/amd/display/dc/dio/dcn20/dcn20_stream_encoder.c
index 0b47aeb60e79..6d5360a2ce37 100644
--- a/drivers/gpu/drm/amd/display/dc/dio/dcn20/dcn20_stream_encoder.c
+++ b/drivers/gpu/drm/amd/display/dc/dio/dcn20/dcn20_stream_encoder.c
@@ -523,7 +523,7 @@ void enc2_stream_encoder_dp_unblank(
 
 	REG_UPDATE(DIG_FE_CNTL, DIG_START, 0);
 
-	/* switch DP encoder to CRTC data, but reset it the fifo first. It may happen
+	/* switch DP encoder to CRTC data, but reset the fifo first. It may happen
 	 * that it overflows during mode transition, and sometimes doesn't recover.
 	 */
 	REG_UPDATE(DP_STEER_FIFO, DP_STEER_FIFO_RESET, 1);
diff --git a/drivers/gpu/drm/amd/display/dc/dio/dcn314/dcn314_dio_stream_encoder.c b/drivers/gpu/drm/amd/display/dc/dio/dcn314/dcn314_dio_stream_encoder.c
index ae81451a3a72..f495cd83a8e1 100644
--- a/drivers/gpu/drm/amd/display/dc/dio/dcn314/dcn314_dio_stream_encoder.c
+++ b/drivers/gpu/drm/amd/display/dc/dio/dcn314/dcn314_dio_stream_encoder.c
@@ -352,7 +352,7 @@ void enc314_stream_encoder_dp_unblank(
 
 	/* DIG_START is removed from the register spec */
 
-	/* switch DP encoder to CRTC data, but reset it the fifo first. It may happen
+	/* switch DP encoder to CRTC data, but reset the fifo first. It may happen
 	 * that it overflows during mode transition, and sometimes doesn't recover.
 	 */
 	REG_UPDATE(DP_STEER_FIFO, DP_STEER_FIFO_RESET, 1);
diff --git a/drivers/gpu/drm/amd/display/dc/dio/dcn32/dcn32_dio_stream_encoder.c b/drivers/gpu/drm/amd/display/dc/dio/dcn32/dcn32_dio_stream_encoder.c
index 1a9bb614c41e..8bde3e36dfc7 100644
--- a/drivers/gpu/drm/amd/display/dc/dio/dcn32/dcn32_dio_stream_encoder.c
+++ b/drivers/gpu/drm/amd/display/dc/dio/dcn32/dcn32_dio_stream_encoder.c
@@ -300,7 +300,7 @@ void enc32_stream_encoder_dp_unblank(
 
 	/* DIG_START is removed from the register spec */
 
-	/* switch DP encoder to CRTC data, but reset it the fifo first. It may happen
+	/* switch DP encoder to CRTC data, but reset the fifo first. It may happen
 	 * that it overflows during mode transition, and sometimes doesn't recover.
 	 */
 	REG_UPDATE(DP_STEER_FIFO, DP_STEER_FIFO_RESET, 1);
diff --git a/drivers/gpu/drm/amd/display/dc/dio/dcn35/dcn35_dio_stream_encoder.c b/drivers/gpu/drm/amd/display/dc/dio/dcn35/dcn35_dio_stream_encoder.c
index 6ab2a218b769..a84fdbe50cc4 100644
--- a/drivers/gpu/drm/amd/display/dc/dio/dcn35/dcn35_dio_stream_encoder.c
+++ b/drivers/gpu/drm/amd/display/dc/dio/dcn35/dcn35_dio_stream_encoder.c
@@ -332,7 +332,7 @@ static void enc35_stream_encoder_dp_unblank(
 
 	/* DIG_START is removed from the register spec */
 
-	/* switch DP encoder to CRTC data, but reset it the fifo first. It may happen
+	/* switch DP encoder to CRTC data, but reset the fifo first. It may happen
 	 * that it overflows during mode transition, and sometimes doesn't recover.
 	 */
 	REG_UPDATE(DP_STEER_FIFO, DP_STEER_FIFO_RESET, 1);
diff --git a/drivers/gpu/drm/amd/display/dc/dio/dcn401/dcn401_dio_stream_encoder.c b/drivers/gpu/drm/amd/display/dc/dio/dcn401/dcn401_dio_stream_encoder.c
index d5fa551dd3c9..30bb128b4650 100644
--- a/drivers/gpu/drm/amd/display/dc/dio/dcn401/dcn401_dio_stream_encoder.c
+++ b/drivers/gpu/drm/amd/display/dc/dio/dcn401/dcn401_dio_stream_encoder.c
@@ -325,7 +325,7 @@ void enc401_stream_encoder_dp_unblank(
 
 	/* DIG_START is removed from the register spec */
 
-	/* switch DP encoder to CRTC data, but reset it the fifo first. It may happen
+	/* switch DP encoder to CRTC data, but reset the fifo first. It may happen
 	 * that it overflows during mode transition, and sometimes doesn't recover.
 	 */
 	REG_UPDATE(DP_STEER_FIFO, DP_STEER_FIFO_RESET, 1);
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c b/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c
index ed59c77bc6f6..08ffac473c09 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c
@@ -48,7 +48,7 @@
 // For DML-C changes that hasn't been propagated to VBA yet
 //#define __DML_VBA_ALLOW_DELTA__
 
-// Move these to ip paramaters/constant
+// Move these to ip parameters/constant
 
 // At which vstartup the DML start to try if the mode can be supported
 #define __DML_VBA_MIN_VSTARTUP__    9
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c b/drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c
index b0fc1fd20208..3e97b959d75c 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c
@@ -1499,7 +1499,7 @@ static bool dcn32_full_validate_bw_helper(struct dc *dc,
 			 * Adding phantom pipes won't change the validation result, so change the DML input param
 			 * for P-State support before adding phantom pipes and recalculating the DML result.
 			 * However, this case is only applicable for SubVP + DRR cases because the prefetch mode
-			 * will not allow for switch in VBLANK. The DRR display must have it's VBLANK stretched
+			 * will not allow for switch in VBLANK. The DRR display must have its VBLANK stretched
 			 * enough to support MCLK switching.
 			 */
 			if (*vlevel == context->bw_ctx.dml.soc.num_states &&
@@ -2323,7 +2323,7 @@ void dcn32_calculate_wm_and_dlg_fpu(struct dc *dc, struct dc_state *context,
 
 	/* need to find dummy latency index for subvp */
 	if (subvp_in_use) {
-		/* Override DRAMClockChangeSupport for SubVP + DRR case where the DRR cannot switch without stretching it's VBLANK */
+		/* Override DRAMClockChangeSupport for SubVP + DRR case where the DRR cannot switch without stretching its VBLANK */
 		if (!pstate_en) {
 			context->bw_ctx.dml.vba.DRAMClockChangeSupport[vlevel][maxMpcComb] = dm_dram_clock_change_vblank_w_mall_sub_vp;
 			context->bw_ctx.dml.soc.allow_for_pstate_or_stutter_in_vblank_final = dm_prefetch_support_fclk_and_stutter;
diff --git a/drivers/gpu/drm/amd/display/dc/link/link_detection.c b/drivers/gpu/drm/amd/display/dc/link/link_detection.c
index 9655e6fa53a4..e9bcc0903d55 100644
--- a/drivers/gpu/drm/amd/display/dc/link/link_detection.c
+++ b/drivers/gpu/drm/amd/display/dc/link/link_detection.c
@@ -376,7 +376,7 @@ static void query_dp_dual_mode_adaptor(
 
 	/* Check signature */
 	for (i = 0; i < sizeof(dongle_signature->id); ++i) {
-		/* If its not the right signature,
+		/* If it's not the right signature,
 		 * skip mismatch in subversion byte.*/
 		if (dongle_signature->id[i] !=
 			dp_hdmi_dongle_signature_str[i] && i != 3) {
@@ -1328,8 +1328,8 @@ bool link_is_hdcp14(struct dc_link *link, enum signal_type signal)
 	case SIGNAL_TYPE_DVI_DUAL_LINK:
 	case SIGNAL_TYPE_HDMI_TYPE_A:
 	/* HDMI doesn't tell us its HDCP(1.4) capability, so assume to always be capable,
-	 * we can poll for bksv but some displays have an issue with this. Since its so rare
-	 * for a display to not be 1.4 capable, this assumtion is ok
+	 * we can poll for bksv but some displays have an issue with this. Since it's so rare
+	 * for a display to not be 1.4 capable, this assumption is ok
 	 */
 		ret = true;
 		break;
diff --git a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c
index a5127c2d47ef..0dc0f0aefdb5 100644
--- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c
+++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c
@@ -250,7 +250,7 @@ static union dp_cable_id intersect_cable_id(
 }
 
 /*
- * Return PCON's post FRL link training supported BW if its non-zero, otherwise return max_supported_frl_bw.
+ * Return PCON's post FRL link training supported BW if it's non-zero, otherwise return max_supported_frl_bw.
  */
 static uint32_t intersect_frl_link_bw_support(
 	const uint32_t max_supported_frl_bw_in_kbps,
@@ -1142,7 +1142,7 @@ static void get_active_converter_info(
 		return;
 	}
 
-	/* DPCD 0x5 bit 0 = 1, it indicate it's branch device */
+	/* DPCD 0x5 bit 0 = 1, it indicate its branch device */
 	link->dpcd_caps.is_branch_dev = ds_port.fields.PORT_PRESENT;
 
 	switch (ds_port.fields.PORT_TYPE) {
diff --git a/drivers/gpu/drm/amd/display/dc/optc/dcn20/dcn20_optc.c b/drivers/gpu/drm/amd/display/dc/optc/dcn20/dcn20_optc.c
index e7a90a437fff..798a531e1d40 100644
--- a/drivers/gpu/drm/amd/display/dc/optc/dcn20/dcn20_optc.c
+++ b/drivers/gpu/drm/amd/display/dc/optc/dcn20/dcn20_optc.c
@@ -370,7 +370,7 @@ static void optc2_align_vblanks(
 
 	/* accessing slave OTG registers */
 	optc1 = DCN10TG_FROM_TG(optc_slave);
-	/* restore slave to be controlled by it's own */
+	/* restore slave to be controlled by its own */
 	REG_SET(OTG_GLOBAL_CONTROL0, 0,
 			OTG_MASTER_UPDATE_LOCK_SEL, optc_slave->inst);
 
@@ -575,6 +575,6 @@ void dcn20_timing_generator_init(struct optc *optc1)
 	optc1->min_h_blank = 32;
 	optc1->min_v_blank = 3;
 	optc1->min_v_blank_interlace = 5;
-	optc1->min_h_sync_width = 4;//	Minimum HSYNC = 8 pixels asked By HW in the first place for no actual reason. Oculus Rift S will not light up with 8 as it's hsyncWidth is 6. Changing it to 4 to fix that issue.
+	optc1->min_h_sync_width = 4;//	Minimum HSYNC = 8 pixels asked By HW in the first place for no actual reason. Oculus Rift S will not light up with 8 as its hsyncWidth is 6. Changing it to 4 to fix that issue.
 	optc1->min_v_sync_width = 1;
 }
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn35/dcn35_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn35/dcn35_resource.c
index 72c6cf047db0..fe5806ce7f11 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn35/dcn35_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn35/dcn35_resource.c
@@ -1896,8 +1896,8 @@ static bool dcn35_resource_construct(
 
 	/* max_disp_clock_khz_at_vmin is slightly lower than the STA value in order
 	 * to provide some margin.
-	 * It's expected for furture ASIC to have equal or higher value, in order to
-	 * have determinstic power improvement from generate to genration.
+	 * It's expected for future ASIC to have equal or higher value, in order to
+	 * have deterministic power improvement from generation to generation.
 	 * (i.e., we should not expect new ASIC generation with lower vmin rate)
 	 */
 	dc->caps.max_disp_clock_khz_at_vmin = 650000;
diff --git a/drivers/gpu/drm/amd/include/atombios.h b/drivers/gpu/drm/amd/include/atombios.h
index b344acefc606..cd0e2104fb79 100644
--- a/drivers/gpu/drm/amd/include/atombios.h
+++ b/drivers/gpu/drm/amd/include/atombios.h
@@ -437,7 +437,7 @@ typedef struct _ATOM_ADJUST_MEMORY_CLOCK_FREQ
 
 typedef struct _COMPUTE_MEMORY_ENGINE_PLL_PARAMETERS
 {
-  ULONG   ulClock;        //When returen, it's the re-calculated clock based on given Fb_div Post_Div and ref_div
+  ULONG   ulClock;        //When return, it's the re-calculated clock based on given Fb_div Post_Div and ref_div
   UCHAR   ucAction;       //0:reserved //1:Memory //2:Engine
   UCHAR   ucReserved;     //may expand to return larger Fbdiv later
   UCHAR   ucFbDiv;        //return value
@@ -7270,7 +7270,7 @@ typedef struct _ENABLE_GRAPH_SURFACE_PS_ALLOCATION
 
 typedef struct _MEMORY_CLEAN_UP_PARAMETERS
 {
-  USHORT  usMemoryStart;                //in 8Kb boundry, offset from memory base address
+  USHORT  usMemoryStart;                //in 8Kb boundary, offset from memory base address
   USHORT  usMemorySize;                 //8Kb blocks aligned
 }MEMORY_CLEAN_UP_PARAMETERS;
 
@@ -7957,7 +7957,7 @@ typedef struct _ATOM_VRAM_MODULE_V8
   UCHAR   ucVREFI;                          // Not used.
   USHORT  usReserved;                       // Not used
   USHORT  usMemorySize;                     // Total memory size in unit of MB for CONFIG_MEMSIZE zeros
-  UCHAR   ucMcTunningSetId;                 // MC phy registers set per.
+  UCHAR   ucMcTuningSetId;                  // MC phy registers set per.
   UCHAR   ucRowNum;
 // Memory Module specific values
   USHORT  usEMRS2Value;                     // EMRS2/MR2 Value.
diff --git a/drivers/gpu/drm/amd/include/atomfirmware.h b/drivers/gpu/drm/amd/include/atomfirmware.h
index 5c86423c2e92..1e2b7d6b73fd 100644
--- a/drivers/gpu/drm/amd/include/atomfirmware.h
+++ b/drivers/gpu/drm/amd/include/atomfirmware.h
@@ -640,7 +640,7 @@ struct atom_firmware_info_v3_5 {
   uint32_t pspbl_init_reserved[3];
   uint32_t spi_rom_size;                    // GPU spi rom size
   uint16_t support_dev_in_objinfo;
-  uint16_t disp_phy_tunning_size;
+  uint16_t disp_phy_tuning_size;
   uint32_t reserved[16];
 };
 /* 
@@ -3234,7 +3234,7 @@ struct atom_vram_module_v9 {
   uint8_t   channel_num;                   // Number of mem. channels supported in this module
   uint8_t   channel_width;                 // CHANNEL_16BIT/CHANNEL_32BIT/CHANNEL_64BIT
   uint8_t   density;                       // _8Mx32, _16Mx32, _16Mx16, _32Mx16
-  uint8_t   tunningset_id;                 // MC phy registers set per. 
+  uint8_t   tuningset_id;                  // MC phy registers set per.
   uint8_t   vender_rev_id;                 // [7:4] Revision, [3:0] Vendor code
   uint8_t   refreshrate;                   // [1:0]=RefreshFactor (00=8ms, 01=16ms, 10=32ms,11=64ms)
   uint8_t   hbm_ven_rev_id;		   // hbm_ven_rev_id
@@ -3266,7 +3266,7 @@ struct atom_vram_info_header_v2_3 {
 */
 struct atom_vram_module_v3_0 {
 	uint8_t density;
-	uint8_t tunningset_id;
+	uint8_t tuningset_id;
 	uint8_t ext_memory_id;
 	uint8_t dram_vendor_id;
 	uint16_t dram_info_offset;
@@ -3357,7 +3357,7 @@ struct atom_vram_module_v10 {
   uint8_t   channel_num;                   // Number of mem. channels supported in this module
   uint8_t   channel_width;                 // CHANNEL_16BIT/CHANNEL_32BIT/CHANNEL_64BIT
   uint8_t   density;                       // _8Mx32, _16Mx32, _16Mx16, _32Mx16
-  uint8_t   tunningset_id;                 // MC phy registers set per
+  uint8_t   tuningset_id;                  // MC phy registers set per
   uint8_t   vender_rev_id;                 // [7:4] Revision, [3:0] Vendor code
   uint8_t   refreshrate;                   // [1:0]=RefreshFactor (00=8ms, 01=16ms, 10=32ms,11=64ms)
   uint8_t   vram_flags;			   // bit0= bankgroup enable
@@ -3397,7 +3397,7 @@ struct atom_vram_module_v11 {
 	uint8_t   channel_num;                   // Number of mem. channels supported in this module
 	uint8_t   channel_width;                 // CHANNEL_16BIT/CHANNEL_32BIT/CHANNEL_64BIT
 	uint8_t   density;                       // _8Mx32, _16Mx32, _16Mx16, _32Mx16
-	uint8_t   tunningset_id;                 // MC phy registers set per.
+	uint8_t   tuningset_id;                  // MC phy registers set per.
 	uint16_t  reserved[4];                   // reserved
 	uint8_t   vender_rev_id;                 // [7:4] Revision, [3:0] Vendor code
 	uint8_t   refreshrate;			 // [1:0]=RefreshFactor (00=8ms, 01=16ms, 10=32ms,11=64ms)
diff --git a/drivers/gpu/drm/amd/pm/amdgpu_pm.c b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
index edd9895b46c0..bb7be3f7a7a2 100644
--- a/drivers/gpu/drm/amd/pm/amdgpu_pm.c
+++ b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
@@ -1574,7 +1574,7 @@ static ssize_t amdgpu_get_unique_id(struct device *dev,
  * DOC: thermal_throttling_logging
  *
  * Thermal throttling pulls down the clock frequency and thus the performance.
- * It's an useful mechanism to protect the chip from overheating. Since it
+ * It's a useful mechanism to protect the chip from overheating. Since it
  * impacts performance, the user controls whether it is enabled and if so,
  * the log frequency.
  *
diff --git a/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h b/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h
index 9aacc7bc1c69..761d6d3c7fb4 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h
+++ b/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h
@@ -1180,7 +1180,7 @@ struct pptable_funcs {
 	u32 (*get_gfx_off_residency)(struct smu_context *smu, uint32_t *residency);
 
 	/**
-	 * @register_irq_handler: Register interupt request handlers.
+	 * @register_irq_handler: Register interrupt request handlers.
 	 */
 	int (*register_irq_handler)(struct smu_context *smu);
 
diff --git a/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_0.h b/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_0.h
index b114d14fc053..03c7666df377 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_0.h
+++ b/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_0.h
@@ -1618,7 +1618,7 @@ typedef struct {
 #define TABLE_WIFIBAND                12
 #define TABLE_COUNT                   13
 
-//IH Interupt ID
+//IH Interrupt ID
 #define IH_INTERRUPT_ID_TO_DRIVER                   0xFE
 #define IH_INTERRUPT_CONTEXT_ID_BACO                0x2
 #define IH_INTERRUPT_CONTEXT_ID_AC                  0x3
diff --git a/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_7.h b/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_7.h
index 8b1496f8ce58..ab96477fce7c 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_7.h
+++ b/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_7.h
@@ -1608,7 +1608,7 @@ typedef struct {
 #define TABLE_WIFIBAND                12
 #define TABLE_COUNT                   13
 
-//IH Interupt ID
+//IH Interrupt ID
 #define IH_INTERRUPT_ID_TO_DRIVER                   0xFE
 #define IH_INTERRUPT_CONTEXT_ID_BACO                0x2
 #define IH_INTERRUPT_CONTEXT_ID_AC                  0x3
diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index f2a6559a2710..3e9e47c82054 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -2678,7 +2678,7 @@ EXPORT_SYMBOL(drm_dp_dsc_sink_bpp_incr);
  * drm_dp_dsc_sink_max_slice_count() - Get the max slice count
  * supported by the DSC sink.
  * @dsc_dpcd: DSC capabilities from DPCD
- * @is_edp: true if its eDP, false for DP
+ * @is_edp: true if it's eDP, false for DP
  *
  * Read the slice capabilities DPCD register from DSC sink to get
  * the maximum slice count supported. This is used to populate
@@ -2688,7 +2688,7 @@ EXPORT_SYMBOL(drm_dp_dsc_sink_bpp_incr);
  * infoframe using the helper function drm_dsc_pps_infoframe_pack()
  *
  * Returns:
- * Maximum slice count supported by DSC sink or 0 its invalid
+ * Maximum slice count supported by DSC sink or 0 if invalid
  */
 u8 drm_dp_dsc_sink_max_slice_count(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE],
 				   bool is_edp)
@@ -2746,7 +2746,7 @@ EXPORT_SYMBOL(drm_dp_dsc_sink_max_slice_count);
  * infoframe using the helper function drm_dsc_pps_infoframe_pack()
  *
  * Returns:
- * Line buffer depth supported by DSC panel or 0 its invalid
+ * Line buffer depth supported by DSC panel or 0 if invalid
  */
 u8 drm_dp_dsc_sink_line_buf_depth(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE])
 {
@@ -4239,7 +4239,7 @@ drm_edp_backlight_probe_state(struct drm_dp_aux *aux, struct drm_edp_backlight_i
  * @current_level: Where to store the probed brightness level, if any
  * @current_mode: Where to store the currently set backlight control mode
  *
- * Initializes a &drm_edp_backlight_info struct by probing @aux for it's backlight capabilities,
+ * Initializes a &drm_edp_backlight_info struct by probing @aux for its backlight capabilities,
  * along with also probing the current and maximum supported brightness levels.
  *
  * If @driver_pwm_freq_hz is non-zero, this will be used as the backlight frequency. Otherwise, the
diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index a89f38fd3218..24cd9afae2e8 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -2489,7 +2489,7 @@ drm_dp_mst_handle_conn_stat(struct drm_dp_mst_branch *mstb,
 			/*
 			 * We can't remove a connector from an already exposed
 			 * port, so just throw the port out and make sure we
-			 * reprobe the link address of it's parent MSTB
+			 * reprobe the link address of its parent MSTB
 			 */
 			drm_dp_mst_topology_unlink_port(mgr, port);
 			mstb->link_address_sent = false;
@@ -4535,7 +4535,7 @@ int drm_dp_atomic_release_time_slots(struct drm_atomic_state *state,
 	if (!old_conn_state->crtc)
 		return 0;
 
-	/* If the CRTC isn't disabled by this state, don't release it's payload */
+	/* If the CRTC isn't disabled by this state, don't release its payload */
 	new_conn_state = drm_atomic_get_new_connector_state(state, port->connector);
 	if (new_conn_state->crtc) {
 		struct drm_crtc_state *crtc_state =
@@ -4755,7 +4755,7 @@ EXPORT_SYMBOL(drm_dp_mst_update_slots);
  * drm_dp_check_act_status() - Polls for ACT handled status.
  * @mgr: manager to use
  *
- * Tries waiting for the MST hub to finish updating it's payload table by
+ * Tries waiting for the MST hub to finish updating its payload table by
  * polling for the ACT handled bit for up to 3 seconds (yes-some hubs really
  * take that long).
  *
diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 0138cf0b8b63..7be4a35bc3e9 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -1792,7 +1792,7 @@ static void drm_atomic_private_obj_print_state(struct drm_printer *p,
  * This functions prints the drm atomic state snapshot using the drm printer
  * which is passed to it. This snapshot can be used for debugging purposes.
  *
- * Note that this function looks into the new state objects and hence its not
+ * Note that this function looks into the new state objects and hence it's not
  * safe to be used after the call to drm_atomic_helper_commit_hw_done().
  */
 void drm_atomic_print_new_state(const struct drm_atomic_state *state,
diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 48b08c9611a7..66450b9c696a 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -1621,7 +1621,7 @@ EXPORT_SYMBOL(drm_hdmi_connector_get_output_format_name);
  *
  *	Userspace first need to detect the HDR capabilities of sink by
  *	reading and parsing the EDID. Details of HDR metadata for HDMI
- *	are added in CTA 861.G spec. For DP , its defined in VESA DP
+ *	are added in CTA 861.G spec. For DP , it's defined in VESA DP
  *	Standard v1.4. It needs to then get the metadata information
  *	of the video/game/app content which are encoded in HDR (basically
  *	using HDR transfer functions). With this information it needs to
diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index 1e659d2660f7..838d93614c5c 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -1501,7 +1501,7 @@ drm_gem_lru_scan(struct drm_gem_lru *lru,
 		/*
 		 * Note that this still needs to be trylock, since we can
 		 * hit shrinker in response to trying to get backing pages
-		 * for this obj (ie. while it's lock is already held)
+		 * for this obj (ie. while its lock is already held)
 		 */
 		if (!dma_resv_trylock(obj->resv)) {
 			*remaining += obj->size >> PAGE_SHIFT;
diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index 22b1fe9c03b8..90f4aa613765 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -704,7 +704,7 @@ static int drm_gem_vram_object_pin(struct drm_gem_object *gem)
 	/*
 	 * Fbdev console emulation is the use case of these PRIME
 	 * helpers. This may involve updating a hardware buffer from
-	 * a shadow FB. We pin the buffer to it's current location
+	 * a shadow FB. We pin the buffer to its current location
 	 * (either video RAM or system memory) to prevent it from
 	 * being relocated during the update operation. If you require
 	 * the buffer to be pinned to VRAM, implement a callback that
diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
index 650de4da0853..3b3b18ce4455 100644
--- a/drivers/gpu/drm/drm_panel.c
+++ b/drivers/gpu/drm/drm_panel.c
@@ -501,7 +501,7 @@ EXPORT_SYMBOL(drm_is_panel_follower);
  * @follower:     The panel follower descriptor for the follower.
  *
  * A panel follower is called right after preparing the panel and right before
- * unpreparing the panel. It's primary intention is to power on an associated
+ * unpreparing the panel. Its primary intention is to power on an associated
  * touchscreen, though it could be used for any similar devices. Multiple
  * devices are allowed the follow the same panel.
  *
diff --git a/drivers/gpu/drm/drm_property.c b/drivers/gpu/drm/drm_property.c
index 596272149a35..3b2e3ea92232 100644
--- a/drivers/gpu/drm/drm_property.c
+++ b/drivers/gpu/drm/drm_property.c
@@ -381,7 +381,7 @@ EXPORT_SYMBOL(drm_property_create_bool);
  *
  * This functions adds enumerations to a property.
  *
- * It's use is deprecated, drivers should use one of the more specific helpers
+ * Its use is deprecated, drivers should use one of the more specific helpers
  * to directly create the property with all enumerations already attached.
  *
  * Returns:
diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index 636cd83ca29e..3615b0af5e38 100644
--- a/drivers/gpu/drm/drm_syncobj.c
+++ b/drivers/gpu/drm/drm_syncobj.c
@@ -51,7 +51,7 @@
  *   - Wait for a given point to appear and/or be signaled
  *   - Import and export from/to a given point of a timeline
  *
- * At it's core, a syncobj is simply a wrapper around a pointer to a struct
+ * At its core, a syncobj is simply a wrapper around a pointer to a struct
  * &dma_fence which may be NULL.
  * When a syncobj is first created, its pointer is either NULL or a pointer
  * to an already signaled fence depending on whether the
diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index 46f59883183d..49a198fa45eb 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -390,7 +390,7 @@ u64 drm_vblank_count(struct drm_device *dev, unsigned int pipe)
 	 * write seqlock in store_vblank(). Note that this is the only place
 	 * where we need an explicit barrier, since all other access goes
 	 * through drm_vblank_count_and_time(), which already has the required
-	 * read barrier curtesy of the read seqlock.
+	 * read barrier courtesy of the read seqlock.
 	 */
 	smp_rmb();
 
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index cf0d9049bcf1..6e2730799f60 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -1301,7 +1301,7 @@ int etnaviv_gpu_wait_fence_interruptible(struct etnaviv_gpu *gpu,
 }
 
 /*
- * Wait for an object to become inactive.  This, on it's own, is not race
+ * Wait for an object to become inactive.  This, on its own, is not race
  * free: the object is moved by the scheduler off the active list, and
  * then the iova is put.  Moreover, the object could be re-submitted just
  * after we notice that it's become inactive.
diff --git a/drivers/gpu/drm/gma500/psb_intel_drv.h b/drivers/gpu/drm/gma500/psb_intel_drv.h
index 979ea8ecf0d5..f838db4f8c39 100644
--- a/drivers/gpu/drm/gma500/psb_intel_drv.h
+++ b/drivers/gpu/drm/gma500/psb_intel_drv.h
@@ -101,7 +101,7 @@ struct gma_encoder {
 #define DDI_MASK	0x03
 	void *dev_priv; /* For sdvo_priv, lvds_priv, etc... */
 
-	/* FIXME: Either make SDVO and LVDS store it's i2c here or give CDV it's
+	/* FIXME: Either make SDVO and LVDS store its i2c here or give CDV its
 	   own set of output privates */
 	struct gma_i2c_chan *i2c_bus;
 };
diff --git a/drivers/gpu/drm/i915/display/hsw_ips.c b/drivers/gpu/drm/i915/display/hsw_ips.c
index 4307e2ed03d9..b6d6cc9a8b9f 100644
--- a/drivers/gpu/drm/i915/display/hsw_ips.c
+++ b/drivers/gpu/drm/i915/display/hsw_ips.c
@@ -42,7 +42,7 @@ static void hsw_ips_enable(const struct intel_crtc_state *crtc_state)
 			    snb_pcode_write(&i915->uncore, DISPLAY_IPS_CONTROL,
 					    val | IPS_PCODE_CONTROL));
 		/*
-		 * Quoting Art Runyan: "its not safe to expect any particular
+		 * Quoting Art Runyan: "it's not safe to expect any particular
 		 * value in IPS_CTL bit 31 after enabling IPS through the
 		 * mailbox." Moreover, the mailbox may return a bogus state,
 		 * so we need to just enable it and continue on.
diff --git a/drivers/gpu/drm/i915/display/intel_backlight_regs.h b/drivers/gpu/drm/i915/display/intel_backlight_regs.h
index d0cdfd631d75..cebded62ab8c 100644
--- a/drivers/gpu/drm/i915/display/intel_backlight_regs.h
+++ b/drivers/gpu/drm/i915/display/intel_backlight_regs.h
@@ -35,9 +35,9 @@
 #define   BLM_TRANSCODER_EDP		(3 << 29)
 #define   BLM_PIPE(pipe)		((pipe) << 29)
 #define   BLM_POLARITY_I965		(1 << 28) /* gen4 only */
-#define   BLM_PHASE_IN_INTERUPT_STATUS	(1 << 26)
+#define   BLM_PHASE_IN_INTERRUPT_STATUS	(1 << 26)
 #define   BLM_PHASE_IN_ENABLE		(1 << 25)
-#define   BLM_PHASE_IN_INTERUPT_ENABL	(1 << 24)
+#define   BLM_PHASE_IN_INTERRUPT_ENABL	(1 << 24)
 #define   BLM_PHASE_IN_TIME_BASE_SHIFT	(16)
 #define   BLM_PHASE_IN_TIME_BASE_MASK	(0xff << 16)
 #define   BLM_PHASE_IN_COUNT_SHIFT	(8)
diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index 98dddf72c0eb..ced7dd93d87e 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -1758,7 +1758,7 @@ icl_program_gamma_multi_segment(const struct intel_crtc_state *crtc_state)
 	/*
 	 * Program Coarse segment (let's call it seg3)...
 	 *
-	 * Coarse segment starts from index 0 and it's step is 1/256 ie 0,
+	 * Coarse segment starts from index 0 and its step is 1/256 ie 0,
 	 * 1/256, 2/256 ... 256/256. As per the description of each entry in LUT
 	 * above, we need to pick every (8 * 128)th entry in LUT, and
 	 * program 256 of those.
diff --git a/drivers/gpu/drm/i915/display/intel_crt.c b/drivers/gpu/drm/i915/display/intel_crt.c
index 38b50a779b6b..0dec7723d257 100644
--- a/drivers/gpu/drm/i915/display/intel_crt.c
+++ b/drivers/gpu/drm/i915/display/intel_crt.c
@@ -1119,7 +1119,7 @@ void intel_crt_init(struct intel_display *display)
 	drm_connector_helper_add(&connector->base, &intel_crt_connector_helper_funcs);
 
 	/*
-	 * TODO: find a proper way to discover whether we need to set the the
+	 * TODO: find a proper way to discover whether we need to set the
 	 * polarity and link reversal bits or not, instead of relying on the
 	 * BIOS.
 	 */
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 6f0a0bc71b06..469f49ebad61 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -4713,7 +4713,7 @@ intel_modeset_pipe_config(struct intel_atomic_state *state,
 	}
 
 	/* Dithering seems to not pass-through bits correctly when it should, so
-	 * only enable it on 6bpc panels and when its not a compliance
+	 * only enable it on 6bpc panels and when it's not a compliance
 	 * test requesting 6bpc video pattern.
 	 */
 	crtc_state->dither = (crtc_state->pipe_bpp == 6*3) &&
@@ -6964,7 +6964,7 @@ static void skl_commit_modeset_enables(struct intel_atomic_state *state)
 			intel_update_crtc(state, crtc);
 
 			/*
-			 * If this is an already active pipe, it's DDB changed,
+			 * If this is an already active pipe, its DDB changed,
 			 * and this isn't the last pipe that needs updating
 			 * then we need to wait for a vblank to pass for the
 			 * new ddb allocation to take effect.
diff --git a/drivers/gpu/drm/i915/display/intel_dp_hdcp.c b/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
index cc312596fb77..827214f6968f 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
@@ -609,7 +609,7 @@ int intel_dp_hdcp2_config_stream_type(struct intel_connector *connector,
 	 * Errata for DP: As Stream type is used for encryption, Receiver
 	 * should be communicated with stream type for the decryption of the
 	 * content.
-	 * Repeater will be communicated with stream type as a part of it's
+	 * Repeater will be communicated with stream type as a part of its
 	 * auth later in time.
 	 */
 	stream_type_msg.msg_id = HDCP_2_2_ERRATA_DP_STREAM_TYPE;
diff --git a/drivers/gpu/drm/i915/display/intel_lspcon.c b/drivers/gpu/drm/i915/display/intel_lspcon.c
index f94b7eeae20f..cd9d52451a75 100644
--- a/drivers/gpu/drm/i915/display/intel_lspcon.c
+++ b/drivers/gpu/drm/i915/display/intel_lspcon.c
@@ -263,7 +263,7 @@ static bool lspcon_probe(struct intel_lspcon *lspcon)
 	expected_mode = lspcon_wake_native_aux_ch(lspcon) ?
 			DRM_LSPCON_MODE_PCON : DRM_LSPCON_MODE_LS;
 
-	/* Lets probe the adaptor and check its type */
+	/* Let's probe the adaptor and check its type */
 	for (retry = 0; retry < 6; retry++) {
 		if (retry)
 			usleep_range(500, 1000);
@@ -284,7 +284,7 @@ static bool lspcon_probe(struct intel_lspcon *lspcon)
 	lspcon->mode = lspcon_wait_mode(lspcon, expected_mode);
 
 	/*
-	 * In the SW state machine, lets Put LSPCON in PCON mode only.
+	 * In the SW state machine, let's Put LSPCON in PCON mode only.
 	 * In this way, it will work with both HDMI 1.4 sinks as well as HDMI
 	 * 2.0 sinks.
 	 */
diff --git a/drivers/gpu/drm/i915/display/intel_tv.c b/drivers/gpu/drm/i915/display/intel_tv.c
index acf0b3733908..407f031c0b22 100644
--- a/drivers/gpu/drm/i915/display/intel_tv.c
+++ b/drivers/gpu/drm/i915/display/intel_tv.c
@@ -1043,7 +1043,7 @@ intel_tv_mode_to_mode(struct drm_display_mode *mode,
 			tv_mode->vi_end_f2 + 1;
 	}
 
-	/* TV has it's own notion of sync and other mode flags, so clear them. */
+	/* TV has its own notion of sync and other mode flags, so clear them. */
 	mode->flags = 0;
 
 	snprintf(mode->name, sizeof(mode->name),
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index 15835952352e..9b1dfcdf5982 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -7,7 +7,7 @@
  * This file implements HW context support. On gen5+ a HW context consists of an
  * opaque GPU object which is referenced at times of context saves and restores.
  * With RC6 enabled, the context is also referenced as the GPU enters and exists
- * from RC6 (GPU has it's own internal power context, except on gen5). Though
+ * from RC6 (GPU has its own internal power context, except on gen5). Though
  * something like a context does exist for the media ring, the code only
  * supports contexts for the render ring.
  *
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
index c34f41605b46..e5abc2b2f693 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
@@ -563,7 +563,7 @@ __i915_gem_object_get_dirty_page(struct drm_i915_gem_object *obj, pgoff_t n);
 
 /**
  * __i915_gem_object_get_dma_address_len - helper to get bus addresses of
- * targeted DMA mapped scatterlist from i915 GEM buffer object and it's length
+ * targeted DMA mapped scatterlist from i915 GEM buffer object and its length
  * @obj: i915 GEM buffer object
  * @n: page offset
  * @len: DMA mapped scatterlist's DMA bus addresses length to return
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_frontbuffer.h b/drivers/gpu/drm/i915/gem/i915_gem_object_frontbuffer.h
index 9fbf14867a2a..921ce6bc82a5 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object_frontbuffer.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object_frontbuffer.h
@@ -75,7 +75,7 @@ i915_gem_object_get_frontbuffer(const struct drm_i915_gem_object *obj)
  * @front: The frontbuffer to set
  *
  * Set object's frontbuffer pointer. If frontbuffer is already set for the
- * object keep it and return it's pointer to the caller. Please note that RCU
+ * object keep it and return its pointer to the caller. Please note that RCU
  * mechanism is used to handle e.g. ongoing removal of frontbuffer pointer. This
  * function is protected by i915->display.fb_tracking.lock
  *
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index 1f4814968868..a5b88597837a 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -408,7 +408,7 @@ void i915_ttm_free_cached_io_rsgt(struct drm_i915_gem_object *obj)
  * i915_ttm_purge - Clear an object of its memory
  * @obj: The object
  *
- * This function is called to clear an object of it's memory when it is
+ * This function is called to clear an object of its memory when it is
  * marked as not needed anymore.
  *
  * Return: 0 on success, negative error code on failure.
diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
index 03baa7fa0a27..2cbec4c5edbb 100644
--- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
@@ -340,7 +340,7 @@ static bool need_preempt(const struct intel_engine_cs *engine,
 	 *
 	 * The highest priority request in the queue can not be either
 	 * ELSP[0] or ELSP[1] as, thanks again to PI, if it was the same
-	 * context, it's priority would not exceed ELSP[0] aka last_prio.
+	 * context, its priority would not exceed ELSP[0] aka last_prio.
 	 */
 	return max(virtual_prio(&engine->execlists),
 		   queue_prio(engine->sched_engine)) > last_prio;
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
index 9547fff672bd..e6a19992e44f 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
@@ -664,9 +664,9 @@ static void check_guc_capture_size(struct intel_guc *guc)
 
 	/*
 	 * NOTE: min_size is much smaller than the capture region allocation (DG2: <80K vs 1MB)
-	 * Additionally, its based on space needed to fit all engines getting reset at once
+	 * Additionally, it's based on space needed to fit all engines getting reset at once
 	 * within the same G2H handler task slot. This is very unlikely. However, if GuC really
-	 * does run out of space for whatever reason, we will see an separate warning message
+	 * does run out of space for whatever reason, we will see a separate warning message
 	 * when processing the G2H event capture-notification, search for:
 	 * INTEL_GUC_STATE_CAPTURE_EVENT_STATUS_NOSPACE.
 	 */
diff --git a/drivers/gpu/drm/i915/i915_perf.c b/drivers/gpu/drm/i915/i915_perf.c
index 1658f1246c6f..132f31e0e5c1 100644
--- a/drivers/gpu/drm/i915/i915_perf.c
+++ b/drivers/gpu/drm/i915/i915_perf.c
@@ -1407,7 +1407,7 @@ gen12_guc_sw_ctx_id(struct intel_context *ce, u32 *ctx_id)
  * For GuC mode of submission read context id from the upper dword of the
  * EXECLIST_STATUS register. Note that we read this value only once and expect
  * that the value stays fixed for the entire OA use case. There are cases where
- * GuC KMD implementation may deregister a context to reuse it's context id, but
+ * GuC KMD implementation may deregister a context to reuse its context id, but
  * we prevent that from happening to the OA context by pinning it.
  */
 static int gen12_get_render_context_id(struct i915_perf_stream *stream)
diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
index c3d27eadc0a7..b674234f7065 100644
--- a/drivers/gpu/drm/i915/i915_request.c
+++ b/drivers/gpu/drm/i915/i915_request.c
@@ -1779,7 +1779,7 @@ __i915_request_add_to_timeline(struct i915_request *rq)
 }
 
 /*
- * NB: This function is not allowed to fail. Doing so would mean the the
+ * NB: This function is not allowed to fail. Doing so would mean the
  * request is not being tracked for completion but the work itself is
  * going to happen on the hardware. This would be a Bad Thing(tm).
  */
diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index 632e316f8b05..e267cc8efe55 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -457,7 +457,7 @@ i915_vma_resource_init_from_vma(struct i915_vma_resource *vma_res,
 }
 
 /**
- * i915_vma_bind - Sets up PTEs for an VMA in it's corresponding address space.
+ * i915_vma_bind - Sets up PTEs for an VMA in its corresponding address space.
  * @vma: VMA to map
  * @pat_index: PAT index to set in PTE
  * @flags: flags like global or local mapping
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp.c b/drivers/gpu/drm/i915/pxp/intel_pxp.c
index f8da693ad3ce..0cdc9432c754 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp.c
@@ -159,7 +159,7 @@ static struct intel_gt *find_gt_for_required_teelink(struct drm_i915_private *i9
 {
 	/*
 	 * NOTE: Only certain platforms require PXP-tee-backend dependencies
-	 * for HuC authentication. For now, its limited to DG2.
+	 * for HuC authentication. For now, it's limited to DG2.
 	 */
 	if (IS_ENABLED(CONFIG_INTEL_MEI_PXP) && IS_ENABLED(CONFIG_INTEL_MEI_GSC) &&
 	    intel_huc_is_loaded_by_gsc(&to_gt(i915)->uc.huc) && intel_uc_uses_huc(&to_gt(i915)->uc))
diff --git a/drivers/gpu/drm/imagination/pvr_cccb.h b/drivers/gpu/drm/imagination/pvr_cccb.h
index 943fe8f2c963..9be461b395a9 100644
--- a/drivers/gpu/drm/imagination/pvr_cccb.h
+++ b/drivers/gpu/drm/imagination/pvr_cccb.h
@@ -90,7 +90,7 @@ pvr_cccb_get_size_of_cmd_with_hdr(u32 cmd_size)
  * @size: Command sequence size.
  *
  * Returns:
- *  * true it the CCCB is big enough to contain a command sequence, or
+ *  * true if the CCCB is big enough to contain a command sequence, or
  *  * false otherwise.
  */
 static __always_inline bool
diff --git a/drivers/gpu/drm/kmb/kmb_dsi.c b/drivers/gpu/drm/kmb/kmb_dsi.c
index faf38ca9e44c..5cbb4e8299d3 100644
--- a/drivers/gpu/drm/kmb/kmb_dsi.c
+++ b/drivers/gpu/drm/kmb/kmb_dsi.c
@@ -591,7 +591,7 @@ static void mipi_tx_fg_cfg(struct kmb_dsi *kmb_dsi, u8 frame_gen,
 	struct mipi_tx_frame_timing_cfg fg_t_cfg;
 
 	/* Calculate the total frame generator number of
-	 * lines based on it's active sections
+	 * lines based on its active sections
 	 */
 	for (i = 0; i < MIPI_TX_FRAME_GEN_SECTIONS; i++) {
 		if (fg_cfg->sections[i])
diff --git a/drivers/gpu/drm/kmb/kmb_dsi.h b/drivers/gpu/drm/kmb/kmb_dsi.h
index 09dc88743d77..745c3e021b8d 100644
--- a/drivers/gpu/drm/kmb/kmb_dsi.h
+++ b/drivers/gpu/drm/kmb/kmb_dsi.h
@@ -239,7 +239,7 @@ enum dphy_tx_fsm {
 	DPHY_TX_ULP,
 	DPHY_TX_LANESTART,
 	DPHY_TX_CLKALIGN,
-	DPHY_TX_DDLTUNNING,
+	DPHY_TX_DDLTUNING,
 	DPHY_TX_ULP_FORCE_PLL,
 	DPHY_TX_LOCK_LOSS
 };
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
index 8afd15006df2..a6551b7fc649 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
@@ -111,7 +111,7 @@ static bool mtk_gamma_lut_is_descending(struct drm_color_lut *lut, u32 lut_size)
  * - SoC HW support both 10/12bits LUT
  *   - New register layout
  *     - 12-bits LUT supported
- *     - 10-its LUT not supported
+ *     - 10-bits LUT not supported
  */
 void mtk_gamma_set(struct device *dev, struct drm_crtc_state *state)
 {
diff --git a/drivers/gpu/drm/meson/meson_venc.c b/drivers/gpu/drm/meson/meson_venc.c
index 3bf0d6e4fc30..a3738e6e5d4b 100644
--- a/drivers/gpu/drm/meson/meson_venc.c
+++ b/drivers/gpu/drm/meson/meson_venc.c
@@ -49,7 +49,7 @@
  * The ENCP is designed for Progressive encoding but can also generate
  * 1080i interlaced pixels, and was initially designed to encode pixels for
  * VDAC to output RGB ou YUV analog outputs.
- * It's output is only used through the ENCP_DVI encoder for HDMI.
+ * Its output is only used through the ENCP_DVI encoder for HDMI.
  * The ENCL LVDS encoder is not implemented.
  *
  * The ENCI and ENCP encoders needs specially defined parameters for each
diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/mgag200/mgag200_drv.h
index 819a7e9381e3..16db1a243684 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.h
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
@@ -221,7 +221,7 @@ struct mgag200_device_info {
 
 	/*
 	 * HW does not handle 'startadd' register correctly. Always set
-	 * it's value to 0.
+	 * its value to 0.
 	 */
 	bool bug_no_startadd:1;
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
index aa62966056d4..e7693aeea5ae 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
@@ -96,7 +96,7 @@ void dpu_rm_print_state(struct drm_printer *p,
 			const struct dpu_global_state *global_state);
 
 /**
- * dpu_rm_get_intf - Return a struct dpu_hw_intf instance given it's index.
+ * dpu_rm_get_intf - Return a struct dpu_hw_intf instance given its index.
  * @rm: DPU Resource Manager handle
  * @intf_idx: INTF's index
  */
@@ -106,7 +106,7 @@ static inline struct dpu_hw_intf *dpu_rm_get_intf(struct dpu_rm *rm, enum dpu_in
 }
 
 /**
- * dpu_rm_get_wb - Return a struct dpu_hw_wb instance given it's index.
+ * dpu_rm_get_wb - Return a struct dpu_hw_wb instance given its index.
  * @rm: DPU Resource Manager handle
  * @wb_idx: WB index
  */
@@ -116,7 +116,7 @@ static inline struct dpu_hw_wb *dpu_rm_get_wb(struct dpu_rm *rm, enum dpu_wb wb_
 }
 
 /**
- * dpu_rm_get_sspp - Return a struct dpu_hw_sspp instance given it's index.
+ * dpu_rm_get_sspp - Return a struct dpu_hw_sspp instance given its index.
  * @rm: DPU Resource Manager handle
  * @sspp_idx: SSPP index
  */
diff --git a/drivers/gpu/drm/msm/dp/dp_audio.c b/drivers/gpu/drm/msm/dp/dp_audio.c
index f8bfb908f9b4..6050d17f1e9a 100644
--- a/drivers/gpu/drm/msm/dp/dp_audio.c
+++ b/drivers/gpu/drm/msm/dp/dp_audio.c
@@ -234,7 +234,7 @@ void msm_dp_audio_shutdown(struct drm_connector *connector,
 	 * to execute the shutdown and we can bail out early.
 	 * This also makes sure that we dont cause an unclocked
 	 * access when audio subsystem calls this without DP being
-	 * connected. is_connected cannot be used here as its set
+	 * connected. is_connected cannot be used here as it's set
 	 * to false earlier than this call
 	 */
 	if (!msm_dp_display->audio_enabled)
diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 4d75529c0e85..69888d9d2085 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -1124,7 +1124,7 @@ static void dsi_wait4video_eng_busy(struct msm_dsi_host *msm_host)
 
 	data = dsi_read(msm_host, REG_DSI_STATUS0);
 
-	/* if video mode engine is not busy, its because
+	/* if video mode engine is not busy, it's because
 	 * either timing engine was not turned on or the
 	 * DSI controller has finished transmitting the video
 	 * data already, so no need to wait in those cases
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index a65077855201..aace86dfce5d 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -125,7 +125,7 @@ struct msm_drm_private {
 	 * lru:
 	 *
 	 * The various LRU's that a GEM object is in at various stages of
-	 * it's lifetime.  Objects start out in the unbacked LRU.  When
+	 * its lifetime.  Objects start out in the unbacked LRU.  When
 	 * pinned (for scannout or permanently mapped GPU buffers, like
 	 * ringbuffer, memptr, fw, etc) it moves to the pinned LRU.  When
 	 * unpinned, it moves into willneed or dontneed LRU depending on
diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 2995e80fec3b..6f9066d2cb43 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -548,7 +548,7 @@ void msm_gem_unpin_locked(struct drm_gem_object *obj)
 /* Special unpin path for use in fence-signaling path, avoiding the need
  * to hold the obj lock by only depending on things that a protected by
  * the LRU lock.  In particular we know that that we already have backing
- * and and that the object's dma_resv has the fence for the current
+ * and that the object's dma_resv has the fence for the current
  * submit/job which will prevent us racing against page eviction.
  */
 void msm_gem_unpin_active(struct drm_gem_object *obj)
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index e25009150579..cadbf9677cf1 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -444,9 +444,9 @@ struct msm_file_private {
  * @sched_prio: [out] the gpu scheduler priority level which the userspace
  *              priority maps to
  *
- * With drm/scheduler providing it's own level of prioritization, our total
+ * With drm/scheduler providing its own level of prioritization, our total
  * number of available priority levels is (nr_rings * NR_SCHED_PRIORITIES).
- * Each ring is associated with it's own scheduler instance.  However, our
+ * Each ring is associated with its own scheduler instance.  However, our
  * UABI is that lower numerical values are higher priority.  So mapping the
  * single userspace priority level into ring_nr and sched_prio takes some
  * care.  The userspace provided priority (when a submitqueue is created)
diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.h b/drivers/gpu/drm/msm/msm_ringbuffer.h
index d1e49f701c81..bd22ae8268a2 100644
--- a/drivers/gpu/drm/msm/msm_ringbuffer.h
+++ b/drivers/gpu/drm/msm/msm_ringbuffer.h
@@ -98,7 +98,7 @@ struct msm_ringbuffer {
 
 	/*
 	 * preempt_lock protects preemption and serializes wptr updates against
-	 * preemption.  Can be aquired from irq context.
+	 * preemption.  Can be acquired from irq context.
 	 */
 	spinlock_t preempt_lock;
 
diff --git a/drivers/gpu/drm/msm/registers/adreno/adreno_pm4.xml b/drivers/gpu/drm/msm/registers/adreno/adreno_pm4.xml
index 5a6ae9fc3194..7ba9ee273ca5 100644
--- a/drivers/gpu/drm/msm/registers/adreno/adreno_pm4.xml
+++ b/drivers/gpu/drm/msm/registers/adreno/adreno_pm4.xml
@@ -746,7 +746,7 @@ opcode: CP_LOAD_STATE4 (30) (4 dwords)
 		for SSBO, STATE_TYPE=0 appears to be addresses (four dwords each),
 		STATE_TYPE=1 sizes, STATE_TYPE=2 addresses again (two dwords each)
 
-		Compute has it's own dedicated SSBO state, it seems, but the rest
+		Compute has its own dedicated SSBO state, it seems, but the rest
 		of the stages share state
 		 -->
 		<value name="SB4_SSBO"   value="0xe"/>
diff --git a/drivers/gpu/drm/nouveau/Kconfig b/drivers/gpu/drm/nouveau/Kconfig
index d1587639ebb0..5d1d5cc877ec 100644
--- a/drivers/gpu/drm/nouveau/Kconfig
+++ b/drivers/gpu/drm/nouveau/Kconfig
@@ -22,7 +22,7 @@ config DRM_NOUVEAU
 	select ACPI_WMI if ACPI && X86
 	select MXM_WMI if ACPI && X86
 	select POWER_SUPPLY
-	# Similar to i915, we need to select ACPI_VIDEO and it's dependencies
+	# Similar to i915, we need to select ACPI_VIDEO and its dependencies
 	select BACKLIGHT_CLASS_DEVICE if ACPI && X86
 	select INPUT if ACPI && X86
 	select THERMAL if ACPI && X86
diff --git a/drivers/gpu/drm/nouveau/dispnv04/crtc.c b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
index c063756eaea3..47c5ed1bd13a 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/crtc.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
@@ -222,7 +222,7 @@ nv_crtc_dpms(struct drm_crtc *crtc, int mode)
 	}
 
 	NVVgaSeqReset(dev, nv_crtc->index, true);
-	/* Each head has it's own sequencer, so we can turn it off when we want */
+	/* Each head has its own sequencer, so we can turn it off when we want */
 	seq1 |= (NVReadVgaSeq(dev, nv_crtc->index, NV_VIO_SR_CLOCK_INDEX) & ~0x20);
 	NVWriteVgaSeq(dev, nv_crtc->index, NV_VIO_SR_CLOCK_INDEX, seq1);
 	crtc17 |= (NVReadVgaCrtc(dev, nv_crtc->index, NV_CIO_CR_MODE_INDEX) & ~0x80);
diff --git a/drivers/gpu/drm/nouveau/dispnv50/crc.c b/drivers/gpu/drm/nouveau/dispnv50/crc.c
index deb6af40ef32..fae5bb0ff4eb 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/crc.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/crc.c
@@ -496,7 +496,7 @@ nv50_crc_raster_type(enum nv50_crc_source source)
 }
 
 /* We handle mapping the memory for CRC notifiers ourselves, since each
- * notifier needs it's own handle
+ * notifier needs its own handle
  */
 static inline int
 nv50_crc_ctx_init(struct nv50_head *head, struct nvif_mmu *mmu,
diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
index add006fc8d81..355a72203220 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.c
+++ b/drivers/gpu/drm/nouveau/nouveau_display.c
@@ -516,7 +516,7 @@ nouveau_display_acpi_ntfy(struct notifier_block *nb, unsigned long val,
 			if (ret == 1 || ret == -EACCES) {
 				/* If the GPU is already awake, or in a state
 				 * where we can't wake it up, it can handle
-				 * it's own hotplug events.
+				 * its own hotplug events.
 				 */
 				pm_runtime_put_autosuspend(drm->dev->dev);
 			} else if (ret == 0 || ret == -EINPROGRESS) {
diff --git a/drivers/gpu/drm/nouveau/nouveau_exec.c b/drivers/gpu/drm/nouveau/nouveau_exec.c
index 41b7c608c905..5de844925cf5 100644
--- a/drivers/gpu/drm/nouveau/nouveau_exec.c
+++ b/drivers/gpu/drm/nouveau/nouveau_exec.c
@@ -60,7 +60,7 @@
  * virtual address in the GPU's VA space there is no guarantee that the actual
  * mappings are created in the GPU's MMU. If the given memory is swapped out
  * at the time the bind operation is executed the kernel will stash the mapping
- * details into it's internal alloctor and create the actual MMU mappings once
+ * details into its internal alloctor and create the actual MMU mappings once
  * the memory is swapped back in. While this is transparent for userspace, it is
  * guaranteed that all the backing memory is swapped back in and all the memory
  * mappings, as requested by userspace previously, are actually mapped once the
diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
index 48f105239f42..f7f5104e6a99 100644
--- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
@@ -7,12 +7,12 @@
  * DRM GPU VA manager.
  *
  * The GEMs dma_resv lock protects the GEMs GPUVA list, hence link/unlink of a
- * mapping to it's backing GEM must be performed under this lock.
+ * mapping to its backing GEM must be performed under this lock.
  *
  * Actual map/unmap operations within the fence signalling critical path are
  * protected by installing DMA fences to the corresponding GEMs DMA
  * reservations, such that concurrent BO moves, which itself walk the GEMs GPUVA
- * list in order to map/unmap it's entries, can't occur concurrently.
+ * list in order to map/unmap its entries, can't occur concurrently.
  *
  * Accessing the DRM_GPUVA_INVALIDATED flag doesn't need any separate
  * protection, since there are no accesses other than from BO move callbacks
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/fuc/kernel.fuc b/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/fuc/kernel.fuc
index c20a3bd33775..95ef75ca9af8 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/fuc/kernel.fuc
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/fuc/kernel.fuc
@@ -254,7 +254,7 @@ ticks_from_ns:
 	imm32($r13, HW_TICKS_PER_US)
 	call(mulu32_32_64)
 
-	/* use an immeditate, it's ok because HW_TICKS_PER_US < 16 bits */
+	/* use an immediate, it's ok because HW_TICKS_PER_US < 16 bits */
 	div $r12 $r12 1000
 
 	/* check if there wasn't any overflow */
diff --git a/drivers/gpu/drm/omapdrm/dss/dispc.c b/drivers/gpu/drm/omapdrm/dss/dispc.c
index 533f70e8a4a6..854b9b6c6457 100644
--- a/drivers/gpu/drm/omapdrm/dss/dispc.c
+++ b/drivers/gpu/drm/omapdrm/dss/dispc.c
@@ -1459,7 +1459,7 @@ void dispc_ovl_set_fifo_threshold(struct dispc_device *dispc,
 			FLD_VAL(low, lo_start, lo_end));
 
 	/*
-	 * configure the preload to the pipeline's high threhold, if HT it's too
+	 * configure the preload to the pipeline's high threshold, if HT it's too
 	 * large for the preload field, set the threshold to the maximum value
 	 * that can be held by the preload register
 	 */
diff --git a/drivers/gpu/drm/omapdrm/omap_gem.c b/drivers/gpu/drm/omapdrm/omap_gem.c
index b9c67e4ca360..05e7af22b90d 100644
--- a/drivers/gpu/drm/omapdrm/omap_gem.c
+++ b/drivers/gpu/drm/omapdrm/omap_gem.c
@@ -930,7 +930,7 @@ int omap_gem_tiled_stride(struct drm_gem_object *obj, u32 orient)
  * because we don't support swapping pages back out).  And 'remap'
  * might not be quite the right name, but I wanted to keep it working
  * similarly to omap_gem_pin().  Note though that mutex is not
- * aquired if !remap (because this can be called in atomic ctxt),
+ * acquired if !remap (because this can be called in atomic ctxt),
  * but probably omap_gem_unpin() should be changed to work in the
  * same way.  If !remap, a matching omap_gem_put_pages() call is not
  * required (and should not be made).
diff --git a/drivers/gpu/drm/panfrost/panfrost_job.h b/drivers/gpu/drm/panfrost/panfrost_job.h
index ec581b97852b..0e134ee1ff8f 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.h
+++ b/drivers/gpu/drm/panfrost/panfrost_job.h
@@ -30,7 +30,7 @@ struct panfrost_job {
 	struct drm_gem_object **bos;
 	u32 bo_count;
 
-	/* Fence to be signaled by drm-sched once its done with the job */
+	/* Fence to be signaled by drm-sched once it's done with the job */
 	struct dma_fence *render_done_fence;
 
 	struct panfrost_engine_usage *engine_usage;
diff --git a/drivers/gpu/drm/qxl/qxl_cmd.c b/drivers/gpu/drm/qxl/qxl_cmd.c
index d6ea01f3797b..d31592aa5919 100644
--- a/drivers/gpu/drm/qxl/qxl_cmd.c
+++ b/drivers/gpu/drm/qxl/qxl_cmd.c
@@ -630,8 +630,8 @@ static int qxl_reap_surface_id(struct qxl_device *qdev, int max_to_reap)
 		void *objptr;
 		int surfid = i % qdev->rom->n_surfaces;
 
-		/* this avoids the case where the objects is in the
-		   idr but has been evicted half way - its makes
+		/* this avoids the case where the object is in the
+		   idr but has been evicted half way - it makes
 		   the idr lookup atomic with the eviction */
 		spin_lock(&qdev->surf_id_idr_lock);
 		objptr = idr_find(&qdev->surf_id_idr, surfid);
diff --git a/drivers/gpu/drm/radeon/atombios.h b/drivers/gpu/drm/radeon/atombios.h
index 1afa70566985..a03ad45af269 100644
--- a/drivers/gpu/drm/radeon/atombios.h
+++ b/drivers/gpu/drm/radeon/atombios.h
@@ -407,7 +407,7 @@ typedef struct _ATOM_ADJUST_MEMORY_CLOCK_FREQ
 
 typedef struct _COMPUTE_MEMORY_ENGINE_PLL_PARAMETERS
 {
-  ULONG   ulClock;        //When returen, it's the re-calculated clock based on given Fb_div Post_Div and ref_div
+  ULONG   ulClock;        //When return, it's the re-calculated clock based on given Fb_div Post_Div and ref_div
   UCHAR   ucAction;       //0:reserved //1:Memory //2:Engine  
   UCHAR   ucReserved;     //may expand to return larger Fbdiv later
   UCHAR   ucFbDiv;        //return value
diff --git a/drivers/gpu/drm/radeon/cik.c b/drivers/gpu/drm/radeon/cik.c
index 51a3e0fc2f56..090a88287fc2 100644
--- a/drivers/gpu/drm/radeon/cik.c
+++ b/drivers/gpu/drm/radeon/cik.c
@@ -4078,7 +4078,7 @@ static int cik_cp_gfx_resume(struct radeon_device *rdev)
 	ring->wptr = 0;
 	WREG32(CP_RB0_WPTR, ring->wptr);
 
-	/* set the wb address wether it's enabled or not */
+	/* set the wb address whether it's enabled or not */
 	WREG32(CP_RB0_RPTR_ADDR, (rdev->wb.gpu_addr + RADEON_WB_CP_RPTR_OFFSET) & 0xFFFFFFFC);
 	WREG32(CP_RB0_RPTR_ADDR_HI, upper_32_bits(rdev->wb.gpu_addr + RADEON_WB_CP_RPTR_OFFSET) & 0xFF);
 
@@ -4683,7 +4683,7 @@ static int cik_cp_compute_resume(struct radeon_device *rdev)
 		WREG32(CP_HQD_PQ_WPTR_POLL_ADDR_HI,
 		       mqd->queue_state.cp_hqd_pq_wptr_poll_addr_hi);
 
-		/* set the wb address wether it's enabled or not */
+		/* set the wb address whether it's enabled or not */
 		if (i == 0)
 			wb_gpu_addr = rdev->wb.gpu_addr + RADEON_WB_CP1_RPTR_OFFSET;
 		else
diff --git a/drivers/gpu/drm/radeon/cik_sdma.c b/drivers/gpu/drm/radeon/cik_sdma.c
index 919b14845c3c..adb8ef25097c 100644
--- a/drivers/gpu/drm/radeon/cik_sdma.c
+++ b/drivers/gpu/drm/radeon/cik_sdma.c
@@ -43,7 +43,7 @@
  * and 2 queues used for compute.
  *
  * The programming model is very similar to the CP
- * (ring buffer, IBs, etc.), but sDMA has it's own
+ * (ring buffer, IBs, etc.), but sDMA has its own
  * packet format that is different from the PM4 format
  * used by the CP. sDMA supports copying data, writing
  * embedded data, solid fills, and a number of other
diff --git a/drivers/gpu/drm/radeon/cikd.h b/drivers/gpu/drm/radeon/cikd.h
index cda16fcd43bb..5b9ccf31c6c6 100644
--- a/drivers/gpu/drm/radeon/cikd.h
+++ b/drivers/gpu/drm/radeon/cikd.h
@@ -1916,7 +1916,7 @@
 #              define PACKET3_DMA_DATA_CMD_SAIC    (1 << 28)
 #              define PACKET3_DMA_DATA_CMD_DAIC    (1 << 29)
 #              define PACKET3_DMA_DATA_CMD_RAW_WAIT  (1 << 30)
-#define	PACKET3_AQUIRE_MEM				0x58
+#define	PACKET3_ACQUIRE_MEM				0x58
 #define	PACKET3_REWIND					0x59
 #define	PACKET3_LOAD_UCONFIG_REG			0x5E
 #define	PACKET3_LOAD_SH_REG				0x5F
diff --git a/drivers/gpu/drm/radeon/ni_dma.c b/drivers/gpu/drm/radeon/ni_dma.c
index bd515ad4fe4c..4a3ce52924d8 100644
--- a/drivers/gpu/drm/radeon/ni_dma.c
+++ b/drivers/gpu/drm/radeon/ni_dma.c
@@ -33,7 +33,7 @@
  * Starting with R600, the GPU has an asynchronous
  * DMA engine.  The programming model is very similar
  * to the 3D engine (ring buffer, IBs, etc.), but the
- * DMA controller has it's own packet format that is
+ * DMA controller has its own packet format that is
  * different form the PM4 format used by the 3D engine.
  * It supports copying data, writing embedded data,
  * solid fills, and a number of other things.  It also
diff --git a/drivers/gpu/drm/radeon/r600_dma.c b/drivers/gpu/drm/radeon/r600_dma.c
index 89ca2738c5d4..bc74df329c53 100644
--- a/drivers/gpu/drm/radeon/r600_dma.c
+++ b/drivers/gpu/drm/radeon/r600_dma.c
@@ -32,7 +32,7 @@
  * Starting with R600, the GPU has an asynchronous
  * DMA engine.  The programming model is very similar
  * to the 3D engine (ring buffer, IBs, etc.), but the
- * DMA controller has it's own packet format that is
+ * DMA controller has its own packet format that is
  * different form the PM4 format used by the 3D engine.
  * It supports copying data, writing embedded data,
  * solid fills, and a number of other things.  It also
diff --git a/drivers/gpu/drm/radeon/radeon_connectors.c b/drivers/gpu/drm/radeon/radeon_connectors.c
index 9f6a3df951ba..ec7fd883702f 100644
--- a/drivers/gpu/drm/radeon/radeon_connectors.c
+++ b/drivers/gpu/drm/radeon/radeon_connectors.c
@@ -1207,7 +1207,7 @@ static bool radeon_check_hpd_status_unchanged(struct drm_connector *connector)
  * If we got no DDC, we do load detection on the DAC encoder object.
  * If we got analog DDC or load detection passes on the DAC encoder
  * we have to check if this analog encoder is shared with anyone else (TV)
- * if its shared we have to set the other connector to disconnected.
+ * if it's shared we have to set the other connector to disconnected.
  */
 static enum drm_connector_status
 radeon_dvi_detect(struct drm_connector *connector, bool force)
diff --git a/drivers/gpu/drm/radeon/radeon_device.c b/drivers/gpu/drm/radeon/radeon_device.c
index bbd39348a7ab..5e95106b00e9 100644
--- a/drivers/gpu/drm/radeon/radeon_device.c
+++ b/drivers/gpu/drm/radeon/radeon_device.c
@@ -197,7 +197,7 @@ static void radeon_device_handle_px_quirks(struct radeon_device *rdev)
  * @registers: pointer to the register array
  * @array_size: size of the register array
  *
- * Programs an array or registers with and and or masks.
+ * Programs an array or registers with AND and OR masks.
  * This is a helper for setting golden registers.
  */
 void radeon_program_register_sequence(struct radeon_device *rdev,
@@ -555,7 +555,7 @@ int radeon_wb_init(struct radeon_device *rdev)
  * cover the whole aperture even if VRAM size is inferior to aperture size
  * Novell bug 204882 + along with lots of ubuntu ones
  *
- * Note 3: when limiting vram it's safe to overwritte real_vram_size because
+ * Note 3: when limiting vram it's safe to overwrite real_vram_size because
  * we are not in case where real_vram_size is inferior to mc_vram_size (ie
  * not affected by bogus hw of Novell bug 204882 + along with lots of ubuntu
  * ones)
diff --git a/drivers/gpu/drm/radeon/radeon_display.c b/drivers/gpu/drm/radeon/radeon_display.c
index 8f5f8abcb1b4..504393173abb 100644
--- a/drivers/gpu/drm/radeon/radeon_display.c
+++ b/drivers/gpu/drm/radeon/radeon_display.c
@@ -940,7 +940,7 @@ static void avivo_get_fb_ref_div(unsigned nom, unsigned den, unsigned post_div,
 }
 
 /**
- * radeon_compute_pll_avivo - compute PLL paramaters
+ * radeon_compute_pll_avivo - compute PLL parameters
  *
  * @pll: information about the PLL
  * @freq: target frequency
diff --git a/drivers/gpu/drm/radeon/radeon_family.h b/drivers/gpu/drm/radeon/radeon_family.h
index 4b7b87f71a63..03ae368b1309 100644
--- a/drivers/gpu/drm/radeon/radeon_family.h
+++ b/drivers/gpu/drm/radeon/radeon_family.h
@@ -27,7 +27,7 @@
  */
 
 /* this file defines the CHIP_  and family flags used in the pciids,
- * its is common between kms and non-kms because duplicating it and
+ * its common between kms and non-kms because duplicating it and
  * changing one place is fail.
  */
 #ifndef RADEON_FAMILY_H
diff --git a/drivers/gpu/drm/radeon/radeon_gem.c b/drivers/gpu/drm/radeon/radeon_gem.c
index f86773f3db20..f7cddb11f75a 100644
--- a/drivers/gpu/drm/radeon/radeon_gem.c
+++ b/drivers/gpu/drm/radeon/radeon_gem.c
@@ -599,7 +599,7 @@ int radeon_gem_get_tiling_ioctl(struct drm_device *dev, void *data,
  * @rdev: radeon_device pointer
  * @bo_va: bo_va to update
  *
- * Update the bo_va directly after setting it's address. Errors are not
+ * Update the bo_va directly after setting its address. Errors are not
  * vital here, so they are not reported back to userspace.
  */
 static void radeon_gem_va_update_vm(struct radeon_device *rdev,
diff --git a/drivers/gpu/drm/radeon/radeon_uvd.c b/drivers/gpu/drm/radeon/radeon_uvd.c
index ded5747a58d1..ee79afaba488 100644
--- a/drivers/gpu/drm/radeon/radeon_uvd.c
+++ b/drivers/gpu/drm/radeon/radeon_uvd.c
@@ -593,7 +593,7 @@ static int radeon_uvd_cs_reloc(struct radeon_cs_parser *p,
 			return -EINVAL;
 		}
 		if ((end - start) < buf_sizes[cmd]) {
-			DRM_ERROR("buffer (%d) to small (%d / %d)!\n", cmd,
+			DRM_ERROR("buffer (%d) too small (%d / %d)!\n", cmd,
 				  (unsigned)(end - start), buf_sizes[cmd]);
 			return -EINVAL;
 		}
diff --git a/drivers/gpu/drm/radeon/radeon_vce.c b/drivers/gpu/drm/radeon/radeon_vce.c
index 2355a78e1b69..797e2a41780d 100644
--- a/drivers/gpu/drm/radeon/radeon_vce.c
+++ b/drivers/gpu/drm/radeon/radeon_vce.c
@@ -497,7 +497,7 @@ int radeon_vce_cs_reloc(struct radeon_cs_parser *p, int lo, int hi,
 		return -EINVAL;
 	}
 	if ((end - start) < size) {
-		DRM_ERROR("buffer to small (%d / %d)!\n",
+		DRM_ERROR("buffer too small (%d / %d)!\n",
 			(unsigned)(end - start), size);
 		return -EINVAL;
 	}
diff --git a/drivers/gpu/drm/radeon/radeon_vm.c b/drivers/gpu/drm/radeon/radeon_vm.c
index 21a5340aefdf..09f334e49016 100644
--- a/drivers/gpu/drm/radeon/radeon_vm.c
+++ b/drivers/gpu/drm/radeon/radeon_vm.c
@@ -559,7 +559,7 @@ int radeon_vm_bo_set_addr(struct radeon_device *rdev,
 			return r;
 		}
 
-		/* aquire mutex again */
+		/* acquire mutex again */
 		mutex_lock(&vm->mutex);
 		if (vm->page_tables[pt_idx].bo) {
 			/* someone else allocated the pt in the meantime */
diff --git a/drivers/gpu/drm/radeon/uvd_v1_0.c b/drivers/gpu/drm/radeon/uvd_v1_0.c
index 5684639d20a6..56803beee9e8 100644
--- a/drivers/gpu/drm/radeon/uvd_v1_0.c
+++ b/drivers/gpu/drm/radeon/uvd_v1_0.c
@@ -105,7 +105,7 @@ void uvd_v1_0_fence_emit(struct radeon_device *rdev,
  *
  * @rdev: radeon_device pointer
  *
- * Let the UVD memory controller know it's offsets
+ * Let the UVD memory controller know its offsets
  */
 int uvd_v1_0_resume(struct radeon_device *rdev)
 {
@@ -273,7 +273,7 @@ int uvd_v1_0_start(struct radeon_device *rdev)
 	/* disable clock gating */
 	WREG32(UVD_CGC_GATE, 0);
 
-	/* disable interupt */
+	/* disable interrupt */
 	WREG32_P(UVD_MASTINT_EN, 0, ~(1 << 1));
 
 	/* Stall UMC and register bus before resetting VCPU */
@@ -351,7 +351,7 @@ int uvd_v1_0_start(struct radeon_device *rdev)
 		return r;
 	}
 
-	/* enable interupt */
+	/* enable interrupt */
 	WREG32_P(UVD_MASTINT_EN, 3<<1, ~(3 << 1));
 
 	/* force RBC into idle state */
diff --git a/drivers/gpu/drm/radeon/uvd_v2_2.c b/drivers/gpu/drm/radeon/uvd_v2_2.c
index 6266167886d9..322736ae391c 100644
--- a/drivers/gpu/drm/radeon/uvd_v2_2.c
+++ b/drivers/gpu/drm/radeon/uvd_v2_2.c
@@ -93,7 +93,7 @@ bool uvd_v2_2_semaphore_emit(struct radeon_device *rdev,
  *
  * @rdev: radeon_device pointer
  *
- * Let the UVD memory controller know it's offsets
+ * Let the UVD memory controller know its offsets
  */
 int uvd_v2_2_resume(struct radeon_device *rdev)
 {
diff --git a/drivers/gpu/drm/radeon/uvd_v4_2.c b/drivers/gpu/drm/radeon/uvd_v4_2.c
index f9e97fa63674..22c0f386bebb 100644
--- a/drivers/gpu/drm/radeon/uvd_v4_2.c
+++ b/drivers/gpu/drm/radeon/uvd_v4_2.c
@@ -33,7 +33,7 @@
  *
  * @rdev: radeon_device pointer
  *
- * Let the UVD memory controller know it's offsets
+ * Let the UVD memory controller know its offsets
  */
 int uvd_v4_2_resume(struct radeon_device *rdev)
 {
diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
index e971528504a5..d74b47cc5f7b 100644
--- a/drivers/gpu/drm/scheduler/sched_fence.c
+++ b/drivers/gpu/drm/scheduler/sched_fence.c
@@ -171,7 +171,7 @@ static void drm_sched_fence_set_deadline_finished(struct dma_fence *f,
 	spin_unlock_irqrestore(&fence->lock, flags);
 
 	/*
-	 * smp_load_aquire() to ensure that if we are racing another
+	 * smp_load_acquire() to ensure that if we are racing another
 	 * thread calling drm_sched_fence_set_parent(), that we see
 	 * the parent set before it calls test_bit(HAS_DEADLINE_BIT)
 	 */
diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index 21f3dfdcc5c9..687abe8e057e 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -3895,7 +3895,7 @@ static int tegra_sor_probe(struct platform_device *pdev)
 	}
 
 	/*
-	 * The bootloader may have set up the SOR such that it's module clock
+	 * The bootloader may have set up the SOR such that its module clock
 	 * is sourced by one of the display PLLs. However, that doesn't work
 	 * without properly having set up other bits of the SOR.
 	 */
diff --git a/drivers/gpu/drm/tidss/tidss_crtc.c b/drivers/gpu/drm/tidss/tidss_crtc.c
index 94f8e3178df5..698889b0370e 100644
--- a/drivers/gpu/drm/tidss/tidss_crtc.c
+++ b/drivers/gpu/drm/tidss/tidss_crtc.c
@@ -31,7 +31,7 @@ static void tidss_crtc_finish_page_flip(struct tidss_crtc *tcrtc)
 	/*
 	 * New settings are taken into use at VFP, and GO bit is cleared at
 	 * the same time. This happens before the vertical blank interrupt.
-	 * So there is a small change that the driver sets GO bit after VFP, but
+	 * So there is a small chance that the driver sets GO bit after VFP, but
 	 * before vblank, and we have to check for that case here.
 	 */
 	busy = dispc_vp_go_busy(tidss->dispc, tcrtc->hw_videoport);
@@ -176,7 +176,7 @@ static void tidss_crtc_atomic_flush(struct drm_crtc *crtc,
 
 	/*
 	 * Flush CRTC changes with go bit only if new modeset is not
-	 * coming, so CRTC is enabled trough out the commit.
+	 * coming, so CRTC is enabled throughout the commit.
 	 */
 	if (drm_atomic_crtc_needs_modeset(crtc->state))
 		return;
@@ -269,7 +269,7 @@ static void tidss_crtc_atomic_disable(struct drm_crtc *crtc,
 	 * If a layer is left enabled when the videoport is disabled, and the
 	 * vid pipeline that was used for the layer is taken into use on
 	 * another videoport, the DSS will report sync lost issues. Disable all
-	 * the layers here as a work-around.
+	 * the layers here as a workaround.
 	 */
 	for (u32 layer = 0; layer < tidss->feat->num_planes; layer++)
 		dispc_ovr_enable_layer(tidss->dispc, tcrtc->hw_videoport, layer,
@@ -435,9 +435,9 @@ struct tidss_crtc *tidss_crtc_create(struct tidss_device *tidss,
 	drm_crtc_helper_add(crtc, &tidss_crtc_helper_funcs);
 
 	/*
-	 * The dispc gamma functions adapt to what ever size we ask
+	 * The dispc gamma functions adapt to whatever size we ask
 	 * from it no matter what HW supports. X-server assumes 256
-	 * element gamma tables so lets use that.
+	 * element gamma tables so let's use that.
 	 */
 	if (tidss->feat->vp_feat.color.gamma_size)
 		gamma_lut_size = 256;
diff --git a/drivers/gpu/drm/vmwgfx/ttm_object.c b/drivers/gpu/drm/vmwgfx/ttm_object.c
index 36d46b79562a..edd260dcbef0 100644
--- a/drivers/gpu/drm/vmwgfx/ttm_object.c
+++ b/drivers/gpu/drm/vmwgfx/ttm_object.c
@@ -431,7 +431,7 @@ ttm_object_device_init(const struct dma_buf_ops *ops)
 
 	/*
 	 * Our base is at VMWGFX_NUM_MOB + 1 because we want to create
-	 * a seperate namespace for GEM handles (which are
+	 * a separate namespace for GEM handles (which are
 	 * 1..VMWGFX_NUM_MOB) and the surface handles. Some ioctl's
 	 * can take either handle as an argument so we want to
 	 * easily be able to tell whether the handle refers to a
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c b/drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c
index 7de20e56082c..9f2a4faf34e8 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c
@@ -286,7 +286,7 @@ void vmw_bo_dirty_release(struct vmw_bo *vbo)
  * @res: The resource
  *
  * This function will pick up all dirty ranges affecting the resource from
- * it's backup mob, and call vmw_resource_dirty_update() once for each
+ * its backup mob, and call vmw_resource_dirty_update() once for each
  * range. The transferred ranges will be cleared from the backing mob's
  * dirty tracking.
  */
@@ -368,7 +368,7 @@ void vmw_bo_dirty_clear(struct vmw_bo *vbo)
  * @res: The resource
  *
  * This function will clear all dirty ranges affecting the resource from
- * it's backup mob's dirty tracking.
+ * its backup mob's dirty tracking.
  */
 void vmw_bo_dirty_clear_res(struct vmw_resource *res)
 {
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c b/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
index 7e281c3c6bc5..aca768ace405 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
@@ -444,7 +444,7 @@ static int vmw_legacy_srf_create(struct vmw_resource *res)
  *                  vmw_surface.
  * @val_buf:        Pointer to a struct ttm_validate_buffer containing
  *                  information about the backup buffer.
- * @bind:           Boolean wether to DMA to the surface.
+ * @bind:           Boolean whether to DMA to the surface.
  *
  * Transfer backup data to or from a legacy surface as part of the
  * validation process.
diff --git a/drivers/gpu/drm/xen/xen_drm_front_kms.c b/drivers/gpu/drm/xen/xen_drm_front_kms.c
index dfa78a49a6d9..1162256678b4 100644
--- a/drivers/gpu/drm/xen/xen_drm_front_kms.c
+++ b/drivers/gpu/drm/xen/xen_drm_front_kms.c
@@ -231,7 +231,7 @@ static int display_check(struct drm_simple_display_pipe *pipe,
 	 * DRM helpers assume that it doesn't handle vblanking and start
 	 * sending out fake VBLANK events automatically.
 	 *
-	 * As xen contains it's own logic for sending out VBLANK events
+	 * As xen contains its own logic for sending out VBLANK events
 	 * in send_pending_event(), disable no_vblank (i.e., the xen
 	 * driver has vblanking support).
 	 */
-- 
2.43.0

