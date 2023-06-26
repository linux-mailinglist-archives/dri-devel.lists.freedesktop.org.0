Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B735273EBAC
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jun 2023 22:19:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B42B610E0C1;
	Mon, 26 Jun 2023 20:19:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay6-1.pub.mailoutpod2-cph3.one.com
 (mailrelay6-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:405::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F79A10E0C1
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jun 2023 20:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=HH3O/h9U4e4x7ApDSU3+rbilP/iWCVhv/eDCHxh4kVo=;
 b=T0TBnQT1eRYj5+PK6O9b4JezgAE8HGUuf3EqIznR7yjTP3byGuUGZVB0NpVM6v0NHph2S8l4w4Yig
 RjUEcYC0k2YHs4/+LJGzSA2RxcAK5JW8p4V70Y1MPcDZ17vHxbFD6pLQ3/ZwuAjcVGXztElBaUE9TL
 M72+HdDXfZS7JmvQY2LRAG6yOstR07M5g141BR18GFhnJJSODXcRVOI0PwmqI+dKo8a1zS297XHkjr
 Kh3SCqUL5Ig4ssxpIsSly36JxhtM1UXvTE9jv73Iv1dZ6f3DKFYxHLYRK7gKlZ/2ACkVapwX4IuEWy
 tpnhgNnNqYU3edETCo1325cYSH+mcsQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=HH3O/h9U4e4x7ApDSU3+rbilP/iWCVhv/eDCHxh4kVo=;
 b=9y4tez6lwQh+SQWeTUZSHthxVuGzolmPlBCCnJAJwH1wb6OSjx61Brut1eWWY1b8SxG6Tx6go5INa
 2mLwHLnDg==
X-HalOne-ID: b28f4f00-145e-11ee-8bce-6f01c1d0a443
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay6 (Halon) with ESMTPSA
 id b28f4f00-145e-11ee-8bce-6f01c1d0a443;
 Mon, 26 Jun 2023 20:19:08 +0000 (UTC)
Date: Mon, 26 Jun 2023 22:19:06 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Manikandan Muralidharan <manikandan.m@microchip.com>
Subject: Re: [PATCH 3/9] drm: atmel-hlcdc: add LCD controller layer
 definition for SAM9X7
Message-ID: <20230626201906.GA11422@ravnborg.org>
References: <20230613070426.467389-1-manikandan.m@microchip.com>
 <20230613070426.467389-4-manikandan.m@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230613070426.467389-4-manikandan.m@microchip.com>
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

On Tue, Jun 13, 2023 at 12:34:20PM +0530, Manikandan Muralidharan wrote:
> Add the LCD controller layer definition and descriptor structure for SAM9X7
> for the following layers,
> - Base Layer
> - Overlay1 Layer
> - Overlay2 Layer
> - High End Overlay
> 
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
> ---
>  drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c | 96 ++++++++++++++++++++
>  1 file changed, 96 insertions(+)
> 
> diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
> index fa0f9a93d50d..d7ad828e9e8c 100644
> --- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
> +++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
> @@ -462,6 +462,98 @@ static const struct atmel_hlcdc_dc_desc atmel_hlcdc_dc_sam9x60 = {
>  	.layers = atmel_hlcdc_sam9x60_layers,
>  };
>  
> +static const struct atmel_hlcdc_layer_desc atmel_xlcdc_sam9x7_layers[] = {
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
> +static const struct atmel_hlcdc_dc_desc atmel_xlcdc_dc_sam9x7 = {
> +	.min_width = 0,
> +	.min_height = 0,
> +	.max_width = 2048,
> +	.max_height = 2048,
> +	.max_spw = 0xff,
> +	.max_vpw = 0xff,
> +	.max_hpw = 0x3ff,
> +	.fixed_clksrc = true,
> +	.nlayers = ARRAY_SIZE(atmel_xlcdc_sam9x7_layers),
> +	.layers = atmel_xlcdc_sam9x7_layers,
> +};

As already suggested by someone else, add is_xlcdc to struct
atmel_hlcdc_dc_desc, so the check for the compatible can be dropped.
It would be better to put it here.


	Sam
