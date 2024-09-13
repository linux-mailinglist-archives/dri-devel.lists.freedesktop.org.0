Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD798978381
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 17:09:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B2FF10ED35;
	Fri, 13 Sep 2024 15:09:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WGrLziFA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D51B10ED35
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 15:09:19 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-5c412cfc53eso2244377a12.2
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 08:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726240157; x=1726844957; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=CfgwI6EyZw2/O0lD30k5AoCMwqQKhtZSyo8NYOTmFvs=;
 b=WGrLziFAwtVe9q4Me/iS1Z2zAuj4pmKV2gsZwC3JvYmVbagVbkH7DHeIVc5UsZ9H8f
 Bt7xo2vRN48alE2bA+6Xhr4bhOPHtEor9VaqdTb9hegzBRqjpq0J/NlStt297rpzAH6X
 xGbW9uJXvgl3xuGAqVYFkDHnv51Eu8neZX+TX28qeEhpjvdWJfsBMLl3slJIkrmQrLrH
 XH/RRsfVc70XMRpGrEkLvgfvOMuaVoeNEu0TZbXydlIgoki8vdsePWNJr9W/XJq7DGGz
 1vHGWSuB4rvgRbLm2yxNs1J4xVfHN53wbtZHIq+e6SfutrRztQKeFwi1ifL/gi1LB6mS
 LUzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726240157; x=1726844957;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CfgwI6EyZw2/O0lD30k5AoCMwqQKhtZSyo8NYOTmFvs=;
 b=OuwlDVwM2IH4u3XU9czaUwwdv5CXPF22FjxUP3mPk7ueKw9n9cnCdI+OIKImDyajdk
 TSdvqLAf+5/Yrr3GWqpqoakjtJTCIT0kowBn9/p4T9A2FS5HqPE4PUybpsNjGwUipdzE
 sSr48XIy45dMlTBkWAM4B5DkU6ydfUZyB+NfoCsnJfZZ0WMsrnvnl/5VMN/dlXANFXkG
 WS8K2rJ4/R7YFU1JGwOza1yxmFp0D/H5JxPE09wbCMRUIh5GPylZdlD7ejc/7kX/SJ0E
 lYyl7cYwMkVVfNRbTTeSHvADJQPYjJ7V+raGnoBbVQjTLLh85XBhlKaFHOFAIGw//t4J
 d3qg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVx65zEh6K3A1B6Yfd4OF9LSTGehaJygjfAF6/qt5HA00w3NbHLqs1aUb5/E4Hr1b4BTZHEHF46CD4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxwU2baUODzcDWKiTyJ0L0EmDHS4TFjBYDexGhHgoPGs0zQtRzI
 2Rqj79t9Msw22igHAt9FF8crl9/Prm/8GLtyK8wZWKspz0un0+rQ
X-Google-Smtp-Source: AGHT+IF0OxyUbB6FJHD8McDF5ty7a7zew0Jhoux110abjXEGOrNTZK7ycGjZ7jao9Xga6RTaqep0tQ==
X-Received: by 2002:a05:6402:2550:b0:5c2:4cbe:ac1c with SMTP id
 4fb4d7f45d1cf-5c413e08a4emr5599000a12.4.1726240157337; 
 Fri, 13 Sep 2024 08:09:17 -0700 (PDT)
Received: from [127.0.1.1] ([178.127.153.210])
 by smtp.googlemail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3ebd523b4sm7774318a12.51.2024.09.13.08.09.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Sep 2024 08:09:16 -0700 (PDT)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Fri, 13 Sep 2024 18:08:06 +0300
Subject: [PATCH v4 23/27] arm64: dts: qcom: starqltechn: add display PMIC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240913-starqltechn_integration_upstream-v4-23-2d2efd5c5877@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726240085; l=3073;
 i=dsankouski@gmail.com; s=20240618; h=from:subject:message-id;
 bh=B0sd1Gx57GIbQM0BZaCzYGyV/pp35NQhF6ldvlao3X0=;
 b=Afsvb9SybbZRXgS6pDW1Msrxj27/iqXUOQG+exL3XbRxXnVQd9hzOq6RbxjDrDtamcCt/cUDO
 cRXRD3I/PhVDmHOUmC0zcsYIToSuyUPXJIhU8yCC40fmyCw1aPWByVY
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

Add support for s2dos05 display / touchscreen PMIC

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
 .../boot/dts/qcom/sdm845-samsung-starqltechn.dts   | 77 ++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
index 865253d8f0c7..5e5684f84ffb 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
@@ -39,6 +39,9 @@ framebuffer: framebuffer@9d400000 {
 			height = <2960>;
 			stride = <(1440 * 4)>;
 			format = "a8r8g8b8";
+			vci-supply = <&s2dos05_ldo4>;
+			vddr-supply = <&s2dos05_buck1>;
+			vdd3-supply = <&s2dos05_ldo1>;
 		};
 	};
 
@@ -101,6 +104,66 @@ key-wink {
 		};
 	};
 
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
+			compatible = "samsung,s2dos05";
+			reg = <0x60>;
+
+			regulators {
+				s2dos05_ldo1: ldo1 {
+					regulator-active-discharge = <1>;
+					regulator-enable-ramp-delay = <12000>;
+					regulator-min-microvolt = <1500000>;
+					regulator-max-microvolt = <2000000>;
+					regulator-name = "s2dos05-ldo1";
+				};
+
+				s2dos05_ldo2: ldo2 {
+					regulator-active-discharge = <1>;
+					regulator-boot-on;
+					regulator-enable-ramp-delay = <12000>;
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <1800000>;
+					regulator-name = "s2dos05-ldo2";
+				};
+
+				s2dos05_ldo3: ldo3 {
+					regulator-active-discharge = <1>;
+					regulator-boot-on;
+					regulator-enable-ramp-delay = <12000>;
+					regulator-min-microvolt = <3000000>;
+					regulator-max-microvolt = <3000000>;
+					regulator-name = "s2dos05-ldo3";
+				};
+
+				s2dos05_ldo4: ldo4 {
+					regulator-active-discharge = <1>;
+					regulator-enable-ramp-delay = <12000>;
+					regulator-min-microvolt = <2700000>;
+					regulator-max-microvolt = <3775000>;
+					regulator-name = "s2dos05-ldo4";
+				};
+
+				s2dos05_buck1: buck1 {
+					regulator-active-discharge = <1>;
+					regulator-enable-ramp-delay = <12000>;
+					regulator-min-microvolt = <850000>;
+					regulator-max-microvolt = <2100000>;
+					regulator-name = "s2dos05-buck1";
+				};
+			};
+		};
+	};
+
 	vib_regulator: gpio-regulator {
 		compatible = "regulator-fixed";
 		regulator-name = "haptic";
@@ -588,4 +651,18 @@ motor_pwm_suspend_state: motor-pwm-suspend-state {
 		bias-disable;
 		output-low;
 	};
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
 };

-- 
2.39.2

