Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C48BD9D6ABB
	for <lists+dri-devel@lfdr.de>; Sat, 23 Nov 2024 19:14:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C18810E243;
	Sat, 23 Nov 2024 18:14:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UQy+Iq6d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F53110E243
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Nov 2024 18:14:17 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id
 d2e1a72fcca58-724e113c821so1587803b3a.3
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Nov 2024 10:14:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732385657; x=1732990457; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3E9EubzZ/N5kAx7E2kPinqB77UmgRMRhN52ylzWmfUE=;
 b=UQy+Iq6dLo77s7fzXB2fLHQJYBwf5tH7bV9f++EA5NU5qTscv1fXscM/kxrLj5rfpn
 /hQHM5H1b4vyPcTK8qB341okXEqbUr6i40GkZ7I3sEbSUptYmO70w+C5zFFmK/PvEpcy
 0JkmD8+KytBEdq+qJ7Dv1g7Gabt6UGkoHvxW9c7QRECFag3hxVIksVqvFQl/XWtD0k0X
 hCBDuLnTqPnsGntuKsnxn0qum+t4FnKPEiKC3JpB9A4ouDaf3Fvcv4A56m1opRdiTXtW
 kBSLbrabvg1gpAp2/23K61H/ouiCdqh0yF6ivCY0cvyuIUdkTtrvEVuj6KKAYQSpWK/C
 e8ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732385657; x=1732990457;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3E9EubzZ/N5kAx7E2kPinqB77UmgRMRhN52ylzWmfUE=;
 b=hu4QkNK9LePxPqvBL9ZQU56evFkZNel7qMbsTnHN08kgu6IBwoc4q2GS33bZ57hlTe
 3x5TQ2FI6hOEycqSiGBVdneQOqGJ0o2JKXnm/AWfz/OOKHgqad3x75Hh6Aow2ueIkkiN
 GOzZRDkDCQlzZ2Vdk4ItKcXqMhK9BY6mIbNLo/CfoVO9dqDRCtvJL2Dr3O6bxt+YqAPf
 PdUWU6SqgGReyGS0pxN+OEcEkoMDVSd/6R66QqHL3f3QYqkojGxMjVJrG3V1c7DrZcB2
 d14D0zexmSB2FTeLFTT9N9VwETvfvHHldB+XL2tJ6S3tmrjSMw2KCqy+RHci9PUmf01E
 yrXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1es9bDaUa8Q2h+QJ1IXin+Ihd31SfUI2HD4HU9UTGYBdVGLJhZ1++iqR0DDXHjjHF1xtnWlG3cAQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwmmiFm8sZ92t3TBKhhICWqyhPyNUcIWpVbCrmBxOGtWC9j8xAC
 kzzOAnLaEFgsL5FUPc0wb78EkO9paf2oQT8Z2EDof5W/wNI/OFJH
X-Gm-Gg: ASbGncv2LCLB79vS1Fx/Abptn9NYTDDX3N9cinj15Zbtzai0g4PqNgX4nuawxx+JxhP
 +un2W+B45hf9S8hSXTJ4csbcCFLF99duLRVgGHlaSdoIeISqe+d91rRQihGZMgz0n8Kp5oUpLq3
 s3uwNOPVjBZg2jF5BQBI39jZE+S3qB9L1yKaMk33yOObDiJh1+qrnDq7w8KdO/VEaqkiDUvur2J
 Mm+qsrDGTPBl0eu595qT4aHnTMlWld0/TFi7SkbRqy6emuIF/qAsENHEqH/fWqqrBcnmqW7X5Q=
X-Google-Smtp-Source: AGHT+IGJd5RjyH7yJ8NKMq5Zjdws3I52oMZR0Kvpby6Mp6JsafPgQckawu7CJQVnxW27Q4YT3G5/uw==
X-Received: by 2002:a17:903:234b:b0:212:5ee0:1249 with SMTP id
 d9443c01a7336-2129f28a2a0mr114356735ad.40.1732385656738; 
 Sat, 23 Nov 2024 10:14:16 -0800 (PST)
Received: from mighty.kangaroo-insen.ts.net ([45.64.12.174])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2129dc2c5fcsm34538135ad.280.2024.11.23.10.14.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Nov 2024 10:14:16 -0800 (PST)
From: Mithil Bavishi <bavishimithil@gmail.com>
To: andreas@kemnade.info
Cc: Laurent.pinchart@ideasonboard.com, aaro.koskinen@iki.fi, airlied@gmail.com,
 bavishimithil@gmail.com, conor+dt@kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, jernej.skrabec@gmail.com, jonas@kwiboo.se,
 khilman@baylibre.com, krzk+dt@kernel.org, linux-hardening@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 neil.armstrong@linaro.org, prabhakar.mahadev-lad.rj@bp.renesas.com,
 quic_jesszhan@quicinc.com, rfoss@kernel.org, robh@kernel.org,
 rogerq@kernel.org, simona@ffwll.ch, thierry.reding@gmail.com,
 tony@atomide.com, tzimmermann@suse.de
Subject: Re: [PATCH v3 06/10] ARM: dts: ti: omap: espresso-common: Add common
 device tree for Samsung Galaxy Tab 2 series
Date: Sat, 23 Nov 2024 18:14:05 +0000
Message-ID: <20241123181405.861-1-bavishimithil@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241112100616.5349ad37@akair>
References: <20241112100616.5349ad37@akair>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> > +			no-map;
> > +			reg = <0xA0000000 0x200000>;
>
> If used for ramoops, then there should be a compatible = "ramoops"
> see Documentation/devicetree/bindings/reserved-memory/ramoops.yaml
> > +		};
> > +
> > +		continuous_splash: framebuffer@bef00000{
> > +			reg = <0xbef00000 (1024 * 600 * 4)>;
> > +			no-map;
> > +		};
> > +	};
> > +
> > +	chosen { 
> > +		#address-cells = <1>;
> > +		#size-cells = <1>;
> > +		ranges;
> 
> hmm, no bus here, so no need for address/size-cells, rather specify
> stdout-path, etc.

Will be dropping rampoops_region, and chosen nodes. They were used
initially for debugging, since we now have drm for display and other
means to get logs, these are not required.

> > +	i2c-gpio-5 {
> > +		compatible = "i2c-gpio";
> > +		sda-gpios = <&gpio4 2 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> > +		scl-gpios = <&gpio4 3 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> > +		i2c-gpio,delay-us = <10>;
> > +		#address-cells = <1>;
> > +		#size-cells = <0>;
> hmm, no pinmux here? 

Cannot seem to find it in the muxset given in vendor kernel.
These are placeholders for now and hold other devices like smb136 charger,
stmpe811 adc etc. Drivers for which I need to upstream first.

https://github.com/MightyM17/linux_pvr/blob/testing/arch/arm/boot/dts/omap4-samsung-espresso7.dts#L10-L24

So for now is it better to drop them?

> > +	reg_espresso_external: regulator-espresso-external {
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "vmmc1";
> > +		regulator-max-microvolt = <2800000>;
> > +		regulator-min-microvolt = <2800000>;
> > +		gpios = <&gpio2 2 GPIO_ACTIVE_HIGH>; /* GPIO_34 */
> > +		regulator-always-on;
>
> hmm, we cannot turn sd card power off?

A mistake by me, had kept it always on to ensure it works in testing.
Fixed the error in next revision.

> > +		power {
>
> button or key-power

Fixed.

> > +	led-ir {
> > +		compatible = "gpio-ir-tx";
> > +		gpios = <&gpio2 27 GPIO_ACTIVE_HIGH>; /* GPIO_59 */
> pinmux?

Added one according to -
https://github.com/Unlegacy-Android/android_kernel_ti_omap4/blob/3.4/common/arch/arm/mach-omap2/board-espresso-irled.c#L303-L305

> > +&omap4_pmx_wkup {
>
> order node names alphabetically

Fixed.

> > +	twl6030_wkup_pins: pinmux-twl6030-wkup-pins {
> > +		pinctrl-single,pins = <
> > +			OMAP4_IOPAD(0x54, PIN_OUTPUT | MUX_MODE3)
> > +			/* fref_clk0_out.sys_drm_msecure */
> > +		>;
> > +	};
> > +
> This can come from twl6030_omap4.dtsi

Correct, included twl6030_omap4.dtsi and removed this.

> > +&omap4_pmx_core {
>
> order node names alphabetically

Fixed.

> you can simply include twl6030_omap4.dtsi describing recommended
> connection between omap4 SoCs and twl603X pmics.

Fixed.

> It might be an idea to use a dedicated wakeup irq instead of
> explicitely specifying WAKEUP_EN like you did for the uart.
> That counts for other occurances of WAKEUP_EN as well.

Could you point out to some examples having this change?
I have just followed how muxset mentioned it. I assume this can be
worked on later as well.

> generic node names:
> pmic@48

Changed.

> > +	accelerometer@18 {
> > +		compatible = "bosch,bma254";
> > +		reg = <0x18>;
> > +		vdd-supply = <&ldo4>;
> > +		vddio-supply = <&ldo5>;
> > +		interrupt-parent = <&gpio4>;
> > +		interrupts = <25 (IRQ_TYPE_LEVEL_HIGH | IRQ_TYPE_EDGE_RISING)>,
> > +			<26 (IRQ_TYPE_LEVEL_HIGH | IRQ_TYPE_EDGE_RISING)>;
> 
> this looks odd, binding says IRQ_TYPE_EDGE_RISING. Why do you think you
> need both? After something is rising, it is high, so both seem not to
> make sense.

https://github.com/torvalds/linux/commit/5640fed3035e88c3ce1361e6fc93f4e72468f307
This was worked on before the above mentioned change, hence the confusion.
bma180 schema wants both the interrupts, I do not know why, but now it has
moved to the bma255 schema which makes more sense.
Fixed it according to new schema.

> +		mount-matrix =  "-1",  "0",  "0",
> +				"0",  "1",  "0",
> +				"0",  "0", "1";

> hmm, checking twice, since I mixed up something earlier. This just
> inverts x values, so we are mirroring across y-z plane, that does not
> look like a rotation matrix, so it does not describe how it is mounted.
> Eg. the n900 has two -1 in there, that is a turn by 180 degree.
> 
> Your mount-matrix would be achieved, by cutting the chip into ultra
> thin slices, sorting them upside down and glueing that together. I
> doubt somebody does that.

Went through the mount matrix docs multiple times. It seems fairly
straightforward for the accelerometer. being just a matrix that we can
multiply to get a desired result.
My intention is to flip the x values thus having a -1 in there.
What I do not understand is the logic of how you came to the conclusion
of "cutting the chip into ultra thin slices, sorting them upside down and
glueing". 
The matrix seems correct and works as intended as well.

Best Regards,
Mithil
