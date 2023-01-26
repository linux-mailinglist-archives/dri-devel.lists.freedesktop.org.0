Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD4167CE8F
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 15:45:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2556010E91D;
	Thu, 26 Jan 2023 14:45:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A08C10E91F
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 14:45:41 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 v6-20020a17090ad58600b00229eec90a7fso6278188pju.0
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 06:45:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BaDUbyvaCyU9ZYo1dnwr9WAZI/IyrlPNZL6ZHPBz5Bk=;
 b=ThwyGZGdOeWLAVxgJnCuRyaLP3g/9BmANXXNJCjyZo7NVzwAb9YxdHJ8tDHHb8JYxh
 ULFPoZCOTdW8yfup82Mv9VxQ4oOKpg7y9//LLj2a06uJdyo0M6YMQC4mJ0+qJJVa8fV8
 eNhVsMUiMbYI7TvJxoFwBWrz8FBCH2zkc+SQs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BaDUbyvaCyU9ZYo1dnwr9WAZI/IyrlPNZL6ZHPBz5Bk=;
 b=JNjolaTR80QgapFlqaqNFvTfDj0R+KvaVrBax6jkJ2kUbDJLjMwbAHjjU2m4G0GlJN
 DlGJaqNQ6BrrOR5HIdbwsguuwyAckoJ7kUCvFDUyiQ0vbPz/8u7TijV8LfdHd1tLy3n9
 /oxCfcFLBS5bc2axkPMHY/Meiy3LuY8TqmzDRaYSmBoqAwd+RckZxcxHBDZo9YIOoyWt
 BeVO87HMdE5FstuNRCMD67eu6nT+PsXBccodA5r9adle/Tv2/y8fNTHZ5rXU1ljPqTqA
 TJlFbvCiQAGGI7j3enKdQ69mr0V/r900/flpEHgEKglp9RLH8H+7xVkFy18InWi/bg8Q
 0PDA==
X-Gm-Message-State: AO0yUKVWG384vv5GyK5jIgSYFK1gO1TGBbSy78RID9KQhL6jp8g9o/uQ
 OiesGJrOwTGofqxFO0CBeoeXHA==
X-Google-Smtp-Source: AK7set8F1v98xH49xiuoWfSvm5Xn6Ukd+Rk/o2nUU+2RLymR+7uEmXIJEIqvwGAIwwqW+WFGQ56yZw==
X-Received: by 2002:a05:6a20:7d83:b0:bb:cf2f:3b09 with SMTP id
 v3-20020a056a207d8300b000bbcf2f3b09mr8145162pzj.51.1674744340798; 
 Thu, 26 Jan 2023 06:45:40 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a238:3cb1:2156:ef87:8af5])
 by smtp.gmail.com with ESMTPSA id
 d197-20020a6336ce000000b0042988a04bfdsm823660pga.9.2023.01.26.06.45.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 06:45:40 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Inki Dae <inki.dae@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Tim Harvey <tharvey@gateworks.com>, Adam Ford <aford173@gmail.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Marek Vasut <marex@denx.de>
Subject: [PATCH v12 05/18] drm: exynos: dsi: Mark PHY as optional
Date: Thu, 26 Jan 2023 20:14:14 +0530
Message-Id: <20230126144427.607098-6-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230126144427.607098-1-jagan@amarulasolutions.com>
References: <20230126144427.607098-1-jagan@amarulasolutions.com>
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
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-arm-kernel@lists.infradead.org, Jagan Teki <jagan@amarulasolutions.com>
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
Changes for v12:
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
index 4a165764121d..5918d31127aa 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -1687,7 +1687,7 @@ static int exynos_dsi_probe(struct platform_device *pdev)
 	if (IS_ERR(dsi->reg_base))
 		return PTR_ERR(dsi->reg_base);
 
-	dsi->phy = devm_phy_get(dev, "dsim");
+	dsi->phy = devm_phy_optional_get(dev, "dsim");
 	if (IS_ERR(dsi->phy)) {
 		dev_info(dev, "failed to get dsim phy\n");
 		return PTR_ERR(dsi->phy);
-- 
2.25.1

