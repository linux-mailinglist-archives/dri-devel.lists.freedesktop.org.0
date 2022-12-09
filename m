Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9AC648582
	for <lists+dri-devel@lfdr.de>; Fri,  9 Dec 2022 16:29:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4111C10E550;
	Fri,  9 Dec 2022 15:29:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E0FD10E550
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Dec 2022 15:28:54 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id m4so5230955pls.4
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Dec 2022 07:28:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8p9dxhpDEUaFEM6i9u4TLkBBVBUWb0qAkL73zpJR35M=;
 b=WqAhRmTfaE1uP5V7v5oPhs2j9JbsB9dzNO8h4T/RMEk8iF/m2H8QUpZHH7rc1ZKWjo
 SfV6DYb8cWbrApPZp6YnEkBtbtJehtmX5xaqT9JI/Y4+NDMBmmZ6yYh7xqiLn15XlVvY
 i9V1dFR4zy7R4rVJqWVI2sxW+h6MsZhopwgag=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8p9dxhpDEUaFEM6i9u4TLkBBVBUWb0qAkL73zpJR35M=;
 b=09K27ASsOnCyag+7eR2VoAyLtN/ag22WTusA2RFNfvhF99SSI31Pyd69e0b8/XixIy
 G0P8xCBl5HOVzYyWdji4ZCBKu5362VkL9E/qDw5Yz9XL1toJdna1XCu80eN416eYkRem
 NJ2wV7feyn8ZpsKfeNsrRNqC+nZ2bxmtp09hWP3Gwcp+Ki9XYbwTtfCPgvwm73ky+Csx
 MjaCz1EbIrgQlAGHUWqAAz/+j5GL4IE10wZrGkEQ+sw7EQJX2LbS7wSxjDbTyTND0DQj
 T2YxIYZAdQj+VfeRnE3ej0/p1jE0tRegjoGc1uVyz4trfHZbZ4u6ucQC1ovv8z99bDuz
 9Neg==
X-Gm-Message-State: ANoB5pnEfBwIgwTNaimnrWxz/TpmFIe/8ZmcvZn+i4nfSeerpsShL/vB
 AZvZ1noECqT+2xMtNHG3QArB9w==
X-Google-Smtp-Source: AA0mqf7/OotqOappfZc8v6yh5v3mGpz5PlKhFLaT389Uh2ISaD6ESdcdD7ej1WqilpE5rytaXYbZbw==
X-Received: by 2002:a05:6a20:a599:b0:a4:3203:40c9 with SMTP id
 bc25-20020a056a20a59900b000a4320340c9mr7741002pzb.59.1670599734187; 
 Fri, 09 Dec 2022 07:28:54 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a809:6ba1:bbda:c542:ba0b])
 by smtp.gmail.com with ESMTPSA id
 x14-20020a170902ec8e00b00188c5f0f9e9sm1477587plg.199.2022.12.09.07.28.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Dec 2022 07:28:53 -0800 (PST)
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
Subject: [PATCH v9 15/18] dt-bindings: display: exynos: dsim: Add NXP i.MX8M
 Mini/Nano support
Date: Fri,  9 Dec 2022 20:53:40 +0530
Message-Id: <20221209152343.180139-16-jagan@amarulasolutions.com>
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

Samsung MIPI DSIM bridge can also be found in i.MX8M Mini/Nano SoC.

Add dt-bingings for it.

v9:
* none

v8:
* add comment to include i.MX8M Nano.

v7, v6, v5, v4:
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
index be377786e8cd..5133d4d39190 100644
--- a/Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt
+++ b/Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt
@@ -7,6 +7,7 @@ Required properties:
 		"samsung,exynos5410-mipi-dsi" /* for Exynos5410/5420/5440 SoCs */
 		"samsung,exynos5422-mipi-dsi" /* for Exynos5422/5800 SoCs */
 		"samsung,exynos5433-mipi-dsi" /* for Exynos5433 SoCs */
+		"fsl,imx8mm-mipi-dsim" /* for i.MX8M Mini/Nano SoCs */
   - reg: physical base address and length of the registers set for the device
   - interrupts: should contain DSI interrupt
   - clocks: list of clock specifiers, must contain an entry for each required
-- 
2.25.1

