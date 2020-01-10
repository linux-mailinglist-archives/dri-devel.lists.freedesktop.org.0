Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A141374AD
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2020 18:23:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0467A6EA6E;
	Fri, 10 Jan 2020 17:23:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1ECE6EA6E
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2020 17:23:28 +0000 (UTC)
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 51E41206ED;
 Fri, 10 Jan 2020 17:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1578677008;
 bh=rHPYbG02URRLCw0nb1EuUODTBvDRsydVaOWW7leWqUU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=S7oB24/UF1pSVRYdi4Dfw013OwhiImwWV9Lf+qboUZCndl8xIL9jWKW5n1gtdwu7a
 3ZhWpp+8s6jhaq0SfctaCwYU5Hpk8hRhHk2TVESsZfptdleXPOcVfgVWa5ITLg9tZt
 KdxoyGX4BUjus8iLLZvyDo696CBBE/7z+cTshkp0=
Date: Fri, 10 Jan 2020 18:23:25 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Icenowy Zheng <icenowy@aosc.io>
Subject: Re: [PATCH 5/5] arm64: dts: allwinner: a64: add support for PineTab
Message-ID: <20200110172325.er7kdlfc4fvjbl6x@gilmour.lan>
References: <20200110155225.1051749-1-icenowy@aosc.io>
 <20200110155225.1051749-6-icenowy@aosc.io>
MIME-Version: 1.0
In-Reply-To: <20200110155225.1051749-6-icenowy@aosc.io>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-sunxi@googlegroups.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============0344618021=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0344618021==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="x7pug4yqpkmc5pl7"
Content-Disposition: inline


--x7pug4yqpkmc5pl7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Fri, Jan 10, 2020 at 11:52:25PM +0800, Icenowy Zheng wrote:
> PineTab is a 10.1" tablet by Pine64 with Allwinner A64 inside.
>
> It includes the following peripherals:
>
> USB:
> - A microUSB Type-B port connected to the OTG-capable USB PHY of
> Allwinner A64. The ID pin is connected to a GPIO of the A64 SoC, and the
> Vbus is connected to the Vbus of AXP803 PMIC. These enables OTG
> functionality on this port.
> - A USB Type-A port is connected to the internal hub attached to the
> non-OTG USB PHY of Allwinner A64.
> - There are reserved pins for an external keyboard connected to the
> internal hub.
>
> Power:
> - The microUSB port has its Vbus connected to AXP803, mentioned above.
> - A DC jack (of a strange size, 2.5mm outer diameter) is connected to
> the ACIN of AXP803.
> - A Li-Polymer battery is connected to the battery pins of AXP803.
>
> Storage:
> - An tradition Pine64 eMMC slot is on the board, mounted with an eMMC
> module by factory.
> - An external microSD slot is hidden under a protect case.
>
> Display:
> - A MIPI-DSI LCD panel (800x1280) is connected to the DSI port of A64 SoC.
> - A mini HDMI port.
>
> Input:
> - A touch panel attached to a Goodix GT9271 touch controller.
> - Volume keys connected to the LRADC of the A64 SoC.
>
> Camera:
> - An OV5640 CMOS camera is at rear, connected to the CSI bus of A64 SoC.
> - A GC2145 CMOS camera is at front, shares the same CSI bus with OV5640.
>
> Audio:
> - A headphone jack is conencted to the SoC's internal codec.
> - A speaker connected is to the Line Out port of SoC's internal codec, via
> an amplifier.
>
> Misc:
> - Debug UART is muxed with the headphone jack, with the switch next to
> the microSD slot.
> - A bosch BMA223 accelerometer is connected to the I2C bus of A64 SoC.
> - Wi-Fi and Bluetooth are available via a RTL8723CS chip, similar to the
> one in Pinebook.
>
> This commit adds a basically usable device tree for it, implementing
> most of the features mentioned above. HDMI is not supported now because
> bad LCD-HDMI coexistence situation of mainline A64 display driver, and
> the front camera currently lacks a driver and a facility to share the
> bus with the rear one.
>
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> ---
>  arch/arm64/boot/dts/allwinner/Makefile        |   1 +
>  .../boot/dts/allwinner/sun50i-a64-pinetab.dts | 461 ++++++++++++++++++
>  2 files changed, 462 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-a64-pinetab.dts
>
> diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts/allwinner/Makefile
> index cf4f78617c3f..6dad63881cd3 100644
> --- a/arch/arm64/boot/dts/allwinner/Makefile
> +++ b/arch/arm64/boot/dts/allwinner/Makefile
> @@ -9,6 +9,7 @@ dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-orangepi-win.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-pine64-lts.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-pine64-plus.dtb sun50i-a64-pine64.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-pinebook.dtb
> +dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-pinetab.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-sopine-baseboard.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-teres-i.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h5-bananapi-m2-plus.dtb
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinetab.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinetab.dts
> new file mode 100644
> index 000000000000..1dfa3668636e
> --- /dev/null
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinetab.dts
> @@ -0,0 +1,461 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (C) 2019 Icenowy Zheng <icenowy@aosc.xyz>
> + *
> + */
> +
> +/dts-v1/;
> +
> +#include "sun50i-a64.dtsi"
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/pwm/pwm.h>
> +
> +/ {
> +	model = "PineTab";
> +	compatible = "pine64,pinetab", "allwinner,sun50i-a64";
> +
> +	aliases {
> +		serial0 = &uart0;
> +		ethernet0 = &rtl8723cs;
> +	};
> +
> +	backlight: backlight {
> +		compatible = "pwm-backlight";
> +		pwms = <&pwm 0 50000 PWM_POLARITY_INVERTED>;
> +		brightness-levels = <0 10 20 30 40 50 60 70 80 90 100>;

Each step should be a perceived step, not a decimal one. So let's say,
if you have 10 steps, each step should be seen as a 10% increase in
brightness. Usually a quadratic increase works better there.

> +&dsi {
> +	vcc-dsi-supply = <&reg_dldo1>;
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	status = "okay";

address-cells and size-cells aren't in the DTSI? They should be.

> +
> +	panel@0 {
> +		compatible = "feixin,k101-im2ba02";
> +		reg = <0>;
> +		avdd-supply = <&reg_dc1sw>;
> +		dvdd-supply = <&reg_dc1sw>;
> +		cvdd-supply = <&reg_ldo_io1>;
> +		reset-gpios = <&pio 3 24 GPIO_ACTIVE_HIGH>; /* PD24 */
> +		backlight = <&backlight>;
> +	};
> +};
> +
> +&ehci0 {
> +	status = "okay";
> +};
> +
> +&ehci1 {
> +	status = "okay";
> +};
> +
> +&i2c0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c0_pins>;

That should be set in the DTSI already?

> +	status = "okay";
> +
> +	touchscreen@5d {
> +		compatible = "goodix,gt9271";
> +		reg = <0x5d>;
> +		interrupt-parent = <&pio>;
> +		interrupts = <7 4 IRQ_TYPE_LEVEL_HIGH>; /* PH4 */
> +		irq-gpios = <&pio 7 4 GPIO_ACTIVE_HIGH>; /* PH4 */
> +		reset-gpios = <&pio 7 8 GPIO_ACTIVE_HIGH>; /* PH8 */
> +		AVDD28-supply = <&reg_ldo_io1>;
> +	};
> +};
> +
> +&i2c0_pins {
> +	bias-pull-up;
> +};
> +
> +&i2c1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c1_pins>;

Ditto

> +	status = "okay";
> +
> +	bma223@18 {
> +		compatible = "bosch,bma223", "bosch,bma222e";
> +		reg = <0x18>;
> +		interrupt-parent = <&pio>;
> +		interrupts = <7 5 IRQ_TYPE_LEVEL_HIGH>; /* PH5 */
> +		mount-matrix = "0", "-1", "0",
> +			       "-1", "0", "0",
> +			       "0", "0", "-1";
> +	};
> +};
> +
> +&lradc {
> +	vref-supply = <&reg_aldo3>;
> +	status = "okay";
> +
> +	button-200 {
> +		label = "Volume Up";
> +		linux,code = <KEY_VOLUMEUP>;
> +		channel = <0>;
> +		voltage = <200000>;
> +	};
> +
> +	button-400 {
> +		label = "Volume Down";
> +		linux,code = <KEY_VOLUMEDOWN>;
> +		channel = <0>;
> +		voltage = <400000>;
> +	};
> +};
> +
> +&mixer1 {
> +	status = "okay";
> +};
> +
> +&mmc0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&mmc0_pins>;

Ditto

> +	vmmc-supply = <&reg_dcdc1>;
> +	cd-gpios = <&pio 5 6 GPIO_ACTIVE_LOW>;
> +	disable-wp;
> +	bus-width = <4>;
> +	status = "okay";
> +};
> +
> +&mmc1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&mmc1_pins>;

Ditto

> +	vmmc-supply = <&reg_dldo4>;
> +	vqmmc-supply = <&reg_eldo1>;
> +	mmc-pwrseq = <&wifi_pwrseq>;
> +	bus-width = <4>;
> +	non-removable;
> +	status = "okay";
> +
> +	rtl8723cs: wifi@1 {
> +		reg = <1>;
> +	};
> +};
> +
> +&mmc2 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&mmc2_pins>;

Ditto

Looks good otherwise, thanks!
Maxime

--x7pug4yqpkmc5pl7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXhizDQAKCRDj7w1vZxhR
xSa+AQDxmVfX7/N4LXf2dmyOjkWdFPi2lil3agh6JmKfYenkSAEA/5gILjn67VjB
0pyAS0uYl/jzyQ83E1Hq+tqZCVmLCg8=
=iCFh
-----END PGP SIGNATURE-----

--x7pug4yqpkmc5pl7--

--===============0344618021==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0344618021==--
