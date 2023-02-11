Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E22692CFC
	for <lists+dri-devel@lfdr.de>; Sat, 11 Feb 2023 03:11:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D33310EBA4;
	Sat, 11 Feb 2023 02:11:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C14C10ECB2
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Feb 2023 02:11:13 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id p26so20141266ejx.13
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Feb 2023 18:11:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ObnxcZXpi6jd8b8MOTzfi7Drsv4bHEzQNvC4gNpgCTo=;
 b=E+5EH5DMno+d7ofcQdD2NoYSzPpOhoUiImp6uHdB3gIxfijIuNhrsj9NLVul16Josp
 4qmSQ5KUTVJiCMHwzcm8P07pDvelhanbstN4oEdu9QW3DMAd89ivUFzUZvfgN1Jbpgxu
 RxT2m9AnkPu9qtzBlOepYL/a05EQcQNE2CkGed3gMrMFEQ0nKDStjytszw8vfOTXBz+A
 Sm8qKd9/TBV/jOOFg45O38TGKz2Ntbzrn1DAiAJbsI5R6Mp5aKxfDjXbZFKAtCyelOvR
 hCUu6CPY5LjLHjThcYW4Bmjq6sMqfkuXJoFLFtVu7/gisVpxSzs12unobJboQoq5DAvZ
 3OAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ObnxcZXpi6jd8b8MOTzfi7Drsv4bHEzQNvC4gNpgCTo=;
 b=0uCi7Grt4MVAqZc5y+bbJkG1X0pOS2QRHqMRXCkRgi99XEsiq+ySrKD+6EPZlTHffD
 hdAd4q3YYshnosFXNy9sssAJSsZC+4gmPU1YfvOsvP6fINawsOl8jEGBY5Z8awpFQkiJ
 lXxMB7VqOs5i57F6mID8CMEZIXlHuQZHReiFw+rHkBKnv/wb4jKtAPzw+NTWy/tesAni
 i1fbrfwiIlTmJZCaqfsj60ImASXP6ddbdh+8yBdyME2QiF2MAuEcGOtA4Lh7z0/lk4o5
 k74b4d7jptck5buTAU7Q64X1V6W4tlKmcjyZMcgC+WcfobUCQu4TV8l63bu6XgYzuFKY
 JI1w==
X-Gm-Message-State: AO0yUKXYDmtzK6UeqGsD8qxTTKMPhK1+PrgObGDm4Xr8eB6DTCdpsWMk
 2ZyQxNEJqNAQXj6glqF699i50w==
X-Google-Smtp-Source: AK7set+k4A910bZyrI7m4OoLJTbKKcoAgVJUKaQawXnSXoi1B5oLZQfNhMnItwLC1n2ghvZZn3KK9w==
X-Received: by 2002:a17:907:94cf:b0:8af:40b0:3dd1 with SMTP id
 dn15-20020a17090794cf00b008af40b03dd1mr8647281ejc.27.1676081472819; 
 Fri, 10 Feb 2023 18:11:12 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 e20-20020a170906c01400b008ae3324c8adsm3180831ejz.214.2023.02.10.18.11.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Feb 2023 18:11:12 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH 17/43] drm/msm/dpu: duplicate sdm845 catalog entries
Date: Sat, 11 Feb 2023 04:10:27 +0200
Message-Id: <20230211021053.1078648-18-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230211021053.1078648-1-dmitry.baryshkov@linaro.org>
References: <20230211021053.1078648-1-dmitry.baryshkov@linaro.org>
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

Duplicate some of sdm845 catalog entries to remove dependencies between
DPU major generations.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../msm/disp/dpu1/catalog/dpu_3_0_msm8998.h   | 19 +++++++-
 .../msm/disp/dpu1/catalog/dpu_5_0_sm8150.h    | 43 +++++++++++++++++--
 .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   |  4 +-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |  4 +-
 4 files changed, 60 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
index 5971e6360650..b1000b00406e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
@@ -112,6 +112,21 @@ static const struct dpu_lm_cfg msm8998_lm[] = {
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
@@ -175,8 +190,8 @@ static const struct dpu_mdss_cfg msm8998_dpu_cfg = {
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
index f40d112a1156..527c9fe78a46 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
@@ -27,6 +27,22 @@ static const struct dpu_ubwc_cfg sm8150_ubwc_cfg = {
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
@@ -66,6 +82,25 @@ static const struct dpu_ctl_cfg sm8150_ctl[] = {
 	},
 };
 
+static const struct dpu_sspp_cfg sm8150_sspp[] = {
+	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_SDM845_MASK,
+		sdm845_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
+	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, VIG_SDM845_MASK,
+		sdm845_vig_sblk_1, 4, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
+	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, VIG_SDM845_MASK,
+		sdm845_vig_sblk_2, 8, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG2),
+	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, VIG_SDM845_MASK,
+		sdm845_vig_sblk_3, 12, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
+	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, DMA_SDM845_MASK,
+		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
+	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, DMA_SDM845_MASK,
+		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
+	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, DMA_CURSOR_SDM845_MASK,
+		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
+	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000, DMA_CURSOR_SDM845_MASK,
+		sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA3),
+};
+
 static const struct dpu_lm_cfg sm8150_lm[] = {
 	LM_BLK("lm_0", LM_0, 0x44000, MIXER_SDM845_MASK,
 		&sdm845_lm_sblk, PINGPONG_0, LM_1, DSPP_0),
@@ -165,12 +200,12 @@ static const struct dpu_perf_cfg sm8150_perf_data = {
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
index 423a47f02a00..1787dfd1e28e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
@@ -87,8 +87,8 @@ static const struct dpu_mdss_cfg sc8180x_dpu_cfg = {
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
index c4d735472b09..b979d06f8180 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -857,10 +857,10 @@ static const struct dpu_qos_lut_entry sc7180_qos_nrt[] = {
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
2.39.1

