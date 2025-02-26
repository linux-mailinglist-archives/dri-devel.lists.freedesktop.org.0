Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7332AA4624A
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 15:19:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3447310E95B;
	Wed, 26 Feb 2025 14:19:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Xo8h/y6U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F36D10E921
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 14:19:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 173B45C5E06;
 Wed, 26 Feb 2025 14:18:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5B81EC4CEE4;
 Wed, 26 Feb 2025 14:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740579559;
 bh=+eHC+4H8Gxjzo6CEgrKwo0NFaiQaM/f4spY+AvS6fx8=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=Xo8h/y6UcexWCfDzJHJhr4MsZCqFhw31iVsqnktLYwvo+9cgZYP3I/395SC7ukPzn
 bqiFTA8vUlooQv9pcAijc4c1rmmyqkILglRKL4AfuffjnDjAXTr38mMe8+Aa2FPiI+
 EHxYW1GJTj+SOxUanbfpFNC3pCyGUDjsbPsVh/rcqoJA1OH1Uj9/1XIiWcFBQ+8zEx
 86vXqP5d0dKtXzZTV5r340CDS2MQTZrAzM5evjMVX2gOdEWKYjkmEg/QjKVB9gNdWx
 6Zf5OWDKH3e6TybriD7sUBGbj76ndtXFb2nfkowTtQroSDWpW+oq2s564RwwTu+wwM
 Er5jLke+Uyf+Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 453E8C18E7C;
 Wed, 26 Feb 2025 14:19:19 +0000 (UTC)
From: Maud Spierings via B4 Relay
 <devnull+maudspierings.gocontroll.com@kernel.org>
Date: Wed, 26 Feb 2025 15:19:19 +0100
Subject: [PATCH v2 08/12] arm64: dts: freescale: add Ka-Ro Electronics
 tx8p-ml81 COM
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250226-initial_display-v2-8-23fafa130817@gocontroll.com>
References: <20250226-initial_display-v2-0-23fafa130817@gocontroll.com>
In-Reply-To: <20250226-initial_display-v2-0-23fafa130817@gocontroll.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Liu Ying <victor.liu@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org, 
 Maud Spierings <maudspierings@gocontroll.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740579556; l=15971;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=U6EaQKYXnBF016yPvOvciC5YpGGfdo+pFQHsfi1Bjqc=;
 b=rBcuSiTILhNS1ZXn/B+Wuqg/MRk5yOQBBUGeoawABUSMWTcrsgaRRQZdGE155dE1OZsjtT6UB
 cfaAGDokxV+CZbhI8Wfv7frgB7zNVaRYhATYX+WGDhe3nnKA/SrcOns
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

The Ka-Ro Electronics tx8p-ml81 is a COM based on the imx8mp SOC. It has
2 GB or ram and 8 GB of eMMC storage on board.

Add it to enable boards based on this Module

Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
---
 .../arm64/boot/dts/freescale/imx8mp-tx8p-ml81.dtsi | 547 +++++++++++++++++++++
 1 file changed, 547 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..3c29265c3f0db87c8315aedc7386d58eb6bec6b8
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81.dtsi
@@ -0,0 +1,547 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2020 Lothar Waßmann <LW@KARO-electronics.de>
+ * 2025 Maud Spierings <maudspierings@gocontroll.com>
+ */
+
+#include "imx8mp.dtsi"
+
+/ {
+	/* PHY regulator */
+	regulator-3v3-etn {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_reg_3v3_etn>;
+		regulator-name = "3v3-etn";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&reg_vdd_3v3>;
+		gpios = <&gpio1 23 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+};
+
+&A53_0 {
+	cpu-supply = <&reg_vdd_arm>;
+};
+
+&A53_1 {
+	cpu-supply = <&reg_vdd_arm>;
+};
+
+&A53_2 {
+	cpu-supply = <&reg_vdd_arm>;
+};
+
+&A53_3 {
+	cpu-supply = <&reg_vdd_arm>;
+};
+
+
+&eqos {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&pinctrl_eqos>;
+	pinctrl-1 = <&pinctrl_eqos_sleep>;
+	assigned-clocks = <&clk IMX8MP_CLK_ENET_AXI>,
+			  <&clk IMX8MP_CLK_ENET_QOS_TIMER>,
+			  <&clk IMX8MP_CLK_ENET_QOS>;
+	assigned-clock-parents = <&clk IMX8MP_SYS_PLL1_266M>,
+				 <&clk IMX8MP_SYS_PLL2_100M>,
+				 <&clk IMX8MP_SYS_PLL2_50M>;
+	assigned-clock-rates = <0>, <100000000>, <50000000>;
+	phy-mode = "rmii";
+	phy-handle = <&ethphy0>;
+	status = "okay";
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		compatible = "snps,dwmac-mdio";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_ethphy_rst_b>;
+		reset-gpios = <&gpio4 22 GPIO_ACTIVE_LOW>;
+		reset-delay-us = <25000>;
+
+		ethphy0: ethernet-phy@0 {
+			reg = <0>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&pinctrl_ethphy_int_b>;
+			interrupt-parent = <&gpio4>;
+			interrupts = <21 IRQ_TYPE_EDGE_FALLING>;
+			clocks = <&clk IMX8MP_CLK_ENET_QOS>;
+			smsc,disable-energy-detect;
+		};
+	};
+};
+
+&gpio1 {
+	gpio-line-names = "SODIMM_152",
+		"SODIMM_42",
+		"PMIC_WDOG_B SODIMM_153",
+		"PMIC_IRQ_B",
+		"SODIMM_154",
+		"SODIMM_155",
+		"SODIMM_156",
+		"SODIMM_157",
+		"SODIMM_158",
+		"SODIMM_159",
+		"SODIMM_161",
+		"SODIMM_162",
+		"SODIMM_34",
+		"SODIMM_36",
+		"SODIMM_27",
+		"SODIMM_28",
+		"ENET_MDC",
+		"ENET_MDIO",
+		"",
+		"ENET_XTAL1/CLKIN",
+		"ENET_TXD1",
+		"ENET_TXD0",
+		"ENET_TXEN",
+		"ENET_POWER",
+		"ENET_COL/CRS_DV",
+		"ENET_RXER",
+		"ENET_RXD0",
+		"ENET_RXD1",
+		"",
+		"",
+		"",
+		"";
+};
+
+&gpio2 {
+	gpio-line-names = "",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"SODIMM_51",
+		"SODIMM_57",
+		"SODIMM_56",
+		"SODIMM_52",
+		"SODIMM_53",
+		"SODIMM_54",
+		"SODIMM_55",
+		"SODIMM_15",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"";
+};
+
+&gpio3 {
+	gpio-line-names = "",
+		"",
+		"EMMC_DS",
+		"EMMC_DAT5",
+		"EMMC_DAT6",
+		"EMMC_DAT7",
+		"",
+		"",
+		"",
+		"",
+		"EMMC_DAT0",
+		"EMMC_DAT1",
+		"EMMC_DAT2",
+		"EMMC_DAT3",
+		"",
+		"EMMC_DAT4",
+		"",
+		"EMMC_CLK",
+		"EMMC_CMD",
+		"SODIMM_75",
+		"SODIMM_145",
+		"SODIMM_163",
+		"SODIMM_164",
+		"SODIMM_165",
+		"SODIMM_143",
+		"SODIMM_144",
+		"SODIMM_72",
+		"SODIMM_73",
+		"SODIMM_74",
+		"SODIMM_93",
+		"",
+		"";
+};
+
+&gpio4 {
+	gpio-line-names = "SODIMM_98",
+		"SODIMM_99",
+		"SODIMM_100",
+		"SODIMM_101",
+		"SODIMM_45",
+		"SODIMM_43",
+		"SODIMM_105",
+		"SODIMM_106",
+		"SODIMM_107",
+		"SODIMM_108",
+		"SODIMM_104",
+		"SODIMM_103",
+		"SODIMM_115",
+		"SODIMM_114",
+		"SODIMM_113",
+		"SODIMM_112",
+		"SODIMM_109",
+		"SODIMM_110",
+		"SODIMM_95",
+		"SODIMM_96",
+		"SODIMM_97",
+		"ENET_nINT",
+		"ENET_nRST",
+		"SODIMM_84",
+		"SODIMM_87",
+		"SODIMM_86",
+		"SODIMM_85",
+		"SODIMM_83",
+		"",
+		"SODIMM_66",
+		"SODIMM_65",
+		"";
+};
+
+&gpio5 {
+	gpio-line-names = "",
+		"",
+		"",
+		"SODIMM_76",
+		"SODIMM_81",
+		"SODIMM_146",
+		"SODIMM_48",
+		"SODIMM_46",
+		"SODIMM_47",
+		"SODIMM_44",
+		"SODIMM_49",
+		"",
+		"SODIMM_70",
+		"SODIMM_69",
+		"PMIC_SCL",
+		"PMIC_SDA",
+		"SODIMM_41",
+		"SODIMM_40",
+		"SODIMM_148",
+		"SODIMM_149",
+		"SODIMM_150",
+		"SODIMM_151",
+		"SODIMM_60",
+		"SODIMM_59",
+		"SODIMM_64",
+		"SODIMM_63",
+		"SODIMM_62",
+		"SODIMM_61",
+		"SODIMM_68",
+		"SODIMM_67",
+		"",
+		"";
+};
+
+&i2c1 {
+	pinctrl-names = "default", "gpio";
+	pinctrl-0 = <&pinctrl_i2c1>;
+	pinctrl-1 = <&pinctrl_i2c1_gpio>;
+	clock-frequency = <400000>;
+	scl-gpios = <&gpio5 14 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio5 15 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	status = "okay";
+
+	pmic@25 {
+		reg = <0x25>;
+		compatible = "nxp,pca9450c";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_pmic>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <3 IRQ_TYPE_EDGE_FALLING>;
+
+		regulators {
+			reg_vdd_soc: BUCK1 {
+				regulator-name = "vdd-soc";
+				regulator-min-microvolt = <805000>;
+				regulator-max-microvolt = <900000>;
+				regulator-boot-on;
+				regulator-always-on;
+				regulator-ramp-delay = <3125>;
+			};
+
+			reg_vdd_arm: BUCK2 {
+				regulator-name = "vdd-core";
+				regulator-min-microvolt = <805000>;
+				regulator-max-microvolt = <950000>;
+				regulator-boot-on;
+				regulator-always-on;
+				regulator-ramp-delay = <3125>;
+				nxp,dvs-run-voltage = <950000>;
+				nxp,dvs-standby-voltage = <850000>;
+			};
+
+			reg_vdd_3v3: BUCK4 {
+				regulator-name = "3v3";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			reg_nvcc_nand: BUCK5 {
+				regulator-name = "nvcc-nand";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			reg_nvcc_dram: BUCK6 {
+				regulator-name = "nvcc-dram";
+				regulator-min-microvolt = <1100000>;
+				regulator-max-microvolt = <1100000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			reg_snvs_1v8: LDO1 {
+				regulator-name = "snvs-1v8";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			ldo2_reg: LDO2 {
+				regulator-name = "LDO2";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <1150000>;
+				regulator-always-on;
+			};
+
+			reg_vdda_1v8: LDO3 {
+				regulator-name = "vdda-1v8";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			ldo4_reg: LDO4 {
+				regulator-name = "LDO4";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <3300000>;
+			};
+
+			ldo5_reg: LDO5 {
+				regulator-name = "LDO5";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <3300000>;
+			};
+		};
+	};
+};
+
+&usdhc3 { /* eMMC */
+	max-frequency = <200000000>;
+	assigned-clocks = <&clk IMX8MP_CLK_USDHC3>;
+	assigned-clock-rates = <200000000>;
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	pinctrl-0 = <&pinctrl_usdhc3>;
+	pinctrl-1 = <&pinctrl_usdhc3_100mhz>;
+	pinctrl-2 = <&pinctrl_usdhc3_200mhz>;
+	bus-width = <8>;
+	vmmc-supply = <&reg_vdd_3v3>;
+	vqmmc-supply = <&reg_nvcc_nand>;
+	voltage-ranges = <3300 3300>;
+	non-removable;
+	status = "okay";
+};
+
+&iomuxc {
+	pinctrl_eqos: eqosgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_ENET_TD2__CCM_ENET_QOS_CLOCK_GENERATE_REF_CLK
+			(MX8MP_DSE_X4 | MX8MP_PULL_UP | MX8MP_PULL_ENABLE | MX8MP_SION)
+			MX8MP_IOMUXC_ENET_MDC__ENET_QOS_MDC
+			(MX8MP_DSE_X4 | MX8MP_PULL_UP | MX8MP_PULL_ENABLE)
+			MX8MP_IOMUXC_ENET_MDIO__ENET_QOS_MDIO
+			(MX8MP_DSE_X4 | MX8MP_PULL_UP | MX8MP_PULL_ENABLE)
+			MX8MP_IOMUXC_ENET_TD0__ENET_QOS_RGMII_TD0
+			(MX8MP_DSE_X6 | MX8MP_FSEL_FAST)
+			MX8MP_IOMUXC_ENET_TD1__ENET_QOS_RGMII_TD1
+			(MX8MP_DSE_X6 | MX8MP_FSEL_FAST)
+			MX8MP_IOMUXC_ENET_RD0__ENET_QOS_RGMII_RD0
+			(MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_PULL_ENABLE)
+			MX8MP_IOMUXC_ENET_RD1__ENET_QOS_RGMII_RD1
+			(MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_PULL_ENABLE)
+			MX8MP_IOMUXC_ENET_RXC__ENET_QOS_RX_ER
+			(MX8MP_FSEL_FAST | MX8MP_PULL_ENABLE)
+			MX8MP_IOMUXC_ENET_RX_CTL__ENET_QOS_RGMII_RX_CTL
+			(MX8MP_DSE_X6 | MX8MP_FSEL_FAST | MX8MP_PULL_ENABLE)
+			MX8MP_IOMUXC_ENET_TX_CTL__ENET_QOS_RGMII_TX_CTL
+			(MX8MP_DSE_X6 | MX8MP_FSEL_FAST)
+		>;
+	};
+
+	pinctrl_eqos_sleep: eqos-sleep-grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_ENET_TD2__GPIO1_IO19
+			(MX8MP_ODE_ENABLE | MX8MP_PULL_ENABLE)
+			MX8MP_IOMUXC_ENET_MDC__GPIO1_IO16
+			(MX8MP_ODE_ENABLE | MX8MP_PULL_ENABLE)
+			MX8MP_IOMUXC_ENET_MDIO__GPIO1_IO17
+			(MX8MP_ODE_ENABLE | MX8MP_PULL_ENABLE)
+			MX8MP_IOMUXC_ENET_TD0__GPIO1_IO21
+			(MX8MP_ODE_ENABLE | MX8MP_PULL_ENABLE)
+			MX8MP_IOMUXC_ENET_TD1__GPIO1_IO20
+			(MX8MP_ODE_ENABLE | MX8MP_PULL_ENABLE)
+			MX8MP_IOMUXC_ENET_RD0__GPIO1_IO26
+			(MX8MP_ODE_ENABLE | MX8MP_PULL_ENABLE)
+			MX8MP_IOMUXC_ENET_RD1__GPIO1_IO27
+			(MX8MP_ODE_ENABLE | MX8MP_PULL_ENABLE)
+			MX8MP_IOMUXC_ENET_RXC__GPIO1_IO25
+			(MX8MP_ODE_ENABLE | MX8MP_PULL_ENABLE)
+			MX8MP_IOMUXC_ENET_RX_CTL__GPIO1_IO24
+			(MX8MP_ODE_ENABLE | MX8MP_PULL_ENABLE)
+			MX8MP_IOMUXC_ENET_TX_CTL__GPIO1_IO22
+			(MX8MP_ODE_ENABLE | MX8MP_PULL_ENABLE)
+		>;
+	};
+
+	pinctrl_ethphy_int_b: ethphy-int-bgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI2_RXFS__GPIO4_IO21
+			(MX8MP_FSEL_FAST | MX8MP_HYS_SCHMITT)
+		>;
+	};
+
+	pinctrl_ethphy_rst_b: ethphy-rst-bgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI2_RXC__GPIO4_IO22
+			(MX8MP_PULL_UP | MX8MP_PULL_ENABLE)
+		>;
+	};
+
+	pinctrl_i2c1: i2c1grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_I2C1_SCL__I2C1_SCL
+			(MX8MP_DSE_X6 | MX8MP_PULL_UP | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE | MX8MP_SION)
+			MX8MP_IOMUXC_I2C1_SDA__I2C1_SDA
+			(MX8MP_DSE_X6 | MX8MP_PULL_UP | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE | MX8MP_SION)
+		>;
+	};
+
+	pinctrl_i2c1_gpio: i2c1-gpiogrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_I2C1_SCL__GPIO5_IO14
+			(MX8MP_DSE_X6 | MX8MP_PULL_UP | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE | MX8MP_SION)
+			MX8MP_IOMUXC_I2C1_SDA__GPIO5_IO15
+			(MX8MP_DSE_X6 | MX8MP_PULL_UP | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE | MX8MP_SION)
+		>;
+	};
+
+	pinctrl_pmic: pmicgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO03__GPIO1_IO03
+			(MX8MP_PULL_UP | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
+		>;
+	};
+
+	pinctrl_reg_3v3_etn: reg-3v3-etngrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_ENET_TXC__GPIO1_IO23
+			(MX8MP_PULL_UP | MX8MP_PULL_ENABLE)
+		>;
+	};
+
+	pinctrl_usdhc3: usdhc3grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_NAND_WE_B__USDHC3_CLK
+			(MX8MP_FSEL_FAST | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
+			MX8MP_IOMUXC_NAND_WP_B__USDHC3_CMD
+			(MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
+			MX8MP_IOMUXC_NAND_DATA04__USDHC3_DATA0
+			(MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
+			MX8MP_IOMUXC_NAND_DATA05__USDHC3_DATA1
+			(MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
+			MX8MP_IOMUXC_NAND_DATA06__USDHC3_DATA2
+			(MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
+			MX8MP_IOMUXC_NAND_DATA07__USDHC3_DATA3
+			(MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
+			MX8MP_IOMUXC_NAND_RE_B__USDHC3_DATA4
+			(MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
+			MX8MP_IOMUXC_NAND_CE2_B__USDHC3_DATA5
+			(MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
+			MX8MP_IOMUXC_NAND_CE3_B__USDHC3_DATA6
+			(MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
+			MX8MP_IOMUXC_NAND_CLE__USDHC3_DATA7
+			(MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
+			MX8MP_IOMUXC_NAND_CE1_B__USDHC3_STROBE
+			(MX8MP_FSEL_FAST | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
+		>;
+	};
+
+	pinctrl_usdhc3_100mhz: usdhc3-100mhzgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_NAND_WE_B__USDHC3_CLK
+			(MX8MP_DSE_X2 | MX8MP_FSEL_FAST | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
+			MX8MP_IOMUXC_NAND_WP_B__USDHC3_CMD
+			(MX8MP_DSE_X2 | MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
+			MX8MP_IOMUXC_NAND_DATA04__USDHC3_DATA0
+			(MX8MP_DSE_X2 | MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
+			MX8MP_IOMUXC_NAND_DATA05__USDHC3_DATA1
+			(MX8MP_DSE_X2 | MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
+			MX8MP_IOMUXC_NAND_DATA06__USDHC3_DATA2
+			(MX8MP_DSE_X2 | MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
+			MX8MP_IOMUXC_NAND_DATA07__USDHC3_DATA3
+			(MX8MP_DSE_X2 | MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
+			MX8MP_IOMUXC_NAND_RE_B__USDHC3_DATA4
+			(MX8MP_DSE_X2 | MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
+			MX8MP_IOMUXC_NAND_CE2_B__USDHC3_DATA5
+			(MX8MP_DSE_X2 | MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
+			MX8MP_IOMUXC_NAND_CE3_B__USDHC3_DATA6
+			(MX8MP_DSE_X2 | MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
+			MX8MP_IOMUXC_NAND_CLE__USDHC3_DATA7
+			(MX8MP_DSE_X2 | MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
+			MX8MP_IOMUXC_NAND_CE1_B__USDHC3_STROBE
+			(MX8MP_DSE_X2 | MX8MP_FSEL_FAST | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
+		>;
+	};
+
+	pinctrl_usdhc3_200mhz: usdhc3-200mhzgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_NAND_WE_B__USDHC3_CLK
+			(MX8MP_DSE_X6 | MX8MP_FSEL_FAST | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
+			MX8MP_IOMUXC_NAND_WP_B__USDHC3_CMD
+			(MX8MP_DSE_X6 | MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
+			MX8MP_IOMUXC_NAND_DATA04__USDHC3_DATA0
+			(MX8MP_DSE_X6 | MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
+			MX8MP_IOMUXC_NAND_DATA05__USDHC3_DATA1
+			(MX8MP_DSE_X6 | MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
+			MX8MP_IOMUXC_NAND_DATA06__USDHC3_DATA2
+			(MX8MP_DSE_X6 | MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
+			MX8MP_IOMUXC_NAND_DATA07__USDHC3_DATA3
+			(MX8MP_DSE_X6 | MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
+			MX8MP_IOMUXC_NAND_RE_B__USDHC3_DATA4
+			(MX8MP_DSE_X6 | MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
+			MX8MP_IOMUXC_NAND_CE2_B__USDHC3_DATA5
+			(MX8MP_DSE_X6 | MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
+			MX8MP_IOMUXC_NAND_CE3_B__USDHC3_DATA6
+			(MX8MP_DSE_X6 | MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
+			MX8MP_IOMUXC_NAND_CLE__USDHC3_DATA7
+			(MX8MP_DSE_X6 | MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
+			MX8MP_IOMUXC_NAND_CE1_B__USDHC3_STROBE
+			(MX8MP_DSE_X6 | MX8MP_FSEL_FAST | MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
+		>;
+	};
+};

-- 
2.48.1


