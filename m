Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C4030519E40
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 13:42:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0F1E10F980;
	Wed,  4 May 2022 11:42:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C92AC10F980
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 11:42:02 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id n8so1188785plh.1
 for <dri-devel@lists.freedesktop.org>; Wed, 04 May 2022 04:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+NRE5c3umnhAMfzXZGdT8IR9mvtmW1bU49iqwSFs3sc=;
 b=Y0Tcd1boFN93JgX95QeJpwHuwDbrVQaFe2hXsFwqpiFyFx7voQp9CBUZDRWoWtRwNN
 SAS0xiCCBTgPYrbn9bbV0sD8Gy6qV5lYyiGbh6Q5UrLXV/1DWetarmxh5aGUxbjTKIdv
 BluggB50nxMCEBs1Vj84c/ApSgtwCtS2yF9NI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+NRE5c3umnhAMfzXZGdT8IR9mvtmW1bU49iqwSFs3sc=;
 b=3YV9YAMT1/JK0XEKLnPSiAsO4eJQIyk8V7PDPCWu83JS+nff3i4JY6F02QOJooW2SJ
 nlH9xXmRPU7xkzoj+BofOoH+F5SMTwWk1Q2/6rLQtpndOehG/98AgN5LXrHZbUg40PSz
 tF8loyqL4gqUyj492/Cb+7DNyrXC18B0PMmIu8iBDhB5lu6IjXh+dDF/krJMdCRLICra
 bu3MnDt7COAewJ/Zv2zIKUpj47S3BnKaArodXtOLJfOQ90dVE/LCTW4inwXu0US13A5P
 UPYk5DU4B0rltfE4Ti90lHtRxUM7ymaRIcOWnSyzqfIYTUAW1+JftMYVwKvI3/i4RP5B
 TveA==
X-Gm-Message-State: AOAM531NMfFJ4/skCgw4BUSY3i4A6dhSFDOm3MWYNjp6uP4do4UqJ1Bt
 O6T+N+5bljUI/VDC7RlR0XpGvw==
X-Google-Smtp-Source: ABdhPJwHlsfAEyiW39pMgCeykegHaxXvobTcJ3Fcz9VqKeNbffHAr6A2rVRaeChTmj+FhHjk8S78OA==
X-Received: by 2002:a17:90b:4d89:b0:1d2:a75e:38b9 with SMTP id
 oj9-20020a17090b4d8900b001d2a75e38b9mr9885676pjb.73.1651664522377; 
 Wed, 04 May 2022 04:42:02 -0700 (PDT)
Received: from localhost.localdomain ([183.83.137.38])
 by smtp.gmail.com with ESMTPSA id
 k15-20020aa790cf000000b0050dc7628174sm8027498pfk.78.2022.05.04.04.41.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 04:42:01 -0700 (PDT)
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
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
Subject: [PATCH v2 11/12] dt-bindings: display: exynos: dsim: Add NXP i.MX8MM
 support
Date: Wed,  4 May 2022 17:10:20 +0530
Message-Id: <20220504114021.33265-12-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220504114021.33265-1-jagan@amarulasolutions.com>
References: <20220504114021.33265-1-jagan@amarulasolutions.com>
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
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 Matteo Lisi <matteo.lisi@engicam.com>, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-arm-kernel@lists.infradead.org, Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Samsung MIPI DSIM bridge can also be found in i.MX8MM SoC.

Add dt-bingings for it.

v2:
* updated comments

v1:
* new patch

Cc: devicetree@vger.kernel.org,
Cc: Rob Herring <robh+dt@kernel.org>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Note:
I will send separate series for updating to yaml as the existing binding
is old that it has some properties need to fix.

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

