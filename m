Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 845BF97CD8F
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2024 20:29:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02A7410E748;
	Thu, 19 Sep 2024 18:29:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=uniontech.com header.i=@uniontech.com header.b="RhJJw+xF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bg5.exmail.qq.com (bg5.exmail.qq.com [43.154.155.102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E299310E748
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2024 18:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
 s=onoh2408; t=1726770544;
 bh=gsufGAYtIAM8AkakiwxVNuxyvm44kSowZzBK+ouwLxs=;
 h=From:To:Subject:Date:Message-ID:MIME-Version;
 b=RhJJw+xFr9thQmFSAz0SKH4vvT8kDFwg2F/iJfXVWwNdgVKyqLsdIw3LOr1Ed5snj
 aEb3OeSk9DcWo802N21VwvnK6CI7sdkesJRTRiulXwmtvzCbgJqM06G4ji6K5Nfzx1
 GKIUCUZAFGrJuyxwoVuF8iFf7GeO8XQIOpN14Z3A=
X-QQ-mid: bizesmtpip3t1726770541tlc1512
X-QQ-Originating-IP: WzUcVFiVE3UagY0mvSWHGPMGplCkVM/luSeXsZy8DV0=
Received: from avenger-OMEN-by-HP-Gaming-Lapto ( [localhost])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Fri, 20 Sep 2024 02:28:58 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 7623271536529475562
From: WangYuli <wangyuli@uniontech.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, simona@ffwll.ch, sunil.khatri@amd.com,
 vitaly.prosyak@amd.com, yifan1.zhang@amd.com, Tim.Huang@amd.com,
 jesse.zhang@amd.com, Prike.Liang@amd.com, Hawking.Zhang@amd.com,
 kevinyang.wang@amd.com, srinivasan.shanmugam@amd.com, Jiadong.Zhu@amd.com,
 tao.zhou1@amd.com, pavel@ucw.cz, lee@kernel.org, aren@peacevolution.org,
 wangyuli@uniontech.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, le.ma@amd.com,
 Wenhui.Sheng@amd.com, jjhiblot@traphandler.com, guanwentao@uniontech.com,
 zhanjun@uniontech.com
Subject: [PATCH] treewide: Correct the typo 'acccess'
Date: Fri, 20 Sep 2024 02:28:55 +0800
Message-ID: <4AB1F900B5D100C2+20240919182855.85840-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
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

Signed-off-by: WangYuli <wangyuli@uniontech.com>
---
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c   | 2 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c  | 2 +-
 drivers/leds/rgb/leds-group-multicolor.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
index d3e8be82a172..f847a9fc61e1 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
@@ -1894,7 +1894,7 @@ static void gfx_v11_0_init_compute_vmid(struct amdgpu_device *adev)
 	mutex_unlock(&adev->srbm_mutex);
 
 	/* Initialize all compute VMIDs to have no GDS, GWS, or OA
-	   acccess. These should be enabled by FW for target VMIDs. */
+	   access. These should be enabled by FW for target VMIDs. */
 	for (i = adev->vm_manager.first_kfd_vmid; i < AMDGPU_NUM_VMID; i++) {
 		WREG32_SOC15_OFFSET(GC, 0, regGDS_VMID0_BASE, 2 * i, 0);
 		WREG32_SOC15_OFFSET(GC, 0, regGDS_VMID0_SIZE, 2 * i, 0);
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c b/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c
index 408e5600bb61..13dca7377f53 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c
@@ -1248,7 +1248,7 @@ static void gfx_v9_4_3_xcc_init_compute_vmid(struct amdgpu_device *adev,
 	mutex_unlock(&adev->srbm_mutex);
 
 	/* Initialize all compute VMIDs to have no GDS, GWS, or OA
-	   acccess. These should be enabled by FW for target VMIDs. */
+	   access. These should be enabled by FW for target VMIDs. */
 	for (i = adev->vm_manager.first_kfd_vmid; i < AMDGPU_NUM_VMID; i++) {
 		WREG32_SOC15_OFFSET(GC, GET_INST(GC, xcc_id), regGDS_VMID0_BASE, 2 * i, 0);
 		WREG32_SOC15_OFFSET(GC, GET_INST(GC, xcc_id), regGDS_VMID0_SIZE, 2 * i, 0);
diff --git a/drivers/leds/rgb/leds-group-multicolor.c b/drivers/leds/rgb/leds-group-multicolor.c
index b6c7679015fd..548c7dd63ba1 100644
--- a/drivers/leds/rgb/leds-group-multicolor.c
+++ b/drivers/leds/rgb/leds-group-multicolor.c
@@ -55,7 +55,7 @@ static void restore_sysfs_write_access(void *data)
 {
 	struct led_classdev *led_cdev = data;
 
-	/* Restore the write acccess to the LED */
+	/* Restore the write access to the LED */
 	mutex_lock(&led_cdev->led_access);
 	led_sysfs_enable(led_cdev);
 	mutex_unlock(&led_cdev->led_access);
-- 
2.43.0

