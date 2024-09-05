Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD7896DC7A
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2024 16:51:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C38A610E8EF;
	Thu,  5 Sep 2024 14:51:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Hl+q6piB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57E4610E8F2;
 Thu,  5 Sep 2024 14:51:41 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-5c275491c61so1087817a12.0; 
 Thu, 05 Sep 2024 07:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725547899; x=1726152699; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=tf5oppR7ZrPY04ZNHiHuSxDIc4JVyX4YALpOAdUkRCM=;
 b=Hl+q6piBXl6YR/0aOmzdUh97r477NZbMCaF2UQy2dn+rc0lFebJmo1QGo00J97Upyw
 Pl8Gp1J2+0rXDDF0nlzO2nKHSL49bf2Cp+LOt42xUm+75DUjFCEmeEuPido5iKb7Kimh
 2reHDlN7cWyXNVngQ6HtsklrztynuQQB2jl6LPRxJjOoiajHz6iX6Cix6lTcOPqWJZtx
 XdqhlhTo1Of6+Ayfl9ECBjEw3QkE6BpRl71EStTuSAdYBgyQhgN3yPU//AOnoQIg0y/A
 KPdCW1Qg4Dup9W+uf746Pcm5YMlAljNYyWH24rh+Lswvdxu99rvLxFOhEvmLfQBpkwVU
 1oPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725547899; x=1726152699;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tf5oppR7ZrPY04ZNHiHuSxDIc4JVyX4YALpOAdUkRCM=;
 b=eN3SfxxM9bHV8s6A4sRamwkZhcKltn+oxrN0A/yX6BokIB6ImV3X6CyJkNXxEJkRQl
 N6hFC7qUuFajeoBFMbm3TiPHL0mZLbs4qS7ZsmjpyQjXJmUeB5kzY319jcHuBkIVAEDS
 Bst2MelLRIyEf0xORwwS3v0g1vtcmqz2T5CmeoVm8No2yCOdFsbJo1excFbnE147TJps
 8lA72VNhQZH3ajzPvGyg3RB8+/dfq8ehthmLRneBeIsTWxhs0GZ+EKE+Zlj6E1ZYJHV3
 6y/CdKGYmdoqcQ/mPUHb41NV25l5IcgJImLDVr5JWNguIt477s2MRh9BercGIp4AeQiV
 fdRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhHey8Tw+jLMtwxdbvBoRi8vQtMkaUeguf9QZZf2hbLZ29GlhoLhIAIWzVUBpY1iLCw/RYqa3FcJQ=@lists.freedesktop.org,
 AJvYcCVz4Fexz9v9aGPiGnFu/SwSMrWBvT9uWyorxWegPyuSDTuvY+rq3oXP5o6EEwqcvX/R36N6JJJJpksZ@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxEPmB2y5LhB+ZTh+0xEIDgfBY66UQ3/U51utEH+6Ih0//mCYZl
 7Etd59cB1ABoKZSQAU81WColLPqrCDVj0x19GXM10NGAnGqGxCdB
X-Google-Smtp-Source: AGHT+IHQgG0o6Lvo8CgGzxCxC0nzr8TQzRlSTuMdOFpflPLgPBM+rOwzsIkMd6J2HKpNXeDSdmrkNQ==
X-Received: by 2002:a05:6402:27c9:b0:5c3:c4d9:5e1e with SMTP id
 4fb4d7f45d1cf-5c3c4d96141mr4076303a12.20.1725547899514; 
 Thu, 05 Sep 2024 07:51:39 -0700 (PDT)
Received: from [192.168.1.17] (host-87-16-167-153.retail.telecomitalia.it.
 [87.16.167.153]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3cc52b376sm1320732a12.7.2024.09.05.07.51.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2024 07:51:39 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Thu, 05 Sep 2024 16:51:26 +0200
Subject: [PATCH v3 08/10] drm/msm/A6XX: Add a flag to allow preemption to
 submitqueue_create
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240905-preemption-a750-t-v3-8-fd947699f7bc@gmail.com>
References: <20240905-preemption-a750-t-v3-0-fd947699f7bc@gmail.com>
In-Reply-To: <20240905-preemption-a750-t-v3-0-fd947699f7bc@gmail.com>
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
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725547882; l=3106;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=I8Bhra+oCMavu7JjL/p4zBs7zmYCVxxAvz/Rp0feUEU=;
 b=1w0Vk0UbTMSsc4jB2uyCG35rkfNX4+rVX5LoJyiiiCDZHHtp6v1xa7gk52PW7kK7tqbAQpgvh
 Q7OU5wahRgJAhMZwpF8yv7XA76BiFN7o3gn641c0Gv2Of/VkTfdRFsL
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
index 710ec3ce2923..512ff443bd2e 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -453,8 +453,10 @@ static void a7xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
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
@@ -485,8 +487,10 @@ static void a7xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
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
index 0e803125a325..9b3ffca3f3b4 100644
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

