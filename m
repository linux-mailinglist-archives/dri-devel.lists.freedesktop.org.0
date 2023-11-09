Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 084EE7E6603
	for <lists+dri-devel@lfdr.de>; Thu,  9 Nov 2023 10:01:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14BC810E1E8;
	Thu,  9 Nov 2023 09:00:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0832D10E1F3
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Nov 2023 09:00:30 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-408382da7f0so4112215e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Nov 2023 01:00:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699520429; x=1700125229; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=rRD0/XbQYtAW0UShy7dQxS5NCjY0yRMA96IAc7AjvhE=;
 b=tn0pp/n+kg0m6YJpOM2SENQvTS93ueiFq2O5mM8ELS/bTagFD/4LfeausumlIYGYL2
 KDBxlaW7ZPTILb3lWoFFJRruLXu+aedMiIZC8aYszbCWzZN551/MIeXCC0zXSLgR4yiG
 7o8w7XZt/bMQOZI+5ypW0y/0WRkNKR5tfQhoQyYS3A2WOUe04q74C3UsLXSE+Fq4TtW5
 VHAADomfbZ6OSMIVvOWMbfLaMn7CU/YfPUdmzxWoVtMxPagAtzFRtKurihN4I3YumVUy
 qr3/zg3ajxq0v1/ony4JJbdwzMMDIqLnUVQs4jLrK24JXc7ZZaWl8Y6+OBYF8bHL8C+Y
 4UZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699520429; x=1700125229;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rRD0/XbQYtAW0UShy7dQxS5NCjY0yRMA96IAc7AjvhE=;
 b=jyN0kBbWn4kLK9G1aJWM44ldirNh0/jvRKWBzMoLmJ9EtCyIikgUDnek9DAD/AWHIQ
 h7ybZL3kFC0ntRccuRKCNSMRmBBEtvh2wPMd5NkU5BITlptXTlnvTk2xgzaPMuS/4ChP
 V7qh/2MPz3yw84CW+zUshoWwdJcbvbHWKKJx4aAk6uJOjI0tUa0k4E3W0g+98VVg2TeS
 Wnz9qR2cNyUUBT4Sq/3lxU90v/88ViMM/TXRNJk8jT+11jRAfHv6/xkh1CLwBLtz3xMz
 Pr6U51ExAAbg7G8mSbaJSATFCWNHipdu3WDKkIUZ8ESRGbbJ687AEHr8yo9t0PH8ZKzW
 TM9g==
X-Gm-Message-State: AOJu0YxK8IGluAQv9hKuSP+WR/B4w5gQBwrYScNJ6VEg/kxip699bpfX
 IgUSnSWynsD+HSRNOJitKwt3+g==
X-Google-Smtp-Source: AGHT+IH1PZsrsUdvtkK1b/uaWdcKYXM46alsacN9sYpeejj2HSxdD0yzziyFxdptLGhODe4H/ZTH3w==
X-Received: by 2002:a05:600c:5493:b0:401:2ee0:7558 with SMTP id
 iv19-20020a05600c549300b004012ee07558mr3694405wmb.32.1699520428803; 
 Thu, 09 Nov 2023 01:00:28 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 ay36-20020a05600c1e2400b0040472ad9a3dsm1428484wmb.14.2023.11.09.01.00.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Nov 2023 01:00:28 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 09 Nov 2023 10:00:13 +0100
Subject: [PATCH v8 12/12] arm64: dts: amlogic: meson-g12b-bananapi-cm4: add
 support for MNT Reform2 with CM4 adaper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231109-amlogic-v6-4-upstream-dsi-ccf-vim3-v8-12-81e4aeeda193@linaro.org>
References: <20231109-amlogic-v6-4-upstream-dsi-ccf-vim3-v8-0-81e4aeeda193@linaro.org>
In-Reply-To: <20231109-amlogic-v6-4-upstream-dsi-ccf-vim3-v8-0-81e4aeeda193@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Nicolas Belin <nbelin@baylibre.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=9577;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=FjGQYDPRgRTrkhoNiGFDMiwmzXCPyK3G03dyvM4EzuE=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlTJ+aCBxym1TYTHlI0R0gub4W+VruYupoi63VwKCB
 baR6/VWJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZUyfmgAKCRB33NvayMhJ0Y/wD/
 9QPFxJnH9e1dZf7WMWNgmgA0B+2of2wBt3qlH4FSXVxewI/xjkdHhd7Hc3KhTZU6k57R+YycjZ+DdK
 qaXlSzQ3filpdZjr4HlAJNduym/TiYUntjjGVkxJjlTajpR6o/k9Ih09Jg8IctuUjbi8XOUmUcGLzA
 6Wly7ZCfA1TvhEJp0lCwrgDL/k2Rak6fr/2YNQR4v5oGUnWWFmQjiOc+kjYMwjAxE/HQ8ju9jYNxnF
 QL1wRvCj3Veu6aIrFBuQweBRVe/3El6Jvbfwua0Hs8ysddYHlHpPQGHt0JUVnxB6OA+YsyW79laejY
 IULsqFR7nDjV+Bt0qVn3wDeNemOIBigD7aVJYheaQYC5aKzGLD8O9oM4IeGZBs4PqPaphxGmY+op7Z
 TFc4N2actwXTUDyNjWYuXQ6vW0e8yXQFROO1ka6UwWGMl919V++2fFjqSKiuxZ1f9SorFWQ0ewtKL/
 1IXvgUq8+2i7QYGHqT/kHa6T7knbJRMfHdS7q1s34wEstkpUS8EDZzfW9gIM078EUxEfwYurb62zOX
 S1vT44kWVwXV+FZHntzY69zAQ0LQHVyJ9FZmuCopEYtvILi6K9keC2llvnA75Filtd/egDDsgUvJL+
 3EOdYFlb6kZ//suaVCexpyvAjGxS8Va3JB+s0GuIvlxIunnkYJnWcSkoAInA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 "Lukas F. Hartmann" <lukas@mntre.com>, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This adds a basic devicetree for the MNT Reform2 DIY laptop when using a
CM4 adapter and a BPI-CM4 module.

Co-developed-by: Lukas F. Hartmann <lukas@mntre.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/amlogic/Makefile               |   1 +
 .../meson-g12b-bananapi-cm4-mnt-reform2.dts        | 384 +++++++++++++++++++++
 2 files changed, 385 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
index cc8b34bd583d..58b5b332bdb7 100644
--- a/arch/arm64/boot/dts/amlogic/Makefile
+++ b/arch/arm64/boot/dts/amlogic/Makefile
@@ -15,6 +15,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-g12a-x96-max.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12b-a311d-bananapi-m2s.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12b-a311d-khadas-vim3.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12b-bananapi-cm4-cm4io.dtb
+dtb-$(CONFIG_ARCH_MESON) += meson-g12b-bananapi-cm4-mnt-reform2.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12b-gsking-x.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12b-gtking-pro.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12b-gtking.dtb
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4-mnt-reform2.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4-mnt-reform2.dts
new file mode 100644
index 000000000000..003efed529ba
--- /dev/null
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4-mnt-reform2.dts
@@ -0,0 +1,384 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2023 Neil Armstrong <neil.armstrong@linaro.org>
+ * Copyright 2023 MNT Research GmbH
+ */
+
+/dts-v1/;
+
+#include "meson-g12b-bananapi-cm4.dtsi"
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/sound/meson-g12a-tohdmitx.h>
+
+/ {
+	model = "MNT Reform 2 with BPI-CM4 Module";
+	compatible = "mntre,reform2-cm4", "bananapi,bpi-cm4", "amlogic,a311d", "amlogic,g12b";
+	chassis-type = "laptop";
+
+	aliases {
+		ethernet0 = &ethmac;
+		i2c0 = &i2c1;
+		i2c1 = &i2c3;
+	};
+
+	hdmi_connector: hdmi-connector {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_connector_in: endpoint {
+				remote-endpoint = <&hdmi_tx_tmds_out>;
+			};
+		};
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led-blue {
+			color = <LED_COLOR_ID_BLUE>;
+			function = LED_FUNCTION_STATUS;
+			gpios = <&gpio_ao GPIOAO_7 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "heartbeat";
+		};
+
+		led-green {
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_STATUS;
+			gpios = <&gpio_ao GPIOAO_2 GPIO_ACTIVE_HIGH>;
+		};
+	};
+
+	sound {
+		compatible = "amlogic,axg-sound-card";
+		model = "MNT-REFORM2-BPI-CM4";
+		audio-widgets = "Headphone", "Headphone Jack",
+				"Speaker", "External Speaker",
+				"Microphone", "Mic Jack";
+		audio-aux-devs = <&tdmout_a>, <&tdmout_b>, <&tdmin_b>;
+		audio-routing =	"TDMOUT_A IN 0", "FRDDR_A OUT 0",
+				"TDMOUT_A IN 1", "FRDDR_B OUT 0",
+				"TDMOUT_A IN 2", "FRDDR_C OUT 0",
+				"TDM_A Playback", "TDMOUT_A OUT",
+				"TDMOUT_B IN 0", "FRDDR_A OUT 1",
+				"TDMOUT_B IN 1", "FRDDR_B OUT 1",
+				"TDMOUT_B IN 2", "FRDDR_C OUT 1",
+				"TDM_B Playback", "TDMOUT_B OUT",
+				"TDMIN_B IN 1", "TDM_B Capture",
+				"TDMIN_B IN 4", "TDM_B Loopback",
+				"TODDR_A IN 1", "TDMIN_B OUT",
+				"TODDR_B IN 1", "TDMIN_B OUT",
+				"TODDR_C IN 1", "TDMIN_B OUT",
+				"Headphone Jack", "HP_L",
+				"Headphone Jack", "HP_R",
+				"External Speaker", "SPK_LP",
+				"External Speaker", "SPK_LN",
+				"External Speaker", "SPK_RP",
+				"External Speaker", "SPK_RN",
+				"LINPUT1", "Mic Jack",
+				"Mic Jack", "MICB";
+
+		assigned-clocks = <&clkc CLKID_MPLL2>,
+					<&clkc CLKID_MPLL0>,
+					<&clkc CLKID_MPLL1>;
+		assigned-clock-parents = <0>, <0>, <0>;
+		assigned-clock-rates = <294912000>,
+				       <270950400>,
+				       <393216000>;
+
+		dai-link-0 {
+			sound-dai = <&frddr_a>;
+		};
+
+		dai-link-1 {
+			sound-dai = <&frddr_b>;
+		};
+
+		dai-link-2 {
+			sound-dai = <&frddr_c>;
+		};
+
+		dai-link-3 {
+			sound-dai = <&toddr_a>;
+		};
+
+		dai-link-4 {
+			sound-dai = <&toddr_b>;
+		};
+
+		dai-link-5 {
+			sound-dai = <&toddr_c>;
+		};
+
+		/* 8ch hdmi interface */
+		dai-link-6 {
+			sound-dai = <&tdmif_a>;
+			dai-format = "i2s";
+			dai-tdm-slot-tx-mask-0 = <1 1>;
+			dai-tdm-slot-tx-mask-1 = <1 1>;
+			dai-tdm-slot-tx-mask-2 = <1 1>;
+			dai-tdm-slot-tx-mask-3 = <1 1>;
+			mclk-fs = <256>;
+
+			codec {
+				sound-dai = <&tohdmitx TOHDMITX_I2S_IN_A>;
+			};
+		};
+
+		/* Analog Audio */
+		dai-link-7 {
+			sound-dai = <&tdmif_b>;
+			dai-format = "i2s";
+			dai-tdm-slot-tx-mask-0 = <1 1>;
+			mclk-fs = <256>;
+
+			codec {
+				sound-dai = <&wm8960>;
+			};
+		};
+
+		/* hdmi glue */
+		dai-link-8 {
+			sound-dai = <&tohdmitx TOHDMITX_I2S_OUT>;
+
+			codec {
+				sound-dai = <&hdmi_tx>;
+			};
+		};
+	};
+
+	reg_main_1v8: regulator-main-1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "1V8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		vin-supply = <&reg_main_3v3>;
+	};
+
+	reg_main_1v2: regulator-main-1v2 {
+		compatible = "regulator-fixed";
+		regulator-name = "1V2";
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+		vin-supply = <&reg_main_5v>;
+	};
+
+	reg_main_3v3: regulator-main-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
+
+	reg_main_5v: regulator-main-5v {
+		compatible = "regulator-fixed";
+		regulator-name = "5V";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+	};
+
+	reg_main_usb: regulator-main-usb {
+		compatible = "regulator-fixed";
+		regulator-name = "USB_PWR";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&reg_main_5v>;
+	};
+
+	backlight: backlight {
+		compatible = "pwm-backlight";
+		pwms = <&pwm_AO_ab 0 10000 0>;
+		power-supply = <&reg_main_usb>;
+		enable-gpios = <&gpio 58 GPIO_ACTIVE_HIGH>;
+		brightness-levels = <0 32 64 128 160 200 255>;
+		default-brightness-level = <6>;
+	};
+
+	panel {
+		compatible = "innolux,n125hce-gn1";
+		power-supply = <&reg_main_3v3>;
+		backlight = <&backlight>;
+		no-hpd;
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&edp_bridge_out>;
+			};
+		};
+	};
+
+	clock_12288: clock_12288 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <12288000>;
+	};
+};
+
+&mipi_analog_dphy {
+	status = "okay";
+};
+
+&mipi_dphy {
+	status = "okay";
+};
+
+&mipi_dsi {
+	status = "okay";
+
+	assigned-clocks = <&clkc CLKID_GP0_PLL>,
+			  <&clkc CLKID_MIPI_DSI_PXCLK_SEL>,
+			  <&clkc CLKID_MIPI_DSI_PXCLK>,
+			  <&clkc CLKID_CTS_ENCL_SEL>,
+			  <&clkc CLKID_VCLK2_SEL>;
+	assigned-clock-parents = <0>,
+				 <&clkc CLKID_GP0_PLL>,
+				 <0>,
+				 <&clkc CLKID_VCLK2_DIV1>,
+				 <&clkc CLKID_GP0_PLL>;
+	assigned-clock-rates = <936000000>,
+			       <0>,
+			       <936000000>,
+			       <0>,
+			       <0>;
+};
+
+&mipi_dsi_panel_port {
+	mipi_dsi_out: endpoint {
+		remote-endpoint = <&edp_bridge_in>;
+	};
+};
+
+&cecb_AO {
+	status = "okay";
+};
+
+&ethmac {
+	status = "okay";
+};
+
+&hdmi_tx {
+	status = "okay";
+};
+
+&hdmi_tx_tmds_port {
+	hdmi_tx_tmds_out: endpoint {
+		remote-endpoint = <&hdmi_connector_in>;
+	};
+};
+
+&pwm_AO_ab {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pwm_ao_a_pins>;
+	status = "okay";
+};
+
+&i2c0 {
+	status = "okay";
+};
+
+&i2c3 {
+	status = "okay";
+
+	edp_bridge: bridge@2c {
+		compatible = "ti,sn65dsi86";
+		reg = <0x2c>;
+		enable-gpios = <&gpio GPIOX_10 GPIO_ACTIVE_HIGH>; // PIN_24 / GPIO8
+		vccio-supply = <&reg_main_1v8>;
+		vpll-supply = <&reg_main_1v8>;
+		vcca-supply = <&reg_main_1v2>;
+		vcc-supply = <&reg_main_1v2>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				edp_bridge_in: endpoint {
+					remote-endpoint = <&mipi_dsi_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				edp_bridge_out: endpoint {
+					remote-endpoint = <&panel_in>;
+				};
+			};
+		};
+	};
+};
+
+&i2c2 {
+	status = "okay";
+
+	wm8960: codec@1a {
+		compatible = "wlf,wm8960";
+		reg = <0x1a>;
+		clocks = <&clock_12288>;
+		clock-names = "mclk";
+		#sound-dai-cells = <0>;
+		wlf,shared-lrclk;
+	};
+
+	rtc@68 {
+		compatible = "nxp,pcf8523";
+		reg = <0x68>;
+	};
+};
+
+&pcie {
+	status = "okay";
+};
+
+&sd_emmc_b {
+	status = "okay";
+};
+
+&tdmif_a {
+	status = "okay";
+};
+
+&tdmout_a {
+	status = "okay";
+};
+
+&tdmif_b {
+	pinctrl-0 = <&tdm_b_dout0_pins>, <&tdm_b_fs_pins>, <&tdm_b_sclk_pins>, <&tdm_b_din1_pins>;
+	pinctrl-names = "default";
+
+	assigned-clocks = <&clkc_audio AUD_CLKID_TDM_SCLK_PAD1>,
+			  <&clkc_audio AUD_CLKID_TDM_LRCLK_PAD1>;
+	assigned-clock-parents = <&clkc_audio AUD_CLKID_MST_B_SCLK>,
+				 <&clkc_audio AUD_CLKID_MST_B_LRCLK>;
+	assigned-clock-rates = <0>, <0>;
+};
+
+&tdmin_b {
+	status = "okay";
+};
+
+&toddr_a {
+	status = "okay";
+};
+
+&toddr_b {
+	status = "okay";
+};
+
+&toddr_c {
+	status = "okay";
+};
+
+&tohdmitx {
+	status = "okay";
+};
+
+&usb {
+	dr_mode = "host";
+
+	status = "okay";
+};

-- 
2.34.1

