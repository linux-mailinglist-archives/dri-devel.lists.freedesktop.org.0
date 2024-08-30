Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85ACC966593
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2024 17:33:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A96D710E3FF;
	Fri, 30 Aug 2024 15:33:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AMyQRfak";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFAB510E308;
 Fri, 30 Aug 2024 15:33:18 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-a866cea40c4so221781766b.0; 
 Fri, 30 Aug 2024 08:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725031997; x=1725636797; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=fLP9MMqmlzma4Utv0dqtZOgr60uqrWrjrfDUuDPUx3U=;
 b=AMyQRfak2mPMtdZcopnysasGLtUXlnBpvlhHWudVR92qjbsjSEz/+msKpMgeTzfn23
 5Cb6GU3PVJBu898BpGQwxCbr0/ax2eN+Yhk86k2gHCYs6j+wEhfXK7op41QocSzWNXc9
 3IpXiQDjoIWoFwQM1Iu6j3HCwbSZv2N8Wz+IjVB3pstwI4K1DrSeC/bWB92E3PVMdZ4C
 kQUjWI6gypgxEroKJJEXMli/vVAR5MURWlWOtOo4QyVTSdsqNXeYUKKxi6unliC8RvyH
 nRG41I6RBXt4ss+shCOmGAicENrPQPJiTl6GjQm6d0Zg7Y4eJXCtSI41b/WefeqN7ahq
 mn5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725031997; x=1725636797;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fLP9MMqmlzma4Utv0dqtZOgr60uqrWrjrfDUuDPUx3U=;
 b=UfEKU1+/lwjnjdLn1vq0uj89kgu+jCQIush92EEZ9+9od8TuKCzE4Vh17grxFKEEuk
 xPt8JWBVR7R1gm5Nhe/GNPZ6efryvjMq3Z3tBBJtDGuSzV8j8eV6msuCUDooampNHOzi
 ZJpEQPml73iV/cASsOP8OnwtP6AUX/FlCAwh7PbAvyRDAEDfSYDRwZFwogvMTMISZ0W2
 XF96MdGsp8y5E28Nb57AaozWQ4RKq1s27skLQajv5xzwLTBXUDJ/XbDaAXkfGprBBHDK
 mVnQMhyuegqNRt1cFefs6a1dnIiBwewyC6LnqVZD9Fjr15v8Y/1/fnFF+cYWRD/h4jxL
 1MFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0iyka2nQhiaMCAKU//TmICdIfQCf6zAJflfLneuFgArRM1I9ZDOJOMfSoWET5AuIMgX20d7JGxYaf@lists.freedesktop.org,
 AJvYcCXCbR/CNlIJpWkxjmb5Xj28zqDYBStgNVGd+oEpWYADTzD8Cqxf2DnuTZ18nCzAkAhrQSKFn6pSHy4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxRlk5YdMaSIJVdYfhUclBh803Gia2MZS/UtGR5Jw3Us0g0Hfnt
 sR+30pbAP1dMZg2h775ehWhHwoVHAXew+BT62YeZGKr8mns9B6Yt
X-Google-Smtp-Source: AGHT+IFB0Eg3VkAh1DIRgGbi7bwBedE9tblqW19lKkJGY0O2LvCfm80WTAFkD/+wMRC0IFtmh+DdSA==
X-Received: by 2002:a17:907:97cc:b0:a7a:bcbc:f7e1 with SMTP id
 a640c23a62f3a-a897f84c6b0mr491658166b.15.1725031996411; 
 Fri, 30 Aug 2024 08:33:16 -0700 (PDT)
Received: from [192.168.1.14] (host-95-234-170-37.retail.telecomitalia.it.
 [95.234.170.37]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8988ff4233sm227157866b.25.2024.08.30.08.33.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Aug 2024 08:33:16 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Fri, 30 Aug 2024 17:32:44 +0200
Subject: [PATCH v2 2/9] drm/msm: Add submitqueue setup and close
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240830-preemption-a750-t-v2-2-86aeead2cd80@gmail.com>
References: <20240830-preemption-a750-t-v2-0-86aeead2cd80@gmail.com>
In-Reply-To: <20240830-preemption-a750-t-v2-0-86aeead2cd80@gmail.com>
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
 Sharat Masetty <smasetty@codeaurora.org>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725031992; l=2803;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=SNycjyoxgs2R64kDhGpyPBIuNCmi08MxqbM4Ak2n75U=;
 b=4lg4CjFBFiR1VcFRym09hQaN8fde3H/adBBPW536N9kMF7E8pPNoiY8tK30KYqrnZ/i+e4Oh1
 mlG49Coh+BMCSSAQZg95jq2F7h+OuMMlACL9PvA4rIlUCgTHVdp5SGl
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

This patch adds a bit of infrastructure to give the different Adreno
targets the flexibility to setup the submitqueues per their needs.

Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
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

