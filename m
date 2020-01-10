Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB89137663
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2020 19:50:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 934A389D87;
	Fri, 10 Jan 2020 18:50:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com
 [IPv6:2607:f8b0:4864:20::f35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F46489D87
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2020 18:50:50 +0000 (UTC)
Received: by mail-qv1-xf35.google.com with SMTP id u10so1220783qvi.2
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2020 10:50:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GIgUUcUTkX5pKDhtErdiwjx4iRJphduQq+0GSYBunzI=;
 b=HSbDft3woAMO0R4/JNEofrl8/x02V3+Y/OCtx37YQNukr90ZiebcvVH+963tN972fX
 UwZuiMi2R/BwF3FaHHPfU1SdFYyOlwL+EqsgDx3loK8tXwK+2g1nONbReIT8YnRzvpGP
 ZwPCKcAtYGL/Kw59o5CDb3dq6rOvzYLcmqBX6txlGRP4QBw9Mpiw5l1Pm7syHOLsE8+0
 KRlzAmVORfUf0PSMdN5YNV6FVzvqDZdJibFA1DnG56id84WhoeLsqhxsiz5LDRKFazG7
 Yk3T22wst8zTO+1amayACyRcMVYmbDatPLkpcZeig1smyED7dxmsGBvJ9KwMj3vbp3V9
 AetQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GIgUUcUTkX5pKDhtErdiwjx4iRJphduQq+0GSYBunzI=;
 b=U5MpYkaWXIMzF0cJ6KHN6q7J+4IgrDMn7FQ/rlGdvQiMzdlp3KLl+gH7SFD55wJ29J
 HI/wqS1LYJRjuhXN4OErEZC1ncmlk2cc92fuCFxqA2Q73UC76HzfKClNU1u8eJS5yCkU
 feRceuDP4pW77siygklpVXRvL0GAij+AcBRmQbNsgyOo3QyQ2ICSoiwrMdYc5aHASZpR
 /CqdjVmLnHzLuN08T2mo7JmxA2J5Q4KK48CXN+K3Nbc191UdXFsaDMoMrWx8gsH6+Y37
 +0/f+ej76yKgu08aF5dPEr+B264nWgU/pgm6E57/VdZhmYkI4YsyREsAu19rif35JFG7
 x2cQ==
X-Gm-Message-State: APjAAAV5f32IspnyuCcbuWU8pgR+ojYHid3Dwj0zkY1DLIqwERFZPJW4
 sSzQ33sGwNH649c2jRsTYMXBsf5J7F2BUF6JM4Y=
X-Google-Smtp-Source: APXvYqwgqJC1MG290fK6HKVuzQC+T9mZeY3wq1cWaRS1beuAks6mXXDj/fi415N3uKjfPc8lES2Y9V95CydDwkPbeNE=
X-Received: by 2002:a0c:ead1:: with SMTP id y17mr49670qvp.210.1578682249122;
 Fri, 10 Jan 2020 10:50:49 -0800 (PST)
MIME-Version: 1.0
References: <20200110155225.1051749-1-icenowy@aosc.io>
 <20200110155225.1051749-6-icenowy@aosc.io>
In-Reply-To: <20200110155225.1051749-6-icenowy@aosc.io>
From: Vasily Khoruzhick <anarsoul@gmail.com>
Date: Fri, 10 Jan 2020 10:51:23 -0800
Message-ID: <CA+E=qVeDLNDYu+zV=DxroQDTYjrG4Vbkk_7Fd-XfU_dRZm-dFA@mail.gmail.com>
Subject: Re: [linux-sunxi] [PATCH 5/5] arm64: dts: allwinner: a64: add support
 for PineTab
To: Icenowy Zheng <icenowy@aosc.io>
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
Cc: devicetree <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 linux-sunxi <linux-sunxi@googlegroups.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sam Ravnborg <sam@ravnborg.org>,
 arm-linux <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 10, 2020 at 7:54 AM Icenowy Zheng <icenowy@aosc.io> wrote:
>
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

You may want to include dtsi with OPP for A64 here if you want to enable DVFS

> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/pwm/pwm.h>
> +
> +/ {
> +       model = "PineTab";
> +       compatible = "pine64,pinetab", "allwinner,sun50i-a64";
> +
> +       aliases {
> +               serial0 = &uart0;
> +               ethernet0 = &rtl8723cs;
> +       };
> +
> +       backlight: backlight {
> +               compatible = "pwm-backlight";
> +               pwms = <&pwm 0 50000 PWM_POLARITY_INVERTED>;
> +               brightness-levels = <0 10 20 30 40 50 60 70 80 90 100>;
> +               default-brightness-level = <8>;
> +               enable-gpios = <&pio 3 23 GPIO_ACTIVE_HIGH>; /* PD23 */
> +               power-supply = <&vdd_bl>;
> +       };
> +
> +       chosen {
> +               stdout-path = "serial0:115200n8";
> +       };
> +
> +       i2c-csi {
> +               compatible = "i2c-gpio";
> +               sda-gpios = <&pio 4 13 GPIO_ACTIVE_HIGH>; /* PE13 */
> +               scl-gpios = <&pio 4 12 GPIO_ACTIVE_HIGH>; /* PE12 */
> +               i2c-gpio,delay-us = <5>;
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
> +               /* Rear camera */
> +               ov5640: camera@3c {
> +                       compatible = "ovti,ov5640";
> +                       reg = <0x3c>;
> +                       pinctrl-names = "default";
> +                       pinctrl-0 = <&csi_mclk_pin>;
> +                       clocks = <&ccu CLK_CSI_MCLK>;
> +                       clock-names = "xclk";
> +
> +                       AVDD-supply = <&reg_dldo3>;
> +                       DOVDD-supply = <&reg_aldo1>;
> +                       DVDD-supply = <&reg_eldo3>;
> +                       reset-gpios = <&pio 4 14 GPIO_ACTIVE_LOW>; /* PE14 */
> +                       powerdown-gpios = <&pio 4 15 GPIO_ACTIVE_HIGH>; /* PE15 */
> +
> +                       port {
> +                               ov5640_ep: endpoint {
> +                                       remote-endpoint = <&csi_ep>;
> +                                       bus-width = <8>;
> +                                       hsync-active = <1>; /* Active high */
> +                                       vsync-active = <0>; /* Active low */
> +                                       data-active = <1>;  /* Active high */
> +                                       pclk-sample = <1>;  /* Rising */
> +                               };
> +                       };
> +               };
> +       };
> +
> +       speaker_amp: audio-amplifier {
> +               compatible = "simple-audio-amplifier";
> +               enable-gpios = <&pio 7 7 GPIO_ACTIVE_HIGH>; /* PH7 */
> +               sound-name-prefix = "Speaker Amp";
> +       };
> +
> +       vdd_bl: regulator@0 {
> +               compatible = "regulator-fixed";
> +               regulator-name = "bl-3v3";
> +               regulator-min-microvolt = <3300000>;
> +               regulator-max-microvolt = <3300000>;
> +               gpio = <&pio 7 6 GPIO_ACTIVE_HIGH>; /* PH6 */
> +               enable-active-high;
> +       };
> +
> +       wifi_pwrseq: wifi_pwrseq {
> +               compatible = "mmc-pwrseq-simple";
> +               reset-gpios = <&r_pio 0 2 GPIO_ACTIVE_LOW>; /* PL2 */
> +               post-power-on-delay-ms = <200>;
> +       };
> +};
> +
> +&codec {
> +       status = "okay";
> +};
> +
> +&codec_analog {
> +       hpvcc-supply = <&reg_eldo1>;
> +       status = "okay";
> +};
> +
> +&cpu0 {
> +       cpu-supply = <&reg_dcdc2>;
> +};

I believe you need CPU regulator for each CPU. I'm aware that we share
clock and regulator for all the CPUs but what would happen if you put
CPU0 offline?

> +
> +&csi {
> +       status = "okay";
> +
> +       port {
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
> +               csi_ep: endpoint {
> +                       remote-endpoint = <&ov5640_ep>;
> +                       bus-width = <8>;
> +                       hsync-active = <1>; /* Active high */
> +                       vsync-active = <0>; /* Active low */
> +                       data-active = <1>;  /* Active high */
> +                       pclk-sample = <1>;  /* Rising */
> +               };
> +       };
> +};
> +
> +&dai {
> +       status = "okay";
> +};
> +
> +&de {
> +       status = "okay";
> +};
> +
> +&dphy {
> +       status = "okay";
> +};
> +
> +&dsi {
> +       vcc-dsi-supply = <&reg_dldo1>;
> +       #address-cells = <1>;
> +       #size-cells = <0>;
> +       status = "okay";
> +
> +       panel@0 {
> +               compatible = "feixin,k101-im2ba02";
> +               reg = <0>;
> +               avdd-supply = <&reg_dc1sw>;
> +               dvdd-supply = <&reg_dc1sw>;
> +               cvdd-supply = <&reg_ldo_io1>;
> +               reset-gpios = <&pio 3 24 GPIO_ACTIVE_HIGH>; /* PD24 */
> +               backlight = <&backlight>;
> +       };
> +};
> +
> +&ehci0 {
> +       status = "okay";
> +};
> +
> +&ehci1 {
> +       status = "okay";
> +};
> +
> +&i2c0 {
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&i2c0_pins>;
> +       status = "okay";
> +
> +       touchscreen@5d {
> +               compatible = "goodix,gt9271";
> +               reg = <0x5d>;
> +               interrupt-parent = <&pio>;
> +               interrupts = <7 4 IRQ_TYPE_LEVEL_HIGH>; /* PH4 */
> +               irq-gpios = <&pio 7 4 GPIO_ACTIVE_HIGH>; /* PH4 */
> +               reset-gpios = <&pio 7 8 GPIO_ACTIVE_HIGH>; /* PH8 */
> +               AVDD28-supply = <&reg_ldo_io1>;
> +       };
> +};
> +
> +&i2c0_pins {
> +       bias-pull-up;
> +};
> +
> +&i2c1 {
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&i2c1_pins>;
> +       status = "okay";
> +
> +       bma223@18 {
> +               compatible = "bosch,bma223", "bosch,bma222e";
> +               reg = <0x18>;
> +               interrupt-parent = <&pio>;
> +               interrupts = <7 5 IRQ_TYPE_LEVEL_HIGH>; /* PH5 */
> +               mount-matrix = "0", "-1", "0",
> +                              "-1", "0", "0",
> +                              "0", "0", "-1";
> +       };
> +};
> +
> +&lradc {
> +       vref-supply = <&reg_aldo3>;
> +       status = "okay";
> +
> +       button-200 {
> +               label = "Volume Up";
> +               linux,code = <KEY_VOLUMEUP>;
> +               channel = <0>;
> +               voltage = <200000>;
> +       };
> +
> +       button-400 {
> +               label = "Volume Down";
> +               linux,code = <KEY_VOLUMEDOWN>;
> +               channel = <0>;
> +               voltage = <400000>;
> +       };
> +};
> +
> +&mixer1 {
> +       status = "okay";
> +};
> +
> +&mmc0 {
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&mmc0_pins>;
> +       vmmc-supply = <&reg_dcdc1>;
> +       cd-gpios = <&pio 5 6 GPIO_ACTIVE_LOW>;
> +       disable-wp;
> +       bus-width = <4>;
> +       status = "okay";
> +};
> +
> +&mmc1 {
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&mmc1_pins>;
> +       vmmc-supply = <&reg_dldo4>;
> +       vqmmc-supply = <&reg_eldo1>;
> +       mmc-pwrseq = <&wifi_pwrseq>;
> +       bus-width = <4>;
> +       non-removable;
> +       status = "okay";
> +
> +       rtl8723cs: wifi@1 {
> +               reg = <1>;
> +       };
> +};
> +
> +&mmc2 {
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&mmc2_pins>;
> +       vmmc-supply = <&reg_dcdc1>;
> +       vqmmc-supply = <&reg_dcdc1>;
> +       bus-width = <8>;
> +       non-removable;
> +       cap-mmc-hw-reset;
> +       status = "okay";
> +};
> +
> +&ohci0 {
> +       status = "okay";
> +};
> +
> +&pwm {
> +       status = "okay";
> +};
> +
> +&r_rsb {
> +       status = "okay";
> +
> +       axp803: pmic@3a3 {
> +               compatible = "x-powers,axp803";
> +               reg = <0x3a3>;
> +               interrupt-parent = <&r_intc>;
> +               interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
> +               x-powers,drive-vbus-en;
> +       };
> +};
> +
> +#include "axp803.dtsi"
> +
> +&ac_power_supply {
> +       status = "okay";
> +};
> +
> +&battery_power_supply {
> +       status = "okay";
> +};
> +
> +&reg_aldo1 {
> +       regulator-min-microvolt = <2800000>;
> +       regulator-max-microvolt = <2800000>;
> +       regulator-name = "dovdd-csi";
> +};
> +
> +&reg_aldo2 {
> +       regulator-always-on;
> +       regulator-min-microvolt = <1800000>;
> +       regulator-max-microvolt = <3300000>;
> +       regulator-name = "vcc-pl";
> +};
> +
> +&reg_aldo3 {
> +       regulator-always-on;
> +       regulator-min-microvolt = <2700000>;
> +       regulator-max-microvolt = <3300000>;
> +       regulator-name = "vcc-pll-avcc";
> +};
> +
> +&reg_dc1sw {
> +       regulator-name = "vcc-lcd";
> +};
> +
> +&reg_dcdc1 {
> +       regulator-always-on;
> +       regulator-min-microvolt = <3300000>;
> +       regulator-max-microvolt = <3300000>;
> +       regulator-name = "vcc-3v3";
> +};
> +
> +&reg_dcdc2 {
> +       regulator-always-on;
> +       regulator-min-microvolt = <1000000>;
> +       regulator-max-microvolt = <1300000>;
> +       regulator-name = "vdd-cpux";
> +};
> +
> +/* DCDC3 is polyphased with DCDC2 */
> +
> +&reg_dcdc5 {
> +       regulator-always-on;
> +       regulator-min-microvolt = <1200000>;
> +       regulator-max-microvolt = <1200000>;
> +       regulator-name = "vcc-dram";
> +};
> +
> +&reg_dcdc6 {
> +       regulator-always-on;
> +       regulator-min-microvolt = <1100000>;
> +       regulator-max-microvolt = <1100000>;
> +       regulator-name = "vdd-sys";
> +};
> +
> +&reg_dldo1 {
> +       regulator-always-on;
> +       regulator-min-microvolt = <3300000>;
> +       regulator-max-microvolt = <3300000>;
> +       regulator-name = "vcc-hdmi-dsi-sensor";
> +};
> +
> +&reg_dldo3 {
> +       regulator-min-microvolt = <2800000>;
> +       regulator-max-microvolt = <2800000>;
> +       regulator-name = "avdd-csi";
> +};
> +
> +&reg_dldo4 {
> +       regulator-min-microvolt = <3300000>;
> +       regulator-max-microvolt = <3300000>;
> +       regulator-name = "vcc-wifi";
> +};
> +
> +&reg_drivevbus {
> +       regulator-name = "usb0-vbus";
> +       status = "okay";
> +};
> +
> +&reg_eldo1 {
> +       regulator-always-on;
> +       regulator-min-microvolt = <1800000>;
> +       regulator-max-microvolt = <1800000>;
> +       regulator-name = "cpvdd";
> +};
> +
> +&reg_eldo2 {
> +       regulator-min-microvolt = <1800000>;
> +       regulator-max-microvolt = <1800000>;
> +       regulator-name = "vcca-1v8";
> +};
> +
> +&reg_eldo3 {
> +       regulator-min-microvolt = <1800000>;
> +       regulator-max-microvolt = <1800000>;
> +       regulator-name = "dvdd-1v8-csi";
> +};
> +
> +&reg_fldo1 {
> +       regulator-min-microvolt = <1200000>;
> +       regulator-max-microvolt = <1200000>;
> +       regulator-name = "vcc-1v2-hsic";
> +};
> +
> +&reg_fldo2 {
> +       regulator-always-on;
> +       regulator-min-microvolt = <1100000>;
> +       regulator-max-microvolt = <1100000>;
> +       regulator-name = "vdd-cpus";
> +};
> +
> +&reg_ldo_io0 {
> +       regulator-min-microvolt = <3300000>;
> +       regulator-max-microvolt = <3300000>;
> +       regulator-name = "vcc-usb";
> +       status = "okay";
> +};
> +
> +&reg_ldo_io1 {
> +       regulator-min-microvolt = <3300000>;
> +       regulator-max-microvolt = <3300000>;
> +       regulator-enable-ramp-delay = <3500000>;
> +       regulator-name = "vcc-touchscreen";
> +       status = "okay";
> +};
> +
> +&reg_rtc_ldo {
> +       regulator-name = "vcc-rtc";
> +};
> +
> +&sound {
> +       status = "okay";
> +       simple-audio-card,aux-devs = <&codec_analog>, <&speaker_amp>;
> +       simple-audio-card,widgets = "Microphone", "Internal Microphone Left",
> +                                   "Microphone", "Internal Microphone Right",
> +                                   "Headphone", "Headphone Jack",
> +                                   "Speaker", "Internal Speaker";
> +       simple-audio-card,routing =
> +                       "Left DAC", "AIF1 Slot 0 Left",
> +                       "Right DAC", "AIF1 Slot 0 Right",
> +                       "Speaker Amp INL", "LINEOUT",
> +                       "Speaker Amp INR", "LINEOUT",
> +                       "Internal Speaker", "Speaker Amp OUTL",
> +                       "Internal Speaker", "Speaker Amp OUTR",
> +                       "Headphone Jack", "HP",
> +                       "AIF1 Slot 0 Left ADC", "Left ADC",
> +                       "AIF1 Slot 0 Right ADC", "Right ADC",
> +                       "Internal Microphone Left", "MBIAS",
> +                       "MIC1", "Internal Microphone Left",
> +                       "Internal Microphone Right", "HBIAS",
> +                       "MIC2", "Internal Microphone Right";
> +};
> +
> +&uart0 {
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&uart0_pb_pins>;
> +       status = "okay";
> +};
> +
> +&usb_otg {
> +       dr_mode = "otg";
> +       status = "okay";
> +};
> +
> +&usb_power_supply {
> +       status = "okay";
> +};
> +
> +&usbphy {
> +       usb0_id_det-gpios = <&pio 7 9 GPIO_ACTIVE_HIGH>; /* PH9 */
> +       usb0_vbus_power-supply = <&usb_power_supply>;
> +       usb0_vbus-supply = <&reg_drivevbus>;
> +       usb1_vbus-supply = <&reg_ldo_io0>;
> +       status = "okay";
> +};
> --
> 2.23.0
>
> --
> You received this message because you are subscribed to the Google Groups "linux-sunxi" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to linux-sunxi+unsubscribe@googlegroups.com.
> To view this discussion on the web, visit https://groups.google.com/d/msgid/linux-sunxi/20200110155225.1051749-6-icenowy%40aosc.io.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
