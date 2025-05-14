Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5741AB7382
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 19:57:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC68F10E6DD;
	Wed, 14 May 2025 17:57:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NwfTCb9B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C708C10E6E8;
 Wed, 14 May 2025 17:57:01 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id
 41be03b00d2f7-af908bb32fdso109982a12.1; 
 Wed, 14 May 2025 10:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747245421; x=1747850221; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C/IOEUaoWMiY3FcOTsLO0mCip4CvBTwhZvr3W3BIF6Y=;
 b=NwfTCb9BGfeUK307wIAPqo60QvLwCbEFx0+XcH+OaF5AxKBcUUZSo1fW25D3hJo79J
 6Ibww8uf6erHOYxU/YDgO4T+zlHRsmf/TRR2zjwrm5asTAu3w5FxbjUoJRI91nk3s528
 TdjCXp4EUrR2B63eBs8Wb1c3VW+k1OBGsbPZtmsY+ekgCThcvmaNtqaQsLmcrbbzXUH7
 SGNLw1l9z1MsTZjfZo2zSUAr3IXY4wP1ty08GHk3zhywOsckSgmtizsfWkr/qByM/xmJ
 tawjQw7Qkq+zUtgWc2sIf6ZPs/SI9R/qZOS9qUVZLUjUrmhXC7oOjAF6DGcAWHC5/6ug
 DWzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747245421; x=1747850221;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C/IOEUaoWMiY3FcOTsLO0mCip4CvBTwhZvr3W3BIF6Y=;
 b=qQg2UVEwTRFc21BBxKLPZQLi608laBAZI5s6aGV2rvcLv5CZrYG0X8cErWFBzOddvJ
 PO+xDh/GI2g/XwJhZAJDwgQvu/nJUOD7sSBton1t4dQSfmXCKy012/gPAcom/62JSld+
 F6imzaJ6JyZH1klp64xqglku4dJds/E0qyc3nCTCzFgB5osUDLxYGWynuVXQKCQnxFFk
 KGajnes9VS2B6edDX3EYw0wtNHPcPhx5DP+n0GdrIj4Vybst0RaaiN6p65WvK51uJSfs
 NZUoMOh10nAsLmIpAYzMUeKrN1ioAgacq+nP106JO6/RhO1+ciFjwjio7LfkK5AVnbiD
 F53A==
X-Gm-Message-State: AOJu0YykJBT3vfYxsBRVvNA9c1UU9EdrL8REMqFQbhx99kPaCcqUtaeK
 /LmPo5AOgmG3PjwcdDYAaBNiJBU8g45lldoa56+A+mlNxA9SXcDk0Jb7LQ==
X-Gm-Gg: ASbGncvEelQa21KJEfpoLO6MqM++h4ut80IWxSgy7hg6xOLx3z6+r0AVx2cklLglonG
 7Hog3SxwclQycBRHTA28SJLpmv8/42+jgIgxjTXh6EODW60tMAbSmmOST2o5Cpdaxk6jfb/gOuZ
 l4tCG1QKe1dk6GH9G2WFaYnNPYLy+1e7Kc6t8nQjpT8rAo7nXM6K0U8TZLVCIg18a4Q5HBM21/C
 bo5b3RnJvIXjtiRsOC80HxbEStd4pdn4hYPhAyQyTVAXBuUWxT2sk5QWP8KipV/kldZn83P7gZh
 zYirN928JTqL5JUe4lXO5k6970mnJnFgW4c2J0X/1keawuru82NzVCfYDZoj7ReIebW10qoN9Ef
 0bEjgHjVFRrgVwwokpQi2k7+TxA==
X-Google-Smtp-Source: AGHT+IFUKM5BrMcM042mpp/H1alkGpnJKLvV2czpR6D7makWbQdqOpUykv4v+aSD1r+VXOZpx/ThDA==
X-Received: by 2002:a17:902:f542:b0:22e:23c1:d711 with SMTP id
 d9443c01a7336-231b399df70mr7688625ad.16.1747245420864; 
 Wed, 14 May 2025 10:57:00 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22fc82a38d8sm101784925ad.236.2025.05.14.10.57.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 10:57:00 -0700 (PDT)
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
Subject: [PATCH v4 20/40] drm/msm: Drop queued submits on lastclose()
Date: Wed, 14 May 2025 10:53:34 -0700
Message-ID: <20250514175527.42488-21-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250514175527.42488-1-robdclark@gmail.com>
References: <20250514175527.42488-1-robdclark@gmail.com>
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

