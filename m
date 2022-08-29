Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3920F5A541E
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 20:42:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B227C10F6DB;
	Mon, 29 Aug 2022 18:42:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C81C010F6CE
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 18:42:11 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id o4so8884152pjp.4
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 11:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=G5us0GccePnAC3wVw9NR5mJwNnkTd3GEPACcJ6N2xfM=;
 b=ixsSx2pg6G3XbINEs9wWUT6eb/1pe4V7HSvotl6YRGTb4X2U9ViVUlHparslx5uvmY
 MWa0L3jzH8XtuoFoFUKkmGQQMASC4zDQmmhnyP5He417ujnC3KHBwPb49oFb7g6L7x2y
 3zwA+YO/IodPFntZZVtuuvyg1TzNDz6uZpwdc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=G5us0GccePnAC3wVw9NR5mJwNnkTd3GEPACcJ6N2xfM=;
 b=m9deGrba3XC7A5j9NR1jNZETFP9EvUNowQ0P1FBt+w7ScGuvIgfgq1iRRokQilgi0z
 ZbXlGsGM2McjyZM6VzeUT2e970H8GpoqFUUxsRpNTZwqvi/bE9ka6BfL3GwgDW5aeV6x
 4kE9znoJI9P97xBSp48IlweitHhabDTmFl1ia0HYzfTu5w9elkfVhIsnViruq6Q+D2et
 xC4djGZUvgLHO4pZCBWydeqL0VeLvDdPfQHLFDeUVnZSjurKE8DWxEjfwYlIIzDQVi/1
 bpySN9P9ORoRDw2Yo00gYAm0G5OWfyfKyRGsVCIh5YxKkEwKk5iLQ2lzrk8jd7YIUbcB
 1YNg==
X-Gm-Message-State: ACgBeo3/khKKtgHKtbzE/Ilkb5lF1UQgONGtZdkyWRT5dUFvcgtRf6rc
 7FBNQgvZO6RIOZV8aYjiuDmwIw==
X-Google-Smtp-Source: AA6agR7E695eeXsLzO3oj+CBg/g3fkfBjtTPyuYsP2X9XEv8GfAXp86Q9lOoz+sFpU2whGx8uemFtw==
X-Received: by 2002:a17:902:d181:b0:174:11d5:b2e0 with SMTP id
 m1-20020a170902d18100b0017411d5b2e0mr17334216plb.114.1661798531320; 
 Mon, 29 Aug 2022 11:42:11 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a073:43f7:1644:6259:830d])
 by smtp.gmail.com with ESMTPSA id
 k13-20020aa7998d000000b005385e2e86eesm1619042pfh.18.2022.08.29.11.42.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Aug 2022 11:42:10 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Inki Dae <inki.dae@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Fancy Fang <chen.fang@nxp.com>, Tim Harvey <tharvey@gateworks.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Adam Ford <aford173@gmail.com>, Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 Marek Vasut <marex@denx.de>
Subject: [PATCH v4 11/12] dt-bindings: display: exynos: dsim: Add NXP i.MX8MM
 support
Date: Tue, 30 Aug 2022 00:10:30 +0530
Message-Id: <20220829184031.1863663-12-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220829184031.1863663-1-jagan@amarulasolutions.com>
References: <20220829184031.1863663-1-jagan@amarulasolutions.com>
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

Samsung MIPI DSIM bridge can also be found in i.MX8MM SoC.

Add dt-bingings for it.

v4:
* none

v3:
* collect Rob Acked-by

v2:
* updated comments

v1:
* new patch

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt b/Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt
index be377786e8cd..8efcf4728e0b 100644
--- a/Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt
+++ b/Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt
@@ -7,6 +7,7 @@ Required properties:
 		"samsung,exynos5410-mipi-dsi" /* for Exynos5410/5420/5440 SoCs */
 		"samsung,exynos5422-mipi-dsi" /* for Exynos5422/5800 SoCs */
 		"samsung,exynos5433-mipi-dsi" /* for Exynos5433 SoCs */
+		"fsl,imx8mm-mipi-dsim" /* for i.MX8M Mini SoCs */
   - reg: physical base address and length of the registers set for the device
   - interrupts: should contain DSI interrupt
   - clocks: list of clock specifiers, must contain an entry for each required
-- 
2.25.1

