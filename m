Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C646333F330
	for <lists+dri-devel@lfdr.de>; Wed, 17 Mar 2021 15:41:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27EF26E7D1;
	Wed, 17 Mar 2021 14:41:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D58866E5C6
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Mar 2021 14:40:50 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id t18so3352844lfl.3
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Mar 2021 07:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ahL5+VEakuncRGyfgrlsgLMT2IaVaHgy2g1dSzc7sdk=;
 b=NH6vYBA/EG7RPiF3BEkrWOFfwAoMQMg3cnBaL5K6GAKEZBLCEcRj8/Ovi4jP9E2sln
 VTOTJzIDfPVxS7EQb5/0+UOWxFtHgSBKtuB55N02XV497v4tQ1yOjG32cs48z+0Z6A1S
 UW1xkOxHA4ZDcWXC+7jPWHazMdJz4JO1ah/TgWgnI7WblnugON9qGYPAwgystKUyzq4q
 Yo5uYuvS9Mb88kXBpjX2ttoclQFKv6+4cVZ8zvphgHLOG7WrR0E/SdNoZZXFRBDnh7y5
 6W/+XSs44F0q4wlWzcbvx2HZfkM2pSJaBaQo+04nh6z/2VuJQx0UxRWN2VKVj8yxQtBY
 /qSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ahL5+VEakuncRGyfgrlsgLMT2IaVaHgy2g1dSzc7sdk=;
 b=dtvJwCHXeJduLJkll0VkB+vOx6+FXDNj7G3TIv8Y1yiflmEygml9FdKu/abw5od2jN
 5Z3JsANEkIrT3aO4/TEWI/O55W6g7JdmaavXLu8vys3Cx5kTAI9nPiAWuQTRTpKKVqQ7
 iSseXad1gB4Pv7SMzRqZh96WQ4R3zoEpAH+DgdAVjyHAc9t8mnlBP7Y+tCY7JT1UbvKU
 tkzuTBgFuGwgrePB7OLXhu4eZTBFrENFn6B5ZY8OMDmhhRU9YLpG3gn0a3G5p62efa67
 wrwL7OFeFuRQPh7tT6yvYYjZGbtcBUCy3J5GWT1NEAnCqfdhjtyITvIHKddVXJ4h1+vL
 +o4g==
X-Gm-Message-State: AOAM531GiUwpRrXWxjrJOMtdLJyCGMsUNDlt0UhvzEcDI1xtUKBVIkDF
 0bqzkfYaKBevd5mByz4C6WZXOw==
X-Google-Smtp-Source: ABdhPJzA4GV52hdyh6kByUU3mqU4ABr1fdQKq1UcPpgpyNFRlpE5ILyALUdAnMJJ6Yin39VPczzPOQ==
X-Received: by 2002:ac2:5df6:: with SMTP id z22mr2543980lfq.485.1615992049183; 
 Wed, 17 Mar 2021 07:40:49 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id q8sm1484309lfc.223.2021.03.17.07.40.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 07:40:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Jonathan Marek <jonathan@marek.ca>,
 Michael Turquette <mturquette@baylibre.com>
Subject: [PATCH v1 07/26] drm/msm/dsi: remove msm_dsi_pll_set_usecase
Date: Wed, 17 Mar 2021 17:40:20 +0300
Message-Id: <20210317144039.556409-8-dmitry.baryshkov@linaro.org>
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

msm_dsi_pll_set_usecase() function is not used outside of individual DSI
PHY drivers, so drop it in favour of calling the the respective
set_usecase functions directly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi.h              | 7 -------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h      | 2 --
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c | 4 +---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c | 4 +---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c  | 4 +---
 drivers/gpu/drm/msm/dsi/phy/dsi_pll.c      | 9 ---------
 6 files changed, 3 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
index 21cf883fb6f1..a130330b97b6 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.h
+++ b/drivers/gpu/drm/msm/dsi/dsi.h
@@ -112,8 +112,6 @@ int msm_dsi_pll_get_clk_provider(struct msm_dsi_pll *pll,
 	struct clk **byte_clk_provider, struct clk **pixel_clk_provider);
 void msm_dsi_pll_save_state(struct msm_dsi_pll *pll);
 int msm_dsi_pll_restore_state(struct msm_dsi_pll *pll);
-int msm_dsi_pll_set_usecase(struct msm_dsi_pll *pll,
-			    enum msm_dsi_phy_usecase uc);
 #else
 static inline void msm_dsi_pll_destroy(struct msm_dsi_pll *pll)
 {
@@ -130,11 +128,6 @@ static inline int msm_dsi_pll_restore_state(struct msm_dsi_pll *pll)
 {
 	return 0;
 }
-static inline int msm_dsi_pll_set_usecase(struct msm_dsi_pll *pll,
-					  enum msm_dsi_phy_usecase uc)
-{
-	return -ENODEV;
-}
 #endif
 
 /* dsi host */
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
index ce2969c63927..b8dd8072d24c 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
@@ -33,8 +33,6 @@ struct msm_dsi_pll_ops {
 	void (*destroy)(struct msm_dsi_pll *pll);
 	void (*save_state)(struct msm_dsi_pll *pll);
 	int (*restore_state)(struct msm_dsi_pll *pll);
-	int (*set_usecase)(struct msm_dsi_pll *pll,
-			   enum msm_dsi_phy_usecase uc);
 };
 
 struct msm_dsi_phy_cfg {
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
index 799d7f44cf6d..339f7a56e555 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
@@ -1046,7 +1046,7 @@ static int dsi_10nm_phy_enable(struct msm_dsi_phy *phy, int src_pll_id,
 	/* Select full-rate mode */
 	dsi_phy_write(base + REG_DSI_10nm_PHY_CMN_CTRL_2, 0x40);
 
-	ret = msm_dsi_pll_set_usecase(phy->pll, phy->usecase);
+	ret = dsi_pll_10nm_set_usecase(phy->pll, phy->usecase);
 	if (ret) {
 		DRM_DEV_ERROR(&phy->pdev->dev, "%s: set pll usecase failed, %d\n",
 			__func__, ret);
@@ -1122,7 +1122,6 @@ const struct msm_dsi_phy_cfg dsi_phy_10nm_cfgs = {
 		.destroy = dsi_pll_10nm_destroy,
 		.save_state = dsi_pll_10nm_save_state,
 		.restore_state = dsi_pll_10nm_restore_state,
-		.set_usecase = dsi_pll_10nm_set_usecase,
 	},
 	.min_pll_rate = 1000000000UL,
 	.max_pll_rate = 3500000000UL,
@@ -1150,7 +1149,6 @@ const struct msm_dsi_phy_cfg dsi_phy_10nm_8998_cfgs = {
 		.destroy = dsi_pll_10nm_destroy,
 		.save_state = dsi_pll_10nm_save_state,
 		.restore_state = dsi_pll_10nm_restore_state,
-		.set_usecase = dsi_pll_10nm_set_usecase,
 	},
 	.min_pll_rate = 1000000000UL,
 	.max_pll_rate = 3500000000UL,
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
index cd66b01ad17d..a141c37d86ab 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
@@ -1190,7 +1190,7 @@ static int dsi_14nm_phy_enable(struct msm_dsi_phy *phy, int src_pll_id,
 				REG_DSI_14nm_PHY_CMN_GLBL_TEST_CTRL,
 				DSI_14nm_PHY_CMN_GLBL_TEST_CTRL_BITCLK_HS_SEL);
 
-	ret = msm_dsi_pll_set_usecase(phy->pll, phy->usecase);
+	ret = dsi_pll_14nm_set_usecase(phy->pll, phy->usecase);
 	if (ret) {
 		DRM_DEV_ERROR(&phy->pdev->dev, "%s: set pll usecase failed, %d\n",
 			__func__, ret);
@@ -1247,7 +1247,6 @@ const struct msm_dsi_phy_cfg dsi_phy_14nm_cfgs = {
 		.destroy = dsi_pll_14nm_destroy,
 		.save_state = dsi_pll_14nm_save_state,
 		.restore_state = dsi_pll_14nm_restore_state,
-		.set_usecase = dsi_pll_14nm_set_usecase,
 		.disable_seq = dsi_pll_14nm_disable_seq,
 		.enable_seq = dsi_pll_14nm_enable_seq,
 	},
@@ -1277,7 +1276,6 @@ const struct msm_dsi_phy_cfg dsi_phy_14nm_660_cfgs = {
 		.destroy = dsi_pll_14nm_destroy,
 		.save_state = dsi_pll_14nm_save_state,
 		.restore_state = dsi_pll_14nm_restore_state,
-		.set_usecase = dsi_pll_14nm_set_usecase,
 		.disable_seq = dsi_pll_14nm_disable_seq,
 		.enable_seq = dsi_pll_14nm_enable_seq,
 	},
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index 5e53682c4275..d34ddf50c5ff 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -1061,7 +1061,7 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy, int src_pll_id,
 	/* Select full-rate mode */
 	dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_CTRL_2, 0x40);
 
-	ret = msm_dsi_pll_set_usecase(phy->pll, phy->usecase);
+	ret = dsi_pll_7nm_set_usecase(phy->pll, phy->usecase);
 	if (ret) {
 		DRM_DEV_ERROR(&phy->pdev->dev, "%s: set pll usecase failed, %d\n",
 			__func__, ret);
@@ -1155,7 +1155,6 @@ const struct msm_dsi_phy_cfg dsi_phy_7nm_cfgs = {
 		.destroy = dsi_pll_7nm_destroy,
 		.save_state = dsi_pll_7nm_save_state,
 		.restore_state = dsi_pll_7nm_restore_state,
-		.set_usecase = dsi_pll_7nm_set_usecase,
 	},
 	.min_pll_rate = 1000000000UL,
 	.max_pll_rate = 3500000000UL,
@@ -1183,7 +1182,6 @@ const struct msm_dsi_phy_cfg dsi_phy_7nm_8150_cfgs = {
 		.destroy = dsi_pll_7nm_destroy,
 		.save_state = dsi_pll_7nm_save_state,
 		.restore_state = dsi_pll_7nm_restore_state,
-		.set_usecase = dsi_pll_7nm_set_usecase,
 	},
 	.min_pll_rate = 600000000UL,
 	.max_pll_rate = (5000000000ULL < ULONG_MAX) ? 5000000000ULL : ULONG_MAX,
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_pll.c b/drivers/gpu/drm/msm/dsi/phy/dsi_pll.c
index e607adffe001..98ee4560581a 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_pll.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_pll.c
@@ -113,12 +113,3 @@ int msm_dsi_pll_restore_state(struct msm_dsi_pll *pll)
 
 	return 0;
 }
-
-int msm_dsi_pll_set_usecase(struct msm_dsi_pll *pll,
-			    enum msm_dsi_phy_usecase uc)
-{
-	if (pll->cfg->pll_ops.set_usecase)
-		return pll->cfg->pll_ops.set_usecase(pll, uc);
-
-	return 0;
-}
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
