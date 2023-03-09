Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2656B26C9
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 15:23:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BED710E828;
	Thu,  9 Mar 2023 14:23:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F310610E816
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 14:23:16 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 bg16-20020a05600c3c9000b003eb34e21bdfso3746774wmb.0
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Mar 2023 06:23:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678371796;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=VYr2rTQd5OqqFlwn0mh+b9fBqUxfXxgKh7jA4m3c5ZA=;
 b=A564OYtNJLEhNE1scz/6CLXDNTdTSS+mgCdAPZuSC0lv4boZlc4P/T6kJMQwWF0TGo
 8SbJ1EEXWOCu9lqvgM/3yIQrf9AFY8gWqNHfjGr5xkfry9asdObxjQ2t+r6DQTjaKYLs
 Ie+1QYG7Qszqg15rIzUBVGbhMU52gbPuYFKrQYqFfyIMQbScm0IzCy8OiUxBTF5SNufv
 8CudAesL4secrsbdyRNOL14uztwvxPodNBfIgKXLkK3jTFC4FmB8a6GHm/COF8siLmWt
 E8xuV/gDUKhF4LYixoi/VSMKPuNN64b74pAumSdH0eSMbNn8ccE/w1RAm8+8V3pm65jF
 aYAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678371796;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VYr2rTQd5OqqFlwn0mh+b9fBqUxfXxgKh7jA4m3c5ZA=;
 b=UuLJ8SLXu1RywZIyVGT4PVgyFrhMZTEqpEzeSv7sDoimIVL38IXNLHBSQa/iqUdRJT
 yRb5K/J+7Y3AittnoUU2iCwd+vPiffCSGuASowp+HxsncfDAJoFDqy++zavPtBAWDrIo
 MAt1FAinW40t8o3nSCbw7v8aIG2bYt/OBl7+KjKXmX/ijB/aymEJJ6KgoMGrrFxoOazh
 utwqD6frIJHL+K7TkqyleCIK+q7QA4+FmIPmE2HYz37XlChPLfBXfnaZCcerxUH9sXur
 omX9L2MrZLgMHzhWJrmuFASv++o2OI5W1x7fbjN73DNj3m97rrHdZ+aLgvWyDh2bFWkt
 klZg==
X-Gm-Message-State: AO0yUKWIxqmLSbuORZbMULZOxFve7LiVGppprwl12nIwUbdVcYjHxVKS
 jQHV4OKepIMbEtKHEyX62L+G9Q==
X-Google-Smtp-Source: AK7set9sI5gZVZZTbNv6xVHUoL83H4u7fW5NjL4o87Wd2GPGYAY1pkmkyjTiFf74CjViJEH/WR6VIQ==
X-Received: by 2002:a7b:c8d9:0:b0:3eb:2067:1141 with SMTP id
 f25-20020a7bc8d9000000b003eb20671141mr20381222wml.38.1678371796548; 
 Thu, 09 Mar 2023 06:23:16 -0800 (PST)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 x22-20020a1c7c16000000b003e8dc7a03basm2772434wmc.41.2023.03.09.06.23.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 06:23:16 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 09 Mar 2023 15:23:06 +0100
Subject: [PATCH 17/21] arm64: dts: mediatek: add display support for mt8365-evk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20230220-display-v1-17-45cbc68e188b@baylibre.com>
References: <20230220-display-v1-0-45cbc68e188b@baylibre.com>
In-Reply-To: <20230220-display-v1-0-45cbc68e188b@baylibre.com>
To: Daniel Vetter <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>, Jitao Shi <jitao.shi@mediatek.com>,
 Thierry Reding <thierry.reding@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Sam Ravnborg <sam@ravnborg.org>,
 Rob Herring <robh+dt@kernel.org>, Uwe Kleine-König <u.kleine-koenig@pengutronix.de>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, David Airlie <airlied@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Xinlei Lee <xinlei.lee@mediatek.com>
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=6680; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=E1//0k1NYcUIDwg5zv5tn0PC2KL+Uw835ZkCZCGrLDU=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkCeu+68OwYw2MU0lI1uTlfqB+5VstpOZ4Z1JEuF4H
 6r/nUP6JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZAnrvgAKCRArRkmdfjHURZU2D/
 9On0dg5e8cqzNThvm5WqK0hQjiJvjlBwj+v0KdvCdu7AnXIjTgMYKjDopomNHIemVQubvcG/AUFgCg
 IWrXEaxaBvpqzDJKulaoR62WfJLcKmCnFjHrWurwUzuCElGMyDW9W1iiCsmwE4a5pRKCmE3DDLROoS
 TZiLc2rsI1GUGqSbunpInCLZAozihnqUaAuWof7qTvkPZmp+T67MLNjta8679be5fCcPvi8wJFPKmI
 FNMfTTFBdWpz7KgZPZYz62z6WZ9rRmVRqSpVv3siA3XLqxrVAkGsLNbepfF72zpzbdRUihsJw6DZ8N
 PkpOgJVrFxRqvz2YhaXyFqDKnZ9maCYf7pjloR391np47FmhvHYNSBz7f0OTT2IwhInJAyTZFwDEbz
 DLjeC8IknCxa/DCRg1gHHzRuBZnJpISuaVVFQ3iO8uvmjo2b4JNTOoFOuTn0lKvuD439m4wKNVCfcW
 t1W6vyoUPEklo0q/7fyznM4/wdhCiwOihwIg8d6KcePZTISK45Lwv1dBUr6XcL1nQKUzScgYFcJkzq
 xqOxjOeaZaqd/XDHzVQs5nSVveIHTRgeM68oTVH0EugD7SzXHlOFgPh7rwMvSeZb7sc2O6EBr4iC94
 QpFqj6DuRX6Ah3jmmH+NuWnLgSvaI3x7GU+SaxgG4epU3ur86n//3lGNtLgw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Alexandre Mergnat <amergnat@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-pwm@vger.kernel.org,
 Fabien Parent <fparent@baylibre.com>, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Guillaume La Roque <glaroque@baylibre.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MIPI DSI:
- Add "vsys_lcm_reg" regulator support and setup the "mt6357_vsim1_reg",
to power the pannel plugged to the DSI connector.
- Setup the Display Parallel Interface.
  - Add the startek kd070fhfid015 pannel support.

HDMI:
- Add HDMI connector support.
- Add the "ite,it66121" HDMI bridge support, driven by I2C1.
- Setup the Display Parallel Interface.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 204 ++++++++++++++++++++++++++++
 1 file changed, 204 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
index 30850e7c8155..793f5a9cbeae 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
@@ -26,6 +26,18 @@ chosen {
 		stdout-path = "serial0:921600n8";
 	};
 
+	connector {
+		compatible = "hdmi-connector";
+		label = "hdmi";
+		type = "d";
+
+		port {
+			hdmi_connector_in: endpoint {
+				remote-endpoint = <&hdmi_connector_out>;
+			};
+		};
+	};
+
 	firmware {
 		optee {
 			compatible = "linaro,optee-tz";
@@ -86,6 +98,59 @@ optee_reserved: optee@43200000 {
 			reg = <0 0x43200000 0 0x00c00000>;
 		};
 	};
+
+	vsys_lcm_reg: regulator-vsys-lcm {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpio = <&pio 129 GPIO_ACTIVE_HIGH>;
+		regulator-max-microvolt = <5000000>;
+		regulator-min-microvolt = <5000000>;
+		regulator-name = "vsys_lcm";
+	};
+};
+
+&dpi0 {
+	pinctrl-0 = <&dpi_default_pins>;
+	pinctrl-1 = <&dpi_idle_pins>;
+	pinctrl-names = "default", "sleep";
+	status = "okay";
+
+	port {
+		dpi_out: endpoint {
+			remote-endpoint = <&it66121_in>;
+		};
+	};
+};
+
+
+&dsi0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	panel@0 {
+		compatible = "startek,kd070fhfid015";
+		status = "okay";
+		reg = <0>;
+		dcdc-gpios = <&pio 67 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&pio 20 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&default_panel_pins>;
+		pinctrl-names = "default";
+		iovcc-supply = <&mt6357_vsim1_reg>;
+		power-supply = <&vsys_lcm_reg>;
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&dsi_out>;
+			};
+		};
+	};
+
+	port {
+		dsi_out: endpoint {
+			remote-endpoint = <&panel_in>;
+		};
+	};
 };
 
 &i2c0 {
@@ -97,6 +162,50 @@ &i2c0 {
 	#size-cells = <0>;
 };
 
+&i2c1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	clock-div = <2>;
+	clock-frequency = <100000>;
+	pinctrl-0 = <&i2c1_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	it66121hdmitx: it66121hdmitx@4c {
+		#sound-dai-cells = <0>;
+		compatible = "ite,it66121";
+		interrupt-parent = <&pio>;
+		interrupts = <68 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&ite_pins>;
+		pinctrl-names = "default";
+		reg = <0x4c>;
+		reset-gpios = <&pio 69 GPIO_ACTIVE_LOW>;
+		vcn18-supply = <&mt6357_vsim2_reg>;
+		vcn33-supply = <&mt6357_vibr_reg>;
+		vrf12-supply = <&mt6357_vrf12_reg>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				it66121_in: endpoint {
+					bus-width = <12>;
+					remote-endpoint = <&dpi_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				hdmi_connector_out: endpoint {
+					remote-endpoint = <&hdmi_connector_in>;
+				};
+			};
+		};
+	};
+};
+
 &mmc0 {
 	pinctrl-names = "default", "state_uhs";
 	pinctrl-0 = <&mmc0_default_pins>;
@@ -150,12 +259,60 @@ &mt6357_vmc_reg {
 	regulator-always-on;
 };
 
+&mt6357_vsim1_reg {
+	regulator-min-microvolt = <1800000>;
+	regulator-max-microvolt = <1800000>;
+};
+
 /* Needed by ethernet */
 &mt6357_vsim2_reg {
 	regulator-always-on;
 };
 
 &pio {
+	dpi_default_pins: dpi-default-pins {
+		pins {
+			pinmux = <MT8365_PIN_0_GPIO0__FUNC_DPI_D0>,
+				 <MT8365_PIN_1_GPIO1__FUNC_DPI_D1>,
+				 <MT8365_PIN_2_GPIO2__FUNC_DPI_D2>,
+				 <MT8365_PIN_3_GPIO3__FUNC_DPI_D3>,
+				 <MT8365_PIN_4_GPIO4__FUNC_DPI_D4>,
+				 <MT8365_PIN_5_GPIO5__FUNC_DPI_D5>,
+				 <MT8365_PIN_6_GPIO6__FUNC_DPI_D6>,
+				 <MT8365_PIN_7_GPIO7__FUNC_DPI_D7>,
+				 <MT8365_PIN_8_GPIO8__FUNC_DPI_D8>,
+				 <MT8365_PIN_9_GPIO9__FUNC_DPI_D9>,
+				 <MT8365_PIN_10_GPIO10__FUNC_DPI_D10>,
+				 <MT8365_PIN_11_GPIO11__FUNC_DPI_D11>,
+				 <MT8365_PIN_12_GPIO12__FUNC_DPI_DE>,
+				 <MT8365_PIN_13_GPIO13__FUNC_DPI_VSYNC>,
+				 <MT8365_PIN_14_GPIO14__FUNC_DPI_CK>,
+				 <MT8365_PIN_15_GPIO15__FUNC_DPI_HSYNC>;
+			drive-strength = <MTK_DRIVE_4mA>;
+		};
+	};
+
+	dpi_idle_pins: dpi-idle-pins {
+		pins {
+			pinmux = <MT8365_PIN_0_GPIO0__FUNC_GPIO0>,
+				 <MT8365_PIN_1_GPIO1__FUNC_GPIO1>,
+				 <MT8365_PIN_2_GPIO2__FUNC_GPIO2>,
+				 <MT8365_PIN_3_GPIO3__FUNC_GPIO3>,
+				 <MT8365_PIN_4_GPIO4__FUNC_GPIO4>,
+				 <MT8365_PIN_5_GPIO5__FUNC_GPIO5>,
+				 <MT8365_PIN_6_GPIO6__FUNC_GPIO6>,
+				 <MT8365_PIN_7_GPIO7__FUNC_GPIO7>,
+				 <MT8365_PIN_8_GPIO8__FUNC_GPIO8>,
+				 <MT8365_PIN_9_GPIO9__FUNC_GPIO9>,
+				 <MT8365_PIN_10_GPIO10__FUNC_GPIO10>,
+				 <MT8365_PIN_11_GPIO11__FUNC_GPIO11>,
+				 <MT8365_PIN_12_GPIO12__FUNC_GPIO12>,
+				 <MT8365_PIN_13_GPIO13__FUNC_GPIO13>,
+				 <MT8365_PIN_14_GPIO14__FUNC_GPIO14>,
+				 <MT8365_PIN_15_GPIO15__FUNC_GPIO15>;
+		};
+	};
+
 	gpio_keys: gpio-keys-pins {
 		pins {
 			pinmux = <MT8365_PIN_24_KPCOL0__FUNC_KPCOL0>;
@@ -174,6 +331,36 @@ pins_i2c {
 		};
 	};
 
+	i2c1_pins: i2c1 {
+		pins_i2c {
+			pinmux = <MT8365_PIN_59_SDA1__FUNC_SDA1_0>,
+				 <MT8365_PIN_60_SCL1__FUNC_SCL1_0>;
+			mediatek,pull-up-adv = <3>;
+			mediatek,drive-strength-adv = <00>;
+			bias-pull-up;
+		};
+	};
+
+	ite_pins: ite-pins {
+
+		irq_ite_pins {
+			pinmux = <MT8365_PIN_68_CMDAT0__FUNC_GPIO68>;
+			input-enable;
+			bias-pull-up;
+		};
+
+		pwr_pins {
+			pinmux = <MT8365_PIN_70_CMDAT2__FUNC_GPIO70>,
+				 <MT8365_PIN_71_CMDAT3__FUNC_GPIO71>;
+			output-high;
+		};
+
+		rst_ite_pins {
+			pinmux = <MT8365_PIN_69_CMDAT1__FUNC_GPIO69>;
+			output-high;
+		};
+	};
+
 	mmc0_default_pins: mmc0-default-pins {
 		clk-pins {
 			pinmux = <MT8365_PIN_99_MSDC0_CLK__FUNC_MSDC0_CLK>;
@@ -315,6 +502,23 @@ usb1-vbus-pins {
 		};
 	};
 
+	default_panel_pins: default-panel-pins {
+		dcdc-pins {
+			pinmux = <MT8365_PIN_67_CMPCLK__FUNC_GPIO67>;
+			output-low;
+		};
+
+		en-pins {
+			pinmux = <MT8365_PIN_129_TDM_TX_BCK__FUNC_GPIO129>;
+			output-low;
+		};
+
+		rst-pins {
+			pinmux = <MT8365_PIN_20_LCM_RST__FUNC_GPIO20>;
+			output-high;
+		};
+	};
+
 	pwm_pins: pwm-pins {
 		pins {
 			pinmux = <MT8365_PIN_19_DISP_PWM__FUNC_PWM_A>,

-- 
b4 0.10.1
