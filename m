Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F7056FD9B
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 11:58:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAEF212B16C;
	Mon, 11 Jul 2022 09:57:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A0BC12B16C
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 09:57:47 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id r6so1568268plg.3
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 02:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/dH5AuNv3/3xu+UZsaeD0vwZDTjCSjjCkh8LEd+YI1o=;
 b=psYo5QDqDg0MR1r4CavqDmkceWxQGNJNibEvsvR5kJpqNj7b1teQL6n+IdxX3DBD6l
 Zx9nIf22sHdpSiVjzCPW1IFm4M726NzNpzqFFdlKpIbP0aKOGZDpjv/DunvAJflSCoSr
 YIgh0k8bCSYIVSLmTFds8IhI0cuzFqyu70I38=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/dH5AuNv3/3xu+UZsaeD0vwZDTjCSjjCkh8LEd+YI1o=;
 b=l5g6TOokORzV3iaNEEHDEF9H+Sz7w0UNxbzrYujAifqTZr+kL3453LvZRoeP9iTwE/
 Fmocb3+23PAsyeV3AmSSZ8bbCzHJJo44w+L9f7PRA2zxSomh83aPs5yTQtp6aQKpG3KM
 vQZiImIp4Kbrb6xd4rMlqvyxVzWBPhLBc82uDaZvo//f05Mf+oPzW/CMztVv51fOXQIi
 h6xPqVw8GTFb+AaWw9AvQBaJTjJ1HaLYTMyUXHj6sVfzva69MLtltBIX1m2vScKM2rMl
 AWt9fdWlshWZfi6ZauqznG/MkvH2H2tsF/4SMQ0wCVcmtrF4tpcY3mKnwJDkmPG3ZMPK
 p9Rg==
X-Gm-Message-State: AJIora8wePk45a4d8ZOJ29oJU2+DXVd89RmFbGeg7f1xG8F0q4M7gOey
 viKh3+K397oj+hdDOpO2XNyH7Q==
X-Google-Smtp-Source: AGRyM1u71WxKsvtMvsMoeCRY1aLWWAcnNsU10Js1zwhm6QaCtzgBnurLthcyu6WuASW8T98+0p74Gw==
X-Received: by 2002:a17:902:cf03:b0:16b:a91d:aff4 with SMTP id
 i3-20020a170902cf0300b0016ba91daff4mr17868029plg.66.1657533466584; 
 Mon, 11 Jul 2022 02:57:46 -0700 (PDT)
Received: from localhost.localdomain ([183.83.136.224])
 by smtp.gmail.com with ESMTPSA id
 y3-20020a17090a390300b001ef81bac701sm6560814pjb.42.2022.07.11.02.57.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jul 2022 02:57:45 -0700 (PDT)
From: Suniel Mahesh <sunil@amarulasolutions.com>
To: Mark Brown <broonie@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 Christopher Vollo <chris@renewoutreach.org>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH v3 2/2] ARM: dts: sun8i: Add R16 Vista E board from
 RenewWorldOutreach
Date: Mon, 11 Jul 2022 15:27:21 +0530
Message-Id: <20220711095721.1935377-3-sunil@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220711095721.1935377-1-sunil@amarulasolutions.com>
References: <20220711095721.1935377-1-sunil@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
Signed-off-by: Christopher Vollo <chris@renewoutreach.org>
 ---
    Changes for v3:
    - As suggested by Samuel Holland:
    - changed binding to gpio-fan
    - changed widgets to DACL and DACR to describe audio routing
    - fixed indentation
    - primary author of the commit should be the first signer

    Changes for v2:
    - Add missing compatible string
    - insert missing signatures of contributors
---
 arch/arm/boot/dts/Makefile                    |   1 +
 arch/arm/boot/dts/sun8i-r16-renew-vista-e.dts | 362 ++++++++++++++++++
 2 files changed, 363 insertions(+)
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
index 000000000000..ff72914eb110
--- /dev/null
+++ b/arch/arm/boot/dts/sun8i-r16-renew-vista-e.dts
@@ -0,0 +1,362 @@
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
+	compatible = "renewworldoutreach,r16-vista-e", "allwinner,sun8i-r16", "allwinner,sun8i-a33";
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
+			linux,code = <KEY_ENTER>;
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
+		battery-led4 {
+			label = "renew-e:battery-led4";
+			gpios = <&r_pio 0 6 GPIO_ACTIVE_HIGH>;
+		};
+
+		volume-led0 {
+			label = "renew-e:volume-led0";
+			gpios = <&pio 7 2 GPIO_ACTIVE_HIGH>;
+		};
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
+		led-pad-intz {
+			label = "renew-e:led-pad-intz";
+			gpios = <&pio 4 16 GPIO_ACTIVE_HIGH>;
+			default-state = "on";
+		};
+	};
+
+	gpio-fan {
+		compatible = "gpio-fan";
+		gpios = <&pio 4 14 GPIO_ACTIVE_HIGH>; /* FAN_ON/OFF: PE14 */
+		gpio-fan,speed-map = <0 0 6000 1>;
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
+		"Left DAC", "DACL",
+		"Right DAC", "DACR";
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
+	/* VBUS is always on because it is wired to the power supply */
+	usb0_vbus-supply = <&reg_vcc5v0>;
+	status = "okay";
+};
-- 
2.25.1

