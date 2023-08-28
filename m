Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C3178B509
	for <lists+dri-devel@lfdr.de>; Mon, 28 Aug 2023 18:02:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F69010E310;
	Mon, 28 Aug 2023 16:02:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E775910E310
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Aug 2023 16:02:08 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 962FC5AA;
 Mon, 28 Aug 2023 18:00:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1693238446;
 bh=devwBX4fG5VCMIoGyTH9KnEg4wRr7HVWUUnh828CFfM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ooAtzWcM41HnRxbXCFCvZI3D0TMkawUBJI9JlMihcrNGbPXhfAjUu8wpPg36o7c/0
 YQkh4FZ/VBkgjtomanrAPv4Bf6zBYkpcr6GLxtbIXiu+kCLx/4PJkfEkPw84VnIoAD
 a0Y55WZF2HOs6zrq3ShITm16ImKtz6D6w2CUaIu4=
Date: Mon, 28 Aug 2023 19:02:17 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 2/2] ARM: dts: imx: add support for the ATM0700D4 panel
 attached to sk-imx53
Message-ID: <20230828160217.GT14596@pendragon.ideasonboard.com>
References: <20230826215429.1905599-1-dmitry.baryshkov@linaro.org>
 <20230826215429.1905599-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230826215429.1905599-2-dmitry.baryshkov@linaro.org>
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
Cc: dri-devel@lists.freedesktop.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, Sascha Hauer <s.hauer@pengutronix.de>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Shawn Guo <shawnguo@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, NXP Linux Team <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dmitry,

Thank you for the patch.

On Sun, Aug 27, 2023 at 12:54:29AM +0300, Dmitry Baryshkov wrote:
> The SK-ATM0700D4-Plug is an extension board (provided by the same
> manufacturer, [1]) which can be connected to the SK-IMX53 panel kit. The
> panel can be connected either using the RGB parallel bus or using the
> LVDS connector (recommended). Add DT files describing this "shield",
> both RGB and LVDS connections.

Shouldn't these be implemented as overlays ?

> [1] http://starterkit.ru/html/index.php?name=shop&op=view&id=64
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  arch/arm/boot/dts/nxp/imx/Makefile            |   2 +
>  .../nxp/imx/imx53-sk-imx53-atm0700d4-lvds.dts |  97 +++++++++++++++
>  .../nxp/imx/imx53-sk-imx53-atm0700d4-rgb.dts  | 112 ++++++++++++++++++
>  .../dts/nxp/imx/imx53-sk-imx53-atm0700d4.dtsi |  45 +++++++
>  4 files changed, 256 insertions(+)
>  create mode 100644 arch/arm/boot/dts/nxp/imx/imx53-sk-imx53-atm0700d4-lvds.dts
>  create mode 100644 arch/arm/boot/dts/nxp/imx/imx53-sk-imx53-atm0700d4-rgb.dts
>  create mode 100644 arch/arm/boot/dts/nxp/imx/imx53-sk-imx53-atm0700d4.dtsi
> 
> diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
> index 3629e343d322..7532ed6468a0 100644
> --- a/arch/arm/boot/dts/nxp/imx/Makefile
> +++ b/arch/arm/boot/dts/nxp/imx/Makefile
> @@ -47,6 +47,8 @@ dtb-$(CONFIG_SOC_IMX53) += \
>  	imx53-qsb.dtb \
>  	imx53-qsrb.dtb \
>  	imx53-sk-imx53.dtb \
> +	imx53-sk-imx53-atm0700d4-lvds.dtb \
> +	imx53-sk-imx53-atm0700d4-rgb.dtb \
>  	imx53-smd.dtb \
>  	imx53-tx53-x03x.dtb \
>  	imx53-tx53-x13x.dtb \
> diff --git a/arch/arm/boot/dts/nxp/imx/imx53-sk-imx53-atm0700d4-lvds.dts b/arch/arm/boot/dts/nxp/imx/imx53-sk-imx53-atm0700d4-lvds.dts
> new file mode 100644
> index 000000000000..b1c1e7c759b3
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/imx/imx53-sk-imx53-atm0700d4-lvds.dts
> @@ -0,0 +1,97 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +//
> +// Copyright 2023 Linaro Ltd.
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/pwm/pwm.h>
> +#include "imx53-sk-imx53-atm0700d4.dtsi"
> +
> +/ {
> +	lvds-decoder {
> +		compatible = "ti,sn65lvds94", "lvds-decoder";
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +
> +				lvds_decoder_in: endpoint {
> +					remote-endpoint = <&lvds0_out>;
> +				};
> +			};
> +
> +			port@1 {
> +				reg = <1>;
> +
> +				lvds_decoder_out: endpoint {
> +					remote-endpoint = <&panel_rgb_in>;
> +				};
> +			};
> +		};
> +	};
> +};
> +
> +&iomuxc {
> +	pinctrl_lvds0: lvds0grp {
> +		/* LVDS pins only have pin mux configuration */
> +		fsl,pins = <
> +			MX53_PAD_LVDS0_CLK_P__LDB_LVDS0_CLK	0x80000000
> +			MX53_PAD_LVDS0_TX0_P__LDB_LVDS0_TX0	0x80000000
> +			MX53_PAD_LVDS0_TX1_P__LDB_LVDS0_TX1	0x80000000
> +			MX53_PAD_LVDS0_TX2_P__LDB_LVDS0_TX2	0x80000000
> +			MX53_PAD_LVDS0_TX3_P__LDB_LVDS0_TX3	0x80000000
> +		>;
> +	};
> +
> +	pinctrl_spi_gpio: spigrp {
> +		fsl,pins = <
> +			MX53_PAD_EIM_A22__GPIO2_16		0x1f4
> +			MX53_PAD_EIM_A21__GPIO2_17		0x1f4
> +			MX53_PAD_EIM_A16__GPIO2_22		0x1f4
> +			MX53_PAD_EIM_A18__GPIO2_20		0x1f4
> +		>;
> +	};
> +};
> +
> +&ldb {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_lvds0>;
> +	status = "okay";
> +
> +	lvds0: lvds-channel@0 {
> +		reg = <0>;
> +		fsl,data-mapping = "spwg";
> +		fsl,data-width = <24>;
> +		status = "okay";
> +
> +		port@2 {
> +			reg = <2>;
> +
> +			lvds0_out: endpoint {
> +				remote-endpoint = <&lvds_decoder_in>;
> +			};
> +		};
> +	};
> +};
> +
> +&panel_rgb_in {
> +	remote-endpoint = <&lvds_decoder_out>;
> +};
> +
> +&spi_ts {
> +	pinctrl-0 = <&pinctrl_spi_gpio>;
> +	pinctrl-names = "default";
> +
> +	sck-gpios = <&gpio2 16 GPIO_ACTIVE_HIGH>;
> +	miso-gpios = <&gpio2 22 GPIO_ACTIVE_HIGH>;
> +	mosi-gpios = <&gpio2 17 GPIO_ACTIVE_HIGH>;
> +	cs-gpios = <&gpio2 20 GPIO_ACTIVE_HIGH>;
> +};
> +
> +&touchscreen {
> +	interrupts-extended = <&gpio3 22 IRQ_TYPE_EDGE_BOTH>;
> +	pendown-gpio = <&gpio3 22 GPIO_ACTIVE_LOW>;
> +};
> diff --git a/arch/arm/boot/dts/nxp/imx/imx53-sk-imx53-atm0700d4-rgb.dts b/arch/arm/boot/dts/nxp/imx/imx53-sk-imx53-atm0700d4-rgb.dts
> new file mode 100644
> index 000000000000..2559ada7e401
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/imx/imx53-sk-imx53-atm0700d4-rgb.dts
> @@ -0,0 +1,112 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +//
> +// Copyright 2023 Linaro Ltd.
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/pwm/pwm.h>
> +#include "imx53-sk-imx53-atm0700d4.dtsi"
> +
> +/ {
> +	display: disp0 {
> +		compatible = "fsl,imx-parallel-display";
> +		interface-pix-fmt = "rgb24";
> +		pinctrl-0 = <&pinctrl_rgb24>;
> +		pinctrl-names = "default";
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		port@0 {
> +			reg = <0>;
> +
> +			display0_in: endpoint {
> +				remote-endpoint = <&ipu_di0_disp0>;
> +			};
> +		};
> +
> +		port@1 {
> +			reg = <1>;
> +
> +			display_out: endpoint {
> +				remote-endpoint = <&panel_rgb_in>;
> +			};
> +		};
> +	};
> +
> +};
> +
> +&iomuxc {
> +	pinctrl_rgb24: rgb24grp {
> +		fsl,pins = <
> +			MX53_PAD_DI0_DISP_CLK__IPU_DI0_DISP_CLK		0x5
> +			MX53_PAD_DI0_PIN15__IPU_DI0_PIN15		0x5
> +			MX53_PAD_DI0_PIN2__IPU_DI0_PIN2			0x5
> +			MX53_PAD_DI0_PIN3__IPU_DI0_PIN3			0x5
> +			MX53_PAD_DISP0_DAT0__IPU_DISP0_DAT_0		0x5
> +			MX53_PAD_DISP0_DAT1__IPU_DISP0_DAT_1		0x5
> +			MX53_PAD_DISP0_DAT2__IPU_DISP0_DAT_2		0x5
> +			MX53_PAD_DISP0_DAT3__IPU_DISP0_DAT_3		0x5
> +			MX53_PAD_DISP0_DAT4__IPU_DISP0_DAT_4		0x5
> +			MX53_PAD_DISP0_DAT5__IPU_DISP0_DAT_5		0x5
> +			MX53_PAD_DISP0_DAT6__IPU_DISP0_DAT_6		0x5
> +			MX53_PAD_DISP0_DAT7__IPU_DISP0_DAT_7		0x5
> +			MX53_PAD_DISP0_DAT8__IPU_DISP0_DAT_8		0x5
> +			MX53_PAD_DISP0_DAT9__IPU_DISP0_DAT_9		0x5
> +			MX53_PAD_DISP0_DAT10__IPU_DISP0_DAT_10		0x5
> +			MX53_PAD_DISP0_DAT11__IPU_DISP0_DAT_11		0x5
> +			MX53_PAD_DISP0_DAT12__IPU_DISP0_DAT_12		0x5
> +			MX53_PAD_DISP0_DAT13__IPU_DISP0_DAT_13		0x5
> +			MX53_PAD_DISP0_DAT14__IPU_DISP0_DAT_14		0x5
> +			MX53_PAD_DISP0_DAT15__IPU_DISP0_DAT_15		0x5
> +			MX53_PAD_DISP0_DAT16__IPU_DISP0_DAT_16		0x5
> +			MX53_PAD_DISP0_DAT17__IPU_DISP0_DAT_17		0x5
> +			MX53_PAD_DISP0_DAT18__IPU_DISP0_DAT_18		0x5
> +			MX53_PAD_DISP0_DAT19__IPU_DISP0_DAT_19		0x5
> +			MX53_PAD_DISP0_DAT20__IPU_DISP0_DAT_20		0x5
> +			MX53_PAD_DISP0_DAT21__IPU_DISP0_DAT_21		0x5
> +			MX53_PAD_DISP0_DAT22__IPU_DISP0_DAT_22		0x5
> +			MX53_PAD_DISP0_DAT23__IPU_DISP0_DAT_23		0x5
> +		>;
> +	};
> +
> +	pinctrl_spi_gpio: spigrp {
> +		fsl,pins = <
> +			MX53_PAD_SD1_DATA1__GPIO1_17		0x1f4
> +			MX53_PAD_GPIO_7__GPIO1_7		0x1f4
> +			MX53_PAD_PATA_DATA3__GPIO2_3		0x1f4
> +			MX53_PAD_PATA_DATA8__GPIO2_8		0x1f4
> +		>;
> +	};
> +};
> +
> +&ipu_di0_disp0 {
> +	remote-endpoint = <&display0_in>;
> +};
> +
> +&panel {
> +	enable-gpios = <&gpio1 9 GPIO_ACTIVE_HIGH>;
> +};
> +
> +&panel_rgb_in {
> +	remote-endpoint = <&display_out>;
> +};
> +
> +&pwm1 {
> +	status = "disabled";
> +};
> +
> +&spi_ts {
> +	pinctrl-0 = <&pinctrl_spi_gpio>;
> +	pinctrl-names = "default";
> +
> +	sck-gpios = <&gpio1 7 GPIO_ACTIVE_HIGH>;
> +	mosi-gpios = <&gpio2 3 GPIO_ACTIVE_HIGH>;
> +	miso-gpios = <&gpio1 17 GPIO_ACTIVE_HIGH>;
> +	cs-gpios = <&gpio2 8 GPIO_ACTIVE_HIGH>;
> +};
> +
> +&touchscreen {
> +	interrupts-extended = <&gpio2 6 IRQ_TYPE_EDGE_BOTH>;
> +	pendown-gpio = <&gpio2 6 GPIO_ACTIVE_LOW>;
> +};
> diff --git a/arch/arm/boot/dts/nxp/imx/imx53-sk-imx53-atm0700d4.dtsi b/arch/arm/boot/dts/nxp/imx/imx53-sk-imx53-atm0700d4.dtsi
> new file mode 100644
> index 000000000000..e395004e80e6
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/imx/imx53-sk-imx53-atm0700d4.dtsi
> @@ -0,0 +1,45 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +//
> +// Copyright 2023 Linaro Ltd.
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/pwm/pwm.h>
> +#include "imx53-sk-imx53.dts"
> +
> +/ {
> +	panel: panel-rgb {
> +		compatible = "powertip,ph800480t013-idf02";
> +
> +		port {
> +			panel_rgb_in: endpoint {
> +			};
> +		};
> +	};
> +
> +	spi_ts: spi {
> +		compatible = "spi-gpio";
> +		#address-cells = <0x1>;
> +		#size-cells = <0x0>;
> +
> +		num-chipselects = <1>;
> +
> +		touchscreen: touchscreen@0 {
> +			reg = <0>;
> +			compatible = "ti,ads7843";
> +			spi-max-frequency = <300000>;
> +
> +			ti,vref-mv = /bits/ 16 <3300>;
> +			ti,x-plate-ohms = /bits/ 16 <450>;
> +			ti,y-plate-ohms = /bits/ 16 <250>;
> +			ti,debounce-tol = /bits/ 16 <10>;
> +			ti,debounce-rep = /bits/ 16 <0>;
> +			touchscreen-size-x = <4096>;
> +			touchscreen-size-y = <4096>;
> +			touchscreen-swapped-x-y;
> +			touchscreen-max-pressure = <100>;
> +
> +			wakeup-source;
> +		};
> +	};
> +};

-- 
Regards,

Laurent Pinchart
