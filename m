Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF9D4ABC647
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 19:58:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3D47893ED;
	Mon, 19 May 2025 17:58:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JSOoUqm2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
 [209.85.215.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A437210E2E8;
 Mon, 19 May 2025 17:58:06 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id
 41be03b00d2f7-af548cb1f83so4294749a12.3; 
 Mon, 19 May 2025 10:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747677486; x=1748282286; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LJyNsqqMnCFBlZcBxnLOjTsC6Bw4XYLjkgJX6AkR1Z8=;
 b=JSOoUqm27paZw9YB0D8IvjbF1seJmt9id9b8du8iU/zy4bR6gR38tzmihOv+PHMnJ9
 WF2xQc85qJvFW4KgVMoL6W6+hTWsK4YeQtasYC41Bf+kD/krJcHnkHaeaJZz4yrz8HKy
 63keHiZxv7TZpNKpAVeG6STVGEZtAu+3K+B9D3FYuyBFGVTuOXnKsAMUPvgJ7u/Rfcdv
 oUTShkXHD1cPXLgs4jWAlLoc2ucbQ153tMUQPedoNCbGMec90WztK8Ym3VTWGEMm6dZ8
 scDz6dTxuzpgNLnCvQwZU/AkGHjVC6hCwpRwqnJWrwZZE3aREA0Ez2ioQuTcSGl6nHFz
 gPKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747677486; x=1748282286;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LJyNsqqMnCFBlZcBxnLOjTsC6Bw4XYLjkgJX6AkR1Z8=;
 b=iUc+8qJ6jrQpJ9mqpynR8wQqFwkV9dT33QZCTWn77xjY8Qka9/rNgG6/NBwqG/L0SL
 8lGtKgQu3VDY8J/BmXMwp+E4nLglN6X2VsPlsDUZxvSFvPX9KobFHFsdRmYsfB4z5Hty
 AUQcrsJe3OYpsotJ8vjkMBJVP+rnQ4Lrws1Uy4IwVAKE6HmK7IVhOYZwfjGCPlnp9aCK
 QRhrYNqa7C8IxjTR7eYXCBU1NXzolvyL+sNucQbvvJJJOc2eZ0K3a3FSaqTP9J/uweJy
 Bb9SJGyhtt7ud6kHYFEt2gM0/54o49IyN9IbNeOqc7dkFpgiDacNUch2UVDGYo6AxrGR
 O4VQ==
X-Gm-Message-State: AOJu0Yw3ZvHQmuQca/OGA5+L53ySelwOXox75ztLZdxCNGnlwZOiMb8b
 3dbBVpKR4o15BcfYUsvpmWZkQ9Xk9bgUlIkxcnGHx8/J+mfytjIETojJL9qN/w==
X-Gm-Gg: ASbGnctIdrfhx1JgbYsmLLNOL/Lx2TCk4o0W5TklGIFHGgMc+9j44OrFfLoWSnl312O
 ejKauafvuszp/62bkUP05X99DQYUFgPWxt41xBtcitNgmvl3ihpwiwoEp+aD/7UcjpYycYR07Ug
 COcopTSk3zASeeuF7Ndptf+M80c0bYltuecqdy+T26OMjGoLGtIoJzbky2n3/QZ5h1DwmfljCsM
 C5I40naCzcv6KbEu8C+veSPB82ZRfvbfAKK+sXmU4xgauaOh7h5HjiuN8xL6NPwVUzGkiLatVWB
 lrA7fz3uomgyce78jAkIcdG+W7iRFpQRvCKVsnLbeBJu3+lEAY8b+hHnwYeMQSq1mMJsoMmpIAT
 oVbOE8uwRPBTJsFglyD2UIU3e37kdHq2udA4S
X-Google-Smtp-Source: AGHT+IGanyuq409M8oZQs0siMUQtt9jalgdF95x4NnSDYklFUUnntLmWL4PzPxxhK6ssW/iEAev1mg==
X-Received: by 2002:a17:902:e54e:b0:22e:4b74:5f67 with SMTP id
 d9443c01a7336-231de376f05mr190501355ad.31.1747677485653; 
 Mon, 19 May 2025 10:58:05 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-231d4e9745esm63022455ad.127.2025.05.19.10.58.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 May 2025 10:58:04 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>, Rob Clark <robdclark@chromium.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-kernel@vger.kernel.org (open list),
 linux-media@vger.kernel.org (open list:DMA BUFFER SHARING
 FRAMEWORK:Keyword:\bdma_(?:buf|fence|resv)\b), 
 linaro-mm-sig@lists.linaro.org (moderated list:DMA BUFFER SHARING
 FRAMEWORK:Keyword:\bdma_(?:buf|fence|resv)\b)
Subject: [PATCH v5 14/40] drm/msm: Convert vm locking
Date: Mon, 19 May 2025 10:57:11 -0700
Message-ID: <20250519175755.13037-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250519175755.13037-1-robdclark@gmail.com>
References: <20250519175348.11924-1-robdclark@gmail.com>
 <20250519175755.13037-1-robdclark@gmail.com>
MIME-Version: 1.0
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

From: Rob Clark <robdclark@chromium.org>

Convert to using the gpuvm's r_obj for serializing access to the VM.
This way we can use the drm_exec helper for dealing with deadlock
detection and backoff.

This will let us deal with upcoming locking order conflicts with the
VM_BIND implmentation (ie. in some scenarious we need to acquire the obj
lock first, for ex. to iterate all the VMs an obj is bound in, and in
other scenarious we need to acquire the VM lock first).

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.c          | 35 ++++++++---
 drivers/gpu/drm/msm/msm_gem.h          | 37 ++++++++++--
 drivers/gpu/drm/msm/msm_gem_shrinker.c | 80 +++++++++++++++++++++++---
 drivers/gpu/drm/msm/msm_gem_submit.c   |  9 ++-
 drivers/gpu/drm/msm/msm_gem_vma.c      | 27 ++++-----
 5 files changed, 150 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 3b7db3b3f763..b7055805a5dd 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -52,6 +52,7 @@ static void put_iova_spaces(struct drm_gem_object *obj, struct drm_gpuvm *vm, bo
 static void msm_gem_close(struct drm_gem_object *obj, struct drm_file *file)
 {
 	struct msm_context *ctx = file->driver_priv;
+	struct drm_exec exec;
 
 	update_ctx_mem(file, -obj->size);
 
@@ -70,9 +71,9 @@ static void msm_gem_close(struct drm_gem_object *obj, struct drm_file *file)
 	dma_resv_wait_timeout(obj->resv, DMA_RESV_USAGE_READ, false,
 			      msecs_to_jiffies(1000));
 
-	msm_gem_lock(obj);
+	msm_gem_lock_vm_and_obj(&exec, obj, ctx->vm);
 	put_iova_spaces(obj, &ctx->vm->base, true);
-	msm_gem_unlock(obj);
+	drm_exec_fini(&exec);     /* drop locks */
 }
 
 /*
@@ -538,11 +539,12 @@ int msm_gem_get_and_pin_iova_range(struct drm_gem_object *obj,
 		struct msm_gem_vm *vm, uint64_t *iova,
 		u64 range_start, u64 range_end)
 {
+	struct drm_exec exec;
 	int ret;
 
-	msm_gem_lock(obj);
+	msm_gem_lock_vm_and_obj(&exec, obj, vm);
 	ret = get_and_pin_iova_range_locked(obj, vm, iova, range_start, range_end);
-	msm_gem_unlock(obj);
+	drm_exec_fini(&exec);     /* drop locks */
 
 	return ret;
 }
@@ -562,16 +564,17 @@ int msm_gem_get_iova(struct drm_gem_object *obj,
 		struct msm_gem_vm *vm, uint64_t *iova)
 {
 	struct msm_gem_vma *vma;
+	struct drm_exec exec;
 	int ret = 0;
 
-	msm_gem_lock(obj);
+	msm_gem_lock_vm_and_obj(&exec, obj, vm);
 	vma = get_vma_locked(obj, vm, 0, U64_MAX);
 	if (IS_ERR(vma)) {
 		ret = PTR_ERR(vma);
 	} else {
 		*iova = vma->base.va.addr;
 	}
-	msm_gem_unlock(obj);
+	drm_exec_fini(&exec);     /* drop locks */
 
 	return ret;
 }
@@ -600,9 +603,10 @@ static int clear_iova(struct drm_gem_object *obj,
 int msm_gem_set_iova(struct drm_gem_object *obj,
 		     struct msm_gem_vm *vm, uint64_t iova)
 {
+	struct drm_exec exec;
 	int ret = 0;
 
-	msm_gem_lock(obj);
+	msm_gem_lock_vm_and_obj(&exec, obj, vm);
 	if (!iova) {
 		ret = clear_iova(obj, vm);
 	} else {
@@ -615,7 +619,7 @@ int msm_gem_set_iova(struct drm_gem_object *obj,
 			ret = -EBUSY;
 		}
 	}
-	msm_gem_unlock(obj);
+	drm_exec_fini(&exec);     /* drop locks */
 
 	return ret;
 }
@@ -1007,12 +1011,27 @@ static void msm_gem_free_object(struct drm_gem_object *obj)
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 	struct drm_device *dev = obj->dev;
 	struct msm_drm_private *priv = dev->dev_private;
+	struct drm_exec exec;
 
 	mutex_lock(&priv->obj_lock);
 	list_del(&msm_obj->node);
 	mutex_unlock(&priv->obj_lock);
 
+	/*
+	 * We need to lock any VMs the object is still attached to, but not
+	 * the object itself (see explaination in msm_gem_assert_locked()),
+	 * so just open-code this special case:
+	 */
+	drm_exec_init(&exec, 0, 0);
+	drm_exec_until_all_locked (&exec) {
+		struct drm_gpuvm_bo *vm_bo;
+		drm_gem_for_each_gpuvm_bo (vm_bo, obj) {
+			drm_exec_lock_obj(&exec, drm_gpuvm_resv_obj(vm_bo->vm));
+			drm_exec_retry_on_contention(&exec);
+		}
+	}
 	put_iova_spaces(obj, NULL, true);
+	drm_exec_fini(&exec);     /* drop locks */
 
 	if (obj->import_attach) {
 		GEM_WARN_ON(msm_obj->vaddr);
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index f7f7e7910754..36a846e9b943 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -62,12 +62,6 @@ struct msm_gem_vm {
 	 */
 	struct drm_mm mm;
 
-	/** @mm_lock: protects @mm node allocation/removal */
-	struct spinlock mm_lock;
-
-	/** @vm_lock: protects gpuvm insert/remove/traverse */
-	struct mutex vm_lock;
-
 	/** @mmu: The mmu object which manages the pgtables */
 	struct msm_mmu *mmu;
 
@@ -246,6 +240,37 @@ msm_gem_unlock(struct drm_gem_object *obj)
 	dma_resv_unlock(obj->resv);
 }
 
+/**
+ * msm_gem_lock_vm_and_obj() - Helper to lock an obj + VM
+ * @exec: the exec context helper which will be initalized
+ * @obj: the GEM object to lock
+ * @vm: the VM to lock
+ *
+ * Operations which modify a VM frequently need to lock both the VM and
+ * the object being mapped/unmapped/etc.  This helper uses drm_exec to
+ * acquire both locks, dealing with potential deadlock/backoff scenarios
+ * which arise when multiple locks are involved.
+ */
+static inline int
+msm_gem_lock_vm_and_obj(struct drm_exec *exec,
+			struct drm_gem_object *obj,
+			struct msm_gem_vm *vm)
+{
+	int ret = 0;
+
+	drm_exec_init(exec, 0, 2);
+	drm_exec_until_all_locked (exec) {
+		ret = drm_exec_lock_obj(exec, drm_gpuvm_resv_obj(&vm->base));
+		if (!ret && (obj->resv != drm_gpuvm_resv(&vm->base)))
+			ret = drm_exec_lock_obj(exec, obj);
+		drm_exec_retry_on_contention(exec);
+		if (GEM_WARN_ON(ret))
+			break;
+	}
+
+	return ret;
+}
+
 static inline void
 msm_gem_assert_locked(struct drm_gem_object *obj)
 {
diff --git a/drivers/gpu/drm/msm/msm_gem_shrinker.c b/drivers/gpu/drm/msm/msm_gem_shrinker.c
index de185fc34084..5faf6227584a 100644
--- a/drivers/gpu/drm/msm/msm_gem_shrinker.c
+++ b/drivers/gpu/drm/msm/msm_gem_shrinker.c
@@ -43,6 +43,75 @@ msm_gem_shrinker_count(struct shrinker *shrinker, struct shrink_control *sc)
 	return count;
 }
 
+static bool
+with_vm_locks(struct ww_acquire_ctx *ticket,
+	      void (*fn)(struct drm_gem_object *obj),
+	      struct drm_gem_object *obj)
+{
+	/*
+	 * Track last locked entry for for unwinding locks in error and
+	 * success paths
+	 */
+	struct drm_gpuvm_bo *vm_bo, *last_locked = NULL;
+	int ret = 0;
+
+	drm_gem_for_each_gpuvm_bo (vm_bo, obj) {
+		struct dma_resv *resv = drm_gpuvm_resv(vm_bo->vm);
+
+		if (resv == obj->resv)
+			continue;
+
+		ret = dma_resv_lock(resv, ticket);
+
+		/*
+		 * Since we already skip the case when the VM and obj
+		 * share a resv (ie. _NO_SHARE objs), we don't expect
+		 * to hit a double-locking scenario... which the lock
+		 * unwinding cannot really cope with.
+		 */
+		WARN_ON(ret == -EALREADY);
+
+		/*
+		 * Don't bother with slow-lock / backoff / retry sequence,
+		 * if we can't get the lock just give up and move on to
+		 * the next object.
+		 */
+		if (ret)
+			goto out_unlock;
+
+		/*
+		 * Hold a ref to prevent the vm_bo from being freed
+		 * and removed from the obj's gpuva list, as that would
+		 * would result in missing the unlock below
+		 */
+		drm_gpuvm_bo_get(vm_bo);
+
+		last_locked = vm_bo;
+	}
+
+	fn(obj);
+
+out_unlock:
+	if (last_locked) {
+		drm_gem_for_each_gpuvm_bo (vm_bo, obj) {
+			struct dma_resv *resv = drm_gpuvm_resv(vm_bo->vm);
+
+			if (resv == obj->resv)
+				continue;
+
+			dma_resv_unlock(resv);
+
+			/* Drop the ref taken while locking: */
+			drm_gpuvm_bo_put(vm_bo);
+
+			if (last_locked == vm_bo)
+				break;
+		}
+	}
+
+	return ret == 0;
+}
+
 static bool
 purge(struct drm_gem_object *obj, struct ww_acquire_ctx *ticket)
 {
@@ -52,9 +121,7 @@ purge(struct drm_gem_object *obj, struct ww_acquire_ctx *ticket)
 	if (msm_gem_active(obj))
 		return false;
 
-	msm_gem_purge(obj);
-
-	return true;
+	return with_vm_locks(ticket, msm_gem_purge, obj);
 }
 
 static bool
@@ -66,9 +133,7 @@ evict(struct drm_gem_object *obj, struct ww_acquire_ctx *ticket)
 	if (msm_gem_active(obj))
 		return false;
 
-	msm_gem_evict(obj);
-
-	return true;
+	return with_vm_locks(ticket, msm_gem_evict, obj);
 }
 
 static bool
@@ -100,6 +165,7 @@ static unsigned long
 msm_gem_shrinker_scan(struct shrinker *shrinker, struct shrink_control *sc)
 {
 	struct msm_drm_private *priv = shrinker->private_data;
+	struct ww_acquire_ctx ticket;
 	struct {
 		struct drm_gem_lru *lru;
 		bool (*shrink)(struct drm_gem_object *obj, struct ww_acquire_ctx *ticket);
@@ -124,7 +190,7 @@ msm_gem_shrinker_scan(struct shrinker *shrinker, struct shrink_control *sc)
 			drm_gem_lru_scan(stages[i].lru, nr,
 					 &stages[i].remaining,
 					 stages[i].shrink,
-					 NULL);
+					 &ticket);
 		nr -= stages[i].freed;
 		freed += stages[i].freed;
 		remaining += stages[i].remaining;
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 86791a854c42..6924d03026ba 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -256,11 +256,18 @@ static int submit_lookup_cmds(struct msm_gem_submit *submit,
 /* This is where we make sure all the bo's are reserved and pin'd: */
 static int submit_lock_objects(struct msm_gem_submit *submit)
 {
+	unsigned flags = DRM_EXEC_IGNORE_DUPLICATES | DRM_EXEC_INTERRUPTIBLE_WAIT;
 	int ret;
 
-	drm_exec_init(&submit->exec, DRM_EXEC_INTERRUPTIBLE_WAIT, submit->nr_bos);
+// TODO need to add vm_bind path which locks vm resv + external objs
+	drm_exec_init(&submit->exec, flags, submit->nr_bos);
 
 	drm_exec_until_all_locked (&submit->exec) {
+		ret = drm_exec_lock_obj(&submit->exec,
+					drm_gpuvm_resv_obj(&submit->vm->base));
+		drm_exec_retry_on_contention(&submit->exec);
+		if (ret)
+			goto error;
 		for (unsigned i = 0; i < submit->nr_bos; i++) {
 			struct drm_gem_object *obj = submit->bos[i].obj;
 			ret = drm_exec_prepare_obj(&submit->exec, obj, 1);
diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index d1621761ef36..e294e7f6e723 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -92,15 +92,13 @@ void msm_gem_vma_close(struct msm_gem_vma *vma)
 
 	GEM_WARN_ON(vma->mapped);
 
-	spin_lock(&vm->mm_lock);
+	drm_gpuvm_resv_assert_held(&vm->base);
+
 	if (vma->base.va.addr)
 		drm_mm_remove_node(&vma->node);
-	spin_unlock(&vm->mm_lock);
 
-	mutex_lock(&vm->vm_lock);
 	drm_gpuva_remove(&vma->base);
 	drm_gpuva_unlink(&vma->base);
-	mutex_unlock(&vm->vm_lock);
 
 	kfree(vma);
 }
@@ -114,16 +112,16 @@ msm_gem_vma_new(struct msm_gem_vm *vm, struct drm_gem_object *obj,
 	struct msm_gem_vma *vma;
 	int ret;
 
+	drm_gpuvm_resv_assert_held(&vm->base);
+
 	vma = kzalloc(sizeof(*vma), GFP_KERNEL);
 	if (!vma)
 		return ERR_PTR(-ENOMEM);
 
 	if (vm->managed) {
-		spin_lock(&vm->mm_lock);
 		ret = drm_mm_insert_node_in_range(&vm->mm, &vma->node,
 						obj->size, PAGE_SIZE, 0,
 						range_start, range_end, 0);
-		spin_unlock(&vm->mm_lock);
 
 		if (ret)
 			goto err_free_vma;
@@ -137,9 +135,7 @@ msm_gem_vma_new(struct msm_gem_vm *vm, struct drm_gem_object *obj,
 	drm_gpuva_init(&vma->base, range_start, range_end - range_start, obj, 0);
 	vma->mapped = false;
 
-	mutex_lock(&vm->vm_lock);
 	ret = drm_gpuva_insert(&vm->base, &vma->base);
-	mutex_unlock(&vm->vm_lock);
 	if (ret)
 		goto err_free_range;
 
@@ -149,18 +145,14 @@ msm_gem_vma_new(struct msm_gem_vm *vm, struct drm_gem_object *obj,
 		goto err_va_remove;
 	}
 
-	mutex_lock(&vm->vm_lock);
 	drm_gpuvm_bo_extobj_add(vm_bo);
 	drm_gpuva_link(&vma->base, vm_bo);
-	mutex_unlock(&vm->vm_lock);
 	GEM_WARN_ON(drm_gpuvm_bo_put(vm_bo));
 
 	return vma;
 
 err_va_remove:
-	mutex_lock(&vm->vm_lock);
 	drm_gpuva_remove(&vma->base);
-	mutex_unlock(&vm->vm_lock);
 err_free_range:
 	if (vm->managed)
 		drm_mm_remove_node(&vma->node);
@@ -191,7 +183,13 @@ struct msm_gem_vm *
 msm_gem_vm_create(struct drm_device *drm, struct msm_mmu *mmu, const char *name,
 		  u64 va_start, u64 va_size, bool managed)
 {
-	enum drm_gpuvm_flags flags = managed ? DRM_GPUVM_VA_WEAK_REF : 0;
+	/*
+	 * We mostly want to use DRM_GPUVM_RESV_PROTECTED, except that
+	 * makes drm_gpuvm_bo_evict() a no-op for extobjs (ie. we loose
+	 * tracking that an extobj is evicted) :facepalm:
+	 */
+	enum drm_gpuvm_flags flags =
+		(managed ? DRM_GPUVM_VA_WEAK_REF : 0);
 	struct msm_gem_vm *vm;
 	struct drm_gem_object *dummy_gem;
 	int ret = 0;
@@ -213,9 +211,6 @@ msm_gem_vm_create(struct drm_device *drm, struct msm_mmu *mmu, const char *name,
 		       va_start, va_size, 0, 0, &msm_gpuvm_ops);
 	drm_gem_object_put(dummy_gem);
 
-	spin_lock_init(&vm->mm_lock);
-	mutex_init(&vm->vm_lock);
-
 	vm->mmu = mmu;
 	vm->managed = managed;
 
-- 
2.49.0

