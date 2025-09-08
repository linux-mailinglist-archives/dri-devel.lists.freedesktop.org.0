Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B1D5B48908
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 11:50:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3522410E3CB;
	Mon,  8 Sep 2025 09:49:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Uk3WJgfg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 549AA10E3CB
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 09:49:56 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-45dd0d53e04so4773325e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 02:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1757324995; x=1757929795; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6HPp+d+DYl6tBX7CkBMoeTNF2OX9txbgZ+0e0Y0cpiM=;
 b=Uk3WJgfgZ/iWNBrrMfUGrPUcZc3WJgZnyCoxrEBNbC9cWukCR1rlfO8yGhjYyQgcju
 k/U2jzrWDOITrbL5vp+NkCnI+vaU1t/Cqsk363dnicHtBXmzPA2xuloX/Iwh6ZY+N4rQ
 BYXDGxDuwEgK3mFZx188iSjtTeC/VhPG1eurLP9c7dq4HzKImoDyjb/+tISVfthdOUbA
 dIG3Wt5kzUS8MLwO/mZYsjMvjXcM3R5UH5Jrfje/yowmeTNFdvFrD4sq0yGoABmL9L2D
 3rLvPvIWHY2f2Wg8CrCeSZLxuMPPkqrmo0KpaC1/RqThTSC8/iYonEbNvKgE5xnQp83O
 3N6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757324995; x=1757929795;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6HPp+d+DYl6tBX7CkBMoeTNF2OX9txbgZ+0e0Y0cpiM=;
 b=J7iFcUMtBDA5CbXjrFK1lKNU90VGCesrQW36f/c4cJTJJoql4l3n9azig3KI989cZ9
 do7M9MQvM6WiVxIu/0ZfoZL9qBRzkXcbpqHvlIASm+1BPj+6bABajTW1c8OT2KRvRQos
 Lpi+q4hLeHP67nV0N8RHHMoi53QiBOO/18mIPAyAhcSZT6C3f2KPf93kRzFAqEWviol9
 5DC04ltqH5FUxjo+1BPdkdH3ALPrVGMe3g2oQ+VBOYhPuIQzLblDXUBFbMAZ7wKqCiNZ
 0sWuJd2egOEVaDWI6wzI7ByLCinYJL/w5IDSgXVKKWxj4qHEIUFMYaAnCeTJp1P0291T
 q7cg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMrU0PCM9dqSj2odo6v418Dci1HN6/bpRNOQ8SYkjVOf8cYOGoVmNgIV7Cwc4x5UfNJjCPxufu7KI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxoqubrmxWcb2LKjGaDamh5BQDqmeBVEmuUnyYPwpB6QjSHtIoq
 yyLyCNcfSmbP+2qpLb9MGz6DiUGsgt3iruEAeV7DVi41nQH/rXS4loN0AFE5FzaIWqo=
X-Gm-Gg: ASbGncsmF64sRt7ELXJ0MxJxidMMf8/jB6438Vpp1Eykv4uaa4lD3F9AcqFFeSpTHrb
 VpdgaeRqGDec6BauiBlr1yxQRSAYkPJM80mZmgJCcqfCv/RHjqrVO36Jc7fiJgVIfAAVR+zmD3D
 RP+RgiycC4d1A3B4DddhxiK25MyrSt9sVNs6dkp4wmOq+NgeDlZWf1PT2YN7dfVU0kCZe4dHaX6
 hgmi8OOhEVrsKXE+jG/LtrQpN8ljUq2lfFlzY6iMT7OKRCZ2Gca6XpSDmkcoSSZubn1xeqUx74D
 +/tBD8OWBp7T3FUGG6m0Zg92KOLrS3uEB/RwuRrSP6k2uWueRLGZOSK3W0c3hPyXV8z7+F0U9sW
 67FsATBvj72Dm5Rh7Ku/8ojcNBFqu/jEWOgAutglURhnM
X-Google-Smtp-Source: AGHT+IH9yq+f/Gif5hHI2ymerMAbld+HQll0KYCEenPnZuVt/ftZDGbpRCGUuo/9Dn+MUTlWJrxLcg==
X-Received: by 2002:a05:600c:8509:b0:45b:84e6:129a with SMTP id
 5b1f17b1804b1-45dddec5fa4mr32855945e9.4.1757324994767; 
 Mon, 08 Sep 2025 02:49:54 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b7e8879cesm438321075e9.12.2025.09.08.02.49.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Sep 2025 02:49:54 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v7] drm/msm/dsi/phy: Fix reading zero as PLL rates when
 unprepared
Date: Mon,  8 Sep 2025 11:49:51 +0200
Message-ID: <20250908094950.72877-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=9020;
 i=krzysztof.kozlowski@linaro.org; 
 h=from:subject; bh=GUJCx3UkD3Z3oOzZnWZKmtntiKH4pYmS6nnwX4e6kdA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBovqa+61PJEHKEUpujaVvs0syf6Uoj1VZ7bi/0q
 WmKBMgmnhyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaL6mvgAKCRDBN2bmhouD
 13WzD/4x/IIPuwNjsrmNC0LUxZGIhDIEc7dC5/TTJ64E6ftivKaBqEfcFw9WPjGLEhVzHWIWKPo
 E95btmitQzt0IvzpyE/PZw1AjTr8EdH3JP7XGnt3UvnV+EyEDxC7wMzErXX56Yf6GAKljFOFqDU
 qM9lla0rcVhm+hNtCC/a4fIAzu8RbgWW7Yjp8ossoR2R8QNh85/mesEp4DFnbgJr6Qfs9mQVIpu
 3xx4f2zTB3fkzQnAWhjUis7/G5delvvCIAaMF6CUdK2JQyEmWE4cy7pi9rPd3ituMUtsjdYfSNF
 GfEKghUGEDhzA7J5At3oLTs2/BkZbZ5arYBTN55zFwOxxBnvbgT69gay6f9MRQCT7M68vPwAHAK
 +6ykPX57IPkbGdLd6PWzCIce+EM0i7yb+4jMZm7p7SAhGwji0uw1goN4/+TAMlCk3vrUObFLIjm
 MnIPasj2/L/rrX6qyzVvon85e/TOBTTzSYJ5WYjM7kqfT49oU+lt7zvEKekfpppnZS0A9dV9OVv
 nP8VGP+4carGKhZb2a2WO7w9i3UgxD5NbZMoKuhZdg6SV45Nhq6E3ow7CjPdgapL5GZ+syR2kVU
 ENs6FHoS/w1/Fu8u4mgW9cub/Kts+eoPqQmAuxHpv68YgnErJdESfvdzvus1/ulq7fWE0nxhqUn
 jJKsiA7KdOWxuTg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hardware Programming Guide for DSI PHY says that PLL_SHUTDOWNB and
DIGTOP_PWRDN_B have to be asserted for any PLL register access.
Whenever dsi_pll_7nm_vco_recalc_rate() or dsi_pll_7nm_vco_set_rate()
were called on unprepared PLL, driver read values of zero leading to all
sort of further troubles, like failing to set pixel and byte clock
rates.

Asserting the PLL shutdown bit is done by dsi_pll_enable_pll_bias() (and
corresponding dsi_pll_disable_pll_bias()) which are called through the
code, including from PLL .prepare() and .unprepare() callbacks.

The .set_rate() and .recalc_rate() can be called almost anytime from
external users including times when PLL is or is not prepared, thus
driver should not interfere with the prepare status.

Implement simple reference counting for the PLL bias, so
set_rate/recalc_rate will not change the status of prepared PLL.

Issue of reading 0 in .recalc_rate() did not show up on existing
devices, but only after re-ordering the code for SM8750.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Continuing changelog from "drm/msm: Add support for SM8750" where this
was part of.

Changes in v7:
- Rebase
- I did not remove ndelay(250) as discussed with Dmitry, because:
  1. Indeed the HPG does not mention any delay needed, unlike PHY 10 nm.
  2. However downstream source code for PHY 3+4+5 nm has exactly these
     delays. This could be copy-paste or could be intentional workaround
     for some issue about which I have no clue. Timings are tricky and
     I don't think I should be introducing changes without actually
     knowing them.
- Add Rb tags
- Link to v6: https://lore.kernel.org/r/20250610-b4-sm8750-display-v6-0-ee633e3ddbff@linaro.org

Changes in v6:
1. Print error on pll bias enable/disable imbalance refcnt

Changes in v5:
1. New patch
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h     |  1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 53 +++++++++++++++++++++++
 2 files changed, 54 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
index 3cbf08231492..e391505fdaf0 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
@@ -109,6 +109,7 @@ struct msm_dsi_phy {
 	struct msm_dsi_dphy_timing timing;
 	const struct msm_dsi_phy_cfg *cfg;
 	void *tuning_cfg;
+	void *pll_data;
 
 	enum msm_dsi_phy_usecase usecase;
 	bool regulator_ldo_mode;
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index 2c2bbda46c78..32f06edd21a9 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -90,6 +90,13 @@ struct dsi_pll_7nm {
 	/* protects REG_DSI_7nm_PHY_CMN_CLK_CFG1 register */
 	spinlock_t pclk_mux_lock;
 
+	/*
+	 * protects REG_DSI_7nm_PHY_CMN_CTRL_0 register and pll_enable_cnt
+	 * member
+	 */
+	spinlock_t pll_enable_lock;
+	int pll_enable_cnt;
+
 	struct pll_7nm_cached_state cached_state;
 
 	struct dsi_pll_7nm *slave;
@@ -103,6 +110,9 @@ struct dsi_pll_7nm {
  */
 static struct dsi_pll_7nm *pll_7nm_list[DSI_MAX];
 
+static void dsi_pll_enable_pll_bias(struct dsi_pll_7nm *pll);
+static void dsi_pll_disable_pll_bias(struct dsi_pll_7nm *pll);
+
 static void dsi_pll_setup_config(struct dsi_pll_config *config)
 {
 	config->ssc_freq = 31500;
@@ -340,6 +350,7 @@ static int dsi_pll_7nm_vco_set_rate(struct clk_hw *hw, unsigned long rate,
 	struct dsi_pll_7nm *pll_7nm = to_pll_7nm(hw);
 	struct dsi_pll_config config;
 
+	dsi_pll_enable_pll_bias(pll_7nm);
 	DBG("DSI PLL%d rate=%lu, parent's=%lu", pll_7nm->phy->id, rate,
 	    parent_rate);
 
@@ -357,6 +368,7 @@ static int dsi_pll_7nm_vco_set_rate(struct clk_hw *hw, unsigned long rate,
 
 	dsi_pll_ssc_commit(pll_7nm, &config);
 
+	dsi_pll_disable_pll_bias(pll_7nm);
 	/* flush, ensure all register writes are done*/
 	wmb();
 
@@ -385,24 +397,47 @@ static int dsi_pll_7nm_lock_status(struct dsi_pll_7nm *pll)
 
 static void dsi_pll_disable_pll_bias(struct dsi_pll_7nm *pll)
 {
+	unsigned long flags;
 	u32 data;
 
+	spin_lock_irqsave(&pll->pll_enable_lock, flags);
+	--pll->pll_enable_cnt;
+	if (pll->pll_enable_cnt < 0) {
+		spin_unlock_irqrestore(&pll->pll_enable_lock, flags);
+		DRM_DEV_ERROR_RATELIMITED(&pll->phy->pdev->dev,
+					  "bug: imbalance in disabling PLL bias\n");
+		return;
+	} else if (pll->pll_enable_cnt > 0) {
+		spin_unlock_irqrestore(&pll->pll_enable_lock, flags);
+		return;
+	} /* else: == 0 */
+
 	data = readl(pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);
 	data &= ~DSI_7nm_PHY_CMN_CTRL_0_PLL_SHUTDOWNB;
 	writel(0, pll->phy->pll_base + REG_DSI_7nm_PHY_PLL_SYSTEM_MUXES);
 	writel(data, pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);
+	spin_unlock_irqrestore(&pll->pll_enable_lock, flags);
 	ndelay(250);
 }
 
 static void dsi_pll_enable_pll_bias(struct dsi_pll_7nm *pll)
 {
+	unsigned long flags;
 	u32 data;
 
+	spin_lock_irqsave(&pll->pll_enable_lock, flags);
+	if (pll->pll_enable_cnt++) {
+		spin_unlock_irqrestore(&pll->pll_enable_lock, flags);
+		WARN_ON(pll->pll_enable_cnt == INT_MAX);
+		return;
+	}
+
 	data = readl(pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);
 	data |= DSI_7nm_PHY_CMN_CTRL_0_PLL_SHUTDOWNB;
 	writel(data, pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);
 
 	writel(0xc0, pll->phy->pll_base + REG_DSI_7nm_PHY_PLL_SYSTEM_MUXES);
+	spin_unlock_irqrestore(&pll->pll_enable_lock, flags);
 	ndelay(250);
 }
 
@@ -543,6 +578,7 @@ static unsigned long dsi_pll_7nm_vco_recalc_rate(struct clk_hw *hw,
 	u32 dec;
 	u64 pll_freq, tmp64;
 
+	dsi_pll_enable_pll_bias(pll_7nm);
 	dec = readl(base + REG_DSI_7nm_PHY_PLL_DECIMAL_DIV_START_1);
 	dec &= 0xff;
 
@@ -567,6 +603,8 @@ static unsigned long dsi_pll_7nm_vco_recalc_rate(struct clk_hw *hw,
 	DBG("DSI PLL%d returning vco rate = %lu, dec = %x, frac = %x",
 	    pll_7nm->phy->id, (unsigned long)vco_rate, dec, frac);
 
+	dsi_pll_disable_pll_bias(pll_7nm);
+
 	return (unsigned long)vco_rate;
 }
 
@@ -600,6 +638,7 @@ static void dsi_7nm_pll_save_state(struct msm_dsi_phy *phy)
 	void __iomem *phy_base = pll_7nm->phy->base;
 	u32 cmn_clk_cfg0, cmn_clk_cfg1;
 
+	dsi_pll_enable_pll_bias(pll_7nm);
 	cached->pll_out_div = readl(pll_7nm->phy->pll_base +
 			REG_DSI_7nm_PHY_PLL_PLL_OUTDIV_RATE);
 	cached->pll_out_div &= 0x3;
@@ -611,6 +650,7 @@ static void dsi_7nm_pll_save_state(struct msm_dsi_phy *phy)
 	cmn_clk_cfg1 = readl(phy_base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
 	cached->pll_mux = FIELD_GET(DSI_7nm_PHY_CMN_CLK_CFG1_DSICLK_SEL__MASK, cmn_clk_cfg1);
 
+	dsi_pll_disable_pll_bias(pll_7nm);
 	DBG("DSI PLL%d outdiv %x bit_clk_div %x pix_clk_div %x pll_mux %x",
 	    pll_7nm->phy->id, cached->pll_out_div, cached->bit_clk_div,
 	    cached->pix_clk_div, cached->pll_mux);
@@ -833,8 +873,10 @@ static int dsi_pll_7nm_init(struct msm_dsi_phy *phy)
 
 	spin_lock_init(&pll_7nm->postdiv_lock);
 	spin_lock_init(&pll_7nm->pclk_mux_lock);
+	spin_lock_init(&pll_7nm->pll_enable_lock);
 
 	pll_7nm->phy = phy;
+	phy->pll_data = pll_7nm;
 
 	ret = pll_7nm_register(pll_7nm, phy->provided_clocks->hws);
 	if (ret) {
@@ -923,8 +965,10 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy,
 	u32 const delay_us = 5;
 	u32 const timeout_us = 1000;
 	struct msm_dsi_dphy_timing *timing = &phy->timing;
+	struct dsi_pll_7nm *pll = phy->pll_data;
 	void __iomem *base = phy->base;
 	bool less_than_1500_mhz;
+	unsigned long flags;
 	u32 vreg_ctrl_0, vreg_ctrl_1, lane_ctrl0;
 	u32 glbl_pemph_ctrl_0;
 	u32 glbl_str_swi_cal_sel_ctrl, glbl_hstx_str_ctrl_0;
@@ -1046,10 +1090,13 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy,
 		glbl_rescode_bot_ctrl = 0x3c;
 	}
 
+	spin_lock_irqsave(&pll->pll_enable_lock, flags);
+	pll->pll_enable_cnt = 1;
 	/* de-assert digital and pll power down */
 	data = DSI_7nm_PHY_CMN_CTRL_0_DIGTOP_PWRDN_B |
 	       DSI_7nm_PHY_CMN_CTRL_0_PLL_SHUTDOWNB;
 	writel(data, base + REG_DSI_7nm_PHY_CMN_CTRL_0);
+	spin_unlock_irqrestore(&pll->pll_enable_lock, flags);
 
 	/* Assert PLL core reset */
 	writel(0x00, base + REG_DSI_7nm_PHY_CMN_PLL_CNTRL);
@@ -1162,7 +1209,9 @@ static bool dsi_7nm_set_continuous_clock(struct msm_dsi_phy *phy, bool enable)
 
 static void dsi_7nm_phy_disable(struct msm_dsi_phy *phy)
 {
+	struct dsi_pll_7nm *pll = phy->pll_data;
 	void __iomem *base = phy->base;
+	unsigned long flags;
 	u32 data;
 
 	DBG("");
@@ -1189,8 +1238,12 @@ static void dsi_7nm_phy_disable(struct msm_dsi_phy *phy)
 	writel(data, base + REG_DSI_7nm_PHY_CMN_CTRL_0);
 	writel(0, base + REG_DSI_7nm_PHY_CMN_LANE_CTRL0);
 
+	spin_lock_irqsave(&pll->pll_enable_lock, flags);
+	pll->pll_enable_cnt = 0;
 	/* Turn off all PHY blocks */
 	writel(0x00, base + REG_DSI_7nm_PHY_CMN_CTRL_0);
+	spin_unlock_irqrestore(&pll->pll_enable_lock, flags);
+
 	/* make sure phy is turned off */
 	wmb();
 
-- 
2.48.1

