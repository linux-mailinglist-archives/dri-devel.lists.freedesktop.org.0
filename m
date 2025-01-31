Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0CEAA23F5F
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2025 16:03:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D52E10EADA;
	Fri, 31 Jan 2025 15:03:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="g93R6wj1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0BA110EAD8
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2025 15:03:25 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-436381876e2so2833055e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2025 07:03:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738335804; x=1738940604; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=4h/tBpBjpFYt6cfG0kP8Ocw563Sweo8KNaY+K0HOhqg=;
 b=g93R6wj1R0lf3FCxYi1+nWs8Sj1QYvFyan1QqKxxL6Jc2pRpPzFEnkJNzzhfiIRTMQ
 9CUw/MWwJgLuFGtOpy2x/c/KRfEedJaLicZJ9NwQqD+UtWovL/Dymk9Kgin6iVCDU2kj
 ckMFYrAN/SRmz4HHz3f+d1Z5Cyo30zFCSFmkRF4HQ3VAbVNwrfMSkEw3GQDXrmMSZVcJ
 WMmZzn7vQoWk5SeY81CPPyCJqH1b2BkpvytagMKKMWl+CDtCiZ4C0MXYdLXLMaLYqB99
 JvWjyT1Nx9bqkmo8SojRnEJ9HN/kGx7Brb2PsnVe7hJStz9YQEbTQHyaMl76jyJOh00u
 rxsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738335804; x=1738940604;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4h/tBpBjpFYt6cfG0kP8Ocw563Sweo8KNaY+K0HOhqg=;
 b=ibososl0GXLjDHPMosS0eM1Ct5ASoucBZYMpTyTgxmBr6L/Q/G4eheLWbtEMXGfFsr
 IAWj9zy/l/1cV/Jgy4AufWr9CJrFGVPKVSTzPKLuIBzRStaA+sM4i+lEGfXj43pEqWlC
 E9h/xIJcFk5C2vzy2FjtBbZfIHm25+DfVPi0Wza05Ob84UHA18uilN0XObG/NOqHY4Hs
 OmDqftX6BGWyDDlOBGWT6kMrrZ6HMsASHdXfWbwizjQZtuO64xbL9o7gZtJAacGJAoLa
 07BTWD8IH+68BxqtO/Uz3QtrFpKIEoePY/mwiPJHQAm1dBAAQ7OvfqFRMnXup2f4z5mS
 RC1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXPJ9rEH1cyF1MuLhdjq8P91r8wtWNUUG5T6edgyHOd39JguoDcwjiWHVQh8HgMcGpOHBIdVjFIemA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwnT/z6Gf8GdtOESKeuuNd9CVxw6gTdcWFvABdskdQJ/0knJ+sg
 04Ort75IL2qGDnYjJVwqvMrTAioGUl1filB7K0lzXv+EJUYg1UBIjJy3wKkZyHI=
X-Gm-Gg: ASbGncvQ34XQbXIhpoNkLsZgIsgDLTmF5ej5mu5AUTdKbeEgPdade4stY9j6JYXLYQq
 SXoRfwY54gPaNf15dL9z8Kn4LpJ+LyJtzJcfyMcpkpNN07ZXntmiFhNW3S9v+Z8c/YF/hQlRCgw
 tviOkAqTBKR6X47sCp1yqV1GXm/OBVoqHkjHVim7fTCqV3hMmVHWwr2jBw18IZNPUrjdO7L6drP
 Vfmiae6QFe537P9roWEOBKc9P0rS7FpO+o0kPYfInaCOGrd0l/J0hbBDyg1rX2tWDxY9zne3X4r
 45A+Ygy8G8QuTjrGscCsN/kNTQEAz0s=
X-Google-Smtp-Source: AGHT+IGt/Ma1+xcecSjAs+tIN0S9176VFMEJoZh0tWzQpjFDOP83vGEsqq8F/1t/+/uO38xWoiotQQ==
X-Received: by 2002:a05:600c:1c94:b0:42c:aeee:80a with SMTP id
 5b1f17b1804b1-438e183fecfmr30041345e9.7.1738335802809; 
 Fri, 31 Jan 2025 07:03:22 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.144])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438e245efbcsm56679925e9.33.2025.01.31.07.03.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jan 2025 07:03:22 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 31 Jan 2025 16:02:51 +0100
Subject: [PATCH 2/3] drm/msm/dsi/phy: Protect PHY_CMN_CLK_CFG1 against
 clock driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250131-drm-msm-phy-pll-cfg-reg-v1-2-3b99efeb2e8d@linaro.org>
References: <20250131-drm-msm-phy-pll-cfg-reg-v1-0-3b99efeb2e8d@linaro.org>
In-Reply-To: <20250131-drm-msm-phy-pll-cfg-reg-v1-0-3b99efeb2e8d@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3807;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=MzjWwbzWIs8H1LDVE5c7k4kuxK5nlvhG1DNnOpxI2Ws=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnnOYz5iDHf4Qp20YJL5Udj223hj4lS787xPTNp
 gaRdf1GgciJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ5zmMwAKCRDBN2bmhouD
 14m0D/0TkOdX7O2JJNLdgRDCRNTqbqeEHBXzU2CW4U2CqKnMqlYR11fm4SNRjb2lGhLO6uReKsp
 XtbxR9n8y7E41NScMxHH1OhgTZ1PCjPA4j74nMRVl4NnATy/HjnM5viCLZVTtDOizYXTELLmR5n
 RjW7EWK/RVgGGcrFmpiWKOFHPsYVm6OP0ifu/9nwMSHUnoJPCTb+bTnPHxFunDh953Yq4bKZQNv
 aFUE3jCtlt7mW1wN/rWFZ2YkMgUBzocomJ2vGw5yKBm2fMA7LsuEXbguVTfkcQsN5LwzUHiW/us
 pBgwU5Gbc3NKrQRwRd7Om3LTx9+kLRGgJtp7CoTL8FzOQooEV3eklb767VX6nKJcVJXw23Uia22
 4EMD6j1zjIcyN35Cl4NDiGoPVcY55CwBJfplyYePtrtLyII6wnlQvUWu+lLOcThXcWmUAgMzUIm
 0aV0CyY1MRbo8low9GeH99bNc3XQc4uqtPvPGwy9acLUX6PiduZbF+UJUTfMbP8fw6/fu6+ks1Y
 bJwYEPwZ/U+ZRGl0m0eKMUw4vR8Mcm9WvAmxTwqrXJM3tJQpUjpZTyz6LJX3VwctKQaEioCgJa7
 NMrQ7cDPK4GrtzOx3mM5ZGTuQ/1tKKuJZm21addbAJvQoBxpq4Jf5wNcyjBIBVYWPswBumI49hB
 W4ZFi7pu8eAncyg==
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

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 34 +++++++++++++++++++------------
 1 file changed, 21 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index c164f845653816291ad96c863257f75462ef58e7..6c18b9c0e1903bbd0090aceef13ae8c6f2e080ce 100644
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
@@ -381,22 +384,31 @@ static void dsi_pll_cmn_clk_cfg0_write(struct dsi_pll_7nm *pll, u32 val)
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
+	dsi_pll_cmn_clk_cfg1_update(pll, BIT(5), 0);
 }
 
 static void dsi_pll_enable_global_clk(struct dsi_pll_7nm *pll)
 {
-	u32 data;
-
 	writel(0x04, pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_3);
 
-	data = readl(pll->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
-	writel(data | BIT(5) | BIT(4), pll->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
+	dsi_pll_cmn_clk_cfg1_update(pll, BIT(5) | BIT(4), BIT(5) | BIT(4));
 }
 
 static void dsi_pll_phy_dig_reset(struct dsi_pll_7nm *pll)
@@ -574,7 +586,6 @@ static int dsi_7nm_pll_restore_state(struct msm_dsi_phy *phy)
 {
 	struct dsi_pll_7nm *pll_7nm = to_pll_7nm(phy->vco_hw);
 	struct pll_7nm_cached_state *cached = &pll_7nm->cached_state;
-	void __iomem *phy_base = pll_7nm->phy->base;
 	u32 val;
 	int ret;
 
@@ -585,11 +596,7 @@ static int dsi_7nm_pll_restore_state(struct msm_dsi_phy *phy)
 
 	dsi_pll_cmn_clk_cfg0_write(pll_7nm,
 				   cached->bit_clk_div | (cached->pix_clk_div << 4));
-
-	val = readl(phy_base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
-	val &= ~0x3;
-	val |= cached->pll_mux;
-	writel(val, phy_base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
+	dsi_pll_cmn_clk_cfg1_update(pll_7nm, 0x3, cached->pll_mux);
 
 	ret = dsi_pll_7nm_vco_set_rate(phy->vco_hw,
 			pll_7nm->vco_current_rate,
@@ -742,7 +749,7 @@ static int pll_7nm_register(struct dsi_pll_7nm *pll_7nm, struct clk_hw **provide
 					pll_by_2_bit,
 				}), 2, 0, pll_7nm->phy->base +
 					REG_DSI_7nm_PHY_CMN_CLK_CFG1,
-				0, 1, 0, NULL);
+				0, 1, 0, &pll_7nm->pclk_mux_lock);
 		if (IS_ERR(hw)) {
 			ret = PTR_ERR(hw);
 			goto fail;
@@ -787,6 +794,7 @@ static int dsi_pll_7nm_init(struct msm_dsi_phy *phy)
 	pll_7nm_list[phy->id] = pll_7nm;
 
 	spin_lock_init(&pll_7nm->postdiv_lock);
+	spin_lock_init(&pll_7nm->pclk_mux_lock);
 
 	pll_7nm->phy = phy;
 

-- 
2.43.0

