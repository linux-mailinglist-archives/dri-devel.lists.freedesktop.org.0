Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92566C0DDE0
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 14:09:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8572410E495;
	Mon, 27 Oct 2025 13:09:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="enVivuwS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52A3B10E491
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 13:09:54 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-47112edf9f7so28742135e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 06:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761570593; x=1762175393; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7xHqscrzYkhG2lIf/Jsl1phTlISUiUsYRQ5MheVDiOs=;
 b=enVivuwSyq4G31QJJuxqLEzwXIEcNA2iKfP+9l9JBEq1lMzngOA6MatdrKLxfy0HCB
 qOYAfelPSQOhq09NWe+uWbOTByNXiEIVJDl7SsvBzE47kV7AAgcacMWdAGrqL7CCAfrg
 0Ynvxf0Y/iOW2WI/tMqM5k01COzHN2i+XSPp+FPQgK9heqsFdz6FFwbkneqnHGErTy2E
 6KeTZyuOBFynpIlmH2PJ8piTaOYDs9p9lUvjTIc6kccqZIetyNSndncsfaIfCkp7zm2d
 srWJsZrA6BPIoiaFP5nvFUglSxIPMR1XSRjkLdSbgwLvGCToA402MKk+aLNpNFdCGK6+
 kXZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761570593; x=1762175393;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7xHqscrzYkhG2lIf/Jsl1phTlISUiUsYRQ5MheVDiOs=;
 b=onGR/2j2TdvrWbT7yFbOs8qaapZ0Ye+FFaGUaeStfcyfHIzi65N46/xY55mV4eyAWG
 Bnq9547aIph83a1YFbIuAaoZWGIfFCm9L8sspIap87hbQMhzTUEGMF8xl04oXx18ciXg
 nTGM0Na3xObgUuBapncOirtMZMJcVJEKtg0OTaPBVLcf4yJ5Jcx7CO5vUVURzGSYIWHD
 6OkseDUpObiDQAm40ilXpntQB0c6/+HoK+frDJmF9rSsX2gkWODlv1pHWjRNAq5P0OSe
 hoUj0toRfjsLesSpBrVtFc9grWeaEA6jgO0j0oNCgqP5COiydxwzO7ptfOkYkrgI8jgw
 FxEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVD6Vky1m/kwzQxqg1Jb6ArLR6LQnDH17kLdGKJ62n8OGq26hug0JqfZSXtQQ5dj7aOwg//TKZRKHs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwS5iZ+exCAYw3b18X1Hl1ttV7kBaeMr1wqteAzeMCt1n1lKMsA
 37GCZiNduV1XvdkNwRKBQZejg3kxTUtzslJc0YqDdKGzPGAZ+lfiu0oM0E2xg7bjKFQ=
X-Gm-Gg: ASbGnculbJb/ZNY9osdCvglXfTfq8njN/vpWeBgipwz+fcwTPNCpEvMSoLiJXrlHl1I
 JtminXQP3M/UreSEP9oPN6MZ0Wvajjha1XF90t+lY1yEBYK47YcHE1vWn3N3t2nVgd00+rT/OQx
 VETj2zm8qCfM3psuQWoOAF/FTCBKYiuveL3702wSEtnoKCSytwe561KeCtsrgWX8RNw3sJNd7ts
 WuKWDJhE4ZqdUm3GKvPfKFmZo0dB6OBS239ZgwcIuG9zWXx1qmJdBu1fzyRg7WFcaBJNyvifke0
 Q3/m4Wl34XuvGc3HlSrsqJhuYZ7cxC+WCtqiqcMtQx9+Hd2ij8dnh/H3LTkBVpdbqXqKmvvgWwv
 7FGFNxMxv822ihE/lK6tdhHfGETreowswvyR9sQJbrraaa9qkVTzYsl6DAkpbb5akipD8GAuZqv
 NZg8zx17IQd9J36qLIuiSc
X-Google-Smtp-Source: AGHT+IES8xCzwpBsCQMT7GZryto4tnTz3LOicS2l1sLDuWYyCwc2CWGgf/Z8oXRtYtgEbL2ufaMPZg==
X-Received: by 2002:a05:600c:1f96:b0:46e:37af:f90e with SMTP id
 5b1f17b1804b1-475caf933dfmr109940175e9.6.1761570592580; 
 Mon, 27 Oct 2025 06:09:52 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475dd02cbc6sm139149285e9.1.2025.10.27.06.09.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Oct 2025 06:09:52 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 27 Oct 2025 14:09:48 +0100
Subject: [PATCH] drm/msm: dsi: fix PLL init in bonded mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251027-topic-sm8x50-fix-dsi-bonded-v1-1-a477cd3f907d@linaro.org>
X-B4-Tracking: v=1; b=H4sIABtv/2gC/x3MwQrDIAyA4VcpOTeQCmVhrzJ2sJq2OUzFjFEQ3
 72y4wc/fwOTqmLwnBpU+alpTgPLPEE4fToENQ6DI7cu5B74zUUD2oevlXDXC6MpbjlFiRiYd2b
 ywZOHcShVRvG/v9693wp7roxtAAAA
X-Change-ID: 20251027-topic-sm8x50-fix-dsi-bonded-c88f880aca0a
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5010;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=0MHhWYGX/kbhklk4DTUuJkE6nUV8ISJicJLum5nXkNU=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBo/28fcTyjsx9+jqX/RPpQrS3hH4JRvm2XTgGFUHBT
 3aFNE+6JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaP9vHwAKCRB33NvayMhJ0XBpD/
 9kiq1CGfJJbbh6rIVJ9bniOAQCW8pruCTIMe1D4yZfxSqJAaYrzZvR89iEBfajyJvrFiEGNg1dfGAH
 9LeIYJOV+gX3gJCk+SGZwVtdn+3bAcp4tStw3twUpVFhoZzbw0MQJjmW5zSb6NnhIxUx40A9WE6PpI
 AgI3pCr5vsT85jofDyet7G0ODbyCMru+wRxfgb7XtF6ZZIv9rJfhmFUkNKcTsGyGUsmg4F/vCRbrj6
 bO3sWb68alm2oyd9MeafibQzE4B6QBA0SADlZUIZ4zoW6Mecr0hNxdtbtcZZFe2E7FyZgargV5AgOv
 oDPWdTyVoZIMRUJVwOwtU/DQoe1JU1BRzIJFLyXNjI0PmsjEf4JhKpzcM1Zlkq1Ko7zqN3U+9XgyZt
 2gBhZWEWfIce6HWEpPXDyk7Ihd23JEKLbBpR9G6rrdgmArUPErY17O8yGiyqF2wGIoOXc23IV/KQUg
 qOuGCdx65bSimelkoG054sv2igele2nlxr66kIxLe+VXw9yEOtiGfDMTPAX5s79vDIHOUCi4w/9lJ3
 qtCSgkgka15Dmo91Bn5jxYEvCtA0djtn16j7wsiijMTU0/W1fT7r3jzgInEqaKUnBS3b2wqvRV8IrA
 uVPGOnU3zRpYjKVXEIIMfAPFcF/YjLErCo1J3cgR96GfwKC82C3p/M5Atn0Q==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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

When in bonded DSI mode, only one PLL in one DSI PHY is used for both
DSI PHYs, meaning that parents of the secondary DSI PHY will use the
primary DSI PHY PLL as parent.

In this case the primary DSI PHY PLL will be set even if the primary
DSI PHY is not yet enabled. The DSI PHY code has support for this
particular use-case and will handle the fact the PLL was already
set when initializing the primary DSI PHY.

By introducing a protected variable pll_enable_cnt in the commit
cb55f39bf7b1 ("drm/msm/dsi/phy: Fix reading zero as PLL rates when unprepared"),
this variable is only initially set to 1 when the DSI PHY is initialized
making it impossible to set the PLL before, breaking the bonded DSI
use case by returning 0 when setting the PLL from the secondary DSI
PHY driver and skipping the correct clocks initialization.

But since it was already possible to set the PLL without enabling
the DSI PHY, just drop the pll_enable_cnt setting from the PHY
enable/disable and simply increment/decrement the pll_enable_cnt
variable from the dsi_pll_enable/disable_pll_bias to make sure any
PLL operation is done with the PLL BIAS enabled.

Fixes: cb55f39bf7b1 ("drm/msm/dsi/phy: Fix reading zero as PLL rates when unprepared")
Closes: https://lore.kernel.org/all/50a49d72-2b1e-471d-b0c4-d5a0b38b2a21@linaro.org/
Tested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h     |  1 -
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 18 ++----------------
 2 files changed, 2 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
index e391505fdaf0..3cbf08231492 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
@@ -109,7 +109,6 @@ struct msm_dsi_phy {
 	struct msm_dsi_dphy_timing timing;
 	const struct msm_dsi_phy_cfg *cfg;
 	void *tuning_cfg;
-	void *pll_data;
 
 	enum msm_dsi_phy_usecase usecase;
 	bool regulator_ldo_mode;
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index 32f06edd21a9..c5e1d2016bcc 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -426,11 +426,8 @@ static void dsi_pll_enable_pll_bias(struct dsi_pll_7nm *pll)
 	u32 data;
 
 	spin_lock_irqsave(&pll->pll_enable_lock, flags);
-	if (pll->pll_enable_cnt++) {
-		spin_unlock_irqrestore(&pll->pll_enable_lock, flags);
-		WARN_ON(pll->pll_enable_cnt == INT_MAX);
-		return;
-	}
+	pll->pll_enable_cnt++;
+	WARN_ON(pll->pll_enable_cnt == INT_MAX);
 
 	data = readl(pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);
 	data |= DSI_7nm_PHY_CMN_CTRL_0_PLL_SHUTDOWNB;
@@ -876,7 +873,6 @@ static int dsi_pll_7nm_init(struct msm_dsi_phy *phy)
 	spin_lock_init(&pll_7nm->pll_enable_lock);
 
 	pll_7nm->phy = phy;
-	phy->pll_data = pll_7nm;
 
 	ret = pll_7nm_register(pll_7nm, phy->provided_clocks->hws);
 	if (ret) {
@@ -965,10 +961,8 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy,
 	u32 const delay_us = 5;
 	u32 const timeout_us = 1000;
 	struct msm_dsi_dphy_timing *timing = &phy->timing;
-	struct dsi_pll_7nm *pll = phy->pll_data;
 	void __iomem *base = phy->base;
 	bool less_than_1500_mhz;
-	unsigned long flags;
 	u32 vreg_ctrl_0, vreg_ctrl_1, lane_ctrl0;
 	u32 glbl_pemph_ctrl_0;
 	u32 glbl_str_swi_cal_sel_ctrl, glbl_hstx_str_ctrl_0;
@@ -1090,13 +1084,10 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy,
 		glbl_rescode_bot_ctrl = 0x3c;
 	}
 
-	spin_lock_irqsave(&pll->pll_enable_lock, flags);
-	pll->pll_enable_cnt = 1;
 	/* de-assert digital and pll power down */
 	data = DSI_7nm_PHY_CMN_CTRL_0_DIGTOP_PWRDN_B |
 	       DSI_7nm_PHY_CMN_CTRL_0_PLL_SHUTDOWNB;
 	writel(data, base + REG_DSI_7nm_PHY_CMN_CTRL_0);
-	spin_unlock_irqrestore(&pll->pll_enable_lock, flags);
 
 	/* Assert PLL core reset */
 	writel(0x00, base + REG_DSI_7nm_PHY_CMN_PLL_CNTRL);
@@ -1209,9 +1200,7 @@ static bool dsi_7nm_set_continuous_clock(struct msm_dsi_phy *phy, bool enable)
 
 static void dsi_7nm_phy_disable(struct msm_dsi_phy *phy)
 {
-	struct dsi_pll_7nm *pll = phy->pll_data;
 	void __iomem *base = phy->base;
-	unsigned long flags;
 	u32 data;
 
 	DBG("");
@@ -1238,11 +1227,8 @@ static void dsi_7nm_phy_disable(struct msm_dsi_phy *phy)
 	writel(data, base + REG_DSI_7nm_PHY_CMN_CTRL_0);
 	writel(0, base + REG_DSI_7nm_PHY_CMN_LANE_CTRL0);
 
-	spin_lock_irqsave(&pll->pll_enable_lock, flags);
-	pll->pll_enable_cnt = 0;
 	/* Turn off all PHY blocks */
 	writel(0x00, base + REG_DSI_7nm_PHY_CMN_CTRL_0);
-	spin_unlock_irqrestore(&pll->pll_enable_lock, flags);
 
 	/* make sure phy is turned off */
 	wmb();

---
base-commit: dcb6fa37fd7bc9c3d2b066329b0d27dedf8becaa
change-id: 20251027-topic-sm8x50-fix-dsi-bonded-c88f880aca0a

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>

