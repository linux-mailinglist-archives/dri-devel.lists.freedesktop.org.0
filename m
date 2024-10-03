Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF03498F3BE
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 18:13:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C964E10E8B8;
	Thu,  3 Oct 2024 16:13:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="O594fLuW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55F7110E8B6;
 Thu,  3 Oct 2024 16:13:02 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-a8a789c4fc5so403190666b.0; 
 Thu, 03 Oct 2024 09:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727971981; x=1728576781; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=qYDoFr9Rcb4U8qB9JjDnoMu8I4N6v3+THQGXkHPg2F0=;
 b=O594fLuWCMASfqMtLkGV225tElHsoJxVhOEQPlUTYoI1EnaNgoDLcxwLuKsIoH4D+F
 KmWWVGYabpP5ArwPWowie+g1maWbZ4YlLl0T+pPamO7QcfPMznlsq1La6cyaUjtg0E/C
 6rWyksBurtGmBAghIvxX1wWMdx7sLb+FZneDXdPvtTVob9vUA0kvNBrYoceBhTTUMrm8
 xaiHqogQxUznVxTyXY2zzd2NqMRMuQFoHexYIxQSz5o9bHlayesrvHPitw37B/fXZYeY
 lWvqEI0cAZJN4trGU935WWHuwdy4M0FRXaKPZKRLJts/00aVPzo9K2jOo06RbFSE1Vu/
 gfbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727971981; x=1728576781;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qYDoFr9Rcb4U8qB9JjDnoMu8I4N6v3+THQGXkHPg2F0=;
 b=V/K4D1vAHxFRDmGCaNfAj1sfGPvLPmqP1x2lCwA78zrLH7POgchd5Nx3ha834CMVUp
 whzxCoekyk2aRdpvyaEhQv1iKE2YZYzDNhlTNObA9AmtMZIizthJZCES/RxAR2i26UMA
 oSQkJ1m558NuSJZ7jGzNTp1y8zEfQPrYi+oav1d/Nabgb9cUGt+raeezCih/gQufUbHB
 sQzpgfCwq6E0Jonfi/lTDfi6qiToSEorlss+gNZmubQEJrwZVC98nm/7+H3mvxJU0s92
 dqO3A5oKVdekIMikMq4QcGxJlDj5kIiRh18eu2avo7TNs6t4gLptPfQ+Iu4uBQUpyRdd
 8WCA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+xie+w784tIOTOtvlzyDx6IqtyhjJfkG/iPfoS/7lTFFBzwwxHypCTuCHUjy6QWg4QEtM8AUT6eM=@lists.freedesktop.org,
 AJvYcCXAll6toIBxEluA6N+AubUoyHlqSMpKoBXp+N8p17owEeG8oq3dOR+TERouFLKkzbzWcgI+72lLPIER@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwxAVSokmixFCOB09r8xMFHYXqVfnNjcERFo6XTJ+fMCJTZAtj6
 TaihBCRITBfCDXEytpF0JCtzzbLrcV+/ilZSXeqetcRmcLkkSeO3
X-Google-Smtp-Source: AGHT+IHeMiyFlC1MxvTcV2ggoC/59dY9QxbRHUK27pt93WfUHzV6urOhFGetVOsNOPjr5bY+y9m+nA==
X-Received: by 2002:a17:906:db0d:b0:a90:9879:582b with SMTP id
 a640c23a62f3a-a990a055ac6mr457351766b.14.1727971980458; 
 Thu, 03 Oct 2024 09:13:00 -0700 (PDT)
Received: from [192.168.1.17] (host-79-12-161-203.retail.telecomitalia.it.
 [79.12.161.203]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a99103b314asm102382366b.103.2024.10.03.09.12.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Oct 2024 09:13:00 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Thu, 03 Oct 2024 18:12:51 +0200
Subject: [PATCH v8 02/12] drm/msm/a6xx: Track current_ctx_seqno per ring
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241003-preemption-a750-t-v8-2-5c6cb9f256e0@gmail.com>
References: <20241003-preemption-a750-t-v8-0-5c6cb9f256e0@gmail.com>
In-Reply-To: <20241003-preemption-a750-t-v8-0-5c6cb9f256e0@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Antonino Maniscalco <antomani103@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727971975; l=8467;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=yIHp38RtvtLDCz+dKB6Vf596mZ26ig0Y5efzj1HIfzs=;
 b=4meiphr9KoscMKIvQ+6FRrwp0DsCf5Bwac0kh9dYNWa+hxu9vhNR25CqTEnkzHvDcEkFZwfdN
 pyCBNbyrXMpD7rW77J7T0YL3a7xlnPgDjcCBmN4kbzVA7PfsbqfD+lz
X-Developer-Key: i=antomani103@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=
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

With preemption it is not enough to track the current_ctx_seqno globally
as execution might switch between rings.

This is especially problematic when current_ctx_seqno is used to
determine whether a page table switch is necessary as it might lead to
security bugs.

Track current context per ring.

Tested-by: Rob Clark <robdclark@gmail.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8450-HDK
Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a2xx_gpu.c |  2 +-
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c |  2 +-
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c |  2 +-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c |  6 +++---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 10 ++++++----
 drivers/gpu/drm/msm/msm_gpu.c         |  2 +-
 drivers/gpu/drm/msm/msm_gpu.h         | 11 -----------
 drivers/gpu/drm/msm/msm_ringbuffer.h  | 10 ++++++++++
 8 files changed, 23 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
index 0dc255ddf5ceba87090f64d5cb9f078b61104063..379a3d346c300f3ccc9e9bd08ef2a32aa3e24ceb 100644
--- a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
@@ -22,7 +22,7 @@ static void a2xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 			break;
 		case MSM_SUBMIT_CMD_CTX_RESTORE_BUF:
 			/* ignore if there has not been a ctx switch: */
-			if (gpu->cur_ctx_seqno == submit->queue->ctx->seqno)
+			if (ring->cur_ctx_seqno == submit->queue->ctx->seqno)
 				break;
 			fallthrough;
 		case MSM_SUBMIT_CMD_BUF:
diff --git a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
index 5273dc8498381ce09e878894f4eb56263900be39..945fe64f835cc6094f1880ea20f20584de74a464 100644
--- a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
@@ -40,7 +40,7 @@ static void a3xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 			break;
 		case MSM_SUBMIT_CMD_CTX_RESTORE_BUF:
 			/* ignore if there has not been a ctx switch: */
-			if (gpu->cur_ctx_seqno == submit->queue->ctx->seqno)
+			if (ring->cur_ctx_seqno == submit->queue->ctx->seqno)
 				break;
 			fallthrough;
 		case MSM_SUBMIT_CMD_BUF:
diff --git a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
index 8b4cdf95f4453bb76e7efb93d86080ef678c9f68..50c490b492f08a1a7ebfe33b2f206cafd91a84ba 100644
--- a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
@@ -34,7 +34,7 @@ static void a4xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 			break;
 		case MSM_SUBMIT_CMD_CTX_RESTORE_BUF:
 			/* ignore if there has not been a ctx switch: */
-			if (gpu->cur_ctx_seqno == submit->queue->ctx->seqno)
+			if (ring->cur_ctx_seqno == submit->queue->ctx->seqno)
 				break;
 			fallthrough;
 		case MSM_SUBMIT_CMD_BUF:
diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index c0b5373e90d7139caa023aec6f272545456acb0a..80b441fe8e3a823c5bd1f74cd8c7bb418d0674fb 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -75,7 +75,7 @@ static void a5xx_submit_in_rb(struct msm_gpu *gpu, struct msm_gem_submit *submit
 		case MSM_SUBMIT_CMD_IB_TARGET_BUF:
 			break;
 		case MSM_SUBMIT_CMD_CTX_RESTORE_BUF:
-			if (gpu->cur_ctx_seqno == submit->queue->ctx->seqno)
+			if (ring->cur_ctx_seqno == submit->queue->ctx->seqno)
 				break;
 			fallthrough;
 		case MSM_SUBMIT_CMD_BUF:
@@ -129,7 +129,7 @@ static void a5xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 	unsigned int i, ibs = 0;
 
 	if (IS_ENABLED(CONFIG_DRM_MSM_GPU_SUDO) && submit->in_rb) {
-		gpu->cur_ctx_seqno = 0;
+		ring->cur_ctx_seqno = 0;
 		a5xx_submit_in_rb(gpu, submit);
 		return;
 	}
@@ -164,7 +164,7 @@ static void a5xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 		case MSM_SUBMIT_CMD_IB_TARGET_BUF:
 			break;
 		case MSM_SUBMIT_CMD_CTX_RESTORE_BUF:
-			if (gpu->cur_ctx_seqno == submit->queue->ctx->seqno)
+			if (ring->cur_ctx_seqno == submit->queue->ctx->seqno)
 				break;
 			fallthrough;
 		case MSM_SUBMIT_CMD_BUF:
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 32a4faa93d7f072ea6b8d949f4dc9d2a58cec6b9..6e065500b64d6d95599d89c33e6703c92f210047 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -109,7 +109,7 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
 	u32 asid;
 	u64 memptr = rbmemptr(ring, ttbr0);
 
-	if (ctx->seqno == a6xx_gpu->base.base.cur_ctx_seqno)
+	if (ctx->seqno == ring->cur_ctx_seqno)
 		return;
 
 	if (msm_iommu_pagetable_params(ctx->aspace->mmu, &ttbr, &asid))
@@ -219,7 +219,7 @@ static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 		case MSM_SUBMIT_CMD_IB_TARGET_BUF:
 			break;
 		case MSM_SUBMIT_CMD_CTX_RESTORE_BUF:
-			if (gpu->cur_ctx_seqno == submit->queue->ctx->seqno)
+			if (ring->cur_ctx_seqno == submit->queue->ctx->seqno)
 				break;
 			fallthrough;
 		case MSM_SUBMIT_CMD_BUF:
@@ -305,7 +305,7 @@ static void a7xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 		case MSM_SUBMIT_CMD_IB_TARGET_BUF:
 			break;
 		case MSM_SUBMIT_CMD_CTX_RESTORE_BUF:
-			if (gpu->cur_ctx_seqno == submit->queue->ctx->seqno)
+			if (ring->cur_ctx_seqno == submit->queue->ctx->seqno)
 				break;
 			fallthrough;
 		case MSM_SUBMIT_CMD_BUF:
@@ -843,6 +843,7 @@ static int hw_init(struct msm_gpu *gpu)
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
 	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
 	u64 gmem_range_min;
+	unsigned int i;
 	int ret;
 
 	if (!adreno_has_gmu_wrapper(adreno_gpu)) {
@@ -1138,7 +1139,8 @@ static int hw_init(struct msm_gpu *gpu)
 	/* Always come up on rb 0 */
 	a6xx_gpu->cur_ring = gpu->rb[0];
 
-	gpu->cur_ctx_seqno = 0;
+	for (i = 0; i < gpu->nr_rings; i++)
+		gpu->rb[i]->cur_ctx_seqno = 0;
 
 	/* Enable the SQE_to start the CP engine */
 	gpu_write(gpu, REG_A6XX_CP_SQE_CNTL, 1);
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 3666b42b4ecd7f91b24302d7f229eeefdc3c39b7..c063b3896dc1c193e41b8fc380a91a9076376811 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -783,7 +783,7 @@ void msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 	mutex_unlock(&gpu->active_lock);
 
 	gpu->funcs->submit(gpu, submit);
-	gpu->cur_ctx_seqno = submit->queue->ctx->seqno;
+	submit->ring->cur_ctx_seqno = submit->queue->ctx->seqno;
 
 	pm_runtime_put(&gpu->pdev->dev);
 	hangcheck_timer_reset(gpu);
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 1f02bb9956be2720a2760646ccdf92f8bead7dd0..7cabc8480d7c5461ab8d8726fcc21690cbaf7366 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -193,17 +193,6 @@ struct msm_gpu {
 	 */
 	refcount_t sysprof_active;
 
-	/**
-	 * cur_ctx_seqno:
-	 *
-	 * The ctx->seqno value of the last context to submit rendering,
-	 * and the one with current pgtables installed (for generations
-	 * that support per-context pgtables).  Tracked by seqno rather
-	 * than pointer value to avoid dangling pointers, and cases where
-	 * a ctx can be freed and a new one created with the same address.
-	 */
-	int cur_ctx_seqno;
-
 	/**
 	 * lock:
 	 *
diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.h b/drivers/gpu/drm/msm/msm_ringbuffer.h
index 40791b2ade46ef0e16e2a4088291a575d3be9e82..174f83137a49940ec80b1fbf548e214fa3c32784 100644
--- a/drivers/gpu/drm/msm/msm_ringbuffer.h
+++ b/drivers/gpu/drm/msm/msm_ringbuffer.h
@@ -100,6 +100,16 @@ struct msm_ringbuffer {
 	 * preemption.  Can be aquired from irq context.
 	 */
 	spinlock_t preempt_lock;
+
+	/**
+	 * cur_ctx_seqno:
+	 *
+	 * The ctx->seqno value of the last context to submit to this ring
+	 * Tracked by seqno rather than pointer value to avoid dangling
+	 * pointers, and cases where a ctx can be freed and a new one created
+	 * with the same address.
+	 */
+	int cur_ctx_seqno;
 };
 
 struct msm_ringbuffer *msm_ringbuffer_new(struct msm_gpu *gpu, int id,

-- 
2.46.1

