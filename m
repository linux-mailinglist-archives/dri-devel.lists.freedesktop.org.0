Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F32D6314DE
	for <lists+dri-devel@lfdr.de>; Sun, 20 Nov 2022 16:26:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68B4910E112;
	Sun, 20 Nov 2022 15:26:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A13E10E10E;
 Sun, 20 Nov 2022 13:41:39 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id a29so15209398lfj.9;
 Sun, 20 Nov 2022 05:41:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7NV4kQ8eKvRD4PAVvmUHP86c4szhs9EY9GpSQ3ky8pQ=;
 b=iVKq4T7M7XVVB17LHpy1J57rdy0o1B5JfcYvwVr2DktOWHDnV2eDy3zQbMWfhQtUN0
 85evydbHAe340AfNNTDPa5nNWq/o2Z7m7c7hXfDnw1WOY4vwTYACXHgXuKr575/KsTZo
 ZKPgg5jM+E5COxDBhp7/dAM/wsMwwRf0J2im76ropnrZhj3/wdR3LCUiAqocpFMVDJTb
 A9Twl+NfvJmOS2qouuCQWIp3PcHRKGmdZfWIlNgrpoecQHmxZxbsDCs9nWTjKSbuMjVV
 R7XjjtJXnBxkPMTn1w6TVljHrbfSiWPcotQFAEFzK/dNuhSon/NYKb60ELueCIHSG+6w
 AoQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7NV4kQ8eKvRD4PAVvmUHP86c4szhs9EY9GpSQ3ky8pQ=;
 b=VP2k/2XOCa1p+u7kcv8HqonTJQP6B+GtSeDUR4I+MJHvLU7xrm8Uk+4+64gKdqUBQ4
 GwpsE18G3KA/cPAgP6t6lN7qRLJhOhcIues4chaoKrEXlA3GcE4M3rU1Ml9azZYIEAUy
 VB3KHShpkKHO0eJZISh8icfFJydbEG224W/uQYzBfWVNv4OCUO1Hf/jG3wkPhgVRdBwc
 io0qQoM2qyQIeHgwsP+9/T169hKCTbI3+Bya6bTBW6zOycx7bhf37WLuX2M0+iBxMET2
 1SZJ+Enhtrj7ImtAi6p3BJDRovRjqvVHjr6uTvWZkVWRiBO4UQrQd7+7dPzmPDsp2AoK
 8M2g==
X-Gm-Message-State: ANoB5pnyKjnC4G1RS3u1n2RdITawBZ2TNHorLVOL3NzipzadmAn8iZfE
 sUI89/+SoSKQ1xRoPoeWd40=
X-Google-Smtp-Source: AA0mqf5iTGoo0khCWPyJNg4hwhMKo7YT5jvrDlpcLTIVeM53nFXaFyvqtbJYlQDSIS7c9rGnzhNwCA==
X-Received: by 2002:ac2:5486:0:b0:4a2:34d5:9929 with SMTP id
 t6-20020ac25486000000b004a234d59929mr5267185lfk.31.1668951697570; 
 Sun, 20 Nov 2022 05:41:37 -0800 (PST)
Received: from localhost.localdomain (cds73.neoplus.adsl.tpnet.pl.
 [83.30.168.73]) by smtp.gmail.com with ESMTPSA id
 m3-20020a056512114300b004afac783b5esm1536287lfg.238.2022.11.20.05.41.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Nov 2022 05:41:37 -0800 (PST)
From: Adam Skladowski <a39.skl@gmail.com>
To: 
Subject: [PATCH 2/2] drm/msm/disp/dpu1: add support for display on SM6115
Date: Sun, 20 Nov 2022 14:37:37 +0100
Message-Id: <20221120133744.24808-3-a39.skl@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221120133744.24808-1-a39.skl@gmail.com>
References: <20221120133744.24808-1-a39.skl@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 20 Nov 2022 15:26:22 +0000
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
Cc: Jason Wang <wangborong@cdjrlc.com>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 phone-devel@vger.kernel.org, Sean Paul <sean@poorly.run>,
 Vinod Polimera <quic_vpolimer@quicinc.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Adam Skladowski <a39.skl@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Stephen Boyd <swboyd@chromium.org>,
 Rob Herring <robh+dt@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht,
 Adam Skladowski <a_skl39@protonmail.com>,
 Kalyan Thota <quic_kalyant@quicinc.com>,
 Loic Poulain <loic.poulain@linaro.org>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>, Vinod Koul <vkoul@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add required display hw catalog changes for SM6115.

Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
---
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 87 +++++++++++++++++++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  1 +
 drivers/gpu/drm/msm/msm_mdss.c                |  5 ++
 4 files changed, 94 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 1ce237e18506..4fed544c1356 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -321,6 +321,18 @@ static const struct dpu_caps sc7180_dpu_caps = {
 	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
 };
 
+static const struct dpu_caps sm6115_dpu_caps = {
+	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
+	.max_mixer_blendstages = 0x4,
+	.qseed_type = DPU_SSPP_SCALER_QSEED3LITE,
+	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2, /* TODO: v2.5 */
+	.ubwc_version = DPU_HW_UBWC_VER_20,
+	.has_dim_layer = true,
+	.has_idle_pc = true,
+	.max_linewidth = 2160,
+	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
+};
+
 static const struct dpu_caps sm8150_dpu_caps = {
 	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0xb,
@@ -475,6 +487,19 @@ static const struct dpu_mdp_cfg sc8180x_mdp[] = {
 	},
 };
 
+static const struct dpu_mdp_cfg sm6115_mdp[] = {
+	{
+	.name = "top_0", .id = MDP_TOP,
+	.base = 0x0, .len = 0x494,
+	.features = 0,
+	.highest_bank_bit = 0x1,
+	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
+		.reg_off = 0x2AC, .bit_off = 0},
+	.clk_ctrls[DPU_CLK_CTRL_DMA0] = {
+		.reg_off = 0x2AC, .bit_off = 8},
+	},
+};
+
 static const struct dpu_mdp_cfg sm8250_mdp[] = {
 	{
 	.name = "top_0", .id = MDP_TOP,
@@ -852,6 +877,16 @@ static const struct dpu_sspp_cfg sc7180_sspp[] = {
 		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR1),
 };
 
+static const struct dpu_sspp_sub_blks sm6115_vig_sblk_0 =
+				_VIG_SBLK("0", 2, DPU_SSPP_SCALER_QSEED3LITE);
+
+static const struct dpu_sspp_cfg sm6115_sspp[] = {
+	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_SM8250_MASK,
+		sm6115_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
+	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000,  DMA_SDM845_MASK,
+		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
+};
+
 static const struct dpu_sspp_sub_blks sm8250_vig_sblk_0 =
 				_VIG_SBLK("0", 5, DPU_SSPP_SCALER_QSEED3LITE);
 static const struct dpu_sspp_sub_blks sm8250_vig_sblk_1 =
@@ -1590,6 +1625,35 @@ static const struct dpu_perf_cfg sc7180_perf_data = {
 	.bw_inefficiency_factor = 120,
 };
 
+static const struct dpu_perf_cfg sm6115_perf_data = {
+	.max_bw_low = 3100000,
+	.max_bw_high = 4000000,
+	.min_core_ib = 2400000,
+	.min_llcc_ib = 800000,
+	.min_dram_ib = 800000,
+	.min_prefill_lines = 24,
+	.danger_lut_tbl = {0xff, 0xffff, 0x0},
+	.safe_lut_tbl = {0xfff0, 0xff00, 0xffff},
+	.qos_lut_tbl = {
+		{.nentry = ARRAY_SIZE(sc7180_qos_linear),
+		.entries = sc7180_qos_linear
+		},
+		{.nentry = ARRAY_SIZE(sc7180_qos_macrotile),
+		.entries = sc7180_qos_macrotile
+		},
+		{.nentry = ARRAY_SIZE(sc7180_qos_nrt),
+		.entries = sc7180_qos_nrt
+		},
+		/* TODO: macrotile-qseed is different from macrotile */
+	},
+	.cdp_cfg = {
+		{.rd_enable = 1, .wr_enable = 1},
+		{.rd_enable = 1, .wr_enable = 0}
+	},
+	.clk_inefficiency_factor = 105,
+	.bw_inefficiency_factor = 120,
+};
+
 static const struct dpu_perf_cfg sm8150_perf_data = {
 	.max_bw_low = 12800000,
 	.max_bw_high = 12800000,
@@ -1801,6 +1865,28 @@ static const struct dpu_mdss_cfg sc7180_dpu_cfg = {
 	.mdss_irqs = IRQ_SC7180_MASK,
 };
 
+static const struct dpu_mdss_cfg sm6115_dpu_cfg = {
+	.caps = &sm6115_dpu_caps,
+	.mdp_count = ARRAY_SIZE(sm6115_mdp),
+	.mdp = sm6115_mdp,
+	.ctl_count = ARRAY_SIZE(qcm2290_ctl),
+	.ctl = qcm2290_ctl,
+	.sspp_count = ARRAY_SIZE(sm6115_sspp),
+	.sspp = sm6115_sspp,
+	.mixer_count = ARRAY_SIZE(qcm2290_lm),
+	.mixer = qcm2290_lm,
+	.dspp_count = ARRAY_SIZE(qcm2290_dspp),
+	.dspp = qcm2290_dspp,
+	.pingpong_count = ARRAY_SIZE(qcm2290_pp),
+	.pingpong = qcm2290_pp,
+	.intf_count = ARRAY_SIZE(qcm2290_intf),
+	.intf = qcm2290_intf,
+	.vbif_count = ARRAY_SIZE(sdm845_vbif),
+	.vbif = sdm845_vbif,
+	.perf = &sm6115_perf_data,
+	.mdss_irqs = IRQ_SC7180_MASK,
+};
+
 static const struct dpu_mdss_cfg sm8150_dpu_cfg = {
 	.caps = &sm8150_dpu_caps,
 	.mdp_count = ARRAY_SIZE(sdm845_mdp),
@@ -1935,6 +2021,7 @@ static const struct dpu_mdss_hw_cfg_handler cfg_handler[] = {
 	{ .hw_rev = DPU_HW_VER_510, .dpu_cfg = &sc8180x_dpu_cfg},
 	{ .hw_rev = DPU_HW_VER_600, .dpu_cfg = &sm8250_dpu_cfg},
 	{ .hw_rev = DPU_HW_VER_620, .dpu_cfg = &sc7180_dpu_cfg},
+	{ .hw_rev = DPU_HW_VER_630, .dpu_cfg = &sm6115_dpu_cfg},
 	{ .hw_rev = DPU_HW_VER_650, .dpu_cfg = &qcm2290_dpu_cfg},
 	{ .hw_rev = DPU_HW_VER_720, .dpu_cfg = &sc7280_dpu_cfg},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 38aa38ab1568..3b645d5aa9aa 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -44,6 +44,7 @@
 #define DPU_HW_VER_510	DPU_HW_VER(5, 1, 1) /* sc8180 */
 #define DPU_HW_VER_600	DPU_HW_VER(6, 0, 0) /* sm8250 */
 #define DPU_HW_VER_620	DPU_HW_VER(6, 2, 0) /* sc7180 v1.0 */
+#define DPU_HW_VER_630	DPU_HW_VER(6, 3, 0) /* sm6115|sm4250 */
 #define DPU_HW_VER_650	DPU_HW_VER(6, 5, 0) /* qcm2290|sm4125 */
 #define DPU_HW_VER_720	DPU_HW_VER(7, 2, 0) /* sc7280 */
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index f3660cd14f4f..b71199511a52 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1292,6 +1292,7 @@ static const struct of_device_id dpu_dt_match[] = {
 	{ .compatible = "qcom,sc7180-dpu", },
 	{ .compatible = "qcom,sc7280-dpu", },
 	{ .compatible = "qcom,sc8180x-dpu", },
+	{ .compatible = "qcom,sm6115-dpu", },
 	{ .compatible = "qcom,sm8150-dpu", },
 	{ .compatible = "qcom,sm8250-dpu", },
 	{}
diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 6a4549ef34d4..86b28add1fff 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -280,6 +280,10 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
 		/* UBWC_2_0 */
 		msm_mdss_setup_ubwc_dec_20(msm_mdss, 0x1e);
 		break;
+	case DPU_HW_VER_630:
+		/* UBWC_2_0 */
+		msm_mdss_setup_ubwc_dec_20(msm_mdss, 0x11f);
+		break;
 	case DPU_HW_VER_720:
 		msm_mdss_setup_ubwc_dec_40(msm_mdss, UBWC_3_0, 6, 1, 1, 1);
 		break;
@@ -509,6 +513,7 @@ static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,sc7180-mdss" },
 	{ .compatible = "qcom,sc7280-mdss" },
 	{ .compatible = "qcom,sc8180x-mdss" },
+	{ .compatible = "qcom,sm6115-mdss" },
 	{ .compatible = "qcom,sm8150-mdss" },
 	{ .compatible = "qcom,sm8250-mdss" },
 	{}
-- 
2.25.1

