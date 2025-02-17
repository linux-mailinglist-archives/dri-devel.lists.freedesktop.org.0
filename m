Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B591A38255
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 12:53:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 523B110E43F;
	Mon, 17 Feb 2025 11:53:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Zn7d0oC3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01F9510E438
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 11:53:29 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-43979038df6so1045165e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 03:53:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739793207; x=1740398007; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=rWmUpWyrE1eFyVx0zffSJlvaDmfJ0SMAFHZs9MJfKYI=;
 b=Zn7d0oC3gZJE4jJvk5DUHV9GbE8oykLaUpp593IiFi171paaJxgsZMA8A7mGm74Vpl
 kKil4sGSMHE1TgAyBsPYtIKMMxea0W2LQfTMTVmm6GDHXeMgu9Y7ljIZx23HOnNwXaX3
 jcu1drXRMX0Xbk6qJ2yFyBo7FXq5HvpTB/NVAbfIoVSvrQQJsYtjCsuOSTAedqMoP5Kp
 nRZekHHoubnXeStvrsEXomDnPpZfdv53GVHzSQxFtdkDiJ/z9Uk/s9A+ETT5JO3gN3hb
 kpyN6r9gOGHY9mNXyB+UXBymII0q5YmmO6iwxOl0cVI2CKTddtueIvzgcnhbh/fpDeNT
 ujZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739793207; x=1740398007;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rWmUpWyrE1eFyVx0zffSJlvaDmfJ0SMAFHZs9MJfKYI=;
 b=r/6GphP/4UVw/Qb08Hck3FPoNdfThdII58+80+95diJaWw7LssM2JMY74VHL9QWzui
 XqeXyVSCqtEo1W5C1jA3dWiy+cfaHxVaapn7Fk3/yr8HDPm3SiPYxyiDddXmTY+nafEC
 x7Sq4b5jFwhEMTrMJu8Ou3GTsk4TkHIcbhF0yOAgPKt50I1tjxXNW84RplPPWdxq58vn
 NiCIBk4dqrU9BckCJMx37GzsOfZgo8hVVDpeqk6h3vsuSyBTRB0b1WntVcJchv4V+i0F
 3Ers/DP91xfMVuO+fYtfnnOMW6rKp9SgO+QHrOLJO4xRt7H8+hSUYzi3Cj9qVYMBt/y6
 HSaQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKHEoj6nqelGthaRYJSHN/yPAWQy4wy+oBr5YGTsc2Chgd5xbbd4KTI5a3Q77nogqxUg9w59NZ/8s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywu2F0EVNPv2KUlqHGfohTDYIwTsvTjb3bHpHg6gGINvcTFNurU
 744LFbtMfOkWGUA83/bzNh/kVstQ7/fGvdZUX+X5IsXxEetjFfk/T6pKG9fklSk=
X-Gm-Gg: ASbGncuU1n2gZRENNxkO9LMPr1nClkUzcV4S8EWwcNUptiHN38iryQnglLWY7KKTpHI
 TiHeYwa5X2lLNDrbuOrgmpKXk39OE5RFinZn0RsvjGj0sVmw3HwBVW/aF+8Soe7TTpM0yon9cIv
 Qg6x2pfr2be9Oi+tjIPW6aj3q0amsupSV9wKHcZe8P5HfqLT4FBgOz/ezIPNtOrW5rx36f1C/aT
 UrSfqZ7SgGcoWFHKkxSCGaCxq7s+R9/G2/JRxuS8t6lzSshnD77qPwKvFWz/rAUGmpoTEgAWY3o
 PT/KzTFMt6WWcnVck84ipHW/a2lUG3c=
X-Google-Smtp-Source: AGHT+IEpqJgGoiNouVEBinoSlxzWDrCXnZfB8FaV8pAohFqj/o2Rl50/1emoQ/bdbrtDxEfbHaNIPQ==
X-Received: by 2002:a05:600c:4611:b0:439:8c80:6af3 with SMTP id
 5b1f17b1804b1-4398c806dcamr4218225e9.8.1739793207551; 
 Mon, 17 Feb 2025 03:53:27 -0800 (PST)
Received: from [127.0.1.1] ([178.197.206.225])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4395a1b8397sm150212575e9.36.2025.02.17.03.53.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 03:53:27 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 17 Feb 2025 12:53:15 +0100
Subject: [PATCH v4 2/4] drm/msm/dsi/phy: Protect PHY_CMN_CLK_CFG1 against
 clock driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250217-drm-msm-phy-pll-cfg-reg-v4-2-106b0d1df51e@linaro.org>
References: <20250217-drm-msm-phy-pll-cfg-reg-v4-0-106b0d1df51e@linaro.org>
In-Reply-To: <20250217-drm-msm-phy-pll-cfg-reg-v4-0-106b0d1df51e@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5441;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=JDa2rufW4GrwAH1og6yrejuXIhY3lQbcXiG2vjBVULk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnsyMvKhzTG7p5hIu1DyXtjncScjmy2NVL7bNxB
 dCbQx/Xs1iJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ7MjLwAKCRDBN2bmhouD
 1w1mD/4+hN+MoWY8h+0Oz8p1Zy+XrCbiPsqhtlTwRDDxZ6r561qTxlUcb+kG4Z6Dqz0U696Bcop
 CJTTqbNxGKIW2OeWCpOadGSJT4qDrBbsiFocY1oeWKSG1C6b4q4hW6uii63NRhb3aD8J5Of/dGH
 LeXNS6rNnK8VIJyEenFvM7h67CULUfQbRnNqNc5iQ+CN7NsASC08j/4yquoholWmb6ao4ckqao1
 lxrX3muDfxCFAt5p50j5Zr9z6b/wn88Yf9jgtrineIz2wsOpmcAVmIFVSpK6/1NyLv2rbNyCvKp
 CmOc2EXGFQ/zhN0wQ7+V75TefYs9Rbvzt7OAppYksGqb4lZzzKeCTNatHJ6ARpkvvwPOtUM1rpG
 nkTlcCUkMx7JOFNfBrhFsVQKkakoZ9OEdiJOF0ldR2/McKm8QevkVC2A0cIdZWNImz9cVIT5GqM
 KugKstXy+4xyZ7BOlPXTGvtZhw+97425GFk24pKFA+oWB69RnXuX4npp1cLGlgZKCw311ApPU1H
 u7o9gGv5UPC3waR1TlZ/RNTWYY/vf+NJRBPLBbv3/hRkZG1IZq3bFrpUXVKmTpdzAy2Aml9zkQw
 0LY1tQLxefSOsFuPMkPL91hL6DZnKWY21jgR710hSdVoDQwcXjfsRoiHb5Xxj5T/XTcmrIIIZEd
 wTezgW5/isw+Umw==
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
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
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

