Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E65601C0EB4
	for <lists+dri-devel@lfdr.de>; Fri,  1 May 2020 09:24:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C698E6EC27;
	Fri,  1 May 2020 07:23:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20117.outbound.protection.outlook.com [40.107.2.117])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 551CE6EBA3
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Apr 2020 12:08:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hpxxX63AxUX8TJG9HwHSrgGlB4eMpmzuMws/5SlNAALUtO0/hAmnLM776/nqBK2LRoWFh9ivTtXNT5BiAQiqetmBRg5aqd/zbJiqyBkoRcruWeszhaQAj4q1D0Hks5f1ZY3jqUwr7j6TdH67ML54RcVaxwFS0O2ej8NyKMIiI85wwxivam1Mc7csKNlxadhamH9TIFwB8B3n0iVNum4cxmvcOHGM/+Ig5bS5SLjzns5GaW3VugA3YAgvHZshPYpz6N6gPw9LcqXCjnn67VHFcW22sLX4qaN6eB92O1s1yNhYv1HOS2tOUFDkK125sr+mMvXO5pLEgsXzdelCqydUgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OEMfe4hYHuBOKEQdWTH0jSbeLPEoFZO3toXxt1GUlCE=;
 b=BlcBNcMdlXyuAu06k8RHZAJrB4YJkB1xe455C/bEVvlr9ZQhZyzdjnVo5pDUvS8gLt7Rt9RgpDKNz84uTQWE1TIjAVlrUBTXjHCfYuN+1YtmJOM4xb9iJD6r4Evby8UbTflsH/8EjNRXoU4tXQnA+fA0/lRsZA0uR2qc0nz6zxvygQcwtxU0zD04JkZpJb2B/VwlBzuCaKkkOD5993sftlHFKuR1cAakg1dzywXo2/t9rxpiJw6EPZrJvvQOcjZohv6Ia2gpo7N9bQspoEcNpcXMfYASL7z8dzN5PH89aljk44Q67+118nPQhP1iYEYv+2cxjPXb9OqgQq0myEZGNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=toradex.com; dmarc=pass action=none header.from=toradex.com;
 dkim=pass header.d=toradex.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toradex.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OEMfe4hYHuBOKEQdWTH0jSbeLPEoFZO3toXxt1GUlCE=;
 b=hGDtEUGT94GOE12oSGZmqo6mNH3mWulKMaDvA2PMjHFw1iyDL3SpDJSeW79Rqikr/F/kAaWGVt/0mWb1msuMy+Cjzai/ka0qWmDzEZouwzp47T4IV34Gj0FBdEkFf/PpWOYey8nHkejufR3txyvLL4VAUXxqPMniEHh2x0Ov8Sk=
Received: from AM6PR05MB6120.eurprd05.prod.outlook.com (2603:10a6:20b:a8::25)
 by AM6PR05MB6406.eurprd05.prod.outlook.com (2603:10a6:20b:ba::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.13; Thu, 30 Apr
 2020 12:08:13 +0000
Received: from AM6PR05MB6120.eurprd05.prod.outlook.com
 ([fe80::d8d3:ead7:9f42:4289]) by AM6PR05MB6120.eurprd05.prod.outlook.com
 ([fe80::d8d3:ead7:9f42:4289%6]) with mapi id 15.20.2937.026; Thu, 30 Apr 2020
 12:08:12 +0000
From: Philippe Schenker <philippe.schenker@toradex.com>
To: "dillon.minfei@gmail.com" <dillon.minfei@gmail.com>,
 "alexandre.torgue@st.com" <alexandre.torgue@st.com>
Subject: Re: [PATCH 1/4] add dts node for drm panel driver ili9341 add dts
 i2c3 for stmpe touch add dts spi5 for gyro & ili9341
Thread-Topic: [PATCH 1/4] add dts node for drm panel driver ili9341 add dts
 i2c3 for stmpe touch add dts spi5 for gyro & ili9341
Thread-Index: AQHWHtPQcu2Kwv/dlEOyNcbWh0jzrqiRkmIA
Date: Thu, 30 Apr 2020 12:08:12 +0000
Message-ID: <ff10728da646106d54182ce6db93a77f32b592d5.camel@toradex.com>
References: <1588239802-11442-1-git-send-email-dillon.minfei@gmail.com>
In-Reply-To: <1588239802-11442-1-git-send-email-dillon.minfei@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.2 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=toradex.com;
x-originating-ip: [51.154.7.61]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 06b9d916-73a4-4629-edd3-08d7ecff2818
x-ms-traffictypediagnostic: AM6PR05MB6406:
x-microsoft-antispam-prvs: <AM6PR05MB6406CA0BE9D0FC55EBF9E1B5F4AA0@AM6PR05MB6406.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 0389EDA07F
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR05MB6120.eurprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(136003)(39850400004)(376002)(396003)(366004)(36756003)(26005)(8936002)(110136005)(6512007)(478600001)(6506007)(316002)(8676002)(66446008)(86362001)(2616005)(2906002)(64756008)(54906003)(5660300002)(186003)(4326008)(76116006)(66476007)(71200400001)(7416002)(44832011)(66556008)(91956017)(66946007)(6486002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ewpakj5Hy26ceOazffNrNejg0PvAAR/lOd+fBywkkf5LNKjPXIt60RAPIemDOMi9b3PaPns/XyttiIkr7AHCM+wC5Y+DDCzmgUrY5EZvFtNgR2qQTaSzVxq8NbU7C+D9lkv64NN9WLFQPix8sYOzmYzBqF3vIk6DBYiVuNXkPx4drfaTUmyEsPC3mfVZDf6u2zgsdW3+PG4tVkDNEDJOTVv1g83Y/mmfR3y7RMWnVtKFgYx+igIdJfLiInkHyPq0xNT/N8DyN9N+adGHlkRSiGl8vqd5CSWR6eIERa6d3IB2hCK8I3HWNG3RZiRm5BiGG664ff/zGLgEDL2XVCd+kk/Z2FpK6y4lY5jTPU5MSk0De+kyhyiTyNXTcIPMy5aHFu7YavR5fUftz/fA9mO1KSVJwMPkMjx5hbji0jbHcRPkC/6001ooFqLXqqEYPWhs
x-ms-exchange-antispam-messagedata: VPcYmqj7Izub7yb29Q8jqyNb5aZ3T4gDXYPbF3wNPmXPKrleYt2Iow+BidFrDKUOqzt+F6OI3I39wA2hb4w4JTW5Deh3RuVHArA5F3HiLkMxrWb6SPXf/XTe25Qaek/zJYrQrjU8Cy2VZGxK5C01GhIEIZzMYmFAVUDnNeHYarEe5tqHiOXr1ORC/Pts/r6rSov8MFX/HEVMZTTZ3loGjusKsrWhbcskuh0Aog387azeyfoQEqwVZRDouhRDieWzN+eE3VwQvcJs7n+8WTiQ3tIknCmJzA//ZKkS7wCiJPZDPfC12IIweeVMe/SQeU0K5rAUFQ1hHlke6ldb/aPEh0e1ZYD8IdRCkhvTFsLimd+Y4RR9vWL9vv/xzWTxjj7RZeSZ3EC2Q33K5+zKM20g0MftEndezWL5Qyp884rAF8UL0Df1r2dzUHcE3vf9Yr/v9+sIpg+wJNNLdB4pCpFnTejs15wzA9hb07rPVvJ+R3fZzRIVk1Z8pZdypriA4dIe0EEsV/JtHx273W9HBAMziyuGjVdYrSxKhBu7iHYJOSPgMz1yKNdweWSk07avZa5y60V1eOCDybPbO05MaiR+myHnF5rTXe601Ai1S10vTmuJsC8saUXORLog78qvrzcmyTSNLguNU6zQMiC3gBkR+H3gwfh8rbLGmiLx/V63ZlhzKiaOkVkCtHlLvUVuEXLHqfc7eX+Q0O8gyyUenGmqeyNFP3OTaTgdvUTYKvuM4VLFxn4ree5MiwUE/6ADT3uq5a9kut2QcBkuIzE/7U7qwYRBFhn9195zUH7j3cCymMs=
x-ms-exchange-transport-forked: True
Content-ID: <B9CA1CB242C5374AAD10B4CD3E211379@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06b9d916-73a4-4629-edd3-08d7ecff2818
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2020 12:08:12.8823 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VIL4t0SdBNPrwFBveL3uuHMhKDCTB25pq+G0FtGdm4CUZLIqN30Vh0UtactTTyf/6Fr3ehKUl8zvzffLjpmcqNuVzRnD8XmMIK08MteJGkU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR05MB6406
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "sam@ravnborg.org" <sam@ravnborg.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 2020-04-30 at 17:43 +0800, dillon.minfei@gmail.com wrote:
> From: dillon min <dillon.minfei@gmail.com>
> 
> Signed-off-by: dillon min <dillon.minfei@gmail.com>
> ---
>  .../bindings/display/panel/ilitek,ili9341.txt      | 42 +++++++++++
>  arch/arm/boot/dts/stm32f4-pinctrl.dtsi             | 79
> +++++++++++++++++++
>  arch/arm/boot/dts/stm32f429-disco.dts              | 88
> ++++++++++++++++++++++
>  arch/arm/boot/dts/stm32f429.dtsi                   | 12 +++
>  4 files changed, 221 insertions(+)
>  create mode 100644
> Documentation/devicetree/bindings/display/panel/ilitek,ili9341.txt
> 
> diff --git
> a/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.txt
> b/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.txt
> new file mode 100644
> index 0000000..f5a4e55
> --- /dev/null
> +++
> b/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.txt
> @@ -0,0 +1,42 @@
> +Ilitek ILI9341 TFT panel driver with SPI control bus
> +
> +This is a driver for 240x320 TFT panels, accepting a rgb input
> +streams that get adapted and scaled to the panel.
> +
> +Required properties:
> +  - compatible: "stm32f429-disco,ltdc-panel", "ilitek,ili9341"
> +    (full system-specific compatible is always required to look up
> configuration)
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
> +media/video-interfaces.txt. This node should describe panel's video
> bus.
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
> diff --git a/arch/arm/boot/dts/stm32f4-pinctrl.dtsi
> b/arch/arm/boot/dts/stm32f4-pinctrl.dtsi
> index 392fa14..45b68f4 100644
> --- a/arch/arm/boot/dts/stm32f4-pinctrl.dtsi
> +++ b/arch/arm/boot/dts/stm32f4-pinctrl.dtsi
> @@ -316,6 +316,85 @@
>  				};
>  			};
>  
> +			ltdc_pins_f429_disco: ltdc-1 {
> +				pins {
> +					pinmux = <STM32_PINMUX('C',
> 6,  AF14)>,
> +						/* LCD_HSYNC */
> +						 <STM32_PINMUX('A',
> 4,  AF14)>,
> +						 /* LCD_VSYNC */
> +						 <STM32_PINMUX('G',
> 7,  AF14)>,
> +						 /* LCD_CLK */
> +						 <STM32_PINMUX('C', 10,
> AF14)>,
> +						 /* LCD_R2 */
> +						 <STM32_PINMUX('B',
> 0,  AF9)>,
> +						 /* LCD_R3 */
> +						 <STM32_PINMUX('A', 11,
> AF14)>,
> +						 /* LCD_R4 */
> +						 <STM32_PINMUX('A', 12,
> AF14)>,
> +						 /* LCD_R5 */
> +						 <STM32_PINMUX('B',
> 1,  AF9)>,
> +						 /* LCD_R6*/
> +						 <STM32_PINMUX('G',
> 6,  AF14)>,
> +						 /* LCD_R7 */
> +						 <STM32_PINMUX('A',
> 6,  AF14)>,
> +						 /* LCD_G2 */
> +						 <STM32_PINMUX('G', 10,
> AF9)>,
> +						 /* LCD_G3 */
> +						 <STM32_PINMUX('B', 10,
> AF14)>,
> +						 /* LCD_G4 */
> +						 <STM32_PINMUX('D',
> 6,  AF14)>,
> +						 /* LCD_B2 */
> +						 <STM32_PINMUX('G', 11,
> AF14)>,
> +						 /* LCD_B3*/
> +						 <STM32_PINMUX('B', 11,
> AF14)>,
> +						 /* LCD_G5 */
> +						 <STM32_PINMUX('C',
> 7,  AF14)>,
> +						 /* LCD_G6 */
> +						 <STM32_PINMUX('D',
> 3,  AF14)>,
> +						 /* LCD_G7 */
> +						 <STM32_PINMUX('G', 12,
> AF9)>,
> +						 /* LCD_B4 */
> +						 <STM32_PINMUX('A',
> 3,  AF14)>,
> +						 /* LCD_B5 */
> +						 <STM32_PINMUX('B',
> 8,  AF14)>,
> +						 /* LCD_B6 */
> +						 <STM32_PINMUX('B',
> 9,  AF14)>,
> +						 /* LCD_B7 */
> +						 <STM32_PINMUX('F', 10,
> AF14)>;
> +						 /* LCD_DE */
> +					slew-rate = <2>;
> +				};
> +			};
> +
> +			i2c3_pins: i2c3-0 {
> +				pins {
> +					pinmux = <STM32_PINMUX('C', 9,
> AF4)>,
> +						/* I2C3_SDA */
> +						 <STM32_PINMUX('A', 8,
> AF4)>;
> +						/* I2C3_SCL */
> +					bias-disable;
> +					drive-open-drain;
> +					slew-rate = <3>;
> +				};
> +			};
> +
> +			spi5_pins: spi5-0 {
> +				pins1 {
> +					pinmux = <STM32_PINMUX('F', 7,
> AF5)>,
> +						/* SPI5_CLK */
> +						 <STM32_PINMUX('F', 9,
> AF5)>;
> +						/* SPI5_MOSI */
> +					bias-disable;
> +					drive-push-pull;
> +					slew-rate = <0>;
> +				};
> +				pins2 {
> +					pinmux = <STM32_PINMUX('F', 8,
> AF5)>;
> +						/* SPI5_MISO */
> +					bias-disable;
> +				};
> +			};
> +
>  			dcmi_pins: dcmi-0 {
>  				pins {
>  					pinmux = <STM32_PINMUX('A', 4,
> AF13)>, /* DCMI_HSYNC */
> diff --git a/arch/arm/boot/dts/stm32f429-disco.dts
> b/arch/arm/boot/dts/stm32f429-disco.dts
> index 30c0f67..55eed05 100644
> --- a/arch/arm/boot/dts/stm32f429-disco.dts
> +++ b/arch/arm/boot/dts/stm32f429-disco.dts
> @@ -49,6 +49,8 @@
>  #include "stm32f429.dtsi"
>  #include "stm32f429-pinctrl.dtsi"
>  #include <dt-bindings/input/input.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/gpio/gpio.h>
>  
>  / {
>  	model = "STMicroelectronics STM32F429i-DISCO board";
> @@ -98,6 +100,14 @@
>  		regulator-name = "vcc5_host1";
>  		regulator-always-on;
>  	};
> +
> +	reg_3p3v: regulator-3p3v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "3P3V";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-always-on;
> +	};
>  };
>  
>  &clk_hse {
> @@ -127,3 +137,81 @@
>  	pinctrl-names = "default";
>  	status = "okay";
>  };
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
> +	cs-gpios = <&gpioc 1 GPIO_ACTIVE_LOW>,<&gpioc 2
> GPIO_ACTIVE_LOW>;
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
> +		compatible = "stm32f429-disco,ltdc-panel",
> "ilitek,ili9341";
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

The above ADC related settings should go into the MFD device with
compatible "st,stmpe811". The use of those in touchscreen is deprecated.

Please check the bindings:
Documentation/devicetree/bindings/input/touchs
creen/stmpe.txt
Documentation/devicetree/bindings/mfd/stmpe.txt

Best Regards,
Philippe

> +			st,ave-ctrl = <1>;
> +			st,touch-det-delay = <2>;
> +			st,settling = <2>;
> +			st,fraction-z = <7>;
> +			st,i-drive = <1>;
> +		};
> +	};
> +};
> diff --git a/arch/arm/boot/dts/stm32f429.dtsi
> b/arch/arm/boot/dts/stm32f429.dtsi
> index d777069..257b843 100644
> --- a/arch/arm/boot/dts/stm32f429.dtsi
> +++ b/arch/arm/boot/dts/stm32f429.dtsi
> @@ -402,6 +402,18 @@
>  			status = "disabled";
>  		};
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
>  		dac: dac@40007400 {
>  			compatible = "st,stm32f4-dac-core";
>  			reg = <0x40007400 0x400>;
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
