Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2884D3AE427
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jun 2021 09:25:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54D7689E08;
	Mon, 21 Jun 2021 07:25:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 505E489E08
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 07:25:34 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id g6so12963131pfq.1
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 00:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CDm4Fe12mdxq5DdIPspRuN5iFshZ9EbPE5vdu5Oxm04=;
 b=YZOmFhde+7WJEAJJcHhiE2RoCfiZ5+Xre9HWv6er8mZGYPFwx86A5pI5HvqQ2aIYJa
 mGQl507iONMiu2Njyt//5ToHzpgInx4NxnruZObcvkMMVEwmlvPwD1V4WVl+A4Mn9tpU
 Es22Hpp1Cbf2desjyFjngKNPKVp4vgR3lYPsE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CDm4Fe12mdxq5DdIPspRuN5iFshZ9EbPE5vdu5Oxm04=;
 b=tvw+OXvWO7DKkzfcI8QHauFWfKxq0dHonv9c8jG+i1T0k2sI6ZehRvIaAC/Vq4K/M5
 gukKehwKlyC0CO0joU1FuOSAM5zYnWbPoqmv4eZVgwFA5GLpHxymD4C5uIR3ntYvu5Vl
 h1kRz2gPzUmAhn0MJF2uSTEpgHgWkohZFGdFGQ5S00RqdeuRIIHZvLXv9if9dKmWnTHn
 WVhykht+eJK5p+MQt9AKiXgSD5A9yBAsRZjqD+GCn2M8E5M6yrPIa0x0C88OXowPsH5p
 Vo/ixehB/apfJwnvty7z8WJ+xlbwJ6zJtjQ22WyEOY0VPExc8Cim0+0IeheqOiBMW9Od
 +XYQ==
X-Gm-Message-State: AOAM531oj6RB0MfHIonwHt5mdf2aj134EOZpLb/9teSuSDaFKWteqhF+
 TH7ghL6BWLIKGy19pOnTKmCzRg==
X-Google-Smtp-Source: ABdhPJxxKWIiejU1Buqyxc/58klL8XS905Uz5TdWMrAYfu8+TVmMNfyDjpogOLqWfZadZDexODr4cQ==
X-Received: by 2002:a65:63d2:: with SMTP id n18mr22683982pgv.447.1624260333918; 
 Mon, 21 Jun 2021 00:25:33 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a884:139:e97f:a55d:7f66])
 by smtp.gmail.com with ESMTPSA id
 21sm13951294pfh.103.2021.06.21.00.25.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 00:25:33 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Tomasz Figa <t.figa@samsung.com>,
 Fancy Fang <chen.fang@nxp.com>
Subject: [RFC PATCH 8/9] arm64: dts: imx8mm: Add MIPI DSI pipeline
Date: Mon, 21 Jun 2021 12:54:23 +0530
Message-Id: <20210621072424.111733-9-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210621072424.111733-1-jagan@amarulasolutions.com>
References: <20210621072424.111733-1-jagan@amarulasolutions.com>
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
Cc: devicetree@vger.kernel.org,
 Francis Laniel <francis.laniel@amarulasolutions.com>,
 Matteo Lisi <matteo.lisi@engicam.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, Milco Pratesi <milco.pratesi@engicam.com>,
 Anthony Brandon <anthony@amarulasolutions.com>, linux-phy@lists.infradead.org,
 linux-amarula@amarulasolutions.com, linux-arm-kernel@lists.infradead.org,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add MIPI DSI pipeline for i.MX8MM.

Video pipeline start from eLCDIF to MIPI DSI and respective
Panel or Bridge on the backend side.

Add support for it.

Cc: Rob Herring <robh+dt@kernel.org>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 arch/arm64/boot/dts/freescale/imx8mm.dtsi | 59 +++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
index 5f68182ed3a6..bc09fce0f6a9 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
@@ -1047,6 +1047,65 @@ lcdif: lcdif@32e00000 {
 				interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
 				power-domains = <&dispmix_blk_ctl IMX8MM_BLK_CTL_PD_DISPMIX_LCDIF>;
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
+				compatible = "fsl,imx8mm-sec-dsim";
+				reg = <0x32e10000 0xa0>;
+				clocks = <&clk IMX8MM_CLK_DSI_CORE>,
+					 <&clk IMX8MM_CLK_DSI_PHY_REF>;
+				clock-names = "bus", "phy_ref";
+				assigned-clocks = <&clk IMX8MM_CLK_DSI_CORE>,
+						  <&clk IMX8MM_VIDEO_PLL1_OUT>,
+						  <&clk IMX8MM_CLK_DSI_PHY_REF>;
+				assigned-clock-parents = <&clk IMX8MM_SYS_PLL1_266M>,
+							 <&clk IMX8MM_VIDEO_PLL1_BYPASS>,
+							 <&clk IMX8MM_VIDEO_PLL1_OUT>;
+				assigned-clock-rates = <266000000>, <594000000>, <27000000>;
+				interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
+				phys = <&dphy>;
+				phy-names = "dphy";
+				power-domains = <&dispmix_blk_ctl IMX8MM_BLK_CTL_PD_DISPMIX_MIPI_DSI>;
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
+			};
+
+			dphy: dphy@32e100a4 {
+				compatible = "fsl,imx8mm-sec-dsim-dphy";
+				reg = <0x32e100a4 0xbc>;
+				clocks = <&clk IMX8MM_CLK_DSI_PHY_REF>;
+				clock-names = "phy_ref";
+				#phy-cells = <0>;
+				power-domains = <&dispmix_blk_ctl IMX8MM_BLK_CTL_PD_DISPMIX_MIPI_DPHY>;
+				status = "disabled";
 			};
 
 			dispmix_blk_ctl: blk-ctl@32e28000 {
-- 
2.25.1

