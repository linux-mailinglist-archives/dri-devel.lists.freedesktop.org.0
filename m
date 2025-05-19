Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89180ABC676
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 19:58:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEC6910E481;
	Mon, 19 May 2025 17:58:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="g843Sbjo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33B4610E4B2;
 Mon, 19 May 2025 17:58:47 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id
 d2e1a72fcca58-73c17c770a7so5119991b3a.2; 
 Mon, 19 May 2025 10:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747677526; x=1748282326; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=whvnaJKbd/LuG/OjoM3gFUtfFgomP7fEf6PbLtO81yk=;
 b=g843SbjoGpN9OCbig7wZ2IUkVp3DtLd/QL4gp6myo3lLeCQPgEMnM8qwWF4LJHgsZi
 FFy/MVbU+TtwteHLnpJLZqJZJF8jyoNCU74tlnVWWggbEVhkuRNeMsOrfgmgn/t+/Od9
 1AiYTsf7pfU+VEWL+wSKtgNMH+0x4Jrbm7TcsCA0nD1+DtwQ0UrQuA00dfXs74uYdC7S
 6QNBEUf3GgRCp2+GR69S/2hhcrbq1gnTC67yuI5MxHAucSfyYsOtubiCjDL8/6LDljWC
 n0DoxaLyIamnViQle33o0kggQgOh7lfzLd2/sD3w07Tj0nEMuxXyzg2JJ7R5jXVEh6Iv
 vVXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747677526; x=1748282326;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=whvnaJKbd/LuG/OjoM3gFUtfFgomP7fEf6PbLtO81yk=;
 b=KEiJNeLB5HfI919ViA86nk69UAAr4mCsb6upEluf9e6vQf2tOt+DsrG0Uuqhgudlhu
 O0kcgrxuCGbQhNHPuMPsW34xL0yWZROX+KCWHmeCLPDm/V/utyNHkLZUd2YLwIaw4WcO
 3hP/i0lvfepXczruzVyw/L4MYAmVTT4yil+ocz7xaqeHT8P27mW6J/aMpBXJgVjqanPH
 8ct5lc65VIbQImeqeF2hqt0+CZlFoqGTxJBp3L5SL1Qr54uEStw/ad8/quf59pOqg0mO
 416+xi5rA1w1EV+PF1IJlwY6Ex80MDfDtwuSW9QBcNRFNJb0chD8rwFPTvCxBBVa7qaW
 yoFw==
X-Gm-Message-State: AOJu0YxBTGtWR4t2HTUfUWprvpM53Wb1PngsjdETkK/7V2uPFDfOULq/
 5S2JGSAF74usYlIkWdrYVvUR7Q1zoiiawpzrSjvZZFt2pn1npSb+D+++vRrn1g==
X-Gm-Gg: ASbGncvRPDeh5+T3I/bv10vVpO1hnKerLzlcwZ9f4/dk4vHlFCMO0gVlcyZn9Q1/LH/
 qVUz3P1jZSiiRmVbe6Gco4SMWUaN1h4leo6RMB/IaoUs3xDsXPspJ/h6erASK6TJ9r27tcNghhZ
 mKlnJsd+iuGX9OQTAorOqQdO75AoONLxI6fINlZaIt2U9KIXPdZXWTCULBSwVO5r5ZbMgFmqOCT
 S4cGblls9KZlGrAw8uih1WCSZuq0t3tBela8H7GL2Z/MYPJtbV/pWipVw+zMw8RB9/1xsaCnLug
 9SLshLQNxd4ajPTH87dQOZEPhQCgJJm/KiCF++breavZmhlLJuPqxJJr8PFcyb2lnfiF1kK3mfE
 6GwIBG0HUBC5I80Q/pSDp2c6SJw==
X-Google-Smtp-Source: AGHT+IHGTGmdC4oymPjcXcSZInpeJnfRTIRYkGizCUsh3QwicMtfBlmBDPiJZgnUL+t3WkAkrwdFQg==
X-Received: by 2002:a17:90b:56cc:b0:30e:3338:8c0e with SMTP id
 98e67ed59e1d1-30e7d5a8b5amr20639074a91.27.1747677525677; 
 Mon, 19 May 2025 10:58:45 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-30f2f6602f0sm219249a91.0.2025.05.19.10.58.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 May 2025 10:58:45 -0700 (PDT)
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
Subject: [PATCH v5 35/40] drm/msm: Add VM_BIND ioctl
Date: Mon, 19 May 2025 10:57:32 -0700
Message-ID: <20250519175755.13037-23-robdclark@gmail.com>
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

Add a VM_BIND ioctl for binding/unbinding buffers into a VM.  This is
only supported if userspace has opted in to MSM_PARAM_EN_VM_BIND.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_drv.c        |    1 +
 drivers/gpu/drm/msm/msm_drv.h        |    4 +-
 drivers/gpu/drm/msm/msm_gem.c        |   40 +-
 drivers/gpu/drm/msm/msm_gem.h        |    4 +
 drivers/gpu/drm/msm/msm_gem_submit.c |   22 +-
 drivers/gpu/drm/msm/msm_gem_vma.c    | 1073 +++++++++++++++++++++++++-
 include/uapi/drm/msm_drm.h           |   74 +-
 7 files changed, 1185 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 89cb7820064f..bdf775897de8 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -791,6 +791,7 @@ static const struct drm_ioctl_desc msm_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(MSM_SUBMITQUEUE_NEW,   msm_ioctl_submitqueue_new,   DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(MSM_SUBMITQUEUE_CLOSE, msm_ioctl_submitqueue_close, DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(MSM_SUBMITQUEUE_QUERY, msm_ioctl_submitqueue_query, DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(MSM_VM_BIND,      msm_ioctl_vm_bind,      DRM_RENDER_ALLOW),
 };
 
 static void msm_show_fdinfo(struct drm_printer *p, struct drm_file *file)
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index b0add236cbb3..33240afc6365 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -232,7 +232,9 @@ struct drm_gpuvm *msm_kms_init_vm(struct drm_device *dev);
 bool msm_use_mmu(struct drm_device *dev);
 
 int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
-		struct drm_file *file);
+			 struct drm_file *file);
+int msm_ioctl_vm_bind(struct drm_device *dev, void *data,
+		      struct drm_file *file);
 
 #ifdef CONFIG_DEBUG_FS
 unsigned long msm_gem_shrinker_shrink(struct drm_device *dev, unsigned long nr_to_scan);
diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index cf509ca42da0..040f0539baa5 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -233,8 +233,7 @@ static void put_pages(struct drm_gem_object *obj)
 	}
 }
 
-static struct page **msm_gem_get_pages_locked(struct drm_gem_object *obj,
-					      unsigned madv)
+struct page **msm_gem_get_pages_locked(struct drm_gem_object *obj, unsigned madv)
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 
@@ -1036,18 +1035,37 @@ static void msm_gem_free_object(struct drm_gem_object *obj)
 	/*
 	 * We need to lock any VMs the object is still attached to, but not
 	 * the object itself (see explaination in msm_gem_assert_locked()),
-	 * so just open-code this special case:
+	 * so just open-code this special case.
+	 *
+	 * Note that we skip the dance if we aren't attached to any VM.  This
+	 * is load bearing.  The driver needs to support two usage models:
+	 *
+	 * 1. Legacy kernel managed VM: Userspace expects the VMA's to be
+	 *    implicitly torn down when the object is freed, the VMA's do
+	 *    not hold a hard reference to the BO.
+	 *
+	 * 2. VM_BIND, userspace managed VM: The VMA holds a reference to the
+	 *    BO.  This can be dropped when the VM is closed and it's associated
+	 *    VMAs are torn down.  (See msm_gem_vm_close()).
+	 *
+	 * In the latter case the last reference to a BO can be dropped while
+	 * we already have the VM locked.  It would have already been removed
+	 * from the gpuva list, but lockdep doesn't know that.  Or understand
+	 * the differences between the two usage models.
 	 */
-	drm_exec_init(&exec, 0, 0);
-	drm_exec_until_all_locked (&exec) {
-		struct drm_gpuvm_bo *vm_bo;
-		drm_gem_for_each_gpuvm_bo (vm_bo, obj) {
-			drm_exec_lock_obj(&exec, drm_gpuvm_resv_obj(vm_bo->vm));
-			drm_exec_retry_on_contention(&exec);
+	if (!list_empty(&obj->gpuva.list)) {
+		drm_exec_init(&exec, 0, 0);
+		drm_exec_until_all_locked (&exec) {
+			struct drm_gpuvm_bo *vm_bo;
+			drm_gem_for_each_gpuvm_bo (vm_bo, obj) {
+				drm_exec_lock_obj(&exec,
+						  drm_gpuvm_resv_obj(vm_bo->vm));
+				drm_exec_retry_on_contention(&exec);
+			}
 		}
+		put_iova_spaces(obj, NULL, true);
+		drm_exec_fini(&exec);     /* drop locks */
 	}
-	put_iova_spaces(obj, NULL, true);
-	drm_exec_fini(&exec);     /* drop locks */
 
 	if (obj->import_attach) {
 		GEM_WARN_ON(msm_obj->vaddr);
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 8ad25927c604..bfeb0f584ae5 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -73,6 +73,9 @@ struct msm_gem_vm {
 	/** @mmu: The mmu object which manages the pgtables */
 	struct msm_mmu *mmu;
 
+	/** @mmu_lock: Protects access to the mmu */
+	struct mutex mmu_lock;
+
 	/**
 	 * @pid: For address spaces associated with a specific process, this
 	 * will be non-NULL:
@@ -205,6 +208,7 @@ int msm_gem_get_and_pin_iova(struct drm_gem_object *obj, struct drm_gpuvm *vm,
 			     uint64_t *iova);
 void msm_gem_unpin_iova(struct drm_gem_object *obj, struct drm_gpuvm *vm);
 void msm_gem_pin_obj_locked(struct drm_gem_object *obj);
+struct page **msm_gem_get_pages_locked(struct drm_gem_object *obj, unsigned madv);
 struct page **msm_gem_pin_pages_locked(struct drm_gem_object *obj);
 void msm_gem_unpin_pages_locked(struct drm_gem_object *obj);
 int msm_gem_dumb_create(struct drm_file *file, struct drm_device *dev,
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 053e6c65780f..9809918d8eb4 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -193,6 +193,7 @@ static int submit_lookup_objects(struct msm_gem_submit *submit,
 static int submit_lookup_cmds(struct msm_gem_submit *submit,
 		struct drm_msm_gem_submit *args, struct drm_file *file)
 {
+	struct msm_context *ctx = file->driver_priv;
 	unsigned i;
 	size_t sz;
 	int ret = 0;
@@ -224,6 +225,20 @@ static int submit_lookup_cmds(struct msm_gem_submit *submit,
 			goto out;
 		}
 
+		if (msm_context_is_vmbind(ctx)) {
+			if (submit_cmd.nr_relocs) {
+				ret = SUBMIT_ERROR(EINVAL, submit, "nr_relocs must be zero");
+				goto out;
+			}
+
+			if (submit_cmd.submit_idx || submit_cmd.submit_offset) {
+				ret = SUBMIT_ERROR(EINVAL, submit, "submit_idx/offset must be zero");
+				goto out;
+			}
+
+			submit->cmd[i].iova = submit_cmd.iova;
+		}
+
 		submit->cmd[i].type = submit_cmd.type;
 		submit->cmd[i].size = submit_cmd.size / 4;
 		submit->cmd[i].offset = submit_cmd.submit_offset / 4;
@@ -527,6 +542,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	struct msm_syncobj_post_dep *post_deps = NULL;
 	struct drm_syncobj **syncobjs_to_reset = NULL;
 	struct sync_file *sync_file = NULL;
+	unsigned cmds_to_parse;
 	int out_fence_fd = -1;
 	unsigned i;
 	int ret;
@@ -650,7 +666,9 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	if (ret)
 		goto out;
 
-	for (i = 0; i < args->nr_cmds; i++) {
+	cmds_to_parse = msm_context_is_vmbind(ctx) ? 0 : args->nr_cmds;
+
+	for (i = 0; i < cmds_to_parse; i++) {
 		struct drm_gem_object *obj;
 		uint64_t iova;
 
@@ -681,7 +699,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 			goto out;
 	}
 
-	submit->nr_cmds = i;
+	submit->nr_cmds = args->nr_cmds;
 
 	idr_preload(GFP_KERNEL);
 
diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index a105aed82cae..fe41b7a042c3 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -4,9 +4,16 @@
  * Author: Rob Clark <robdclark@gmail.com>
  */
 
+#include "drm/drm_file.h"
+#include "drm/msm_drm.h"
+#include "linux/file.h"
+#include "linux/sync_file.h"
+
 #include "msm_drv.h"
 #include "msm_gem.h"
+#include "msm_gpu.h"
 #include "msm_mmu.h"
+#include "msm_syncobj.h"
 
 #define vm_dbg(fmt, ...) pr_debug("%s:%d: "fmt"\n", __func__, __LINE__, ##__VA_ARGS__)
 
@@ -36,6 +43,97 @@ struct msm_vm_unmap_op {
 	uint64_t range;
 };
 
+/**
+ * struct msm_vma_op - A MAP or UNMAP operation
+ */
+struct msm_vm_op {
+	/** @op: The operation type */
+	enum {
+		MSM_VM_OP_MAP = 1,
+		MSM_VM_OP_UNMAP,
+	} op;
+	union {
+		/** @map: Parameters used if op == MSM_VMA_OP_MAP */
+		struct msm_vm_map_op map;
+		/** @unmap: Parameters used if op == MSM_VMA_OP_UNMAP */
+		struct msm_vm_unmap_op unmap;
+	};
+	/** @node: list head in msm_vm_bind_job::vm_ops */
+	struct list_head node;
+
+	/**
+	 * @obj: backing object for pages to be mapped/unmapped
+	 *
+	 * Async unmap ops, in particular, must hold a reference to the
+	 * original GEM object backing the mapping that will be unmapped.
+	 * But the same can be required in the map path, for example if
+	 * there is not a corresponding unmap op, such as process exit.
+	 *
+	 * This ensures that the pages backing the mapping are not freed
+	 * before the mapping is torn down.
+	 */
+	struct drm_gem_object *obj;
+};
+
+/**
+ * struct msm_vm_bind_job - Tracking for a VM_BIND ioctl
+ *
+ * A table of userspace requested VM updates (MSM_VM_BIND_OP_UNMAP/MAP/MAP_NULL)
+ * gets applied to the vm, generating a list of VM ops (MSM_VM_OP_MAP/UNMAP)
+ * which are applied to the pgtables asynchronously.  For example a userspace
+ * requested MSM_VM_BIND_OP_MAP could end up generating both an MSM_VM_OP_UNMAP
+ * to unmap an existing mapping, and a MSM_VM_OP_MAP to apply the new mapping.
+ */
+struct msm_vm_bind_job {
+	/** @base: base class for drm_sched jobs */
+	struct drm_sched_job base;
+	/** @vm: The VM being operated on */
+	struct drm_gpuvm *vm;
+	/** @fence: The fence that is signaled when job completes */
+	struct dma_fence *fence;
+	/** @queue: The queue that the job runs on */
+	struct msm_gpu_submitqueue *queue;
+	/** @prealloc: Tracking for pre-allocated MMU pgtable pages */
+	struct msm_mmu_prealloc prealloc;
+	/** @vm_ops: a list of struct msm_vm_op */
+	struct list_head vm_ops;
+	/** @bos_pinned: are the GEM objects being bound pinned? */
+	bool bos_pinned;
+	/** @nr_ops: the number of userspace requested ops */
+	unsigned int nr_ops;
+	/**
+	 * @ops: the userspace requested ops
+	 *
+	 * The userspace requested ops are copied/parsed and validated
+	 * before we start applying the updates to try to do as much up-
+	 * front error checking as possible, to avoid the VM being in an
+	 * undefined state due to partially executed VM_BIND.
+	 *
+	 * This table also serves to hold a reference to the backing GEM
+	 * objects.
+	 */
+	struct msm_vm_bind_op {
+		uint32_t op;
+		uint32_t flags;
+		union {
+			struct drm_gem_object *obj;
+			uint32_t handle;
+		};
+		uint64_t obj_offset;
+		uint64_t iova;
+		uint64_t range;
+	} ops[];
+};
+
+#define job_foreach_bo(obj, _job) \
+	for (unsigned i = 0; i < (_job)->nr_ops; i++) \
+		if ((obj = (_job)->ops[i].obj))
+
+static inline struct msm_vm_bind_job *to_msm_vm_bind_job(struct drm_sched_job *job)
+{
+	return container_of(job, struct msm_vm_bind_job, base);
+}
+
 static void
 msm_gem_vm_free(struct drm_gpuvm *gpuvm)
 {
@@ -52,6 +150,9 @@ msm_gem_vm_free(struct drm_gpuvm *gpuvm)
 static void
 vm_unmap_op(struct msm_gem_vm *vm, const struct msm_vm_unmap_op *op)
 {
+	if (!vm->managed)
+		lockdep_assert_held(&vm->mmu_lock);
+
 	vm_dbg("%p: %016llx %016llx", vm, op->iova, op->iova + op->range);
 
 	vm->mmu->funcs->unmap(vm->mmu, op->iova, op->range);
@@ -60,6 +161,9 @@ vm_unmap_op(struct msm_gem_vm *vm, const struct msm_vm_unmap_op *op)
 static int
 vm_map_op(struct msm_gem_vm *vm, const struct msm_vm_map_op *op)
 {
+	if (!vm->managed)
+		lockdep_assert_held(&vm->mmu_lock);
+
 	vm_dbg("%p: %016llx %016llx", vm, op->iova, op->iova + op->range);
 
 	return vm->mmu->funcs->map(vm->mmu, op->iova, op->sgt, op->offset,
@@ -69,17 +173,29 @@ vm_map_op(struct msm_gem_vm *vm, const struct msm_vm_map_op *op)
 /* Actually unmap memory for the vma */
 void msm_gem_vma_unmap(struct drm_gpuva *vma)
 {
+	struct msm_gem_vm *vm = to_msm_vm(vma->vm);
 	struct msm_gem_vma *msm_vma = to_msm_vma(vma);
 
 	/* Don't do anything if the memory isn't mapped */
 	if (!msm_vma->mapped)
 		return;
 
-	vm_unmap_op(to_msm_vm(vma->vm), &(struct msm_vm_unmap_op){
+	/*
+	 * The mmu_lock is only needed when preallocation is used.  But
+	 * in that case we don't need to worry about recursion into
+	 * shrinker
+	 */
+	if (!vm->managed)
+		 mutex_lock(&vm->mmu_lock);
+
+	vm_unmap_op(vm, &(struct msm_vm_unmap_op){
 		.iova = vma->va.addr,
 		.range = vma->va.range,
 	});
 
+	if (!vm->managed)
+		mutex_unlock(&vm->mmu_lock);
+
 	msm_vma->mapped = false;
 }
 
@@ -87,6 +203,7 @@ void msm_gem_vma_unmap(struct drm_gpuva *vma)
 int
 msm_gem_vma_map(struct drm_gpuva *vma, int prot, struct sg_table *sgt)
 {
+	struct msm_gem_vm *vm = to_msm_vm(vma->vm);
 	struct msm_gem_vma *msm_vma = to_msm_vma(vma);
 	int ret;
 
@@ -98,6 +215,14 @@ msm_gem_vma_map(struct drm_gpuva *vma, int prot, struct sg_table *sgt)
 
 	msm_vma->mapped = true;
 
+	/*
+	 * The mmu_lock is only needed when preallocation is used.  But
+	 * in that case we don't need to worry about recursion into
+	 * shrinker
+	 */
+	if (!vm->managed)
+		mutex_lock(&vm->mmu_lock);
+
 	/*
 	 * NOTE: iommu/io-pgtable can allocate pages, so we cannot hold
 	 * a lock across map/unmap which is also used in the job_run()
@@ -107,16 +232,19 @@ msm_gem_vma_map(struct drm_gpuva *vma, int prot, struct sg_table *sgt)
 	 * Revisit this if we can come up with a scheme to pre-alloc pages
 	 * for the pgtable in map/unmap ops.
 	 */
-	ret = vm_map_op(to_msm_vm(vma->vm), &(struct msm_vm_map_op){
+	ret = vm_map_op(vm, &(struct msm_vm_map_op){
 		.iova = vma->va.addr,
 		.range = vma->va.range,
 		.offset = vma->gem.offset,
 		.sgt = sgt,
 		.prot = prot,
 	});
-	if (ret) {
+
+	if (!vm->managed)
+		mutex_unlock(&vm->mmu_lock);
+
+	if (ret)
 		msm_vma->mapped = false;
-	}
 
 	return ret;
 }
@@ -131,6 +259,9 @@ void msm_gem_vma_close(struct drm_gpuva *vma)
 
 	drm_gpuvm_resv_assert_held(&vm->base);
 
+	if (vma->gem.obj)
+		msm_gem_assert_locked(vma->gem.obj);
+
 	if (vma->va.addr && vm->managed)
 		drm_mm_remove_node(&msm_vma->node);
 
@@ -158,6 +289,7 @@ msm_gem_vma_new(struct drm_gpuvm *gpuvm, struct drm_gem_object *obj,
 
 	if (vm->managed) {
 		BUG_ON(offset != 0);
+		BUG_ON(!obj);  /* NULL mappings not valid for kernel managed VM */
 		ret = drm_mm_insert_node_in_range(&vm->mm, &vma->node,
 						obj->size, PAGE_SIZE, 0,
 						range_start, range_end, 0);
@@ -169,7 +301,8 @@ msm_gem_vma_new(struct drm_gpuvm *gpuvm, struct drm_gem_object *obj,
 		range_end   = range_start + obj->size;
 	}
 
-	GEM_WARN_ON((range_end - range_start) > obj->size);
+	if (obj)
+		GEM_WARN_ON((range_end - range_start) > obj->size);
 
 	drm_gpuva_init(&vma->base, range_start, range_end - range_start, obj, offset);
 	vma->mapped = false;
@@ -178,6 +311,9 @@ msm_gem_vma_new(struct drm_gpuvm *gpuvm, struct drm_gem_object *obj,
 	if (ret)
 		goto err_free_range;
 
+	if (!obj)
+		return &vma->base;
+
 	vm_bo = drm_gpuvm_bo_obtain(&vm->base, obj);
 	if (IS_ERR(vm_bo)) {
 		ret = PTR_ERR(vm_bo);
@@ -200,11 +336,297 @@ msm_gem_vma_new(struct drm_gpuvm *gpuvm, struct drm_gem_object *obj,
 	return ERR_PTR(ret);
 }
 
+static int
+msm_gem_vm_bo_validate(struct drm_gpuvm_bo *vm_bo, struct drm_exec *exec)
+{
+	struct drm_gem_object *obj = vm_bo->obj;
+	struct drm_gpuva *vma;
+	int ret;
+
+	vm_dbg("validate: %p", obj);
+
+	msm_gem_assert_locked(obj);
+
+	drm_gpuvm_bo_for_each_va (vma, vm_bo) {
+		ret = msm_gem_pin_vma_locked(obj, vma);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+struct op_arg {
+	unsigned flags;
+	struct msm_vm_bind_job *job;
+};
+
+static void
+vm_op_enqueue(struct op_arg *arg, struct msm_vm_op _op)
+{
+	struct msm_vm_op *op = kmalloc(sizeof(*op), GFP_KERNEL);
+	*op = _op;
+	list_add_tail(&op->node, &arg->job->vm_ops);
+
+	if (op->obj)
+		drm_gem_object_get(op->obj);
+}
+
+static struct drm_gpuva *
+vma_from_op(struct op_arg *arg, struct drm_gpuva_op_map *op)
+{
+	return msm_gem_vma_new(arg->job->vm, op->gem.obj, op->gem.offset,
+			       op->va.addr, op->va.addr + op->va.range);
+}
+
+static int
+msm_gem_vm_sm_step_map(struct drm_gpuva_op *op, void *arg)
+{
+	struct drm_gem_object *obj = op->map.gem.obj;
+	struct drm_gpuva *vma;
+	struct sg_table *sgt;
+	unsigned prot;
+
+	vma = vma_from_op(arg, &op->map);
+	if (WARN_ON(IS_ERR(vma)))
+		return PTR_ERR(vma);
+
+	vm_dbg("%p:%p:%p: %016llx %016llx", vma->vm, vma, vma->gem.obj,
+	       vma->va.addr, vma->va.range);
+
+	vma->flags = ((struct op_arg *)arg)->flags;
+
+	if (obj) {
+		sgt = to_msm_bo(obj)->sgt;
+		prot = msm_gem_prot(obj);
+	} else {
+		sgt = NULL;
+		prot = IOMMU_READ | IOMMU_WRITE;
+	}
+
+	vm_op_enqueue(arg, (struct msm_vm_op){
+		.op = MSM_VM_OP_MAP,
+		.map = {
+			.sgt = sgt,
+			.iova = vma->va.addr,
+			.range = vma->va.range,
+			.offset = vma->gem.offset,
+			.prot = prot,
+		},
+		.obj = vma->gem.obj,
+	});
+
+	to_msm_vma(vma)->mapped = true;
+
+	return 0;
+}
+
+static int
+msm_gem_vm_sm_step_remap(struct drm_gpuva_op *op, void *arg)
+{
+	struct msm_vm_bind_job *job = ((struct op_arg *)arg)->job;
+	struct drm_gpuvm *vm = job->vm;
+	struct drm_gpuva *orig_vma = op->remap.unmap->va;
+	struct drm_gpuva *prev_vma = NULL, *next_vma = NULL;
+	struct drm_gpuvm_bo *vm_bo = orig_vma->vm_bo;
+	bool mapped = to_msm_vma(orig_vma)->mapped;
+	unsigned flags;
+
+	vm_dbg("orig_vma: %p:%p:%p: %016llx %016llx", vm, orig_vma,
+	       orig_vma->gem.obj, orig_vma->va.addr, orig_vma->va.range);
+
+	if (mapped) {
+		uint64_t unmap_start, unmap_range;
+
+		drm_gpuva_op_remap_to_unmap_range(&op->remap, &unmap_start, &unmap_range);
+
+		vm_op_enqueue(arg, (struct msm_vm_op){
+			.op = MSM_VM_OP_UNMAP,
+			.unmap = {
+				.iova = unmap_start,
+				.range = unmap_range,
+			},
+			.obj = orig_vma->gem.obj,
+		});
+
+		/*
+		 * Part of this GEM obj is still mapped, but we're going to kill the
+		 * existing VMA and replace it with one or two new ones (ie. two if
+		 * the unmapped range is in the middle of the existing (unmap) VMA).
+		 * So just set the state to unmapped:
+		 */
+		to_msm_vma(orig_vma)->mapped = false;
+	}
+
+	/*
+	 * Hold a ref to the vm_bo between the msm_gem_vma_close() and the
+	 * creation of the new prev/next vma's, in case the vm_bo is tracked
+	 * in the VM's evict list:
+	 */
+	if (vm_bo)
+		drm_gpuvm_bo_get(vm_bo);
+
+	/*
+	 * The prev_vma and/or next_vma are replacing the unmapped vma, and
+	 * therefore should preserve it's flags:
+	 */
+	flags = orig_vma->flags;
+
+	msm_gem_vma_close(orig_vma);
+
+	if (op->remap.prev) {
+		prev_vma = vma_from_op(arg, op->remap.prev);
+		if (WARN_ON(IS_ERR(prev_vma)))
+			return PTR_ERR(prev_vma);
+
+		vm_dbg("prev_vma: %p:%p: %016llx %016llx", vm, prev_vma, prev_vma->va.addr, prev_vma->va.range);
+		to_msm_vma(prev_vma)->mapped = mapped;
+		prev_vma->flags = flags;
+	}
+
+	if (op->remap.next) {
+		next_vma = vma_from_op(arg, op->remap.next);
+		if (WARN_ON(IS_ERR(next_vma)))
+			return PTR_ERR(next_vma);
+
+		vm_dbg("next_vma: %p:%p: %016llx %016llx", vm, next_vma, next_vma->va.addr, next_vma->va.range);
+		to_msm_vma(next_vma)->mapped = mapped;
+		next_vma->flags = flags;
+	}
+
+	if (!mapped)
+		drm_gpuvm_bo_evict(vm_bo, true);
+
+	/* Drop the previous ref: */
+	drm_gpuvm_bo_put(vm_bo);
+
+	return 0;
+}
+
+static int
+msm_gem_vm_sm_step_unmap(struct drm_gpuva_op *op, void *arg)
+{
+	struct drm_gpuva *vma = op->unmap.va;
+	struct msm_gem_vma *msm_vma = to_msm_vma(vma);
+
+	vm_dbg("%p:%p:%p: %016llx %016llx", vma->vm, vma, vma->gem.obj,
+	       vma->va.addr, vma->va.range);
+
+	if (!msm_vma->mapped)
+		goto out_close;
+
+	vm_op_enqueue(arg, (struct msm_vm_op){
+		.op = MSM_VM_OP_UNMAP,
+		.unmap = {
+			.iova = vma->va.addr,
+			.range = vma->va.range,
+		},
+		.obj = vma->gem.obj,
+	});
+
+	msm_vma->mapped = false;
+
+out_close:
+	msm_gem_vma_close(vma);
+
+	return 0;
+}
+
 static const struct drm_gpuvm_ops msm_gpuvm_ops = {
 	.vm_free = msm_gem_vm_free,
+	.vm_bo_validate = msm_gem_vm_bo_validate,
+	.sm_step_map = msm_gem_vm_sm_step_map,
+	.sm_step_remap = msm_gem_vm_sm_step_remap,
+	.sm_step_unmap = msm_gem_vm_sm_step_unmap,
 };
 
+static struct dma_fence *
+msm_vma_job_run(struct drm_sched_job *_job)
+{
+	struct msm_vm_bind_job *job = to_msm_vm_bind_job(_job);
+	struct msm_gem_vm *vm = to_msm_vm(job->vm);
+	struct drm_gem_object *obj;
+	int ret = vm->unusable ? -EINVAL : 0;
+
+	vm_dbg("");
+
+	mutex_lock(&vm->mmu_lock);
+	vm->mmu->prealloc = &job->prealloc;
+
+	while (!list_empty(&job->vm_ops)) {
+		struct msm_vm_op *op =
+			list_first_entry(&job->vm_ops, struct msm_vm_op, node);
+
+		switch (op->op) {
+		case MSM_VM_OP_MAP:
+			/*
+			 * On error, stop trying to map new things.. but we
+			 * still want to process the unmaps (or in particular,
+			 * the drm_gem_object_put()s)
+			 */
+			if (!ret)
+				ret = vm_map_op(vm, &op->map);
+			break;
+		case MSM_VM_OP_UNMAP:
+			vm_unmap_op(vm, &op->unmap);
+			break;
+		}
+		drm_gem_object_put(op->obj);
+		list_del(&op->node);
+		kfree(op);
+	}
+
+	vm->mmu->prealloc = NULL;
+	mutex_unlock(&vm->mmu_lock);
+
+	/*
+	 * We failed to perform at least _some_ of the pgtable updates, so
+	 * now the VM is in an undefined state.  Game over!
+	 */
+	if (ret)
+		vm->unusable = true;
+
+	job_foreach_bo (obj, job) {
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
+msm_vma_job_free(struct drm_sched_job *_job)
+{
+	struct msm_vm_bind_job *job = to_msm_vm_bind_job(_job);
+	struct msm_mmu *mmu = to_msm_vm(job->vm)->mmu;
+	struct drm_gem_object *obj;
+
+	mmu->funcs->prealloc_cleanup(mmu, &job->prealloc);
+
+	drm_sched_job_cleanup(_job);
+
+	job_foreach_bo (obj, job)
+		drm_gem_object_put(obj);
+
+	msm_submitqueue_put(job->queue);
+	dma_fence_put(job->fence);
+
+	/* In error paths, we could have unexecuted ops: */
+	while (!list_empty(&job->vm_ops)) {
+		struct msm_vm_op *op =
+			list_first_entry(&job->vm_ops, struct msm_vm_op, node);
+		list_del(&op->node);
+		kfree(op);
+	}
+
+	kfree(job);
+}
+
 static const struct drm_sched_backend_ops msm_vm_bind_ops = {
+	.run_job = msm_vma_job_run,
+	.free_job = msm_vma_job_free
 };
 
 /**
@@ -254,6 +676,7 @@ msm_gem_vm_create(struct drm_device *drm, struct msm_mmu *mmu, const char *name,
 			.ops = &msm_vm_bind_ops,
 			.num_rqs = 1,
 			.credit_limit = 1,
+			.enqueue_credit_limit = 1024,
 			.timeout = MAX_SCHEDULE_TIMEOUT,
 			.name = "msm-vm-bind",
 			.dev = drm->dev,
@@ -269,6 +692,7 @@ msm_gem_vm_create(struct drm_device *drm, struct msm_mmu *mmu, const char *name,
 	drm_gem_object_put(dummy_gem);
 
 	vm->mmu = mmu;
+	mutex_init(&vm->mmu_lock);
 	vm->managed = managed;
 
 	drm_mm_init(&vm->mm, va_start, va_size);
@@ -281,7 +705,6 @@ msm_gem_vm_create(struct drm_device *drm, struct msm_mmu *mmu, const char *name,
 err_free_vm:
 	kfree(vm);
 	return ERR_PTR(ret);
-
 }
 
 /**
@@ -297,6 +720,7 @@ msm_gem_vm_close(struct drm_gpuvm *gpuvm)
 {
 	struct msm_gem_vm *vm = to_msm_vm(gpuvm);
 	struct drm_gpuva *vma, *tmp;
+	struct drm_exec exec;
 
 	/*
 	 * For kernel managed VMs, the VMAs are torn down when the handle is
@@ -313,22 +737,635 @@ msm_gem_vm_close(struct drm_gpuvm *gpuvm)
 	drm_sched_fini(&vm->sched);
 
 	/* Tear down any remaining mappings: */
-	dma_resv_lock(drm_gpuvm_resv(gpuvm), NULL);
-	drm_gpuvm_for_each_va_safe (vma, tmp, gpuvm) {
-		struct drm_gem_object *obj = vma->gem.obj;
+	drm_exec_init(&exec, 0, 2);
+	drm_exec_until_all_locked (&exec) {
+		drm_exec_lock_obj(&exec, drm_gpuvm_resv_obj(gpuvm));
+		drm_exec_retry_on_contention(&exec);
+
+		drm_gpuvm_for_each_va_safe (vma, tmp, gpuvm) {
+			struct drm_gem_object *obj = vma->gem.obj;
+
+			/*
+			 * MSM_BO_NO_SHARE objects share the same resv as the
+			 * VM, in which case the obj is already locked:
+			 */
+			if (obj && (obj->resv == drm_gpuvm_resv(gpuvm)))
+				obj = NULL;
+
+			if (obj) {
+				drm_exec_lock_obj(&exec, obj);
+				drm_exec_retry_on_contention(&exec);
+			}
+
+			msm_gem_vma_unmap(vma);
+			msm_gem_vma_close(vma);
+
+			if (obj) {
+				drm_exec_unlock_obj(&exec, obj);
+			}
+		}
+	}
+	drm_exec_fini(&exec);
+}
+
+
+static struct msm_vm_bind_job *
+vm_bind_job_create(struct drm_device *dev, struct msm_gpu *gpu,
+		   struct msm_gpu_submitqueue *queue, uint32_t nr_ops)
+{
+	struct msm_vm_bind_job *job;
+	uint64_t sz;
+	int ret;
+
+	sz = struct_size(job, ops, nr_ops);
+
+	if (sz > SIZE_MAX)
+		return ERR_PTR(-ENOMEM);
+
+	job = kzalloc(sz, GFP_KERNEL | __GFP_NOWARN);
+	if (!job)
+		return ERR_PTR(-ENOMEM);
+
+	ret = drm_sched_job_init(&job->base, queue->entity, 1, queue);
+	if (ret) {
+		kfree(job);
+		return ERR_PTR(ret);
+	}
+
+	job->vm = msm_context_vm(dev, queue->ctx);
+	job->queue = queue;
+	INIT_LIST_HEAD(&job->vm_ops);
+
+	return job;
+}
+
+static bool invalid_alignment(uint64_t addr)
+{
+	/*
+	 * Technically this is about GPU alignment, not CPU alignment.  But
+	 * I've not seen any qcom SoC where the SMMU does not support the
+	 * CPU's smallest page size.
+	 */
+	return !PAGE_ALIGNED(addr);
+}
+
+static int
+lookup_op(struct msm_vm_bind_job *job, const struct drm_msm_vm_bind_op *op)
+{
+	struct drm_device *dev = job->vm->drm;
+	int i = job->nr_ops++;
+	int ret = 0;
+
+	job->ops[i].op = op->op;
+	job->ops[i].handle = op->handle;
+	job->ops[i].obj_offset = op->obj_offset;
+	job->ops[i].iova = op->iova;
+	job->ops[i].range = op->range;
+	job->ops[i].flags = op->flags;
+
+	if (op->flags & ~MSM_VM_BIND_OP_FLAGS)
+		ret = UERR(EINVAL, dev, "invalid flags: %x\n", op->flags);
+
+	if (invalid_alignment(op->iova))
+		ret = UERR(EINVAL, dev, "invalid address: %016llx\n", op->iova);
+
+	if (invalid_alignment(op->obj_offset))
+		ret = UERR(EINVAL, dev, "invalid bo_offset: %016llx\n", op->obj_offset);
+
+	if (invalid_alignment(op->range))
+		ret = UERR(EINVAL, dev, "invalid range: %016llx\n", op->range);
+
+
+	/*
+	 * MAP must specify a valid handle.  But the handle MBZ for
+	 * UNMAP or MAP_NULL.
+	 */
+	if (op->op == MSM_VM_BIND_OP_MAP) {
+		if (!op->handle)
+			ret = UERR(EINVAL, dev, "invalid handle\n");
+	} else if (op->handle) {
+		ret = UERR(EINVAL, dev, "handle must be zero\n");
+	}
+
+	switch (op->op) {
+	case MSM_VM_BIND_OP_MAP:
+	case MSM_VM_BIND_OP_MAP_NULL:
+	case MSM_VM_BIND_OP_UNMAP:
+		break;
+	default:
+		ret = UERR(EINVAL, dev, "invalid op: %u\n", op->op);
+		break;
+	}
+
+	return ret;
+}
+
+/*
+ * ioctl parsing, parameter validation, and GEM handle lookup
+ */
+static int
+vm_bind_job_lookup_ops(struct msm_vm_bind_job *job, struct drm_msm_vm_bind *args,
+		       struct drm_file *file, int *nr_bos)
+{
+	struct drm_device *dev = job->vm->drm;
+	int ret = 0;
+	int cnt = 0;
+
+	if (args->nr_ops == 1) {
+		/* Single op case, the op is inlined: */
+		ret = lookup_op(job, &args->op);
+	} else {
+		for (unsigned i = 0; i < args->nr_ops; i++) {
+			struct drm_msm_vm_bind_op op;
+			void __user *userptr =
+				u64_to_user_ptr(args->ops + (i * sizeof(op)));
+
+			/* make sure we don't have garbage flags, in case we hit
+			 * error path before flags is initialized:
+			 */
+			job->ops[i].flags = 0;
+
+			if (copy_from_user(&op, userptr, sizeof(op))) {
+				ret = -EFAULT;
+				break;
+			}
+
+			ret = lookup_op(job, &op);
+			if (ret)
+				break;
+		}
+	}
+
+	if (ret) {
+		job->nr_ops = 0;
+		goto out;
+	}
+
+	spin_lock(&file->table_lock);
+
+	for (unsigned i = 0; i < args->nr_ops; i++) {
+		struct drm_gem_object *obj;
+
+		if (!job->ops[i].handle) {
+			job->ops[i].obj = NULL;
+			continue;
+		}
+
+		/*
+		 * normally use drm_gem_object_lookup(), but for bulk lookup
+		 * all under single table_lock just hit object_idr directly:
+		 */
+		obj = idr_find(&file->object_idr, job->ops[i].handle);
+		if (!obj) {
+			ret = UERR(EINVAL, dev, "invalid handle %u at index %u\n", job->ops[i].handle, i);
+			goto out_unlock;
+		}
+
+		drm_gem_object_get(obj);
+
+		job->ops[i].obj = obj;
+		cnt++;
+	}
+
+	*nr_bos = cnt;
+
+out_unlock:
+	spin_unlock(&file->table_lock);
+
+out:
+	return ret;
+}
+
+static void
+prealloc_count(struct msm_vm_bind_job *job,
+	       struct msm_vm_bind_op *first,
+	       struct msm_vm_bind_op *last)
+{
+	struct msm_mmu *mmu = to_msm_vm(job->vm)->mmu;
+
+	if (!first)
+		return;
+
+	uint64_t start_iova = first->iova;
+	uint64_t end_iova = last->iova + last->range;
+
+	mmu->funcs->prealloc_count(mmu, &job->prealloc, start_iova, end_iova - start_iova);
+}
+
+static bool
+ops_are_same_pte(struct msm_vm_bind_op *first, struct msm_vm_bind_op *next)
+{
+	/*
+	 * Last level pte covers 2MB.. so we should merge two ops, from
+	 * the PoV of figuring out how much pgtable pages to pre-allocate
+	 * if they land in the same 2MB range:
+	 */
+	uint64_t pte_mask = ~(SZ_2M - 1);
+	return ((first->iova + first->range) & pte_mask) == (next->iova & pte_mask);
+}
+
+/*
+ * Determine the amount of memory to prealloc for pgtables.  For sparse images,
+ * in particular, userspace plays some tricks with the order of page mappings
+ * to get the desired swizzle pattern, resulting in a large # of tiny MAP ops.
+ * So detect when multiple MAP operations are physically contiguous, and count
+ * them as a single mapping.  Otherwise the prealloc_count() will not realize
+ * they can share pagetable pages and vastly overcount.
+ */
+static void
+vm_bind_prealloc_count(struct msm_vm_bind_job *job)
+{
+	struct msm_vm_bind_op *first = NULL, *last = NULL;
+
+	for (int i = 0; i < job->nr_ops; i++) {
+		struct msm_vm_bind_op *op = &job->ops[i];
+
+		/* We only care about MAP/MAP_NULL: */
+		if (op->op == MSM_VM_BIND_OP_UNMAP)
+			continue;
+
+		/*
+		 * If op is contiguous with last in the current range, then
+		 * it becomes the new last in the range and we continue
+		 * looping:
+		 */
+		if (last && ops_are_same_pte(last, op)) {
+			last = op;
+			continue;
+		}
+
+		/*
+		 * If op is not contiguous with the current range, flush
+		 * the current range and start anew:
+		 */
+		prealloc_count(job, first, last);
+		first = last = op;
+	}
+
+	/* Flush the remaining range: */
+	prealloc_count(job, first, last);
+
+	job->base.enqueue_credits = job->prealloc.count;
+}
+
+/*
+ * Lock VM and GEM objects
+ */
+static int
+vm_bind_job_lock_objects(struct msm_vm_bind_job *job, struct drm_exec *exec)
+{
+	struct drm_gem_object *obj;
+	int ret;
+
+	/* Lock VM and objects: */
+	drm_exec_until_all_locked(exec) {
+		ret = drm_exec_lock_obj(exec, drm_gpuvm_resv_obj(job->vm));
+		drm_exec_retry_on_contention(exec);
+		if (ret)
+			return ret;
+
+		job_foreach_bo (obj, job) {
+			ret = drm_exec_prepare_obj(exec, obj, 1);
+			drm_exec_retry_on_contention(exec);
+			if (ret)
+				return ret;
+		}
+	}
+
+	return 0;
+}
+
+/*
+ * Pin GEM objects, ensuring that we have backing pages.  Pinning will move
+ * the object to the pinned LRU so that the shrinker knows to first consider
+ * other objects for evicting.
+ */
+static int
+vm_bind_job_pin_objects(struct msm_vm_bind_job *job)
+{
+	struct drm_gem_object *obj;
+
+	/*
+	 * First loop, before holding the LRU lock, avoids holding the
+	 * LRU lock while calling msm_gem_pin_vma_locked (which could
+	 * trigger get_pages())
+	 */
+	job_foreach_bo (obj, job) {
+		struct page **pages;
+
+		pages = msm_gem_get_pages_locked(obj, MSM_MADV_WILLNEED);
+		if (IS_ERR(pages))
+			return PTR_ERR(pages);
+	}
+
+	struct msm_drm_private *priv = job->vm->drm->dev_private;
+
+	/*
+	 * A second loop while holding the LRU lock (a) avoids acquiring/dropping
+	 * the LRU lock for each individual bo, while (b) avoiding holding the
+	 * LRU lock while calling msm_gem_pin_vma_locked() (which could trigger
+	 * get_pages() which could trigger reclaim.. and if we held the LRU lock
+	 * could trigger deadlock with the shrinker).
+	 */
+	mutex_lock(&priv->lru.lock);
+	job_foreach_bo (obj, job)
+		msm_gem_pin_obj_locked(obj);
+	mutex_unlock(&priv->lru.lock);
+
+	job->bos_pinned = true;
+
+	return 0;
+}
+
+/*
+ * Unpin GEM objects.  Normally this is done after the bind job is run.
+ */
+static void
+vm_bind_job_unpin_objects(struct msm_vm_bind_job *job)
+{
+	struct drm_gem_object *obj;
+
+	if (!job->bos_pinned)
+		return;
+
+	job_foreach_bo (obj, job)
+		msm_gem_unpin_locked(obj);
 
-		if (obj && obj->resv != drm_gpuvm_resv(gpuvm)) {
-			drm_gem_object_get(obj);
-			msm_gem_lock(obj);
+	job->bos_pinned = false;
+}
+
+/*
+ * Pre-allocate pgtable memory, and translate the VM bind requests into a
+ * sequence of pgtable updates to be applied asynchronously.
+ */
+static int
+vm_bind_job_prepare(struct msm_vm_bind_job *job)
+{
+	struct msm_gem_vm *vm = to_msm_vm(job->vm);
+	struct msm_mmu *mmu = vm->mmu;
+	int ret;
+
+	ret = mmu->funcs->prealloc_allocate(mmu, &job->prealloc);
+	if (ret)
+		return ret;
+
+	for (unsigned i = 0; i < job->nr_ops; i++) {
+		const struct msm_vm_bind_op *op = &job->ops[i];
+		struct op_arg arg = {
+			.job = job,
+		};
+
+		switch (op->op) {
+		case MSM_VM_BIND_OP_UNMAP:
+			ret = drm_gpuvm_sm_unmap(job->vm, &arg, op->iova,
+						 op->obj_offset);
+			break;
+		case MSM_VM_BIND_OP_MAP:
+			if (op->flags & MSM_VM_BIND_OP_DUMP)
+				arg.flags |= MSM_VMA_DUMP;
+			fallthrough;
+		case MSM_VM_BIND_OP_MAP_NULL:
+			ret = drm_gpuvm_sm_map(job->vm, &arg, op->iova,
+					       op->range, op->obj, op->obj_offset);
+			break;
+		default:
+			/*
+			 * lookup_op() should have already thrown an error for
+			 * invalid ops
+			 */
+			BUG_ON("unreachable");
 		}
 
-		msm_gem_vma_unmap(vma);
-		msm_gem_vma_close(vma);
+		if (ret) {
+			/*
+			 * If we've already started modifying the vm, we can't
+			 * adequetly describe to userspace the intermediate
+			 * state the vm is in.  So throw up our hands!
+			 */
+			if (i > 0)
+				vm->unusable = true;
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+/*
+ * Attach fences to the GEM objects being bound.  This will signify to
+ * the shrinker that they are busy even after dropping the locks (ie.
+ * drm_exec_fini())
+ */
+static void
+vm_bind_job_attach_fences(struct msm_vm_bind_job *job)
+{
+	for (unsigned i = 0; i < job->nr_ops; i++) {
+		struct drm_gem_object *obj = job->ops[i].obj;
+
+		if (!obj)
+			continue;
+
+		dma_resv_add_fence(obj->resv, job->fence,
+				   DMA_RESV_USAGE_KERNEL);
+	}
+}
+
+int
+msm_ioctl_vm_bind(struct drm_device *dev, void *data, struct drm_file *file)
+{
+	struct msm_drm_private *priv = dev->dev_private;
+	struct drm_msm_vm_bind *args = data;
+	struct msm_context *ctx = file->driver_priv;
+	struct msm_vm_bind_job *job = NULL;
+	struct msm_gpu *gpu = priv->gpu;
+	struct msm_gpu_submitqueue *queue;
+	struct msm_syncobj_post_dep *post_deps = NULL;
+	struct drm_syncobj **syncobjs_to_reset = NULL;
+	struct sync_file *sync_file = NULL;
+	struct dma_fence *fence;
+	int out_fence_fd = -1;
+	int ret, nr_bos = 0;
+	unsigned i;
+
+	if (!gpu)
+		return -ENXIO;
+
+	/*
+	 * Maybe we could allow just UNMAP ops?  OTOH userspace should just
+	 * immediately close the device file and all will be torn down.
+	 */
+	if (to_msm_vm(ctx->vm)->unusable)
+		return UERR(EPIPE, dev, "context is unusable");
+
+	/*
+	 * Technically, you cannot create a VM_BIND submitqueue in the first
+	 * place, if you haven't opted in to VM_BIND context.  But it is
+	 * cleaner / less confusing, to check this case directly.
+	 */
+	if (!msm_context_is_vmbind(ctx))
+		return UERR(EINVAL, dev, "context does not support vmbind");
+
+	if (args->flags & ~MSM_VM_BIND_FLAGS)
+		return UERR(EINVAL, dev, "invalid flags");
 
-		if (obj && obj->resv != drm_gpuvm_resv(gpuvm)) {
-			msm_gem_unlock(obj);
-			drm_gem_object_put(obj);
+	queue = msm_submitqueue_get(ctx, args->queue_id);
+	if (!queue)
+		return -ENOENT;
+
+	if (!(queue->flags & MSM_SUBMITQUEUE_VM_BIND)) {
+		ret = UERR(EINVAL, dev, "Invalid queue type");
+		goto out_post_unlock;
+	}
+
+	if (args->flags & MSM_VM_BIND_FENCE_FD_OUT) {
+		out_fence_fd = get_unused_fd_flags(O_CLOEXEC);
+		if (out_fence_fd < 0) {
+			ret = out_fence_fd;
+			goto out_post_unlock;
 		}
 	}
-	dma_resv_unlock(drm_gpuvm_resv(gpuvm));
+
+	job = vm_bind_job_create(dev, gpu, queue, args->nr_ops);
+	if (IS_ERR(job)) {
+		ret = PTR_ERR(job);
+		goto out_post_unlock;
+	}
+
+	ret = mutex_lock_interruptible(&queue->lock);
+	if (ret)
+		goto out_post_unlock;
+
+	if (args->flags & MSM_VM_BIND_FENCE_FD_IN) {
+		struct dma_fence *in_fence;
+
+		in_fence = sync_file_get_fence(args->fence_fd);
+
+		if (!in_fence) {
+			ret = UERR(EINVAL, dev, "invalid in-fence");
+			goto out_unlock;
+		}
+
+		ret = drm_sched_job_add_dependency(&job->base, in_fence);
+		if (ret)
+			goto out_unlock;
+	}
+
+	if (args->in_syncobjs > 0) {
+		syncobjs_to_reset = msm_syncobj_parse_deps(dev, &job->base,
+							   file, args->in_syncobjs,
+							   args->nr_in_syncobjs,
+							   args->syncobj_stride);
+		if (IS_ERR(syncobjs_to_reset)) {
+			ret = PTR_ERR(syncobjs_to_reset);
+			goto out_unlock;
+		}
+	}
+
+	if (args->out_syncobjs > 0) {
+		post_deps = msm_syncobj_parse_post_deps(dev, file,
+							args->out_syncobjs,
+							args->nr_out_syncobjs,
+							args->syncobj_stride);
+		if (IS_ERR(post_deps)) {
+			ret = PTR_ERR(post_deps);
+			goto out_unlock;
+		}
+	}
+
+	ret = vm_bind_job_lookup_ops(job, args, file, &nr_bos);
+	if (ret)
+		goto out_unlock;
+
+	vm_bind_prealloc_count(job);
+
+	struct drm_exec exec;
+	unsigned flags = DRM_EXEC_IGNORE_DUPLICATES | DRM_EXEC_INTERRUPTIBLE_WAIT;
+	drm_exec_init(&exec, flags, nr_bos + 1);
+
+	ret = vm_bind_job_lock_objects(job, &exec);
+	if (ret)
+		goto out;
+
+	ret = vm_bind_job_pin_objects(job);
+	if (ret)
+		goto out;
+
+	ret = vm_bind_job_prepare(job);
+	if (ret)
+		goto out;
+
+	drm_sched_job_arm(&job->base);
+
+	job->fence = dma_fence_get(&job->base.s_fence->finished);
+
+	if (args->flags & MSM_VM_BIND_FENCE_FD_OUT) {
+		sync_file = sync_file_create(job->fence);
+		if (!sync_file) {
+			ret = -ENOMEM;
+		} else {
+			fd_install(out_fence_fd, sync_file->file);
+			args->fence_fd = out_fence_fd;
+		}
+	}
+
+	if (ret)
+		goto out;
+
+	vm_bind_job_attach_fences(job);
+
+	/*
+	 * The job can be free'd (and fence unref'd) at any point after
+	 * drm_sched_entity_push_job(), so we need to hold our own ref
+	 */
+	fence = dma_fence_get(job->fence);
+
+	ret = drm_sched_entity_push_job(&job->base);
+
+	msm_syncobj_reset(syncobjs_to_reset, args->nr_in_syncobjs);
+	msm_syncobj_process_post_deps(post_deps, args->nr_out_syncobjs, fence);
+
+	dma_fence_put(fence);
+
+out:
+	if (ret)
+		vm_bind_job_unpin_objects(job);
+
+	drm_exec_fini(&exec);
+out_unlock:
+	mutex_unlock(&queue->lock);
+out_post_unlock:
+	if (ret && (out_fence_fd >= 0)) {
+		put_unused_fd(out_fence_fd);
+		if (sync_file)
+			fput(sync_file->file);
+	}
+
+	if (!IS_ERR_OR_NULL(job)) {
+		if (ret)
+			msm_vma_job_free(&job->base);
+	} else {
+		/*
+		 * If the submit hasn't yet taken ownership of the queue
+		 * then we need to drop the reference ourself:
+		 */
+		msm_submitqueue_put(queue);
+	}
+
+	if (!IS_ERR_OR_NULL(post_deps)) {
+		for (i = 0; i < args->nr_out_syncobjs; ++i) {
+			kfree(post_deps[i].chain);
+			drm_syncobj_put(post_deps[i].syncobj);
+		}
+		kfree(post_deps);
+	}
+
+	if (!IS_ERR_OR_NULL(syncobjs_to_reset)) {
+		for (i = 0; i < args->nr_in_syncobjs; ++i) {
+			if (syncobjs_to_reset[i])
+				drm_syncobj_put(syncobjs_to_reset[i]);
+		}
+		kfree(syncobjs_to_reset);
+	}
+
+	return ret;
 }
diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
index 6d6cd1219926..5c67294edc95 100644
--- a/include/uapi/drm/msm_drm.h
+++ b/include/uapi/drm/msm_drm.h
@@ -272,7 +272,10 @@ struct drm_msm_gem_submit_cmd {
 	__u32 size;           /* in, cmdstream size */
 	__u32 pad;
 	__u32 nr_relocs;      /* in, number of submit_reloc's */
-	__u64 relocs;         /* in, ptr to array of submit_reloc's */
+	union {
+		__u64 relocs; /* in, ptr to array of submit_reloc's */
+		__u64 iova;   /* cmdstream address (for VM_BIND contexts) */
+	};
 };
 
 /* Each buffer referenced elsewhere in the cmdstream submit (ie. the
@@ -339,7 +342,74 @@ struct drm_msm_gem_submit {
 	__u32 nr_out_syncobjs; /* in, number of entries in out_syncobj. */
 	__u32 syncobj_stride; /* in, stride of syncobj arrays. */
 	__u32 pad;            /*in, reserved for future use, always 0. */
+};
+
+#define MSM_VM_BIND_OP_UNMAP	0
+#define MSM_VM_BIND_OP_MAP	1
+#define MSM_VM_BIND_OP_MAP_NULL	2
+
+#define MSM_VM_BIND_OP_DUMP	1
+#define MSM_VM_BIND_OP_FLAGS ( \
+		MSM_VM_BIND_OP_DUMP | \
+		0)
 
+/**
+ * struct drm_msm_vm_bind_op - bind/unbind op to run
+ */
+struct drm_msm_vm_bind_op {
+	/** @op: one of MSM_VM_BIND_OP_x */
+	__u32 op;
+	/** @handle: GEM object handle, MBZ for UNMAP or MAP_NULL */
+	__u32 handle;
+	/** @obj_offset: Offset into GEM object, MBZ for UNMAP or MAP_NULL */
+	__u64 obj_offset;
+	/** @iova: Address to operate on */
+	__u64 iova;
+	/** @range: Number of bites to to map/unmap */
+	__u64 range;
+	/** @flags: Bitmask of MSM_VM_BIND_OP_FLAG_x */
+	__u32 flags;
+	/** @pad: MBZ */
+	__u32 pad;
+};
+
+#define MSM_VM_BIND_FENCE_FD_IN		0x00000001
+#define MSM_VM_BIND_FENCE_FD_OUT	0x00000002
+#define MSM_VM_BIND_FLAGS ( \
+		MSM_VM_BIND_FENCE_FD_IN | \
+		MSM_VM_BIND_FENCE_FD_OUT | \
+		0)
+
+/**
+ * struct drm_msm_vm_bind - Input of &DRM_IOCTL_MSM_VM_BIND
+ */
+struct drm_msm_vm_bind {
+	/** @flags: in, bitmask of MSM_VM_BIND_x */
+	__u32 flags;
+	/** @nr_ops: the number of bind ops in this ioctl */
+	__u32 nr_ops;
+	/** @fence_fd: in/out fence fd (see MSM_VM_BIND_FENCE_FD_IN/OUT) */
+	__s32 fence_fd;
+	/** @queue_id: in, submitqueue id */
+	__u32 queue_id;
+	/** @in_syncobjs: in, ptr to array of drm_msm_gem_syncobj */
+	__u64 in_syncobjs;
+	/** @out_syncobjs: in, ptr to array of drm_msm_gem_syncobj */
+	__u64 out_syncobjs;
+	/** @nr_in_syncobjs: in, number of entries in in_syncobj */
+	__u32 nr_in_syncobjs;
+	/** @nr_out_syncobjs: in, number of entries in out_syncobj */
+	__u32 nr_out_syncobjs;
+	/** @syncobj_stride: in, stride of syncobj arrays */
+	__u32 syncobj_stride;
+	/** @op_stride: sizeof each struct drm_msm_vm_bind_op in @ops */
+	__u32 op_stride;
+	union {
+		/** @op: used if num_ops == 1 */
+		struct drm_msm_vm_bind_op op;
+		/** @ops: userptr to array of drm_msm_vm_bind_op if num_ops > 1 */
+		__u64 ops;
+	};
 };
 
 #define MSM_WAIT_FENCE_BOOST	0x00000001
@@ -435,6 +505,7 @@ struct drm_msm_submitqueue_query {
 #define DRM_MSM_SUBMITQUEUE_NEW        0x0A
 #define DRM_MSM_SUBMITQUEUE_CLOSE      0x0B
 #define DRM_MSM_SUBMITQUEUE_QUERY      0x0C
+#define DRM_MSM_VM_BIND                0x0D
 
 #define DRM_IOCTL_MSM_GET_PARAM        DRM_IOWR(DRM_COMMAND_BASE + DRM_MSM_GET_PARAM, struct drm_msm_param)
 #define DRM_IOCTL_MSM_SET_PARAM        DRM_IOW (DRM_COMMAND_BASE + DRM_MSM_SET_PARAM, struct drm_msm_param)
@@ -448,6 +519,7 @@ struct drm_msm_submitqueue_query {
 #define DRM_IOCTL_MSM_SUBMITQUEUE_NEW    DRM_IOWR(DRM_COMMAND_BASE + DRM_MSM_SUBMITQUEUE_NEW, struct drm_msm_submitqueue)
 #define DRM_IOCTL_MSM_SUBMITQUEUE_CLOSE  DRM_IOW (DRM_COMMAND_BASE + DRM_MSM_SUBMITQUEUE_CLOSE, __u32)
 #define DRM_IOCTL_MSM_SUBMITQUEUE_QUERY  DRM_IOW (DRM_COMMAND_BASE + DRM_MSM_SUBMITQUEUE_QUERY, struct drm_msm_submitqueue_query)
+#define DRM_IOCTL_MSM_VM_BIND          DRM_IOWR(DRM_COMMAND_BASE + DRM_MSM_VM_BIND, struct drm_msm_vm_bind)
 
 #if defined(__cplusplus)
 }
-- 
2.49.0

