Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C3B1899D2D
	for <lists+dri-devel@lfdr.de>; Fri,  5 Apr 2024 14:39:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27FF5113BB9;
	Fri,  5 Apr 2024 12:39:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="IbMukQYS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB694113BB3
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Apr 2024 12:39:28 +0000 (UTC)
Received: from [192.168.88.20] (91-154-34-181.elisa-laajakaista.fi
 [91.154.34.181])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1DC1C8E1;
 Fri,  5 Apr 2024 14:38:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1712320729;
 bh=yRpitgM+m1pVWlMGu1BVSdU1GFZ43sgEarLLyPEtBAg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=IbMukQYStkTPpZVpoHIoCX0N5RD6fMzVaHmrVODI5U53Eu6voMFfqy0YhmJCWb474
 /DXIOS0a3A31amskVy2dTxywc2UaINNXSG3lbMRxecKL934k0y1KY7zXpDQX2UbSRE
 d0bxRlZwZUJyJFi4WY58wg5m2FEdwkD6BY+qSiLo=
Message-ID: <0179c94f-88c1-4b54-8a61-2834f35325ec@ideasonboard.com>
Date: Fri, 5 Apr 2024 15:39:22 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/9] drm: xlnx: zynqmp_dpsub: Anounce supported input
 formats
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
References: <20240321-dp-live-fmt-v3-0-d5090d796b7e@amd.com>
 <20240321-dp-live-fmt-v3-4-d5090d796b7e@amd.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Language: en-US
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <20240321-dp-live-fmt-v3-4-d5090d796b7e@amd.com>
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

On 21/03/2024 22:43, Anatoliy Klymenko wrote:
> DPSUB in bridge mode supports multiple input media bus formats.
> 
> Announce the list of supported input media bus formats via
> drm_bridge.atomic_get_input_bus_fmts callback.
> Introduce a set of live input formats, supported by DPSUB.
> Rename zynqmp_disp_layer_drm_formats() to zynqmp_disp_layer_formats() to
> reflect semantics for both live and non-live layer format lists.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
> ---
>   drivers/gpu/drm/xlnx/zynqmp_disp.c | 76 +++++++++++++++++++++++++++++++++-----
>   drivers/gpu/drm/xlnx/zynqmp_disp.h |  4 +-
>   drivers/gpu/drm/xlnx/zynqmp_dp.c   | 31 ++++++++++++++++
>   drivers/gpu/drm/xlnx/zynqmp_kms.c  |  2 +-
>   4 files changed, 101 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> index e6d26ef60e89..abdc3971b193 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> @@ -18,6 +18,7 @@
>   #include <linux/dma/xilinx_dpdma.h>
>   #include <linux/dma-mapping.h>
>   #include <linux/dmaengine.h>
> +#include <linux/media-bus-format.h>
>   #include <linux/module.h>
>   #include <linux/of.h>
>   #include <linux/platform_device.h>
> @@ -77,12 +78,14 @@ enum zynqmp_dpsub_layer_mode {
>   /**
>    * struct zynqmp_disp_format - Display subsystem format information
>    * @drm_fmt: DRM format (4CC)
> + * @bus_fmt: Media bus format
>    * @buf_fmt: AV buffer format
>    * @swap: Flag to swap R & B for RGB formats, and U & V for YUV formats
>    * @sf: Scaling factors for color components
>    */
>   struct zynqmp_disp_format {
>   	u32 drm_fmt;
> +	u32 bus_fmt;
>   	u32 buf_fmt;
>   	bool swap;
>   	const u32 *sf;
> @@ -182,6 +185,12 @@ static const u32 scaling_factors_565[] = {
>   	ZYNQMP_DISP_AV_BUF_5BIT_SF,
>   };
>   
> +static const u32 scaling_factors_666[] = {
> +	ZYNQMP_DISP_AV_BUF_6BIT_SF,
> +	ZYNQMP_DISP_AV_BUF_6BIT_SF,
> +	ZYNQMP_DISP_AV_BUF_6BIT_SF,
> +};
> +
>   static const u32 scaling_factors_888[] = {
>   	ZYNQMP_DISP_AV_BUF_8BIT_SF,
>   	ZYNQMP_DISP_AV_BUF_8BIT_SF,
> @@ -364,6 +373,41 @@ static const struct zynqmp_disp_format avbuf_gfx_fmts[] = {
>   	},
>   };
>   
> +/* List of live video layer formats */
> +static const struct zynqmp_disp_format avbuf_live_fmts[] = {
> +	{
> +		.drm_fmt	= DRM_FORMAT_RGB565,
> +		.bus_fmt	= MEDIA_BUS_FMT_RGB666_1X18,
> +		.buf_fmt	= ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_BPC_6 |
> +				  ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_FMT_RGB,
> +		.sf		= scaling_factors_666,
> +	}, {
> +		.drm_fmt	= DRM_FORMAT_RGB888,
> +		.bus_fmt	= MEDIA_BUS_FMT_RGB888_1X24,
> +		.buf_fmt	= ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_BPC_8 |
> +				  ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_FMT_RGB,
> +		.sf		= scaling_factors_888,
> +	}, {
> +		.drm_fmt	= DRM_FORMAT_YUV422,
> +		.bus_fmt	= MEDIA_BUS_FMT_UYVY8_1X16,
> +		.buf_fmt	= ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_BPC_8 |
> +				  ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_FMT_YUV422,
> +		.sf		= scaling_factors_888,
> +	}, {
> +		.drm_fmt	= DRM_FORMAT_YUV444,
> +		.bus_fmt	= MEDIA_BUS_FMT_VUY8_1X24,
> +		.buf_fmt	= ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_BPC_8 |
> +				  ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_FMT_YUV444,
> +		.sf		= scaling_factors_888,
> +	}, {
> +		.drm_fmt	= DRM_FORMAT_P210,
> +		.bus_fmt	= MEDIA_BUS_FMT_UYVY10_1X20,
> +		.buf_fmt	= ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_BPC_10 |
> +				  ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_FMT_YUV422,
> +		.sf		= scaling_factors_101010,
> +	},
> +};
> +
>   static u32 zynqmp_disp_avbuf_read(struct zynqmp_disp *disp, int reg)
>   {
>   	return readl(disp->avbuf.base + reg);
> @@ -883,16 +927,17 @@ zynqmp_disp_layer_find_format(struct zynqmp_disp_layer *layer,
>   }
>   
>   /**
> - * zynqmp_disp_layer_drm_formats - Return the DRM formats supported by the layer
> + * zynqmp_disp_layer_formats - Return DRM or media bus formats supported by
> + * the layer
>    * @layer: The layer
>    * @num_formats: Pointer to the returned number of formats
>    *
> - * Return: A newly allocated u32 array that stores all the DRM formats
> + * Return: A newly allocated u32 array that stores all DRM or media bus formats
>    * supported by the layer. The number of formats in the array is returned
>    * through the num_formats argument.
>    */
> -u32 *zynqmp_disp_layer_drm_formats(struct zynqmp_disp_layer *layer,
> -				   unsigned int *num_formats)
> +u32 *zynqmp_disp_layer_formats(struct zynqmp_disp_layer *layer,
> +			       unsigned int *num_formats)
>   {
>   	unsigned int i;
>   	u32 *formats;
> @@ -903,7 +948,9 @@ u32 *zynqmp_disp_layer_drm_formats(struct zynqmp_disp_layer *layer,
>   		return NULL;
>   
>   	for (i = 0; i < layer->info->num_formats; ++i)
> -		formats[i] = layer->info->formats[i].drm_fmt;
> +		formats[i] = layer->mode == ZYNQMP_DPSUB_LAYER_NONLIVE
> +			   ? layer->info->formats[i].drm_fmt
> +			   : layer->info->formats[i].bus_fmt;

I find this quite confusing. Depending on the layer mode, you return 
different format types. I think it's quite easy to use this kind of 
function the wrong way.

Why not just make two separate functions?

  Tomi

>   	*num_formats = layer->info->num_formats;
>   	return formats;
> @@ -1131,6 +1178,11 @@ static int zynqmp_disp_create_layers(struct zynqmp_disp *disp)
>   			.num_channels = 1,
>   		},
>   	};
> +	static const struct zynqmp_disp_layer_info live_layer_info = {
> +		.formats = avbuf_live_fmts,
> +		.num_formats = ARRAY_SIZE(avbuf_live_fmts),
> +		.num_channels = 0,
> +	};
>   
>   	unsigned int i;
>   	int ret;
> @@ -1140,12 +1192,18 @@ static int zynqmp_disp_create_layers(struct zynqmp_disp *disp)
>   
>   		layer->id = i;
>   		layer->disp = disp;
> -		layer->info = &layer_info[i];
> -		/* For now assume dpsub works in either live or non-live mode for both layers.
> +
> +		/*
> +		 * For now assume dpsub works in either live or non-live mode for both layers.
>   		 * Hybrid mode is not supported yet.
>   		 */
> -		layer->mode = disp->dpsub->dma_enabled ? ZYNQMP_DPSUB_LAYER_NONLIVE
> -						       : ZYNQMP_DPSUB_LAYER_LIVE;
> +		if (disp->dpsub->dma_enabled) {
> +			layer->mode = ZYNQMP_DPSUB_LAYER_NONLIVE;
> +			layer->info = &layer_info[i];
> +		} else {
> +			layer->mode = ZYNQMP_DPSUB_LAYER_LIVE;
> +			layer->info = &live_layer_info;
> +		}
>   
>   		ret = zynqmp_disp_layer_request_dma(disp, layer);
>   		if (ret)
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.h b/drivers/gpu/drm/xlnx/zynqmp_disp.h
> index 9b8b202224d9..88c285a12e23 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_disp.h
> +++ b/drivers/gpu/drm/xlnx/zynqmp_disp.h
> @@ -50,8 +50,8 @@ int zynqmp_disp_setup_clock(struct zynqmp_disp *disp,
>   void zynqmp_disp_blend_set_global_alpha(struct zynqmp_disp *disp,
>   					bool enable, u32 alpha);
>   
> -u32 *zynqmp_disp_layer_drm_formats(struct zynqmp_disp_layer *layer,
> -				   unsigned int *num_formats);
> +u32 *zynqmp_disp_layer_formats(struct zynqmp_disp_layer *layer,
> +			       unsigned int *num_formats);
>   void zynqmp_disp_layer_enable(struct zynqmp_disp_layer *layer);
>   void zynqmp_disp_layer_disable(struct zynqmp_disp_layer *layer);
>   void zynqmp_disp_layer_set_format(struct zynqmp_disp_layer *layer,
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> index 4faafdd76798..e3b9eb3d9273 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> @@ -22,6 +22,7 @@
>   #include <linux/delay.h>
>   #include <linux/device.h>
>   #include <linux/io.h>
> +#include <linux/media-bus-format.h>
>   #include <linux/module.h>
>   #include <linux/platform_device.h>
>   #include <linux/pm_runtime.h>
> @@ -1577,6 +1578,35 @@ static const struct drm_edid *zynqmp_dp_bridge_edid_read(struct drm_bridge *brid
>   	return drm_edid_read_ddc(connector, &dp->aux.ddc);
>   }
>   
> +static u32 *zynqmp_dp_bridge_default_bus_fmts(unsigned int *num_input_fmts)
> +{
> +	u32 *formats = kzalloc(sizeof(*formats), GFP_KERNEL);
> +
> +	if (formats)
> +		*formats = MEDIA_BUS_FMT_FIXED;
> +	*num_input_fmts = !!formats;
> +
> +	return formats;
> +}
> +
> +static u32 *
> +zynqmp_dp_bridge_get_input_bus_fmts(struct drm_bridge *bridge,
> +				    struct drm_bridge_state *bridge_state,
> +				    struct drm_crtc_state *crtc_state,
> +				    struct drm_connector_state *conn_state,
> +				    u32 output_fmt,
> +				    unsigned int *num_input_fmts)
> +{
> +	struct zynqmp_dp *dp = bridge_to_dp(bridge);
> +	struct zynqmp_disp_layer *layer;
> +
> +	layer = zynqmp_dp_disp_connected_live_layer(dp);
> +	if (layer)
> +		return zynqmp_disp_layer_formats(layer, num_input_fmts);
> +	else
> +		return zynqmp_dp_bridge_default_bus_fmts(num_input_fmts);
> +}
> +
>   static const struct drm_bridge_funcs zynqmp_dp_bridge_funcs = {
>   	.attach = zynqmp_dp_bridge_attach,
>   	.detach = zynqmp_dp_bridge_detach,
> @@ -1589,6 +1619,7 @@ static const struct drm_bridge_funcs zynqmp_dp_bridge_funcs = {
>   	.atomic_check = zynqmp_dp_bridge_atomic_check,
>   	.detect = zynqmp_dp_bridge_detect,
>   	.edid_read = zynqmp_dp_bridge_edid_read,
> +	.atomic_get_input_bus_fmts = zynqmp_dp_bridge_get_input_bus_fmts,
>   };
>   
>   /* -----------------------------------------------------------------------------
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_kms.c b/drivers/gpu/drm/xlnx/zynqmp_kms.c
> index 43bf416b33d5..bf9fba01df0e 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_kms.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_kms.c
> @@ -152,7 +152,7 @@ static int zynqmp_dpsub_create_planes(struct zynqmp_dpsub *dpsub)
>   		unsigned int num_formats;
>   		u32 *formats;
>   
> -		formats = zynqmp_disp_layer_drm_formats(layer, &num_formats);
> +		formats = zynqmp_disp_layer_formats(layer, &num_formats);
>   		if (!formats)
>   			return -ENOMEM;
>   
> 

