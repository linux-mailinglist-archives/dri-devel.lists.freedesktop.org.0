Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9722AC3FFA9
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 13:50:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20FE310EAB1;
	Fri,  7 Nov 2025 12:50:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="p4RSu86o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67C9E10EAB1
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Nov 2025 12:50:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 4D2C544685;
 Fri,  7 Nov 2025 12:50:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DA9C8C19423;
 Fri,  7 Nov 2025 12:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762519812;
 bh=yDiqSOQULBB2rLC+PqQWvExsXr88gNjIXBSWnDJ9wPQ=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=p4RSu86onv9sOIt+YfjV3mgmADd7zeL2+8fOGxZjlVpreuOijIZYnHngGNaFxulAs
 WpI+7FT4sIDyqfQ+Bbz1VNPmAh73gOeTbbH/lEQJnCr/fT1e8/oho0/OH+n/XqRzmQ
 sBt5iNDdtdtCtAcweYj4jS4rDqTxaWPPSPvvPQHFJa7IjTbSEUJzkjSHqQsnQ1Khqx
 8Z8GVv6QiS/DyMevK7kcg2EPM6RN1/KNFWQRa4ND6jr3t1nTzDWcLNhaxx81chfC0f
 2DyLhFzA4YY+Ybadsn35v5KeBM3wj/UXfpdXOHFnFMzbIiNQyjsBL7NMKw7rxyu64C
 2BrURyPSJk3Ww==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id D11D9CCFA18;
 Fri,  7 Nov 2025 12:50:12 +0000 (UTC)
From: Maud Spierings via B4 Relay
 <devnull+maudspierings.gocontroll.com@kernel.org>
Date: Fri, 07 Nov 2025 13:50:00 +0100
Subject: [PATCH v5 3/4] arm64: dts: freescale:
 moduline-display-av101hdt-a10: add backlight
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251107-max25014-v5-3-9a6aa57306bf@gocontroll.com>
References: <20251107-max25014-v5-0-9a6aa57306bf@gocontroll.com>
In-Reply-To: <20251107-max25014-v5-0-9a6aa57306bf@gocontroll.com>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-fbdev@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Maud Spierings <maudspierings@gocontroll.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762519811; l=1620;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=VwDrQbdFl3MoeRR0Hyu6UwVAM4rKJvip1fa/fyci9zk=;
 b=hlqHu2mewfEp0ujJzmXMfvckTMU+B7F8ukuGjncq52pBkYOJc+zA1IMAV6XZr2pP/RKQmw5mE
 MJJKe4x+LluA4pORHbbNBQoezZCcupw8UmPUtS9FE4UsP220Mod4xUd
X-Developer-Key: i=maudspierings@gocontroll.com; a=ed25519;
 pk=7chUb8XpaTQDvWhzTdHC0YPMkTDloELEC7q94tOUyPg=
X-Endpoint-Received: by B4 Relay for maudspierings@gocontroll.com/20250214
 with auth_id=341
X-Original-From: Maud Spierings <maudspierings@gocontroll.com>
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
Reply-To: maudspierings@gocontroll.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Maud Spierings <maudspierings@gocontroll.com>

Add the missing backlight driver.

Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
---
 ...x8p-ml81-moduline-display-106-av101hdt-a10.dtso | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dtso b/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dtso
index e3965caca6be..0e2914861154 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dtso
+++ b/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dtso
@@ -17,6 +17,7 @@
 
 	panel {
 		compatible = "boe,av101hdt-a10";
+		backlight = <&backlight>;
 		enable-gpios = <&gpio1 7 GPIO_ACTIVE_HIGH>;
 		pinctrl-0 = <&pinctrl_panel>;
 		pinctrl-names = "default";
@@ -40,7 +41,36 @@ reg_vbus: regulator-vbus {
 	};
 };
 
+&i2c4 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	backlight: backlight@6f {
+		compatible = "maxim,max25014";
+		reg = <0x6f>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		enable-gpios = <&gpio1 4 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_backlight>;
+		maxim,iset = <7>;
+
+		led@0 {
+			reg = <0>;
+			led-sources = <0 1 2>;
+			default-brightness = <50>;
+		};
+	};
+};
+
 &iomuxc {
+	pinctrl_backlight: backlightgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO04__GPIO1_IO04
+				(MX8MP_PULL_UP | MX8MP_PULL_ENABLE)
+		>;
+	};
+
 	pinctrl_panel: panelgrp {
 		fsl,pins = <
 			MX8MP_IOMUXC_GPIO1_IO07__GPIO1_IO07

-- 
2.51.2


