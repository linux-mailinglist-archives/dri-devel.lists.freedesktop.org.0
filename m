Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 500C396659A
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2024 17:33:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BECC410E5A0;
	Fri, 30 Aug 2024 15:33:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ihrda2KN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40EE710E54B;
 Fri, 30 Aug 2024 15:33:27 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-5334b0e1a8eso2591067e87.0; 
 Fri, 30 Aug 2024 08:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725032005; x=1725636805; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=GAQ4Y56zZFeFqXatAlfS+XxAWMpxFW6Iq0fWmOd0/MM=;
 b=Ihrda2KNzKWf8/LpY06h9eEp4k1s/MyFVGKBFjmF5wWm2dzjyanbavBjQ/wtYcBSLE
 BdzNiqHsz3muDKSugC0gT/6R5ehhF92OjdWcrJwRJ3PVLCqcvcnVJLhzjC5PkGZDY1sx
 5SFxNoSO6kerD0XXo48eUdryl3q8nCpq1tpYUjSQthTlzZfLeznOqiTsigPZspbeE9kM
 G7qXF3cPJitQh5jzIjk6wgnVeXYi/hoWdnxJXxigK2h1NHWYPZK8IaG5Y1/Qbjia7bnF
 WNXM/u0t8Mj3q6CCh/KSIVlKZSCn6dge9TbcngRUoElFcGig7MS6N0Kh9TSllhe+oCkx
 GoBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725032005; x=1725636805;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GAQ4Y56zZFeFqXatAlfS+XxAWMpxFW6Iq0fWmOd0/MM=;
 b=RuKtgob7Yfs0F6dVpgb4EibHN6688+WkfCWXDF0z+blvZLhmi8C18lbWWQrW9uwl93
 bwRkUK94W62aR40HM8Oft21UOouXjAQ3+XE1m+EHwE0XmA/xq6lZR9eKsazMBV7RfoIw
 ejwCCRUh6b0XuRrEbnNoRcpvvu9K4oay0QNsGfOtSs9mfqnb2yWggUrqvio7IvgEIUqu
 vtKEXLRFXuwwzEhbg4V/0JFOFP7eTgXCXBjmJ3n+Evefr9Y+OCAQcA+6huTEd61J0THp
 Iqd3PwDaZI4Ne1DzdlMRM3+2CtRwQxqiXdWhx9MycVmRnFDTRwSiE/yFpW018KxOu+xO
 3SYw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDeVWkLrzbObLb5ktxLv6K9Esn0goxsKRx3Zze1R27umizLGjIuUe0S4ReuL/YWYdTEKhkFfQPFOU+@lists.freedesktop.org,
 AJvYcCWVbUbwqS9s5x9ElaiBruCO2+CJAUwW/nej28RUUZQhgkH6OY9n9/Yz5L2ydEUix+njzWyNDa1U7b4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyjKIzpJIf/J78a8RM+tv692Ge9KfataK7UTOt1lVT6NdAVluTh
 0NU1qLglle+qLITHtcf1FBdacOEW5ASCsmc4ZoBwTGTQjPmbFxRu
X-Google-Smtp-Source: AGHT+IFrmbjxavNlt437RWbF9abPwKhWWT5ynpxuvY6puJC5bTzQLJxMVE4JEXeVIH/ZuWZtbiGnDg==
X-Received: by 2002:a05:6512:1055:b0:52e:f950:31f3 with SMTP id
 2adb3069b0e04-53546b44404mr2277523e87.35.1725032004878; 
 Fri, 30 Aug 2024 08:33:24 -0700 (PDT)
Received: from [192.168.1.14] (host-95-234-170-37.retail.telecomitalia.it.
 [95.234.170.37]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8988ff4233sm227157866b.25.2024.08.30.08.33.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Aug 2024 08:33:24 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Fri, 30 Aug 2024 17:32:50 +0200
Subject: [PATCH v2 8/9] drm/msm/A6XX: Add a flag to allow preemption to
 submitqueue_create
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240830-preemption-a750-t-v2-8-86aeead2cd80@gmail.com>
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
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725031992; l=3100;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=PCj5f1TShzb01/l1DYjouxmbSmeDYaltjowx7/IScpU=;
 b=7mDqV5QllX8WInTlkofz+vJR1xyo96/uN8HKCGeRqD0QSMiGIkIFPqEIDXmwOnG7h3gn/t9XQ
 SqnyfO+F2BFD2xtlIzOyHvAWkygc51T8o5ez2VLIuQlfsYkDsID1xcL
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

Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 12 ++++++++----
 drivers/gpu/drm/msm/msm_submitqueue.c |  3 +++
 include/uapi/drm/msm_drm.h            |  5 ++++-
 3 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 3528ecbbc1ab..a2853309288b 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -465,8 +465,10 @@ static void a7xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
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
@@ -497,8 +499,10 @@ static void a7xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
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
index 4ffb336d9a60..0a8fc4262026 100644
--- a/drivers/gpu/drm/msm/msm_submitqueue.c
+++ b/drivers/gpu/drm/msm/msm_submitqueue.c
@@ -176,6 +176,9 @@ int msm_submitqueue_create(struct drm_device *drm, struct msm_file_private *ctx,
 	if (!priv->gpu)
 		return -ENODEV;
 
+	if (flags & MSM_SUBMITQUEUE_ALLOW_PREEMPT && gpu->nr_rings == 1)
+		return -EINVAL;
+
 	ret = msm_gpu_convert_priority(priv->gpu, prio, &ring_nr, &sched_prio);
 	if (ret)
 		return ret;
diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
index 3fca72f73861..f37858db34e6 100644
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
2.46.0

