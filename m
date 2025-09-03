Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37BA0B42BD3
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 23:24:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68F7010E0C0;
	Wed,  3 Sep 2025 21:24:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=mainlining.org header.i=@mainlining.org header.b="rITEsLT2";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="RG6QPWuk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD91510E0C0;
 Wed,  3 Sep 2025 21:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org;
 c=relaxed/relaxed; 
 h=To:Message-Id:Subject:Date:From; t=1756933757; bh=kOyTxRctaHX33jswVqJqDGX
 PImZ/+NhMh8U+vrtfaiA=; b=rITEsLT2it269eF8+DTfp8E3kAMWaSagMtrWTHGFKyQj4C7JIp
 uQXkqQsvp/aU3TTbVCGAzl+yuLaUEJ9GQqlKzLU3Bl9ZkrpgRh60ZUglbBkK+fxzc6MQpWQuyQY
 229XgHgTRGmS2fAHbXLAKDaX3l61Mw4ZWfS7AXdwRYwg0RxhxNqFcgjpMjsMT1oG1yguGBIJRMH
 l+77cPBaAElA3M18SxlHZzLx0LeFfn/w7heAiTozZCAj5F+g4N/JuxArXyRneL3LB3fYan5XI5T
 0qM/25QIvo7biVEC3c2Df3IAjb0vH98AaFrzz55kbyoxSHsTdOkrqmQ1MHWnqXgubKA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org;
 c=relaxed/relaxed; 
 h=To:Message-Id:Subject:Date:From; t=1756933757; bh=kOyTxRctaHX33jswVqJqDGX
 PImZ/+NhMh8U+vrtfaiA=; b=RG6QPWuktSemPmBI1t8gYA7w0DnNCNydIP0EdxdUmpM7qsEJ3z
 YR7B/R/A5JPrsgnfRzhadvu3J+ikiHO0REAA==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?=
 <barnabas.czeman@mainlining.org>
Date: Wed, 03 Sep 2025 23:08:27 +0200
Subject: [PATCH v9 7/7] arm64: dts: qcom: Add Xiaomi Redmi 3S
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250903-msm8937-v9-7-a097c91c5801@mainlining.org>
References: <20250903-msm8937-v9-0-a097c91c5801@mainlining.org>
In-Reply-To: <20250903-msm8937-v9-0-a097c91c5801@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>, 
 =?utf-8?q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>, 
 Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>, 
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Robert Marko <robimarko@gmail.com>, 
 Adam Skladowski <a_skl39@protonmail.com>, 
 Sireesh Kodali <sireeshkodali@protonmail.com>, 
 Das Srinagesh <quic_gurus@quicinc.com>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, iommu@lists.linux.dev, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 linux@mainlining.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756933738; l=9618;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=J9QzaA+VimMgIh/6fWBfAQOu9EQwlUxN8GfOxiBR/Fw=;
 b=onr1Te3OBK9Sx3NAqRnH9TeSfME0GLnCd4lX00wKcq/qNbdW1+zu8OIjEEoNLicZAslsLgpdv
 djCdjMD+WFADQ11kEc9/P2/XIkSxsWdqhh89niFCJDqWL3/KLoTvuEZ
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add initial support for Xiaomi Redmi 3S (land).

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 arch/arm64/boot/dts/qcom/Makefile                |   1 +
 arch/arm64/boot/dts/qcom/msm8937-xiaomi-land.dts | 381 +++++++++++++++++++++++
 2 files changed, 382 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 0a7c308dec365263bbb7aa5f5cd306dbeacfd3f1..5e7a0e07039013f4032cfa8fa6dfddac63be6648 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -66,6 +66,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-wingtech-wt88047.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-yiming-uz801v3.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8917-xiaomi-riva.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8929-wingtech-wt82918hd.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= msm8937-xiaomi-land.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8939-huawei-kiwi.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8939-longcheer-l9100.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8939-samsung-a7.dtb
diff --git a/arch/arm64/boot/dts/qcom/msm8937-xiaomi-land.dts b/arch/arm64/boot/dts/qcom/msm8937-xiaomi-land.dts
new file mode 100644
index 0000000000000000000000000000000000000000..91837ff940f1b6b13a9ef519519f471a7a4cdac0
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8937-xiaomi-land.dts
@@ -0,0 +1,381 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2024, Barnabas Czeman
+ */
+/dts-v1/;
+
+#include <dt-bindings/arm/qcom,ids.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
+
+#include "msm8937.dtsi"
+#include "pm8937.dtsi"
+#include "pmi8950.dtsi"
+
+/delete-node/ &qseecom_mem;
+
+/ {
+	model = "Xiaomi Redmi 3S (land)";
+	compatible = "xiaomi,land", "qcom,msm8937";
+	chassis-type = "handset";
+
+	qcom,msm-id = <QCOM_ID_MSM8937 0x0>;
+	qcom,board-id = <0x1000b 1>, <0x2000b 1>;
+
+	aliases {
+		mmc0 = &sdhc_1;
+		mmc1 = &sdhc_2;
+	};
+
+	battery: battery {
+		compatible = "simple-battery";
+
+		charge-full-design-microamp-hours = <4100000>;
+		constant-charge-current-max-microamp = <1000000>;
+		voltage-min-design-microvolt = <3400000>;
+		voltage-max-design-microvolt = <4400000>;
+	};
+
+	chosen {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		stdout-path = "framebuffer0";
+
+		framebuffer0: framebuffer@8dd01000 {
+			compatible = "simple-framebuffer";
+			reg = <0x0 0x8dd01000 0x0 (720 * 1280 * 3)>;
+			width = <720>;
+			height = <1280>;
+			stride = <(720 * 3)>;
+			format = "r8g8b8";
+
+			clocks = <&gcc GCC_MDSS_AHB_CLK>,
+				 <&gcc GCC_MDSS_AXI_CLK>,
+				 <&gcc GCC_MDSS_VSYNC_CLK>,
+				 <&gcc GCC_MDSS_MDP_CLK>,
+				 <&gcc GCC_MDSS_BYTE0_CLK>,
+				 <&gcc GCC_MDSS_PCLK0_CLK>,
+				 <&gcc GCC_MDSS_ESC0_CLK>;
+			power-domains = <&gcc MDSS_GDSC>;
+		};
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		pinctrl-0 = <&gpio_keys_default>;
+		pinctrl-names = "default";
+
+		key-volup {
+			label = "Volume Up";
+			linux,code = <KEY_VOLUMEUP>;
+			gpios = <&tlmm 91 GPIO_ACTIVE_LOW>;
+			debounce-interval = <15>;
+		};
+	};
+
+	irled {
+		compatible = "gpio-ir-tx";
+		gpios = <&tlmm 45 GPIO_ACTIVE_HIGH>;
+	};
+
+	reserved-memory {
+		reserved@84a00000 {
+			reg = <0x0 0x84a00000 0x0 0x1900000>;
+			no-map;
+		};
+
+		framebuffer: memory@8dd01000 {
+			reg = <0x0 0x8dd01000 0x0 (720 * 1280 * 3)>;
+			no-map;
+		};
+	};
+
+	vph_pwr: vph-pwr-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "vph_pwr";
+		regulator-min-microvolt = <3700000>;
+		regulator-max-microvolt = <3700000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+};
+
+&blsp1_i2c2 {
+	status = "okay";
+
+	led-controller@45 {
+		compatible = "awinic,aw2013";
+		reg = <0x45>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		vcc-supply = <&pm8937_l10>;
+		vio-supply = <&pm8937_l5>;
+
+		led@0 {
+			reg = <0>;
+			function = LED_FUNCTION_STATUS;
+			led-max-microamp = <5000>;
+			color = <LED_COLOR_ID_RED>;
+		};
+
+		led@1 {
+			reg = <1>;
+			function = LED_FUNCTION_STATUS;
+			led-max-microamp = <5000>;
+			color = <LED_COLOR_ID_GREEN>;
+		};
+
+		led@2 {
+			reg = <2>;
+			function = LED_FUNCTION_STATUS;
+			led-max-microamp = <5000>;
+			color = <LED_COLOR_ID_BLUE>;
+		};
+	};
+};
+
+&blsp1_i2c3 {
+	status = "okay";
+
+	touchscreen@3e {
+		compatible = "edt,edt-ft5306";
+		reg = <0x3e>;
+
+		interrupts-extended = <&tlmm 65 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&tlmm 64 GPIO_ACTIVE_LOW>;
+		vcc-supply = <&pm8937_l10>;
+		iovcc-supply = <&pm8937_l5>;
+
+		pinctrl-0 = <&tsp_int_rst_default>;
+		pinctrl-names = "default";
+
+		touchscreen-size-x = <720>;
+		touchscreen-size-y = <1280>;
+	};
+};
+
+&pm8937_resin {
+	linux,code = <KEY_VOLUMEDOWN>;
+
+	status = "okay";
+};
+
+&pm8937_spmi_regulators {
+	/* APC */
+	pm8937_s5: s5 {
+		regulator-min-microvolt = <1050000>;
+		regulator-max-microvolt = <1350000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+};
+
+&pmi8950_wled {
+	qcom,num-strings = <2>;
+	qcom,external-pfet;
+	qcom,current-limit-microamp = <20000>;
+	qcom,ovp-millivolt = <29600>;
+
+	status = "okay";
+};
+
+&rpm_requests {
+	regulators-0 {
+		compatible = "qcom,rpm-pm8937-regulators";
+
+		vdd_s1-supply = <&vph_pwr>;
+		vdd_s2-supply = <&vph_pwr>;
+		vdd_s3-supply = <&vph_pwr>;
+		vdd_s4-supply = <&vph_pwr>;
+
+		vdd_l1_l19-supply = <&pm8937_s3>;
+		vdd_l2_l23-supply = <&pm8937_s3>;
+		vdd_l3-supply = <&pm8937_s3>;
+		vdd_l4_l5_l6_l7_l16-supply = <&pm8937_s4>;
+		vdd_l8_l11_l12_l17_l22-supply = <&vph_pwr>;
+		vdd_l9_l10_l13_l14_l15_l18-supply = <&vph_pwr>;
+
+		pm8937_s1: s1 {
+			regulator-min-microvolt = <1000000>;
+			regulator-max-microvolt = <1225000>;
+		};
+
+		pm8937_s3: s3 {
+			regulator-min-microvolt = <1300000>;
+			regulator-max-microvolt = <1300000>;
+		};
+
+		pm8937_s4: s4 {
+			regulator-min-microvolt = <2050000>;
+			regulator-max-microvolt = <2050000>;
+		};
+
+		pm8937_l2: l2 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+		};
+
+		pm8937_l5: l5 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		pm8937_l6: l6 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		pm8937_l7: l7 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		pm8937_l8: l8 {
+			regulator-min-microvolt = <2850000>;
+			regulator-max-microvolt = <2900000>;
+		};
+
+		pm8937_l9: l9 {
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3300000>;
+		};
+
+		pm8937_l10: l10 {
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <3000000>;
+		};
+
+		pm8937_l11: l11 {
+			regulator-min-microvolt = <2950000>;
+			regulator-max-microvolt = <2950000>;
+			regulator-allow-set-load;
+			regulator-system-load = <200000>;
+		};
+
+		pm8937_l12: l12 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2950000>;
+		};
+
+		pm8937_l13: l13 {
+			regulator-min-microvolt = <3075000>;
+			regulator-max-microvolt = <3075000>;
+		};
+
+		pm8937_l14: l14 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <3300000>;
+		};
+
+		pm8937_l15: l15 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <3300000>;
+		};
+
+		pm8937_l16: l16 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		pm8937_l17: l17 {
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <2900000>;
+		};
+
+		pm8937_l19: l19 {
+			regulator-min-microvolt = <1225000>;
+			regulator-max-microvolt = <1350000>;
+		};
+
+		pm8937_l22: l22 {
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <2800000>;
+		};
+
+		pm8937_l23: l23 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+		};
+	};
+};
+
+&sdc2_cmd_default {
+	drive-strength = <12>;
+};
+
+&sdc2_data_default {
+	drive-strength = <12>;
+};
+
+&sdhc_1 {
+	vmmc-supply = <&pm8937_l8>;
+	vqmmc-supply = <&pm8937_l5>;
+
+	status = "okay";
+};
+
+&sdhc_2 {
+	cd-gpios = <&tlmm 67 GPIO_ACTIVE_LOW>;
+	vmmc-supply = <&pm8937_l11>;
+	vqmmc-supply = <&pm8937_l12>;
+	pinctrl-0 = <&sdc2_default &sdc2_cd_default>;
+	pinctrl-1 = <&sdc2_sleep &sdc2_cd_default>;
+	pinctrl-names = "default", "sleep";
+
+	status = "okay";
+};
+
+&sleep_clk {
+	clock-frequency = <32768>;
+};
+
+&tlmm {
+	gpio-reserved-ranges = <0 4>, <20 4>;
+
+	gpio_keys_default: gpio-keys-default-state {
+		pins = "gpio91";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	sdc2_cd_default: sdc2-cd-default-state {
+		pins = "gpio67";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	tsp_int_rst_default: tsp-int-rst-default-state {
+		pins = "gpio64", "gpio65";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-pull-up;
+	};
+};
+
+&wcnss {
+	vddpx-supply = <&pm8937_l5>;
+
+	status = "okay";
+};
+
+&wcnss_iris {
+	compatible = "qcom,wcn3620";
+	vddxo-supply = <&pm8937_l7>;
+	vddrfa-supply = <&pm8937_l19>;
+	vddpa-supply = <&pm8937_l9>;
+	vdddig-supply = <&pm8937_l5>;
+};
+
+&wcnss_mem {
+	status = "okay";
+};
+
+&xo_board {
+	clock-frequency = <19200000>;
+};

-- 
2.51.0
