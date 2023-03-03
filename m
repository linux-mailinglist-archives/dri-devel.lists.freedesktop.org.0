Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 936E46A99DA
	for <lists+dri-devel@lfdr.de>; Fri,  3 Mar 2023 15:52:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 930FB10E63A;
	Fri,  3 Mar 2023 14:52:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9608910E636
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Mar 2023 14:52:31 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id i10so2876200plr.9
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Mar 2023 06:52:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7tZxKcA0ycBEYEtLsRm0mag1bTn00Dn2OB4UXN+PrCA=;
 b=g1hTmqTL8tLvJHgL5DZt6QapKxdO6Bx5iFVohVWNhvtPGlkI69a0BeBDTAQ3s775J0
 B8btGS4Wnj8c7xdNVV4Qd6QSp0BPLM60QVHcHRRrrwOnV6V54YEkjTpzJRfS4KLbS69T
 WDevEACzSJJd1aZEGUzlpuKlUiPjTsoKoYtig=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7tZxKcA0ycBEYEtLsRm0mag1bTn00Dn2OB4UXN+PrCA=;
 b=hEzKIrppSAR7J/kjb2O5MKmpztb/5ZypYfAKjgiJ/qbKGOUZj5bb4pBDXmG1xGAYSe
 bsIr6c/StIFBlnpXCetFg3Z5731iZX1oGcFt2KcK4J5/7qfDVCqOHndnDcirHk1vjxLR
 fv4dGq1QRl09fevdN1h1DDLORaVyDYgpGw4jmFaR01Q7W6Ba8viOoh9Tz11eu7KWb7ft
 dkuyVqshCKqP+LmnWalyUIbPa7Wg87Xy7X1GFXCgoPWab8rCHbFXJsuKOLyTP+ZRl5Qc
 d6IhaMbwpHvG3LndLnobr8R5f7MbOSV+fv5GslEFvPyMI+BLEmvEYBvRxyzP3PGM018r
 z8sA==
X-Gm-Message-State: AO0yUKVLXyzMqmZztDOQadwP1LlnDx5x2eW/ae1zuuT7LSGNZBrE+jVx
 F6CBqGK0Gonbk/qhaWhVBSqzoQ==
X-Google-Smtp-Source: AK7set/7XBegvdyV0hyovIxWarV3Vs1dBvaZdYiJBqSHxBJkXnvlgh9tng8rHqlEgrkMDdGO19XOzQ==
X-Received: by 2002:a05:6a21:6da5:b0:cc:46bd:39b0 with SMTP id
 wl37-20020a056a216da500b000cc46bd39b0mr2717652pzb.56.1677855151204; 
 Fri, 03 Mar 2023 06:52:31 -0800 (PST)
Received: from localhost.localdomain ([183.83.137.89])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a63e544000000b00502fd70b0bdsm1660856pgj.52.2023.03.03.06.52.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 06:52:30 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Inki Dae <inki.dae@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Marek Vasut <marex@denx.de>,
 Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v15 03/16] drm: exynos: dsi: Mark PHY as optional
Date: Fri,  3 Mar 2023 20:21:25 +0530
Message-Id: <20230303145138.29233-4-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230303145138.29233-1-jagan@amarulasolutions.com>
References: <20230303145138.29233-1-jagan@amarulasolutions.com>
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
Cc: linux-samsung-soc@vger.kernel.org, Matteo Lisi <matteo.lisi@engicam.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Kyungmin Park <kyungmin.park@samsung.com>, dri-devel@lists.freedesktop.org,
 Adam Ford <aford173@gmail.com>, Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The same Samsung MIPI DSIM master can also be used in NXP's
i.MX8M Mini/Nano/Plus SoC.

In i.MX8M Mini/Nano/Plus SoC the DSI Phy requires a MIPI DPHY
bit to reset in order to activate the PHY and that can be done
via upstream i.MX8M blk-ctrl driver.

So, mark the phy get as optional.

Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
Reviewed-by: Marek Vasut <marex@denx.de>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v15, v13, v12:
- none
Changes for v11:
- collect Frieder RB
Changes for v10:
- add Plus in commit message
- collect Marek RB
Changes for v9, v8, v7, v6, v5, v4, v3, v2:
- none
Changes for v1:
- new patch

 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index f44a5a702ad5..af16af404e87 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -1732,7 +1732,7 @@ static int exynos_dsi_probe(struct platform_device *pdev)
 	if (IS_ERR(dsi->reg_base))
 		return PTR_ERR(dsi->reg_base);
 
-	dsi->phy = devm_phy_get(dev, "dsim");
+	dsi->phy = devm_phy_optional_get(dev, "dsim");
 	if (IS_ERR(dsi->phy)) {
 		dev_info(dev, "failed to get dsim phy\n");
 		return PTR_ERR(dsi->phy);
-- 
2.25.1

