Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E5764858C
	for <lists+dri-devel@lfdr.de>; Fri,  9 Dec 2022 16:29:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEE1310E552;
	Fri,  9 Dec 2022 15:29:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A6A710E552
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Dec 2022 15:29:32 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id fy4so4868536pjb.0
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Dec 2022 07:29:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Vr1sFCYK6xOgp3HQgvixcoPvVesJ0tGc4yiJdF9vU7Q=;
 b=WJm32FtNO32Uq6dyQjp+U7K3bEFMiAf/BDAHSMli3f/GCcTuV2vrlFDTUTFLxJp4Hm
 X9pXpcqpCOhLclUpKSB1MK8xyDFh+JcbBPrYukM37whKWOOtOQKxw1NslI7FGueYRrxY
 Wc5vKftoUrY93bRfFcwW0MRXBYbsVy4qGhryQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Vr1sFCYK6xOgp3HQgvixcoPvVesJ0tGc4yiJdF9vU7Q=;
 b=ueXvB4iwnH0pRYIPZYsiPSQaAKivFaTc1PvVaRCWfT9ZXn2o5HNotmzQWsKiIG474s
 5Iab+F63Z7ZA7dzUHImMINtC18kCswFscFZLZvcZWDUzaIAJCRD7tMQ+0le9erTCGGsM
 HCf5MOTJe7JVtTVGfU9AsL84TZqZbQCoDrelwg1arxwCtlTdJAMsiG0gezmuN0INuu/b
 rkJvZZ8pu4ZTLegsBlpFDXnNn7IBHlahoqQvSBWjuY21CPgtuFIRf7TSGSNO3U5jC+u/
 2G0loVn29ZeXk3zQ84UERchN6wpmkPoLVZTHUWipqWK8zFj0Wts6P+Y0KzXsmYx0eicT
 I+Rw==
X-Gm-Message-State: ANoB5pk2qOgW4z1/PNkxeKFji469aSfWjFSJ1QO8oJiXgxs3Cqf05ZuI
 f+sbEXANDineHj4iSz9vXLSiFQ==
X-Google-Smtp-Source: AA0mqf4shV/8b45XYewsg+kisEutSfSMO8MruxZiTRFGYFHREZsuwHm/fHCbQf+yjOaxny7ov6nEKg==
X-Received: by 2002:a17:903:328b:b0:189:f7c2:7245 with SMTP id
 jh11-20020a170903328b00b00189f7c27245mr6350308plb.45.1670599771703; 
 Fri, 09 Dec 2022 07:29:31 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a809:6ba1:bbda:c542:ba0b])
 by smtp.gmail.com with ESMTPSA id
 x14-20020a170902ec8e00b00188c5f0f9e9sm1477587plg.199.2022.12.09.07.29.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Dec 2022 07:29:31 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Inki Dae <inki.dae@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Fancy Fang <chen.fang@nxp.com>, Tim Harvey <tharvey@gateworks.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Adam Ford <aford173@gmail.com>, Neil Armstrong <narmstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 Marek Vasut <marex@denx.de>
Subject: [PATCH v9 17/18] dt-bindings: display: exynos: dsim: Add NXP i.MX8M
 Plus support
Date: Fri,  9 Dec 2022 20:53:42 +0530
Message-Id: <20221209152343.180139-18-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221209152343.180139-1-jagan@amarulasolutions.com>
References: <20221209152343.180139-1-jagan@amarulasolutions.com>
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

Samsung MIPI DSIM bridge can also be found in i.MX8M Plus SoC.

Add dt-bingings for it.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v9:
- none

 Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt b/Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt
index 5133d4d39190..2a5f0889ec32 100644
--- a/Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt
+++ b/Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt
@@ -8,6 +8,7 @@ Required properties:
 		"samsung,exynos5422-mipi-dsi" /* for Exynos5422/5800 SoCs */
 		"samsung,exynos5433-mipi-dsi" /* for Exynos5433 SoCs */
 		"fsl,imx8mm-mipi-dsim" /* for i.MX8M Mini/Nano SoCs */
+		"fsl,imx8mp-mipi-dsim" /* for i.MX8M Plus SoCs */
   - reg: physical base address and length of the registers set for the device
   - interrupts: should contain DSI interrupt
   - clocks: list of clock specifiers, must contain an entry for each required
-- 
2.25.1

