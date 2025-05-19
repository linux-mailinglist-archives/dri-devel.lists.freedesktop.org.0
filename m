Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C147CABC65F
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 19:58:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC31F10E46C;
	Mon, 19 May 2025 17:58:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Wo2m2vMC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2469810E3F1;
 Mon, 19 May 2025 17:58:22 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id
 d2e1a72fcca58-73712952e1cso4481009b3a.1; 
 Mon, 19 May 2025 10:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747677501; x=1748282301; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C/IOEUaoWMiY3FcOTsLO0mCip4CvBTwhZvr3W3BIF6Y=;
 b=Wo2m2vMCKr2pQ3pVnHWGLcIQZ26AOWHTv/s1qS1d3z2PJ6iywEpvo5LynM7PhauOkT
 I5xE0piKsY8l9WDZymDgwX/QfAyf0ioYUEoEIy/fM49q1xskbmn1pS3Um5U9FvuHZz8j
 eF9VxiFSzJ7MZHtyD5DXZaCiiRzzdbJPfNnp9zj6T2vUGklZpf90/oXUgDVD/naUlAs1
 1XzyRw2nlBLybwloXne/Q/05aCJVbU3Yn7KJkZ/PRd6R+1D0dNjTsqpQAGUYBLEWqu68
 yg9/tH+Czsc8FgOwRtYIiG9SwCHcsX6RaaCkLuRtkVvxUzKl4WMvORGvHaFUWDoNLdj7
 +8JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747677501; x=1748282301;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C/IOEUaoWMiY3FcOTsLO0mCip4CvBTwhZvr3W3BIF6Y=;
 b=DydJvoIIeKgTzbXB+NiA1p3wAyAp8GvH3lMc/L3YGK5tC90yjyJ0HKJqKXjHVD2FrA
 QLWaeDwvorGXaBq7G1zbwhAsirTW+pCQ4oeYcu4NJ4L/kqtyEHKl9SYkhRV8vN45qPF+
 628zwQaPqKVdDw8WRNQEhzBYPT/zHfZbHJHnZCnir/hR4vmTnJnu1Kur74IGDWxJkhmU
 57kHIMI2VEBlTH7BnwrUThoV2keWWCyN6DhSyoh7L7zM95ues1i30S1+CO0DmueObpKV
 0EHF7SQTCxRCT1ZhZpp6T9o+BsJJc3cqX7+CpGFOas3pwJatXnFQD3E2edHrvma5KpOy
 kbqg==
X-Gm-Message-State: AOJu0YyEsxFs1jpbFlghHeab+jixB9ZbRmB0WCCO+37+XeEbsFJtS4hI
 K0/jfypkjqTnIvU4ZPOmEW8biwSo1mjSxVXjBFWywbwF6jmp92tvwDl+TiVNmg==
X-Gm-Gg: ASbGncs5X/SihelRtRcDIPM6Zo6f4NEbaPjbs1nTYAFSb6YeILHSVpq4FfVBKA/Sr8P
 rJSQ5LspBZkBEnZuxL39sNZYz++ewKWg7kUjBoH2hgMhggUNWHACuQx7TPVmtQjdHmHxrx7bpC9
 7e1vhK8TIvUA38c5YZ4nxDhMxevWAMAkeqvGfc9FmZ2UhGBHS83Kl3QMGMtNLag3KQctI2XMhaq
 DrCSowQQaIkZRPM7N1HNS+Ia/oGuU3gCYSA7le7+3kpXkjjHPX+AUw81ZNSFlPuhPAtEojmpC5O
 VeXNRA4ouyQTvo30s7v0dRGM9f4iiBjEz5Qje8rZvB2GN5RbDn66uba4pOCMW6wbRqpl+sUh7E9
 RBvWK+y1Ws3bGSKLNCea56G1L+Q==
X-Google-Smtp-Source: AGHT+IFIyFTDzMZF98uDkDCYSSBpvn7zLyPicAJGXxSwxhrsNbTAsiqbNsLjqrVwcxCyiEStsO/+9g==
X-Received: by 2002:a05:6a21:1089:b0:1f3:2e85:c052 with SMTP id
 adf61e73a8af0-2170ce31534mr20223986637.35.1747677501245; 
 Mon, 19 May 2025 10:58:21 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-742a970d7c5sm6778137b3a.67.2025.05.19.10.58.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 May 2025 10:58:20 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>, Rob Clark <robdclark@chromium.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v5 20/40] drm/msm: Drop queued submits on lastclose()
Date: Mon, 19 May 2025 10:57:17 -0700
Message-ID: <20250519175755.13037-8-robdclark@gmail.com>
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

If we haven't written the submit into the ringbuffer yet, then drop it.
The submit still retires through the normal path, to preserve fence
signalling order, but we can skip the IB's to userspace cmdstream.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_drv.c        | 1 +
 drivers/gpu/drm/msm/msm_gpu.h        | 8 ++++++++
 drivers/gpu/drm/msm/msm_ringbuffer.c | 6 ++++++
 3 files changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 6ef29bc48bb0..5909720be48d 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -250,6 +250,7 @@ static int msm_open(struct drm_device *dev, struct drm_file *file)
 
 static void context_close(struct msm_context *ctx)
 {
+	ctx->closed = true;
 	msm_submitqueue_close(ctx);
 	msm_context_put(ctx);
 }
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index d8425e6d7f5a..bfaec80e5f2d 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -362,6 +362,14 @@ struct msm_context {
 	 */
 	int queueid;
 
+	/**
+	 * @closed: The device file associated with this context has been closed.
+	 *
+	 * Once the device is closed, any submits that have not been written
+	 * to the ring buffer are no-op'd.
+	 */
+	bool closed;
+
 	/** @vm: the per-process GPU address-space */
 	struct drm_gpuvm *vm;
 
diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c b/drivers/gpu/drm/msm/msm_ringbuffer.c
index bbf8503f6bb5..b8bcd5d9690d 100644
--- a/drivers/gpu/drm/msm/msm_ringbuffer.c
+++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
@@ -17,6 +17,7 @@ static struct dma_fence *msm_job_run(struct drm_sched_job *job)
 	struct msm_fence_context *fctx = submit->ring->fctx;
 	struct msm_gpu *gpu = submit->gpu;
 	struct msm_drm_private *priv = gpu->dev->dev_private;
+	unsigned nr_cmds = submit->nr_cmds;
 	int i;
 
 	msm_fence_init(submit->hw_fence, fctx);
@@ -36,8 +37,13 @@ static struct dma_fence *msm_job_run(struct drm_sched_job *job)
 	/* TODO move submit path over to using a per-ring lock.. */
 	mutex_lock(&gpu->lock);
 
+	if (submit->queue->ctx->closed)
+		submit->nr_cmds = 0;
+
 	msm_gpu_submit(gpu, submit);
 
+	submit->nr_cmds = nr_cmds;
+
 	mutex_unlock(&gpu->lock);
 
 	return dma_fence_get(submit->hw_fence);
-- 
2.49.0

