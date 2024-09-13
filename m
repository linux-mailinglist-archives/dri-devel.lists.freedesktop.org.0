Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE580978380
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 17:09:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D820610ED36;
	Fri, 13 Sep 2024 15:09:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PrOOib8J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3DD510ED36
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 15:09:16 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-a8a706236bfso53285166b.0
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 08:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726240155; x=1726844955; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=WJ726FEj57/R1QW6ACfpQvWc4FsY/5U5BsMP7VDxoEk=;
 b=PrOOib8JdQjQE3E68Zfkyh4rKvlUyFUQPNL/e/hnC7+xDX7Lw7NAINTm03iXZHN5kT
 Y/wqEo31RR89q1/8LvNCsHC/MgPzdUK87T5P2xbsC9IGXuH4b3pzQl59qYLQO6L5ZZyl
 /DdvpSSmTOKOgaXBJvM0kmPQsylJxSGh6IieQCzhSIRwGpNmaWILN18oakiPL0WYqJba
 yPwcWS50RZ6h4iZ9q368bRwZsMsG8PWEeZbtVEPdciQ9/fN5aotvuNQAUabTHkkh5MTw
 WkJL9XjwKcYJE/87EcgURHQnIxCpYFVJK2aSHPzNRMbxKTzaDvXxv27NtkNb1x6+jErJ
 EQ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726240155; x=1726844955;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WJ726FEj57/R1QW6ACfpQvWc4FsY/5U5BsMP7VDxoEk=;
 b=k81T+/zGkM7I0HnYoheBn6olWLmbftmhLo+CvQaJw/tjyDnrtlCGthiZFBbqup/BFi
 nZN4Xe9CdF9lKPs37KngFDUZGZrvQLyvuNajprKIAB+I6yxh6GbBygg+8lFqPaDYHcer
 4bR+zkzliaslpBRq6hfZsHepabkH+GybJhgZA17nZ6B2pIAgqWxtYwJrAvTTSX3CwE/G
 pWgcIHN47w+GmZtTL7/5o/gznTRT5i2KilVGeaW9sUu5z7qZRLOzOzAedZajwPh5qJ8y
 a/0m61fHIsoQ+uru6BP93J53gLL8R5U5XdeczrG6vbFsEEL6tVOO7a5ykz7y/zOOV9Oz
 fAGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqpDp3TzQwJoAWKuOa7G4rdkRuB/3cOmVVXEH+wCtwn/acutuz33XDaJfcuaD35UAaoltAZrdImZ0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy7C8DKFQKXG37XxJC8lCqFTkC9K5XOJejMDZnUzPh73E3uGVNt
 Td19IVmFBzqf/MP9xtgc8jzkdziSK/LXyPIa72p9zR/sRsXj/oV6
X-Google-Smtp-Source: AGHT+IGbWJlyYcTF+ffZxNKKAxILQEsgpMR15i+Fbqpth5IfaRpW0PZ4FN23j11Gq0H5O8f6BLvrqQ==
X-Received: by 2002:a05:6402:1eca:b0:5c3:cb56:e67b with SMTP id
 4fb4d7f45d1cf-5c41e2af60dmr2838183a12.35.1726240154887; 
 Fri, 13 Sep 2024 08:09:14 -0700 (PDT)
Received: from [127.0.1.1] ([178.127.153.210])
 by smtp.googlemail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3ebd523b4sm7774318a12.51.2024.09.13.08.09.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Sep 2024 08:09:13 -0700 (PDT)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Fri, 13 Sep 2024 18:08:05 +0300
Subject: [PATCH v4 22/27] arm64: dts: qcom: starqltechn: add max77705 PMIC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240913-starqltechn_integration_upstream-v4-22-2d2efd5c5877@gmail.com>
References: <20240913-starqltechn_integration_upstream-v4-0-2d2efd5c5877@gmail.com>
In-Reply-To: <20240913-starqltechn_integration_upstream-v4-0-2d2efd5c5877@gmail.com>
To: Sebastian Reichel <sre@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Pavel Machek <pavel@ucw.cz>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, 
 Simona Vetter <simona@ffwll.ch>, cros-qcom-dts-watchers@chromium.org, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Simona Vetter <simona.vetter@ffwll.ch>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-leds@vger.kernel.org, 
 linux-pwm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 Dzmitry Sankouski <dsankouski@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726240085; l=3533;
 i=dsankouski@gmail.com; s=20240618; h=from:subject:message-id;
 bh=p7eZaA4h3yztijkM8JFf5ob4Unk9CxIwdqtw+LwA+HA=;
 b=sdmst4ZjHx4WBMFwaH5sYpxzuUlyQwoYFynueV8VOADBU6Zor6CgrUGWRItdc5ujNdlCYmr7X
 +kp8+qPKBdtCSdNIMrP9DZgeC0rtTreg0KpBQi5EMFj6+FzaKsokgP1
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=6pMMVVDDReSiRgPCbMOUauN5nS3ty4Sf5b7a2gi4x0M=
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

Add support for max77705 MFD device. Supported sub-devices:
 charger, fuelgauge, haptic, led

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
 .../boot/dts/qcom/sdm845-samsung-starqltechn.dts   | 103 +++++++++++++++++++++
 1 file changed, 103 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
index a3bd5231569d..865253d8f0c7 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
@@ -18,6 +18,16 @@ / {
 	model = "Samsung Galaxy S9 SM-G9600";
 	compatible = "samsung,starqltechn", "qcom,sdm845";
 
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
@@ -90,6 +100,27 @@ key-wink {
 			debounce-interval = <15>;
 		};
 	};
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
+		assigned-clock-parents = <&rpmhcc RPMH_CXO_CLK>;
+		assigned-clocks = <&gcc GCC_GP1_CLK_SRC>;
+		pinctrl-0 = <&motor_pwm_default_state>;
+		pinctrl-1 = <&motor_pwm_suspend_state>;
+		pinctrl-names = "default", "suspend";
+	};
 };
 
 
@@ -385,10 +416,66 @@ &qupv3_id_1 {
 	status = "okay";
 };
 
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
+		fuel_gauge {
+			compatible = "maxim,max77705-fuel-gauge";
+			monitored-battery = <&battery>;
+			power-supplies = <&max77705_charger>;
+			shunt-resistor-micro-ohms = <5000>;
+		};
+
+		haptic {
+			compatible = "maxim,max77705-haptic";
+			haptic-supply = <&vib_regulator>;
+			pwms = <&vib_pwm 0 100000>;
+		};
+	};
+};
+
 &ufs_mem_hc {
 	reset-gpios = <&tlmm 150 GPIO_ACTIVE_LOW>;
 	vcc-supply = <&vreg_l20a_2p95>;
@@ -485,4 +572,20 @@ sd_card_det_n_state: sd-card-det-n-state {
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
 };

-- 
2.39.2

