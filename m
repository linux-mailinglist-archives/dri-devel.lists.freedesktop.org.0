Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F16999F1881
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2024 23:15:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C3C810F0FA;
	Fri, 13 Dec 2024 22:15:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="WtmAATbY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD22410F108
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 22:15:17 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-30033e07ef3so23891461fa.0
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 14:15:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734128116; x=1734732916; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=/yIqS+7lERtDCr58VZq1E7ylPfkC49qszUe4ANaqxzI=;
 b=WtmAATbYHrwCmwLHvOYsMnxPjgaHDC80F2pJ0mtBsjobc5PuVS/KSZ9Rs/baLyrx1c
 pdwxb2rt26RjSUysXEm8heE1Jrz0wcjTtQOBRzCe82/Ic6Izw6o0VMEwM6UhHZhXm3Vs
 dL4xbMLP9hlx90n37x8HLaQQ/F3kdHpfq6LZf6oYl1FvEuCBZ/ku1ZqNsoFub0swm3n7
 J3tS4ILfSSVYBO5uZN6CZ2m+Gu75Plru2P3n0xXC0vjiApOv88b3YpG6D0bFZXLKiOog
 UGwi8CyKXlSS1ncrTvQ+pj9lNgxSZspLt/BqVnYUFQpVs60ld+Jv/RhW8hhhi2z0Zq39
 lJDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734128116; x=1734732916;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/yIqS+7lERtDCr58VZq1E7ylPfkC49qszUe4ANaqxzI=;
 b=AHLp2MlxGplUMeB2/Ezbf8brpNbb35AePeIWETp75vfTS82rXZmO6RdfIUaZi/eMDG
 EVLtu9BzjKHkbcE19ZbPI+U4xts+kMkjmHoMIAqDimvI9sBj8RlXMrH9G8wvaTA15doJ
 Z/+lgnipl5kkDcjZyyZxrR1Xce3cM0nP2zZ41IpfDXK75jy/FIuZM4ZbFK2SI3UEliVC
 jMnaqdEc3GyImSlbwfQWfjOoq/4gsuI/Oyd1GM/mcmUGpDUAHqM0K/qbOq9M5ON6AptY
 /+1PakplS9r+JKdP2yPUuN/cIXPoO8HPCfmRul01KYv8t38K0/sA8fQnWJ04BzfQ1AoO
 A3bw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWcqLgqxvgerFWDWXUMKbhTqZM8FDXMm/4VPvOSYaZ3xEREn9+eIL6giduL7Ivzw9c0MQp9nu5jXsM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzBahoAFqh6Y5RAbkl7ettKmI7hT1fWShAo6pk2yZTQbfPkzmto
 1/biK/VBVLDp39lNNhMX3klFV11MoxYqz6FTJ+k/5HeQQW14Y5VUS7DUL0oyfmg=
X-Gm-Gg: ASbGnctG7biK2S85ooZhJUog3XvWz8tcGWOmwwhcAFiv+fTJEE8Xes6pOPakBGeABGj
 mQEJDnNToQAQhCj5wue/uc1wVWU6WTDrPel2b/6H6x5iVazaKt8iE0GwrbGJ01YJOOd9F08TXDM
 5OzJpBcO7xxextAzW+nbaDQqadsImEcF22aMbGGausQaKaTijRX8nEJK5l/hVj3DOiVwCmuT/cW
 A8o9DmbuMjUPhPZGHMqjZ5bnxTsRtJCb19AnRzLQ2kPHcFCmD1VOzJb52hD3Y2B
X-Google-Smtp-Source: AGHT+IEYzgkfgVMOrdtYQW5UQwp5d2JUakPuL369h0sGM0/BN+EK1bZJMAHuFtLTQnRHC1Jzx4G0pg==
X-Received: by 2002:a2e:a98d:0:b0:2ff:bf0a:2226 with SMTP id
 38308e7fff4ca-30251cc688emr19536201fa.17.1734128115897; 
 Fri, 13 Dec 2024 14:15:15 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-303441e0f43sm413451fa.125.2024.12.13.14.15.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2024 14:15:14 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 14 Dec 2024 00:14:33 +0200
Subject: [PATCH 17/35] drm/msm/dpu: get rid of DPU_INTF_INPUT_CTRL
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241214-dpu-drop-features-v1-17-988f0662cb7e@linaro.org>
References: <20241214-dpu-drop-features-v1-0-988f0662cb7e@linaro.org>
In-Reply-To: <20241214-dpu-drop-features-v1-0-988f0662cb7e@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=30967;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Lnx6mdoLbG1PcfUkFLqhfgv3nNTrTHbTjQSEHdbmI8g=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnXLHGCAymq8wHnCP86RAYKphtL0GHcNVop50D5
 /vsbd8iGgaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ1yxxgAKCRCLPIo+Aiko
 1e8NB/9ocZR+XQLT9JvwWj0dlixqzBiJN3Iy7bWkYfGhploJs4TQkGlDOJU4OQSdMh30D93zE67
 1lGbzCTKszW9OyVxwNcRyUUXlNZTR7tsK3GRDGNuGO3Swu6bb2bwUocw/5e5OUyNr1Zdq4L3LBB
 dipFDVDwVs86FXSaP3b+vtV6Mbl4KzYA6urFtCcj+43+fE2GnoneY55nl0jbPil7Xws5tKFA2SO
 pcyJ3noxIBR4S6oialecbJdNX8po6wILyukAGiPvkevDmaUreOWPg2xBZDFpgSfQmMEV9njn7Sx
 9yXmyP5jLMzGu/iDxm1S4+VkuQwRrh96AsVVwCq9FBMk3VBA
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

Continue migration to the MDSS-revision based checks and replace
DPU_INTF_INPUT_CTRL feature bit with the core_major_ver >= 5 check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h  |  4 ----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h   |  4 ----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h  |  6 ------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h   |  4 ----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h   |  2 --
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h   |  4 ----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h   |  2 --
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h   |  1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h   |  2 --
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h  |  1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h   |  1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   |  4 ----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h   |  3 ---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h |  9 ---------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   |  4 ----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h  |  8 --------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   |  4 ----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h |  9 ---------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c           |  3 ---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h           | 11 -----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c              |  2 +-
 21 files changed, 1 insertion(+), 87 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
index 18ec9f0e8dfdd3fa3f8e1705f14663734e1476fe..a9e149f28a0141646ad5d5264031dfa22e0588fb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
@@ -346,7 +346,6 @@ static const struct dpu_intf_cfg sm8650_intf[] = {
 	{
 		.name = "intf_0", .id = INTF_0,
 		.base = 0x34000, .len = 0x280,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
@@ -355,7 +354,6 @@ static const struct dpu_intf_cfg sm8650_intf[] = {
 	}, {
 		.name = "intf_1", .id = INTF_1,
 		.base = 0x35000, .len = 0x300,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DSI,
 		.controller_id = MSM_DSI_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
@@ -365,7 +363,6 @@ static const struct dpu_intf_cfg sm8650_intf[] = {
 	}, {
 		.name = "intf_2", .id = INTF_2,
 		.base = 0x36000, .len = 0x300,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DSI,
 		.controller_id = MSM_DSI_CONTROLLER_1,
 		.prog_fetch_lines_worst_case = 24,
@@ -375,7 +372,6 @@ static const struct dpu_intf_cfg sm8650_intf[] = {
 	}, {
 		.name = "intf_3", .id = INTF_3,
 		.base = 0x37000, .len = 0x280,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_1,
 		.prog_fetch_lines_worst_case = 24,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
index 7f83ba35fad21365bcb2a49915af34a909eb521e..03fce530db11eccebb96aa53311418c229caf45d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
@@ -302,7 +302,6 @@ static const struct dpu_intf_cfg sm8150_intf[] = {
 	{
 		.name = "intf_0", .id = INTF_0,
 		.base = 0x6a000, .len = 0x280,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
@@ -311,7 +310,6 @@ static const struct dpu_intf_cfg sm8150_intf[] = {
 	}, {
 		.name = "intf_1", .id = INTF_1,
 		.base = 0x6a800, .len = 0x2bc,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DSI,
 		.controller_id = MSM_DSI_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
@@ -321,7 +319,6 @@ static const struct dpu_intf_cfg sm8150_intf[] = {
 	}, {
 		.name = "intf_2", .id = INTF_2,
 		.base = 0x6b000, .len = 0x2bc,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DSI,
 		.controller_id = MSM_DSI_CONTROLLER_1,
 		.prog_fetch_lines_worst_case = 24,
@@ -331,7 +328,6 @@ static const struct dpu_intf_cfg sm8150_intf[] = {
 	}, {
 		.name = "intf_3", .id = INTF_3,
 		.base = 0x6b800, .len = 0x280,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_1,
 		.prog_fetch_lines_worst_case = 24,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
index a0192ea7cf8e893d9f2d632f869d9757e502d236..bd906b832a0a83d7212048aaddbff66e43e9824b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
@@ -309,7 +309,6 @@ static const struct dpu_intf_cfg sc8180x_intf[] = {
 	{
 		.name = "intf_0", .id = INTF_0,
 		.base = 0x6a000, .len = 0x280,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
@@ -318,7 +317,6 @@ static const struct dpu_intf_cfg sc8180x_intf[] = {
 	}, {
 		.name = "intf_1", .id = INTF_1,
 		.base = 0x6a800, .len = 0x2bc,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DSI,
 		.controller_id = MSM_DSI_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
@@ -328,7 +326,6 @@ static const struct dpu_intf_cfg sc8180x_intf[] = {
 	}, {
 		.name = "intf_2", .id = INTF_2,
 		.base = 0x6b000, .len = 0x2bc,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DSI,
 		.controller_id = MSM_DSI_CONTROLLER_1,
 		.prog_fetch_lines_worst_case = 24,
@@ -340,7 +337,6 @@ static const struct dpu_intf_cfg sc8180x_intf[] = {
 	{
 		.name = "intf_3", .id = INTF_3,
 		.base = 0x6b800, .len = 0x280,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = 999,
 		.prog_fetch_lines_worst_case = 24,
@@ -349,7 +345,6 @@ static const struct dpu_intf_cfg sc8180x_intf[] = {
 	}, {
 		.name = "intf_4", .id = INTF_4,
 		.base = 0x6c000, .len = 0x280,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_1,
 		.prog_fetch_lines_worst_case = 24,
@@ -358,7 +353,6 @@ static const struct dpu_intf_cfg sc8180x_intf[] = {
 	}, {
 		.name = "intf_5", .id = INTF_5,
 		.base = 0x6c800, .len = 0x280,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_2,
 		.prog_fetch_lines_worst_case = 24,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
index 1ae6eef17a1b03fa89b53e62e8fd4b4b26d47aec..399d6a4da3def08bae816d593d42e705b4922d59 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
@@ -212,7 +212,6 @@ static const struct dpu_intf_cfg sm7150_intf[] = {
 	{
 		.name = "intf_0", .id = INTF_0,
 		.base = 0x6a000, .len = 0x280,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
@@ -221,7 +220,6 @@ static const struct dpu_intf_cfg sm7150_intf[] = {
 	}, {
 		.name = "intf_1", .id = INTF_1,
 		.base = 0x6a800, .len = 0x2bc,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DSI,
 		.controller_id = MSM_DSI_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
@@ -231,7 +229,6 @@ static const struct dpu_intf_cfg sm7150_intf[] = {
 	}, {
 		.name = "intf_2", .id = INTF_2,
 		.base = 0x6b000, .len = 0x2bc,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DSI,
 		.controller_id = MSM_DSI_CONTROLLER_1,
 		.prog_fetch_lines_worst_case = 24,
@@ -241,7 +238,6 @@ static const struct dpu_intf_cfg sm7150_intf[] = {
 	}, {
 		.name = "intf_3", .id = INTF_3,
 		.base = 0x6b800, .len = 0x280,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_1,
 		.prog_fetch_lines_worst_case = 24,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
index 499ac80fc5196dd0b76e7bb2880be93adbf032ae..f7855c425555d25da29cebbec72eb0172b421327 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
@@ -152,7 +152,6 @@ static const struct dpu_intf_cfg sm6125_intf[] = {
 	{
 		.name = "intf_0", .id = INTF_0,
 		.base = 0x6a000, .len = 0x280,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
@@ -161,7 +160,6 @@ static const struct dpu_intf_cfg sm6125_intf[] = {
 	}, {
 		.name = "intf_1", .id = INTF_1,
 		.base = 0x6a800, .len = 0x2c0,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DSI,
 		.controller_id = 0,
 		.prog_fetch_lines_worst_case = 24,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
index a965987ad4cf686d54a6d4df0b6ab855146b9e87..20f58f9d371efbc01ed2fc8f62d38d05b85a5c04 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
@@ -285,7 +285,6 @@ static const struct dpu_intf_cfg sm8250_intf[] = {
 	{
 		.name = "intf_0", .id = INTF_0,
 		.base = 0x6a000, .len = 0x280,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
@@ -294,7 +293,6 @@ static const struct dpu_intf_cfg sm8250_intf[] = {
 	}, {
 		.name = "intf_1", .id = INTF_1,
 		.base = 0x6a800, .len = 0x2c0,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DSI,
 		.controller_id = MSM_DSI_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
@@ -304,7 +302,6 @@ static const struct dpu_intf_cfg sm8250_intf[] = {
 	}, {
 		.name = "intf_2", .id = INTF_2,
 		.base = 0x6b000, .len = 0x2c0,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DSI,
 		.controller_id = MSM_DSI_CONTROLLER_1,
 		.prog_fetch_lines_worst_case = 24,
@@ -314,7 +311,6 @@ static const struct dpu_intf_cfg sm8250_intf[] = {
 	}, {
 		.name = "intf_3", .id = INTF_3,
 		.base = 0x6b800, .len = 0x280,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_1,
 		.prog_fetch_lines_worst_case = 24,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
index 6fd6055e5014ff0074374a46fd7152e89b2e383f..96c1ac91715a69c731555d9da4d4842a7a07c1ca 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
@@ -129,7 +129,6 @@ static const struct dpu_intf_cfg sc7180_intf[] = {
 	{
 		.name = "intf_0", .id = INTF_0,
 		.base = 0x6a000, .len = 0x280,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
@@ -138,7 +137,6 @@ static const struct dpu_intf_cfg sc7180_intf[] = {
 	}, {
 		.name = "intf_1", .id = INTF_1,
 		.base = 0x6a800, .len = 0x2c0,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DSI,
 		.controller_id = MSM_DSI_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
index 01e398add3c45a8bc504da5ca268df0487462113..0178ce52e84f355919241435f58c390234c16162 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
@@ -87,7 +87,6 @@ static const struct dpu_intf_cfg sm6115_intf[] = {
 	{
 		.name = "intf_1", .id = INTF_1,
 		.base = 0x6a800, .len = 0x2c0,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DSI,
 		.controller_id = MSM_DSI_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
index e35b5d47204d7aa24d3521bbc9b0de3efe92090c..ac0386eaac8636b5e524a7b41cab0e02f8bf9ffa 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
@@ -160,7 +160,6 @@ static const struct dpu_intf_cfg sm6350_intf[] = {
 	{
 		.name = "intf_0", .id = INTF_0,
 		.base = 0x6a000, .len = 0x280,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 35,
@@ -169,7 +168,6 @@ static const struct dpu_intf_cfg sm6350_intf[] = {
 	}, {
 		.name = "intf_1", .id = INTF_1,
 		.base = 0x6a800, .len = 0x2c0,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DSI,
 		.controller_id = MSM_DSI_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 35,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
index 94dc8726199a3a48a64c7dff58bc62e6fd097c99..0b1740de2bff94f1818ab41c6bc713f16796c4a4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
@@ -87,7 +87,6 @@ static const struct dpu_intf_cfg qcm2290_intf[] = {
 	{
 		.name = "intf_1", .id = INTF_1,
 		.base = 0x6a800, .len = 0x2c0,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DSI,
 		.controller_id = MSM_DSI_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
index 2b2b9417e23950425a72f6dd44baf824b5a00061..19800f207bff3077c7ac57ad736eea533674ae20 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
@@ -97,7 +97,6 @@ static const struct dpu_intf_cfg sm6375_intf[] = {
 	{
 		.name = "intf_1", .id = INTF_1,
 		.base = 0x6a800, .len = 0x2c0,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DSI,
 		.controller_id = MSM_DSI_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index 6ab48b6017954cab1c594793ed511ccdf974ed81..bf69eb5678a2d8228aff816ed8a1a91c329bf00b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
@@ -309,7 +309,6 @@ static const struct dpu_intf_cfg sm8350_intf[] = {
 	{
 		.name = "intf_0", .id = INTF_0,
 		.base = 0x34000, .len = 0x280,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
@@ -318,7 +317,6 @@ static const struct dpu_intf_cfg sm8350_intf[] = {
 	}, {
 		.name = "intf_1", .id = INTF_1,
 		.base = 0x35000, .len = 0x2c4,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DSI,
 		.controller_id = MSM_DSI_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
@@ -328,7 +326,6 @@ static const struct dpu_intf_cfg sm8350_intf[] = {
 	}, {
 		.name = "intf_2", .id = INTF_2,
 		.base = 0x36000, .len = 0x2c4,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DSI,
 		.controller_id = MSM_DSI_CONTROLLER_1,
 		.prog_fetch_lines_worst_case = 24,
@@ -338,7 +335,6 @@ static const struct dpu_intf_cfg sm8350_intf[] = {
 	}, {
 		.name = "intf_3", .id = INTF_3,
 		.base = 0x37000, .len = 0x280,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_1,
 		.prog_fetch_lines_worst_case = 24,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
index 55f634f632db69b809f1957401f41220af90eefd..5f51e1d21d8420e13c2e7e6b6042839611697eb7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
@@ -178,7 +178,6 @@ static const struct dpu_intf_cfg sc7280_intf[] = {
 	{
 		.name = "intf_0", .id = INTF_0,
 		.base = 0x34000, .len = 0x280,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
@@ -187,7 +186,6 @@ static const struct dpu_intf_cfg sc7280_intf[] = {
 	}, {
 		.name = "intf_1", .id = INTF_1,
 		.base = 0x35000, .len = 0x2c4,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DSI,
 		.controller_id = MSM_DSI_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
@@ -197,7 +195,6 @@ static const struct dpu_intf_cfg sc7280_intf[] = {
 	}, {
 		.name = "intf_5", .id = INTF_5,
 		.base = 0x39000, .len = 0x280,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_1,
 		.prog_fetch_lines_worst_case = 24,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index 373692d691e2420b847bb56a5087203bffceaca1..2099696c2886da0fe3a428b44ee0cd3a93be0785 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -307,7 +307,6 @@ static const struct dpu_intf_cfg sc8280xp_intf[] = {
 	{
 		.name = "intf_0", .id = INTF_0,
 		.base = 0x34000, .len = 0x280,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
@@ -316,7 +315,6 @@ static const struct dpu_intf_cfg sc8280xp_intf[] = {
 	}, {
 		.name = "intf_1", .id = INTF_1,
 		.base = 0x35000, .len = 0x300,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DSI,
 		.controller_id = MSM_DSI_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
@@ -326,7 +324,6 @@ static const struct dpu_intf_cfg sc8280xp_intf[] = {
 	}, {
 		.name = "intf_2", .id = INTF_2,
 		.base = 0x36000, .len = 0x300,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DSI,
 		.controller_id = MSM_DSI_CONTROLLER_1,
 		.prog_fetch_lines_worst_case = 24,
@@ -336,7 +333,6 @@ static const struct dpu_intf_cfg sc8280xp_intf[] = {
 	}, {
 		.name = "intf_3", .id = INTF_3,
 		.base = 0x37000, .len = 0x280,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_NONE,
 		.controller_id = MSM_DP_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
@@ -345,7 +341,6 @@ static const struct dpu_intf_cfg sc8280xp_intf[] = {
 	}, {
 		.name = "intf_4", .id = INTF_4,
 		.base = 0x38000, .len = 0x280,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_1,
 		.prog_fetch_lines_worst_case = 24,
@@ -354,7 +349,6 @@ static const struct dpu_intf_cfg sc8280xp_intf[] = {
 	}, {
 		.name = "intf_5", .id = INTF_5,
 		.base = 0x39000, .len = 0x280,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_3,
 		.prog_fetch_lines_worst_case = 24,
@@ -363,7 +357,6 @@ static const struct dpu_intf_cfg sc8280xp_intf[] = {
 	}, {
 		.name = "intf_6", .id = INTF_6,
 		.base = 0x3a000, .len = 0x280,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_2,
 		.prog_fetch_lines_worst_case = 24,
@@ -372,7 +365,6 @@ static const struct dpu_intf_cfg sc8280xp_intf[] = {
 	}, {
 		.name = "intf_7", .id = INTF_7,
 		.base = 0x3b000, .len = 0x280,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_NONE,
 		.controller_id = MSM_DP_CONTROLLER_2,
 		.prog_fetch_lines_worst_case = 24,
@@ -381,7 +373,6 @@ static const struct dpu_intf_cfg sc8280xp_intf[] = {
 	}, {
 		.name = "intf_8", .id = INTF_8,
 		.base = 0x3c000, .len = 0x280,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_NONE,
 		.controller_id = MSM_DP_CONTROLLER_1,
 		.prog_fetch_lines_worst_case = 24,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index a0d4ce721b33b480c1c8d0927f7541e550cf853b..7b100f559ff307017b877824c7fe1e2254c92c06 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -327,7 +327,6 @@ static const struct dpu_intf_cfg sm8450_intf[] = {
 	{
 		.name = "intf_0", .id = INTF_0,
 		.base = 0x34000, .len = 0x280,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
@@ -336,7 +335,6 @@ static const struct dpu_intf_cfg sm8450_intf[] = {
 	}, {
 		.name = "intf_1", .id = INTF_1,
 		.base = 0x35000, .len = 0x300,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DSI,
 		.controller_id = MSM_DSI_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
@@ -346,7 +344,6 @@ static const struct dpu_intf_cfg sm8450_intf[] = {
 	}, {
 		.name = "intf_2", .id = INTF_2,
 		.base = 0x36000, .len = 0x300,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DSI,
 		.controller_id = MSM_DSI_CONTROLLER_1,
 		.prog_fetch_lines_worst_case = 24,
@@ -356,7 +353,6 @@ static const struct dpu_intf_cfg sm8450_intf[] = {
 	}, {
 		.name = "intf_3", .id = INTF_3,
 		.base = 0x37000, .len = 0x280,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_1,
 		.prog_fetch_lines_worst_case = 24,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
index fc605d464fea75e0b07b626808e0a248660ade2f..f9f77da8630c2c48f7519bf774633ad9b3635736 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
@@ -337,7 +337,6 @@ static const struct dpu_intf_cfg sa8775p_intf[] = {
 	{
 		.name = "intf_0", .id = INTF_0,
 		.base = 0x34000, .len = 0x280,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
@@ -346,7 +345,6 @@ static const struct dpu_intf_cfg sa8775p_intf[] = {
 	}, {
 		.name = "intf_1", .id = INTF_1,
 		.base = 0x35000, .len = 0x300,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DSI,
 		.controller_id = MSM_DSI_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
@@ -356,7 +354,6 @@ static const struct dpu_intf_cfg sa8775p_intf[] = {
 	}, {
 		.name = "intf_2", .id = INTF_2,
 		.base = 0x36000, .len = 0x300,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DSI,
 		.controller_id = MSM_DSI_CONTROLLER_1,
 		.prog_fetch_lines_worst_case = 24,
@@ -366,7 +363,6 @@ static const struct dpu_intf_cfg sa8775p_intf[] = {
 	}, {
 		.name = "intf_3", .id = INTF_3,
 		.base = 0x37000, .len = 0x280,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_NONE,
 		.controller_id = MSM_DP_CONTROLLER_0,	/* pair with intf_0 for DP MST */
 		.prog_fetch_lines_worst_case = 24,
@@ -375,7 +371,6 @@ static const struct dpu_intf_cfg sa8775p_intf[] = {
 	}, {
 		.name = "intf_4", .id = INTF_4,
 		.base = 0x38000, .len = 0x280,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_1,
 		.prog_fetch_lines_worst_case = 24,
@@ -384,7 +379,6 @@ static const struct dpu_intf_cfg sa8775p_intf[] = {
 	}, {
 		.name = "intf_6", .id = INTF_6,
 		.base = 0x3A000, .len = 0x280,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_NONE,
 		.controller_id = MSM_DP_CONTROLLER_0,	/* pair with intf_0 for DP MST */
 		.prog_fetch_lines_worst_case = 24,
@@ -393,7 +387,6 @@ static const struct dpu_intf_cfg sa8775p_intf[] = {
 	}, {
 		.name = "intf_7", .id = INTF_7,
 		.base = 0x3b000, .len = 0x280,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_NONE,
 		.controller_id = MSM_DP_CONTROLLER_0,	/* pair with intf_0 for DP MST */
 		.prog_fetch_lines_worst_case = 24,
@@ -402,7 +395,6 @@ static const struct dpu_intf_cfg sa8775p_intf[] = {
 	}, {
 		.name = "intf_8", .id = INTF_8,
 		.base = 0x3c000, .len = 0x280,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_NONE,
 		.controller_id = MSM_DP_CONTROLLER_1,	/* pair with intf_4 for DP MST */
 		.prog_fetch_lines_worst_case = 24,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index cd51601eae0688d0e3db5c2cdee0106749c32d85..94a163f93f9508acf7156581a47e8601685ce4ef 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -320,7 +320,6 @@ static const struct dpu_intf_cfg sm8550_intf[] = {
 	{
 		.name = "intf_0", .id = INTF_0,
 		.base = 0x34000, .len = 0x280,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
@@ -329,7 +328,6 @@ static const struct dpu_intf_cfg sm8550_intf[] = {
 	}, {
 		.name = "intf_1", .id = INTF_1,
 		.base = 0x35000, .len = 0x300,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DSI,
 		.controller_id = MSM_DSI_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
@@ -339,7 +337,6 @@ static const struct dpu_intf_cfg sm8550_intf[] = {
 	}, {
 		.name = "intf_2", .id = INTF_2,
 		.base = 0x36000, .len = 0x300,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DSI,
 		.controller_id = MSM_DSI_CONTROLLER_1,
 		.prog_fetch_lines_worst_case = 24,
@@ -349,7 +346,6 @@ static const struct dpu_intf_cfg sm8550_intf[] = {
 	}, {
 		.name = "intf_3", .id = INTF_3,
 		.base = 0x37000, .len = 0x280,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_1,
 		.prog_fetch_lines_worst_case = 24,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
index bb65535b441e648456c21d4eb97d21713d06402a..6060732dfbeee77eb3a7842ca79045926e616e05 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
@@ -321,7 +321,6 @@ static const struct dpu_intf_cfg x1e80100_intf[] = {
 	{
 		.name = "intf_0", .id = INTF_0,
 		.base = 0x34000, .len = 0x280,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
@@ -330,7 +329,6 @@ static const struct dpu_intf_cfg x1e80100_intf[] = {
 	}, {
 		.name = "intf_1", .id = INTF_1,
 		.base = 0x35000, .len = 0x300,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DSI,
 		.controller_id = MSM_DSI_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
@@ -340,7 +338,6 @@ static const struct dpu_intf_cfg x1e80100_intf[] = {
 	}, {
 		.name = "intf_2", .id = INTF_2,
 		.base = 0x36000, .len = 0x300,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DSI,
 		.controller_id = MSM_DSI_CONTROLLER_1,
 		.prog_fetch_lines_worst_case = 24,
@@ -350,7 +347,6 @@ static const struct dpu_intf_cfg x1e80100_intf[] = {
 	}, {
 		.name = "intf_3", .id = INTF_3,
 		.base = 0x37000, .len = 0x280,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_NONE,
 		.controller_id = MSM_DP_CONTROLLER_0,	/* pair with intf_0 for DP MST */
 		.prog_fetch_lines_worst_case = 24,
@@ -359,7 +355,6 @@ static const struct dpu_intf_cfg x1e80100_intf[] = {
 	}, {
 		.name = "intf_4", .id = INTF_4,
 		.base = 0x38000, .len = 0x280,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_1,
 		.prog_fetch_lines_worst_case = 24,
@@ -368,7 +363,6 @@ static const struct dpu_intf_cfg x1e80100_intf[] = {
 	}, {
 		.name = "intf_5", .id = INTF_5,
 		.base = 0x39000, .len = 0x280,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_3,
 		.prog_fetch_lines_worst_case = 24,
@@ -377,7 +371,6 @@ static const struct dpu_intf_cfg x1e80100_intf[] = {
 	}, {
 		.name = "intf_6", .id = INTF_6,
 		.base = 0x3A000, .len = 0x280,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_2,
 		.prog_fetch_lines_worst_case = 24,
@@ -386,7 +379,6 @@ static const struct dpu_intf_cfg x1e80100_intf[] = {
 	}, {
 		.name = "intf_7", .id = INTF_7,
 		.base = 0x3b000, .len = 0x280,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_NONE,
 		.controller_id = MSM_DP_CONTROLLER_2,	/* pair with intf_6 for DP MST */
 		.prog_fetch_lines_worst_case = 24,
@@ -395,7 +387,6 @@ static const struct dpu_intf_cfg x1e80100_intf[] = {
 	}, {
 		.name = "intf_8", .id = INTF_8,
 		.base = 0x3c000, .len = 0x280,
-		.features = INTF_SC7180_MASK,
 		.type = INTF_NONE,
 		.controller_id = MSM_DP_CONTROLLER_1,	/* pair with intf_4 for DP MST */
 		.prog_fetch_lines_worst_case = 24,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 0078b203461992267250b6ceae7559aeae4bed9d..b18f4848f61391b527af243e6f0866ac3811b7cd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -110,9 +110,6 @@
 #define PINGPONG_SM8150_MASK \
 	(BIT(DPU_PINGPONG_DITHER) | BIT(DPU_PINGPONG_DSC))
 
-#define INTF_SC7180_MASK \
-	(BIT(DPU_INTF_INPUT_CTRL))
-
 #define WB_SDM845_MASK (BIT(DPU_WB_LINE_MODE) | \
 			 BIT(DPU_WB_UBWC) | \
 			 BIT(DPU_WB_YUV_CONFIG) | \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 5afdf7d4324423952f5e9d5735ad112f600f1b7e..07349ba60c15387b0fa26b13cf6acaf69125b9f8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -141,17 +141,6 @@ enum {
 	DPU_CTL_MAX
 };
 
-/**
- * INTF sub-blocks
- * @DPU_INTF_INPUT_CTRL             Supports the setting of pp block from which
- *                                  pixel data arrives to this INTF
- * @DPU_INTF_MAX
- */
-enum {
-	DPU_INTF_INPUT_CTRL = 0x1,
-	DPU_INTF_MAX
-};
-
 /**
   * WB sub-blocks and features
   * @DPU_WB_LINE_MODE        Writeback module supports line/linear mode
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
index 54c2e984ef0ce604e3eda49595d2816ea41bd7fd..a80ac82a96255da1d52e1f2fa7fc39388fc3782b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
@@ -588,7 +588,7 @@ struct dpu_hw_intf *dpu_hw_intf_init(struct drm_device *dev,
 	c->ops.setup_misr = dpu_hw_intf_setup_misr;
 	c->ops.collect_misr = dpu_hw_intf_collect_misr;
 
-	if (cfg->features & BIT(DPU_INTF_INPUT_CTRL))
+	if (mdss_rev->core_major_ver >= 5)
 		c->ops.bind_pingpong_blk = dpu_hw_intf_bind_pingpong_blk;
 
 	/* INTF TE is only for DSI interfaces */

-- 
2.39.5

