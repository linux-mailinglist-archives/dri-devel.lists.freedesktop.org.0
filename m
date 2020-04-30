Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 240DA1C0E9E
	for <lists+dri-devel@lfdr.de>; Fri,  1 May 2020 09:23:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21F576EA74;
	Fri,  1 May 2020 07:22:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE04C6E1CD
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Apr 2020 09:58:05 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03U9qeKs000841; Thu, 30 Apr 2020 11:57:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=KI2AtPyJLvrsFvH8h/qo1asrr1uW5LJxQpJkGaRznVE=;
 b=GaOlqtsELyMr/+7rGu414BfW6XhtkUr2Y1ImtOwm0WNi5hRk4ERUs61pdsp8bf2FPeyU
 yOnOKmvq/63F8lZLFFZZNr1XJy1MdA4rwwGZT3Q9q/0te3ukYFBKp57EXupvhe4bLSvf
 7fSFgXrWMfZa23dUJ5bMPDlq5JuAa7W97PV0iIsh2m1YzQiZSTqM+3505GuoiGUlw7ly
 yiNRlED4+rXqSJwz57Ea4YSu4PBhHbP68u3SDnhRtMo4RpERd3dyhRh9zaworeJEXPSN
 XoSO0mpF4FmiYasNUf71JbUB1nGekHvc4XbnftoiNdFLkauiU5heHekMuYflwJ8SwcAw oQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30mhjx3grd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Apr 2020 11:57:54 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 28DE410002A;
 Thu, 30 Apr 2020 11:57:54 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 126CA2B3BB8;
 Thu, 30 Apr 2020 11:57:54 +0200 (CEST)
Received: from lmecxl0912.tpe.st.com (10.75.127.44) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 30 Apr
 2020 11:57:47 +0200
Subject: Re: [PATCH 1/4] add dts node for drm panel driver ili9341 add dts
 i2c3 for stmpe touch add dts spi5 for gyro & ili9341
To: <dillon.minfei@gmail.com>
References: <1588239802-11442-1-git-send-email-dillon.minfei@gmail.com>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <33f928e7-3fde-99a2-b84d-d74a2d3f1186@st.com>
Date: Thu, 30 Apr 2020 11:57:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1588239802-11442-1-git-send-email-dillon.minfei@gmail.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG8NODE2.st.com (10.75.127.23) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-30_05:2020-04-30,
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
Cc: devicetree@vger.kernel.org, mcoquelin.stm32@gmail.com, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, thierry.reding@gmail.com, sam@ravnborg.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi

On 4/30/20 11:43 AM, dillon.minfei@gmail.com wrote:
> From: dillon min <dillon.minfei@gmail.com>
> 
> Signed-off-by: dillon min <dillon.minfei@gmail.com>

Commit title should be ARM: dts: stm32: bla bla on stm32f429 and please 
a commit message.

> ---
>   .../bindings/display/panel/ilitek,ili9341.txt      | 42 +++++++++++
>   arch/arm/boot/dts/stm32f4-pinctrl.dtsi             | 79 +++++++++++++++++++
>   arch/arm/boot/dts/stm32f429-disco.dts              | 88 ++++++++++++++++++++++
>   arch/arm/boot/dts/stm32f429.dtsi                   | 12 +++
>   4 files changed, 221 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/display/panel/ilitek,ili9341.txt
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.txt b/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.txt

This binding description should be in a separate patch and you have to 
write in YAML format.


> new file mode 100644
> index 0000000..f5a4e55
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.txt
> @@ -0,0 +1,42 @@
> +Ilitek ILI9341 TFT panel driver with SPI control bus
> +
> +This is a driver for 240x320 TFT panels, accepting a rgb input
> +streams that get adapted and scaled to the panel.
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

3p3 ?

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

Nodes are have to be ordered

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

Split Soc updates in a separate patch

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
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
