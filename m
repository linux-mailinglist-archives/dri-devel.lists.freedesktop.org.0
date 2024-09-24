Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8550A98448F
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 13:30:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F08810E6DF;
	Tue, 24 Sep 2024 11:30:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hilQelKr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E19A610E6D8;
 Tue, 24 Sep 2024 11:30:42 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-a8b155b5e9eso801787166b.1; 
 Tue, 24 Sep 2024 04:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727177441; x=1727782241; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=xhEk8RuEr+Jxg4Bk7Vc0/8COm679tekr0FDZbumhOZg=;
 b=hilQelKr8DJlfaRYAI/+A5VYKqMRKhWKCnshSB/PFN7wm6tfX0Eo7RfjnC+mxmUFic
 YBsDyW4v1AxeT1QAtIrBaq74PWrLJwPoRZsrIWczsP4/90ilSkb24xXnsdpSypEKo8Cj
 OdrGjiWHBkRlXJeeUznLmAfCuNQUhb10tpSLuxaJWadbnB+7JQZkEvdWddkJRNu5FajR
 yXbXsQH9+B3Kv/v+UjrHYeS11RmCymHkLSSQ8QY34tlDKbxGiUriFnU+/rCNsyWOt46l
 xqKfmLEXFYvHlengD5TbX6dZSW6N2K2Bw822VAUpMPq2E5ZY1pfuuFbNJWI771+c7N8c
 INeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727177441; x=1727782241;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xhEk8RuEr+Jxg4Bk7Vc0/8COm679tekr0FDZbumhOZg=;
 b=Ps5goXilZGQKnV8S1zsMrprErriNcCMudnia9sJ7XIyjjxlc6rH7JURVRRMB/bZ42H
 pV68dwsWVp43vHrzEYqkl4mwYntxOG7nBilNZZWC4HsD7/c9gZPyKOLLuLApamuMpyUc
 cVLnjFm48vl7pfiAku4Mj7REuKOioly2UwL70OUWUbrqPNWgUbBIXyhBhzIInUIUWUXs
 om20o3jLRHbJqaT1aHg7pb4ny13lZz+Mig/9TNf5seE5EzkqC8FuRsCYEbUj0KGypoEU
 Z89Sz9i61YBZAkXCn4p1t+fAxuCjz4MoYByvdRVHMuRHpc3+XUNJ4t5E8vTQ0dwweo6y
 PHEQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVRaQF9ieD8lGY4hLxVrYAj4W36c4Il1GkumPLQEFmIeJt41+PWa+JCdfDYetwleADGFZg2+lg3Ko8=@lists.freedesktop.org,
 AJvYcCWVh8TEV2K0gTWc5/SM7LQJQyI/GfJbQ8KIzpX4Dd1AB7qTyOJhadjq7+anqkGO5075w2d4F9gHu++L@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yye/GR5CDKjTCyC3VltwBg9ZLHMjY5TUQt9KCwxSyZYViIDPG2I
 pZkUbwkkhiJyGdec+Wv+SaiDGtP+L5XfdFVyDIEdm52oo9GObSFT
X-Google-Smtp-Source: AGHT+IEB47FudAX7JCNJngwPYk4kmzjf2LR7tylu430I9j9S0enEL/QK/s1vCTKjnY4Em8rQP0cTcw==
X-Received: by 2002:a17:907:d2c9:b0:a8a:7e24:3230 with SMTP id
 a640c23a62f3a-a90d5003939mr1192917466b.28.1727177440995; 
 Tue, 24 Sep 2024 04:30:40 -0700 (PDT)
Received: from [192.168.1.17] (host-87-7-171-42.retail.telecomitalia.it.
 [87.7.171.42]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93930cae0fsm72612766b.120.2024.09.24.04.30.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Sep 2024 04:30:40 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Tue, 24 Sep 2024 13:30:36 +0200
Subject: [PATCH v5 01/11] drm/msm: Fix bv_fence being used as bv_rptr
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240924-preemption-a750-t-v5-1-0be2bf81c187@gmail.com>
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
 Akhil P Oommen <quic_akhilpo@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727177437; l=1818;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=8ChbnJhsvl1xm2NLNpkzia7Mqz9GSrQ1hXSsZqycXm8=;
 b=NWgR5bqLwe6ltaDjj1StTWNAv71dJDpvuM6gIiNO6ioLjdgdOVLhG9ge0SJ0flA/Y3Yfqq8G/
 YtoL+8e4er3CEWz5Eq2WZZw8Xy2J83SjWCYle5m3jtY9U9sQffjXlNu
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

