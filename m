Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A87FD7AD9E9
	for <lists+dri-devel@lfdr.de>; Mon, 25 Sep 2023 16:17:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF0C610E255;
	Mon, 25 Sep 2023 14:17:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C1B810E255
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Sep 2023 14:17:19 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2b9c907bc68so109741631fa.2
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Sep 2023 07:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tuxon.dev; s=google; t=1695651437; x=1696256237; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DzjzmsFmTwciDX31Hw65ql0biQiBzhyqc5jR/rF5nuk=;
 b=Q7HP7T5eatDJWwWPiVwH20PafKRU4KTftr1dCAMOWIQwyf2S+BLvotjkXfwzLXG9db
 RnRsLx0DEqPrG52Hb3rt1HtKLS/25qO02g7G3SxHjq7oDFwvNCu8vqeDY1jvpwplRLIR
 i+tybHJvXcqoVQ9CZ8YhlpO0xHGVP9s3+oQXGiRugwNIG5sg5iOghhI/hMGsCY914jvO
 7G74n76qEhYuGqAcljRVmOqwhAfQz4apHICdVASiTBmZDBlFEHqyU0CwovDgZ1nYxQZ9
 yrq3pxyS3yMBRY8A2Ww2ec7B7gSaJqZbWyFf9bsMQHRd9RxaBDnAiCxTV3LyxrFuu4Mm
 4l1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695651437; x=1696256237;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DzjzmsFmTwciDX31Hw65ql0biQiBzhyqc5jR/rF5nuk=;
 b=roW2eODqLBybZCcfSGSYPqTsNTwWCZXFFHfrBD63cyKLfQlu3TtWVeu1s4KoAZFMte
 GPh9IicP/q2YiDDk60EL8xSet3G2LvEAndfRWulkGhNTaobOWJ0EP0oTZjyhajxq+mgG
 bcY5IoDtp6NPlZ6CKAFgZrmoGrI90x+/8TgbQmMvoUEQ5KYY9PtLgpqqrncrOv8BOhF+
 vXGbcVegSgFph3CiwIqRUzAqGZ/5LvnXdosdtecuM8FV+qoCiZBmm4osdDTyAfzA78Fs
 oKxJTML6zLi1Lo4wq3fy718mCDDVjbChRuHsng7nuV22AjbhHZ+X63UxxYjrJb+7u8Sl
 bPsQ==
X-Gm-Message-State: AOJu0YysLn9S43rja22tDDVTDef19q5gUWzLG6m/Zmb2QlNk6BsKnyaR
 IJQiE9lTzqxk9lyiPcepVEhTyg==
X-Google-Smtp-Source: AGHT+IGu0wWgiX5d77OPvc74Ib3xbCwo/fWtFFAkInnENB8lY6QCfCZFADPPZwwVVOCz/DBYDYaAnA==
X-Received: by 2002:a05:6512:3148:b0:504:3c1f:cbd1 with SMTP id
 s8-20020a056512314800b005043c1fcbd1mr5693952lfi.12.1695651437346; 
 Mon, 25 Sep 2023 07:17:17 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.177])
 by smtp.gmail.com with ESMTPSA id
 d14-20020aa7c1ce000000b005272523b162sm5495967edp.69.2023.09.25.07.17.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Sep 2023 07:17:16 -0700 (PDT)
Message-ID: <7e41f19f-41e1-26db-09e5-490456298e62@tuxon.dev>
Date: Mon, 25 Sep 2023 17:17:14 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v5 5/8] drm: atmel_hlcdc: Add support for XLCDC in atmel
 LCD driver
Content-Language: en-US
To: Manikandan Muralidharan <manikandan.m@microchip.com>, sam@ravnborg.org,
 bbrezillon@kernel.org, airlied@gmail.com, daniel@ffwll.ch,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, lee@kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20230915104849.187146-1-manikandan.m@microchip.com>
 <20230915104849.187146-6-manikandan.m@microchip.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20230915104849.187146-6-manikandan.m@microchip.com>
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
> - XLCDC in SAM9X7 has different sets of registers and additional
> configuration bits when compared to previous HLCDC IP. Read/write
> operation on the controller registers is now separated using the
> XLCDC status flag and with HLCDC and XLCDC IP specific ops.
> 	- HEO scaling, window resampling, Alpha blending, YUV-to-RGB
> conversion in XLCDC is derived and handled using additional
> configuration bits and registers.
> 	- Writing one to the Enable fields of each layer in LCD_ATTRE
> is required to reflect the values set in Configuration, FBA, Enable
> registers of each layer

Having "-" may be interpreted as you are doing multiple things in this patch.

> 
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
> Co-developed-by: Hari Prasath Gujulan Elango <Hari.PrasathGE@microchip.com>
> Signed-off-by: Hari Prasath Gujulan Elango <Hari.PrasathGE@microchip.com>
> Co-developed-by: Durai Manickam KR <durai.manickamkr@microchip.com>
> Signed-off-by: Durai Manickam KR <durai.manickamkr@microchip.com>
> ---
>  .../gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c    |  33 +-
>  drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c  |  26 ++
>  .../gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c   | 317 ++++++++++++++----
>  3 files changed, 315 insertions(+), 61 deletions(-)
> 
> diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
> index cc5cf4c2faf7..1ac31c0c474a 100644
> --- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
> +++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
> @@ -79,6 +79,7 @@ static void atmel_hlcdc_crtc_mode_set_nofb(struct drm_crtc *c)
>  	unsigned int mask = ATMEL_HLCDC_CLKDIV_MASK | ATMEL_HLCDC_CLKPOL;
>  	unsigned int cfg = 0;
>  	int div, ret;
> +	bool is_xlcdc = crtc->dc->desc->is_xlcdc;
>  
>  	/* get encoder from crtc */
>  	drm_for_each_encoder(en_iter, ddev) {
> @@ -164,10 +165,10 @@ static void atmel_hlcdc_crtc_mode_set_nofb(struct drm_crtc *c)
>  	state = drm_crtc_state_to_atmel_hlcdc_crtc_state(c->state);
>  	cfg = state->output_mode << 8;
>  
> -	if (adj->flags & DRM_MODE_FLAG_NVSYNC)
> +	if (!is_xlcdc && (adj->flags & DRM_MODE_FLAG_NVSYNC))
>  		cfg |= ATMEL_HLCDC_VSPOL;
>  
> -	if (adj->flags & DRM_MODE_FLAG_NHSYNC)
> +	if (!is_xlcdc && (adj->flags & DRM_MODE_FLAG_NHSYNC))
>  		cfg |= ATMEL_HLCDC_HSPOL;
>  
>  	regmap_update_bits(regmap, ATMEL_HLCDC_CFG(5),
> @@ -202,6 +203,20 @@ static void atmel_hlcdc_crtc_atomic_disable(struct drm_crtc *c,
>  
>  	pm_runtime_get_sync(dev->dev);
>  
> +	if (crtc->dc->desc->is_xlcdc) {
> +		regmap_write(regmap, ATMEL_HLCDC_DIS, ATMEL_XLCDC_CM);
> +		if (regmap_read_poll_timeout(regmap, ATMEL_HLCDC_SR, status,
> +					     !(status & ATMEL_XLCDC_CM),
> +					     10, 1000))
> +			dev_warn(dev->dev, "Atmel LCDC status register CMSTS timeout\n");
> +
> +		regmap_write(regmap, ATMEL_HLCDC_DIS, ATMEL_XLCDC_SD);
> +		if (regmap_read_poll_timeout(regmap, ATMEL_HLCDC_SR, status,
> +					     status & ATMEL_XLCDC_SD,
> +					     10, 1000))
> +			dev_warn(dev->dev, "Atmel LCDC status register SDSTS timeout\n");
> +	}
> +
>  	regmap_write(regmap, ATMEL_HLCDC_DIS, ATMEL_HLCDC_DISP);
>  	while (!regmap_read(regmap, ATMEL_HLCDC_SR, &status) &&
>  	       (status & ATMEL_HLCDC_DISP))
> @@ -256,6 +271,20 @@ static void atmel_hlcdc_crtc_atomic_enable(struct drm_crtc *c,
>  	       !(status & ATMEL_HLCDC_DISP))
>  		cpu_relax();
>  
> +	if (crtc->dc->desc->is_xlcdc) {
> +		regmap_write(regmap, ATMEL_HLCDC_EN, ATMEL_XLCDC_CM);
> +		if (regmap_read_poll_timeout(regmap, ATMEL_HLCDC_SR, status,
> +					     status & ATMEL_XLCDC_CM,
> +					     10, 1000))
> +			dev_warn(dev->dev, "Atmel LCDC status register CMSTS timeout\n");
> +
> +		regmap_write(regmap, ATMEL_HLCDC_EN, ATMEL_XLCDC_SD);
> +		if (regmap_read_poll_timeout(regmap, ATMEL_HLCDC_SR, status,
> +					     !(status & ATMEL_XLCDC_SD),
> +					     10, 1000))
> +			dev_warn(dev->dev, "Atmel LCDC status register SDSTS timeout\n");
> +	}
> +
>  	pm_runtime_put_sync(dev->dev);
>  
>  }
> diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
> index d30aec174aa2..7702c2f16178 100644
> --- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
> +++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
> @@ -30,6 +30,26 @@
>  
>  #define ATMEL_HLCDC_LAYER_IRQS_OFFSET		8
>  
> +static const struct atmel_lcdc_dc_ops  atmel_hlcdc_ops = {

there are 2 spaces b/w atmel_lcdc_dc_ops and atmel_hlcdc_ops.

> +	.plane_setup_scaler = atmel_hlcdc_plane_setup_scaler,
> +	.update_lcdc_buffers = update_hlcdc_buffers,
> +	.lcdc_atomic_disable = hlcdc_atomic_disable,
> +	.lcdc_update_general_settings = atmel_hlcdc_plane_update_general_settings,
> +	.lcdc_atomic_update = hlcdc_atomic_update,
> +	.lcdc_csc_init = hlcdc_csc_init,
> +	.lcdc_irq_dbg = hlcdc_irq_dbg,
> +};
> +
> +static const struct atmel_lcdc_dc_ops  atmel_xlcdc_ops = {

Same here.

> +	.plane_setup_scaler = atmel_xlcdc_plane_setup_scaler,
> +	.update_lcdc_buffers = update_xlcdc_buffers,
> +	.lcdc_atomic_disable = xlcdc_atomic_disable,
> +	.lcdc_update_general_settings = atmel_xlcdc_plane_update_general_settings,
> +	.lcdc_atomic_update = xlcdc_atomic_update,
> +	.lcdc_csc_init = xlcdc_csc_init,
> +	.lcdc_irq_dbg = xlcdc_irq_dbg,
> +};
> +
>  static const struct atmel_hlcdc_layer_desc atmel_hlcdc_at91sam9n12_layers[] = {
>  	{
>  		.name = "base",
> @@ -58,6 +78,7 @@ static const struct atmel_hlcdc_dc_desc atmel_hlcdc_dc_at91sam9n12 = {
>  	.conflicting_output_formats = true,
>  	.nlayers = ARRAY_SIZE(atmel_hlcdc_at91sam9n12_layers),
>  	.layers = atmel_hlcdc_at91sam9n12_layers,
> +	.ops = &atmel_hlcdc_ops,
>  };
>  
>  static const struct atmel_hlcdc_layer_desc atmel_hlcdc_at91sam9x5_layers[] = {
> @@ -151,6 +172,7 @@ static const struct atmel_hlcdc_dc_desc atmel_hlcdc_dc_at91sam9x5 = {
>  	.conflicting_output_formats = true,
>  	.nlayers = ARRAY_SIZE(atmel_hlcdc_at91sam9x5_layers),
>  	.layers = atmel_hlcdc_at91sam9x5_layers,
> +	.ops = &atmel_hlcdc_ops,
>  };
>  
>  static const struct atmel_hlcdc_layer_desc atmel_hlcdc_sama5d3_layers[] = {
> @@ -269,6 +291,7 @@ static const struct atmel_hlcdc_dc_desc atmel_hlcdc_dc_sama5d3 = {
>  	.conflicting_output_formats = true,
>  	.nlayers = ARRAY_SIZE(atmel_hlcdc_sama5d3_layers),
>  	.layers = atmel_hlcdc_sama5d3_layers,
> +	.ops = &atmel_hlcdc_ops,
>  };
>  
>  static const struct atmel_hlcdc_layer_desc atmel_hlcdc_sama5d4_layers[] = {
> @@ -364,6 +387,7 @@ static const struct atmel_hlcdc_dc_desc atmel_hlcdc_dc_sama5d4 = {
>  	.max_hpw = 0x3ff,
>  	.nlayers = ARRAY_SIZE(atmel_hlcdc_sama5d4_layers),
>  	.layers = atmel_hlcdc_sama5d4_layers,
> +	.ops = &atmel_hlcdc_ops,
>  };
>  
>  static const struct atmel_hlcdc_layer_desc atmel_hlcdc_sam9x60_layers[] = {
> @@ -460,6 +484,7 @@ static const struct atmel_hlcdc_dc_desc atmel_hlcdc_dc_sam9x60 = {
>  	.fixed_clksrc = true,
>  	.nlayers = ARRAY_SIZE(atmel_hlcdc_sam9x60_layers),
>  	.layers = atmel_hlcdc_sam9x60_layers,
> +	.ops = &atmel_hlcdc_ops,
>  };
>  
>  static const struct atmel_hlcdc_layer_desc atmel_xlcdc_sam9x75_layers[] = {
> @@ -553,6 +578,7 @@ static const struct atmel_hlcdc_dc_desc atmel_xlcdc_dc_sam9x75 = {
>  	.is_xlcdc = true,
>  	.nlayers = ARRAY_SIZE(atmel_xlcdc_sam9x75_layers),
>  	.layers = atmel_xlcdc_sam9x75_layers,
> +	.ops = &atmel_xlcdc_ops,
>  };
>  
>  static const struct of_device_id atmel_hlcdc_of_match[] = {
> diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
> index daa508504f47..e2a5bed86fdb 100644
> --- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
> +++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
> @@ -282,7 +282,7 @@ atmel_hlcdc_plane_scaler_set_phicoeff(struct atmel_hlcdc_plane *plane,
>  					    coeff_tab[i]);
>  }
>  
> -static void atmel_hlcdc_plane_setup_scaler(struct atmel_hlcdc_plane *plane,
> +void atmel_hlcdc_plane_setup_scaler(struct atmel_hlcdc_plane *plane,
>  					   struct atmel_hlcdc_plane_state *state)

run checkpatch.pl on scripts: align struct atmel_hlcdc_plane_state *state
with (. But may not be needed if follows advices on previous patches.

>  {
>  	const struct atmel_hlcdc_layer_desc *desc = plane->layer.desc;
> @@ -330,11 +330,56 @@ static void atmel_hlcdc_plane_setup_scaler(struct atmel_hlcdc_plane *plane,
>  								     yfactor));
>  }
>  
> +void atmel_xlcdc_plane_setup_scaler(struct atmel_hlcdc_plane *plane,
> +				    struct atmel_hlcdc_plane_state *state)
> +{
> +	const struct atmel_hlcdc_layer_desc *desc = plane->layer.desc;
> +	u32 xfactor, yfactor;
> +
> +	if (!desc->layout.scaler_config)
> +		return;
> +
> +	if (state->crtc_w == state->src_w && state->crtc_h == state->src_h) {
> +		atmel_hlcdc_layer_write_cfg(&plane->layer,
> +					    desc->layout.scaler_config, 0);
> +		return;
> +	}
> +
> +	/* xfactor = round[(2^20 * XMEMSIZE)/XSIZE)] */
> +	xfactor = (u32)(((1 << 20) * state->src_w) / state->crtc_w);
> +
> +	/* yfactor = round[(2^20 * YMEMSIZE)/YSIZE)] */
> +	yfactor = (u32)(((1 << 20) * state->src_h) / state->crtc_h);
> +
> +	atmel_hlcdc_layer_write_cfg(&plane->layer, desc->layout.scaler_config,
> +				    ATMEL_XLCDC_LAYER_VSCALER_LUMA_ENABLE |
> +				    ATMEL_XLCDC_LAYER_VSCALER_CHROMA_ENABLE |
> +				    ATMEL_XLCDC_LAYER_HSCALER_LUMA_ENABLE |
> +				    ATMEL_XLCDC_LAYER_HSCALER_CHROMA_ENABLE);
> +
> +	atmel_hlcdc_layer_write_cfg(&plane->layer, desc->layout.scaler_config + 1,
> +				    yfactor);
> +	atmel_hlcdc_layer_write_cfg(&plane->layer, desc->layout.scaler_config + 3,
> +				    xfactor);
> +
> +	/* As per YCbCr window resampling configuration */
> +	if (state->base.fb->format->format == DRM_FORMAT_YUV420) {
> +		yfactor /= 2;
> +		xfactor /= 2;
> +	} /* else As per ARGB window resampling configuration */

This kind of describing behavior is a bit odd. You could try to describe
what is needed before if statement.

> +
> +	atmel_hlcdc_layer_write_cfg(&plane->layer, desc->layout.scaler_config + 2,
> +				    yfactor);
> +	atmel_hlcdc_layer_write_cfg(&plane->layer, desc->layout.scaler_config + 4,
> +				    xfactor);
> +}
> +
>  static void
>  atmel_hlcdc_plane_update_pos_and_size(struct atmel_hlcdc_plane *plane,
>  				      struct atmel_hlcdc_plane_state *state)
>  {
>  	const struct atmel_hlcdc_layer_desc *desc = plane->layer.desc;
> +	struct atmel_hlcdc_dc *dc = plane->base.dev->dev_private;
>  
>  	if (desc->layout.size)
>  		atmel_hlcdc_layer_write_cfg(&plane->layer, desc->layout.size,
> @@ -352,10 +397,10 @@ atmel_hlcdc_plane_update_pos_and_size(struct atmel_hlcdc_plane *plane,
>  					ATMEL_HLCDC_LAYER_POS(state->crtc_x,
>  							      state->crtc_y));
>  
> -	atmel_hlcdc_plane_setup_scaler(plane, state);
> +	dc->desc->ops->plane_setup_scaler(plane, state);
>  }
>  
> -static void
> +void
>  atmel_hlcdc_plane_update_general_settings(struct atmel_hlcdc_plane *plane,
>  					struct atmel_hlcdc_plane_state *state)
>  {
> @@ -393,6 +438,40 @@ atmel_hlcdc_plane_update_general_settings(struct atmel_hlcdc_plane *plane,
>  				    cfg);
>  }
>  
> +void
> +atmel_xlcdc_plane_update_general_settings(struct atmel_hlcdc_plane *plane,
> +					  struct atmel_hlcdc_plane_state *state)
> +{
> +	unsigned int cfg;

Add it after pointers. Reverse christmass tree is more readable AFAICT.

> +	const struct atmel_hlcdc_layer_desc *desc = plane->layer.desc;
> +	const struct drm_format_info *format = state->base.fb->format;
> +
> +	atmel_hlcdc_layer_write_cfg(&plane->layer, ATMEL_XLCDC_LAYER_DMA_CFG,
> +				    ATMEL_HLCDC_LAYER_DMA_BLEN_INCR16 | state->ahb_id);
> +
> +	cfg = ATMEL_XLCDC_LAYER_DMA | ATMEL_XLCDC_LAYER_REP;
> +
> +	if (plane->base.type != DRM_PLANE_TYPE_PRIMARY) {
> +		/*
> +		 * Alpha Blending bits specific to SAM9X7 SoC
> +		 */
> +		cfg |= ATMEL_XLCDC_LAYER_SFACTC_A0_MULT_AS |
> +		       ATMEL_XLCDC_LAYER_SFACTA_ONE |
> +		       ATMEL_XLCDC_LAYER_DFACTC_M_A0_MULT_AS |
> +		       ATMEL_XLCDC_LAYER_DFACTA_ONE;
> +		if (format->has_alpha)
> +			cfg |= ATMEL_XLCDC_LAYER_A0(0xff);
> +		else
> +			cfg |= ATMEL_XLCDC_LAYER_A0(state->base.alpha);
> +	}
> +
> +	if (state->disc_h && state->disc_w)
> +		cfg |= ATMEL_XLCDC_LAYER_DISCEN;
> +
> +	atmel_hlcdc_layer_write_cfg(&plane->layer, desc->layout.general_config,
> +				    cfg);
> +}
> +
>  static void atmel_hlcdc_plane_update_format(struct atmel_hlcdc_plane *plane,
>  					struct atmel_hlcdc_plane_state *state)
>  {
> @@ -437,36 +516,53 @@ static void atmel_hlcdc_plane_update_clut(struct atmel_hlcdc_plane *plane,
>  	}
>  }
>  
> +void update_hlcdc_buffers(struct atmel_hlcdc_plane *plane,
> +			  struct atmel_hlcdc_plane_state *state, u32 sr, int i)
> +{
> +	atmel_hlcdc_layer_write_reg(&plane->layer,
> +				    ATMEL_HLCDC_LAYER_PLANE_HEAD(i),
> +				    state->dscrs[i]->self);
> +
> +	if (sr & ATMEL_HLCDC_LAYER_EN)
> +		return;

One extra line here makes it more readable.

> +	atmel_hlcdc_layer_write_reg(&plane->layer,
> +				    ATMEL_HLCDC_LAYER_PLANE_ADDR(i),
> +				    state->dscrs[i]->addr);
> +	atmel_hlcdc_layer_write_reg(&plane->layer,
> +				    ATMEL_HLCDC_LAYER_PLANE_CTRL(i),
> +				    state->dscrs[i]->ctrl);
> +	atmel_hlcdc_layer_write_reg(&plane->layer,
> +				    ATMEL_HLCDC_LAYER_PLANE_NEXT(i),
> +				    state->dscrs[i]->self);
> +}
> +
> +void update_xlcdc_buffers(struct atmel_hlcdc_plane *plane,
> +			  struct atmel_hlcdc_plane_state *state,
> +			  u32 sr, int i)
> +{
> +	atmel_hlcdc_layer_write_reg(&plane->layer,
> +				    ATMEL_XLCDC_LAYER_PLANE_ADDR(i),
> +				    state->dscrs[i]->addr);
> +}
> +
>  static void atmel_hlcdc_plane_update_buffers(struct atmel_hlcdc_plane *plane,
> -					struct atmel_hlcdc_plane_state *state)
> +					     struct atmel_hlcdc_plane_state *state)
>  {
>  	const struct atmel_hlcdc_layer_desc *desc = plane->layer.desc;
> +	struct atmel_hlcdc_dc *dc = plane->base.dev->dev_private;
>  	struct drm_framebuffer *fb = state->base.fb;
>  	u32 sr;
>  	int i;
>  
> -	sr = atmel_hlcdc_layer_read_reg(&plane->layer, ATMEL_HLCDC_LAYER_CHSR);
> +	if (!dc->desc->is_xlcdc)
> +		sr = atmel_hlcdc_layer_read_reg(&plane->layer, ATMEL_HLCDC_LAYER_CHSR);
>  
>  	for (i = 0; i < state->nplanes; i++) {
>  		struct drm_gem_dma_object *gem = drm_fb_dma_get_gem_obj(fb, i);
>  
>  		state->dscrs[i]->addr = gem->dma_addr + state->offsets[i];
>  
> -		atmel_hlcdc_layer_write_reg(&plane->layer,
> -					    ATMEL_HLCDC_LAYER_PLANE_HEAD(i),
> -					    state->dscrs[i]->self);
> -
> -		if (!(sr & ATMEL_HLCDC_LAYER_EN)) {
> -			atmel_hlcdc_layer_write_reg(&plane->layer,
> -					ATMEL_HLCDC_LAYER_PLANE_ADDR(i),
> -					state->dscrs[i]->addr);
> -			atmel_hlcdc_layer_write_reg(&plane->layer,
> -					ATMEL_HLCDC_LAYER_PLANE_CTRL(i),
> -					state->dscrs[i]->ctrl);
> -			atmel_hlcdc_layer_write_reg(&plane->layer,
> -					ATMEL_HLCDC_LAYER_PLANE_NEXT(i),
> -					state->dscrs[i]->self);
> -		}
> +		dc->desc->ops->update_lcdc_buffers(plane, state, sr, i);
>  
>  		if (desc->layout.xstride[i])
>  			atmel_hlcdc_layer_write_cfg(&plane->layer,
> @@ -712,11 +808,8 @@ static int atmel_hlcdc_plane_atomic_check(struct drm_plane *p,
>  	return 0;
>  }
>  
> -static void atmel_hlcdc_plane_atomic_disable(struct drm_plane *p,
> -					     struct drm_atomic_state *state)
> +void hlcdc_atomic_disable(struct atmel_hlcdc_plane *plane)
>  {
> -	struct atmel_hlcdc_plane *plane = drm_plane_to_atmel_hlcdc_plane(p);
> -
>  	/* Disable interrupts */
>  	atmel_hlcdc_layer_write_reg(&plane->layer, ATMEL_HLCDC_LAYER_IDR,
>  				    0xffffffff);
> @@ -731,6 +824,70 @@ static void atmel_hlcdc_plane_atomic_disable(struct drm_plane *p,
>  	atmel_hlcdc_layer_read_reg(&plane->layer, ATMEL_HLCDC_LAYER_ISR);
>  }
>  
> +void xlcdc_atomic_disable(struct atmel_hlcdc_plane *plane)
> +{
> +	/* Disable interrupts */
> +	atmel_hlcdc_layer_write_reg(&plane->layer, ATMEL_XLCDC_LAYER_IDR,
> +				    0xffffffff);
> +
> +	/* Disable the layer */
> +	atmel_hlcdc_layer_write_reg(&plane->layer,
> +				    ATMEL_XLCDC_LAYER_ENR, 0);
> +
> +	/* Clear all pending interrupts */
> +	atmel_hlcdc_layer_read_reg(&plane->layer, ATMEL_XLCDC_LAYER_ISR);
> +}
> +
> +static void atmel_hlcdc_plane_atomic_disable(struct drm_plane *p,
> +					     struct drm_atomic_state *state)
> +{
> +	struct atmel_hlcdc_plane *plane = drm_plane_to_atmel_hlcdc_plane(p);
> +	struct atmel_hlcdc_dc *dc = plane->base.dev->dev_private;
> +
> +	dc->desc->ops->lcdc_atomic_disable(plane);
> +}
> +
> +void hlcdc_atomic_update(struct atmel_hlcdc_plane *plane,
> +			 struct atmel_hlcdc_dc *dc)
> +{
> +	u32 sr;
> +
> +	/* Enable the overrun interrupts. */
> +	atmel_hlcdc_layer_write_reg(&plane->layer, ATMEL_HLCDC_LAYER_IER,
> +				    ATMEL_HLCDC_LAYER_OVR_IRQ(0) |
> +				    ATMEL_HLCDC_LAYER_OVR_IRQ(1) |
> +				    ATMEL_HLCDC_LAYER_OVR_IRQ(2));
> +
> +	/* Apply the new config at the next SOF event. */
> +	sr = atmel_hlcdc_layer_read_reg(&plane->layer, ATMEL_HLCDC_LAYER_CHSR);
> +	atmel_hlcdc_layer_write_reg(&plane->layer, ATMEL_HLCDC_LAYER_CHER,
> +				    ATMEL_HLCDC_LAYER_UPDATE |
> +				    (sr & ATMEL_HLCDC_LAYER_EN ?
> +				    ATMEL_HLCDC_LAYER_A2Q : ATMEL_HLCDC_LAYER_EN));
> +}
> +
> +void xlcdc_atomic_update(struct atmel_hlcdc_plane *plane,
> +			 struct atmel_hlcdc_dc *dc)
> +{
> +	/* Enable the overrun interrupts. */
> +	atmel_hlcdc_layer_write_reg(&plane->layer, ATMEL_XLCDC_LAYER_IER,
> +				    ATMEL_XLCDC_LAYER_OVR_IRQ(0) |
> +				    ATMEL_XLCDC_LAYER_OVR_IRQ(1) |
> +				    ATMEL_XLCDC_LAYER_OVR_IRQ(2));
> +
> +	atmel_hlcdc_layer_write_reg(&plane->layer, ATMEL_XLCDC_LAYER_ENR,
> +				    ATMEL_XLCDC_LAYER_EN);
> +
> +	/*
> +	 * Updating XLCDC_xxxCFGx, XLCDC_xxxFBA and XLCDC_xxxEN,
> +	 * (where xxx indicates each layer) requires writing one to the
> +	 * Update Attribute field for each layer in LCDC_ATTRE register for SAM9X7.
> +	 */
> +	regmap_write(dc->hlcdc->regmap, ATMEL_XLCDC_ATTRE, ATMEL_XLCDC_BASE_UPDATE |
> +		     ATMEL_XLCDC_OVR1_UPDATE | ATMEL_XLCDC_OVR3_UPDATE |
> +		     ATMEL_XLCDC_HEO_UPDATE);
> +}
> +
>  static void atmel_hlcdc_plane_atomic_update(struct drm_plane *p,
>  					    struct drm_atomic_state *state)
>  {
> @@ -739,7 +896,7 @@ static void atmel_hlcdc_plane_atomic_update(struct drm_plane *p,
>  	struct atmel_hlcdc_plane *plane = drm_plane_to_atmel_hlcdc_plane(p);
>  	struct atmel_hlcdc_plane_state *hstate =
>  			drm_plane_state_to_atmel_hlcdc_plane_state(new_s);
> -	u32 sr;
> +	struct atmel_hlcdc_dc *dc = p->dev->dev_private;
>  
>  	if (!new_s->crtc || !new_s->fb)
>  		return;
> @@ -750,29 +907,63 @@ static void atmel_hlcdc_plane_atomic_update(struct drm_plane *p,
>  	}
>  
>  	atmel_hlcdc_plane_update_pos_and_size(plane, hstate);
> -	atmel_hlcdc_plane_update_general_settings(plane, hstate);
> +	dc->desc->ops->lcdc_update_general_settings(plane, hstate);
>  	atmel_hlcdc_plane_update_format(plane, hstate);
>  	atmel_hlcdc_plane_update_clut(plane, hstate);
>  	atmel_hlcdc_plane_update_buffers(plane, hstate);
>  	atmel_hlcdc_plane_update_disc_area(plane, hstate);
>  
> -	/* Enable the overrun interrupts. */
> -	atmel_hlcdc_layer_write_reg(&plane->layer, ATMEL_HLCDC_LAYER_IER,
> -				    ATMEL_HLCDC_LAYER_OVR_IRQ(0) |
> -				    ATMEL_HLCDC_LAYER_OVR_IRQ(1) |
> -				    ATMEL_HLCDC_LAYER_OVR_IRQ(2));
> +	dc->desc->ops->lcdc_atomic_update(plane, dc);
> +}
>  
> -	/* Apply the new config at the next SOF event. */
> -	sr = atmel_hlcdc_layer_read_reg(&plane->layer, ATMEL_HLCDC_LAYER_CHSR);
> -	atmel_hlcdc_layer_write_reg(&plane->layer, ATMEL_HLCDC_LAYER_CHER,
> -			ATMEL_HLCDC_LAYER_UPDATE |
> -			(sr & ATMEL_HLCDC_LAYER_EN ?
> -			 ATMEL_HLCDC_LAYER_A2Q : ATMEL_HLCDC_LAYER_EN));
> +void hlcdc_csc_init(struct atmel_hlcdc_plane *plane,
> +		    const struct atmel_hlcdc_layer_desc *desc)
> +{
> +	/*
> +	 * TODO: declare a "yuv-to-rgb-conv-factors" property to let
> +	 * userspace modify these factors (using a BLOB property ?).
> +	 */
> +	static u32 hlcdc_csc_coeffs[] = {

static const u32 hlcdc_csc_coeffs[] = {

> +		0x4c900091,
> +		0x7a5f5090,
> +		0x40040890
> +	};
> +
> +	for (int i = 0; i < ARRAY_SIZE(hlcdc_csc_coeffs); i++) {
> +		atmel_hlcdc_layer_write_cfg(&plane->layer,
> +					    desc->layout.csc + i,
> +					    hlcdc_csc_coeffs[i]);
> +	}
> +}
> +
> +void xlcdc_csc_init(struct atmel_hlcdc_plane *plane,
> +		    const struct atmel_hlcdc_layer_desc *desc)
> +{
> +	/*
> +	 * yuv-to-rgb-conv-factors are now defined from LCDC_HEOCFG16 to
> +	 * LCDC_HEOCFG21 registers in SAM9X7.
> +	 */
> +	static u32 xlcdc_csc_coeffs[] = {

static const u32 xlcdc_csc_coeffs[] = {

> +		0x00000488,
> +		0x00000648,
> +		0x1EA00480,
> +		0x00001D28,
> +		0x08100480,
> +		0x00000000,
> +		0x00000007
> +	};
> +
> +	for (int i = 0; i < ARRAY_SIZE(xlcdc_csc_coeffs); i++) {
> +		atmel_hlcdc_layer_write_cfg(&plane->layer,
> +					    desc->layout.csc + i,
> +					    xlcdc_csc_coeffs[i]);
> +	}
>  }
>  
>  static int atmel_hlcdc_plane_init_properties(struct atmel_hlcdc_plane *plane)
>  {
>  	const struct atmel_hlcdc_layer_desc *desc = plane->layer.desc;
> +	struct atmel_hlcdc_dc *dc = plane->base.dev->dev_private;
>  
>  	if (desc->type == ATMEL_HLCDC_OVERLAY_LAYER ||
>  	    desc->type == ATMEL_HLCDC_CURSOR_LAYER) {
> @@ -796,31 +987,16 @@ static int atmel_hlcdc_plane_init_properties(struct atmel_hlcdc_plane *plane)
>  			return ret;
>  	}
>  
> -	if (desc->layout.csc) {
> -		/*
> -		 * TODO: decare a "yuv-to-rgb-conv-factors" property to let
> -		 * userspace modify these factors (using a BLOB property ?).
> -		 */
> -		atmel_hlcdc_layer_write_cfg(&plane->layer,
> -					    desc->layout.csc,
> -					    0x4c900091);
> -		atmel_hlcdc_layer_write_cfg(&plane->layer,
> -					    desc->layout.csc + 1,
> -					    0x7a5f5090);
> -		atmel_hlcdc_layer_write_cfg(&plane->layer,
> -					    desc->layout.csc + 2,
> -					    0x40040890);
> -	}
> +	if (desc->layout.csc)
> +		dc->desc->ops->lcdc_csc_init(plane, desc);
>  
>  	return 0;
>  }
>  
> -void atmel_hlcdc_plane_irq(struct atmel_hlcdc_plane *plane)
> +void hlcdc_irq_dbg(struct atmel_hlcdc_plane *plane,
> +		   const struct atmel_hlcdc_layer_desc *desc)
>  {
> -	const struct atmel_hlcdc_layer_desc *desc = plane->layer.desc;
> -	u32 isr;
> -
> -	isr = atmel_hlcdc_layer_read_reg(&plane->layer, ATMEL_HLCDC_LAYER_ISR);
> +	u32 isr = atmel_hlcdc_layer_read_reg(&plane->layer, ATMEL_HLCDC_LAYER_ISR);
>  
>  	/*
>  	 * There's not much we can do in case of overrun except informing
> @@ -830,8 +1006,31 @@ void atmel_hlcdc_plane_irq(struct atmel_hlcdc_plane *plane)
>  	if (isr &
>  	    (ATMEL_HLCDC_LAYER_OVR_IRQ(0) | ATMEL_HLCDC_LAYER_OVR_IRQ(1) |
>  	     ATMEL_HLCDC_LAYER_OVR_IRQ(2)))
> -		dev_dbg(plane->base.dev->dev, "overrun on plane %s\n",
> -			desc->name);
> +		dev_warn(plane->base.dev->dev, "overrun on plane %s\n", desc->name);

why changed it to dev_warn() ?

> +}
> +
> +void xlcdc_irq_dbg(struct atmel_hlcdc_plane *plane,
> +		   const struct atmel_hlcdc_layer_desc *desc)
> +{
> +	u32 isr = atmel_hlcdc_layer_read_reg(&plane->layer, ATMEL_XLCDC_LAYER_ISR);
> +
> +	/*
> +	 * There's not much we can do in case of overrun except informing
> +	 * the user. However, we are in interrupt context here, hence the
> +	 * use of dev_dbg().
> +	 */
> +	if (isr &
> +	    (ATMEL_XLCDC_LAYER_OVR_IRQ(0) | ATMEL_XLCDC_LAYER_OVR_IRQ(1) |
> +	     ATMEL_XLCDC_LAYER_OVR_IRQ(2)))
> +		dev_warn(plane->base.dev->dev, "overrun on plane %s\n", desc->name);
> +}
> +
> +void atmel_hlcdc_plane_irq(struct atmel_hlcdc_plane *plane)
> +{
> +	const struct atmel_hlcdc_layer_desc *desc = plane->layer.desc;
> +	struct atmel_hlcdc_dc *dc = plane->base.dev->dev_private;
> +
> +	dc->desc->ops->lcdc_irq_dbg(plane, desc);
>  }
>  
>  static const struct drm_plane_helper_funcs atmel_hlcdc_layer_plane_helper_funcs = {
