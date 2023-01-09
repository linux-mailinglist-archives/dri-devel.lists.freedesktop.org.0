Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47BCF66217E
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 10:27:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6A4910E39B;
	Mon,  9 Jan 2023 09:26:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09A3E10E38E
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jan 2023 09:26:46 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 m8-20020a05600c3b0800b003d96f801c48so8504688wms.0
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jan 2023 01:26:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=pHmMcPdYYmcMWPQP/azdnNFzH9uNP2DFnN3T7RnQ/Iw=;
 b=G5iawmy6fGtxB9quEe31STYOQE2bYHS+rjnXGKbEi5tmWcM7tPWQRtIwAHggMJfbVu
 A+BbyRQz1ky6R2vHnVZGLBQY+vPBllsq/htvFG/rI5Wje8tRiOjjiY12XczE27Bpt2pN
 eAZiRZM//jCKgTvclyJfobEv4bHFJeUk5n0OU9cM09pzLR7nNWLC71XZ0IneTNytV6b+
 zywUPA8xBdHXgdsaJwGOmR9DzjYvUaxrP1mMv4hiRkmdfcsB8osXm6Bsuoliah/d0M1V
 Jvf/3HY4YOwolJ+E2qLStVZmyvbAL9wUzC3C3vQdtYKknSufnVqMLel0d5XVufcwgSux
 YKbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pHmMcPdYYmcMWPQP/azdnNFzH9uNP2DFnN3T7RnQ/Iw=;
 b=bL82OLoPrAlTMdJ41GUVsXm1qC/9uzi8LPp+jgr79a9ga5LZQOOxaxREOMjnNy3Zkq
 8IsoOyGEAJwVe9bKZxMYVKWKtIp/+xepAl63sEoBkN3AGmWpbAcLKrVIKw9djt/wT25t
 coSVtB+44u7HatkGdPDJ8brzUBippcXE9pE7Ur+wuBFyOT+zUKbL/4j/1An77a7MLBtp
 /nsPTw5kAYRRcNlQ8sxJJma5+bRR90AETG3o+eeaIFEaQS9Qnt1+8dWxX+UW3jY4Ogu0
 WIxvEewkuZv6UsdHxWSNkVbmD852NPVkqQ5HAMBs9VooqiCD5egs8kjr2JQSzEXyuKRR
 a97g==
X-Gm-Message-State: AFqh2kqkNZ5FHG/Jkaa64dtCbQANPvq4GqrJxHSGuL5ZhKnclOVC2rd5
 2f1nPv+qA9nUrjZC/UTNfNIVuA==
X-Google-Smtp-Source: AMrXdXsNqQZ+jjBbYNl4PY7GejGBPWlkoa0KDZsGrTQtYJoF9iAuQHogH+eEFKOFIzk9Xhg/f61tlQ==
X-Received: by 2002:a05:600c:540c:b0:3d9:922b:b148 with SMTP id
 he12-20020a05600c540c00b003d9922bb148mr34999928wmb.27.1673256404469; 
 Mon, 09 Jan 2023 01:26:44 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 s23-20020a1cf217000000b003d1e3b1624dsm15195758wmc.2.2023.01.09.01.26.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 01:26:44 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 09 Jan 2023 10:26:36 +0100
Subject: [PATCH v2 4/7] drm/msm/dpu: add support for SM8550
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230103-topic-sm8550-upstream-mdss-dsi-v2-4-87f1c16d7635@linaro.org>
References: <20230103-topic-sm8550-upstream-mdss-dsi-v2-0-87f1c16d7635@linaro.org>
In-Reply-To: <20230103-topic-sm8550-upstream-mdss-dsi-v2-0-87f1c16d7635@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonathan Marek <jonathan@marek.ca>
X-Mailer: b4 0.11.1
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add definitions for the display hardware used on Qualcomm SM8550
platform.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 197 +++++++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h    |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c        |   1 +
 4 files changed, 201 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 42e72ee7aa5e..4449e2f5739c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -472,6 +472,20 @@ static const struct dpu_caps sm8450_dpu_caps = {
 	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
 };
 
+static const struct dpu_caps sm8550_dpu_caps = {
+	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
+	.max_mixer_blendstages = 0xb,
+	.qseed_type = DPU_SSPP_SCALER_QSEED3LITE,
+	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2, /* TODO: v2.5 */
+	.ubwc_version = DPU_HW_UBWC_VER_40,
+	.has_src_split = true,
+	.has_dim_layer = true,
+	.has_idle_pc = true,
+	.has_3d_merge = true,
+	.max_linewidth = 5120,
+	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
+};
+
 static const struct dpu_mdp_cfg msm8998_mdp[] = {
 	{
 	.name = "top_0", .id = MDP_TOP,
@@ -699,6 +713,37 @@ static const struct dpu_mdp_cfg sm8450_mdp[] = {
 	},
 };
 
+static const struct dpu_mdp_cfg sm8550_mdp[] = {
+	{
+	.name = "top_0", .id = MDP_TOP,
+	.base = 0, .len = 0x494,
+	.features = BIT(DPU_MDP_PERIPH_0_REMOVED),
+	.highest_bank_bit = 0x3, /* TODO: 2 for LP_DDR4 */
+	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
+			.reg_off = 0x4330, .bit_off = 0},
+	.clk_ctrls[DPU_CLK_CTRL_VIG1] = {
+			.reg_off = 0x6330, .bit_off = 0},
+	.clk_ctrls[DPU_CLK_CTRL_VIG2] = {
+			.reg_off = 0x8330, .bit_off = 0},
+	.clk_ctrls[DPU_CLK_CTRL_VIG3] = {
+			.reg_off = 0xa330, .bit_off = 0},
+	.clk_ctrls[DPU_CLK_CTRL_DMA0] = {
+			.reg_off = 0x24330, .bit_off = 0},
+	.clk_ctrls[DPU_CLK_CTRL_DMA1] = {
+			.reg_off = 0x26330, .bit_off = 0},
+	.clk_ctrls[DPU_CLK_CTRL_DMA2] = {
+			.reg_off = 0x28330, .bit_off = 0},
+	.clk_ctrls[DPU_CLK_CTRL_DMA3] = {
+			.reg_off = 0x2a330, .bit_off = 0},
+	.clk_ctrls[DPU_CLK_CTRL_CURSOR0] = {
+			.reg_off = 0x2c330, .bit_off = 0},
+	.clk_ctrls[DPU_CLK_CTRL_CURSOR1] = {
+			.reg_off = 0x2e330, .bit_off = 0},
+	.clk_ctrls[DPU_CLK_CTRL_REG_DMA] = {
+			.reg_off = 0x2bc, .bit_off = 20},
+	},
+};
+
 static const struct dpu_mdp_cfg qcm2290_mdp[] = {
 	{
 	.name = "top_0", .id = MDP_TOP,
@@ -985,6 +1030,45 @@ static const struct dpu_ctl_cfg sm8450_ctl[] = {
 	},
 };
 
+static const struct dpu_ctl_cfg sm8550_ctl[] = {
+	{
+	.name = "ctl_0", .id = CTL_0,
+	.base = 0x15000, .len = 0x290,
+	.features = CTL_SC7280_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
+	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
+	},
+	{
+	.name = "ctl_1", .id = CTL_1,
+	.base = 0x16000, .len = 0x290,
+	.features = CTL_SC7280_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
+	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
+	},
+	{
+	.name = "ctl_2", .id = CTL_2,
+	.base = 0x17000, .len = 0x290,
+	.features = CTL_SC7280_MASK,
+	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
+	},
+	{
+	.name = "ctl_3", .id = CTL_3,
+	.base = 0x18000, .len = 0x290,
+	.features = CTL_SC7280_MASK,
+	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
+	},
+	{
+	.name = "ctl_4", .id = CTL_4,
+	.base = 0x19000, .len = 0x290,
+	.features = CTL_SC7280_MASK,
+	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
+	},
+	{
+	.name = "ctl_5", .id = CTL_5,
+	.base = 0x1a000, .len = 0x290,
+	.features = CTL_SC7280_MASK,
+	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
+	},
+};
+
 static const struct dpu_ctl_cfg qcm2290_ctl[] = {
 	{
 	.name = "ctl_0", .id = CTL_0,
@@ -1269,6 +1353,40 @@ static const struct dpu_sspp_cfg sm8450_sspp[] = {
 		sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR1),
 };
 
+static const struct dpu_sspp_sub_blks sm8550_vig_sblk_0 =
+				_VIG_SBLK("0", 7, DPU_SSPP_SCALER_QSEED3LITE);
+static const struct dpu_sspp_sub_blks sm8550_vig_sblk_1 =
+				_VIG_SBLK("1", 8, DPU_SSPP_SCALER_QSEED3LITE);
+static const struct dpu_sspp_sub_blks sm8550_vig_sblk_2 =
+				_VIG_SBLK("2", 9, DPU_SSPP_SCALER_QSEED3LITE);
+static const struct dpu_sspp_sub_blks sm8550_vig_sblk_3 =
+				_VIG_SBLK("3", 10, DPU_SSPP_SCALER_QSEED3LITE);
+static const struct dpu_sspp_sub_blks sm8550_dma_sblk_4 = _DMA_SBLK("12", 5);
+static const struct dpu_sspp_sub_blks sd8550_dma_sblk_5 = _DMA_SBLK("13", 6);
+
+static const struct dpu_sspp_cfg sm8550_sspp[] = {
+	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_SC7180_MASK,
+		sm8550_vig_sblk_0, 0,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
+	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, VIG_SC7180_MASK,
+		sm8550_vig_sblk_1, 4,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
+	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, VIG_SC7180_MASK,
+		sm8550_vig_sblk_2, 8, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG2),
+	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, VIG_SC7180_MASK,
+		sm8550_vig_sblk_3, 12,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
+	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000,  DMA_SDM845_MASK,
+		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
+	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000,  DMA_SDM845_MASK,
+		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
+	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000,  DMA_SDM845_MASK,
+		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
+	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000,  DMA_SDM845_MASK,
+		sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA3),
+	SSPP_BLK("sspp_12", SSPP_DMA4, 0x2c000,  DMA_CURSOR_SDM845_MASK,
+		sm8550_dma_sblk_4, 14, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR0),
+	SSPP_BLK("sspp_13", SSPP_DMA5, 0x2e000,  DMA_CURSOR_SDM845_MASK,
+		sd8550_dma_sblk_5, 15, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR1),
+};
+
 static const struct dpu_sspp_cfg qcm2290_sspp[] = {
 	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_QCM2290_MASK,
 		 qcm2290_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
@@ -1480,6 +1598,16 @@ static const struct dpu_pingpong_sub_blks sc7280_pp_sblk = {
 	.len = 0x20, .version = 0x20000},
 };
 
+#define PP_BLK_DIPHER(_name, _id, _base, _merge_3d, _sblk, _done, _rdptr) \
+	{\
+	.name = _name, .id = _id, \
+	.base = _base, .len = 0, \
+	.features = BIT(DPU_PINGPONG_DITHER), \
+	.merge_3d = _merge_3d, \
+	.sblk = &_sblk, \
+	.intr_done = _done, \
+	.intr_rdptr = _rdptr, \
+	}
 #define PP_BLK_TE(_name, _id, _base, _merge_3d, _sblk, _done, _rdptr) \
 	{\
 	.name = _name, .id = _id, \
@@ -1613,6 +1741,33 @@ static const struct dpu_pingpong_cfg sm8450_pp[] = {
 			-1),
 };
 
+static const struct dpu_pingpong_cfg sm8550_pp[] = {
+	PP_BLK_DIPHER("pingpong_0", PINGPONG_0, 0x69000, MERGE_3D_0, sc7280_pp_sblk,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
+			-1),
+	PP_BLK_DIPHER("pingpong_1", PINGPONG_1, 0x6a000, MERGE_3D_0, sc7280_pp_sblk,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
+			-1),
+	PP_BLK_DIPHER("pingpong_2", PINGPONG_2, 0x6b000, MERGE_3D_1, sc7280_pp_sblk,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
+			-1),
+	PP_BLK_DIPHER("pingpong_3", PINGPONG_3, 0x6c000, MERGE_3D_1, sc7280_pp_sblk,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
+			-1),
+	PP_BLK_DIPHER("pingpong_4", PINGPONG_4, 0x6d000, MERGE_3D_2, sc7280_pp_sblk,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30),
+			-1),
+	PP_BLK_DIPHER("pingpong_5", PINGPONG_5, 0x6e000, MERGE_3D_2, sc7280_pp_sblk,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
+			-1),
+	PP_BLK_DIPHER("pingpong_6", PINGPONG_6, 0x66000, MERGE_3D_3, sc7280_pp_sblk,
+			-1,
+			-1),
+	PP_BLK_DIPHER("pingpong_7", PINGPONG_7, 0x66400, MERGE_3D_3, sc7280_pp_sblk,
+			-1,
+			-1),
+};
+
 static struct dpu_pingpong_cfg qcm2290_pp[] = {
 	PP_BLK("pingpong_0", PINGPONG_0, 0x70000, 0, sdm845_pp_sblk,
 		DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
@@ -1649,6 +1804,13 @@ static const struct dpu_merge_3d_cfg sm8450_merge_3d[] = {
 	MERGE_3D_BLK("merge_3d_3", MERGE_3D_3, 0x65f00),
 };
 
+static const struct dpu_merge_3d_cfg sm8550_merge_3d[] = {
+	MERGE_3D_BLK("merge_3d_0", MERGE_3D_0, 0x4e000),
+	MERGE_3D_BLK("merge_3d_1", MERGE_3D_1, 0x4f000),
+	MERGE_3D_BLK("merge_3d_2", MERGE_3D_2, 0x50000),
+	MERGE_3D_BLK("merge_3d_3", MERGE_3D_3, 0x66700),
+};
+
 /*************************************************************
  * DSC sub blocks config
  *************************************************************/
@@ -1755,6 +1917,14 @@ static const struct dpu_intf_cfg sm8450_intf[] = {
 	INTF_BLK("intf_3", INTF_3, 0x37000, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
 };
 
+static const struct dpu_intf_cfg sm8550_intf[] = {
+	INTF_BLK("intf_0", INTF_0, 0x34000, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
+	/* TODO TE sub-blocks for intf1 & intf2 */
+	INTF_BLK("intf_1", INTF_1, 0x35000, INTF_DSI, 0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
+	INTF_BLK("intf_2", INTF_2, 0x36000, INTF_DSI, 1, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
+	INTF_BLK("intf_3", INTF_3, 0x37000, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
+};
+
 static const struct dpu_intf_cfg qcm2290_intf[] = {
 	INTF_BLK("intf_0", INTF_0, 0x00000, INTF_NONE, 0, 0, 0, 0, 0, 0),
 	INTF_BLK("intf_1", INTF_1, 0x6A800, INTF_DSI, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
@@ -2614,6 +2784,32 @@ static const struct dpu_mdss_cfg sm8450_dpu_cfg = {
 	.mdss_irqs = IRQ_SM8450_MASK,
 };
 
+static const struct dpu_mdss_cfg sm8550_dpu_cfg = {
+	.caps = &sm8550_dpu_caps,
+	.mdp_count = ARRAY_SIZE(sm8550_mdp),
+	.mdp = sm8550_mdp,
+	.ctl_count = ARRAY_SIZE(sm8550_ctl),
+	.ctl = sm8550_ctl,
+	.sspp_count = ARRAY_SIZE(sm8550_sspp),
+	.sspp = sm8550_sspp,
+	.mixer_count = ARRAY_SIZE(sm8150_lm),
+	.mixer = sm8150_lm,
+	.dspp_count = ARRAY_SIZE(sm8150_dspp),
+	.dspp = sm8150_dspp,
+	.pingpong_count = ARRAY_SIZE(sm8550_pp),
+	.pingpong = sm8550_pp,
+	.merge_3d_count = ARRAY_SIZE(sm8550_merge_3d),
+	.merge_3d = sm8550_merge_3d,
+	.intf_count = ARRAY_SIZE(sm8550_intf),
+	.intf = sm8550_intf,
+	.vbif_count = ARRAY_SIZE(sdm845_vbif),
+	.vbif = sdm845_vbif,
+	.reg_dma_count = 1,
+	.dma_cfg = &sm8450_regdma,
+	.perf = &sm8450_perf_data,
+	.mdss_irqs = IRQ_SM8450_MASK,
+};
+
 static const struct dpu_mdss_cfg qcm2290_dpu_cfg = {
 	.caps = &qcm2290_dpu_caps,
 	.mdp_count = ARRAY_SIZE(qcm2290_mdp),
@@ -2654,6 +2850,7 @@ static const struct dpu_mdss_hw_cfg_handler cfg_handler[] = {
 	{ .hw_rev = DPU_HW_VER_720, .dpu_cfg = &sc7280_dpu_cfg},
 	{ .hw_rev = DPU_HW_VER_800, .dpu_cfg = &sc8280xp_dpu_cfg},
 	{ .hw_rev = DPU_HW_VER_810, .dpu_cfg = &sm8450_dpu_cfg},
+	{ .hw_rev = DPU_HW_VER_900, .dpu_cfg = &sm8550_dpu_cfg},
 };
 
 const struct dpu_mdss_cfg *dpu_hw_catalog_init(u32 hw_rev)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index ebcdd8405cab..e9a90c8763ff 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -50,6 +50,7 @@
 #define DPU_HW_VER_720	DPU_HW_VER(7, 2, 0) /* sc7280 */
 #define DPU_HW_VER_800	DPU_HW_VER(8, 0, 0) /* sc8280xp */
 #define DPU_HW_VER_810	DPU_HW_VER(8, 1, 0) /* sm8450 */
+#define DPU_HW_VER_900	DPU_HW_VER(9, 0, 0) /* sm8550 */
 
 #define IS_MSM8996_TARGET(rev) IS_DPU_MAJOR_MINOR_SAME((rev), DPU_HW_VER_170)
 #define IS_MSM8998_TARGET(rev) IS_DPU_MAJOR_MINOR_SAME((rev), DPU_HW_VER_300)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
index 2b9e15f99c65..2d9192a6ce00 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
@@ -120,6 +120,8 @@ enum dpu_sspp {
 	SSPP_DMA1,
 	SSPP_DMA2,
 	SSPP_DMA3,
+	SSPP_DMA4,
+	SSPP_DMA5,
 	SSPP_CURSOR0,
 	SSPP_CURSOR1,
 	SSPP_MAX
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 84a46319421a..6759c6d88083 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1313,6 +1313,7 @@ static const struct of_device_id dpu_dt_match[] = {
 	{ .compatible = "qcom,sm8250-dpu", },
 	{ .compatible = "qcom,sm8350-dpu", },
 	{ .compatible = "qcom,sm8450-dpu", },
+	{ .compatible = "qcom,sm8550-dpu", },
 	{}
 };
 MODULE_DEVICE_TABLE(of, dpu_dt_match);

-- 
2.34.1
