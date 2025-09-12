Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D1CFB550E6
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 16:21:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0CE410EC67;
	Fri, 12 Sep 2025 14:21:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="k4Nx8IC9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 037C810EC67
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 14:21:12 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-45cb5492350so15257905e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 07:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757686870; x=1758291670; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=Mh847jTVsdHp5PSiZloNgRx7N4mwQX3rcBfkpvW4srE=;
 b=k4Nx8IC9029Zm7TXx5niK1ok+h401BaGg5DvHo0wJNdBIXlWUlyQfHopiTuWyb41C4
 HCsh41eDjWUPywnARQWi0CN/iZeuWVi6y6AGlCoF8pshqQNW0OvYW3Bku/6X1E/S1Zjy
 iMyVxFyrzmielij026QSoxK7VtOnJ2qEons29rni7ty1wYaNr8yoCJNrN6JcmWMSlMul
 sxxbnnceyrNAukzmo2b70Zub1A3O9QHExUev+Uo67izQ89jgzEtcSRgwPOdLg1rU7L0p
 u8t3LRfyh9cMIel+MMGgxBwop4Bs8OpApxUBAWLOZW3EmUADcMbrKpHKkml1RODIAcTt
 whjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757686870; x=1758291670;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Mh847jTVsdHp5PSiZloNgRx7N4mwQX3rcBfkpvW4srE=;
 b=ZpNQlFXLgf5alVtqViy0elT8HWGSeAC/kF8xkMmsMV8bWbTdA6sTUgINznbZ0CthGC
 BHMj9eZp2DmPU3E0RobrCsfps+PqI7ChrMOFGrep/69UEccc9nZh8P21iyWSX8eoCr83
 th61+bYYlbzhn9JJ5NErZGD5tFNb21qcikTAkE+NBru/abZKd/Pnd5RhR1VtAMN9eMSu
 tloLx9+l0ER/pDgyUW7vreBPhDlBlx/OlU8U5TbCWLctmpdv2p1oHzrY7NSzRSQesXRa
 h9C0wIGQGy5MsZKBQVQv72VSax6JK4UVtxdBFBY+3KIfO5rTDJAjOjXkTJUeESj+GEKh
 sxfA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6alKfGus4luB5I5aWIXIGA434N09m+D/daF6adK7DR/TDJrJvLgG1t73nKLc3BGlBArNsrhhrBJk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxnBFOOU9ONdYgmL/+1gmNJ6lI4aSKMu7rVyOn+tY5sJRoQox7t
 7y8dAI2VnLOGUvRBTJ3BrzC6TUUY5CHOF3Am4k6hN+M5vKbGERwoH8iT
X-Gm-Gg: ASbGncuLedzHyWDA6z8kvjnbeJ7xdh4jpkQUPn6/TM/BqEmrfw+ddnQlTqzLHQwiHKP
 FXBgXSDs6trQrkmMmv46mqZTzDvX/TxVJAXkTK29ex74pup9OjjeXTUIKigA6zu66lpfSSeZpgD
 mYRB5NAI+A3qzbjTYGcUbaH/AbKmp/JMfu6Oer3CU1eDlkR0vEHCvm4q6cLY0BRc0p2A1KRoHDx
 CJfcDWatSjk6imfBrSHtIg6+40CQD++APU6PuTWZFmY2Ln0dLTsLz+bNilzVctJr7d/ShuQ5ZQy
 DIBwdt6v7ukwobGUjevC7QajsTIx5edyWsYM6cbZ+LAc8kdsxB6nRrA0fJapoNvjEYIoAguRbFh
 hCx0jH7oq3LnYeQlCt38hcapKSFTfEUUgF8hrHYe+vxVzaih4Trbb
X-Google-Smtp-Source: AGHT+IEgVeXeyJbbLWzjxvD2c17xr/vxYAjjhHQO52g1Vm4B1ScelvqGjTFjTPOjVLrbuAtUqgjPzg==
X-Received: by 2002:a05:600c:4453:b0:45d:d356:c358 with SMTP id
 5b1f17b1804b1-45f211db372mr39596505e9.16.1757686870181; 
 Fri, 12 Sep 2025 07:21:10 -0700 (PDT)
Received: from [192.168.2.177] ([91.116.220.47])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3e760787080sm6943265f8f.20.2025.09.12.07.21.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Sep 2025 07:21:09 -0700 (PDT)
Message-ID: <cbbdf567-7039-40cd-8e76-5e0d05354af1@gmail.com>
Date: Fri, 12 Sep 2025 16:18:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 29/38] arm64: dts: mediatek: mt8183: Fix pinctrl node names
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-mediatek@lists.infradead.org, robh@kernel.org
Cc: herbert@gondor.apana.org.au, davem@davemloft.net, krzk+dt@kernel.org,
 conor+dt@kernel.org, chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, jassisinghbrar@gmail.com,
 mchehab@kernel.org, chunfeng.yun@mediatek.com, vkoul@kernel.org,
 kishon@kernel.org, sean.wang@kernel.org, linus.walleij@linaro.org,
 lgirdwood@gmail.com, broonie@kernel.org, andersson@kernel.org,
 mathieu.poirier@linaro.org, daniel.lezcano@linaro.org, tglx@linutronix.de,
 atenart@kernel.org, jitao.shi@mediatek.com, ck.hu@mediatek.com,
 houlong.wei@mediatek.com, kyrie.wu@mediatek.corp-partner.google.com,
 andy.teng@mediatek.com, tinghan.shen@mediatek.com, jiaxin.yu@mediatek.com,
 shane.chien@mediatek.com, olivia.wen@mediatek.com, granquet@baylibre.com,
 eugen.hristev@linaro.org, arnd@arndb.de, sam.shih@mediatek.com,
 jieyy.yang@mediatek.com, frank-w@public-files.de, mwalle@kernel.org,
 fparent@baylibre.com, linux-crypto@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-gpio@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-sound@vger.kernel.org
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
 <20250724083914.61351-30-angelogioacchino.delregno@collabora.com>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <matthias.bgg@gmail.com>
Autocrypt: addr=matthias.bgg@gmail.com; keydata=
 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
In-Reply-To: <20250724083914.61351-30-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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



On 24/07/2025 10:39, AngeloGioacchino Del Regno wrote:
> Fix the pinctrl node names to adhere to the bindings, as the main
> pin node is supposed to be named like "uart0-pins" and the pinmux
> node named like "pins-bus".
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Applied, thanks

> ---
>   .../mediatek/mt8183-kukui-audio-da7219.dtsi   |  4 +-
>   .../mediatek/mt8183-kukui-audio-ts3a227e.dtsi |  2 +-
>   .../dts/mediatek/mt8183-kukui-jacuzzi.dtsi    | 22 +++---
>   .../dts/mediatek/mt8183-kukui-kakadu.dtsi     | 16 ++--
>   .../dts/mediatek/mt8183-kukui-kodama.dtsi     | 12 +--
>   .../boot/dts/mediatek/mt8183-kukui-krane.dtsi | 12 +--
>   .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 78 +++++++++----------
>   7 files changed, 73 insertions(+), 73 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-audio-da7219.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-audio-da7219.dtsi
> index 586eee79c73c..f69ffcb9792a 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-audio-da7219.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-audio-da7219.dtsi
> @@ -39,8 +39,8 @@ da7219_aad {
>   };
>   
>   &pio {
> -	da7219_pins: da7219_pins {
> -		pins1 {
> +	da7219_pins: da7219-pins {
> +		pins-intn {
>   			pinmux = <PINMUX_GPIO165__FUNC_GPIO165>;
>   			input-enable;
>   			bias-pull-up;
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-audio-ts3a227e.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-audio-ts3a227e.dtsi
> index 548e22c194a2..c4aedf8cbfcd 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-audio-ts3a227e.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-audio-ts3a227e.dtsi
> @@ -17,7 +17,7 @@ ts3a227e: ts3a227e@3b {
>   };
>   
>   &pio {
> -	ts3a227e_pins: ts3a227e_pins {
> +	ts3a227e_pins: ts3a227e-pins {
>   		pins1 {
>   			pinmux = <PINMUX_GPIO157__FUNC_GPIO157>;
>   			input-enable;
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
> index 80888bd4ad82..f2afca63c75a 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
> @@ -395,14 +395,14 @@ &pio {
>   		"",
>   		"";
>   
> -	pp1000_mipibrdg_en: pp1000-mipibrdg-en {
> +	pp1000_mipibrdg_en: pp1000-mipibrdg-en-pins {
>   		pins1 {
>   			pinmux = <PINMUX_GPIO54__FUNC_GPIO54>;
>   			output-low;
>   		};
>   	};
>   
> -	pp1800_mipibrdg_en: pp1800-mipibrdg-en {
> +	pp1800_mipibrdg_en: pp1800-mipibrdg-en-pins {
>   		pins1 {
>   			pinmux = <PINMUX_GPIO36__FUNC_GPIO36>;
>   			output-low;
> @@ -410,20 +410,20 @@ pins1 {
>   	};
>   
>   	pp3300_panel_pins: pp3300-panel-pins {
> -		panel_3v3_enable: panel-3v3-enable {
> +		panel_3v3_enable: pins-panel-en {
>   			pinmux = <PINMUX_GPIO35__FUNC_GPIO35>;
>   			output-low;
>   		};
>   	};
>   
> -	ppvarp_lcd_en: ppvarp-lcd-en {
> +	ppvarp_lcd_en: ppvarp-lcd-en-pins {
>   		pins1 {
>   			pinmux = <PINMUX_GPIO66__FUNC_GPIO66>;
>   			output-low;
>   		};
>   	};
>   
> -	ppvarn_lcd_en: ppvarn-lcd-en {
> +	ppvarn_lcd_en: ppvarn-lcd-en-pins {
>   		pins1 {
>   			pinmux = <PINMUX_GPIO166__FUNC_GPIO166>;
>   			output-low;
> @@ -444,27 +444,27 @@ pins2 {
>   	};
>   
>   	touchscreen_pins: touchscreen-pins {
> -		touch-int-odl {
> +		pins-intn {
>   			pinmux = <PINMUX_GPIO155__FUNC_GPIO155>;
>   			input-enable;
>   			bias-pull-up;
>   		};
>   
> -		touch-rst-l {
> +		pins-rst {
>   			pinmux = <PINMUX_GPIO156__FUNC_GPIO156>;
>   			output-high;
>   		};
>   	};
>   
>   	trackpad_pins: trackpad-pins {
> -		trackpad-int {
> +		pins-intn {
>   			pinmux = <PINMUX_GPIO7__FUNC_GPIO7>;
>   			input-enable;
>   			bias-disable; /* pulled externally */
>   		};
>   	};
>   
> -	pp3300_mipibrdg_en: pp3300-mipibrdg-en {
> +	pp3300_mipibrdg_en: pp3300-mipibrdg-en-pins {
>   		pins1 {
>   			pinmux = <PINMUX_GPIO37__FUNC_GPIO37>;
>   			output-low;
> @@ -472,13 +472,13 @@ pins1 {
>   	};
>   
>   	volume_button_pins: volume-button-pins {
> -		voldn-btn-odl {
> +		pins-voldn {
>   			pinmux = <PINMUX_GPIO6__FUNC_GPIO6>;
>   			input-enable;
>   			bias-pull-up;
>   		};
>   
> -		volup-btn-odl {
> +		pins-volup {
>   			pinmux = <PINMUX_GPIO5__FUNC_GPIO5>;
>   			input-enable;
>   			bias-pull-up;
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi
> index ff02f63bac29..472d4987615a 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi
> @@ -304,35 +304,35 @@ &pio {
>   		"",
>   		"";
>   
> -	ppvarp_lcd_en: ppvarp-lcd-en {
> +	ppvarp_lcd_en: ppvarp-lcd-en-pins {
>   		pins1 {
>   			pinmux = <PINMUX_GPIO66__FUNC_GPIO66>;
>   			output-low;
>   		};
>   	};
>   
> -	ppvarn_lcd_en: ppvarn-lcd-en {
> +	ppvarn_lcd_en: ppvarn-lcd-en-pins {
>   		pins1 {
>   			pinmux = <PINMUX_GPIO166__FUNC_GPIO166>;
>   			output-low;
>   		};
>   	};
>   
> -	pp1800_lcd_en: pp1800-lcd-en {
> +	pp1800_lcd_en: pp1800-lcd-en-pins {
>   		pins1 {
>   			pinmux = <PINMUX_GPIO36__FUNC_GPIO36>;
>   			output-low;
>   		};
>   	};
>   
> -	open_touch: open_touch {
> -		irq_pin {
> +	open_touch: opentouch-pins {
> +		pins-intn {
>   			pinmux = <PINMUX_GPIO155__FUNC_GPIO155>;
>   			input-enable;
>   			bias-pull-up;
>   		};
>   
> -		rst_pin {
> +		pins-rst {
>   			pinmux = <PINMUX_GPIO156__FUNC_GPIO156>;
>   
>   			/*
> @@ -349,8 +349,8 @@ rst_pin {
>   		};
>   	};
>   
> -	pen_eject: peneject {
> -		pen_eject {
> +	pen_eject: pen-pins {
> +		pins-eject {
>   			pinmux = <PINMUX_GPIO6__FUNC_GPIO6>;
>   			input-enable;
>   			/* External pull-up. */
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi
> index da6e767b4cee..1b21e3958061 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi
> @@ -292,35 +292,35 @@ &pio {
>   		"",
>   		"";
>   
> -	ppvarp_lcd_en: ppvarp-lcd-en {
> +	ppvarp_lcd_en: ppvarp-lcd-en-pins {
>   		pins1 {
>   			pinmux = <PINMUX_GPIO66__FUNC_GPIO66>;
>   			output-low;
>   		};
>   	};
>   
> -	ppvarn_lcd_en: ppvarn-lcd-en {
> +	ppvarn_lcd_en: ppvarn-lcd-en-pins {
>   		pins1 {
>   			pinmux = <PINMUX_GPIO166__FUNC_GPIO166>;
>   			output-low;
>   		};
>   	};
>   
> -	pp1800_lcd_en: pp1800-lcd-en {
> +	pp1800_lcd_en: pp1800-lcd-en-pins {
>   		pins1 {
>   			pinmux = <PINMUX_GPIO36__FUNC_GPIO36>;
>   			output-low;
>   		};
>   	};
>   
> -	touch_default: touchdefault {
> -		pin_irq {
> +	touch_default: touch-pins {
> +		pins-intn {
>   			pinmux = <PINMUX_GPIO155__FUNC_GPIO155>;
>   			input-enable;
>   			bias-pull-up;
>   		};
>   
> -		touch_pin_reset: pin_reset {
> +		touch_pin_reset: pins-rst {
>   			pinmux = <PINMUX_GPIO156__FUNC_GPIO156>;
>   
>   			/*
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi
> index 8b56b8564ed7..a85c73b43195 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi
> @@ -296,35 +296,35 @@ &pio {
>   		"",
>   		"";
>   
> -	ppvarp_lcd_en: ppvarp-lcd-en {
> +	ppvarp_lcd_en: ppvarp-lcd-en-pins {
>   		pins1 {
>   			pinmux = <PINMUX_GPIO66__FUNC_GPIO66>;
>   			output-low;
>   		};
>   	};
>   
> -	ppvarn_lcd_en: ppvarn-lcd-en {
> +	ppvarn_lcd_en: ppvarn-lcd-en-pins {
>   		pins1 {
>   			pinmux = <PINMUX_GPIO166__FUNC_GPIO166>;
>   			output-low;
>   		};
>   	};
>   
> -	pp1800_lcd_en: pp1800-lcd-en {
> +	pp1800_lcd_en: pp1800-lcd-en-pins {
>   		pins1 {
>   			pinmux = <PINMUX_GPIO36__FUNC_GPIO36>;
>   			output-low;
>   		};
>   	};
>   
> -	open_touch: open_touch {
> -		irq_pin {
> +	open_touch: opentouch-pins {
> +		pins-intn {
>   			pinmux = <PINMUX_GPIO155__FUNC_GPIO155>;
>   			input-enable;
>   			bias-pull-up;
>   		};
>   
> -		rst_pin {
> +		pins-rst {
>   			pinmux = <PINMUX_GPIO156__FUNC_GPIO156>;
>   
>   			/*
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> index 400c61d11035..8f3a0e85b4ed 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> @@ -435,7 +435,7 @@ &mt6358_vsram_gpu_reg {
>   };
>   
>   &pio {
> -	aud_pins_default: audiopins {
> +	aud_pins_default: audio-pins {
>   		pins-bus {
>   			pinmux = <PINMUX_GPIO97__FUNC_I2S2_MCK>,
>   				<PINMUX_GPIO98__FUNC_I2S2_BCK>,
> @@ -457,7 +457,7 @@ pins-bus {
>   		};
>   	};
>   
> -	aud_pins_tdm_out_on: audiotdmouton {
> +	aud_pins_tdm_out_on: audio-tdmout-on-pins {
>   		pins-bus {
>   			pinmux = <PINMUX_GPIO169__FUNC_TDM_BCK_2ND>,
>   				<PINMUX_GPIO170__FUNC_TDM_LRCK_2ND>,
> @@ -469,7 +469,7 @@ pins-bus {
>   		};
>   	};
>   
> -	aud_pins_tdm_out_off: audiotdmoutoff {
> +	aud_pins_tdm_out_off: audio-tdmout-off-pins {
>   		pins-bus {
>   			pinmux = <PINMUX_GPIO169__FUNC_GPIO169>,
>   				<PINMUX_GPIO170__FUNC_GPIO170>,
> @@ -490,22 +490,22 @@ pins-bt-en {
>   		};
>   	};
>   
> -	ec_ap_int_odl: ec-ap-int-odl {
> -		pins1 {
> +	ec_ap_int_odl: ec-ap-int-odl-pins {
> +		pins-intn {
>   			pinmux = <PINMUX_GPIO151__FUNC_GPIO151>;
>   			input-enable;
>   			bias-pull-up;
>   		};
>   	};
>   
> -	h1_int_od_l: h1-int-od-l {
> -		pins1 {
> +	h1_int_od_l: h1-int-od-l-pins {
> +		pins-intn {
>   			pinmux = <PINMUX_GPIO153__FUNC_GPIO153>;
>   			input-enable;
>   		};
>   	};
>   
> -	i2c0_pins: i2c0 {
> +	i2c0_pins: i2c0-pins {
>   		pins-bus {
>   			pinmux = <PINMUX_GPIO82__FUNC_SDA0>,
>   				 <PINMUX_GPIO83__FUNC_SCL0>;
> @@ -513,7 +513,7 @@ pins-bus {
>   		};
>   	};
>   
> -	i2c1_pins: i2c1 {
> +	i2c1_pins: i2c1-pins {
>   		pins-bus {
>   			pinmux = <PINMUX_GPIO81__FUNC_SDA1>,
>   				 <PINMUX_GPIO84__FUNC_SCL1>;
> @@ -521,7 +521,7 @@ pins-bus {
>   		};
>   	};
>   
> -	i2c2_pins: i2c2 {
> +	i2c2_pins: i2c2-pins {
>   		pins-bus {
>   			pinmux = <PINMUX_GPIO103__FUNC_SCL2>,
>   				 <PINMUX_GPIO104__FUNC_SDA2>;
> @@ -529,7 +529,7 @@ pins-bus {
>   		};
>   	};
>   
> -	i2c3_pins: i2c3 {
> +	i2c3_pins: i2c3-pins {
>   		pins-bus {
>   			pinmux = <PINMUX_GPIO50__FUNC_SCL3>,
>   				 <PINMUX_GPIO51__FUNC_SDA3>;
> @@ -537,7 +537,7 @@ pins-bus {
>   		};
>   	};
>   
> -	i2c4_pins: i2c4 {
> +	i2c4_pins: i2c4-pins {
>   		pins-bus {
>   			pinmux = <PINMUX_GPIO105__FUNC_SCL4>,
>   				 <PINMUX_GPIO106__FUNC_SDA4>;
> @@ -545,7 +545,7 @@ pins-bus {
>   		};
>   	};
>   
> -	i2c5_pins: i2c5 {
> +	i2c5_pins: i2c5-pins {
>   		pins-bus {
>   			pinmux = <PINMUX_GPIO48__FUNC_SCL5>,
>   				 <PINMUX_GPIO49__FUNC_SDA5>;
> @@ -553,7 +553,7 @@ pins-bus {
>   		};
>   	};
>   
> -	i2c6_pins: i2c6 {
> +	i2c6_pins: i2c6-pins {
>   		pins-bus {
>   			pinmux = <PINMUX_GPIO11__FUNC_SCL6>,
>   				 <PINMUX_GPIO12__FUNC_SDA6>;
> @@ -561,7 +561,7 @@ pins-bus {
>   		};
>   	};
>   
> -	mmc0_pins_default: mmc0-pins-default {
> +	mmc0_pins_default: mmc0-default-pins {
>   		pins-cmd-dat {
>   			pinmux = <PINMUX_GPIO123__FUNC_MSDC0_DAT0>,
>   				 <PINMUX_GPIO128__FUNC_MSDC0_DAT1>,
> @@ -625,7 +625,7 @@ pins-rst {
>   		};
>   	};
>   
> -	mmc1_pins_default: mmc1-pins-default {
> +	mmc1_pins_default: mmc1-default-pins {
>   		pins-cmd-dat {
>   			pinmux = <PINMUX_GPIO31__FUNC_MSDC1_CMD>,
>   				 <PINMUX_GPIO32__FUNC_MSDC1_DAT0>,
> @@ -643,7 +643,7 @@ pins-clk {
>   		};
>   	};
>   
> -	mmc1_pins_uhs: mmc1-pins-uhs {
> +	mmc1_pins_uhs: mmc1-uhs-pins {
>   		pins-cmd-dat {
>   			pinmux = <PINMUX_GPIO31__FUNC_MSDC1_CMD>,
>   				 <PINMUX_GPIO32__FUNC_MSDC1_DAT0>,
> @@ -663,15 +663,15 @@ pins-clk {
>   		};
>   	};
>   
> -	panel_pins_default: panel-pins-default {
> -		panel-reset {
> +	panel_pins_default: panel-pins {
> +		pins-panel-reset {
>   			pinmux = <PINMUX_GPIO45__FUNC_GPIO45>;
>   			output-low;
>   			bias-pull-up;
>   		};
>   	};
>   
> -	pwm0_pin_default: pwm0-pin-default {
> +	pwm0_pin_default: pwm0-pins {
>   		pins1 {
>   			pinmux = <PINMUX_GPIO176__FUNC_GPIO176>;
>   			output-high;
> @@ -682,15 +682,15 @@ pins2 {
>   		};
>   	};
>   
> -	scp_pins: scp {
> +	scp_pins: scp-pins {
>   		pins-scp-uart {
>   			pinmux = <PINMUX_GPIO110__FUNC_TP_URXD1_AO>,
>   				 <PINMUX_GPIO112__FUNC_TP_UTXD1_AO>;
>   		};
>   	};
>   
> -	spi0_pins: spi0 {
> -		pins-spi {
> +	spi0_pins: spi0-pins {
> +		pins-bus {
>   			pinmux = <PINMUX_GPIO85__FUNC_SPI0_MI>,
>   				 <PINMUX_GPIO86__FUNC_GPIO86>,
>   				 <PINMUX_GPIO87__FUNC_SPI0_MO>,
> @@ -699,8 +699,8 @@ pins-spi {
>   		};
>   	};
>   
> -	spi1_pins: spi1 {
> -		pins-spi {
> +	spi1_pins: spi1-pins {
> +		pins-bus {
>   			pinmux = <PINMUX_GPIO161__FUNC_SPI1_A_MI>,
>   				 <PINMUX_GPIO162__FUNC_SPI1_A_CSB>,
>   				 <PINMUX_GPIO163__FUNC_SPI1_A_MO>,
> @@ -709,21 +709,21 @@ pins-spi {
>   		};
>   	};
>   
> -	spi2_pins: spi2 {
> -		pins-spi {
> +	spi2_pins: spi2-pins {
> +		pins-bus {
>   			pinmux = <PINMUX_GPIO0__FUNC_SPI2_CSB>,
>   				 <PINMUX_GPIO1__FUNC_SPI2_MO>,
>   				 <PINMUX_GPIO2__FUNC_SPI2_CLK>;
>   			bias-disable;
>   		};
> -		pins-spi-mi {
> +		pins-miso {
>   			pinmux = <PINMUX_GPIO94__FUNC_SPI2_MI>;
>   			mediatek,pull-down-adv = <00>;
>   		};
>   	};
>   
> -	spi3_pins: spi3 {
> -		pins-spi {
> +	spi3_pins: spi3-pins {
> +		pins-bus {
>   			pinmux = <PINMUX_GPIO21__FUNC_SPI3_MI>,
>   				 <PINMUX_GPIO22__FUNC_SPI3_CSB>,
>   				 <PINMUX_GPIO23__FUNC_SPI3_MO>,
> @@ -732,8 +732,8 @@ pins-spi {
>   		};
>   	};
>   
> -	spi4_pins: spi4 {
> -		pins-spi {
> +	spi4_pins: spi4-pins {
> +		pins-bus {
>   			pinmux = <PINMUX_GPIO17__FUNC_SPI4_MI>,
>   				 <PINMUX_GPIO18__FUNC_SPI4_CSB>,
>   				 <PINMUX_GPIO19__FUNC_SPI4_MO>,
> @@ -742,8 +742,8 @@ pins-spi {
>   		};
>   	};
>   
> -	spi5_pins: spi5 {
> -		pins-spi {
> +	spi5_pins: spi5-pins {
> +		pins-bus {
>   			pinmux = <PINMUX_GPIO13__FUNC_SPI5_MI>,
>   				 <PINMUX_GPIO14__FUNC_SPI5_CSB>,
>   				 <PINMUX_GPIO15__FUNC_SPI5_MO>,
> @@ -752,7 +752,7 @@ pins-spi {
>   		};
>   	};
>   
> -	uart0_pins_default: uart0-pins-default {
> +	uart0_pins_default: uart0-pins {
>   		pins-rx {
>   			pinmux = <PINMUX_GPIO95__FUNC_URXD0>;
>   			input-enable;
> @@ -763,7 +763,7 @@ pins-tx {
>   		};
>   	};
>   
> -	uart1_pins_default: uart1-pins-default {
> +	uart1_pins_default: uart1-pins {
>   		pins-rx {
>   			pinmux = <PINMUX_GPIO121__FUNC_URXD1>;
>   			input-enable;
> @@ -781,7 +781,7 @@ pins-cts {
>   		};
>   	};
>   
> -	uart1_pins_sleep: uart1-pins-sleep {
> +	uart1_pins_sleep: uart1-sleep-pins {
>   		pins-rx {
>   			pinmux = <PINMUX_GPIO121__FUNC_GPIO121>;
>   			input-enable;
> @@ -799,14 +799,14 @@ pins-cts {
>   		};
>   	};
>   
> -	wifi_pins_pwrseq: wifi-pins-pwrseq {
> +	wifi_pins_pwrseq: wifi-pwr-pins {
>   		pins-wifi-enable {
>   			pinmux = <PINMUX_GPIO119__FUNC_GPIO119>;
>   			output-low;
>   		};
>   	};
>   
> -	wifi_pins_wakeup: wifi-pins-wakeup {
> +	wifi_pins_wakeup: wifi-wake-pins {
>   		pins-wifi-wakeup {
>   			pinmux = <PINMUX_GPIO113__FUNC_GPIO113>;
>   			input-enable;

