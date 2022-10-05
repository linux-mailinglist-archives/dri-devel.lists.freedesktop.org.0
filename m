Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5DF5F5740
	for <lists+dri-devel@lfdr.de>; Wed,  5 Oct 2022 17:14:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DA3A10E688;
	Wed,  5 Oct 2022 15:13:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03D6910E451
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Oct 2022 15:13:37 +0000 (UTC)
Received: by mail-il1-x12b.google.com with SMTP id u2so3848665ilv.6
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Oct 2022 08:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1VdDEs1pi0qW/yb3TfGC/umjEjhhqUp9mNuoYTgXucw=;
 b=kiKQaGYN3sa14/VpVKcELjjC8h3OY40YcBrnv+4pPnYwBcVHuwm1bnXT6lpOH/OgyQ
 tQrJeBiIz5jk/tA4/pgHKLnHvl6WXfyXyLZRuLD1Em9huvEK5RIZnOG6V2GBoSe+d/Tj
 /BpjtyIQb7E7y0uKpz0eREWEYLmEjaDDZNuL8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1VdDEs1pi0qW/yb3TfGC/umjEjhhqUp9mNuoYTgXucw=;
 b=6B++YNxJTLr1G2pqJpm9LhFR+z4NwEm0EtxwrQ9Q3kL5/c54c0VbahUh8DjWRxi/OK
 VPRXzb35lnIiacpJA0T9aWIrM3ZBSHSqMqEhU5KThy5lO95K4JV07amHbIcZnHKLS4ez
 eZyz/ox64kESL6zJDFRNNWKxW/ks7o8IsKgTr01ZePCrfZ7db4RV1pgSdkv1PNlKV7qW
 D12T+iN8abcWmAn4jVU1keDVihD0TBmtRMZwQ+yl0k+mS/tCbJ0kBWisCzyi3lSvPQ0S
 ZIFF7jxzgV2ntsI1s2wAemovmKlrvW5zQTsZ554ICV7EiV2QO3dSYky6b98cFFcWeYdI
 CbMg==
X-Gm-Message-State: ACrzQf3Jdwf+n2TgFgXa1i7Yb9HTJJdwTY0yoWfVIG/oUF2R/tKt/KfG
 Ks1BgSs3qr6dKxaQIuliNaN8N7FtyUhuwkgu
X-Google-Smtp-Source: AMsMyM4PrDXBe+q8y0XRtJ0ZpqAVT+zqc8fvM6mbuz//B9QSOyBbdWRK12W8OMmQpy1/KL/mUp61fA==
X-Received: by 2002:a05:6e02:1789:b0:2f6:b741:3e6f with SMTP id
 y9-20020a056e02178900b002f6b7413e6fmr49909ilu.157.1664982816172; 
 Wed, 05 Oct 2022 08:13:36 -0700 (PDT)
Received: from j-ThinkPad-E14-Gen-2.stthomas.edu ([140.209.96.21])
 by smtp.gmail.com with ESMTPSA id
 w15-20020a056602034f00b0068a235db030sm7089276iou.27.2022.10.05.08.13.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Oct 2022 08:13:35 -0700 (PDT)
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
Subject: [PATCH v7 09/10] dt-bindings: display: exynos: dsim: Add NXP i.MX8MM
 support
Date: Wed,  5 Oct 2022 20:43:08 +0530
Message-Id: <20221005151309.7278-10-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221005151309.7278-1-jagan@amarulasolutions.com>
References: <20221005151309.7278-1-jagan@amarulasolutions.com>
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

