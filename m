Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E8BA6916E
	for <lists+dri-devel@lfdr.de>; Wed, 19 Mar 2025 15:55:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C31F10E533;
	Wed, 19 Mar 2025 14:55:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HP0LCF1+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F16BB10E528;
 Wed, 19 Mar 2025 14:55:42 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-2235189adaeso17194415ad.0; 
 Wed, 19 Mar 2025 07:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742396142; x=1743000942; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8XT8DN3ZleGCofMlQ1mMQjy7k/r/T2YXHUe97y9PZGo=;
 b=HP0LCF1+X6Y3nujY+NyGtRCcqc7NOm497Lqccm+H9wr6DVHxn1uf51topPgmDPqyuO
 1ceFsxh9N5o4ACLZAByPjYVyTm2Z5IiKD42y9glm1Cfer/k1Rv5AelOqcEZsMsIZinq9
 HmocAjCgNWKi41Ovc0WqUyMFbTQyCsMaYb9sslWE1S7TbPDTL0F77Qo9FlXgrzpjhar9
 PLMH4xBSYuIf3kSbmy+ISR36YHleqpOpfBoLL5l+TMPO7M2r4So7vWKNQEZg4i6Kh1C1
 z88t32EvTXtNINWRotbR2+mret4NEOygc6BwY10DBsqYO9egUTB9kfaWI1nEH1ZHNrNS
 rXLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742396142; x=1743000942;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8XT8DN3ZleGCofMlQ1mMQjy7k/r/T2YXHUe97y9PZGo=;
 b=itxdFpItaP0axMZr6IjqsCipGIrOy/WpOlG46hOVhfscgKSvT2IIUBDlsXiJShCZtG
 hT4Fb6SlFTyowHN29nSpblWw8ZcMn3qrLhurOGM8BFSLc3LX9Iu20nlggdgC101DfvtJ
 +76nzVESooWB+i+T48GkekjUQE2KsxYnUtE1KoC/Q0ZwcqgWGEPIfzJkd++r6nQz1MQ1
 RoEHvsjRL0U2kmC1u6NnmGtgVK9yot3A/6gg7PqeM+4Vu41TLsx4o6Vnxr89QyExEQMc
 MBMCVedq23wYMNRFCoauwzxoSLottsN80y0ib2BDOtZjn1ue9Qlx3zsxhM7w9cT1iE/t
 h9tA==
X-Gm-Message-State: AOJu0YztDIDfQMW9kD3wYfVyBFEhT7PM59glK2FtHzQQAU83PVs4zsdk
 F1lQ5uFr2SMQS3AN710Vpkn0pRMW0aYYkIFXOpP5J7/+WtQV7cHhiLL7Iw==
X-Gm-Gg: ASbGnctpjph3yF3/PcW+bxdA1t3oRjzQ40FvkQtOgO3WaubeLp48kg3akLPm7diSDCY
 /GtDaqXwdCkqHm3WvR+UKn/Q3KxEFsB0VXoRhtKoGbl5cBdckfqn9wnDmuURzgSifyCi8ViBkR0
 5mamUhViCze/MjN//KnGc71T9QW0xniXbxSZjN30AszxCZEQVU0wl41toF+YSyBT7dWKcInhU32
 SLAUil/DTUFpstrYZCAFq2ehsSzsDpBXu01kGQ/MzK9ChHCfo2dhef04dptPw5JGHWR00+/UsH1
 +VU+jCd5PmB67slmi99L/5VX0VGjPIfRwoyHyy1wpggnzDINsdxXGmJrpKixez3Ca4AHsm26F1Y
 Mk1UYt4zHc4esBMTDG1Q=
X-Google-Smtp-Source: AGHT+IGKKoZeugIMzJo9Kl0W+rcTmXvkdvQFEcCdjrL7jzz+9e7IC2DNU5xrIm+Wn0RuPWMuOADobQ==
X-Received: by 2002:a17:902:e803:b0:21f:6f33:f96 with SMTP id
 d9443c01a7336-2262c99c631mr107794785ad.6.1742396141855; 
 Wed, 19 Mar 2025 07:55:41 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-225c6ba7260sm114891055ad.110.2025.03.19.07.55.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Mar 2025 07:55:40 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
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
Subject: [PATCH v2 18/34] drm/msm: Add VM_BIND submitqueue
Date: Wed, 19 Mar 2025 07:52:30 -0700
Message-ID: <20250319145425.51935-19-robdclark@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250319145425.51935-1-robdclark@gmail.com>
References: <20250319145425.51935-1-robdclark@gmail.com>
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
 drivers/gpu/drm/msm/msm_gem.c         |   3 +-
 drivers/gpu/drm/msm/msm_gem.h         |  10 ++
 drivers/gpu/drm/msm/msm_gem_submit.c  | 128 +++++++++++++++++++++++---
 drivers/gpu/drm/msm/msm_gem_vma.c     | 107 +++++++++++++++++++++
 drivers/gpu/drm/msm/msm_gpu.h         |   3 +
 drivers/gpu/drm/msm/msm_submitqueue.c |  57 +++++++++---
 include/uapi/drm/msm_drm.h            |   9 +-
 7 files changed, 287 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 5a5220b6f21d..4c68a3dd3fed 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -232,8 +232,7 @@ static void put_pages(struct drm_gem_object *obj)
 	}
 }
 
-static struct page **msm_gem_get_pages_locked(struct drm_gem_object *obj,
-					      unsigned madv)
+struct page **msm_gem_get_pages_locked(struct drm_gem_object *obj, unsigned madv)
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 8e29e36ca9c5..d427ead2dce0 100644
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
@@ -106,6 +113,8 @@ struct drm_gpuvm *
 msm_gem_vm_create(struct drm_device *drm, struct msm_mmu *mmu, const char *name,
 		  u64 va_start, u64 va_size, bool managed);
 
+void msm_gem_vm_close(struct drm_gpuvm *gpuvm);
+
 struct msm_fence_context;
 
 /**
@@ -195,6 +204,7 @@ int msm_gem_get_and_pin_iova(struct drm_gem_object *obj, struct drm_gpuvm *vm,
 			     uint64_t *iova);
 void msm_gem_unpin_iova(struct drm_gem_object *obj, struct drm_gpuvm *vm);
 void msm_gem_pin_obj_locked(struct drm_gem_object *obj);
+struct page **msm_gem_get_pages_locked(struct drm_gem_object *obj, unsigned madv);
 struct page **msm_gem_pin_pages_locked(struct drm_gem_object *obj);
 void msm_gem_unpin_pages_locked(struct drm_gem_object *obj);
 int msm_gem_dumb_create(struct drm_file *file, struct drm_device *dev,
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index bb61231ab8ba..39a6e0418bdf 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -23,6 +23,11 @@
 #define SUBMIT_ERROR(err, submit, fmt, ...) \
 	UERR(err, (submit)->dev, fmt, ##__VA_ARGS__)
 
+static bool submit_is_vmbind(struct msm_gem_submit *submit)
+{
+	return !!(submit->queue->flags & MSM_SUBMITQUEUE_VM_BIND);
+}
+
 /*
  * Cmdstream submission:
  */
@@ -115,6 +120,17 @@ void __msm_gem_submit_destroy(struct kref *kref)
 	kfree(submit);
 }
 
+static bool invalid_bo_flags(bool vm_bind, uint32_t flags)
+{
+	if (vm_bind) {
+		return flags & ~(MSM_SUBMIT_BO_DUMP | MSM_SUBMIT_BO_OP_MASK);
+	} else {
+		/* at least one of READ and/or WRITE flags should be set: */
+		return (flags & ~MSM_SUBMIT_BO_FLAGS) ||
+			!(flags & (MSM_SUBMIT_BO_READ | MSM_SUBMIT_BO_WRITE));
+	}
+}
+
 static bool invalid_alignment(uint64_t addr)
 {
 	/*
@@ -129,9 +145,10 @@ static int submit_lookup_objects(struct msm_gem_submit *submit,
 		struct drm_msm_gem_submit *args, struct drm_file *file)
 {
 	unsigned i, bo_stride = args->bos_stride;
+	bool vm_bind = submit_is_vmbind(submit);
 	int ret = 0;
 
-	if (!bo_stride)
+	if (!bo_stride || !vm_bind)
 		bo_stride = sizeof(struct drm_msm_gem_submit_bo);
 
 	for (i = 0; i < args->nr_bos; i++) {
@@ -151,11 +168,7 @@ static int submit_lookup_objects(struct msm_gem_submit *submit,
 			goto out;
 		}
 
-/* at least one of READ and/or WRITE flags should be set: */
-#define MANDATORY_FLAGS (MSM_SUBMIT_BO_READ | MSM_SUBMIT_BO_WRITE)
-
-		if ((submit_bo.flags & ~MSM_SUBMIT_BO_FLAGS) ||
-		    !(submit_bo.flags & MANDATORY_FLAGS))
+		if (invalid_bo_flags(vm_bind, submit_bo.flags))
 			ret = SUBMIT_ERROR(EINVAL, submit, "invalid flags: %x\n", submit_bo.flags);
 
 		if (invalid_alignment(submit_bo.address))
@@ -174,6 +187,7 @@ static int submit_lookup_objects(struct msm_gem_submit *submit,
 
 		submit->bos[i].handle = submit_bo.handle;
 		submit->bos[i].flags = submit_bo.flags;
+		submit->bos[i].iova = submit_bo.address;
 		submit->bos[i].bo_offset = submit_bo.bo_offset;
 		submit->bos[i].range = submit_bo.range;
 	}
@@ -183,6 +197,12 @@ static int submit_lookup_objects(struct msm_gem_submit *submit,
 	for (i = 0; i < args->nr_bos; i++) {
 		struct drm_gem_object *obj;
 
+		if (vm_bind) {
+			unsigned op = submit->bos[i].flags & MSM_SUBMIT_BO_OP_MASK;
+			if (op != MSM_SUBMIT_BO_OP_MAP)
+				continue;
+		}
+
 		/* normally use drm_gem_object_lookup(), but for bulk lookup
 		 * all under single table_lock just hit object_idr directly:
 		 */
@@ -297,13 +317,22 @@ static int submit_lookup_cmds(struct msm_gem_submit *submit,
 /* This is where we make sure all the bo's are reserved and pin'd: */
 static int submit_lock_objects(struct msm_gem_submit *submit)
 {
+	bool vm_bind = submit_is_vmbind(submit);
+	unsigned flags = DRM_EXEC_INTERRUPTIBLE_WAIT;
 	int ret;
 
-	drm_exec_init(&submit->exec, DRM_EXEC_INTERRUPTIBLE_WAIT, submit->nr_bos);
+	if (vm_bind)
+		flags |= DRM_EXEC_IGNORE_DUPLICATES;
+
+	drm_exec_init(&submit->exec, flags, submit->nr_bos);
 
 	drm_exec_until_all_locked (&submit->exec) {
 		for (unsigned i = 0; i < submit->nr_bos; i++) {
 			struct drm_gem_object *obj = submit->bos[i].obj;
+
+			if (!obj)
+				continue;
+
 			ret = drm_exec_prepare_obj(&submit->exec, obj, 1);
 			drm_exec_retry_on_contention(&submit->exec);
 			if (ret)
@@ -372,6 +401,28 @@ static int submit_pin_vmas(struct msm_gem_submit *submit)
 	return ret;
 }
 
+static int submit_get_pages(struct msm_gem_submit *submit)
+{
+	/*
+	 * First loop, before holding the LRU lock, avoids holding the
+	 * LRU lock while calling msm_gem_pin_vma_locked (which could
+	 * trigger get_pages())
+	 */
+	for (int i = 0; i < submit->nr_bos; i++) {
+		struct drm_gem_object *obj = submit->bos[i].obj;
+		struct page **pages;
+
+		if (!obj)
+			continue;
+
+		pages = msm_gem_get_pages_locked(obj, MSM_MADV_WILLNEED);
+		if (IS_ERR(pages))
+			return PTR_ERR(pages);
+	}
+
+	return 0;
+}
+
 static void submit_pin_objects(struct msm_gem_submit *submit)
 {
 	struct msm_drm_private *priv = submit->dev->dev_private;
@@ -385,7 +436,12 @@ static void submit_pin_objects(struct msm_gem_submit *submit)
 	 */
 	mutex_lock(&priv->lru.lock);
 	for (int i = 0; i < submit->nr_bos; i++) {
-		msm_gem_pin_obj_locked(submit->bos[i].obj);
+		struct drm_gem_object *obj = submit->bos[i].obj;
+
+		if (!obj)
+			continue;
+
+		msm_gem_pin_obj_locked(obj);
 	}
 	mutex_unlock(&priv->lru.lock);
 
@@ -400,6 +456,9 @@ static void submit_unpin_objects(struct msm_gem_submit *submit)
 	for (int i = 0; i < submit->nr_bos; i++) {
 		struct drm_gem_object *obj = submit->bos[i].obj;
 
+		if (!obj)
+			continue;
+
 		msm_gem_unpin_locked(obj);
 	}
 
@@ -413,6 +472,9 @@ static void submit_attach_object_fences(struct msm_gem_submit *submit)
 	for (i = 0; i < submit->nr_bos; i++) {
 		struct drm_gem_object *obj = submit->bos[i].obj;
 
+		if (!obj)
+			continue;
+
 		if (submit->bos[i].flags & MSM_SUBMIT_BO_WRITE)
 			dma_resv_add_fence(obj->resv, submit->user_fence,
 					   DMA_RESV_USAGE_WRITE);
@@ -708,6 +770,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	struct msm_ringbuffer *ring;
 	struct msm_submit_post_dep *post_deps = NULL;
 	struct drm_syncobj **syncobjs_to_reset = NULL;
+	unsigned cmds_to_parse;
 	int out_fence_fd = -1;
 	unsigned i;
 	int ret;
@@ -724,9 +787,6 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	if (MSM_PIPE_ID(args->flags) != MSM_PIPE_3D0)
 		return UERR(EINVAL, dev, "invalid pipe");
 
-	if (MSM_PIPE_FLAGS(args->flags) & ~MSM_SUBMIT_EXEC_FLAGS)
-		return UERR(EINVAL, dev, "invalid flags");
-
 	if (args->flags & MSM_SUBMIT_SUDO) {
 		if (!IS_ENABLED(CONFIG_DRM_MSM_GPU_SUDO) ||
 		    !capable(CAP_SYS_RAWIO))
@@ -737,6 +797,26 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	if (!queue)
 		return -ENOENT;
 
+	if (queue->flags & MSM_SUBMITQUEUE_VM_BIND) {
+		if (args->nr_cmds || args->cmds) {
+			ret = UERR(EINVAL, dev, "nr_cmds should be zero for VM_BIND queue");
+			goto out_post_unlock;
+		}
+		if (MSM_PIPE_FLAGS(args->flags) & ~MSM_SUBMIT_VM_BIND_FLAGS) {
+			ret = UERR(EINVAL, dev, "invalid flags");
+			goto out_post_unlock;
+		}
+	} else {
+		if (msm_context_is_vmbind(ctx) && (args->nr_bos || args->bos)) {
+			ret = UERR(EINVAL, dev, "nr_bos should be zero for VM_BIND contexts");
+			goto out_post_unlock;
+		}
+		if (MSM_PIPE_FLAGS(args->flags) & ~MSM_SUBMIT_EXEC_FLAGS) {
+			ret = UERR(EINVAL, dev, "invalid flags");
+			goto out_post_unlock;
+		}
+	}
+
 	ring = gpu->rb[queue->ring_nr];
 
 	if (args->flags & MSM_SUBMIT_FENCE_FD_OUT) {
@@ -813,19 +893,37 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	if (ret)
 		goto out;
 
-	if (!(args->flags & MSM_SUBMIT_NO_IMPLICIT)) {
+	if (msm_context_is_vmbind(ctx) && !submit_is_vmbind(submit)) {
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
+	if (!(args->flags & MSM_SUBMIT_NO_IMPLICIT) && !submit_is_vmbind(submit)) {
 		ret = submit_fence_sync(submit);
 		if (ret)
 			goto out;
 	}
 
-	ret = submit_pin_vmas(submit);
+	if (submit_is_vmbind(submit)) {
+		ret = submit_get_pages(submit);
+	} else {
+		ret = submit_pin_vmas(submit);
+	}
 	if (ret)
 		goto out;
 
 	submit_pin_objects(submit);
 
-	for (i = 0; i < args->nr_cmds; i++) {
+	cmds_to_parse = msm_context_is_vmbind(ctx) ? 0 : args->nr_cmds;
+
+	for (i = 0; i < cmds_to_parse; i++) {
 		struct drm_gem_object *obj;
 		uint64_t iova;
 
@@ -856,7 +954,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 			goto out;
 	}
 
-	submit->nr_cmds = i;
+	submit->nr_cmds = args->nr_cmds;
 
 	idr_preload(GFP_KERNEL);
 
diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 0bc22618e9f0..8c780dd6a936 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -162,6 +162,70 @@ static const struct drm_gpuvm_ops msm_gpuvm_ops = {
 	.vm_free = msm_gem_vm_free,
 };
 
+static int
+run_bo_op(struct msm_gem_submit *submit, const struct msm_gem_submit_bo *bo)
+{
+	unsigned op = bo->flags & MSM_SUBMIT_BO_OP_MASK;
+
+	switch (op) {
+	case MSM_SUBMIT_BO_OP_MAP:
+	case MSM_SUBMIT_BO_OP_MAP_NULL:
+		return drm_gpuvm_sm_map(submit->vm, submit->vm, bo->iova,
+					bo->range, bo->obj, bo->bo_offset);
+		break;
+	case MSM_SUBMIT_BO_OP_UNMAP:
+		return drm_gpuvm_sm_unmap(submit->vm, submit->vm, bo->iova,
+					  bo->bo_offset);
+	}
+
+	return -EINVAL;
+}
+
+static struct dma_fence *
+msm_vma_job_run(struct drm_sched_job *job)
+{
+	struct msm_gem_submit *submit = to_msm_submit(job);
+
+	for (unsigned i = 0; i < submit->nr_bos; i++) {
+		int ret = run_bo_op(submit, &submit->bos[i]);
+		if (ret) {
+			to_msm_vm(submit->vm)->unusable = true;
+			return ERR_PTR(ret);
+		}
+	}
+
+	/* VM_BIND ops run on CPU, so we are done now: */
+	msm_submit_retire(submit);
+
+	for (int i = 0; i < submit->nr_bos; i++) {
+		struct drm_gem_object *obj = submit->bos[i].obj;
+
+		if (!obj)
+			continue;
+
+		msm_gem_lock(obj);
+		msm_gem_unpin_locked(obj);
+		msm_gem_unlock(obj);
+	}
+
+	/* VM_BIND ops are synchronous, so no fence to wait on: */
+	return NULL;
+}
+
+static void
+msm_vma_job_free(struct drm_sched_job *job)
+{
+	struct msm_gem_submit *submit = to_msm_submit(job);
+
+	drm_sched_job_cleanup(job);
+	msm_gem_submit_put(submit);
+}
+
+static const struct drm_sched_backend_ops msm_vm_bind_ops = {
+	.run_job = msm_vma_job_run,
+	.free_job = msm_vma_job_free
+};
+
 /**
  * msm_gem_vm_create() - Create and initialize a &msm_gem_vm
  * @drm: the drm device
@@ -198,6 +262,21 @@ msm_gem_vm_create(struct drm_device *drm, struct msm_mmu *mmu, const char *name,
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
@@ -212,8 +291,36 @@ msm_gem_vm_create(struct drm_device *drm, struct msm_mmu *mmu, const char *name,
 
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
+
+	/*
+	 * For kernel managed VMs, the VMAs are torn down when the handle is
+	 * closed, so nothing more to do.
+	 */
+	if (vm->managed)
+		return;
+
+	/* Kill the scheduler now, so we aren't racing with it for cleanup: */
+	drm_sched_stop(&vm->sched, NULL);
+	drm_sched_fini(&vm->sched);
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
index 1a948d49c610..39b55c8d7413 100644
--- a/include/uapi/drm/msm_drm.h
+++ b/include/uapi/drm/msm_drm.h
@@ -404,12 +404,19 @@ struct drm_msm_gem_madvise {
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
2.48.1

