Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 982727AD9E1
	for <lists+dri-devel@lfdr.de>; Mon, 25 Sep 2023 16:15:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B31D410E254;
	Mon, 25 Sep 2023 14:14:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A067910E262
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Sep 2023 14:14:54 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-98377c5d53eso782988766b.0
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Sep 2023 07:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tuxon.dev; s=google; t=1695651293; x=1696256093; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MKU4CV4EpJVB4FTlihc7/XBzOgjH8T7yUhxDn98BGzs=;
 b=btICWKfryA4HaKHs17O6lu18NgBg9TbKmdNxgmjOzKAyNE8Rlsssyp5w9RmSAJ33uS
 mo0JaCTTC0VBwj3wz4X5ygvp+qr8VFUZ+fJy9yB7QOhHdutF6eEuENjRGVwzTI6KzVWo
 hVH5ZwNN52nINgs+3t0VpRupsyTZKeGU8jniUTEy+4lP8kHU4C5WhdNDQ36GOZMEn7o1
 q05LnZwguSb48iJdmuxIIyFN2UVMWpaS9Ohaz1A77UVWf/us+awhtBBqGzMY+aq2mAfw
 nAG74SvwYMSQqkB6EX41VM6Mq92Xmau09bpDFoMpnTUcEIVq6SmJDH7o4Wc+nTVjGkMB
 POSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695651293; x=1696256093;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MKU4CV4EpJVB4FTlihc7/XBzOgjH8T7yUhxDn98BGzs=;
 b=ph94fjs32z4MuImzL2/m36X/rGHMKavbldapM3e+37G2BuUwZ+d+qm8dSfGZ2c8PDh
 3cl4+cYBcWpUtQ/Rdhcj+lWVcKYMuJKlA9wG/Haew8agCaDU0nKnrLXxp0ASbHe16afG
 lWph5zWL74Y9Zybbhth9mItnItxhM1mUhVRnnC/HPB8HChY4vYZcp7DhKPcIO4PxXkIy
 MPNbRU0xLcxPR4LARZvVMJggw5T1DvyUD/duiBydvzXy5Hra/mWhSH7kfOTnaRZXpqdk
 OPq8Qi9J3/iggU2GH036CafiXfgAIdZbRE0ivBZBVw5NGQrTZdtebFj9Gftq0Nye28nK
 CAOw==
X-Gm-Message-State: AOJu0YymKyTMk/1wS90I8VX+HWv9c4l/ADycdQyrhyWq3uDnjv7Dl7Lr
 58rXQ56bH8G1v4SbLVTIDwaZtQ==
X-Google-Smtp-Source: AGHT+IHx36NilNjcQj0V/DwreT87OC3NaWjFtiASBdZXA0fTzY+Qsmkg+s/l/6AD0q46Qe+poFx12Q==
X-Received: by 2002:a17:906:3089:b0:9ae:70b7:bc9f with SMTP id
 9-20020a170906308900b009ae70b7bc9fmr6261797ejv.2.1695651293161; 
 Mon, 25 Sep 2023 07:14:53 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.177])
 by smtp.gmail.com with ESMTPSA id
 p20-20020a1709060e9400b009ae587ce135sm6350301ejf.223.2023.09.25.07.14.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Sep 2023 07:14:52 -0700 (PDT)
Message-ID: <159b7f6f-fe82-cc31-0629-2b2fbd7340b9@tuxon.dev>
Date: Mon, 25 Sep 2023 17:14:50 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v5 4/8] drm: atmel-hlcdc: Define SAM9X7 SoC XLCDC specific
 registers
Content-Language: en-US
To: Manikandan Muralidharan <manikandan.m@microchip.com>, sam@ravnborg.org,
 bbrezillon@kernel.org, airlied@gmail.com, daniel@ffwll.ch,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, lee@kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20230915104849.187146-1-manikandan.m@microchip.com>
 <20230915104849.187146-5-manikandan.m@microchip.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20230915104849.187146-5-manikandan.m@microchip.com>
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
> From: Durai Manickam KR <durai.manickamkr@microchip.com>
> 
> The register address of the XLCDC IP used in SAM9X7 SoC family
> are different from the previous HLCDC.Defining those address

Add a space after .

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
> index c61fa1733da4..9965c7cc5bf8 100644
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
> +#define ATMEL_XLCDC_LAYER_DISCEN		BIT(4)
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
