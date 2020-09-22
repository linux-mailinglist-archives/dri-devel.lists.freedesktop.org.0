Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A274275297
	for <lists+dri-devel@lfdr.de>; Wed, 23 Sep 2020 09:54:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 343A689D4D;
	Wed, 23 Sep 2020 07:54:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m17613.qiye.163.com (mail-m17613.qiye.163.com
 [59.111.176.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56B596E127
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Sep 2020 12:40:45 +0000 (UTC)
Received: from ubuntu.localdomain (unknown [157.0.31.124])
 by mail-m17613.qiye.163.com (Hmail) with ESMTPA id B2749482AE7;
 Tue, 22 Sep 2020 20:40:39 +0800 (CST)
From: Bernard Zhao <bernard@vivo.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/radeon:fix typoes in comments
Date: Tue, 22 Sep 2020 05:40:29 -0700
Message-Id: <20200922124029.27500-1-bernard@vivo.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZHUNJTU4fTh8eGB9MVkpNS0tMTENPSEJCQ0pVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
 FZT0tIVUpKS0hKTFVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MDY6PCo5CT8dEg5JTjMZSRkh
 CTowCitVSlVKTUtLTExDT09LSExJVTMWGhIXVRkeCRUaCR87DRINFFUYFBZFWVdZEgtZQVlKTkxV
 S1VISlVKSU9ZV1kIAVlBSE9KTDcG
X-HM-Tid: 0a74b5d48cd993bakuwsb2749482ae7
X-Mailman-Approved-At: Wed, 23 Sep 2020 07:53:19 +0000
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
Cc: opensource.kernel@vivo.com, Bernard Zhao <bernard@vivo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Change the comment typo: "programm" -> "program".

Signed-off-by: Bernard Zhao <bernard@vivo.com>
---
 drivers/gpu/drm/radeon/uvd_v1_0.c | 4 ++--
 drivers/gpu/drm/radeon/uvd_v2_2.c | 2 +-
 drivers/gpu/drm/radeon/uvd_v4_2.c | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/radeon/uvd_v1_0.c b/drivers/gpu/drm/radeon/uvd_v1_0.c
index 800721153d51..58557c2263a7 100644
--- a/drivers/gpu/drm/radeon/uvd_v1_0.c
+++ b/drivers/gpu/drm/radeon/uvd_v1_0.c
@@ -117,7 +117,7 @@ int uvd_v1_0_resume(struct radeon_device *rdev)
 	if (r)
 		return r;
 
-	/* programm the VCPU memory controller bits 0-27 */
+	/* program the VCPU memory controller bits 0-27 */
 	addr = (rdev->uvd.gpu_addr >> 3) + 16;
 	size = RADEON_GPU_PAGE_ALIGN(rdev->uvd_fw->size) >> 3;
 	WREG32(UVD_VCPU_CACHE_OFFSET0, addr);
@@ -360,7 +360,7 @@ int uvd_v1_0_start(struct radeon_device *rdev)
 	/* Set the write pointer delay */
 	WREG32(UVD_RBC_RB_WPTR_CNTL, 0);
 
-	/* programm the 4GB memory segment for rptr and ring buffer */
+	/* program the 4GB memory segment for rptr and ring buffer */
 	WREG32(UVD_LMI_EXT40_ADDR, upper_32_bits(ring->gpu_addr) |
 				   (0x7 << 16) | (0x1 << 31));
 
diff --git a/drivers/gpu/drm/radeon/uvd_v2_2.c b/drivers/gpu/drm/radeon/uvd_v2_2.c
index 23b18edda20e..6266167886d9 100644
--- a/drivers/gpu/drm/radeon/uvd_v2_2.c
+++ b/drivers/gpu/drm/radeon/uvd_v2_2.c
@@ -109,7 +109,7 @@ int uvd_v2_2_resume(struct radeon_device *rdev)
 	if (r)
 		return r;
 
-	/* programm the VCPU memory controller bits 0-27 */
+	/* program the VCPU memory controller bits 0-27 */
 	addr = rdev->uvd.gpu_addr >> 3;
 	size = RADEON_GPU_PAGE_ALIGN(rdev->uvd_fw->size + 4) >> 3;
 	WREG32(UVD_VCPU_CACHE_OFFSET0, addr);
diff --git a/drivers/gpu/drm/radeon/uvd_v4_2.c b/drivers/gpu/drm/radeon/uvd_v4_2.c
index dc54fa4aaea8..f9e97fa63674 100644
--- a/drivers/gpu/drm/radeon/uvd_v4_2.c
+++ b/drivers/gpu/drm/radeon/uvd_v4_2.c
@@ -40,7 +40,7 @@ int uvd_v4_2_resume(struct radeon_device *rdev)
 	uint64_t addr;
 	uint32_t size;
 
-	/* programm the VCPU memory controller bits 0-27 */
+	/* program the VCPU memory controller bits 0-27 */
 
 	/* skip over the header of the new firmware format */
 	if (rdev->uvd.fw_header_present)
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
