Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4413AE9AB
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jun 2021 15:05:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1988C6E038;
	Mon, 21 Jun 2021 13:05:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m17639.qiye.163.com (mail-m17639.qiye.163.com
 [59.111.176.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B89F26E038;
 Mon, 21 Jun 2021 13:05:13 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=XrKDj8IEgtkpM15BDVv4hgbjZ9IN2KhSRJ+BHmkSrofbacJMnluDCThJe0PEKAb/Q6bSKSmH7xhFWD5XPBdoB5qTS2RNiLyLJfToUrwgKhNyit+c7Vzfmzo4Fz5SWQGBJrgwF915cGxLv46qTwPladQT4vKWPV7KivekEiD5zUc=;
 s=default; c=relaxed/relaxed; d=vivo.com; v=1;
 bh=yxAkafkCRfhNT5L+2RWhBZApWLyDFY9XeNhel1f5fe4=;
 h=date:mime-version:subject:message-id:from;
Received: from ubuntu.localdomain (unknown [36.152.145.181])
 by mail-m17639.qiye.163.com (Hmail) with ESMTPA id 1592A380128;
 Mon, 21 Jun 2021 21:05:10 +0800 (CST)
From: Bernard Zhao <bernard@vivo.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/radeon: delete useless function return values & remove
 meaningless if(r) check code
Date: Mon, 21 Jun 2021 06:05:07 -0700
Message-Id: <20210621130508.29511-1-bernard@vivo.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZGU4aSFZKHkpISB4eQ09LQ01VEwETFhoSFyQUDg9ZV1kWGg8SFR0UWUFZT0tIVUpKS0
 hOSFVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NCo6SDo*HD8CPjg2M0MWNw8X
 FExPCzxVSlVKTUlPSUNLTEpLTUtOVTMWGhIXVRkeCRUaCR87DRINFFUYFBZFWVdZEgtZQVlITVVK
 TklVSk9OVUpDSllXWQgBWUFKS0NMSTcG
X-HM-Tid: 0a7a2eacbc71d994kuws1592a380128
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
Cc: Bernard Zhao <bernard@vivo.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Function radeon_fence_driver_init always returns success,
the function type maybe coule be changed to void.
This patch first delete the check of the return
value of the function call radeon_fence_driver_init, then,
optimise the function declaration and function to void type.

Signed-off-by: Bernard Zhao <bernard@vivo.com>
---
 drivers/gpu/drm/radeon/cik.c          | 4 +---
 drivers/gpu/drm/radeon/evergreen.c    | 4 +---
 drivers/gpu/drm/radeon/ni.c           | 4 +---
 drivers/gpu/drm/radeon/r100.c         | 4 +---
 drivers/gpu/drm/radeon/r300.c         | 4 +---
 drivers/gpu/drm/radeon/r420.c         | 5 +----
 drivers/gpu/drm/radeon/r520.c         | 4 +---
 drivers/gpu/drm/radeon/r600.c         | 4 +---
 drivers/gpu/drm/radeon/radeon.h       | 2 +-
 drivers/gpu/drm/radeon/radeon_fence.c | 5 +----
 drivers/gpu/drm/radeon/rs400.c        | 4 +---
 drivers/gpu/drm/radeon/rs600.c        | 4 +---
 drivers/gpu/drm/radeon/rs690.c        | 4 +---
 drivers/gpu/drm/radeon/rv515.c        | 4 +---
 drivers/gpu/drm/radeon/rv770.c        | 4 +---
 drivers/gpu/drm/radeon/si.c           | 4 +---
 16 files changed, 16 insertions(+), 48 deletions(-)

diff --git a/drivers/gpu/drm/radeon/cik.c b/drivers/gpu/drm/radeon/cik.c
index 42a8afa839cb..f6cf0b8fdd83 100644
--- a/drivers/gpu/drm/radeon/cik.c
+++ b/drivers/gpu/drm/radeon/cik.c
@@ -8584,9 +8584,7 @@ int cik_init(struct radeon_device *rdev)
 	radeon_get_clock_info(rdev->ddev);
 
 	/* Fence driver */
-	r = radeon_fence_driver_init(rdev);
-	if (r)
-		return r;
+	radeon_fence_driver_init(rdev);
 
 	/* initialize memory controller */
 	r = cik_mc_init(rdev);
diff --git a/drivers/gpu/drm/radeon/evergreen.c b/drivers/gpu/drm/radeon/evergreen.c
index 8e9e88bf1f43..36a888e1b179 100644
--- a/drivers/gpu/drm/radeon/evergreen.c
+++ b/drivers/gpu/drm/radeon/evergreen.c
@@ -5208,9 +5208,7 @@ int evergreen_init(struct radeon_device *rdev)
 	/* Initialize clocks */
 	radeon_get_clock_info(rdev->ddev);
 	/* Fence driver */
-	r = radeon_fence_driver_init(rdev);
-	if (r)
-		return r;
+	radeon_fence_driver_init(rdev);
 	/* initialize AGP */
 	if (rdev->flags & RADEON_IS_AGP) {
 		r = radeon_agp_init(rdev);
diff --git a/drivers/gpu/drm/radeon/ni.c b/drivers/gpu/drm/radeon/ni.c
index ab7bd3080217..4a364ca7a1be 100644
--- a/drivers/gpu/drm/radeon/ni.c
+++ b/drivers/gpu/drm/radeon/ni.c
@@ -2375,9 +2375,7 @@ int cayman_init(struct radeon_device *rdev)
 	/* Initialize clocks */
 	radeon_get_clock_info(rdev->ddev);
 	/* Fence driver */
-	r = radeon_fence_driver_init(rdev);
-	if (r)
-		return r;
+	radeon_fence_driver_init(rdev);
 	/* initialize memory controller */
 	r = evergreen_mc_init(rdev);
 	if (r)
diff --git a/drivers/gpu/drm/radeon/r100.c b/drivers/gpu/drm/radeon/r100.c
index fcfcaec25a9e..aa6800b0e198 100644
--- a/drivers/gpu/drm/radeon/r100.c
+++ b/drivers/gpu/drm/radeon/r100.c
@@ -4056,9 +4056,7 @@ int r100_init(struct radeon_device *rdev)
 	/* initialize VRAM */
 	r100_mc_init(rdev);
 	/* Fence driver */
-	r = radeon_fence_driver_init(rdev);
-	if (r)
-		return r;
+	radeon_fence_driver_init(rdev);
 	/* Memory manager */
 	r = radeon_bo_init(rdev);
 	if (r)
diff --git a/drivers/gpu/drm/radeon/r300.c b/drivers/gpu/drm/radeon/r300.c
index 92643dfdd8a8..621ff174dff3 100644
--- a/drivers/gpu/drm/radeon/r300.c
+++ b/drivers/gpu/drm/radeon/r300.c
@@ -1549,9 +1549,7 @@ int r300_init(struct radeon_device *rdev)
 	/* initialize memory controller */
 	r300_mc_init(rdev);
 	/* Fence driver */
-	r = radeon_fence_driver_init(rdev);
-	if (r)
-		return r;
+	radeon_fence_driver_init(rdev);
 	/* Memory manager */
 	r = radeon_bo_init(rdev);
 	if (r)
diff --git a/drivers/gpu/drm/radeon/r420.c b/drivers/gpu/drm/radeon/r420.c
index 1ed4407b91aa..7e6320e8c6a0 100644
--- a/drivers/gpu/drm/radeon/r420.c
+++ b/drivers/gpu/drm/radeon/r420.c
@@ -425,10 +425,7 @@ int r420_init(struct radeon_device *rdev)
 	r300_mc_init(rdev);
 	r420_debugfs(rdev);
 	/* Fence driver */
-	r = radeon_fence_driver_init(rdev);
-	if (r) {
-		return r;
-	}
+	radeon_fence_driver_init(rdev);
 	/* Memory manager */
 	r = radeon_bo_init(rdev);
 	if (r) {
diff --git a/drivers/gpu/drm/radeon/r520.c b/drivers/gpu/drm/radeon/r520.c
index fc78e64ae727..6cbcaa845192 100644
--- a/drivers/gpu/drm/radeon/r520.c
+++ b/drivers/gpu/drm/radeon/r520.c
@@ -299,9 +299,7 @@ int r520_init(struct radeon_device *rdev)
 	r520_mc_init(rdev);
 	rv515_debugfs(rdev);
 	/* Fence driver */
-	r = radeon_fence_driver_init(rdev);
-	if (r)
-		return r;
+	radeon_fence_driver_init(rdev);
 	/* Memory manager */
 	r = radeon_bo_init(rdev);
 	if (r)
diff --git a/drivers/gpu/drm/radeon/r600.c b/drivers/gpu/drm/radeon/r600.c
index 7444dc0e0c0e..ca3fcae2adb5 100644
--- a/drivers/gpu/drm/radeon/r600.c
+++ b/drivers/gpu/drm/radeon/r600.c
@@ -3282,9 +3282,7 @@ int r600_init(struct radeon_device *rdev)
 	/* Initialize clocks */
 	radeon_get_clock_info(rdev->ddev);
 	/* Fence driver */
-	r = radeon_fence_driver_init(rdev);
-	if (r)
-		return r;
+	radeon_fence_driver_init(rdev);
 	if (rdev->flags & RADEON_IS_AGP) {
 		r = radeon_agp_init(rdev);
 		if (r)
diff --git a/drivers/gpu/drm/radeon/radeon.h b/drivers/gpu/drm/radeon/radeon.h
index 56ed5634cebe..8a15f490a390 100644
--- a/drivers/gpu/drm/radeon/radeon.h
+++ b/drivers/gpu/drm/radeon/radeon.h
@@ -384,7 +384,7 @@ struct radeon_fence {
 };
 
 int radeon_fence_driver_start_ring(struct radeon_device *rdev, int ring);
-int radeon_fence_driver_init(struct radeon_device *rdev);
+void radeon_fence_driver_init(struct radeon_device *rdev);
 void radeon_fence_driver_fini(struct radeon_device *rdev);
 void radeon_fence_driver_force_completion(struct radeon_device *rdev, int ring);
 int radeon_fence_emit(struct radeon_device *rdev, struct radeon_fence **fence, int ring);
diff --git a/drivers/gpu/drm/radeon/radeon_fence.c b/drivers/gpu/drm/radeon/radeon_fence.c
index 0d8ef2368adf..b2ce642ca4fa 100644
--- a/drivers/gpu/drm/radeon/radeon_fence.c
+++ b/drivers/gpu/drm/radeon/radeon_fence.c
@@ -905,9 +905,8 @@ static void radeon_fence_driver_init_ring(struct radeon_device *rdev, int ring)
  * Not all asics have all rings, so each asic will only
  * start the fence driver on the rings it has using
  * radeon_fence_driver_start_ring().
- * Returns 0 for success.
  */
-int radeon_fence_driver_init(struct radeon_device *rdev)
+void radeon_fence_driver_init(struct radeon_device *rdev)
 {
 	int ring;
 
@@ -917,8 +916,6 @@ int radeon_fence_driver_init(struct radeon_device *rdev)
 	}
 
 	radeon_debugfs_fence_init(rdev);
-
-	return 0;
 }
 
 /**
diff --git a/drivers/gpu/drm/radeon/rs400.c b/drivers/gpu/drm/radeon/rs400.c
index 8423bcc3302b..6383f7a34bd8 100644
--- a/drivers/gpu/drm/radeon/rs400.c
+++ b/drivers/gpu/drm/radeon/rs400.c
@@ -555,9 +555,7 @@ int rs400_init(struct radeon_device *rdev)
 	/* initialize memory controller */
 	rs400_mc_init(rdev);
 	/* Fence driver */
-	r = radeon_fence_driver_init(rdev);
-	if (r)
-		return r;
+	radeon_fence_driver_init(rdev);
 	/* Memory manager */
 	r = radeon_bo_init(rdev);
 	if (r)
diff --git a/drivers/gpu/drm/radeon/rs600.c b/drivers/gpu/drm/radeon/rs600.c
index 5bf26058eec0..b2d22e25eee1 100644
--- a/drivers/gpu/drm/radeon/rs600.c
+++ b/drivers/gpu/drm/radeon/rs600.c
@@ -1132,9 +1132,7 @@ int rs600_init(struct radeon_device *rdev)
 	rs600_mc_init(rdev);
 	r100_debugfs_rbbm_init(rdev);
 	/* Fence driver */
-	r = radeon_fence_driver_init(rdev);
-	if (r)
-		return r;
+	radeon_fence_driver_init(rdev);
 	/* Memory manager */
 	r = radeon_bo_init(rdev);
 	if (r)
diff --git a/drivers/gpu/drm/radeon/rs690.c b/drivers/gpu/drm/radeon/rs690.c
index 7bc302a89232..14fb0819b8c1 100644
--- a/drivers/gpu/drm/radeon/rs690.c
+++ b/drivers/gpu/drm/radeon/rs690.c
@@ -850,9 +850,7 @@ int rs690_init(struct radeon_device *rdev)
 	rs690_mc_init(rdev);
 	rv515_debugfs(rdev);
 	/* Fence driver */
-	r = radeon_fence_driver_init(rdev);
-	if (r)
-		return r;
+	radeon_fence_driver_init(rdev);
 	/* Memory manager */
 	r = radeon_bo_init(rdev);
 	if (r)
diff --git a/drivers/gpu/drm/radeon/rv515.c b/drivers/gpu/drm/radeon/rv515.c
index 46a53dd38079..63fb06e8e2d7 100644
--- a/drivers/gpu/drm/radeon/rv515.c
+++ b/drivers/gpu/drm/radeon/rv515.c
@@ -648,9 +648,7 @@ int rv515_init(struct radeon_device *rdev)
 	rv515_mc_init(rdev);
 	rv515_debugfs(rdev);
 	/* Fence driver */
-	r = radeon_fence_driver_init(rdev);
-	if (r)
-		return r;
+	radeon_fence_driver_init(rdev);
 	/* Memory manager */
 	r = radeon_bo_init(rdev);
 	if (r)
diff --git a/drivers/gpu/drm/radeon/rv770.c b/drivers/gpu/drm/radeon/rv770.c
index 88e29ebaad46..74499307285b 100644
--- a/drivers/gpu/drm/radeon/rv770.c
+++ b/drivers/gpu/drm/radeon/rv770.c
@@ -1941,9 +1941,7 @@ int rv770_init(struct radeon_device *rdev)
 	/* Initialize clocks */
 	radeon_get_clock_info(rdev->ddev);
 	/* Fence driver */
-	r = radeon_fence_driver_init(rdev);
-	if (r)
-		return r;
+	radeon_fence_driver_init(rdev);
 	/* initialize AGP */
 	if (rdev->flags & RADEON_IS_AGP) {
 		r = radeon_agp_init(rdev);
diff --git a/drivers/gpu/drm/radeon/si.c b/drivers/gpu/drm/radeon/si.c
index d0e94b10e4c0..013e44ed0f39 100644
--- a/drivers/gpu/drm/radeon/si.c
+++ b/drivers/gpu/drm/radeon/si.c
@@ -6857,9 +6857,7 @@ int si_init(struct radeon_device *rdev)
 	radeon_get_clock_info(rdev->ddev);
 
 	/* Fence driver */
-	r = radeon_fence_driver_init(rdev);
-	if (r)
-		return r;
+	radeon_fence_driver_init(rdev);
 
 	/* initialize memory controller */
 	r = si_mc_init(rdev);
-- 
2.31.0

