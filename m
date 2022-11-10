Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF5D6249C1
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 19:42:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8A9A10E7BC;
	Thu, 10 Nov 2022 18:42:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED8C410E7B9
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Nov 2022 18:41:47 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id 4so2244914pli.0
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Nov 2022 10:41:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PYhu5eH5OESD2mHDfRJuY9STQW0S1Diwxqb3V2Z5yqk=;
 b=gSeOlthtbzGMRS1IG7vWP1FNcjB1szzt4s8tQN9iJQkGGsNJ06t75K4GURpRW/AfTy
 CBUjsRJqXQie5Tw9VHhMQMMCPsXulGbnPrt9TzcYVkGmyafWgB0iDbwWrKiYHIddw2o7
 e3z8X6mCPfXMZbcH2NoPr70j8V1H/putThOoI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PYhu5eH5OESD2mHDfRJuY9STQW0S1Diwxqb3V2Z5yqk=;
 b=H8Zb/ZnUCk67Ml6SCsOO6x4JMNK8+kD4DowHZkVktX3WZowZdZsx0tvhvCmT/k5EJP
 S5Hlif+dhXM4ZAPTX5kq5w/Sve1m4dse3lpxRSMyUEBFJGlHIMpelJHvpAMk/qeDioCo
 tvqsfNAN4+iG1fGu2ds36GnJWNHs0MGH/oeVR7orP875IfzJX9bHOj4EuOyTafeVVAiL
 9kZe13nD9O+z5r5vZTlAbwi77n9e0QGwO7j1Je2EIkSMAqARkPRqfsC5ozScAl+f0CEy
 UMlOC7JqaLxWvxwhGv/kj0kShncGoGzsmDnWSzFRupYGCNhCH0wrLC44dTJPvFnrLIeB
 3VmA==
X-Gm-Message-State: ACrzQf0OgDFpbDGgpdXMrBEIvZRqhANy5CPbTzRnoQ2UDLrleGh1xOjR
 a/y5n+s/F7lUck+J2NNeKZyXEw==
X-Google-Smtp-Source: AMsMyM4K1aRNzKoQEFPuY8Zefmhwi0ftczc7HS/ufWUcHUOgslxTt+1UIKWa/+wOlb+0Q/WnHT80hA==
X-Received: by 2002:a17:903:2c9:b0:188:537d:78d9 with SMTP id
 s9-20020a17090302c900b00188537d78d9mr1518714plk.48.1668105707398; 
 Thu, 10 Nov 2022 10:41:47 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a809:b5a4:486a:f07:f67e])
 by smtp.gmail.com with ESMTPSA id
 c2-20020a170903234200b001869efb722csm11635627plh.215.2022.11.10.10.41.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Nov 2022 10:41:46 -0800 (PST)
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
Subject: [PATCH v8 13/14] dt-bindings: display: exynos: dsim: Add NXP i.MX8M
 Plus support
Date: Fri, 11 Nov 2022 00:08:52 +0530
Message-Id: <20221110183853.3678209-14-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221110183853.3678209-1-jagan@amarulasolutions.com>
References: <20221110183853.3678209-1-jagan@amarulasolutions.com>
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

