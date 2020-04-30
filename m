Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 158D21C0E9B
	for <lists+dri-devel@lfdr.de>; Fri,  1 May 2020 09:22:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4E106EA6B;
	Fri,  1 May 2020 07:22:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 843826EB6E
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Apr 2020 08:25:52 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03U8GZlw019676; Thu, 30 Apr 2020 10:25:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=AgwtxmXh4XydGVhKKnsS3soSU7zI6VuGSCjnBfnZ/7M=;
 b=cglRJBlVhgf7erH2Vypi/IpsCs6EuKxf6HSn1Y61vYKQVJOiSkzGXVxqDezB8zh+3icD
 lSOn3+OeqKx9+pO+1lSgZEei9ASdqPXfN4qx7SvTKVyOGwEHz3OLRgqhbNA9ae4yj6yf
 UnADnke0oMgekyQpsBE3tCCNRgfNyAmAcZ2NJr7H68GV+qMyxLVHd0xDOSlX0PqiYgvL
 qVT/5UrJdR/181R4ipc7B1gZm+EkNjRwFi++A/nJpwOioQHdVkp39mEIvfYmhrJFHQyF
 xf1Xw+5C13snH5bTLA5nH4EkU2duxLrzuVeqDVmqbPc62ponWF47wOSSF5m5tJeYH69a ag== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30mhjx2yxu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Apr 2020 10:25:39 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id ABE2810002A;
 Thu, 30 Apr 2020 10:25:37 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 807CA2AD2D3;
 Thu, 30 Apr 2020 10:25:37 +0200 (CEST)
Received: from lmecxl0912.tpe.st.com (10.75.127.44) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 30 Apr
 2020 10:25:28 +0200
Subject: Re: [PATCH] add drm panel driver for stm32f429-dicovery board the
 change details:
To: <dillon.minfei@gmail.com>, <mcoquelin.stm32@gmail.com>
References: <1588234079-4157-1-git-send-email-dillon.minfei@gmail.com>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <6f9e51d0-118b-e592-e2c9-4aad72b97910@st.com>
Date: Thu, 30 Apr 2020 10:25:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1588234079-4157-1-git-send-email-dillon.minfei@gmail.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG5NODE3.st.com (10.75.127.15) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-30_03:2020-04-30,
 2020-04-30 signatures=0
X-Mailman-Approved-At: Fri, 01 May 2020 07:22:25 +0000
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
Cc: devicetree@vger.kernel.org, dillonhua@gmail.com, airlied@linux.ie,
 mturquette@baylibre.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, sboyd@kernel.org, robh+dt@kernel.org,
 thierry.reding@gmail.com, broonie@kernel.org, dillon.min@gmail.com,
 sam@ravnborg.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

You have first to split this patch in several patches and add relevant 
people in TO&CC (using get_maintainer script) for each patch. Quickly, 
you should at least have 4 patches (DT, clock driver, spi driver and drm 
). Then review will be more efficient.

regards
Alexandre

On 4/30/20 10:07 AM, dillon.minfei@gmail.com wrote:
> From: dillon min <dillon.minfei@gmail.com>
> 
> 1) add support drm ili9341 panel driver connect to ltdc
> 
> 2) add i2c3/spi5 ltdc pins dts configuration for gyro/stmpe
> 
> 3) add SPI_SIMPLEX_RX/SPI_3WIRE_RX in spi-stm32f4.c
>     for SPI_SIMPLEX_RX , as we running kernel in sdram, so
>     that the performance is not as good as internal flash,
>     need add send dummy data out while in rx,
>     otherwise will get many overrun errors.
> 
> 4) fix hang bugs durning ltdc driver load , in clk-stm32f4.c
>     store clk_hw to the wrong offset PLL_VCO_SAI, PLL_VCO_I2S
> 
> 5) add CLK_IGNORE_UNUSED for ltdc, otherwise system will close
>     ltdc clk
> 
> =======================
> 
> Signed-off-by: dillon min <dillon.minfei@gmail.com>
> ---
>   .../bindings/display/panel/ilitek,ili9341.txt      |  43 ++
>   arch/arm/boot/dts/stm32f4-pinctrl.dtsi             |  79 +++
>   arch/arm/boot/dts/stm32f429-disco.dts              |  88 ++++
>   arch/arm/boot/dts/stm32f429.dtsi                   |  12 +
>   drivers/clk/clk-stm32f4.c                          |   7 +-
>   drivers/gpu/drm/panel/Kconfig                      |   8 +
>   drivers/gpu/drm/panel/Makefile                     |   1 +
>   drivers/gpu/drm/panel/panel-ilitek-ili9341.c       | 561 +++++++++++++++++++++
>   drivers/spi/spi-stm32.c                            |  26 +-
>   9 files changed, 818 insertions(+), 7 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/display/panel/ilitek,ili9341.txt
>   create mode 100644 drivers/gpu/drm/panel/panel-ilitek-ili9341.c
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.txt b/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.txt
> new file mode 100644
> index 0000000..a03825f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.txt
> @@ -0,0 +1,43 @@
> +Ilitek ILI9341 TFT panel driver with SPI control bus
> +
> +This is a driver for 320x240 TFT panels, accepting a rgb input
> +streams that get adapted and scaled to the panel.
> +VCOMH outputs.
> +
> +Required properties:
> +  - compatible: "stm32f429-disco,ltdc-panel", "ilitek,ili9341"
> +    (full system-specific compatible is always required to look up configuration)
> +  - reg: address of the panel on the SPI bus
> +
> +Optional properties:
> +  - reset-gpios: a GPIO spec for the reset pin, see gpio/gpio.txt
> +  - dc-gpios: a GPIO spec for the dc pin, see gpio/gpio.txt
> +
> +  The following optional properties only apply to RGB input mode:
> +
> +  - pixelclk-active: see display/panel/display-timing.txt
> +  - de-active: see display/panel/display-timing.txt
> +  - hsync-active: see display/panel/display-timing.txt
> +  - vsync-active: see display/panel/display-timing.txt
> +
> +The panel must obey the rules for a SPI slave device as specified in
> +spi/spi-bus.txt
> +
> +The device node can contain one 'port' child node with one child
> +'endpoint' node, according to the bindings defined in
> +media/video-interfaces.txt. This node should describe panel's video bus.
> +
> +Example:
> +
> +panel: display@0 {
> +	compatible = "stm32f429-disco,ltdc-panel", "ilitek,ili9341";
> +	reg = <0>;
> +	spi-3wire;
> +	spi-max-frequency = <10000000>;
> +	dc-gpios = <&gpiod 13 0>;
> +	port {
> +		panel_in: endpoint {
> +			remote-endpoint = <&display_out>;
> +		};
> +	};
> +};
> diff --git a/arch/arm/boot/dts/stm32f4-pinctrl.dtsi b/arch/arm/boot/dts/stm32f4-pinctrl.dtsi
> index 392fa14..45b68f4 100644
> --- a/arch/arm/boot/dts/stm32f4-pinctrl.dtsi
> +++ b/arch/arm/boot/dts/stm32f4-pinctrl.dtsi
> @@ -316,6 +316,85 @@
>   				};
>   			};
>   
> +			ltdc_pins_f429_disco: ltdc-1 {
> +				pins {
> +					pinmux = <STM32_PINMUX('C', 6,  AF14)>,
> +						/* LCD_HSYNC */
> +						 <STM32_PINMUX('A', 4,  AF14)>,
> +						 /* LCD_VSYNC */
> +						 <STM32_PINMUX('G', 7,  AF14)>,
> +						 /* LCD_CLK */
> +						 <STM32_PINMUX('C', 10, AF14)>,
> +						 /* LCD_R2 */
> +						 <STM32_PINMUX('B', 0,  AF9)>,
> +						 /* LCD_R3 */
> +						 <STM32_PINMUX('A', 11, AF14)>,
> +						 /* LCD_R4 */
> +						 <STM32_PINMUX('A', 12, AF14)>,
> +						 /* LCD_R5 */
> +						 <STM32_PINMUX('B', 1,  AF9)>,
> +						 /* LCD_R6*/
> +						 <STM32_PINMUX('G', 6,  AF14)>,
> +						 /* LCD_R7 */
> +						 <STM32_PINMUX('A', 6,  AF14)>,
> +						 /* LCD_G2 */
> +						 <STM32_PINMUX('G', 10, AF9)>,
> +						 /* LCD_G3 */
> +						 <STM32_PINMUX('B', 10, AF14)>,
> +						 /* LCD_G4 */
> +						 <STM32_PINMUX('D', 6,  AF14)>,
> +						 /* LCD_B2 */
> +						 <STM32_PINMUX('G', 11, AF14)>,
> +						 /* LCD_B3*/
> +						 <STM32_PINMUX('B', 11, AF14)>,
> +						 /* LCD_G5 */
> +						 <STM32_PINMUX('C', 7,  AF14)>,
> +						 /* LCD_G6 */
> +						 <STM32_PINMUX('D', 3,  AF14)>,
> +						 /* LCD_G7 */
> +						 <STM32_PINMUX('G', 12, AF9)>,
> +						 /* LCD_B4 */
> +						 <STM32_PINMUX('A', 3,  AF14)>,
> +						 /* LCD_B5 */
> +						 <STM32_PINMUX('B', 8,  AF14)>,
> +						 /* LCD_B6 */
> +						 <STM32_PINMUX('B', 9,  AF14)>,
> +						 /* LCD_B7 */
> +						 <STM32_PINMUX('F', 10, AF14)>;
> +						 /* LCD_DE */
> +					slew-rate = <2>;
> +				};
> +			};
> +
> +			i2c3_pins: i2c3-0 {
> +				pins {
> +					pinmux = <STM32_PINMUX('C', 9, AF4)>,
> +						/* I2C3_SDA */
> +						 <STM32_PINMUX('A', 8, AF4)>;
> +						/* I2C3_SCL */
> +					bias-disable;
> +					drive-open-drain;
> +					slew-rate = <3>;
> +				};
> +			};
> +
> +			spi5_pins: spi5-0 {
> +				pins1 {
> +					pinmux = <STM32_PINMUX('F', 7, AF5)>,
> +						/* SPI5_CLK */
> +						 <STM32_PINMUX('F', 9, AF5)>;
> +						/* SPI5_MOSI */
> +					bias-disable;
> +					drive-push-pull;
> +					slew-rate = <0>;
> +				};
> +				pins2 {
> +					pinmux = <STM32_PINMUX('F', 8, AF5)>;
> +						/* SPI5_MISO */
> +					bias-disable;
> +				};
> +			};
> +
>   			dcmi_pins: dcmi-0 {
>   				pins {
>   					pinmux = <STM32_PINMUX('A', 4, AF13)>, /* DCMI_HSYNC */
> diff --git a/arch/arm/boot/dts/stm32f429-disco.dts b/arch/arm/boot/dts/stm32f429-disco.dts
> index 30c0f67..55eed05 100644
> --- a/arch/arm/boot/dts/stm32f429-disco.dts
> +++ b/arch/arm/boot/dts/stm32f429-disco.dts
> @@ -49,6 +49,8 @@
>   #include "stm32f429.dtsi"
>   #include "stm32f429-pinctrl.dtsi"
>   #include <dt-bindings/input/input.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/gpio/gpio.h>
>   
>   / {
>   	model = "STMicroelectronics STM32F429i-DISCO board";
> @@ -98,6 +100,14 @@
>   		regulator-name = "vcc5_host1";
>   		regulator-always-on;
>   	};
> +
> +	reg_3p3v: regulator-3p3v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "3P3V";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-always-on;
> +	};
>   };
>   
>   &clk_hse {
> @@ -127,3 +137,81 @@
>   	pinctrl-names = "default";
>   	status = "okay";
>   };
> +
> +&ltdc {
> +	status = "okay";
> +	pinctrl-0 = <&ltdc_pins_f429_disco>;
> +	pinctrl-names = "default";
> +
> +	port {
> +		ltdc_out_rgb: endpoint {
> +			remote-endpoint = <&panel_in_rgb>;
> +		};
> +	};
> +};
> +
> +&spi5 {
> +	status = "okay";
> +	pinctrl-0 = <&spi5_pins>;
> +	pinctrl-names = "default";
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	cs-gpios = <&gpioc 1 GPIO_ACTIVE_LOW>,<&gpioc 2 GPIO_ACTIVE_LOW>;
> +	dmas = <&dma2 3 2 0x400 0x0>,
> +	       <&dma2 4 2 0x400 0x0>;
> +	dma-names = "rx", "tx";
> +	l3gd20: l3gd20@0 {
> +		compatible = "st,l3gd20-gyro";
> +		spi-max-frequency = <10000000>;
> +		st,drdy-int-pin = <2>;
> +		interrupt-parent = <&gpioa>;
> +		interrupts = <1 IRQ_TYPE_EDGE_RISING>,
> +				<2 IRQ_TYPE_EDGE_RISING>;
> +		reg = <0>;
> +		vddio = <&reg_3p3v>;
> +		vdd = <&reg_3p3v>;
> +		status = "okay";
> +	};
> +	display: display@1{
> +		/* Connect panel-ilitek-9341 to ltdc */
> +		compatible = "stm32f429-disco,ltdc-panel", "ilitek,ili9341";
> +		reg = <1>;
> +		spi-3wire;
> +		spi-max-frequency = <10000000>;
> +		dc-gpios = <&gpiod 13 0>;
> +		port {
> +			panel_in_rgb: endpoint {
> +			remote-endpoint = <&ltdc_out_rgb>;
> +			};
> +		};
> +	};
> +};
> +
> +&i2c3 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c3_pins>;
> +	status = "okay";
> +
> +	touch: stmpe811@41 {
> +		compatible = "st,stmpe811";
> +		reg = <0x41>;
> +		interrupts = <15 IRQ_TYPE_EDGE_FALLING>;
> +		interrupt-parent = <&gpioa>;
> +		vio = <&reg_3p3v>;
> +		vcc = <&reg_3p3v>;
> +		status = "okay";
> +
> +		stmpe_touchscreen {
> +			compatible = "st,stmpe-ts";
> +			st,sample-time = <4>;
> +			st,mod-12b = <1>;
> +			st,ref-sel = <0>;
> +			st,adc-freq = <1>;
> +			st,ave-ctrl = <1>;
> +			st,touch-det-delay = <2>;
> +			st,settling = <2>;
> +			st,fraction-z = <7>;
> +			st,i-drive = <1>;
> +		};
> +	};
> +};
> diff --git a/arch/arm/boot/dts/stm32f429.dtsi b/arch/arm/boot/dts/stm32f429.dtsi
> index d777069..257b843 100644
> --- a/arch/arm/boot/dts/stm32f429.dtsi
> +++ b/arch/arm/boot/dts/stm32f429.dtsi
> @@ -402,6 +402,18 @@
>   			status = "disabled";
>   		};
>   
> +		i2c3: i2c@40005c00 {
> +			compatible = "st,stm32f4-i2c";
> +			reg = <0x40005c00 0x400>;
> +			interrupts = <72>,
> +				     <73>;
> +			resets = <&rcc STM32F4_APB1_RESET(I2C3)>;
> +			clocks = <&rcc 0 STM32F4_APB1_CLOCK(I2C3)>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
>   		dac: dac@40007400 {
>   			compatible = "st,stm32f4-dac-core";
>   			reg = <0x40007400 0x400>;
> diff --git a/drivers/clk/clk-stm32f4.c b/drivers/clk/clk-stm32f4.c
> index 18117ce..bdebe05 100644
> --- a/drivers/clk/clk-stm32f4.c
> +++ b/drivers/clk/clk-stm32f4.c
> @@ -129,7 +129,8 @@ static const struct stm32f4_gate_data stm32f429_gates[] __initconst = {
>   	{ STM32F4_RCC_APB2ENR, 20,	"spi5",		"apb2_div" },
>   	{ STM32F4_RCC_APB2ENR, 21,	"spi6",		"apb2_div" },
>   	{ STM32F4_RCC_APB2ENR, 22,	"sai1",		"apb2_div" },
> -	{ STM32F4_RCC_APB2ENR, 26,	"ltdc",		"apb2_div" },
> +	{ STM32F4_RCC_APB2ENR, 26,	"ltdc",		"apb2_div",
> +		CLK_IGNORE_UNUSED },
>   };
>   
>   static const struct stm32f4_gate_data stm32f469_gates[] __initconst = {
> @@ -1754,10 +1755,10 @@ static void __init stm32f4_rcc_init(struct device_node *np)
>   	stm32f4_rcc_register_pll("vco_in", &data->pll_data[0],
>   			&stm32f4_clk_lock);
>   
> -	clks[PLL_VCO_I2S] = stm32f4_rcc_register_pll("vco_in",
> +	clks[PLL_I2S] = stm32f4_rcc_register_pll("vco_in",
>   			&data->pll_data[1], &stm32f4_clk_lock);
>   
> -	clks[PLL_VCO_SAI] = stm32f4_rcc_register_pll("vco_in",
> +	clks[PLL_SAI] = stm32f4_rcc_register_pll("vco_in",
>   			&data->pll_data[2], &stm32f4_clk_lock);
>   
>   	for (n = 0; n < MAX_POST_DIV; n++) {
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index a1723c1..e42692c 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -95,6 +95,14 @@ config DRM_PANEL_ILITEK_IL9322
>   	  Say Y here if you want to enable support for Ilitek IL9322
>   	  QVGA (320x240) RGB, YUV and ITU-T BT.656 panels.
>   
> +config DRM_PANEL_ILITEK_IL9341
> +	tristate "Ilitek ILI9341 240x320 QVGA panels"
> +	depends on OF && SPI
> +	select REGMAP
> +	help
> +	  Say Y here if you want to enable support for Ilitek IL9341
> +	  QVGA (240x320) RGB panels.
> +
>   config DRM_PANEL_ILITEK_ILI9881C
>   	tristate "Ilitek ILI9881C-based panels"
>   	depends on OF
> diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
> index 96a883c..d123543 100644
> --- a/drivers/gpu/drm/panel/Makefile
> +++ b/drivers/gpu/drm/panel/Makefile
> @@ -8,6 +8,7 @@ obj-$(CONFIG_DRM_PANEL_ELIDA_KD35T133) += panel-elida-kd35t133.o
>   obj-$(CONFIG_DRM_PANEL_FEIXIN_K101_IM2BA02) += panel-feixin-k101-im2ba02.o
>   obj-$(CONFIG_DRM_PANEL_FEIYANG_FY07024DI26A30D) += panel-feiyang-fy07024di26a30d.o
>   obj-$(CONFIG_DRM_PANEL_ILITEK_IL9322) += panel-ilitek-ili9322.o
> +obj-$(CONFIG_DRM_PANEL_ILITEK_IL9341) += panel-ilitek-ili9341.o
>   obj-$(CONFIG_DRM_PANEL_ILITEK_ILI9881C) += panel-ilitek-ili9881c.o
>   obj-$(CONFIG_DRM_PANEL_INNOLUX_P079ZCA) += panel-innolux-p079zca.o
>   obj-$(CONFIG_DRM_PANEL_JDI_LT070ME05000) += panel-jdi-lt070me05000.o
> diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9341.c b/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
> new file mode 100644
> index 0000000..0b2b17f
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
> @@ -0,0 +1,561 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Ilitek ILI9341 TFT LCD drm_panel driver.
> + *
> + * This panel can be configured to support:
> + * - 16-bit parallel RGB interface
> + *
> + * Copyright (C) 2020 Dillon Min <dillon.minfei@gmail.com>
> + * Derived from drivers/drm/gpu/panel/panel-ilitek-ili9322.c
> + */
> +
> +#include <linux/bitops.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/regmap.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/spi/spi.h>
> +
> +#include <video/mipi_display.h>
> +#include <video/of_videomode.h>
> +#include <video/videomode.h>
> +
> +#include <drm/drm_modes.h>
> +#include <drm/drm_panel.h>
> +#include <drm/drm_print.h>
> +
> +#define DEFAULT_SPI_SPEED	10000000
> +
> +#define ILI9341_SLEEP_OUT            0x11   /* Sleep out register */
> +#define ILI9341_GAMMA                0x26   /* Gamma register */
> +#define ILI9341_DISPLAY_OFF          0x28   /* Display off register */
> +#define ILI9341_DISPLAY_ON           0x29   /* Display on register */
> +#define ILI9341_COLUMN_ADDR          0x2A   /* Colomn address register */
> +#define ILI9341_PAGE_ADDR            0x2B   /* Page address register */
> +#define ILI9341_GRAM                 0x2C   /* GRAM register */
> +#define ILI9341_MAC                  0x36   /* Memory Access Control register*/
> +#define ILI9341_PIXEL_FORMAT         0x3A   /* Pixel Format register */
> +#define ILI9341_WDB                  0x51   /* Write Brightness Display
> +						* register
> +					     */
> +#define ILI9341_WCD                  0x53   /* Write Control Display
> +					     * register
> +					     */
> +#define ILI9341_RGB_INTERFACE        0xB0   /* RGB Interface Signal Control */
> +#define ILI9341_FRC                  0xB1   /* Frame Rate Control register */
> +#define ILI9341_BPC                  0xB5   /* Blanking Porch Control
> +					     * register
> +					     */
> +#define ILI9341_DFC                  0xB6   /* Display Function Control
> +					     * register
> +					     */
> +#define ILI9341_POWER1               0xC0   /* Power Control 1 register */
> +#define ILI9341_POWER2               0xC1   /* Power Control 2 register */
> +#define ILI9341_VCOM1                0xC5   /* VCOM Control 1 register */
> +#define ILI9341_VCOM2                0xC7   /* VCOM Control 2 register */
> +#define ILI9341_POWERA               0xCB   /* Power control A register */
> +#define ILI9341_POWERB               0xCF   /* Power control B register */
> +#define ILI9341_PGAMMA               0xE0   /* Positive Gamma Correction
> +					     * register
> +					     */
> +#define ILI9341_NGAMMA               0xE1   /* Negative Gamma Correction
> +					     * register
> +					     */
> +#define ILI9341_DTCA                 0xE8   /* Driver timing control A */
> +#define ILI9341_DTCB                 0xEA   /* Driver timing control B */
> +#define ILI9341_POWER_SEQ            0xED   /* Power on sequence register */
> +#define ILI9341_3GAMMA_EN            0xF2   /* 3 Gamma enable register */
> +#define ILI9341_INTERFACE            0xF6   /* Interface control register */
> +#define ILI9341_PRC                  0xF7   /* Pump ratio control register */
> +
> +static u8 ili9341_cmd0[] = {0xc3, 0x08, 0x50};
> +static u8 ili9341_powerb[] = {0x00, 0xc1, 0x30};
> +static u8 ili9341_power_seq[] = {0x64, 0x03, 0x12, 0x81};
> +static u8 ili9341_dtca[] = {0x85, 0x00, 0x78};
> +static u8 ili9341_powera[] = {0x39, 0x2c, 0x00, 0x34, 0x02};
> +static u8 ili9341_prc[] = {0x20};
> +static u8 ili9341_dtcb[] = {0x00, 0x00};
> +static u8 ili9341_frc[] = {0x00, 0x1b};
> +static u8 ili9341_dfc1[] = {0x0a, 0xa2};
> +static u8 ili9341_power1[] = {0x10};
> +static u8 ili9341_power2[] = {0x10};
> +static u8 ili9341_vcom1[] = {0x45, 0x15};
> +static u8 ili9341_vcom2[] = {0x90};
> +static u8 ili9341_mac[] = {0xc8};
> +static u8 ili9341_gamma_en[] = {0x00};
> +static u8 ili9341_rgb_intr[] = {0xc2};
> +static u8 ili9341_dfc2[] = {0x0a, 0xa7, 0x27, 0x04};
> +static u8 ili9341_column_addr[] = {0x00, 0x00, 0x00, 0xef};
> +static u8 ili9341_page_addr[] = {0x00, 0x00, 0x01, 0x3f};
> +static u8 ili9341_intr[] = {0x01, 0x00, 0x06};
> +static u8 ili9341_gamma[] = {0x01};
> +static u8 ili9341_pgamma[] = {0x0f, 0x29, 0x24, 0x0c, 0x0e, 0x09, 0x4e, 0x78,
> +				0x3c, 0x09, 0x13, 0x05,	0x17, 0x11, 0x00};
> +static u8 ili9341_ngamma[] = {0x00, 0x16, 0x1b, 0x04, 0x11, 0x07, 0x31, 0x33,
> +				0x42, 0x05, 0x0c, 0x0a, 0x28, 0x2f, 0x0f};
> +
> +/**
> + * enum ili9341_input - the format of the incoming signal to the panel
> + *
> + * The panel can be connected to various input streams and four of them can
> + * be selected by electronic straps on the display. However it is possible
> + * to select another mode or override the electronic default with this
> + * setting.
> + */
> +enum ili9341_input {
> +	ILI9341_INPUT_PRGB_THROUGH = 0x0,
> +	ILI9341_INPUT_PRGB_ALIGNED = 0x1,
> +	ILI9341_INPUT_UNKNOWN = 0xf,
> +};
> +
> +/**
> + * struct ili9341_config - the system specific ILI9341 configuration
> + * @width_mm: physical panel width [mm]
> + * @height_mm: physical panel height [mm]
> + * @input: the input/entry type used in this system, if this is set to
> + * ILI9341_INPUT_UNKNOWN the driver will try to figure it out by probing
> + * the hardware
> + * @dclk_active_high: data/pixel clock active high, data will be clocked
> + * in on the rising edge of the DCLK (this is usually the case).
> + * @de_active_high: DE (data entry) is active high
> + * @hsync_active_high: HSYNC is active high
> + * @vsync_active_high: VSYNC is active high
> + */
> +struct ili9341_config {
> +	u32 width_mm;
> +	u32 height_mm;
> +	enum ili9341_input input;
> +	bool dclk_active_high;
> +	bool de_active_high;
> +	bool hsync_active_high;
> +	bool vsync_active_high;
> +};
> +
> +struct ili9341 {
> +	struct device *dev;
> +	const struct ili9341_config *conf;
> +	struct drm_panel panel;
> +	struct regmap *regmap;
> +	struct gpio_desc *reset_gpio;
> +	struct gpio_desc *dc_gpio;
> +	enum ili9341_input input;
> +	struct videomode vm;
> +};
> +
> +static inline struct ili9341 *panel_to_ili9341(struct drm_panel *panel)
> +{
> +	return container_of(panel, struct ili9341, panel);
> +}
> +
> +int ili9341_spi_transfer(struct spi_device *spi, u32 speed_hz,
> +			  u8 bpw, const void *buf, size_t len)
> +{
> +	size_t max_chunk = spi_max_transfer_size(spi);
> +	struct spi_transfer tr = {
> +		.bits_per_word = bpw,
> +		.speed_hz = speed_hz,
> +		.len = len,
> +	};
> +	struct spi_message m;
> +	size_t chunk;
> +	int ret;
> +
> +	spi_message_init_with_transfers(&m, &tr, 1);
> +
> +	while (len) {
> +		chunk = min(len, max_chunk);
> +
> +		tr.tx_buf = buf;
> +		tr.len = chunk;
> +		buf += chunk;
> +		len -= chunk;
> +
> +		ret = spi_sync(spi, &m);
> +		if (ret)
> +			return ret;
> +	}
> +	return 0;
> +}
> +static int ili9341_regmap_spi_write(void *context, const void *data,
> +				    size_t count)
> +{
> +	struct device *dev = context;
> +	struct spi_device *spi = to_spi_device(dev);
> +	struct ili9341 *ili = spi_get_drvdata(spi);
> +	int ret = 0;
> +
> +	gpiod_set_value_cansleep(ili->dc_gpio, 0);
> +
> +	ret = ili9341_spi_transfer(spi, DEFAULT_SPI_SPEED, 8, data+0, 1);
> +	if (ret || count == 1 ||
> +			((u8 *)data)[0] == ILI9341_GRAM ||
> +			((u8 *)data)[0] == ILI9341_DISPLAY_ON ||
> +			((u8 *)data)[0] == ILI9341_SLEEP_OUT ||
> +			((u8 *)data)[0] == ILI9341_DISPLAY_OFF)
> +		return ret;
> +
> +	gpiod_set_value_cansleep(ili->dc_gpio, 1);
> +
> +	return ili9341_spi_transfer(spi, DEFAULT_SPI_SPEED, 8, data+1, count-1);
> +}
> +
> +static int ili9341_regmap_spi_read(void *context, const void *reg,
> +				   size_t reg_size, void *val, size_t val_size)
> +{
> +	return 0;
> +}
> +
> +static struct regmap_bus ili9341_regmap_bus = {
> +	.write = ili9341_regmap_spi_write,
> +	.read = ili9341_regmap_spi_read,
> +	.reg_format_endian_default = REGMAP_ENDIAN_BIG,
> +	.val_format_endian_default = REGMAP_ENDIAN_BIG,
> +};
> +
> +static bool ili9341_volatile_reg(struct device *dev, unsigned int reg)
> +{
> +	return false;
> +}
> +
> +static bool ili9341_writeable_reg(struct device *dev, unsigned int reg)
> +{
> +	/* Just register 0 is read-only */
> +	if (reg == 0x00)
> +		return false;
> +	return true;
> +}
> +
> +static const struct regmap_config ili9341_regmap_config = {
> +	.reg_bits = 8,
> +	.val_bits = 8,
> +	.max_register = 0xff,
> +	.cache_type = REGCACHE_RBTREE,
> +	.volatile_reg = ili9341_volatile_reg,
> +	.writeable_reg = ili9341_writeable_reg,
> +};
> +
> +static int ili9341_init(struct drm_panel *panel, struct ili9341 *ili)
> +{
> +	regmap_bulk_write(ili->regmap, 0xca,
> +					ili9341_cmd0, sizeof(ili9341_cmd0));
> +	regmap_bulk_write(ili->regmap, ILI9341_POWERB,
> +				ili9341_powerb, sizeof(ili9341_powerb));
> +	regmap_bulk_write(ili->regmap, ILI9341_POWER_SEQ,
> +				ili9341_power_seq, sizeof(ili9341_power_seq));
> +	regmap_bulk_write(ili->regmap, ILI9341_DTCA,
> +				ili9341_dtca, sizeof(ili9341_dtca));
> +	regmap_bulk_write(ili->regmap, ILI9341_POWERA,
> +				ili9341_powera, sizeof(ili9341_powera));
> +	regmap_write(ili->regmap, ILI9341_PRC, ili9341_prc[0]);
> +	regmap_bulk_write(ili->regmap, ILI9341_DTCB,
> +				ili9341_dtcb, sizeof(ili9341_dtcb));
> +	regmap_bulk_write(ili->regmap, ILI9341_FRC,
> +				ili9341_frc, sizeof(ili9341_frc));
> +	regmap_bulk_write(ili->regmap, ILI9341_DFC,
> +				ili9341_dfc1, sizeof(ili9341_dfc1));
> +	regmap_write(ili->regmap, ILI9341_POWER1, ili9341_power1[0]);
> +	regmap_write(ili->regmap, ILI9341_POWER2, ili9341_power2[0]);
> +	regmap_bulk_write(ili->regmap, ILI9341_VCOM1,
> +				ili9341_vcom1, sizeof(ili9341_vcom1));
> +	regmap_write(ili->regmap, ILI9341_VCOM2, ili9341_vcom2[0]);
> +	regmap_write(ili->regmap, ILI9341_MAC, ili9341_mac[0]);
> +	regmap_write(ili->regmap, ILI9341_3GAMMA_EN, ili9341_gamma_en[0]);
> +	regmap_write(ili->regmap, ILI9341_RGB_INTERFACE, ili9341_rgb_intr[0]);
> +	regmap_bulk_write(ili->regmap, ILI9341_DFC,
> +				ili9341_dfc2, sizeof(ili9341_dfc2));
> +
> +	/* colomn address set */
> +	regmap_bulk_write(ili->regmap, ILI9341_COLUMN_ADDR,
> +			ili9341_column_addr, sizeof(ili9341_column_addr));
> +
> +	/* Page Address Set */
> +	regmap_bulk_write(ili->regmap, ILI9341_PAGE_ADDR,
> +				ili9341_page_addr, sizeof(ili9341_page_addr));
> +	regmap_bulk_write(ili->regmap, ILI9341_INTERFACE,
> +				ili9341_intr, sizeof(ili9341_intr));
> +	regmap_write(ili->regmap, ILI9341_GRAM, 0);
> +	msleep(200);
> +
> +	regmap_write(ili->regmap, ILI9341_GAMMA, ili9341_gamma[0]);
> +	regmap_bulk_write(ili->regmap, ILI9341_PGAMMA,
> +				ili9341_pgamma, sizeof(ili9341_pgamma));
> +	regmap_bulk_write(ili->regmap, ILI9341_NGAMMA,
> +				ili9341_ngamma, sizeof(ili9341_ngamma));
> +	regmap_write(ili->regmap, ILI9341_SLEEP_OUT, 0);
> +	msleep(200);
> +
> +	regmap_write(ili->regmap, ILI9341_DISPLAY_ON, 0);
> +
> +	/* GRAM start writing */
> +	regmap_write(ili->regmap, ILI9341_GRAM, 0);
> +
> +	dev_info(ili->dev, "initialized display\n");
> +
> +	return 0;
> +}
> +
> +/*
> + * This power-on sequence if from the datasheet, page 57.
> + */
> +static int ili9341_power_on(struct ili9341 *ili)
> +{
> +	/* Assert RESET */
> +	gpiod_set_value(ili->reset_gpio, 1);
> +
> +	msleep(20);
> +
> +	/* De-assert RESET */
> +	gpiod_set_value(ili->reset_gpio, 0);
> +
> +	msleep(10);
> +
> +	return 0;
> +}
> +
> +static int ili9341_power_off(struct ili9341 *ili)
> +{
> +	return 0;
> +}
> +
> +static int ili9341_disable(struct drm_panel *panel)
> +{
> +	struct ili9341 *ili = panel_to_ili9341(panel);
> +	int ret;
> +
> +	ret = regmap_write(ili->regmap, ILI9341_DISPLAY_OFF, 0);
> +	if (ret) {
> +		dev_err(ili->dev, "unable to go to standby mode\n");
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int ili9341_unprepare(struct drm_panel *panel)
> +{
> +	struct ili9341 *ili = panel_to_ili9341(panel);
> +
> +	return ili9341_power_off(ili);
> +}
> +
> +static int ili9341_prepare(struct drm_panel *panel)
> +{
> +	struct ili9341 *ili = panel_to_ili9341(panel);
> +	int ret;
> +
> +	ret = ili9341_power_on(ili);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = ili9341_init(panel, ili);
> +	if (ret < 0)
> +		ili9341_unprepare(panel);
> +
> +	return ret;
> +}
> +
> +static int ili9341_enable(struct drm_panel *panel)
> +{
> +	struct ili9341 *ili = panel_to_ili9341(panel);
> +	int ret;
> +
> +	ret = regmap_write(ili->regmap, ILI9341_DISPLAY_ON, 0);
> +	if (ret) {
> +		dev_err(ili->dev, "unable to enable panel\n");
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +/* This is the only mode listed for parallel RGB in the datasheet */
> +static const struct drm_display_mode prgb_320x240_mode = {
> +	.clock = 6100,
> +	.hdisplay = 240,
> +	.hsync_start = 240 + 10,
> +	.hsync_end = 240 + 10 + 10,
> +	.htotal = 280,
> +	.vdisplay = 320,
> +	.vsync_start = 320 + 4,
> +	.vsync_end = 320 + 4 + 2,
> +	.vtotal = 328,
> +	.vrefresh = 60,
> +	.flags = 0,
> +};
> +
> +static int ili9341_get_modes(struct drm_panel *panel,
> +				struct drm_connector *connector)
> +{
> +	struct ili9341 *ili = panel_to_ili9341(panel);
> +	struct drm_device *drm = connector->dev;
> +	struct drm_display_mode *mode;
> +	struct drm_display_info *info;
> +
> +	info = &connector->display_info;
> +	info->width_mm = ili->conf->width_mm;
> +	info->height_mm = ili->conf->height_mm;
> +	if (ili->conf->dclk_active_high)
> +		info->bus_flags |= DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE;
> +	else
> +		info->bus_flags |= DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE;
> +
> +	if (ili->conf->de_active_high)
> +		info->bus_flags |= DRM_BUS_FLAG_DE_HIGH;
> +	else
> +		info->bus_flags |= DRM_BUS_FLAG_DE_LOW;
> +
> +	switch (ili->input) {
> +	case ILI9341_INPUT_PRGB_THROUGH:
> +	case ILI9341_INPUT_PRGB_ALIGNED:
> +		mode = drm_mode_duplicate(drm, &prgb_320x240_mode);
> +		break;
> +	default:
> +		mode = NULL;
> +		break;
> +	}
> +	if (!mode) {
> +		DRM_ERROR("bad mode or failed to add mode\n");
> +		return -EINVAL;
> +	}
> +	drm_mode_set_name(mode);
> +	/*
> +	 * This is the preferred mode because most people are going
> +	 * to want to use the display with VGA type graphics.
> +	 */
> +	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
> +
> +	/* Set up the polarity */
> +	if (ili->conf->hsync_active_high)
> +		mode->flags |= DRM_MODE_FLAG_PHSYNC;
> +	else
> +		mode->flags |= DRM_MODE_FLAG_NHSYNC;
> +	if (ili->conf->vsync_active_high)
> +		mode->flags |= DRM_MODE_FLAG_PVSYNC;
> +	else
> +		mode->flags |= DRM_MODE_FLAG_NVSYNC;
> +
> +	mode->width_mm = ili->conf->width_mm;
> +	mode->height_mm = ili->conf->height_mm;
> +	drm_mode_probed_add(connector, mode);
> +
> +	return 1; /* Number of modes */
> +}
> +
> +static const struct drm_panel_funcs ili9341_drm_funcs = {
> +	.disable = ili9341_disable,
> +	.unprepare = ili9341_unprepare,
> +	.prepare = ili9341_prepare,
> +	.enable = ili9341_enable,
> +	.get_modes = ili9341_get_modes,
> +};
> +
> +static int ili9341_probe(struct spi_device *spi)
> +{
> +	struct device *dev = &spi->dev;
> +	struct ili9341 *ili;
> +	const struct regmap_config *regmap_config;
> +	int ret;
> +
> +	ili = devm_kzalloc(dev, sizeof(struct ili9341), GFP_KERNEL);
> +	if (!ili)
> +		return -ENOMEM;
> +
> +	spi_set_drvdata(spi, ili);
> +
> +	ili->dev = dev;
> +	/*
> +	 * Every new incarnation of this display must have a unique
> +	 * data entry for the system in this driver.
> +	 */
> +	ili->conf = of_device_get_match_data(dev);
> +	if (!ili->conf) {
> +		dev_err(dev, "missing device configuration\n");
> +		return -ENODEV;
> +	}
> +
> +	ili->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
> +	if (IS_ERR(ili->reset_gpio)) {
> +		dev_err(dev, "failed to get RESET GPIO\n");
> +		return PTR_ERR(ili->reset_gpio);
> +	}
> +
> +	ili->dc_gpio = devm_gpiod_get_optional(dev, "dc", GPIOD_OUT_LOW);
> +	if (IS_ERR(ili->dc_gpio)) {
> +		dev_err(dev, "failed to get DC GPIO\n");
> +		return PTR_ERR(ili->dc_gpio);
> +	}
> +
> +	spi->bits_per_word = 8;
> +	ret = spi_setup(spi);
> +	if (ret < 0) {
> +		dev_err(dev, "spi setup failed.\n");
> +		return ret;
> +	}
> +
> +	regmap_config = &ili9341_regmap_config;
> +
> +	ili->regmap = devm_regmap_init(dev, &ili9341_regmap_bus, dev,
> +				       regmap_config);
> +	if (IS_ERR(ili->regmap)) {
> +		dev_err(dev, "failed to allocate register map\n");
> +		return PTR_ERR(ili->regmap);
> +	}
> +
> +	ili->input = ili->conf->input;
> +
> +	drm_panel_init(&ili->panel, dev, &ili9341_drm_funcs,
> +		       DRM_MODE_CONNECTOR_DPI);
> +
> +	return drm_panel_add(&ili->panel);
> +}
> +
> +static int ili9341_remove(struct spi_device *spi)
> +{
> +	struct ili9341 *ili = spi_get_drvdata(spi);
> +
> +	ili9341_power_off(ili);
> +	drm_panel_remove(&ili->panel);
> +
> +	return 0;
> +}
> +
> +/*
> + * The Stm32f429-disco board has a panel ili9341 connected to ltdc controller
> + */
> +static const struct ili9341_config ili9341_data = {
> +	.width_mm = 65,
> +	.height_mm = 50,
> +	.input = ILI9341_INPUT_PRGB_THROUGH,
> +	.dclk_active_high = true,
> +	.de_active_high = false,
> +	.hsync_active_high = false,
> +	.vsync_active_high = false,
> +};
> +
> +static const struct of_device_id ili9341_of_match[] = {
> +	{
> +		.compatible = "stm32f429-disco,ltdc-panel",
> +		.data = &ili9341_data,
> +	},
> +	{
> +		.compatible = "ilitek,ili9341",
> +		.data = NULL,
> +	},
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, ili9341_of_match);
> +
> +static struct spi_driver ili9341_driver = {
> +	.probe = ili9341_probe,
> +	.remove = ili9341_remove,
> +	.driver = {
> +		.name = "panel-ilitek-ili9341",
> +		.of_match_table = ili9341_of_match,
> +	},
> +};
> +module_spi_driver(ili9341_driver);
> +
> +MODULE_AUTHOR("Dillon Min <dillon.minfei@gmail.com>");
> +MODULE_DESCRIPTION("ILI9341 LCD panel driver");
> +MODULE_LICENSE("GPL v2");
> diff --git a/drivers/spi/spi-stm32.c b/drivers/spi/spi-stm32.c
> index 44ac6eb3..680cede 100644
> --- a/drivers/spi/spi-stm32.c
> +++ b/drivers/spi/spi-stm32.c
> @@ -388,6 +388,10 @@ static int stm32h7_spi_get_fifo_size(struct stm32_spi *spi)
>   	return count;
>   }
>   
> +static void stm32f4_spi_tx_dummy(struct stm32_spi *spi)
> +{
> +	writeb_relaxed(0x55, spi->base + STM32F4_SPI_DR);
> +}
>   /**
>    * stm32f4_spi_get_bpw_mask - Return bits per word mask
>    * @spi: pointer to the spi controller data structure
> @@ -811,7 +815,9 @@ static irqreturn_t stm32f4_spi_irq_event(int irq, void *dev_id)
>   		mask |= STM32F4_SPI_SR_TXE;
>   	}
>   
> -	if (!spi->cur_usedma && spi->cur_comm == SPI_FULL_DUPLEX) {
> +	if (!spi->cur_usedma && (spi->cur_comm == SPI_FULL_DUPLEX ||
> +				 spi->cur_comm == SPI_SIMPLEX_RX ||
> +				 spi->cur_comm == SPI_3WIRE_RX)) {
>   		/* TXE flag is set and is handled when RXNE flag occurs */
>   		sr &= ~STM32F4_SPI_SR_TXE;
>   		mask |= STM32F4_SPI_SR_RXNE | STM32F4_SPI_SR_OVR;
> @@ -850,8 +856,10 @@ static irqreturn_t stm32f4_spi_irq_event(int irq, void *dev_id)
>   		stm32f4_spi_read_rx(spi);
>   		if (spi->rx_len == 0)
>   			end = true;
> -		else /* Load data for discontinuous mode */
> +		else if (spi->tx_buf)/* Load data for discontinuous mode */
>   			stm32f4_spi_write_tx(spi);
> +		else if (spi->cur_comm == SPI_SIMPLEX_RX)
> +			stm32f4_spi_tx_dummy(spi);
>   	}
>   
>   end_irq:
> @@ -1151,7 +1159,9 @@ static int stm32f4_spi_transfer_one_irq(struct stm32_spi *spi)
>   	/* Enable the interrupts relative to the current communication mode */
>   	if (spi->cur_comm == SPI_SIMPLEX_TX || spi->cur_comm == SPI_3WIRE_TX) {
>   		cr2 |= STM32F4_SPI_CR2_TXEIE;
> -	} else if (spi->cur_comm == SPI_FULL_DUPLEX) {
> +	} else if (spi->cur_comm == SPI_FULL_DUPLEX ||
> +				spi->cur_comm == SPI_SIMPLEX_RX ||
> +				spi->cur_comm == SPI_3WIRE_RX) {
>   		/* In transmit-only mode, the OVR flag is set in the SR register
>   		 * since the received data are never read. Therefore set OVR
>   		 * interrupt only when rx buffer is available.
> @@ -1170,6 +1180,8 @@ static int stm32f4_spi_transfer_one_irq(struct stm32_spi *spi)
>   	/* starting data transfer when buffer is loaded */
>   	if (spi->tx_buf)
>   		stm32f4_spi_write_tx(spi);
> +	else if (spi->cur_comm == SPI_SIMPLEX_RX)
> +		stm32f4_spi_tx_dummy(spi);
>   
>   	spin_unlock_irqrestore(&spi->lock, flags);
>   
> @@ -1462,9 +1474,15 @@ static int stm32f4_spi_set_mode(struct stm32_spi *spi, unsigned int comm_type)
>   		stm32_spi_set_bits(spi, STM32F4_SPI_CR1,
>   					STM32F4_SPI_CR1_BIDIMODE |
>   					STM32F4_SPI_CR1_BIDIOE);
> -	} else if (comm_type == SPI_FULL_DUPLEX) {
> +	} else if (comm_type == SPI_FULL_DUPLEX ||
> +				comm_type == SPI_SIMPLEX_RX) {
>   		stm32_spi_clr_bits(spi, STM32F4_SPI_CR1,
>   					STM32F4_SPI_CR1_BIDIMODE |
> +					STM32F4_SPI_CR1_RXONLY);
> +	} else if (comm_type == SPI_3WIRE_RX) {
> +		stm32_spi_set_bits(spi, STM32F4_SPI_CR1,
> +					STM32F4_SPI_CR1_BIDIMODE);
> +		stm32_spi_clr_bits(spi, STM32F4_SPI_CR1,
>   					STM32F4_SPI_CR1_BIDIOE);
>   	} else {
>   		return -EINVAL;
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
