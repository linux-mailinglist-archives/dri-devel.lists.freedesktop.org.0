Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C7239498C
	for <lists+dri-devel@lfdr.de>; Sat, 29 May 2021 02:25:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81BAE6EBA0;
	Sat, 29 May 2021 00:25:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 183FF6E833
 for <dri-devel@lists.freedesktop.org>; Sat, 29 May 2021 00:25:18 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id i9so7698290lfe.13
 for <dri-devel@lists.freedesktop.org>; Fri, 28 May 2021 17:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xjGr8zrVoodPGoZ+CmB2tC5N2dK4RzlqkPi3DgmLbfg=;
 b=VuDOOtoBvA0CaQnrlfhc8IsfATwRDUEvlzzBZ+oA7N9cflulstBufYmDbG/evOUwLb
 x/g7Dpc9j0x7S1V8GC2Uu6INlHOjwtoPQeVhxQU72H8cWed6G1pVYkD2IvdIfzdJGGam
 sFU2jDtsrFd7Me2icggO5qUR5lyIcjnqJr49M0Q7E+rcymTOok69wHghbv34/dFfSqe0
 VOvMfgVKftK0HWRR4apYZ8IxhiISXZrx/uzTw1cn+4jzKVB9dn6O0b8/YPFMkEPunsXc
 1qH1oWiFnqyGFBXFmN0rThBWHjF54fISqox8BviWBr62tkyxuhZaRpx6Hn2ZfmGIfLx1
 1NTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xjGr8zrVoodPGoZ+CmB2tC5N2dK4RzlqkPi3DgmLbfg=;
 b=Cdd+h81mccKiUGKrUS6BpJkerTVYXidJnwE/zgDv0do4VicI8lems+ybxFDhQDmPwj
 BjPMtiDYzs3P2JQDJt1rZSKRG+vdSWEqSpXrBhTOk+nusRwTXnoEI8sPYi5NrhFBC+cJ
 IPo0i03/FV1ZsHOpzq7yFVHiRA2bGgHxfDIZzowk83xrFRwpwzTHO0/VYSsKH1vJ3w+7
 NoT5159V0hfOinPIMEK3Zut2k0QgCwJYMiDQsjEEycOpOTcimobQ7pQvl5xFpw5nQQDA
 r7/ZFTNMzZuE3c7iwffSKTU5Nmc1bFG3MPnbBILPCTTCJKjxFhsGvtjLulzP06pS6J3J
 ckfw==
X-Gm-Message-State: AOAM530wcUnr8PgTNRujPm+FbxP/roocvVFvg9Xspu7e3ohmAzuHFa9K
 deKB0zd7YOZY5pzYI1dGdr4Hew==
X-Google-Smtp-Source: ABdhPJw22wrdYu0yhkTcrdRn6v+jdyyDFi0zoH9wEQAMDNpmWZz54XvGUxbZPywma0aMj80RT+o5xw==
X-Received: by 2002:a19:ee15:: with SMTP id g21mr7601957lfb.338.1622247916549; 
 Fri, 28 May 2021 17:25:16 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id c8sm701078ljd.82.2021.05.28.17.25.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 May 2021 17:25:16 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Michael Turquette <mturquette@baylibre.com>
Subject: [RFC 1/8] drm/msm/dsi: make msm_dsi_phy_pll_restore_state static
 function
Date: Sat, 29 May 2021 03:25:01 +0300
Message-Id: <20210529002508.3839467-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210529002508.3839467-1-dmitry.baryshkov@linaro.org>
References: <20210529002508.3839467-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

msm_dsi_phy_pll_restore_state() is only called from msm_dsi_phy_enable(),
so there is no need to export it. Mark it static.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi.h         |  1 -
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c | 30 +++++++++++++--------------
 2 files changed, 15 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
index 876053ba615b..c467ad609453 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.h
+++ b/drivers/gpu/drm/msm/dsi/dsi.h
@@ -170,7 +170,6 @@ void msm_dsi_phy_disable(struct msm_dsi_phy *phy);
 void msm_dsi_phy_set_usecase(struct msm_dsi_phy *phy,
 			     enum msm_dsi_phy_usecase uc);
 void msm_dsi_phy_pll_save_state(struct msm_dsi_phy *phy);
-int msm_dsi_phy_pll_restore_state(struct msm_dsi_phy *phy);
 void msm_dsi_phy_snapshot(struct msm_disp_state *disp_state, struct msm_dsi_phy *phy);
 
 #endif /* __DSI_CONNECTOR_H__ */
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
index f479e37d6428..36878504bbb8 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
@@ -559,6 +559,21 @@ static void dsi_phy_disable_resource(struct msm_dsi_phy *phy)
 	pm_runtime_put_autosuspend(&phy->pdev->dev);
 }
 
+static int msm_dsi_phy_pll_restore_state(struct msm_dsi_phy *phy)
+{
+	int ret;
+
+	if (phy->cfg->ops.restore_pll_state && phy->state_saved) {
+		ret = phy->cfg->ops.restore_pll_state(phy);
+		if (ret)
+			return ret;
+
+		phy->state_saved = false;
+	}
+
+	return 0;
+}
+
 static const struct of_device_id dsi_phy_dt_match[] = {
 #ifdef CONFIG_DRM_MSM_DSI_28NM_PHY
 	{ .compatible = "qcom,dsi-phy-28nm-hpm",
@@ -838,21 +853,6 @@ void msm_dsi_phy_pll_save_state(struct msm_dsi_phy *phy)
 	}
 }
 
-int msm_dsi_phy_pll_restore_state(struct msm_dsi_phy *phy)
-{
-	int ret;
-
-	if (phy->cfg->ops.restore_pll_state && phy->state_saved) {
-		ret = phy->cfg->ops.restore_pll_state(phy);
-		if (ret)
-			return ret;
-
-		phy->state_saved = false;
-	}
-
-	return 0;
-}
-
 void msm_dsi_phy_snapshot(struct msm_disp_state *disp_state, struct msm_dsi_phy *phy)
 {
 	msm_disp_snapshot_add_block(disp_state,
-- 
2.30.2

