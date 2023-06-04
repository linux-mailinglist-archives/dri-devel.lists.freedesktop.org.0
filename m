Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F6F7219D9
	for <lists+dri-devel@lfdr.de>; Sun,  4 Jun 2023 22:36:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04F4A10E121;
	Sun,  4 Jun 2023 20:35:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0440910E124
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Jun 2023 20:35:43 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-4f60a27c4a2so4541888e87.2
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Jun 2023 13:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685910942; x=1688502942;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tsV0mgJX6O51TvzQaikiepAdpD2eZjnyA1+e44MuHNM=;
 b=HKn/uWfm1ifwfnE5bXp4teHvaNJOV3KLWWLpP9GiHNfrdl7VU2dhZ48xlHKO9Ne5Vn
 PNVd236PJSykcjWDn6FaG4GmDQfX6jJHvOnta75nFk4igKOx7/T2A9X5ijC8vHmpNIM0
 8xJc31NOtuXrJpLbiO/Pu1C4pRhLWFpgI4FIQT8MpaKcMBY+sOpR0Sg4Ac/RqVKK+Vll
 zbu64DOjx29tvRDaFesiTs7sxjfBDKJh+yU482B2euMLr1F+5Zd2rMg8/BMdC6j//ynd
 eYbQ+7iP9Y0E/HeSAMKl5FQTkhRET4JKPCQuykoG+E6q/Nhmd9NLMr/vfHeUJxd/ItU9
 uL7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685910942; x=1688502942;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tsV0mgJX6O51TvzQaikiepAdpD2eZjnyA1+e44MuHNM=;
 b=HLnUvzMCcJ8INgPSDIOGu8BEi3QspBCFWJz7nlUXs67QOTkzyZNVNP+mYjNi+4ZQSV
 2KigD0W6rO893XB9/khXBXPC0Hs1YT26muxgL1n1NYkTfWy1I+3o5uQzOR1fY9ghI6XF
 BoZDGyUbHYMmH/++csJ9G9KpggXsrbRm6VEoIqvWDC/K6diqBQZokkOnmv2izgCiatu+
 JMpSRYmFldvT6iVl6IQdhwvOd/Bpfe96kNO8DCZgMPRB3Ot9JKv0D+7/eofuxm6FkQJc
 Jw2X8PuJl0CYdmhmmuQoyaBFu5TxEZL7Am4PwcqxBFlvJxMzdGhFcpN8ZAwxpqgyv5Oc
 Jq2w==
X-Gm-Message-State: AC+VfDx0Yhn/tpClD2Chtri7TAK44yMfpGgY+GTy4ZeG44rQ9wULFKeZ
 l50Fh4oror/JaljBEn3ipZCgJA==
X-Google-Smtp-Source: ACHHUZ67Xxr6Rwh/s1Fl5FkcBHxnay4U7vag503S917QoJ4Ih/UpoMARbEu1UUHCHBCE7vIU4mLC7g==
X-Received: by 2002:ac2:5201:0:b0:4f3:78c2:2a6d with SMTP id
 a1-20020ac25201000000b004f378c22a6dmr4161025lfl.3.1685910941794; 
 Sun, 04 Jun 2023 13:35:41 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 a19-20020a19f813000000b004f2794dcb4asm875822lff.255.2023.06.04.13.35.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Jun 2023 13:35:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 07/22] drm/msm/dpu: drop enum dpu_mdp and MDP_TOP value
Date: Sun,  4 Jun 2023 23:35:17 +0300
Message-Id: <20230604203532.1094249-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230604203532.1094249-1-dmitry.baryshkov@linaro.org>
References: <20230604203532.1094249-1-dmitry.baryshkov@linaro.org>
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
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h  | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h   | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h              | 5 -----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c               | 6 ++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h               | 7 ++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c                  | 2 +-
 17 files changed, 18 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
index 8632e06ebdc9..908584ee3054 100644
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
index 3c2ef8b10439..f8cf29d3a07f 100644
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
index 8cfc3cc2b86e..1d6fc91dfd19 100644
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
index 03b75e4d9247..517a62ad1c4e 100644
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
index 11c150fc1e90..d2b4e4307f89 100644
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
index 9a6d333e498e..774ada2b63c1 100644
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
index b54d0634b231..83984f422fd5 100644
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
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
index 5ce6aa95f39b..8ba5fcb525f5 100644
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
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index 6ae9d4c19a21..79c22b4690bf 100644
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
index 2d54604a7927..d09abeeaa854 100644
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
index 0c58073cf6c4..5ee62a3db27e 100644
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
index efbfeb0a22d0..193b1d16b653 100644
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
index 1b4bf5a81dd1..86f6f04a3e13 100644
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
index 613384b8ca0e..9ab6f5c7e498 100644
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

