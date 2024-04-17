Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3E28A80F2
	for <lists+dri-devel@lfdr.de>; Wed, 17 Apr 2024 12:30:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD06F10F5B5;
	Wed, 17 Apr 2024 10:30:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="A6OzMDZU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93A0011339C
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Apr 2024 10:30:19 +0000 (UTC)
Received: from [192.168.88.20] (91-154-34-181.elisa-laajakaista.fi
 [91.154.34.181])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9002516F9;
 Wed, 17 Apr 2024 12:29:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1713349771;
 bh=+gBG99f0GmjeWR4WBbEAkDNYZuCzgUsWIIYF0c+Dnhw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=A6OzMDZU51R6f6/0Ix/dluKPIax+YWhsP89GqNlQt0I6FFR14+FgiUIEIbV5QHuH2
 mhHMsSmBAFzxHu0Bzzyb9hUGoK7zG5q01wRj63ky5o5KCd8TbrsU1j6S+p4ZtcMkf5
 b6dzWsnGZ9PRXlAaR4iqG0J4ZwNacJh27aNG4sz4=
Message-ID: <bdff1794-f3eb-4845-a73a-0b76d2759eec@ideasonboard.com>
Date: Wed, 17 Apr 2024 13:30:14 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/7] drm: xlnx: zynqmp_dpsub: Set input live format
To: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-media@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Michal Simek <michal.simek@amd.com>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20240416-dp-live-fmt-v4-0-c7f379b7168e@amd.com>
 <20240416-dp-live-fmt-v4-6-c7f379b7168e@amd.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Language: en-US
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <20240416-dp-live-fmt-v4-6-c7f379b7168e@amd.com>
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

On 16/04/2024 23:31, Anatoliy Klymenko wrote:
> Program live video input format according to selected media bus format.
> 
> In the bridge mode of operation, DPSUB is connected to FPGA CRTC which
> almost certainly supports a single media bus format as its output. Expect
> this to be delivered via the new bridge atomic state. Program DPSUB
> registers accordingly.
> 
> Signed-off-by: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
> ---
>   drivers/gpu/drm/xlnx/zynqmp_disp.c | 92 ++++++++++++++++++++++++++++++++------
>   drivers/gpu/drm/xlnx/zynqmp_disp.h |  2 +
>   drivers/gpu/drm/xlnx/zynqmp_dp.c   | 13 ++++--
>   3 files changed, 90 insertions(+), 17 deletions(-)
> 

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

  Tomi

> diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> index 8cdd74a9b772..13157da0089e 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> @@ -436,19 +436,29 @@ static void zynqmp_disp_avbuf_set_format(struct zynqmp_disp *disp,
>   					 const struct zynqmp_disp_format *fmt)
>   {
>   	unsigned int i;
> -	u32 val;
> +	u32 val, reg;
>   
> -	val = zynqmp_disp_avbuf_read(disp, ZYNQMP_DISP_AV_BUF_FMT);
> -	val &= zynqmp_disp_layer_is_video(layer)
> -	    ? ~ZYNQMP_DISP_AV_BUF_FMT_NL_VID_MASK
> -	    : ~ZYNQMP_DISP_AV_BUF_FMT_NL_GFX_MASK;
> -	val |= fmt->buf_fmt;
> -	zynqmp_disp_avbuf_write(disp, ZYNQMP_DISP_AV_BUF_FMT, val);
> +	layer->disp_fmt = fmt;
> +	if (layer->mode == ZYNQMP_DPSUB_LAYER_NONLIVE) {
> +		reg = ZYNQMP_DISP_AV_BUF_FMT;
> +		val = zynqmp_disp_avbuf_read(disp, ZYNQMP_DISP_AV_BUF_FMT);
> +		val &= zynqmp_disp_layer_is_video(layer)
> +		    ? ~ZYNQMP_DISP_AV_BUF_FMT_NL_VID_MASK
> +		    : ~ZYNQMP_DISP_AV_BUF_FMT_NL_GFX_MASK;
> +		val |= fmt->buf_fmt;
> +		zynqmp_disp_avbuf_write(disp, reg, val);
> +	} else {
> +		reg = zynqmp_disp_layer_is_video(layer)
> +		    ? ZYNQMP_DISP_AV_BUF_LIVE_VID_CONFIG
> +		    : ZYNQMP_DISP_AV_BUF_LIVE_GFX_CONFIG;
> +		val = fmt->buf_fmt;
> +		zynqmp_disp_avbuf_write(disp, reg, val);
> +	}
>   
>   	for (i = 0; i < ZYNQMP_DISP_AV_BUF_NUM_SF; i++) {
> -		unsigned int reg = zynqmp_disp_layer_is_video(layer)
> -				 ? ZYNQMP_DISP_AV_BUF_VID_COMP_SF(i)
> -				 : ZYNQMP_DISP_AV_BUF_GFX_COMP_SF(i);
> +		reg = zynqmp_disp_layer_is_video(layer)
> +		    ? ZYNQMP_DISP_AV_BUF_VID_COMP_SF(i)
> +		    : ZYNQMP_DISP_AV_BUF_GFX_COMP_SF(i);
>   
>   		zynqmp_disp_avbuf_write(disp, reg, fmt->sf[i]);
>   	}
> @@ -926,6 +936,31 @@ zynqmp_disp_layer_find_format(struct zynqmp_disp_layer *layer,
>   	return NULL;
>   }
>   
> +/**
> + * zynqmp_disp_layer_find_live_format - Find format information for given
> + * media bus format
> + * @layer: The layer
> + * @drm_fmt: Media bus format to search
> + *
> + * Search display subsystem format information corresponding to the given media
> + * bus format @media_bus_format for the @layer, and return a pointer to the
> + * format descriptor.
> + *
> + * Return: A pointer to the format descriptor if found, NULL otherwise
> + */
> +static const struct zynqmp_disp_format *
> +zynqmp_disp_layer_find_live_format(struct zynqmp_disp_layer *layer,
> +				   u32 media_bus_format)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < layer->info->num_formats; i++)
> +		if (layer->info->formats[i].bus_fmt == media_bus_format)
> +			return &layer->info->formats[i];
> +
> +	return NULL;
> +}
> +
>   /**
>    * zynqmp_disp_layer_drm_formats - Return the DRM formats supported by the layer
>    * @layer: The layer
> @@ -1040,6 +1075,9 @@ void zynqmp_disp_layer_disable(struct zynqmp_disp_layer *layer)
>    * @layer: The layer
>    * @info: The format info
>    *
> + * NOTE: Use zynqmp_disp_layer_set_live_format() to set media bus format for
> + * live video layers.
> + *
>    * Set the format for @layer to @info. The layer must be disabled.
>    */
>   void zynqmp_disp_layer_set_format(struct zynqmp_disp_layer *layer,
> @@ -1047,14 +1085,16 @@ void zynqmp_disp_layer_set_format(struct zynqmp_disp_layer *layer,
>   {
>   	unsigned int i;
>   
> +	if (WARN_ON(layer->mode != ZYNQMP_DPSUB_LAYER_NONLIVE))
> +		return;
> +
>   	layer->disp_fmt = zynqmp_disp_layer_find_format(layer, info->format);
> +	if (WARN_ON(!layer->disp_fmt))
> +		return;
>   	layer->drm_fmt = info;
>   
>   	zynqmp_disp_avbuf_set_format(layer->disp, layer, layer->disp_fmt);
>   
> -	if (layer->mode == ZYNQMP_DPSUB_LAYER_LIVE)
> -		return;
> -
>   	/*
>   	 * Set pconfig for each DMA channel to indicate they're part of a
>   	 * video group.
> @@ -1074,6 +1114,32 @@ void zynqmp_disp_layer_set_format(struct zynqmp_disp_layer *layer,
>   	}
>   }
>   
> +/**
> + * zynqmp_disp_layer_set_live_format - Set the live video layer format
> + * @layer: The layer
> + * @info: The format info
> + *
> + * NOTE: This function should not be used to set format for non-live video
> + * layer. Use zynqmp_disp_layer_set_format() instead.
> + *
> + * Set the display format for the live @layer. The layer must be disabled.
> + */
> +void zynqmp_disp_layer_set_live_format(struct zynqmp_disp_layer *layer,
> +				       u32 media_bus_format)
> +{
> +	if (WARN_ON(layer->mode != ZYNQMP_DPSUB_LAYER_LIVE))
> +		return;
> +
> +	layer->disp_fmt = zynqmp_disp_layer_find_live_format(layer,
> +							     media_bus_format);
> +	if (WARN_ON(!layer->disp_fmt))
> +		return;
> +
> +	zynqmp_disp_avbuf_set_format(layer->disp, layer, layer->disp_fmt);
> +
> +	layer->drm_fmt = drm_format_info(layer->disp_fmt->drm_fmt);
> +}
> +
>   /**
>    * zynqmp_disp_layer_update - Update the layer framebuffer
>    * @layer: The layer
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.h b/drivers/gpu/drm/xlnx/zynqmp_disp.h
> index efd1c52c2916..fa545533c9d1 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_disp.h
> +++ b/drivers/gpu/drm/xlnx/zynqmp_disp.h
> @@ -58,6 +58,8 @@ void zynqmp_disp_layer_enable(struct zynqmp_disp_layer *layer);
>   void zynqmp_disp_layer_disable(struct zynqmp_disp_layer *layer);
>   void zynqmp_disp_layer_set_format(struct zynqmp_disp_layer *layer,
>   				  const struct drm_format_info *info);
> +void zynqmp_disp_layer_set_live_format(struct zynqmp_disp_layer *layer,
> +				       u32 media_bus_format);
>   int zynqmp_disp_layer_update(struct zynqmp_disp_layer *layer,
>   			     struct drm_plane_state *state);
>   
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> index faaeea526970..a7fa5e2abb9b 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> @@ -1299,15 +1299,20 @@ static void zynqmp_dp_disp_enable(struct zynqmp_dp *dp,
>   				  struct drm_bridge_state *old_bridge_state)
>   {
>   	struct zynqmp_disp_layer *layer;
> -	const struct drm_format_info *info;
> +	struct drm_bridge_state *bridge_state;
> +	u32 bus_fmt;
>   
>   	layer = zynqmp_dp_disp_connected_live_layer(dp);
>   	if (!layer)
>   		return;
>   
> -	/* TODO: Make the format configurable. */
> -	info = drm_format_info(DRM_FORMAT_YUV422);
> -	zynqmp_disp_layer_set_format(layer, info);
> +	bridge_state = drm_atomic_get_new_bridge_state(old_bridge_state->base.state,
> +						       old_bridge_state->bridge);
> +	if (WARN_ON(!bridge_state))
> +		return;
> +
> +	bus_fmt = bridge_state->input_bus_cfg.format;
> +	zynqmp_disp_layer_set_live_format(layer, bus_fmt);
>   	zynqmp_disp_layer_enable(layer);
>   
>   	if (layer == dp->dpsub->layers[ZYNQMP_DPSUB_LAYER_GFX])
> 

