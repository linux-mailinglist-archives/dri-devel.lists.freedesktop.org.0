Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6AEA70AF2C
	for <lists+dri-devel@lfdr.de>; Sun, 21 May 2023 19:10:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D98AD10E1F0;
	Sun, 21 May 2023 17:10:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BC7010E1E5
 for <dri-devel@lists.freedesktop.org>; Sun, 21 May 2023 17:10:35 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-4f37b860173so5645646e87.2
 for <dri-devel@lists.freedesktop.org>; Sun, 21 May 2023 10:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684689033; x=1687281033;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mvpEDe5pUn+4C35FovpiuOI4yJJEz3RjCH3KADmNYfo=;
 b=AQS68gLahQNPgPPyuiN7anSjoW2K1S6Jj1J3zhR6XtYYH4bYkXkhhlNjgScvmQ2Qsc
 +KNKuapaMugKdqLmXi/roVKKhFGrO5TIV3lCou3mIQEh0EkL97CereqefrlZVMPziUJa
 RP6ncqH37YX0qUaRCr1PJY8XJNMTtGSBooJEmOC6ITX/Eid6xmdFc325FvDSHUnaLL6Z
 uLMQVQUG7LkJ38MAAxTO9Eu/uncbBBW+lWkeILVwzj7GwWSmX0LphOfe7pUjcHbZzW00
 fUiKuUwsDakaHEyuEW5RPJjVOO8hlu1FjfAmw5w1+XbhhwnrzGR3lQ2Vc1OzZl3rzbP+
 YcYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684689033; x=1687281033;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mvpEDe5pUn+4C35FovpiuOI4yJJEz3RjCH3KADmNYfo=;
 b=k/xm7BiDdmGM3/WBqUxdAPqzJlyogLs/g1+DaQI/adqd0zmAvOL3xHGqIDW53fowVh
 8OVF2syjs79yZ9PEz+LCCnvmkUI2aAM0RGJI9/8eEzEuIg/ZYcjq/48C1qnBYjlSKyyd
 w6/066qIxs0KAQKTvG1NUPSiwTXsB5N1RSuW945zqfGPAjsXfGIZ3wkjOkaM5QNN9U4x
 bFgsgfyvgshT8ER7G//19twb2zvXRA2DDFR2nd/0/8pIJrH4/xL65UGoMTmKXkx9i20a
 U2eNAf7OVbUKqUDeH7KYIDbjnfhjgjmzuRCAuIJ5N5+m01i8VfVd2/BTKhfuVsMmy5Ij
 4a+w==
X-Gm-Message-State: AC+VfDwBegBVfWijZC/OXYHhZrWm+MmogBC462/4CXk+bF+UdbQBhV7x
 NPBjyNzBlJ8iN7dm6/Uo8FSuoA==
X-Google-Smtp-Source: ACHHUZ77s+gmzffqzCBqZx9RHRjwxPalesl8g/EAmVi9EDJIuZNyqIbXns8nPBZKTi6YnbZTWBHkCQ==
X-Received: by 2002:a19:ee01:0:b0:4f3:a9fd:8f12 with SMTP id
 g1-20020a19ee01000000b004f3a9fd8f12mr2419529lfb.32.1684689033487; 
 Sun, 21 May 2023 10:10:33 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 k19-20020ac24573000000b004f00189e1dasm680493lfm.143.2023.05.21.10.10.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 May 2023 10:10:32 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH 6/6] drm/msm/dpu: drop UBWC configuration
Date: Sun, 21 May 2023 20:10:26 +0300
Message-Id: <20230521171026.4159495-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230521171026.4159495-1-dmitry.baryshkov@linaro.org>
References: <20230521171026.4159495-1-dmitry.baryshkov@linaro.org>
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
 Stephen Boyd <swboyd@chromium.org>,
 Marijn Suijten <marijn.suijten@somainline.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As the DPU driver has switched to fetching data from MDSS driver, we can
now drop the UBWC and highest_bank_bit parts of the DPU hw catalog.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h   |  6 ------
 .../drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h    |  6 ------
 .../drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h    |  6 ------
 .../drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   |  6 ------
 .../drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    |  7 -------
 .../drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h    |  6 ------
 .../drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h    |  7 -------
 .../drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h   |  5 -----
 .../drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    |  6 ------
 .../drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h    |  7 -------
 .../drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h  |  7 -------
 .../drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    |  7 -------
 .../drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    |  6 ------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    | 15 ---------------
 14 files changed, 97 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
index bdcd554fc8a8..59fa5a376831 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
@@ -21,11 +21,6 @@ static const struct dpu_caps msm8998_dpu_caps = {
 	.max_vdeci_exp = MAX_VERT_DECIMATION,
 };
 
-static const struct dpu_ubwc_cfg msm8998_ubwc_cfg = {
-	.ubwc_version = DPU_HW_UBWC_VER_10,
-	.highest_bank_bit = 0x2,
-};
-
 static const struct dpu_mdp_cfg msm8998_mdp[] = {
 	{
 	.name = "top_0", .id = MDP_TOP,
@@ -178,7 +173,6 @@ static const struct dpu_perf_cfg msm8998_perf_data = {
 
 const struct dpu_mdss_cfg dpu_msm8998_cfg = {
 	.caps = &msm8998_dpu_caps,
-	.ubwc = &msm8998_ubwc_cfg,
 	.mdp_count = ARRAY_SIZE(msm8998_mdp),
 	.mdp = msm8998_mdp,
 	.ctl_count = ARRAY_SIZE(msm8998_ctl),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
index ceca741e93c9..f34ef20aafe0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
@@ -21,11 +21,6 @@ static const struct dpu_caps sdm845_dpu_caps = {
 	.max_vdeci_exp = MAX_VERT_DECIMATION,
 };
 
-static const struct dpu_ubwc_cfg sdm845_ubwc_cfg = {
-	.ubwc_version = DPU_HW_UBWC_VER_20,
-	.highest_bank_bit = 0x2,
-};
-
 static const struct dpu_mdp_cfg sdm845_mdp[] = {
 	{
 	.name = "top_0", .id = MDP_TOP,
@@ -176,7 +171,6 @@ static const struct dpu_perf_cfg sdm845_perf_data = {
 
 const struct dpu_mdss_cfg dpu_sdm845_cfg = {
 	.caps = &sdm845_dpu_caps,
-	.ubwc = &sdm845_ubwc_cfg,
 	.mdp_count = ARRAY_SIZE(sdm845_mdp),
 	.mdp = sdm845_mdp,
 	.ctl_count = ARRAY_SIZE(sdm845_ctl),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
index 42b0e58624d0..a51209603243 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
@@ -21,11 +21,6 @@ static const struct dpu_caps sm8150_dpu_caps = {
 	.max_vdeci_exp = MAX_VERT_DECIMATION,
 };
 
-static const struct dpu_ubwc_cfg sm8150_ubwc_cfg = {
-	.ubwc_version = DPU_HW_UBWC_VER_30,
-	.highest_bank_bit = 0x2,
-};
-
 static const struct dpu_mdp_cfg sm8150_mdp[] = {
 	{
 	.name = "top_0", .id = MDP_TOP,
@@ -199,7 +194,6 @@ static const struct dpu_perf_cfg sm8150_perf_data = {
 
 const struct dpu_mdss_cfg dpu_sm8150_cfg = {
 	.caps = &sm8150_dpu_caps,
-	.ubwc = &sm8150_ubwc_cfg,
 	.mdp_count = ARRAY_SIZE(sm8150_mdp),
 	.mdp = sm8150_mdp,
 	.ctl_count = ARRAY_SIZE(sm8150_ctl),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
index e3bdfe7b30f1..574e1e45941d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
@@ -21,11 +21,6 @@ static const struct dpu_caps sc8180x_dpu_caps = {
 	.max_vdeci_exp = MAX_VERT_DECIMATION,
 };
 
-static const struct dpu_ubwc_cfg sc8180x_ubwc_cfg = {
-	.ubwc_version = DPU_HW_UBWC_VER_30,
-	.highest_bank_bit = 0x3,
-};
-
 static const struct dpu_mdp_cfg sc8180x_mdp[] = {
 	{
 	.name = "top_0", .id = MDP_TOP,
@@ -181,7 +176,6 @@ static const struct dpu_perf_cfg sc8180x_perf_data = {
 
 const struct dpu_mdss_cfg dpu_sc8180x_cfg = {
 	.caps = &sc8180x_dpu_caps,
-	.ubwc = &sc8180x_ubwc_cfg,
 	.mdp_count = ARRAY_SIZE(sc8180x_mdp),
 	.mdp = sc8180x_mdp,
 	.ctl_count = ARRAY_SIZE(sc8180x_ctl),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
index ed130582873c..2df9fd4080bb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
@@ -19,12 +19,6 @@ static const struct dpu_caps sm8250_dpu_caps = {
 	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
 };
 
-static const struct dpu_ubwc_cfg sm8250_ubwc_cfg = {
-	.ubwc_version = DPU_HW_UBWC_VER_40,
-	.highest_bank_bit = 0x3, /* TODO: 2 for LP_DDR4 */
-	.ubwc_swizzle = 0x6,
-};
-
 static const struct dpu_mdp_cfg sm8250_mdp[] = {
 	{
 	.name = "top_0", .id = MDP_TOP,
@@ -205,7 +199,6 @@ static const struct dpu_perf_cfg sm8250_perf_data = {
 
 const struct dpu_mdss_cfg dpu_sm8250_cfg = {
 	.caps = &sm8250_dpu_caps,
-	.ubwc = &sm8250_ubwc_cfg,
 	.mdp_count = ARRAY_SIZE(sm8250_mdp),
 	.mdp = sm8250_mdp,
 	.ctl_count = ARRAY_SIZE(sm8250_ctl),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
index a46b11730a4d..8a044c411a4d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
@@ -17,11 +17,6 @@ static const struct dpu_caps sc7180_dpu_caps = {
 	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
 };
 
-static const struct dpu_ubwc_cfg sc7180_ubwc_cfg = {
-	.ubwc_version = DPU_HW_UBWC_VER_20,
-	.highest_bank_bit = 0x3,
-};
-
 static const struct dpu_mdp_cfg sc7180_mdp[] = {
 	{
 	.name = "top_0", .id = MDP_TOP,
@@ -124,7 +119,6 @@ static const struct dpu_perf_cfg sc7180_perf_data = {
 
 const struct dpu_mdss_cfg dpu_sc7180_cfg = {
 	.caps = &sc7180_dpu_caps,
-	.ubwc = &sc7180_ubwc_cfg,
 	.mdp_count = ARRAY_SIZE(sc7180_mdp),
 	.mdp = sc7180_mdp,
 	.ctl_count = ARRAY_SIZE(sc7180_ctl),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
index 988d820f7ef2..e92ab625a343 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
@@ -17,12 +17,6 @@ static const struct dpu_caps sm6115_dpu_caps = {
 	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
 };
 
-static const struct dpu_ubwc_cfg sm6115_ubwc_cfg = {
-	.ubwc_version = DPU_HW_UBWC_VER_10,
-	.highest_bank_bit = 0x1,
-	.ubwc_swizzle = 0x7,
-};
-
 static const struct dpu_mdp_cfg sm6115_mdp[] = {
 	{
 	.name = "top_0", .id = MDP_TOP,
@@ -101,7 +95,6 @@ static const struct dpu_perf_cfg sm6115_perf_data = {
 
 const struct dpu_mdss_cfg dpu_sm6115_cfg = {
 	.caps = &sm6115_dpu_caps,
-	.ubwc = &sm6115_ubwc_cfg,
 	.mdp_count = ARRAY_SIZE(sm6115_mdp),
 	.mdp = sm6115_mdp,
 	.ctl_count = ARRAY_SIZE(sm6115_ctl),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
index c9003dcc1a59..d69a5e12608d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
@@ -16,10 +16,6 @@ static const struct dpu_caps qcm2290_dpu_caps = {
 	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
 };
 
-static const struct dpu_ubwc_cfg qcm2290_ubwc_cfg = {
-	.highest_bank_bit = 0x2,
-};
-
 static const struct dpu_mdp_cfg qcm2290_mdp[] = {
 	{
 	.name = "top_0", .id = MDP_TOP,
@@ -91,7 +87,6 @@ static const struct dpu_perf_cfg qcm2290_perf_data = {
 
 const struct dpu_mdss_cfg dpu_qcm2290_cfg = {
 	.caps = &qcm2290_dpu_caps,
-	.ubwc = &qcm2290_ubwc_cfg,
 	.mdp_count = ARRAY_SIZE(qcm2290_mdp),
 	.mdp = qcm2290_mdp,
 	.ctl_count = ARRAY_SIZE(qcm2290_ctl),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index 4f6a965bcd90..657593099c17 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
@@ -19,11 +19,6 @@ static const struct dpu_caps sm8350_dpu_caps = {
 	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
 };
 
-static const struct dpu_ubwc_cfg sm8350_ubwc_cfg = {
-	.ubwc_version = DPU_HW_UBWC_VER_40,
-	.highest_bank_bit = 0x3, /* TODO: 2 for LP_DDR4 */
-};
-
 static const struct dpu_mdp_cfg sm8350_mdp[] = {
 	{
 	.name = "top_0", .id = MDP_TOP,
@@ -192,7 +187,6 @@ static const struct dpu_perf_cfg sm8350_perf_data = {
 
 const struct dpu_mdss_cfg dpu_sm8350_cfg = {
 	.caps = &sm8350_dpu_caps,
-	.ubwc = &sm8350_ubwc_cfg,
 	.mdp_count = ARRAY_SIZE(sm8350_mdp),
 	.mdp = sm8350_mdp,
 	.ctl_count = ARRAY_SIZE(sm8350_ctl),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
index 6b2c7eae71d9..140b6aff1741 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
@@ -17,12 +17,6 @@ static const struct dpu_caps sc7280_dpu_caps = {
 	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
 };
 
-static const struct dpu_ubwc_cfg sc7280_ubwc_cfg = {
-	.ubwc_version = DPU_HW_UBWC_VER_30,
-	.highest_bank_bit = 0x1,
-	.ubwc_swizzle = 0x6,
-};
-
 static const struct dpu_mdp_cfg sc7280_mdp[] = {
 	{
 	.name = "top_0", .id = MDP_TOP,
@@ -129,7 +123,6 @@ static const struct dpu_perf_cfg sc7280_perf_data = {
 
 const struct dpu_mdss_cfg dpu_sc7280_cfg = {
 	.caps = &sc7280_dpu_caps,
-	.ubwc = &sc7280_ubwc_cfg,
 	.mdp_count = ARRAY_SIZE(sc7280_mdp),
 	.mdp = sc7280_mdp,
 	.ctl_count = ARRAY_SIZE(sc7280_ctl),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index 706d0f13b598..b215dddf7a5a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -19,12 +19,6 @@ static const struct dpu_caps sc8280xp_dpu_caps = {
 	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
 };
 
-static const struct dpu_ubwc_cfg sc8280xp_ubwc_cfg = {
-	.ubwc_version = DPU_HW_UBWC_VER_40,
-	.highest_bank_bit = 2,
-	.ubwc_swizzle = 6,
-};
-
 static const struct dpu_mdp_cfg sc8280xp_mdp[] = {
 	{
 	.name = "top_0", .id = MDP_TOP,
@@ -183,7 +177,6 @@ static const struct dpu_perf_cfg sc8280xp_perf_data = {
 
 const struct dpu_mdss_cfg dpu_sc8280xp_cfg = {
 	.caps = &sc8280xp_dpu_caps,
-	.ubwc = &sc8280xp_ubwc_cfg,
 	.mdp_count = ARRAY_SIZE(sc8280xp_mdp),
 	.mdp = sc8280xp_mdp,
 	.ctl_count = ARRAY_SIZE(sc8280xp_ctl),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index 4ecb3df5cbc0..d4f58852fb54 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -19,12 +19,6 @@ static const struct dpu_caps sm8450_dpu_caps = {
 	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
 };
 
-static const struct dpu_ubwc_cfg sm8450_ubwc_cfg = {
-	.ubwc_version = DPU_HW_UBWC_VER_40,
-	.highest_bank_bit = 0x3, /* TODO: 2 for LP_DDR4 */
-	.ubwc_swizzle = 0x6,
-};
-
 static const struct dpu_mdp_cfg sm8450_mdp[] = {
 	{
 	.name = "top_0", .id = MDP_TOP,
@@ -200,7 +194,6 @@ static const struct dpu_perf_cfg sm8450_perf_data = {
 
 const struct dpu_mdss_cfg dpu_sm8450_cfg = {
 	.caps = &sm8450_dpu_caps,
-	.ubwc = &sm8450_ubwc_cfg,
 	.mdp_count = ARRAY_SIZE(sm8450_mdp),
 	.mdp = sm8450_mdp,
 	.ctl_count = ARRAY_SIZE(sm8450_ctl),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index d0ab351b6a8b..1b446c6052a4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -19,11 +19,6 @@ static const struct dpu_caps sm8550_dpu_caps = {
 	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
 };
 
-static const struct dpu_ubwc_cfg sm8550_ubwc_cfg = {
-	.ubwc_version = DPU_HW_UBWC_VER_40,
-	.highest_bank_bit = 0x3, /* TODO: 2 for LP_DDR4 */
-};
-
 static const struct dpu_mdp_cfg sm8550_mdp[] = {
 	{
 	.name = "top_0", .id = MDP_TOP,
@@ -205,7 +200,6 @@ static const struct dpu_perf_cfg sm8550_perf_data = {
 
 const struct dpu_mdss_cfg dpu_sm8550_cfg = {
 	.caps = &sm8550_dpu_caps,
-	.ubwc = &sm8550_ubwc_cfg,
 	.mdp_count = ARRAY_SIZE(sm8550_mdp),
 	.mdp = sm8550_mdp,
 	.ctl_count = ARRAY_SIZE(sm8550_ctl),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 71584cd56fd7..d5088ee86b85 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -506,19 +506,6 @@ struct dpu_mdp_cfg {
 	struct dpu_clk_ctrl_reg clk_ctrls[DPU_CLK_CTRL_MAX];
 };
 
-/**
- * struct dpu_ubwc_cfg - UBWC and memory configuration
- *
- * @ubwc_version       UBWC feature version (0x0 for not supported)
- * @highest_bank_bit:  UBWC parameter
- * @ubwc_swizzle:      ubwc default swizzle setting
- */
-struct dpu_ubwc_cfg {
-	u32 ubwc_version;
-	u32 highest_bank_bit;
-	u32 ubwc_swizzle;
-};
-
 /* struct dpu_ctl_cfg : MDP CTL instance info
  * @id:                index identifying this block
  * @base:              register base offset to mdss
@@ -818,8 +805,6 @@ struct dpu_perf_cfg {
 struct dpu_mdss_cfg {
 	const struct dpu_caps *caps;
 
-	const struct dpu_ubwc_cfg *ubwc;
-
 	u32 mdp_count;
 	const struct dpu_mdp_cfg *mdp;
 
-- 
2.39.2

