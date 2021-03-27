Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 429F234B6A0
	for <lists+dri-devel@lfdr.de>; Sat, 27 Mar 2021 12:03:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7387D6F52D;
	Sat, 27 Mar 2021 11:03:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E852A6F52A
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Mar 2021 11:03:24 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id g8so11471267lfv.12
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Mar 2021 04:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=F6SPcQ3rOU1M+d5rn+hxpcarF5MAsSjTj9sicv1mJgY=;
 b=huNFz/oEwPOiR79RlXRp6FuOWGcy8j0Ng1Faq2cBsCpo5fq6ZnSn2F/O0SeNeIKUOg
 RBSDZnaCyjnfNekNc3dDCSu2P8iNSmFAShqivCcum59kA5QLt5hPFx2F+qV/LLzAC55N
 XPNI+vwcDMNzbklzkd3Z37QYoQdeTzq86f197uzFF1pDc6yzVAKdv+bYGc5cRwlnnR6B
 keTMiMj5vLut+Zm/T1oTXid+mmhOEhTtbwVvfAF9DlrFkCIVgnnbqpZguqYn9sJ39v96
 0SrH3cvMKYIRSuaNBSeGqpqodclI4JQex+NVeRAPf0L/TIewM0MGtjcwlcmSqbVLlX/f
 +Xcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=F6SPcQ3rOU1M+d5rn+hxpcarF5MAsSjTj9sicv1mJgY=;
 b=JFwxdloQuEELHiz9i7NNE309hsHHO8dwZFZQqzRK1Edcoq6t+OyDFK20+mjixgc75/
 8vkzZ4U6RJaf2C2w6jyO83AE6+IVf/bQrrCC1tN1PdTrIBfYkeBcJnn7wPKXS0vehMbG
 drBvPA3UDlniUsVR2dqisJXRLuuckWgIVCRrs1UzLcg2aBy1CZpbLT0iW6pMGzZm8w7U
 URR8G2SsML0RA5p8JsLiA1SISnuDxFLss3lMp04+fEXSneBRRt14Jq63eOHxzsHEWgFL
 R9PSCX3viyeVOO979TMZlVkozumtboWT0NIRdniuWbvANAgnRgRKR0sXZo95O35hQb5n
 5hcA==
X-Gm-Message-State: AOAM53322DZyY8npklUQu7rPEEfwJJFTYkJZ3Ew5HeSR8SZQPo5QE83/
 NjT5ihihTVgD1ma9+GWfSt7xAQ==
X-Google-Smtp-Source: ABdhPJyny2FRmPgYfygPAX1Zzc4mSw6F0GUvwVL4W9YKGq5d2gD3cyLxjX77w1gyUoAjDlB/TaBZIw==
X-Received: by 2002:a19:521a:: with SMTP id m26mr11170274lfb.56.1616843003378; 
 Sat, 27 Mar 2021 04:03:23 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id a8sm1513801ljn.96.2021.03.27.04.03.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Mar 2021 04:03:23 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Jonathan Marek <jonathan@marek.ca>,
 Michael Turquette <mturquette@baylibre.com>
Subject: [PATCH v3 15/25] drm/msm/dsi: drop vco_delay setting from 7nm, 10nm,
 14nm drivers
Date: Sat, 27 Mar 2021 14:02:55 +0300
Message-Id: <20210327110305.3289784-16-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210327110305.3289784-1-dmitry.baryshkov@linaro.org>
References: <20210327110305.3289784-1-dmitry.baryshkov@linaro.org>
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

These drivers do not use vco_delay variable, so drop it from all of
them.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c | 3 ---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c | 4 ----
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c  | 3 ---
 3 files changed, 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
index e0df12a841b2..bfb96d87d1d7 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
@@ -99,7 +99,6 @@ struct dsi_pll_10nm {
 	/* protects REG_DSI_10nm_PHY_CMN_CLK_CFG0 register */
 	spinlock_t postdiv_lock;
 
-	int vco_delay;
 	struct dsi_pll_config pll_configuration;
 	struct dsi_pll_regs reg_setup;
 
@@ -771,8 +770,6 @@ static int dsi_pll_10nm_init(struct msm_dsi_phy *phy)
 	pll = &pll_10nm->base;
 	pll->cfg = phy->cfg;
 
-	pll_10nm->vco_delay = 1;
-
 	ret = pll_10nm_register(pll_10nm, phy->provided_clocks->hws);
 	if (ret) {
 		DRM_DEV_ERROR(&pdev->dev, "failed to register PLL: %d\n", ret);
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
index 7fe7c8348b42..434d02ffa7fe 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
@@ -122,8 +122,6 @@ struct dsi_pll_14nm {
 	void __iomem *phy_cmn_mmio;
 	void __iomem *mmio;
 
-	int vco_delay;
-
 	struct dsi_pll_input in;
 	struct dsi_pll_output out;
 
@@ -1012,8 +1010,6 @@ static int dsi_pll_14nm_init(struct msm_dsi_phy *phy)
 	pll = &pll_14nm->base;
 	pll->cfg = phy->cfg;
 
-	pll_14nm->vco_delay = 1;
-
 	ret = pll_14nm_register(pll_14nm, phy->provided_clocks->hws);
 	if (ret) {
 		DRM_DEV_ERROR(&pdev->dev, "failed to register PLL: %d\n", ret);
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index e6c8040e1bd3..f760904efac9 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -99,7 +99,6 @@ struct dsi_pll_7nm {
 	/* protects REG_DSI_7nm_PHY_CMN_CLK_CFG0 register */
 	spinlock_t postdiv_lock;
 
-	int vco_delay;
 	struct dsi_pll_config pll_configuration;
 	struct dsi_pll_regs reg_setup;
 
@@ -796,8 +795,6 @@ static int dsi_pll_7nm_init(struct msm_dsi_phy *phy)
 	pll = &pll_7nm->base;
 	pll->cfg = phy->cfg;
 
-	pll_7nm->vco_delay = 1;
-
 	ret = pll_7nm_register(pll_7nm, phy->provided_clocks->hws);
 	if (ret) {
 		DRM_DEV_ERROR(&pdev->dev, "failed to register PLL: %d\n", ret);
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
