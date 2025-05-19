Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 095BAABC66F
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 19:58:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 500AC10E48B;
	Mon, 19 May 2025 17:58:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AQCK5L1h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C3D610E481;
 Mon, 19 May 2025 17:58:40 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id
 98e67ed59e1d1-306bf444ba2so4634527a91.1; 
 Mon, 19 May 2025 10:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747677519; x=1748282319; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DzZp//YJOYo/fi99uTT2lLUqF6eYnVj7ze0qufulWdA=;
 b=AQCK5L1hgkk9kpKzGRDXLs4wEvAIM2Vy53YY8NWIkrXvp9Ptua2TkC9MFuBymApseM
 QcPx7lojJoqKAFlrmRN33AQVCHYQsVQYwoD/mkW+k2SAIiZonI3iWGoqK485vIaW/8QE
 qjgXubRMNPvnHqWPNItTotjltDfQcMnHkcZ0T38bWnOt+95aKizVi6gIYvKxeG9S1roB
 tpa5CRqo00HE1XwgVO1PkHecaj94TZjfBz2n6K6UHbdBJFYyKcF8636TgXI9vQ/kQOOZ
 Cvh/s/8laNkzCqegGrVqbkYfNRKIEi79qimGkOjoWXQEgBNXzGsouYw+TypDFk9LqQPm
 G7cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747677519; x=1748282319;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DzZp//YJOYo/fi99uTT2lLUqF6eYnVj7ze0qufulWdA=;
 b=BB9aOruX/PcD0991dWMMmG6Uquo72wX9lrQP6a4ufas44GZeysMZIv8znAtYdY2t33
 +iqr1H1QszklIPkYY/xLp6mQG/ek1hDFWR1NRkpy/w45grTLPnnqwII74qSe7hytfMCA
 AElE97qLjsNA/6B7iPD+erHZrp0wI8ZcIztrJeQrY4wG5qgRs8ibsF0OOzmTr3A3qqFo
 Ck+ZZJ8iPl0Wjp+gAuroWiCS2kooezzQPQnXDGZzCAxC/Kbdpddk6qoQi+VznTa7xt6i
 FjluVTnXWIZFBqUoqi3Qzsgo7OtVIQxeS9cTwbRqI/7HGpIfz3e/ET3AMYlu11AITla9
 Gqgw==
X-Gm-Message-State: AOJu0YxdBoVLr6tdDQQMSYj4m4xSwVogTRZxNGTb72bONDGP27yaMxAx
 GYp2yuA2mRGjwuxGZ651JvbozBWqbO4wr4jhNgkE+zTn8l6SzxUThispb99hwg==
X-Gm-Gg: ASbGncutR55FgTJma8oqO5tmmK38PdgEEupoZJBWl/3OTFAZFoD8cIsJP8GHKOQ7nAh
 zN8QPJNKO1kyvYB5brUdC30NrydxUHccaEq/a76a7MRKZnQJijsvlQwU7GzIoqwDKQq2aCKTmyL
 0pRaFUYjxJO3pzsWPar4IpUjYX8qcxeeFIBCFq7TFJUnHMTZbsgrriB1dmYLMzw71f3T4GLRkqc
 cScHRu1A5CzzsmKPtUIx882tSEhLdb9y3l1EnUJ2e9ttcHZChNoJ987yfIRRMqKf9zgmZTRdXdR
 rubVtv3/PM5VI4KOSHwF7N+b3egF4dfK9mqcSY2o7Rm8r4+n7olR3yMKbVweWx/JYX3AXzJnpNI
 DhRZnTPa09SYgFncBDbk/MCMFEw==
X-Google-Smtp-Source: AGHT+IFg3EnYtS/gW+XjgCG8FLnKsv0/rmYium2a4IFxC5xZRL6gKN7aJTskG4v+HyU95WpgLQhnwg==
X-Received: by 2002:a17:90b:2f08:b0:2ee:d63f:d8f with SMTP id
 98e67ed59e1d1-30e7d52b830mr18833754a91.13.1747677519250; 
 Mon, 19 May 2025 10:58:39 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-30e7d46efd0sm7708113a91.4.2025.05.19.10.58.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 May 2025 10:58:38 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>, Rob Clark <robdclark@chromium.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-kernel@vger.kernel.org (open list),
 linux-media@vger.kernel.org (open list:DMA BUFFER SHARING
 FRAMEWORK:Keyword:\bdma_(?:buf|fence|resv)\b), 
 linaro-mm-sig@lists.linaro.org (moderated list:DMA BUFFER SHARING
 FRAMEWORK:Keyword:\bdma_(?:buf|fence|resv)\b)
Subject: [PATCH v5 31/40] drm/msm: Add VM_BIND submitqueue
Date: Mon, 19 May 2025 10:57:28 -0700
Message-ID: <20250519175755.13037-19-robdclark@gmail.com>
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

This submitqueue type isn't tied to a hw ringbuffer, but instead
executes on the CPU for performing async VM_BIND ops.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.h         | 12 +++++
 drivers/gpu/drm/msm/msm_gem_submit.c  | 60 +++++++++++++++++++---
 drivers/gpu/drm/msm/msm_gem_vma.c     | 71 +++++++++++++++++++++++++++
 drivers/gpu/drm/msm/msm_gpu.h         |  3 ++
 drivers/gpu/drm/msm/msm_submitqueue.c | 67 +++++++++++++++++++------
 include/uapi/drm/msm_drm.h            |  9 +++-
 6 files changed, 197 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index f7b85084e228..c1581bd4b5fd 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -53,6 +53,13 @@ struct msm_gem_vm {
 	/** @base: Inherit from drm_gpuvm. */
 	struct drm_gpuvm base;
 
+	/**
+	 * @sched: Scheduler used for asynchronous VM_BIND request.
+	 *
+	 * Unused for kernel managed VMs (where all operations are synchronous).
+	 */
+	struct drm_gpu_scheduler sched;
+
 	/**
 	 * @mm: Memory management for kernel managed VA allocations
 	 *
@@ -71,6 +78,9 @@ struct msm_gem_vm {
 	 */
 	struct pid *pid;
 
+	/** @last_fence: Fence for last pending work scheduled on the VM */
+	struct dma_fence *last_fence;
+
 	/** @faults: the number of GPU hangs associated with this address space */
 	int faults;
 
@@ -100,6 +110,8 @@ struct drm_gpuvm *
 msm_gem_vm_create(struct drm_device *drm, struct msm_mmu *mmu, const char *name,
 		  u64 va_start, u64 va_size, bool managed);
 
+void msm_gem_vm_close(struct drm_gpuvm *gpuvm);
+
 struct msm_fence_context;
 
 #define MSM_VMA_DUMP (DRM_GPUVA_USERBITS << 0)
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index bfb8c5ac1f1e..053e6c65780f 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -4,6 +4,7 @@
  * Author: Rob Clark <robdclark@gmail.com>
  */
 
+#include <linux/dma-fence-unwrap.h>
 #include <linux/file.h>
 #include <linux/sync_file.h>
 #include <linux/uaccess.h>
@@ -258,30 +259,43 @@ static int submit_lookup_cmds(struct msm_gem_submit *submit,
 static int submit_lock_objects(struct msm_gem_submit *submit)
 {
 	unsigned flags = DRM_EXEC_IGNORE_DUPLICATES | DRM_EXEC_INTERRUPTIBLE_WAIT;
+	struct drm_exec *exec = &submit->exec;
 	int ret;
 
-// TODO need to add vm_bind path which locks vm resv + external objs
 	drm_exec_init(&submit->exec, flags, submit->nr_bos);
 
+	if (msm_context_is_vmbind(submit->queue->ctx)) {
+		drm_exec_until_all_locked (&submit->exec) {
+			ret = drm_gpuvm_prepare_vm(submit->vm, exec, 1);
+			drm_exec_retry_on_contention(exec);
+			if (ret)
+				return ret;
+
+			ret = drm_gpuvm_prepare_objects(submit->vm, exec, 1);
+			drm_exec_retry_on_contention(exec);
+			if (ret)
+				return ret;
+		}
+
+		return 0;
+	}
+
 	drm_exec_until_all_locked (&submit->exec) {
 		ret = drm_exec_lock_obj(&submit->exec,
 					drm_gpuvm_resv_obj(submit->vm));
 		drm_exec_retry_on_contention(&submit->exec);
 		if (ret)
-			goto error;
+			return ret;
 		for (unsigned i = 0; i < submit->nr_bos; i++) {
 			struct drm_gem_object *obj = submit->bos[i].obj;
 			ret = drm_exec_prepare_obj(&submit->exec, obj, 1);
 			drm_exec_retry_on_contention(&submit->exec);
 			if (ret)
-				goto error;
+				return ret;
 		}
 	}
 
 	return 0;
-
-error:
-	return ret;
 }
 
 static int submit_fence_sync(struct msm_gem_submit *submit)
@@ -366,9 +380,18 @@ static void submit_unpin_objects(struct msm_gem_submit *submit)
 
 static void submit_attach_object_fences(struct msm_gem_submit *submit)
 {
-	int i;
+	struct msm_gem_vm *vm = to_msm_vm(submit->vm);
+	struct dma_fence *last_fence;
+
+	if (msm_context_is_vmbind(submit->queue->ctx)) {
+		drm_gpuvm_resv_add_fence(submit->vm, &submit->exec,
+					 submit->user_fence,
+					 DMA_RESV_USAGE_BOOKKEEP,
+					 DMA_RESV_USAGE_BOOKKEEP);
+		return;
+	}
 
-	for (i = 0; i < submit->nr_bos; i++) {
+	for (unsigned i = 0; i < submit->nr_bos; i++) {
 		struct drm_gem_object *obj = submit->bos[i].obj;
 
 		if (submit->bos[i].flags & MSM_SUBMIT_BO_WRITE)
@@ -378,6 +401,10 @@ static void submit_attach_object_fences(struct msm_gem_submit *submit)
 			dma_resv_add_fence(obj->resv, submit->user_fence,
 					   DMA_RESV_USAGE_READ);
 	}
+
+	last_fence = vm->last_fence;
+	vm->last_fence = dma_fence_unwrap_merge(submit->user_fence, last_fence);
+	dma_fence_put(last_fence);
 }
 
 static int submit_bo(struct msm_gem_submit *submit, uint32_t idx,
@@ -532,6 +559,11 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	if (!queue)
 		return -ENOENT;
 
+	if (queue->flags & MSM_SUBMITQUEUE_VM_BIND) {
+		ret = UERR(EINVAL, dev, "Invalid queue type");
+		goto out_post_unlock;
+	}
+
 	ring = gpu->rb[queue->ring_nr];
 
 	if (args->flags & MSM_SUBMIT_FENCE_FD_OUT) {
@@ -721,6 +753,18 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 
 	submit_attach_object_fences(submit);
 
+	if (msm_context_is_vmbind(ctx)) {
+		/*
+		 * If we are not using VM_BIND, submit_pin_vmas() will validate
+		 * just the BOs attached to the submit.  In that case we don't
+		 * need to validate the _entire_ vm, because userspace tracked
+		 * what BOs are associated with the submit.
+		 */
+		ret = drm_gpuvm_validate(submit->vm, &submit->exec);
+		if (ret)
+			goto out;
+	}
+
 	/* The scheduler owns a ref now: */
 	msm_gem_submit_get(submit);
 
diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 72667316df51..73baa9451ada 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -16,6 +16,7 @@ msm_gem_vm_free(struct drm_gpuvm *gpuvm)
 	drm_mm_takedown(&vm->mm);
 	if (vm->mmu)
 		vm->mmu->funcs->destroy(vm->mmu);
+	dma_fence_put(vm->last_fence);
 	put_pid(vm->pid);
 	kfree(vm);
 }
@@ -154,6 +155,9 @@ static const struct drm_gpuvm_ops msm_gpuvm_ops = {
 	.vm_free = msm_gem_vm_free,
 };
 
+static const struct drm_sched_backend_ops msm_vm_bind_ops = {
+};
+
 /**
  * msm_gem_vm_create() - Create and initialize a &msm_gem_vm
  * @drm: the drm device
@@ -196,6 +200,21 @@ msm_gem_vm_create(struct drm_device *drm, struct msm_mmu *mmu, const char *name,
 		goto err_free_vm;
 	}
 
+	if (!managed) {
+		struct drm_sched_init_args args = {
+			.ops = &msm_vm_bind_ops,
+			.num_rqs = 1,
+			.credit_limit = 1,
+			.timeout = MAX_SCHEDULE_TIMEOUT,
+			.name = "msm-vm-bind",
+			.dev = drm->dev,
+		};
+
+		ret = drm_sched_init(&vm->sched, &args);
+		if (ret)
+			goto err_free_dummy;
+	}
+
 	drm_gpuvm_init(&vm->base, name, flags, drm, dummy_gem,
 		       va_start, va_size, 0, 0, &msm_gpuvm_ops);
 	drm_gem_object_put(dummy_gem);
@@ -207,8 +226,60 @@ msm_gem_vm_create(struct drm_device *drm, struct msm_mmu *mmu, const char *name,
 
 	return &vm->base;
 
+err_free_dummy:
+	drm_gem_object_put(dummy_gem);
+
 err_free_vm:
 	kfree(vm);
 	return ERR_PTR(ret);
 
 }
+
+/**
+ * msm_gem_vm_close() - Close a VM
+ * @gpuvm: The VM to close
+ *
+ * Called when the drm device file is closed, to tear down VM related resources
+ * (which will drop refcounts to GEM objects that were still mapped into the
+ * VM at the time).
+ */
+void
+msm_gem_vm_close(struct drm_gpuvm *gpuvm)
+{
+	struct msm_gem_vm *vm = to_msm_vm(gpuvm);
+	struct drm_gpuva *vma, *tmp;
+
+	/*
+	 * For kernel managed VMs, the VMAs are torn down when the handle is
+	 * closed, so nothing more to do.
+	 */
+	if (vm->managed)
+		return;
+
+	if (vm->last_fence)
+		dma_fence_wait(vm->last_fence, false);
+
+	/* Kill the scheduler now, so we aren't racing with it for cleanup: */
+	drm_sched_stop(&vm->sched, NULL);
+	drm_sched_fini(&vm->sched);
+
+	/* Tear down any remaining mappings: */
+	dma_resv_lock(drm_gpuvm_resv(gpuvm), NULL);
+	drm_gpuvm_for_each_va_safe (vma, tmp, gpuvm) {
+		struct drm_gem_object *obj = vma->gem.obj;
+
+		if (obj && obj->resv != drm_gpuvm_resv(gpuvm)) {
+			drm_gem_object_get(obj);
+			msm_gem_lock(obj);
+		}
+
+		msm_gem_vma_unmap(vma);
+		msm_gem_vma_close(vma);
+
+		if (obj && obj->resv != drm_gpuvm_resv(gpuvm)) {
+			msm_gem_unlock(obj);
+			drm_gem_object_put(obj);
+		}
+	}
+	dma_resv_unlock(drm_gpuvm_resv(gpuvm));
+}
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 448ebf721bd8..9cbf155ff222 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -570,6 +570,9 @@ struct msm_gpu_submitqueue {
 	struct mutex lock;
 	struct kref ref;
 	struct drm_sched_entity *entity;
+
+	/** @_vm_bind_entity: used for @entity pointer for VM_BIND queues */
+	struct drm_sched_entity _vm_bind_entity[0];
 };
 
 struct msm_gpu_state_bo {
diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm/msm/msm_submitqueue.c
index 8ced49c7557b..8617a82cd6b3 100644
--- a/drivers/gpu/drm/msm/msm_submitqueue.c
+++ b/drivers/gpu/drm/msm/msm_submitqueue.c
@@ -72,6 +72,9 @@ void msm_submitqueue_destroy(struct kref *kref)
 
 	idr_destroy(&queue->fence_idr);
 
+	if (queue->entity == &queue->_vm_bind_entity[0])
+		drm_sched_entity_destroy(queue->entity);
+
 	msm_context_put(queue->ctx);
 
 	kfree(queue);
@@ -102,7 +105,7 @@ struct msm_gpu_submitqueue *msm_submitqueue_get(struct msm_context *ctx,
 
 void msm_submitqueue_close(struct msm_context *ctx)
 {
-	struct msm_gpu_submitqueue *entry, *tmp;
+	struct msm_gpu_submitqueue *queue, *tmp;
 
 	if (!ctx)
 		return;
@@ -111,10 +114,17 @@ void msm_submitqueue_close(struct msm_context *ctx)
 	 * No lock needed in close and there won't
 	 * be any more user ioctls coming our way
 	 */
-	list_for_each_entry_safe(entry, tmp, &ctx->submitqueues, node) {
-		list_del(&entry->node);
-		msm_submitqueue_put(entry);
+	list_for_each_entry_safe(queue, tmp, &ctx->submitqueues, node) {
+		if (queue->entity == &queue->_vm_bind_entity[0])
+			drm_sched_entity_flush(queue->entity, MAX_WAIT_SCHED_ENTITY_Q_EMPTY);
+		list_del(&queue->node);
+		msm_submitqueue_put(queue);
 	}
+
+	if (!ctx->vm)
+		return;
+
+	msm_gem_vm_close(ctx->vm);
 }
 
 static struct drm_sched_entity *
@@ -160,8 +170,6 @@ int msm_submitqueue_create(struct drm_device *drm, struct msm_context *ctx,
 	struct msm_drm_private *priv = drm->dev_private;
 	struct msm_gpu_submitqueue *queue;
 	enum drm_sched_priority sched_prio;
-	extern int enable_preemption;
-	bool preemption_supported;
 	unsigned ring_nr;
 	int ret;
 
@@ -171,26 +179,53 @@ int msm_submitqueue_create(struct drm_device *drm, struct msm_context *ctx,
 	if (!priv->gpu)
 		return -ENODEV;
 
-	preemption_supported = priv->gpu->nr_rings == 1 && enable_preemption != 0;
+	if (flags & MSM_SUBMITQUEUE_VM_BIND) {
+		unsigned sz;
 
-	if (flags & MSM_SUBMITQUEUE_ALLOW_PREEMPT && preemption_supported)
-		return -EINVAL;
+		/* Not allowed for kernel managed VMs (ie. kernel allocs VA) */
+		if (!msm_context_is_vmbind(ctx))
+			return -EINVAL;
 
-	ret = msm_gpu_convert_priority(priv->gpu, prio, &ring_nr, &sched_prio);
-	if (ret)
-		return ret;
+		if (prio)
+			return -EINVAL;
+
+		sz = struct_size(queue, _vm_bind_entity, 1);
+		queue = kzalloc(sz, GFP_KERNEL);
+	} else {
+		extern int enable_preemption;
+		bool preemption_supported =
+			priv->gpu->nr_rings == 1 && enable_preemption != 0;
+
+		if (flags & MSM_SUBMITQUEUE_ALLOW_PREEMPT && preemption_supported)
+			return -EINVAL;
 
-	queue = kzalloc(sizeof(*queue), GFP_KERNEL);
+		ret = msm_gpu_convert_priority(priv->gpu, prio, &ring_nr, &sched_prio);
+		if (ret)
+			return ret;
+
+		queue = kzalloc(sizeof(*queue), GFP_KERNEL);
+	}
 
 	if (!queue)
 		return -ENOMEM;
 
 	kref_init(&queue->ref);
 	queue->flags = flags;
-	queue->ring_nr = ring_nr;
 
-	queue->entity = get_sched_entity(ctx, priv->gpu->rb[ring_nr],
-					 ring_nr, sched_prio);
+	if (flags & MSM_SUBMITQUEUE_VM_BIND) {
+		struct drm_gpu_scheduler *sched = &to_msm_vm(msm_context_vm(drm, ctx))->sched;
+
+		queue->entity = &queue->_vm_bind_entity[0];
+
+		drm_sched_entity_init(queue->entity, DRM_SCHED_PRIORITY_KERNEL,
+				      &sched, 1, NULL);
+	} else {
+		queue->ring_nr = ring_nr;
+
+		queue->entity = get_sched_entity(ctx, priv->gpu->rb[ring_nr],
+						 ring_nr, sched_prio);
+	}
+
 	if (IS_ERR(queue->entity)) {
 		ret = PTR_ERR(queue->entity);
 		kfree(queue);
diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
index 2c2fc4b284d0..6d6cd1219926 100644
--- a/include/uapi/drm/msm_drm.h
+++ b/include/uapi/drm/msm_drm.h
@@ -385,12 +385,19 @@ struct drm_msm_gem_madvise {
 /*
  * Draw queues allow the user to set specific submission parameter. Command
  * submissions specify a specific submitqueue to use.  ID 0 is reserved for
- * backwards compatibility as a "default" submitqueue
+ * backwards compatibility as a "default" submitqueue.
+ *
+ * Because VM_BIND async updates happen on the CPU, they must run on a
+ * virtual queue created with the flag MSM_SUBMITQUEUE_VM_BIND.  If we had
+ * a way to do pgtable updates on the GPU, we could drop this restriction.
  */
 
 #define MSM_SUBMITQUEUE_ALLOW_PREEMPT	0x00000001
+#define MSM_SUBMITQUEUE_VM_BIND	0x00000002  /* virtual queue for VM_BIND ops */
+
 #define MSM_SUBMITQUEUE_FLAGS		    ( \
 		MSM_SUBMITQUEUE_ALLOW_PREEMPT | \
+		MSM_SUBMITQUEUE_VM_BIND | \
 		0)
 
 /*
-- 
2.49.0

