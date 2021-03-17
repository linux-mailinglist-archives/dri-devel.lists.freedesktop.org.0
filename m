Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 19CE133F363
	for <lists+dri-devel@lfdr.de>; Wed, 17 Mar 2021 15:41:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A07F26E81B;
	Wed, 17 Mar 2021 14:41:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6495E6E817
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Mar 2021 14:41:05 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id y1so3448693ljm.10
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Mar 2021 07:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sUBeVM++0B10W3TKR2V2yeIF+YrMYSjsCDa1pT5imrM=;
 b=ygCVHEzAGsfn7ZVHXLx5b4OeOt/1g253jtoROMNDfpT6evnsw32SrpAIyx6+QFAVMs
 YGyaregpxIGQiujYS0OHN1hTIs6KPs0gAKdJClrLL2UQoehkF4J3cFQ1mQDfRIJSa4+F
 ktMQLAoLHGbrfvmjTfkVfVMjYBLcPu4ZfqEw2HYHnOysRT7n1X7+zDL8OT+X6v8tSxPP
 QLbZJ/i3SPb+HgOR6qC8h2ysPGAGpsDWHcgL1DYyfbw4+lN/aefUVdhMOP+7Xopbi/b7
 58a1daJubnFvz4PZtjsdGqcglSj38ixlr6QtBargV8Q4sgFECPWcL9gWpKSIsF/uLtCN
 lVJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sUBeVM++0B10W3TKR2V2yeIF+YrMYSjsCDa1pT5imrM=;
 b=jBMhNRX88zSY0sj6foARxfBMLEYZjz7/tsg/5/oAQlLH0xXM5PxwUJeLupwfF9jmxl
 qXzw+1mUiUew0uvqYosXaNflHjKW94oDaGCSh1fuxZqsESUMaqAoAyHvwDbe5gD4UfTH
 NCpdm8R/BpqGj9w/bUvetaZDu/rWumz2S0h1qRrYJUDtnRppjFKGj6aBZysq9xjQFnD4
 MhSYoimc61LcY9uEA3OXXhC9WVnNEDPf0t6W09RdeRRyKh1icK/dyJ/0JaiqgEKb64GJ
 ytSINFiFyNLEKACQR0IOwTzPIeWT4t0jrDanpo59XHYFcWBEZYI5m82OYoP2WdgzRFSr
 55eA==
X-Gm-Message-State: AOAM530Amrt/WoyFyxHdOjOmobbkwQYdeCReM6IP+TzuWqGAdsmHRktz
 Ef8HKxKKs+6lFbywN3zQKt4q4Q==
X-Google-Smtp-Source: ABdhPJxMqutFBKg4xtT01w0amX2xFpgQN5/xDtKSswDocb2bn8wKR9yxFqgSjJy7eFHICkHsiFQwpg==
X-Received: by 2002:a2e:89d4:: with SMTP id c20mr2706302ljk.169.1615992063730; 
 Wed, 17 Mar 2021 07:41:03 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id q8sm1484309lfc.223.2021.03.17.07.41.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 07:41:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Jonathan Marek <jonathan@marek.ca>,
 Michael Turquette <mturquette@baylibre.com>
Subject: [PATCH v1 22/26] drm/msm/dsi: remove duplicate fields from
 dsi_pll_Nnm instances
Date: Wed, 17 Mar 2021 17:40:35 +0300
Message-Id: <20210317144039.556409-23-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210317144039.556409-1-dmitry.baryshkov@linaro.org>
References: <20210317144039.556409-1-dmitry.baryshkov@linaro.org>
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
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 freedreno@lists.freedesktop.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Drop duplicate fields pdev and id from dsi_pll_Nnm instances. Reuse
those fields from the provided msm_dsi_phy.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c    | 72 +++++++++----------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c    | 54 +++++++-------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c    | 51 ++++++-------
 .../gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c   | 26 +++----
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c     | 68 ++++++++----------
 5 files changed, 119 insertions(+), 152 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
index d2f483d6d343..85007ac0350b 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
@@ -83,9 +83,6 @@ struct pll_10nm_cached_state {
 struct dsi_pll_10nm {
 	struct clk_hw clk_hw;
 
-	int id;
-	struct platform_device *pdev;
-
 	struct msm_dsi_phy *phy;
 
 	u64 vco_ref_clk_rate;
@@ -298,7 +295,7 @@ static int dsi_pll_10nm_vco_set_rate(struct clk_hw *hw, unsigned long rate,
 {
 	struct dsi_pll_10nm *pll_10nm = to_pll_10nm(hw);
 
-	DBG("DSI PLL%d rate=%lu, parent's=%lu", pll_10nm->id, rate,
+	DBG("DSI PLL%d rate=%lu, parent's=%lu", pll_10nm->phy->id, rate,
 	    parent_rate);
 
 	pll_10nm->vco_current_rate = rate;
@@ -324,7 +321,7 @@ static int dsi_pll_10nm_vco_set_rate(struct clk_hw *hw, unsigned long rate,
 
 static int dsi_pll_10nm_lock_status(struct dsi_pll_10nm *pll)
 {
-	struct device *dev = &pll->pdev->dev;
+	struct device *dev = &pll->phy->pdev->dev;
 	int rc;
 	u32 status = 0;
 	u32 const delay_us = 100;
@@ -338,7 +335,7 @@ static int dsi_pll_10nm_lock_status(struct dsi_pll_10nm *pll)
 				       timeout_us);
 	if (rc)
 		DRM_DEV_ERROR(dev, "DSI PLL(%d) lock failed, status=0x%08x\n",
-			      pll->id, status);
+			      pll->phy->id, status);
 
 	return rc;
 }
@@ -384,7 +381,7 @@ static void dsi_pll_enable_global_clk(struct dsi_pll_10nm *pll)
 static int dsi_pll_10nm_vco_prepare(struct clk_hw *hw)
 {
 	struct dsi_pll_10nm *pll_10nm = to_pll_10nm(hw);
-	struct device *dev = &pll_10nm->pdev->dev;
+	struct device *dev = &pll_10nm->phy->pdev->dev;
 	int rc;
 
 	dsi_pll_enable_pll_bias(pll_10nm);
@@ -410,7 +407,7 @@ static int dsi_pll_10nm_vco_prepare(struct clk_hw *hw)
 	/* Check for PLL lock */
 	rc = dsi_pll_10nm_lock_status(pll_10nm);
 	if (rc) {
-		DRM_DEV_ERROR(dev, "PLL(%d) lock failed\n", pll_10nm->id);
+		DRM_DEV_ERROR(dev, "PLL(%d) lock failed\n", pll_10nm->phy->id);
 		goto error;
 	}
 
@@ -491,7 +488,7 @@ static unsigned long dsi_pll_10nm_vco_recalc_rate(struct clk_hw *hw,
 	vco_rate = pll_freq;
 
 	DBG("DSI PLL%d returning vco rate = %lu, dec = %x, frac = %x",
-	    pll_10nm->id, (unsigned long)vco_rate, dec, frac);
+	    pll_10nm->phy->id, (unsigned long)vco_rate, dec, frac);
 
 	return (unsigned long)vco_rate;
 }
@@ -540,7 +537,7 @@ static void dsi_10nm_save_state(struct msm_dsi_phy *phy)
 	cached->pll_mux = cmn_clk_cfg1 & 0x3;
 
 	DBG("DSI PLL%d outdiv %x bit_clk_div %x pix_clk_div %x pll_mux %x",
-	    pll_10nm->id, cached->pll_out_div, cached->bit_clk_div,
+	    pll_10nm->phy->id, cached->pll_out_div, cached->bit_clk_div,
 	    cached->pix_clk_div, cached->pll_mux);
 }
 
@@ -567,12 +564,12 @@ static int dsi_10nm_restore_state(struct msm_dsi_phy *phy)
 
 	ret = dsi_pll_10nm_vco_set_rate(phy->vco_hw, pll_10nm->vco_current_rate, pll_10nm->vco_ref_clk_rate);
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
@@ -583,13 +580,13 @@ static int dsi_10nm_set_usecase(struct msm_dsi_phy *phy)
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
@@ -621,21 +618,21 @@ static int pll_10nm_register(struct dsi_pll_10nm *pll_10nm, struct clk_hw_onecel
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
@@ -647,8 +644,8 @@ static int pll_10nm_register(struct dsi_pll_10nm *pll_10nm, struct clk_hw_onecel
 		goto fail;
 	}
 
-	snprintf(clk_name, 32, "dsi%d_pll_bit_clk", pll_10nm->id);
-	snprintf(parent, 32, "dsi%d_pll_out_div_clk", pll_10nm->id);
+	snprintf(clk_name, 32, "dsi%d_pll_bit_clk", pll_10nm->phy->id);
+	snprintf(parent, 32, "dsi%d_pll_out_div_clk", pll_10nm->phy->id);
 
 	/* BIT CLK: DIV_CTRL_3_0 */
 	hw = devm_clk_hw_register_divider(dev, clk_name, parent,
@@ -662,8 +659,8 @@ static int pll_10nm_register(struct dsi_pll_10nm *pll_10nm, struct clk_hw_onecel
 		goto fail;
 	}
 
-	snprintf(clk_name, 32, "dsi%d_phy_pll_out_byteclk", pll_10nm->id);
-	snprintf(parent, 32, "dsi%d_pll_bit_clk", pll_10nm->id);
+	snprintf(clk_name, 32, "dsi%d_phy_pll_out_byteclk", pll_10nm->phy->id);
+	snprintf(parent, 32, "dsi%d_pll_bit_clk", pll_10nm->phy->id);
 
 	/* DSI Byte clock = VCO_CLK / OUT_DIV / BIT_DIV / 8 */
 	hw = devm_clk_hw_register_fixed_factor(dev, clk_name, parent,
@@ -675,8 +672,8 @@ static int pll_10nm_register(struct dsi_pll_10nm *pll_10nm, struct clk_hw_onecel
 
 	provided_clocks->hws[DSI_BYTE_PLL_CLK] = hw;
 
-	snprintf(clk_name, 32, "dsi%d_pll_by_2_bit_clk", pll_10nm->id);
-	snprintf(parent, 32, "dsi%d_pll_bit_clk", pll_10nm->id);
+	snprintf(clk_name, 32, "dsi%d_pll_by_2_bit_clk", pll_10nm->phy->id);
+	snprintf(parent, 32, "dsi%d_pll_bit_clk", pll_10nm->phy->id);
 
 	hw = devm_clk_hw_register_fixed_factor(dev, clk_name, parent,
 					  0, 1, 2);
@@ -685,8 +682,8 @@ static int pll_10nm_register(struct dsi_pll_10nm *pll_10nm, struct clk_hw_onecel
 		goto fail;
 	}
 
-	snprintf(clk_name, 32, "dsi%d_pll_post_out_div_clk", pll_10nm->id);
-	snprintf(parent, 32, "dsi%d_pll_out_div_clk", pll_10nm->id);
+	snprintf(clk_name, 32, "dsi%d_pll_post_out_div_clk", pll_10nm->phy->id);
+	snprintf(parent, 32, "dsi%d_pll_out_div_clk", pll_10nm->phy->id);
 
 	hw = devm_clk_hw_register_fixed_factor(dev, clk_name, parent,
 					  0, 1, 4);
@@ -695,11 +692,11 @@ static int pll_10nm_register(struct dsi_pll_10nm *pll_10nm, struct clk_hw_onecel
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
@@ -712,8 +709,8 @@ static int pll_10nm_register(struct dsi_pll_10nm *pll_10nm, struct clk_hw_onecel
 		goto fail;
 	}
 
-	snprintf(clk_name, 32, "dsi%d_phy_pll_out_dsiclk", pll_10nm->id);
-	snprintf(parent, 32, "dsi%d_pclk_mux", pll_10nm->id);
+	snprintf(clk_name, 32, "dsi%d_phy_pll_out_dsiclk", pll_10nm->phy->id);
+	snprintf(parent, 32, "dsi%d_pclk_mux", pll_10nm->phy->id);
 
 	/* PIX CLK DIV : DIV_CTRL_7_4*/
 	hw = devm_clk_hw_register_divider(dev, clk_name, parent,
@@ -738,7 +735,6 @@ static int pll_10nm_register(struct dsi_pll_10nm *pll_10nm, struct clk_hw_onecel
 static int dsi_pll_10nm_init(struct msm_dsi_phy *phy)
 {
 	struct platform_device *pdev = phy->pdev;
-	int id = phy->id;
 	struct dsi_pll_10nm *pll_10nm;
 	int ret;
 
@@ -746,11 +742,9 @@ static int dsi_pll_10nm_init(struct msm_dsi_phy *phy)
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
index 30475687e445..2973527055d4 100644
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
@@ -813,7 +810,7 @@ static void dsi_14nm_save_state(struct msm_dsi_phy *phy)
 	cached_state->n1postdiv = data & 0xf;
 	cached_state->n2postdiv = (data >> 4) & 0xf;
 
-	DBG("DSI%d PLL save state %x %x", pll_14nm->id,
+	DBG("DSI%d PLL save state %x %x", pll_14nm->phy->id,
 	    cached_state->n1postdiv, cached_state->n2postdiv);
 
 	cached_state->vco_rate = clk_hw_get_rate(phy->vco_hw);
@@ -830,14 +827,14 @@ static int dsi_14nm_restore_state(struct msm_dsi_phy *phy)
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
@@ -928,21 +925,21 @@ static int pll_14nm_register(struct dsi_pll_14nm *pll_14nm, struct clk_hw_onecel
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
@@ -950,8 +947,8 @@ static int pll_14nm_register(struct dsi_pll_14nm *pll_14nm, struct clk_hw_onecel
 	if (IS_ERR(hw))
 		return PTR_ERR(hw);
 
-	snprintf(clk_name, 32, "dsi%dpllbyte", pll_14nm->id);
-	snprintf(parent, 32, "dsi%dn1_postdiv_clk", pll_14nm->id);
+	snprintf(clk_name, 32, "dsi%dpllbyte", pll_14nm->phy->id);
+	snprintf(parent, 32, "dsi%dn1_postdiv_clk", pll_14nm->phy->id);
 
 	/* DSI Byte clock = VCO_CLK / N1 / 8 */
 	hw = devm_clk_hw_register_fixed_factor(dev, clk_name, parent,
@@ -961,8 +958,8 @@ static int pll_14nm_register(struct dsi_pll_14nm *pll_14nm, struct clk_hw_onecel
 
 	provided_clocks->hws[DSI_BYTE_PLL_CLK] = hw;
 
-	snprintf(clk_name, 32, "dsi%dn1_postdivby2_clk", pll_14nm->id);
-	snprintf(parent, 32, "dsi%dn1_postdiv_clk", pll_14nm->id);
+	snprintf(clk_name, 32, "dsi%dn1_postdivby2_clk", pll_14nm->phy->id);
+	snprintf(parent, 32, "dsi%dn1_postdiv_clk", pll_14nm->phy->id);
 
 	/*
 	 * Skip the mux for now, force DSICLK_SEL to 1, Add a /2 divider
@@ -972,8 +969,8 @@ static int pll_14nm_register(struct dsi_pll_14nm *pll_14nm, struct clk_hw_onecel
 	if (IS_ERR(hw))
 		return PTR_ERR(hw);
 
-	snprintf(clk_name, 32, "dsi%dpll", pll_14nm->id);
-	snprintf(parent, 32, "dsi%dn1_postdivby2_clk", pll_14nm->id);
+	snprintf(clk_name, 32, "dsi%dpll", pll_14nm->phy->id);
+	snprintf(parent, 32, "dsi%dn1_postdivby2_clk", pll_14nm->phy->id);
 
 	/* DSI pixel clock = VCO_CLK / N1 / 2 / N2
 	 * This is the output of N2 post-divider, bits 4-7 in
@@ -991,7 +988,6 @@ static int pll_14nm_register(struct dsi_pll_14nm *pll_14nm, struct clk_hw_onecel
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
index 901286ff3a83..6e391f0d3ffb 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
@@ -64,9 +64,6 @@ struct pll_28nm_cached_state {
 struct dsi_pll_28nm {
 	struct clk_hw clk_hw;
 
-	int id;
-	struct platform_device *pdev;
-
 	struct msm_dsi_phy *phy;
 
 	struct pll_28nm_cached_state cached_state;
@@ -114,7 +111,7 @@ static int dsi_pll_28nm_clk_set_rate(struct clk_hw *hw, unsigned long rate,
 		unsigned long parent_rate)
 {
 	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(hw);
-	struct device *dev = &pll_28nm->pdev->dev;
+	struct device *dev = &pll_28nm->phy->pdev->dev;
 	void __iomem *base = pll_28nm->phy->pll_base;
 	unsigned long div_fbx1000, gen_vco_clk;
 	u32 refclk_cfg, frac_n_mode, frac_n_value;
@@ -285,14 +282,14 @@ static unsigned long dsi_pll_28nm_clk_recalc_rate(struct clk_hw *hw,
 
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
 
@@ -379,13 +376,13 @@ static int dsi_pll_28nm_vco_prepare_hpm(struct clk_hw *hw)
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
@@ -429,7 +426,7 @@ static void dsi_pll_28nm_vco_unprepare(struct clk_hw *hw)
 {
 	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(hw);
 
-	DBG("id=%d", pll_28nm->id);
+	DBG("id=%d", pll_28nm->phy->id);
 
 	if (unlikely(!pll_28nm->phy->pll_on))
 		return;
@@ -501,7 +498,7 @@ static int dsi_28nm_restore_state(struct msm_dsi_phy *phy)
 	ret = dsi_pll_28nm_clk_set_rate(phy->vco_hw,
 					cached_state->vco_rate, 0);
 	if (ret) {
-		DRM_DEV_ERROR(&pll_28nm->pdev->dev,
+		DRM_DEV_ERROR(&pll_28nm->phy->pdev->dev,
 			"restore vco rate failed. ret=%d\n", ret);
 		return ret;
 	}
@@ -526,20 +523,20 @@ static int pll_28nm_register(struct dsi_pll_28nm *pll_28nm, struct clk_hw_onecel
 		.flags = CLK_IGNORE_UNUSED,
 		.ops = vco_ops,
 	};
-	struct device *dev = &pll_28nm->pdev->dev;
+	struct device *dev = &pll_28nm->phy->pdev->dev;
 	struct clk_hw *hw;
 	int ret;
 
-	DBG("%d", pll_28nm->id);
+	DBG("%d", pll_28nm->phy->id);
 
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
@@ -548,16 +545,16 @@ static int pll_28nm_register(struct dsi_pll_28nm *pll_28nm, struct clk_hw_onecel
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
@@ -566,9 +563,9 @@ static int pll_28nm_register(struct dsi_pll_28nm *pll_28nm, struct clk_hw_onecel
 		return PTR_ERR(hw);
 	provided_clocks->hws[DSI_PIXEL_PLL_CLK] = hw;
 
-	snprintf(clk_name, 32, "dsi%dbyte_mux", pll_28nm->id);
-	snprintf(parent1, 32, "dsi%dvco_clk", pll_28nm->id);
-	snprintf(parent2, 32, "dsi%dindirect_path_div2_clk", pll_28nm->id);
+	snprintf(clk_name, 32, "dsi%dbyte_mux", pll_28nm->phy->id);
+	snprintf(parent1, 32, "dsi%dvco_clk", pll_28nm->phy->id);
+	snprintf(parent2, 32, "dsi%dindirect_path_div2_clk", pll_28nm->phy->id);
 	hw = devm_clk_hw_register_mux(dev, clk_name,
 			((const char *[]){
 				parent1, parent2
@@ -577,8 +574,8 @@ static int pll_28nm_register(struct dsi_pll_28nm *pll_28nm, struct clk_hw_onecel
 	if (IS_ERR(hw))
 		return PTR_ERR(hw);
 
-	snprintf(clk_name, 32, "dsi%dpllbyte", pll_28nm->id);
-	snprintf(parent1, 32, "dsi%dbyte_mux", pll_28nm->id);
+	snprintf(clk_name, 32, "dsi%dpllbyte", pll_28nm->phy->id);
+	snprintf(parent1, 32, "dsi%dbyte_mux", pll_28nm->phy->id);
 	hw = devm_clk_hw_register_fixed_factor(dev, clk_name,
 				parent1, CLK_SET_RATE_PARENT, 1, 4);
 	if (IS_ERR(hw))
@@ -591,7 +588,6 @@ static int pll_28nm_register(struct dsi_pll_28nm *pll_28nm, struct clk_hw_onecel
 static int dsi_pll_28nm_hpm_init(struct msm_dsi_phy *phy)
 {
 	struct platform_device *pdev = phy->pdev;
-	int id = phy->id;
 	struct dsi_pll_28nm *pll_28nm;
 	int ret;
 
@@ -602,8 +598,6 @@ static int dsi_pll_28nm_hpm_init(struct msm_dsi_phy *phy)
 	if (!pll_28nm)
 		return -ENOMEM;
 
-	pll_28nm->pdev = pdev;
-	pll_28nm->id = id;
 	pll_28nm->phy = phy;
 
 	ret = pll_28nm_register(pll_28nm, phy->provided_clocks, &clk_ops_dsi_pll_28nm_vco_hpm);
@@ -620,7 +614,6 @@ static int dsi_pll_28nm_hpm_init(struct msm_dsi_phy *phy)
 static int dsi_pll_28nm_lp_init(struct msm_dsi_phy *phy)
 {
 	struct platform_device *pdev = phy->pdev;
-	int id = phy->id;
 	struct dsi_pll_28nm *pll_28nm;
 	int ret;
 
@@ -631,8 +624,6 @@ static int dsi_pll_28nm_lp_init(struct msm_dsi_phy *phy)
 	if (!pll_28nm)
 		return -ENOMEM;
 
-	pll_28nm->pdev = pdev;
-	pll_28nm->id = id;
 	pll_28nm->phy = phy;
 
 	ret = pll_28nm_register(pll_28nm, phy->provided_clocks, &clk_ops_dsi_pll_28nm_vco_lp);
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
index 8576b900b016..e3a6148e1d3b 100644
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
@@ -368,7 +365,7 @@ static int dsi_28nm_restore_state(struct msm_dsi_phy *phy)
 	ret = dsi_pll_28nm_clk_set_rate(phy->vco_hw,
 					cached_state->vco_rate, 0);
 	if (ret) {
-		DRM_DEV_ERROR(&pll_28nm->pdev->dev,
+		DRM_DEV_ERROR(&pll_28nm->phy->pdev->dev,
 			"restore vco rate failed. ret=%d\n", ret);
 		return ret;
 	}
@@ -392,13 +389,13 @@ static int pll_28nm_register(struct dsi_pll_28nm *pll_28nm, struct clk_hw_onecel
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
@@ -412,7 +409,7 @@ static int pll_28nm_register(struct dsi_pll_28nm *pll_28nm, struct clk_hw_onecel
 	if (!clk_name)
 		return -ENOMEM;
 
-	snprintf(vco_name, 32, "dsi%dvco_clk", pll_28nm->id);
+	snprintf(vco_name, 32, "dsi%dvco_clk", pll_28nm->phy->id);
 	vco_init.name = vco_name;
 
 	pll_28nm->clk_hw.init = &vco_init;
@@ -425,8 +422,8 @@ static int pll_28nm_register(struct dsi_pll_28nm *pll_28nm, struct clk_hw_onecel
 	bytediv->hw.init = &bytediv_init;
 	bytediv->reg = pll_28nm->phy->pll_base + REG_DSI_28nm_8960_PHY_PLL_CTRL_9;
 
-	snprintf(parent_name, 32, "dsi%dvco_clk", pll_28nm->id);
-	snprintf(clk_name, 32, "dsi%dpllbyte", pll_28nm->id);
+	snprintf(parent_name, 32, "dsi%dvco_clk", pll_28nm->phy->id);
+	snprintf(clk_name, 32, "dsi%dpllbyte", pll_28nm->phy->id);
 
 	bytediv_init.name = clk_name;
 	bytediv_init.ops = &clk_bytediv_ops;
@@ -440,7 +437,7 @@ static int pll_28nm_register(struct dsi_pll_28nm *pll_28nm, struct clk_hw_onecel
 		return ret;
 	provided_clocks->hws[DSI_BYTE_PLL_CLK] = &bytediv->hw;
 
-	snprintf(clk_name, 32, "dsi%dpll", pll_28nm->id);
+	snprintf(clk_name, 32, "dsi%dpll", pll_28nm->phy->id);
 	/* DIV3 */
 	hw = devm_clk_hw_register_divider(dev, clk_name,
 				parent_name, 0, pll_28nm->phy->pll_base +
@@ -456,7 +453,6 @@ static int pll_28nm_register(struct dsi_pll_28nm *pll_28nm, struct clk_hw_onecel
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
 
 	ret = pll_28nm_register(pll_28nm, phy->provided_clocks);
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index ae5edaf4df77..968d7a42f842 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -83,9 +83,6 @@ struct pll_7nm_cached_state {
 struct dsi_pll_7nm {
 	struct clk_hw clk_hw;
 
-	int id;
-	struct platform_device *pdev;
-
 	struct msm_dsi_phy *phy;
 
 	u64 vco_ref_clk_rate;
@@ -317,7 +314,7 @@ static int dsi_pll_7nm_vco_set_rate(struct clk_hw *hw, unsigned long rate,
 {
 	struct dsi_pll_7nm *pll_7nm = to_pll_7nm(hw);
 
-	DBG("DSI PLL%d rate=%lu, parent's=%lu", pll_7nm->id, rate,
+	DBG("DSI PLL%d rate=%lu, parent's=%lu", pll_7nm->phy->id, rate,
 	    parent_rate);
 
 	pll_7nm->vco_current_rate = rate;
@@ -356,7 +353,7 @@ static int dsi_pll_7nm_lock_status(struct dsi_pll_7nm *pll)
 				       timeout_us);
 	if (rc)
 		pr_err("DSI PLL(%d) lock failed, status=0x%08x\n",
-		       pll->id, status);
+		       pll->phy->id, status);
 
 	return rc;
 }
@@ -432,7 +429,7 @@ static int dsi_pll_7nm_vco_prepare(struct clk_hw *hw)
 	/* Check for PLL lock */
 	rc = dsi_pll_7nm_lock_status(pll_7nm);
 	if (rc) {
-		pr_err("PLL(%d) lock failed\n", pll_7nm->id);
+		pr_err("PLL(%d) lock failed\n", pll_7nm->phy->id);
 		goto error;
 	}
 
@@ -516,7 +513,7 @@ static unsigned long dsi_pll_7nm_vco_recalc_rate(struct clk_hw *hw,
 	vco_rate = pll_freq;
 
 	DBG("DSI PLL%d returning vco rate = %lu, dec = %x, frac = %x",
-	    pll_7nm->id, (unsigned long)vco_rate, dec, frac);
+	    pll_7nm->phy->id, (unsigned long)vco_rate, dec, frac);
 
 	return (unsigned long)vco_rate;
 }
@@ -565,7 +562,7 @@ static void dsi_7nm_save_state(struct msm_dsi_phy *phy)
 	cached->pll_mux = cmn_clk_cfg1 & 0x3;
 
 	DBG("DSI PLL%d outdiv %x bit_clk_div %x pix_clk_div %x pll_mux %x",
-	    pll_7nm->id, cached->pll_out_div, cached->bit_clk_div,
+	    pll_7nm->phy->id, cached->pll_out_div, cached->bit_clk_div,
 	    cached->pix_clk_div, cached->pll_mux);
 }
 
@@ -592,12 +589,12 @@ static int dsi_7nm_restore_state(struct msm_dsi_phy *phy)
 
 	ret = dsi_pll_7nm_vco_set_rate(phy->vco_hw, pll_7nm->vco_current_rate, pll_7nm->vco_ref_clk_rate);
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
@@ -608,13 +605,13 @@ static int dsi_7nm_set_usecase(struct msm_dsi_phy *phy)
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
@@ -646,21 +643,21 @@ static int pll_7nm_register(struct dsi_pll_7nm *pll_7nm, struct clk_hw_onecell_d
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
@@ -672,8 +669,8 @@ static int pll_7nm_register(struct dsi_pll_7nm *pll_7nm, struct clk_hw_onecell_d
 		goto fail;
 	}
 
-	snprintf(clk_name, 32, "dsi%d_pll_bit_clk", pll_7nm->id);
-	snprintf(parent, 32, "dsi%d_pll_out_div_clk", pll_7nm->id);
+	snprintf(clk_name, 32, "dsi%d_pll_bit_clk", pll_7nm->phy->id);
+	snprintf(parent, 32, "dsi%d_pll_out_div_clk", pll_7nm->phy->id);
 
 	/* BIT CLK: DIV_CTRL_3_0 */
 	hw = devm_clk_hw_register_divider(dev, clk_name, parent,
@@ -687,8 +684,8 @@ static int pll_7nm_register(struct dsi_pll_7nm *pll_7nm, struct clk_hw_onecell_d
 		goto fail;
 	}
 
-	snprintf(clk_name, 32, "dsi%d_phy_pll_out_byteclk", pll_7nm->id);
-	snprintf(parent, 32, "dsi%d_pll_bit_clk", pll_7nm->id);
+	snprintf(clk_name, 32, "dsi%d_phy_pll_out_byteclk", pll_7nm->phy->id);
+	snprintf(parent, 32, "dsi%d_pll_bit_clk", pll_7nm->phy->id);
 
 	/* DSI Byte clock = VCO_CLK / OUT_DIV / BIT_DIV / 8 */
 	hw = devm_clk_hw_register_fixed_factor(dev, clk_name, parent,
@@ -700,8 +697,8 @@ static int pll_7nm_register(struct dsi_pll_7nm *pll_7nm, struct clk_hw_onecell_d
 
 	provided_clocks->hws[DSI_BYTE_PLL_CLK] = hw;
 
-	snprintf(clk_name, 32, "dsi%d_pll_by_2_bit_clk", pll_7nm->id);
-	snprintf(parent, 32, "dsi%d_pll_bit_clk", pll_7nm->id);
+	snprintf(clk_name, 32, "dsi%d_pll_by_2_bit_clk", pll_7nm->phy->id);
+	snprintf(parent, 32, "dsi%d_pll_bit_clk", pll_7nm->phy->id);
 
 	hw = devm_clk_hw_register_fixed_factor(dev, clk_name, parent,
 					  0, 1, 2);
@@ -710,8 +707,8 @@ static int pll_7nm_register(struct dsi_pll_7nm *pll_7nm, struct clk_hw_onecell_d
 		goto fail;
 	}
 
-	snprintf(clk_name, 32, "dsi%d_pll_post_out_div_clk", pll_7nm->id);
-	snprintf(parent, 32, "dsi%d_pll_out_div_clk", pll_7nm->id);
+	snprintf(clk_name, 32, "dsi%d_pll_post_out_div_clk", pll_7nm->phy->id);
+	snprintf(parent, 32, "dsi%d_pll_out_div_clk", pll_7nm->phy->id);
 
 	hw = devm_clk_hw_register_fixed_factor(dev, clk_name, parent,
 					  0, 1, 4);
@@ -720,11 +717,11 @@ static int pll_7nm_register(struct dsi_pll_7nm *pll_7nm, struct clk_hw_onecell_d
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
@@ -737,8 +734,8 @@ static int pll_7nm_register(struct dsi_pll_7nm *pll_7nm, struct clk_hw_onecell_d
 		goto fail;
 	}
 
-	snprintf(clk_name, 32, "dsi%d_phy_pll_out_dsiclk", pll_7nm->id);
-	snprintf(parent, 32, "dsi%d_pclk_mux", pll_7nm->id);
+	snprintf(clk_name, 32, "dsi%d_phy_pll_out_dsiclk", pll_7nm->phy->id);
+	snprintf(parent, 32, "dsi%d_pclk_mux", pll_7nm->phy->id);
 
 	/* PIX CLK DIV : DIV_CTRL_7_4*/
 	hw = devm_clk_hw_register_divider(dev, clk_name, parent,
@@ -763,7 +760,6 @@ static int pll_7nm_register(struct dsi_pll_7nm *pll_7nm, struct clk_hw_onecell_d
 static int dsi_pll_7nm_init(struct msm_dsi_phy *phy)
 {
 	struct platform_device *pdev = phy->pdev;
-	int id = phy->id;
 	struct dsi_pll_7nm *pll_7nm;
 	int ret;
 
@@ -771,11 +767,9 @@ static int dsi_pll_7nm_init(struct msm_dsi_phy *phy)
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
