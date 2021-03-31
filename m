Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 847DA34FE74
	for <lists+dri-devel@lfdr.de>; Wed, 31 Mar 2021 12:58:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F4306EA57;
	Wed, 31 Mar 2021 10:57:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D59466EA51
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 10:57:46 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id u4so23334809ljo.6
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 03:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zZzZotO+uxkFz3VvN1INWv46F9oImxt5pnat2lZqAPg=;
 b=KaSstsvjX91Uj7PPFFnGmijfjPia4g28ILZppMizp7EIr4B00yIhqJMjDtzJzmZReo
 JkBmuGxkqvNyi2vw8bcsgwdZOVMVnHxvWbW8dmxq4uXTv9wxA6a+WnSKLF1j+BajdysO
 L0p9/apSqJm6aDQU1ZVPEqF8trfacgWrMIw9VHftvQDqS4asir0QAHf0mBAM0qyco0SH
 C2O5gS1UEXGrfJF/go5/PYPC6VadhApB+9INR1CbE6UuDT0VxPKnJ/ofH3KkD3mFIIZn
 VicmDHVk3X+F6nlgehXfFUj7sHV7RkqICzrJeQp4/TL0AdPTkp4N3EawP/VRgS2bVx18
 TgkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zZzZotO+uxkFz3VvN1INWv46F9oImxt5pnat2lZqAPg=;
 b=Oold9KyaIonIH4JKbxf+pkc79/iSqDLvugEwAi78DRowH25aua51XaL/h+QNnxBrzq
 dlrlAC939oGdJHPtTkrH1K5fEg5Ht+bEvAXDHzZIhMDh9QBEiNnMIRCvqB7yg8LkqSJ+
 iIMxzrQyVHitZRsPAM55GwZ+lxm0d+p5csiBo8Oqd5XGp7940mUZBJP1Yt/3E3z8trZo
 yLAi25QbWgS3y0+LUUbjfOuN9h9SQYz2i4voxlH5UJC+UtQHihJ6GGEZ6/TcOdoJ97Pa
 QCvj60yYxOrXchjpSX6q0RvmBUmnafvB4vOdy3xdvSc/jzNxBUPSL1Yh7m2gK59nhmRp
 v0EA==
X-Gm-Message-State: AOAM530Qt+z3IixWTDJoy+MBG3Vg1+SZ+2mJpzJBo0krAsRw3drtRVG/
 oEC/EAiDsjnMVcZArXIp8e7W1Q==
X-Google-Smtp-Source: ABdhPJxm936jSBRjZ+aiDrKoZpwHR+akLI3/lQNHKX6nSdCNk4oTTUssAk1MRLq6mkn5SqxfULjs5w==
X-Received: by 2002:a2e:810a:: with SMTP id d10mr1659590ljg.304.1617188265275; 
 Wed, 31 Mar 2021 03:57:45 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id h3sm184359ljc.67.2021.03.31.03.57.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Mar 2021 03:57:44 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Jonathan Marek <jonathan@marek.ca>,
 Michael Turquette <mturquette@baylibre.com>
Subject: [PATCH v4 09/24] drm/msm/dsi: remove msm_dsi_pll_set_usecase
Date: Wed, 31 Mar 2021 13:57:20 +0300
Message-Id: <20210331105735.3690009-10-dmitry.baryshkov@linaro.org>
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

msm_dsi_pll_set_usecase() function is not used outside of individual DSI
PHY drivers, so drop it in favour of calling the the respective
set_usecase functions directly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
Tested-by: Stephen Boyd <swboyd@chromium.org> # on sc7180 lazor
---
 drivers/gpu/drm/msm/dsi/dsi.h              | 7 -------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h      | 2 --
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c | 4 +---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c | 4 +---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c  | 4 +---
 drivers/gpu/drm/msm/dsi/phy/dsi_pll.c      | 9 ---------
 6 files changed, 3 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
index 98a4b296fa30..b310cf344ed4 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.h
+++ b/drivers/gpu/drm/msm/dsi/dsi.h
@@ -100,8 +100,6 @@ int msm_dsi_pll_get_clk_provider(struct msm_dsi_pll *pll,
 	struct clk **byte_clk_provider, struct clk **pixel_clk_provider);
 void msm_dsi_pll_save_state(struct msm_dsi_pll *pll);
 int msm_dsi_pll_restore_state(struct msm_dsi_pll *pll);
-int msm_dsi_pll_set_usecase(struct msm_dsi_pll *pll,
-			    enum msm_dsi_phy_usecase uc);
 #else
 static inline void msm_dsi_pll_destroy(struct msm_dsi_pll *pll)
 {
@@ -118,11 +116,6 @@ static inline int msm_dsi_pll_restore_state(struct msm_dsi_pll *pll)
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
index 000e4207dabc..f737bef74b91 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
@@ -29,8 +29,6 @@ struct msm_dsi_pll_ops {
 	void (*destroy)(struct msm_dsi_pll *pll);
 	void (*save_state)(struct msm_dsi_pll *pll);
 	int (*restore_state)(struct msm_dsi_pll *pll);
-	int (*set_usecase)(struct msm_dsi_pll *pll,
-			   enum msm_dsi_phy_usecase uc);
 };
 
 struct msm_dsi_phy_cfg {
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
index 5f9d0cfc4e03..7a98e420414f 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
@@ -1049,7 +1049,7 @@ static int dsi_10nm_phy_enable(struct msm_dsi_phy *phy, int src_pll_id,
 	/* Select full-rate mode */
 	dsi_phy_write(base + REG_DSI_10nm_PHY_CMN_CTRL_2, 0x40);
 
-	ret = msm_dsi_pll_set_usecase(phy->pll, phy->usecase);
+	ret = dsi_pll_10nm_set_usecase(phy->pll, phy->usecase);
 	if (ret) {
 		DRM_DEV_ERROR(&phy->pdev->dev, "%s: set pll usecase failed, %d\n",
 			__func__, ret);
@@ -1109,7 +1109,6 @@ const struct msm_dsi_phy_cfg dsi_phy_10nm_cfgs = {
 		.destroy = dsi_pll_10nm_destroy,
 		.save_state = dsi_pll_10nm_save_state,
 		.restore_state = dsi_pll_10nm_restore_state,
-		.set_usecase = dsi_pll_10nm_set_usecase,
 	},
 	.min_pll_rate = 1000000000UL,
 	.max_pll_rate = 3500000000UL,
@@ -1136,7 +1135,6 @@ const struct msm_dsi_phy_cfg dsi_phy_10nm_8998_cfgs = {
 		.destroy = dsi_pll_10nm_destroy,
 		.save_state = dsi_pll_10nm_save_state,
 		.restore_state = dsi_pll_10nm_restore_state,
-		.set_usecase = dsi_pll_10nm_set_usecase,
 	},
 	.min_pll_rate = 1000000000UL,
 	.max_pll_rate = 3500000000UL,
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
index 8e4528301e5d..bab86fa6dc4b 100644
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
@@ -1231,7 +1231,6 @@ const struct msm_dsi_phy_cfg dsi_phy_14nm_cfgs = {
 		.destroy = dsi_pll_14nm_destroy,
 		.save_state = dsi_pll_14nm_save_state,
 		.restore_state = dsi_pll_14nm_restore_state,
-		.set_usecase = dsi_pll_14nm_set_usecase,
 		.disable_seq = dsi_pll_14nm_disable_seq,
 		.enable_seq = dsi_pll_14nm_enable_seq,
 	},
@@ -1260,7 +1259,6 @@ const struct msm_dsi_phy_cfg dsi_phy_14nm_660_cfgs = {
 		.destroy = dsi_pll_14nm_destroy,
 		.save_state = dsi_pll_14nm_save_state,
 		.restore_state = dsi_pll_14nm_restore_state,
-		.set_usecase = dsi_pll_14nm_set_usecase,
 		.disable_seq = dsi_pll_14nm_disable_seq,
 		.enable_seq = dsi_pll_14nm_enable_seq,
 	},
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index 4831d6769da7..5acdfe1f63be 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -1064,7 +1064,7 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy, int src_pll_id,
 	/* Select full-rate mode */
 	dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_CTRL_2, 0x40);
 
-	ret = msm_dsi_pll_set_usecase(phy->pll, phy->usecase);
+	ret = dsi_pll_7nm_set_usecase(phy->pll, phy->usecase);
 	if (ret) {
 		DRM_DEV_ERROR(&phy->pdev->dev, "%s: set pll usecase failed, %d\n",
 			__func__, ret);
@@ -1142,7 +1142,6 @@ const struct msm_dsi_phy_cfg dsi_phy_7nm_cfgs = {
 		.destroy = dsi_pll_7nm_destroy,
 		.save_state = dsi_pll_7nm_save_state,
 		.restore_state = dsi_pll_7nm_restore_state,
-		.set_usecase = dsi_pll_7nm_set_usecase,
 	},
 	.min_pll_rate = 600000000UL,
 	.max_pll_rate = (5000000000ULL < ULONG_MAX) ? 5000000000ULL : ULONG_MAX,
@@ -1170,7 +1169,6 @@ const struct msm_dsi_phy_cfg dsi_phy_7nm_8150_cfgs = {
 		.destroy = dsi_pll_7nm_destroy,
 		.save_state = dsi_pll_7nm_save_state,
 		.restore_state = dsi_pll_7nm_restore_state,
-		.set_usecase = dsi_pll_7nm_set_usecase,
 	},
 	.min_pll_rate = 1000000000UL,
 	.max_pll_rate = 3500000000UL,
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
