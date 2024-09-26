Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE1F987A65
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2024 23:17:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2810210EBDF;
	Thu, 26 Sep 2024 21:17:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FYNMyTz/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE6EE10E21A;
 Thu, 26 Sep 2024 21:16:58 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-a8d24f98215so194131966b.1; 
 Thu, 26 Sep 2024 14:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727385417; x=1727990217; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=xhEk8RuEr+Jxg4Bk7Vc0/8COm679tekr0FDZbumhOZg=;
 b=FYNMyTz/zyAKykSekrg0QFnexCFYQv3lZmdvyP2tMd3TSU7+42vDLcNVU/nGeOIIqI
 Ow5jNb1LhDvsI85W/80kidF7c0Uc8n2OVodLdT0Flz5EKyBxkN2SHao5qtDS8B7ecuQH
 6HfnW8026KdPeNp+lcTV2y77HpNrz61LIpy0OmP0OWEnyQ43xpjSloXLgihgA2DOz6cL
 /EBGdtykhvTnmvJQeiWVfw5X+xjfz7J6xBmXQcU9HS0dA6YriEZJkyb6HBolJ5qRA5fc
 v1SqzVHIhjSl9982c383lpQvMVlqj7gKLcx2JpECeif1m22/xhN4vZXppuPnKTZqbkXe
 mTCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727385417; x=1727990217;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xhEk8RuEr+Jxg4Bk7Vc0/8COm679tekr0FDZbumhOZg=;
 b=nJL4xcZlR8QoBmrgQK6mNA5n0d8835UK9IUeQA2orUUozmEe6uqNSVSke7r+xzEtpH
 q+agc0EAdJpzTbidLPbI0Z0gXQ3/AGmOQQT2HewnScKLHnZQmxSj+rxTKRYI8smAiFJb
 tzncxlBgeKqNAXCnecnVVlsqWTiDOs0KiYUfP0y1HiGN91dl0OGZUs+bbcDIOeul9sM/
 SdAJMLNJpy2Q7V4/M6a/8ZR+Tim9cPhT7oGAU2/Zzp3afhNHXHwUvFXrvYPapJ5PFSwd
 QdRmW+tgwK3JR/77nYsnHJ3nptD+YbWnjta6XFpliI8VZ/TpmEEaSKrdNKgFZLBWYbgK
 aV9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVR9N7zZ30lkYlJ5lDC6lnZT2oGwLtJfwMIzbPd5CtLaQgaxwZnFfUfLch/EX5Nmga/Zt9cF3/TwJ8=@lists.freedesktop.org,
 AJvYcCWor6xnJVWEa9kVwm9o2NwaZDFW4eWsRcZGjBZyBkC1rr/8XB1u0/hcmIkZASXj18lga4rJdIyKoHRi@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxhDtNq61R0C8yb6SFkIKL5z1HGuY9VI42dufKcoCfMjLP1GG6b
 JpZoACrbYGPDs6oJFAs3VIm6fR/2N7ICqloLOXNVAs8p4M6tpdlgHdDta1zT
X-Google-Smtp-Source: AGHT+IGtt+t+Af5mg7EyuUZyXyVhphpGMI7KE1Ez8k428+chJA0fQWwTgH4qOXmeHsjClRMG8Hlkug==
X-Received: by 2002:a17:907:3f22:b0:a86:8ff8:1dd8 with SMTP id
 a640c23a62f3a-a93c4a61db7mr64371966b.46.1727385417044; 
 Thu, 26 Sep 2024 14:16:57 -0700 (PDT)
Received: from [192.168.1.17] (a-lu6-5.tin.it. [212.216.221.196])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c297b7d6sm38862166b.162.2024.09.26.14.16.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2024 14:16:56 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Thu, 26 Sep 2024 23:16:43 +0200
Subject: [PATCH v6 01/11] drm/msm: Fix bv_fence being used as bv_rptr
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240926-preemption-a750-t-v6-1-7b6e1ef3648f@gmail.com>
References: <20240926-preemption-a750-t-v6-0-7b6e1ef3648f@gmail.com>
In-Reply-To: <20240926-preemption-a750-t-v6-0-7b6e1ef3648f@gmail.com>
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
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727385413; l=1818;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=8ChbnJhsvl1xm2NLNpkzia7Mqz9GSrQ1hXSsZqycXm8=;
 b=pHX2PTo2RuaylcDsM37sIS1jp15/MvbG2l9GP2Utp4rHO0/VlOujPmqW1J8fQKGaiGdPmbItq
 UxIOy8OFADSAANr2ahvBzateCWxQ5Wb7FPYUlk/96zJaBgcwJpjSuxB
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

Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8450-HDK
Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 2 +-
 drivers/gpu/drm/msm/msm_ringbuffer.h  | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index bcaec86ac67a5c90544922372cd46fbdd8cf359e..32a4faa93d7f072ea6b8d949f4dc9d2a58cec6b9 100644
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
index 0d6beb8cd39a7b297e73741d2018915246a710d4..40791b2ade46ef0e16e2a4088291a575d3be9e82 100644
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
2.46.1

