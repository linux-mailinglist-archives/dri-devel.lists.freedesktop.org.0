Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D45B1C97222
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 12:53:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4D0010E3AF;
	Mon,  1 Dec 2025 11:53:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QEXKQpc5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C46910E0A0
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Dec 2025 11:53:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3037644415;
 Mon,  1 Dec 2025 11:53:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0CE95C2BCB2;
 Mon,  1 Dec 2025 11:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764590006;
 bh=GmBvLXZvt8I62GcNCrFd8uMFNLRQ0E3zJfqAU/UXg5Q=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=QEXKQpc5k2p/rV8SOW1voyvTQixGmjC/Xts92rui2jXpScWKC0rSx3Azq7iqRCrL0
 HJV6AndFc0TNO9gkRsSQ8pVx7LYZmBtgk1xZytW3jdtbUWk1VrYgdmb+iTcnifW4Ep
 b2O6NlXCUuq/nqYr+dWjiz968bJicQ4zvCGAE1U6o152dSlXWiDswPqyTx/66euMeU
 AC5l4FsdfObFN9cWnIJcntUIVyvzkDEY6yryyAjsPa7jQ6fjzBUIOOrK4pGZBNmwSg
 IDS92RYZYCzrZjRk+FTw1N3ud3P+SIVtost8RPQFsOyunDkV8+CVKCynEW+pxkP0AJ
 +uNgsfGe354/g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id ED733D116FE;
 Mon,  1 Dec 2025 11:53:25 +0000 (UTC)
From: Maud Spierings via B4 Relay
 <devnull+maudspierings.gocontroll.com@kernel.org>
Date: Mon, 01 Dec 2025 12:53:23 +0100
Subject: [PATCH v6 4/4] arm64: dts: freescale:
 moduline-display-av123z7m-n17: add backlight
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251201-max25014-v6-4-88e3ac8112ff@gocontroll.com>
References: <20251201-max25014-v6-0-88e3ac8112ff@gocontroll.com>
In-Reply-To: <20251201-max25014-v6-0-88e3ac8112ff@gocontroll.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764590004; l=1603;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=p7v9nfcElDLPKwR+b9bnugh6l92KIwOyUGJG8sBB/to=;
 b=IswOnV6rtsUvU+mzQ+CDr164E2jUGWb6s2ps7ncTe9Tc1TOj+K8n4oNnpW0rhlZK45nDRKtcX
 f7cIklQWfrSDKM3SnGiHila/OtQteE0mBTqoiZEZUIUl66EsGnuG7+b
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

Add the missing backlight.

Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
---
 ...x8p-ml81-moduline-display-106-av123z7m-n17.dtso | 25 +++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av123z7m-n17.dtso b/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av123z7m-n17.dtso
index 3eb665ce9d5d..786a04ef40c8 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av123z7m-n17.dtso
+++ b/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av123z7m-n17.dtso
@@ -16,6 +16,7 @@
 
 	panel {
 		compatible = "boe,av123z7m-n17";
+		backlight = <&backlight>;
 		enable-gpios = <&gpio1 7 GPIO_ACTIVE_HIGH>;
 		pinctrl-0 = <&pinctrl_panel>;
 		pinctrl-names = "default";
@@ -91,10 +92,32 @@ lvds1_out: endpoint {
 		};
 	};
 
-	/* max25014 @ 0x6f */
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
+			led-sources = <0 1 2 3>;
+			default-brightness = <50>;
+		};
+	};
 };
 
 &iomuxc {
+	pinctrl_backlight: backlightgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO04__GPIO1_IO04
+				(MX8MP_PULL_UP | MX8MP_PULL_ENABLE)
+		>;
+	};
+
 	pinctrl_lvds_bridge: lvdsbridgegrp {
 		fsl,pins = <
 			MX8MP_IOMUXC_SAI1_TXD2__GPIO4_IO14

-- 
2.52.0


