Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BFC56FB950
	for <lists+dri-devel@lfdr.de>; Mon,  8 May 2023 23:20:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D4ED10E0BB;
	Mon,  8 May 2023 21:20:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 347C410E15F
 for <dri-devel@lists.freedesktop.org>; Mon,  8 May 2023 21:20:23 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-4f2510b2b98so1522873e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 08 May 2023 14:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683580821; x=1686172821;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=At6naKZm43llnrS+PRA3z4g6G36SPwXH3KoMiA41EGY=;
 b=m6szLoANC/Gtyv38bXCLISYaLnW5vlsF/dJGDbfMjQA8xNRYvh5MhhDwCaj0LQy1C6
 71ivsLE7rytcOReBolVM9eAOhT70qBtAb1ZL4HAzJEZRdYu1Pe/0djLtYDmYdMEGwP1y
 33VqEUAmGw1k4+f5LKYH2INyHez9dk2Z9WqjRZ5ibez1RRdFtl2FFFthRuXwJf7ViLJs
 H4Lf3wX05mfs+UJIR/W9OmcgKULcTjck1WXnyniApteet46egah0HWS0nmYhd25+yOld
 L1KF0fvIyqIKYbWngldm/DevRmdl70i+FeiP/re3c0qeJ0ywRN4p7Ke6DBOewqlmMxgp
 rP3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683580821; x=1686172821;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=At6naKZm43llnrS+PRA3z4g6G36SPwXH3KoMiA41EGY=;
 b=F1/OiWcQavQuGEz9OxB63tProHGZmXm9l1Af/1CSqpmgZvyURfqWBcEmjVRrob6iu8
 QoRnnFez+s8Gkqu9vmvE+NLlaUwoi1VHK9ivjO14AHEuHO5qmpy+CEY/doKqzH5x2KcN
 cDtlP/GNIsXPW8mM4fjL3m5aBPYJlUKeUngMF4JZLMc96p1TIcq/XVTm9qJ+f34oaYOL
 vL04LZTuZlO3IYLwC5/ztr4U4sKJyV/j9Ss8MTfJXpfZ6VpiJhm348Gb68E6S6zjxxvC
 ecFhu4NGwXM3oEF2CjM2ipFBBPrKlv838wvbGiLVnaB3To+QH3fV2iJGVfXDQBJoyfFM
 i0Tg==
X-Gm-Message-State: AC+VfDx/SFeemyjk9WXnbfHdH4Vp/BDi+de+aAbRwgxDPW69yZILWgdb
 AuScfqODeE0PfvfXKybMn9LIPBvQ2xFfsfk46/Y=
X-Google-Smtp-Source: ACHHUZ6f0YxldyYYY+NP6Xi33YaOtWU2TSzAo1gjiwNA0CASbU+E9uch7we8DEeyNupjq53+3SZymw==
X-Received: by 2002:ac2:4102:0:b0:4f1:4cdc:ec03 with SMTP id
 b2-20020ac24102000000b004f14cdcec03mr128495lfi.18.1683580821313; 
 Mon, 08 May 2023 14:20:21 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238]) by smtp.gmail.com with ESMTPSA id
 4-20020ac24844000000b004edc3bd7fa1sm102164lfy.201.2023.05.08.14.20.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 May 2023 14:20:20 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 08 May 2023 23:20:09 +0200
Subject: [PATCH v4 4/4] ARM: dts: Fix erroneous ADS touchscreen polarities
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230430-nokia770-regression-v4-4-9b6dc5536b17@linaro.org>
References: <20230430-nokia770-regression-v4-0-9b6dc5536b17@linaro.org>
In-Reply-To: <20230430-nokia770-regression-v4-0-9b6dc5536b17@linaro.org>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>, 
 Russell King <linux@armlinux.org.uk>, Daniel Mack <daniel@zonque.org>, 
 Haojian Zhuang <haojian.zhuang@gmail.com>, 
 Robert Jarzmik <robert.jarzmik@free.fr>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Mark Brown <broonie@kernel.org>, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Andreas Kemnade <andreas@kemnade.info>, Helge Deller <deller@gmx.de>, 
 Ulf Hansson <ulf.hansson@linaro.org>
X-Mailer: b4 0.12.1
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
Cc: linux-fbdev@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-spi@vger.kernel.org,
 linux-input@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Several device tree files get the polarity of the pendown-gpios
wrong: this signal is active low. Fix up all incorrect flags, so
that operating systems can rely on the flag being correctly set.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog ->v4
- New patch as issue was pointed out by Dmitry. Can be merged
  separately.
---
 arch/arm/boot/dts/am57xx-cl-som-am57x.dts          | 2 +-
 arch/arm/boot/dts/at91sam9261ek.dts                | 2 +-
 arch/arm/boot/dts/imx7d-pico-hobbit.dts            | 2 +-
 arch/arm/boot/dts/imx7d-sdb.dts                    | 2 +-
 arch/arm/boot/dts/omap3-cm-t3x.dtsi                | 2 +-
 arch/arm/boot/dts/omap3-devkit8000-lcd-common.dtsi | 2 +-
 arch/arm/boot/dts/omap3-lilly-a83x.dtsi            | 2 +-
 arch/arm/boot/dts/omap3-overo-common-lcd35.dtsi    | 2 +-
 arch/arm/boot/dts/omap3-overo-common-lcd43.dtsi    | 2 +-
 arch/arm/boot/dts/omap3-pandora-common.dtsi        | 2 +-
 arch/arm/boot/dts/omap5-cm-t54.dts                 | 2 +-
 11 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/arm/boot/dts/am57xx-cl-som-am57x.dts b/arch/arm/boot/dts/am57xx-cl-som-am57x.dts
index 2fc9a5d5e0c0..625b9b311b49 100644
--- a/arch/arm/boot/dts/am57xx-cl-som-am57x.dts
+++ b/arch/arm/boot/dts/am57xx-cl-som-am57x.dts
@@ -527,7 +527,7 @@ touchscreen@1 {
 
 		interrupt-parent = <&gpio1>;
 		interrupts = <31 0>;
-		pendown-gpio = <&gpio1 31 0>;
+		pendown-gpio = <&gpio1 31 GPIO_ACTIVE_LOW>;
 
 
 		ti,x-min = /bits/ 16 <0x0>;
diff --git a/arch/arm/boot/dts/at91sam9261ek.dts b/arch/arm/boot/dts/at91sam9261ek.dts
index 88869ca874d1..045cb253f23a 100644
--- a/arch/arm/boot/dts/at91sam9261ek.dts
+++ b/arch/arm/boot/dts/at91sam9261ek.dts
@@ -156,7 +156,7 @@ tsc2046@2 {
 					compatible = "ti,ads7843";
 					interrupts-extended = <&pioC 2 IRQ_TYPE_EDGE_BOTH>;
 					spi-max-frequency = <3000000>;
-					pendown-gpio = <&pioC 2 GPIO_ACTIVE_HIGH>;
+					pendown-gpio = <&pioC 2 GPIO_ACTIVE_LOW>;
 
 					ti,x-min = /bits/ 16 <150>;
 					ti,x-max = /bits/ 16 <3830>;
diff --git a/arch/arm/boot/dts/imx7d-pico-hobbit.dts b/arch/arm/boot/dts/imx7d-pico-hobbit.dts
index d917dc4f2f22..6ad39dca7009 100644
--- a/arch/arm/boot/dts/imx7d-pico-hobbit.dts
+++ b/arch/arm/boot/dts/imx7d-pico-hobbit.dts
@@ -64,7 +64,7 @@ ads7846@0 {
 		interrupt-parent = <&gpio2>;
 		interrupts = <7 0>;
 		spi-max-frequency = <1000000>;
-		pendown-gpio = <&gpio2 7 0>;
+		pendown-gpio = <&gpio2 7 GPIO_ACTIVE_LOW>;
 		vcc-supply = <&reg_3p3v>;
 		ti,x-min = /bits/ 16 <0>;
 		ti,x-max = /bits/ 16 <4095>;
diff --git a/arch/arm/boot/dts/imx7d-sdb.dts b/arch/arm/boot/dts/imx7d-sdb.dts
index f483bc0afe5e..234e5fc647b2 100644
--- a/arch/arm/boot/dts/imx7d-sdb.dts
+++ b/arch/arm/boot/dts/imx7d-sdb.dts
@@ -205,7 +205,7 @@ tsc2046@0 {
 		pinctrl-0 = <&pinctrl_tsc2046_pendown>;
 		interrupt-parent = <&gpio2>;
 		interrupts = <29 0>;
-		pendown-gpio = <&gpio2 29 GPIO_ACTIVE_HIGH>;
+		pendown-gpio = <&gpio2 29 GPIO_ACTIVE_LOW>;
 		touchscreen-max-pressure = <255>;
 		wakeup-source;
 	};
diff --git a/arch/arm/boot/dts/omap3-cm-t3x.dtsi b/arch/arm/boot/dts/omap3-cm-t3x.dtsi
index e61b8a2bfb7d..51baedf1603b 100644
--- a/arch/arm/boot/dts/omap3-cm-t3x.dtsi
+++ b/arch/arm/boot/dts/omap3-cm-t3x.dtsi
@@ -227,7 +227,7 @@ ads7846@0 {
 
 		interrupt-parent = <&gpio2>;
 		interrupts = <25 0>;		/* gpio_57 */
-		pendown-gpio = <&gpio2 25 GPIO_ACTIVE_HIGH>;
+		pendown-gpio = <&gpio2 25 GPIO_ACTIVE_LOW>;
 
 		ti,x-min = /bits/ 16 <0x0>;
 		ti,x-max = /bits/ 16 <0x0fff>;
diff --git a/arch/arm/boot/dts/omap3-devkit8000-lcd-common.dtsi b/arch/arm/boot/dts/omap3-devkit8000-lcd-common.dtsi
index 3decc2d78a6c..a7f99ae0c1fe 100644
--- a/arch/arm/boot/dts/omap3-devkit8000-lcd-common.dtsi
+++ b/arch/arm/boot/dts/omap3-devkit8000-lcd-common.dtsi
@@ -54,7 +54,7 @@ ads7846@0 {
 
 		interrupt-parent = <&gpio1>;
 		interrupts = <27 0>;		/* gpio_27 */
-		pendown-gpio = <&gpio1 27 GPIO_ACTIVE_HIGH>;
+		pendown-gpio = <&gpio1 27 GPIO_ACTIVE_LOW>;
 
 		ti,x-min = /bits/ 16 <0x0>;
 		ti,x-max = /bits/ 16 <0x0fff>;
diff --git a/arch/arm/boot/dts/omap3-lilly-a83x.dtsi b/arch/arm/boot/dts/omap3-lilly-a83x.dtsi
index c595afe4181d..d310b5c7bac3 100644
--- a/arch/arm/boot/dts/omap3-lilly-a83x.dtsi
+++ b/arch/arm/boot/dts/omap3-lilly-a83x.dtsi
@@ -311,7 +311,7 @@ tsc2046@0 {
 		interrupt-parent = <&gpio1>;
 		interrupts = <8 0>;   /* boot6 / gpio_8 */
 		spi-max-frequency = <1000000>;
-		pendown-gpio = <&gpio1 8 GPIO_ACTIVE_HIGH>;
+		pendown-gpio = <&gpio1 8 GPIO_ACTIVE_LOW>;
 		vcc-supply = <&reg_vcc3>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&tsc2048_pins>;
diff --git a/arch/arm/boot/dts/omap3-overo-common-lcd35.dtsi b/arch/arm/boot/dts/omap3-overo-common-lcd35.dtsi
index 1d6e88f99eb3..c3570acc35fa 100644
--- a/arch/arm/boot/dts/omap3-overo-common-lcd35.dtsi
+++ b/arch/arm/boot/dts/omap3-overo-common-lcd35.dtsi
@@ -149,7 +149,7 @@ ads7846@0 {
 
 		interrupt-parent = <&gpio4>;
 		interrupts = <18 0>;			/* gpio_114 */
-		pendown-gpio = <&gpio4 18 GPIO_ACTIVE_HIGH>;
+		pendown-gpio = <&gpio4 18 GPIO_ACTIVE_LOW>;
 
 		ti,x-min = /bits/ 16 <0x0>;
 		ti,x-max = /bits/ 16 <0x0fff>;
diff --git a/arch/arm/boot/dts/omap3-overo-common-lcd43.dtsi b/arch/arm/boot/dts/omap3-overo-common-lcd43.dtsi
index 7e30f9d45790..d95a0e130058 100644
--- a/arch/arm/boot/dts/omap3-overo-common-lcd43.dtsi
+++ b/arch/arm/boot/dts/omap3-overo-common-lcd43.dtsi
@@ -160,7 +160,7 @@ ads7846@0 {
 
 		interrupt-parent = <&gpio4>;
 		interrupts = <18 0>;			/* gpio_114 */
-		pendown-gpio = <&gpio4 18 GPIO_ACTIVE_HIGH>;
+		pendown-gpio = <&gpio4 18 GPIO_ACTIVE_LOW>;
 
 		ti,x-min = /bits/ 16 <0x0>;
 		ti,x-max = /bits/ 16 <0x0fff>;
diff --git a/arch/arm/boot/dts/omap3-pandora-common.dtsi b/arch/arm/boot/dts/omap3-pandora-common.dtsi
index 559853764487..4c3b6bab179c 100644
--- a/arch/arm/boot/dts/omap3-pandora-common.dtsi
+++ b/arch/arm/boot/dts/omap3-pandora-common.dtsi
@@ -651,7 +651,7 @@ tsc2046@0 {
 		pinctrl-0 = <&penirq_pins>;
 		interrupt-parent = <&gpio3>;
 		interrupts = <30 IRQ_TYPE_NONE>;	/* GPIO_94 */
-		pendown-gpio = <&gpio3 30 GPIO_ACTIVE_HIGH>;
+		pendown-gpio = <&gpio3 30 GPIO_ACTIVE_LOW>;
 		vcc-supply = <&vaux4>;
 
 		ti,x-min = /bits/ 16 <0>;
diff --git a/arch/arm/boot/dts/omap5-cm-t54.dts b/arch/arm/boot/dts/omap5-cm-t54.dts
index 2d87b9fc230e..af288d63a26a 100644
--- a/arch/arm/boot/dts/omap5-cm-t54.dts
+++ b/arch/arm/boot/dts/omap5-cm-t54.dts
@@ -354,7 +354,7 @@ ads7846@0 {
 
 		interrupt-parent = <&gpio1>;
 		interrupts = <15 0>;			/* gpio1_wk15 */
-		pendown-gpio = <&gpio1 15 GPIO_ACTIVE_HIGH>;
+		pendown-gpio = <&gpio1 15 GPIO_ACTIVE_LOW>;
 
 
 		ti,x-min = /bits/ 16 <0x0>;

-- 
2.34.1

