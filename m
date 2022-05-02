Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA605517475
	for <lists+dri-devel@lfdr.de>; Mon,  2 May 2022 18:37:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36C7610F076;
	Mon,  2 May 2022 16:37:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEB0810F076
 for <dri-devel@lists.freedesktop.org>; Mon,  2 May 2022 16:37:31 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id q23so20263606wra.1
 for <dri-devel@lists.freedesktop.org>; Mon, 02 May 2022 09:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IWKemcOrL+b0gDAZZafa8ch1M5o7lnyn/o46hmmWygU=;
 b=R03rLumujGEAhM8SwniCLQoHPy6kFAqVrw+ARLriiv2g9paPKv1HJ+UXOxaEV6Rmya
 IryHyZomNBs+p6BJAqENBZ6yG2HnabhAsecgLf4OBThsEKurj0EnP+v6ax9tjg6zbCDH
 /RFB4DiUPMaj7jS9K9VUN9mN79W5bEcNxBIzk13pjkyHGhT5dvm6oTg1kVYLioM6aPTP
 C9jPXj5uX5mAaxIzWIcLGHzK2OEuA8hSe9u2oSp3J5I4xEXnKCh9DV7IUFhJ3u4pbwPu
 lPZ8N8EApdAw+tvjkVgX3a/YY+EILJdse1eiuD/pNi0Etd6+jZ7NAe6IkF1ftEPAnrLD
 LBmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IWKemcOrL+b0gDAZZafa8ch1M5o7lnyn/o46hmmWygU=;
 b=faTgf4z9aTaKKUxoMdxum+HCnATsZvzFR4pLJVVEZonuNUwRPy/EkieeRCnA6TdrWL
 r1xC4vJzhM3olfv40Zjm7h/ubphKJheGEqGx6bTJMmEDPdczWw9RCHzCx/ybt3BogLMR
 mqrByBsT54zgvliTt6NRTi6MVk3wgg8Jb4rVmoXA/WAkDSd4oVsxiK0d0ihnEtKD/pdx
 Vi5CpXZ4SbqDibtxql4CdETogWRk/hfhDAWxcCnytGMKlj9q8q8N28Gl+epUrSxGKLm8
 nn+aEfcCdsCjra19MyBOAayVt7rYyeo6x/WzAsT+2mnjd6NUcKPOsGukkDT/A0XfaSr0
 bs1A==
X-Gm-Message-State: AOAM530lrBo5tD7KpHzFz9jHqiDGihh5b1bgUNnKeSYYor/AZjhOH31R
 SV4NSkbk/GSWQ2t02QS6ASg=
X-Google-Smtp-Source: ABdhPJysH2Ctla10lLPUFGhMcYiY1T7Y2hl8wvbRHgqL7XSe78IEd9IooYntpUrILEjkqAF5FaqAlw==
X-Received: by 2002:a5d:4989:0:b0:20a:c907:2110 with SMTP id
 r9-20020a5d4989000000b0020ac9072110mr9936120wrq.476.1651509450429; 
 Mon, 02 May 2022 09:37:30 -0700 (PDT)
Received: from able.fritz.box (p57b0b9e1.dip0.t-ipconnect.de. [87.176.185.225])
 by smtp.gmail.com with ESMTPSA id
 p14-20020adfaa0e000000b0020c5253d8f6sm7294694wrd.66.2022.05.02.09.37.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 May 2022 09:37:29 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch, jason@jlekstrand.net, daniels@collabora.com,
 skhawaja@google.com, maad.aldabagh@amd.com, sergemetral@google.com,
 sumit.semwal@linaro.org, gustavo@padovan.org, Felix.Kuehling@amd.com,
 alexander.deucher@amd.com, tzimmermann@suse.de,
 tvrtko.ursulin@linux.intel.com, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH 02/15] dma-buf: introduce user fence support
Date: Mon,  2 May 2022 18:37:09 +0200
Message-Id: <20220502163722.3957-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220502163722.3957-1-christian.koenig@amd.com>
References: <20220502163722.3957-1-christian.koenig@amd.com>
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
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Start introducing a new part of the framework for handling user fences.

In strict opposition to normal fences user fences don't reliable finish in
a fixed amount of time and therefore can't be used as dependency in memory
management.

Because of this user fences are marked with DMA_FENCE_FLAG_USER. Lockdep
is checked that we can at least fault user pages when we check them for
signaling.

This patch also adds a flag to dma_fence_get_stub() so that we can
retrieve a signaled user fence. This can be used together with lockdep to
test the handling in code path supporting user fences.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-fence-unwrap.c            |  4 +--
 drivers/dma-buf/dma-fence.c                   | 31 ++++++++++++-------
 drivers/dma-buf/st-dma-fence.c                |  2 +-
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c        |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c      |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c        |  4 +--
 drivers/gpu/drm/drm_syncobj.c                 | 10 +++---
 include/linux/dma-fence.h                     | 17 +++++++++-
 9 files changed, 49 insertions(+), 25 deletions(-)

diff --git a/drivers/dma-buf/dma-fence-unwrap.c b/drivers/dma-buf/dma-fence-unwrap.c
index c9becc74896d..87ee2efced10 100644
--- a/drivers/dma-buf/dma-fence-unwrap.c
+++ b/drivers/dma-buf/dma-fence-unwrap.c
@@ -76,7 +76,7 @@ struct dma_fence *__dma_fence_merge(unsigned int num_fences,
 	}
 
 	if (count == 0)
-		return dma_fence_get_stub();
+		return dma_fence_get_stub(false);
 
 	if (count > INT_MAX)
 		return NULL;
@@ -129,7 +129,7 @@ struct dma_fence *__dma_fence_merge(unsigned int num_fences,
 	} while (tmp);
 
 	if (count == 0) {
-		tmp = dma_fence_get_stub();
+		tmp = dma_fence_get_stub(false);
 		goto return_tmp;
 	}
 
diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index 066400ed8841..52873f5eaeba 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -26,6 +26,7 @@ EXPORT_TRACEPOINT_SYMBOL(dma_fence_signaled);
 
 static DEFINE_SPINLOCK(dma_fence_stub_lock);
 static struct dma_fence dma_fence_stub;
+static struct dma_fence dma_fence_user_stub;
 
 /*
  * fence context counter: each execution context should have its own
@@ -123,24 +124,28 @@ static const struct dma_fence_ops dma_fence_stub_ops = {
 
 /**
  * dma_fence_get_stub - return a signaled fence
+ * @user: if true the returned fence is an user fence
  *
- * Return a stub fence which is already signaled. The fence's
- * timestamp corresponds to the first time after boot this
- * function is called.
+ * Return a stub fence which is already signaled. The fence's timestamp
+ * corresponds to the first time after boot this function is called. If @user is
+ * true an user fence is returned which can be used with lockdep to test user
+ * fence saveness in a code path.
  */
-struct dma_fence *dma_fence_get_stub(void)
+struct dma_fence *dma_fence_get_stub(bool user)
 {
+	struct dma_fence *fence = user ? &dma_fence_stub : &dma_fence_user_stub;
+
 	spin_lock(&dma_fence_stub_lock);
-	if (!dma_fence_stub.ops) {
-		dma_fence_init(&dma_fence_stub,
-			       &dma_fence_stub_ops,
-			       &dma_fence_stub_lock,
+	if (!fence->ops) {
+		dma_fence_init(fence, &dma_fence_stub_ops, &dma_fence_stub_lock,
 			       0, 0);
-		dma_fence_signal_locked(&dma_fence_stub);
+		if (user)
+			set_bit(DMA_FENCE_FLAG_USER, &fence->flags);
+		dma_fence_signal_locked(fence);
 	}
 	spin_unlock(&dma_fence_stub_lock);
 
-	return dma_fence_get(&dma_fence_stub);
+	return dma_fence_get(fence);
 }
 EXPORT_SYMBOL(dma_fence_get_stub);
 
@@ -497,8 +502,9 @@ dma_fence_wait_timeout(struct dma_fence *fence, bool intr, signed long timeout)
 		return -EINVAL;
 
 	might_sleep();
-
 	__dma_fence_might_wait();
+	if (test_bit(DMA_FENCE_FLAG_USER, &fence->flags))
+		might_fault();
 
 	trace_dma_fence_wait_start(fence);
 	if (fence->ops->wait)
@@ -870,6 +876,9 @@ dma_fence_wait_any_timeout(struct dma_fence **fences, uint32_t count,
 	for (i = 0; i < count; ++i) {
 		struct dma_fence *fence = fences[i];
 
+		if (test_bit(DMA_FENCE_FLAG_USER, &fence->flags))
+			might_fault();
+
 		cb[i].task = current;
 		if (dma_fence_add_callback(fence, &cb[i].base,
 					   dma_fence_default_wait_cb)) {
diff --git a/drivers/dma-buf/st-dma-fence.c b/drivers/dma-buf/st-dma-fence.c
index c8a12d7ad71a..50f757f75645 100644
--- a/drivers/dma-buf/st-dma-fence.c
+++ b/drivers/dma-buf/st-dma-fence.c
@@ -412,7 +412,7 @@ static int test_stub(void *arg)
 	int i;
 
 	for (i = 0; i < ARRAY_SIZE(f); i++) {
-		f[i] = dma_fence_get_stub();
+		f[i] = dma_fence_get_stub((i % 2) == 1);
 		if (!dma_fence_is_signaled(f[i])) {
 			pr_err("Obtained unsignaled stub fence!\n");
 			goto err;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index 64ac4f8f49be..541c59635c34 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -263,7 +263,7 @@ static int amdgpu_amdkfd_remove_eviction_fence(struct amdgpu_bo *bo,
 	/* TODO: Instead of block before we should use the fence of the page
 	 * table update and TLB flush here directly.
 	 */
-	replacement = dma_fence_get_stub();
+	replacement = dma_fence_get_stub(false);
 	dma_resv_replace_fences(bo->tbo.base.resv, ef->base.context,
 				replacement, DMA_RESV_USAGE_READ);
 	dma_fence_put(replacement);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index a28b7947a034..95eeab527ca9 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -1399,7 +1399,7 @@ int amdgpu_cs_fence_to_handle_ioctl(struct drm_device *dev, void *data,
 		return PTR_ERR(fence);
 
 	if (!fence)
-		fence = dma_fence_get_stub();
+		fence = dma_fence_get_stub(false);
 
 	switch (info->in.what) {
 	case AMDGPU_FENCE_TO_HANDLE_GET_SYNCOBJ:
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
index 7f33ae87cb41..73165f387f3b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
@@ -193,7 +193,7 @@ int amdgpu_ring_init(struct amdgpu_device *adev, struct amdgpu_ring *ring,
 		adev->rings[ring->idx] = ring;
 		ring->num_hw_submission = sched_hw_submission;
 		ring->sched_score = sched_score;
-		ring->vmid_wait = dma_fence_get_stub();
+		ring->vmid_wait = dma_fence_get_stub(false);
 		r = amdgpu_fence_driver_init_ring(ring);
 		if (r)
 			return r;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index 7e5cc8323329..e5c8e72a9485 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -1689,7 +1689,7 @@ int amdgpu_vm_bo_update_mapping(struct amdgpu_device *adev,
 	}
 
 	if (!unlocked && !dma_fence_is_signaled(vm->last_unlocked)) {
-		struct dma_fence *tmp = dma_fence_get_stub();
+		struct dma_fence *tmp = dma_fence_get_stub(false);
 
 		amdgpu_bo_fence(vm->root.bo, vm->last_unlocked, true);
 		swap(vm->last_unlocked, tmp);
@@ -2905,7 +2905,7 @@ int amdgpu_vm_init(struct amdgpu_device *adev, struct amdgpu_vm *vm)
 	else
 		vm->update_funcs = &amdgpu_vm_sdma_funcs;
 	vm->last_update = NULL;
-	vm->last_unlocked = dma_fence_get_stub();
+	vm->last_unlocked = dma_fence_get_stub(false);
 
 	mutex_init(&vm->eviction_lock);
 	vm->evicting = false;
diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index 7e48dcd1bee4..5a961ea90a35 100644
--- a/drivers/gpu/drm/drm_syncobj.c
+++ b/drivers/gpu/drm/drm_syncobj.c
@@ -255,7 +255,7 @@ static void drm_syncobj_fence_add_wait(struct drm_syncobj *syncobj,
 		dma_fence_put(fence);
 		list_add_tail(&wait->node, &syncobj->cb_list);
 	} else if (!fence) {
-		wait->fence = dma_fence_get_stub();
+		wait->fence = dma_fence_get_stub(false);
 	} else {
 		wait->fence = fence;
 	}
@@ -411,7 +411,7 @@ int drm_syncobj_find_fence(struct drm_file *file_private,
 			 * signalled, use a new fence instead.
 			 */
 			if (!*fence)
-				*fence = dma_fence_get_stub();
+				*fence = dma_fence_get_stub(false);
 
 			goto out;
 		}
@@ -1000,7 +1000,7 @@ static void syncobj_wait_syncobj_func(struct drm_syncobj *syncobj,
 		dma_fence_put(fence);
 		return;
 	} else if (!fence) {
-		wait->fence = dma_fence_get_stub();
+		wait->fence = dma_fence_get_stub(false);
 	} else {
 		wait->fence = fence;
 	}
@@ -1067,7 +1067,7 @@ static signed long drm_syncobj_array_wait_timeout(struct drm_syncobj **syncobjs,
 		if (fence)
 			entries[i].fence = fence;
 		else
-			entries[i].fence = dma_fence_get_stub();
+			entries[i].fence = dma_fence_get_stub(false);
 
 		if ((flags & DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE) ||
 		    dma_fence_is_signaled(entries[i].fence)) {
@@ -1472,7 +1472,7 @@ drm_syncobj_timeline_signal_ioctl(struct drm_device *dev, void *data,
 	}
 
 	for (i = 0; i < args->count_handles; i++) {
-		struct dma_fence *fence = dma_fence_get_stub();
+		struct dma_fence *fence = dma_fence_get_stub(false);
 
 		drm_syncobj_add_point(syncobjs[i], chains[i],
 				      fence, points[i]);
diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
index afea82ec5946..be96687d31d8 100644
--- a/include/linux/dma-fence.h
+++ b/include/linux/dma-fence.h
@@ -99,6 +99,16 @@ enum dma_fence_flag_bits {
 	DMA_FENCE_FLAG_SIGNALED_BIT,
 	DMA_FENCE_FLAG_TIMESTAMP_BIT,
 	DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
+
+	/**
+	 * @DMA_FENCE_FLAG_USER:
+	 *
+	 * Indicates an user fence. User fences are not guaranteed to signal in
+	 * a finite amount of time. Because of this it is not allowed to wait for user
+	 * fences with any lock held nor depend the signaling of none user
+	 * fences on them.
+	 */
+	DMA_FENCE_FLAG_USER,
 	DMA_FENCE_FLAG_DRIVER, /* must always be last member */
 };
 
@@ -398,6 +408,8 @@ void dma_fence_enable_sw_signaling(struct dma_fence *fence);
 static inline bool
 dma_fence_is_signaled_locked(struct dma_fence *fence)
 {
+	WARN_ON(test_bit(DMA_FENCE_FLAG_USER, &fence->flags));
+
 	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
 		return true;
 
@@ -428,6 +440,9 @@ dma_fence_is_signaled_locked(struct dma_fence *fence)
 static inline bool
 dma_fence_is_signaled(struct dma_fence *fence)
 {
+	if (test_bit(DMA_FENCE_FLAG_USER, &fence->flags))
+		might_fault();
+
 	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
 		return true;
 
@@ -583,7 +598,7 @@ static inline signed long dma_fence_wait(struct dma_fence *fence, bool intr)
 	return ret < 0 ? ret : 0;
 }
 
-struct dma_fence *dma_fence_get_stub(void);
+struct dma_fence *dma_fence_get_stub(bool user);
 struct dma_fence *dma_fence_allocate_private_stub(void);
 u64 dma_fence_context_alloc(unsigned num);
 
-- 
2.25.1

