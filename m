Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB999844A3
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 13:31:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E0F110E884;
	Tue, 24 Sep 2024 11:31:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ASsH3cXe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D60A10E883;
 Tue, 24 Sep 2024 11:30:56 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-5c46680a71bso4634119a12.2; 
 Tue, 24 Sep 2024 04:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727177455; x=1727782255; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=3lXuDq8mG8Oox8ReUlOYfBHI57TTAdm6VM/42FD3opk=;
 b=ASsH3cXeP3sDNI9gXXsmWd468O4+aPltAwom1tIq1mpX01VMx5NvwXfJoCdj/jR/CF
 Vx0bzpF8pLVdDlwq/StkC7H3cSV3uFmX6qV58azoY8aYeJeJpaYuDsdhrtfn5v+IJO2p
 rBKyJYimw83jeLwPSYeRZBsOlfYIasILpbbEMjnIZcscnXhaMhvayz4ylesJYddai7AA
 GVu06AbM9Y0l/Wczkg/D8/nBHVrxHd4qx3M2oJwjL+OKgDjFbWRDrhURXNCE5SA84rpm
 OktC3X7Q2DAiJl3DRSV3LrTfIYNbawJg7r2H7p67R7V3YfVwuHMiCYVwP40kcQNJ0Xts
 +Qbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727177455; x=1727782255;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3lXuDq8mG8Oox8ReUlOYfBHI57TTAdm6VM/42FD3opk=;
 b=t9nMouopNRQclyrMMjCxyWAIGgj/3rYTaTlSnjJmPtzZiEM5Feq1hdw+EUuCXFDQT7
 euXTS7O0+f4AW+UiillS9YFNbbCqfX1kBSyCIIoNBoRYxOtZgNu+cGpLwU5HdRlacd2A
 bYGGhxQK2a6/BfAqRZ4kvycXFQPjxxW8HE91avvncxzwx0F6XjcMhZNACFLWowdAx/w6
 MkEescxtv5CELsE9Lz8lgUFIb5A3+DFxSOcE/NxoLAjxsWZwlhXqOQ4ELNQvpRokuv2m
 TmXVu+Gj0DQ1tuujLOLVzcnKtD4HLvTW9xnZ24R5VBPOWzjB6kFzbC/S/EbawNoSfzRG
 463w==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+I+f6rCOCa6VNUOs/mpbMRM0oCu0nRTxIPhC7C/+uTDRRN1f2IL5WDaRpfnorrvwYTvO2RUbkV77r@lists.freedesktop.org,
 AJvYcCVKbq15VOFDIPAfdvCBFMvs/jShgBo/9YZ7y8COCBK0xLshnCICw0oM1mmTOIrAxTAEcsv8MQZ5rAo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw9/QdyT3tWwDCzH/hcjhdtduBw0gODKWFRvRlyNJ73AiDDij4F
 7Ep4omzEYCy4O0qk5wzoOM4YUiaf9jTI2AWjkBngNLDNbSc7Rvvj
X-Google-Smtp-Source: AGHT+IGu8AttCAIBHfv1YZLNJdKkGKNVsZjY6wH+lgr+bfXwxH+gFnbtz84q2ql3MMebddfRAKG26g==
X-Received: by 2002:a17:907:d3e7:b0:a8d:250a:52a8 with SMTP id
 a640c23a62f3a-a90d4fdef2dmr1569419366b.3.1727177454688; 
 Tue, 24 Sep 2024 04:30:54 -0700 (PDT)
Received: from [192.168.1.17] (host-87-7-171-42.retail.telecomitalia.it.
 [87.7.171.42]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93930cae0fsm72612766b.120.2024.09.24.04.30.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Sep 2024 04:30:54 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Tue, 24 Sep 2024 13:30:44 +0200
Subject: [PATCH v5 09/11] drm/msm/A6XX: Add a flag to allow preemption to
 submitqueue_create
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240924-preemption-a750-t-v5-9-0be2bf81c187@gmail.com>
References: <20240924-preemption-a750-t-v5-0-0be2bf81c187@gmail.com>
In-Reply-To: <20240924-preemption-a750-t-v5-0-0be2bf81c187@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727177437; l=3416;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=hkIxVGWeKmryC2eLYVINRVq4p3WNWoRnKE3ce5L9CRg=;
 b=Vi0qPyqWGnrGlNn+hFPyJvdZHwCxpOKUhTamx90KhXi066loDgG9kVNR4wqG1ZaEzkxQBEsg0
 FL7cRelkg/hCed0Zzokcufmgj6lKbaQMN0/+7JfuNwQ1GVMAy4c7e3L
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
index 736f475d696f1133c9e55d16aa80e73fd46cb835..edbcb6d229ba614be910ee70e75731538116e4a4 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -430,8 +430,10 @@ static void a7xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
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
@@ -462,8 +464,10 @@ static void a7xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
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

