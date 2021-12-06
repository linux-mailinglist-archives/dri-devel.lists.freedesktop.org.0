Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 296AD4693E7
	for <lists+dri-devel@lfdr.de>; Mon,  6 Dec 2021 11:29:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 670C273E06;
	Mon,  6 Dec 2021 10:21:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D0EC73890
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Dec 2021 01:06:40 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D63BBB80EEA;
 Mon,  6 Dec 2021 01:06:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 931FDC00446;
 Mon,  6 Dec 2021 01:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638752795;
 bh=ZnP+uv8sr4aux3SE5ct0uiDkE3xgo3eccOirZWONzA8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=deWdiGABrZbwG/VCJuGmBdd2Ocst7SrZ3CXxVRrnGo948b956XOqEXspGL1X84hhv
 eZGraoKSMhNWu8/nTnnBNnYCdwV6i+FOF8A4zN/3IEYCVLXXAEC4jzvWqigF/CY4rT
 8v+qWkF/eQ1s5e/iBOx4e3kf/v7kXrGGzbaxAEDgaXWIuk/bqtVrlIkP47eXgLV+cY
 ePApOnkNU4QlcOZ9c0EPw73J+gRMVepMCuchodinIkGS55/yefMIR6thsVMbe2yHWC
 Bni4tnamG7nBcpb/75MAEevi35Bsbg9/mmQAXKipgdWRfu+mZ3qwatT9FGaQqMogA9
 X3LNyW6hnR/sg==
Date: Mon, 6 Dec 2021 09:06:28 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Subject: Re: [PATCH v1 4/4] ARM: dts: imx6dl: plym2m, prtvt7, victgo:  make
 use of new resistive-adc-touch driver
Message-ID: <20211206010627.GK4216@dragon>
References: <20211122124310.2796505-1-o.rempel@pengutronix.de>
 <20211122124310.2796505-4-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211122124310.2796505-4-o.rempel@pengutronix.de>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Robin van der Gracht <robin@protonic.nl>, David Airlie <airlied@linux.ie>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 David Jander <david@protonic.nl>, Sam Ravnborg <sam@ravnborg.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 22, 2021 at 01:43:10PM +0100, Oleksij Rempel wrote:
> The tsc2046 is an ADC used as touchscreen controller. To share as mach
> code as possible, we should use it as actual ADC + virtual tochscreen
> controller.
> With this patch we make use of the new kernel IIO and HID infrastructure.
> 
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>

One space is enough in subject "victgo:  make".

> ---
>  arch/arm/boot/dts/imx6dl-plym2m.dts | 55 ++++++++++++++++++++---------
>  arch/arm/boot/dts/imx6dl-prtvt7.dts | 53 ++++++++++++++++++++-------
>  arch/arm/boot/dts/imx6dl-victgo.dts | 55 +++++++++++++++++++++--------
>  3 files changed, 120 insertions(+), 43 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/imx6dl-plym2m.dts b/arch/arm/boot/dts/imx6dl-plym2m.dts
> index 60fe5f14666e..e2afedae85cb 100644
> --- a/arch/arm/boot/dts/imx6dl-plym2m.dts
> +++ b/arch/arm/boot/dts/imx6dl-plym2m.dts
> @@ -101,6 +101,17 @@ reg_12v0: regulator-12v0 {
>  		regulator-min-microvolt = <12000000>;
>  		regulator-max-microvolt = <12000000>;
>  	};
> +
> +	touchscreen {
> +		compatible = "resistive-adc-touch";
> +		io-channels = <&adc 1>, <&adc 3>, <&adc 4>, <&adc 5>;
> +		io-channel-names = "y", "z1", "z2", "x";
> +		touchscreen-min-pressure = <64687>;
> +		touchscreen-inverted-x;
> +		touchscreen-inverted-y;
> +		touchscreen-x-plate-ohms = <300>;
> +		touchscreen-y-plate-ohms = <800>;
> +	};
>  };
>  
>  &can1 {
> @@ -129,26 +140,38 @@ &ecspi2 {
>  	pinctrl-0 = <&pinctrl_ecspi2>;
>  	status = "okay";
>  
> -	touchscreen@0 {
> -		compatible = "ti,tsc2046";
> +	adc: adc@0 {

Isn't label name "adc" too generic?

> +		compatible = "ti,tsc2046e-adc";
>  		reg = <0>;
>  		pinctrl-0 = <&pinctrl_tsc2046>;
>  		pinctrl-names ="default";
> -		spi-max-frequency = <100000>;
> -		interrupts-extended = <&gpio3 20 IRQ_TYPE_EDGE_FALLING>;
> -		pendown-gpio = <&gpio3 20 GPIO_ACTIVE_LOW>;
> +		spi-max-frequency = <1000000>;
> +		interrupts-extended = <&gpio3 20 IRQ_TYPE_LEVEL_LOW>;
> +		#io-channel-cells = <1>;
>  
> -		touchscreen-inverted-x;
> -		touchscreen-inverted-y;
> -		touchscreen-max-pressure = <4095>;
> -
> -		ti,vref-delay-usecs = /bits/ 16 <100>;
> -		ti,x-plate-ohms = /bits/ 16 <800>;
> -		ti,y-plate-ohms = /bits/ 16 <300>;
> -		ti,debounce-max = /bits/ 16 <3>;
> -		ti,debounce-tol = /bits/ 16 <70>;
> -		ti,debounce-rep = /bits/ 16 <3>;
> -		wakeup-source;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		channel@1 {
> +			reg = <1>;
> +			settling-time-us = <700>;
> +			oversampling-ratio = <5>;
> +		};

Have a newline between child nodes.

Shawn

> +		channel@3 {
> +			reg = <3>;
> +			settling-time-us = <700>;
> +			oversampling-ratio = <5>;
> +		};
> +		channel@4 {
> +			reg = <4>;
> +			settling-time-us = <700>;
> +			oversampling-ratio = <5>;
> +		};
> +		channel@5 {
> +			reg = <5>;
> +			settling-time-us = <700>;
> +			oversampling-ratio = <5>;
> +		};
>  	};
>  };
>  
> diff --git a/arch/arm/boot/dts/imx6dl-prtvt7.dts b/arch/arm/boot/dts/imx6dl-prtvt7.dts
> index 02b53df03e6f..c361e0683973 100644
> --- a/arch/arm/boot/dts/imx6dl-prtvt7.dts
> +++ b/arch/arm/boot/dts/imx6dl-prtvt7.dts
> @@ -235,6 +235,17 @@ simple-audio-card,codec {
>  			frame-master;
>  		};
>  	};
> +
> +	touchscreen {
> +		compatible = "resistive-adc-touch";
> +		io-channels = <&adc 1>, <&adc 3>, <&adc 4>, <&adc 5>;
> +		io-channel-names = "y", "z1", "z2", "x";
> +		touchscreen-min-pressure = <64687>;
> +		touchscreen-inverted-x;
> +		touchscreen-inverted-y;
> +		touchscreen-x-plate-ohms = <300>;
> +		touchscreen-y-plate-ohms = <800>;
> +	};
>  };
>  
>  &audmux {
> @@ -277,22 +288,38 @@ &ecspi2 {
>  	pinctrl-0 = <&pinctrl_ecspi2>;
>  	status = "okay";
>  
> -	touchscreen@0 {
> -		compatible = "ti,tsc2046";
> +	adc: adc@0 {
> +		compatible = "ti,tsc2046e-adc";
>  		reg = <0>;
>  		pinctrl-0 = <&pinctrl_tsc>;
>  		pinctrl-names ="default";
> -		spi-max-frequency = <100000>;
> -		interrupts-extended = <&gpio3 20 IRQ_TYPE_EDGE_FALLING>;
> -		pendown-gpio = <&gpio3 20 GPIO_ACTIVE_LOW>;
> -		touchscreen-max-pressure = <4095>;
> -		ti,vref-delay-usecs = /bits/ 16 <100>;
> -		ti,x-plate-ohms = /bits/ 16 <800>;
> -		ti,y-plate-ohms = /bits/ 16 <300>;
> -		ti,debounce-max = /bits/ 16 <3>;
> -		ti,debounce-tol = /bits/ 16 <70>;
> -		ti,debounce-rep = /bits/ 16 <3>;
> -		wakeup-source;
> +		spi-max-frequency = <1000000>;
> +		interrupts-extended = <&gpio3 20 IRQ_TYPE_LEVEL_LOW>;
> +		#io-channel-cells = <1>;
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		channel@1 {
> +			reg = <1>;
> +			settling-time-us = <700>;
> +			oversampling-ratio = <5>;
> +		};
> +		channel@3 {
> +			reg = <3>;
> +			settling-time-us = <700>;
> +			oversampling-ratio = <5>;
> +		};
> +		channel@4 {
> +			reg = <4>;
> +			settling-time-us = <700>;
> +			oversampling-ratio = <5>;
> +		};
> +		channel@5 {
> +			reg = <5>;
> +			settling-time-us = <700>;
> +			oversampling-ratio = <5>;
> +		};
>  	};
>  };
>  
> diff --git a/arch/arm/boot/dts/imx6dl-victgo.dts b/arch/arm/boot/dts/imx6dl-victgo.dts
> index d37ba4ed847d..b5004b322d44 100644
> --- a/arch/arm/boot/dts/imx6dl-victgo.dts
> +++ b/arch/arm/boot/dts/imx6dl-victgo.dts
> @@ -181,6 +181,17 @@ simple-audio-card,codec {
>  			frame-master;
>  		};
>  	};
> +
> +	touchscreen {
> +		compatible = "resistive-adc-touch";
> +		io-channels = <&adc 1>, <&adc 3>, <&adc 4>, <&adc 5>;
> +		io-channel-names = "y", "z1", "z2", "x";
> +		touchscreen-min-pressure = <64687>;
> +		touchscreen-inverted-x;
> +		touchscreen-inverted-y;
> +		touchscreen-x-plate-ohms = <300>;
> +		touchscreen-y-plate-ohms = <800>;
> +	};
>  };
>  
>  &audmux {
> @@ -244,22 +255,38 @@ &ecspi2 {
>  	pinctrl-0 = <&pinctrl_ecspi2>;
>  	status = "okay";
>  
> -	touchscreen@0 {
> -		compatible = "ti,tsc2046";
> +	adc: adc@0 {
> +		compatible = "ti,tsc2046e-adc";
>  		reg = <0>;
> -		pinctrl-names = "default";
>  		pinctrl-0 = <&pinctrl_touchscreen>;
> -		spi-max-frequency = <200000>;
> -		interrupts-extended = <&gpio5 8 IRQ_TYPE_EDGE_FALLING>;
> -		pendown-gpio = <&gpio5 8 GPIO_ACTIVE_LOW>;
> -		touchscreen-size-x = <800>;
> -		touchscreen-size-y = <480>;
> -		touchscreen-inverted-y;
> -		touchscreen-max-pressure = <4095>;
> -		ti,vref-delay-usecs = /bits/ 16 <100>;
> -		ti,x-plate-ohms = /bits/ 16 <800>;
> -		ti,y-plate-ohms = /bits/ 16 <300>;
> -		wakeup-source;
> +		pinctrl-names ="default";
> +		spi-max-frequency = <1000000>;
> +		interrupts-extended = <&gpio5 8 IRQ_TYPE_LEVEL_LOW>;
> +		#io-channel-cells = <1>;
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		channel@1 {
> +			reg = <1>;
> +			settling-time-us = <700>;
> +			oversampling-ratio = <5>;
> +		};
> +		channel@3 {
> +			reg = <3>;
> +			settling-time-us = <700>;
> +			oversampling-ratio = <5>;
> +		};
> +		channel@4 {
> +			reg = <4>;
> +			settling-time-us = <700>;
> +			oversampling-ratio = <5>;
> +		};
> +		channel@5 {
> +			reg = <5>;
> +			settling-time-us = <700>;
> +			oversampling-ratio = <5>;
> +		};
>  	};
>  };
>  
> -- 
> 2.30.2
> 
