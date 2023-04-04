Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0369C6D621B
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 15:09:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F7BA10E69E;
	Tue,  4 Apr 2023 13:09:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3267510E694
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 13:09:05 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id e9so18487866ljq.4
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Apr 2023 06:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680613743;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bC0Ogk0QSJ7SPJK+VvMtHp+AxXag9QK2I+CW+aDRMK4=;
 b=YgWArYXTYf0VEfiVsD+Ru1/ViNt6rOBR7mfOWgtaX7HJtkxHRAgk+8OQ/ppTQlj6T2
 qhFY8xeYwwY87UuIkfX8u+G93du8CWOIQN1aR3z/KKLgJYFgBKUf1JhDY1uscQ1QL1gM
 aHWTbG0RSUc3ezHtzYaKtBh5H4HTn8SUXVzBbyMvJu6bB+pgvjAcQ3DIgbqFBl53hSGk
 NbzuaYoWndQDkWIsf5xhDrt0Tz+Mev7qNU29LXCgubeEXuqkDdd/Roo/TrRds0fR1q9a
 vq5YjsJ5DWaVY7TOZNaYaTH2RtWclhoOzJSt4QK3ltd1LIetoTKWXyWVrb7qFxYnQVuL
 ge7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680613743;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bC0Ogk0QSJ7SPJK+VvMtHp+AxXag9QK2I+CW+aDRMK4=;
 b=1bllKE4qPAfU7afi7TPRgZZh8bHUL2DC82M8bHXS0VSNBMkzBPACVB0G8s/N0G/i1X
 8ZIGpA/QZKngiHgdzszJAwBvt9SKgxN8wcNRA/0Gg5vE7AjBQB2Vc/9QBvo3JIJK4G69
 XMiu7YFoHr5mqdoMXQzC+gKSf2iogUXmE7tdjvm1xSSLS3NGeQcVtLzWz8RWdHRLdPMv
 5+kw5+veO1u9CqQfTc6yGQKHbhu1TKv1fRDban54wMMgHu74EJ8GVG6QVItOAgUkVXRZ
 TG0KV6qEclYS7AvKQIFbvJU6o3SkpSX/s+LEFsAgCzdMgUNhrcvgp0mdZ4ZnN4dDokzX
 y2AQ==
X-Gm-Message-State: AAQBX9cQ8A22U5oPbyxfehw9PmPEPi3uilmTUKp+5j6SKl0Z1yKuFVY9
 U7WFhQC0NokyXoyw6AmxS9M6gQ==
X-Google-Smtp-Source: AKy350bQeG2L+z1SjpK1i0Vn7rt69n3ubaJ2ZU5HLRgaL5LWovzWM0fB1ZKYthmVIWSLH38sF0eZ8A==
X-Received: by 2002:a05:651c:86:b0:2a6:1975:4071 with SMTP id
 6-20020a05651c008600b002a619754071mr838251ljq.26.1680613743311; 
 Tue, 04 Apr 2023 06:09:03 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([193.65.47.217])
 by smtp.gmail.com with ESMTPSA id
 c11-20020a05651c014b00b0029e5448e752sm2304789ljd.131.2023.04.04.06.09.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 06:09:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v4 20/42] drm/msm/dpu: duplicate sdm845 catalog entries
Date: Tue,  4 Apr 2023 16:06:00 +0300
Message-Id: <20230404130622.509628-21-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230404130622.509628-1-dmitry.baryshkov@linaro.org>
References: <20230404130622.509628-1-dmitry.baryshkov@linaro.org>
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

Duplicate some of sdm845 catalog entries to remove dependencies between
DPU major generations.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../msm/disp/dpu1/catalog/dpu_3_0_msm8998.h   | 19 +++++++-
 .../msm/disp/dpu1/catalog/dpu_5_0_sm8150.h    | 43 +++++++++++++++++--
 .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   |  4 +-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |  4 +-
 4 files changed, 60 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
index 6c988b3a7325..8e6650aaa8a2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
@@ -111,6 +111,21 @@ static const struct dpu_lm_cfg msm8998_lm[] = {
 		&msm8998_lm_sblk, PINGPONG_3, LM_1, 0),
 };
 
+static const struct dpu_pingpong_cfg msm8998_pp[] = {
+	PP_BLK_TE("pingpong_0", PINGPONG_0, 0x70000, 0, sdm845_pp_sblk_te,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12)),
+	PP_BLK_TE("pingpong_1", PINGPONG_1, 0x70800, 0, sdm845_pp_sblk_te,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13)),
+	PP_BLK("pingpong_2", PINGPONG_2, 0x71000, 0, sdm845_pp_sblk,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 14)),
+	PP_BLK("pingpong_3", PINGPONG_3, 0x71800, 0, sdm845_pp_sblk,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 15)),
+};
+
 static const struct dpu_dspp_cfg msm8998_dspp[] = {
 	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_MSM8998_MASK,
 		 &msm8998_dspp_sblk),
@@ -174,8 +189,8 @@ static const struct dpu_mdss_cfg msm8998_dpu_cfg = {
 	.mixer = msm8998_lm,
 	.dspp_count = ARRAY_SIZE(msm8998_dspp),
 	.dspp = msm8998_dspp,
-	.pingpong_count = ARRAY_SIZE(sdm845_pp),
-	.pingpong = sdm845_pp,
+	.pingpong_count = ARRAY_SIZE(msm8998_pp),
+	.pingpong = msm8998_pp,
 	.intf_count = ARRAY_SIZE(msm8998_intf),
 	.intf = msm8998_intf,
 	.vbif_count = ARRAY_SIZE(msm8998_vbif),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
index 6f46baad920f..6db0f64142d5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
@@ -26,6 +26,22 @@ static const struct dpu_ubwc_cfg sm8150_ubwc_cfg = {
 	.highest_bank_bit = 0x2,
 };
 
+static const struct dpu_mdp_cfg sm8150_mdp[] = {
+	{
+	.name = "top_0", .id = MDP_TOP,
+	.base = 0x0, .len = 0x45c,
+	.features = BIT(DPU_MDP_AUDIO_SELECT),
+	.clk_ctrls[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
+	.clk_ctrls[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
+	.clk_ctrls[DPU_CLK_CTRL_VIG2] = { .reg_off = 0x2bc, .bit_off = 0 },
+	.clk_ctrls[DPU_CLK_CTRL_VIG3] = { .reg_off = 0x2c4, .bit_off = 0 },
+	.clk_ctrls[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8 },
+	.clk_ctrls[DPU_CLK_CTRL_DMA1] = { .reg_off = 0x2b4, .bit_off = 8 },
+	.clk_ctrls[DPU_CLK_CTRL_DMA2] = { .reg_off = 0x2bc, .bit_off = 8 },
+	.clk_ctrls[DPU_CLK_CTRL_DMA3] = { .reg_off = 0x2c4, .bit_off = 8 },
+	},
+};
+
 static const struct dpu_ctl_cfg sm8150_ctl[] = {
 	{
 	.name = "ctl_0", .id = CTL_0,
@@ -65,6 +81,25 @@ static const struct dpu_ctl_cfg sm8150_ctl[] = {
 	},
 };
 
+static const struct dpu_sspp_cfg sm8150_sspp[] = {
+	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x1f0, VIG_SDM845_MASK,
+		sdm845_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
+	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, 0x1f0, VIG_SDM845_MASK,
+		sdm845_vig_sblk_1, 4, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
+	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, 0x1f0, VIG_SDM845_MASK,
+		sdm845_vig_sblk_2, 8, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG2),
+	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, 0x1f0, VIG_SDM845_MASK,
+		sdm845_vig_sblk_3, 12, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
+	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x1f0, DMA_SDM845_MASK,
+		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
+	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, 0x1f0, DMA_SDM845_MASK,
+		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
+	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, 0x1f0, DMA_CURSOR_SDM845_MASK,
+		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
+	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000, 0x1f0, DMA_CURSOR_SDM845_MASK,
+		sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA3),
+};
+
 static const struct dpu_lm_cfg sm8150_lm[] = {
 	LM_BLK("lm_0", LM_0, 0x44000, MIXER_SDM845_MASK,
 		&sdm845_lm_sblk, PINGPONG_0, LM_1, DSPP_0),
@@ -164,12 +199,12 @@ static const struct dpu_perf_cfg sm8150_perf_data = {
 static const struct dpu_mdss_cfg sm8150_dpu_cfg = {
 	.caps = &sm8150_dpu_caps,
 	.ubwc = &sm8150_ubwc_cfg,
-	.mdp_count = ARRAY_SIZE(sdm845_mdp),
-	.mdp = sdm845_mdp,
+	.mdp_count = ARRAY_SIZE(sm8150_mdp),
+	.mdp = sm8150_mdp,
 	.ctl_count = ARRAY_SIZE(sm8150_ctl),
 	.ctl = sm8150_ctl,
-	.sspp_count = ARRAY_SIZE(sdm845_sspp),
-	.sspp = sdm845_sspp,
+	.sspp_count = ARRAY_SIZE(sm8150_sspp),
+	.sspp = sm8150_sspp,
 	.mixer_count = ARRAY_SIZE(sm8150_lm),
 	.mixer = sm8150_lm,
 	.dspp_count = ARRAY_SIZE(sm8150_dspp),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
index cd505605be1f..5a426b881e20 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
@@ -86,8 +86,8 @@ static const struct dpu_mdss_cfg sc8180x_dpu_cfg = {
 	.mdp = sc8180x_mdp,
 	.ctl_count = ARRAY_SIZE(sm8150_ctl),
 	.ctl = sm8150_ctl,
-	.sspp_count = ARRAY_SIZE(sdm845_sspp),
-	.sspp = sdm845_sspp,
+	.sspp_count = ARRAY_SIZE(sm8150_sspp),
+	.sspp = sm8150_sspp,
 	.mixer_count = ARRAY_SIZE(sm8150_lm),
 	.mixer = sm8150_lm,
 	.pingpong_count = ARRAY_SIZE(sm8150_pp),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 9ee87c24a504..105fa05454e1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -875,10 +875,10 @@ static const struct dpu_qos_lut_entry sc7180_qos_nrt[] = {
  * Hardware catalog
  *************************************************************/
 
-#include "catalog/dpu_4_0_sdm845.h"
-
 #include "catalog/dpu_3_0_msm8998.h"
 
+#include "catalog/dpu_4_0_sdm845.h"
+
 #include "catalog/dpu_5_0_sm8150.h"
 #include "catalog/dpu_5_1_sc8180x.h"
 
-- 
2.39.2

