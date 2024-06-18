Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 861DE90DD50
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 22:22:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ACD610E7AF;
	Tue, 18 Jun 2024 20:22:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="N3vuy3Gp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 360EF10E687
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 14:00:42 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-a6f1dc06298so664173766b.1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 07:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718719240; x=1719324040; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=QnGqb9LdUpFo9CK6p9zAXnt5zDSobIuIEOWLz7JLT7A=;
 b=N3vuy3GpAFKDmBISJ7p1Q2f9PxUzeOIj/6ds0ukZdgu0R3Beqa65eIHEhcR79CmhGh
 z3dC7MbrKrdnVApAELtBKjNi68JA7M41X4cw7iV/SmZxsZNdgc49+yMEBacM9gm7g3nr
 rY7Mecn2bx3qP40iP/AD4blPYsQATQH4rqStzXaSfZX8g1nU7SVL+VIUnra5uHI/LFrK
 FneqiD6oYdc3w55N0MFtss763HKPy67rElqgk60gYImWzjnOb8GDA0WaOLNHi4rHuhPu
 X9xV2Uf6ccZpEtteCQg/RLzIT3wZVXmZDyHslNGyhsOsff8ho/YdM8byEpptZ73/SA3i
 /8vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718719240; x=1719324040;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QnGqb9LdUpFo9CK6p9zAXnt5zDSobIuIEOWLz7JLT7A=;
 b=aJ5SCSoafQZrSYQY5G1OcDlVwIjSD8FXvFStM3NC/J7gZzV1DM4doVxBVgk+z1ioxD
 aZnjEIthWCBq6GVIDNylMJ9/ckBa1IM5aLTYq9jK4kk+wdX0z88X5fkx3/jiNzqnasRG
 FzKOnSB5AsPm++RKOimZUYLhO4LQmd14aRWz5B9IOEPLCqDQMtTElqgeE7MaXvNLKsE0
 5cjgWSLVqutgC0jGIjU7swlIY+sfWBLDMrr3qxkQ4ToBg+Wsje8tQETKUMWG62uypLcA
 TfVM0ACpcV8EEkXWxgy1kc91mI0Q9w2kHeyrsQkUfpq6sG9DiOzNm6LascpUMtAStmjp
 vsqQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWIbO9oIKYGwl2oiA5UNiRhBVoEnknb9Rt9iDUmy5FbRkQdb8bRrEDPd3okHJHlPzcvefzkYjSP51qWqEWrtUIeaRtMqRUq+1/lmbdMIgHA
X-Gm-Message-State: AOJu0Yzop5c5+nBkSHWVK+DfEYnXBPs+y5uku29fnBwnfLeWZ3Pqhajp
 YxruDPYMc1vQWfAQfrUQht+KkXl0akSKHBBL/BxDpcQ/rjUj4alsN9ukcQ==
X-Google-Smtp-Source: AGHT+IGPPiSPuLy3CAfkI5tf48nr72YmeYQ5pug2vxNgFfhWd7s15QYH+/yq15N13UcYtqPTSjDbdw==
X-Received: by 2002:a17:906:fa92:b0:a6f:15c9:9aa3 with SMTP id
 a640c23a62f3a-a6f60de1b3bmr859682766b.67.1718719239981; 
 Tue, 18 Jun 2024 07:00:39 -0700 (PDT)
Received: from [127.0.1.1] (mm-167-232-122-178.mgts.dynamic.pppoe.byfly.by.
 [178.122.232.167]) by smtp.googlemail.com with ESMTPSA id
 4fb4d7f45d1cf-57cb72da156sm7731278a12.22.2024.06.18.07.00.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jun 2024 07:00:39 -0700 (PDT)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Tue, 18 Jun 2024 16:59:57 +0300
Subject: [PATCH v3 23/23] arm64: dts: qcom: starqltechn: add new features
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240618-starqltechn_integration_upstream-v3-23-e3f6662017ac@gmail.com>
References: <20240618-starqltechn_integration_upstream-v3-0-e3f6662017ac@gmail.com>
In-Reply-To: <20240618-starqltechn_integration_upstream-v3-0-e3f6662017ac@gmail.com>
To: Sebastian Reichel <sre@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Pavel Machek <pavel@ucw.cz>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Chanwoo Choi <cw00.choi@samsung.com>, phone-devel@vger.kernel.org
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-leds@vger.kernel.org, 
 linux-pwm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 Dzmitry Sankouski <dsankouski@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718719185; l=14368;
 i=dsankouski@gmail.com; s=20240618; h=from:subject:message-id;
 bh=ZW5/h6ouVrrBXLRGXUEoLufARTLrpkHg1IiP7Xktm9k=;
 b=U7LweIymrYPIlyG7gXxJdMjzBRSF9CyuuijIHSfWGI1INzjWG3kWUggSD713gpauIFc9HFIJM
 6Vq2DvNHAp8CkSNIR6sq7/le6ye4aYaxRLQkXGrquoTHhCMCM0ZuPpm
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=6pMMVVDDReSiRgPCbMOUauN5nS3ty4Sf5b7a2gi4x0M=
X-Mailman-Approved-At: Tue, 18 Jun 2024 20:22:03 +0000
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

Add support for new features:
- sound (headphones and mics only)
- gpu
- panel
- buttons
- MAX77705 MFD:
   - charger
   - fuelgauge
   - haptic
   - led

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
 .../boot/dts/qcom/sdm845-samsung-starqltechn.dts   | 593 ++++++++++++++++++++-
 1 file changed, 592 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
index bad154b1e894..28a5210e22fb 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
@@ -7,15 +7,40 @@
 
 /dts-v1/;
 
+#include <dt-bindings/input/linux-event-codes.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include <dt-bindings/sound/qcom,q6afe.h>
+#include <dt-bindings/sound/qcom,q6asm.h>
+
 #include "sdm845.dtsi"
+#include "pm8998.dtsi"
+#include "sdm845-wcd9340.dtsi"
+
+/delete-node/ &rmtfs_mem;
+/delete-node/ &adsp_mem;
+/delete-node/ &slpi_mem;
+/delete-node/ &spss_mem;
 
 / {
 	chassis-type = "handset";
 	model = "Samsung Galaxy S9 SM-G9600";
 	compatible = "samsung,starqltechn", "qcom,sdm845";
 
+	aliases {
+		serial0 = &uart9;
+	};
+
+	battery: battery {
+		compatible = "simple-battery";
+		constant-charge-current-max-microamp = <2150000>;
+		charge-full-design-microamp-hours = <3000000>;
+
+		over-voltage-threshold-microvolt = <4500000>;
+		voltage-min-design-microvolt = <3400000>;
+		voltage-max-design-microvolt = <4350000>;
+	};
+
 	chosen {
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -59,9 +84,199 @@ memory@a1300000 {
 			ftrace-size = <0x40000>;
 			pmsg-size = <0x40000>;
 		};
+
+		/* The rmtfs_mem needs to be guarded due to "XPU limitations"
+		 * it is otherwise possible for an allocation adjacent to the
+		 * rmtfs_mem region to trigger an XPU violation, causing a crash.
+		 */
+		rmtfs_lower_guard: memory@fde00000 {
+			no-map;
+			reg = <0 0xfde00000 0 0x1000>;
+		};
+
+		rmtfs_mem: rmtfs-mem@fde01000 {
+			compatible = "qcom,rmtfs-mem";
+			reg = <0 0xfde01000 0 0x200000>;
+			no-map;
+
+			qcom,client-id = <1>;
+			qcom,vmid = <15>;
+		};
+
+		rmtfs_upper_guard: rmtfs-upper-guard@fe001000 {
+			no-map;
+			reg = <0 0xfe001000 0 0x1000>;
+		};
+
+		/*
+		 * It seems like reserving the old rmtfs_mem region is also needed to prevent
+		 * random crashes which are most likely modem related, more testing needed.
+		 */
+		removed_region: removed-region@88f00000 {
+			no-map;
+			reg = <0 0x88f00000 0 0x1c00000>;
+		};
+
+		slpi_mem: slpi@96700000 {
+			reg = <0 0x96700000 0 0xf00000>;
+			no-map;
+		};
+
+		spss_mem: spss@97700000 {
+			reg = <0 0x97700000 0 0x100000>;
+			no-map;
+		};
+
+		adsp_mem: memory@97800000 {
+			reg = <0 0x97800000 0 0x2000000>;
+			no-map;
+		};
+	};
+
+	gpio_keys {
+		compatible = "gpio-keys";
+		autorepeat;
+
+		key-vol-up {
+			label = "volume_up";
+			gpios = <&pm8998_gpios 6 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEUP>;
+			debounce-interval = <15>;
+		};
+
+		key-wink {
+			label = "key_wink";
+			gpios = <&pm8998_gpios 19 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_ENTER>;
+			debounce-interval = <15>;
+		};
+	};
+
+	i2c21 {
+		compatible = "i2c-gpio";
+		sda-gpios = <&tlmm 127 GPIO_ACTIVE_HIGH>;
+		scl-gpios = <&tlmm 128 GPIO_ACTIVE_HIGH>;
+		i2c-gpio,delay-us = <2>;
+		pinctrl-0 = <&i2c21_sda_state &i2c21_scl_state>;
+		pinctrl-names = "default";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pmic@60 {
+			compatible = "samsung,s2dos05-pmic";
+			reg = <0x60>;
+
+			regulators {
+				s2dos05_ldo1: ldo1 {
+					regulator-name = "s2dos05-ldo1";
+					regulator-min-microvolt = <1500000>;
+					regulator-max-microvolt = <2000000>;
+					regulator-active-discharge = <1>;
+				};
+
+				s2dos05_ldo2: ldo2 {
+					regulator-name = "s2dos05-ldo2";
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <1800000>;
+					regulator-active-discharge = <1>;
+					regulator-boot-on;
+				};
+
+				s2dos05_ldo3: ldo3 {
+					regulator-name = "s2dos05-ldo3";
+					regulator-min-microvolt = <3000000>;
+					regulator-max-microvolt = <3000000>;
+					regulator-active-discharge = <1>;
+					regulator-boot-on;
+				};
+
+				s2dos05_ldo4: ldo4 {
+					regulator-name = "s2dos05-ldo4";
+					regulator-min-microvolt = <2700000>;
+					regulator-max-microvolt = <3775000>;
+					regulator-active-discharge = <1>;
+				};
+
+				s2dos05_buck1: buck1 {
+					regulator-name = "s2dos05-buck1";
+					regulator-min-microvolt = <850000>;
+					regulator-max-microvolt = <2100000>;
+					regulator-active-discharge = <1>;
+				};
+			};
+		};
+	};
+
+	vib_regulator: gpio-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "haptic";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-boot-on;
+		enable-active-high;
+		gpio = <&pm8998_gpios 18 GPIO_ACTIVE_HIGH>;
+	};
+
+	vib_pwm: pwm {
+		#pwm-cells = <2>;
+		compatible = "clk-pwm";
+		clocks = <&gcc GCC_GP1_CLK>;
+		pinctrl-0 = <&motor_pwm_default_state>;
+		pinctrl-1 = <&motor_pwm_suspend_state>;
+		pinctrl-names = "default", "suspend";
+	};
+};
+
+&gmu {
+	status = "okay";
+};
+
+&gpu {
+	status = "okay";
+
+	zap-shader {
+		memory-region = <&gpu_mem>;
+		firmware-name = "qcom/sdm845/starqltechn/a630_zap.mbn";
+	};
+};
+
+&mdss {
+	status = "okay";
+};
+
+&mdss_dsi0 {
+	vdda-supply = <&vreg_l26a_1p2>;
+	status = "okay";
+
+	panel@0 {
+		compatible = "samsung,s6e3ha8";
+		reg = <0>;
+		vci-supply = <&s2dos05_ldo4>;
+		vddr-supply = <&s2dos05_buck1>;
+		vdd3-supply = <&s2dos05_ldo1>;
+		te-gpios = <&tlmm 10 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&tlmm 6 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&sde_dsi_default &sde_te>;
+		pinctrl-1 = <&sde_dsi_suspend &sde_te>;
+		pinctrl-names = "default", "suspend";
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&mdss_dsi0_out>;
+			};
+		};
 	};
 };
 
+&mdss_dsi0_out {
+	data-lanes = <0 1 2 3>;
+	remote-endpoint = <&panel_in>;
+};
+
+&mdss_dsi0_phy {
+	vdds-supply = <&vdda_mipi_dsi0_pll>;
+	status = "okay";
+};
 
 &apps_rsc {
 	regulators-0 {
@@ -355,10 +570,72 @@ &qupv3_id_1 {
 	status = "okay";
 };
 
+&gpi_dma0 {
+	status = "okay";
+};
+
+&gpi_dma1 {
+	status = "okay";
+};
+
 &uart9 {
 	status = "okay";
 };
 
+&i2c14 {
+	status = "okay";
+
+	pmic@66 {
+		compatible = "maxim,max77705";
+		reg = <0x66>;
+		interrupt-parent = <&pm8998_gpios>;
+		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-names = "max77705_irq";
+		pinctrl-0 = <&chg_int_default>;
+		pinctrl-names = "default";
+
+		leds {
+			compatible = "maxim,max77705-led";
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			led@1 {
+				reg = <1>;
+				label = "red:usr1";
+			};
+
+			led@2 {
+				reg = <2>;
+				label = "green:usr2";
+			};
+
+			led@3 {
+				reg = <3>;
+				label = "blue:usr3";
+			};
+		};
+
+		max77705_charger: charger {
+			compatible = "maxim,max77705-charger";
+			monitored-battery = <&battery>;
+		};
+
+		fuelgauge {
+			compatible = "maxim,max77705-fg";
+			monitored-battery = <&battery>;
+			power-supplies = <&max77705_charger>;
+			rsense = <5>;
+		};
+
+
+		haptic {
+			compatible = "maxim,max77705-haptic";
+			haptic-supply = <&vib_regulator>;
+			pwms = <&vib_pwm 0 50000>;
+		};
+	};
+};
+
 &ufs_mem_hc {
 	reset-gpios = <&tlmm 150 GPIO_ACTIVE_LOW>;
 	vcc-supply = <&vreg_l20a_2p95>;
@@ -373,14 +650,241 @@ &ufs_mem_phy {
 };
 
 &sdhc_2 {
-	pinctrl-names = "default";
 	pinctrl-0 = <&sdc2_clk_state &sdc2_cmd_state &sdc2_data_state &sd_card_det_n_state>;
+	pinctrl-names = "default";
 	cd-gpios = <&tlmm 126 GPIO_ACTIVE_LOW>;
 	vmmc-supply = <&vreg_l21a_2p95>;
 	vqmmc-supply = <&vddpx_2>;
 	status = "okay";
 };
 
+&i2c11 {
+	clock-frequency = <400000>;
+	status = "okay";
+
+	touchscreen@48 {
+		compatible = "samsung,s6sy761";
+		reg = <0x48>;
+		interrupt-parent = <&tlmm>;
+		interrupts = <120 IRQ_TYPE_LEVEL_HIGH>;
+		vdd-supply = <&s2dos05_ldo2>;
+		avdd-supply = <&s2dos05_ldo3>;
+
+		pinctrl-0 = <&touch_irq_state>;
+		pinctrl-names = "default";
+	};
+};
+
+&adsp_pas {
+	firmware-name = "qcom/sdm845/starqltechn/adsp.mbn";
+	status = "okay";
+};
+
+&lpasscc {
+	status = "okay";
+};
+
+&wcd9340 {
+	reset-gpios = <&tlmm 64 GPIO_ACTIVE_HIGH>;
+	vdd-buck-supply = <&vreg_s4a_1p8>;
+	vdd-buck-sido-supply = <&vreg_s4a_1p8>;
+	vdd-tx-supply = <&vreg_s4a_1p8>;
+	vdd-rx-supply = <&vreg_s4a_1p8>;
+	vdd-io-supply = <&vreg_s4a_1p8>;
+	qcom,micbias1-microvolt = <1800000>;
+	qcom,micbias2-microvolt = <2700000>;
+	qcom,micbias3-microvolt = <1800000>;
+	qcom,micbias4-microvolt = <1800000>;
+};
+
+&sound {
+	compatible = "qcom,sdm845-sndcard";
+	model = "Samsung Galaxy S9";
+	pinctrl-0 = <&quat_mi2s_active &quat_mi2s_sd0_active &quat_mi2s_sd1_active>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	audio-routing =	"RX_BIAS", "MCLK",
+			"AMIC2", "MIC BIAS2", /* Headset Mic */
+			"AMIC3", "MIC BIAS2", /* FMLeft Tx */
+			"AMIC4", "MIC BIAS2", /* FMRight Tx */
+			"DMIC0", "MIC BIAS1", /* Digital Mic0 */
+			"DMIC5", "MIC BIAS4", /* Digital Mic1 */
+			"DMIC4", "MIC BIAS4", /* Digital Mic2 */
+			"DMIC3", "MIC BIAS3", /* Digital Mic3 */
+			"DMIC2", "MIC BIAS3", /* Digital Mic4 */
+			"DMIC1", "MIC BIAS1"; /* Digital Mic5 */
+
+	mm1-dai-link {
+		link-name = "MultiMedia1";
+		cpu {
+			sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA1>;
+		};
+	};
+
+	mm2-dai-link {
+		link-name = "MultiMedia2";
+		cpu {
+			sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA2>;
+		};
+	};
+
+	mm3-dai-link {
+		link-name = "MultiMedia3";
+		cpu {
+			sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA3>;
+		};
+	};
+
+	mm4-dai-link {
+		link-name = "MultiMedia4";
+		cpu {
+			sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA4>;
+		};
+	};
+
+	mm5-dai-link {
+		link-name = "MultiMedia5";
+		cpu {
+			sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA5>;
+		};
+	};
+
+	mm6-dai-link {
+		link-name = "MultiMedia6";
+		cpu {
+			sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA6>;
+		};
+	};
+
+	slim-dai-link {
+		link-name = "SLIM Playback 1";
+		cpu {
+			sound-dai = <&q6afedai SLIMBUS_0_RX>;
+		};
+
+		platform {
+			sound-dai = <&q6routing>;
+		};
+
+		codec {
+			sound-dai = <&wcd9340 0>;
+		};
+	};
+
+	slimcap-dai-link {
+		link-name = "SLIM Capture 1";
+		cpu {
+			sound-dai = <&q6afedai SLIMBUS_0_TX>;
+		};
+
+		platform {
+			sound-dai = <&q6routing>;
+		};
+
+		codec {
+			sound-dai = <&wcd9340 1>;
+		};
+	};
+
+	slim2-dai-link {
+		link-name = "SLIM Playback 2";
+		cpu {
+			sound-dai = <&q6afedai SLIMBUS_1_RX>;
+		};
+
+		platform {
+			sound-dai = <&q6routing>;
+		};
+
+		codec {
+			sound-dai = <&wcd9340 2>; /* AIF2_PB */
+		};
+	};
+
+	slimcap2-dai-link {
+		link-name = "SLIM Capture 2";
+		cpu {
+			sound-dai = <&q6afedai SLIMBUS_1_TX>;
+		};
+
+		platform {
+			sound-dai = <&q6routing>;
+		};
+
+		codec {
+			sound-dai = <&wcd9340 3>; /* AIF2_CAP */
+		};
+	};
+
+	slimcap3-dai-link {
+		link-name = "SLIM Capture 3";
+		cpu {
+			sound-dai = <&q6afedai SLIMBUS_2_TX>;
+		};
+
+		platform {
+			sound-dai = <&q6routing>;
+		};
+
+		codec {
+			sound-dai = <&wcd9340 5>; /* AIF3_CAP */
+		};
+	};
+};
+
+&q6afedai {
+	dai@22 {
+		reg = <22>;
+		qcom,sd-lines = <1>;
+	};
+
+	dai@23 {
+		reg = <23>;
+		qcom,sd-lines = <0>;
+	};
+};
+
+&q6asmdai {
+	dai@0 {
+		reg = <0>;
+	};
+
+	dai@1 {
+		reg = <1>;
+	};
+
+	dai@2 {
+		reg = <2>;
+	};
+
+	dai@3 {
+		reg = <3>;
+	};
+
+	dai@4 {
+		reg = <4>;
+	};
+
+	dai@5 {
+		reg = <5>;
+	};
+};
+
+/* Modem/wifi */
+&mss_pil {
+	firmware-name = "qcom/sdm845/starqltechn/mba.mbn",
+			"qcom/sdm845/starqltechn/modem.mbn";
+	status = "okay";
+};
+
+&ipa {
+	qcom,gsi-loader = "self";
+	memory-region = <&ipa_fw_mem>;
+	firmware-name = "qcom/sdm845/starqltechn/ipa_fws.mbn";
+	status = "okay";
+};
+
 &usb_1 {
 	status = "okay";
 };
@@ -408,9 +912,45 @@ &usb_1_qmpphy {
 	status = "okay";
 };
 
+&pm8998_resin {
+	linux,code = <KEY_VOLUMEDOWN>;
+	status = "okay";
+};
+
+&pm8998_gpios {
+	chg_int_default: chg-int-default-state {
+		pins = "gpio11";
+		function = "normal";
+		input-enable;
+		bias-disable;
+		power-source = <0>;
+	};
+};
+
 &tlmm {
 	gpio-reserved-ranges = <0 4>, <27 4>, <81 4>, <85 4>;
 
+	sde_dsi_default: sde-dsi-default-state {
+		pins = "gpio6";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	sde_dsi_suspend: sde-dsi-suspend-state {
+		pins = "gpio6";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	sde_te: sde-te-state {
+		pins = "gpio10";
+		function = "mdp_vsync";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
 	sdc2_clk_state: sdc2-clk-state {
 		pins = "sdc2_clk";
 		bias-disable;
@@ -439,4 +979,55 @@ sd_card_det_n_state: sd-card-det-n-state {
 		function = "gpio";
 		bias-pull-up;
 	};
+
+	motor_pwm_default_state: motor-pwm-active-state {
+		pins = "gpio57";
+		function = "gcc_gp1";
+		drive-strength = <2>;
+		bias-disable;
+		output-high;
+	};
+
+	motor_pwm_suspend_state: motor-pwm-suspend-state {
+		pins = "gpio57";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+		output-low;
+	};
+
+	i2c21_sda_state: i2c21-sda-state {
+		pins = "gpio127";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	i2c21_scl_state: i2c21-scl-state {
+		pins = "gpio128";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	touch_irq_state: touch-irq-state {
+		pins = "gpio120";
+		function = "gpio";
+		bias-disable;
+	};
+};
+
+&qup_uart9_tx {
+	drive-strength = <2>;
+	bias-pull-up;
+};
+
+&qup_uart9_rx {
+	drive-strength = <2>;
+	bias-pull-up;
+};
+
+&qup_i2c11_default {
+	drive-strength = <2>;
+	bias-disable;
 };

-- 
2.39.2

