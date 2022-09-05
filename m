Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F23A65ACCD0
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 09:40:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC75510E1E4;
	Mon,  5 Sep 2022 07:40:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m12-17.163.com (m12-17.163.com [220.181.12.17])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5D78910E1E4;
 Mon,  5 Sep 2022 07:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=EMi/Z
 gj9wd3UokgHoYhHpcxMljDXWLwRjVfKKXNyK5s=; b=oJYVB6zEjq6n/zMRqvrNO
 fo0T/l2Aa8VtEAM1PbND93ajzc13kl9hgahDn/mXxgNwzr5vnyWM88kzcLYhu6GB
 YrRs0AOghQIX0VOBwJKgXs95WiXBAhQmhsTFTNslKEE5k1BkHiI0zdhsRmN5rmnQ
 DzV+xmhDdDrELet9Wh6cHk=
Received: from f00160-VMware-Virtual-Platform.localdomain (unknown
 [1.203.67.201])
 by smtp13 (Coremail) with SMTP id EcCowADXupuspxVjn6FyaA--.43620S4;
 Mon, 05 Sep 2022 15:39:35 +0800 (CST)
From: Jingyu Wang <jingyuwang_vip@163.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@linux.ie, daniel@ffwll.ch, andrey.grodzovsky@amd.com,
 ray.huang@amd.com, Hawking.Zhang@amd.com, Likun.Gao@amd.com,
 Jack.Xiao@amd.com, len.brown@intel.com
Subject: [PATCH] drm/amdgpu: recleanup coding style in amdgpu_fence.c
Date: Mon,  5 Sep 2022 15:39:22 +0800
Message-Id: <20220905073922.22738-1-jingyuwang_vip@163.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: EcCowADXupuspxVjn6FyaA--.43620S4
X-Coremail-Antispam: 1Uf129KBjvJXoWxCr17KFyDWFWxCw1xGw1xXwb_yoW5Zr1kpF
 4fKry5KrWDZF1UWrW8AF1vvFnxKw10qF10grW7A34Sgwn8ZF15K3WIyrWjqrWDCF4kur4a
 kFW7Za45ZF1jqF7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zMzuAUUUUUU=
X-Originating-IP: [1.203.67.201]
X-CM-SenderInfo: 5mlqw5xxzd0whbyl1qqrwthudrp/1tbishhzF1UMWQynIQAAsE
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

Fix everything checkpatch.pl complained about in amdgpu_fence.c,
modified use "} else {", sent it again, thx.

Signed-off-by: Jingyu Wang <jingyuwang_vip@163.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
index 8adeb7469f1e..0759d86d92da 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: MIT
 /*
  * Copyright 2009 Jerome Glisse.
  * All Rights Reserved.
@@ -42,7 +43,6 @@
 #include "amdgpu_reset.h"
 
 /*
- * Fences
  * Fences mark an event in the GPUs pipeline and are used
  * for GPU/CPU synchronization.  When the fence is written,
  * it is expected that all buffers associated with that fence
@@ -139,7 +139,7 @@ static u32 amdgpu_fence_read(struct amdgpu_ring *ring)
  * Returns 0 on success, -ENOMEM on failure.
  */
 int amdgpu_fence_emit(struct amdgpu_ring *ring, struct dma_fence **f, struct amdgpu_job *job,
-		      unsigned flags)
+		      unsigned int flags)
 {
 	struct amdgpu_device *adev = ring->adev;
 	struct dma_fence *fence;
@@ -173,11 +173,11 @@ int amdgpu_fence_emit(struct amdgpu_ring *ring, struct dma_fence **f, struct amd
 				       adev->fence_context + ring->idx, seq);
 			/* Against remove in amdgpu_job_{free, free_cb} */
 			dma_fence_get(fence);
-		}
-		else
+		} else {
 			dma_fence_init(fence, &amdgpu_fence_ops,
 				       &ring->fence_drv.lock,
 				       adev->fence_context + ring->idx, seq);
+		}
 	}
 
 	amdgpu_ring_emit_fence(ring, ring->fence_drv.gpu_addr,
@@ -393,7 +393,7 @@ signed long amdgpu_fence_wait_polling(struct amdgpu_ring *ring,
  * Returns the number of emitted fences on the ring.  Used by the
  * dynpm code to ring track activity.
  */
-unsigned amdgpu_fence_count_emitted(struct amdgpu_ring *ring)
+unsigned int amdgpu_fence_count_emitted(struct amdgpu_ring *ring)
 {
 	uint64_t emitted;
 
@@ -422,7 +422,7 @@ unsigned amdgpu_fence_count_emitted(struct amdgpu_ring *ring)
  */
 int amdgpu_fence_driver_start_ring(struct amdgpu_ring *ring,
 				   struct amdgpu_irq_src *irq_src,
-				   unsigned irq_type)
+				   unsigned int irq_type)
 {
 	struct amdgpu_device *adev = ring->adev;
 	uint64_t index;
@@ -594,6 +594,7 @@ void amdgpu_fence_driver_hw_init(struct amdgpu_device *adev)
 
 	for (i = 0; i < AMDGPU_MAX_RINGS; i++) {
 		struct amdgpu_ring *ring = adev->rings[i];
+
 		if (!ring || !ring->fence_drv.initialized)
 			continue;
 
@@ -772,6 +773,7 @@ static int amdgpu_debugfs_fence_info_show(struct seq_file *m, void *unused)
 
 	for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
 		struct amdgpu_ring *ring = adev->rings[i];
+
 		if (!ring || !ring->fence_drv.initialized)
 			continue;
 
@@ -845,6 +847,7 @@ static void amdgpu_debugfs_reset_work(struct work_struct *work)
 						  reset_work);
 
 	struct amdgpu_reset_context reset_context;
+
 	memset(&reset_context, 0, sizeof(reset_context));
 
 	reset_context.method = AMD_RESET_METHOD_NONE;

base-commit: e47eb90a0a9ae20b82635b9b99a8d0979b757ad8
-- 
2.34.1

