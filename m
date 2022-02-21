Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 328984BD8B7
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 10:53:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5A57112CD2;
	Mon, 21 Feb 2022 09:53:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B568F112CCF
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 09:53:42 +0000 (UTC)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ore@pengutronix.de>)
 id 1nM5Nb-0007AY-9w; Mon, 21 Feb 2022 10:53:15 +0100
Received: from ore by dude.hi.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ore@pengutronix.de>)
 id 1nM5NZ-00FUes-NP; Mon, 21 Feb 2022 10:53:13 +0100
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v1 6/8] ARM: dts: imx6dl-victgo: Add interrupt-counter nodes
Date: Mon, 21 Feb 2022 10:53:10 +0100
Message-Id: <20220221095312.3692669-6-o.rempel@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220221095312.3692669-1-o.rempel@pengutronix.de>
References: <20220221095312.3692669-1-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: devicetree@vger.kernel.org, Robin van der Gracht <robin@protonic.nl>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Oleksij Rempel <o.rempel@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 David Jander <david@protonic.nl>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Robin van der Gracht <robin@protonic.nl>

Interrupt counter is mainlined, now we can add missing counter nodes.

Signed-off-by: Robin van der Gracht <robin@protonic.nl>
Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
---
 arch/arm/boot/dts/imx6dl-victgo.dts | 41 ++++++++++++++++++++++++++++-
 1 file changed, 40 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/imx6dl-victgo.dts b/arch/arm/boot/dts/imx6dl-victgo.dts
index 20c7f80e5ec9..907682248aa7 100644
--- a/arch/arm/boot/dts/imx6dl-victgo.dts
+++ b/arch/arm/boot/dts/imx6dl-victgo.dts
@@ -54,6 +54,27 @@ comp0_out: endpoint {
 		};
 	};
 
+	counter-0 {
+		compatible = "interrupt-counter";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_counter0>;
+		gpios = <&gpio2 0 GPIO_ACTIVE_LOW>;
+	};
+
+	counter-1 {
+		compatible = "interrupt-counter";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_counter1>;
+		gpios = <&gpio2 1 GPIO_ACTIVE_LOW>;
+	};
+
+	counter-2 {
+		compatible = "interrupt-counter";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_counter2>;
+		gpios = <&gpio2 2 GPIO_ACTIVE_LOW>;
+	};
+
 	gpio-keys {
 		compatible = "gpio-keys";
 		pinctrl-names = "default";
@@ -400,7 +421,7 @@ &gpio1 {
 
 &gpio2 {
 	gpio-line-names =
-		"", "", "", "", "", "", "", "",
+		"YACO_WHEEL", "YACO_RADAR", "YACO_PTO", "", "", "", "", "",
 		"", "LED_PWM", "", "", "",
 			"", "", "",
 		"", "", "", "", "", "", "ISB_IN1", "ON_SWITCH",
@@ -706,6 +727,24 @@ MX6QDL_PAD_KEY_ROW3__GPIO4_IO13			0x13008
 		>;
 	};
 
+	pinctrl_counter0: counter0grp {
+		fsl,pins = <
+			MX6QDL_PAD_NANDF_D0__GPIO2_IO00			0x1b000
+		>;
+	};
+
+	pinctrl_counter1: counter1grp {
+		fsl,pins = <
+			MX6QDL_PAD_NANDF_D1__GPIO2_IO01			0x1b000
+		>;
+	};
+
+	pinctrl_counter2: counter2grp {
+		fsl,pins = <
+			MX6QDL_PAD_NANDF_D2__GPIO2_IO02			0x1b000
+		>;
+	};
+
 	pinctrl_ecspi1: ecspi1grp {
 		fsl,pins = <
 			MX6QDL_PAD_EIM_D17__ECSPI1_MISO			0x100b1
-- 
2.30.2

