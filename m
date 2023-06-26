Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA1A73EC11
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jun 2023 22:50:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7726010E248;
	Mon, 26 Jun 2023 20:50:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay2-1.pub.mailoutpod2-cph3.one.com
 (mailrelay2-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:401::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA88710E248
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jun 2023 20:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=NYeRwaoTWrPLKP9PgW4Tjrn2D7H4Yj4pxR+jSCzWyMM=;
 b=mWnA6p4dWIM7EPPBFmMP4BttZcFFZJu6CBFACSeMeakHk21HIJNA/PT/qx57UC/o9enF0om21Z1WW
 zawMK1hvJjqUvsmihbAqQT+t19Qngoj6QnTNBEiJ1YuLxK281OnO9mU/NM4rhIJVT/gJYWee4qiQ4i
 EsJQd86quy6hVrQy6JyN6MuJ9ojA3Yr9mDMcTl/jd0KcOEBQzVHid7987pvuCztaLEZ2rZ5RG2SACt
 GfSDzDO6JFsjvXXD4Z9uIdOIbboNbDhZ63grOVsMthKURQzgTgOEe1x2M5mPMIxqfBNthpDmYirHHG
 WgrXIIkmSAM8OZw+9lXk2JpUrz9uyYg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=NYeRwaoTWrPLKP9PgW4Tjrn2D7H4Yj4pxR+jSCzWyMM=;
 b=Wa9js+YYdcMIDirWIKiaw1Pbr3MhO3EZAqX8iLjK8nBmQqMiNwp0D+d4vOy8s9IS6xCxC9UfWFSgq
 DedWCp/Cg==
X-HalOne-ID: 00b64f48-1463-11ee-b39d-5ba399456a4a
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay2 (Halon) with ESMTPSA
 id 00b64f48-1463-11ee-b39d-5ba399456a4a;
 Mon, 26 Jun 2023 20:49:56 +0000 (UTC)
Date: Mon, 26 Jun 2023 22:49:54 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Manikandan Muralidharan <manikandan.m@microchip.com>
Subject: Re: [PATCH 6/9] drm: atmel_hlcdc: Add support for XLCDC in atmel LCD
 driver
Message-ID: <20230626204954.GB11422@ravnborg.org>
References: <20230613070426.467389-1-manikandan.m@microchip.com>
 <20230613070426.467389-7-manikandan.m@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230613070426.467389-7-manikandan.m@microchip.com>
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
Cc: Nayabbasha.Sayed@microchip.com, devicetree@vger.kernel.org,
 alexandre.belloni@bootlin.com, bbrezillon@kernel.org,
 linux-kernel@vger.kernel.org, Balamanikandan.Gunasundar@microchip.com,
 lee@kernel.org, conor+dt@kernel.org, dri-devel@lists.freedesktop.org,
 nicolas.ferre@microchip.com, Varshini.Rajendran@microchip.com,
 Dharma.B@microchip.com, robh+dt@kernel.org, Durai.ManickamKR@microchip.com,
 krzysztof.kozlowski+dt@linaro.org, Hari.PrasathGE@microchip.com,
 Balakrishnan.S@microchip.com, claudiu.beznea@microchip.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Manikandan,

On Tue, Jun 13, 2023 at 12:34:23PM +0530, Manikandan Muralidharan wrote:
> - XLCDC in SAM9X7 has different sets of registers and additional
> configuration bits when compared to previous HLCDC IP. Read/write
> operation on the controller registers is now separated using the
> XLCDC status flag.
> 	- HEO scaling, window resampling, Alpha blending, YUV-to-RGB
> conversion in XLCDC is derived and handled using additional
> configuration bits and registers.
> 	- Writing one to the Enable fields of each layer in LCD_ATTRE
> is required to reflect the values set in Configuration, FBA, Enable
> registers of each layer

In general things would benefit from a more clear separation between
hlcdc and xlcdc. In several cases two functions would be better than
testing as done today.

See some more specific comments in the following.

	Sam

> 
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
> [Hari.PrasathGE@microchip.com: update the attribute field for each layer]
> Signed-off-by: Hari Prasath Gujulan Elango <Hari.PrasathGE@microchip.com>
> [durai.manickamkr@microchip.com: implement status flag to seprate register update]
> Signed-off-by: Durai Manickam KR <durai.manickamkr@microchip.com>
> ---
>  .../gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c    |  28 +-
>  .../gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c   | 297 ++++++++++++++----
>  2 files changed, 256 insertions(+), 69 deletions(-)
> 
> diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
> index 58184cd6ab0b..7c9cf7c0c75d 100644
> --- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
> +++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
> @@ -139,10 +139,10 @@ static void atmel_hlcdc_crtc_mode_set_nofb(struct drm_crtc *c)
>  	state = drm_crtc_state_to_atmel_hlcdc_crtc_state(c->state);
>  	cfg = state->output_mode << 8;
>  
> -	if (adj->flags & DRM_MODE_FLAG_NVSYNC)
> +	if (!crtc->dc->is_xlcdc && (adj->flags & DRM_MODE_FLAG_NVSYNC))
>  		cfg |= ATMEL_HLCDC_VSPOL;
>  
> -	if (adj->flags & DRM_MODE_FLAG_NHSYNC)
> +	if (!crtc->dc->is_xlcdc && (adj->flags & DRM_MODE_FLAG_NHSYNC))
>  		cfg |= ATMEL_HLCDC_HSPOL;

From the above code I assume ATMEL_HLCDC_VSPOL and ATMEL_HLCDC_HSPOL are
specific to HLCDC and not part of XLCDC register set.

We can identify XLCDC specific registers as thy use "XLCDC" in the name.
But the "HLCDC" specific registers are not easy to spot.

Would it make sense to update the register definitions so we can see in
the register names which at XLCDC, which are HLCDC and which a common
(LCDC)?

It would require a little code crunch to do so as all users would need
an update. Dunno if this is worth it.
But then at least a comment in the register definition file.


>  
>  	regmap_update_bits(regmap, ATMEL_HLCDC_CFG(5),
> @@ -177,6 +177,18 @@ static void atmel_hlcdc_crtc_atomic_disable(struct drm_crtc *c,
>  
>  	pm_runtime_get_sync(dev->dev);
>  
> +	if (crtc->dc->is_xlcdc) {
> +		regmap_write(regmap, ATMEL_HLCDC_DIS, ATMEL_XLCDC_CM);
> +		while (!regmap_read(regmap, ATMEL_HLCDC_SR, &status) &&
> +		       (status & ATMEL_XLCDC_CM))
> +			cpu_relax();
> +
> +		regmap_write(regmap, ATMEL_HLCDC_DIS, ATMEL_XLCDC_SD);
> +		while (!regmap_read(regmap, ATMEL_HLCDC_SR, &status) &&
> +		       !(status & ATMEL_XLCDC_SD))
> +			cpu_relax();
> +	}

A small helper atmel_xlcdc_disable()?

> +
>  	regmap_write(regmap, ATMEL_HLCDC_DIS, ATMEL_HLCDC_DISP);
>  	while (!regmap_read(regmap, ATMEL_HLCDC_SR, &status) &&
>  	       (status & ATMEL_HLCDC_DISP))
> @@ -231,6 +243,18 @@ static void atmel_hlcdc_crtc_atomic_enable(struct drm_crtc *c,
>  	       !(status & ATMEL_HLCDC_DISP))
>  		cpu_relax();
>  
> +	if (crtc->dc->is_xlcdc) {
> +		regmap_write(regmap, ATMEL_HLCDC_EN, ATMEL_XLCDC_CM);
> +		while (!regmap_read(regmap, ATMEL_HLCDC_SR, &status) &&
> +		       !(status & ATMEL_XLCDC_CM))
> +			cpu_relax();
> +
> +		regmap_write(regmap, ATMEL_HLCDC_EN, ATMEL_XLCDC_SD);
> +		while (!regmap_read(regmap, ATMEL_HLCDC_SR, &status) &&
> +		       (status & ATMEL_XLCDC_SD))
> +			cpu_relax();
> +	}

A small helper atmel_xlcdc_enable()?

> +
>  	pm_runtime_put_sync(dev->dev);
>  
>  }
> diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
> index daa508504f47..fe33476818c4 100644
> --- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
> +++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
> @@ -330,11 +330,59 @@ static void atmel_hlcdc_plane_setup_scaler(struct atmel_hlcdc_plane *plane,
>  								     yfactor));
>  }
>  
> +static void atmel_xlcdc_plane_setup_scaler(struct atmel_hlcdc_plane *plane,
> +					   struct atmel_hlcdc_plane_state *state)
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
> +	xfactor = (1048576 * state->src_w) / state->crtc_w;
> +
> +	/* yfactor = round[(2^20 * YMEMSIZE)/YSIZE)] */
> +	yfactor = (1048576 * state->src_h) / state->crtc_h;
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
> +		atmel_hlcdc_layer_write_cfg(&plane->layer, desc->layout.scaler_config + 2,
> +					    yfactor / 2);
> +		atmel_hlcdc_layer_write_cfg(&plane->layer, desc->layout.scaler_config + 4,
> +					    xfactor / 2);
> +	} else {
> +		/* As per ARGB window resampling configuration */
> +		atmel_hlcdc_layer_write_cfg(&plane->layer, desc->layout.scaler_config + 2,
> +					    yfactor);
> +		atmel_hlcdc_layer_write_cfg(&plane->layer, desc->layout.scaler_config + 4,
> +					    xfactor);
> +	}
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
> @@ -352,7 +400,10 @@ atmel_hlcdc_plane_update_pos_and_size(struct atmel_hlcdc_plane *plane,
>  					ATMEL_HLCDC_LAYER_POS(state->crtc_x,
>  							      state->crtc_y));
>  
> -	atmel_hlcdc_plane_setup_scaler(plane, state);
> +	if (!(dc->is_xlcdc))
> +		atmel_hlcdc_plane_setup_scaler(plane, state);
> +	else
> +		atmel_xlcdc_plane_setup_scaler(plane, state);
>  }
>  
>  static void
> @@ -362,33 +413,58 @@ atmel_hlcdc_plane_update_general_settings(struct atmel_hlcdc_plane *plane,
>  	unsigned int cfg = ATMEL_HLCDC_LAYER_DMA_BLEN_INCR16 | state->ahb_id;
>  	const struct atmel_hlcdc_layer_desc *desc = plane->layer.desc;
>  	const struct drm_format_info *format = state->base.fb->format;
> -
> +	struct atmel_hlcdc_dc *dc = plane->base.dev->dev_private;
>  	/*
>  	 * Rotation optimization is not working on RGB888 (rotation is still
>  	 * working but without any optimization).
>  	 */
> -	if (format->format == DRM_FORMAT_RGB888)
> +	if ((!(dc->is_xlcdc)) && format->format == DRM_FORMAT_RGB888)
>  		cfg |= ATMEL_HLCDC_LAYER_DMA_ROTDIS;
>  
> -	atmel_hlcdc_layer_write_cfg(&plane->layer, ATMEL_HLCDC_LAYER_DMA_CFG,
> -				    cfg);
> +	if (!(dc->is_xlcdc)) {
> +		atmel_hlcdc_layer_write_cfg(&plane->layer, ATMEL_HLCDC_LAYER_DMA_CFG,
> +					    cfg);
>  
> -	cfg = ATMEL_HLCDC_LAYER_DMA | ATMEL_HLCDC_LAYER_REP;
> +		cfg = ATMEL_HLCDC_LAYER_DMA | ATMEL_HLCDC_LAYER_REP;
> +	} else {
> +		atmel_hlcdc_layer_write_cfg(&plane->layer, ATMEL_XLCDC_LAYER_DMA_CFG,
> +					    cfg);
> +
> +		cfg = ATMEL_XLCDC_LAYER_DMA | ATMEL_XLCDC_LAYER_REP;
> +	}
>  
>  	if (plane->base.type != DRM_PLANE_TYPE_PRIMARY) {
> -		cfg |= ATMEL_HLCDC_LAYER_OVR | ATMEL_HLCDC_LAYER_ITER2BL |
> -		       ATMEL_HLCDC_LAYER_ITER;
> +		if (!(dc->is_xlcdc)) {
> +			cfg |= ATMEL_HLCDC_LAYER_OVR | ATMEL_HLCDC_LAYER_ITER2BL |
> +			       ATMEL_HLCDC_LAYER_ITER;
> +
> +			if (format->has_alpha)
> +				cfg |= ATMEL_HLCDC_LAYER_LAEN;
> +			else
> +				cfg |= ATMEL_HLCDC_LAYER_GAEN |
> +				       ATMEL_HLCDC_LAYER_GA(state->base.alpha);
> +		} else {
> +			/*
> +			 * Alpha Blending bits specific to SAM9X7 SoC
> +			 */
> +			cfg |= ATMEL_XLCDC_LAYER_SFACTC_A0_MULT_AS |
> +			       ATMEL_XLCDC_LAYER_SFACTA_ONE |
> +			       ATMEL_XLCDC_LAYER_DFACTC_M_A0_MULT_AS |
> +			       ATMEL_XLCDC_LAYER_DFACTA_ONE;
> +			if (format->has_alpha)
> +				cfg |= ATMEL_XLCDC_LAYER_A0(0xff);
> +			else
> +				cfg |= ATMEL_XLCDC_LAYER_A0(state->base.alpha);
> +		}
> +	}
>  
> -		if (format->has_alpha)
> -			cfg |= ATMEL_HLCDC_LAYER_LAEN;
> +	if (state->disc_h && state->disc_w) {
> +		if (!(dc->is_xlcdc))
> +			cfg |= ATMEL_HLCDC_LAYER_DISCEN;
>  		else
> -			cfg |= ATMEL_HLCDC_LAYER_GAEN |
> -			       ATMEL_HLCDC_LAYER_GA(state->base.alpha);
> +			cfg |= ATMEL_XLCDC_LAYER_DISCEN;
>  	}
>  
> -	if (state->disc_h && state->disc_w)
> -		cfg |= ATMEL_HLCDC_LAYER_DISCEN;
> -
>  	atmel_hlcdc_layer_write_cfg(&plane->layer, desc->layout.general_config,
>  				    cfg);
>  }

There is almost no code in atmel_hlcdc_plane_update_general_settings
that are shared anymore - please try to split out in two helpers, one
for hlcdc and one for xlcdc. Maybe add a third with some common code if
it makes sense.
That should result in much more readable code in the ind.


> @@ -441,33 +517,42 @@ static void atmel_hlcdc_plane_update_buffers(struct atmel_hlcdc_plane *plane,
>  					struct atmel_hlcdc_plane_state *state)
>  {
>  	const struct atmel_hlcdc_layer_desc *desc = plane->layer.desc;
> +	struct atmel_hlcdc_dc *dc = plane->base.dev->dev_private;
>  	struct drm_framebuffer *fb = state->base.fb;
>  	u32 sr;
>  	int i;
>  
> -	sr = atmel_hlcdc_layer_read_reg(&plane->layer, ATMEL_HLCDC_LAYER_CHSR);
> +	if (!(dc->is_xlcdc))
> +		sr = atmel_hlcdc_layer_read_reg(&plane->layer, ATMEL_HLCDC_LAYER_CHSR);
> +	else
> +		sr = atmel_hlcdc_layer_read_reg(&plane->layer, ATMEL_XLCDC_LAYER_ENR);
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
> +		if (!(dc->is_xlcdc)) {
>  			atmel_hlcdc_layer_write_reg(&plane->layer,
> -					ATMEL_HLCDC_LAYER_PLANE_CTRL(i),
> -					state->dscrs[i]->ctrl);
> +						    ATMEL_HLCDC_LAYER_PLANE_HEAD(i),
> +						    state->dscrs[i]->self);
> +
> +			if (!(sr & ATMEL_HLCDC_LAYER_EN)) {
> +				atmel_hlcdc_layer_write_reg(&plane->layer,
> +							    ATMEL_HLCDC_LAYER_PLANE_ADDR(i),
> +							    state->dscrs[i]->addr);
> +				atmel_hlcdc_layer_write_reg(&plane->layer,
> +							    ATMEL_HLCDC_LAYER_PLANE_CTRL(i),
> +							    state->dscrs[i]->ctrl);
> +				atmel_hlcdc_layer_write_reg(&plane->layer,
> +							    ATMEL_HLCDC_LAYER_PLANE_NEXT(i),
> +							    state->dscrs[i]->self);
> +			}
> +		} else {
>  			atmel_hlcdc_layer_write_reg(&plane->layer,
> -					ATMEL_HLCDC_LAYER_PLANE_NEXT(i),
> -					state->dscrs[i]->self);
> +						    ATMEL_XLCDC_LAYER_PLANE_ADDR(i),
> +						    state->dscrs[i]->addr);
>  		}
> -
>  		if (desc->layout.xstride[i])
>  			atmel_hlcdc_layer_write_cfg(&plane->layer,
>  						    desc->layout.xstride[i],

The xstide stuff is shared the rest is more or less XLCDC / HLCDC
specific. Try to split it out in a few xlcdc/hlcdc helpers to increase
readability.
Maybe do it in two steps. Introduce helper for hlcdc and thenadd xlcdc
stuff.

> @@ -716,19 +801,31 @@ static void atmel_hlcdc_plane_atomic_disable(struct drm_plane *p,
>  					     struct drm_atomic_state *state)
>  {
>  	struct atmel_hlcdc_plane *plane = drm_plane_to_atmel_hlcdc_plane(p);
> -
> +	struct atmel_hlcdc_dc *dc = plane->base.dev->dev_private;
>  	/* Disable interrupts */
> -	atmel_hlcdc_layer_write_reg(&plane->layer, ATMEL_HLCDC_LAYER_IDR,
> -				    0xffffffff);
> +	if (!(dc->is_xlcdc))
> +		atmel_hlcdc_layer_write_reg(&plane->layer, ATMEL_HLCDC_LAYER_IDR,
> +					    0xffffffff);
> +	else
> +		atmel_hlcdc_layer_write_reg(&plane->layer, ATMEL_XLCDC_LAYER_IDR,
> +					    0xffffffff);
>  
>  	/* Disable the layer */
> -	atmel_hlcdc_layer_write_reg(&plane->layer, ATMEL_HLCDC_LAYER_CHDR,
> -				    ATMEL_HLCDC_LAYER_RST |
> -				    ATMEL_HLCDC_LAYER_A2Q |
> -				    ATMEL_HLCDC_LAYER_UPDATE);
> +	if (!(dc->is_xlcdc))
> +		atmel_hlcdc_layer_write_reg(&plane->layer,
> +					    ATMEL_HLCDC_LAYER_CHDR,
> +					    ATMEL_HLCDC_LAYER_RST |
> +					    ATMEL_HLCDC_LAYER_A2Q |
> +					    ATMEL_HLCDC_LAYER_UPDATE);
> +	else
> +		atmel_hlcdc_layer_write_reg(&plane->layer,
> +					    ATMEL_XLCDC_LAYER_ENR, 0);
>  
>  	/* Clear all pending interrupts */
> -	atmel_hlcdc_layer_read_reg(&plane->layer, ATMEL_HLCDC_LAYER_ISR);
> +	if (!(dc->is_xlcdc))
> +		atmel_hlcdc_layer_read_reg(&plane->layer, ATMEL_HLCDC_LAYER_ISR);
> +	else
> +		atmel_hlcdc_layer_read_reg(&plane->layer, ATMEL_XLCDC_LAYER_ISR);
>  }
This looks like another good candidate for two functions, one for xlcdc,
one for hlcdc.

>  
>  static void atmel_hlcdc_plane_atomic_update(struct drm_plane *p,
> @@ -739,6 +836,7 @@ static void atmel_hlcdc_plane_atomic_update(struct drm_plane *p,
>  	struct atmel_hlcdc_plane *plane = drm_plane_to_atmel_hlcdc_plane(p);
>  	struct atmel_hlcdc_plane_state *hstate =
>  			drm_plane_state_to_atmel_hlcdc_plane_state(new_s);
> +	struct atmel_hlcdc_dc *dc = p->dev->dev_private;
>  	u32 sr;
>  
>  	if (!new_s->crtc || !new_s->fb)
> @@ -756,23 +854,46 @@ static void atmel_hlcdc_plane_atomic_update(struct drm_plane *p,
>  	atmel_hlcdc_plane_update_buffers(plane, hstate);
>  	atmel_hlcdc_plane_update_disc_area(plane, hstate);
>  
> -	/* Enable the overrun interrupts. */
> -	atmel_hlcdc_layer_write_reg(&plane->layer, ATMEL_HLCDC_LAYER_IER,
> -				    ATMEL_HLCDC_LAYER_OVR_IRQ(0) |
> -				    ATMEL_HLCDC_LAYER_OVR_IRQ(1) |
> -				    ATMEL_HLCDC_LAYER_OVR_IRQ(2));
> -
> -	/* Apply the new config at the next SOF event. */
> -	sr = atmel_hlcdc_layer_read_reg(&plane->layer, ATMEL_HLCDC_LAYER_CHSR);
> -	atmel_hlcdc_layer_write_reg(&plane->layer, ATMEL_HLCDC_LAYER_CHER,
> -			ATMEL_HLCDC_LAYER_UPDATE |
> -			(sr & ATMEL_HLCDC_LAYER_EN ?
> -			 ATMEL_HLCDC_LAYER_A2Q : ATMEL_HLCDC_LAYER_EN));
> +	if (!(dc->is_xlcdc)) {
> +		/* Enable the overrun interrupts. */
> +		atmel_hlcdc_layer_write_reg(&plane->layer, ATMEL_HLCDC_LAYER_IER,
> +					    ATMEL_HLCDC_LAYER_OVR_IRQ(0) |
> +					    ATMEL_HLCDC_LAYER_OVR_IRQ(1) |
> +					    ATMEL_HLCDC_LAYER_OVR_IRQ(2));
> +
> +		/* Apply the new config at the next SOF event. */
> +		sr = atmel_hlcdc_layer_read_reg(&plane->layer, ATMEL_HLCDC_LAYER_CHSR);
> +		atmel_hlcdc_layer_write_reg(&plane->layer, ATMEL_HLCDC_LAYER_CHER,
> +					    ATMEL_HLCDC_LAYER_UPDATE |
> +					    (sr & ATMEL_HLCDC_LAYER_EN ?
> +					    ATMEL_HLCDC_LAYER_A2Q : ATMEL_HLCDC_LAYER_EN));
> +	} else {
> +		/* Enable the overrun interrupts. */
> +		atmel_hlcdc_layer_write_reg(&plane->layer, ATMEL_XLCDC_LAYER_IER,
> +					    ATMEL_XLCDC_LAYER_OVR_IRQ(0) |
> +					    ATMEL_XLCDC_LAYER_OVR_IRQ(1) |
> +					    ATMEL_XLCDC_LAYER_OVR_IRQ(2));
> +
> +		atmel_hlcdc_layer_write_reg(&plane->layer, ATMEL_XLCDC_LAYER_ENR,
> +					    ATMEL_XLCDC_LAYER_EN);
> +	}
> +
> +	/*
> +	 * Updating XLCDC_xxxCFGx, XLCDC_xxxFBA and XLCDC_xxxEN,
> +	 * (where xxx indicates each layer) requires writing one to the
> +	 * Update Attribute field for each layer in LCDC_ATTRE register for SAM9X7.
> +	 */
> +	if (dc->is_xlcdc) {
> +		regmap_write(dc->hlcdc->regmap, ATMEL_XLCDC_ATTRE, ATMEL_XLCDC_BASE_UPDATE |
> +			     ATMEL_XLCDC_OVR1_UPDATE | ATMEL_XLCDC_OVR3_UPDATE |
> +			     ATMEL_XLCDC_HEO_UPDATE);
> +	}
>  }
Likewise.

>  
>  static int atmel_hlcdc_plane_init_properties(struct atmel_hlcdc_plane *plane)
>  {
>  	const struct atmel_hlcdc_layer_desc *desc = plane->layer.desc;
> +	struct atmel_hlcdc_dc *dc = plane->base.dev->dev_private;
>  
>  	if (desc->type == ATMEL_HLCDC_OVERLAY_LAYER ||
>  	    desc->type == ATMEL_HLCDC_CURSOR_LAYER) {
> @@ -796,20 +917,50 @@ static int atmel_hlcdc_plane_init_properties(struct atmel_hlcdc_plane *plane)
>  			return ret;
>  	}
>  
> -	if (desc->layout.csc) {
> +	if (!(dc->is_xlcdc)) {
> +		if (desc->layout.csc) {
> +			/*
> +			 * TODO: decare a "yuv-to-rgb-conv-factors" property to let
> +			 * userspace modify these factors (using a BLOB property ?).
> +			 */
> +			atmel_hlcdc_layer_write_cfg(&plane->layer,
> +						    desc->layout.csc,
> +						    0x4c900091);
> +			atmel_hlcdc_layer_write_cfg(&plane->layer,
> +						    desc->layout.csc + 1,
> +						    0x7a5f5090);
> +			atmel_hlcdc_layer_write_cfg(&plane->layer,
> +						    desc->layout.csc + 2,
> +						    0x40040890);
> +		}
> +	} else {
>  		/*
> -		 * TODO: decare a "yuv-to-rgb-conv-factors" property to let
> -		 * userspace modify these factors (using a BLOB property ?).
> +		 * yuv-to-rgb-conv-factors are now defined from LCDC_HEOCFG16 to
> +		 * LCDC_HEOCFG21 registers in SAM9X7.
>  		 */
> -		atmel_hlcdc_layer_write_cfg(&plane->layer,
> -					    desc->layout.csc,
> -					    0x4c900091);
> -		atmel_hlcdc_layer_write_cfg(&plane->layer,
> -					    desc->layout.csc + 1,
> -					    0x7a5f5090);
> -		atmel_hlcdc_layer_write_cfg(&plane->layer,
> -					    desc->layout.csc + 2,
> -					    0x40040890);
> +		if (desc->layout.csc) {
> +			atmel_hlcdc_layer_write_cfg(&plane->layer,
> +						    desc->layout.csc,
> +						    0x00000488);
> +			atmel_hlcdc_layer_write_cfg(&plane->layer,
> +						    desc->layout.csc + 1,
> +						    0x00000648);
> +			atmel_hlcdc_layer_write_cfg(&plane->layer,
> +						    desc->layout.csc + 2,
> +						    0x1EA00480);
> +			atmel_hlcdc_layer_write_cfg(&plane->layer,
> +						    desc->layout.csc + 3,
> +						    0x00001D28);
> +			atmel_hlcdc_layer_write_cfg(&plane->layer,
> +						    desc->layout.csc + 4,
> +						    0x08100480);
> +			atmel_hlcdc_layer_write_cfg(&plane->layer,
> +						    desc->layout.csc + 5,
> +						    0x00000000);
> +			atmel_hlcdc_layer_write_cfg(&plane->layer,
> +						    desc->layout.csc + 6,
> +						    0x00000007);
> +		}

Refactor in two helpers?
atmel_xlcdc_layout_csc()
atmel_hlcdc_layout_csc()


>  	}
>  
>  	return 0;
> @@ -819,19 +970,31 @@ void atmel_hlcdc_plane_irq(struct atmel_hlcdc_plane *plane)
>  {
>  	const struct atmel_hlcdc_layer_desc *desc = plane->layer.desc;
>  	u32 isr;
> +	struct atmel_hlcdc_dc *dc = plane->base.dev->dev_private;
>  
> -	isr = atmel_hlcdc_layer_read_reg(&plane->layer, ATMEL_HLCDC_LAYER_ISR);
> +	if (!(dc->is_xlcdc))
> +		isr = atmel_hlcdc_layer_read_reg(&plane->layer, ATMEL_HLCDC_LAYER_ISR);
> +	else
> +		isr = atmel_hlcdc_layer_read_reg(&plane->layer, ATMEL_XLCDC_LAYER_ISR);
>  
>  	/*
>  	 * There's not much we can do in case of overrun except informing
>  	 * the user. However, we are in interrupt context here, hence the
>  	 * use of dev_dbg().
>  	 */
> -	if (isr &
> -	    (ATMEL_HLCDC_LAYER_OVR_IRQ(0) | ATMEL_HLCDC_LAYER_OVR_IRQ(1) |
> -	     ATMEL_HLCDC_LAYER_OVR_IRQ(2)))
> -		dev_dbg(plane->base.dev->dev, "overrun on plane %s\n",
> -			desc->name);
> +	if (!(dc->is_xlcdc)) {
> +		if (isr &
> +		    (ATMEL_HLCDC_LAYER_OVR_IRQ(0) | ATMEL_HLCDC_LAYER_OVR_IRQ(1) |
> +		     ATMEL_HLCDC_LAYER_OVR_IRQ(2)))
> +			dev_dbg(plane->base.dev->dev, "overrun on plane %s\n",
> +				desc->name);
> +	} else {
> +		if (isr &
> +		    (ATMEL_XLCDC_LAYER_OVR_IRQ(0) | ATMEL_XLCDC_LAYER_OVR_IRQ(1) |
> +		     ATMEL_XLCDC_LAYER_OVR_IRQ(2)))
> +			dev_dbg(plane->base.dev->dev, "overrun on plane %s\n",
> +				desc->name);
> +	}
>  }
Again, split up in two functions. Maybe decide which to call in
atmel_hlcdc_layer_irq()
>  
>  static const struct drm_plane_helper_funcs atmel_hlcdc_layer_plane_helper_funcs = {
> -- 
> 2.25.1
