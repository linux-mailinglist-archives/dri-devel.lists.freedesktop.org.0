Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFDB6A9FB2B
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 22:57:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C185B10EA5A;
	Mon, 28 Apr 2025 20:57:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="j9Ni0xs4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED5AF10EA53;
 Mon, 28 Apr 2025 20:57:51 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-2264aefc45dso80239495ad.0; 
 Mon, 28 Apr 2025 13:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745873871; x=1746478671; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DSaCfVfjPVrhGZCWqSTpHcL7wBxLVoBfIUG5UufJ7XE=;
 b=j9Ni0xs4ILo2xbcmWMSPiNG11MlKX3wLHvGyfnVDGAzTbFlH4uw5/0K0XDUJzuAOjM
 5XyKgjh2AOqp+ZYgBh3f1etuckzUt2UjnzTcII4p999/Ncoi0wsmGkY/EeDxkeg5O6O/
 0u4atubby4fX3BbVw1bxBebTVGvJUytjc+NuB1LOMO+K7OkOrKzSSR2tMo64+d3m4bnR
 nyThh6UfvG3usG7ruHlm/XaQZH/qQIk3jpuXmzqPzeYgL3I3Jtef2JZC952ZMM6aaNdb
 Z1VG64d8Ej4fKNiIDieRLQp3hsb6FJrLjlcDh6uMKy5oOndLiW5Ao/3BHYhOQrY0bwXl
 KyPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745873871; x=1746478671;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DSaCfVfjPVrhGZCWqSTpHcL7wBxLVoBfIUG5UufJ7XE=;
 b=lW3rFZ7dv2h+FaZNVwCnzOz6EFWRbZnp8OSCEhzz3be0xVuaXgVNZLodlj5VT0vNrQ
 st8XrgkKcPeY8Ry6iHNdXIm+cotwH4u2I4M3kKxxnfSSutQG1woXasJzsro71xVtPTtb
 hhac5+4YrPmEmX3JP6uUrarXA0TdfbFiringC62js1jo9glaSXelYH/8V1wyXBYNTLQl
 cM7/21dc7j8sy8q/wWGgrR620Z4O5aR/MtIIyhMZDhcYpKoQLzzs15bm/TwWBRjHx7XT
 k5UqbUWOwP501VWe+8MikGfJHCNMiMql4uWawfBhu8OSosnz9WgsW7dAOgCxqDXYIhke
 0k5A==
X-Gm-Message-State: AOJu0YyRHwKHLIrHgyQ8P48Jh3tojZ7Lm2cz5QySZNo8hZWrUwojRGeU
 diXZI3q/Cula/mvFHwVqb8OdB4w9HpN3d+sZVDYMwseHtNupuV7o4gVgeQ==
X-Gm-Gg: ASbGncvB6rfrj+iltOE5XfCewOPIkE1uanDpQomXaqMjR730FRxbFqnfqqt+2Q/2kUK
 Gi9Vz0qoh8V0KMCbTyVOMf6hRwFiGchbOuMx/QxapfoJYi9ADDVGzH6q+Jgfs2ZcMBhl98nZHHb
 7IIGFnwhIjAu/iKCJz/4KBPI+yhq1D0A1ZiFh42uw2RVh0QIljJppLoLGi716S71K+YBCOJvh/+
 BrOcyzwAVF2LYp1Q/641NzzRzqKOE73sPHAN4G5Pl63qcjs8v7Ggz68U9ejsk+p43LuRQXORiwj
 KdiEWPc5O0z3M0zDO2shlPwnITvvqEtOTp4CUvYxnipxivyiSzM+EogFudcvWiu5lA4kZm8/Rgu
 fck8DCMgxbb7fX0M=
X-Google-Smtp-Source: AGHT+IHEMiLEM/wbOAhJYuTeydj2H35jR7sO32pLTS2m4mBhOF10+/fMiT3gqGidoKz6g+E5Z5uOrQ==
X-Received: by 2002:a17:902:d4c1:b0:227:e74a:a05a with SMTP id
 d9443c01a7336-22de60702a3mr16773285ad.44.1745873871069; 
 Mon, 28 Apr 2025 13:57:51 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22db5102868sm88322635ad.164.2025.04.28.13.57.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Apr 2025 13:57:50 -0700 (PDT)
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
Subject: [PATCH v3 28/33] drm/msm: Add VM_BIND submitqueue
Date: Mon, 28 Apr 2025 13:54:35 -0700
Message-ID: <20250428205619.227835-29-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250428205619.227835-1-robdclark@gmail.com>
References: <20250428205619.227835-1-robdclark@gmail.com>
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
 drivers/gpu/drm/msm/msm_submitqueue.c | 57 ++++++++++++++++-----
 include/uapi/drm/msm_drm.h            |  9 +++-
 6 files changed, 191 insertions(+), 21 deletions(-)

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
index 552ff2d57294..2e7f8352fa40 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -4,6 +4,7 @@
  * Author: Rob Clark <robdclark@gmail.com>
  */
 
+#include <linux/dma-fence-unwrap.h>
 #include <linux/file.h>
 #include <linux/sync_file.h>
 #include <linux/uaccess.h>
@@ -249,30 +250,43 @@ static int submit_lookup_cmds(struct msm_gem_submit *submit,
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
@@ -357,9 +371,18 @@ static void submit_unpin_objects(struct msm_gem_submit *submit)
 
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
@@ -369,6 +392,10 @@ static void submit_attach_object_fences(struct msm_gem_submit *submit)
 			dma_resv_add_fence(obj->resv, submit->user_fence,
 					   DMA_RESV_USAGE_READ);
 	}
+
+	last_fence = vm->last_fence;
+	vm->last_fence = dma_fence_unwrap_merge(submit->user_fence, last_fence);
+	dma_fence_put(last_fence);
 }
 
 static int submit_bo(struct msm_gem_submit *submit, uint32_t idx,
@@ -522,6 +549,11 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	if (!queue)
 		return -ENOENT;
 
+	if (queue->flags & MSM_SUBMITQUEUE_VM_BIND) {
+		ret = UERR(EINVAL, dev, "Invalid queue type");
+		goto out_post_unlock;
+	}
+
 	ring = gpu->rb[queue->ring_nr];
 
 	if (args->flags & MSM_SUBMIT_FENCE_FD_OUT) {
@@ -608,6 +640,18 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	if (ret)
 		goto out;
 
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
 	for (i = 0; i < args->nr_cmds; i++) {
 		struct drm_gem_object *obj;
 		uint64_t iova;
diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 265c82abc658..5b8769e152c9 100644
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
@@ -153,6 +154,9 @@ static const struct drm_gpuvm_ops msm_gpuvm_ops = {
 	.vm_free = msm_gem_vm_free,
 };
 
+static const struct drm_sched_backend_ops msm_vm_bind_ops = {
+};
+
 /**
  * msm_gem_vm_create() - Create and initialize a &msm_gem_vm
  * @drm: the drm device
@@ -191,6 +195,21 @@ msm_gem_vm_create(struct drm_device *drm, struct msm_mmu *mmu, const char *name,
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
@@ -202,8 +221,60 @@ msm_gem_vm_create(struct drm_device *drm, struct msm_mmu *mmu, const char *name,
 
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
index 20f52d9636b0..49c8862ada13 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -562,6 +562,9 @@ struct msm_gpu_submitqueue {
 	struct mutex lock;
 	struct kref ref;
 	struct drm_sched_entity *entity;
+
+	/** @_vm_bind_entity: used for @entity pointer for VM_BIND queues */
+	struct drm_sched_entity _vm_bind_entity[0];
 };
 
 struct msm_gpu_state_bo {
diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm/msm/msm_submitqueue.c
index 8ced49c7557b..99ab780d5d7b 100644
--- a/drivers/gpu/drm/msm/msm_submitqueue.c
+++ b/drivers/gpu/drm/msm/msm_submitqueue.c
@@ -72,6 +72,9 @@ void msm_submitqueue_destroy(struct kref *kref)
 
 	idr_destroy(&queue->fence_idr);
 
+	if (queue->entity == &queue->_vm_bind_entity[0])
+		drm_sched_entity_destroy(queue->entity);
+
 	msm_context_put(queue->ctx);
 
 	kfree(queue);
@@ -115,6 +118,11 @@ void msm_submitqueue_close(struct msm_context *ctx)
 		list_del(&entry->node);
 		msm_submitqueue_put(entry);
 	}
+
+	if (!ctx->vm)
+		return;
+
+	msm_gem_vm_close(ctx->vm);
 }
 
 static struct drm_sched_entity *
@@ -160,8 +168,6 @@ int msm_submitqueue_create(struct drm_device *drm, struct msm_context *ctx,
 	struct msm_drm_private *priv = drm->dev_private;
 	struct msm_gpu_submitqueue *queue;
 	enum drm_sched_priority sched_prio;
-	extern int enable_preemption;
-	bool preemption_supported;
 	unsigned ring_nr;
 	int ret;
 
@@ -171,26 +177,53 @@ int msm_submitqueue_create(struct drm_device *drm, struct msm_context *ctx,
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

