Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4025AA7809
	for <lists+dri-devel@lfdr.de>; Fri,  2 May 2025 19:07:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62EE810E96C;
	Fri,  2 May 2025 17:07:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="N5PVncFU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3BCB10E960;
 Fri,  2 May 2025 17:07:33 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-736c277331eso3341345b3a.1; 
 Fri, 02 May 2025 10:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746205653; x=1746810453; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9qstZODCSpW1sZBxoO0k3cphiew3CZe6L6DlFJD6SVs=;
 b=N5PVncFUlr6cRBpbItBtY3VTe6HBpexLjSGe+EboW7ggreAw0OIwOph67HfUA/TYF3
 AMaCzx1rHVTyIA4kgplHWdczYTu9bjENQpt8CM/mNMxDBk3LC0VXM+YJf1xO6kdbdftK
 83Ghad2OtPV+Rcbw7W9ex4Py7XfBxHGDoihLTOFIeqrV5+hDsOmA9EaXScDpiEDZnBtt
 Do9co57Rw8m0Q1QusgbRg5rN5PhjdhknyMozyx3AZoSl8SYLDlsEUF+B63gnBEWFTmuj
 jbef4f8/HJKH5dNJ8OL1zOMEAlUp9dZXZU0oV4t997A6F45y89ZAjRrMk/F6JNF6D4wO
 BXCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746205653; x=1746810453;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9qstZODCSpW1sZBxoO0k3cphiew3CZe6L6DlFJD6SVs=;
 b=JaoymJv863LMSyjuiZE8t03zazcrWpYeyP14KkX8NhRbjKyk1qVxyu2kRsteesTPd5
 C4B/rBoUM2PUklII4SRK5m/KFPCSZcCyK/h78RJmaI5S0ehUw6s28SkJdFU+cpfvwTUR
 ACAZ8D15o8Zt5zm9PfT4hCUzp0U2HzIUzk2CdNyRMMFY2ijODPOb7gVkfxymZqO1+fO1
 XlzVwZE+Lzs5C6un2n+Uv15ru8jw3b8TqyFA9pB6EgMAsLfuu6uxjoQFLwcKLtWd5p28
 po7Q60OfcLrv/2XhmVPb+XW/+nrvp8SrDZ3ODc/J0cSbOhI7m3/KvQAgR6V5muA8UVaP
 anhg==
X-Gm-Message-State: AOJu0YymCKBOz4OGN7wGUodYYCjx+4YbBRd8I4SO3T5jdeqW0/+A2yQm
 OE9HU71yX5X+MDSDufA6XnhUxT4HLqIu/GPpjTU+6uVf1qH8+BZmJSda+Q==
X-Gm-Gg: ASbGncsLJQ5L1jB9wpn25jjEgjJA8NlSXxa/40HH8/brTKUuE4Hazt2hHRwWqgpI9x2
 esaHRq+Za1sWkVw6NWPVgOUuNxcI13c3pd8dPH3JNY0BUohp9oE0WLJurR01ghVe7mzHf6saAmp
 l5tm7wvKputdhk6wT3Q1jXll1ULM+gWt1oa0WjH3y6jl/2ObQrabOhwOrJN/Zr6uu60/YXDOTxR
 ib3165ZsmVJb6JQ+skRK6jJpa5uw45OUvjNUQh7nn65h4330y/B3OinwF+EDnOq9I53P7IvposW
 hquFu3dQSDQZfFmEu8eWxOEXjGQfFKlPtjqNT/6RDcpr31Ty3xQwTDkfJSZGrk4ysDIP8QhW7Qv
 oty5XLomaErAxqdM=
X-Google-Smtp-Source: AGHT+IGgw9WZ/Vb8oS+e8el5Q3PHxUUFY5SENIV6s+YxiIK0yrzSdKTuf8HN2sCcQrsuR+XarKnSkQ==
X-Received: by 2002:aa7:9311:0:b0:736:bced:f4cf with SMTP id
 d2e1a72fcca58-7405798f929mr6237220b3a.0.1746205652639; 
 Fri, 02 May 2025 10:07:32 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7405905cff4sm1818332b3a.125.2025.05.02.10.07.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 May 2025 10:07:32 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>, Rob Clark <robdclark@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 04/33] drm/msm: Rename msm_file_private -> msm_context
Date: Fri,  2 May 2025 09:56:31 -0700
Message-ID: <20250502165831.44850-5-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250502165831.44850-1-robdclark@gmail.com>
References: <20250502165831.44850-1-robdclark@gmail.com>
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

This is a more descriptive name.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   |  2 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c |  6 ++--
 drivers/gpu/drm/msm/adreno/adreno_gpu.h |  4 +--
 drivers/gpu/drm/msm/msm_drv.c           | 14 ++++-----
 drivers/gpu/drm/msm/msm_gem.c           |  2 +-
 drivers/gpu/drm/msm/msm_gem_submit.c    |  2 +-
 drivers/gpu/drm/msm/msm_gpu.c           |  4 +--
 drivers/gpu/drm/msm/msm_gpu.h           | 39 ++++++++++++-------------
 drivers/gpu/drm/msm/msm_submitqueue.c   | 27 +++++++++--------
 9 files changed, 49 insertions(+), 51 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 129c33f0b027..a32cce8b0c5c 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -111,7 +111,7 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
 		struct msm_ringbuffer *ring, struct msm_gem_submit *submit)
 {
 	bool sysprof = refcount_read(&a6xx_gpu->base.base.sysprof_active) > 1;
-	struct msm_file_private *ctx = submit->queue->ctx;
+	struct msm_context *ctx = submit->queue->ctx;
 	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
 	phys_addr_t ttbr;
 	u32 asid;
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index e80db01a01c0..25c939b3367a 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -356,7 +356,7 @@ int adreno_fault_handler(struct msm_gpu *gpu, unsigned long iova, int flags,
 	return 0;
 }
 
-int adreno_get_param(struct msm_gpu *gpu, struct msm_file_private *ctx,
+int adreno_get_param(struct msm_gpu *gpu, struct msm_context *ctx,
 		     uint32_t param, uint64_t *value, uint32_t *len)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
@@ -444,7 +444,7 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_file_private *ctx,
 	}
 }
 
-int adreno_set_param(struct msm_gpu *gpu, struct msm_file_private *ctx,
+int adreno_set_param(struct msm_gpu *gpu, struct msm_context *ctx,
 		     uint32_t param, uint64_t value, uint32_t len)
 {
 	struct drm_device *drm = gpu->dev;
@@ -490,7 +490,7 @@ int adreno_set_param(struct msm_gpu *gpu, struct msm_file_private *ctx,
 	case MSM_PARAM_SYSPROF:
 		if (!capable(CAP_SYS_ADMIN))
 			return UERR(EPERM, drm, "invalid permissions");
-		return msm_file_private_set_sysprof(ctx, gpu, value);
+		return msm_context_set_sysprof(ctx, gpu, value);
 	default:
 		return UERR(EINVAL, drm, "%s: invalid param: %u", gpu->name, param);
 	}
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 2366a57b280f..fed9516da365 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -603,9 +603,9 @@ static inline int adreno_is_a7xx(struct adreno_gpu *gpu)
 /* Put vm_start above 32b to catch issues with not setting xyz_BASE_HI */
 #define ADRENO_VM_START 0x100000000ULL
 u64 adreno_private_address_space_size(struct msm_gpu *gpu);
-int adreno_get_param(struct msm_gpu *gpu, struct msm_file_private *ctx,
+int adreno_get_param(struct msm_gpu *gpu, struct msm_context *ctx,
 		     uint32_t param, uint64_t *value, uint32_t *len);
-int adreno_set_param(struct msm_gpu *gpu, struct msm_file_private *ctx,
+int adreno_set_param(struct msm_gpu *gpu, struct msm_context *ctx,
 		     uint32_t param, uint64_t value, uint32_t len);
 const struct firmware *adreno_request_fw(struct adreno_gpu *adreno_gpu,
 		const char *fwname);
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index c3588dc9e537..29ca24548c67 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -333,7 +333,7 @@ static int context_init(struct drm_device *dev, struct drm_file *file)
 {
 	static atomic_t ident = ATOMIC_INIT(0);
 	struct msm_drm_private *priv = dev->dev_private;
-	struct msm_file_private *ctx;
+	struct msm_context *ctx;
 
 	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
 	if (!ctx)
@@ -363,23 +363,23 @@ static int msm_open(struct drm_device *dev, struct drm_file *file)
 	return context_init(dev, file);
 }
 
-static void context_close(struct msm_file_private *ctx)
+static void context_close(struct msm_context *ctx)
 {
 	msm_submitqueue_close(ctx);
-	msm_file_private_put(ctx);
+	msm_context_put(ctx);
 }
 
 static void msm_postclose(struct drm_device *dev, struct drm_file *file)
 {
 	struct msm_drm_private *priv = dev->dev_private;
-	struct msm_file_private *ctx = file->driver_priv;
+	struct msm_context *ctx = file->driver_priv;
 
 	/*
 	 * It is not possible to set sysprof param to non-zero if gpu
 	 * is not initialized:
 	 */
 	if (priv->gpu)
-		msm_file_private_set_sysprof(ctx, priv->gpu, 0);
+		msm_context_set_sysprof(ctx, priv->gpu, 0);
 
 	context_close(ctx);
 }
@@ -511,7 +511,7 @@ static int msm_ioctl_gem_info_iova(struct drm_device *dev,
 		uint64_t *iova)
 {
 	struct msm_drm_private *priv = dev->dev_private;
-	struct msm_file_private *ctx = file->driver_priv;
+	struct msm_context *ctx = file->driver_priv;
 
 	if (!priv->gpu)
 		return -EINVAL;
@@ -531,7 +531,7 @@ static int msm_ioctl_gem_info_set_iova(struct drm_device *dev,
 		uint64_t iova)
 {
 	struct msm_drm_private *priv = dev->dev_private;
-	struct msm_file_private *ctx = file->driver_priv;
+	struct msm_context *ctx = file->driver_priv;
 
 	if (!priv->gpu)
 		return -EINVAL;
diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index d2f38e1df510..fdeb6cf7eeb5 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -48,7 +48,7 @@ static void update_device_mem(struct msm_drm_private *priv, ssize_t size)
 
 static void update_ctx_mem(struct drm_file *file, ssize_t size)
 {
-	struct msm_file_private *ctx = file->driver_priv;
+	struct msm_context *ctx = file->driver_priv;
 	uint64_t ctx_mem = atomic64_add_return(size, &ctx->ctx_mem);
 
 	rcu_read_lock(); /* Locks file->pid! */
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 3e9aa2cc38ef..16ca6cfac967 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -642,7 +642,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 {
 	struct msm_drm_private *priv = dev->dev_private;
 	struct drm_msm_gem_submit *args = data;
-	struct msm_file_private *ctx = file->driver_priv;
+	struct msm_context *ctx = file->driver_priv;
 	struct msm_gem_submit *submit = NULL;
 	struct msm_gpu *gpu = priv->gpu;
 	struct msm_gpu_submitqueue *queue;
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index c380d9d9f5af..d786fcfad62f 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -148,7 +148,7 @@ int msm_gpu_pm_suspend(struct msm_gpu *gpu)
 	return 0;
 }
 
-void msm_gpu_show_fdinfo(struct msm_gpu *gpu, struct msm_file_private *ctx,
+void msm_gpu_show_fdinfo(struct msm_gpu *gpu, struct msm_context *ctx,
 			 struct drm_printer *p)
 {
 	drm_printf(p, "drm-engine-gpu:\t%llu ns\n", ctx->elapsed_ns);
@@ -339,7 +339,7 @@ static void retire_submits(struct msm_gpu *gpu);
 
 static void get_comm_cmdline(struct msm_gem_submit *submit, char **comm, char **cmd)
 {
-	struct msm_file_private *ctx = submit->queue->ctx;
+	struct msm_context *ctx = submit->queue->ctx;
 	struct task_struct *task;
 
 	WARN_ON(!mutex_is_locked(&submit->gpu->lock));
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index e25009150579..957d6fb3469d 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -22,7 +22,7 @@
 struct msm_gem_submit;
 struct msm_gpu_perfcntr;
 struct msm_gpu_state;
-struct msm_file_private;
+struct msm_context;
 
 struct msm_gpu_config {
 	const char *ioname;
@@ -44,9 +44,9 @@ struct msm_gpu_config {
  *    + z180_gpu
  */
 struct msm_gpu_funcs {
-	int (*get_param)(struct msm_gpu *gpu, struct msm_file_private *ctx,
+	int (*get_param)(struct msm_gpu *gpu, struct msm_context *ctx,
 			 uint32_t param, uint64_t *value, uint32_t *len);
-	int (*set_param)(struct msm_gpu *gpu, struct msm_file_private *ctx,
+	int (*set_param)(struct msm_gpu *gpu, struct msm_context *ctx,
 			 uint32_t param, uint64_t value, uint32_t len);
 	int (*hw_init)(struct msm_gpu *gpu);
 
@@ -347,7 +347,7 @@ struct msm_gpu_perfcntr {
 #define NR_SCHED_PRIORITIES (1 + DRM_SCHED_PRIORITY_LOW - DRM_SCHED_PRIORITY_HIGH)
 
 /**
- * struct msm_file_private - per-drm_file context
+ * struct msm_context - per-drm_file context
  *
  * @queuelock:    synchronizes access to submitqueues list
  * @submitqueues: list of &msm_gpu_submitqueue created by userspace
@@ -357,7 +357,7 @@ struct msm_gpu_perfcntr {
  * @ref:          reference count
  * @seqno:        unique per process seqno
  */
-struct msm_file_private {
+struct msm_context {
 	rwlock_t queuelock;
 	struct list_head submitqueues;
 	int queueid;
@@ -512,7 +512,7 @@ struct msm_gpu_submitqueue {
 	u32 ring_nr;
 	int faults;
 	uint32_t last_fence;
-	struct msm_file_private *ctx;
+	struct msm_context *ctx;
 	struct list_head node;
 	struct idr fence_idr;
 	struct spinlock idr_lock;
@@ -608,33 +608,32 @@ static inline void gpu_write64(struct msm_gpu *gpu, u32 reg, u64 val)
 int msm_gpu_pm_suspend(struct msm_gpu *gpu);
 int msm_gpu_pm_resume(struct msm_gpu *gpu);
 
-void msm_gpu_show_fdinfo(struct msm_gpu *gpu, struct msm_file_private *ctx,
+void msm_gpu_show_fdinfo(struct msm_gpu *gpu, struct msm_context *ctx,
 			 struct drm_printer *p);
 
-int msm_submitqueue_init(struct drm_device *drm, struct msm_file_private *ctx);
-struct msm_gpu_submitqueue *msm_submitqueue_get(struct msm_file_private *ctx,
+int msm_submitqueue_init(struct drm_device *drm, struct msm_context *ctx);
+struct msm_gpu_submitqueue *msm_submitqueue_get(struct msm_context *ctx,
 		u32 id);
 int msm_submitqueue_create(struct drm_device *drm,
-		struct msm_file_private *ctx,
+		struct msm_context *ctx,
 		u32 prio, u32 flags, u32 *id);
-int msm_submitqueue_query(struct drm_device *drm, struct msm_file_private *ctx,
+int msm_submitqueue_query(struct drm_device *drm, struct msm_context *ctx,
 		struct drm_msm_submitqueue_query *args);
-int msm_submitqueue_remove(struct msm_file_private *ctx, u32 id);
-void msm_submitqueue_close(struct msm_file_private *ctx);
+int msm_submitqueue_remove(struct msm_context *ctx, u32 id);
+void msm_submitqueue_close(struct msm_context *ctx);
 
 void msm_submitqueue_destroy(struct kref *kref);
 
-int msm_file_private_set_sysprof(struct msm_file_private *ctx,
-				 struct msm_gpu *gpu, int sysprof);
-void __msm_file_private_destroy(struct kref *kref);
+int msm_context_set_sysprof(struct msm_context *ctx, struct msm_gpu *gpu, int sysprof);
+void __msm_context_destroy(struct kref *kref);
 
-static inline void msm_file_private_put(struct msm_file_private *ctx)
+static inline void msm_context_put(struct msm_context *ctx)
 {
-	kref_put(&ctx->ref, __msm_file_private_destroy);
+	kref_put(&ctx->ref, __msm_context_destroy);
 }
 
-static inline struct msm_file_private *msm_file_private_get(
-	struct msm_file_private *ctx)
+static inline struct msm_context *msm_context_get(
+	struct msm_context *ctx)
 {
 	kref_get(&ctx->ref);
 	return ctx;
diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm/msm/msm_submitqueue.c
index 7fed1de63b5d..1acc0fe36353 100644
--- a/drivers/gpu/drm/msm/msm_submitqueue.c
+++ b/drivers/gpu/drm/msm/msm_submitqueue.c
@@ -7,8 +7,7 @@
 
 #include "msm_gpu.h"
 
-int msm_file_private_set_sysprof(struct msm_file_private *ctx,
-				 struct msm_gpu *gpu, int sysprof)
+int msm_context_set_sysprof(struct msm_context *ctx, struct msm_gpu *gpu, int sysprof)
 {
 	/*
 	 * Since pm_runtime and sysprof_active are both refcounts, we
@@ -46,10 +45,10 @@ int msm_file_private_set_sysprof(struct msm_file_private *ctx,
 	return 0;
 }
 
-void __msm_file_private_destroy(struct kref *kref)
+void __msm_context_destroy(struct kref *kref)
 {
-	struct msm_file_private *ctx = container_of(kref,
-		struct msm_file_private, ref);
+	struct msm_context *ctx = container_of(kref,
+		struct msm_context, ref);
 	int i;
 
 	for (i = 0; i < ARRAY_SIZE(ctx->entities); i++) {
@@ -73,12 +72,12 @@ void msm_submitqueue_destroy(struct kref *kref)
 
 	idr_destroy(&queue->fence_idr);
 
-	msm_file_private_put(queue->ctx);
+	msm_context_put(queue->ctx);
 
 	kfree(queue);
 }
 
-struct msm_gpu_submitqueue *msm_submitqueue_get(struct msm_file_private *ctx,
+struct msm_gpu_submitqueue *msm_submitqueue_get(struct msm_context *ctx,
 		u32 id)
 {
 	struct msm_gpu_submitqueue *entry;
@@ -101,7 +100,7 @@ struct msm_gpu_submitqueue *msm_submitqueue_get(struct msm_file_private *ctx,
 	return NULL;
 }
 
-void msm_submitqueue_close(struct msm_file_private *ctx)
+void msm_submitqueue_close(struct msm_context *ctx)
 {
 	struct msm_gpu_submitqueue *entry, *tmp;
 
@@ -119,7 +118,7 @@ void msm_submitqueue_close(struct msm_file_private *ctx)
 }
 
 static struct drm_sched_entity *
-get_sched_entity(struct msm_file_private *ctx, struct msm_ringbuffer *ring,
+get_sched_entity(struct msm_context *ctx, struct msm_ringbuffer *ring,
 		 unsigned ring_nr, enum drm_sched_priority sched_prio)
 {
 	static DEFINE_MUTEX(entity_lock);
@@ -155,7 +154,7 @@ get_sched_entity(struct msm_file_private *ctx, struct msm_ringbuffer *ring,
 	return ctx->entities[idx];
 }
 
-int msm_submitqueue_create(struct drm_device *drm, struct msm_file_private *ctx,
+int msm_submitqueue_create(struct drm_device *drm, struct msm_context *ctx,
 		u32 prio, u32 flags, u32 *id)
 {
 	struct msm_drm_private *priv = drm->dev_private;
@@ -200,7 +199,7 @@ int msm_submitqueue_create(struct drm_device *drm, struct msm_file_private *ctx,
 
 	write_lock(&ctx->queuelock);
 
-	queue->ctx = msm_file_private_get(ctx);
+	queue->ctx = msm_context_get(ctx);
 	queue->id = ctx->queueid++;
 
 	if (id)
@@ -221,7 +220,7 @@ int msm_submitqueue_create(struct drm_device *drm, struct msm_file_private *ctx,
  * Create the default submit-queue (id==0), used for backwards compatibility
  * for userspace that pre-dates the introduction of submitqueues.
  */
-int msm_submitqueue_init(struct drm_device *drm, struct msm_file_private *ctx)
+int msm_submitqueue_init(struct drm_device *drm, struct msm_context *ctx)
 {
 	struct msm_drm_private *priv = drm->dev_private;
 	int default_prio, max_priority;
@@ -261,7 +260,7 @@ static int msm_submitqueue_query_faults(struct msm_gpu_submitqueue *queue,
 	return ret ? -EFAULT : 0;
 }
 
-int msm_submitqueue_query(struct drm_device *drm, struct msm_file_private *ctx,
+int msm_submitqueue_query(struct drm_device *drm, struct msm_context *ctx,
 		struct drm_msm_submitqueue_query *args)
 {
 	struct msm_gpu_submitqueue *queue;
@@ -282,7 +281,7 @@ int msm_submitqueue_query(struct drm_device *drm, struct msm_file_private *ctx,
 	return ret;
 }
 
-int msm_submitqueue_remove(struct msm_file_private *ctx, u32 id)
+int msm_submitqueue_remove(struct msm_context *ctx, u32 id)
 {
 	struct msm_gpu_submitqueue *entry;
 
-- 
2.49.0

