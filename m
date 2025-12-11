Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F5CCB5D0A
	for <lists+dri-devel@lfdr.de>; Thu, 11 Dec 2025 13:24:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9249810E7ED;
	Thu, 11 Dec 2025 12:24:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SOSePM+D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C7E510E7F9
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 12:24:24 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4779aa4f928so469585e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 04:24:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765455863; x=1766060663; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MKFOIPgWyee0VqJDnJ9O0Vw5yZXcrPVVwjX3ZlC8Jto=;
 b=SOSePM+DSX92skbk+rwUFctnJnmOkjiYQbasEB3C4EuJoE2SbSEG59+oNTVTQXLgsW
 r4APXPSlp9gSzaJm5AJJiiR+v4YgEKuoy2zhjMFKoxuaCG+xcaz9i77aGg+l9jg6/N1I
 SEgkXxKKzwemx0sx+f5xTDEYWv/bZ0GhPvS6csdLlvul2szz8GIAeG55vNqGCIKkLj3M
 48kQxMYV9JgsuIP3j0NSlUz/+q+K1f6cID5Me2GPfU8pHQB3HLLEpTv3NUfFY3qO867q
 zHFRXakBTBWRhZtlzCFmMOEsyK3CQYDg3l3pgehG4ytk5zON0wiu1SS8UVAjQlbRFY1l
 mJ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765455863; x=1766060663;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=MKFOIPgWyee0VqJDnJ9O0Vw5yZXcrPVVwjX3ZlC8Jto=;
 b=myGHUUz95/3vaFJ5sSnusL1I1hlVQ80OMFqz6/npsPo8dUvCA1MvzKHGRrR37mvDA2
 CN2pYHzYtUccGnJGzn1kg5uHjJT1hfKCH12IuHTRhhiY3F0FcMS+eZJQyWVXkS2W+R0Y
 sSTx/9H+NQ8msgivsmtkgeHZ1KfJw2f3xHgAIY9TtyfY3QXu6fp4rZkanzY7Sdp8hrfy
 fOkc2UYZFDrUfoA+QfWYL7SQSFA+vv9SrfvydJHes3BX+UDfUtAbqXGeXtykVAFfgKj5
 vfizNSNPoklRLP8na3SJPh5sAMusQIrcvTWpoMHVD1d6sufB3ZqoXd03A00HC61gE1CV
 uYAg==
X-Gm-Message-State: AOJu0YyetwJ9GiWJrXIbmTgOM041Kw5SYnAulYNLfqDz1b2rV2vHtHDa
 X8vEfKPktUAStN1PX1IDYDgZhRNSNtUclg7A7kgDfFpAe464YyWLYKQt
X-Gm-Gg: AY/fxX5QSrU96vt48szou7kRIXZkbJkoYQgpyKxi/wwiPxX26n5Qk4bxjr3vz2sua5R
 c5pbael62cFHLFdtm8EkDNp4PPQYlND1DdFCSIlAb7vsuM8H2E1UsLL1cJ5gqk7ZNaLnD6gEDmS
 7kedvh6nUEHcC/T63eQO0JkEiZl0fBAoF1PyGxuf7IyGoDAj/2oobe2BFjvTsPAZ9oovHOqnr4/
 CKQoBICOyIjWk74vxP8qnmRdsLStuConTd8YsAHlt8NhTY2Yf4TqHR+qv/Os5qQAlJmb1ZHs7Fy
 jMDSiIfcmPdNRnZPkk6y6ljDdRVpXvhjBDA8R/99IWD99cWnDHpjUEZIV5gddyszHeqLjXqCTMM
 IOpuaygnRNALvG0F8X14KM+Qfa/KLybg+JTOEUMYLWaznSj4x+hHMSQV9CIHN7UDuuENJM7fATu
 tgRfVC+JNbqwSXcTJTetz0URn9
X-Google-Smtp-Source: AGHT+IFs6lev3SI5mmze5IfLKqy3riUOKqZ4FhFbM5nT4ArMQa6jXHUO4CXW/OM/iDv/37FlqVMI2g==
X-Received: by 2002:a05:600c:a47:b0:477:76bf:e1fb with SMTP id
 5b1f17b1804b1-47a8380cd25mr71774455e9.16.1765455862523; 
 Thu, 11 Dec 2025 04:24:22 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:152a:9f00:dc26:feac:12f7:4088])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a89d8e680sm12172785e9.6.2025.12.11.04.24.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Dec 2025 04:24:22 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: phasta@mailbox.org, tursulin@ursulin.net, matthew.brost@intel.com,
 sumit.semwal@linaro.org
Cc: dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH 15/19] drm/amdgpu: independence for the amdgpu_userq_fence!
Date: Thu, 11 Dec 2025 13:16:46 +0100
Message-ID: <20251211122407.1709-16-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251211122407.1709-1-christian.koenig@amd.com>
References: <20251211122407.1709-1-christian.koenig@amd.com>
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

This allows amdgpu_userq_fences to outlive the amdgpu module.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       | 13 +----
 .../gpu/drm/amd/amdgpu/amdgpu_userq_fence.c   | 54 ++++---------------
 .../gpu/drm/amd/amdgpu/amdgpu_userq_fence.h   |  8 ---
 3 files changed, 11 insertions(+), 64 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 2dfbddcef9ab..f206297aae8b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -3155,11 +3155,7 @@ static int __init amdgpu_init(void)
 
 	r = amdgpu_sync_init();
 	if (r)
-		goto error_sync;
-
-	r = amdgpu_userq_fence_slab_init();
-	if (r)
-		goto error_fence;
+		return r;
 
 	DRM_INFO("amdgpu kernel modesetting enabled.\n");
 	amdgpu_register_atpx_handler();
@@ -3176,12 +3172,6 @@ static int __init amdgpu_init(void)
 
 	/* let modprobe override vga console setting */
 	return pci_register_driver(&amdgpu_kms_pci_driver);
-
-error_fence:
-	amdgpu_sync_fini();
-
-error_sync:
-	return r;
 }
 
 static void __exit amdgpu_exit(void)
@@ -3191,7 +3181,6 @@ static void __exit amdgpu_exit(void)
 	amdgpu_unregister_atpx_handler();
 	amdgpu_acpi_release();
 	amdgpu_sync_fini();
-	amdgpu_userq_fence_slab_fini();
 	mmu_notifier_synchronize();
 	amdgpu_xcp_drv_release();
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
index eba9fb359047..bb19f72770b0 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
@@ -33,26 +33,6 @@
 #include "amdgpu_userq_fence.h"
 
 static const struct dma_fence_ops amdgpu_userq_fence_ops;
-static struct kmem_cache *amdgpu_userq_fence_slab;
-
-int amdgpu_userq_fence_slab_init(void)
-{
-	amdgpu_userq_fence_slab = kmem_cache_create("amdgpu_userq_fence",
-						    sizeof(struct amdgpu_userq_fence),
-						    0,
-						    SLAB_HWCACHE_ALIGN,
-						    NULL);
-	if (!amdgpu_userq_fence_slab)
-		return -ENOMEM;
-
-	return 0;
-}
-
-void amdgpu_userq_fence_slab_fini(void)
-{
-	rcu_barrier();
-	kmem_cache_destroy(amdgpu_userq_fence_slab);
-}
 
 static inline struct amdgpu_userq_fence *to_amdgpu_userq_fence(struct dma_fence *f)
 {
@@ -227,7 +207,7 @@ void amdgpu_userq_fence_driver_put(struct amdgpu_userq_fence_driver *fence_drv)
 
 static int amdgpu_userq_fence_alloc(struct amdgpu_userq_fence **userq_fence)
 {
-	*userq_fence = kmem_cache_alloc(amdgpu_userq_fence_slab, GFP_ATOMIC);
+	*userq_fence = kmalloc(sizeof(**userq_fence), GFP_ATOMIC);
 	return *userq_fence ? 0 : -ENOMEM;
 }
 
@@ -243,12 +223,11 @@ static int amdgpu_userq_fence_create(struct amdgpu_usermode_queue *userq,
 	if (!fence_drv)
 		return -EINVAL;
 
-	spin_lock_init(&userq_fence->lock);
 	INIT_LIST_HEAD(&userq_fence->link);
 	fence = &userq_fence->base;
 	userq_fence->fence_drv = fence_drv;
 
-	dma_fence_init64(fence, &amdgpu_userq_fence_ops, &userq_fence->lock,
+	dma_fence_init64(fence, &amdgpu_userq_fence_ops, NULL,
 			 fence_drv->context, seq);
 
 	amdgpu_userq_fence_driver_get(fence_drv);
@@ -318,35 +297,22 @@ static bool amdgpu_userq_fence_signaled(struct dma_fence *f)
 	rptr = amdgpu_userq_fence_read(fence_drv);
 	wptr = fence->base.seqno;
 
-	if (rptr >= wptr)
+	if (rptr >= wptr) {
+		amdgpu_userq_fence_driver_put(fence->fence_drv);
+		fence->fence_drv = NULL;
+
+		kvfree(fence->fence_drv_array);
+		fence->fence_drv_array = NULL;
 		return true;
+	}
 
 	return false;
 }
 
-static void amdgpu_userq_fence_free(struct rcu_head *rcu)
-{
-	struct dma_fence *fence = container_of(rcu, struct dma_fence, rcu);
-	struct amdgpu_userq_fence *userq_fence = to_amdgpu_userq_fence(fence);
-	struct amdgpu_userq_fence_driver *fence_drv = userq_fence->fence_drv;
-
-	/* Release the fence driver reference */
-	amdgpu_userq_fence_driver_put(fence_drv);
-
-	kvfree(userq_fence->fence_drv_array);
-	kmem_cache_free(amdgpu_userq_fence_slab, userq_fence);
-}
-
-static void amdgpu_userq_fence_release(struct dma_fence *f)
-{
-	call_rcu(&f->rcu, amdgpu_userq_fence_free);
-}
-
 static const struct dma_fence_ops amdgpu_userq_fence_ops = {
 	.get_driver_name = amdgpu_userq_fence_get_driver_name,
 	.get_timeline_name = amdgpu_userq_fence_get_timeline_name,
 	.signaled = amdgpu_userq_fence_signaled,
-	.release = amdgpu_userq_fence_release,
 };
 
 /**
@@ -560,7 +526,7 @@ int amdgpu_userq_signal_ioctl(struct drm_device *dev, void *data,
 	r = amdgpu_userq_fence_create(queue, userq_fence, wptr, &fence);
 	if (r) {
 		mutex_unlock(&userq_mgr->userq_mutex);
-		kmem_cache_free(amdgpu_userq_fence_slab, userq_fence);
+		kfree(userq_fence);
 		goto put_gobj_write;
 	}
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.h
index d76add2afc77..6f04782f3ea9 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.h
@@ -31,11 +31,6 @@
 
 struct amdgpu_userq_fence {
 	struct dma_fence base;
-	/*
-	 * This lock is necessary to synchronize the
-	 * userqueue dma fence operations.
-	 */
-	spinlock_t lock;
 	struct list_head link;
 	unsigned long fence_drv_array_count;
 	struct amdgpu_userq_fence_driver *fence_drv;
@@ -58,9 +53,6 @@ struct amdgpu_userq_fence_driver {
 	char timeline_name[TASK_COMM_LEN];
 };
 
-int amdgpu_userq_fence_slab_init(void);
-void amdgpu_userq_fence_slab_fini(void);
-
 void amdgpu_userq_fence_driver_get(struct amdgpu_userq_fence_driver *fence_drv);
 void amdgpu_userq_fence_driver_put(struct amdgpu_userq_fence_driver *fence_drv);
 int amdgpu_userq_fence_driver_alloc(struct amdgpu_device *adev,
-- 
2.43.0

