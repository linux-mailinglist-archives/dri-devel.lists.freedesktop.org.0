Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B1C9F2BCC
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 09:27:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8AA710E52D;
	Mon, 16 Dec 2024 08:27:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="kTqdLT0E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1487B10E52A
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 08:27:40 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-3003c82c95cso31943001fa.3
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 00:27:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734337658; x=1734942458; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ZbJUsGouyvpdIwJ5KdGKXUaM1AeXWb7FKeLRpP8lHmo=;
 b=kTqdLT0EiaQkf0Qsmwo2qc4Mqpig1oK1Z9tw76v//nG8ydwdVyvUtZx58fowzdghkY
 9nJeBniqYXtEP00FLlCVnyWERsxrtfsDd8qFRAYtzJTOZjkBMhfVwQ5CNMFWxRvfnzC6
 i0QxEpXvgHQquofiPAiS3ngrNJgE1LiaLB3OzFe+690+qX38NnsmAI0BGCuVQZ3qesIU
 qeEp2f+YlCtxzBmPhnXCrHvIC8xz/CB26GPAd87tE2UDDMA6zdfWVhHvRyanzSV3jIPV
 vNHOQyvIqs004eRovIwgJx/u+adKL2bHsrmSE9vgH2Wdf1g7rzTSHDgGz0/twXt3RJds
 ts5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734337658; x=1734942458;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZbJUsGouyvpdIwJ5KdGKXUaM1AeXWb7FKeLRpP8lHmo=;
 b=LF/zzHw13SdafrzYIggzz9+ARa+XdpIm3Jy1iw6KfvDsi1cHt91PYPWHZwytGg47CP
 Sa1vK3KwaszJ5p9qqZ4x3f67w04LSOOz6zZkYnG71gnbaya0kYrQQm03PijQDwVmD0W5
 2iWyJlKvP3oVqktt+YnOiFfiBamJZOU71rpkDDMlG2FQHPDhpQhhkvAYuNNttl8Ijk6j
 50Hs/lnnOkW9xQpjmUFFCf++1KZdNiqQdcXIISHNuJ+8iAomybiXrfY+Rr2h1OLrvyzD
 v0r6CPrYWMCQ0WcoWdtt1l9EBHUdfoe9EiXxvaPsWuYwKY0nA14K/rfHISHJcV/FUnGj
 HjoQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV4zhNs9DoN0I50a8L7Np/Qtccn+tNKaOvtmDhtA6S3xCasfjmdnpwRu+KzUSjfSWeqegZfueZzMaE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyjnu0G+Gj2AREUpmidWfQ7SMJwV2R2YE4tN8pA6JkNnrh4N803
 q6k1xMwOXtbmPCwwT+gV8TBmPZv3Q+oTdn/PQM+mfvAf87WefWX+CmrcsWSGRcI=
X-Gm-Gg: ASbGncvm2VmfL9S6xPaVTC3gtKtLAQBG79CtkK/2M15tfPT84owt8gZ/AKi4L+KGqAU
 TpZ+hLv/g7Ev2UYCRGv/KWEV9AnO3734hLpJADjY+e/lzxC6Pnt07hXFtwharIE53iGFaSrEdpW
 ylTujqg0sZIXz5QDZd7ArG92Xec8cSRx/ZGlBlAfKIBmz8c9kDF6Z0GJeGLnoq4TvzMuuose+bv
 OEERZD3n84KcDgeCIC6+DbiATFte8vCEyeVaMx4TS+6Wbu3vI4QgNR5++fQxm7Q
X-Google-Smtp-Source: AGHT+IE09YmVD4DRB6LYkgBX9GgTyicLTyLwxzWmsrV39R4MSiGMzGiG8tc7FZFrp00POVfsz/KMrQ==
X-Received: by 2002:a2e:bc1a:0:b0:302:3610:a50f with SMTP id
 38308e7fff4ca-302544ae74emr31223591fa.30.1734337658383; 
 Mon, 16 Dec 2024 00:27:38 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30344045342sm8543371fa.33.2024.12.16.00.27.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Dec 2024 00:27:37 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 16 Dec 2024 10:27:26 +0200
Subject: [PATCH 5/8] drm/msm/dpu: link DSPP_2/_3 blocks on SM8550
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241216-dpu-fix-catalog-v1-5-15bf0807dba1@linaro.org>
References: <20241216-dpu-fix-catalog-v1-0-15bf0807dba1@linaro.org>
In-Reply-To: <20241216-dpu-fix-catalog-v1-0-15bf0807dba1@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Robert Foss <rfoss@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Abel Vesa <abel.vesa@linaro.org>, Richard Acayan <mailingradian@gmail.com>
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1137;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=1HhOvQdDTQpfgdgbG47ZEhiTKbhwKeluJd76grZHFQ4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnX+Rs2FhUYx9q2yNDoYbhnSjaGb+un7b3T7HUG
 VoAKEcGX0iJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ1/kbAAKCRCLPIo+Aiko
 1eZRB/4rtFczYnTmybdWYQxDY4DO9biNQKJsf8ktMkqNBxfoBOm6geGnYjdFg4JaRtD03g5YKl3
 6UFn4R5as6rx8Zak+ZhimIcttpvhOUzURUykldcuGbs7WqYhaGp2qs2DlvqgiVQb2Z0KkNDMDeY
 QsdD+kpGHf+FnoV8HiCFJgrNJ95+Y3vKe0HgoHPA7NRy1eu3MUZ3DTpFwswhjuzoz/WIrviOUaB
 OT9Qb4erHsNqFFizJ7TgR+cPeXPik04uohYxBeKtt9K/hRMA9258n2yU7rZUYUPuICEzVyoZ7i5
 JM67FnF5p5GaeujazKkpq2Vww/uULSfevN1y3671rWbyPXp2
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

Link DSPP_2 to the LM_2 and DSPP_3 to the LM_3 mixer blocks.

Fixes: efcd0107727c ("drm/msm/dpu: add support for SM8550")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index ad48defa154f7d808c695860fd91e60bbb08f42a..a1dbbf5c652ff9f21c02af2e2520f019702f29c1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -160,6 +160,7 @@ static const struct dpu_lm_cfg sm8550_lm[] = {
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_3,
 		.pingpong = PINGPONG_2,
+		.dspp = DSPP_2,
 	}, {
 		.name = "lm_3", .id = LM_3,
 		.base = 0x47000, .len = 0x320,
@@ -167,6 +168,7 @@ static const struct dpu_lm_cfg sm8550_lm[] = {
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_2,
 		.pingpong = PINGPONG_3,
+		.dspp = DSPP_3,
 	}, {
 		.name = "lm_4", .id = LM_4,
 		.base = 0x48000, .len = 0x320,

-- 
2.39.5

