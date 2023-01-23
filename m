Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35699677ADB
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 13:25:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3619A10E378;
	Mon, 23 Jan 2023 12:25:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3EBE10E378
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 12:25:26 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 h5-20020a17090a9c0500b0022bb85eb35dso6423343pjp.3
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 04:25:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qnaYYuZIFXsUXmdUbRbKvrLeFHz42sEEtjfLamyApLo=;
 b=D0y+LyVrWB+GF8Ep6fj6u8kNZZza8H1ohwFvKZ1/rcFqw4wPJkHBzqb3dtqxXTSftO
 JzoK0AKNOfxGg2obYNZ87WUblFA0Ou1wJlPLOTKO47HVw17PozlZTPjAYgiDTUnUgEzn
 dVAWVdIhleA9kI88I/SligcK5Rjre5ElRAQvs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qnaYYuZIFXsUXmdUbRbKvrLeFHz42sEEtjfLamyApLo=;
 b=lZQYd+W11SiQaw/ir45ZZ8MKCTJtrqTdzyMpBDn6UfjTJyI+YxJlfKkrvj2bb7qa1l
 2fpn3+7RPUtSGIftK8C/AXxbSmkwAXmeHV++VuXQ6etcacLTPN31bgUk2dd9a/TDhErt
 dWHDfHfVtbcuVHSK4hNRUgVl1ffu7KkDse5VgvhQlY1HnN/0cR+Omk00nP0Q0nKgrumI
 AP7SC1O2czfmm788DmUy0c9TzoqFiVCAosQcAJvbJKQYsjwOvmhLa6NNrOeBGVB22ChP
 GHb9fwBdmQ2Tw3iVy0WAOYzLvi17ov8V/qJO6argm6r72UcI2FtLmYPNqalt4R2kYKcO
 amNQ==
X-Gm-Message-State: AFqh2kreJuAoiC6YT+h5XNQvX5Iaz3jl7fF3oL9s2umNm/MqigKBkjtz
 vEAvWXCQvqgOEBXTwRVNMsuKvQ==
X-Google-Smtp-Source: AMrXdXtMqOYVwEGpg2hdE0yKaXOX3+EYF/m0wr2OpR6ElLqXf7bKsw6nnmBFO+atAXWZ0Uc19wEoUw==
X-Received: by 2002:a17:902:8d83:b0:193:39bd:df97 with SMTP id
 v3-20020a1709028d8300b0019339bddf97mr25365747plo.14.1674476726567; 
 Mon, 23 Jan 2023 04:25:26 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a15f:2279:f361:f93b:7971])
 by smtp.gmail.com with ESMTPSA id
 w10-20020a170902e88a00b001960806728asm1291811plg.88.2023.01.23.04.25.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 04:25:25 -0800 (PST)
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
Subject: [PATCH v11 15/18] dt-bindings: display: exynos: dsim: Add NXP i.MX8M
 Mini/Nano support
Date: Mon, 23 Jan 2023 17:53:16 +0530
Message-Id: <20230123122319.261341-16-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230123122319.261341-1-jagan@amarulasolutions.com>
References: <20230123122319.261341-1-jagan@amarulasolutions.com>
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

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v11, v10, v9:
- none
Changes for v8:
- add comment to include i.MX8M Nano.
Changes for v7, v6, v5, v4:
- none
Changes for v3:
- collect Rob Acked-by
Changes for v2:
- updated comments
Changes for v1:
- new patch

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

