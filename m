Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77DF6937659
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2024 12:03:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F274710EB9A;
	Fri, 19 Jul 2024 10:03:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="yw7JpyN5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E77E010EB98
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2024 10:03:48 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-5a22f09d976so1177299a12.1
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2024 03:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721383427; x=1721988227; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=dojm5EDomrVj4JUg8oRrMk9Vwo9o7S9xTIkhL5loo68=;
 b=yw7JpyN5wBPnT5ss6FuwAubyflebKWr+/yuaNaadCCwX3DROW2JFVXsrLNyHPM0Djs
 16YbDcMEMn4DRvusDL2j1sqYr9JpDCGfBluvqMNo46GuK5gXXVhia0Ry3s79dGoKvwz5
 cJceTfTGCVn/w/tiqnC/zNxNoPlYFFF6SAAXQpIylIYbbH1VXmeJuH1wtfiwBWaQZDU3
 WLQsgeIQjic+8wnIeyT9uD6XERzTOcI71cscimEOJ/DF4yX6l2y/IN9q09TLI6ViM0xd
 CabXx94kVQngNvdN7nlS9yHtZ7fMYj+o2DoP1pT7AQatavtnoUr2vWb+0V5bSMC3QzUB
 Y8fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721383427; x=1721988227;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dojm5EDomrVj4JUg8oRrMk9Vwo9o7S9xTIkhL5loo68=;
 b=hWVYWP1fWRvu4LJ0AmL98cM0hEDJN9hK5fo30/blPAUr3ZDI0K5I8RrfB1zWfux6Qk
 s4gYuXtKMv/xHmXsCEETzU9vO93zcxoXz2T+xyCW+b3I77UTTQrfYtb7/ye6QGGRoJCj
 EnOr5YSg/i6KpxS10RNbqHLPpGWW122zRtVAoSBMKGEz/a0Ic+9zB6RJ1rp96KnXqtR2
 HqcQVvLwtPey3AM8e2RXZ+c66QnujEhdU/wGWL2OEZAMFqKcudFYg4g4kxciuJuyNEuH
 C8piYjMI6owIJbksJSpD45SdAwZcJb8DR7KYiWZxWzlDn7wFOE8GVKTDoajvgO0ZEYSM
 b59g==
X-Forwarded-Encrypted: i=1;
 AJvYcCV96xSx5e51DMYOaeA55MJTyDibKNOSb3zfX6oCnNenMCNZvbPm2BM+rsQQr56nnVtBUEZmNFjZbhhEoiXkm3NzShmwsCfJSxJOfNLrYfyu
X-Gm-Message-State: AOJu0YyKUNl1+/gGSw7thGkg5cHJn83pQ2H64FTrtsMErDCB/YecK+oC
 A3TgUFQZDQipvR8EEXlFGSb5jDPzu9kPN6n9RX1oyjZCEVOGfzFuNk0jNDfLTvQ=
X-Google-Smtp-Source: AGHT+IHnaB5YdD3StKR6m9it2+rtNPUKChRJh+O3ecDwUr1Ack0r/lnJpwK4dkqjy3s6ITmXYoebTw==
X-Received: by 2002:a50:9e48:0:b0:595:7779:1f7 with SMTP id
 4fb4d7f45d1cf-5a2ccb8bdf3mr1754758a12.16.1721383416050; 
 Fri, 19 Jul 2024 03:03:36 -0700 (PDT)
Received: from [192.168.105.194] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5a30aaa31e0sm919984a12.27.2024.07.19.03.03.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Jul 2024 03:03:35 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 19 Jul 2024 12:03:26 +0200
Subject: [PATCH 1/5] drm/msm/a6xx: Evaluate adreno_is_a650_family in
 pdc_in_aop check
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240719-topic-a621-v1-1-850ae5307cf4@linaro.org>
References: <20240719-topic-a621-v1-0-850ae5307cf4@linaro.org>
In-Reply-To: <20240719-topic-a621-v1-0-850ae5307cf4@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721383413; l=964;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=izI20aXStgBYgn8HFsWluR+V7mVSO1GycmUKfkzqj9I=;
 b=4Q/jMz+9CswuFRv6acP1RY9tHUiRpIOJBCeen/F6KQA41/eIu08K7TMuJQrwSwDqO5uw7BRm9
 i12P5Z1JgGGC2fg2e+RX3bB30UnoccG/A3D+PWnO/kTtwJ6ReTHc+vG
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
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

A650 family includes A660 family (they've got a big family), A650
itself, and some more A6XX_GEN3 SKUs, all of which should fall into
the same branch of the if-condition. Simplify that.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index cb538a262d1c..6f168f1f32d8 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -525,8 +525,7 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
 	if (IS_ERR(pdcptr))
 		goto err;
 
-	if (adreno_is_a650(adreno_gpu) ||
-	    adreno_is_a660_family(adreno_gpu) ||
+	if (adreno_is_a650_family(adreno_gpu) ||
 	    adreno_is_a7xx(adreno_gpu))
 		pdc_in_aop = true;
 	else if (adreno_is_a618(adreno_gpu) || adreno_is_a640_family(adreno_gpu))

-- 
2.45.2

