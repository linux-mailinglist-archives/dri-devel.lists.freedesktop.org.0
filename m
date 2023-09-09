Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 99783799C1A
	for <lists+dri-devel@lfdr.de>; Sun, 10 Sep 2023 01:39:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B0BD10E2B8;
	Sat,  9 Sep 2023 23:39:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 912D610E0BE
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Sep 2023 15:50:27 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-52683b68c2fso4039444a12.0
 for <dri-devel@lists.freedesktop.org>; Sat, 09 Sep 2023 08:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tuxon.dev; s=google; t=1694274626; x=1694879426; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Sknai5FFuIetKPlXqiA1Cp0a6VVzO5G1drcSPHamhSM=;
 b=DvbnQoo0vSF2qETvRDkJ6gpTMWCy94QpuGp0JYVO9wTX4pfHTg20loUhysE2SCKfXj
 r6Ve5IB//Ps64ZQFhmue/kf7n+JWGk4lofNGmbGnEPcUNTuGJKMisLZiMiU4Ud0HyOZI
 k9NVzc1/eg6IgPuJRQHOo5fzNXLYDDM98r0oPDQDdrQuWVTI3RFNqWpGNuc1aiNjd79I
 GNQFdzadUE08M1WVTACpT/LZbcv3lMEyUbDrAfdPmE8U1ycDUN5l81dEpC6MEheg/kbT
 LA5KAwXIjZhYCuAmxVHjMkXvIRBo73S7Ov3LWY1ylit9XZGSEKPYelv4FAZ/nQ43GOPX
 RZlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694274626; x=1694879426;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Sknai5FFuIetKPlXqiA1Cp0a6VVzO5G1drcSPHamhSM=;
 b=hYKHDeHYlcvylx38dv2TiFFbzyjaeBuGI5Op9ipg7RsnjED1jzRUOGLUxHqw4GvNdC
 xZNwhn9WMB9iU6G3BR/e49a1dlngBpoLgtQFe5lBeQeUdaNthsbZliT6q6bmk5Wg5PPO
 x+QLValrrMmMplFd74XlU8D/eaMno3Fz9xZahntXpMXYh0zZa8Z7a2sIT+DWHPyK4Epi
 rFeCs/zcMrX7O4XFkR8aljOv3b5HLEZw9cmc0m4N1bi0Ff9CNDvEDaLrm3j76NPXiTD6
 Cudbct5ZwgOfZDanHAcGltnK5Xb1VVLlFRStJwUvDeRwDpIhgmUwdPi2FIGTdGlnwaV7
 wXsQ==
X-Gm-Message-State: AOJu0YzUP9o5Tmu8uk0q3pRFe63xwalhNbUt+nA3PSUZk9go2c/FESXt
 0wyLIMrSbRgmr0m/s14nGHO9wg==
X-Google-Smtp-Source: AGHT+IFIx6SV+2c2xfDJFgpQ06FHcnSrdYso9uKZrShPha5V1mFgHPCEMdJzdc0nqXxSAxWpzFmfBw==
X-Received: by 2002:aa7:d7d3:0:b0:528:925f:413e with SMTP id
 e19-20020aa7d7d3000000b00528925f413emr4350346eds.12.1694274625896; 
 Sat, 09 Sep 2023 08:50:25 -0700 (PDT)
Received: from [192.168.32.2] ([82.78.167.145])
 by smtp.gmail.com with ESMTPSA id
 m16-20020aa7c490000000b005236410a16bsm2325875edq.35.2023.09.09.08.50.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Sep 2023 08:50:25 -0700 (PDT)
Message-ID: <c9464c59-2f70-0345-1ebe-ec6ce9c292db@tuxon.dev>
Date: Sat, 9 Sep 2023 18:50:23 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
From: claudiu beznea <claudiu.beznea@tuxon.dev>
Subject: Re: [PATCH v4 4/8] drm: atmel-hlcdc: Define SAM9X7 SoC XLCDC specific
 registers
To: Manikandan Muralidharan <manikandan.m@microchip.com>, sam@ravnborg.org,
 bbrezillon@kernel.org, airlied@gmail.com, daniel@ffwll.ch,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, lee@kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20230825125444.93222-1-manikandan.m@microchip.com>
 <20230825125444.93222-5-manikandan.m@microchip.com>
Content-Language: en-US
In-Reply-To: <20230825125444.93222-5-manikandan.m@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Sat, 09 Sep 2023 23:39:17 +0000
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



On 8/25/23 15:54, Manikandan Muralidharan wrote:
> From: Durai Manickam KR <durai.manickamkr@microchip.com>
> 
> The register address of the XLCDC IP used in SAM9X7 SoC family
> are different from the previous HLCDC.Defining those address
> space with valid macros.
> 
> Signed-off-by: Durai Manickam KR <durai.manickamkr@microchip.com>
> [manikandan.m@microchip.com: Remove unused macro definitions]
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
> ---
>  drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h | 42 ++++++++++++++++++++
>  include/linux/mfd/atmel-hlcdc.h              | 10 +++++
>  2 files changed, 52 insertions(+)
> 
> diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h
> index d68c79a6eae7..8b05a54b5fd0 100644
> --- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h
> +++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h
> @@ -15,6 +15,7 @@
>  
>  #include <drm/drm_plane.h>
>  
> +/* LCD controller common registers */
>  #define ATMEL_HLCDC_LAYER_CHER			0x0
>  #define ATMEL_HLCDC_LAYER_CHDR			0x4
>  #define ATMEL_HLCDC_LAYER_CHSR			0x8
> @@ -128,6 +129,47 @@
>  
>  #define ATMEL_HLCDC_MAX_LAYERS			6
>  
> +/* XLCDC controller specific registers */
> +#define ATMEL_XLCDC_LAYER_ENR			0x10
> +#define ATMEL_XLCDC_LAYER_EN			BIT(0)
> +
> +#define ATMEL_XLCDC_LAYER_IER			0x0
> +#define ATMEL_XLCDC_LAYER_IDR			0x4
> +#define ATMEL_XLCDC_LAYER_ISR			0xc
> +#define ATMEL_XLCDC_LAYER_OVR_IRQ(p)		BIT(2 + (8 * (p)))
> +
> +#define ATMEL_XLCDC_LAYER_PLANE_ADDR(p)		(((p) * 0x4) + 0x18)
> +
> +#define ATMEL_XLCDC_LAYER_DMA_CFG		0
> +
> +#define ATMEL_XLCDC_LAYER_DMA			BIT(0)
> +#define ATMEL_XLCDC_LAYER_REP			BIT(1)
> +#define ATMEL_XLCDC_LAYER_DISCEN                BIT(4)

You have spaces after macro name

> +
> +#define ATMEL_XLCDC_LAYER_SFACTC_A0_MULT_AS	(4 << 6)
> +#define ATMEL_XLCDC_LAYER_SFACTA_ONE		BIT(9)
> +#define ATMEL_XLCDC_LAYER_DFACTC_M_A0_MULT_AS	(6 << 11)
> +#define ATMEL_XLCDC_LAYER_DFACTA_ONE		BIT(14)
> +
> +#define ATMEL_XLCDC_LAYER_A0_SHIFT		16
> +#define ATMEL_XLCDC_LAYER_A0(x)			\
> +	((x) << ATMEL_XLCDC_LAYER_A0_SHIFT)
> +
> +#define ATMEL_XLCDC_LAYER_VSCALER_LUMA_ENABLE		BIT(0)
> +#define ATMEL_XLCDC_LAYER_VSCALER_CHROMA_ENABLE		BIT(1)
> +#define ATMEL_XLCDC_LAYER_HSCALER_LUMA_ENABLE		BIT(4)
> +#define ATMEL_XLCDC_LAYER_HSCALER_CHROMA_ENABLE		BIT(5)
> +
> +#define ATMEL_XLCDC_LAYER_VXSYCFG_ONE		BIT(0)
> +#define ATMEL_XLCDC_LAYER_VXSYTAP2_ENABLE	BIT(4)
> +#define ATMEL_XLCDC_LAYER_VXSCCFG_ONE		BIT(16)
> +#define ATMEL_XLCDC_LAYER_VXSCTAP2_ENABLE	BIT(20)
> +
> +#define ATMEL_XLCDC_LAYER_HXSYCFG_ONE		BIT(0)
> +#define ATMEL_XLCDC_LAYER_HXSYTAP2_ENABLE	BIT(4)
> +#define ATMEL_XLCDC_LAYER_HXSCCFG_ONE		BIT(16)
> +#define ATMEL_XLCDC_LAYER_HXSCTAP2_ENABLE	BIT(20)
> +
>  /**
>   * Atmel HLCDC Layer registers layout structure
>   *
> diff --git a/include/linux/mfd/atmel-hlcdc.h b/include/linux/mfd/atmel-hlcdc.h
> index a186119a49b5..80d675a03b39 100644
> --- a/include/linux/mfd/atmel-hlcdc.h
> +++ b/include/linux/mfd/atmel-hlcdc.h
> @@ -22,6 +22,8 @@
>  #define ATMEL_HLCDC_DITHER		BIT(6)
>  #define ATMEL_HLCDC_DISPDLY		BIT(7)
>  #define ATMEL_HLCDC_MODE_MASK		GENMASK(9, 8)
> +#define ATMEL_XLCDC_MODE_MASK		GENMASK(10, 8)
> +#define ATMEL_XLCDC_DPI			BIT(11)
>  #define ATMEL_HLCDC_PP			BIT(10)
>  #define ATMEL_HLCDC_VSPSU		BIT(12)
>  #define ATMEL_HLCDC_VSPHO		BIT(13)
> @@ -34,6 +36,12 @@
>  #define ATMEL_HLCDC_IDR			0x30
>  #define ATMEL_HLCDC_IMR			0x34
>  #define ATMEL_HLCDC_ISR			0x38
> +#define ATMEL_XLCDC_ATTRE		0x3c
> +
> +#define ATMEL_XLCDC_BASE_UPDATE		BIT(0)
> +#define ATMEL_XLCDC_OVR1_UPDATE		BIT(1)
> +#define ATMEL_XLCDC_OVR3_UPDATE		BIT(2)
> +#define ATMEL_XLCDC_HEO_UPDATE		BIT(3)
>  
>  #define ATMEL_HLCDC_CLKPOL		BIT(0)
>  #define ATMEL_HLCDC_CLKSEL		BIT(2)
> @@ -48,6 +56,8 @@
>  #define ATMEL_HLCDC_DISP		BIT(2)
>  #define ATMEL_HLCDC_PWM			BIT(3)
>  #define ATMEL_HLCDC_SIP			BIT(4)
> +#define ATMEL_XLCDC_SD			BIT(5)
> +#define ATMEL_XLCDC_CM			BIT(6)
>  
>  #define ATMEL_HLCDC_SOF			BIT(0)
>  #define ATMEL_HLCDC_SYNCDIS		BIT(1)
