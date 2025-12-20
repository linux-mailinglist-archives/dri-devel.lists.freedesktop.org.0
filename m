Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FADACD3977
	for <lists+dri-devel@lfdr.de>; Sun, 21 Dec 2025 02:26:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61CC210E25C;
	Sun, 21 Dec 2025 01:26:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YE1d+uyP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07DC810E1E7
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Dec 2025 18:48:52 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-7b80fed1505so3063341b3a.3
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Dec 2025 10:48:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766256531; x=1766861331; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/oncLln8FbSPaRUU+p2VE2LXXFaw2yjD++vmbH5oIfY=;
 b=YE1d+uyPQ+QTSIoIrBZpx1jGNC0u26lpPfZknOMpBavtAqAHQNR0RnA/mT3tVVUrFl
 5gvowCcsuMCQZ6NVVsjnj3eYdGPA7YxW8A+E/syTcKBubAgwVHE+GG2je1sPFTyJ7Ewv
 XmOH026Ud3MQn99F1cR2y6QdoHKCLBq98JfmYl+1faXm+yLwJZOo0Qw+SHg4IHz6TL4s
 ytZpxqsviiuNCXcdhDRWJWBHpP4aRa9gD7iSgptXIZyImIKAOa4xs/CjwoWc6ElQQ8Rt
 Ck9zJ1VIqsXY913xvXHrkOIdbdAd/nFElgjdH9qVagA0lMmC9OXfJlWm3l7kH0SR2Qsk
 6BaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766256531; x=1766861331;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/oncLln8FbSPaRUU+p2VE2LXXFaw2yjD++vmbH5oIfY=;
 b=p9HBUy565D/LFQzUaY2soraDfQfor6qQqkWtnnRKI8lUBXFNyhrajqGHOtGjUmqpqp
 jtkjpCtu0NUOXQ+n/QAnjtrZYyGOVNHcciJ5UpFOWjK+SzS7wDefqWBqmMDQ1NnPXbwy
 T3U6a9FWsa1pvKbQaAYZjGbhI/0xm+uEeJwrgxSWiQNRcHVvIYu9nPt+VQ+irMdmCcLj
 LXvDPGred/9MPuY3CHIua90r9wu2l9GqEHb/sA+HhAJD0gS/R1cMTZ/+dUfpsaxydEDX
 U8sk9pIaqwvkBIIMv9W/vBqK+O7aLSjGTP69r3v0d6ZNEz0CZAxuizwyTt+uk5znFa+1
 +M7g==
X-Gm-Message-State: AOJu0YwMVRA+khcH3bG1k4TEtKgpcD3DqeiSKJa49QoutF8ePFt1jB5m
 PN7rsK14IwHFd5/cJwyMoIuDh31aUXHn8dnt2u4i193BpYRcgR7WrT8j
X-Gm-Gg: AY/fxX5f4+TwlDEs318wRLMXQCymoUg9eVHa5VEPDXRflKtnPcyFz7BA2lejZBSNXdD
 HntsAVasrzHy/1+uimVFPlbxw4STg4qGZwINr2sBw9M5I5OBD4Vhpe9zNQSOgKSx0wPFekEXgAq
 +5OECuUeykZsxdiPjpmRIsPl+vaOK1GMt3C4KrVGtEIaXJgEqJGjFABvPh+FpVK20AtwNRT1H/v
 OHX8MdqUWq57MGCgbouBwDHZBfMQAQpRL9XAhNOcHpQQiJw+Zv+HVwyrIPhPj2SDUF5ipCN+f0K
 7QInmcJH2S27SbozUDqdfNFNctesgWrvjZXwVqqW0CFRhQebDdgxiADf26W0dXux21JyElY42xc
 Nc4efhQZc6L+aa225Nw0it7ecZBJoxSgRTmO6jv9Fe44SgBR90Ajm/Z4RDVJ6rf7hH2OkQG3CO+
 DRVXOyZhl1msicOVUfAbJ4CfBz4ajA4EBuCEoR9Yw6KuSq+1YOIRvh8a53aDZA/Q==
X-Google-Smtp-Source: AGHT+IE/r1ZKcCOrAZwJE2R6ewFbpafDZ6VWGE4Pg71TQwfDZy+wfImVOERYUn/yZRaGiGCgTeRnUQ==
X-Received: by 2002:a05:7022:b88b:b0:11b:b179:6e17 with SMTP id
 a92af1059eb24-121723092d6mr6262195c88.34.1766256531231; 
 Sat, 20 Dec 2025 10:48:51 -0800 (PST)
Received: from titanite-d300.amd.com ([165.204.154.57])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-1217254d369sm23432761c88.16.2025.12.20.10.48.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Dec 2025 10:48:50 -0800 (PST)
From: Mukesh Ogare <mukeshogare871@gmail.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 simona@ffwll.ch, amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Mukesh Ogare <mukeshogare871@gmail.com>
Subject: [PATCH] drm/radeon: convert UVD v1.0 logging to drm_* helpers
Date: Sun, 21 Dec 2025 02:47:55 +0800
Message-ID: <20251220184755.1803625-1-mukeshogare871@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 21 Dec 2025 01:26:28 +0000
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

Replace legacy DRM_ERROR()/DRM_INFO() logging in the UVD v1.0 code
with drm_err() and drm_info() helpers that take a struct drm_device.

Using drm_* logging provides proper device context in dmesg, which is
important for systems with multiple DRM devices, and aligns the radeon
driver with current DRM logging practices.

No functional change intended.

Signed-off-by: Mukesh Ogare <mukeshogare871@gmail.com>

diff --git a/drivers/gpu/drm/radeon/uvd_v1_0.c b/drivers/gpu/drm/radeon/uvd_v1_0.c
index 5684639d20a6..5e6607e16244 100644
--- a/drivers/gpu/drm/radeon/uvd_v1_0.c
+++ b/drivers/gpu/drm/radeon/uvd_v1_0.c
@@ -179,7 +179,7 @@ int uvd_v1_0_init(struct radeon_device *rdev)
 
 	r = radeon_ring_lock(rdev, ring, 10);
 	if (r) {
-		DRM_ERROR("radeon: ring failed to lock UVD ring (%d).\n", r);
+		drm_err(&rdev->ddev, "radeon: ring failed to lock UVD ring (%d).\n", r);
 		goto done;
 	}
 
@@ -232,7 +232,7 @@ int uvd_v1_0_init(struct radeon_device *rdev)
 			break;
 		}
 
-		DRM_INFO("UVD initialized successfully.\n");
+		drm_info(&rdev->ddev, "UVD initialized successfully.\n");
 	}
 
 	return r;
@@ -338,7 +338,7 @@ int uvd_v1_0_start(struct radeon_device *rdev)
 		if (status & 2)
 			break;
 
-		DRM_ERROR("UVD not responding, trying to reset the VCPU!!!\n");
+		drm_err(&rdev->ddev, "UVD not responding, trying to reset the VCPU!!!\n");
 		WREG32_P(UVD_SOFT_RESET, VCPU_SOFT_RESET, ~VCPU_SOFT_RESET);
 		mdelay(10);
 		WREG32_P(UVD_SOFT_RESET, 0, ~VCPU_SOFT_RESET);
@@ -347,7 +347,7 @@ int uvd_v1_0_start(struct radeon_device *rdev)
 	}
 
 	if (r) {
-		DRM_ERROR("UVD not responding, giving up!!!\n");
+		drm_err(&rdev->ddev, "UVD not responding, giving up!!!\n");
 		return r;
 	}
 
@@ -427,7 +427,7 @@ int uvd_v1_0_ring_test(struct radeon_device *rdev, struct radeon_ring *ring)
 	WREG32(UVD_CONTEXT_ID, 0xCAFEDEAD);
 	r = radeon_ring_lock(rdev, ring, 3);
 	if (r) {
-		DRM_ERROR("radeon: cp failed to lock ring %d (%d).\n",
+		drm_err(&rdev->ddev, "radeon: cp failed to lock ring %d (%d).\n",
 			  ring->idx, r);
 		return r;
 	}
@@ -442,10 +442,10 @@ int uvd_v1_0_ring_test(struct radeon_device *rdev, struct radeon_ring *ring)
 	}
 
 	if (i < rdev->usec_timeout) {
-		DRM_INFO("ring test on %d succeeded in %d usecs\n",
+		drm_info(&rdev->ddev, "ring test on %d succeeded in %d usecs\n",
 			 ring->idx, i);
 	} else {
-		DRM_ERROR("radeon: ring %d test failed (0x%08X)\n",
+		drm_err(&rdev->ddev, "radeon: ring %d test failed (0x%08X)\n",
 			  ring->idx, tmp);
 		r = -EINVAL;
 	}
@@ -507,34 +507,34 @@ int uvd_v1_0_ib_test(struct radeon_device *rdev, struct radeon_ring *ring)
 	else
 		r = radeon_set_uvd_clocks(rdev, 53300, 40000);
 	if (r) {
-		DRM_ERROR("radeon: failed to raise UVD clocks (%d).\n", r);
+		drm_err(&rdev->ddev, "radeon: failed to raise UVD clocks (%d).\n", r);
 		return r;
 	}
 
 	r = radeon_uvd_get_create_msg(rdev, ring->idx, 1, NULL);
 	if (r) {
-		DRM_ERROR("radeon: failed to get create msg (%d).\n", r);
+		drm_err(&rdev->ddev, "radeon: failed to get create msg (%d).\n", r);
 		goto error;
 	}
 
 	r = radeon_uvd_get_destroy_msg(rdev, ring->idx, 1, &fence);
 	if (r) {
-		DRM_ERROR("radeon: failed to get destroy ib (%d).\n", r);
+		drm_err(&rdev->ddev, "radeon: failed to get destroy ib (%d).\n", r);
 		goto error;
 	}
 
 	r = radeon_fence_wait_timeout(fence, false, usecs_to_jiffies(
 		RADEON_USEC_IB_TEST_TIMEOUT));
 	if (r < 0) {
-		DRM_ERROR("radeon: fence wait failed (%d).\n", r);
+		drm_err(&rdev->ddev, "radeon: fence wait failed (%d).\n", r);
 		goto error;
 	} else if (r == 0) {
-		DRM_ERROR("radeon: fence wait timed out.\n");
+		drm_err(&rdev->ddev, "radeon: fence wait timed out.\n");
 		r = -ETIMEDOUT;
 		goto error;
 	}
 	r = 0;
-	DRM_INFO("ib test on ring %d succeeded\n",  ring->idx);
+	drm_info(&rdev->ddev, "ib test on ring %d succeeded\n",  ring->idx);
 error:
 	radeon_fence_unref(&fence);
 	radeon_set_uvd_clocks(rdev, 0, 0);
-- 
2.43.0

