Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 409D1966591
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2024 17:33:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A37D210E373;
	Fri, 30 Aug 2024 15:33:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NTpbURO2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FDAA10E21F;
 Fri, 30 Aug 2024 15:33:17 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-a8684c31c60so227792966b.3; 
 Fri, 30 Aug 2024 08:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725031995; x=1725636795; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Ow4BKSNXeJuwl4BWibh52xw/cDIJ4gXhuaEoDSj5CrM=;
 b=NTpbURO2zSD4YY3cwEKvoWDTVq8iG9WXDgQDd9SeYnXpJh/tReYF9CFXELamAN4zSH
 U43jEfwYl/8OuU/r/ZUxSMAr2LVo5PbVTZ7wmiPoq5uUczmoMxqS58hU/exN46CgcQOI
 bMT9Q/NOr/dmDB4w5j6Sw7R+yR4kai5oYZoZeT6GWZ1Jzq6ZZ8UASE+51+HnqFTKPBE1
 4wlAuturdKYq7O0nX1lRFzlNt+CdRmC/p+haVvQCnIxBFdwfftikHRJh9yQqtqBm8RYw
 f6hMHrTdhOyE6nQLpfzC8ZByw0u6+EgeavLcpL+CRycvK1kA7OoDQU059wG+wTCThx68
 j1CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725031995; x=1725636795;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ow4BKSNXeJuwl4BWibh52xw/cDIJ4gXhuaEoDSj5CrM=;
 b=gZXOmHmqqA1Er0VN753dnOBJhl8Mot0a6PXH1orVfqTeGTals4l80W74+VfvI31Rmc
 a0bRgFiiH/Yku1QPYWZgbK2MV9KRoagIbC9F1pRjqTFmF5bBhpwi7yjQOP8zsviWS4sY
 7SkxFKz57nhppDvYTZozMLVM/UX9Nd7GV4lvMcy9wTCFuSRyGe4KmG2ZVbS279UJKBPf
 e+s+Q2jZR/QKFZUjPbcXEEpukwJTjpsfJ4qKrAq/rhpI+SIJ2M2dOnG2b27rEspm2sdH
 SwobIsDvILFWAyQIvQFMvKkl/bYuZjWJF1OHf6smsWrD19t3ijnbynz7pj+HK1sHUhS3
 EAGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTOlGo7XAugAG4JG8ZqiUAgRxV8S1ksNKURbQ4/N+EPp8oSv1xyqEueASWS6a6HaOxbqmxxMq8vitx@lists.freedesktop.org,
 AJvYcCWigIB+5iGukhkGUgpNlSUg7JSy91mXidhBtA17s257QUzZ4zm6EQ+hUKC7hU6ATuZebF1mZrLZzAY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz5gmsFerMD3Ag4pLA/61S43bok/tWquO2dKd/BdahHyuncAVr0
 Jim9JhB9gA5ckWT1AGFOvKrpq1cLxF7Nhsl0/8WoKOOn/n3ZPo9J
X-Google-Smtp-Source: AGHT+IHeWzyBK3/Rb0wAVxcifNA9MgfBUVYtmBN6K76DeomNylK7id8vZAxQplW4+3vbTvlIOlrm9g==
X-Received: by 2002:a17:907:1c23:b0:a86:8165:1802 with SMTP id
 a640c23a62f3a-a897fad8ccamr471207366b.66.1725031994977; 
 Fri, 30 Aug 2024 08:33:14 -0700 (PDT)
Received: from [192.168.1.14] (host-95-234-170-37.retail.telecomitalia.it.
 [95.234.170.37]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8988ff4233sm227157866b.25.2024.08.30.08.33.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Aug 2024 08:33:14 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Fri, 30 Aug 2024 17:32:43 +0200
Subject: [PATCH v2 1/9] drm/msm: Fix bv_fence being used as bv_rptr
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240830-preemption-a750-t-v2-1-86aeead2cd80@gmail.com>
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
 Akhil P Oommen <quic_akhilpo@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725031992; l=1564;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=V6jkAeJmIPNRJFej3NR/GIrK2ICQj0XykO4lOq0cjkM=;
 b=Yvj0xkSArHF9jxkL4DQg3HmZFs66B/DCv6oN2e8qM13O0VoJVQPSL11L9kqMhHh3jx+WwQ6iJ
 3wDZimVfbVDAiZbnjK0GHpwlhRdCgk93U3Z06TgRfVdhgLoSA1A3OfX
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

The bv_fence field of rbmemptrs was being used incorrectly as the BV
rptr shadow pointer in some places.

Add a bv_rptr field and change the code to use that instead.

Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 2 +-
 drivers/gpu/drm/msm/msm_ringbuffer.h  | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index bcaec86ac67a..32a4faa93d7f 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1132,7 +1132,7 @@ static int hw_init(struct msm_gpu *gpu)
 	/* ..which means "always" on A7xx, also for BV shadow */
 	if (adreno_is_a7xx(adreno_gpu)) {
 		gpu_write64(gpu, REG_A7XX_CP_BV_RB_RPTR_ADDR,
-			    rbmemptr(gpu->rb[0], bv_fence));
+			    rbmemptr(gpu->rb[0], bv_rptr));
 	}
 
 	/* Always come up on rb 0 */
diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.h b/drivers/gpu/drm/msm/msm_ringbuffer.h
index 0d6beb8cd39a..40791b2ade46 100644
--- a/drivers/gpu/drm/msm/msm_ringbuffer.h
+++ b/drivers/gpu/drm/msm/msm_ringbuffer.h
@@ -31,6 +31,7 @@ struct msm_rbmemptrs {
 	volatile uint32_t rptr;
 	volatile uint32_t fence;
 	/* Introduced on A7xx */
+	volatile uint32_t bv_rptr;
 	volatile uint32_t bv_fence;
 
 	volatile struct msm_gpu_submit_stats stats[MSM_GPU_SUBMIT_STATS_COUNT];

-- 
2.46.0

