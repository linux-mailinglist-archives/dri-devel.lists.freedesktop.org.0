Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5573857BAE6
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 17:53:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DABF8F503;
	Wed, 20 Jul 2022 15:53:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE46B8F768
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jul 2022 15:53:56 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id p8so5563223plq.13
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jul 2022 08:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=29Y+8hwR4konYhfmXPU+qexag3jBd2Tn97JAZO5M2Ak=;
 b=dQ92/5IXXxk4bGaiAO61oilRuglzhWOFhjtlMIH7VQ91G3dJwQwxk4DOfOJ/764Zq2
 zvnS158Pk13Fap0vnq+MeKnVCsfS+LxU5RoODRAwGqS9Q7rotRf5kv3IdK2JOTMWQkpq
 4UQK/hyCTkkKS5nJvehnZSPy/5ItpIGqar+6w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=29Y+8hwR4konYhfmXPU+qexag3jBd2Tn97JAZO5M2Ak=;
 b=M1fMwF1XyzVp9h+rWTxucTwhuM+Or8aG0iiG3pGWuC2Jw4KldZ3oNMaddg3Sct2hnC
 nmYkdZFd81yItCeu0EC2kboVA0MDtCR7Ub9DZFnKVMTDew33nuJZDnwQkQzd4hc/d2Lc
 vG3nfKM7LTuTV5Yd9DnyD2+ssGivg1+VO1OX4HBHfqkyWrZdRlxpq5gn6NyLf+eKYKY1
 tLv15SHJHzux8gxY/WWMrHdGgDKZZOzFjdt4WE1jSejQvIGSr8Y0OpuMQgnLzZadU7cI
 Z4TiBSZATrAX4sDVjmRFgJx9kKIjj16SH7DSxzDM4JLZov480YkRoWCqJpsX8wH03VAA
 oTPg==
X-Gm-Message-State: AJIora+4XOlUdzrovlnDnzlYfC0Oul7KKWl3q8sFet+9P0MoIdgsmhZs
 dkGA2pHjxLK1oH6+9WxcCh4s1w==
X-Google-Smtp-Source: AGRyM1vrAlxx3/zwHGViMnrhr0TP9FpHJZqqzma7SRLbfGYluod3AbepmehsQLewJJiAhdJeagZJDA==
X-Received: by 2002:a17:90a:7e84:b0:1f0:f3de:ffb3 with SMTP id
 j4-20020a17090a7e8400b001f0f3deffb3mr6243259pjl.75.1658332436196; 
 Wed, 20 Jul 2022 08:53:56 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a073:d177:d5:aee:4f03])
 by smtp.gmail.com with ESMTPSA id
 a8-20020a170902710800b0015e8d4eb1d7sm13919198pll.33.2022.07.20.08.53.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jul 2022 08:53:55 -0700 (PDT)
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
Subject: [PATCH v3 12/13] dt-bindings: display: exynos: dsim: Add NXP i.MX8MM
 support
Date: Wed, 20 Jul 2022 21:22:09 +0530
Message-Id: <20220720155210.365977-13-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220720155210.365977-1-jagan@amarulasolutions.com>
References: <20220720155210.365977-1-jagan@amarulasolutions.com>
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

