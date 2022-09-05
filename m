Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 868625AD9A6
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 21:31:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB46F10E032;
	Mon,  5 Sep 2022 19:31:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m12-14.163.com (m12-14.163.com [220.181.12.14])
 by gabe.freedesktop.org (Postfix) with ESMTP id CEC3910E032;
 Mon,  5 Sep 2022 19:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=vL5yJ
 PUvhdzmFppLZwEugsxV2wOhSaPjy5HVCDb0MhU=; b=hiFpAtkwvNq7gafPTBy6T
 yXO9Y5lHObI5oKLZmNOFGgMbSg3iOpSsqztjEmVRloWwSStcY07lDGjx110jAwZR
 I7Al/88zT493uRBc3lqQ/XoCL2lhkptQGFZTLcXAQFurzyA7AyVf7bX+SHBQ+jAL
 dT5nIVtdNKcqAWNfCRtSSk=
Received: from f00160-VMware-Virtual-Platform.localdomain (unknown
 [1.203.67.201])
 by smtp10 (Coremail) with SMTP id DsCowABnMUhKThZjcT1DGQ--.47100S4;
 Tue, 06 Sep 2022 03:30:34 +0800 (CST)
From: Jingyu Wang <jingyuwang_vip@163.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@linux.ie, daniel@ffwll.ch, andrey.grodzovsky@amd.com,
 Felix.Kuehling@amd.com, guchun.chen@amd.com, shaoyun.liu@amd.com,
 Amaranath.Somalapuram@amd.com, lang.yu@amd.com
Subject: [PATCH] drm/amdgpu: cleanup coding style in amdgpu_device.c
Date: Tue,  6 Sep 2022 03:30:15 +0800
Message-Id: <20220905193015.28283-1-jingyuwang_vip@163.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DsCowABnMUhKThZjcT1DGQ--.47100S4
X-Coremail-Antispam: 1Uf129KBjvAXoW3Zr43Zr13tryUuw4UurWxWFg_yoW8GFyUuo
 W5Wr13Xr4rtFyxGr48JFyxGFy2qw4DAa4DCr1rJF1UG390qryYq3Zxuw1fJry5Kr4rKF4k
 Zw1fArn5CFW3t3yfn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
 AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvj4RIksgDUUUU
X-Originating-IP: [1.203.67.201]
X-CM-SenderInfo: 5mlqw5xxzd0whbyl1qqrwthudrp/xtbCoApzF1zmWE7c2gAAsk
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
Cc: Jingyu Wang <jingyuwang_vip@163.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix some checkpatch.pl complained about in amdgpu_device.c

Signed-off-by: Jingyu Wang <jingyuwang_vip@163.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 136 +++++++++++----------
 1 file changed, 69 insertions(+), 67 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index afaa1056e039..05d9aa3b5131 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -149,7 +149,7 @@ static ssize_t amdgpu_device_get_pcie_replay_count(struct device *dev,
 	return sysfs_emit(buf, "%llu\n", cnt);
 }
 
-static DEVICE_ATTR(pcie_replay_count, S_IRUGO,
+static DEVICE_ATTR(pcie_replay_count, 0444,
 		amdgpu_device_get_pcie_replay_count, NULL);
 
 static void amdgpu_device_get_pcie_info(struct amdgpu_device *adev);
@@ -173,7 +173,7 @@ static ssize_t amdgpu_device_get_product_name(struct device *dev,
 	return sysfs_emit(buf, "%s\n", adev->product_name);
 }
 
-static DEVICE_ATTR(product_name, S_IRUGO,
+static DEVICE_ATTR(product_name, 0444,
 		amdgpu_device_get_product_name, NULL);
 
 /**
@@ -195,7 +195,7 @@ static ssize_t amdgpu_device_get_product_number(struct device *dev,
 	return sysfs_emit(buf, "%s\n", adev->product_number);
 }
 
-static DEVICE_ATTR(product_number, S_IRUGO,
+static DEVICE_ATTR(product_number, 0444,
 		amdgpu_device_get_product_number, NULL);
 
 /**
@@ -217,7 +217,7 @@ static ssize_t amdgpu_device_get_serial_number(struct device *dev,
 	return sysfs_emit(buf, "%s\n", adev->serial);
 }
 
-static DEVICE_ATTR(serial_number, S_IRUGO,
+static DEVICE_ATTR(serial_number, 0444,
 		amdgpu_device_get_serial_number, NULL);
 
 /**
@@ -360,11 +360,11 @@ size_t amdgpu_device_aper_access(struct amdgpu_device *adev, loff_t pos,
 
 		if (write) {
 			memcpy_toio(addr, buf, count);
-			mb();
+			mb(); /* make sure io happens */
 			amdgpu_device_flush_hdp(adev, NULL);
 		} else {
 			amdgpu_device_invalidate_hdp(adev, NULL);
-			mb();
+			mb(); /* make sure io happens */
 			memcpy_fromio(buf, addr, count);
 		}
 
@@ -472,7 +472,7 @@ uint32_t amdgpu_device_rreg(struct amdgpu_device *adev,
  * MMIO register read with bytes helper functions
  * @offset:bytes offset from MMIO start
  *
-*/
+ */
 
 /**
  * amdgpu_mm_rreg8 - read a memory mapped IO register
@@ -497,7 +497,7 @@ uint8_t amdgpu_mm_rreg8(struct amdgpu_device *adev, uint32_t offset)
  * @offset:bytes offset from MMIO start
  * @value: the value want to be written to the register
  *
-*/
+ */
 /**
  * amdgpu_mm_wreg8 - read a memory mapped IO register
  *
@@ -615,11 +615,10 @@ void amdgpu_mm_wdoorbell(struct amdgpu_device *adev, u32 index, u32 v)
 	if (amdgpu_device_skip_hw_access(adev))
 		return;
 
-	if (index < adev->doorbell.num_doorbells) {
+	if (index < adev->doorbell.num_doorbells)
 		writel(v, adev->doorbell.ptr + index);
-	} else {
+	else
 		DRM_ERROR("writing beyond doorbell aperture: 0x%08x!\n", index);
-	}
 }
 
 /**
@@ -659,11 +658,10 @@ void amdgpu_mm_wdoorbell64(struct amdgpu_device *adev, u32 index, u64 v)
 	if (amdgpu_device_skip_hw_access(adev))
 		return;
 
-	if (index < adev->doorbell.num_doorbells) {
+	if (index < adev->doorbell.num_doorbells)
 		atomic64_set((atomic64_t *)(adev->doorbell.ptr + index), v);
-	} else {
+	else
 		DRM_ERROR("writing beyond doorbell aperture: 0x%08x!\n", index);
-	}
 }
 
 /**
@@ -958,7 +956,7 @@ static void amdgpu_device_vram_scratch_fini(struct amdgpu_device *adev)
  * @registers: pointer to the register array
  * @array_size: size of the register array
  *
- * Programs an array or registers with and and or masks.
+ * Programs an array or registers with and or masks.
  * This is a helper for setting golden registers.
  */
 void amdgpu_device_program_register_sequence(struct amdgpu_device *adev,
@@ -971,7 +969,7 @@ void amdgpu_device_program_register_sequence(struct amdgpu_device *adev,
 	if (array_size % 3)
 		return;
 
-	for (i = 0; i < array_size; i +=3) {
+	for (i = 0; i < array_size; i += 3) {
 		reg = registers[i + 0];
 		and_mask = registers[i + 1];
 		or_mask = registers[i + 2];
@@ -1200,7 +1198,7 @@ int amdgpu_device_resize_fb_bar(struct amdgpu_device *adev)
 	int rbar_size = pci_rebar_bytes_to_size(adev->gmc.real_vram_size);
 	struct pci_bus *root;
 	struct resource *res;
-	unsigned i;
+	unsigned int i;
 	u16 cmd;
 	int r;
 
@@ -1292,6 +1290,7 @@ bool amdgpu_device_need_post(struct amdgpu_device *adev)
 		if (adev->asic_type == CHIP_FIJI) {
 			int err;
 			uint32_t fw_ver;
+
 			err = request_firmware(&adev->pm.fw, "amdgpu/fiji_smc.bin", adev->dev);
 			/* force vPost if error occured */
 			if (err)
@@ -1364,6 +1363,7 @@ static unsigned int amdgpu_device_vga_set_decode(struct pci_dev *pdev,
 		bool state)
 {
 	struct amdgpu_device *adev = drm_to_adev(pci_get_drvdata(pdev));
+
 	amdgpu_asic_set_vga_state(adev, state);
 	if (state)
 		return VGA_RSRC_LEGACY_IO | VGA_RSRC_LEGACY_MEM |
@@ -1386,7 +1386,8 @@ static void amdgpu_device_check_block_size(struct amdgpu_device *adev)
 {
 	/* defines number of bits in page table versus page directory,
 	 * a page is 4KB so we have 12 bits offset, minimum 9 bits in the
-	 * page table and the remaining bits are in the page directory */
+	 * page table and the remaining bits are in the page directory
+	 */
 	if (amdgpu_vm_block_size == -1)
 		return;
 
@@ -1509,7 +1510,7 @@ static int amdgpu_device_check_arguments(struct amdgpu_device *adev)
 		dev_warn(adev->dev, "sched jobs (%d) must be at least 4\n",
 			 amdgpu_sched_jobs);
 		amdgpu_sched_jobs = 4;
-	} else if (!is_power_of_2(amdgpu_sched_jobs)){
+	} else if (!is_power_of_2(amdgpu_sched_jobs)) {
 		dev_warn(adev->dev, "sched jobs (%d) must be a power of 2\n",
 			 amdgpu_sched_jobs);
 		amdgpu_sched_jobs = roundup_pow_of_two(amdgpu_sched_jobs);
@@ -1569,7 +1570,7 @@ static int amdgpu_device_check_arguments(struct amdgpu_device *adev)
  * @state: vga_switcheroo state
  *
  * Callback for the switcheroo driver.  Suspends or resumes the
- * the asics before or after it is powered up using ACPI methods.
+ * asics before or after it is powered up using ACPI methods.
  */
 static void amdgpu_switcheroo_set_state(struct pci_dev *pdev,
 					enum vga_switcheroo_state state)
@@ -1619,10 +1620,10 @@ static bool amdgpu_switcheroo_can_switch(struct pci_dev *pdev)
 	struct drm_device *dev = pci_get_drvdata(pdev);
 
 	/*
-	* FIXME: open_count is protected by drm_global_mutex but that would lead to
-	* locking inversion with the driver load path. And the access here is
-	* completely racy anyway. So don't bother with locking for now.
-	*/
+	 * FIXME: open_count is protected by drm_global_mutex but that would lead to
+	 * locking inversion with the driver load path. And the access here is
+	 * completely racy anyway. So don't bother with locking for now.
+	 */
 	return atomic_read(&dev->open_count) == 0;
 }
 
@@ -2698,8 +2699,8 @@ static int amdgpu_device_ip_late_init(struct amdgpu_device *adev)
 		DRM_ERROR("enable mgpu fan boost failed (%d).\n", r);
 
 	/* For passthrough configuration on arcturus and aldebaran, enable special handling SBR */
-	if (amdgpu_passthrough(adev) && ((adev->asic_type == CHIP_ARCTURUS && adev->gmc.xgmi.num_physical_nodes > 1)||
-			       adev->asic_type == CHIP_ALDEBARAN ))
+	if (amdgpu_passthrough(adev) && ((adev->asic_type == CHIP_ARCTURUS && adev->gmc.xgmi.num_physical_nodes > 1) ||
+			       adev->asic_type == CHIP_ALDEBARAN))
 		amdgpu_dpm_handle_passthrough_sbr(adev, true);
 
 	if (adev->gmc.xgmi.num_physical_nodes > 1) {
@@ -3001,7 +3002,7 @@ static int amdgpu_device_ip_suspend_phase2(struct amdgpu_device *adev)
 		}
 		adev->ip_blocks[i].status.hw = false;
 		/* handle putting the SMC in the appropriate state */
-		if(!amdgpu_sriov_vf(adev)){
+		if (!amdgpu_sriov_vf(adev)) {
 			if (adev->ip_blocks[i].version->type == AMD_IP_BLOCK_TYPE_SMC) {
 				r = amdgpu_dpm_set_mp1_state(adev, adev->mp1_state);
 				if (r) {
@@ -3203,7 +3204,7 @@ static int amdgpu_device_ip_resume_phase2(struct amdgpu_device *adev)
  *
  * Main resume function for hardware IPs.  The hardware IPs
  * are split into two resume functions because they are
- * are also used in in recovering from a GPU reset and some additional
+ * also used in recovering from a GPU reset and some additional
  * steps need to be take between them.  In this case (S3/S4) they are
  * run sequentially.
  * Returns 0 on success, negative error code on failure.
@@ -3532,7 +3533,8 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 		 pdev->subsystem_vendor, pdev->subsystem_device, pdev->revision);
 
 	/* mutex initialization are all done here so we
-	 * can recall function without having locking issues */
+	 * can recall function without having locking issues
+	 */
 	mutex_init(&adev->firmware.mutex);
 	mutex_init(&adev->pm.mutex);
 	mutex_init(&adev->gfx.gpu_clock_mutex);
@@ -3608,11 +3610,10 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 		atomic_set(&adev->pm.pwr_state[i], POWER_STATE_UNKNOWN);
 
 	adev->rmmio = ioremap(adev->rmmio_base, adev->rmmio_size);
-	if (adev->rmmio == NULL) {
+	if (adev->rmmio == NULL)
 		return -ENOMEM;
-	}
 	DRM_INFO("register mmio base: 0x%08X\n", (uint32_t)adev->rmmio_base);
-	DRM_INFO("register mmio size: %u\n", (unsigned)adev->rmmio_size);
+	DRM_INFO("register mmio size: %u\n", (unsigned int)adev->rmmio_size);
 
 	amdgpu_device_get_pcie_info(adev);
 
@@ -3862,7 +3863,8 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 
 	/* if we have > 1 VGA cards, then disable the amdgpu VGA resources */
 	/* this will fail for cards that aren't VGA class devices, just
-	 * ignore it */
+	 * ignore it
+	 */
 	if ((adev->pdev->class >> 8) == PCI_CLASS_DISPLAY_VGA)
 		vga_client_register(adev->pdev, amdgpu_device_vga_set_decode);
 
@@ -3928,7 +3930,7 @@ void amdgpu_device_fini_hw(struct amdgpu_device *adev)
 
 	/* make sure IB test finished before entering exclusive mode
 	 * to avoid preemption on IB test
-	 * */
+	 */
 	if (amdgpu_sriov_vf(adev)) {
 		amdgpu_virt_request_full_gpu(adev, false);
 		amdgpu_virt_fini_data_exchange(adev);
@@ -3936,7 +3938,7 @@ void amdgpu_device_fini_hw(struct amdgpu_device *adev)
 
 	/* disable all interrupts */
 	amdgpu_irq_disable_all(adev);
-	if (adev->mode_info.mode_config_initialized){
+	if (adev->mode_info.mode_config_initialized) {
 		if (!drm_drv_uses_atomic_modeset(adev_to_drm(adev)))
 			drm_helper_force_disable_all(adev_to_drm(adev));
 		else
@@ -4516,7 +4518,7 @@ bool amdgpu_device_should_recover_gpu(struct amdgpu_device *adev)
 		goto disabled;
 
 	if (!amdgpu_device_ip_check_soft_reset(adev)) {
-		dev_info(adev->dev,"Timeout, but no hardware hang detected.\n");
+		dev_info(adev->dev, "Timeout, but no hardware hang detected.\n");
 		return false;
 	}
 
@@ -4555,42 +4557,42 @@ bool amdgpu_device_should_recover_gpu(struct amdgpu_device *adev)
 
 int amdgpu_device_mode1_reset(struct amdgpu_device *adev)
 {
-        u32 i;
-        int ret = 0;
+	u32 i;
+	int ret = 0;
 
-        amdgpu_atombios_scratch_regs_engine_hung(adev, true);
+	amdgpu_atombios_scratch_regs_engine_hung(adev, true);
 
-        dev_info(adev->dev, "GPU mode1 reset\n");
+	dev_info(adev->dev, "GPU mode1 reset\n");
 
-        /* disable BM */
-        pci_clear_master(adev->pdev);
+	/* disable BM */
+	pci_clear_master(adev->pdev);
 
-        amdgpu_device_cache_pci_state(adev->pdev);
+	amdgpu_device_cache_pci_state(adev->pdev);
 
-        if (amdgpu_dpm_is_mode1_reset_supported(adev)) {
-                dev_info(adev->dev, "GPU smu mode1 reset\n");
-                ret = amdgpu_dpm_mode1_reset(adev);
-        } else {
-                dev_info(adev->dev, "GPU psp mode1 reset\n");
-                ret = psp_gpu_reset(adev);
-        }
+	if (amdgpu_dpm_is_mode1_reset_supported(adev)) {
+		dev_info(adev->dev, "GPU smu mode1 reset\n");
+		ret = amdgpu_dpm_mode1_reset(adev);
+	} else {
+		dev_info(adev->dev, "GPU psp mode1 reset\n");
+		ret = psp_gpu_reset(adev);
+	}
 
-        if (ret)
-                dev_err(adev->dev, "GPU mode1 reset failed\n");
+	if (ret)
+		dev_err(adev->dev, "GPU mode1 reset failed\n");
 
-        amdgpu_device_load_pci_state(adev->pdev);
+	amdgpu_device_load_pci_state(adev->pdev);
 
-        /* wait for asic to come out of reset */
-        for (i = 0; i < adev->usec_timeout; i++) {
-                u32 memsize = adev->nbio.funcs->get_memsize(adev);
+	/* wait for asic to come out of reset */
+	for (i = 0; i < adev->usec_timeout; i++) {
+		u32 memsize = adev->nbio.funcs->get_memsize(adev);
 
-                if (memsize != 0xffffffff)
-                        break;
-                udelay(1);
-        }
+		if (memsize != 0xffffffff)
+			break;
+		udelay(1);
+	}
 
-        amdgpu_atombios_scratch_regs_engine_hung(adev, false);
-        return ret;
+	amdgpu_atombios_scratch_regs_engine_hung(adev, false);
+	return ret;
 }
 
 int amdgpu_device_pre_asic_reset(struct amdgpu_device *adev,
@@ -4619,7 +4621,8 @@ int amdgpu_device_pre_asic_reset(struct amdgpu_device *adev,
 			continue;
 
 		/*clear job fence from fence drv to avoid force_completion
-		 *leave NULL and vm flush fence in fence drv */
+		 *leave NULL and vm flush fence in fence drv
+		 */
 		amdgpu_fence_driver_clear_job_fences(ring);
 
 		/* after all hw jobs are reset, hw fence is meaningless, so force_completion */
@@ -5312,9 +5315,8 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
 		if (adev->enable_mes)
 			amdgpu_mes_self_test(tmp_adev);
 
-		if (!drm_drv_uses_atomic_modeset(adev_to_drm(tmp_adev)) && !job_signaled) {
+		if (!drm_drv_uses_atomic_modeset(adev_to_drm(tmp_adev)) && !job_signaled)
 			drm_helper_resume_force_mode(adev_to_drm(tmp_adev));
-		}
 
 		if (tmp_adev->asic_reset_res)
 			r = tmp_adev->asic_reset_res;
@@ -5845,8 +5847,8 @@ void amdgpu_device_invalidate_hdp(struct amdgpu_device *adev,
 int amdgpu_in_reset(struct amdgpu_device *adev)
 {
 	return atomic_read(&adev->reset_domain->in_gpu_reset);
-	}
-	
+}
+
 /**
  * amdgpu_device_halt() - bring hardware to some kind of halt state
  *

base-commit: e47eb90a0a9ae20b82635b9b99a8d0979b757ad8
-- 
2.34.1

