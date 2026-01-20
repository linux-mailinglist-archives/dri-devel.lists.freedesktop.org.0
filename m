Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A75F9D3C64F
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 11:57:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD04610E5BB;
	Tue, 20 Jan 2026 10:57:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RwqkzYtW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CDB910E023
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 10:57:01 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4801d98cf39so23494175e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 02:57:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768906620; x=1769511420; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9OP6pHxO3DhbDHIe+WR14LfgMR3whcVGTP3WGhPYzRQ=;
 b=RwqkzYtWxIdOL5qqcVTJiwH8hprpJx72AVYKBGyJEGjaAQpQxImAqjwu4PtvIPLlKA
 EznDko8HlowRZ7Qmvm0RHlqHQ41NIUpSTMdUvnq2sj5oqg9McCKPx1CbDqAiNbgeg47c
 VxSyH+j8mVVbMFgR5ef6eVabBU4sM+rYr6ps7/JO/Y0BfCTPZX/Hz030743aAlpOuNQw
 qgt+S83yGxqpCiXFmGZPgW89F2Zqn1vrWty5UIVOs2iJsVg71AqQ8VyM9mhEgkcI1oAo
 jra4SGKS+x52y4MTaQ1BdpVnA2z+DEVCFljLFewlfHBgQx/KsQnCe6+OaHDcgiim7xnG
 k4qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768906620; x=1769511420;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=9OP6pHxO3DhbDHIe+WR14LfgMR3whcVGTP3WGhPYzRQ=;
 b=IrJmFDqtQz8btJdqqUrX8bYKsSplPKXVOvMgN5GE5joRqAnPBYwLM/misc62G1R/5s
 s9TkmVl74/1+G2j4RS0MSzw+FSKt0FUMEKm8eC1Ud5j9NDyjI8YZ/HTGQmBvD8i6KFW1
 /M70qCQvvgms5zdmc/vxZiiK1OQD3aY2IMGN3aaPtNotzqUv0oTfXHeMFpfuRsihZOPw
 bHUDEoHL69LV70JVF/KTcprGnsVG3QFWhQZTkVs18+EReQoTS8vYQlwZ+ftVhzQh2KD2
 QejOf5eEGj5ewH5xiintvO5b45a0GMwLiRlPpO75vMXTJ+leg7/fxsscOjGgnf5tGnPE
 Hr7A==
X-Gm-Message-State: AOJu0YzfGsBRvZlKp5oA4i18VZYyVfqY4Wreieebv33eKGZvNOzfjpK2
 gs0tttZ94PNrvIkoUdyw+qUm9Xa5nendFaV2GDp97YTe9yA2rTLrRFZx
X-Gm-Gg: AY/fxX6L33AE/x5tYa5jxsmNMEXDSJHUcHUr4pbSj/3KoegR5xeQM6FlkLMx+7m05Xk
 ro2SVM/pxqvEY5kBqQsTPv2AoUZrCWsikwBCaOotM4PT+VHxF5YUrA5AHfJ0CzBRjoln8YzATy2
 iDrfxaIvl8dmOApEbyIJsIGklnbwC/Vol+1GQPqEDMHlk5fR28F/3q8TtvOHEFAM3+os2jIHltf
 n3tvZeab2UmpdlWdjRvab70UFUaQW+4BIXj0rZ7ihhq37B7RhGvuVpIRRO08vutoAtKw0lVMuFP
 CqpEVig8+Tehs+rZEW1kIgm6A5GjT+0LDgYaWJh7cPQzvI3zWK68C8Kv9V6bJjaCmryYxsO2ms8
 qkpaMxXZd+Rt5J9oETumX0yJwdPS5TvTxXwkSk+oNWFlRcCoZyIZNGx+1LzA64g55rZGg40zQiU
 R7mGOiAKjGYJK40HC1OnOmICBPZllrs/KKWls=
X-Received: by 2002:a05:600c:8b64:b0:47a:8cce:2940 with SMTP id
 5b1f17b1804b1-4801eac0f22mr170263815e9.14.1768906619247; 
 Tue, 20 Jan 2026 02:56:59 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:1563:d000:1067:f6c4:3bf8:ea8a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4801fe67780sm99418105e9.16.2026.01.20.02.56.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jan 2026 02:56:58 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: phasta@mailbox.org, tursulin@ursulin.net, matthew.brost@intel.com,
 sumit.semwal@linaro.org
Cc: dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH 1/9] dma-buf: add dma_fence_was_initialized function v2
Date: Tue, 20 Jan 2026 11:54:40 +0100
Message-ID: <20260120105655.7134-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260120105655.7134-1-christian.koenig@amd.com>
References: <20260120105655.7134-1-christian.koenig@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some driver use fence->ops to test if a fence was initialized or not.
The problem is that this utilizes internal behavior of the dma_fence
implementation.

So better abstract that into a function.

v2: use a flag instead of testing fence->ops, rename the function, move
    to the beginning of the patch set.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-fence.c             |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c | 13 +++++++------
 drivers/gpu/drm/qxl/qxl_release.c       |  2 +-
 include/linux/dma-fence.h               | 15 +++++++++++++++
 4 files changed, 24 insertions(+), 8 deletions(-)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index 21c5c30b4f34..c9a036b0d592 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -1054,7 +1054,7 @@ __dma_fence_init(struct dma_fence *fence, const struct dma_fence_ops *ops,
 	fence->lock = lock;
 	fence->context = context;
 	fence->seqno = seqno;
-	fence->flags = flags;
+	fence->flags = flags | BIT(DMA_FENCE_FLAG_INITIALIZED_BIT);
 	fence->error = 0;
 
 	trace_dma_fence_init(fence);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
index 0a0dcbf0798d..d1e74d0050c7 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
@@ -278,9 +278,10 @@ void amdgpu_job_free_resources(struct amdgpu_job *job)
 	unsigned i;
 
 	/* Check if any fences were initialized */
-	if (job->base.s_fence && job->base.s_fence->finished.ops)
+	if (job->base.s_fence &&
+	    dma_fence_was_initialized(&job->base.s_fence->finished))
 		f = &job->base.s_fence->finished;
-	else if (job->hw_fence && job->hw_fence->base.ops)
+	else if (dma_fence_was_initialized(&job->hw_fence->base))
 		f = &job->hw_fence->base;
 	else
 		f = NULL;
@@ -297,11 +298,11 @@ static void amdgpu_job_free_cb(struct drm_sched_job *s_job)
 
 	amdgpu_sync_free(&job->explicit_sync);
 
-	if (job->hw_fence->base.ops)
+	if (dma_fence_was_initialized(&job->hw_fence->base))
 		dma_fence_put(&job->hw_fence->base);
 	else
 		kfree(job->hw_fence);
-	if (job->hw_vm_fence->base.ops)
+	if (dma_fence_was_initialized(&job->hw_vm_fence->base))
 		dma_fence_put(&job->hw_vm_fence->base);
 	else
 		kfree(job->hw_vm_fence);
@@ -335,11 +336,11 @@ void amdgpu_job_free(struct amdgpu_job *job)
 	if (job->gang_submit != &job->base.s_fence->scheduled)
 		dma_fence_put(job->gang_submit);
 
-	if (job->hw_fence->base.ops)
+	if (dma_fence_was_initialized(&job->hw_fence->base))
 		dma_fence_put(&job->hw_fence->base);
 	else
 		kfree(job->hw_fence);
-	if (job->hw_vm_fence->base.ops)
+	if (dma_fence_was_initialized(&job->hw_vm_fence->base))
 		dma_fence_put(&job->hw_vm_fence->base);
 	else
 		kfree(job->hw_vm_fence);
diff --git a/drivers/gpu/drm/qxl/qxl_release.c b/drivers/gpu/drm/qxl/qxl_release.c
index 7b3c9a6016db..06b0b2aa7953 100644
--- a/drivers/gpu/drm/qxl/qxl_release.c
+++ b/drivers/gpu/drm/qxl/qxl_release.c
@@ -146,7 +146,7 @@ qxl_release_free(struct qxl_device *qdev,
 	idr_remove(&qdev->release_idr, release->id);
 	spin_unlock(&qdev->release_idr_lock);
 
-	if (release->base.ops) {
+	if (dma_fence_was_initialized(&release->base)) {
 		WARN_ON(list_empty(&release->bos));
 		qxl_release_free_list(release);
 
diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
index d4c92fd35092..9c4d25289239 100644
--- a/include/linux/dma-fence.h
+++ b/include/linux/dma-fence.h
@@ -48,6 +48,7 @@ struct seq_file;
  * atomic ops (bit_*), so taking the spinlock will not be needed most
  * of the time.
  *
+ * DMA_FENCE_FLAG_INITIALIZED_BIT - fence was initialized
  * DMA_FENCE_FLAG_SIGNALED_BIT - fence is already signaled
  * DMA_FENCE_FLAG_TIMESTAMP_BIT - timestamp recorded for fence signaling
  * DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT - enable_signaling might have been called
@@ -98,6 +99,7 @@ struct dma_fence {
 };
 
 enum dma_fence_flag_bits {
+	DMA_FENCE_FLAG_INITIALIZED_BIT,
 	DMA_FENCE_FLAG_SEQNO64_BIT,
 	DMA_FENCE_FLAG_SIGNALED_BIT,
 	DMA_FENCE_FLAG_TIMESTAMP_BIT,
@@ -263,6 +265,19 @@ void dma_fence_release(struct kref *kref);
 void dma_fence_free(struct dma_fence *fence);
 void dma_fence_describe(struct dma_fence *fence, struct seq_file *seq);
 
+/**
+ * dma_fence_was_initialized - test if fence was initialized
+ * @fence: fence to test
+ *
+ * Return: True if fence was ever initialized, false otherwise. Works correctly
+ * only when memory backing the fence structure is zero initialized on
+ * allocation.
+ */
+static inline bool dma_fence_was_initialized(struct dma_fence *fence)
+{
+	return fence && test_bit(DMA_FENCE_FLAG_INITIALIZED_BIT, &fence->flags);
+}
+
 /**
  * dma_fence_put - decreases refcount of the fence
  * @fence: fence to reduce refcount of
-- 
2.43.0

