Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC0598A607
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 15:53:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B94310E511;
	Mon, 30 Sep 2024 13:53:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ap//yD/V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F30BC10E50D;
 Mon, 30 Sep 2024 13:52:58 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-5c5b9bf9d8bso3181039a12.1; 
 Mon, 30 Sep 2024 06:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727704377; x=1728309177; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=GaBqv3l4/WCKzGjMEH3Rq6W4qRE735ngmioA8VJ8pMU=;
 b=ap//yD/Vf27KX+09SmGDY6kwcLp9EnyfjS+Ez5nIiix4ArXiCFFuo+gv9ChRFcTvoU
 h4cg62dMlIHAd14YgaMJQjUa2SDxM6+p1hR8R/G6ZuJHZvwFb/A+cxPF+sJ6PMcWEFBj
 w4E1w1JcUWcBH08YZR9rZcytfNO4eoVV7UwrxjgZ0qsfy80B6IHCZYetMJ6R9zYGZa/f
 Z1ZiaHlGmY3UwClpteHwh5uIssWmL3cVJ6WHFeFmVfITxZq1noAb8heES3Yv1t1RTenU
 Wo74IzlLwcOJ10n9Uc5mmsjXi5DXZJE2yLn4V0oJc0B5oZG0cvg07SRKiiH0byFpkFhj
 AxQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727704377; x=1728309177;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GaBqv3l4/WCKzGjMEH3Rq6W4qRE735ngmioA8VJ8pMU=;
 b=tHUp9hleFjIsIDYVk+XKZrDoV5Oj7z3PRQrFren/HwYst6We1/lR8UesNhAQi/a3NG
 KP5ea+B9DfhKzo/9uKEGGFFgwLsxOMSWWmYme8bXPJTuXYsrCxq+TiDU2aHNo3xgNYCR
 lw9l+I5PZo0EQyxkZsNphFN1F4yN/x9/H3T86HWaFC0eoxuJ4Nju0uk939+pd9nG8L8O
 /bvqkrxEwxokz++3hl/K1ReUmXjQaj4P6dF8yjpfYP681ez9sptdfaSYs3y4cfSR/Fo3
 1DR7j6sk7RrLFk0ZFDxtTMgkFkJhCOiaEa31NvY19hdlWbR8DlxsfOsFidp+RGF0QB10
 Av6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3N+Sa5T4W/Iy3J57sgzWoVC6YXn1mepp3G3mmG9K3qP6X/RKRZMWBOLdwo61eChdLhCgPtokE2b0E@lists.freedesktop.org,
 AJvYcCUKbvg2QRua26ffZciWXaB5Dxo9lRr8xysm61mzG9wNii/ZoCa9LvtigxAclQb6c9XUFhHNuy+nlpM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzWVyPuMgU34d6qBdpReffdFCI2yFjR1UZWUPxqt+Dm0D6k63p3
 uDnW6G5OV1SqDNojo19w+6r/Yy0Nyn/1TSg8sOuvZqEFpjTInA73
X-Google-Smtp-Source: AGHT+IGyYZohwzEfRJ7JukdiTs8/AiEIC8Om2PpNLoQy2qZlKN5ofJCR+FAIXgB/nwG2DcHZxweFdA==
X-Received: by 2002:a50:cb87:0:b0:5c8:7915:4c7e with SMTP id
 4fb4d7f45d1cf-5c88260f0b3mr15486219a12.36.1727704377170; 
 Mon, 30 Sep 2024 06:52:57 -0700 (PDT)
Received: from [192.168.1.17] (host-95-250-55-22.retail.telecomitalia.it.
 [95.250.55.22]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c88245ea57sm4507540a12.55.2024.09.30.06.52.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Sep 2024 06:52:56 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Mon, 30 Sep 2024 15:52:45 +0200
Subject: [PATCH v7 10/12] drm/msm/a6xx: Add a flag to allow preemption to
 submitqueue_create
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-preemption-a750-t-v7-10-47803c7a5a64@gmail.com>
References: <20240930-preemption-a750-t-v7-0-47803c7a5a64@gmail.com>
In-Reply-To: <20240930-preemption-a750-t-v7-0-47803c7a5a64@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727704357; l=3460;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=uZ9we3Ys2coi5h7xjntXCEGFqTbjLPlewrihZEQPd7U=;
 b=2TPTL/YXg14iDfwte1tR4l2sYS8/mBRAuGnLsTzxp2aNQbsCRHYAvbOOZCfaJ7Xjhtmj4jjt9
 /VFKfHR61IUBQM69D3zvhVX0nBQBxzj75/f9CMixhtVwT7oZ+4LEZD2
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

