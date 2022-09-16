Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C99595BB1FE
	for <lists+dri-devel@lfdr.de>; Fri, 16 Sep 2022 20:20:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E59410ED8D;
	Fri, 16 Sep 2022 18:20:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC50710ED83
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Sep 2022 18:19:34 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id x1so22187068plv.5
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Sep 2022 11:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=iVwjyCcXp6ZrjeyHZ78gIJ/nXiFxW/73tezVWfrv0ww=;
 b=AYphd68fMq6LKatqoxZeP56/0I2eauCQip6zuxgS7zWc2xhjKl1E0jmgtdqAawtgOs
 oCUm5bDVAJLPDiyvNp8w/egh/YbV3tJmGy+9oxgjWe3b0rnLAOwyeaMDN/EYQMvB8l0Z
 Q6Psy8WUZ7ozfFx/qo82I9evPcbQ5TGoEKZVI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=iVwjyCcXp6ZrjeyHZ78gIJ/nXiFxW/73tezVWfrv0ww=;
 b=0YsA03L6asUPEJaLLbcEr18gsF52x84o1RroPYOk5/lRbyktAA9P73E2Q42xQ5X/nQ
 /+cbZQ8oKnDiS58isNqSSVNmM4X/rmhvj7VMnRsrXFJJql7dW6ElF61hSb/3+vqVMhua
 Qayjf7Q0gc+3zwK0TlTgW07ZC8/+yocR6+EP0qFnqqvA0i7HekjJJnjhxGEA/0e2kxmo
 1dTwzSt2179hyyzEjnLleBs4wI+yLfsYLq5RhjycHfL5d2nomVDq0UeyJ3YBHZ0VWjyD
 XmSB7QM3rwXCZe8xyZ/T36rQ/p8uhBJFL7+vPu48qTD6bfeLjVMhzUGZlfjjM/sEJCpk
 7KKg==
X-Gm-Message-State: ACrzQf2pPAgsePO4g5vJ6dNdmjnrPB8s5c3hkoy5qPYGvvWqZyAZfHtJ
 L6KdveSS+JJ0LjrfL/LTFQes3w==
X-Google-Smtp-Source: AMsMyM7PiZr4e71/MYhlnvG68Ha1QTSMyIqwUrsWz5m1aYmb8efJitWyFnrK6gry+mbUKtkRGRnM8Q==
X-Received: by 2002:a17:902:f64a:b0:172:7576:2124 with SMTP id
 m10-20020a170902f64a00b0017275762124mr1008348plg.155.1663352374313; 
 Fri, 16 Sep 2022 11:19:34 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a073:ae5d:6ee4:5c2f:6733])
 by smtp.gmail.com with ESMTPSA id
 d14-20020a17090a6a4e00b002007b60e288sm1770000pjm.23.2022.09.16.11.19.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Sep 2022 11:19:33 -0700 (PDT)
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
Subject: [PATCH v5 10/11] dt-bindings: display: exynos: dsim: Add NXP i.MX8MM
 support
Date: Fri, 16 Sep 2022 23:47:30 +0530
Message-Id: <20220916181731.89764-11-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220916181731.89764-1-jagan@amarulasolutions.com>
References: <20220916181731.89764-1-jagan@amarulasolutions.com>
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

v5, v4:
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

