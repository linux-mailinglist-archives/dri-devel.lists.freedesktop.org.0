Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4C0382EE3
	for <lists+dri-devel@lfdr.de>; Mon, 17 May 2021 16:11:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E39E16E974;
	Mon, 17 May 2021 14:11:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E61996E974
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 14:11:34 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id di13so7100402edb.2
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 07:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hWAO6qtBeCWHwQ2d5zgeA9XWAA84b75ynVVknZJ6VMo=;
 b=vVvZYCSTT/HZCA1FxmCLTQN412dqzj8BF4r2jENkezpE2Omt5ttiOhsDXVCii97REI
 yv706q57EH/PcBN3TFNGLu4cUdDve+er7DgwO0HZchydQyx0TA3jQetItWf8PDf2pd7w
 dJzJsGNGuaFWQ5Bu0BqsK9g6t2otNxUU+S4SGz4MWkAnGeGoNEzta0+mTfOU2gjGp5YH
 MwB5EWijLIZpUcfLhrpjzV2LyNWiHOzQqkDSswhhnfavMRiMxtnOtvMc4m7cEkky7hhu
 iBv0KMbWdZR25h9d/VHYkJh/oQqDvh3BYuxsF9PUIN8nqMBMhPpJjFqc1/PWD2KjOd7A
 luyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hWAO6qtBeCWHwQ2d5zgeA9XWAA84b75ynVVknZJ6VMo=;
 b=kzvJEAWg4pwrup5fFimWVBCqBI1nNFTNMnn71M5CEi3poWS/bA45Sw7sGPb+235G9C
 rjejYVT7xq4UUFiq4wkSgJwuQDFc4hkW5EzW80Zv7cysEScRgpyz1Ng+rO1O2t2m4oeu
 jpfpHiYKaSeyc15iBBFb9279JQ2c3+PL+WDcs7fOt8lKXmBiaq6aFLEcq8A2SiLtqPX1
 BOA+Nci+ouQHYTay7/C9iZ+eFlLbstkwSTX37AII5xTt117LzznOP6jqzaQOLQq1IKNm
 4i5L2sdAKsNDXZ4yjU2TgGDqbRWXwAGQd8SBQ/YwkQ6CXXLAPe/fE61uPTLMov+s3SFW
 8fjw==
X-Gm-Message-State: AOAM531bcvBmBJ4bYRlyNjWsBe8YgOv6yvnIQfmQn5zQYGAH8SEfdGsR
 6nB7a5YVxCnULposcdukVNnHTnA+mCk=
X-Google-Smtp-Source: ABdhPJzvTjfQMlf4Z9nxw3X+wBxgmJRQ2XXzGQrffawS5SaS/5HNtMnAbObFkhBF4CgAlOqrPohqBw==
X-Received: by 2002:a50:ccdc:: with SMTP id b28mr277893edj.92.1621260693613;
 Mon, 17 May 2021 07:11:33 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:1df4:c5b6:b8fd:3c4b])
 by smtp.gmail.com with ESMTPSA id b9sm2419624edt.71.2021.05.17.07.11.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 07:11:33 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH 02/11] dma-buf: add SPDX header and fix style in dma-resv.c
Date: Mon, 17 May 2021 16:11:20 +0200
Message-Id: <20210517141129.2225-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210517141129.2225-1-christian.koenig@amd.com>
References: <20210517141129.2225-1-christian.koenig@amd.com>
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

No functional change.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-resv.c | 128 +++++++++++++++++++------------------
 1 file changed, 65 insertions(+), 63 deletions(-)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index 6ddbeb5dfbf6..87f5d82d992a 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: MIT
 /*
  * Copyright (C) 2012-2014 Canonical Ltd (Maarten Lankhorst)
  *
@@ -92,49 +93,6 @@ static void dma_resv_list_free(struct dma_resv_list *list)
 	kfree_rcu(list, rcu);
 }
 
-#if IS_ENABLED(CONFIG_LOCKDEP)
-static int __init dma_resv_lockdep(void)
-{
-	struct mm_struct *mm = mm_alloc();
-	struct ww_acquire_ctx ctx;
-	struct dma_resv obj;
-	struct address_space mapping;
-	int ret;
-
-	if (!mm)
-		return -ENOMEM;
-
-	dma_resv_init(&obj);
-	address_space_init_once(&mapping);
-
-	mmap_read_lock(mm);
-	ww_acquire_init(&ctx, &reservation_ww_class);
-	ret = dma_resv_lock(&obj, &ctx);
-	if (ret == -EDEADLK)
-		dma_resv_lock_slow(&obj, &ctx);
-	fs_reclaim_acquire(GFP_KERNEL);
-	/* for unmap_mapping_range on trylocked buffer objects in shrinkers */
-	i_mmap_lock_write(&mapping);
-	i_mmap_unlock_write(&mapping);
-#ifdef CONFIG_MMU_NOTIFIER
-	lock_map_acquire(&__mmu_notifier_invalidate_range_start_map);
-	__dma_fence_might_wait();
-	lock_map_release(&__mmu_notifier_invalidate_range_start_map);
-#else
-	__dma_fence_might_wait();
-#endif
-	fs_reclaim_release(GFP_KERNEL);
-	ww_mutex_unlock(&obj.lock);
-	ww_acquire_fini(&ctx);
-	mmap_read_unlock(mm);
-	
-	mmput(mm);
-
-	return 0;
-}
-subsys_initcall(dma_resv_lockdep);
-#endif
-
 /**
  * dma_resv_init - initialize a reservation object
  * @obj: the reservation object
@@ -196,9 +154,7 @@ int dma_resv_reserve_shared(struct dma_resv *obj, unsigned int num_fences)
 	if (old && old->shared_max) {
 		if ((old->shared_count + num_fences) <= old->shared_max)
 			return 0;
-		else
-			max = max(old->shared_count + num_fences,
-				  old->shared_max * 2);
+		max = max(old->shared_count + num_fences, old->shared_max * 2);
 	} else {
 		max = max(4ul, roundup_pow_of_two(num_fences));
 	}
@@ -337,17 +293,17 @@ void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *fence)
 EXPORT_SYMBOL(dma_resv_add_excl_fence);
 
 /**
-* dma_resv_copy_fences - Copy all fences from src to dst.
-* @dst: the destination reservation object
-* @src: the source reservation object
-*
-* Copy all fences from src to dst. dst-lock must be held.
-*/
+ * dma_resv_copy_fences - Copy all fences from src to dst.
+ * @dst: the destination reservation object
+ * @src: the source reservation object
+ *
+ * Copy all fences from src to dst. dst-lock must be held.
+ */
 int dma_resv_copy_fences(struct dma_resv *dst, struct dma_resv *src)
 {
 	struct dma_resv_list *src_list, *dst_list;
 	struct dma_fence *old, *new;
-	unsigned i;
+	unsigned int i;
 
 	dma_resv_assert_held(dst);
 
@@ -356,7 +312,7 @@ int dma_resv_copy_fences(struct dma_resv *dst, struct dma_resv *src)
 
 retry:
 	if (src_list) {
-		unsigned shared_count = src_list->shared_count;
+		unsigned int shared_count = src_list->shared_count;
 
 		rcu_read_unlock();
 
@@ -373,6 +329,7 @@ int dma_resv_copy_fences(struct dma_resv *dst, struct dma_resv *src)
 
 		dst_list->shared_count = 0;
 		for (i = 0; i < src_list->shared_count; ++i) {
+			struct dma_fence __rcu **dst;
 			struct dma_fence *fence;
 
 			fence = rcu_dereference(src_list->shared[i]);
@@ -391,7 +348,8 @@ int dma_resv_copy_fences(struct dma_resv *dst, struct dma_resv *src)
 				continue;
 			}
 
-			rcu_assign_pointer(dst_list->shared[dst_list->shared_count++], fence);
+			dst = &dst_list->shared[dst_list->shared_count++];
+			rcu_assign_pointer(*dst, fence);
 		}
 	} else {
 		dst_list = NULL;
@@ -431,7 +389,7 @@ EXPORT_SYMBOL(dma_resv_copy_fences);
  */
 int dma_resv_get_fences_rcu(struct dma_resv *obj,
 			    struct dma_fence **pfence_excl,
-			    unsigned *pshared_count,
+			    unsigned int *pshared_count,
 			    struct dma_fence ***pshared)
 {
 	struct dma_fence **shared = NULL;
@@ -533,9 +491,9 @@ long dma_resv_wait_timeout_rcu(struct dma_resv *obj,
 			       bool wait_all, bool intr,
 			       unsigned long timeout)
 {
-	struct dma_fence *fence;
-	unsigned seq, shared_count;
 	long ret = timeout ? timeout : 1;
+	unsigned int seq, shared_count;
+	struct dma_fence *fence;
 	int i;
 
 retry:
@@ -565,8 +523,9 @@ long dma_resv_wait_timeout_rcu(struct dma_resv *obj,
 			shared_count = fobj->shared_count;
 
 		for (i = 0; !fence && i < shared_count; ++i) {
-			struct dma_fence *lfence = rcu_dereference(fobj->shared[i]);
+			struct dma_fence *lfence;
 
+			lfence = rcu_dereference(fobj->shared[i]);
 			if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
 				     &lfence->flags))
 				continue;
@@ -633,7 +592,7 @@ static inline int dma_resv_test_signaled_single(struct dma_fence *passed_fence)
  */
 bool dma_resv_test_signaled_rcu(struct dma_resv *obj, bool test_all)
 {
-	unsigned seq, shared_count;
+	unsigned int seq, shared_count;
 	int ret;
 
 	rcu_read_lock();
@@ -643,16 +602,16 @@ bool dma_resv_test_signaled_rcu(struct dma_resv *obj, bool test_all)
 	seq = read_seqcount_begin(&obj->seq);
 
 	if (test_all) {
-		unsigned i;
-
 		struct dma_resv_list *fobj = rcu_dereference(obj->fence);
+		unsigned int i;
 
 		if (fobj)
 			shared_count = fobj->shared_count;
 
 		for (i = 0; i < shared_count; ++i) {
-			struct dma_fence *fence = rcu_dereference(fobj->shared[i]);
+			struct dma_fence *fence;
 
+			fence = rcu_dereference(fobj->shared[i]);
 			ret = dma_resv_test_signaled_single(fence);
 			if (ret < 0)
 				goto retry;
@@ -681,3 +640,46 @@ bool dma_resv_test_signaled_rcu(struct dma_resv *obj, bool test_all)
 	return ret;
 }
 EXPORT_SYMBOL_GPL(dma_resv_test_signaled_rcu);
+
+#if IS_ENABLED(CONFIG_LOCKDEP)
+static int __init dma_resv_lockdep(void)
+{
+	struct mm_struct *mm = mm_alloc();
+	struct ww_acquire_ctx ctx;
+	struct dma_resv obj;
+	struct address_space mapping;
+	int ret;
+
+	if (!mm)
+		return -ENOMEM;
+
+	dma_resv_init(&obj);
+	address_space_init_once(&mapping);
+
+	mmap_read_lock(mm);
+	ww_acquire_init(&ctx, &reservation_ww_class);
+	ret = dma_resv_lock(&obj, &ctx);
+	if (ret == -EDEADLK)
+		dma_resv_lock_slow(&obj, &ctx);
+	fs_reclaim_acquire(GFP_KERNEL);
+	/* for unmap_mapping_range on trylocked buffer objects in shrinkers */
+	i_mmap_lock_write(&mapping);
+	i_mmap_unlock_write(&mapping);
+#ifdef CONFIG_MMU_NOTIFIER
+	lock_map_acquire(&__mmu_notifier_invalidate_range_start_map);
+	__dma_fence_might_wait();
+	lock_map_release(&__mmu_notifier_invalidate_range_start_map);
+#else
+	__dma_fence_might_wait();
+#endif
+	fs_reclaim_release(GFP_KERNEL);
+	ww_mutex_unlock(&obj.lock);
+	ww_acquire_fini(&ctx);
+	mmap_read_unlock(mm);
+
+	mmput(mm);
+
+	return 0;
+}
+subsys_initcall(dma_resv_lockdep);
+#endif
-- 
2.25.1

