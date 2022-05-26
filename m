Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14546534C81
	for <lists+dri-devel@lfdr.de>; Thu, 26 May 2022 11:29:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96AA110EF25;
	Thu, 26 May 2022 09:29:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 13773 seconds by postgrey-1.36 at gabe;
 Thu, 26 May 2022 09:29:18 UTC
Received: from out162-62-57-64.mail.qq.com (out162-62-57-64.mail.qq.com
 [162.62.57.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63DC010EF25
 for <dri-devel@lists.freedesktop.org>; Thu, 26 May 2022 09:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1653557353; bh=YiVO9Z+7BbDvulQLJMKhwpIkzvy8COlR1+pQfWMbqW8=;
 h=From:To:Cc:Subject:Date;
 b=fRsiPBYMixYGynNUZJGj9Mol8HoPDd53IFFBt281YOjYnZv0lwyEwxB7sbUnZ3BML
 OPe5o3eBkZ+Xi3t2etHNdsJFnQwzgvj+mcQNz4hb/96yYP6fEJL30pN+YxFQo5JJsu
 N3nYF5yW/mjSaafvK9SZc7an6qttcgCfnMfUUB2A=
Received: from localhost.localdomain ([116.128.244.169])
 by newxmesmtplogicsvrsza7.qq.com (NewEsmtp) with SMTP
 id 74B23E43; Thu, 26 May 2022 17:29:11 +0800
X-QQ-mid: xmsmtpt1653557351t2ogozzdr
Message-ID: <tencent_9934C5D4CD39D3C35606F674AE61310F2007@qq.com>
X-QQ-XMAILINFO: MyHh0PQai9Fp6tHOjQ0UYffo5ElvQ5paDEg2XYJB+HIITHW6nzyPwpdeFV1pvb
 9tSW+PeFMKB8/pGBjoIwkRQqCZGP0YPYVx0uzDxkY6MbHCtUdLVw1TfZ9vfAtG8/nlHUuZ/j552m
 HC1E0JyY1OGC46TuGaPK5PyGWonxJa9mIAn4s5rIZ/uS5Ia5MKTtUIt3MRyark65fIGCcj0e+iy3
 D4Qu//IJhchvyd3VPTfsKIPuazGvYTYsVluUB/wJx9efn2LOKGOsM0e9rs4qlAlsw6kCcd+VoStJ
 pZJE2gPTQUUOzwPcly1dlinwWlV7HMdN9YPAe4XJ2gk28BEapk4nJUKGsl6UOE1JolFQEqks7uxO
 OjvS9tO52WWICLTsPqdpcu32wGU0h4iCtMkDW+rP0cGTE1gyDFmBQD4yT+RGzuX7p6qkvv2KRdnz
 dufEmrwqk2KFSTWfn5qL72dtTeuoFSAPWCqve9WYfvh5ng/5hHjunu8P1ggiR0l2YgRaqvu2853v
 bPFf4LFxaYydBscJ6HT+kWgAJLXAv4Ha+8RkJXCFY9SLdhhtVDWZf5mGPFcSwgABoPPUiPEitNlm
 Lt2QvNQnlqEn/UN3EXL9OOPqu9zIxbzXTZD0a3PvYr7NEhLPZPFOETSOTN+pK74FsMG4mWaM7pry
 WN+n7CztCgbRjnnBHlYRVdWpdLXvOYXGhC7n8lBVnI3g/VBADAzyriEh1ymeRbpGY63L8QX3dmcg
 gfxheZiGVmGkxqvGD/RQSg9ga9KWONY6Mx91IlYOgHqmZTnV2gnBitjPrDFE7Jmzbtrm/gTndjgs
 JI9q/PLht8/zzzMfr+h5NOxr/FyOx4DByyxp31KEZ/PdjI6koewk1yDNSxoFRbFkpuInGjqpi5UQ
 ==
From: 1064094935@qq.com
To: Alex Deucher <alexander.deucher@amd.com>
Subject: [PATCH] drm/amd: Fix spelling typo in comments
Date: Thu, 26 May 2022 17:29:09 +0800
X-OQ-MSGID: <20220526092909.1164946-1-1064094935@qq.com>
X-Mailer: git-send-email 2.25.1
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
Cc: David Airlie <airlied@linux.ie>, Xinhui.Pan@amd.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 pengfuyuan <pengfuyuan@kylinos.cn>, amd-gfx@lists.freedesktop.org,
 k2ci <kernel-bot@kylinos.cn>, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: pengfuyuan <pengfuyuan@kylinos.cn>

Fix spelling typo in comments.

Reported-by: k2ci <kernel-bot@kylinos.cn>
Signed-off-by: pengfuyuan <pengfuyuan@kylinos.cn>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                       | 2 +-
 drivers/gpu/drm/amd/amdgpu/mes_api_def.h                  | 2 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c         | 2 +-
 drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c               | 4 ++--
 drivers/gpu/drm/amd/display/modules/vmid/vmid.c           | 2 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/arcturus_ppsmc.h | 2 +-
 6 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index 7606e3b6361e..35c303c865be 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -271,7 +271,7 @@ extern int amdgpu_vcnfw_log;
 #define CIK_CURSOR_WIDTH 128
 #define CIK_CURSOR_HEIGHT 128
 
-/* smasrt shift bias level limits */
+/* smart shift bias level limits */
 #define AMDGPU_SMARTSHIFT_MAX_BIAS (100)
 #define AMDGPU_SMARTSHIFT_MIN_BIAS (-100)
 
diff --git a/drivers/gpu/drm/amd/amdgpu/mes_api_def.h b/drivers/gpu/drm/amd/amdgpu/mes_api_def.h
index 3f4fca5fd1da..c31abf554878 100644
--- a/drivers/gpu/drm/amd/amdgpu/mes_api_def.h
+++ b/drivers/gpu/drm/amd/amdgpu/mes_api_def.h
@@ -33,7 +33,7 @@
  */
 enum { API_FRAME_SIZE_IN_DWORDS = 64 };
 
-/* To avoid command in scheduler context to be overwritten whenenver mutilple
+/* To avoid command in scheduler context to be overwritten whenever multiple
  * interrupts come in, this creates another queue.
  */
 enum { API_NUMBER_OF_COMMAND_MAX = 32 };
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 62139ff35476..8855a75dc75e 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -6705,7 +6705,7 @@ static void dm_disable_vblank(struct drm_crtc *crtc)
 	dm_set_vblank(crtc, false);
 }
 
-/* Implemented only the options currently availible for the driver */
+/* Implemented only the options currently available for the driver */
 static const struct drm_crtc_funcs amdgpu_dm_crtc_funcs = {
 	.reset = dm_crtc_reset_state,
 	.destroy = amdgpu_dm_crtc_destroy,
diff --git a/drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c b/drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c
index 4385d19bc489..733f99a6e8e6 100644
--- a/drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c
+++ b/drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c
@@ -619,7 +619,7 @@ static int get_max_dsc_slices(union dsc_enc_slice_caps slice_caps)
 }
 
 
-// Increment sice number in available sice numbers stops if possible, or just increment if not
+// Increment slice number in available slice numbers stops if possible, or just increment if not
 static int inc_num_slices(union dsc_enc_slice_caps slice_caps, int num_slices)
 {
 	// Get next bigger num slices available in common caps
@@ -650,7 +650,7 @@ static int inc_num_slices(union dsc_enc_slice_caps slice_caps, int num_slices)
 }
 
 
-// Decrement sice number in available sice numbers stops if possible, or just decrement if not. Stop at zero.
+// Decrement slice number in available slice numbers stops if possible, or just decrement if not. Stop at zero.
 static int dec_num_slices(union dsc_enc_slice_caps slice_caps, int num_slices)
 {
 	// Get next bigger num slices available in common caps
diff --git a/drivers/gpu/drm/amd/display/modules/vmid/vmid.c b/drivers/gpu/drm/amd/display/modules/vmid/vmid.c
index 61ee4be35d27..2c40212d86da 100644
--- a/drivers/gpu/drm/amd/display/modules/vmid/vmid.c
+++ b/drivers/gpu/drm/amd/display/modules/vmid/vmid.c
@@ -66,7 +66,7 @@ static void evict_vmids(struct core_vmid *core_vmid)
 	}
 }
 
-// Return value of -1 indicates vmid table unitialized or ptb dne in the table
+// Return value of -1 indicates vmid table uninitialized or ptb dne in the table
 static int get_existing_vmid_for_ptb(struct core_vmid *core_vmid, uint64_t ptb)
 {
 	int i;
diff --git a/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/arcturus_ppsmc.h b/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/arcturus_ppsmc.h
index 45f5d29bc705..15b313baa0ee 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/arcturus_ppsmc.h
+++ b/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/arcturus_ppsmc.h
@@ -120,7 +120,7 @@
 #define PPSMC_MSG_ReadSerialNumTop32		 0x40
 #define PPSMC_MSG_ReadSerialNumBottom32		 0x41
 
-/* paramater for MSG_LightSBR
+/* parameter for MSG_LightSBR
  * 1 -- Enable light secondary bus reset, only do nbio respond without further handling,
  *      leave driver to handle the real reset
  * 0 -- Disable LightSBR, default behavior, SMU will pass the reset to PSP
-- 
2.25.1


No virus found
		Checked by Hillstone Network AntiVirus
