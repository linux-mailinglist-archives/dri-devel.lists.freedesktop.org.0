Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40896BD3933
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 16:35:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64B7C10E476;
	Mon, 13 Oct 2025 14:35:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="G4j2mli7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 024C310E482
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 14:35:16 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-63babfdb52cso1615022a12.3
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 07:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760366115; x=1760970915; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Jwl6XaBMnrWtOkCeylltwJV5yddo3L+rehYMfN8Q8HY=;
 b=G4j2mli7dZrWjTp4xQvQ7d2M/v6OWPjqYH3Ue/pQ5VSc8+H/nxbld2i0AKkGEpOEeK
 s/R2jbKBoSnnB1s0napT+R4HokTHd7Kckc6ngAdqu1pildbTYuO6fyV0aT3U52AsFenT
 jgO7DSssRRp9hF4cIXE/DlaTMeGQ1qNsqObEiKyI++Q35z4tQmG9qRCbBgb4uOLLZhZB
 631IUoaHvRhO7ufhF2e+zIr3kcZ7GUJMh6XtVDfFHI0zNZgl0Loa33o/C2OG7nK+Tgva
 bN385XUiD37vNNSJ1WGJWQjY8mgRpw+paB0JxspEWCZMg4m1wIes8uJa+faFpOKvsNtt
 3J4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760366115; x=1760970915;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Jwl6XaBMnrWtOkCeylltwJV5yddo3L+rehYMfN8Q8HY=;
 b=VrABT4chT4sCPFaOVA9i6IP+UZaggSe27PmU8/Qyj7qauB/fkOHC7/+lDDYMWALmUZ
 MDK/v9oVqkXzcfNrXJ/eSSAxb9xC3iV+bIqdmOXTLr3pBlNuu1u+l8h5++9uWkZZGruY
 OYaVofIYifhCgg/RPzYeqNJvZ9eaEdvOx6MVZOxFFiXpMoJEvV1BLIONC/c2ETcemPk7
 5LvPFfzDr7gg5MUFcOjuE5cQ58zaQ3X7cn0wW5oLScu6lQxLgUl3rdw7D0vPb7b4aq0g
 +vdF5Qi4TNxnk02rNlZMxhvinpSzjxSMfjDiMrZrCWerxiShuzd/5fj7xtBKqdHVxcQy
 K65w==
X-Gm-Message-State: AOJu0Yz7zkZBBgTXMtJsRvOZGGVVN8aTKtc412xENVLW2ZhSxhmuXH+R
 KRfkQ0Ua25nAWOgfSawCJR32EgDk9MvqIsYjnLqh21VdYdCAjNNmFVs0
X-Gm-Gg: ASbGncvVPZeVXL5P0QBqUTLxxdCS+8gyGHrOG6ij0Uw4cxp8XfcFHqKWDMQX9GVUrt+
 T7dAeYMsIeE0GiUo78ZN2lsAj8b28J0YGRaQPnGLDrTURuakJ/ocPiQCIww06HJSPtplNMmjLbP
 ROa0fwjZrSnMS8NukDJf0+dy0XiPqTh9ViYiWshBHcZVsmG4dElQg0+4Bfemo5ShOCH9o21Ts4a
 sqEYwAUixjV3fwfIvd7NSak8B4IHiaCy3gdNxoHPqJ86Ztgvg36rOQe5SepPgRttcqgJy6EQ2BS
 FRZVkwOWpj2bmzVpqjh0e8FccAzdNrbxqHxG9s5jFUSKKrxzYKuOFal8mEWsC6gi/fnNGrnoZPG
 HFgRYPrgiW1Ln3uBPTTBjcE0h7SfK8y6BhX5sCm48JCYW6yLxXUp5lnM=
X-Google-Smtp-Source: AGHT+IHNw71CXQOpB2p7JUhDHo0Due1lg1gSXVJ7u4nJoIdZ2N7vLWMyij3q2B64/uzbtZ0jMMKMwA==
X-Received: by 2002:a17:907:da9:b0:b3b:ff00:5d4 with SMTP id
 a640c23a62f3a-b50aa586a25mr2177321966b.5.1760366115362; 
 Mon, 13 Oct 2025 07:35:15 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:151b:dc00:15d1:ebc5:76e6:730f])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-63a5c321453sm8942037a12.39.2025.10.13.07.35.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Oct 2025 07:35:15 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: phasta@mailbox.org, alexdeucher@gmail.com, simona.vetter@ffwll.ch,
 tursulin@ursulin.net
Cc: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 15/15] drm/amdgpu: independence for the amdgpu_userq__fence!
Date: Mon, 13 Oct 2025 15:48:42 +0200
Message-ID: <20251013143502.1655-16-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251013143502.1655-1-christian.koenig@amd.com>
References: <20251013143502.1655-1-christian.koenig@amd.com>
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

This should allow amdgpu_userq_fences to outlive the amdgpu module.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       | 13 +----
 .../gpu/drm/amd/amdgpu/amdgpu_userq_fence.c   | 54 ++++---------------
 .../gpu/drm/amd/amdgpu/amdgpu_userq_fence.h   |  8 ---
 3 files changed, 11 insertions(+), 64 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index b4c41b19cb88..808a5907a325 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -3136,11 +3136,7 @@ static int __init amdgpu_init(void)
 
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
@@ -3157,12 +3153,6 @@ static int __init amdgpu_init(void)
 
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
@@ -3172,7 +3162,6 @@ static void __exit amdgpu_exit(void)
 	amdgpu_unregister_atpx_handler();
 	amdgpu_acpi_release();
 	amdgpu_sync_fini();
-	amdgpu_userq_fence_slab_fini();
 	mmu_notifier_synchronize();
 	amdgpu_xcp_drv_release();
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
index 761bad98da3e..9e0d558c1e4c 100644
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
@@ -226,7 +206,7 @@ void amdgpu_userq_fence_driver_put(struct amdgpu_userq_fence_driver *fence_drv)
 
 static int amdgpu_userq_fence_alloc(struct amdgpu_userq_fence **userq_fence)
 {
-	*userq_fence = kmem_cache_alloc(amdgpu_userq_fence_slab, GFP_ATOMIC);
+	*userq_fence = kmalloc(sizeof(**userq_fence), GFP_ATOMIC);
 	return *userq_fence ? 0 : -ENOMEM;
 }
 
@@ -242,12 +222,11 @@ static int amdgpu_userq_fence_create(struct amdgpu_usermode_queue *userq,
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
@@ -317,35 +296,22 @@ static bool amdgpu_userq_fence_signaled(struct dma_fence *f)
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
@@ -558,7 +524,7 @@ int amdgpu_userq_signal_ioctl(struct drm_device *dev, void *data,
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

