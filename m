Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFBD06D117F
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 23:54:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA0A810F088;
	Thu, 30 Mar 2023 21:54:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8497D10F050
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 21:54:12 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id c29so26406969lfv.3
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 14:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680213251;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pZgLTI2iw0i0Tb+BC6v/SGeSmhB6QZvULpJ7bafcZTk=;
 b=pGQoMy5Uvl6hiTvyM2hCZjJgVxoMaDGbMoxqh1btLsrOxZ5686bdEBKRIJw0xKQbjh
 3P6pltaRQ7pB+MEz39KVSJN+0I49TOAZH3gTSpzhMdJnrX0Eku8digROGYtP0+7W+h7u
 nbEhL9L48J/Hof3RL6zyebK6XK4qbw0/1Wcm5PVy+Mue09xVQcWvLWiw8oqjRzhxDZTK
 BVVWFpLwBvhmfkCFtL5Fh5Uo6VbzVUzaPUjAA8k2lrXOcXxYCiVutqt2oTw6YAsdUkTy
 hEqg/3Tl4LZr+RpBtFN8pH+bylxFPuElQ8JgOi0dX0Wjf3wVoD2iXeqqGXjOpKTsqUG1
 gd/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680213251;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pZgLTI2iw0i0Tb+BC6v/SGeSmhB6QZvULpJ7bafcZTk=;
 b=tFVc9W3S0wrdJKhhBLp8Dj5sZIH9b+TH3miY/5ogAGG2APHQniIQ3E16EVznUG47Sg
 7yzWKNy7ab01pMneBVD8yVUVVAJ0t9xHCFqdkh5VktfHDBB0fpMbYgPjgLcXUeEGTEML
 i0M517r9UnqvyILujcAiwaXAfNXy4iDCnSsSdQB4+QfLhuVgnsUfvqMUSwNvAj7j8qLN
 JwQDfFJSdZbSKApeDK6WqVWZbHgSpwIFAmV7cCV2Ik1odS7FqrTWHsjbkAsBSRK6qFvT
 Gbd1kRejLTDd0IRCfwB1ES5yHJpKdT31nf/S06qlfbIUSxPM7PJjxgewFZgRZiSdPdZr
 L9Bw==
X-Gm-Message-State: AAQBX9ff0WUBJnDg9rB94XIh04HA8CmN7HKL6dFWoKy+5PvNN37oIlcO
 iSJ2IHDgX1M2jMOkhH6/u2QXvA==
X-Google-Smtp-Source: AKy350Zygcy3mr5CRS+KRWalUu95wx89Yh5DS1yvRyWNmMsJaR9blLUXMDqNz2UGqqkp3qefi5DJOA==
X-Received: by 2002:ac2:55a4:0:b0:4eb:beb:5ee0 with SMTP id
 y4-20020ac255a4000000b004eb0beb5ee0mr6226338lfg.35.1680213249859; 
 Thu, 30 Mar 2023 14:54:09 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 f16-20020a056512093000b004cc8207741fsm104574lft.93.2023.03.30.14.54.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Mar 2023 14:54:09 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v3 20/38] drm/msm/dpu: duplicate sm8150 catalog entries
Date: Fri, 31 Mar 2023 00:53:06 +0300
Message-Id: <20230330215324.1853304-21-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230330215324.1853304-1-dmitry.baryshkov@linaro.org>
References: <20230330215324.1853304-1-dmitry.baryshkov@linaro.org>
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
 Stephen Boyd <swboyd@chromium.org>, Konrad Dybcio <konrad.dybcio@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Duplicate some of sm8150 catalog entries to remove dependencies between
DPU major generations.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    | 134 ++++++++++++++++--
 .../msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    |  34 ++++-
 .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h  |  15 +-
 .../msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    |  33 ++++-
 .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    |  33 ++++-
 5 files changed, 221 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
index 92a4b21c4493..f19d1c2ba845 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
@@ -43,6 +43,45 @@ static const struct dpu_mdp_cfg sm8250_mdp[] = {
 	},
 };
 
+static const struct dpu_ctl_cfg sm8250_ctl[] = {
+	{
+	.name = "ctl_0", .id = CTL_0,
+	.base = 0x1000, .len = 0x1e0,
+	.features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_SPLIT_DISPLAY),
+	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
+	},
+	{
+	.name = "ctl_1", .id = CTL_1,
+	.base = 0x1200, .len = 0x1e0,
+	.features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_SPLIT_DISPLAY),
+	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
+	},
+	{
+	.name = "ctl_2", .id = CTL_2,
+	.base = 0x1400, .len = 0x1e0,
+	.features = BIT(DPU_CTL_ACTIVE_CFG),
+	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
+	},
+	{
+	.name = "ctl_3", .id = CTL_3,
+	.base = 0x1600, .len = 0x1e0,
+	.features = BIT(DPU_CTL_ACTIVE_CFG),
+	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
+	},
+	{
+	.name = "ctl_4", .id = CTL_4,
+	.base = 0x1800, .len = 0x1e0,
+	.features = BIT(DPU_CTL_ACTIVE_CFG),
+	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
+	},
+	{
+	.name = "ctl_5", .id = CTL_5,
+	.base = 0x1a00, .len = 0x1e0,
+	.features = BIT(DPU_CTL_ACTIVE_CFG),
+	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
+	},
+};
+
 static const struct dpu_sspp_cfg sm8250_sspp[] = {
 	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x1f8, VIG_SC7180_MASK_SDMA,
 		sm8250_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
@@ -62,6 +101,73 @@ static const struct dpu_sspp_cfg sm8250_sspp[] = {
 		sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA3),
 };
 
+static const struct dpu_lm_cfg sm8250_lm[] = {
+	LM_BLK("lm_0", LM_0, 0x44000, MIXER_SDM845_MASK,
+		&sdm845_lm_sblk, PINGPONG_0, LM_1, DSPP_0),
+	LM_BLK("lm_1", LM_1, 0x45000, MIXER_SDM845_MASK,
+		&sdm845_lm_sblk, PINGPONG_1, LM_0, DSPP_1),
+	LM_BLK("lm_2", LM_2, 0x46000, MIXER_SDM845_MASK,
+		&sdm845_lm_sblk, PINGPONG_2, LM_3, 0),
+	LM_BLK("lm_3", LM_3, 0x47000, MIXER_SDM845_MASK,
+		&sdm845_lm_sblk, PINGPONG_3, LM_2, 0),
+	LM_BLK("lm_4", LM_4, 0x48000, MIXER_SDM845_MASK,
+		&sdm845_lm_sblk, PINGPONG_4, LM_5, 0),
+	LM_BLK("lm_5", LM_5, 0x49000, MIXER_SDM845_MASK,
+		&sdm845_lm_sblk, PINGPONG_5, LM_4, 0),
+};
+
+static const struct dpu_dspp_cfg sm8250_dspp[] = {
+	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
+		 &sm8150_dspp_sblk),
+	DSPP_BLK("dspp_1", DSPP_1, 0x56000, DSPP_SC7180_MASK,
+		 &sm8150_dspp_sblk),
+	DSPP_BLK("dspp_2", DSPP_2, 0x58000, DSPP_SC7180_MASK,
+		 &sm8150_dspp_sblk),
+	DSPP_BLK("dspp_3", DSPP_3, 0x5a000, DSPP_SC7180_MASK,
+		 &sm8150_dspp_sblk),
+};
+
+static const struct dpu_pingpong_cfg sm8250_pp[] = {
+	PP_BLK_TE("pingpong_0", PINGPONG_0, 0x70000, MERGE_3D_0, sdm845_pp_sblk_te,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12)),
+	PP_BLK_TE("pingpong_1", PINGPONG_1, 0x70800, MERGE_3D_0, sdm845_pp_sblk_te,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13)),
+	PP_BLK("pingpong_2", PINGPONG_2, 0x71000, MERGE_3D_1, sdm845_pp_sblk,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 14)),
+	PP_BLK("pingpong_3", PINGPONG_3, 0x71800, MERGE_3D_1, sdm845_pp_sblk,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 15)),
+	PP_BLK("pingpong_4", PINGPONG_4, 0x72000, MERGE_3D_2, sdm845_pp_sblk,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30),
+			-1),
+	PP_BLK("pingpong_5", PINGPONG_5, 0x72800, MERGE_3D_2, sdm845_pp_sblk,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
+			-1),
+};
+
+static const struct dpu_merge_3d_cfg sm8250_merge_3d[] = {
+	MERGE_3D_BLK("merge_3d_0", MERGE_3D_0, 0x83000),
+	MERGE_3D_BLK("merge_3d_1", MERGE_3D_1, 0x83100),
+	MERGE_3D_BLK("merge_3d_2", MERGE_3D_2, 0x83200),
+};
+
+static const struct dpu_dsc_cfg sm8250_dsc[] = {
+	DSC_BLK("dsc_0", DSC_0, 0x80000, BIT(DPU_DSC_OUTPUT_CTRL)),
+	DSC_BLK("dsc_1", DSC_1, 0x80400, BIT(DPU_DSC_OUTPUT_CTRL)),
+	DSC_BLK("dsc_2", DSC_2, 0x80800, BIT(DPU_DSC_OUTPUT_CTRL)),
+	DSC_BLK("dsc_3", DSC_3, 0x80c00, BIT(DPU_DSC_OUTPUT_CTRL)),
+};
+
+static const struct dpu_intf_cfg sm8250_intf[] = {
+	INTF_BLK("intf_0", INTF_0, 0x6a000, 0x2b8, INTF_DP, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
+	INTF_BLK("intf_1", INTF_1, 0x6a800, 0x2b8, INTF_DSI, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
+	INTF_BLK("intf_2", INTF_2, 0x6b000, 0x2b8, INTF_DSI, 1, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
+	INTF_BLK("intf_3", INTF_3, 0x6b800, 0x2b8, INTF_DP, 1, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
+};
+
 static const struct dpu_wb_cfg sm8250_wb[] = {
 	WB_BLK("wb_2", WB_2, 0x65000, WB_SM8250_MASK, DPU_CLK_CTRL_WB2, 6,
 			VBIF_RT, MDP_SSPP_TOP0_INTR, 4096, 4),
@@ -101,22 +207,22 @@ static const struct dpu_mdss_cfg sm8250_dpu_cfg = {
 	.ubwc = &sm8250_ubwc_cfg,
 	.mdp_count = ARRAY_SIZE(sm8250_mdp),
 	.mdp = sm8250_mdp,
-	.ctl_count = ARRAY_SIZE(sm8150_ctl),
-	.ctl = sm8150_ctl,
+	.ctl_count = ARRAY_SIZE(sm8250_ctl),
+	.ctl = sm8250_ctl,
 	.sspp_count = ARRAY_SIZE(sm8250_sspp),
 	.sspp = sm8250_sspp,
-	.mixer_count = ARRAY_SIZE(sm8150_lm),
-	.mixer = sm8150_lm,
-	.dspp_count = ARRAY_SIZE(sm8150_dspp),
-	.dspp = sm8150_dspp,
-	.dsc_count = ARRAY_SIZE(sm8150_dsc),
-	.dsc = sm8150_dsc,
-	.pingpong_count = ARRAY_SIZE(sm8150_pp),
-	.pingpong = sm8150_pp,
-	.merge_3d_count = ARRAY_SIZE(sm8150_merge_3d),
-	.merge_3d = sm8150_merge_3d,
-	.intf_count = ARRAY_SIZE(sm8150_intf),
-	.intf = sm8150_intf,
+	.mixer_count = ARRAY_SIZE(sm8250_lm),
+	.mixer = sm8250_lm,
+	.dspp_count = ARRAY_SIZE(sm8250_dspp),
+	.dspp = sm8250_dspp,
+	.dsc_count = ARRAY_SIZE(sm8250_dsc),
+	.dsc = sm8250_dsc,
+	.pingpong_count = ARRAY_SIZE(sm8250_pp),
+	.pingpong = sm8250_pp,
+	.merge_3d_count = ARRAY_SIZE(sm8250_merge_3d),
+	.merge_3d = sm8250_merge_3d,
+	.intf_count = ARRAY_SIZE(sm8250_intf),
+	.intf = sm8250_intf,
 	.vbif_count = ARRAY_SIZE(sdm845_vbif),
 	.vbif = sdm845_vbif,
 	.wb_count = ARRAY_SIZE(sm8250_wb),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index e6298617ea8d..b1c0cf882314 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
@@ -80,6 +80,32 @@ static const struct dpu_ctl_cfg sm8350_ctl[] = {
 	},
 };
 
+static const struct dpu_lm_cfg sm8350_lm[] = {
+	LM_BLK("lm_0", LM_0, 0x44000, MIXER_SDM845_MASK,
+		&sdm845_lm_sblk, PINGPONG_0, LM_1, DSPP_0),
+	LM_BLK("lm_1", LM_1, 0x45000, MIXER_SDM845_MASK,
+		&sdm845_lm_sblk, PINGPONG_1, LM_0, DSPP_1),
+	LM_BLK("lm_2", LM_2, 0x46000, MIXER_SDM845_MASK,
+		&sdm845_lm_sblk, PINGPONG_2, LM_3, 0),
+	LM_BLK("lm_3", LM_3, 0x47000, MIXER_SDM845_MASK,
+		&sdm845_lm_sblk, PINGPONG_3, LM_2, 0),
+	LM_BLK("lm_4", LM_4, 0x48000, MIXER_SDM845_MASK,
+		&sdm845_lm_sblk, PINGPONG_4, LM_5, 0),
+	LM_BLK("lm_5", LM_5, 0x49000, MIXER_SDM845_MASK,
+		&sdm845_lm_sblk, PINGPONG_5, LM_4, 0),
+};
+
+static const struct dpu_dspp_cfg sm8350_dspp[] = {
+	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
+		 &sm8150_dspp_sblk),
+	DSPP_BLK("dspp_1", DSPP_1, 0x56000, DSPP_SC7180_MASK,
+		 &sm8150_dspp_sblk),
+	DSPP_BLK("dspp_2", DSPP_2, 0x58000, DSPP_SC7180_MASK,
+		 &sm8150_dspp_sblk),
+	DSPP_BLK("dspp_3", DSPP_3, 0x5a000, DSPP_SC7180_MASK,
+		 &sm8150_dspp_sblk),
+};
+
 static const struct dpu_pingpong_cfg sm8350_pp[] = {
 	PP_BLK_TE("pingpong_0", PINGPONG_0, 0x69000, MERGE_3D_0, sdm845_pp_sblk_te,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
@@ -153,10 +179,10 @@ static const struct dpu_mdss_cfg sm8350_dpu_cfg = {
 	.ctl = sm8350_ctl,
 	.sspp_count = ARRAY_SIZE(sm8250_sspp),
 	.sspp = sm8250_sspp,
-	.mixer_count = ARRAY_SIZE(sm8150_lm),
-	.mixer = sm8150_lm,
-	.dspp_count = ARRAY_SIZE(sm8150_dspp),
-	.dspp = sm8150_dspp,
+	.mixer_count = ARRAY_SIZE(sm8350_lm),
+	.mixer = sm8350_lm,
+	.dspp_count = ARRAY_SIZE(sm8350_dspp),
+	.dspp = sm8350_dspp,
 	.pingpong_count = ARRAY_SIZE(sm8350_pp),
 	.pingpong = sm8350_pp,
 	.merge_3d_count = ARRAY_SIZE(sm8350_merge_3d),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index 96713c72e963..efec28187cfd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -109,6 +109,17 @@ static const struct dpu_lm_cfg sc8280xp_lm[] = {
 	LM_BLK("lm_5", LM_5, 0x49000, MIXER_SDM845_MASK, &sdm845_lm_sblk, PINGPONG_5, LM_4, 0),
 };
 
+static const struct dpu_dspp_cfg sc8280xp_dspp[] = {
+	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
+		 &sm8150_dspp_sblk),
+	DSPP_BLK("dspp_1", DSPP_1, 0x56000, DSPP_SC7180_MASK,
+		 &sm8150_dspp_sblk),
+	DSPP_BLK("dspp_2", DSPP_2, 0x58000, DSPP_SC7180_MASK,
+		 &sm8150_dspp_sblk),
+	DSPP_BLK("dspp_3", DSPP_3, 0x5a000, DSPP_SC7180_MASK,
+		 &sm8150_dspp_sblk),
+};
+
 static const struct dpu_pingpong_cfg sc8280xp_pp[] = {
 	PP_BLK_TE("pingpong_0", PINGPONG_0, 0x69000, MERGE_3D_0, sdm845_pp_sblk_te,
 		  DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8), -1),
@@ -175,8 +186,8 @@ static const struct dpu_mdss_cfg sc8280xp_dpu_cfg = {
 	.sspp = sc8280xp_sspp,
 	.mixer_count = ARRAY_SIZE(sc8280xp_lm),
 	.mixer = sc8280xp_lm,
-	.dspp_count = ARRAY_SIZE(sm8150_dspp),
-	.dspp = sm8150_dspp,
+	.dspp_count = ARRAY_SIZE(sc8280xp_dspp),
+	.dspp = sc8280xp_dspp,
 	.pingpong_count = ARRAY_SIZE(sc8280xp_pp),
 	.pingpong = sc8280xp_pp,
 	.merge_3d_count = ARRAY_SIZE(sm8350_merge_3d),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index 02521ab2f805..af80e1ced3ce 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -100,6 +100,31 @@ static const struct dpu_sspp_cfg sm8450_sspp[] = {
 		sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA3),
 };
 
+static const struct dpu_lm_cfg sm8450_lm[] = {
+	LM_BLK("lm_0", LM_0, 0x44000, MIXER_SDM845_MASK,
+		&sdm845_lm_sblk, PINGPONG_0, LM_1, DSPP_0),
+	LM_BLK("lm_1", LM_1, 0x45000, MIXER_SDM845_MASK,
+		&sdm845_lm_sblk, PINGPONG_1, LM_0, DSPP_1),
+	LM_BLK("lm_2", LM_2, 0x46000, MIXER_SDM845_MASK,
+		&sdm845_lm_sblk, PINGPONG_2, LM_3, 0),
+	LM_BLK("lm_3", LM_3, 0x47000, MIXER_SDM845_MASK,
+		&sdm845_lm_sblk, PINGPONG_3, LM_2, 0),
+	LM_BLK("lm_4", LM_4, 0x48000, MIXER_SDM845_MASK,
+		&sdm845_lm_sblk, PINGPONG_4, LM_5, 0),
+	LM_BLK("lm_5", LM_5, 0x49000, MIXER_SDM845_MASK,
+		&sdm845_lm_sblk, PINGPONG_5, LM_4, 0),
+};
+
+static const struct dpu_dspp_cfg sm8450_dspp[] = {
+	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
+		 &sm8150_dspp_sblk),
+	DSPP_BLK("dspp_1", DSPP_1, 0x56000, DSPP_SC7180_MASK,
+		 &sm8150_dspp_sblk),
+	DSPP_BLK("dspp_2", DSPP_2, 0x58000, DSPP_SC7180_MASK,
+		 &sm8150_dspp_sblk),
+	DSPP_BLK("dspp_3", DSPP_3, 0x5a000, DSPP_SC7180_MASK,
+		 &sm8150_dspp_sblk),
+};
 /* FIXME: interrupts */
 static const struct dpu_pingpong_cfg sm8450_pp[] = {
 	PP_BLK_TE("pingpong_0", PINGPONG_0, 0x69000, MERGE_3D_0, sdm845_pp_sblk_te,
@@ -181,10 +206,10 @@ static const struct dpu_mdss_cfg sm8450_dpu_cfg = {
 	.ctl = sm8450_ctl,
 	.sspp_count = ARRAY_SIZE(sm8450_sspp),
 	.sspp = sm8450_sspp,
-	.mixer_count = ARRAY_SIZE(sm8150_lm),
-	.mixer = sm8150_lm,
-	.dspp_count = ARRAY_SIZE(sm8150_dspp),
-	.dspp = sm8150_dspp,
+	.mixer_count = ARRAY_SIZE(sm8450_lm),
+	.mixer = sm8450_lm,
+	.dspp_count = ARRAY_SIZE(sm8450_dspp),
+	.dspp = sm8450_dspp,
 	.pingpong_count = ARRAY_SIZE(sm8450_pp),
 	.pingpong = sm8450_pp,
 	.merge_3d_count = ARRAY_SIZE(sm8450_merge_3d),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index 8db73d03b194..5c437c7682ea 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -105,6 +105,31 @@ static const struct dpu_sspp_cfg sm8550_sspp[] = {
 		sm8550_dma_sblk_5, 15, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA5),
 };
 
+static const struct dpu_lm_cfg sm8550_lm[] = {
+	LM_BLK("lm_0", LM_0, 0x44000, MIXER_SDM845_MASK,
+		&sdm845_lm_sblk, PINGPONG_0, LM_1, DSPP_0),
+	LM_BLK("lm_1", LM_1, 0x45000, MIXER_SDM845_MASK,
+		&sdm845_lm_sblk, PINGPONG_1, LM_0, DSPP_1),
+	LM_BLK("lm_2", LM_2, 0x46000, MIXER_SDM845_MASK,
+		&sdm845_lm_sblk, PINGPONG_2, LM_3, 0),
+	LM_BLK("lm_3", LM_3, 0x47000, MIXER_SDM845_MASK,
+		&sdm845_lm_sblk, PINGPONG_3, LM_2, 0),
+	LM_BLK("lm_4", LM_4, 0x48000, MIXER_SDM845_MASK,
+		&sdm845_lm_sblk, PINGPONG_4, LM_5, 0),
+	LM_BLK("lm_5", LM_5, 0x49000, MIXER_SDM845_MASK,
+		&sdm845_lm_sblk, PINGPONG_5, LM_4, 0),
+};
+
+static const struct dpu_dspp_cfg sm8550_dspp[] = {
+	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
+		 &sm8150_dspp_sblk),
+	DSPP_BLK("dspp_1", DSPP_1, 0x56000, DSPP_SC7180_MASK,
+		 &sm8150_dspp_sblk),
+	DSPP_BLK("dspp_2", DSPP_2, 0x58000, DSPP_SC7180_MASK,
+		 &sm8150_dspp_sblk),
+	DSPP_BLK("dspp_3", DSPP_3, 0x5a000, DSPP_SC7180_MASK,
+		 &sm8150_dspp_sblk),
+};
 static const struct dpu_pingpong_cfg sm8550_pp[] = {
 	PP_BLK_DIPHER("pingpong_0", PINGPONG_0, 0x69000, MERGE_3D_0, sc7280_pp_sblk,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
@@ -156,10 +181,10 @@ static const struct dpu_mdss_cfg sm8550_dpu_cfg = {
 	.ctl = sm8550_ctl,
 	.sspp_count = ARRAY_SIZE(sm8550_sspp),
 	.sspp = sm8550_sspp,
-	.mixer_count = ARRAY_SIZE(sm8150_lm),
-	.mixer = sm8150_lm,
-	.dspp_count = ARRAY_SIZE(sm8150_dspp),
-	.dspp = sm8150_dspp,
+	.mixer_count = ARRAY_SIZE(sm8550_lm),
+	.mixer = sm8550_lm,
+	.dspp_count = ARRAY_SIZE(sm8550_dspp),
+	.dspp = sm8550_dspp,
 	.pingpong_count = ARRAY_SIZE(sm8550_pp),
 	.pingpong = sm8550_pp,
 	.merge_3d_count = ARRAY_SIZE(sm8550_merge_3d),
-- 
2.39.2

