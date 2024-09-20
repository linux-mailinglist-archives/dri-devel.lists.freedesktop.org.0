Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9608A97CFE4
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2024 04:28:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3179410E02C;
	Fri, 20 Sep 2024 02:28:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=uniontech.com header.i=@uniontech.com header.b="PWrhNpS3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 134371 seconds by postgrey-1.36 at gabe;
 Fri, 20 Sep 2024 02:28:24 UTC
Received: from bg1.exmail.qq.com (bg1.exmail.qq.com [114.132.74.132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D07D10E02C
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Sep 2024 02:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
 s=onoh2408; t=1726799288;
 bh=ifx+ZckwuWVd+o/wPo5C7cSBCHIaUHDcqg3L8g5bsoI=;
 h=From:To:Subject:Date:Message-ID:MIME-Version;
 b=PWrhNpS3vSd/z9yMNq2OlE2jUCWdmNOzyN1G42t3L1qIbTMFIqRJF2Jrlr4BQJIrz
 l5UITmDDeXdoVwzsoCuFuqT/aCvRFWi/Qb2eeHOfAyHL4ym6Sl+X/fKcxZbvunAr5L
 /zsE6Bfb13i1F3PlEIGD+CXcvj5bC9yEwiuillBw=
X-QQ-mid: bizesmtpsz8t1726799283t76ai2n
X-QQ-Originating-IP: c/JGzc5vUu00GxVqvgOYvgyNKNsXDRcwh2V9//dekwU=
Received: from localhost.localdomain ( [113.57.152.160])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Fri, 20 Sep 2024 10:27:59 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 13208387810574560565
From: WangYuli <wangyuli@uniontech.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, simona@ffwll.ch, sunil.khatri@amd.com,
 yifan1.zhang@amd.com, vitaly.prosyak@amd.com, Tim.Huang@amd.com,
 Prike.Liang@amd.com, jesse.zhang@amd.com, lijo.lazar@amd.com,
 Hawking.Zhang@amd.com, kevinyang.wang@amd.com,
 srinivasan.shanmugam@amd.com, victorchengchi.lu@amd.com,
 Jiadong.Zhu@amd.com, tao.zhou1@amd.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, le.ma@amd.com, Wenhui.Sheng@amd.com,
 alexdeucher@gmail.com, WangYuli <wangyuli@uniontech.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH] drm/amdgpu: Fix typo "acccess" and improve the comment style
 here
Date: Fri, 20 Sep 2024 10:27:55 +0800
Message-ID: <F25A139789E87C3E+20240920022755.1162495-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpsz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
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

There are some spelling mistakes of 'acccess' in comments which
should be instead of 'access'.

And the comment style should be like this:
 /*
  * Text
  * Text
  */

Suggested-by: Christian König <christian.koenig@amd.com>
Link: https://lore.kernel.org/all/f75fbe30-528e-404f-97e4-854d27d7a401@amd.com/
Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Link: https://lore.kernel.org/all/0c768bf6-bc19-43de-a30b-ff5e3ddfd0b3@suse.de/
Signed-off-by: WangYuli <wangyuli@uniontech.com>
---
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c  | 6 ++++--
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c | 6 ++++--
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
index d3e8be82a172..33fd2da49a2a 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
@@ -1893,8 +1893,10 @@ static void gfx_v11_0_init_compute_vmid(struct amdgpu_device *adev)
 	soc21_grbm_select(adev, 0, 0, 0, 0);
 	mutex_unlock(&adev->srbm_mutex);
 
-	/* Initialize all compute VMIDs to have no GDS, GWS, or OA
-	   acccess. These should be enabled by FW for target VMIDs. */
+	/*
+	 * Initialize all compute VMIDs to have no GDS, GWS, or OA
+	 * access. These should be enabled by FW for target VMIDs.
+	 */
 	for (i = adev->vm_manager.first_kfd_vmid; i < AMDGPU_NUM_VMID; i++) {
 		WREG32_SOC15_OFFSET(GC, 0, regGDS_VMID0_BASE, 2 * i, 0);
 		WREG32_SOC15_OFFSET(GC, 0, regGDS_VMID0_SIZE, 2 * i, 0);
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c b/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c
index 408e5600bb61..57b55b6d797d 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c
@@ -1247,8 +1247,10 @@ static void gfx_v9_4_3_xcc_init_compute_vmid(struct amdgpu_device *adev,
 	soc15_grbm_select(adev, 0, 0, 0, 0, GET_INST(GC, xcc_id));
 	mutex_unlock(&adev->srbm_mutex);
 
-	/* Initialize all compute VMIDs to have no GDS, GWS, or OA
-	   acccess. These should be enabled by FW for target VMIDs. */
+	/*
+	 * Initialize all compute VMIDs to have no GDS, GWS, or OA
+	 * access. These should be enabled by FW for target VMIDs.
+	 */
 	for (i = adev->vm_manager.first_kfd_vmid; i < AMDGPU_NUM_VMID; i++) {
 		WREG32_SOC15_OFFSET(GC, GET_INST(GC, xcc_id), regGDS_VMID0_BASE, 2 * i, 0);
 		WREG32_SOC15_OFFSET(GC, GET_INST(GC, xcc_id), regGDS_VMID0_SIZE, 2 * i, 0);
-- 
2.45.2

