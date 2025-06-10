Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C088EAD3A51
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 16:06:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 634A710E582;
	Tue, 10 Jun 2025 14:06:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="bsX8ENp1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8E8010E580
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 14:06:27 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-450d15e2d25so638405e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 07:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1749564386; x=1750169186; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=c1KnLM1NPxNXZz/8JZFIjv2R+0TiPb/2BYtiypsnLxI=;
 b=bsX8ENp1B/i6HSoouOhbF6uIUppAJFIxWX95sk4Y8OyUTrpPosjvetoSTocjFFliY5
 jvBm/YZC6OEpPWGqEs9ILznkw3yYrvzOQYZVRJqmyrjW9wBSuxe5pPJczX7dbaq1XpOx
 LclTETIQqS9IEO0VERMuLSlToHtIWUxC4mAKApune8FZU+t/Ex39LPb8Y+HWcuHzLo7I
 usHx3cuKP1uujypY7pej9jPnjcVKiV3I72czefaJuTfatlkAHKHWvIW5hLL9GVWTbx3/
 SQ+13OLXTkybgn9jY1zFU2qHLlnOw7cAtj7IQTwfNOaJ/91FIJPJ8rwtqHWAxm8xGrsG
 Y4hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749564386; x=1750169186;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c1KnLM1NPxNXZz/8JZFIjv2R+0TiPb/2BYtiypsnLxI=;
 b=C+7/VEXh9LL65cw2tBZ1WVob2ZJe5VoX43bEj57Rr/XO/uf7RSCe98VUXC6VfNAcrg
 V/Itx6GQJ2SXNmchcDDAlyyvqtFEdVGbs7qNsRx9eslLSNOBXbjFtOClqFwHq2SyOAiU
 PMk6CRYId3X4HVxz/hHZu4lo4/CRJnfKrU2sfxRP8P3xGWbNWhxq+2dIhpNoukGw+lX+
 OiaycC2yYJejMcOC5EXiOp5PQuuMyQ2He1NHO2eRC33kDFp1GqvkXOVEWgD8gt5KZdap
 +rnEdq177mwaKzBN5qgOAWcYBzRanxcw8+wwBlyWnKktmu93UOxi/dnQoLzRraweTp3v
 TrAg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVb7kjGlWH39cS0toQ0yuwAGiZX37HHPJK1Cn/ZEkv+zsbVoMu8Npu5nbcb1dmgjRilQpX9voV2Ie4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwAAtB/MInN6kP+2gjviSk85mZhxvUI9r5RvHwmbx5jCei689hZ
 CJg8el7yc3YxZWioXGLzDvmjsODdWEV5a8Smsu7ioouX5HCQSGPAUEI+Ylhsr89QaQ4=
X-Gm-Gg: ASbGncvMhAXSWQPJw4b0PoK+N41O0vxcracdg5S5C7LiFOULpYQkCBNvGGXqCIKKvVw
 2O09g6lubq5fvAabJ6+RJEAc0AabiSyW7UfnVuVwW6/YbQynCXMJrtDmCRFHEtH7B2s9p8ev12S
 1Qj7gRVMIrfWLBr/uIRfZmlgpkum/fX7VxwqgeDabK+3gVLe5cpPMOu7cbNVwsLwQ6f/p7XXfOV
 jPqS7Q+Eb9XTHeKcugDi58/BGMritiE2xsmw0ftda4f+GlHMGyFlkruQU4B8qLx9rmwldgaCHbw
 oR1MhpoXQHtUDL9c8u1ozMjZvoVM54DFpgv+lH7vkl7nU6Vrjl5p5sKocgmAfKT/QMU3qC5eI4s
 8/97EQA==
X-Google-Smtp-Source: AGHT+IEwWcvYaimoww5hM1GBZ3AEqmQUQ5RJD+K72W8jKVRT3hyLsep9VyFM47tqr7v/rXlXGRe5sg==
X-Received: by 2002:a05:600c:350f:b0:451:eed7:6d76 with SMTP id
 5b1f17b1804b1-4530538bc36mr37681375e9.8.1749564386213; 
 Tue, 10 Jun 2025 07:06:26 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a53244df06sm12734469f8f.69.2025.06.10.07.06.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 07:06:25 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 10 Jun 2025 16:05:46 +0200
Subject: [PATCH v6 08/17] drm/msm/dsi/phy: Fix reading zero as PLL rates
 when unprepared
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-b4-sm8750-display-v6-8-ee633e3ddbff@linaro.org>
References: <20250610-b4-sm8750-display-v6-0-ee633e3ddbff@linaro.org>
In-Reply-To: <20250610-b4-sm8750-display-v6-0-ee633e3ddbff@linaro.org>
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
 Dmitry Baryshkov <lumag@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-clk@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8466;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=JEggE4aGkw0e9clcohgBckgczcMgMJlvG2hLK8vTaTQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoSDvGiQKQC/7r4PPleERPmdWoG8uIMN39/Siti
 IjU1gMyb5CJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaEg7xgAKCRDBN2bmhouD
 110hD/4jJB2SuxaT5PB9fySSb4OSXk43iif0GUV+JRpbsLOlXL1dvUFFc+O/gYf2qppQ10L9Nnw
 ZHnw4E60dYCzRvwyFBDtRZkgBjyZnFgiL10/1R6rrSan27IPiJ6CHRIESiFLHUrv3M+dmMscQLB
 DM7wfVkopFxOMgFD9fH1Umw8NNYWAjCy2+U6TyLB6nxaTs6eUUGlEEjEGlE3kXpSIrjaJc86Ozw
 aAHdPqjdeUjDDy4Curi2ymKMnndcbVIxHTf6cK3MbAvCFOyg2rB5GnpRkbbKcvK9ammiZGomvkz
 4aHttLnObh2jN0JE58h1Tt1CPzy3Z2kGZtdYW2qLUp7bdYsEvktu7ee7P3tG6PblW6TPb0CFXCb
 swLjiewCjfsJqkUEFkQ7kQoG1RmTbHmkBLZdP3Y2ejBgDnBr4hLpZeFYn5JTDjYCLHcD1x344rp
 r5q2PDLBE3/kCISSRAJmFrtCk2VQ8B2LkL4kKG/Bf6qKwiV6GUV84m71NncwGD7d8/5fj/oT8VT
 suiV+7oOdh4u9KBXKUoNPOupzq1ve+bEuJJtebx4rpdvNC5SV/iA4ju0oIRQpVrJyMJPRbDznBX
 z9c64HMpEFh9315j52fcSrqX/GV9x+8QrWrVKLszuy5SoASwg2VIp0KGp3QlGmwsaOJLitpB2b5
 mL0CG2i7a0dpuZw==
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

Changes in v6:
1. Print error on pll bias enable/disable imbalance refcnt

Changes in v5:
1. New patch
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h     |  1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 53 +++++++++++++++++++++++++++++++
 2 files changed, 54 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
index 7ea608f620fe17ae4ccc41ba9e52ba043af0c022..82baec385b3224c8b3e36742230d806c4fe68cbb 100644
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
index 4df865dfe6fe111297f0d08199c515d3b5e5a0b6..22f80e99a7a7514085ef80ced1cf78876bcc6ba3 100644
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
 
@@ -361,24 +373,47 @@ static int dsi_pll_7nm_lock_status(struct dsi_pll_7nm *pll)
 
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
 
@@ -519,6 +554,7 @@ static unsigned long dsi_pll_7nm_vco_recalc_rate(struct clk_hw *hw,
 	u32 dec;
 	u64 pll_freq, tmp64;
 
+	dsi_pll_enable_pll_bias(pll_7nm);
 	dec = readl(base + REG_DSI_7nm_PHY_PLL_DECIMAL_DIV_START_1);
 	dec &= 0xff;
 
@@ -543,6 +579,8 @@ static unsigned long dsi_pll_7nm_vco_recalc_rate(struct clk_hw *hw,
 	DBG("DSI PLL%d returning vco rate = %lu, dec = %x, frac = %x",
 	    pll_7nm->phy->id, (unsigned long)vco_rate, dec, frac);
 
+	dsi_pll_disable_pll_bias(pll_7nm);
+
 	return (unsigned long)vco_rate;
 }
 
@@ -578,6 +616,7 @@ static void dsi_7nm_pll_save_state(struct msm_dsi_phy *phy)
 	void __iomem *phy_base = pll_7nm->phy->base;
 	u32 cmn_clk_cfg0, cmn_clk_cfg1;
 
+	dsi_pll_enable_pll_bias(pll_7nm);
 	cached->pll_out_div = readl(pll_7nm->phy->pll_base +
 			REG_DSI_7nm_PHY_PLL_PLL_OUTDIV_RATE);
 	cached->pll_out_div &= 0x3;
@@ -589,6 +628,7 @@ static void dsi_7nm_pll_save_state(struct msm_dsi_phy *phy)
 	cmn_clk_cfg1 = readl(phy_base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
 	cached->pll_mux = FIELD_GET(DSI_7nm_PHY_CMN_CLK_CFG1_DSICLK_SEL__MASK, cmn_clk_cfg1);
 
+	dsi_pll_disable_pll_bias(pll_7nm);
 	DBG("DSI PLL%d outdiv %x bit_clk_div %x pix_clk_div %x pll_mux %x",
 	    pll_7nm->phy->id, cached->pll_out_div, cached->bit_clk_div,
 	    cached->pix_clk_div, cached->pll_mux);
@@ -807,8 +847,10 @@ static int dsi_pll_7nm_init(struct msm_dsi_phy *phy)
 
 	spin_lock_init(&pll_7nm->postdiv_lock);
 	spin_lock_init(&pll_7nm->pclk_mux_lock);
+	spin_lock_init(&pll_7nm->pll_enable_lock);
 
 	pll_7nm->phy = phy;
+	phy->pll_data = pll_7nm;
 
 	ret = pll_7nm_register(pll_7nm, phy->provided_clocks->hws);
 	if (ret) {
@@ -891,8 +933,10 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy,
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
@@ -1000,10 +1044,13 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy,
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
@@ -1115,7 +1162,9 @@ static bool dsi_7nm_set_continuous_clock(struct msm_dsi_phy *phy, bool enable)
 
 static void dsi_7nm_phy_disable(struct msm_dsi_phy *phy)
 {
+	struct dsi_pll_7nm *pll = phy->pll_data;
 	void __iomem *base = phy->base;
+	unsigned long flags;
 	u32 data;
 
 	DBG("");
@@ -1141,8 +1190,12 @@ static void dsi_7nm_phy_disable(struct msm_dsi_phy *phy)
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

