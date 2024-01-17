Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E1D8309D1
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jan 2024 16:33:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7E9010E6DD;
	Wed, 17 Jan 2024 15:33:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DE4610E6DD
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jan 2024 15:33:04 +0000 (UTC)
Received: from [192.168.88.20] (91-154-35-128.elisa-laajakaista.fi
 [91.154.35.128])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 515617E2;
 Wed, 17 Jan 2024 16:31:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1705505512;
 bh=JhCryHsC/k/XdnwAg/As3UY3bGPLO3BK95dmw66ELVk=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=TlJATVJhw4b+K/hsESPdo+kVdcTQ5JS3ICrnGNp8SKajbVo6047BgywnwMjf+HtHD
 cSnWYy1JVnShMkbZDgeGa10Qxon3zDJtS7XRPx2OiI2DBiWhSsS4BokPOot2Oef8x1
 cMxQWvfVOMtZpn/2Dv2AWogL4ZV2ic1CYd1DbPG0=
Message-ID: <dc0c448e-f03d-43ea-b571-3e96d859f89b@ideasonboard.com>
Date: Wed, 17 Jan 2024 17:32:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] drm: xlnx: zynqmp_dpsub: Set live video in format
Content-Language: en-US
To: Anatoliy Klymenko <anatoliy.klymenko@amd.com>,
 laurent.pinchart@ideasonboard.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 michal.simek@amd.com, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240112234222.913138-1-anatoliy.klymenko@amd.com>
 <20240112234222.913138-5-anatoliy.klymenko@amd.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <20240112234222.913138-5-anatoliy.klymenko@amd.com>
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

Hi Anatoliy,

On 13/01/2024 01:42, Anatoliy Klymenko wrote:
> Live video input format is expected to be set as
> "bus-format" property in connected remote endpoint.
> Program live video input format DPSUB registers.
> Set display layer mode in layer creation context.

Some comments inline below. But one thing to improve is the commit desc.

I think this needs more explanation on what's the issue here. So 
basically something like what's the feature in question, why it's not 
working or what's missing, and what does this patch do to get it working.

And while often it's reasonable to expect some level of understanding of 
the HW in question, it doesn't hurt to give some clarifications on the 
names used (here the "live video input").

> Signed-off-by: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
> ---
>   drivers/gpu/drm/xlnx/zynqmp_disp.c      | 109 ++++++++++++++++++++++--
>   drivers/gpu/drm/xlnx/zynqmp_disp.h      |   3 +-
>   drivers/gpu/drm/xlnx/zynqmp_disp_regs.h |   8 +-
>   drivers/gpu/drm/xlnx/zynqmp_dp.c        |   2 +-
>   drivers/gpu/drm/xlnx/zynqmp_kms.c       |   2 +-
>   5 files changed, 107 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> index 8a39b3accce5..83af3ad9cdb5 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> @@ -20,8 +20,10 @@
>   #include <linux/dmaengine.h>
>   #include <linux/module.h>
>   #include <linux/of.h>
> +#include <linux/of_graph.h>
>   #include <linux/platform_device.h>
>   #include <linux/slab.h>
> +#include <linux/media-bus-format.h>

Alphabetical order, please.

>   #include "zynqmp_disp.h"
>   #include "zynqmp_disp_regs.h"
> @@ -67,12 +69,16 @@
>   /**
>    * struct zynqmp_disp_format - Display subsystem format information
>    * @drm_fmt: DRM format (4CC)
> + * @bus_fmt: Live video media bus format
>    * @buf_fmt: AV buffer format
>    * @swap: Flag to swap R & B for RGB formats, and U & V for YUV formats
>    * @sf: Scaling factors for color components
>    */
>   struct zynqmp_disp_format {
> -	u32 drm_fmt;
> +	union {
> +		u32 drm_fmt;
> +		u32 bus_fmt;
> +	};
>   	u32 buf_fmt;
>   	bool swap;
>   	const u32 *sf;
> @@ -354,6 +360,16 @@ static const struct zynqmp_disp_format avbuf_gfx_fmts[] = {
>   	},
>   };
>   
> +/* TODO: add support for different formats */
> +static const struct zynqmp_disp_format avbuf_live_vid_fmts[] = {
> +	{
> +		.bus_fmt	= MEDIA_BUS_FMT_UYVY8_1X16,
> +		.buf_fmt	= ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_BPC_8 |
> +				  ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_FMT_YUV422,
> +		.sf		= scaling_factors_888,
> +	}
> +};
> +
>   static u32 zynqmp_disp_avbuf_read(struct zynqmp_disp *disp, int reg)
>   {
>   	return readl(disp->avbuf.base + reg);
> @@ -369,6 +385,34 @@ static bool zynqmp_disp_layer_is_video(const struct zynqmp_disp_layer *layer)
>   	return layer->id == ZYNQMP_DPSUB_LAYER_VID;
>   }
>   
> +/**
> + * zynqmp_disp_avbuf_set_live_format - Set live input format for a layer
> + * @disp: Display controller
> + * @layer: The layer
> + * @fmt: The format information
> + *
> + * Set the live video input format for @layer to @fmt.
> + */
> +static void zynqmp_disp_avbuf_set_live_format(struct zynqmp_disp *disp,
> +					      struct zynqmp_disp_layer *layer,
> +					      const struct zynqmp_disp_format *fmt)
> +{
> +	u32 reg, i;
> +
> +	reg = zynqmp_disp_layer_is_video(layer)
> +	    ? ZYNQMP_DISP_AV_BUF_LIVE_VID_CONFIG
> +	    : ZYNQMP_DISP_AV_BUF_LIVE_GFX_CONFIG;
> +	zynqmp_disp_avbuf_write(disp, reg, fmt->buf_fmt);
> +
> +	for (i = 0; i < ZYNQMP_DISP_AV_BUF_NUM_SF; ++i) {
> +		reg = zynqmp_disp_layer_is_video(layer)
> +		    ? ZYNQMP_DISP_AV_BUF_LIVD_VID_COMP_SF(i)
> +		    : ZYNQMP_DISP_AV_BUF_LIVD_GFX_COMP_SF(i);
> +		zynqmp_disp_avbuf_write(disp, reg, fmt->sf[i]);
> +	}
> +	layer->disp_fmt = fmt;
> +}
> +
>   /**
>    * zynqmp_disp_avbuf_set_format - Set the input format for a layer
>    * @disp: Display controller
> @@ -902,15 +946,12 @@ u32 *zynqmp_disp_layer_drm_formats(struct zynqmp_disp_layer *layer,
>   /**
>    * zynqmp_disp_layer_enable - Enable a layer
>    * @layer: The layer
> - * @mode: Operating mode of layer
>    *
>    * Enable the @layer in the audio/video buffer manager and the blender. DMA
>    * channels are started separately by zynqmp_disp_layer_update().
>    */
> -void zynqmp_disp_layer_enable(struct zynqmp_disp_layer *layer,
> -			      enum zynqmp_dpsub_layer_mode mode)
> +void zynqmp_disp_layer_enable(struct zynqmp_disp_layer *layer)
>   {
> -	layer->mode = mode;
>   	zynqmp_disp_avbuf_enable_video(layer->disp, layer);
>   	zynqmp_disp_blend_layer_enable(layer->disp, layer);
>   }
> @@ -950,11 +991,12 @@ void zynqmp_disp_layer_set_format(struct zynqmp_disp_layer *layer,
>   	layer->disp_fmt = zynqmp_disp_layer_find_format(layer, info->format);
>   	layer->drm_fmt = info;
>   
> -	zynqmp_disp_avbuf_set_format(layer->disp, layer, layer->disp_fmt);
> -
> -	if (!layer->disp->dpsub->dma_enabled)
> +	/* Live format set during layer creation */
> +	if (layer->mode == ZYNQMP_DPSUB_LAYER_LIVE)
>   		return;
>   
> +	zynqmp_disp_avbuf_set_format(layer->disp, layer, layer->disp_fmt);
> +
>   	/*
>   	 * Set pconfig for each DMA channel to indicate they're part of a
>   	 * video group.
> @@ -1083,7 +1125,7 @@ static int zynqmp_disp_layer_request_dma(struct zynqmp_disp *disp,
>   	unsigned int i;
>   	int ret;
>   
> -	if (!disp->dpsub->dma_enabled)
> +	if (layer->mode == ZYNQMP_DPSUB_LAYER_LIVE)
>   		return 0;
>   
>   	for (i = 0; i < layer->info->num_channels; i++) {
> @@ -1104,6 +1146,43 @@ static int zynqmp_disp_layer_request_dma(struct zynqmp_disp *disp,
>   	return 0;
>   }
>   
> +/**
> + * zynqmp_disp_get_live_fmt - Get live video format
> + * @disp: Display controller
> + * @layer: Display layer
> + *
> + * Parse connected remote endpoint and retrieve configured bus-format
> + *
> + * Return: live format pointer on success, NULL otherwise
> + */
> +static const struct zynqmp_disp_format *zynqmp_disp_get_live_fmt(struct zynqmp_disp *disp,
> +								 struct zynqmp_disp_layer *layer)
> +{
> +	struct device_node *local, *remote, *dpsub = disp->dev->of_node;
> +	int rc, i;
> +	u32 fmt;
> +
> +	local = of_graph_get_endpoint_by_regs(dpsub, layer->id, -1);
> +	if (!local)
> +		return NULL;
> +
> +	remote = of_graph_get_remote_endpoint(local);

The "remote" here is some PL component that provides the live stream? 
I'm not sure if there's a rule for these, but I think usually a driver 
should only read its own properties. I would add 'bus-format' to dp 
endpoint's DT data.

> +	of_node_put(local);
> +	if (!remote)
> +		return NULL;
> +
> +	rc = of_property_read_u32_index(remote, "bus-format", 0, &fmt);

Does this require a change to the DT bindings?

Why is this not of_property_read_u32()?

> +	of_node_put(remote);
> +	if (rc)
> +		return NULL;
> +
> +	for (i = 0; i < ARRAY_SIZE(avbuf_live_vid_fmts); ++i)
> +		if (avbuf_live_vid_fmts[i].bus_fmt == fmt)
> +			return &avbuf_live_vid_fmts[i];
> +
> +	return NULL;
> +}
> +
>   /**
>    * zynqmp_disp_create_layers - Create and initialize all layers
>    * @disp: Display controller
> @@ -1130,9 +1209,15 @@ static int zynqmp_disp_create_layers(struct zynqmp_disp *disp)
>   
>   	for (i = 0; i < ARRAY_SIZE(disp->layers); i++) {
>   		struct zynqmp_disp_layer *layer = &disp->layers[i];
> +		const struct zynqmp_disp_format *disp_fmt;
>   
>   		layer->id = i;
>   		layer->disp = disp;
> +		/* For now we assume dpsub works in either live or non-live mode for both layers.
> +		 * Hybrid mode is not supported yet.
> +		 */
> +		layer->mode = disp->dpsub->dma_enabled ? ZYNQMP_DPSUB_LAYER_NONLIVE
> +						       : ZYNQMP_DPSUB_LAYER_LIVE;
>   		layer->info = &layer_info[i];
>   
>   		ret = zynqmp_disp_layer_request_dma(disp, layer);
> @@ -1140,6 +1225,12 @@ static int zynqmp_disp_create_layers(struct zynqmp_disp *disp)
>   			goto err;
>   
>   		disp->dpsub->layers[i] = layer;
> +
> +		if (layer->mode == ZYNQMP_DPSUB_LAYER_LIVE) {
> +			disp_fmt = zynqmp_disp_get_live_fmt(disp, layer);
> +			if (disp_fmt)
> +				zynqmp_disp_avbuf_set_live_format(disp, layer, disp_fmt);
> +		}
>   	}
>   
>   	return 0;
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.h b/drivers/gpu/drm/xlnx/zynqmp_disp.h
> index 123cffac08be..f3357b2d5c09 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_disp.h
> +++ b/drivers/gpu/drm/xlnx/zynqmp_disp.h
> @@ -62,8 +62,7 @@ void zynqmp_disp_blend_set_global_alpha(struct zynqmp_disp *disp,
>   
>   u32 *zynqmp_disp_layer_drm_formats(struct zynqmp_disp_layer *layer,
>   				   unsigned int *num_formats);
> -void zynqmp_disp_layer_enable(struct zynqmp_disp_layer *layer,
> -			      enum zynqmp_dpsub_layer_mode mode);
> +void zynqmp_disp_layer_enable(struct zynqmp_disp_layer *layer);
>   void zynqmp_disp_layer_disable(struct zynqmp_disp_layer *layer);
>   void zynqmp_disp_layer_set_format(struct zynqmp_disp_layer *layer,
>   				  const struct drm_format_info *info);
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp_regs.h b/drivers/gpu/drm/xlnx/zynqmp_disp_regs.h
> index f92a006d5070..926e07c255bb 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_disp_regs.h
> +++ b/drivers/gpu/drm/xlnx/zynqmp_disp_regs.h
> @@ -165,10 +165,10 @@
>   #define ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_BPC_10		0x2
>   #define ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_BPC_12		0x3
>   #define ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_BPC_MASK		GENMASK(2, 0)
> -#define ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_FMT_RGB		0x0
> -#define ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_FMT_YUV444	0x1
> -#define ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_FMT_YUV422	0x2
> -#define ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_FMT_YONLY	0x3
> +#define ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_FMT_RGB		0x00
> +#define ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_FMT_YUV444	0x10
> +#define ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_FMT_YUV422	0x20
> +#define ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_FMT_YONLY	0x30

What's this about? Were these wrong before? Sounds like a separate patch 
needed for these.

>   #define ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_FMT_MASK		GENMASK(5, 4)
>   #define ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_CB_FIRST		BIT(8)
>   #define ZYNQMP_DISP_AV_BUF_PALETTE_MEMORY		0x400
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> index 571c5dbc97e5..59616ed1c3d9 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> @@ -1295,7 +1295,7 @@ static void zynqmp_dp_disp_enable(struct zynqmp_dp *dp,
>   	/* TODO: Make the format configurable. */
>   	info = drm_format_info(DRM_FORMAT_YUV422);
>   	zynqmp_disp_layer_set_format(layer, info);
> -	zynqmp_disp_layer_enable(layer, ZYNQMP_DPSUB_LAYER_LIVE);
> +	zynqmp_disp_layer_enable(layer);
>   
>   	if (layer_id == ZYNQMP_DPSUB_LAYER_GFX)
>   		zynqmp_disp_blend_set_global_alpha(dp->dpsub->disp, true, 255);
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_kms.c b/drivers/gpu/drm/xlnx/zynqmp_kms.c
> index db3bb4afbfc4..43bf416b33d5 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_kms.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_kms.c
> @@ -122,7 +122,7 @@ static void zynqmp_dpsub_plane_atomic_update(struct drm_plane *plane,
>   
>   	/* Enable or re-enable the plane if the format has changed. */
>   	if (format_changed)
> -		zynqmp_disp_layer_enable(layer, ZYNQMP_DPSUB_LAYER_NONLIVE);
> +		zynqmp_disp_layer_enable(layer);
>   }
>   
>   static const struct drm_plane_helper_funcs zynqmp_dpsub_plane_helper_funcs = {

