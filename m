Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D050A7AD9D7
	for <lists+dri-devel@lfdr.de>; Mon, 25 Sep 2023 16:14:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D735E10E26F;
	Mon, 25 Sep 2023 14:14:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D332D10E249
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Sep 2023 14:14:38 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2c00e1d4c08so107578501fa.3
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Sep 2023 07:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tuxon.dev; s=google; t=1695651277; x=1696256077; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pdnJlM7JF+2moVzvS9KjkKRpM+IbzLyByhBc3qmxTkk=;
 b=SBKhcRuuLBUAd1Jl2Zp+dKpy8dnYQkHXkjDCPpzwA9keLQfm0HzNX6HUwINk+FbQva
 PpoqMy7XXh5D/821xv04WoQcqd7X7KrrTHDk0j1mPhRd55KS78uwbM1Bu4TkH03n8PD0
 W7Y2RkB6Dv27ESjBodfcPmg3DDA2wHrLC6tUuRLLFHZAjZ5r2LlGUcVJSZZnvkHWcv8u
 tHpKrglbaYeUl8NMBu4RvBs8H8U9DiDlK3EHg16ZBk32qLN4s5jGQTnMx4dC128AEYVC
 rGL7ipkvVbwVQby9eJklToh+FdUlxn0E5xDgc0fyBxLsScXpy1H9RIBDNhrrNkUuqNZL
 2nmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695651277; x=1696256077;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pdnJlM7JF+2moVzvS9KjkKRpM+IbzLyByhBc3qmxTkk=;
 b=CEatAObN7sp7yi2kHH0CynUGTr+NBcm5dVVc/CFX/0mXBhmO42rFh+nLpAowNB6i/E
 vMbhDFxmbZw3TmWBe0abqcJlDaI3Jiq/WW+tZDX7/+AJHtHG7pKxxZ/Juy07vHdkcA20
 i41tdtuem/Xn3IkcFHefXhAKOvf3d0w8CMVcp8XAHSNCZGspS++eVQ82ETu/lN3IaD+q
 ih1wxhygGnCCthDzCpGWRIzzM+MY7+VDX/UnDHYj7dk+F+2W5SrrsBEsD2j2f3boI8tf
 0Tw84Z6VeMBAG2OjJz2fOTN9ow4v9aR7VC1pNfnRCggSzp3qqV0e6iroYzF/ip5PNk7T
 XMBA==
X-Gm-Message-State: AOJu0Yxb9Aghv5X1/m19nDreT2PaeCs8gQutmFaWHJfK/q9+odhVE8VF
 namWf8SJUn+T4rL9l/GG2wxsOBi9/okI6OndffM=
X-Google-Smtp-Source: AGHT+IGhaYzxMKF7ZSmvAOx7GaYoTLNfcicvBe0KzT7q28wHCznj4BobprovMg1GbwAPzPjv4Mw60g==
X-Received: by 2002:a2e:b04c:0:b0:2c0:240:b564 with SMTP id
 d12-20020a2eb04c000000b002c00240b564mr5478516ljl.15.1695651276877; 
 Mon, 25 Sep 2023 07:14:36 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.177])
 by smtp.gmail.com with ESMTPSA id
 n17-20020a170906089100b0099ccee57ac2sm6343849eje.194.2023.09.25.07.14.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Sep 2023 07:14:36 -0700 (PDT)
Message-ID: <3ad5d3e4-dee1-74b5-6bb2-4a4fa3d2e071@tuxon.dev>
Date: Mon, 25 Sep 2023 17:14:34 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v5 3/8] drm: atmel-hlcdc: add LCD controller layer
 definition for sam9x75
Content-Language: en-US
To: Manikandan Muralidharan <manikandan.m@microchip.com>, sam@ravnborg.org,
 bbrezillon@kernel.org, airlied@gmail.com, daniel@ffwll.ch,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, lee@kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20230915104849.187146-1-manikandan.m@microchip.com>
 <20230915104849.187146-4-manikandan.m@microchip.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20230915104849.187146-4-manikandan.m@microchip.com>
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
Cc: Balakrishnan.S@microchip.com, Nayabbasha.Sayed@microchip.com,
 Balamanikandan.Gunasundar@microchip.com, Varshini.Rajendran@microchip.com,
 Dharma.B@microchip.com, Durai.ManickamKR@microchip.com,
 Hari.PrasathGE@microchip.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 15.09.2023 13:48, Manikandan Muralidharan wrote:
> Add the LCD controller layer definition and descriptor structure for
> sam9x75 for the following layers,

s/,/:

> - Base Layer
> - Overlay1 Layer
> - Overlay2 Layer
> - High End Overlay
> 
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
> ---
>  drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c | 97 ++++++++++++++++++++
>  1 file changed, 97 insertions(+)
> 
> diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
> index fa0f9a93d50d..d30aec174aa2 100644
> --- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
> +++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
> @@ -462,6 +462,99 @@ static const struct atmel_hlcdc_dc_desc atmel_hlcdc_dc_sam9x60 = {
>  	.layers = atmel_hlcdc_sam9x60_layers,
>  };
>  
> +static const struct atmel_hlcdc_layer_desc atmel_xlcdc_sam9x75_layers[] = {
> +	{
> +		.name = "base",
> +		.formats = &atmel_hlcdc_plane_rgb_formats,
> +		.regs_offset = 0x60,
> +		.id = 0,
> +		.type = ATMEL_HLCDC_BASE_LAYER,
> +		.cfgs_offset = 0x1c,
> +		.layout = {
> +			.xstride = { 2 },
> +			.default_color = 3,
> +			.general_config = 4,
> +			.disc_pos = 5,
> +			.disc_size = 6,
> +		},
> +		.clut_offset = 0x700,
> +	},
> +	{
> +		.name = "overlay1",
> +		.formats = &atmel_hlcdc_plane_rgb_formats,
> +		.regs_offset = 0x160,
> +		.id = 1,
> +		.type = ATMEL_HLCDC_OVERLAY_LAYER,
> +		.cfgs_offset = 0x1c,
> +		.layout = {
> +			.pos = 2,
> +			.size = 3,
> +			.xstride = { 4 },
> +			.pstride = { 5 },
> +			.default_color = 6,
> +			.chroma_key = 7,
> +			.chroma_key_mask = 8,
> +			.general_config = 9,
> +		},
> +		.clut_offset = 0xb00,
> +	},
> +	{
> +		.name = "overlay2",
> +		.formats = &atmel_hlcdc_plane_rgb_formats,
> +		.regs_offset = 0x260,
> +		.id = 2,
> +		.type = ATMEL_HLCDC_OVERLAY_LAYER,
> +		.cfgs_offset = 0x1c,
> +		.layout = {
> +			.pos = 2,
> +			.size = 3,
> +			.xstride = { 4 },
> +			.pstride = { 5 },
> +			.default_color = 6,
> +			.chroma_key = 7,
> +			.chroma_key_mask = 8,
> +			.general_config = 9,
> +		},
> +		.clut_offset = 0xf00,
> +	},
> +	{
> +		.name = "high-end-overlay",
> +		.formats = &atmel_hlcdc_plane_rgb_and_yuv_formats,
> +		.regs_offset = 0x360,
> +		.id = 3,
> +		.type = ATMEL_HLCDC_OVERLAY_LAYER,
> +		.cfgs_offset = 0x30,
> +		.layout = {
> +			.pos = 2,
> +			.size = 3,
> +			.memsize = 4,
> +			.xstride = { 5, 7 },
> +			.pstride = { 6, 8 },
> +			.default_color = 9,
> +			.chroma_key = 10,
> +			.chroma_key_mask = 11,
> +			.general_config = 12,
> +			.csc = 16,
> +			.scaler_config = 23,
> +		},
> +		.clut_offset = 0x1300,
> +	},
> +};
> +
> +static const struct atmel_hlcdc_dc_desc atmel_xlcdc_dc_sam9x75 = {
> +	.min_width = 0,
> +	.min_height = 0,
> +	.max_width = 2048,
> +	.max_height = 2048,
> +	.max_spw = 0xff,
> +	.max_vpw = 0xff,
> +	.max_hpw = 0x3ff,
> +	.fixed_clksrc = true,
> +	.is_xlcdc = true,
> +	.nlayers = ARRAY_SIZE(atmel_xlcdc_sam9x75_layers),
> +	.layers = atmel_xlcdc_sam9x75_layers,
> +};
> +
>  static const struct of_device_id atmel_hlcdc_of_match[] = {
>  	{
>  		.compatible = "atmel,at91sam9n12-hlcdc",
> @@ -487,6 +580,10 @@ static const struct of_device_id atmel_hlcdc_of_match[] = {
>  		.compatible = "microchip,sam9x60-hlcdc",
>  		.data = &atmel_hlcdc_dc_sam9x60,
>  	},
> +	{
> +		.compatible = "microchip,sam9x75-xlcdc",
> +		.data = &atmel_xlcdc_dc_sam9x75,
> +	},
>  	{ /* sentinel */ },
>  };
>  MODULE_DEVICE_TABLE(of, atmel_hlcdc_of_match);
