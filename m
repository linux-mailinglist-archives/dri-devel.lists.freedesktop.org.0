Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9853E97AF5A
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2024 13:14:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7823910E462;
	Tue, 17 Sep 2024 11:14:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RQhvjpxm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10A4D10E3F0;
 Tue, 17 Sep 2024 11:14:21 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-5365928acd0so6089735e87.2; 
 Tue, 17 Sep 2024 04:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726571659; x=1727176459; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=+R/fm18AeHfM0zMF2aVoAuU7Wpe0HEexxo3MBMx8KP4=;
 b=RQhvjpxmhwnjP0f0pzbVaca2NsabtB+DjQB49Digk9PRd2PcyZiXRGzwFjFHkQ3slW
 mJ0ZqG1GVZBokAMjiZpBZn1dIaC76KEbDNtYc0+U/NrWMF9FYcVFNp7zV+0bHnEZ9CiJ
 KP126vZVzoVo9RB+mwB75h6VuOQwU3JegA2cY4U/1Gc/jZmxArSNOY8XNxzIxtHfuX63
 vNDwDLjF8r6Eq8qmDuhBbrX5G6S+tBBsMYltn76Nd3w61sbFVhzRUcBUXR/oWj4EZ1ZE
 nNeleleaUuSY8RK9Pdf4uVE24pAzZjk9vjfeVAPZ9XUu9bCO4pIc0vWgwVd2k6vpqkCu
 MRqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726571659; x=1727176459;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+R/fm18AeHfM0zMF2aVoAuU7Wpe0HEexxo3MBMx8KP4=;
 b=LoC2jU/eLaMrQXBARNEnC7KomhEru2DsnfnIPCaeWuwe6vMxjrY0MCUnZsWpUG+HvW
 iIjrdP6s5dLlwKAIOVVuyYsKqWbMbevEUSnImGtkPYOAhp4ivdGGK+6L8rPJfoMJWwMT
 fvtYNndP/Li2CphGDjP36ESxl0lFQDbAdEFzs6Ni3pi1/HhYGcbIBrQgHS/dUKjYIcAZ
 P281r6N+DdxZeAn2lWjMj3k5tgj4spiNdK1f2npNElsc+8+L3hopvEb3tLb5fmBFYPet
 k76um7rfAhKMIy6n94wAXiyDrQXcT7AD+jmyDCGP398WTZbQooZ4LMZ0j7qlxDpHFNRw
 eLHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXhJeYsEVCBdr+PBq64SGzUWHbwLLNxU42OvYHg+/uXOjgvhW/t2N5iPn6ZnyZ5HT1ia0skvRQ9R8=@lists.freedesktop.org,
 AJvYcCXsJki+gWC4jqgdisQTwCfJYP5totA9i9PW2q9e/FVDDeeKcfC3Zg/dNDuWunnIhrpIHAT0/NC7+jKu@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxngdMKtw6kZpCgKiTNw+/gPiBfaj+9ZcRJS2kNv2PVFj+u8vmC
 gwVpOiC0Wh7uhRKUrj38bI/MYBwuMCqFPLxt6jtN5zfog/vLMiZb
X-Google-Smtp-Source: AGHT+IGpVqXkWKykKEVgpQJNzF9uRy35tlKf0PLH2XCzdKdnDSWK71B7cIq4xeGh8gm2Di/y6dNo9A==
X-Received: by 2002:a05:6512:2206:b0:530:ae0a:ab7a with SMTP id
 2adb3069b0e04-53678fb6fdemr9303488e87.17.1726571658484; 
 Tue, 17 Sep 2024 04:14:18 -0700 (PDT)
Received: from [192.168.1.17] (host-82-51-105-30.retail.telecomitalia.it.
 [82.51.105.30]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a90612e1a55sm430745166b.157.2024.09.17.04.14.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2024 04:14:18 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Tue, 17 Sep 2024 13:14:12 +0200
Subject: [PATCH v4 02/11] drm/msm/A6XX: Track current_ctx_seqno per ring
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240917-preemption-a750-t-v4-2-95d48012e0ac@gmail.com>
References: <20240917-preemption-a750-t-v4-0-95d48012e0ac@gmail.com>
In-Reply-To: <20240917-preemption-a750-t-v4-0-95d48012e0ac@gmail.com>
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
 linux-doc@vger.kernel.org, Antonino Maniscalco <antomani103@gmail.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726571652; l=7762;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=V0P15+a6cDLiwlZrHWu9wIpktg4pJmPIMCVG1h+FwSw=;
 b=fItI8aLcFqlGvOY9j/1qGOdn3mfMH3NNo5qqe8kwSGiC2WODCftgQtcAOLLmCfIFvcsaehTmV
 Qa2HJaxiFDxAiuWeEhMlA/2dazBWzu1XBCzEyx3tn0d+h+6rT+rEuuZ
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
index 0dc255ddf5ce..379a3d346c30 100644
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
index 5273dc849838..945fe64f835c 100644
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
index 8b4cdf95f445..50c490b492f0 100644
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
index c0b5373e90d7..80b441fe8e3a 100644
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
index 32a4faa93d7f..6e065500b64d 100644
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
index 3666b42b4ecd..c063b3896dc1 100644
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
index 1f02bb9956be..7cabc8480d7c 100644
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
index 40791b2ade46..174f83137a49 100644
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
2.46.0

