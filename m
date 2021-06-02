Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5F4398B61
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 16:04:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7179E6EAC0;
	Wed,  2 Jun 2021 14:04:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 977876EC9D
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jun 2021 14:04:03 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id b9so3976562ejc.13
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Jun 2021 07:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oAG+lLZKeGQY7NJqx71dogEw+juVdDpeN8OrfJ5nXVQ=;
 b=DBGQkBPe8AfAhyywNSzWuMQZhkA/F7iuVLJ28iLycIWPikdIn3KuykDJiLPJ+7Rlac
 V9k6x/+Yk9vDwIN/BSICftUqEERHjKE+luiYc8yuWJZbJF626bBqjkTYNBT2qKag2F+f
 Q6kat0XZMQcf9uGKju99e1kh3UUCVWlpXZFyLZyQsa0dWcYTfXFoi/UmHWLLiirWnv0Y
 dCA3zLgbTkj+S3FqMb1KSzltSFuWVRQlWai/i0Zf1Wqc0AL791I4uht/gONTCIyK7YWu
 yBsDRYWRHTlTAV1x8jAOpzoGC8PfS37gMm22q3tIzNZ4CjWZp3m3uP28AVfv10PPGyUt
 YXKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oAG+lLZKeGQY7NJqx71dogEw+juVdDpeN8OrfJ5nXVQ=;
 b=kMySjkU5H2p/haKIAEaZ97d34Mo+qa5gxLjRyxCPiYC0JuqSiTBw/QIYqGG1cuTVS0
 vfui+z1M84UVhlesXI+DVp1JaF7nUXgsyE1K2mII6MoahduhrOKsyztziBXc2/ybdkFE
 fYTlhRzIxpuC9AxbP67GHH7QRzZMPOQKeKsKyivJiK9er6GnZoDnSA/E0yfXOBBII4dH
 9mmdw6kqDglNiYnBmkYJf5c1HEmaMK1cNG5s08/zMR3PlYzYuQrGG2gRb2rGEVCkFnPZ
 RJ5y7Bdu48G5Gh44Jwp2Ubw+pZMZIvBHQRAPgMG2i8vYDT8trP4jPy6kcvDaGnuYQJRZ
 E5Ww==
X-Gm-Message-State: AOAM530FaNFymoYodaSod6Y5kMZBW1eQR8eCqcejVliF+ZCY/Gr0fMkr
 LFeB4kyu2BUvRXO0hUWeI8+YXDScqUo=
X-Google-Smtp-Source: ABdhPJwIGVn2eF0SKa+m8vANn7zJga5oKYXmH1VZ+cIrW7BPAvK9DbTT9o86qdfgv/K69mfawHbkaw==
X-Received: by 2002:a17:906:f849:: with SMTP id
 ks9mr14624848ejb.402.1622642642273; 
 Wed, 02 Jun 2021 07:04:02 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:e6a4:731d:6be0:e698])
 by smtp.gmail.com with ESMTPSA id gw7sm82327ejb.5.2021.06.02.07.04.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 07:04:01 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch
Subject: [PATCH 2/2] dma-buf: add SPDX header and fix style in dma-resv.c
Date: Wed,  2 Jun 2021 16:03:59 +0200
Message-Id: <20210602140359.272601-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210602140359.272601-1-christian.koenig@amd.com>
References: <20210602140359.272601-1-christian.koenig@amd.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

dma_resv_lockdep() seems to have some space/tab mixups. Fix that and
move the function to the end of the file.

Also fix some minor things checkpatch.pl pointed out while at it.

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

