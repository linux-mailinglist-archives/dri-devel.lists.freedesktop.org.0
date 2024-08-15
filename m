Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D02239542E3
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2024 09:39:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8585410E5B3;
	Fri, 16 Aug 2024 07:39:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="IQ2yt28F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9EF510E4E8;
 Thu, 15 Aug 2024 18:27:39 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-2f01e9f53e3so19442741fa.1; 
 Thu, 15 Aug 2024 11:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723746457; x=1724351257; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=kfyNitr7n9IBeiytQhNaMqBxtLdQ27gFGfEYrZl43AU=;
 b=IQ2yt28Flnt5/cW6s4gd9CWZQT8kby8S7qVgVEPmKbuP6pXRJmdTzLgB5xTXiDvSUW
 qNnmDi0Zji/Yc3gP/T263OM+OPLXcklviRS9Oabz9Nz+FO+Kfh772n5ZHF4F9j0PUVoE
 3RQwM92KadroZhWrnqsxtnbSpubp7hUS/EkeMOViJvGpjS4ydSek1D3ep/HBX6CT/wDp
 tTRhtayYaqBPTF+Kpn+PR4Z6PnrxuPgXX75epe6DFsB0Xt1GIwK4H2hCeT9xm5BvHeyH
 KdjOq/0cyjRKU8Dc251AqM/45K8rmCOkSofp/8Ah0SUUZ1Y4L5drkQZ1EQaUaZQmC2Am
 qipQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723746457; x=1724351257;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kfyNitr7n9IBeiytQhNaMqBxtLdQ27gFGfEYrZl43AU=;
 b=ENK2l9j33t6mtIX10lWEqsZG599C50hJBLSG8Loazvu6FlxYGATZ+5DG+TA2XMfcmW
 eEnLD79KQz7dOnx6h6xYl9/8hgcyDp6jTe20lYCjP5fmin2+JcJkslQ7KlUsEX7XiZYj
 ZPDX7R5EFEyRmMgZqVe0mTBZNYJYT9LMfRvosdXqLqHA1MY7ZldtuRQerH6/G8hBaAoL
 i/VhaN6tZBjFUdwkr3U+PheKD442SkZWyddz6rp42tY+LASJ1EVfHXlATYft+Vh2LltB
 7aTqQ0UVmCV9gHfvlbnuQqA0kHr2J5lvCAT8Bnn7ZrDv0BbbwNVLVsiPgdVRBFtRTSk5
 tt1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUBdl0KWsI9vO5rF6TwvSoRzg8fGcyRrfpLNwu0bx+22KRbvPxHqHaoPoi4Ub/8OeYDFtFNhq1sn/qylxTkPQecr0HdZs9A/VugvFcmyo2+MOC+4jdyvAe2kUiFNp5HlQ/1Pe2eNqGRiWWKaTE9a16j
X-Gm-Message-State: AOJu0Yy+s7hhQCz2Hhat8tp+vXZj0E3hDf9lwHkyKj4tKlWsAMFx4CkJ
 Qg9jtXuo4/vuh2ddZNc2cUm3JOG68x+kfcaBEYpcYPaGEBC7d/MD
X-Google-Smtp-Source: AGHT+IFBVz0TzJtS4M+sYECsv1VIhUSvNMY2XP3x5/1iARu7qmeuI+rqZuBoqE29ZD802zvcHsRFxg==
X-Received: by 2002:a2e:9053:0:b0:2ef:2e98:9718 with SMTP id
 38308e7fff4ca-2f3be583963mr4671051fa.15.1723746457166; 
 Thu, 15 Aug 2024 11:27:37 -0700 (PDT)
Received: from [192.168.1.13] (host-79-35-172-29.retail.telecomitalia.it.
 [79.35.172.29]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8383947187sm133814366b.166.2024.08.15.11.27.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Aug 2024 11:27:36 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Thu, 15 Aug 2024 20:26:11 +0200
Subject: [PATCH 1/7] drm/msm: Fix bv_fence being used as bv_rptr
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240815-preemption-a750-t-v1-1-7bda26c34037@gmail.com>
References: <20240815-preemption-a750-t-v1-0-7bda26c34037@gmail.com>
In-Reply-To: <20240815-preemption-a750-t-v1-0-7bda26c34037@gmail.com>
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
 Antonino Maniscalco <antomani103@gmail.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1723746454; l=1437;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=5UQUbB4gp80E1aCA4nhyaMM7cChO8qWJiCOBtxcnjyU=;
 b=WStWfdviZV2WJZlLrsE28/bmfEOARulhUrSCokZ1bsiJf3LoqdAH8EezgpQo+F4dfCNvp1rag
 EzGAwabZffKAK0pipd9g5pUbKWt31CzLyz3RML+2SXrAEHDR2OM2fKI
X-Developer-Key: i=antomani103@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=
X-Mailman-Approved-At: Fri, 16 Aug 2024 07:39:16 +0000
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

