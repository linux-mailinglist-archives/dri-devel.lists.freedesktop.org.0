Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 595CBAA4C55
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 15:01:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CFFA10E7CF;
	Wed, 30 Apr 2025 13:01:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="TcRcHzpX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0523910E793
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 13:01:46 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-3978ef9a778so260111f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 06:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746018104; x=1746622904; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=++HS3fQ89FDhIxiVYYXImypI9qyqxTY7eLgyuEkEEP4=;
 b=TcRcHzpXhOX8G35wsjWxlAp2+m4cmLvfOtIqaBQaFv/7tjOk8jBqnprz7X03Hi3DAQ
 478Ik9U/zl6Zp3C/grJyvz2Mo3V0eHc4fNaQA6sEZnd56xo+S65fHW0A4JQZYzU20wNI
 q1RKyNCzkunaaHs4bBAJdvu+gge3p61SW15tGr1oMJpGfuLHDToScVYwdEbChrktYf3Z
 D/Bbh04zYgdbaupkcClXg2z6aifqSLnQ4tmLOyKmrjwjgsGCRBIqNhDvf1stL8mi3RDT
 8Quoye7+/xU7lxgJXqoJNa/CIVRlatsmvKZ9wG+sOu5mBhB84RmJkqcyKBL3J0VIKO95
 cIzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746018104; x=1746622904;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=++HS3fQ89FDhIxiVYYXImypI9qyqxTY7eLgyuEkEEP4=;
 b=PbudnnydcCXPl1PWLN0x8PQRfqfvCgkZ9xB9PKmIByk8cjcgSjbPgA3E39D4Wy6yib
 DBADqvsfHtUj2cJ5qHEo7DYVhsxkv3t9LQr11yQj5EKhvyVxZh3ZOHY+mzPIgGLivfUZ
 AqYnHMP2hR10X1aQZVOL3DKI+TVRO4ANFDA2hicr0CDMPM/MHZld+/7tk1UIwSJcybF3
 Rp89IGAELg19hkM4DL54Zunz8ZZYTGaP3Nro3UcniDpe7AySBlfbEuBBIXRkTcS1s297
 KQ1triLsRAAkFN16zuHTo/9gFXiYDJyHTLxzxeZQSB6scUI42nXXIZUSh0out8s8peWK
 8I0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhaXkrqHAYBvZQeykYhnTiAuzXab6tXH+aRrlDJKDrKMfZp/fjVerh6HhTqUOUXNe4xWfoEDstydk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyoYteX3HLapkaAY93rHIdF97oxc3C4l0U73Qpm7nX5/ci2itUA
 yd3g6NgD9hdswrUyrzQfaMZ6AYLwDvviQt+mNnhSDoitHaeYKSM6aZHBRhEREkA=
X-Gm-Gg: ASbGnct2ghIuK2sFU+l1oZ04lyGYangxr94n3Z8R0HKU7ljmC08V1/43Br7mAG7zZR4
 ArfyR3PwCwV77EHmiqFm4AG0pv1ezmHf82Q+9XTtJnX1QdPmAi0KiAMY1tUwGXxjKpbcgWzDE4J
 oBrXpphzrObHOVNuB70HktV3asp3WkW2JBbN6R0m0wwJcAH5fNgNpMZQmcKkOXReJiTtWKwenXM
 pjvNMdk4xQeDzUnYOuPxRCShXZfo8wINyky1u1eegXCOrrKIoGIV4DYkWm16q+V5poMSgqW1+nd
 rsZShZGCPUODLfYpmjHACnz5oducW0h3bXi6gn0GW6yFgqLisLevlbciatydK3hx9F7qcA==
X-Google-Smtp-Source: AGHT+IEIRNBKsU/jAWiqCd1IoESq7JOuTNPI2Xuv0lJVIRzD76qmiJjja2VJ3uf8miPfld3enLkCzg==
X-Received: by 2002:a05:6000:2ca:b0:3a0:65a6:bb02 with SMTP id
 ffacd0b85a97d-3a08ff6f386mr916989f8f.6.1746018102991; 
 Wed, 30 Apr 2025 06:01:42 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a073e46c23sm16884043f8f.75.2025.04.30.06.01.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Apr 2025 06:01:41 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 30 Apr 2025 15:00:46 +0200
Subject: [PATCH v5 16/24] drm/msm/dsi/phy: Fix reading zero as PLL rates
 when unprepared
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250430-b4-sm8750-display-v5-16-8cab30c3e4df@linaro.org>
References: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
In-Reply-To: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Rob Clark <robdclark@chromium.org>, linux-clk@vger.kernel.org, 
 Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8434;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=Ady9uUl2y0iFn8+b3K2ug68aohHAxG6zCHobuC8E3HU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoEh8Flg3Hg+I5rawa0B4M7c8hIDORsOAfStdEy
 PYNY69I+4mJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaBIfBQAKCRDBN2bmhouD
 1ycZD/4sJek/0w19CYZYojxZVE0wOfpj0V5/JoOPaeGqu2oR6Z6kUu0jUPQfZUdVOLUoiJ9pIP6
 mTup8mqiXvvZsGuEFGYFPjIcmyMrootFv35sNPxvvf3yP/p1gErwix6zSEbXDT8dXdDRMvHlm8u
 SCI41ykEuxQgN2vq9nuO/TEleDer9XnIaJ2l4T/6EgrMR9GFyzrTKlPBmJy/t28q9rneI2xA3Id
 tIVw18lsKPGGNNUpxcpjxg0Y6EuEewzCpep+BfZocavaM74Sq2xa7UGVOiCHu+qlBcZGoStQ4fB
 1X9cxkQMqKb5l1Ljg8PTUvWt70Zo4gPSJHtiEtc9DOs+Rm9iX3FBngRL3PoPvuVYdPLBKPmZk9q
 kT7LoNQjx3ciYPIAKHpGDXOjqqw6AM4j3rxAFKLPAxZW2fhedQVPW1nGZ6UbANx5o17mQTNSMYM
 XsIHxfAKAiG99W/opkj2OjleswTio0pIEi6Idh+hhis95tDzms6yTRYgHGAxwwXz1WOJkvYd7Np
 Ga5R3OhGXvGetF3BKSJwQoMWtx3125Y5sVt8/DzUrB+44qs5QJMHNW0b3uspOzGzLLGb+p8XZ6X
 v+dEqBjwa7b40CJu9EbfHph/bvOqJdj8e7qBoDAOwHUThgYeCfppUSO/H6wB5wr3DAcSj26+SG6
 2kwZhI0pWgOx6lQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
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

Changes in v5:
1. New patch
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h     |  1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 59 +++++++++++++++++++++++++++++--
 2 files changed, 58 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
index 1925418d9999a24263d6621299cae78f1fb9455c..7aac0c6ebb37ba15d7af59c28cd9494752d9fdbb 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
@@ -107,6 +107,7 @@ struct msm_dsi_phy {
 	struct msm_dsi_dphy_timing timing;
 	const struct msm_dsi_phy_cfg *cfg;
 	void *tuning_cfg;
+	void *pll_data;
 
 	enum msm_dsi_phy_usecase usecase;
 	bool regulator_ldo_mode;
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index 7ef0aa7ff41b7d10d2630405c3d2f541957f19ea..1a0f5c0509e6dcb04018c3e93aa704c7221a4869 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -88,6 +88,13 @@ struct dsi_pll_7nm {
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
@@ -101,6 +108,9 @@ struct dsi_pll_7nm {
  */
 static struct dsi_pll_7nm *pll_7nm_list[DSI_MAX];
 
+static void dsi_pll_enable_pll_bias(struct dsi_pll_7nm *pll);
+static void dsi_pll_disable_pll_bias(struct dsi_pll_7nm *pll);
+
 static void dsi_pll_setup_config(struct dsi_pll_config *config)
 {
 	config->ssc_freq = 31500;
@@ -316,6 +326,7 @@ static int dsi_pll_7nm_vco_set_rate(struct clk_hw *hw, unsigned long rate,
 	struct dsi_pll_7nm *pll_7nm = to_pll_7nm(hw);
 	struct dsi_pll_config config;
 
+	dsi_pll_enable_pll_bias(pll_7nm);
 	DBG("DSI PLL%d rate=%lu, parent's=%lu", pll_7nm->phy->id, rate,
 	    parent_rate);
 
@@ -333,6 +344,7 @@ static int dsi_pll_7nm_vco_set_rate(struct clk_hw *hw, unsigned long rate,
 
 	dsi_pll_ssc_commit(pll_7nm, &config);
 
+	dsi_pll_disable_pll_bias(pll_7nm);
 	/* flush, ensure all register writes are done*/
 	wmb();
 
@@ -361,21 +373,46 @@ static int dsi_pll_7nm_lock_status(struct dsi_pll_7nm *pll)
 
 static void dsi_pll_disable_pll_bias(struct dsi_pll_7nm *pll)
 {
-	u32 data = readl(pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);
+	unsigned long flags;
+	u32 data;
+
+	spin_lock_irqsave(&pll->pll_enable_lock, flags);
+	--pll->pll_enable_cnt;
+	if (pll->pll_enable_cnt < 0) {
+		spin_unlock_irqrestore(&pll->pll_enable_lock, flags);
+		return;
+	} else if (pll->pll_enable_cnt > 0) {
+		spin_unlock_irqrestore(&pll->pll_enable_lock, flags);
+		return;
+	} /* else: == 0 */
+
+	data = readl(pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);
 	data &= ~DSI_7nm_PHY_CMN_CTRL_0_PLL_SHUTDOWNB;
 
 	writel(0, pll->phy->pll_base + REG_DSI_7nm_PHY_PLL_SYSTEM_MUXES);
 	writel(data, pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);
+	spin_unlock_irqrestore(&pll->pll_enable_lock, flags);
 	ndelay(250);
 }
 
 static void dsi_pll_enable_pll_bias(struct dsi_pll_7nm *pll)
 {
-	u32 data = readl(pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);
+	unsigned long flags;
+	u32 data;
+
+	spin_lock_irqsave(&pll->pll_enable_lock, flags);
+	if (pll->pll_enable_cnt++) {
+		spin_unlock_irqrestore(&pll->pll_enable_lock, flags);
+		WARN_ON(pll->pll_enable_cnt == INT_MAX);
+		return;
+	}
+
+	data = readl(pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);
 	data |= DSI_7nm_PHY_CMN_CTRL_0_PLL_SHUTDOWNB;
 	writel(data, pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);
 
 	writel(0xc0, pll->phy->pll_base + REG_DSI_7nm_PHY_PLL_SYSTEM_MUXES);
+	spin_unlock_irqrestore(&pll->pll_enable_lock, flags);
 	ndelay(250);
 }
 
@@ -516,6 +553,7 @@ static unsigned long dsi_pll_7nm_vco_recalc_rate(struct clk_hw *hw,
 	u32 dec;
 	u64 pll_freq, tmp64;
 
+	dsi_pll_enable_pll_bias(pll_7nm);
 	dec = readl(base + REG_DSI_7nm_PHY_PLL_DECIMAL_DIV_START_1);
 	dec &= 0xff;
 
@@ -540,6 +578,8 @@ static unsigned long dsi_pll_7nm_vco_recalc_rate(struct clk_hw *hw,
 	DBG("DSI PLL%d returning vco rate = %lu, dec = %x, frac = %x",
 	    pll_7nm->phy->id, (unsigned long)vco_rate, dec, frac);
 
+	dsi_pll_disable_pll_bias(pll_7nm);
+
 	return (unsigned long)vco_rate;
 }
 
@@ -575,6 +615,7 @@ static void dsi_7nm_pll_save_state(struct msm_dsi_phy *phy)
 	void __iomem *phy_base = pll_7nm->phy->base;
 	u32 cmn_clk_cfg0, cmn_clk_cfg1;
 
+	dsi_pll_enable_pll_bias(pll_7nm);
 	cached->pll_out_div = readl(pll_7nm->phy->pll_base +
 			REG_DSI_7nm_PHY_PLL_PLL_OUTDIV_RATE);
 	cached->pll_out_div &= 0x3;
@@ -586,6 +627,7 @@ static void dsi_7nm_pll_save_state(struct msm_dsi_phy *phy)
 	cmn_clk_cfg1 = readl(phy_base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
 	cached->pll_mux = FIELD_GET(DSI_7nm_PHY_CMN_CLK_CFG1_DSICLK_SEL__MASK, cmn_clk_cfg1);
 
+	dsi_pll_disable_pll_bias(pll_7nm);
 	DBG("DSI PLL%d outdiv %x bit_clk_div %x pix_clk_div %x pll_mux %x",
 	    pll_7nm->phy->id, cached->pll_out_div, cached->bit_clk_div,
 	    cached->pix_clk_div, cached->pll_mux);
@@ -804,8 +846,10 @@ static int dsi_pll_7nm_init(struct msm_dsi_phy *phy)
 
 	spin_lock_init(&pll_7nm->postdiv_lock);
 	spin_lock_init(&pll_7nm->pclk_mux_lock);
+	spin_lock_init(&pll_7nm->pll_enable_lock);
 
 	pll_7nm->phy = phy;
+	phy->pll_data = pll_7nm;
 
 	ret = pll_7nm_register(pll_7nm, phy->provided_clocks->hws);
 	if (ret) {
@@ -888,8 +932,10 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy,
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
@@ -997,10 +1043,13 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy,
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
@@ -1112,7 +1161,9 @@ static bool dsi_7nm_set_continuous_clock(struct msm_dsi_phy *phy, bool enable)
 
 static void dsi_7nm_phy_disable(struct msm_dsi_phy *phy)
 {
+	struct dsi_pll_7nm *pll = phy->pll_data;
 	void __iomem *base = phy->base;
+	unsigned long flags;
 	u32 data;
 
 	DBG("");
@@ -1138,8 +1189,12 @@ static void dsi_7nm_phy_disable(struct msm_dsi_phy *phy)
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
2.45.2

