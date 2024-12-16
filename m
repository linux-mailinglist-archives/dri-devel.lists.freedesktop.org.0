Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 266739F2BC4
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 09:27:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A046210E3DC;
	Mon, 16 Dec 2024 08:27:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="gjCTH1Tn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0553F10E525
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 08:27:33 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-5401be44b58so3807676e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 00:27:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734337651; x=1734942451; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=1y3zws2OvDJOJvn4EwHQ6T46YmVm0fvbHsUMlmIZnm8=;
 b=gjCTH1Tnp1mEGlmiyJZZP2JVmBnVuCBEVzNzNMd66ZIGK2RIF5L0nBKMKfdsAUBmuY
 qYBzHs6LuN/yp0ju7EKfOPgavy1pjsaV09I9i3HdTW9gOrGi0TxO5emPAbwCy2BV3N2i
 DxE7Z6+IyG6tabGlMTSPsyZ4rOuSmVJNZ8n8476AFOJRmzlDvKRw63g3JhlFMZnzx2h4
 4el64gFKbpY1nPPB/zuybMIqOcLpeBfQ6fGX2H3acI+K5KCrIEZtWfOcy5QbEOTwPXeg
 Gxj7gh9wOAPoPiALecT4TQObxsA5Qg+euBmaH8IcwK1Ms9Ppa+EHgfpw7fG4cfaaPGDL
 /QRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734337651; x=1734942451;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1y3zws2OvDJOJvn4EwHQ6T46YmVm0fvbHsUMlmIZnm8=;
 b=LLub3fvKj9KtUAum87EQxmzm7TYURcicLBCyaCNXtr/Kec1jcg2crJdX6iHyOqeMyu
 fxNHTRJOGMs5Ib2GcIIeiqva9Y9O7Nr+YsJT4xjeI0S9HC4moNbUFbwof+HLT9hOLNEJ
 R35J5y8Aq2Lr9kDXlG8IAcy0UsUrV1ZEm3hRQRnRjnHnxGgb+cGB0wDs6TTEBLSpeJmQ
 vXM+EtFc8iENvGwamJPi+s688+twCwSQoA0rCccituGUwiEloUZgqmPwvPAivyTqL9MP
 E/OHtxdxszylt/GN/N57pUtS74uDacx1rIYl6VLo5bI3d/pPtT3R9hGR428gJVpAUl/H
 vxLg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRx7hxMJe7QO2b25BpmH5yopB1JwUYGZHq9GYHFrtGiK6o2okjQ+Y88XD8QooSY6srXHHIv/NpX3g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxsgsSqGSmDodqn5QA9oFzMknFYplVDFRRXlCU26mjlnOGTNPnB
 gfvDZPadzAn0qZJNQxzJKZfn9AyavHzSfmUKqEmGr0iExbNSHGUDYoMNxfCYNvg=
X-Gm-Gg: ASbGnctw/OcF8PhY4c/+jcVCn/3YKvfSlwfyLssTNvwYnNozrJwtNchSuaksqx+mpkQ
 a1bQnNSPffeZ7c0V1S7gjU08hX/ZLnncdcqdnxo3qbifEphdawweUAxBmoVJhXllBLAJg8/Wnyy
 Hm2I0msum4gJ/DHaewbMr/+1KaxYfyxOiV+EZh/NY35KZlvuPN956mjaJjfQYv2mpHk+ZGIS1T3
 qzrKnh1qMxVu6vwJsBdTR/c33CKRgse+O92TBUBLigsmmuG06FYFeIQODtpYQnF
X-Google-Smtp-Source: AGHT+IEzJ0NEoETgA7c8ba6XyTQ/DzGVN/VS5aRCw2hY/b5fwtTAbAtRpZytYulUjtMOAdHNJr0JqA==
X-Received: by 2002:a2e:a989:0:b0:300:2d54:c2ae with SMTP id
 38308e7fff4ca-302546115demr45480641fa.27.1734337651302; 
 Mon, 16 Dec 2024 00:27:31 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30344045342sm8543371fa.33.2024.12.16.00.27.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Dec 2024 00:27:30 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 16 Dec 2024 10:27:23 +0200
Subject: [PATCH 2/8] drm/msm/dpu: link DSPP_2/_3 blocks on SC8180X
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241216-dpu-fix-catalog-v1-2-15bf0807dba1@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1152;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=GNG1YjeHfuMszqIesSKPUebiuLvhN9Xn/3L3ADbn8DU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnX+RrE/1t7QKrO1i15J4Z2UkK/SQyKBi/FHqf9
 nl4CVCFJu2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ1/kawAKCRCLPIo+Aiko
 1aq/B/9wOMO2d+TGtOtYeWqt92iBk1GzTfpG0xNYpmbvSaiR55N0aFWclXEzgT4g2cc19vzzryv
 c41PGKSpiK5qXbnkhTcLfOqc/UVycrEYNAlzrGUaZW0vL7Yx4UerVgkBozAW5y04OEUYoZpiJYr
 MjMEURWwYOhGMkdOo7Wl5S5plX1JOwXrlZQkJt6NsAJ3lUv98ms/VamgWhKTarJqESXw46g21+F
 /qWNUK+XC6tSfqqjtZks/sIgGxMbfOAIRdPJJnCt43I9wNX9Ng4Kxc9Lc1uG5zTwzw2A6Xl5VEg
 ABGMRPo83JhPnmTajrbbslOPzjGGsAneXND3EH99hJx4QC5G
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

Fixes: f5abecfe339e ("drm/msm/dpu: enable DSPP and DSC on sc8180x")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
index bab19ddd1d4f97805c1bfba8ba6e117ae77c6c2e..641023b102bf59352546f0782d9264986367de78 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
@@ -163,6 +163,7 @@ static const struct dpu_lm_cfg sc8180x_lm[] = {
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_3,
 		.pingpong = PINGPONG_2,
+		.dspp = DSPP_2,
 	}, {
 		.name = "lm_3", .id = LM_3,
 		.base = 0x47000, .len = 0x320,
@@ -170,6 +171,7 @@ static const struct dpu_lm_cfg sc8180x_lm[] = {
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_2,
 		.pingpong = PINGPONG_3,
+		.dspp = DSPP_3,
 	}, {
 		.name = "lm_4", .id = LM_4,
 		.base = 0x48000, .len = 0x320,

-- 
2.39.5

