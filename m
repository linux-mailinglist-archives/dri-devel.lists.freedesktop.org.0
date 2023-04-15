Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA4F6E30B0
	for <lists+dri-devel@lfdr.de>; Sat, 15 Apr 2023 12:41:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DF3B10E20B;
	Sat, 15 Apr 2023 10:41:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F26710E0CF
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Apr 2023 10:41:28 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id
 ca18e2360f4ac-7606d948295so43155239f.3
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Apr 2023 03:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681555286; x=1684147286;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hcAU830LZXIq4Od+MpqJpps0tJki2Rs3z9GrCN5O5F8=;
 b=YLeiKPXwGyo5iZJpXn3Tkc+hE+FtHtfsYG2mlXimXOohTZ555+VueT+KOzYLdwkjPb
 hupPmnNpskhX3EbEKJdLw+EJQXvrdx2dN7LLpa9ivtY0TkryvmppUQZUec4PbnQJy28K
 0O+yJ1tjUEJRbhSYrIUYsEEAh9t3XytXuTb/PwTZ0ciHMnW2gdplq44vdr9DQNJvRPOp
 q1u9xylNN4wa4hLLY10jsUEH0dqFYMCqBV/7DQfRkYxuzbrbivtd4IZfOfzcckH0/yxT
 YckoQhfJLpxkI12awnBW7LUXw/CSxBI6q9XfW4b9GH83iVqnDbSxo6zVLYSq/l3kjoa+
 wEig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681555286; x=1684147286;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hcAU830LZXIq4Od+MpqJpps0tJki2Rs3z9GrCN5O5F8=;
 b=bbHo/mvdFcyRyZkuv8rOIBECP4gdSZAvRJpK0KoGW9a2dMtnO8084xPJznpa4GzN1T
 QqC2Nqu8xGJP6Jt3cqrYXmvTjoGdwHCZdfORPSXyxNUdqSIPnY/txxTVRMidtlwOBoG/
 fYQvuo4hl/WKOZ8aemTMkN3RY0gom1oZSEnWfis9rhDzrH08JpRElXZFEeUw7ktpI1B7
 CA3dktf+9Y0tTNwvVYA5331APM6b7Gc2dr46vQ1uNEpmw8khOvgORVt+rHitxtS8mJKe
 6spXNdFextmll3dYKPz0vK134g/KsRjL0B5WYC53O7ICRMpiiSuUg0EIqf+m5rZIYENT
 R/pg==
X-Gm-Message-State: AAQBX9cGbGMiQL5EA8812aAQ5YkxyyP2ecVKQiGzbCPSCbKmdgcdj2Gg
 oYJwN0m8hOE36tvCybY2MXiCAAzSOEMicQ==
X-Google-Smtp-Source: AKy350bXSqH+Lm4v7QjEFHrCI2v6hwyhefeLvef54xJqodbtS/xvZNtS3Dm8GpKP3yhe126JMMVIYA==
X-Received: by 2002:a92:c04c:0:b0:32a:abbe:e6b5 with SMTP id
 o12-20020a92c04c000000b0032aabbee6b5mr2790610ilf.11.1681555286038; 
 Sat, 15 Apr 2023 03:41:26 -0700 (PDT)
Received: from aford-B741.lan ([2601:447:d001:897f:40bb:6fe6:ddbc:cc9a])
 by smtp.gmail.com with ESMTPSA id
 bp11-20020a056638440b00b0040b38102b79sm246536jab.82.2023.04.15.03.41.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Apr 2023 03:41:25 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 6/6] arm64: dts: imx8mn: Fix video clock parents
Date: Sat, 15 Apr 2023 05:41:03 -0500
Message-Id: <20230415104104.5537-6-aford173@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230415104104.5537-1-aford173@gmail.com>
References: <20230415104104.5537-1-aford173@gmail.com>
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 aford@beaconembedded.com, Frieder Schrempf <frieder.schrempf@kontron.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, m.szyprowski@samsung.com,
 marex@denx.de, Robert Foss <rfoss@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>, NXP Linux Team <linux-imx@nxp.com>,
 devicetree@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Adam Ford <aford173@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There are a few clocks whose parents are set in mipi_dsi
and mxsfb nodes, but these clocks are used by the disp_blk_ctrl
power domain which may cause an issue when re-parenting, resuling
in a disp_pixel clock having the wrong parent and wrong rate.

Fix this by moving the assigned-clock-parents as associate clock
assignments to the power-domain node to setup these clocks before
they are enabled.

Fixes: d825fb6455d5 ("arm64: dts: imx8mn: Add display pipeline components")
Signed-off-by: Adam Ford <aford173@gmail.com>
---
 arch/arm64/boot/dts/freescale/imx8mn.dtsi | 28 ++++++++++++-----------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn.dtsi b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
index bd84db550053..8be8f090e8b8 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
@@ -1069,13 +1069,6 @@ lcdif: lcdif@32e00000 {
 					 <&clk IMX8MN_CLK_DISP_APB_ROOT>,
 					 <&clk IMX8MN_CLK_DISP_AXI_ROOT>;
 				clock-names = "pix", "axi", "disp_axi";
-				assigned-clocks = <&clk IMX8MN_CLK_DISP_PIXEL_ROOT>,
-						  <&clk IMX8MN_CLK_DISP_AXI>,
-						  <&clk IMX8MN_CLK_DISP_APB>;
-				assigned-clock-parents = <&clk IMX8MN_CLK_DISP_PIXEL>,
-							 <&clk IMX8MN_SYS_PLL2_1000M>,
-							 <&clk IMX8MN_SYS_PLL1_800M>;
-				assigned-clock-rates = <594000000>, <500000000>, <200000000>;
 				interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
 				power-domains = <&disp_blk_ctrl IMX8MN_DISPBLK_PD_LCDIF>;
 				status = "disabled";
@@ -1093,12 +1086,6 @@ mipi_dsi: dsi@32e10000 {
 				clocks = <&clk IMX8MN_CLK_DSI_CORE>,
 					 <&clk IMX8MN_CLK_DSI_PHY_REF>;
 				clock-names = "bus_clk", "sclk_mipi";
-				assigned-clocks = <&clk IMX8MN_CLK_DSI_CORE>,
-						  <&clk IMX8MN_CLK_DSI_PHY_REF>;
-				assigned-clock-parents = <&clk IMX8MN_SYS_PLL1_266M>,
-							 <&clk IMX8MN_CLK_24M>;
-				assigned-clock-rates = <266000000>, <24000000>;
-				samsung,pll-clock-frequency = <24000000>;
 				interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
 				power-domains = <&disp_blk_ctrl IMX8MN_DISPBLK_PD_MIPI_DSI>;
 				status = "disabled";
@@ -1142,6 +1129,21 @@ disp_blk_ctrl: blk-ctrl@32e28000 {
 					      "lcdif-axi", "lcdif-apb", "lcdif-pix",
 					      "dsi-pclk", "dsi-ref",
 					      "csi-aclk", "csi-pclk";
+				assigned-clocks = <&clk IMX8MN_CLK_DSI_CORE>,
+						  <&clk IMX8MN_CLK_DSI_PHY_REF>,
+						  <&clk IMX8MN_CLK_DISP_PIXEL>,
+						  <&clk IMX8MN_CLK_DISP_AXI>,
+						  <&clk IMX8MN_CLK_DISP_APB>;
+				assigned-clock-parents = <&clk IMX8MN_SYS_PLL1_266M>,
+							 <&clk IMX8MN_CLK_24M>,
+							 <&clk IMX8MN_VIDEO_PLL1_OUT>,
+							 <&clk IMX8MN_SYS_PLL2_1000M>,
+							 <&clk IMX8MN_SYS_PLL1_800M>;
+				assigned-clock-rates = <266000000>,
+						       <24000000>,
+						       <594000000>,
+						       <500000000>,
+						       <200000000>;
 				#power-domain-cells = <1>;
 			};
 
-- 
2.39.2

