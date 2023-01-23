Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE295677F24
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 16:14:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A004510E4DB;
	Mon, 23 Jan 2023 15:14:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AB4810E4C6
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 15:14:33 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 z1-20020a17090a66c100b00226f05b9595so11320216pjl.0
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 07:14:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/fLL5kLDpQT734JrRIGe8vuytWc63yzhDCsgQc9jqGc=;
 b=nEts0sut1aayk8eUF5xDk+OkCqUauX2EIleYwoofyR42l5mbnWyayEqUUvRRn0ojOh
 fkis4xwSyHgixmBsOMyBtpC3AtoGTS+uxt1WikDLnCCtK125+YSfFRQwnYuPvAPMh5Gf
 6n4bfEN+H/hkYlpCzmP0ZjCRiQh63iy4uKMy8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/fLL5kLDpQT734JrRIGe8vuytWc63yzhDCsgQc9jqGc=;
 b=DEw6c7io2IqZjw8Ea1/nkF375RozgVYvGiI2Z52WqeMqGlkblGFAPbBnq6SJyjn61D
 Jsy+lSHrNNz26cr1s7Dc5KsoFSpiWfgBMK5rkyG9C3erTSr+w9ib0xdxlFHwWajGdh2Z
 BabzFEHeWeA7BAAzuhY6TeiQ989H4np70W6/VO/zWjF7ke0+f/Y3XZfAEkN2sxoXbDhu
 4vnTJC8e5QFox0bc9y19XpQLk/i5YShbJi9JfMsu/bid/vQ0MNPCRQfYZPZuWNirg57i
 AwELxYHtKy1vsKlhZWV/bSJyJQajia9qphk8hk20OSkrffnAlJeb3IXpBcRJseCxx5NB
 o2Yg==
X-Gm-Message-State: AFqh2koz866JQ84+EeNLO3OzidBu+VDANtmkeMANl0q4+ll+P46PO35G
 H7UEMEhwsk1IAMY5S11L++DYFQ==
X-Google-Smtp-Source: AMrXdXvkwQJ7bd/A3sFx7eUiJ5Z4tdjh+opYpkRP28thLVrDEnTAnWjpR6+gEridoiQu9CK8dc77Qg==
X-Received: by 2002:a17:902:8a98:b0:194:9c0d:9732 with SMTP id
 p24-20020a1709028a9800b001949c0d9732mr25089127plo.46.1674486872941; 
 Mon, 23 Jan 2023 07:14:32 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a15f:2279:f361:f93b:7971])
 by smtp.gmail.com with ESMTPSA id
 d5-20020a170903230500b001754fa42065sm19207111plh.143.2023.01.23.07.14.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 07:14:32 -0800 (PST)
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
Subject: [RESEND PATCH v11 17/18] dt-bindings: display: exynos: dsim: Add NXP
 i.MX8M Plus support
Date: Mon, 23 Jan 2023 20:42:11 +0530
Message-Id: <20230123151212.269082-18-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230123151212.269082-1-jagan@amarulasolutions.com>
References: <20230123151212.269082-1-jagan@amarulasolutions.com>
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

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v11:
- collect ACK from Rob
Changes for v10, v9:
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

