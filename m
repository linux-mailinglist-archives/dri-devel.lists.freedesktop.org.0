Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C4572D57B
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 02:10:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B09BC10E2EC;
	Tue, 13 Jun 2023 00:10:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B96C10E2E9
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 00:10:15 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4f644dffd71so6003965e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 17:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686615013; x=1689207013;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xrtRssKG43dlbJC5RiT35bVJS9HcFcOdsMG/+g8qNHg=;
 b=BDvoU8VIVDXJ1poKp+nuwWzR7Hu/ksuL/rl2JPRwR+USSAlMT/VcWRuKwPjEnxVkhg
 CMzunq0XTMf/lYO86ME/Y3QjF27oUWmT5Yxu8UyTGDRMmzVCR05QU3nHtkh8lORjanCx
 5mwa1Uhiqlav1ZJg7AtyUIWWWAbP5Jjd5weSONKtb+9vu0LfmUFns4oXvfV0QfguDRza
 XoXSstsyNAvAUUzY54Qjmr/uGHd2hLdzAkI8ZFWtC7Ja16janHfT+AUUYvtK1x7fv86I
 O3a+nFaYQDUfnPiGuWLTI8ie3i1oSmoSysBbR3HDHA11K/zY8TQs68pkLDu591KMRXbh
 Fwqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686615013; x=1689207013;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xrtRssKG43dlbJC5RiT35bVJS9HcFcOdsMG/+g8qNHg=;
 b=KGeUUfpT/5rO78nuD1h//v2paaDHQr2NRcir8q8R6S/VTjBopMRPhK8Sq7WalNwpri
 N8SPQjOQPDElvw345hr7i9g8PqsRknrHXI5ohLXy+uM8tihoJ+5KYAZ1gP4NuakhlNbk
 wz7BrR1nkAk+5P62ilAFjgbSchKE/hYynsYo5ioqPksL/qtqnzVA3qLBEvWOBCPMVa7M
 zoOHIBt54GU/qq6CVvqSVHfvF/r9Ve5KWHP/BBnQgH39YbrX6zTyP61tW0sP5efzue3h
 l5VwAz3k5/1kSoqbZfnsrBlbLcWMr8Vioh64tjFwp/iZNEfMUw2EqYZTsIaAvtrJ/i61
 fcYw==
X-Gm-Message-State: AC+VfDz+7aQhLrX84SYjPR9aNc3wxStl2OBnGZha65PqFNrlcuYhqKmj
 Jxck6u1OFnyJYFlSZ7pntjMbSA==
X-Google-Smtp-Source: ACHHUZ67MfeTdb/CdCOBRO2rqAMJsptiMMRm8jcKOVeW1X9fXqlft6hzwbbKd7cG4/kvqxeavcpwwQ==
X-Received: by 2002:a19:5002:0:b0:4f6:259d:3d42 with SMTP id
 e2-20020a195002000000b004f6259d3d42mr4481973lfb.3.1686615013607; 
 Mon, 12 Jun 2023 17:10:13 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 c10-20020ac2530a000000b004f63eea01a7sm1581604lfh.192.2023.06.12.17.10.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jun 2023 17:10:13 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v2 08/22] drm/msm/dpu: drop enum dpu_mdp and MDP_TOP value
Date: Tue, 13 Jun 2023 03:09:47 +0300
Message-Id: <20230613001004.3426676-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230613001004.3426676-1-dmitry.baryshkov@linaro.org>
References: <20230613001004.3426676-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since there is always just a single MDP_TOP instance, drop the enum
dpu_mdp and corresponding index value.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h  | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h   | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h   | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h  | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h   | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h   | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h   | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h   | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h  | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h   | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h   | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h              | 5 -----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c               | 6 ++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h               | 7 ++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c                  | 2 +-
 19 files changed, 20 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
index e0d2ee48d733..30565b245b29 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
@@ -27,7 +27,7 @@ static const struct dpu_ubwc_cfg msm8998_ubwc_cfg = {
 };
 
 static const struct dpu_mdp_cfg msm8998_mdp = {
-	.name = "top_0", .id = MDP_TOP,
+	.name = "top_0",
 	.base = 0x0, .len = 0x458,
 	.features = BIT(DPU_MDP_VSYNC_SEL),
 	.clk_ctrls[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
index 72295d5a10dc..35c495bdcbe9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
@@ -27,7 +27,7 @@ static const struct dpu_ubwc_cfg sdm845_ubwc_cfg = {
 };
 
 static const struct dpu_mdp_cfg sdm845_mdp = {
-	.name = "top_0", .id = MDP_TOP,
+	.name = "top_0",
 	.base = 0x0, .len = 0x45c,
 	.features = BIT(DPU_MDP_AUDIO_SELECT) | BIT(DPU_MDP_VSYNC_SEL),
 	.clk_ctrls[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
index 418312b164b8..cb2716715e3d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
@@ -27,7 +27,7 @@ static const struct dpu_ubwc_cfg sm8150_ubwc_cfg = {
 };
 
 static const struct dpu_mdp_cfg sm8150_mdp = {
-	.name = "top_0", .id = MDP_TOP,
+	.name = "top_0",
 	.base = 0x0, .len = 0x45c,
 	.features = BIT(DPU_MDP_AUDIO_SELECT),
 	.clk_ctrls[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
index ffacf29926b3..a655e84cf147 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
@@ -27,7 +27,7 @@ static const struct dpu_ubwc_cfg sc8180x_ubwc_cfg = {
 };
 
 static const struct dpu_mdp_cfg sc8180x_mdp = {
-	.name = "top_0", .id = MDP_TOP,
+	.name = "top_0",
 	.base = 0x0, .len = 0x45c,
 	.features = BIT(DPU_MDP_AUDIO_SELECT),
 	.clk_ctrls[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
index 86dfc5745630..90e561d086e0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
@@ -26,7 +26,7 @@ static const struct dpu_ubwc_cfg sm8250_ubwc_cfg = {
 };
 
 static const struct dpu_mdp_cfg sm8250_mdp = {
-	.name = "top_0", .id = MDP_TOP,
+	.name = "top_0",
 	.base = 0x0, .len = 0x494,
 	.features = 0,
 	.clk_ctrls[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
index f42f27707453..3aafe4dfb663 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
@@ -23,7 +23,7 @@ static const struct dpu_ubwc_cfg sc7180_ubwc_cfg = {
 };
 
 static const struct dpu_mdp_cfg sc7180_mdp = {
-	.name = "top_0", .id = MDP_TOP,
+	.name = "top_0",
 	.base = 0x0, .len = 0x494,
 	.features = 0,
 	.clk_ctrls[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
index 1d21c33542a7..3ff4817de0cc 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
@@ -24,7 +24,7 @@ static const struct dpu_ubwc_cfg sm6115_ubwc_cfg = {
 };
 
 static const struct dpu_mdp_cfg sm6115_mdp = {
-	.name = "top_0", .id = MDP_TOP,
+	.name = "top_0",
 	.base = 0x0, .len = 0x494,
 	.features = 0,
 	.clk_ctrls[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
index 2232803f832b..284e3e888199 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
@@ -26,7 +26,7 @@ static const struct dpu_ubwc_cfg sm6350_ubwc_cfg = {
 };
 
 static const struct dpu_mdp_cfg sm6350_mdp = {
-	.name = "top_0", .id = MDP_TOP,
+	.name = "top_0",
 	.base = 0x0, .len = 0x494,
 	.features = 0,
 	.clk_ctrls[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
index 80670e7cfc57..ba0e419e17cf 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
@@ -21,7 +21,7 @@ static const struct dpu_ubwc_cfg qcm2290_ubwc_cfg = {
 };
 
 static const struct dpu_mdp_cfg qcm2290_mdp = {
-	.name = "top_0", .id = MDP_TOP,
+	.name = "top_0",
 	.base = 0x0, .len = 0x494,
 	.features = 0,
 	.clk_ctrls[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
index 1a5cef8e98ee..e15dd86a6507 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
@@ -25,7 +25,7 @@ static const struct dpu_ubwc_cfg sm6375_ubwc_cfg = {
 };
 
 static const struct dpu_mdp_cfg sm6375_mdp = {
-	.name = "top_0", .id = MDP_TOP,
+	.name = "top_0",
 	.base = 0x0, .len = 0x494,
 	.features = 0,
 	.clk_ctrls[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index 83dafd3f2a41..c741595e2b62 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
@@ -25,7 +25,7 @@ static const struct dpu_ubwc_cfg sm8350_ubwc_cfg = {
 };
 
 static const struct dpu_mdp_cfg sm8350_mdp = {
-	.name = "top_0", .id = MDP_TOP,
+	.name = "top_0",
 	.base = 0x0, .len = 0x494,
 	.features = 0,
 	.clk_ctrls[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
index e67ea2496d02..7ec0bc7d6796 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
@@ -24,7 +24,7 @@ static const struct dpu_ubwc_cfg sc7280_ubwc_cfg = {
 };
 
 static const struct dpu_mdp_cfg sc7280_mdp = {
-	.name = "top_0", .id = MDP_TOP,
+	.name = "top_0",
 	.base = 0x0, .len = 0x2014,
 	.clk_ctrls[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
 	.clk_ctrls[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index 54543dc3985a..6574875c4f13 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -26,7 +26,7 @@ static const struct dpu_ubwc_cfg sc8280xp_ubwc_cfg = {
 };
 
 static const struct dpu_mdp_cfg sc8280xp_mdp = {
-	.name = "top_0", .id = MDP_TOP,
+	.name = "top_0",
 	.base = 0x0, .len = 0x494,
 	.features = BIT(DPU_MDP_PERIPH_0_REMOVED),
 	.clk_ctrls[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index 0f8bf4465372..60a914f19b0d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -26,7 +26,7 @@ static const struct dpu_ubwc_cfg sm8450_ubwc_cfg = {
 };
 
 static const struct dpu_mdp_cfg sm8450_mdp = {
-	.name = "top_0", .id = MDP_TOP,
+	.name = "top_0",
 	.base = 0x0, .len = 0x494,
 	.features = BIT(DPU_MDP_PERIPH_0_REMOVED),
 	.clk_ctrls[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index 851aa078a4bd..6db1b57e6132 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -25,7 +25,7 @@ static const struct dpu_ubwc_cfg sm8550_ubwc_cfg = {
 };
 
 static const struct dpu_mdp_cfg sm8550_mdp = {
-	.name = "top_0", .id = MDP_TOP,
+	.name = "top_0",
 	.base = 0, .len = 0x494,
 	.features = BIT(DPU_MDP_PERIPH_0_REMOVED),
 	.clk_ctrls[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x4330, .bit_off = 0 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
index 02a0f48aac94..d85157acfbf8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
@@ -101,11 +101,6 @@ enum dpu_hw_blk_type {
 	DPU_HW_BLK_MAX,
 };
 
-enum dpu_mdp {
-	MDP_TOP = 0x1,
-	MDP_MAX,
-};
-
 enum dpu_sspp {
 	SSPP_NONE,
 	SSPP_VIG0,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
index 8e2f02731143..1d01f53cd6d3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
@@ -268,9 +268,8 @@ static void _setup_mdp_ops(struct dpu_hw_mdp_ops *ops,
 		ops->intf_audio_select = dpu_hw_intf_audio_select;
 }
 
-struct dpu_hw_mdp *dpu_hw_mdptop_init(enum dpu_mdp idx,
-		void __iomem *addr,
-		const struct dpu_mdss_cfg *m)
+struct dpu_hw_mdp *dpu_hw_mdptop_init(void __iomem *addr,
+				      const struct dpu_mdss_cfg *m)
 {
 	struct dpu_hw_mdp *mdp;
 	const struct dpu_mdp_cfg *cfg;
@@ -288,7 +287,6 @@ struct dpu_hw_mdp *dpu_hw_mdptop_init(enum dpu_mdp idx,
 	/*
 	 * Assign ops
 	 */
-	mdp->idx = idx;
 	mdp->caps = cfg;
 	_setup_mdp_ops(&mdp->ops, mdp->caps->features);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h
index a1a9e44bed36..6414111991b4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h
@@ -137,7 +137,6 @@ struct dpu_hw_mdp {
 	struct dpu_hw_blk_reg_map hw;
 
 	/* top */
-	enum dpu_mdp idx;
 	const struct dpu_mdp_cfg *caps;
 
 	/* ops */
@@ -146,13 +145,11 @@ struct dpu_hw_mdp {
 
 /**
  * dpu_hw_mdptop_init - initializes the top driver for the passed idx
- * @idx:  Interface index for which driver object is required
  * @addr: Mapped register io address of MDP
  * @m:    Pointer to mdss catalog data
  */
-struct dpu_hw_mdp *dpu_hw_mdptop_init(enum dpu_mdp idx,
-		void __iomem *addr,
-		const struct dpu_mdss_cfg *m);
+struct dpu_hw_mdp *dpu_hw_mdptop_init(void __iomem *addr,
+				      const struct dpu_mdss_cfg *m);
 
 void dpu_hw_mdp_destroy(struct dpu_hw_mdp *mdp);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index aa8499de1b9f..f5c7ec923104 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1092,7 +1092,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 
 	dpu_kms->rm_init = true;
 
-	dpu_kms->hw_mdp = dpu_hw_mdptop_init(MDP_TOP, dpu_kms->mmio,
+	dpu_kms->hw_mdp = dpu_hw_mdptop_init(dpu_kms->mmio,
 					     dpu_kms->catalog);
 	if (IS_ERR(dpu_kms->hw_mdp)) {
 		rc = PTR_ERR(dpu_kms->hw_mdp);
-- 
2.39.2

