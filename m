Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5CBC565ACE
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jul 2022 18:16:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7167910E677;
	Mon,  4 Jul 2022 16:14:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B804210E04F
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Jul 2022 07:42:30 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id B66735C0078;
 Sun,  3 Jul 2022 03:42:27 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Sun, 03 Jul 2022 03:42:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 cc:cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1656834147; x=
 1656920547; bh=z5AiA0gEmtQjkziaFzwZfU31CiI1kYtFYGZXwcVQQqA=; b=e
 daz+JgnvO28GHJKwSmA9EOXRwrf3SQGNs0Vfi74Sj0mftTA6hGtZus8BYSFJB19O
 +GWFU3Az9xZtDvqAJYDOV8u99B7DjBk/Wo1Dh/hoNnqZz0dNoRQFZJWK8bOkursH
 wK0ZGTkig7NLa/5speBzQ64aAi5fpSBSf8yhffiUvAkY7v1ZlcBKM/FXhOx3aaMi
 CZ1Nq7uwQLZoLnSEqMFl/bpXTX/UPYPSUpMIeq5/+jeS2GgftVmzYnd+WbuJFUhJ
 Ro0iNvE9MMceZsvAH29b1Bv68gAQhi1+wp6EG3csWFnYshpf2ShpgqALUFRZz46s
 ioIP5qv9wUpP65I/BQVhw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1656834147; x=
 1656920547; bh=z5AiA0gEmtQjkziaFzwZfU31CiI1kYtFYGZXwcVQQqA=; b=u
 5AO7US0qCxOTKw1pmIPVVuXGQxulVnVIN3/axtLDLSAjB601B+27SDaE6Q5UJm7A
 w9uq+xrGGkzBgHczNm0YkMg1cNTzRDK1DJVx0C3e/xWWp0R0958L3l1nCfhQSQwi
 JiiIqRYhvOFlbiQXbV97DuY/tBfN0hVsr1+GzzavG5hORbsVv8FCCbYIKhqba5c3
 FQHPO2d5SxzkcWUOF9TMMhr2Km3hcbdv02v9OWWgzsQtnw2lDjAwerHe6gZgbym8
 jkPViCwj56iRrPNLcH106siAJiu00UgdYU76X38gX9VnxjPPTMkmt8UdVgAgXQMo
 YGZ83GGGjqcfl/Ro9eDhw==
X-ME-Sender: <xms:YkjBYuv0VqrLOZ-gH0RnOSE3T9Fw7PQIreQzKtZD_kj9lY3PpTszkQ>
 <xme:YkjBYjeGq4F1hGpMl5xrESqxHC3sSwq6DmKC_ezOF1Bghx29E_hYrXB0SbjL62Hyz
 au79gadyD6Z2fQx3w>
X-ME-Received: <xmr:YkjBYpznsbRPnuWKn7ZjlVsLIZspom6oq9CUTceLhR6qM2AefgX9dxZrhst4REh1cY8Owo4q9QonNaUiQKd_zlEwvqIcNuggjseg1PMhuXBk5x37AjsOZMDaxQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudehiedguddvhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefuvfevfhfhkffffgggjggtgfesthejredttdefjeenucfhrhhomhepufgr
 mhhuvghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqne
 cuggftrfgrthhtvghrnhepffdtveekvdegkeeuueetgfetffeileevudekuefhheelvdfh
 iedtheduhfduhefhnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
 hfrhhomhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:YkjBYpMxidZLCg7XBC2CvVfqlwmWVOVffVPKPoV4cbCkm7WQucmhLQ>
 <xmx:YkjBYu_xuwSBIDmjVDeA_QqnZaBfHvYqCoG1m7fsjDeTssS9HjMvCA>
 <xmx:YkjBYhVZnarTqHV55FwOVVGoKvgn0qwms_0XfreM4QIsqXlcTpbj1A>
 <xmx:Y0jBYgeOMA9yZVXn0ayTwO2b2ioPxPdvQk0wZsIUW1OK0AMVZxHI6g>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 3 Jul 2022 03:42:26 -0400 (EDT)
Subject: Re: [PATCH v2 2/2] ARM: dts: sun8i: Add R16 Vista E board from
 RenewWorldOutreach
To: Suniel Mahesh <sunil@amarulasolutions.com>, Chen-Yu Tsai <wens@csie.org>, 
 Christopher Vollo <chris@renewoutreach.org>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Jagan Teki <jagan@amarulasolutions.com>
References: <20220615093900.344726-1-sunil@amarulasolutions.com>
 <20220615093900.344726-3-sunil@amarulasolutions.com>
From: Samuel Holland <samuel@sholland.org>
Message-ID: <0bb1761f-4fa4-c6e2-852f-f110d026eac0@sholland.org>
Date: Sun, 3 Jul 2022 02:42:25 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20220615093900.344726-3-sunil@amarulasolutions.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 linux-amarula@amarulasolutions.com,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/15/22 4:39 AM, Suniel Mahesh wrote:
> The R16-Vista-E board from RenewWorldOutreach based on allwinner
> R16(A33).
> 
> General features:
> - 1GB RAM
> - microSD slot
> - Realtek Wifi
> - 1 x USB 2.0
> - HDMI IN
> - HDMI OUT
> - Audio out
> - MIPI DSI
> - TI DLPC3433
> 
> It has also connectors to connect an external mini keypad.
> 
> Signed-off-by: Christopher Vollo <chris@renewoutreach.org>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> Signed-off-by: Suniel Mahesh <sunil@amarulasolutions.com>
> 
> ---
> Changes for v2:
> - Add missing compatible string
> - insert missing signatures of contributors
> ---
>  arch/arm/boot/dts/Makefile                    |   1 +
>  arch/arm/boot/dts/sun8i-r16-renew-vista-e.dts | 361 ++++++++++++++++++
>  2 files changed, 362 insertions(+)
>  create mode 100644 arch/arm/boot/dts/sun8i-r16-renew-vista-e.dts
> 
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 184899808ee7..b5966c0742e1 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -1353,6 +1353,7 @@ dtb-$(CONFIG_MACH_SUN8I) += \
>  	sun8i-r16-nintendo-nes-classic.dtb \
>  	sun8i-r16-nintendo-super-nes-classic.dtb \
>  	sun8i-r16-parrot.dtb \
> +	sun8i-r16-renew-vista-e.dtb \
>  	sun8i-r40-bananapi-m2-ultra.dtb \
>  	sun8i-r40-oka40i-c.dtb \
>  	sun8i-s3-elimo-initium.dtb \
> diff --git a/arch/arm/boot/dts/sun8i-r16-renew-vista-e.dts b/arch/arm/boot/dts/sun8i-r16-renew-vista-e.dts
> new file mode 100644
> index 000000000000..45f620203c33
> --- /dev/null
> +++ b/arch/arm/boot/dts/sun8i-r16-renew-vista-e.dts
> @@ -0,0 +1,361 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (C) 2022 RenewWorldOutreach
> + * Copyright (C) 2022 Amarula Solutions(India)
> + */
> +
> +/dts-v1/;
> +#include "sun8i-a33.dtsi"
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/leds/common.h>
> +
> +/ {
> +	model = "RenewWorldOutreach R16-Vista-E";
> +	compatible = "renewworldoutreach,r16-vista-e", "allwinner,sun8i-r16", "allwinner,sun8i-a33";
> +
> +	aliases {
> +		serial0 = &uart0;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	gpio-keys-polled {
> +		compatible = "gpio-keys-polled";
> +		poll-interval = <100>;
> +
> +		ok {
> +			label = "ok";
> +			linux,code = <KEY_OK>;
> +			gpios = <&pio 4 0 GPIO_ACTIVE_LOW>;
> +		};
> +
> +		left {
> +			label = "left";
> +			linux,code = <KEY_LEFT>;
> +			gpios = <&pio 4 1 GPIO_ACTIVE_LOW>;
> +		};
> +
> +		right {
> +			label = "right";
> +			linux,code = <KEY_RIGHT>;
> +			gpios = <&pio 4 2 GPIO_ACTIVE_LOW>;
> +		};
> +
> +		up {
> +			label = "up";
> +			linux,code = <KEY_UP>;
> +			gpios = <&pio 4 3 GPIO_ACTIVE_LOW>;
> +		};
> +
> +		down {
> +			label = "down";
> +			linux,code = <KEY_DOWN>;
> +			gpios = <&pio 4 4 GPIO_ACTIVE_LOW>;
> +		};
> +
> +		back {
> +			label = "back";
> +			linux,code = <KEY_BACK>;
> +			gpios = <&pio 4 5 GPIO_ACTIVE_LOW>;
> +		};
> +
> +		power {
> +			label = "power";
> +			linux,code = <KEY_POWER>;
> +			gpios = <&pio 4 6 GPIO_ACTIVE_LOW>;
> +		};
> +
> +		vol-down {
> +			label = "vol-down";
> +			linux,code = <KEY_VOLUMEDOWN>;
> +			gpios = <&pio 7 3 GPIO_ACTIVE_LOW>;
> +		};
> +
> +		vol-up {
> +			label = "vol-up";
> +			linux,code = <KEY_VOLUMEUP>;
> +			gpios = <&pio 7 9 GPIO_ACTIVE_LOW>;
> +		};
> +	};
> +
> +	leds {
> +		compatible = "gpio-leds";
> +
> +		battery-led0 {
> +			label = "renew-e:battery-led0";
> +			gpios = <&r_pio 0 2 GPIO_ACTIVE_HIGH>;
> +		};
> +
> +		battery-led1 {
> +			label = "renew-e:battery-led1";
> +			gpios = <&r_pio 0 3 GPIO_ACTIVE_HIGH>;
> +		};
> +
> +		battery-led2 {
> +			label = "renew-e:battery-led2";
> +			gpios = <&r_pio 0 4 GPIO_ACTIVE_HIGH>;
> +		};
> +
> +		battery-led3 {
> +			label = "renew-e:battery-led3";
> +			gpios = <&r_pio 0 5 GPIO_ACTIVE_HIGH>;
> +		};
> +
> +		pad-intz {
> +			label = "renew-e:pad-intz";
> +			gpios = <&pio 4 16 GPIO_ACTIVE_HIGH>;
> +			default-state = "on";
> +		};

Is this really an LED, or just a generic output?

> +
> +		battery-led4 {
> +			label = "renew-e:battery-led4";
> +			gpios = <&r_pio 0 6 GPIO_ACTIVE_HIGH>;
> +		};
> +
> +		volume-led0 {
> +                        label = "renew-e:volume-led0";
> +                        gpios = <&pio 7 2 GPIO_ACTIVE_HIGH>;
> +                };

Indent with tabs, please.

> +
> +		volume-led1 {
> +			label = "renew-e:volume-led1";
> +			gpios = <&pio 6 13 GPIO_ACTIVE_HIGH>;
> +		};
> +
> +		volume-led2 {
> +			label = "renew-e:volume-led2";
> +			gpios = <&pio 6 12 GPIO_ACTIVE_HIGH>;
> +		};
> +
> +		volume-led3 {
> +			label = "renew-e:volume-led3";
> +			gpios = <&pio 6 11 GPIO_ACTIVE_HIGH>;
> +		};
> +
> +		volume-led4 {
> +			label = "renew-e:volume-led4";
> +			gpios = <&pio 6 10 GPIO_ACTIVE_HIGH>;
> +		};
> +
> +		fans-on {
> +			label = "renew-e:fans-on";
> +			gpios = <&pio 4 14 GPIO_ACTIVE_HIGH>; /* FAN_ON/OFF: PE14 */
> +			default-state = "on";
> +		};

Does this drive an LED or control a fan? If it controls a fan, it should use the
gpio-fan binding, and not pretend to be an LED.

It also does not validate against the gpio-leds binding:

sun8i-r16-renew-vista-e.dtb: leds: 'fans-on', 'pad-intz' do not match any of the
regexes: '(^led-[0-9a-f]$|led)', 'pinctrl-[0-9]+'

> +	};
> +
> +	reg_vcc5v0: vcc5v0 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc5v0";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +	};
> +};
> +
> +&codec {
> +	status = "okay";
> +};
> +
> +&cpu0 {
> +	cpu-supply = <&reg_dcdc3>;
> +};
> +
> +&cpu0_opp_table {
> +	opp-1104000000 {
> +		opp-hz = /bits/ 64 <1104000000>;
> +		opp-microvolt = <1320000>;
> +		clock-latency-ns = <244144>; /* 8 32k periods */
> +	};
> +
> +	opp-1200000000 {
> +		opp-hz = /bits/ 64 <1200000000>;
> +		opp-microvolt = <1320000>;
> +		clock-latency-ns = <244144>; /* 8 32k periods */
> +	};
> +};
> +
> +&dai {
> +	status = "okay";
> +};
> +
> +&de {
> +	status = "okay";
> +};
> +
> +&dphy {
> +	status = "okay";
> +};
> +
> +&ehci0 {
> +	status = "okay";
> +};
> +
> +&mmc0 {
> +	vmmc-supply = <&reg_dcdc1>;
> +	bus-width = <4>;
> +	non-removable;
> +	status = "okay";
> +};
> +
> +&mmc1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&mmc1_pg_pins>;
> +	vmmc-supply = <&reg_dcdc1>;
> +	bus-width = <4>;
> +	broken-cd;
> +	status = "okay";
> +};
> +
> +&ohci0 {
> +	status = "okay";
> +};
> +
> +&r_rsb {
> +	status = "okay";
> +
> +	axp22x: pmic@3a3 {
> +		compatible = "x-powers,axp223";
> +		reg = <0x3a3>;
> +		interrupt-parent = <&r_intc>;
> +		interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_LOW>;
> +		eldoin-supply = <&reg_dcdc1>;
> +		x-powers,drive-vbus-en;
> +	};
> +};
> +
> +#include "axp223.dtsi"
> +
> +&ac_power_supply {
> +	status = "okay";
> +};
> +
> +&reg_aldo1 {
> +	regulator-always-on;
> +	regulator-min-microvolt = <3000000>;
> +	regulator-max-microvolt = <3000000>;
> +	regulator-name = "vcc-io";
> +};
> +
> +&reg_aldo2 {
> +	regulator-always-on;
> +	regulator-min-microvolt = <2500000>;
> +	regulator-max-microvolt = <2500000>;
> +	regulator-name = "vdd-dll";
> +};
> +
> +&reg_aldo3 {
> +	regulator-always-on;
> +	regulator-min-microvolt = <3000000>;
> +	regulator-max-microvolt = <3000000>;
> +	regulator-name = "avcc";
> +};
> +
> +&reg_dc1sw {
> +	regulator-name = "vcc-lcd";
> +};
> +
> +&reg_dc5ldo {
> +	regulator-always-on;
> +	regulator-min-microvolt = <900000>;
> +	regulator-max-microvolt = <1400000>;
> +	regulator-name = "vdd-cpus";
> +};
> +
> +&reg_dcdc1 {
> +	regulator-always-on;
> +	regulator-min-microvolt = <3000000>;
> +	regulator-max-microvolt = <3000000>;
> +	regulator-name = "vcc-3v0";
> +};
> +
> +&reg_dcdc2 {
> +	regulator-always-on;
> +	regulator-min-microvolt = <900000>;
> +	regulator-max-microvolt = <1400000>;
> +	regulator-name = "vdd-sys";
> +};
> +
> +&reg_dcdc3 {
> +	regulator-always-on;
> +	regulator-min-microvolt = <900000>;
> +	regulator-max-microvolt = <1400000>;
> +	regulator-name = "vdd-cpu";
> +};
> +
> +&reg_dcdc5 {
> +	regulator-always-on;
> +	regulator-min-microvolt = <1500000>;
> +	regulator-max-microvolt = <1500000>;
> +	regulator-name = "vcc-dram";
> +};
> +
> +&reg_dldo1 {
> +	regulator-always-on;
> +	regulator-min-microvolt = <3300000>;
> +	regulator-max-microvolt = <3300000>;
> +	regulator-name = "vcc-3v3-main1";
> +};
> +
> +&reg_dldo2 {
> +	regulator-always-on;
> +	regulator-min-microvolt = <3300000>;
> +	regulator-max-microvolt = <3300000>;
> +	regulator-name = "vcc-3v3-main2";
> +};
> +
> +&reg_dldo3 {
> +	regulator-always-on;
> +	regulator-min-microvolt = <3300000>;
> +	regulator-max-microvolt = <3300000>;
> +	regulator-name = "vcc-3v3-main3";
> +};
> +
> +&reg_dldo4 {
> +	regulator-always-on;
> +	regulator-min-microvolt = <3300000>;
> +	regulator-max-microvolt = <3300000>;
> +	regulator-name = "vcc-3v3-main4";
> +};
> +
> +&reg_eldo1 {
> +	regulator-always-on;
> +	regulator-min-microvolt = <1200000>;
> +	regulator-max-microvolt = <1200000>;
> +	regulator-name = "vcc-1v2-hdmi";
> +};
> +
> +&reg_drivevbus {
> +	regulator-name = "usb0-vbus";
> +	status = "okay";
> +};
> +
> +&reg_rtc_ldo {
> +	regulator-name = "vcc-rtc";
> +};
> +
> +&sound {
> +	status = "okay";
> +	simple-audio-card,routing =
> +		"Left DAC", "AIF1 Slot 0 Left",
> +		"Right DAC", "AIF1 Slot 0 Right";

Please use "DACL" and "DACR" here, instead of the AIF1 Slot 0 widgets. The AIF1
Slot 0 widgets do not accurately describe the audio routing and are only kept
for backward compatibility.

> +};
> +
> +&uart0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&uart0_pb_pins>;
> +	status = "okay";
> +};
> +
> +&usb_otg {
> +	dr_mode = "host";
> +	status = "okay";
> +};
> +
> +&usbphy {
> +	usb0_vbus-supply = <&reg_vcc5v0>;

You enable drivevbus and label it as "usb0-vbus". But this suggests the VBUS is
always on. Which is correct?

> +	status = "okay";
> +};
> 

