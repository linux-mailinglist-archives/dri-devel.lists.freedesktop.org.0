Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E88EDA36105
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 16:09:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4548A10ECC6;
	Fri, 14 Feb 2025 15:09:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="HptwRa6R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D87510ECC0
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 15:09:09 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-ab7b5308a4dso43749866b.1
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 07:09:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739545748; x=1740150548; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=WpoyP1aRpWJku5O/ebmWUj4BI5NRc8vCFD+rq5oYp8g=;
 b=HptwRa6R+HUEFDY5dra5+jPEvRSh7n6iVSWYXoRldD7oufysp0SFelF2FYdjp5jGfs
 MCS0udkmgqWqWQNPTO2RpLeNNbpd5wll3toD2+VjY0bC3SodW5ReBXblLIMkLcZzBtj/
 uX1qUiwaVvQCjYIvNz0wcoTOk62QhIPcXQ4qB6i4a6vhgGqpCqdSCqtWg1xwD7FyvxPy
 plxMbZk4EGhgPCYRe4Uj25/ZUEoTseOXVfbd/3y+SIQ/rGssYb+Bbs53dK8Q4lT8Damd
 p5zDrY9Y2E6n56/KYq4AZT6BZ9N/GF8jLVDQgWHY5uma2zdaBCt183tEHUK42oKg/V+p
 qRpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739545748; x=1740150548;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WpoyP1aRpWJku5O/ebmWUj4BI5NRc8vCFD+rq5oYp8g=;
 b=WuGGDWsVnjp+sjrm7MCJ/b6s/MoRkJmlltue+QsqnJST5a8HAc4EF5orlm+rN2GLAB
 FSuD9ldf3cw66fHDRsAyw7JBTmJXk6Fe4T5t5sAlmJ6Az46IAgLFnQgfmkGY5bu0U18T
 SPDN1i1R+A86+jseq2Fg7veIcJBYsLYvKusmfUqwS+FBEe0CJw5Q4l1XAIM1MrvNsSSd
 OPjIxd6qVL9MwV9Up9l1LcJ29bw+bqILMsY9m2UYluYHr4x1KrwPwEu7voRfXfttM1ck
 VuKHMF+TaSiQJoZUPLmuyV/3np70LlaWuWNhWRMAyD+ul6FwiDAGRJauYo0FUq7t2A9Z
 mmBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUlrMTM0ItPifVc5jjrK87r7ItMR+8PnqRRpfVD+ONFktJ6jFM9j44EE7RjTg3Z2+akwLJuz+QWxMA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxhU3bgn64zm68HxaMtTugVs9petiPRCyAaUGk7RmrGINsOhaos
 3XHeu6dTgLUTGfelDgrF2wx1Cq66DOrrM/qLpMq7nW5GoDZcc8kyhb2jHkOF9vM=
X-Gm-Gg: ASbGnct98uWhEUaglWUc6s6iy1zDGOGPPHkPzGDJxqCwK4xhdGXsqmG4jUa9vOO+MV3
 Mr7zfrOdkN6zL+VK0egk381yidNRgVWNMRZky9kWBpQpqapbhpIJwcznE1/rBWgsHx91wA3OXKa
 y0mxn33datdy8+6B+zQRJum1azi2aldYSL1dG/cj4nZpA0dSTfWxlRo8ysnoCEbnROMBOuLjZsL
 dlx8Lum+NDzMicBTjDx6LXQwLbMoYcjS8pM/znUn/5XGUX93S1xtYnYsozbegHev8kI5Vsfw6xq
 IncSCaD3kxyj8BpTYjOfjxkFVuYei7s=
X-Google-Smtp-Source: AGHT+IFNOiguXYpTX8lfXBsfBc46gvxa11KhDG2tEU18bJRnmHT//7C6mYWaJDkT8sKQx1QxWy8cgw==
X-Received: by 2002:a17:907:6e9f:b0:ab7:63fa:e33a with SMTP id
 a640c23a62f3a-aba68bf01e8mr139219666b.0.1739545747133; 
 Fri, 14 Feb 2025 07:09:07 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.144])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aba533bf70asm356266766b.180.2025.02.14.07.09.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2025 07:09:06 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 14 Feb 2025 16:08:42 +0100
Subject: [PATCH v3 2/4] drm/msm/dsi/phy: Protect PHY_CMN_CLK_CFG1 against
 clock driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250214-drm-msm-phy-pll-cfg-reg-v3-2-0943b850722c@linaro.org>
References: <20250214-drm-msm-phy-pll-cfg-reg-v3-0-0943b850722c@linaro.org>
In-Reply-To: <20250214-drm-msm-phy-pll-cfg-reg-v3-0-0943b850722c@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jonathan Marek <jonathan@marek.ca>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Rob Clark <robdclark@chromium.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5326;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=6d31yt4/0eptwO5sGCeUjo/cybg3SpE5A04xzTo+AZY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnr1yL+xzURKrXVULWEQh05QUgv0y4Y0lrn+IEx
 5chLHR69UCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ69ciwAKCRDBN2bmhouD
 1yuLD/4p8DmI9eKNYanA+xTsZEo0UJl6ywYkRn28tea7zP+jjDPOfWaCoA4yBHsfrJj6IVmGqD9
 EL6XgU+E0Y1vGWDewD6C3tRqSR+OX7htPd78K4u86nS+SeHOh1Vnzq1hU5/YpkxHyD5hittrKkH
 IrvRoTEIXGRv+df0CsYI9yXbGZ0UJFVwkF469XFNUmSisj4CcyLuewVCKvTndYkgD+R5sm9Ws62
 bxE+Gh9+4nmgTH+zZpO8yJJuPXGuBQ9LifTyJasA//js7UL3qMtGx585J2sa5hetIZpvGoRc2pl
 e9FLSYyNnLBubP47XBP//4RyI9oHvpkoCRh7PmKsKSO35wN9gGIo5I+g/R9F4PKlReFtSUxgiO6
 G3eKRW+zrD4pk5fTHpZuk+lj4rJrDGLmxKc7k3SdK+bAIrlV3fvjUV0+rnCiU8LTJ52NJRDwZ0U
 ypfIbunx/dMQhINA1W2i8waz8DeDjDaxFk0fbuqFtoRPo07miWO3bT/Xon6adIr0rcYUN7WUf00
 Fon88BPiqm4kY+TS6lGIARveHNB/q+pX0orF5U8HR6zleIEPW+QkxlVvCRjV/1c3X5FHtboIAtB
 vDtE5Jnf4ONc8lzr3ceRIaDFiTmj6AvWYBUjj+Qx0xA77NsRKmMEMt0Fb7aqJmANKDvN32cDNmY
 WH8CL8Shbhe7VnQ==
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

PHY_CMN_CLK_CFG1 register is updated by the PHY driver and by a mux
clock from Common Clock Framework:
devm_clk_hw_register_mux_parent_hws().  There could be a path leading to
concurrent and conflicting updates between PHY driver and clock
framework, e.g. changing the mux and enabling PLL clocks.

Add dedicated spinlock to be sure all PHY_CMN_CLK_CFG1 updates are
synchronized.

While shuffling the code, define and use PHY_CMN_CLK_CFG1 bitfields to
make the code more readable and obvious.

Fixes: 1ef7c99d145c ("drm/msm/dsi: add support for 7nm DSI PHY/PLL")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v3:
1. Define bitfields (move here parts from patch #4)

Changes in v2:
1. Store BIT(4) and BIT(5) in local var in dsi_pll_enable_global_clk()
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c          | 35 ++++++++++++++--------
 .../gpu/drm/msm/registers/display/dsi_phy_7nm.xml  |  5 +++-
 2 files changed, 26 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index 25ca649de717eaeec603c520bbaa603ece244d3c..388017db45d802c4ef1299296f932c4182512aae 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -83,6 +83,9 @@ struct dsi_pll_7nm {
 	/* protects REG_DSI_7nm_PHY_CMN_CLK_CFG0 register */
 	spinlock_t postdiv_lock;
 
+	/* protects REG_DSI_7nm_PHY_CMN_CLK_CFG1 register */
+	spinlock_t pclk_mux_lock;
+
 	struct pll_7nm_cached_state cached_state;
 
 	struct dsi_pll_7nm *slave;
@@ -381,22 +384,32 @@ static void dsi_pll_cmn_clk_cfg0_write(struct dsi_pll_7nm *pll, u32 val)
 	spin_unlock_irqrestore(&pll->postdiv_lock, flags);
 }
 
-static void dsi_pll_disable_global_clk(struct dsi_pll_7nm *pll)
+static void dsi_pll_cmn_clk_cfg1_update(struct dsi_pll_7nm *pll, u32 mask,
+					u32 val)
 {
+	unsigned long flags;
 	u32 data;
 
+	spin_lock_irqsave(&pll->pclk_mux_lock, flags);
 	data = readl(pll->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
-	writel(data & ~BIT(5), pll->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
+	data &= ~mask;
+	data |= val & mask;
+
+	writel(data, pll->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
+	spin_unlock_irqrestore(&pll->pclk_mux_lock, flags);
+}
+
+static void dsi_pll_disable_global_clk(struct dsi_pll_7nm *pll)
+{
+	dsi_pll_cmn_clk_cfg1_update(pll, DSI_7nm_PHY_CMN_CLK_CFG1_CLK_EN, 0);
 }
 
 static void dsi_pll_enable_global_clk(struct dsi_pll_7nm *pll)
 {
-	u32 data;
+	u32 cfg_1 = DSI_7nm_PHY_CMN_CLK_CFG1_CLK_EN | DSI_7nm_PHY_CMN_CLK_CFG1_CLK_EN_SEL;
 
 	writel(0x04, pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_3);
-
-	data = readl(pll->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
-	writel(data | BIT(5) | BIT(4), pll->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
+	dsi_pll_cmn_clk_cfg1_update(pll, cfg_1, cfg_1);
 }
 
 static void dsi_pll_phy_dig_reset(struct dsi_pll_7nm *pll)
@@ -574,7 +587,6 @@ static int dsi_7nm_pll_restore_state(struct msm_dsi_phy *phy)
 {
 	struct dsi_pll_7nm *pll_7nm = to_pll_7nm(phy->vco_hw);
 	struct pll_7nm_cached_state *cached = &pll_7nm->cached_state;
-	void __iomem *phy_base = pll_7nm->phy->base;
 	u32 val;
 	int ret;
 
@@ -586,11 +598,7 @@ static int dsi_7nm_pll_restore_state(struct msm_dsi_phy *phy)
 	dsi_pll_cmn_clk_cfg0_write(pll_7nm,
 				   DSI_7nm_PHY_CMN_CLK_CFG0_DIV_CTRL_3_0(cached->bit_clk_div) |
 				   DSI_7nm_PHY_CMN_CLK_CFG0_DIV_CTRL_7_4(cached->pix_clk_div));
-
-	val = readl(phy_base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
-	val &= ~0x3;
-	val |= cached->pll_mux;
-	writel(val, phy_base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
+	dsi_pll_cmn_clk_cfg1_update(pll_7nm, 0x3, cached->pll_mux);
 
 	ret = dsi_pll_7nm_vco_set_rate(phy->vco_hw,
 			pll_7nm->vco_current_rate,
@@ -743,7 +751,7 @@ static int pll_7nm_register(struct dsi_pll_7nm *pll_7nm, struct clk_hw **provide
 					pll_by_2_bit,
 				}), 2, 0, pll_7nm->phy->base +
 					REG_DSI_7nm_PHY_CMN_CLK_CFG1,
-				0, 1, 0, NULL);
+				0, 1, 0, &pll_7nm->pclk_mux_lock);
 		if (IS_ERR(hw)) {
 			ret = PTR_ERR(hw);
 			goto fail;
@@ -788,6 +796,7 @@ static int dsi_pll_7nm_init(struct msm_dsi_phy *phy)
 	pll_7nm_list[phy->id] = pll_7nm;
 
 	spin_lock_init(&pll_7nm->postdiv_lock);
+	spin_lock_init(&pll_7nm->pclk_mux_lock);
 
 	pll_7nm->phy = phy;
 
diff --git a/drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml b/drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml
index e0bf6e016b4ce5b35f73fce7b8e371456b88e3ac..cfaf78c028b1325682889a5c2d8fffd0268122cf 100644
--- a/drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml
+++ b/drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml
@@ -13,7 +13,10 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
 		<bitfield name="DIV_CTRL_3_0" low="0" high="3" type="uint"/>
 		<bitfield name="DIV_CTRL_7_4" low="4" high="7" type="uint"/>
 	</reg32>
-	<reg32 offset="0x00014" name="CLK_CFG1"/>
+	<reg32 offset="0x00014" name="CLK_CFG1">
+		<bitfield name="CLK_EN" pos="5" type="boolean"/>
+		<bitfield name="CLK_EN_SEL" pos="4" type="boolean"/>
+	</reg32>
 	<reg32 offset="0x00018" name="GLBL_CTRL"/>
 	<reg32 offset="0x0001c" name="RBUF_CTRL"/>
 	<reg32 offset="0x00020" name="VREG_CTRL_0"/>

-- 
2.43.0

