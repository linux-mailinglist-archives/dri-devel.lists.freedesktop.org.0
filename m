Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E221A69141
	for <lists+dri-devel@lfdr.de>; Wed, 19 Mar 2025 15:55:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A444910E520;
	Wed, 19 Mar 2025 14:54:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="b21IxhKd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ED7710E51A;
 Wed, 19 Mar 2025 14:54:57 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id
 98e67ed59e1d1-301302a328bso8182742a91.2; 
 Wed, 19 Mar 2025 07:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742396096; x=1743000896; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gKa3hUYPEs+SyvxRDdRZDj2qjpo3oPsP/0spn+b/Nw4=;
 b=b21IxhKdJvWcm4/rlmxDmWNUDRnpZVJmVdwAbgyRRhcjTsO1cNiTW7icXmWUFc/Fus
 l27tlbH37ynjvaYvufJMScqdrDVxFlA/tVfpjHO0Wiuuu4YYo1l6Fe5rjhEWex67K6d3
 efbwzr85ki89UvUNzQiOuyKp+jb/uYzDpTNcHIgsHwo4uEPAM3t/vn/KTXWE9HlXEp+s
 a3ZPlY2ROdjVxErUbrCpnX5NjK3UpHUtSifMw5S7KomlWpJcqb+H1tc5TGMmv8W8721u
 vEdslFalD97zmSihk77pisUtkgc7GY9hJqEbNgBBkxMMZCkl80/24+NKjYQeb+2cVbPT
 o0ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742396096; x=1743000896;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gKa3hUYPEs+SyvxRDdRZDj2qjpo3oPsP/0spn+b/Nw4=;
 b=RkUNUvIRhkfp5kxBa6ivB0rUtU22H26KDgt2Z4K82bsjcKx//gUtaYbBeok5kdXUuz
 ID+R9oH4vJKrqrC/TBF9fopK3LDcKqV6L7/lH7qlEzErwmf0y+7zcspgKCwHuW4tclAq
 0cN1WCuJkYYRUPR7WfLOKbJ3B3iUmCKE5IdvRYuijp3ZEJc/Q6wazTfOhHQa6IZnurdq
 P0V3eFZRyMAtmfcc0q5ApD17PE3hZdqOekAZ54w/7ZLSvTm97nL2+yvFXteb5hvl7UK2
 Gy5PqKe49c720ztyoAr2NhQ2veyipJyZC3Sn3zuEa6gLwUCrj/n09tIxmXSpgqSU4ov7
 fqZw==
X-Gm-Message-State: AOJu0YzlKsJFZ4g3X/Nkx9CTL2/TZVOEIjsyBF4oyjSsjS4LjZsdyTqb
 JJXY9KE6usA4rQ4Qe7BZmiDLE64U1vzFhjy/q7K6N+QTrCB3WBBEBoCqzw==
X-Gm-Gg: ASbGncukgwdO8Y5uCUWMWEp1pVSXbl+vYkrACzkI1TSB09gUFlvEn0DYTuORQqe1+ci
 17dNEWtM/FAHxt+aFihFbNAyS5rtjEO9a2kHEEqxoE4oMjOmQv3M92ZQRVxKPOmL6bm1eCqoUbA
 pXkM9jYqvG9vW2iIp6RyOyh24k19uw1HPFanyUDg0tv7r3Ht4GEnwKPPfkMoX+MwE5QD0/Lhxhf
 e5hPOJdMLhy6ZS66DDG6q4oG+j5zpPtmnQOt9zwiXU3XPpRexj4GFtE3QgGAsEuF/Z678dkyuKO
 x7zM/DZsO5JRxBBnDjc1A4JAn0KCiFvdzE6mPstlXUdXAmHOuWNpsWDyWOx2ALQpEyiRXWtnXpX
 0Eey52EBl7qX9s0LvqRU4uB8tFJvFug==
X-Google-Smtp-Source: AGHT+IF59oub1VYT8pyqP1RMf2jy5T6+fpg7S7/AYghSrv9ozZFnYeuWamywkg/QcGU3T38H9j83qA==
X-Received: by 2002:a17:90b:2ed0:b0:2fa:137f:5c61 with SMTP id
 98e67ed59e1d1-301bde6210cmr6003819a91.12.1742396096190; 
 Wed, 19 Mar 2025 07:54:56 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-301bf5a1d1fsm1678508a91.27.2025.03.19.07.54.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Mar 2025 07:54:55 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 05/34] drm/msm: Rename msm_file_private -> msm_context
Date: Wed, 19 Mar 2025 07:52:17 -0700
Message-ID: <20250319145425.51935-6-robdclark@gmail.com>
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

This is a more descriptive name.

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
index eeb8b5e582d5..c5294351b1f0 100644
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
index 59cfed5acace..e0ab5126e390 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -343,7 +343,7 @@ int adreno_fault_handler(struct msm_gpu *gpu, unsigned long iova, int flags,
 	return 0;
 }
 
-int adreno_get_param(struct msm_gpu *gpu, struct msm_file_private *ctx,
+int adreno_get_param(struct msm_gpu *gpu, struct msm_context *ctx,
 		     uint32_t param, uint64_t *value, uint32_t *len)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
@@ -431,7 +431,7 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_file_private *ctx,
 	}
 }
 
-int adreno_set_param(struct msm_gpu *gpu, struct msm_file_private *ctx,
+int adreno_set_param(struct msm_gpu *gpu, struct msm_context *ctx,
 		     uint32_t param, uint64_t value, uint32_t len)
 {
 	struct drm_device *drm = gpu->dev;
@@ -477,7 +477,7 @@ int adreno_set_param(struct msm_gpu *gpu, struct msm_file_private *ctx,
 	case MSM_PARAM_SYSPROF:
 		if (!capable(CAP_SYS_ADMIN))
 			return UERR(EPERM, drm, "invalid permissions");
-		return msm_file_private_set_sysprof(ctx, gpu, value);
+		return msm_context_set_sysprof(ctx, gpu, value);
 	default:
 		return UERR(EINVAL, drm, "%s: invalid param: %u", gpu->name, param);
 	}
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index a1e2d9e87b75..9fce88461f5a 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -601,9 +601,9 @@ static inline int adreno_is_a7xx(struct adreno_gpu *gpu)
 }
 
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
2.48.1

