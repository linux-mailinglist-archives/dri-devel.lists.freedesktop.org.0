Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D460F5F1AD5
	for <lists+dri-devel@lfdr.de>; Sat,  1 Oct 2022 10:10:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 529B310E52C;
	Sat,  1 Oct 2022 08:10:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2212810E52C
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Oct 2022 08:10:11 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id f23so5781640plr.6
 for <dri-devel@lists.freedesktop.org>; Sat, 01 Oct 2022 01:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=/wOwPBnm9F+B6EUxE0EwDr5bec7v1ZzaQI0ncINcEEQ=;
 b=Yr+KjrdROxVsREjh1ynA2uo4DlPOxokxTsDToUrFOH2o7Dt17vXjhGsqWwiKK5X2Sh
 L/9HN67ayNzogP9iWvS0oLGQWZgKr27VJr/e1NVphMK/siE+j4pi+5kfpq5jhEK+f4M8
 3dKNSUbd3ilmJ9AbAvEr93KHT3MlN8PSp6Fy0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=/wOwPBnm9F+B6EUxE0EwDr5bec7v1ZzaQI0ncINcEEQ=;
 b=gvxl3Dtv4PpxcPuzwDyT333ZJqv8wdIf3zfR0J/8xWFz2oR5QaxBQHPYGHH1ebvBH3
 ws0V5sC9YWxyyFPLOw6aG3y92wBcr/6SqOi2FE/ZOtODvI8G3LpA6juIWBOSrwF2K0aX
 66vCh6YkMfchU8OxFXF+/wHjJyxwd+S+hNp0txamHVY3KbXgi0azRmU+68JYjn2UEHYx
 kRWWMMHfdR5BvVkfZPxIOzt8ONmcf1pDfixjxF/P31uise9mPH+Q/cQvsvhp6eaE7xpR
 egEtG795gVuqvrrxKx8gU0JFdbmNGkqe0WLBifGKIWhSdBS+N5gAkY2tTYncfmRIFed7
 XsVg==
X-Gm-Message-State: ACrzQf0o/7rCSUmo9Gs1c/brCyrZu/8w69tcFnQyM0powMRplkogJIv4
 x+OW1cVD1QZajzakVebDf8OvDA==
X-Google-Smtp-Source: AMsMyM4WWThhOeR7xZ08N6zla/HEqxatjILfotzm2bCjMVN+iyfgHlEjngVKbpobMpMRcufvi+o3ww==
X-Received: by 2002:a17:902:9a49:b0:17a:6662:9334 with SMTP id
 x9-20020a1709029a4900b0017a66629334mr12368026plv.63.1664611810678; 
 Sat, 01 Oct 2022 01:10:10 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a073:7254:4392:bc7c:c69])
 by smtp.gmail.com with ESMTPSA id
 c194-20020a624ecb000000b005409c9d2d41sm3167041pfb.62.2022.10.01.01.09.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Oct 2022 01:10:10 -0700 (PDT)
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
Subject: [PATCH v6 09/10] dt-bindings: display: exynos: dsim: Add NXP i.MX8MM
 support
Date: Sat,  1 Oct 2022 13:36:49 +0530
Message-Id: <20221001080650.1007043-10-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221001080650.1007043-1-jagan@amarulasolutions.com>
References: <20221001080650.1007043-1-jagan@amarulasolutions.com>
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

v6, v5, v4:
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

