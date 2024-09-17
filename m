Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2CE797AF54
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2024 13:14:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5817E10E053;
	Tue, 17 Sep 2024 11:14:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gf1nnW9S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6353210E1B0;
 Tue, 17 Sep 2024 11:14:18 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-5c3ca32974fso6775792a12.3; 
 Tue, 17 Sep 2024 04:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726571657; x=1727176457; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Ow4BKSNXeJuwl4BWibh52xw/cDIJ4gXhuaEoDSj5CrM=;
 b=gf1nnW9S2aD6hDpS1p4oyGBxv2vjXiwIJF0i3ipUvNMONjs/hV9o92lfsiocKNvyPD
 f/wOY5ow7aY/oerTCS6tOcxA4wczh/+ONItpVuhezXQmxutQZTNt8zSwd2xxcffD05sV
 CxaSkZga3K7pJVHODXG8spM/IpdVioeLT6XZchPnfCim9AlGn/ESX/kR/qIUzS6VCtSR
 18txcvItiSkiDce5c/YYpp0gX4oGJewiGWi1XN+8m9PTUChkmjAA+lrV45LQ+jkpd1qq
 03XM/JkU/Ze2DaAfB+47zZ/IKJuly96yjavQv/zMR/vvBcj2BJSXy7IzYKW/mJbzOeAA
 OBWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726571657; x=1727176457;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ow4BKSNXeJuwl4BWibh52xw/cDIJ4gXhuaEoDSj5CrM=;
 b=Idppwb1YAYhe9hND4kuGIz8u57RQ7AZaaXXhUc3J9S7TvLkeqQMC6ysRUyBcabWyOa
 0ijISKbI3EmzZMDY1fYkFa0P238z1rMYTiHEfN5l4t+FIUcQ9r7yXjJqpv3vxsXXH6yA
 1yr39v//7NUutCdRDezwQEVOggXrJBlNEl2Ny3XaDTfGMpx0MuKHZ2L/y9UMP9WNamzp
 /IwZCbAVPpumAXIhkWspMOkFn1eAW9HvyyiTFwaa4S/N0kcApkLOo6H+Wekwg70CRYEC
 tPF6XPHbMXZaRDgTRzyngiPGKb3XDL1w7Lo6Wzs7OBnponhlaP9SKugTM+26ZCb+u40B
 msOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUWZ/VtA/1q4cfN0v0cJA7ZdKjnFVul38Ja1hVd2fVF4atYA9wwhavfkczurZFlXn9KwQFeAxbqStI=@lists.freedesktop.org,
 AJvYcCWS2xBsD/EGhgNnAMjQVlR7yo5rYTUHFO1AvQ0e/IxBmol7CafvDyMmLbqJo8WYvDbqbVu+vYs1QscM@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy7VUXBfMINTKclj1v5nxvrDJvgVgBX2nlhQ6EwlMdry5vMBHBA
 WfcPM7cURmK0yCk1Amh7mgwgnKZbUbeNKm8Bczn106VOAUoq7b9E
X-Google-Smtp-Source: AGHT+IE/JEdEsep3i02jeqUmwx8Ak/gIHQRnh0eocuiJyK9cVkQdx3+N5Uy2ilhfE2iIYQdc8HcBSw==
X-Received: by 2002:a17:907:d2e4:b0:a8d:3705:4115 with SMTP id
 a640c23a62f3a-a90294ae850mr1696024066b.32.1726571656667; 
 Tue, 17 Sep 2024 04:14:16 -0700 (PDT)
Received: from [192.168.1.17] (host-82-51-105-30.retail.telecomitalia.it.
 [82.51.105.30]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a90612e1a55sm430745166b.157.2024.09.17.04.14.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2024 04:14:16 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Tue, 17 Sep 2024 13:14:11 +0200
Subject: [PATCH v4 01/11] drm/msm: Fix bv_fence being used as bv_rptr
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240917-preemption-a750-t-v4-1-95d48012e0ac@gmail.com>
References: <20240917-preemption-a750-t-v4-0-95d48012e0ac@gmail.com>
In-Reply-To: <20240917-preemption-a750-t-v4-0-95d48012e0ac@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726571652; l=1564;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=V6jkAeJmIPNRJFej3NR/GIrK2ICQj0XykO4lOq0cjkM=;
 b=8uPB0FH7LZTwiL8pSn6PqMzESFVVqmDiWrjTqy1UsNfeHhJZtkUQjX2qg/TP5hSTOR21VRZt3
 PoACEWqiaVkDSINz8O8HZp/5pkQ4sALnF7Cly9ae5qbgXuvdV9ZgOE3
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

