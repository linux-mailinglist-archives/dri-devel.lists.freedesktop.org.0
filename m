Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49CD241377D
	for <lists+dri-devel@lfdr.de>; Tue, 21 Sep 2021 18:22:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBDB16E98E;
	Tue, 21 Sep 2021 16:22:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 586916E98E
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 16:22:52 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id p29so82800074lfa.11
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 09:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PvMNvv3sYbU3IT6mahg4mt0FldiKwEFahBq/kmBwdgg=;
 b=g3Bp/l36yCXsaJDwrsykQTfOkJXTOU8gKVlNQbOv9S8KMhOHJ2WaPkIabsknTtxZ0X
 mN2tdJbCtgPrB4D129z/TFLWz0GZR583FE1Nh+qCRIAuo5UtzfrQ9na/etPLuQbssJ1z
 h/ioHUFgE8uQWHX2AH5mQTSIDdhBvafu6rHt0tPZnn7sCRNgXqW3zhR06IlJJsaoTykz
 Jn9mtJIL7LFfkJ2s1GwyD56dmP1oHJBgVh/TqRHKI81O8zUOh73and4beFJFS3uy2hXt
 EnxHPryNwbl3gPT/a/U7U089X08MOz2KkCXZWRsebR22PT3nKiIfemblRuALNWGrD0gP
 9ahw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PvMNvv3sYbU3IT6mahg4mt0FldiKwEFahBq/kmBwdgg=;
 b=tumqd9+F2CUtBOMAsP6Yiay6JCp/YVgGepAaKWQkqSAraKSd6FR5GEdfVw2m1rw7up
 5oeVDcpHxUUG7kqzEIVvydiGqmhyEfxTDRvjwACpNadca6pYIW3uWjLVZLN+dWK+YUsT
 4aOMtvuUrBMMym7D/tf7RrFH0HaqJPEqyKOGn7P6J3yiQKlHJa/4lqTwBcerePGcRbhk
 7Z+jwzW8yQKND483JLghFI4p2G/YYEF8ZCR3WxPWNRxXTyBFtfqpqiYltxJ670GbFNcZ
 tNhhHOWjQm+ny1ezeiUl8rmmX5+WWQlKXghwCZ5znXPDZFzSLQd4GcmUtOBRml6KslDo
 MuqA==
X-Gm-Message-State: AOAM532sY3SJlcmLRW/dTmMMFFPGD207XalSp50ZrpG3FpGyvXHhy0Mf
 zTWx4daqEd5PkULtYx1cRXUb3w==
X-Google-Smtp-Source: ABdhPJwdRviDVzXDEdat1U8xrx4utFSsYpeLV1LWwpMpSY4cAPxvpzT4K9sj4c7yVu8H7X2fT4t/lQ==
X-Received: by 2002:a2e:5046:: with SMTP id v6mr9094222ljd.368.1632241366609; 
 Tue, 21 Sep 2021 09:22:46 -0700 (PDT)
Received: from umbar.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id v77sm1559567lfa.93.2021.09.21.09.22.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 09:22:46 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Cc: Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, David Heidelberg <david@ixit.cz>
Subject: [PATCH] drm/msm/dsi/phy: fix clock names in 28nm_8960 phy
Date: Tue, 21 Sep 2021 19:22:45 +0300
Message-Id: <20210921162245.1858118-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The commit 9f91f22aafcd ("drm/msm/dsi: remove duplicate fields from
dsi_pll_Nnm instances") mistakenly changed registered clock names. While
the platform is in progress of migration to using clock properties in
the dts rather than the global clock names, we should provide backwards
compatibility. Thus restore registerd global clock names.

Fixes: 9f91f22aafcd ("drm/msm/dsi: remove duplicate fields from dsi_pll_Nnm instances")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
index aaa37456f4ee..71ed4aa0dc67 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
@@ -428,7 +428,7 @@ static int pll_28nm_register(struct dsi_pll_28nm *pll_28nm, struct clk_hw **prov
 	bytediv->reg = pll_28nm->phy->pll_base + REG_DSI_28nm_8960_PHY_PLL_CTRL_9;
 
 	snprintf(parent_name, 32, "dsi%dvco_clk", pll_28nm->phy->id);
-	snprintf(clk_name, 32, "dsi%dpllbyte", pll_28nm->phy->id);
+	snprintf(clk_name, 32, "dsi%dpllbyte", pll_28nm->phy->id + 1);
 
 	bytediv_init.name = clk_name;
 	bytediv_init.ops = &clk_bytediv_ops;
@@ -442,7 +442,7 @@ static int pll_28nm_register(struct dsi_pll_28nm *pll_28nm, struct clk_hw **prov
 		return ret;
 	provided_clocks[DSI_BYTE_PLL_CLK] = &bytediv->hw;
 
-	snprintf(clk_name, 32, "dsi%dpll", pll_28nm->phy->id);
+	snprintf(clk_name, 32, "dsi%dpll", pll_28nm->phy->id + 1);
 	/* DIV3 */
 	hw = devm_clk_hw_register_divider(dev, clk_name,
 				parent_name, 0, pll_28nm->phy->pll_base +
-- 
2.30.2

