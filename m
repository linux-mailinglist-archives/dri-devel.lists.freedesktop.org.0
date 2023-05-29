Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F3D714AF0
	for <lists+dri-devel@lfdr.de>; Mon, 29 May 2023 15:53:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43FF510E2B9;
	Mon, 29 May 2023 13:53:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B80B10E2AF
 for <dri-devel@lists.freedesktop.org>; Mon, 29 May 2023 13:52:49 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-4f50a8f6dd7so12080e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 29 May 2023 06:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685368367; x=1687960367;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=qmQPbfO+F1oBJQkI9K6akAThU3d6RkZKcfSUr9dQgtc=;
 b=prhQ9z135A/XL4btw/gHLarhsQTq1qSmqcG9EJ/CgoAkvg5xhCypAQNSmY6M7r9FVK
 DgxDVZ3bZ74uiCWStRYQkHwb2hONVAeYtRqz0SlVxGEj1nCkXPuyajvRxhSQWt7SvyKg
 5GuXouEjufiAondg96OBTe8iEx7lnu0mz0zF2fnYnUDW1U/vkuCMCSHEdnuvbg31jw9T
 yC7BDN5uKBJGnNT0nZZfG71ell3GbPey3XmF6oZE8rgS0ttmsht2TSjsK9djvW4XRo5B
 s5hK2/ewptLEFFIPCRX/M3d7z2OITer4ow43PzVZ4rUwNHLf932bLJ8gDf6YRdksDLZY
 9RMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685368367; x=1687960367;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qmQPbfO+F1oBJQkI9K6akAThU3d6RkZKcfSUr9dQgtc=;
 b=W9E2CfRw6UINAWgoSbSGIHp4UWvMCI5Q2OkbXwJfFGH/pd4XtXwv+X9FIHh/6TxpnJ
 PwpeeUFrLXTZ7JTbtinuEf3m0T+JKyw9a+tndtdsuLMvgq9qtIExXFS3Gy3bIMqv8q/S
 v+MySKQKIQGUI3t6jBwCVwm2ben08v6q6mlFSYTeaPfUIiJXbUIrePswphMuxWNOIgS0
 it3Bu2hPaVmqgcf9ObeMfq6JvlspYnuqGraA6nrCbL/F8Uw/cbYqi0fSQSm5oLaAuA+1
 juaKV8NJEYN/98FMB77WR+kM9bt4ehP29WnANrC9vYHEwOFK0kHOUZh/Iamng6optzYm
 Kb0g==
X-Gm-Message-State: AC+VfDwpmzRjD31WGAkeY8byDwqSaoNroP35vXbrRFUqC4lON4vHXvPz
 lx0Rzq47y66t6e1+jzKzOjEfqQ==
X-Google-Smtp-Source: ACHHUZ5qIz1TDmuUb+T9cZ+rwxl66xf6w5ydg7F17FenUfg9o03xTAGn2LV1Jtj+8I3M6Yr2YiZhYg==
X-Received: by 2002:a05:6512:64:b0:4f0:c18:5114 with SMTP id
 i4-20020a056512006400b004f00c185114mr3608499lfo.26.1685368367275; 
 Mon, 29 May 2023 06:52:47 -0700 (PDT)
Received: from [192.168.1.101] (abyj77.neoplus.adsl.tpnet.pl. [83.9.29.77])
 by smtp.gmail.com with ESMTPSA id
 c16-20020ac25310000000b004f2532cfbc1sm4700lfh.81.2023.05.29.06.52.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 May 2023 06:52:46 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Mon, 29 May 2023 15:52:34 +0200
Subject: [PATCH v8 15/18] drm/msm/a6xx: Use "else if" in GPU speedbin rev
 matching
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-topic-gmuwrapper-v8-15-69c68206609e@linaro.org>
References: <20230223-topic-gmuwrapper-v8-0-69c68206609e@linaro.org>
In-Reply-To: <20230223-topic-gmuwrapper-v8-0-69c68206609e@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>, 
 Conor Dooley <conor+dt@kernel.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1685368343; l=1434;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=H2Z7peqqE8oAE8U3nTlARepFCY8M4ZLiVH3inaSxkyA=;
 b=cJIeKzGQe+QN5PWfsZoxB2X1FWjbe0uOO7QgbvODui4tH5P1SROuXZRm59GAYZ5IXYQ/FggUp
 lfKc6RPYy8kCvM8sJpZC8p+ZpSbu87BNBxXpAZDsP1d72JhvWbstku7
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
Cc: Rob Clark <robdclark@chromium.org>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The GPU can only be one at a time. Turn a series of ifs into if +
elseifs to save some CPU cycles.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 1a29e7dd9975..5faa85543428 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2170,16 +2170,16 @@ static u32 fuse_to_supp_hw(struct device *dev, struct adreno_rev rev, u32 fuse)
 	if (adreno_cmp_rev(ADRENO_REV(6, 1, 8, ANY_ID), rev))
 		val = a618_get_speed_bin(fuse);
 
-	if (adreno_cmp_rev(ADRENO_REV(6, 1, 9, ANY_ID), rev))
+	else if (adreno_cmp_rev(ADRENO_REV(6, 1, 9, ANY_ID), rev))
 		val = a619_get_speed_bin(fuse);
 
-	if (adreno_cmp_rev(ADRENO_REV(6, 3, 5, ANY_ID), rev))
+	else if (adreno_cmp_rev(ADRENO_REV(6, 3, 5, ANY_ID), rev))
 		val = adreno_7c3_get_speed_bin(fuse);
 
-	if (adreno_cmp_rev(ADRENO_REV(6, 4, 0, ANY_ID), rev))
+	else if (adreno_cmp_rev(ADRENO_REV(6, 4, 0, ANY_ID), rev))
 		val = a640_get_speed_bin(fuse);
 
-	if (adreno_cmp_rev(ADRENO_REV(6, 5, 0, ANY_ID), rev))
+	else if (adreno_cmp_rev(ADRENO_REV(6, 5, 0, ANY_ID), rev))
 		val = a650_get_speed_bin(fuse);
 
 	if (val == UINT_MAX) {

-- 
2.40.1

