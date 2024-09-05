Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3257496DC6A
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2024 16:51:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DD4C10E0FA;
	Thu,  5 Sep 2024 14:51:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fUFhYp2e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 088BE10E0AE;
 Thu,  5 Sep 2024 14:51:29 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-5c3d209db94so587227a12.3; 
 Thu, 05 Sep 2024 07:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725547887; x=1726152687; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Ow4BKSNXeJuwl4BWibh52xw/cDIJ4gXhuaEoDSj5CrM=;
 b=fUFhYp2edV3R//abyBblunS620gxaElQFyR+KrdZtYcwC2K4ZsjfVgJ3myXyIQYfnZ
 MOzdUSnJKNlNH/Ancq+eG7OYQnuMB8hoiCW8d0tivSSqZOICBtGehtS+XP1yaLSl4Fv2
 OtLLi+8U0Qjo2U290o8RJ9lJZ9tsKZlliwlhwmZ6GErt7XdE+wrZncKIS924eTSoPV4j
 HqspTz8hxavncAb/j7+FbsRFyHfhZ0hTLtLgTnPYTSa9SRC4XT8GnOQRQ2AdJ4QHLzeL
 BWbg9YbrOq3YA6PgnVtoQcPXmhNyjT2yDgjM46GVkEvmtdiaGWByUDBW6yvi/+ei4N/b
 D4Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725547887; x=1726152687;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ow4BKSNXeJuwl4BWibh52xw/cDIJ4gXhuaEoDSj5CrM=;
 b=OxT3w14AC7piWHQvTWaH/dZanTpDtP4zPKihN4OTu0E6piAnFnC1mcXWTDoK524VWo
 Gs1bXSQhea5QrIGu6SG0uEvR3NrBI7eJm+AKBXXFPYZ+4UlTWkMuK3UvqSb8z3/H3kWs
 roziBiqdTjdnwJSw54uLuu2gKYhQYfay2W0NpzhJVs8FyecRLwxfsQ8piPOuAobDlWRc
 Brm0qtj2ywjBLzMRiEEeG8ZdqEoBWd7NXLFEK3TyCbSp2eYh4NGK7VINK95ppJoFE//Y
 NbvGKK5jeBLEoO+1jSxrXAk2r6Q1ZkzWmzthLTFvxfaxHO26hHjEnwRpE30n0lABMj9l
 CyOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWtZERPdC1pv6LOZaTyRHNUhddAagCeMtXXaiGetgrA/HSfQ3H6JyVKfiTf445unYmKYM5K3/qkw/o=@lists.freedesktop.org,
 AJvYcCXOAJTen/GR9JehsJjmPzARWJdc9tqdRkSe5MpAHrXvtRQ33nuuw6hldzt043WLZdbdC7ravDJWEQWL@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxeKYO93UHphf+tgzUnFbf5rIK7D2EL/nf9SIopJOocD1qzWHW3
 7m9D0yuxDoNsn3qPIX3Z5RVu2fJzvdruhtSCmbpHFa7sWA1X7Kcn
X-Google-Smtp-Source: AGHT+IGVVAHqzv7b2TCmV33xgpFCR5V8XVKiiovwL94i8vFogrt3mL4xpG0SrMZPZpw0NssCUYZK9Q==
X-Received: by 2002:a05:6402:d08:b0:5bf:17f:4b7b with SMTP id
 4fb4d7f45d1cf-5c21ed9e756mr18240652a12.32.1725547886416; 
 Thu, 05 Sep 2024 07:51:26 -0700 (PDT)
Received: from [192.168.1.17] (host-87-16-167-153.retail.telecomitalia.it.
 [87.16.167.153]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3cc52b376sm1320732a12.7.2024.09.05.07.51.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2024 07:51:26 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Thu, 05 Sep 2024 16:51:19 +0200
Subject: [PATCH v3 01/10] drm/msm: Fix bv_fence being used as bv_rptr
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240905-preemption-a750-t-v3-1-fd947699f7bc@gmail.com>
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
 Akhil P Oommen <quic_akhilpo@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725547882; l=1564;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=V6jkAeJmIPNRJFej3NR/GIrK2ICQj0XykO4lOq0cjkM=;
 b=KAu0wB1v9ysnVLr6XSAHW5K4Qht7Ky2VuMd+Fpz6pG2z9NmrrMaqzRb9UQaNIYxmvCJLZ1JdX
 WuDmv9kl1cxAruaQfYpL3cJGP3828Up9is1EZOBG7OgddXywszz8neU
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

