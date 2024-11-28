Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3317E9DB1CB
	for <lists+dri-devel@lfdr.de>; Thu, 28 Nov 2024 04:21:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A39610E113;
	Thu, 28 Nov 2024 03:21:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="AoK6W/4v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A012910E113;
 Thu, 28 Nov 2024 03:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=luR6N0lLfvqHheyuUlNoinxdJ6rXrNL6n1JPDs90BxQ=; b=AoK6W/4v8ZlNimWyqIxUqwsjyB
 gOWk1Iu9KJKrJ3VLcZzCiKD6rJZco3RRKEeTA65jitosFuG6ZZtcim/b5xS1GxFfbNHmQpjLt/OeW
 iwo1i5NY5lx4NERqjU1BxXS4mweVSAmUR591pe/CpmVOvoztDuyOUecIRXcZR56JxN6tOfPP+Bm7o
 U4wkLKy7NGOAZLR0wSsWeS52iLJgdTSE2Ps44+fUenNv3vanhotAXSIl1cnMDqK1V9Brwpy6Iw1m2
 LgXJT7tXOBCWMSYxbNWx51xUAkR7G2J9NN6O+QRA5HIxzTY86HUqU0LU9iX0KLTdx0opEkOznoQgi
 7EQLPEQw==;
Received: from [50.53.2.24] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
 id 1tGV5Q-0000000EbWU-03lD; Thu, 28 Nov 2024 03:21:00 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: dri-devel@lists.freedesktop.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, amd-gfx@lists.freedesktop.org,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Subject: [PATCH] drm/amdgpu: device: fix spellos and punctuation
Date: Wed, 27 Nov 2024 19:20:53 -0800
Message-ID: <20241128032056.371989-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
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

Make spelling and punctuation changes to ease reading of the comments.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Xinhui Pan <Xinhui.Pan@amd.com>
Cc: amd-gfx@lists.freedesktop.org
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |   30 +++++++++----------
 1 file changed, 15 insertions(+), 15 deletions(-)

--- linux-next-20241125.orig/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ linux-next-20241125/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -204,9 +204,9 @@ static inline void amdgpu_device_stop_pe
  * DOC: pcie_replay_count
  *
  * The amdgpu driver provides a sysfs API for reporting the total number
- * of PCIe replays (NAKs)
+ * of PCIe replays (NAKs).
  * The file pcie_replay_count is used for this and returns the total
- * number of replays as a sum of the NAKs generated and NAKs received
+ * number of replays as a sum of the NAKs generated and NAKs received.
  */
 
 static ssize_t amdgpu_device_get_pcie_replay_count(struct device *dev,
@@ -429,8 +429,8 @@ bool amdgpu_device_supports_boco(struct
  * @dev: drm_device pointer
  *
  * Return:
- * 1 if the device supporte BACO;
- * 3 if the device support MACO (only works if BACO is supported)
+ * 1 if the device supports BACO;
+ * 3 if the device supports MACO (only works if BACO is supported)
  * otherwise return 0.
  */
 int amdgpu_device_supports_baco(struct drm_device *dev)
@@ -577,7 +577,7 @@ void amdgpu_device_mm_access(struct amdg
 }
 
 /**
- * amdgpu_device_aper_access - access vram by vram aperature
+ * amdgpu_device_aper_access - access vram by vram aperture
  *
  * @adev: amdgpu_device pointer
  * @pos: offset of the buffer in vram
@@ -668,7 +668,7 @@ bool amdgpu_device_skip_hw_access(struct
 	 * here is that the GPU reset is not running on another thread in parallel.
 	 *
 	 * For this we trylock the read side of the reset semaphore, if that succeeds
-	 * we know that the reset is not running in paralell.
+	 * we know that the reset is not running in parallel.
 	 *
 	 * If the trylock fails we assert that we are either already holding the read
 	 * side of the lock or are the reset thread itself and hold the write side of
@@ -1733,7 +1733,7 @@ bool amdgpu_device_need_post(struct amdg
 			uint32_t fw_ver;
 
 			err = request_firmware(&adev->pm.fw, "amdgpu/fiji_smc.bin", adev->dev);
-			/* force vPost if error occured */
+			/* force vPost if error occurred */
 			if (err)
 				return true;
 
@@ -2378,7 +2378,7 @@ int amdgpu_device_ip_block_add(struct am
  * the module parameter virtual_display.  This feature provides a virtual
  * display hardware on headless boards or in virtualized environments.
  * This function parses and validates the configuration string specified by
- * the user and configues the virtual display configuration (number of
+ * the user and configures the virtual display configuration (number of
  * virtual connectors, crtcs, etc.) specified.
  */
 static void amdgpu_device_enable_virtual_display(struct amdgpu_device *adev)
@@ -2441,7 +2441,7 @@ void amdgpu_device_set_sriov_virtual_dis
  * @adev: amdgpu_device pointer
  *
  * Parses the asic configuration parameters specified in the gpu info
- * firmware and makes them availale to the driver for use in configuring
+ * firmware and makes them available to the driver for use in configuring
  * the asic.
  * Returns 0 on success, -EINVAL on failure.
  */
@@ -2501,7 +2501,7 @@ static int amdgpu_device_parse_gpu_info_
 								le32_to_cpu(hdr->header.ucode_array_offset_bytes));
 
 		/*
-		 * Should be droped when DAL no longer needs it.
+		 * Should be dropped when DAL no longer needs it.
 		 */
 		if (adev->asic_type == CHIP_NAVI12)
 			goto parse_soc_bounding_box;
@@ -3061,7 +3061,7 @@ init_failed:
  *
  * Writes a reset magic value to the gart pointer in VRAM.  The driver calls
  * this function before a GPU reset.  If the value is retained after a
- * GPU reset, VRAM has not been lost.  Some GPU resets may destry VRAM contents.
+ * GPU reset, VRAM has not been lost. Some GPU resets may destroy VRAM contents.
  */
 static void amdgpu_device_fill_reset_magic(struct amdgpu_device *adev)
 {
@@ -3376,7 +3376,7 @@ static int amdgpu_device_ip_fini_early(s
 
 	amdgpu_amdkfd_suspend(adev, false);
 
-	/* Workaroud for ASICs need to disable SMC first */
+	/* Workaround for ASICs need to disable SMC first */
 	amdgpu_device_smu_fini_early(adev);
 
 	for (i = adev->num_ip_blocks - 1; i >= 0; i--) {
@@ -4271,7 +4271,7 @@ int amdgpu_device_init(struct amdgpu_dev
 
 	/*
 	 * Reset domain needs to be present early, before XGMI hive discovered
-	 * (if any) and intitialized to use reset sem and in_gpu reset flag
+	 * (if any) and initialized to use reset sem and in_gpu reset flag
 	 * early on during init and before calling to RREG32.
 	 */
 	adev->reset_domain = amdgpu_reset_create_reset_domain(SINGLE_DEVICE, "amdgpu-reset-dev");
@@ -5862,7 +5862,7 @@ int amdgpu_device_gpu_recover(struct amd
 		amdgpu_amdkfd_pre_reset(tmp_adev, reset_context);
 
 		/*
-		 * Mark these ASICs to be reseted as untracked first
+		 * Mark these ASICs to be reset as untracked first
 		 * And add them back after reset completed
 		 */
 		amdgpu_unregister_gpu_instance(tmp_adev);
@@ -6065,7 +6065,7 @@ static void amdgpu_device_partner_bandwi
  *
  * @adev: amdgpu_device pointer
  *
- * Fetchs and stores in the driver the PCIE capabilities (gen speed
+ * Fetches and stores in the driver the PCIE capabilities (gen speed
  * and lanes) of the slot the device is in. Handles APUs and
  * virtualized environments where PCIE config space may not be available.
  */
