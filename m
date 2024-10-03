Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E16A98F3D3
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 18:13:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76EFC10E8C3;
	Thu,  3 Oct 2024 16:13:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hUGXb2LG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34F8B10E8BF;
 Thu,  3 Oct 2024 16:13:17 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-a8d446adf6eso187261666b.2; 
 Thu, 03 Oct 2024 09:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727971995; x=1728576795; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=GaBqv3l4/WCKzGjMEH3Rq6W4qRE735ngmioA8VJ8pMU=;
 b=hUGXb2LGMYlJ3ZjIWBf0h9pJFfNISDPf5r2JZv8iAwcK6bcC+YYln6isrPUrdl55Tb
 cTvwOPxhf9/SsF2rX+dOcxJijx3vHlFsGKG2j73cNes/dfprdEXKmzFFo8s83fBptY92
 KGCFnarcCrGnCXpWEIzL7AlLf3sd3v03rd6TUFxAWhbK4KVxixlW6bdzJ4IC9URqAoFf
 jsPrSMx5FRjo42fQboiHGDDXRlwMS7CGtm01QZUVJf2bXx8AC/xNZImqKdEV7bknNB8x
 3FfK2T4/PK0GuP791KKlDkES/40H17FKrth9J+wGtQNYNPoHdEDTP1RPPdKUmv571/zz
 zpvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727971995; x=1728576795;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GaBqv3l4/WCKzGjMEH3Rq6W4qRE735ngmioA8VJ8pMU=;
 b=E7k/usTJ4VyClCPElXWBKsMOSKMFfiuEMLFCltiG60Qxt/Gya63GFGcNzjQ1LGS2Hk
 B3NGCzmzQReiC3TOadt+4/umxaccw5Pn/GGKdL7QQr3gqmLclEyq2OuhCBJgfKbczSJI
 30pBh0dTgv0gCEKj/wDeSkEZndZE2G0n7zcumWg+FwJnvp2sf+ekKs7oIjm/AQKxx+tL
 sbLFWrO3yGlrLy8pfTlwGZQo2x2K541edBk4e9PASSusLk3jyk9N5zlpbJ5dz/80J3xi
 tKhRnY57wMelcl7a1ETlhDcTxh/xoek4M/JEKRCfjCjXvDOAVy5DZd66ii8xo8glPOuD
 VQBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/iWLL45lX86WtSmonfvfAjWDocw4Ficj+Pkp+70yvHB2i3CygT/b4nqhoaXG9HP9diS0U7SpEOkk=@lists.freedesktop.org,
 AJvYcCUQJdJ1sszpZkig2wOup3sZeabY2xFnaWXgtzK4mKCaWGSl5ETxsHurWxRuIyIS4ExE/2NodccRlcUM@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwzMRGEAECvznNd3lQT17wEoEBHQkBMlJnuuXhkvjMnc9FeKS5A
 DDAVdpX5nJWva8uwXgUEpc30T+FYz7b9y1ES47ioxLnuCXM7NJnc
X-Google-Smtp-Source: AGHT+IEXjwXCGQzu4SkG+rm26oYPXXKheXbthTe32ChjrbrwiGYdPSoCV9GUf3MdAEpzrqClGYe78g==
X-Received: by 2002:a17:907:1c9f:b0:a8a:71d5:109a with SMTP id
 a640c23a62f3a-a98f8234339mr801214866b.22.1727971995477; 
 Thu, 03 Oct 2024 09:13:15 -0700 (PDT)
Received: from [192.168.1.17] (host-79-12-161-203.retail.telecomitalia.it.
 [79.12.161.203]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a99103b314asm102382366b.103.2024.10.03.09.13.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Oct 2024 09:13:15 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Thu, 03 Oct 2024 18:12:59 +0200
Subject: [PATCH v8 10/12] drm/msm/a6xx: Add a flag to allow preemption to
 submitqueue_create
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241003-preemption-a750-t-v8-10-5c6cb9f256e0@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727971975; l=3460;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=uZ9we3Ys2coi5h7xjntXCEGFqTbjLPlewrihZEQPd7U=;
 b=gT9f+nS11o8O39VF9BELYlkLKW0ZRa2NGKwagdc2e/BPRLzaZa4j52+qXrh2RlN1k3/BUgbSY
 t8ULbKCipeCCy1FfG40I2A6Sgve4OwNBZS9A6KH6iUmJvtSE13V8GDO
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

Some userspace changes are necessary so add a flag for userspace to
advertise support for preemption when creating the submitqueue.

When this flag is not set preemption will not be allowed in the middle
of the submitted IBs therefore mantaining compatibility with older
userspace.

The flag is rejected if preemption is not supported on the target, this
allows userspace to know whether preemption is supported.

Tested-by: Rob Clark <robdclark@gmail.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8450-HDK
Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 12 ++++++++----
 drivers/gpu/drm/msm/msm_submitqueue.c |  3 +++
 include/uapi/drm/msm_drm.h            |  5 ++++-
 3 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 9b486ec08f77933c3666549a16d915aa2d2188b0..2f7c93e74e097a78510700d2c6607d052cbdda66 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -352,8 +352,10 @@ static void a7xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 	OUT_PKT7(ring, CP_SET_MARKER, 1);
 	OUT_RING(ring, 0x101); /* IFPC disable */
 
-	OUT_PKT7(ring, CP_SET_MARKER, 1);
-	OUT_RING(ring, 0x00d); /* IB1LIST start */
+	if (submit->queue->flags & MSM_SUBMITQUEUE_ALLOW_PREEMPT) {
+		OUT_PKT7(ring, CP_SET_MARKER, 1);
+		OUT_RING(ring, 0x00d); /* IB1LIST start */
+	}
 
 	/* Submit the commands */
 	for (i = 0; i < submit->nr_cmds; i++) {
@@ -384,8 +386,10 @@ static void a7xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 			update_shadow_rptr(gpu, ring);
 	}
 
-	OUT_PKT7(ring, CP_SET_MARKER, 1);
-	OUT_RING(ring, 0x00e); /* IB1LIST end */
+	if (submit->queue->flags & MSM_SUBMITQUEUE_ALLOW_PREEMPT) {
+		OUT_PKT7(ring, CP_SET_MARKER, 1);
+		OUT_RING(ring, 0x00e); /* IB1LIST end */
+	}
 
 	get_stats_counter(ring, REG_A7XX_RBBM_PERFCTR_CP(0),
 		rbmemptr_stats(ring, index, cpcycles_end));
diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm/msm/msm_submitqueue.c
index 0e803125a325aa67639406ef413aaeb6a9f08cee..9b3ffca3f3b471f509918edd4a2fdb0f80dfeb06 100644
--- a/drivers/gpu/drm/msm/msm_submitqueue.c
+++ b/drivers/gpu/drm/msm/msm_submitqueue.c
@@ -170,6 +170,9 @@ int msm_submitqueue_create(struct drm_device *drm, struct msm_file_private *ctx,
 	if (!priv->gpu)
 		return -ENODEV;
 
+	if (flags & MSM_SUBMITQUEUE_ALLOW_PREEMPT && priv->gpu->nr_rings == 1)
+		return -EINVAL;
+
 	ret = msm_gpu_convert_priority(priv->gpu, prio, &ring_nr, &sched_prio);
 	if (ret)
 		return ret;
diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
index 3fca72f738614a3e229e1017fe4f2ab61cd98bdf..f37858db34e602ce8b92dceccb60d4b6bdcda877 100644
--- a/include/uapi/drm/msm_drm.h
+++ b/include/uapi/drm/msm_drm.h
@@ -345,7 +345,10 @@ struct drm_msm_gem_madvise {
  * backwards compatibility as a "default" submitqueue
  */
 
-#define MSM_SUBMITQUEUE_FLAGS (0)
+#define MSM_SUBMITQUEUE_ALLOW_PREEMPT	0x00000001
+#define MSM_SUBMITQUEUE_FLAGS		    ( \
+		MSM_SUBMITQUEUE_ALLOW_PREEMPT | \
+		0)
 
 /*
  * The submitqueue priority should be between 0 and MSM_PARAM_PRIORITIES-1,

-- 
2.46.1

