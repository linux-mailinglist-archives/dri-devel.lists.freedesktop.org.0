Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D357154AA97
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jun 2022 09:30:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0864610F9DF;
	Tue, 14 Jun 2022 07:29:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D15A010FA39
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 06:20:06 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id f9so6998317plg.0
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 23:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pPW2A2+FecqYzTNxHFw+Bd5A/ry9FUiCsCVN9fu3/R8=;
 b=FbOTsp65wpIFPM+f/TC7ij0u8gt6p+ds5rUbQMG2n53sAhdZ19c1vLL264pDl2AwDY
 57LBg1auQbdhRMYBKw7cb4CeNzYIhwH/+JBLv0AAjDl9jKU37E/JOt3CCANFNqnZHGfJ
 9u6NJYCNB3H1Iad+hZ+hCTclOAoK5fe4vr5P0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pPW2A2+FecqYzTNxHFw+Bd5A/ry9FUiCsCVN9fu3/R8=;
 b=HIDF16ivPdEASfvfJP1rU95+6++lcCWd9GQ0JgjAsxiWYk1p1cXWN+NHws2uWVqOIt
 PuVHFW75ClUT3bg28ACzX8UqB2qGl7M8zmOkbjvCYUg9herBiHJWthu/jb9DKrw0fOv+
 n/E4vTi8Wl8PBXcTELwvn5FDxAUlPO3vDjxJNixSsQLMTv6ZIlXvkZbVltuvDtBz/z8U
 tHWixvvvkLirP5oYTKmg+5qu+sxL6su2P1YaQXd1opylnQ2NLntCFAzwbd9nn8mkEu/W
 oqQpDvBpLTRzhsnt52xKrMuUm9ZWKD/1lhMQsSgptaIIvLQqnKjR0o/WftLLhPItlZNW
 0OqQ==
X-Gm-Message-State: AJIora9lJpB6ZS19pPRRFn69yDEE8BRfkhCLY07ju5iYFR6uUpYYPWZf
 h3DaCzhDpVFal9NQEEMi172vHg==
X-Google-Smtp-Source: AGRyM1tLGDcRvgLXKrK8g1+Gi22Egly2Q95+bKbpI6vSAAYC4395lKlEnzsUatHxgegTi+5DsfiOlA==
X-Received: by 2002:a17:902:d4ca:b0:164:1971:1504 with SMTP id
 o10-20020a170902d4ca00b0016419711504mr2806792plg.138.1655187606377; 
 Mon, 13 Jun 2022 23:20:06 -0700 (PDT)
Received: from localhost.localdomain ([124.123.175.49])
 by smtp.gmail.com with ESMTPSA id
 x67-20020a623146000000b0051be16492basm6531216pfx.195.2022.06.13.23.20.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 23:20:05 -0700 (PDT)
From: Suniel Mahesh <sunil@amarulasolutions.com>
To: Mark Brown <broonie@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 Christopher Vollo <chris@renewoutreach.org>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH 2/2] ARM: dts: sun8i: Add R16 Vista E board from
 RenewWorldOutreach
Date: Tue, 14 Jun 2022 11:49:46 +0530
Message-Id: <20220614061946.276898-2-sunil@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220614061946.276898-1-sunil@amarulasolutions.com>
References: <20220614061946.276898-1-sunil@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 14 Jun 2022 07:29:54 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, linux-amarula@amarulasolutions.com,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The R16-Vista-E board from RenewWorldOutreach based on allwinner
R16(A33).

General features:
- 1GB RAM
- microSD slot
- Realtek Wifi
- 1 x USB 2.0
- HDMI IN
- HDMI OUT
- Audio out
- MIPI DSI
- TI DLPC3433

It has also connectors to connect an external mini keypad.

Signed-off-by: Suniel Mahesh <sunil@amarulasolutions.com>
---
 arch/arm/boot/dts/Makefile                    |   1 +
 arch/arm/boot/dts/sun8i-r16-renew-vista-e.dts | 361 ++++++++++++++++++
 2 files changed, 362 insertions(+)
 create mode 100644 arch/arm/boot/dts/sun8i-r16-renew-vista-e.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 184899808ee7..b5966c0742e1 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1353,6 +1353,7 @@ dtb-$(CONFIG_MACH_SUN8I) += \
 	sun8i-r16-nintendo-nes-classic.dtb \
 	sun8i-r16-nintendo-super-nes-classic.dtb \
 	sun8i-r16-parrot.dtb \
+	sun8i-r16-renew-vista-e.dtb \
 	sun8i-r40-bananapi-m2-ultra.dtb \
 	sun8i-r40-oka40i-c.dtb \
 	sun8i-s3-elimo-initium.dtb \
diff --git a/arch/arm/boot/dts/sun8i-r16-renew-vista-e.dts b/arch/arm/boot/dts/sun8i-r16-renew-vista-e.dts
new file mode 100644
index 000000000000..a762fbd69773
--- /dev/null
+++ b/arch/arm/boot/dts/sun8i-r16-renew-vista-e.dts
@@ -0,0 +1,361 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (C) 2022 RenewWorldOutreach
+ * Copyright (C) 2022 Amarula Solutions(India)
+ */
+
+/dts-v1/;
+#include "sun8i-a33.dtsi"
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
+
+/ {
+	model = "RenewWorldOutreach R16-Vista-E";
+	compatible = "renewworldoutreach,r16-vista-e", "allwinner,sun8i-a33";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	gpio-keys-polled {
+		compatible = "gpio-keys-polled";
+		poll-interval = <100>;
+
+		ok {
+			label = "ok";
+			linux,code = <KEY_OK>;
+			gpios = <&pio 4 0 GPIO_ACTIVE_LOW>;
+		};
+
+		left {
+			label = "left";
+			linux,code = <KEY_LEFT>;
+			gpios = <&pio 4 1 GPIO_ACTIVE_LOW>;
+		};
+
+		right {
+			label = "right";
+			linux,code = <KEY_RIGHT>;
+			gpios = <&pio 4 2 GPIO_ACTIVE_LOW>;
+		};
+
+		up {
+			label = "up";
+			linux,code = <KEY_UP>;
+			gpios = <&pio 4 3 GPIO_ACTIVE_LOW>;
+		};
+
+		down {
+			label = "down";
+			linux,code = <KEY_DOWN>;
+			gpios = <&pio 4 4 GPIO_ACTIVE_LOW>;
+		};
+
+		back {
+			label = "back";
+			linux,code = <KEY_BACK>;
+			gpios = <&pio 4 5 GPIO_ACTIVE_LOW>;
+		};
+
+		power {
+			label = "power";
+			linux,code = <KEY_POWER>;
+			gpios = <&pio 4 6 GPIO_ACTIVE_LOW>;
+		};
+
+		vol-down {
+			label = "vol-down";
+			linux,code = <KEY_VOLUMEDOWN>;
+			gpios = <&pio 7 3 GPIO_ACTIVE_LOW>;
+		};
+
+		vol-up {
+			label = "vol-up";
+			linux,code = <KEY_VOLUMEUP>;
+			gpios = <&pio 7 9 GPIO_ACTIVE_LOW>;
+		};
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		battery-led0 {
+			label = "renew-e:battery-led0";
+			gpios = <&r_pio 0 2 GPIO_ACTIVE_HIGH>;
+		};
+
+		battery-led1 {
+			label = "renew-e:battery-led1";
+			gpios = <&r_pio 0 3 GPIO_ACTIVE_HIGH>;
+		};
+
+		battery-led2 {
+			label = "renew-e:battery-led2";
+			gpios = <&r_pio 0 4 GPIO_ACTIVE_HIGH>;
+		};
+
+		battery-led3 {
+			label = "renew-e:battery-led3";
+			gpios = <&r_pio 0 5 GPIO_ACTIVE_HIGH>;
+		};
+
+		pad-intz {
+			label = "renew-e:pad-intz";
+			gpios = <&pio 4 16 GPIO_ACTIVE_HIGH>;
+			default-state = "on";
+		};
+
+		battery-led4 {
+			label = "renew-e:battery-led4";
+			gpios = <&r_pio 0 6 GPIO_ACTIVE_HIGH>;
+		};
+
+		volume-led0 {
+                        label = "renew-e:volume-led0";
+                        gpios = <&pio 7 2 GPIO_ACTIVE_HIGH>;
+                };
+
+		volume-led1 {
+			label = "renew-e:volume-led1";
+			gpios = <&pio 6 13 GPIO_ACTIVE_HIGH>;
+		};
+
+		volume-led2 {
+			label = "renew-e:volume-led2";
+			gpios = <&pio 6 12 GPIO_ACTIVE_HIGH>;
+		};
+
+		volume-led3 {
+			label = "renew-e:volume-led3";
+			gpios = <&pio 6 11 GPIO_ACTIVE_HIGH>;
+		};
+
+		volume-led4 {
+			label = "renew-e:volume-led4";
+			gpios = <&pio 6 10 GPIO_ACTIVE_HIGH>;
+		};
+
+		fans-on {
+			label = "renew-e:fans-on";
+			gpios = <&pio 4 14 GPIO_ACTIVE_HIGH>; /* FAN_ON/OFF: PE14 */
+			default-state = "on";
+		};
+	};
+
+	reg_vcc5v0: vcc5v0 {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc5v0";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+	};
+};
+
+&codec {
+	status = "okay";
+};
+
+&cpu0 {
+	cpu-supply = <&reg_dcdc3>;
+};
+
+&cpu0_opp_table {
+	opp-1104000000 {
+		opp-hz = /bits/ 64 <1104000000>;
+		opp-microvolt = <1320000>;
+		clock-latency-ns = <244144>; /* 8 32k periods */
+	};
+
+	opp-1200000000 {
+		opp-hz = /bits/ 64 <1200000000>;
+		opp-microvolt = <1320000>;
+		clock-latency-ns = <244144>; /* 8 32k periods */
+	};
+};
+
+&dai {
+	status = "okay";
+};
+
+&de {
+	status = "okay";
+};
+
+&dphy {
+	status = "okay";
+};
+
+&ehci0 {
+	status = "okay";
+};
+
+&mmc0 {
+	vmmc-supply = <&reg_dcdc1>;
+	bus-width = <4>;
+	non-removable;
+	status = "okay";
+};
+
+&mmc1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&mmc1_pg_pins>;
+	vmmc-supply = <&reg_dcdc1>;
+	bus-width = <4>;
+	broken-cd;
+	status = "okay";
+};
+
+&ohci0 {
+	status = "okay";
+};
+
+&r_rsb {
+	status = "okay";
+
+	axp22x: pmic@3a3 {
+		compatible = "x-powers,axp223";
+		reg = <0x3a3>;
+		interrupt-parent = <&r_intc>;
+		interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_LOW>;
+		eldoin-supply = <&reg_dcdc1>;
+		x-powers,drive-vbus-en;
+	};
+};
+
+#include "axp223.dtsi"
+
+&ac_power_supply {
+	status = "okay";
+};
+
+&reg_aldo1 {
+	regulator-always-on;
+	regulator-min-microvolt = <3000000>;
+	regulator-max-microvolt = <3000000>;
+	regulator-name = "vcc-io";
+};
+
+&reg_aldo2 {
+	regulator-always-on;
+	regulator-min-microvolt = <2500000>;
+	regulator-max-microvolt = <2500000>;
+	regulator-name = "vdd-dll";
+};
+
+&reg_aldo3 {
+	regulator-always-on;
+	regulator-min-microvolt = <3000000>;
+	regulator-max-microvolt = <3000000>;
+	regulator-name = "avcc";
+};
+
+&reg_dc1sw {
+	regulator-name = "vcc-lcd";
+};
+
+&reg_dc5ldo {
+	regulator-always-on;
+	regulator-min-microvolt = <900000>;
+	regulator-max-microvolt = <1400000>;
+	regulator-name = "vdd-cpus";
+};
+
+&reg_dcdc1 {
+	regulator-always-on;
+	regulator-min-microvolt = <3000000>;
+	regulator-max-microvolt = <3000000>;
+	regulator-name = "vcc-3v0";
+};
+
+&reg_dcdc2 {
+	regulator-always-on;
+	regulator-min-microvolt = <900000>;
+	regulator-max-microvolt = <1400000>;
+	regulator-name = "vdd-sys";
+};
+
+&reg_dcdc3 {
+	regulator-always-on;
+	regulator-min-microvolt = <900000>;
+	regulator-max-microvolt = <1400000>;
+	regulator-name = "vdd-cpu";
+};
+
+&reg_dcdc5 {
+	regulator-always-on;
+	regulator-min-microvolt = <1500000>;
+	regulator-max-microvolt = <1500000>;
+	regulator-name = "vcc-dram";
+};
+
+&reg_dldo1 {
+	regulator-always-on;
+	regulator-min-microvolt = <3300000>;
+	regulator-max-microvolt = <3300000>;
+	regulator-name = "vcc-3v3-main1";
+};
+
+&reg_dldo2 {
+	regulator-always-on;
+	regulator-min-microvolt = <3300000>;
+	regulator-max-microvolt = <3300000>;
+	regulator-name = "vcc-3v3-main2";
+};
+
+&reg_dldo3 {
+	regulator-always-on;
+	regulator-min-microvolt = <3300000>;
+	regulator-max-microvolt = <3300000>;
+	regulator-name = "vcc-3v3-main3";
+};
+
+&reg_dldo4 {
+	regulator-always-on;
+	regulator-min-microvolt = <3300000>;
+	regulator-max-microvolt = <3300000>;
+	regulator-name = "vcc-3v3-main4";
+};
+
+&reg_eldo1 {
+	regulator-always-on;
+	regulator-min-microvolt = <1200000>;
+	regulator-max-microvolt = <1200000>;
+	regulator-name = "vcc-1v2-hdmi";
+};
+
+&reg_drivevbus {
+	regulator-name = "usb0-vbus";
+	status = "okay";
+};
+
+&reg_rtc_ldo {
+	regulator-name = "vcc-rtc";
+};
+
+&sound {
+	status = "okay";
+	simple-audio-card,routing =
+		"Left DAC", "AIF1 Slot 0 Left",
+		"Right DAC", "AIF1 Slot 0 Right";
+};
+
+&uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_pb_pins>;
+	status = "okay";
+};
+
+&usb_otg {
+	dr_mode = "host";
+	status = "okay";
+};
+
+&usbphy {
+	usb0_vbus-supply = <&reg_vcc5v0>;
+	status = "okay";
+};
-- 
2.25.1

