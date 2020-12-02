Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A39CC2CD105
	for <lists+dri-devel@lfdr.de>; Thu,  3 Dec 2020 09:15:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E6816E9B5;
	Thu,  3 Dec 2020 08:15:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F87E6E955
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Dec 2020 08:18:41 +0000 (UTC)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ore@pengutronix.de>)
 id 1kkNLI-0004hf-9s; Wed, 02 Dec 2020 09:18:28 +0100
Received: from ore by dude.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <ore@pengutronix.de>)
 id 1kkNLH-0007iF-QM; Wed, 02 Dec 2020 09:18:27 +0100
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v6 8/8] ARM: dts: add Plymovent BAS board
Date: Wed,  2 Dec 2020 09:18:26 +0100
Message-Id: <20201202081826.29512-9-o.rempel@pengutronix.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201202081826.29512-1-o.rempel@pengutronix.de>
References: <20201202081826.29512-1-o.rempel@pengutronix.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
X-Mailman-Approved-At: Thu, 03 Dec 2020 08:14:41 +0000
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Oleksij Rempel <o.rempel@pengutronix.de>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 David Jander <david@protonic.nl>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Plymovent BAS is a base system controller produced for the Plymovent filter
systems.

Co-Developed-by: David Jander <david@protonic.nl>
Signed-off-by: David Jander <david@protonic.nl>
Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
---
 arch/arm/boot/dts/Makefile          |   1 +
 arch/arm/boot/dts/imx6dl-plybas.dts | 394 ++++++++++++++++++++++++++++
 2 files changed, 395 insertions(+)
 create mode 100644 arch/arm/boot/dts/imx6dl-plybas.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 31249fc5f85c..ee725aebc3a8 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -461,6 +461,7 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6dl-pico-hobbit.dtb \
 	imx6dl-pico-nymph.dtb \
 	imx6dl-pico-pi.dtb \
+	imx6dl-plybas.dtb \
 	imx6dl-plym2m.dtb \
 	imx6dl-prtrvt.dtb \
 	imx6dl-prtvt7.dtb \
diff --git a/arch/arm/boot/dts/imx6dl-plybas.dts b/arch/arm/boot/dts/imx6dl-plybas.dts
new file mode 100644
index 000000000000..333c306aa946
--- /dev/null
+++ b/arch/arm/boot/dts/imx6dl-plybas.dts
@@ -0,0 +1,394 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) 2014 Protonic Holland
+ * Copyright (c) 2020 Oleksij Rempel <kernel@pengutronix.de>, Pengutronix
+ */
+
+/dts-v1/;
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
+#include "imx6dl.dtsi"
+
+/ {
+	model = "Plymovent BAS board";
+	compatible = "ply,plybas", "fsl,imx6dl";
+
+	chosen {
+		stdout-path = &uart4;
+	};
+
+	gpio_keys {
+		compatible = "gpio-keys";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		autorepeat;
+
+		button@20 {
+			label = "START";
+			linux,code = <31>;
+			gpios = <&gpio5 8 GPIO_ACTIVE_LOW>;
+		};
+
+		button@21 {
+			label = "CLEAN";
+			linux,code = <46>;
+			gpios = <&gpio5 9 GPIO_ACTIVE_LOW>;
+		};
+	};
+
+	leds {
+		compatible = "gpio-leds";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_leds>;
+
+		led-0 {
+			label = "debug0";
+			gpios = <&gpio1 8 GPIO_ACTIVE_HIGH>;
+		};
+
+		led-1 {
+			label = "debug1";
+			gpios = <&gpio1 9 GPIO_ACTIVE_HIGH>;
+		};
+
+		led-2 {
+			label = "light_tower1";
+			gpios = <&gpio4 22 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "heartbeat";
+		};
+
+		led-3 {
+			label = "light_tower2";
+			gpios = <&gpio4 23 GPIO_ACTIVE_HIGH>;
+		};
+
+		led-4 {
+			label = "light_tower3";
+			gpios = <&gpio4 24 GPIO_ACTIVE_HIGH>;
+		};
+
+		led-5 {
+			label = "light_tower4";
+			gpios = <&gpio4 25 GPIO_ACTIVE_HIGH>;
+		};
+	};
+
+	clk50m_phy: phy-clock {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <50000000>;
+	};
+
+	reg_5v0: regulator-5v0 {
+		compatible = "regulator-fixed";
+		regulator-name = "5v0";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+	};
+};
+
+&can1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_can1>;
+	xceiver-supply = <&reg_5v0>;
+	status = "okay";
+};
+
+&can2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_can2>;
+	xceiver-supply = <&reg_5v0>;
+	status = "okay";
+};
+
+&ecspi1 {
+	cs-gpios = <&gpio3 19 GPIO_ACTIVE_LOW>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_ecspi1>;
+	status = "okay";
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <20000000>;
+	};
+};
+
+&fec {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_enet>;
+	phy-mode = "rmii";
+	clocks = <&clks IMX6QDL_CLK_ENET>,
+		 <&clks IMX6QDL_CLK_ENET>,
+		 <&clk50m_phy>;
+	clock-names = "ipg", "ahb", "ptp";
+	phy-handle = <&rgmii_phy>;
+	status = "okay";
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		/* Microchip KSZ8081RNA PHY */
+		rgmii_phy: ethernet-phy@0 {
+			reg = <0>;
+			interrupts-extended = <&gpio4 30 IRQ_TYPE_LEVEL_LOW>;
+			reset-gpios = <&gpio4 26 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <10000>;
+			reset-deassert-us = <300>;
+		};
+	};
+};
+
+&gpio1 {
+	gpio-line-names =
+		"", "SD1_CD", "", "", "", "", "", "",
+		"DEBUG_0", "DEBUG_1", "", "", "", "", "", "",
+		"", "", "", "", "", "", "", "",
+		"", "", "", "", "", "", "", "";
+};
+
+&gpio3 {
+	gpio-line-names =
+		"", "", "", "", "", "", "", "",
+		"", "", "", "", "", "", "", "",
+		"", "", "", "ECSPI1_SS1", "", "USB_EXT_PWR", "", "",
+		"", "", "", "", "", "", "", "";
+};
+
+&gpio4 {
+	gpio-line-names =
+		"", "", "", "", "", "", "", "",
+		"", "", "", "", "CAN1_SR", "CAN2_SR", "", "",
+		"LED_DI0_DEBUG_0", "LED_DI0_DEBUG_1", "IMX6_IN12", "IMX6_HMI",
+			"IMX6_IN11", "IMX6_BUZZER", "IMX6_LED1", "IMX6_LED2",
+		"IMX6_LED3", "IMX6_LED4", "ETH_RESET", "IMX6_ANA_OUT_SD",
+			"IMX6_ANA_OUT_ERR", "IMX6_ANA_OUT", "ETH_INTRP", "";
+};
+
+&gpio5 {
+	gpio-line-names =
+		"", "", "", "", "", "IMX6_RELAY1", "IMX6_RELAY2", "",
+		"IMX6_IN1", "IMX6_IN2", "IMX6_IN3", "IMX6_IN4", "IMX6_IN5",
+			"IMX6_IN6", "IMX6_IN7", "IMX6_IN8",
+		"IMX6_IN9", "IMX6_IN10", "", "", "", "", "", "",
+		"", "", "", "", "", "", "", "";
+};
+
+&i2c1 {
+	clock-frequency = <100000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c1>;
+	status = "okay";
+
+	/* additional i2c devices are added automatically by the boot loader */
+};
+
+&i2c3 {
+	clock-frequency = <100000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c3>;
+	status = "okay";
+
+	temperature-sensor@70 {
+		compatible = "ti,tmp103";
+		reg = <0x70>;
+	};
+
+	rtc@51 {
+		compatible = "nxp,pcf8563";
+		reg = <0x51>;
+	};
+};
+
+&pwm1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pwm1>;
+	status = "okay";
+};
+
+&uart1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart1>;
+	status = "okay";
+};
+
+&uart2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart2>;
+	fsl,uart-has-rtscts;
+	linux,rs485-enabled-at-boot-time;
+	rs485-rts-delay = <0 20>;
+	status = "okay";
+};
+
+&uart4 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart4>;
+	status = "okay";
+};
+
+&usbotg {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_usbotg>;
+	phy_type = "utmi";
+	dr_mode = "host";
+	disable-over-current;
+	status = "okay";
+};
+
+&usbphynop1 {
+	status = "disabled";
+};
+
+&usbphynop2 {
+	status = "disabled";
+};
+
+&iomuxc {
+	pinctrl_can1: can1grp {
+		fsl,pins = <
+			MX6QDL_PAD_KEY_ROW2__FLEXCAN1_RX		0x1b000
+			MX6QDL_PAD_KEY_COL2__FLEXCAN1_TX		0x3008
+			/* CAN1_SR */
+			MX6QDL_PAD_KEY_COL3__GPIO4_IO12			0x13008
+		>;
+	};
+
+	pinctrl_can2: can2grp {
+		fsl,pins = <
+			MX6QDL_PAD_KEY_ROW4__FLEXCAN2_RX		0x1b000
+			MX6QDL_PAD_KEY_COL4__FLEXCAN2_TX		0x3008
+			/* CAN2_SR */
+			MX6QDL_PAD_KEY_ROW3__GPIO4_IO13			0x13008
+		>;
+	};
+
+	pinctrl_ecspi1: ecspi1grp {
+		fsl,pins = <
+			MX6QDL_PAD_EIM_D17__ECSPI1_MISO			0x1b000
+			MX6QDL_PAD_EIM_D18__ECSPI1_MOSI			0x3008
+			MX6QDL_PAD_EIM_D16__ECSPI1_SCLK			0x3008
+			/* CS */
+			MX6QDL_PAD_EIM_D19__GPIO3_IO19			0x3008
+		>;
+	};
+
+	pinctrl_enet: enetgrp {
+		fsl,pins = <
+			/* MX6QDL_ENET_PINGRP4 */
+			MX6QDL_PAD_ENET_MDC__ENET_MDC			0x1b0b0
+			MX6QDL_PAD_ENET_MDIO__ENET_MDIO			0x1b0b0
+			MX6QDL_PAD_ENET_RXD0__ENET_RX_DATA0		0x1b0b0
+			MX6QDL_PAD_ENET_RXD1__ENET_RX_DATA1		0x1b0b0
+			MX6QDL_PAD_ENET_RX_ER__ENET_RX_ER		0x1b0b0
+			MX6QDL_PAD_ENET_TX_EN__ENET_TX_EN		0x1b0b0
+			MX6QDL_PAD_ENET_TXD0__ENET_TX_DATA0		0x1b0b0
+			MX6QDL_PAD_ENET_TXD1__ENET_TX_DATA1		0x1b0b0
+			MX6QDL_PAD_ENET_CRS_DV__ENET_RX_EN		0x1b0b0
+
+			MX6QDL_PAD_GPIO_16__ENET_REF_CLK		0x1b0b0
+			/* Phy reset */
+			MX6QDL_PAD_DISP0_DAT5__GPIO4_IO26		0x1b0b0
+			/* nINTRP */
+			MX6QDL_PAD_DISP0_DAT9__GPIO4_IO30		0x1b0b0
+		>;
+	};
+
+	pinctrl_i2c1: i2c1grp {
+		fsl,pins = <
+			MX6QDL_PAD_CSI0_DAT8__I2C1_SDA			0x4001f8b1
+			MX6QDL_PAD_CSI0_DAT9__I2C1_SCL			0x4001f8b1
+		>;
+	};
+
+	pinctrl_i2c3: i2c3grp {
+		fsl,pins = <
+			MX6QDL_PAD_GPIO_5__I2C3_SCL			0x4001b8b1
+			MX6QDL_PAD_GPIO_6__I2C3_SDA			0x4001b8b1
+		>;
+	};
+
+	pinctrl_leds: ledsgrp {
+		fsl,pins = <
+			/* DEBUG_0 */
+			MX6QDL_PAD_GPIO_8__GPIO1_IO08			0x1b0b0
+			/* DEBUG_1 */
+			MX6QDL_PAD_GPIO_9__GPIO1_IO09			0x1b0b0
+
+			/* LED1 (lighttower) */
+			MX6QDL_PAD_DISP0_DAT1__GPIO4_IO22		0x13070
+			/* LED2 (lighttower) */
+			MX6QDL_PAD_DISP0_DAT2__GPIO4_IO23		0x13070
+			/* LED3 (lighttower) */
+			MX6QDL_PAD_DISP0_DAT3__GPIO4_IO24		0x13070
+			/* LED4 (lighttower) */
+			MX6QDL_PAD_DISP0_DAT4__GPIO4_IO25		0x13070
+		>;
+	};
+
+	pinctrl_pwm1: pwm1grp {
+		fsl,pins = <
+			MX6QDL_PAD_DISP0_DAT8__PWM1_OUT			0x1b0b0
+		>;
+	};
+
+	/* YaCO AUX Uart */
+	pinctrl_uart1: uart1grp {
+		fsl,pins = <
+			MX6QDL_PAD_CSI0_DAT10__UART1_TX_DATA		0x1b0b1
+			MX6QDL_PAD_CSI0_DAT11__UART1_RX_DATA		0x1b0b1
+		>;
+	};
+
+	pinctrl_uart2: uart2grp {
+		fsl,pins = <
+			MX6QDL_PAD_EIM_D26__UART2_TX_DATA		0x1b0b1
+			MX6QDL_PAD_EIM_D27__UART2_RX_DATA		0x1b0b1
+			MX6QDL_PAD_EIM_D28__UART2_DTE_CTS_B		0x130b1
+		>;
+	};
+
+	pinctrl_uart4: uart4grp {
+		fsl,pins = <
+			MX6QDL_PAD_KEY_COL0__UART4_TX_DATA		0x1b0b1
+			MX6QDL_PAD_KEY_ROW0__UART4_RX_DATA		0x1b0b1
+		>;
+	};
+
+	pinctrl_usbotg: usbotggrp {
+		fsl,pins = <
+			MX6QDL_PAD_EIM_D21__USB_OTG_OC			0x1b0b0
+			/* power enable, high active */
+			MX6QDL_PAD_EIM_D22__GPIO3_IO22			0x1b0b0
+		>;
+	};
+
+	pinctrl_usdhc1: usdhc1grp {
+		fsl,pins = <
+			MX6QDL_PAD_SD1_CMD__SD1_CMD			0x170f9
+			MX6QDL_PAD_SD1_CLK__SD1_CLK			0x100f9
+			MX6QDL_PAD_SD1_DAT0__SD1_DATA0			0x170f9
+			MX6QDL_PAD_SD1_DAT1__SD1_DATA1			0x170f9
+			MX6QDL_PAD_SD1_DAT2__SD1_DATA2			0x170f9
+			MX6QDL_PAD_SD1_DAT3__SD1_DATA3			0x170f9
+			MX6QDL_PAD_GPIO_1__GPIO1_IO01			0x1b0b0
+		>;
+	};
+
+	pinctrl_usdhc3: usdhc3grp {
+		fsl,pins = <
+			MX6QDL_PAD_SD3_CMD__SD3_CMD			0x17099
+			MX6QDL_PAD_SD3_CLK__SD3_CLK			0x10099
+			MX6QDL_PAD_SD3_DAT0__SD3_DATA0			0x17099
+			MX6QDL_PAD_SD3_DAT1__SD3_DATA1			0x17099
+			MX6QDL_PAD_SD3_DAT2__SD3_DATA2			0x17099
+			MX6QDL_PAD_SD3_DAT3__SD3_DATA3			0x17099
+			MX6QDL_PAD_SD3_DAT4__SD3_DATA4			0x17099
+			MX6QDL_PAD_SD3_DAT5__SD3_DATA5			0x17099
+			MX6QDL_PAD_SD3_DAT6__SD3_DATA6			0x17099
+			MX6QDL_PAD_SD3_DAT7__SD3_DATA7			0x17099
+			MX6QDL_PAD_SD3_RST__SD3_RESET			0x1b0b1
+		>;
+	};
+};
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
