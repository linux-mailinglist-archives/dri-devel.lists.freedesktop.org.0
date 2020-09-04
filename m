Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7F925DC65
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 16:54:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 872F66EC46;
	Fri,  4 Sep 2020 14:54:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13BC96EC45;
 Fri,  4 Sep 2020 14:54:14 +0000 (UTC)
Received: from kozik-lap.mshome.net (unknown [194.230.155.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 00E3520770;
 Fri,  4 Sep 2020 14:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599231253;
 bh=8DCiIQT4QmRUyZL55BGyuiFf/ASSh3pGLjvV3qU7b0U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=axFOgXNUlouJbYTWKptFbEYpVM/XPIw17xVMzEkB/rDE3QaswnNrTWVqeJStS7myj
 Nex7r/CMeN+JhTLXeHLn4W43h1GVzGeTJcqIsycgfXIEBZIVuYfCNIYpTILSvIJu/u
 1PMWepaBkTIANHbg0ODfKbitQhS7xKUfin3fS0b8=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rob Herring <robh+dt@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Lee Jones <lee.jones@linaro.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Sam Ravnborg <sam@ravnborg.org>, Li Yang <leoyang.li@nxp.com>,
 Robert Chiras <robert.chiras@nxp.com>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH 09/13] arm64: dts: imx8mp-evk: Align pin configuration group
 names with schema
Date: Fri,  4 Sep 2020 16:53:08 +0200
Message-Id: <20200904145312.10960-10-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200904145312.10960-1-krzk@kernel.org>
References: <20200904145312.10960-1-krzk@kernel.org>
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
Cc: Krzysztof Kozlowski <krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Device tree schema expects pin configuration groups to end with 'grp'
suffix, otherwise dtbs_check complain with a warning like:

  ... 'usdhc3grp-100mhz', 'usdhc3grp-200mhz' do not match any of the regexes: 'grp$', 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
index 3d535f1b3440..ad66f1286d95 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
@@ -157,7 +157,7 @@
 		>;
 	};
 
-	pinctrl_reg_usdhc2_vmmc: regusdhc2vmmc {
+	pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
 		fsl,pins = <
 			MX8MP_IOMUXC_SD2_RESET_B__GPIO2_IO19	0x41
 		>;
@@ -182,7 +182,7 @@
 		>;
 	};
 
-	pinctrl_usdhc2_100mhz: usdhc2grp-100mhz {
+	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
 		fsl,pins = <
 			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK	0x194
 			MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD	0x1d4
@@ -194,7 +194,7 @@
 		>;
 	};
 
-	pinctrl_usdhc2_200mhz: usdhc2grp-200mhz {
+	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
 		fsl,pins = <
 			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK	0x196
 			MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD	0x1d6
@@ -206,7 +206,7 @@
 		>;
 	};
 
-	pinctrl_usdhc2_gpio: usdhc2grp-gpio {
+	pinctrl_usdhc2_gpio: usdhc2gpiogrp {
 		fsl,pins = <
 			MX8MP_IOMUXC_SD2_CD_B__GPIO2_IO12	0x1c4
 		>;
@@ -228,7 +228,7 @@
 		>;
 	};
 
-	pinctrl_usdhc3_100mhz: usdhc3grp-100mhz {
+	pinctrl_usdhc3_100mhz: usdhc3-100mhzgrp {
 		fsl,pins = <
 			MX8MP_IOMUXC_NAND_WE_B__USDHC3_CLK	0x194
 			MX8MP_IOMUXC_NAND_WP_B__USDHC3_CMD	0x1d4
@@ -244,7 +244,7 @@
 		>;
 	};
 
-	pinctrl_usdhc3_200mhz: usdhc3grp-200mhz {
+	pinctrl_usdhc3_200mhz: usdhc3-200mhzgrp {
 		fsl,pins = <
 			MX8MP_IOMUXC_NAND_WE_B__USDHC3_CLK	0x196
 			MX8MP_IOMUXC_NAND_WP_B__USDHC3_CMD	0x1d6
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
