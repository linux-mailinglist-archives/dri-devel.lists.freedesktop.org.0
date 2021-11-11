Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C4944D4E2
	for <lists+dri-devel@lfdr.de>; Thu, 11 Nov 2021 11:15:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9DDB6EA69;
	Thu, 11 Nov 2021 10:15:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B28186EA69
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Nov 2021 10:15:19 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id b68so5182408pfg.11
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Nov 2021 02:15:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=G4Vsnm+KN57AyBuovnCtAA6nuAOl1P3qjMg431Kf+ME=;
 b=pX2LgSK0aMfAVY6DbC0aaNykMDSy2c76sSb59u5g5r62SZKnm+NOjD5g7vBfIkYSfI
 N0/4AQpoiMvCU3R9qOa17ImJ3i/Xd+5FB30HuWHKhlgYvp5Ki9RccbjYw6djFZ3cxwrx
 Wu/gFLL6Ko8cBoZqdwPe0Z2uQkVpBhIbTJniY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=G4Vsnm+KN57AyBuovnCtAA6nuAOl1P3qjMg431Kf+ME=;
 b=QLf8+QC84OWvZ1yQcK8mzdtzqs5xhUxGgUcu2rvs+wgv8FIBQq1unozIAyqPkAamNL
 sTLMuF2GIa2sG6Z27pd++kOLbTuTCiKgkygSfXHzeWCgcMuaHQXrUNDy0jW8KU/RmbKP
 aXKFuxsaMCXKVt6erlKHG5mfdBlLSRAnukhAgrHnMz3eeI153EDInjgAFK2eD7s+ZiS1
 Q+pPIgcOrb+Er6Py4LLPbgXoRLkdyO4CdXJ/LanoptW6Zj4KKgHkesiU1bHLj+mz2wWo
 pUusae6SSzJSP6GbXyFrGrrLcY+Pxjb2oJUuENn+V6J1wGsnCYPh/cz52hndeX40VL6U
 Kmsg==
X-Gm-Message-State: AOAM533gFliGA6iKSBw7g4neCnpRGhUYUXawdiBNlydE3dkmwQ1Shpbu
 UVdUPyllPLqQO6KvE59QY8dkZw==
X-Google-Smtp-Source: ABdhPJy+N+yR5OmQz7K+eSdLWarox6smbyMCvYcQAIreVrEFPt1e8er1wwb9sRqSQNFxkxvOHWR7Qg==
X-Received: by 2002:aa7:9101:0:b0:49f:af85:b72c with SMTP id
 1-20020aa79101000000b0049faf85b72cmr5502332pfh.53.1636625719136; 
 Thu, 11 Nov 2021 02:15:19 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a0a9:3041:135c:4e21:846c])
 by smtp.gmail.com with ESMTPSA id t12sm8035667pjo.44.2021.11.11.02.15.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Nov 2021 02:15:18 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Tim Harvey <tharvey@gateworks.com>, Adam Ford <aford173@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Lucas Stach <l.stach@pengutronix.de>,
 Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 Marek Vasut <marex@denx.de>, Frieder Schrempf <frieder.schrempf@kontron.de>
Subject: [RFC PATCH v2 2/3] arm64: dts: imx8mm: Add MIPI DSI pipeline
Date: Thu, 11 Nov 2021 15:44:55 +0530
Message-Id: <20211111101456.584061-3-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211111101456.584061-1-jagan@amarulasolutions.com>
References: <20211111101456.584061-1-jagan@amarulasolutions.com>
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
Cc: Matteo Lisi <matteo.lisi@engicam.com>, dri-devel@lists.freedesktop.org,
 Jagan Teki <jagan@amarulasolutions.com>, linux-amarula@amarulasolutions.com,
 linux-arm-kernel@lists.infradead.org, NXP Linux Team <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add MIPI DSI pipeline for i.MX8MM.

Video pipeline start from eLCDIF to MIPI DSI and respective
Panel or Bridge on the backend side.

Add support for it.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 arch/arm64/boot/dts/freescale/imx8mm.dtsi | 55 +++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
index caeb93313413..eddf3a467fd2 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
@@ -188,6 +188,12 @@ clk_ext4: clock-ext4 {
 		clock-output-names = "clk_ext4";
 	};
 
+	mipi_phy: mipi-video-phy {
+		compatible = "fsl,imx8mm-mipi-video-phy";
+		syscon = <&disp_blk_ctrl>;
+		#phy-cells = <1>;
+	};
+
 	psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
@@ -1085,6 +1091,55 @@ lcdif: lcdif@32e00000 {
 				interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
 				power-domains = <&disp_blk_ctrl IMX8MM_DISPBLK_PD_LCDIF>;
 				status = "disabled";
+
+				port {
+					lcdif_out_dsi: endpoint {
+						remote-endpoint = <&dsi_in_lcdif>;
+					};
+				};
+			};
+
+			dsi: dsi@32e10000 {
+				compatible = "fsl,imx8mm-mipi-dsim";
+				reg = <0x32e10000 0x400>;
+				clocks = <&clk IMX8MM_CLK_DSI_CORE>,
+					 <&clk IMX8MM_CLK_DSI_PHY_REF>;
+				clock-names = "bus_clk", "sclk_mipi";
+				assigned-clocks = <&clk IMX8MM_CLK_DSI_CORE>,
+						  <&clk IMX8MM_VIDEO_PLL1_OUT>,
+						  <&clk IMX8MM_CLK_DSI_PHY_REF>;
+				assigned-clock-parents = <&clk IMX8MM_SYS_PLL1_266M>,
+							 <&clk IMX8MM_VIDEO_PLL1_BYPASS>,
+							 <&clk IMX8MM_VIDEO_PLL1_OUT>;
+				assigned-clock-rates = <266000000>, <594000000>, <27000000>;
+				interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
+				phys = <&mipi_phy 0>;
+				phy-names = "dsim";
+				power-domains = <&disp_blk_ctrl IMX8MM_DISPBLK_PD_MIPI_DSI>;
+				samsung,burst-clock-frequency = <891000000>;
+				samsung,esc-clock-frequency = <54000000>;
+				samsung,pll-clock-frequency = <27000000>;
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						#address-cells = <1>;
+						#size-cells = <0>;
+
+						dsi_in_lcdif: endpoint@0 {
+							reg = <0>;
+							remote-endpoint = <&lcdif_out_dsi>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+					};
+				};
 			};
 
 			disp_blk_ctrl: blk-ctrl@32e28000 {
-- 
2.25.1

