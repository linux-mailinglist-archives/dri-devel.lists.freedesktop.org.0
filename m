Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F01834FE88
	for <lists+dri-devel@lfdr.de>; Wed, 31 Mar 2021 12:58:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EE5089F75;
	Wed, 31 Mar 2021 10:58:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70CC26E1A3
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 10:57:58 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id 184so23281602ljf.9
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 03:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NcPiY6v3P7D6OHEZ9p95CveWIVaMFZGkhfjjUAZZn2U=;
 b=q2+LwHyMpPruM8wBFsPVIt4JQXFSX6jBjPuhmURCx18GkJyGP8maZ43WipTr5jzB22
 9uCWHsRJ37YTvtAIW4F/0vJImJP9HtiZT5fbar4q5GVNueOKVWWadk2ns1zZPdBgeUxI
 D/CW5Z8MivauGWzen7M8fi5IKhiv6nCbLGhe5kTzXo5fIq7blnaaR3y4lnfYqVdb1Lcv
 plXj6g0EyKHx0mbeTEorGPnBMTM4vhIiN/9Z+tM19OALWVNz3cZAJMB6RDHqFNR36L6J
 GGkEnOGxXbAgY9o9unI6yqQe0CRwkZbpCn3DkPlnJXzeopqmNm8pKKxZTyspb1jb7YU0
 9N8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NcPiY6v3P7D6OHEZ9p95CveWIVaMFZGkhfjjUAZZn2U=;
 b=bOXRRSm43G6SJsrmw0QcK6A0TdM0/DqQvEcf1FpA8juNdDI9k0yI1vGi2zRgcmi9fo
 3YxNHIKIX6L6lSMErQCKdZjcV5fMCvsRTJ2lVsicEvhNe4PsCbPfB2x7BHgVFEcispmi
 wWEZmkQzXBbLDP5dArHiA1WK+1lTdU52SbD2NZ/hSJiNJDLq1LSV8bFzvKzf6j6axfZ1
 JtzrPoQLFOMCS9y3iwkX+JbaWjYVtEd8QhI91s4ks/FyDhsiUgDmO92M8HDDgaSxrhPD
 miFpWXd1fNeorEBPKffBQH/L2kNpnIDa1v/jGMeXAGouvUGZzeEUOx+plS59UlQ4CfiN
 VZbA==
X-Gm-Message-State: AOAM531UlVtaZhGXxWVlUNLUlBxUt+9Rl0SwtPPrmrmN3HejTmRNSh3H
 Tr/rnNCb9MGnQ6jXoVzRDLNNig==
X-Google-Smtp-Source: ABdhPJzJntrEyIp1zYv8aAZJ4SwCD7SsV7dK7Nz6V19tqJ1qCCeHLgF2OmEhb/wxFw6oggTvkqYrlg==
X-Received: by 2002:a2e:b6d4:: with SMTP id m20mr1714366ljo.448.1617188276682; 
 Wed, 31 Mar 2021 03:57:56 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id h3sm184359ljc.67.2021.03.31.03.57.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Mar 2021 03:57:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Jonathan Marek <jonathan@marek.ca>,
 Michael Turquette <mturquette@baylibre.com>
Subject: [PATCH v4 21/24] drm/msm/dsi: remove duplicate fields from
 dsi_pll_Nnm instances
Date: Wed, 31 Mar 2021 13:57:32 +0300
Message-Id: <20210331105735.3690009-22-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210331105735.3690009-1-dmitry.baryshkov@linaro.org>
References: <20210331105735.3690009-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
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
Cc: Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 David Airlie <airlied@linux.ie>, freedreno@lists.freedesktop.org,
 linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Drop duplicate fields pdev and id from dsi_pll_Nnm instances. Reuse
those fields from the provided msm_dsi_phy.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
Tested-by: Stephen Boyd <swboyd@chromium.org> # on sc7180 lazor
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c    | 72 +++++++++----------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c    | 54 +++++++-------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c    | 48 ++++++-------
 .../gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c   | 26 +++----
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c     | 68 ++++++++----------
 5 files changed, 119 insertions(+), 149 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
index ef92c3f38a9a..34c1c216e738 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
@@ -86,9 +86,6 @@ struct pll_10nm_cached_state {
 struct dsi_pll_10nm {
 	struct clk_hw clk_hw;
 
-	int id;
-	struct platform_device *pdev;
-
 	struct msm_dsi_phy *phy;
 
 	u64 vco_ref_clk_rate;
@@ -301,7 +298,7 @@ static int dsi_pll_10nm_vco_set_rate(struct clk_hw *hw, unsigned long rate,
 {
 	struct dsi_pll_10nm *pll_10nm = to_pll_10nm(hw);
 
-	DBG("DSI PLL%d rate=%lu, parent's=%lu", pll_10nm->id, rate,
+	DBG("DSI PLL%d rate=%lu, parent's=%lu", pll_10nm->phy->id, rate,
 	    parent_rate);
 
 	pll_10nm->vco_current_rate = rate;
@@ -327,7 +324,7 @@ static int dsi_pll_10nm_vco_set_rate(struct clk_hw *hw, unsigned long rate,
 
 static int dsi_pll_10nm_lock_status(struct dsi_pll_10nm *pll)
 {
-	struct device *dev = &pll->pdev->dev;
+	struct device *dev = &pll->phy->pdev->dev;
 	int rc;
 	u32 status = 0;
 	u32 const delay_us = 100;
@@ -341,7 +338,7 @@ static int dsi_pll_10nm_lock_status(struct dsi_pll_10nm *pll)
 				       timeout_us);
 	if (rc)
 		DRM_DEV_ERROR(dev, "DSI PLL(%d) lock failed, status=0x%08x\n",
-			      pll->id, status);
+			      pll->phy->id, status);
 
 	return rc;
 }
@@ -387,7 +384,7 @@ static void dsi_pll_enable_global_clk(struct dsi_pll_10nm *pll)
 static int dsi_pll_10nm_vco_prepare(struct clk_hw *hw)
 {
 	struct dsi_pll_10nm *pll_10nm = to_pll_10nm(hw);
-	struct device *dev = &pll_10nm->pdev->dev;
+	struct device *dev = &pll_10nm->phy->pdev->dev;
 	int rc;
 
 	dsi_pll_enable_pll_bias(pll_10nm);
@@ -413,7 +410,7 @@ static int dsi_pll_10nm_vco_prepare(struct clk_hw *hw)
 	/* Check for PLL lock */
 	rc = dsi_pll_10nm_lock_status(pll_10nm);
 	if (rc) {
-		DRM_DEV_ERROR(dev, "PLL(%d) lock failed\n", pll_10nm->id);
+		DRM_DEV_ERROR(dev, "PLL(%d) lock failed\n", pll_10nm->phy->id);
 		goto error;
 	}
 
@@ -494,7 +491,7 @@ static unsigned long dsi_pll_10nm_vco_recalc_rate(struct clk_hw *hw,
 	vco_rate = pll_freq;
 
 	DBG("DSI PLL%d returning vco rate = %lu, dec = %x, frac = %x",
-	    pll_10nm->id, (unsigned long)vco_rate, dec, frac);
+	    pll_10nm->phy->id, (unsigned long)vco_rate, dec, frac);
 
 	return (unsigned long)vco_rate;
 }
@@ -543,7 +540,7 @@ static void dsi_10nm_pll_save_state(struct msm_dsi_phy *phy)
 	cached->pll_mux = cmn_clk_cfg1 & 0x3;
 
 	DBG("DSI PLL%d outdiv %x bit_clk_div %x pix_clk_div %x pll_mux %x",
-	    pll_10nm->id, cached->pll_out_div, cached->bit_clk_div,
+	    pll_10nm->phy->id, cached->pll_out_div, cached->bit_clk_div,
 	    cached->pix_clk_div, cached->pll_mux);
 }
 
@@ -572,12 +569,12 @@ static int dsi_10nm_pll_restore_state(struct msm_dsi_phy *phy)
 			pll_10nm->vco_current_rate,
 			pll_10nm->vco_ref_clk_rate);
 	if (ret) {
-		DRM_DEV_ERROR(&pll_10nm->pdev->dev,
+		DRM_DEV_ERROR(&pll_10nm->phy->pdev->dev,
 			"restore vco rate failed. ret=%d\n", ret);
 		return ret;
 	}
 
-	DBG("DSI PLL%d", pll_10nm->id);
+	DBG("DSI PLL%d", pll_10nm->phy->id);
 
 	return 0;
 }
@@ -588,13 +585,13 @@ static int dsi_10nm_set_usecase(struct msm_dsi_phy *phy)
 	void __iomem *base = phy->base;
 	u32 data = 0x0;	/* internal PLL */
 
-	DBG("DSI PLL%d", pll_10nm->id);
+	DBG("DSI PLL%d", pll_10nm->phy->id);
 
 	switch (phy->usecase) {
 	case MSM_DSI_PHY_STANDALONE:
 		break;
 	case MSM_DSI_PHY_MASTER:
-		pll_10nm->slave = pll_10nm_list[(pll_10nm->id + 1) % DSI_MAX];
+		pll_10nm->slave = pll_10nm_list[(pll_10nm->phy->id + 1) % DSI_MAX];
 		break;
 	case MSM_DSI_PHY_SLAVE:
 		data = 0x1; /* external PLL */
@@ -626,21 +623,21 @@ static int pll_10nm_register(struct dsi_pll_10nm *pll_10nm, struct clk_hw **prov
 		.flags = CLK_IGNORE_UNUSED,
 		.ops = &clk_ops_dsi_pll_10nm_vco,
 	};
-	struct device *dev = &pll_10nm->pdev->dev;
+	struct device *dev = &pll_10nm->phy->pdev->dev;
 	struct clk_hw *hw;
 	int ret;
 
-	DBG("DSI%d", pll_10nm->id);
+	DBG("DSI%d", pll_10nm->phy->id);
 
-	snprintf(vco_name, 32, "dsi%dvco_clk", pll_10nm->id);
+	snprintf(vco_name, 32, "dsi%dvco_clk", pll_10nm->phy->id);
 	pll_10nm->clk_hw.init = &vco_init;
 
 	ret = devm_clk_hw_register(dev, &pll_10nm->clk_hw);
 	if (ret)
 		return ret;
 
-	snprintf(clk_name, 32, "dsi%d_pll_out_div_clk", pll_10nm->id);
-	snprintf(parent, 32, "dsi%dvco_clk", pll_10nm->id);
+	snprintf(clk_name, 32, "dsi%d_pll_out_div_clk", pll_10nm->phy->id);
+	snprintf(parent, 32, "dsi%dvco_clk", pll_10nm->phy->id);
 
 	hw = devm_clk_hw_register_divider(dev, clk_name,
 				     parent, CLK_SET_RATE_PARENT,
@@ -652,8 +649,8 @@ static int pll_10nm_register(struct dsi_pll_10nm *pll_10nm, struct clk_hw **prov
 		goto fail;
 	}
 
-	snprintf(clk_name, 32, "dsi%d_pll_bit_clk", pll_10nm->id);
-	snprintf(parent, 32, "dsi%d_pll_out_div_clk", pll_10nm->id);
+	snprintf(clk_name, 32, "dsi%d_pll_bit_clk", pll_10nm->phy->id);
+	snprintf(parent, 32, "dsi%d_pll_out_div_clk", pll_10nm->phy->id);
 
 	/* BIT CLK: DIV_CTRL_3_0 */
 	hw = devm_clk_hw_register_divider(dev, clk_name, parent,
@@ -667,8 +664,8 @@ static int pll_10nm_register(struct dsi_pll_10nm *pll_10nm, struct clk_hw **prov
 		goto fail;
 	}
 
-	snprintf(clk_name, 32, "dsi%d_phy_pll_out_byteclk", pll_10nm->id);
-	snprintf(parent, 32, "dsi%d_pll_bit_clk", pll_10nm->id);
+	snprintf(clk_name, 32, "dsi%d_phy_pll_out_byteclk", pll_10nm->phy->id);
+	snprintf(parent, 32, "dsi%d_pll_bit_clk", pll_10nm->phy->id);
 
 	/* DSI Byte clock = VCO_CLK / OUT_DIV / BIT_DIV / 8 */
 	hw = devm_clk_hw_register_fixed_factor(dev, clk_name, parent,
@@ -680,8 +677,8 @@ static int pll_10nm_register(struct dsi_pll_10nm *pll_10nm, struct clk_hw **prov
 
 	provided_clocks[DSI_BYTE_PLL_CLK] = hw;
 
-	snprintf(clk_name, 32, "dsi%d_pll_by_2_bit_clk", pll_10nm->id);
-	snprintf(parent, 32, "dsi%d_pll_bit_clk", pll_10nm->id);
+	snprintf(clk_name, 32, "dsi%d_pll_by_2_bit_clk", pll_10nm->phy->id);
+	snprintf(parent, 32, "dsi%d_pll_bit_clk", pll_10nm->phy->id);
 
 	hw = devm_clk_hw_register_fixed_factor(dev, clk_name, parent,
 					  0, 1, 2);
@@ -690,8 +687,8 @@ static int pll_10nm_register(struct dsi_pll_10nm *pll_10nm, struct clk_hw **prov
 		goto fail;
 	}
 
-	snprintf(clk_name, 32, "dsi%d_pll_post_out_div_clk", pll_10nm->id);
-	snprintf(parent, 32, "dsi%d_pll_out_div_clk", pll_10nm->id);
+	snprintf(clk_name, 32, "dsi%d_pll_post_out_div_clk", pll_10nm->phy->id);
+	snprintf(parent, 32, "dsi%d_pll_out_div_clk", pll_10nm->phy->id);
 
 	hw = devm_clk_hw_register_fixed_factor(dev, clk_name, parent,
 					  0, 1, 4);
@@ -700,11 +697,11 @@ static int pll_10nm_register(struct dsi_pll_10nm *pll_10nm, struct clk_hw **prov
 		goto fail;
 	}
 
-	snprintf(clk_name, 32, "dsi%d_pclk_mux", pll_10nm->id);
-	snprintf(parent, 32, "dsi%d_pll_bit_clk", pll_10nm->id);
-	snprintf(parent2, 32, "dsi%d_pll_by_2_bit_clk", pll_10nm->id);
-	snprintf(parent3, 32, "dsi%d_pll_out_div_clk", pll_10nm->id);
-	snprintf(parent4, 32, "dsi%d_pll_post_out_div_clk", pll_10nm->id);
+	snprintf(clk_name, 32, "dsi%d_pclk_mux", pll_10nm->phy->id);
+	snprintf(parent, 32, "dsi%d_pll_bit_clk", pll_10nm->phy->id);
+	snprintf(parent2, 32, "dsi%d_pll_by_2_bit_clk", pll_10nm->phy->id);
+	snprintf(parent3, 32, "dsi%d_pll_out_div_clk", pll_10nm->phy->id);
+	snprintf(parent4, 32, "dsi%d_pll_post_out_div_clk", pll_10nm->phy->id);
 
 	hw = devm_clk_hw_register_mux(dev, clk_name,
 				 ((const char *[]){
@@ -717,8 +714,8 @@ static int pll_10nm_register(struct dsi_pll_10nm *pll_10nm, struct clk_hw **prov
 		goto fail;
 	}
 
-	snprintf(clk_name, 32, "dsi%d_phy_pll_out_dsiclk", pll_10nm->id);
-	snprintf(parent, 32, "dsi%d_pclk_mux", pll_10nm->id);
+	snprintf(clk_name, 32, "dsi%d_phy_pll_out_dsiclk", pll_10nm->phy->id);
+	snprintf(parent, 32, "dsi%d_pclk_mux", pll_10nm->phy->id);
 
 	/* PIX CLK DIV : DIV_CTRL_7_4*/
 	hw = devm_clk_hw_register_divider(dev, clk_name, parent,
@@ -743,7 +740,6 @@ static int pll_10nm_register(struct dsi_pll_10nm *pll_10nm, struct clk_hw **prov
 static int dsi_pll_10nm_init(struct msm_dsi_phy *phy)
 {
 	struct platform_device *pdev = phy->pdev;
-	int id = phy->id;
 	struct dsi_pll_10nm *pll_10nm;
 	int ret;
 
@@ -751,11 +747,9 @@ static int dsi_pll_10nm_init(struct msm_dsi_phy *phy)
 	if (!pll_10nm)
 		return -ENOMEM;
 
-	DBG("DSI PLL%d", id);
+	DBG("DSI PLL%d", phy->id);
 
-	pll_10nm->pdev = pdev;
-	pll_10nm->id = id;
-	pll_10nm_list[id] = pll_10nm;
+	pll_10nm_list[phy->id] = pll_10nm;
 
 	spin_lock_init(&pll_10nm->postdiv_lock);
 
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
index 56d63d53b6a5..dcd51f46fb55 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
@@ -115,9 +115,6 @@ struct pll_14nm_cached_state {
 struct dsi_pll_14nm {
 	struct clk_hw clk_hw;
 
-	int id;
-	struct platform_device *pdev;
-
 	struct msm_dsi_phy *phy;
 
 	struct dsi_pll_input in;
@@ -498,7 +495,7 @@ static void pll_db_commit_14nm(struct dsi_pll_14nm *pll,
 	void __iomem *cmn_base = pll->phy->base;
 	u8 data;
 
-	DBG("DSI%d PLL", pll->id);
+	DBG("DSI%d PLL", pll->phy->id);
 
 	data = pout->cmn_ldo_cntrl;
 	dsi_phy_write(cmn_base + REG_DSI_14nm_PHY_CMN_LDO_CNTRL, data);
@@ -565,7 +562,7 @@ static int dsi_pll_14nm_vco_set_rate(struct clk_hw *hw, unsigned long rate,
 	struct dsi_pll_input *pin = &pll_14nm->in;
 	struct dsi_pll_output *pout = &pll_14nm->out;
 
-	DBG("DSI PLL%d rate=%lu, parent's=%lu", pll_14nm->id, rate,
+	DBG("DSI PLL%d rate=%lu, parent's=%lu", pll_14nm->phy->id, rate,
 	    parent_rate);
 
 	pll_14nm->vco_current_rate = rate;
@@ -666,7 +663,7 @@ static int dsi_pll_14nm_vco_prepare(struct clk_hw *hw)
 					 POLL_TIMEOUT_US);
 
 	if (unlikely(!locked)) {
-		DRM_DEV_ERROR(&pll_14nm->pdev->dev, "DSI PLL lock failed\n");
+		DRM_DEV_ERROR(&pll_14nm->phy->pdev->dev, "DSI PLL lock failed\n");
 		return -EINVAL;
 	}
 
@@ -726,7 +723,7 @@ static unsigned long dsi_pll_14nm_postdiv_recalc_rate(struct clk_hw *hw,
 	u8 width = postdiv->width;
 	u32 val;
 
-	DBG("DSI%d PLL parent rate=%lu", pll_14nm->id, parent_rate);
+	DBG("DSI%d PLL parent rate=%lu", pll_14nm->phy->id, parent_rate);
 
 	val = dsi_phy_read(base + REG_DSI_14nm_PHY_CMN_CLK_CFG0) >> shift;
 	val &= div_mask(width);
@@ -742,7 +739,7 @@ static long dsi_pll_14nm_postdiv_round_rate(struct clk_hw *hw,
 	struct dsi_pll_14nm_postdiv *postdiv = to_pll_14nm_postdiv(hw);
 	struct dsi_pll_14nm *pll_14nm = postdiv->pll;
 
-	DBG("DSI%d PLL parent rate=%lu", pll_14nm->id, rate);
+	DBG("DSI%d PLL parent rate=%lu", pll_14nm->phy->id, rate);
 
 	return divider_round_rate(hw, rate, prate, NULL,
 				  postdiv->width,
@@ -762,7 +759,7 @@ static int dsi_pll_14nm_postdiv_set_rate(struct clk_hw *hw, unsigned long rate,
 	unsigned long flags = 0;
 	u32 val;
 
-	DBG("DSI%d PLL parent rate=%lu parent rate %lu", pll_14nm->id, rate,
+	DBG("DSI%d PLL parent rate=%lu parent rate %lu", pll_14nm->phy->id, rate,
 	    parent_rate);
 
 	value = divider_get_val(rate, parent_rate, NULL, postdiv->width,
@@ -813,7 +810,7 @@ static void dsi_14nm_pll_save_state(struct msm_dsi_phy *phy)
 	cached_state->n1postdiv = data & 0xf;
 	cached_state->n2postdiv = (data >> 4) & 0xf;
 
-	DBG("DSI%d PLL save state %x %x", pll_14nm->id,
+	DBG("DSI%d PLL save state %x %x", pll_14nm->phy->id,
 	    cached_state->n1postdiv, cached_state->n2postdiv);
 
 	cached_state->vco_rate = clk_hw_get_rate(phy->vco_hw);
@@ -830,14 +827,14 @@ static int dsi_14nm_pll_restore_state(struct msm_dsi_phy *phy)
 	ret = dsi_pll_14nm_vco_set_rate(phy->vco_hw,
 					cached_state->vco_rate, 0);
 	if (ret) {
-		DRM_DEV_ERROR(&pll_14nm->pdev->dev,
+		DRM_DEV_ERROR(&pll_14nm->phy->pdev->dev,
 			"restore vco rate failed. ret=%d\n", ret);
 		return ret;
 	}
 
 	data = cached_state->n1postdiv | (cached_state->n2postdiv << 4);
 
-	DBG("DSI%d PLL restore state %x %x", pll_14nm->id,
+	DBG("DSI%d PLL restore state %x %x", pll_14nm->phy->id,
 	    cached_state->n1postdiv, cached_state->n2postdiv);
 
 	dsi_phy_write(cmn_base + REG_DSI_14nm_PHY_CMN_CLK_CFG0, data);
@@ -865,7 +862,7 @@ static int dsi_14nm_set_usecase(struct msm_dsi_phy *phy)
 		break;
 	case MSM_DSI_PHY_MASTER:
 		clkbuflr_en = 0x3;
-		pll_14nm->slave = pll_14nm_list[(pll_14nm->id + 1) % DSI_MAX];
+		pll_14nm->slave = pll_14nm_list[(pll_14nm->phy->id + 1) % DSI_MAX];
 		break;
 	case MSM_DSI_PHY_SLAVE:
 		clkbuflr_en = 0x0;
@@ -889,7 +886,7 @@ static struct clk_hw *pll_14nm_postdiv_register(struct dsi_pll_14nm *pll_14nm,
 						u8 shift)
 {
 	struct dsi_pll_14nm_postdiv *pll_postdiv;
-	struct device *dev = &pll_14nm->pdev->dev;
+	struct device *dev = &pll_14nm->phy->pdev->dev;
 	struct clk_init_data postdiv_init = {
 		.parent_names = (const char *[]) { parent_name },
 		.num_parents = 1,
@@ -928,21 +925,21 @@ static int pll_14nm_register(struct dsi_pll_14nm *pll_14nm, struct clk_hw **prov
 		.flags = CLK_IGNORE_UNUSED,
 		.ops = &clk_ops_dsi_pll_14nm_vco,
 	};
-	struct device *dev = &pll_14nm->pdev->dev;
+	struct device *dev = &pll_14nm->phy->pdev->dev;
 	struct clk_hw *hw;
 	int ret;
 
-	DBG("DSI%d", pll_14nm->id);
+	DBG("DSI%d", pll_14nm->phy->id);
 
-	snprintf(vco_name, 32, "dsi%dvco_clk", pll_14nm->id);
+	snprintf(vco_name, 32, "dsi%dvco_clk", pll_14nm->phy->id);
 	pll_14nm->clk_hw.init = &vco_init;
 
 	ret = devm_clk_hw_register(dev, &pll_14nm->clk_hw);
 	if (ret)
 		return ret;
 
-	snprintf(clk_name, 32, "dsi%dn1_postdiv_clk", pll_14nm->id);
-	snprintf(parent, 32, "dsi%dvco_clk", pll_14nm->id);
+	snprintf(clk_name, 32, "dsi%dn1_postdiv_clk", pll_14nm->phy->id);
+	snprintf(parent, 32, "dsi%dvco_clk", pll_14nm->phy->id);
 
 	/* N1 postdiv, bits 0-3 in REG_DSI_14nm_PHY_CMN_CLK_CFG0 */
 	hw = pll_14nm_postdiv_register(pll_14nm, clk_name, parent,
@@ -950,8 +947,8 @@ static int pll_14nm_register(struct dsi_pll_14nm *pll_14nm, struct clk_hw **prov
 	if (IS_ERR(hw))
 		return PTR_ERR(hw);
 
-	snprintf(clk_name, 32, "dsi%dpllbyte", pll_14nm->id);
-	snprintf(parent, 32, "dsi%dn1_postdiv_clk", pll_14nm->id);
+	snprintf(clk_name, 32, "dsi%dpllbyte", pll_14nm->phy->id);
+	snprintf(parent, 32, "dsi%dn1_postdiv_clk", pll_14nm->phy->id);
 
 	/* DSI Byte clock = VCO_CLK / N1 / 8 */
 	hw = devm_clk_hw_register_fixed_factor(dev, clk_name, parent,
@@ -961,8 +958,8 @@ static int pll_14nm_register(struct dsi_pll_14nm *pll_14nm, struct clk_hw **prov
 
 	provided_clocks[DSI_BYTE_PLL_CLK] = hw;
 
-	snprintf(clk_name, 32, "dsi%dn1_postdivby2_clk", pll_14nm->id);
-	snprintf(parent, 32, "dsi%dn1_postdiv_clk", pll_14nm->id);
+	snprintf(clk_name, 32, "dsi%dn1_postdivby2_clk", pll_14nm->phy->id);
+	snprintf(parent, 32, "dsi%dn1_postdiv_clk", pll_14nm->phy->id);
 
 	/*
 	 * Skip the mux for now, force DSICLK_SEL to 1, Add a /2 divider
@@ -972,8 +969,8 @@ static int pll_14nm_register(struct dsi_pll_14nm *pll_14nm, struct clk_hw **prov
 	if (IS_ERR(hw))
 		return PTR_ERR(hw);
 
-	snprintf(clk_name, 32, "dsi%dpll", pll_14nm->id);
-	snprintf(parent, 32, "dsi%dn1_postdivby2_clk", pll_14nm->id);
+	snprintf(clk_name, 32, "dsi%dpll", pll_14nm->phy->id);
+	snprintf(parent, 32, "dsi%dn1_postdivby2_clk", pll_14nm->phy->id);
 
 	/* DSI pixel clock = VCO_CLK / N1 / 2 / N2
 	 * This is the output of N2 post-divider, bits 4-7 in
@@ -991,7 +988,6 @@ static int pll_14nm_register(struct dsi_pll_14nm *pll_14nm, struct clk_hw **prov
 static int dsi_pll_14nm_init(struct msm_dsi_phy *phy)
 {
 	struct platform_device *pdev = phy->pdev;
-	int id = phy->id;
 	struct dsi_pll_14nm *pll_14nm;
 	int ret;
 
@@ -1002,11 +998,9 @@ static int dsi_pll_14nm_init(struct msm_dsi_phy *phy)
 	if (!pll_14nm)
 		return -ENOMEM;
 
-	DBG("PLL%d", id);
+	DBG("PLL%d", phy->id);
 
-	pll_14nm->pdev = pdev;
-	pll_14nm->id = id;
-	pll_14nm_list[id] = pll_14nm;
+	pll_14nm_list[phy->id] = pll_14nm;
 
 	spin_lock_init(&pll_14nm->postdiv_lock);
 
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
index f198609882fd..e09fa80c413e 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
@@ -67,9 +67,6 @@ struct pll_28nm_cached_state {
 struct dsi_pll_28nm {
 	struct clk_hw clk_hw;
 
-	int id;
-	struct platform_device *pdev;
-
 	struct msm_dsi_phy *phy;
 
 	struct pll_28nm_cached_state cached_state;
@@ -117,7 +114,7 @@ static int dsi_pll_28nm_clk_set_rate(struct clk_hw *hw, unsigned long rate,
 		unsigned long parent_rate)
 {
 	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(hw);
-	struct device *dev = &pll_28nm->pdev->dev;
+	struct device *dev = &pll_28nm->phy->pdev->dev;
 	void __iomem *base = pll_28nm->phy->pll_base;
 	unsigned long div_fbx1000, gen_vco_clk;
 	u32 refclk_cfg, frac_n_mode, frac_n_value;
@@ -288,14 +285,14 @@ static unsigned long dsi_pll_28nm_clk_recalc_rate(struct clk_hw *hw,
 
 static int _dsi_pll_28nm_vco_prepare_hpm(struct dsi_pll_28nm *pll_28nm)
 {
-	struct device *dev = &pll_28nm->pdev->dev;
+	struct device *dev = &pll_28nm->phy->pdev->dev;
 	void __iomem *base = pll_28nm->phy->pll_base;
 	u32 max_reads = 5, timeout_us = 100;
 	bool locked;
 	u32 val;
 	int i;
 
-	DBG("id=%d", pll_28nm->id);
+	DBG("id=%d", pll_28nm->phy->id);
 
 	pll_28nm_software_reset(pll_28nm);
 
@@ -382,13 +379,13 @@ static int dsi_pll_28nm_vco_prepare_hpm(struct clk_hw *hw)
 static int dsi_pll_28nm_vco_prepare_lp(struct clk_hw *hw)
 {
 	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(hw);
-	struct device *dev = &pll_28nm->pdev->dev;
+	struct device *dev = &pll_28nm->phy->pdev->dev;
 	void __iomem *base = pll_28nm->phy->pll_base;
 	bool locked;
 	u32 max_reads = 10, timeout_us = 50;
 	u32 val;
 
-	DBG("id=%d", pll_28nm->id);
+	DBG("id=%d", pll_28nm->phy->id);
 
 	if (unlikely(pll_28nm->phy->pll_on))
 		return 0;
@@ -432,7 +429,7 @@ static void dsi_pll_28nm_vco_unprepare(struct clk_hw *hw)
 {
 	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(hw);
 
-	DBG("id=%d", pll_28nm->id);
+	DBG("id=%d", pll_28nm->phy->id);
 
 	if (unlikely(!pll_28nm->phy->pll_on))
 		return;
@@ -504,7 +501,7 @@ static int dsi_28nm_pll_restore_state(struct msm_dsi_phy *phy)
 	ret = dsi_pll_28nm_clk_set_rate(phy->vco_hw,
 					cached_state->vco_rate, 0);
 	if (ret) {
-		DRM_DEV_ERROR(&pll_28nm->pdev->dev,
+		DRM_DEV_ERROR(&pll_28nm->phy->pdev->dev,
 			"restore vco rate failed. ret=%d\n", ret);
 		return ret;
 	}
@@ -528,25 +525,25 @@ static int pll_28nm_register(struct dsi_pll_28nm *pll_28nm, struct clk_hw **prov
 		.name = vco_name,
 		.flags = CLK_IGNORE_UNUSED,
 	};
-	struct device *dev = &pll_28nm->pdev->dev;
+	struct device *dev = &pll_28nm->phy->pdev->dev;
 	struct clk_hw *hw;
 	int ret;
 
-	DBG("%d", pll_28nm->id);
+	DBG("%d", pll_28nm->phy->id);
 
 	if (pll_28nm->phy->cfg->quirks & DSI_PHY_28NM_QUIRK_PHY_LP)
 		vco_init.ops = &clk_ops_dsi_pll_28nm_vco_lp;
 	else
 		vco_init.ops = &clk_ops_dsi_pll_28nm_vco_hpm;
 
-	snprintf(vco_name, 32, "dsi%dvco_clk", pll_28nm->id);
+	snprintf(vco_name, 32, "dsi%dvco_clk", pll_28nm->phy->id);
 	pll_28nm->clk_hw.init = &vco_init;
 	ret = devm_clk_hw_register(dev, &pll_28nm->clk_hw);
 	if (ret)
 		return ret;
 
-	snprintf(clk_name, 32, "dsi%danalog_postdiv_clk", pll_28nm->id);
-	snprintf(parent1, 32, "dsi%dvco_clk", pll_28nm->id);
+	snprintf(clk_name, 32, "dsi%danalog_postdiv_clk", pll_28nm->phy->id);
+	snprintf(parent1, 32, "dsi%dvco_clk", pll_28nm->phy->id);
 	hw = devm_clk_hw_register_divider(dev, clk_name,
 			parent1, CLK_SET_RATE_PARENT,
 			pll_28nm->phy->pll_base +
@@ -555,16 +552,16 @@ static int pll_28nm_register(struct dsi_pll_28nm *pll_28nm, struct clk_hw **prov
 	if (IS_ERR(hw))
 		return PTR_ERR(hw);
 
-	snprintf(clk_name, 32, "dsi%dindirect_path_div2_clk", pll_28nm->id);
-	snprintf(parent1, 32, "dsi%danalog_postdiv_clk", pll_28nm->id);
+	snprintf(clk_name, 32, "dsi%dindirect_path_div2_clk", pll_28nm->phy->id);
+	snprintf(parent1, 32, "dsi%danalog_postdiv_clk", pll_28nm->phy->id);
 	hw = devm_clk_hw_register_fixed_factor(dev, clk_name,
 			parent1, CLK_SET_RATE_PARENT,
 			1, 2);
 	if (IS_ERR(hw))
 		return PTR_ERR(hw);
 
-	snprintf(clk_name, 32, "dsi%dpll", pll_28nm->id);
-	snprintf(parent1, 32, "dsi%dvco_clk", pll_28nm->id);
+	snprintf(clk_name, 32, "dsi%dpll", pll_28nm->phy->id);
+	snprintf(parent1, 32, "dsi%dvco_clk", pll_28nm->phy->id);
 	hw = devm_clk_hw_register_divider(dev, clk_name,
 				parent1, 0, pll_28nm->phy->pll_base +
 				REG_DSI_28nm_PHY_PLL_POSTDIV3_CFG,
@@ -573,9 +570,9 @@ static int pll_28nm_register(struct dsi_pll_28nm *pll_28nm, struct clk_hw **prov
 		return PTR_ERR(hw);
 	provided_clocks[DSI_PIXEL_PLL_CLK] = hw;
 
-	snprintf(clk_name, 32, "dsi%dbyte_mux", pll_28nm->id);
-	snprintf(parent1, 32, "dsi%dvco_clk", pll_28nm->id);
-	snprintf(parent2, 32, "dsi%dindirect_path_div2_clk", pll_28nm->id);
+	snprintf(clk_name, 32, "dsi%dbyte_mux", pll_28nm->phy->id);
+	snprintf(parent1, 32, "dsi%dvco_clk", pll_28nm->phy->id);
+	snprintf(parent2, 32, "dsi%dindirect_path_div2_clk", pll_28nm->phy->id);
 	hw = devm_clk_hw_register_mux(dev, clk_name,
 			((const char *[]){
 				parent1, parent2
@@ -584,8 +581,8 @@ static int pll_28nm_register(struct dsi_pll_28nm *pll_28nm, struct clk_hw **prov
 	if (IS_ERR(hw))
 		return PTR_ERR(hw);
 
-	snprintf(clk_name, 32, "dsi%dpllbyte", pll_28nm->id);
-	snprintf(parent1, 32, "dsi%dbyte_mux", pll_28nm->id);
+	snprintf(clk_name, 32, "dsi%dpllbyte", pll_28nm->phy->id);
+	snprintf(parent1, 32, "dsi%dbyte_mux", pll_28nm->phy->id);
 	hw = devm_clk_hw_register_fixed_factor(dev, clk_name,
 				parent1, CLK_SET_RATE_PARENT, 1, 4);
 	if (IS_ERR(hw))
@@ -598,7 +595,6 @@ static int pll_28nm_register(struct dsi_pll_28nm *pll_28nm, struct clk_hw **prov
 static int dsi_pll_28nm_init(struct msm_dsi_phy *phy)
 {
 	struct platform_device *pdev = phy->pdev;
-	int id = phy->id;
 	struct dsi_pll_28nm *pll_28nm;
 	int ret;
 
@@ -609,8 +605,6 @@ static int dsi_pll_28nm_init(struct msm_dsi_phy *phy)
 	if (!pll_28nm)
 		return -ENOMEM;
 
-	pll_28nm->pdev = pdev;
-	pll_28nm->id = id;
 	pll_28nm->phy = phy;
 
 	ret = pll_28nm_register(pll_28nm, phy->provided_clocks->hws);
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
index a5f1a8520706..08bd93b719e0 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
@@ -59,9 +59,6 @@ struct clk_bytediv {
 struct dsi_pll_28nm {
 	struct clk_hw clk_hw;
 
-	int id;
-	struct platform_device *pdev;
-
 	struct msm_dsi_phy *phy;
 
 	struct pll_28nm_cached_state cached_state;
@@ -178,14 +175,14 @@ static unsigned long dsi_pll_28nm_clk_recalc_rate(struct clk_hw *hw,
 static int dsi_pll_28nm_vco_prepare(struct clk_hw *hw)
 {
 	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(hw);
-	struct device *dev = &pll_28nm->pdev->dev;
+	struct device *dev = &pll_28nm->phy->pdev->dev;
 	void __iomem *base = pll_28nm->phy->pll_base;
 	bool locked;
 	unsigned int bit_div, byte_div;
 	int max_reads = 1000, timeout_us = 100;
 	u32 val;
 
-	DBG("id=%d", pll_28nm->id);
+	DBG("id=%d", pll_28nm->phy->id);
 
 	if (unlikely(pll_28nm->phy->pll_on))
 		return 0;
@@ -227,7 +224,7 @@ static void dsi_pll_28nm_vco_unprepare(struct clk_hw *hw)
 {
 	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(hw);
 
-	DBG("id=%d", pll_28nm->id);
+	DBG("id=%d", pll_28nm->phy->id);
 
 	if (unlikely(!pll_28nm->phy->pll_on))
 		return;
@@ -368,7 +365,7 @@ static int dsi_28nm_pll_restore_state(struct msm_dsi_phy *phy)
 	ret = dsi_pll_28nm_clk_set_rate(phy->vco_hw,
 					cached_state->vco_rate, 0);
 	if (ret) {
-		DRM_DEV_ERROR(&pll_28nm->pdev->dev,
+		DRM_DEV_ERROR(&pll_28nm->phy->pdev->dev,
 			"restore vco rate failed. ret=%d\n", ret);
 		return ret;
 	}
@@ -392,13 +389,13 @@ static int pll_28nm_register(struct dsi_pll_28nm *pll_28nm, struct clk_hw **prov
 		.flags = CLK_IGNORE_UNUSED,
 		.ops = &clk_ops_dsi_pll_28nm_vco,
 	};
-	struct device *dev = &pll_28nm->pdev->dev;
+	struct device *dev = &pll_28nm->phy->pdev->dev;
 	struct clk_hw *hw;
 	struct clk_bytediv *bytediv;
 	struct clk_init_data bytediv_init = { };
 	int ret;
 
-	DBG("%d", pll_28nm->id);
+	DBG("%d", pll_28nm->phy->id);
 
 	bytediv = devm_kzalloc(dev, sizeof(*bytediv), GFP_KERNEL);
 	if (!bytediv)
@@ -412,7 +409,7 @@ static int pll_28nm_register(struct dsi_pll_28nm *pll_28nm, struct clk_hw **prov
 	if (!clk_name)
 		return -ENOMEM;
 
-	snprintf(vco_name, 32, "dsi%dvco_clk", pll_28nm->id);
+	snprintf(vco_name, 32, "dsi%dvco_clk", pll_28nm->phy->id);
 	vco_init.name = vco_name;
 
 	pll_28nm->clk_hw.init = &vco_init;
@@ -425,8 +422,8 @@ static int pll_28nm_register(struct dsi_pll_28nm *pll_28nm, struct clk_hw **prov
 	bytediv->hw.init = &bytediv_init;
 	bytediv->reg = pll_28nm->phy->pll_base + REG_DSI_28nm_8960_PHY_PLL_CTRL_9;
 
-	snprintf(parent_name, 32, "dsi%dvco_clk", pll_28nm->id);
-	snprintf(clk_name, 32, "dsi%dpllbyte", pll_28nm->id);
+	snprintf(parent_name, 32, "dsi%dvco_clk", pll_28nm->phy->id);
+	snprintf(clk_name, 32, "dsi%dpllbyte", pll_28nm->phy->id);
 
 	bytediv_init.name = clk_name;
 	bytediv_init.ops = &clk_bytediv_ops;
@@ -440,7 +437,7 @@ static int pll_28nm_register(struct dsi_pll_28nm *pll_28nm, struct clk_hw **prov
 		return ret;
 	provided_clocks[DSI_BYTE_PLL_CLK] = &bytediv->hw;
 
-	snprintf(clk_name, 32, "dsi%dpll", pll_28nm->id);
+	snprintf(clk_name, 32, "dsi%dpll", pll_28nm->phy->id);
 	/* DIV3 */
 	hw = devm_clk_hw_register_divider(dev, clk_name,
 				parent_name, 0, pll_28nm->phy->pll_base +
@@ -456,7 +453,6 @@ static int pll_28nm_register(struct dsi_pll_28nm *pll_28nm, struct clk_hw **prov
 static int dsi_pll_28nm_8960_init(struct msm_dsi_phy *phy)
 {
 	struct platform_device *pdev = phy->pdev;
-	int id = phy->id;
 	struct dsi_pll_28nm *pll_28nm;
 	int ret;
 
@@ -467,8 +463,6 @@ static int dsi_pll_28nm_8960_init(struct msm_dsi_phy *phy)
 	if (!pll_28nm)
 		return -ENOMEM;
 
-	pll_28nm->pdev = pdev;
-	pll_28nm->id = id + 1;
 	pll_28nm->phy = phy;
 
 	ret = pll_28nm_register(pll_28nm, phy->provided_clocks->hws);
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index 523e46aa4c38..460de93105d9 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -86,9 +86,6 @@ struct pll_7nm_cached_state {
 struct dsi_pll_7nm {
 	struct clk_hw clk_hw;
 
-	int id;
-	struct platform_device *pdev;
-
 	struct msm_dsi_phy *phy;
 
 	u64 vco_ref_clk_rate;
@@ -320,7 +317,7 @@ static int dsi_pll_7nm_vco_set_rate(struct clk_hw *hw, unsigned long rate,
 {
 	struct dsi_pll_7nm *pll_7nm = to_pll_7nm(hw);
 
-	DBG("DSI PLL%d rate=%lu, parent's=%lu", pll_7nm->id, rate,
+	DBG("DSI PLL%d rate=%lu, parent's=%lu", pll_7nm->phy->id, rate,
 	    parent_rate);
 
 	pll_7nm->vco_current_rate = rate;
@@ -359,7 +356,7 @@ static int dsi_pll_7nm_lock_status(struct dsi_pll_7nm *pll)
 				       timeout_us);
 	if (rc)
 		pr_err("DSI PLL(%d) lock failed, status=0x%08x\n",
-		       pll->id, status);
+		       pll->phy->id, status);
 
 	return rc;
 }
@@ -435,7 +432,7 @@ static int dsi_pll_7nm_vco_prepare(struct clk_hw *hw)
 	/* Check for PLL lock */
 	rc = dsi_pll_7nm_lock_status(pll_7nm);
 	if (rc) {
-		pr_err("PLL(%d) lock failed\n", pll_7nm->id);
+		pr_err("PLL(%d) lock failed\n", pll_7nm->phy->id);
 		goto error;
 	}
 
@@ -519,7 +516,7 @@ static unsigned long dsi_pll_7nm_vco_recalc_rate(struct clk_hw *hw,
 	vco_rate = pll_freq;
 
 	DBG("DSI PLL%d returning vco rate = %lu, dec = %x, frac = %x",
-	    pll_7nm->id, (unsigned long)vco_rate, dec, frac);
+	    pll_7nm->phy->id, (unsigned long)vco_rate, dec, frac);
 
 	return (unsigned long)vco_rate;
 }
@@ -568,7 +565,7 @@ static void dsi_7nm_pll_save_state(struct msm_dsi_phy *phy)
 	cached->pll_mux = cmn_clk_cfg1 & 0x3;
 
 	DBG("DSI PLL%d outdiv %x bit_clk_div %x pix_clk_div %x pll_mux %x",
-	    pll_7nm->id, cached->pll_out_div, cached->bit_clk_div,
+	    pll_7nm->phy->id, cached->pll_out_div, cached->bit_clk_div,
 	    cached->pix_clk_div, cached->pll_mux);
 }
 
@@ -597,12 +594,12 @@ static int dsi_7nm_pll_restore_state(struct msm_dsi_phy *phy)
 			pll_7nm->vco_current_rate,
 			pll_7nm->vco_ref_clk_rate);
 	if (ret) {
-		DRM_DEV_ERROR(&pll_7nm->pdev->dev,
+		DRM_DEV_ERROR(&pll_7nm->phy->pdev->dev,
 			"restore vco rate failed. ret=%d\n", ret);
 		return ret;
 	}
 
-	DBG("DSI PLL%d", pll_7nm->id);
+	DBG("DSI PLL%d", pll_7nm->phy->id);
 
 	return 0;
 }
@@ -613,13 +610,13 @@ static int dsi_7nm_set_usecase(struct msm_dsi_phy *phy)
 	void __iomem *base = phy->base;
 	u32 data = 0x0;	/* internal PLL */
 
-	DBG("DSI PLL%d", pll_7nm->id);
+	DBG("DSI PLL%d", pll_7nm->phy->id);
 
 	switch (phy->usecase) {
 	case MSM_DSI_PHY_STANDALONE:
 		break;
 	case MSM_DSI_PHY_MASTER:
-		pll_7nm->slave = pll_7nm_list[(pll_7nm->id + 1) % DSI_MAX];
+		pll_7nm->slave = pll_7nm_list[(pll_7nm->phy->id + 1) % DSI_MAX];
 		break;
 	case MSM_DSI_PHY_SLAVE:
 		data = 0x1; /* external PLL */
@@ -651,21 +648,21 @@ static int pll_7nm_register(struct dsi_pll_7nm *pll_7nm, struct clk_hw **provide
 		.flags = CLK_IGNORE_UNUSED,
 		.ops = &clk_ops_dsi_pll_7nm_vco,
 	};
-	struct device *dev = &pll_7nm->pdev->dev;
+	struct device *dev = &pll_7nm->phy->pdev->dev;
 	struct clk_hw *hw;
 	int ret;
 
-	DBG("DSI%d", pll_7nm->id);
+	DBG("DSI%d", pll_7nm->phy->id);
 
-	snprintf(vco_name, 32, "dsi%dvco_clk", pll_7nm->id);
+	snprintf(vco_name, 32, "dsi%dvco_clk", pll_7nm->phy->id);
 	pll_7nm->clk_hw.init = &vco_init;
 
 	ret = devm_clk_hw_register(dev, &pll_7nm->clk_hw);
 	if (ret)
 		return ret;
 
-	snprintf(clk_name, 32, "dsi%d_pll_out_div_clk", pll_7nm->id);
-	snprintf(parent, 32, "dsi%dvco_clk", pll_7nm->id);
+	snprintf(clk_name, 32, "dsi%d_pll_out_div_clk", pll_7nm->phy->id);
+	snprintf(parent, 32, "dsi%dvco_clk", pll_7nm->phy->id);
 
 	hw = devm_clk_hw_register_divider(dev, clk_name,
 				     parent, CLK_SET_RATE_PARENT,
@@ -677,8 +674,8 @@ static int pll_7nm_register(struct dsi_pll_7nm *pll_7nm, struct clk_hw **provide
 		goto fail;
 	}
 
-	snprintf(clk_name, 32, "dsi%d_pll_bit_clk", pll_7nm->id);
-	snprintf(parent, 32, "dsi%d_pll_out_div_clk", pll_7nm->id);
+	snprintf(clk_name, 32, "dsi%d_pll_bit_clk", pll_7nm->phy->id);
+	snprintf(parent, 32, "dsi%d_pll_out_div_clk", pll_7nm->phy->id);
 
 	/* BIT CLK: DIV_CTRL_3_0 */
 	hw = devm_clk_hw_register_divider(dev, clk_name, parent,
@@ -692,8 +689,8 @@ static int pll_7nm_register(struct dsi_pll_7nm *pll_7nm, struct clk_hw **provide
 		goto fail;
 	}
 
-	snprintf(clk_name, 32, "dsi%d_phy_pll_out_byteclk", pll_7nm->id);
-	snprintf(parent, 32, "dsi%d_pll_bit_clk", pll_7nm->id);
+	snprintf(clk_name, 32, "dsi%d_phy_pll_out_byteclk", pll_7nm->phy->id);
+	snprintf(parent, 32, "dsi%d_pll_bit_clk", pll_7nm->phy->id);
 
 	/* DSI Byte clock = VCO_CLK / OUT_DIV / BIT_DIV / 8 */
 	hw = devm_clk_hw_register_fixed_factor(dev, clk_name, parent,
@@ -705,8 +702,8 @@ static int pll_7nm_register(struct dsi_pll_7nm *pll_7nm, struct clk_hw **provide
 
 	provided_clocks[DSI_BYTE_PLL_CLK] = hw;
 
-	snprintf(clk_name, 32, "dsi%d_pll_by_2_bit_clk", pll_7nm->id);
-	snprintf(parent, 32, "dsi%d_pll_bit_clk", pll_7nm->id);
+	snprintf(clk_name, 32, "dsi%d_pll_by_2_bit_clk", pll_7nm->phy->id);
+	snprintf(parent, 32, "dsi%d_pll_bit_clk", pll_7nm->phy->id);
 
 	hw = devm_clk_hw_register_fixed_factor(dev, clk_name, parent,
 					  0, 1, 2);
@@ -715,8 +712,8 @@ static int pll_7nm_register(struct dsi_pll_7nm *pll_7nm, struct clk_hw **provide
 		goto fail;
 	}
 
-	snprintf(clk_name, 32, "dsi%d_pll_post_out_div_clk", pll_7nm->id);
-	snprintf(parent, 32, "dsi%d_pll_out_div_clk", pll_7nm->id);
+	snprintf(clk_name, 32, "dsi%d_pll_post_out_div_clk", pll_7nm->phy->id);
+	snprintf(parent, 32, "dsi%d_pll_out_div_clk", pll_7nm->phy->id);
 
 	hw = devm_clk_hw_register_fixed_factor(dev, clk_name, parent,
 					  0, 1, 4);
@@ -725,11 +722,11 @@ static int pll_7nm_register(struct dsi_pll_7nm *pll_7nm, struct clk_hw **provide
 		goto fail;
 	}
 
-	snprintf(clk_name, 32, "dsi%d_pclk_mux", pll_7nm->id);
-	snprintf(parent, 32, "dsi%d_pll_bit_clk", pll_7nm->id);
-	snprintf(parent2, 32, "dsi%d_pll_by_2_bit_clk", pll_7nm->id);
-	snprintf(parent3, 32, "dsi%d_pll_out_div_clk", pll_7nm->id);
-	snprintf(parent4, 32, "dsi%d_pll_post_out_div_clk", pll_7nm->id);
+	snprintf(clk_name, 32, "dsi%d_pclk_mux", pll_7nm->phy->id);
+	snprintf(parent, 32, "dsi%d_pll_bit_clk", pll_7nm->phy->id);
+	snprintf(parent2, 32, "dsi%d_pll_by_2_bit_clk", pll_7nm->phy->id);
+	snprintf(parent3, 32, "dsi%d_pll_out_div_clk", pll_7nm->phy->id);
+	snprintf(parent4, 32, "dsi%d_pll_post_out_div_clk", pll_7nm->phy->id);
 
 	hw = devm_clk_hw_register_mux(dev, clk_name,
 				 ((const char *[]){
@@ -742,8 +739,8 @@ static int pll_7nm_register(struct dsi_pll_7nm *pll_7nm, struct clk_hw **provide
 		goto fail;
 	}
 
-	snprintf(clk_name, 32, "dsi%d_phy_pll_out_dsiclk", pll_7nm->id);
-	snprintf(parent, 32, "dsi%d_pclk_mux", pll_7nm->id);
+	snprintf(clk_name, 32, "dsi%d_phy_pll_out_dsiclk", pll_7nm->phy->id);
+	snprintf(parent, 32, "dsi%d_pclk_mux", pll_7nm->phy->id);
 
 	/* PIX CLK DIV : DIV_CTRL_7_4*/
 	hw = devm_clk_hw_register_divider(dev, clk_name, parent,
@@ -768,7 +765,6 @@ static int pll_7nm_register(struct dsi_pll_7nm *pll_7nm, struct clk_hw **provide
 static int dsi_pll_7nm_init(struct msm_dsi_phy *phy)
 {
 	struct platform_device *pdev = phy->pdev;
-	int id = phy->id;
 	struct dsi_pll_7nm *pll_7nm;
 	int ret;
 
@@ -776,11 +772,9 @@ static int dsi_pll_7nm_init(struct msm_dsi_phy *phy)
 	if (!pll_7nm)
 		return -ENOMEM;
 
-	DBG("DSI PLL%d", id);
+	DBG("DSI PLL%d", phy->id);
 
-	pll_7nm->pdev = pdev;
-	pll_7nm->id = id;
-	pll_7nm_list[id] = pll_7nm;
+	pll_7nm_list[phy->id] = pll_7nm;
 
 	spin_lock_init(&pll_7nm->postdiv_lock);
 
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
