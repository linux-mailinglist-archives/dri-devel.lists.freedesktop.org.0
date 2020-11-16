Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0162B4DD3
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 18:42:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7C996EA13;
	Mon, 16 Nov 2020 17:42:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9656F6EA00
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 17:42:05 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id u12so12445013wrt.0
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 09:42:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=B656eLYjE1FZlTbAcLYHtkBSzMjn1Kq22EcK7SpZuzI=;
 b=cqmrXntlw3DQnt5lF1CYf3WMXHIXS25fxnTj07nOs1OnCw5c1rVANuO5n2oIQyYQHT
 4Kt98XLHFVjJBheC9Pq5A3zK2E3iwNZTZW8CdMKt9h6k280mVzldBX0aBJU82KOHJNZC
 K4troDtjJnBrA+vQSFbOol2J/naEt2ssUlg13Qi7VjG/pkYNnTOzYXXp7Lm8orIEbBCi
 jUKtESeFbIhzclHqmUqIvYiMsRq5s0pj4xPEIgzIY+rs4PEQcxcSV2MODdody8XeS5vb
 cSeQFWCIMzTqv0c9fI8pl12oKO06x1Cyskqe0LzQ2u+ZBjSrbR5ps1YitxXAG/GrnkoQ
 4p9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=B656eLYjE1FZlTbAcLYHtkBSzMjn1Kq22EcK7SpZuzI=;
 b=jEc+CM45M0KgYGZstg3dZ5R6nlEDHoI2TOUzGvzxRs321v5nC1FxhsLbKe7oDtpiRj
 h+j0f7FbrG56sTlMYbvRG99k1YHPwFbp8zlUpUAd7qN/weuoVdW9JVCoyhli0Qwtv6we
 nwZ0WIjjiVUXPAa8APp7Jk0TvdZkJNOc437eUZ4BN7w4B/P5YxhcrEO74bpHau24Vkbg
 zvTlZGxg4n4C0OgkmhBawKwfJA6aMI6rkdw56GyE7WWTKLu2yxX9UmyKmiPcmVVPXXVH
 TRWqZfxyKGlkFfhm+UTNizUwX0HHYf9TztgqLudEFJtMzPYNPh5fLWiy9I4/GpZGCPHb
 SDHg==
X-Gm-Message-State: AOAM530BcyAe9h01LfqMz5CKipZvu3eKkF5TtkDHQP6yF5C6LQRnyd1d
 tbcORVHjoGpPrfgVCJXcUSPt9A==
X-Google-Smtp-Source: ABdhPJwRo58jenu80k77aCwl2EeoUJqluDWvFSt2FOgVWWwXQC9e4UWksYqVOBVC3xnFTVOmp3u+zA==
X-Received: by 2002:adf:e6c8:: with SMTP id y8mr20291446wrm.414.1605548524179; 
 Mon, 16 Nov 2020 09:42:04 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id n10sm24667224wrx.9.2020.11.16.09.42.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 09:42:03 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 31/42] drm/ttm/ttm_bo: Fix one function header - demote lots
 of kernel-doc abuses
Date: Mon, 16 Nov 2020 17:41:01 +0000
Message-Id: <20201116174112.1833368-32-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201116174112.1833368-1-lee.jones@linaro.org>
References: <20201116174112.1833368-1-lee.jones@linaro.org>
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Christian Koenig <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, Huang Rui <ray.huang@amd.com>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/ttm/ttm_bo.c:51: warning: Function parameter or member 'ttm_global_mutex' not described in 'DEFINE_MUTEX'
 drivers/gpu/drm/ttm/ttm_bo.c:286: warning: Function parameter or member 'bo' not described in 'ttm_bo_cleanup_memtype_use'
 drivers/gpu/drm/ttm/ttm_bo.c:359: warning: Function parameter or member 'bo' not described in 'ttm_bo_cleanup_refs'
 drivers/gpu/drm/ttm/ttm_bo.c:359: warning: Function parameter or member 'interruptible' not described in 'ttm_bo_cleanup_refs'
 drivers/gpu/drm/ttm/ttm_bo.c:359: warning: Function parameter or member 'no_wait_gpu' not described in 'ttm_bo_cleanup_refs'
 drivers/gpu/drm/ttm/ttm_bo.c:359: warning: Function parameter or member 'unlock_resv' not described in 'ttm_bo_cleanup_refs'
 drivers/gpu/drm/ttm/ttm_bo.c:424: warning: Function parameter or member 'bdev' not described in 'ttm_bo_delayed_delete'
 drivers/gpu/drm/ttm/ttm_bo.c:424: warning: Function parameter or member 'remove_all' not described in 'ttm_bo_delayed_delete'
 drivers/gpu/drm/ttm/ttm_bo.c:635: warning: Function parameter or member 'bo' not described in 'ttm_bo_evict_swapout_allowable'
 drivers/gpu/drm/ttm/ttm_bo.c:635: warning: Function parameter or member 'ctx' not described in 'ttm_bo_evict_swapout_allowable'
 drivers/gpu/drm/ttm/ttm_bo.c:635: warning: Function parameter or member 'locked' not described in 'ttm_bo_evict_swapout_allowable'
 drivers/gpu/drm/ttm/ttm_bo.c:635: warning: Function parameter or member 'busy' not described in 'ttm_bo_evict_swapout_allowable'
 drivers/gpu/drm/ttm/ttm_bo.c:769: warning: Function parameter or member 'bo' not described in 'ttm_bo_add_move_fence'
 drivers/gpu/drm/ttm/ttm_bo.c:769: warning: Function parameter or member 'man' not described in 'ttm_bo_add_move_fence'
 drivers/gpu/drm/ttm/ttm_bo.c:769: warning: Function parameter or member 'mem' not described in 'ttm_bo_add_move_fence'
 drivers/gpu/drm/ttm/ttm_bo.c:769: warning: Function parameter or member 'no_wait_gpu' not described in 'ttm_bo_add_move_fence'
 drivers/gpu/drm/ttm/ttm_bo.c:806: warning: Function parameter or member 'bo' not described in 'ttm_bo_mem_force_space'
 drivers/gpu/drm/ttm/ttm_bo.c:806: warning: Function parameter or member 'place' not described in 'ttm_bo_mem_force_space'
 drivers/gpu/drm/ttm/ttm_bo.c:806: warning: Function parameter or member 'mem' not described in 'ttm_bo_mem_force_space'
 drivers/gpu/drm/ttm/ttm_bo.c:806: warning: Function parameter or member 'ctx' not described in 'ttm_bo_mem_force_space'
 drivers/gpu/drm/ttm/ttm_bo.c:872: warning: Function parameter or member 'bo' not described in 'ttm_bo_mem_space'
 drivers/gpu/drm/ttm/ttm_bo.c:872: warning: Function parameter or member 'placement' not described in 'ttm_bo_mem_space'
 drivers/gpu/drm/ttm/ttm_bo.c:872: warning: Function parameter or member 'mem' not described in 'ttm_bo_mem_space'
 drivers/gpu/drm/ttm/ttm_bo.c:872: warning: Function parameter or member 'ctx' not described in 'ttm_bo_mem_space'
 drivers/gpu/drm/ttm/ttm_bo.c:1387: warning: Function parameter or member 'ctx' not described in 'ttm_bo_swapout'

Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Huang Rui <ray.huang@amd.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/ttm/ttm_bo.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index e6bcbfe530ecc..9a03c7834b1ed 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -45,7 +45,7 @@
 
 static void ttm_bo_global_kobj_release(struct kobject *kobj);
 
-/**
+/*
  * ttm_global_mutex - protecting the global BO state
  */
 DEFINE_MUTEX(ttm_global_mutex);
@@ -278,7 +278,7 @@ static int ttm_bo_handle_move_mem(struct ttm_buffer_object *bo,
 	return ret;
 }
 
-/**
+/*
  * Call bo::reserved.
  * Will release GPU memory type usage on destruction.
  * This is the place to put in driver specific hooks to release
@@ -352,9 +352,10 @@ static void ttm_bo_flush_all_fences(struct ttm_buffer_object *bo)
  * Must be called with lru_lock and reservation held, this function
  * will drop the lru lock and optionally the reservation lock before returning.
  *
- * @interruptible         Any sleeps should occur interruptibly.
- * @no_wait_gpu           Never wait for gpu. Return -EBUSY instead.
- * @unlock_resv           Unlock the reservation lock as well.
+ * @bo:                    The buffer object to clean-up
+ * @interruptible:         Any sleeps should occur interruptibly.
+ * @no_wait_gpu:           Never wait for gpu. Return -EBUSY instead.
+ * @unlock_resv:           Unlock the reservation lock as well.
  */
 
 static int ttm_bo_cleanup_refs(struct ttm_buffer_object *bo,
@@ -420,7 +421,7 @@ static int ttm_bo_cleanup_refs(struct ttm_buffer_object *bo,
 	return 0;
 }
 
-/**
+/*
  * Traverse the delayed list, and call ttm_bo_cleanup_refs on all
  * encountered buffers.
  */
@@ -628,7 +629,7 @@ bool ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
 }
 EXPORT_SYMBOL(ttm_bo_eviction_valuable);
 
-/**
+/*
  * Check the target bo is allowable to be evicted or swapout, including cases:
  *
  * a. if share same reservation object with ctx->resv, have assumption
@@ -767,7 +768,7 @@ int ttm_mem_evict_first(struct ttm_bo_device *bdev,
 	return ret;
 }
 
-/**
+/*
  * Add the last move fence to the BO and reserve a new shared slot.
  */
 static int ttm_bo_add_move_fence(struct ttm_buffer_object *bo,
@@ -803,7 +804,7 @@ static int ttm_bo_add_move_fence(struct ttm_buffer_object *bo,
 	return 0;
 }
 
-/**
+/*
  * Repeatedly evict memory from the LRU for @mem_type until we create enough
  * space, or we've evicted everything and there isn't enough space.
  */
@@ -865,7 +866,7 @@ static int ttm_bo_mem_placement(struct ttm_buffer_object *bo,
 	return 0;
 }
 
-/**
+/*
  * Creates space for memory region @mem according to its type.
  *
  * This function first searches for free space in compatible memory types in
@@ -1430,7 +1431,7 @@ int ttm_bo_wait(struct ttm_buffer_object *bo,
 }
 EXPORT_SYMBOL(ttm_bo_wait);
 
-/**
+/*
  * A buffer object shrink method that tries to swap out the first
  * buffer object on the bo_global::swap_lru list.
  */
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
