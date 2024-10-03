Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F079798F3BC
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 18:13:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6088C10E8B7;
	Thu,  3 Oct 2024 16:13:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bDD9QAQV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E48110E8AC;
 Thu,  3 Oct 2024 16:13:00 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-a8d6d0fe021so188109866b.1; 
 Thu, 03 Oct 2024 09:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727971979; x=1728576779; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=MLrAGGRIrPLNX0fIU3MHlAkZUYfcrMnizkIk1EY/dAY=;
 b=bDD9QAQVF3H3S7eJVmsj+7R/f8Wuapt2DaIfKy0YgQn/jLApKErVteGvrJ7We5RV7e
 qtffQiD936cMDKN5o8RB0sUCu5xUUBq202vEJoHcFB4DIPTr2pSSQ6zpMdmDmQCfHhVN
 DiHdWsSRCx7Z5MRSUklz6Kg/2GVQ7AH6w+AmnS3YqPH623sywZkdmYdqGK0zZpSuMbrb
 m90vTQ4Gy/OLDD81bYIfNPivdkSd5uhgeJND9NOROEsmOhdTjHkFtWyqloPxMJRZ2C04
 PrEYkvBkRKBDIMykGpCcXRgabj5pzGNwu9VCyz2gwXxe0/VhV5gO6Bz6UdeTS5Y3Q1u/
 Bv0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727971979; x=1728576779;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MLrAGGRIrPLNX0fIU3MHlAkZUYfcrMnizkIk1EY/dAY=;
 b=vQ0NO4pJSDP7oRLwf78c2/ewBie5aZbZEU+S7BdmsVj0zxZbclM9iFV8nD1UwgNyt+
 n0++rpRV/TWy0S3ysL6Gz+q9WGNNgMlsVRsv3fsSjciGR08pceSb3hNz0J1DivqMBrA/
 3XZQU6kKMjvzxwp/zy1/xRysZtLilykyCRafng0HALZmE1WODLDvKGDBVXyUEpxKsgYI
 pRxR8OfQYDk3lJF0Lhpjs6JjTMbNgEEg1EOpDn+I+vwzSgGggnSlYIIOH92yytjVlS2B
 XFnxK4gFD/2QX9wDmX4jtbJDmDqNqEiIUGUk1mL/ZZm01l7jscnwL/SjQ2KuceFY19cc
 1tTg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWk67zGSZ3+4eQhObzftITyJWABTeHngjfErNu3ncX+oQ7NujRstrYV699ta4tM/u2WKhYAgberrfFH@lists.freedesktop.org,
 AJvYcCWvW1gaVoxhlM+qGJyauVJk1RVomx7jB5yctnHDGIRnx1eJ+5PYEgDnImrDcA2QQHTfYk3POjg9Azc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyGyoyXODDitqN5cjelDLO0O5zJPfI6d/uokczPlzzR+EPpRV13
 pcXeObThR7EAswbh1+uYtVPmtTm66VWrw5EaWGvww6gPp3ISawiU
X-Google-Smtp-Source: AGHT+IGM5Zca8lHIH3urol1yKb73CC7sbx8xGX58Lw0mbRqhf2dJkhWVdEEnVL42vMbQdzKn0MUHIg==
X-Received: by 2002:a17:907:9345:b0:a8d:5d28:8e0d with SMTP id
 a640c23a62f3a-a98f837b6c6mr566731966b.45.1727971978757; 
 Thu, 03 Oct 2024 09:12:58 -0700 (PDT)
Received: from [192.168.1.17] (host-79-12-161-203.retail.telecomitalia.it.
 [79.12.161.203]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a99103b314asm102382366b.103.2024.10.03.09.12.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Oct 2024 09:12:58 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Thu, 03 Oct 2024 18:12:50 +0200
Subject: [PATCH v8 01/12] drm/msm: Fix bv_fence being used as bv_rptr
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241003-preemption-a750-t-v8-1-5c6cb9f256e0@gmail.com>
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
 Akhil P Oommen <quic_akhilpo@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727971975; l=1862;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=a7i9oji+Kb0tTlTXnErd/GxgUbRIJJuFO80e+whAz5c=;
 b=dFWbauOYlLyo1yIzbd6BN2HyYlM/JboGwxDZJeazXddSBkCqLThvPU4p1EwM1NUDIMPvVoTqE
 tfS/mBscX7hDVM6S57Z4XDeSbWutmxY8ic8c851HnaJ6DNaPohkCR14
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
Tested-by: Rob Clark <robdclark@gmail.com>
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

