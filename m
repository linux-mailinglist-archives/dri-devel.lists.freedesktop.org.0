Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BAF73AD841
	for <lists+dri-devel@lfdr.de>; Sat, 19 Jun 2021 08:44:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1D096EA59;
	Sat, 19 Jun 2021 06:44:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m17639.qiye.163.com (mail-m17639.qiye.163.com
 [59.111.176.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C64A46EA55;
 Sat, 19 Jun 2021 06:44:16 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=ijhSRQm3e+Qu/7+WEz5PrdiyJeemGfVCH0gQGLss80cc+vvwLzOsdfH5O2+SYJJzQakizQ2JppPC4a+zYv6mlwRfg4Uw5TRBKGSAeM9V7wpWjvBXTVlPZIIL/5ahPS938kjsddo0b4fQqj4Q8kVh2awda+fywqycZvDnGHk6jBk=;
 s=default; c=relaxed/relaxed; d=vivo.com; v=1;
 bh=ocSpxz71TA5lK3q0byfIuoC7AgcSNqrnmhvLjFrEqD8=;
 h=date:mime-version:subject:message-id:from;
Received: from ubuntu.localdomain (unknown [36.152.145.181])
 by mail-m17639.qiye.163.com (Hmail) with ESMTPA id CD5E4380158;
 Sat, 19 Jun 2021 14:44:14 +0800 (CST)
From: Bernard Zhao <bernard@vivo.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] drm/radeon: delete useless return values
Date: Fri, 18 Jun 2021 23:43:48 -0700
Message-Id: <20210619064349.26676-5-bernard@vivo.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210619064349.26676-1-bernard@vivo.com>
References: <20210619064349.26676-1-bernard@vivo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZQ0seHlZNTU1DTkoZSR5IQk1VEwETFhoSFyQUDg9ZV1kWGg8SFR0UWUFZT0tIVUpKS0
 hKTFVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Ok06Cxw5Sj8THUIiKxUiTRhW
 FE4KCxpVSlVKTUlPS0NOS05OSU9MVTMWGhIXVRkeCRUaCR87DRINFFUYFBZFWVdZEgtZQVlITVVK
 TklVSk9OVUpDSllXWQgBWUFIS0NINwY+
X-HM-Tid: 0a7a230345ead994kuwscd5e4380158
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

Signed-off-by: Bernard Zhao <bernard@vivo.com>
---
 drivers/gpu/drm/radeon/radeon.h       | 2 +-
 drivers/gpu/drm/radeon/radeon_fence.c | 5 +----
 2 files changed, 2 insertions(+), 5 deletions(-)

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
-- 
2.31.0

