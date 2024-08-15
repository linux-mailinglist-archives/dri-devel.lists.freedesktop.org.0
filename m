Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93CE49542E8
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2024 09:39:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AADA310E5B8;
	Fri, 16 Aug 2024 07:39:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KP6KJPl0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C1FE10E4E8;
 Thu, 15 Aug 2024 18:27:41 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-5bd1a9bdce4so1629629a12.3; 
 Thu, 15 Aug 2024 11:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723746459; x=1724351259; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=IJZcAdXengnxQsRuBCfXSm3/IR7ldhfXkm+AS24y8lo=;
 b=KP6KJPl0V4LH8ng39rItus3Ic9tOA2t3BSOMl2Yyik521ao5okoDXfvz9VKJnkCE7g
 rgh3kLw7t5WyWADcJPhvBJRdZlzUtVcy9Z0woX5jau1IKyDT7BXkx7uBBNF7piZ2U7RF
 t3v267JmMeidHyj05QbAg0R+41MppFHH3lf9Z/tPe6tioKGqZ9/sVWkWlqgvM3cYju7R
 KCqhKCiqLGBgUdr0JonaxaztrO6qOBbLkYeXw0tL36f/5mndOr8NtJHfLV2Bmi/E3rv6
 zbniEDTUAnQj3/M69YH4J5Vj6ALxNcXmTBvxGLykUj0HAQWGNpA9GjU9WaI4gz72ni2T
 guFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723746459; x=1724351259;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IJZcAdXengnxQsRuBCfXSm3/IR7ldhfXkm+AS24y8lo=;
 b=EZE64qbQS+fmqXn7sHJybmE5q5y3tKG8XGZ2WTn5NKn0xxTnIlPjwtcdRGdFTbeM5r
 i7GTknYrpITCZ+uardMOCYf4KdCMl/YiLTUQKGfNesMQfDUk71CDcwpRXYW+9tJf3Nyq
 sTr6hblCKtLOY07w0gLsyqwkfj6PuzFEw95tFRh3CnQLUXTuxLZxSMXXBjc8GptfRJoe
 ZTD/y2xdYQT6mfU+kQDx5tvoSJzWxpC1lmZIJt5wTQq+LLa5xW0eMFxGa9sKgqimcNyZ
 3jkxDO/u6eM0/djHnT/Z1kCQiqPHM80/ulOktPWxM7jFk0Qjaq6HJOmEXCc5sL4m9M7t
 uz3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxGL/QIsL0FrFVejbmcxNLaEARlV6vcVPABBt9mKVIb7IJCsgwDSgJLQmVpRcgocVtmFiW3d73Em7bGcFy1ESKDATz+zjDOE1zQJt2Y/sL/C5nZadv7//v/B5OmQIVeZW021cL4fO1XgC3JmTiILc7
X-Gm-Message-State: AOJu0Yzi1H921QVe1/FMcYxHFjNlWrBrdIcPOP54wG1gDXpB1RrHT6Yl
 /Yk9GALqe7PIQiz0uwfJp4pOn4+JV9Q0ipGcRkjh2ddcUfdsa+qv
X-Google-Smtp-Source: AGHT+IHF29C4IC0GAOmzG1LjmAPZsf2ZGqUe1rN816bkCVSN1Wb+2P06Jr/oWhrvp2Jca9UErpPefQ==
X-Received: by 2002:a17:906:d54e:b0:a77:aa6d:e0c7 with SMTP id
 a640c23a62f3a-a839293e973mr28486566b.30.1723746458735; 
 Thu, 15 Aug 2024 11:27:38 -0700 (PDT)
Received: from [192.168.1.13] (host-79-35-172-29.retail.telecomitalia.it.
 [79.35.172.29]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8383947187sm133814366b.166.2024.08.15.11.27.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Aug 2024 11:27:38 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Thu, 15 Aug 2024 20:26:12 +0200
Subject: [PATCH 2/7] drm/msm: Add submitqueue setup and close
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240815-preemption-a750-t-v1-2-7bda26c34037@gmail.com>
References: <20240815-preemption-a750-t-v1-0-7bda26c34037@gmail.com>
In-Reply-To: <20240815-preemption-a750-t-v1-0-7bda26c34037@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Antonino Maniscalco <antomani103@gmail.com>, 
 Sharat Masetty <smasetty@codeaurora.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1723746454; l=2616;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=20oAYS3mWUIGbiEDLsRaCMFHZNrME6mT7hQZgI2Sra8=;
 b=vSb1NAIThr44gOy1adLEVkRxa/kzpiR9f4HJ/bpnUqNFI0dToOp74LyZ/El4114l5ebgPe7oT
 7zYefoUGrPpA0Sj1m4eI+T3puPlPLI0vLUu2IaZ+1tO/TWm9qvPGIln
X-Developer-Key: i=antomani103@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=
X-Mailman-Approved-At: Fri, 16 Aug 2024 07:39:16 +0000
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

This patch adds a bit of infrastructure to give the different Adreno
targets the flexibility to setup the submitqueues per their needs.

Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
---
 drivers/gpu/drm/msm/msm_gpu.h         |  7 +++++++
 drivers/gpu/drm/msm/msm_submitqueue.c | 10 ++++++++++
 2 files changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 1f02bb9956be..70f5c18e5aee 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -92,6 +92,10 @@ struct msm_gpu_funcs {
 	 * for cmdstream that is buffered in this FIFO upstream of the CP fw.
 	 */
 	bool (*progress)(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
+	int (*submitqueue_setup)(struct msm_gpu *gpu,
+			struct msm_gpu_submitqueue *queue);
+	void (*submitqueue_close)(struct msm_gpu *gpu,
+			struct msm_gpu_submitqueue *queue);
 };
 
 /* Additional state for iommu faults: */
@@ -522,6 +526,9 @@ struct msm_gpu_submitqueue {
 	struct mutex lock;
 	struct kref ref;
 	struct drm_sched_entity *entity;
+	struct msm_gpu *gpu;
+	struct drm_gem_object *bo;
+	uint64_t bo_iova;
 };
 
 struct msm_gpu_state_bo {
diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm/msm/msm_submitqueue.c
index 0e803125a325..4ffb336d9a60 100644
--- a/drivers/gpu/drm/msm/msm_submitqueue.c
+++ b/drivers/gpu/drm/msm/msm_submitqueue.c
@@ -71,6 +71,11 @@ void msm_submitqueue_destroy(struct kref *kref)
 	struct msm_gpu_submitqueue *queue = container_of(kref,
 		struct msm_gpu_submitqueue, ref);
 
+	struct msm_gpu *gpu = queue->gpu;
+
+	if (gpu && gpu->funcs->submitqueue_close)
+		gpu->funcs->submitqueue_close(gpu, queue);
+
 	idr_destroy(&queue->fence_idr);
 
 	msm_file_private_put(queue->ctx);
@@ -160,6 +165,7 @@ int msm_submitqueue_create(struct drm_device *drm, struct msm_file_private *ctx,
 {
 	struct msm_drm_private *priv = drm->dev_private;
 	struct msm_gpu_submitqueue *queue;
+	struct msm_gpu *gpu = priv->gpu;
 	enum drm_sched_priority sched_prio;
 	unsigned ring_nr;
 	int ret;
@@ -195,6 +201,7 @@ int msm_submitqueue_create(struct drm_device *drm, struct msm_file_private *ctx,
 
 	queue->ctx = msm_file_private_get(ctx);
 	queue->id = ctx->queueid++;
+	queue->gpu = gpu;
 
 	if (id)
 		*id = queue->id;
@@ -207,6 +214,9 @@ int msm_submitqueue_create(struct drm_device *drm, struct msm_file_private *ctx,
 
 	write_unlock(&ctx->queuelock);
 
+	if (gpu && gpu->funcs->submitqueue_setup)
+		gpu->funcs->submitqueue_setup(gpu, queue);
+
 	return 0;
 }
 

-- 
2.46.0

