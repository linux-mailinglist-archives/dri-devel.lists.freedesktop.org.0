Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D42955AF313
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 19:49:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BDE610E71C;
	Tue,  6 Sep 2022 17:48:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com
 [IPv6:2001:4860:4864:20::36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA4A810E0D7
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Sep 2022 17:48:33 +0000 (UTC)
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-1279948d93dso10206695fac.10
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Sep 2022 10:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=R2HeVHuDsF67GpxPuNMtWwEhUvk1Fm0SWkp+Zl+WlE0=;
 b=DLoTsgXX6bchjRYIXFuO1+K6GppSi+Ml+U7ir5gqyarDzSqHd4iv7rclmwpRHtJmn0
 rKYHodXgMf1P2fe6PKvespXY4Szmjo6Hh7PdsMIxqS/WSZb/6R5vek91Sz/+o7Y+N3se
 8NLGLR34yAEApze73z8zkdwOsSp9seUut7K0fzQrzxq1Dm7gWQzwAlKwG9wlS+Is/6ds
 IbcLj8S2Tce+KHVi7+M5vBKHXDf1UnjK2sP4jO5Jk7SOSxYfkMyC1L32wqXH8S9p4LM4
 Zx5fMryNqI6d7KJVEVCY/Cos8fLyOme+LfyAp341gZvFbR55fJ7qrr+SFXfe/GbQ4jNa
 xRDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=R2HeVHuDsF67GpxPuNMtWwEhUvk1Fm0SWkp+Zl+WlE0=;
 b=cTD4RglQ1BjycO8r4w1mBIjgBW2mm0X0sz9DhfmR6F1os1SKk9RJKCEzaY4egrGAM8
 2WNWgiUwDNk3ArH/SA0jO+KFnfN2kXOH7ps2Nq/CxRHRxRZJgaymBgcEZ6JshmUKnT6+
 JH+sfNye1GYEGYwpjvFkHPrIinoRzkGdv9eRbusKSPSxmbc6blgnEGIg0aTo9FSGrTLy
 JdzNx3zr9eysq/gmAsvSiIKRNLLhyxty9KJUEslBFLOTN0Uq68rtmKB70pzwYrwpwRoI
 7Vr143ui6NcrzZkWDh3kPGgiqjrrOmRI0gwPGduS8/LVdaLiQeHraoNL8OqOfNeFYHZv
 n00g==
X-Gm-Message-State: ACgBeo1SBHORSztJmaMzo8DdK1DTgib4ffRCzIr13kPgHgtGkCgtlVXW
 22bssD6TySOBmm2O7nfxdb4=
X-Google-Smtp-Source: AA6agR48nntk37hZ6zthEH6xuKLerJ0Ks3TEBKTC/mHBqvZ1lhN9eMINIU0puzBZGi3+wSyKEO3pmA==
X-Received: by 2002:a05:6870:c349:b0:11d:dc76:b336 with SMTP id
 e9-20020a056870c34900b0011ddc76b336mr12092090oak.42.1662486512839; 
 Tue, 06 Sep 2022 10:48:32 -0700 (PDT)
Received: from wintermute.localdomain (cpe-76-183-134-35.tx.res.rr.com.
 [76.183.134.35]) by smtp.gmail.com with ESMTPSA id
 o186-20020aca41c3000000b00344afa2b08bsm5568065oia.26.2022.09.06.10.48.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 10:48:32 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Subject: [PATCH v2 4/5] phy/rockchip: inno-dsidphy: Add support for rk3568
Date: Tue,  6 Sep 2022 12:48:22 -0500
Message-Id: <20220906174823.28561-5-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220906174823.28561-1-macroalpha82@gmail.com>
References: <20220906174823.28561-1-macroalpha82@gmail.com>
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
Cc: devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 airlied@linux.ie, s.hauer@pengutronix.de,
 Chris Morgan <macromorgan@hotmail.com>, hjc@rock-chips.com,
 dri-devel@lists.freedesktop.org, kishon@ti.com, vkoul@kernel.org,
 robh+dt@kernel.org, pgwipeout@gmail.com, linux-phy@lists.infradead.org,
 cl@rock-chips.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

Add support for the Rockchip RK3568 DSI-DPHY. Registers were taken from
the BSP kernel driver and wherever possible cross referenced with the
TRM.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../phy/rockchip/phy-rockchip-inno-dsidphy.c  | 204 ++++++++++++++----
 1 file changed, 158 insertions(+), 46 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-inno-dsidphy.c b/drivers/phy/rockchip/phy-rockchip-inno-dsidphy.c
index 630e01b5c19b..2c5847faff63 100644
--- a/drivers/phy/rockchip/phy-rockchip-inno-dsidphy.c
+++ b/drivers/phy/rockchip/phy-rockchip-inno-dsidphy.c
@@ -84,9 +84,25 @@
 #define DATA_LANE_0_SKEW_PHASE_MASK		GENMASK(2, 0)
 #define DATA_LANE_0_SKEW_PHASE(x)		UPDATE(x, 2, 0)
 /* Analog Register Part: reg08 */
+#define PLL_POST_DIV_ENABLE_MASK		BIT(5)
+#define PLL_POST_DIV_ENABLE			BIT(5)
 #define SAMPLE_CLOCK_DIRECTION_MASK		BIT(4)
 #define SAMPLE_CLOCK_DIRECTION_REVERSE		BIT(4)
 #define SAMPLE_CLOCK_DIRECTION_FORWARD		0
+#define LOWFRE_EN_MASK				BIT(5)
+#define PLL_OUTPUT_FREQUENCY_DIV_BY_1		0
+#define PLL_OUTPUT_FREQUENCY_DIV_BY_2		1
+/* Analog Register Part: reg0b */
+#define CLOCK_LANE_VOD_RANGE_SET_MASK		GENMASK(3, 0)
+#define CLOCK_LANE_VOD_RANGE_SET(x)		UPDATE(x, 3, 0)
+#define VOD_MIN_RANGE				0x1
+#define VOD_MID_RANGE				0x3
+#define VOD_BIG_RANGE				0x7
+#define VOD_MAX_RANGE				0xf
+/* Analog Register Part: reg1E */
+#define PLL_MODE_SEL_MASK			GENMASK(6, 5)
+#define PLL_MODE_SEL_LVDS_MODE			0
+#define PLL_MODE_SEL_MIPI_MODE			BIT(5)
 /* Digital Register Part: reg00 */
 #define REG_DIG_RSTN_MASK			BIT(0)
 #define REG_DIG_RSTN_NORMAL			BIT(0)
@@ -102,20 +118,22 @@
 #define T_LPX_CNT_MASK				GENMASK(5, 0)
 #define T_LPX_CNT(x)				UPDATE(x, 5, 0)
 /* Clock/Data0/Data1/Data2/Data3 Lane Register Part: reg06 */
+#define T_HS_ZERO_CNT_HI_MASK			BIT(7)
+#define T_HS_ZERO_CNT_HI(x)			UPDATE(x, 7, 7)
 #define T_HS_PREPARE_CNT_MASK			GENMASK(6, 0)
 #define T_HS_PREPARE_CNT(x)			UPDATE(x, 6, 0)
 /* Clock/Data0/Data1/Data2/Data3 Lane Register Part: reg07 */
-#define T_HS_ZERO_CNT_MASK			GENMASK(5, 0)
-#define T_HS_ZERO_CNT(x)			UPDATE(x, 5, 0)
+#define T_HS_ZERO_CNT_LO_MASK			GENMASK(5, 0)
+#define T_HS_ZERO_CNT_LO(x)			UPDATE(x, 5, 0)
 /* Clock/Data0/Data1/Data2/Data3 Lane Register Part: reg08 */
 #define T_HS_TRAIL_CNT_MASK			GENMASK(6, 0)
 #define T_HS_TRAIL_CNT(x)			UPDATE(x, 6, 0)
 /* Clock/Data0/Data1/Data2/Data3 Lane Register Part: reg09 */
-#define T_HS_EXIT_CNT_MASK			GENMASK(4, 0)
-#define T_HS_EXIT_CNT(x)			UPDATE(x, 4, 0)
+#define T_HS_EXIT_CNT_LO_MASK			GENMASK(4, 0)
+#define T_HS_EXIT_CNT_LO(x)			UPDATE(x, 4, 0)
 /* Clock/Data0/Data1/Data2/Data3 Lane Register Part: reg0a */
-#define T_CLK_POST_CNT_MASK			GENMASK(3, 0)
-#define T_CLK_POST_CNT(x)			UPDATE(x, 3, 0)
+#define T_CLK_POST_CNT_LO_MASK			GENMASK(3, 0)
+#define T_CLK_POST_CNT_LO(x)			UPDATE(x, 3, 0)
 /* Clock/Data0/Data1/Data2/Data3 Lane Register Part: reg0c */
 #define LPDT_TX_PPI_SYNC_MASK			BIT(2)
 #define LPDT_TX_PPI_SYNC_ENABLE			BIT(2)
@@ -129,9 +147,13 @@
 #define T_CLK_PRE_CNT_MASK			GENMASK(3, 0)
 #define T_CLK_PRE_CNT(x)			UPDATE(x, 3, 0)
 /* Clock/Data0/Data1/Data2/Data3 Lane Register Part: reg10 */
+#define T_CLK_POST_CNT_HI_MASK			GENMASK(7, 6)
+#define T_CLK_POST_CNT_HI(x)			UPDATE(x, 7, 6)
 #define T_TA_GO_CNT_MASK			GENMASK(5, 0)
 #define T_TA_GO_CNT(x)				UPDATE(x, 5, 0)
 /* Clock/Data0/Data1/Data2/Data3 Lane Register Part: reg11 */
+#define T_HS_EXIT_CNT_HI_MASK			BIT(6)
+#define T_HS_EXIT_CNT_HI(x)			UPDATE(x, 6, 6)
 #define T_TA_SURE_CNT_MASK			GENMASK(5, 0)
 #define T_TA_SURE_CNT(x)			UPDATE(x, 5, 0)
 /* Clock/Data0/Data1/Data2/Data3 Lane Register Part: reg12 */
@@ -169,11 +191,23 @@
 #define DSI_PHY_STATUS		0xb0
 #define PHY_LOCK		BIT(0)
 
+enum phy_max_rate {
+	MAX_1GHZ,
+	MAX_2_5GHZ,
+};
+
+struct inno_video_phy_plat_data {
+	const struct inno_mipi_dphy_timing *inno_mipi_dphy_timing_table;
+	const unsigned int num_timings;
+	enum phy_max_rate max_rate;
+};
+
 struct inno_dsidphy {
 	struct device *dev;
 	struct clk *ref_clk;
 	struct clk *pclk_phy;
 	struct clk *pclk_host;
+	const struct inno_video_phy_plat_data *pdata;
 	void __iomem *phy_base;
 	void __iomem *host_base;
 	struct reset_control *rst;
@@ -200,6 +234,53 @@ enum {
 	REGISTER_PART_LVDS,
 };
 
+struct inno_mipi_dphy_timing {
+	unsigned long rate;
+	u8 lpx;
+	u8 hs_prepare;
+	u8 clk_lane_hs_zero;
+	u8 data_lane_hs_zero;
+	u8 hs_trail;
+};
+
+static const
+struct inno_mipi_dphy_timing inno_mipi_dphy_timing_table_max_1ghz[] = {
+	{ 110000000, 0x0, 0x20, 0x16, 0x02, 0x22},
+	{ 150000000, 0x0, 0x06, 0x16, 0x03, 0x45},
+	{ 200000000, 0x0, 0x18, 0x17, 0x04, 0x0b},
+	{ 250000000, 0x0, 0x05, 0x17, 0x05, 0x16},
+	{ 300000000, 0x0, 0x51, 0x18, 0x06, 0x2c},
+	{ 400000000, 0x0, 0x64, 0x19, 0x07, 0x33},
+	{ 500000000, 0x0, 0x20, 0x1b, 0x07, 0x4e},
+	{ 600000000, 0x0, 0x6a, 0x1d, 0x08, 0x3a},
+	{ 700000000, 0x0, 0x3e, 0x1e, 0x08, 0x6a},
+	{ 800000000, 0x0, 0x21, 0x1f, 0x09, 0x29},
+	{1000000000, 0x0, 0x09, 0x20, 0x09, 0x27},
+};
+
+static const
+struct inno_mipi_dphy_timing inno_mipi_dphy_timing_table_max_2_5ghz[] = {
+	{ 110000000, 0x02, 0x7f, 0x16, 0x02, 0x02},
+	{ 150000000, 0x02, 0x7f, 0x16, 0x03, 0x02},
+	{ 200000000, 0x02, 0x7f, 0x17, 0x04, 0x02},
+	{ 250000000, 0x02, 0x7f, 0x17, 0x05, 0x04},
+	{ 300000000, 0x02, 0x7f, 0x18, 0x06, 0x04},
+	{ 400000000, 0x03, 0x7e, 0x19, 0x07, 0x04},
+	{ 500000000, 0x03, 0x7c, 0x1b, 0x07, 0x08},
+	{ 600000000, 0x03, 0x70, 0x1d, 0x08, 0x10},
+	{ 700000000, 0x05, 0x40, 0x1e, 0x08, 0x30},
+	{ 800000000, 0x05, 0x02, 0x1f, 0x09, 0x30},
+	{1000000000, 0x05, 0x08, 0x20, 0x09, 0x30},
+	{1200000000, 0x06, 0x03, 0x32, 0x14, 0x0f},
+	{1400000000, 0x09, 0x03, 0x32, 0x14, 0x0f},
+	{1600000000, 0x0d, 0x42, 0x36, 0x0e, 0x0f},
+	{1800000000, 0x0e, 0x47, 0x7a, 0x0e, 0x0f},
+	{2000000000, 0x11, 0x64, 0x7a, 0x0e, 0x0b},
+	{2200000000, 0x13, 0x64, 0x7e, 0x15, 0x0b},
+	{2400000000, 0x13, 0x33, 0x7f, 0x15, 0x6a},
+	{2500000000, 0x15, 0x54, 0x7f, 0x15, 0x6a},
+};
+
 static inline struct inno_dsidphy *hw_to_inno(struct clk_hw *hw)
 {
 	return container_of(hw, struct inno_dsidphy, pll.hw);
@@ -290,31 +371,15 @@ static unsigned long inno_dsidphy_pll_calc_rate(struct inno_dsidphy *inno,
 static void inno_dsidphy_mipi_mode_enable(struct inno_dsidphy *inno)
 {
 	struct phy_configure_opts_mipi_dphy *cfg = &inno->dphy_cfg;
-	const struct {
-		unsigned long rate;
-		u8 hs_prepare;
-		u8 clk_lane_hs_zero;
-		u8 data_lane_hs_zero;
-		u8 hs_trail;
-	} timings[] = {
-		{ 110000000, 0x20, 0x16, 0x02, 0x22},
-		{ 150000000, 0x06, 0x16, 0x03, 0x45},
-		{ 200000000, 0x18, 0x17, 0x04, 0x0b},
-		{ 250000000, 0x05, 0x17, 0x05, 0x16},
-		{ 300000000, 0x51, 0x18, 0x06, 0x2c},
-		{ 400000000, 0x64, 0x19, 0x07, 0x33},
-		{ 500000000, 0x20, 0x1b, 0x07, 0x4e},
-		{ 600000000, 0x6a, 0x1d, 0x08, 0x3a},
-		{ 700000000, 0x3e, 0x1e, 0x08, 0x6a},
-		{ 800000000, 0x21, 0x1f, 0x09, 0x29},
-		{1000000000, 0x09, 0x20, 0x09, 0x27},
-	};
+	const struct inno_mipi_dphy_timing *timings;
 	u32 t_txbyteclkhs, t_txclkesc;
 	u32 txbyteclkhs, txclkesc, esc_clk_div;
 	u32 hs_exit, clk_post, clk_pre, wakeup, lpx, ta_go, ta_sure, ta_wait;
 	u32 hs_prepare, hs_trail, hs_zero, clk_lane_hs_zero, data_lane_hs_zero;
 	unsigned int i;
 
+	timings = inno->pdata->inno_mipi_dphy_timing_table;
+
 	inno_dsidphy_pll_calc_rate(inno, cfg->hs_clk_rate);
 
 	/* Select MIPI mode */
@@ -327,6 +392,13 @@ static void inno_dsidphy_mipi_mode_enable(struct inno_dsidphy *inno)
 			REG_FBDIV_HI_MASK, REG_FBDIV_HI(inno->pll.fbdiv));
 	phy_update_bits(inno, REGISTER_PART_ANALOG, 0x04,
 			REG_FBDIV_LO_MASK, REG_FBDIV_LO(inno->pll.fbdiv));
+	if (inno->pdata->max_rate == MAX_2_5GHZ) {
+		phy_update_bits(inno, REGISTER_PART_ANALOG, 0x08,
+				PLL_POST_DIV_ENABLE_MASK, PLL_POST_DIV_ENABLE);
+		phy_update_bits(inno, REGISTER_PART_ANALOG, 0x0b,
+				CLOCK_LANE_VOD_RANGE_SET_MASK,
+				CLOCK_LANE_VOD_RANGE_SET(VOD_MAX_RANGE));
+	}
 	/* Enable PLL and LDO */
 	phy_update_bits(inno, REGISTER_PART_ANALOG, 0x01,
 			REG_LDOPD_MASK | REG_PLLPD_MASK,
@@ -367,14 +439,6 @@ static void inno_dsidphy_mipi_mode_enable(struct inno_dsidphy *inno)
 	 */
 	clk_pre = DIV_ROUND_UP(cfg->clk_pre, BITS_PER_BYTE);
 
-	/*
-	 * The value of counter for HS Tlpx Time
-	 * Tlpx = Tpin_txbyteclkhs * (2 + value)
-	 */
-	lpx = DIV_ROUND_UP(cfg->lpx, t_txbyteclkhs);
-	if (lpx >= 2)
-		lpx -= 2;
-
 	/*
 	 * The value of counter for HS Tta-go
 	 * Tta-go for turnaround
@@ -394,13 +458,24 @@ static void inno_dsidphy_mipi_mode_enable(struct inno_dsidphy *inno)
 	 */
 	ta_wait = DIV_ROUND_UP(cfg->ta_get, t_txclkesc);
 
-	for (i = 0; i < ARRAY_SIZE(timings); i++)
+	for (i = 0; i < inno->pdata->num_timings; i++)
 		if (inno->pll.rate <= timings[i].rate)
 			break;
 
-	if (i == ARRAY_SIZE(timings))
+	if (i == inno->pdata->num_timings)
 		--i;
 
+	/*
+	 * The value of counter for HS Tlpx Time
+	 * Tlpx = Tpin_txbyteclkhs * (2 + value)
+	 */
+	if (inno->pdata->max_rate == MAX_1GHZ) {
+		lpx = DIV_ROUND_UP(cfg->lpx, t_txbyteclkhs);
+		if (lpx >= 2)
+			lpx -= 2;
+	} else
+		lpx = timings[i].lpx;
+
 	hs_prepare = timings[i].hs_prepare;
 	hs_trail = timings[i].hs_trail;
 	clk_lane_hs_zero = timings[i].clk_lane_hs_zero;
@@ -417,14 +492,23 @@ static void inno_dsidphy_mipi_mode_enable(struct inno_dsidphy *inno)
 				T_LPX_CNT(lpx));
 		phy_update_bits(inno, i, 0x06, T_HS_PREPARE_CNT_MASK,
 				T_HS_PREPARE_CNT(hs_prepare));
-		phy_update_bits(inno, i, 0x07, T_HS_ZERO_CNT_MASK,
-				T_HS_ZERO_CNT(hs_zero));
+		if (inno->pdata->max_rate == MAX_2_5GHZ)
+			phy_update_bits(inno, i, 0x06, T_HS_ZERO_CNT_HI_MASK,
+					T_HS_ZERO_CNT_HI(hs_zero >> 6));
+		phy_update_bits(inno, i, 0x07, T_HS_ZERO_CNT_LO_MASK,
+				T_HS_ZERO_CNT_LO(hs_zero));
 		phy_update_bits(inno, i, 0x08, T_HS_TRAIL_CNT_MASK,
 				T_HS_TRAIL_CNT(hs_trail));
-		phy_update_bits(inno, i, 0x09, T_HS_EXIT_CNT_MASK,
-				T_HS_EXIT_CNT(hs_exit));
-		phy_update_bits(inno, i, 0x0a, T_CLK_POST_CNT_MASK,
-				T_CLK_POST_CNT(clk_post));
+		if (inno->pdata->max_rate == MAX_2_5GHZ)
+			phy_update_bits(inno, i, 0x11, T_HS_EXIT_CNT_HI_MASK,
+					T_HS_EXIT_CNT_HI(hs_exit >> 5));
+		phy_update_bits(inno, i, 0x09, T_HS_EXIT_CNT_LO_MASK,
+				T_HS_EXIT_CNT_LO(hs_exit));
+		if (inno->pdata->max_rate == MAX_2_5GHZ)
+			phy_update_bits(inno, i, 0x10, T_CLK_POST_CNT_HI_MASK,
+					T_CLK_POST_CNT_HI(clk_post >> 4));
+		phy_update_bits(inno, i, 0x0a, T_CLK_POST_CNT_LO_MASK,
+				T_CLK_POST_CNT_LO(clk_post));
 		phy_update_bits(inno, i, 0x0e, T_CLK_PRE_CNT_MASK,
 				T_CLK_PRE_CNT(clk_pre));
 		phy_update_bits(inno, i, 0x0c, T_WAKEUP_CNT_HI_MASK,
@@ -452,8 +536,9 @@ static void inno_dsidphy_lvds_mode_enable(struct inno_dsidphy *inno)
 
 	/* Sample clock reverse direction */
 	phy_update_bits(inno, REGISTER_PART_ANALOG, 0x08,
-			SAMPLE_CLOCK_DIRECTION_MASK,
-			SAMPLE_CLOCK_DIRECTION_REVERSE);
+			SAMPLE_CLOCK_DIRECTION_MASK | LOWFRE_EN_MASK,
+			SAMPLE_CLOCK_DIRECTION_REVERSE |
+			PLL_OUTPUT_FREQUENCY_DIV_BY_1);
 
 	/* Select LVDS mode */
 	phy_update_bits(inno, REGISTER_PART_LVDS, 0x03,
@@ -473,6 +558,10 @@ static void inno_dsidphy_lvds_mode_enable(struct inno_dsidphy *inno)
 
 	msleep(20);
 
+	/* Select PLL mode */
+	phy_update_bits(inno, REGISTER_PART_ANALOG, 0x1e,
+			PLL_MODE_SEL_MASK, PLL_MODE_SEL_LVDS_MODE);
+
 	/* Reset LVDS digital logic */
 	phy_update_bits(inno, REGISTER_PART_LVDS, 0x00,
 			LVDS_DIGITAL_INTERNAL_RESET_MASK,
@@ -592,6 +681,18 @@ static const struct phy_ops inno_dsidphy_ops = {
 	.owner = THIS_MODULE,
 };
 
+static const struct inno_video_phy_plat_data max_1ghz_video_phy_plat_data = {
+	.inno_mipi_dphy_timing_table = inno_mipi_dphy_timing_table_max_1ghz,
+	.num_timings = ARRAY_SIZE(inno_mipi_dphy_timing_table_max_1ghz),
+	.max_rate = MAX_1GHZ,
+};
+
+static const struct inno_video_phy_plat_data max_2_5ghz_video_phy_plat_data = {
+	.inno_mipi_dphy_timing_table = inno_mipi_dphy_timing_table_max_2_5ghz,
+	.num_timings = ARRAY_SIZE(inno_mipi_dphy_timing_table_max_2_5ghz),
+	.max_rate = MAX_2_5GHZ,
+};
+
 static int inno_dsidphy_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -605,6 +706,7 @@ static int inno_dsidphy_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	inno->dev = dev;
+	inno->pdata = of_device_get_match_data(inno->dev);
 	platform_set_drvdata(pdev, inno);
 
 	inno->phy_base = devm_platform_ioremap_resource(pdev, 0);
@@ -663,9 +765,19 @@ static int inno_dsidphy_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id inno_dsidphy_of_match[] = {
-	{ .compatible = "rockchip,px30-dsi-dphy", },
-	{ .compatible = "rockchip,rk3128-dsi-dphy", },
-	{ .compatible = "rockchip,rk3368-dsi-dphy", },
+	{
+		.compatible = "rockchip,px30-dsi-dphy",
+		.data = &max_1ghz_video_phy_plat_data,
+	}, {
+		.compatible = "rockchip,rk3128-dsi-dphy",
+		.data = &max_1ghz_video_phy_plat_data,
+	}, {
+		.compatible = "rockchip,rk3368-dsi-dphy",
+		.data = &max_1ghz_video_phy_plat_data,
+	}, {
+		.compatible = "rockchip,rk3568-dsi-dphy",
+		.data = &max_2_5ghz_video_phy_plat_data,
+	},
 	{}
 };
 MODULE_DEVICE_TABLE(of, inno_dsidphy_of_match);
-- 
2.25.1

