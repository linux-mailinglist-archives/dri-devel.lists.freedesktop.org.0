Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E41B2B941
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 08:15:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF7EE10E52C;
	Tue, 19 Aug 2025 06:15:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="lodMiCYV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 677 seconds by postgrey-1.36 at gabe;
 Tue, 19 Aug 2025 05:13:51 UTC
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E61E310E201
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 05:13:51 +0000 (UTC)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
 by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57J5DjN32877046;
 Tue, 19 Aug 2025 00:13:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1755580425;
 bh=q/J2e/97iLeOVZpZVA2dcsZwPcEVfVPsZOvv4OMkX38=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=lodMiCYVnIUKwyVxluoBLe6IFVO2c3nvLPNbchx0jJRCZrRbHZ1XHZNVre6Gm6dgW
 UE3o0zhAbudkfjTwqlpIzPh/vlD1m70Es4TVah1Sb0GFsR/0BFAlnD1Jx2kvCzax2w
 QCQ6U93XVttxEvDNKH370z+gUaoR6Ib/+t99/3Fo=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
 by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57J5DjSe348652
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
 Tue, 19 Aug 2025 00:13:45 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 19
 Aug 2025 00:13:45 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 19 Aug 2025 00:13:44 -0500
Received: from [172.24.20.139] (lt5cd2489kgj.dhcp.ti.com [172.24.20.139])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57J5Dcr32458594;
 Tue, 19 Aug 2025 00:13:39 -0500
Message-ID: <f6b5f409-6d01-49aa-82db-38dac2d44380@ti.com>
Date: Tue, 19 Aug 2025 10:43:38 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 3/3] arm64: dts: ti: k3-j721e-beagleboneai64: Add DSI
 RPi Panel
To: Harikrishna Shenoy <h-shenoy@ti.com>, <neil.armstrong@linaro.org>,
 <jessica.zhang@oss.qualcomm.com>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <robh@kernel.org>,
 <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>,
 <vigneshr@ti.com>, <kristo@kernel.org>, <thierry.reding@gmail.com>,
 <sam@ravnborg.org>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC: <s-jain1@ti.com>, <devarsht@ti.com>, <u-kumar1@ti.com>
References: <20250818154746.1373656-1-h-shenoy@ti.com>
 <20250818154746.1373656-4-h-shenoy@ti.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20250818154746.1373656-4-h-shenoy@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-Mailman-Approved-At: Tue, 19 Aug 2025 06:15:29 +0000
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


On 8/18/2025 9:17 PM, Harikrishna Shenoy wrote:
> Add support for R-Pi DSI Panel for BBAI64.
>
> The RPi DSI panel[0] uses Toshiba TC358762 for decoding the DSI video
> signals back to DPI for its consumption. It has an ATTINY88-based
> regulator and backlight controller, and also features an EDT-FT5406
> touch controller.
>
> Fix DSS ports node in BeagkeBone AI-64 DTS by adding explicit `port@0`

Please post Fix as different patch and use Fixes tag


> child node instead of an unlabelled port, to align with dss_ports schema
> used in overlay.
>
> [0]: https://www.raspberrypi.com/products/raspberry-pi-touch-display/
>
> Signed-off-by: Rahul T R <r-ravikumar@ti.com>
> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
> Signed-off-by: Harikrishna Shenoy <h-shenoy@ti.com>
> ---
>   arch/arm64/boot/dts/ti/Makefile               |   4 +
>   ...1e-beagleboneai64-dsi-rpi-7inch-panel.dtso | 141 ++++++++++++++++++
>   .../boot/dts/ti/k3-j721e-beagleboneai64.dts   |   7 +-
>   3 files changed, 151 insertions(+), 1 deletion(-)
>   create mode 100644 arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64-dsi-rpi-7inch-panel.dtso
>
> diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
> index aad9177930e6..25cf12ebccce 100644
> --- a/arch/arm64/boot/dts/ti/Makefile
> +++ b/arch/arm64/boot/dts/ti/Makefile
> @@ -114,6 +114,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-j7200-evm-pcie1-ep.dtbo
>   # Boards with J721e SoC
>   k3-j721e-evm-dtbs := k3-j721e-common-proc-board.dtb k3-j721e-evm-quad-port-eth-exp.dtbo
>   dtb-$(CONFIG_ARCH_K3) += k3-j721e-beagleboneai64.dtb
> +dtb-$(CONFIG_ARCH_K3) += k3-j721e-beagleboneai64-dsi-rpi-7inch-panel.dtbo
>   dtb-$(CONFIG_ARCH_K3) += k3-j721e-common-proc-board-infotainment.dtbo
>   dtb-$(CONFIG_ARCH_K3) += k3-j721e-evm.dtb
>   dtb-$(CONFIG_ARCH_K3) += k3-j721e-evm-gesi-exp-board.dtbo
> @@ -220,6 +221,8 @@ k3-am69-sk-pcie0-ep-dtbs := k3-am69-sk.dtb \
>   	k3-am69-sk-pcie0-ep.dtbo
>   k3-j7200-evm-pcie1-ep-dtbs := k3-j7200-common-proc-board.dtb \
>   	k3-j7200-evm-pcie1-ep.dtbo
> +k3-j721e-beagleboneai64-dsi-rpi-7inch-panel-dtbs := k3-j721e-beagleboneai64.dtb \
> +	k3-j721e-beagleboneai64-dsi-rpi-7inch-panel.dtbo
>   k3-j721e-common-proc-board-infotainment-dtbs := k3-j721e-common-proc-board.dtb \
>   	k3-j721e-common-proc-board-infotainment.dtbo
>   k3-j721e-evm-pcie0-ep-dtbs := k3-j721e-common-proc-board.dtb \
> @@ -267,6 +270,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
>   	k3-am69-sk-csi2-dual-imx219.dtb \
>   	k3-am69-sk-pcie0-ep.dtb \
>   	k3-j7200-evm-pcie1-ep.dtb \
> +	k3-j721e-beagleboneai64-dsi-rpi-7inch-panel.dtb \
>   	k3-j721e-common-proc-board-infotainment.dtb \
>   	k3-j721e-evm-pcie0-ep.dtb \
>   	k3-j721e-evm-pcie1-ep.dtb \
> diff --git a/arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64-dsi-rpi-7inch-panel.dtso b/arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64-dsi-rpi-7inch-panel.dtso
> new file mode 100644
> index 000000000000..c3506ccf60a4
> --- /dev/null
> +++ b/arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64-dsi-rpi-7inch-panel.dtso
> @@ -0,0 +1,141 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
> +/**
> + * DT Overlay for RPi 7inch touchscreen panel interfaced with DSI on
> + * J721E based BeagleBone AI-64 (BBAI-64) platform.
> + *
> + * BBAI-64: https://www.beagleboard.org/boards/beaglebone-ai-64
> + * RPi DSI Panel: https://www.raspberrypi.com/products/raspberry-pi-touch-display/
> + *
> + * Copyright (C) 2024 Texas Instruments Incorporated - https://www.ti.com/

2025


> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +
> +#include "k3-pinctrl.h"
> +
> +&{/} {
> +	bridge_reg: bridge-regulator {
> +		compatible = "regulator-fixed";
> +		regulator-name = "bridge-reg";
> +		vin-supply = <&display_reg>;
> +		enable-active-high;
> +	};
> +
> +	panel0 {
> +		compatible = "rpi,7inch-dsi";
> +		power-supply = <&display_reg>;
> +		port {
> +			panel_in: endpoint {
> +				remote-endpoint = <&panel_bridge_out>;
> +			};
> +		};
> +	};
> +};
> +
> +&main_pmx0 {
> +	dsi_main_i2c4_pins: dsi-main-i2c4-pins {
> +		pinctrl-single,pins = <
> +			J721E_IOPAD(0xa8, PIN_INPUT_PULLUP, 2) /* (AD19) PRG1_MDIO0_MDIO.I2C4_SCL */

Clock is out signal from SOC, Please check second parameter


> +			J721E_IOPAD(0xac, PIN_INPUT_PULLUP, 2) /* (AD18) PRG1_MDIO0_MDC.I2C4_SDA */
> +		>;
> +	};
> +};
> +
> +&main_i2c4 {
> +	clock-frequency = <400000>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&dsi_main_i2c4_pins>;
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	display_reg: regulator@45 {
> +		compatible = "raspberrypi,7inch-touchscreen-panel-regulator";
> +		reg = <0x45>;
> +	};
> +
> +	touch-controller@38 {
> +		compatible = "edt,edt-ft5406";
> +		reg = <0x38>;
> +
> +		touchscreen-size-x = < 800 >;
> +		touchscreen-size-y = < 480 >;

space in 800 and 480


> +
> +		vcc-supply = <&display_reg>;

see, if you need reset-gpio as well


> +		interrupts-extended = <&main_gpio0 0 IRQ_TYPE_NONE>;
> +
> +		touchscreen-inverted-x;
> +		touchscreen-inverted-y;
> +	};
> +};
> +
> +&dss_ports {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	port@2 {
> +		reg = <2>;
> +
> +		dpi2_out: endpoint {
> +			remote-endpoint = <&dsi0_in>;
> +		};
> +	};
> +};
> +
> +&dphy2 {
> +	status = "okay";
> +};
> +
> +&dsi0 {
> +	status = "okay";
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		port@0 {
> +			reg = <0>;
> +			dsi0_out: endpoint {
> +				remote-endpoint = <&panel_bridge_in>;
> +			};
> +		};
> +
> +		port@1 {
> +			reg = <1>;
> +			dsi0_in: endpoint {
> +				remote-endpoint = <&dpi2_out>;
> +			};
> +		};
> +	};
> +
> +	bridge@0 {
> +		compatible = "toshiba,tc358762";
> +		reg = <0>;
> +		vddc-supply = <&bridge_reg>;
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +				panel_bridge_in: endpoint {
> +					remote-endpoint = <&dsi0_out>;
> +				};
> +			};
> +
> +			port@1 {
> +				reg = <1>;
> +				panel_bridge_out: endpoint {
> +					remote-endpoint = <&panel_in>;
> +				};
> +			};
> +		};
> +	};
> +};
> +
> +
> diff --git a/arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dts b/arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dts
> index fb899c99753e..c85317cbff7d 100644
> --- a/arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dts
> +++ b/arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dts
> @@ -804,7 +804,12 @@ &dss {
>   };
>   
>   &dss_ports {
> -	port {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	port@0 {
> +		reg= <0>;
> +
>   		dpi0_out: endpoint {
>   			remote-endpoint = <&dp0_in>;
>   		};
