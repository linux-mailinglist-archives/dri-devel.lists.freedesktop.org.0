Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4DB07AD9D6
	for <lists+dri-devel@lfdr.de>; Mon, 25 Sep 2023 16:14:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13AC310E186;
	Mon, 25 Sep 2023 14:14:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AA7610E186
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Sep 2023 14:14:25 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-52f3ba561d9so14794634a12.1
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Sep 2023 07:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tuxon.dev; s=google; t=1695651264; x=1696256064; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vdRnBQhusGIL2b+v+H5dfPPmDF9lKDRORIGAAQ+Woys=;
 b=SvgMp0UiKTfuVWbBmMSdec1Guk3YEnR3jZqRUOJRijnQnuk1WQw0Js8ZnHMdw6mWsq
 +tF8GdrHkSqVkLrJzsKBv6nQxFMThEnZZSg331bAin91NpXN2FkygEmxb2wWAwFMJ0Lj
 1BD61aEVk42VP7+elmjoNBMj0+TlltSgEG4gL/W0QuGXSf7dgj9643JkDCaNS9Bz9g4J
 YCcPvjyjico7PTPdOc1d60/lh7OkuK/wLeiIyJCxnPu1nuSne/BYuictMdpcXSRWfXVI
 0mkJkTcKYbrDzKOLNSDgwiH5D+XE6qoAj8ypV1iHDDXTIZy3Ino8FeTDLcooeZHLmcxM
 lN0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695651264; x=1696256064;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vdRnBQhusGIL2b+v+H5dfPPmDF9lKDRORIGAAQ+Woys=;
 b=TuWP64xu6YasOZwJBZwSm0l8x5XdFcRbSC8ALw3EBZpGH3QGq27a06Zxs697khoWID
 d47s8SOxdSyAWpUyMVEngpyKk7Ix3FBA3MFGKc+yd+lAw6vmYU2abUWjmbL38SN8j55t
 GZY2PbFH6VaSpMlZ1VVa62kI610nzd2jx03iHSzE4igJbJ9FaqoAvlKdKUxnd2YMFHX9
 x5uRJUdENJlgLlzsDYT/NawiZPTNHuY+1ricsrHuhgzx9si6ntO5SNTtWgoRfvdswnxY
 rgZdYo3rUFz+5dOIcpVohq37bRXR9NmCTsP+afIGPxZhcTHvKpOkJH0OLyeMY0XFf9/X
 3LgA==
X-Gm-Message-State: AOJu0YyGuaYjZJsdibnifCjdBejxYi9/4JlkN7xLh5SwJOvfq4XBS8Rf
 PgMNAJXSpCE9cpn/iYFzOzLhuQ==
X-Google-Smtp-Source: AGHT+IG3P2pMWfKC6BxP+BEDyGl/OKpELub+ARSQfEls3L7kOdsakdL4CdWODUbaZsReEBrgZPKR+A==
X-Received: by 2002:a05:6402:27ca:b0:52c:f73:3567 with SMTP id
 c10-20020a05640227ca00b0052c0f733567mr15302759ede.13.1695651264216; 
 Mon, 25 Sep 2023 07:14:24 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.177])
 by smtp.gmail.com with ESMTPSA id
 o12-20020aa7d3cc000000b005259dd903e5sm5533339edr.67.2023.09.25.07.14.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Sep 2023 07:14:23 -0700 (PDT)
Message-ID: <2e73d0c0-4a3f-bea2-9779-bf929341296d@tuxon.dev>
Date: Mon, 25 Sep 2023 17:14:21 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v5 6/8] drm: atmel-hlcdc: add DPI mode support for XLCDC
Content-Language: en-US
To: Manikandan Muralidharan <manikandan.m@microchip.com>, sam@ravnborg.org,
 bbrezillon@kernel.org, airlied@gmail.com, daniel@ffwll.ch,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, lee@kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20230915104849.187146-1-manikandan.m@microchip.com>
 <20230915104849.187146-7-manikandan.m@microchip.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20230915104849.187146-7-manikandan.m@microchip.com>
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
> Add support for Display Pixel Interface (DPI) Compatible Mode
> support in atmel-hlcdc driver for XLCDC IP along with legacy
> pixel mapping.DPI mode BIT is configured in LCDC_CFG5 register.

Space after .

> 
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
> [durai.manickamkr@microchip.com: update DPI mode bit using is_xlcdc flag]
> Signed-off-by: Durai Manickam KR <durai.manickamkr@microchip.com>
> ---
>  .../gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c    | 22 ++++++++++++++++---
>  1 file changed, 19 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
> index 1ac31c0c474a..b0051ec02f7f 100644
> --- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
> +++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
> @@ -30,10 +30,12 @@
>   *
>   * @base: base CRTC state
>   * @output_mode: RGBXXX output mode
> + * @dpi: output DPI mode
>   */
>  struct atmel_hlcdc_crtc_state {
>  	struct drm_crtc_state base;
>  	unsigned int output_mode;
> +	u8 dpi;
>  };
>  
>  static inline struct atmel_hlcdc_crtc_state *
> @@ -164,6 +166,8 @@ static void atmel_hlcdc_crtc_mode_set_nofb(struct drm_crtc *c)
>  
>  	state = drm_crtc_state_to_atmel_hlcdc_crtc_state(c->state);
>  	cfg = state->output_mode << 8;
> +	if (is_xlcdc)
> +		cfg |= state->dpi << 11;
>  
>  	if (!is_xlcdc && (adj->flags & DRM_MODE_FLAG_NVSYNC))
>  		cfg |= ATMEL_HLCDC_VSPOL;
> @@ -176,7 +180,9 @@ static void atmel_hlcdc_crtc_mode_set_nofb(struct drm_crtc *c)
>  			   ATMEL_HLCDC_VSPDLYS | ATMEL_HLCDC_VSPDLYE |
>  			   ATMEL_HLCDC_DISPPOL | ATMEL_HLCDC_DISPDLY |
>  			   ATMEL_HLCDC_VSPSU | ATMEL_HLCDC_VSPHO |
> -			   ATMEL_HLCDC_GUARDTIME_MASK | ATMEL_HLCDC_MODE_MASK,
> +			   ATMEL_HLCDC_GUARDTIME_MASK |
> +			   (is_xlcdc ? ATMEL_XLCDC_MODE_MASK |
> +			   ATMEL_XLCDC_DPI : ATMEL_HLCDC_MODE_MASK),
>  			   cfg);
>  
>  	clk_disable_unprepare(crtc->dc->hlcdc->sys_clk);
> @@ -374,7 +380,15 @@ static int atmel_hlcdc_crtc_select_output_mode(struct drm_crtc_state *state)
>  
>  	hstate = drm_crtc_state_to_atmel_hlcdc_crtc_state(state);
>  	hstate->output_mode = fls(output_fmts) - 1;
> -
> +	if (crtc->dc->desc->is_xlcdc) {
> +		/* check if MIPI DPI bit needs to be set */
> +		if (fls(output_fmts) > 3) {
> +			hstate->output_mode -= 4;
> +			hstate->dpi = 1;
> +		} else {
> +			hstate->dpi = 0;
> +		}
> +	}
>  	return 0;
>  }
>  
> @@ -478,7 +492,7 @@ static struct drm_crtc_state *
>  atmel_hlcdc_crtc_duplicate_state(struct drm_crtc *crtc)
>  {
>  	struct atmel_hlcdc_crtc_state *state, *cur;
> -
> +	struct atmel_hlcdc_crtc *c = drm_crtc_to_atmel_hlcdc_crtc(crtc);

Keep the blank line here.

>  	if (WARN_ON(!crtc->state))
>  		return NULL;
>  
> @@ -489,6 +503,8 @@ atmel_hlcdc_crtc_duplicate_state(struct drm_crtc *crtc)
>  
>  	cur = drm_crtc_state_to_atmel_hlcdc_crtc_state(crtc->state);
>  	state->output_mode = cur->output_mode;
> +	if (c->dc->desc->is_xlcdc)
> +		state->dpi = cur->dpi;
>  
>  	return &state->base;
>  }
