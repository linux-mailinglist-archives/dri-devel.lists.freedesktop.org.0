Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D083C7C0A
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jul 2021 04:49:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0D9489B45;
	Wed, 14 Jul 2021 02:48:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCB0C89A75
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jul 2021 02:48:55 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 63C2A6136E;
 Wed, 14 Jul 2021 02:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626230935;
 bh=CelvJVaumzXEnoE4PP1d9+H80RpsTtNbcLbnq2+UbgU=;
 h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
 b=k3kAODQv6t6x1BJV5OuuM8Gxjn/fDauCG/+08fZjSXWJ1PTqPOj5mOFgrxYhhsh7d
 PJ0v0hDHhiVPGY0a71qTf26V0XnO699JaSPjyqDoeqKlVexv/c3SUtxhqoxylelhQm
 YyKdW7dGu0TDRvzAz/fI3C0bQ6oHfkIXGIQBavucMmxxW9dTQvo/vy/G73GmxwenJT
 0cW8/A03S3xs0+/xCZ83fOZioLjBjCqEDbGL/lXmnnRKr16depbVI4hQaYP2kVekkx
 plKsmlQkGIth1RitMWO0R7sRjyK/Z+ylaLLVUslgT+dpTxmHlRDfAWRAZCBnhFaVvw
 6gjXZoPUr+9zA==
Date: Wed, 14 Jul 2021 10:48:47 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Subject: Re: [PATCH v1 4/4] ARM: dts: add SKOV imx6q and imx6dl based boards
Message-ID: <20210714024846.GD31370@dragon>
References: <20210609121050.18715-1-o.rempel@pengutronix.de>
 <20210609121050.18715-5-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210609121050.18715-5-o.rempel@pengutronix.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: Ulrich =?iso-8859-1?Q?=D6lmann?= <u.oelmann@pengutronix.de>,
 Michael Grzeschik <m.grzeschik@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Arnd Bergmann <arnd@arndb.de>,
 devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Sascha Hauer <s.hauer@pengutronix.de>, Juergen Borleis <jbe@pengutronix.de>,
 Marco Felsch <m.felsch@pengutronix.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, soc@kernel.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 =?iso-8859-1?Q?S=F8ren?= Andersen <san@skov.dk>,
 Sam Ravnborg <sam@ravnborg.org>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 09, 2021 at 02:10:50PM +0200, Oleksij Rempel wrote:
> From: Sam Ravnborg <sam@ravnborg.org>
> 
> Add SKOV imx6q/dl LT2, LT6 and mi1010ait-1cp1 boards.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: Søren Andersen <san@skov.dk>
> Signed-off-by: Juergen Borleis <jbe@pengutronix.de>
> Signed-off-by: Ulrich Ölmann <u.oelmann@pengutronix.de>
> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> ---
>  arch/arm/boot/dts/Makefile                    |   5 +
>  arch/arm/boot/dts/imx6dl-skov-revc-lt2.dts    |  13 +
>  arch/arm/boot/dts/imx6dl-skov-revc-lt6.dts    | 108 ++++
>  arch/arm/boot/dts/imx6q-skov-revc-lt2.dts     |  36 ++
>  arch/arm/boot/dts/imx6q-skov-revc-lt6.dts     | 128 +++++
>  .../dts/imx6q-skov-reve-mi1010ait-1cp1.dts    | 127 +++++
>  arch/arm/boot/dts/imx6qdl-skov-cpu-revc.dtsi  |  58 +++
>  arch/arm/boot/dts/imx6qdl-skov-cpu.dtsi       | 476 ++++++++++++++++++
>  8 files changed, 951 insertions(+)
>  create mode 100644 arch/arm/boot/dts/imx6dl-skov-revc-lt2.dts
>  create mode 100644 arch/arm/boot/dts/imx6dl-skov-revc-lt6.dts
>  create mode 100644 arch/arm/boot/dts/imx6q-skov-revc-lt2.dts
>  create mode 100644 arch/arm/boot/dts/imx6q-skov-revc-lt6.dts
>  create mode 100644 arch/arm/boot/dts/imx6q-skov-reve-mi1010ait-1cp1.dts
>  create mode 100644 arch/arm/boot/dts/imx6qdl-skov-cpu-revc.dtsi
>  create mode 100644 arch/arm/boot/dts/imx6qdl-skov-cpu.dtsi
> 
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index f8f09c5066e7..60a3ef665697 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -473,6 +473,8 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
>  	imx6dl-sabrelite.dtb \
>  	imx6dl-sabresd.dtb \
>  	imx6dl-savageboard.dtb \
> +	imx6dl-skov-revc-lt2.dtb \
> +	imx6dl-skov-revc-lt6.dtb \
>  	imx6dl-ts4900.dtb \
>  	imx6dl-ts7970.dtb \
>  	imx6dl-tx6dl-comtft.dtb \
> @@ -567,6 +569,9 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
>  	imx6q-sabresd.dtb \
>  	imx6q-savageboard.dtb \
>  	imx6q-sbc6x.dtb \
> +	imx6q-skov-revc-lt2.dtb \
> +	imx6q-skov-revc-lt6.dtb \
> +	imx6q-skov-reve-mi1010ait-1cp1.dtb \
>  	imx6q-tbs2910.dtb \
>  	imx6q-ts4900.dtb \
>  	imx6q-ts7970.dtb \
> diff --git a/arch/arm/boot/dts/imx6dl-skov-revc-lt2.dts b/arch/arm/boot/dts/imx6dl-skov-revc-lt2.dts
> new file mode 100644
> index 000000000000..667b8faa1807
> --- /dev/null
> +++ b/arch/arm/boot/dts/imx6dl-skov-revc-lt2.dts
> @@ -0,0 +1,13 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +//
> +// Copyright (C) 2020 Pengutronix, Ulrich Oelmann <kernel@pengutronix.de>
> +
> +/dts-v1/;
> +#include "imx6dl.dtsi"
> +#include "imx6qdl-skov-cpu.dtsi"
> +#include "imx6qdl-skov-cpu-revc.dtsi"
> +
> +/ {
> +	model = "SKOV IMX6 CPU SoloCore";
> +	compatible = "skov,imx6dl-skov-revc-lt2", "fsl,imx6dl";
> +};
> diff --git a/arch/arm/boot/dts/imx6dl-skov-revc-lt6.dts b/arch/arm/boot/dts/imx6dl-skov-revc-lt6.dts
> new file mode 100644
> index 000000000000..25071c7c4e29
> --- /dev/null
> +++ b/arch/arm/boot/dts/imx6dl-skov-revc-lt6.dts
> @@ -0,0 +1,108 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +//
> +// Copyright (C) 2020 Pengutronix, Ulrich Oelmann <kernel@pengutronix.de>
> +
> +/dts-v1/;
> +#include "imx6dl.dtsi"
> +#include "imx6qdl-skov-cpu.dtsi"
> +#include "imx6qdl-skov-cpu-revc.dtsi"
> +
> +/ {
> +	model = "SKOV IMX6 CPU SoloCore";
> +	compatible = "skov,imx6dl-skov-revc-lt6", "fsl,imx6dl";
> +
> +	backlight: backlight {
> +		compatible = "pwm-backlight";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_backlight>;
> +		enable-gpios = <&gpio6 23 GPIO_ACTIVE_LOW>;
> +		pwms = <&pwm2 0 20000 0>;
> +		brightness-levels = <0 255>;
> +		num-interpolated-steps = <17>;
> +		default-brightness-level = <8>;
> +		power-supply = <&reg_24v0>;
> +	};
> +
> +	display {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		compatible = "fsl,imx-parallel-display";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_ipu1>;
> +
> +		port@0 {
> +			reg = <0>;
> +
> +			display0_in: endpoint {
> +				remote-endpoint = <&ipu1_di0_disp0>;
> +			};
> +		};
> +
> +		port@1 {
> +			reg = <1>;
> +
> +			display0_out: endpoint {
> +				remote-endpoint = <&panel_in>;
> +			};
> +		};
> +	};
> +
> +
> +	panel {
> +		compatible = "logictechno,lttd800480070-l6wh-rt";
> +		backlight = <&backlight>;
> +		power-supply = <&reg_3v3>;
> +
> +		port {
> +			panel_in: endpoint {
> +				remote-endpoint = <&display0_out>;
> +			};
> +		};
> +	};
> +};
> +
> +&ipu1_di0_disp0 {
> +	remote-endpoint = <&display0_in>;
> +};
> +
> +&iomuxc {
> +	pinctrl_backlight: backlightgrp {
> +		fsl,pins = <
> +			MX6QDL_PAD_RGMII_TD3__GPIO6_IO23		0x58
> +		>;
> +	};
> +
> +	pinctrl_ipu1: ipu1grp {
> +		fsl,pins = <
> +			MX6QDL_PAD_DI0_DISP_CLK__IPU1_DI0_DISP_CLK	0x10
> +			MX6QDL_PAD_DI0_PIN15__IPU1_DI0_PIN15		0x10
> +			MX6QDL_PAD_DI0_PIN2__IPU1_DI0_PIN02		0x10
> +			MX6QDL_PAD_DI0_PIN3__IPU1_DI0_PIN03		0x10
> +			MX6QDL_PAD_DISP0_DAT0__IPU1_DISP0_DATA00	0x10
> +			MX6QDL_PAD_DISP0_DAT1__IPU1_DISP0_DATA01	0x10
> +			MX6QDL_PAD_DISP0_DAT2__IPU1_DISP0_DATA02	0x10
> +			MX6QDL_PAD_DISP0_DAT3__IPU1_DISP0_DATA03	0x10
> +			MX6QDL_PAD_DISP0_DAT4__IPU1_DISP0_DATA04	0x10
> +			MX6QDL_PAD_DISP0_DAT5__IPU1_DISP0_DATA05	0x10
> +			MX6QDL_PAD_DISP0_DAT6__IPU1_DISP0_DATA06	0x10
> +			MX6QDL_PAD_DISP0_DAT7__IPU1_DISP0_DATA07	0x10
> +			MX6QDL_PAD_DISP0_DAT8__IPU1_DISP0_DATA08	0x10
> +			MX6QDL_PAD_DISP0_DAT9__IPU1_DISP0_DATA09	0x10
> +			MX6QDL_PAD_DISP0_DAT10__IPU1_DISP0_DATA10	0x10
> +			MX6QDL_PAD_DISP0_DAT11__IPU1_DISP0_DATA11	0x10
> +			MX6QDL_PAD_DISP0_DAT12__IPU1_DISP0_DATA12	0x10
> +			MX6QDL_PAD_DISP0_DAT13__IPU1_DISP0_DATA13	0x10
> +			MX6QDL_PAD_DISP0_DAT14__IPU1_DISP0_DATA14	0x10
> +			MX6QDL_PAD_DISP0_DAT15__IPU1_DISP0_DATA15	0x10
> +			MX6QDL_PAD_DISP0_DAT16__IPU1_DISP0_DATA16	0x10
> +			MX6QDL_PAD_DISP0_DAT17__IPU1_DISP0_DATA17	0x10
> +			MX6QDL_PAD_DISP0_DAT18__IPU1_DISP0_DATA18	0x10
> +			MX6QDL_PAD_DISP0_DAT19__IPU1_DISP0_DATA19	0x10
> +			MX6QDL_PAD_DISP0_DAT20__IPU1_DISP0_DATA20	0x10
> +			MX6QDL_PAD_DISP0_DAT21__IPU1_DISP0_DATA21	0x10
> +			MX6QDL_PAD_DISP0_DAT22__IPU1_DISP0_DATA22	0x10
> +			MX6QDL_PAD_DISP0_DAT23__IPU1_DISP0_DATA23	0x10
> +		>;
> +	};
> +};
> diff --git a/arch/arm/boot/dts/imx6q-skov-revc-lt2.dts b/arch/arm/boot/dts/imx6q-skov-revc-lt2.dts
> new file mode 100644
> index 000000000000..25332e57ba7b
> --- /dev/null
> +++ b/arch/arm/boot/dts/imx6q-skov-revc-lt2.dts
> @@ -0,0 +1,36 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +//
> +// Copyright (C) 2020 Pengutronix, Ulrich Oelmann <kernel@pengutronix.de>
> +
> +/dts-v1/;
> +#include "imx6q.dtsi"
> +#include "imx6qdl-skov-cpu.dtsi"
> +#include "imx6qdl-skov-cpu-revc.dtsi"
> +
> +/ {
> +	model = "SKOV IMX6 CPU QuadCore";
> +	compatible = "skov,imx6q-skov-revc-lt2", "fsl,imx6q";
> +};
> +
> +&hdmi {
> +	ddc-i2c-bus = <&i2c2>;
> +	status = "okay";
> +};
> +
> +&i2c2 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_i2c2>;
> +	clock-frequency = <100000>;
> +	status = "okay";
> +};
> +
> +&iomuxc {
> +	pinctrl_i2c2: i2c2grp {
> +		fsl,pins = <
> +			/* internal 22 k pull up required */
> +			MX6QDL_PAD_KEY_COL3__I2C2_SCL		0x4001F878
> +			/* internal 22 k pull up required */
> +			MX6QDL_PAD_KEY_ROW3__I2C2_SDA		0x4001F878
> +		>;
> +	};
> +};
> diff --git a/arch/arm/boot/dts/imx6q-skov-revc-lt6.dts b/arch/arm/boot/dts/imx6q-skov-revc-lt6.dts
> new file mode 100644
> index 000000000000..3e3b36ad362a
> --- /dev/null
> +++ b/arch/arm/boot/dts/imx6q-skov-revc-lt6.dts
> @@ -0,0 +1,128 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +//
> +// Copyright (C) 2020 Pengutronix, Ulrich Oelmann <kernel@pengutronix.de>
> +
> +/dts-v1/;
> +#include "imx6q.dtsi"
> +#include "imx6qdl-skov-cpu.dtsi"
> +#include "imx6qdl-skov-cpu-revc.dtsi"
> +
> +/ {
> +	model = "SKOV IMX6 CPU QuadCore";
> +	compatible = "skov,imx6q-skov-revc-lt6", "fsl,imx6q";
> +
> +	backlight: backlight {
> +		compatible = "pwm-backlight";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_backlight>;
> +		enable-gpios = <&gpio6 23 GPIO_ACTIVE_LOW>;
> +		pwms = <&pwm2 0 20000 0>;
> +		brightness-levels = <0 255>;
> +		num-interpolated-steps = <17>;
> +		default-brightness-level = <8>;
> +		power-supply = <&reg_24v0>;
> +	};
> +
> +	display {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		compatible = "fsl,imx-parallel-display";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_ipu1>;
> +
> +		port@0 {
> +			reg = <0>;
> +
> +			display0_in: endpoint {
> +				remote-endpoint = <&ipu1_di0_disp0>;
> +			};
> +		};
> +
> +		port@1 {
> +			reg = <1>;
> +
> +			display0_out: endpoint {
> +				remote-endpoint = <&panel_in>;
> +			};
> +		};
> +	};
> +
> +	panel {
> +		compatible = "logictechno,lttd800480070-l6wh-rt";
> +		backlight = <&backlight>;
> +		power-supply = <&reg_3v3>;
> +
> +		port {
> +			panel_in: endpoint {
> +				remote-endpoint = <&display0_out>;
> +			};
> +		};
> +	};
> +};
> +
> +&hdmi {
> +	ddc-i2c-bus = <&i2c2>;
> +	status = "okay";
> +};
> +
> +&i2c2 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_i2c2>;
> +	clock-frequency = <100000>;
> +	status = "okay";
> +};
> +
> +&ipu1_di0_disp0 {
> +	remote-endpoint = <&display0_in>;
> +};
> +
> +&iomuxc {
> +	pinctrl_backlight: backlightgrp {
> +		fsl,pins = <
> +			MX6QDL_PAD_RGMII_TD3__GPIO6_IO23		0x58
> +		>;
> +	};
> +
> +	pinctrl_i2c2: i2c2grp {
> +		fsl,pins = <
> +			/* internal 22 k pull up required */
> +			MX6QDL_PAD_KEY_COL3__I2C2_SCL		0x4001F878
> +			/* internal 22 k pull up required */
> +			MX6QDL_PAD_KEY_ROW3__I2C2_SDA		0x4001F878
> +		>;
> +	};
> +
> +	pinctrl_ipu1: ipu1grp {
> +		fsl,pins = <
> +			MX6QDL_PAD_DI0_DISP_CLK__IPU1_DI0_DISP_CLK	0x10
> +			MX6QDL_PAD_DI0_PIN15__IPU1_DI0_PIN15		0x10
> +			MX6QDL_PAD_DI0_PIN2__IPU1_DI0_PIN02		0x10
> +			MX6QDL_PAD_DI0_PIN3__IPU1_DI0_PIN03		0x10
> +			MX6QDL_PAD_DISP0_DAT0__IPU1_DISP0_DATA00	0x10
> +			MX6QDL_PAD_DISP0_DAT1__IPU1_DISP0_DATA01	0x10
> +			MX6QDL_PAD_DISP0_DAT2__IPU1_DISP0_DATA02	0x10
> +			MX6QDL_PAD_DISP0_DAT3__IPU1_DISP0_DATA03	0x10
> +			MX6QDL_PAD_DISP0_DAT4__IPU1_DISP0_DATA04	0x10
> +			MX6QDL_PAD_DISP0_DAT5__IPU1_DISP0_DATA05	0x10
> +			MX6QDL_PAD_DISP0_DAT6__IPU1_DISP0_DATA06	0x10
> +			MX6QDL_PAD_DISP0_DAT7__IPU1_DISP0_DATA07	0x10
> +			MX6QDL_PAD_DISP0_DAT8__IPU1_DISP0_DATA08	0x10
> +			MX6QDL_PAD_DISP0_DAT9__IPU1_DISP0_DATA09	0x10
> +			MX6QDL_PAD_DISP0_DAT10__IPU1_DISP0_DATA10	0x10
> +			MX6QDL_PAD_DISP0_DAT11__IPU1_DISP0_DATA11	0x10
> +			MX6QDL_PAD_DISP0_DAT12__IPU1_DISP0_DATA12	0x10
> +			MX6QDL_PAD_DISP0_DAT13__IPU1_DISP0_DATA13	0x10
> +			MX6QDL_PAD_DISP0_DAT14__IPU1_DISP0_DATA14	0x10
> +			MX6QDL_PAD_DISP0_DAT15__IPU1_DISP0_DATA15	0x10
> +			MX6QDL_PAD_DISP0_DAT16__IPU1_DISP0_DATA16	0x10
> +			MX6QDL_PAD_DISP0_DAT17__IPU1_DISP0_DATA17	0x10
> +			MX6QDL_PAD_DISP0_DAT18__IPU1_DISP0_DATA18	0x10
> +			MX6QDL_PAD_DISP0_DAT19__IPU1_DISP0_DATA19	0x10
> +			MX6QDL_PAD_DISP0_DAT20__IPU1_DISP0_DATA20	0x10
> +			MX6QDL_PAD_DISP0_DAT21__IPU1_DISP0_DATA21	0x10
> +			MX6QDL_PAD_DISP0_DAT22__IPU1_DISP0_DATA22	0x10
> +			MX6QDL_PAD_DISP0_DAT23__IPU1_DISP0_DATA23	0x10
> +		>;
> +	};
> +};
> diff --git a/arch/arm/boot/dts/imx6q-skov-reve-mi1010ait-1cp1.dts b/arch/arm/boot/dts/imx6q-skov-reve-mi1010ait-1cp1.dts
> new file mode 100644
> index 000000000000..7f1f19b74bfa
> --- /dev/null
> +++ b/arch/arm/boot/dts/imx6q-skov-reve-mi1010ait-1cp1.dts
> @@ -0,0 +1,127 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +//
> +// Copyright (C) 2020 Pengutronix, Ulrich Oelmann <kernel@pengutronix.de>
> +
> +/dts-v1/;
> +#include "imx6q.dtsi"
> +#include "imx6qdl-skov-cpu.dtsi"
> +
> +/ {
> +	model = "SKOV IMX6 CPU QuadCore";
> +	compatible = "skov,imx6q-skov-reve-mi1010ait-1cp1", "fsl,imx6q";
> +
> +	backlight: backlight {
> +		compatible = "pwm-backlight";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_backlight>;
> +		enable-gpios = <&gpio6 23 GPIO_ACTIVE_LOW>;
> +		pwms = <&pwm2 0 20000 0>;
> +		brightness-levels = <0 255>;
> +		num-interpolated-steps = <17>;
> +		default-brightness-level = <8>;
> +		power-supply = <&reg_24v0>;
> +	};
> +
> +	panel {
> +		compatible = "multi-inno,mi1010ait-1cp";
> +		backlight = <&backlight>;
> +		power-supply = <&reg_3v3>;
> +
> +		port {
> +			panel_in: endpoint {
> +				remote-endpoint = <&lvds0_out>;
> +			};
> +		};
> +	};
> +};
> +
> +&clks {
> +	assigned-clocks = <&clks IMX6QDL_CLK_LDB_DI0_SEL>,
> +			  <&clks IMX6QDL_CLK_LDB_DI1_SEL>;
> +	assigned-clock-parents = <&clks IMX6QDL_CLK_PLL5_VIDEO_DIV>,
> +				 <&clks IMX6QDL_CLK_PLL5_VIDEO_DIV>;
> +};
> +
> +&hdmi {
> +	ddc-i2c-bus = <&i2c2>;
> +	status = "okay";
> +};
> +
> +&i2c1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_i2c1>;
> +	clock-frequency = <100000>;
> +	status = "okay";
> +
> +	touchscreen@38 {
> +		compatible = "edt,edt-ft5406";
> +		reg = <0x38>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_touchscreen>;
> +		interrupt-parent = <&gpio3>;
> +		interrupts = <19 IRQ_TYPE_EDGE_FALLING>;
> +		reset-gpios = <&gpio3 23 GPIO_ACTIVE_LOW>;
> +		touchscreen-size-x = <1280>;
> +		touchscreen-size-y = <800>;
> +		wakeup-source;
> +	};
> +};
> +
> +&i2c2 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_i2c2>;
> +	clock-frequency = <100000>;
> +	status = "okay";
> +};
> +
> +&ldb {
> +	status = "okay";
> +
> +	lvds-channel@0 {
> +		status = "okay";
> +
> +		port@4 {
> +			reg = <4>;
> +
> +			lvds0_out: endpoint {
> +				remote-endpoint = <&panel_in>;
> +			};
> +		};
> +	};
> +};
> +
> +&iomuxc {
> +	pinctrl_backlight: backlightgrp {
> +		fsl,pins = <
> +			MX6QDL_PAD_RGMII_TD3__GPIO6_IO23		0x58
> +		>;
> +	};
> +
> +	pinctrl_i2c1: i2c1grp {
> +		fsl,pins = <
> +			/* external 1 k pull up */
> +			MX6QDL_PAD_EIM_D21__I2C1_SCL		0x40010878
> +			/* external 1 k pull up */
> +			MX6QDL_PAD_EIM_D28__I2C1_SDA		0x40010878
> +		>;
> +	};
> +
> +	pinctrl_i2c2: i2c2grp {
> +		fsl,pins = <
> +			/* internal 22 k pull up required */
> +			MX6QDL_PAD_KEY_COL3__I2C2_SCL		0x4001F878
> +			/* internal 22 k pull up required */
> +			MX6QDL_PAD_KEY_ROW3__I2C2_SDA		0x4001F878
> +		>;
> +	};
> +
> +	pinctrl_touchscreen: touchscreengrp {
> +		fsl,pins = <
> +			/* external 10 k pull up */
> +			/* CTP_INT */
> +			MX6QDL_PAD_EIM_D19__GPIO3_IO19		0x1b0b0
> +			/* CTP_RST */
> +			MX6QDL_PAD_EIM_D23__GPIO3_IO23		0x1b0b0
> +		>;
> +	};
> +};
> diff --git a/arch/arm/boot/dts/imx6qdl-skov-cpu-revc.dtsi b/arch/arm/boot/dts/imx6qdl-skov-cpu-revc.dtsi
> new file mode 100644
> index 000000000000..6fb49f08c7ad
> --- /dev/null
> +++ b/arch/arm/boot/dts/imx6qdl-skov-cpu-revc.dtsi
> @@ -0,0 +1,58 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +//
> +// Copyright (C) 2020 Pengutronix, Ulrich Oelmann <kernel@pengutronix.de>
> +
> +&ecspi4 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_ecspi4>;
> +	cs-gpios = <&gpio3 20 GPIO_ACTIVE_LOW>;
> +	status = "okay";
> +
> +	touchscreen@0 {
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_touch>;
> +		compatible = "ti,tsc2046";
> +		reg = <0>;
> +		spi-max-frequency = <1000000>;
> +		interrupts-extended = <&gpio3 19 IRQ_TYPE_LEVEL_LOW>;
> +		vcc-supply  = <&reg_3v3>;
> +
> +		pendown-gpio = <&gpio3 19 GPIO_ACTIVE_LOW>;
> +
> +		ti,x-plate-ohms = /bits/ 16 <850>;
> +		ti,y-plate-ohms = /bits/ 16 <295>;
> +		ti,pressure-min = /bits/ 16 <2>;
> +		ti,pressure-max = /bits/ 16 <1500>;
> +		ti,vref-mv	= /bits/ 16 <3300>;
> +		ti,settle-delay-usec = /bits/ 16 <15>;
> +		ti,vref-delay-usecs = /bits/ 16 <0>;
> +		ti,penirq-recheck-delay-usecs = /bits/ 16 <100>;
> +		ti,debounce-max = /bits/ 16 <100>;
> +		ti,debounce-tol = /bits/ 16 <(~0)>;
> +		ti,debounce-rep = /bits/ 16 <4>;
> +
> +		touchscreen-swapped-x-y;
> +		touchscreen-inverted-y;
> +

Unnecessary newlines.

> +		linux,wakeup;

wakeup-source

> +	};
> +};
> +
> +&iomuxc {
> +	pinctrl_ecspi4: ecspi4grp {
> +		fsl,pins = <
> +			MX6QDL_PAD_EIM_D28__ECSPI4_MOSI			0x100b1
> +			MX6QDL_PAD_EIM_D22__ECSPI4_MISO			0x000b1
> +			MX6QDL_PAD_EIM_D21__ECSPI4_SCLK			0x000b1
> +			/* *no* external pull up */
> +			MX6QDL_PAD_EIM_D20__GPIO3_IO20		0x40000058
> +		>;
> +	};
> +
> +	pinctrl_touch: touchgrp {
> +		fsl,pins = <
> +			/* external pull up */
> +			MX6QDL_PAD_EIM_D19__GPIO3_IO19			0x10040
> +		>;
> +	};
> +};
> diff --git a/arch/arm/boot/dts/imx6qdl-skov-cpu.dtsi b/arch/arm/boot/dts/imx6qdl-skov-cpu.dtsi
> new file mode 100644
> index 000000000000..facaead06dea
> --- /dev/null
> +++ b/arch/arm/boot/dts/imx6qdl-skov-cpu.dtsi
> @@ -0,0 +1,476 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +//
> +// Copyright (C) 2020 Pengutronix, Ulrich Oelmann <kernel@pengutronix.de>
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/leds/common.h>
> +
> +/ {
> +	chosen {
> +		stdout-path = &uart2;
> +	};
> +
> +	aliases {
> +		can0 = &can1;
> +		can1 = &can2;
> +		nand = &gpmi;
> +		usb0 = &usbh1;
> +		usb1 = &usbotg;
> +		rtc0 = &i2c_rtc;
> +		rtc1 = &snvs;
> +		mdio-gpio0 = &mdio;

Sort them alphabetically.

> +	};
> +
> +	iio-hwmon {
> +		compatible = "iio-hwmon";
> +		io-channels = <&adc 0>, /* 24V */
> +		              <&adc 1>; /* temperature */
> +	};
> +
> +	leds {
> +		compatible = "gpio-leds";
> +
> +		led-0 {
> +			label = "D1";
> +			gpios = <&gpio1 2 GPIO_ACTIVE_HIGH>;
> +			function = LED_FUNCTION_STATUS;
> +			default-state = "on";
> +			linux,default-trigger = "heartbeat";
> +		};
> +
> +		led-1 {
> +			label = "D2";
> +			gpios = <&gpio1 0 GPIO_ACTIVE_HIGH>;
> +			default-state = "off";
> +		};
> +
> +		led-2 {
> +			label = "D3";
> +			gpios = <&gpio1 4 GPIO_ACTIVE_HIGH>;
> +			default-state = "on";
> +		};
> +	};
> +
> +	mdio: mdio {
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_mdio>;
> +		compatible = "microchip,mdio-smi0";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		gpios = <&gpio1 31 GPIO_ACTIVE_HIGH
> +			 &gpio1 22 GPIO_ACTIVE_HIGH>;
> +
> +		switch@3 {

unit-address doesn't match `reg` property.

> +			pinctrl-names = "default";
> +			pinctrl-0 = <&pinctrl_switch>;
> +			compatible = "microchip,ksz8873";
> +			interrupt-parent = <&gpio3>;
> +			interrupt = <30 IRQ_TYPE_LEVEL_HIGH>;
> +			reset-gpios = <&gpio1 5 GPIO_ACTIVE_LOW>;
> +			reg = <0>;
> +
> +

One newline is enough.

Shawn

> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				ports@0 {
> +					reg = <0>;
> +					phy-mode = "internal";
> +					label = "lan1";
> +				};
> +
> +				ports@1 {
> +					reg = <1>;
> +					phy-mode = "internal";
> +					label = "lan2";
> +				};
> +
> +				ports@2 {
> +					reg = <2>;
> +					label = "cpu";
> +					ethernet = <&fec>;
> +					phy-mode = "rmii";
> +
> +					fixed-link {
> +						speed = <100>;
> +						full-duplex;
> +					};
> +				};
> +			};
> +		};
> +
> +	};
> +
> +	clk50m_phy: phy-clock {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <50000000>;
> +	};
> +
> +	reg_3v3: regulator-3v3 {
> +		compatible = "regulator-fixed";
> +		vin-supply = <&reg_5v0>;
> +		regulator-name = "3v3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +	};
> +
> +	reg_5v0: regulator-5v0 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "5v0";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +	};
> +
> +	reg_24v0: regulator-24v0 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "24v0";
> +		regulator-min-microvolt = <24000000>;
> +		regulator-max-microvolt = <24000000>;
> +	};
> +
> +	reg_can1_stby: regulator-can1-stby {
> +		compatible = "regulator-fixed";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_can1_stby>;
> +		regulator-name = "can1-3v3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		gpio = <&gpio3 31 GPIO_ACTIVE_LOW>;
> +	};
> +
> +	reg_can2_stby: regulator-can2-stby {
> +		compatible = "regulator-fixed";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_can2_stby>;
> +		regulator-name = "can2-3v3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		gpio = <&gpio4 11 GPIO_ACTIVE_LOW>;
> +	};
> +
> +	reg_vcc_mmc: regulator-vcc-mmc {
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_vcc_mmc>;
> +		compatible = "regulator-fixed";
> +		vin-supply = <&reg_3v3>;
> +		regulator-name = "mmc_vcc_supply";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-always-on;
> +		regulator-boot-on;
> +		gpio = <&gpio7 8 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +		startup-delay-us = <100>;
> +	};
> +
> +	reg_vcc_mmc_io: regulator-vcc-mmc-io {
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_vcc_mmc_io>;
> +		compatible = "regulator-gpio";
> +		vin-supply = <&reg_5v0>;
> +		regulator-name = "mmc_io_supply";
> +		regulator-type = "voltage";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <3300000>;
> +		gpios = <&gpio7 13 GPIO_ACTIVE_HIGH>;
> +		states = <1800000 0x1>, <3300000 0x0>;
> +		startup-delay-us = <100>;
> +	};
> +};
> +
> +&can1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_can1>;
> +	xceiver-supply = <&reg_can1_stby>;
> +	status = "okay";
> +};
> +
> +&can2 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_can2>;
> +	xceiver-supply = <&reg_can2_stby>;
> +	status = "okay";
> +};
> +
> +&ecspi1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_ecspi1>;
> +	cs-gpios = <&gpio3 24 GPIO_ACTIVE_LOW>;
> +	status = "okay";
> +
> +	flash@0 {
> +		compatible = "jedec,spi-nor";
> +		spi-max-frequency = <54000000>;
> +		reg = <0>;
> +	};
> +};
> +
> +&ecspi2 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_ecspi2>;
> +	cs-gpios = <&gpio2 26 GPIO_ACTIVE_LOW>;
> +	status = "okay";
> +
> +	adc: adc@0 {
> +		compatible = "microchip,mcp3002";
> +		reg = <0>;
> +		spi-max-frequency = <1000000>;
> +		#io-channel-cells = <1>;
> +	};
> +};
> +
> +&fec {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_enet>;
> +	clocks = <&clks IMX6QDL_CLK_ENET>,
> +		 <&clks IMX6QDL_CLK_ENET>,
> +		 <&clk50m_phy>;
> +	clock-names = "ipg", "ahb", "ptp";
> +	phy-mode = "rmii";
> +	phy-supply = <&reg_3v3>;
> +	status = "okay";
> +
> +	fixed-link {
> +		speed = <100>;
> +		full-duplex;
> +	};
> +};
> +
> +&gpmi {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_gpmi_nand>;
> +	nand-on-flash-bbt;
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	status = "okay";
> +};
> +
> +&i2c3 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_i2c3>;
> +	clock-frequency = <400000>;
> +	status = "okay";
> +
> +	i2c_rtc: rtc@51 {
> +		compatible = "nxp,pcf85063";
> +		reg = <0x51>;
> +		quartz-load-femtofarads = <12500>;
> +	};
> +};
> +
> +&pwm2 {
> +	#pwm-cells = <2>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_pwm2>;
> +	status = "okay";
> +};
> +
> +&pwm3 {
> +	/* used for LCD contrast control */
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_pwm3>;
> +	status = "okay";
> +};
> +
> +&uart2 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_uart2>;
> +	status = "okay";
> +};
> +
> +&usbh1 {
> +	vbus-supply = <&reg_5v0>;
> +	disable-over-current;
> +	status = "okay";
> +};
> +
> +/* no usbh2 */
> +&usbphynop1 {
> +	status = "disabled";
> +};
> +
> +/* no usbh3 */
> +&usbphynop2 {
> +	status = "disabled";
> +};
> +
> +&usbotg {
> +	vbus-supply = <&reg_5v0>;
> +	disable-over-current;
> +	status = "okay";
> +};
> +
> +&usdhc3 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_usdhc3>;
> +	wp-gpios = <&gpio7 1 GPIO_ACTIVE_HIGH>;
> +	cd-gpios = <&gpio7 0 GPIO_ACTIVE_LOW>;
> +	cap-power-off-card;
> +	full-pwr-cycle;
> +	bus-width = <4>;
> +	max-frequency = <50000000>;
> +	cap-sd-highspeed;
> +	sd-uhs-sdr12;
> +	sd-uhs-sdr25;
> +	sd-uhs-sdr50;
> +	sd-uhs-ddr50;
> +	mmc-ddr-1_8v;
> +	vmmc-supply = <&reg_vcc_mmc>;
> +	vqmmc-supply = <&reg_vcc_mmc_io>;
> +	status = "okay";
> +};
> +
> +&iomuxc {
> +	pinctrl_can1: can1grp {
> +		fsl,pins = <
> +			MX6QDL_PAD_GPIO_7__FLEXCAN1_TX			0x3008
> +			MX6QDL_PAD_GPIO_8__FLEXCAN1_RX			0x1b000
> +		>;
> +	};
> +
> +	pinctrl_can1_stby: can1stbygrp {
> +		fsl,pins = <
> +			MX6QDL_PAD_EIM_D31__GPIO3_IO31			0x13008
> +		>;
> +	};
> +
> +	pinctrl_can2: can2grp {
> +		fsl,pins = <
> +			MX6QDL_PAD_KEY_COL4__FLEXCAN2_TX		0x3008
> +			MX6QDL_PAD_KEY_ROW4__FLEXCAN2_RX		0x1b000
> +		>;
> +	};
> +
> +	pinctrl_can2_stby: can2stbygrp {
> +		fsl,pins = <
> +			MX6QDL_PAD_KEY_ROW2__GPIO4_IO11			0x13008
> +		>;
> +	};
> +
> +	pinctrl_ecspi1: ecspi1grp {
> +		fsl,pins = <
> +			MX6QDL_PAD_EIM_D17__ECSPI1_MISO			0x100b1
> +			MX6QDL_PAD_EIM_D18__ECSPI1_MOSI			0xb1
> +			MX6QDL_PAD_EIM_D16__ECSPI1_SCLK			0xb1
> +			/* *no* external pull up */
> +			MX6QDL_PAD_EIM_D24__GPIO3_IO24			0x58
> +		>;
> +	};
> +
> +	pinctrl_ecspi2: ecspi2grp {
> +		fsl,pins = <
> +			MX6QDL_PAD_EIM_OE__ECSPI2_MISO			0x100b1
> +			MX6QDL_PAD_EIM_CS1__ECSPI2_MOSI			0xb1
> +			MX6QDL_PAD_EIM_CS0__ECSPI2_SCLK			0xb1
> +			/* external pull up */
> +			MX6QDL_PAD_EIM_RW__GPIO2_IO26			0x58
> +		>;
> +	};
> +
> +	pinctrl_enet: enetgrp {
> +		fsl,pins = <
> +			/* RMII 50 MHz */
> +			MX6QDL_PAD_ENET_CRS_DV__ENET_RX_EN		0x100f5
> +			MX6QDL_PAD_ENET_TX_EN__ENET_TX_EN		0x100f5
> +			MX6QDL_PAD_ENET_RXD0__ENET_RX_DATA0		0x100c0
> +			MX6QDL_PAD_ENET_RXD1__ENET_RX_DATA1		0x100c0
> +			MX6QDL_PAD_ENET_TXD0__ENET_TX_DATA0		0x100f5
> +			MX6QDL_PAD_ENET_TXD1__ENET_TX_DATA1		0x100f5
> +			MX6QDL_PAD_GPIO_16__ENET_REF_CLK		0x1b0b0
> +			MX6QDL_PAD_GPIO_5__GPIO1_IO05			0x58
> +			/* GPIO for "link active" */
> +			MX6QDL_PAD_ENET_RX_ER__GPIO1_IO24		0x3038
> +		>;
> +	};
> +
> +	pinctrl_gpmi_nand: gpminandgrp {
> +		fsl,pins = <
> +			MX6QDL_PAD_NANDF_CLE__NAND_CLE			0xb0b1
> +			MX6QDL_PAD_NANDF_ALE__NAND_ALE			0xb0b1
> +			MX6QDL_PAD_NANDF_RB0__NAND_READY_B		0xb000
> +			MX6QDL_PAD_NANDF_CS0__NAND_CE0_B		0xb0b1
> +			MX6QDL_PAD_NANDF_CS1__NAND_CE1_B		0xb0b1
> +			MX6QDL_PAD_SD4_CMD__NAND_RE_B			0xb0b1
> +			MX6QDL_PAD_SD4_CLK__NAND_WE_B			0xb0b1
> +			MX6QDL_PAD_NANDF_D0__NAND_DATA00		0xb0b1
> +			MX6QDL_PAD_NANDF_D1__NAND_DATA01		0xb0b1
> +			MX6QDL_PAD_NANDF_D2__NAND_DATA02		0xb0b1
> +			MX6QDL_PAD_NANDF_D3__NAND_DATA03		0xb0b1
> +			MX6QDL_PAD_NANDF_D4__NAND_DATA04		0xb0b1
> +			MX6QDL_PAD_NANDF_D5__NAND_DATA05		0xb0b1
> +			MX6QDL_PAD_NANDF_D6__NAND_DATA06		0xb0b1
> +			MX6QDL_PAD_NANDF_D7__NAND_DATA07		0xb0b1
> +		>;
> +	};
> +
> +	pinctrl_i2c3: i2c3grp {
> +		fsl,pins = <
> +			/* external 10 k pull up */
> +			MX6QDL_PAD_GPIO_3__I2C3_SCL		0x40010878
> +			/* external 10 k pull up */
> +			MX6QDL_PAD_GPIO_6__I2C3_SDA		0x40010878
> +		>;
> +	};
> +
> +	pinctrl_mdio: mdiogrp {
> +		fsl,pins = <
> +			MX6QDL_PAD_ENET_MDIO__GPIO1_IO22		0x100b1
> +			MX6QDL_PAD_ENET_MDC__GPIO1_IO31			0xb1
> +		>;
> +	};
> +
> +	pinctrl_pwm2: pwm2grp {
> +		fsl,pins = <
> +			MX6QDL_PAD_GPIO_1__PWM2_OUT			0x58
> +		>;
> +	};
> +
> +	pinctrl_pwm3: pwm3grp {
> +		fsl,pins = <
> +			MX6QDL_PAD_SD1_DAT1__PWM3_OUT			0x58
> +		>;
> +	};
> +
> +	pinctrl_switch: switchgrp {
> +		fsl,pins = <
> +			MX6QDL_PAD_EIM_D30__GPIO3_IO30			0xb0
> +		>;
> +	};
> +
> +	pinctrl_uart2: uart2grp {
> +		fsl,pins = <
> +			MX6QDL_PAD_EIM_D26__UART2_TX_DATA		0x1b0b1
> +			MX6QDL_PAD_EIM_D27__UART2_RX_DATA		0x1b0b1
> +		>;
> +	};
> +
> +	pinctrl_usdhc3: usdhc3grp {
> +		fsl,pins = <
> +			/* SoC internal pull up required */
> +			MX6QDL_PAD_SD3_CMD__SD3_CMD			0x17059
> +			MX6QDL_PAD_SD3_CLK__SD3_CLK			0x10059
> +			MX6QDL_PAD_SD3_DAT0__SD3_DATA0			0x17059
> +			MX6QDL_PAD_SD3_DAT1__SD3_DATA1			0x17059
> +			MX6QDL_PAD_SD3_DAT2__SD3_DATA2			0x17059
> +			MX6QDL_PAD_SD3_DAT3__SD3_DATA3			0x17059
> +			/* SoC internal pull up required */
> +			MX6QDL_PAD_SD3_DAT4__GPIO7_IO01			0x1b040
> +			/* SoC internal pull up required */
> +			MX6QDL_PAD_SD3_DAT5__GPIO7_IO00			0x1b040
> +		>;
> +	};
> +
> +	pinctrl_vcc_mmc: vccmmcgrp {
> +		fsl,pins = <
> +			MX6QDL_PAD_SD3_RST__GPIO7_IO08			0x58
> +		>;
> +	};
> +
> +	pinctrl_vcc_mmc_io: vccmmciogrp {
> +		fsl,pins = <
> +			MX6QDL_PAD_GPIO_18__GPIO7_IO13			0x58
> +		>;
> +	};
> +};
> -- 
> 2.29.2
> 
