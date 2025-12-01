Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B27B2C97C9F
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 15:13:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF83710E40B;
	Mon,  1 Dec 2025 14:13:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="JsmkxqW8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4ACD10E40B
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Dec 2025 14:13:23 +0000 (UTC)
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 702E66AC;
 Mon,  1 Dec 2025 15:11:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1764598268;
 bh=ERO00CYF2jt86k6vPGoPpd3u3B8oGPoi+ij5ehgCHx4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=JsmkxqW8Fm+G8HLBckYKYetZ95hcPdDuQj1rY2fz4jjHDv2MxhALzIrVUfvN3q9QE
 Myo2ZIfOtRsXjP68qDHf2XQEzabyOLJS338/7Gy9tUP6qSMeSxsfr5jRLXs4OjmHqX
 dakVddeeKLrci4RRmv0hVCTJqZOsMDRvNbD4Yn50=
Message-ID: <96b1b7bf-ddbe-4213-a201-dc89cf2998dd@ideasonboard.com>
Date: Mon, 1 Dec 2025 16:13:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/21] ARM: dts: omap: Bind panel to panel-dpi instead of
 ti,tilcdc,panel driver
To: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
Cc: Markus Schneider-Pargmann <msp@baylibre.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miguel Gazquez <miguel.gazquez@bootlin.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-omap@vger.kernel.org, Jyri Sarha <jyri.sarha@iki.fi>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Tony Lindgren <tony@atomide.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
References: <20251126-feature_tilcdc-v1-0-49b9ef2e3aa0@bootlin.com>
 <20251126-feature_tilcdc-v1-5-49b9ef2e3aa0@bootlin.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Language: en-US
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <20251126-feature_tilcdc-v1-5-49b9ef2e3aa0@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Hi Kory,

On 26/11/2025 19:35, Kory Maincent (TI.com) wrote:
> Use panel-dpi driver instead of the deprecated tilcdc-panel driver in
> preparation for removing the tilcdc-panel driver and binding.
> 
> Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
> ---
> 
> This patch is not tested. It would be nice if someone with one of this
> board could test and validate it.
> ---
>  arch/arm/boot/dts/ti/davinci/da850-evm.dts    | 26 +++++++++++++-------------
>  arch/arm/boot/dts/ti/omap/am335x-guardian.dts | 25 +++++++++----------------
>  arch/arm/boot/dts/ti/omap/am335x-pdu001.dts   | 21 ++++++++++-----------
>  arch/arm/boot/dts/ti/omap/am335x-pepper.dts   | 22 +++++++++++-----------
>  arch/arm/boot/dts/ti/omap/am335x-sbc-t335.dts | 25 +++++++++++++------------
>  arch/arm/boot/dts/ti/omap/am335x-sl50.dts     | 25 ++++++++++++-------------
>  6 files changed, 68 insertions(+), 76 deletions(-)
> 

Doesn't this, or rather the following patches, break DTB compatibility
with all the above boards?

 Tomi

> diff --git a/arch/arm/boot/dts/ti/davinci/da850-evm.dts b/arch/arm/boot/dts/ti/davinci/da850-evm.dts
> index 38a191fb04149..79cca1f6205ef 100644
> --- a/arch/arm/boot/dts/ti/davinci/da850-evm.dts
> +++ b/arch/arm/boot/dts/ti/davinci/da850-evm.dts
> @@ -40,7 +40,7 @@ backlight: backlight-pwm {
>  	};
>  
>  	panel {
> -		compatible = "ti,tilcdc,panel";
> +		compatible = "panel-dpi";
>  		pinctrl-names = "default";
>  		pinctrl-0 = <&lcd_pins>;
>  		/*
> @@ -50,17 +50,10 @@ panel {
>  		 */
>  		status = "okay";
>  		enable-gpios = <&gpio 40 GPIO_ACTIVE_HIGH>; /* lcd_panel_pwr */
> -
> -		panel-info {
> -			ac-bias = <255>;
> -			ac-bias-intrpt = <0>;
> -			dma-burst-sz = <16>;
> -			bpp = <16>;
> -			fdd = <0x80>;
> -			sync-edge = <0>;
> -			sync-ctrl = <1>;
> -			raster-order = <0>;
> -			fifo-th = <1>;
> +		port {
> +			panel_in: endpoint {
> +				remote-endpoint = <&lcdc_out>;
> +			};
>  		};
>  
>  		display-timings {
> @@ -222,6 +215,13 @@ &rtc0 {
>  };
>  
>  &lcdc {
> +	fifo-threshold = <16>;
> +
> +	port {
> +		lcdc_out: endpoint {
> +			remote-endpoint = <&panel_in>;
> +		};
> +	};
>  	status = "okay";
>  };
>  
> @@ -459,7 +459,7 @@ &vpif {
>  	pinctrl-0 = <&vpif_capture_pins>, <&vpif_display_pins>;
>  	/*
>  	 * The vpif and the LCD are mutually exclusive.
> -	 * To enable VPIF, disable the ti,tilcdc,panel then
> +	 * To enable VPIF, disable the panel-dpi then
>  	 * change the status below to 'okay'
>  	 */
>  	status = "disabled";
> diff --git a/arch/arm/boot/dts/ti/omap/am335x-guardian.dts b/arch/arm/boot/dts/ti/omap/am335x-guardian.dts
> index 4b070e634b281..f38ce9be2c106 100644
> --- a/arch/arm/boot/dts/ti/omap/am335x-guardian.dts
> +++ b/arch/arm/boot/dts/ti/omap/am335x-guardian.dts
> @@ -68,10 +68,15 @@ gpio-poweroff {
>  	};
>  
>  	panel {
> -		compatible = "ti,tilcdc,panel";
> +		compatible = "panel-dpi";
>  		pinctrl-names = "default", "sleep";
>  		pinctrl-0 = <&lcd_pins_default &lcd_disen_pins>;
>  		pinctrl-1 = <&lcd_pins_sleep>;
> +		port {
> +			panel_in: endpoint {
> +				remote-endpoint = <&lcdc_out>;
> +			};
> +		};
>  
>  		display-timings {
>  			timing-320x240 {
> @@ -86,21 +91,9 @@ timing-320x240 {
>  				clock-frequency = <9000000>;
>  				hsync-active    = <0>;
>  				vsync-active    = <0>;
> +				pixelclk-active = <1>;
>  			};
>  		};
> -		panel-info {
> -			ac-bias           = <255>;
> -			ac-bias-intrpt    = <0>;
> -			dma-burst-sz      = <16>;
> -			bpp               = <24>;
> -			bus-width         = <16>;
> -			fdd               = <0x80>;
> -			sync-edge         = <0>;
> -			sync-ctrl         = <1>;
> -			raster-order      = <0>;
> -			fifo-th           = <0>;
> -		};
> -
>  	};
>  
>  	guardian_beeper: pwm-7 {
> @@ -265,8 +258,8 @@ &lcdc {
>  	blue-and-red-wiring = "crossed";
>  	status = "okay";
>  	port {
> -		lcdc_0: endpoint@0 {
> -			remote-endpoint = <0>;
> +		lcdc_out: endpoint@0 {
> +			remote-endpoint = <&panel_in>;
>  		};
>  	};
>  };
> diff --git a/arch/arm/boot/dts/ti/omap/am335x-pdu001.dts b/arch/arm/boot/dts/ti/omap/am335x-pdu001.dts
> index c9ccb9de21ad7..2c5229d05ade7 100644
> --- a/arch/arm/boot/dts/ti/omap/am335x-pdu001.dts
> +++ b/arch/arm/boot/dts/ti/omap/am335x-pdu001.dts
> @@ -50,20 +50,14 @@ lis3_reg: fixedregulator@1 {
>  	};
>  
>  	panel {
> -		compatible = "ti,tilcdc,panel";
> +		compatible = "panel-dpi";
>  		status = "okay";
>  		pinctrl-names = "default";
>  		pinctrl-0 = <&lcd_pins_s0>;
> -		panel-info {
> -			ac-bias           = <255>;
> -			ac-bias-intrpt    = <0>;
> -			dma-burst-sz      = <16>;
> -			bpp               = <16>;
> -			fdd               = <0x80>;
> -			sync-edge         = <0>;
> -			sync-ctrl         = <1>;
> -			raster-order      = <0>;
> -			fifo-th           = <0>;
> +		port {
> +			panel_in: endpoint {
> +				remote-endpoint = <&lcdc_out>;
> +			};
>  		};
>  
>  		display-timings {
> @@ -395,6 +389,11 @@ &rtc {
>  
>  &lcdc {
>  	status = "okay";
> +	port {
> +		lcdc_out: endpoint {
> +			remote-endpoint = <&panel_in>;
> +		};
> +	};
>  };
>  
>  &elm {
> diff --git a/arch/arm/boot/dts/ti/omap/am335x-pepper.dts b/arch/arm/boot/dts/ti/omap/am335x-pepper.dts
> index e7d561a527fdd..2760c0eab50c2 100644
> --- a/arch/arm/boot/dts/ti/omap/am335x-pepper.dts
> +++ b/arch/arm/boot/dts/ti/omap/am335x-pepper.dts
> @@ -31,7 +31,7 @@ leds: user-leds-pins {
>  	};
>  
>  	panel: lcd_panel {
> -		compatible = "ti,tilcdc,panel";
> +		compatible = "panel-dpi";
>  	};
>  
>  	sound: sound_iface {
> @@ -189,16 +189,10 @@ &panel {
>  	status = "okay";
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&lcd_pins>;
> -	panel-info {
> -		ac-bias = <255>;
> -		ac-bias-intrpt = <0>;
> -		dma-burst-sz = <16>;
> -		bpp = <32>;
> -		fdd = <0x80>;
> -		sync-edge = <0>;
> -		sync-ctrl = <1>;
> -		raster-order = <0>;
> -		fifo-th = <0>;
> +	port {
> +		panel_in: endpoint {
> +			remote-endpoint = <&lcdc_out>;
> +		};
>  	};
>  	display-timings {
>  		native-mode = <&timing0>;
> @@ -214,12 +208,18 @@ timing0: timing-480x272 {
>  			vsync-len = <10>;
>  			hsync-active = <1>;
>  			vsync-active = <1>;
> +			pixelclk-active = <1>;
>  		};
>  	};
>  };
>  
>  &lcdc {
>  	status = "okay";
> +	port {
> +		lcdc_out: endpoint {
> +			remote-endpoint = <&panel_in>;
> +		};
> +	};
>  };
>  
>  &am33xx_pinmux {
> diff --git a/arch/arm/boot/dts/ti/omap/am335x-sbc-t335.dts b/arch/arm/boot/dts/ti/omap/am335x-sbc-t335.dts
> index 2841e95d9a094..25ee855dd21a7 100644
> --- a/arch/arm/boot/dts/ti/omap/am335x-sbc-t335.dts
> +++ b/arch/arm/boot/dts/ti/omap/am335x-sbc-t335.dts
> @@ -13,23 +13,17 @@ / {
>  
>  	/* DRM display driver */
>  	panel {
> -		compatible = "ti,tilcdc,panel";
> +		compatible = "panel-dpi";
>  		status = "okay";
>  		pinctrl-names = "default", "sleep";
>  		pinctrl-0 = <&lcd_pins_default>;
>  		pinctrl-1 = <&lcd_pins_sleep>;
> -
> -		panel-info {
> -			ac-bias           = <255>;
> -			ac-bias-intrpt    = <0>;
> -			dma-burst-sz      = <16>;
> -			bpp               = <32>;
> -			fdd               = <0x80>;
> -			sync-edge         = <0>;
> -			sync-ctrl         = <1>;
> -			raster-order      = <0>;
> -			fifo-th           = <0>;
> +		port {
> +			panel_in: endpoint {
> +				remote-endpoint = <&lcdc_out>;
> +			};
>  		};
> +
>  		display-timings {
>  			/* Timing selection performed by U-Boot */
>  			timing0: lcd {/* 800x480p62 */
> @@ -44,6 +38,7 @@ timing0: lcd {/* 800x480p62 */
>  				vsync-len = <2>;
>  				hsync-active = <1>;
>  				vsync-active = <1>;
> +				pixelclk-active = <1>;
>  			};
>  			timing1: dvi { /* 1024x768p60 */
>  				clock-frequency = <65000000>;
> @@ -57,6 +52,7 @@ timing1: dvi { /* 1024x768p60 */
>  				vsync-len = <6>;
>  				hsync-active = <0>;
>  				vsync-active = <0>;
> +				pixelclk-active = <1>;
>  			};
>  		};
>  	};
> @@ -173,4 +169,9 @@ lcd-ena-hog {
>  /* Display */
>  &lcdc {
>  	status = "okay";
> +	port {
> +		lcdc_out: endpoint {
> +			remote-endpoint = <&panel_in>;
> +		};
> +	};
>  };
> diff --git a/arch/arm/boot/dts/ti/omap/am335x-sl50.dts b/arch/arm/boot/dts/ti/omap/am335x-sl50.dts
> index f3524e5ee43e2..b4b2b6d18d646 100644
> --- a/arch/arm/boot/dts/ti/omap/am335x-sl50.dts
> +++ b/arch/arm/boot/dts/ti/omap/am335x-sl50.dts
> @@ -123,22 +123,14 @@ audio_mclk: audio_mclk_gate@0 {
>  	};
>  
>  	panel: lcd_panel {
> -		compatible = "ti,tilcdc,panel";
> +		compatible = "panel-dpi";
>  		pinctrl-names = "default";
>  		pinctrl-0 = <&lcd_pins>;
>  
> -		panel-info {
> -			ac-bias = <255>;
> -			ac-bias-intrpt = <0>;
> -			dma-burst-sz = <16>;
> -			bpp = <16>;
> -			fdd = <0x80>;
> -			tft-alt-mode = <0>;
> -			mono-8bit-mode = <0>;
> -			sync-edge = <0>;
> -			sync-ctrl = <1>;
> -			raster-order = <0>;
> -			fifo-th = <0>;
> +		port {
> +			panel_in: endpoint {
> +				remote-endpoint = <&lcdc_out>;
> +			};
>  		};
>  
>  		display-timings {
> @@ -157,6 +149,8 @@ timing0: 960x128 {
>  				vfront-porch = <8>;
>  				vsync-len = <4>;
>  				vsync-active = <0>;
> +
> +				pixelclk-active = <1>;
>  			};
>  		};
>  	};
> @@ -711,6 +705,11 @@ &ehrpwm1 {
>  
>  &lcdc {
>  	status = "okay";
> +	port {
> +		lcdc_out: endpoint {
> +			remote-endpoint = <&panel_in>;
> +		};
> +	};
>  };
>  
>  &tscadc {
> 

