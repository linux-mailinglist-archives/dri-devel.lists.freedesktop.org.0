Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2314B175EE9
	for <lists+dri-devel@lfdr.de>; Mon,  2 Mar 2020 16:58:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CE1B89E9B;
	Mon,  2 Mar 2020 15:58:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4920389E2B
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2020 15:58:01 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id e26so5566222wme.5
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2020 07:58:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:organization:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wBpVpn8ZSs1N7QbQ5sNsHjPK34mnLUxBzYi8A5yEBlI=;
 b=UhnLiIh3pEdwgGmvF52iHWYWx5VjHGvhSY3RsScd5IXgVX4CLxJ/iNeevELqCEBisX
 gEKV1RJevQItZoZFaLq0cyXpvDeZkntwyn9uKdqhwfLDl79xlR1K3feH/J9X0SJwg8DD
 kIo/C0k/+4Hxri73IC1OBbM125H/Y/8K+0qyO62GMCPx140+CxexTLYpnrJ6ZkQuq3sV
 4BkpE5f5u4DYqRqS6MiiDmt198ks0U2vdfllC5LBtAAj14erRfPCyKgHtrbHbgaRa7sJ
 sWHUksBOhGcW6yl41SxZ4/o++0c/09C1Qw194eYdDn1GjJO2v7+sS7sL2DbIuy8emeJZ
 Ntig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=wBpVpn8ZSs1N7QbQ5sNsHjPK34mnLUxBzYi8A5yEBlI=;
 b=p1u3DRYcTGH8sEPOpTcaOKtHZq8wDRE2/6L/rv28Q809AemVxaMyyZuZ7vIdill95g
 Z3+McF02t6V3YGJQgLckcpdEmXYdKSyAgeUS1IPzwuprQMqcPxizpAQekusDtvxDR4wf
 VfUF+xM/hU+Hy575LP7lKDqIKN0MrHHLUtSiXNO0zyjV5co+LqLN/drM56dkEXRHZFcx
 ppl9mAdeVbRGv+1HJQm2o6rjIibsnJLAjZhMnYdyKSOy/+Q0woTUCjRUX5BynokmZls9
 /LA6dxyk00nPKmNhPm0Bp6j6cv0P78fOrvraCILOO9TK+NescML2WiA07X60OXiTQclj
 px8Q==
X-Gm-Message-State: ANhLgQ1G+4TrL+Ks0fFBEu5Y8I2tCeRs+VkIXeL6NCPoofGKRFYDfL0W
 nsq2Uw9kuP20b5QpplVfXnrjWA==
X-Google-Smtp-Source: ADFU+vuiZBFgYpeAFtkhE0uj+ytndQ+SgWww41wjRvO3uBOPqGsYbJiUjzKxJV3I7jEUMx9a4vU1Pw==
X-Received: by 2002:a1c:1f0c:: with SMTP id f12mr75898wmf.179.1583164679438;
 Mon, 02 Mar 2020 07:57:59 -0800 (PST)
Received: from [10.1.3.173]
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id a70sm15760482wme.28.2020.03.02.07.57.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Mar 2020 07:57:58 -0800 (PST)
Subject: Re: [PATCH v4 04/11] drm/bridge: synopsys: dw-hdmi: add bus format
 negociation
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20200206191834.6125-1-narmstrong@baylibre.com>
 <20200206191834.6125-5-narmstrong@baylibre.com>
 <20200302101815.GJ11960@pendragon.ideasonboard.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 BSwxi7g3Mu7u5kUByanqHyA=
Organization: Baylibre
Message-ID: <b8e65d6c-e206-9289-947e-6ab5bb3967af@baylibre.com>
Date: Mon, 2 Mar 2020 16:57:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200302101815.GJ11960@pendragon.ideasonboard.com>
Content-Language: en-US
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
Cc: jernej.skrabec@siol.net, jonas@kwiboo.se, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, a.hajda@samsung.com,
 boris.brezillon@collabora.com, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 02/03/2020 11:18, Laurent Pinchart wrote:
> Hi Neil,
> 
> Thank you for the patch.
> 
> On Thu, Feb 06, 2020 at 08:18:27PM +0100, Neil Armstrong wrote:
>> Add the atomic_get_output_bus_fmts, atomic_get_input_bus_fmts to negociate
>> the possible output and input formats for the current mode and monitor,
>> and use the negotiated formats in a basic atomic_check callback.
>>
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>> ---
>>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 272 +++++++++++++++++++++-
>>  1 file changed, 268 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>> index fec4a4bcd1fe..15048ad694bc 100644
>> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>> @@ -2095,11 +2095,10 @@ static int dw_hdmi_setup(struct dw_hdmi *hdmi, struct drm_display_mode *mode)
>>  	hdmi->hdmi_data.video_mode.mpixelrepetitionoutput = 0;
>>  	hdmi->hdmi_data.video_mode.mpixelrepetitioninput = 0;
>>  
>> -	/* TOFIX: Get input format from plat data or fallback to RGB888 */
>>  	if (hdmi->plat_data->input_bus_format)
>>  		hdmi->hdmi_data.enc_in_bus_format =
>>  			hdmi->plat_data->input_bus_format;
>> -	else
>> +	else if (hdmi->hdmi_data.enc_in_bus_format == MEDIA_BUS_FMT_FIXED)
>>  		hdmi->hdmi_data.enc_in_bus_format = MEDIA_BUS_FMT_RGB888_1X24;
>>  
>>  	/* TOFIX: Get input encoding from plat data or fallback to none */
>> @@ -2109,8 +2108,8 @@ static int dw_hdmi_setup(struct dw_hdmi *hdmi, struct drm_display_mode *mode)
>>  	else
>>  		hdmi->hdmi_data.enc_in_encoding = V4L2_YCBCR_ENC_DEFAULT;
>>  
>> -	/* TOFIX: Default to RGB888 output format */
>> -	hdmi->hdmi_data.enc_out_bus_format = MEDIA_BUS_FMT_RGB888_1X24;
>> +	if (hdmi->hdmi_data.enc_out_bus_format == MEDIA_BUS_FMT_FIXED)
>> +		hdmi->hdmi_data.enc_out_bus_format = MEDIA_BUS_FMT_RGB888_1X24;
>>  
>>  	hdmi->hdmi_data.pix_repet_factor = 0;
>>  	hdmi->hdmi_data.hdcp_enable = 0;
>> @@ -2388,6 +2387,267 @@ static const struct drm_connector_helper_funcs dw_hdmi_connector_helper_funcs =
>>  	.atomic_check = dw_hdmi_connector_atomic_check,
>>  };
>>  
>> +/*
>> + * Possible output formats :
>> + * - MEDIA_BUS_FMT_UYYVYY16_0_5X48,
>> + * - MEDIA_BUS_FMT_UYYVYY12_0_5X36,
>> + * - MEDIA_BUS_FMT_UYYVYY10_0_5X30,
>> + * - MEDIA_BUS_FMT_UYYVYY8_0_5X24,
>> + * - MEDIA_BUS_FMT_YUV16_1X48,
>> + * - MEDIA_BUS_FMT_RGB161616_1X48,
>> + * - MEDIA_BUS_FMT_UYVY12_1X24,
>> + * - MEDIA_BUS_FMT_YUV12_1X36,
>> + * - MEDIA_BUS_FMT_RGB121212_1X36,
>> + * - MEDIA_BUS_FMT_UYVY10_1X20,
>> + * - MEDIA_BUS_FMT_YUV10_1X30,
>> + * - MEDIA_BUS_FMT_RGB101010_1X30,
>> + * - MEDIA_BUS_FMT_UYVY8_1X16,
>> + * - MEDIA_BUS_FMT_YUV8_1X24,
>> + * - MEDIA_BUS_FMT_RGB888_1X24,
>> + */
> 
> I'd drop this comment as I don't think it brings much, except for a risk
> of getting out of sync with the implementation below :-)

I know it's redundant, but I'll prefer having it here to clarify which bus formats
are handled.

> 
>> +
>> +/* Can return a maximum of 12 possible output formats for a mode/connector */
>> +#define MAX_OUTPUT_SEL_FORMATS	12
> 
> I count 11 below.

Exact !

> 
>> +
>> +static u32 *dw_hdmi_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
>> +					struct drm_bridge_state *bridge_state,
>> +					struct drm_crtc_state *crtc_state,
>> +					struct drm_connector_state *conn_state,
>> +					unsigned int *num_output_fmts)
>> +{
>> +	struct drm_connector *conn = conn_state->connector;
>> +	struct drm_display_info *info = &conn->display_info;
>> +	struct drm_display_mode *mode = &crtc_state->mode;
>> +	u8 max_bpc = conn_state->max_requested_bpc;
>> +	bool is_hdmi2_sink = info->hdmi.scdc.supported ||
>> +			     (info->color_formats & DRM_COLOR_FORMAT_YCRCB420);
>> +	u32 *output_fmts;
>> +	int i = 0;
> 
> i is never negative, you can make it an unsigned int.
ok

> 
>> +
>> +	*num_output_fmts = 0;
>> +
>> +	output_fmts = kcalloc(MAX_OUTPUT_SEL_FORMATS, sizeof(*output_fmts),
>> +			      GFP_KERNEL);
>> +	if (!output_fmts)
>> +		return NULL;
>> +
>> +	/*
>> +	 * If the current mode enforces 4:2:0, force the output but format
>> +	 * to 4:2:0 and do not add the YUV422/444/RGB formats
>> +	 */
>> +	if (conn->ycbcr_420_allowed &&
>> +	    (drm_mode_is_420_only(info, mode) ||
>> +	     (is_hdmi2_sink && drm_mode_is_420_also(info, mode)))) {
>> +
>> +		/* Order bus formats from 16bit to 8bit if supported */
>> +		if (max_bpc >= 16 && info->bpc == 16 &&
>> +		    (info->hdmi.y420_dc_modes & DRM_EDID_YCBCR420_DC_48))
>> +			output_fmts[i++] = MEDIA_BUS_FMT_UYYVYY16_0_5X48;
>> +
>> +		if (max_bpc >= 12 && info->bpc >= 12 &&
>> +		    (info->hdmi.y420_dc_modes & DRM_EDID_YCBCR420_DC_36))
>> +			output_fmts[i++] = MEDIA_BUS_FMT_UYYVYY12_0_5X36;
>> +
>> +		if (max_bpc >= 10 && info->bpc >= 10 &&
>> +		    (info->hdmi.y420_dc_modes & DRM_EDID_YCBCR420_DC_30))
>> +			output_fmts[i++] = MEDIA_BUS_FMT_UYYVYY10_0_5X30;
>> +
>> +		/* Default 8bit fallback */
>> +		output_fmts[i++] = MEDIA_BUS_FMT_UYYVYY8_0_5X24;
>> +
>> +		*num_output_fmts = i;
>> +
>> +		return output_fmts;
>> +	}
>> +
>> +	/*
>> +	 * Order bus formats from 16bit to 8bit and from YUV422 to RGB
>> +	 * if supported. In any case the default RGB888 format is added
>> +	 */
>> +
>> +	if (max_bpc >= 16 && info->bpc == 16) {
>> +		if (info->color_formats & DRM_COLOR_FORMAT_YCRCB444)
>> +			output_fmts[i++] = MEDIA_BUS_FMT_YUV16_1X48;
>> +
>> +		output_fmts[i++] = MEDIA_BUS_FMT_RGB161616_1X48;
>> +	}
>> +
>> +	if (max_bpc >= 12 && info->bpc >= 12) {
>> +		if (info->color_formats & DRM_COLOR_FORMAT_YCRCB422)
>> +			output_fmts[i++] = MEDIA_BUS_FMT_UYVY12_1X24;
>> +
>> +		if (info->color_formats & DRM_COLOR_FORMAT_YCRCB444)
>> +			output_fmts[i++] = MEDIA_BUS_FMT_YUV12_1X36;
>> +
>> +		output_fmts[i++] = MEDIA_BUS_FMT_RGB121212_1X36;
>> +	}
>> +
>> +	if (max_bpc >= 10 && info->bpc >= 10) {
>> +		if (info->color_formats & DRM_COLOR_FORMAT_YCRCB422)
>> +			output_fmts[i++] = MEDIA_BUS_FMT_UYVY10_1X20;
>> +
>> +		if (info->color_formats & DRM_COLOR_FORMAT_YCRCB444)
>> +			output_fmts[i++] = MEDIA_BUS_FMT_YUV10_1X30;
>> +
>> +		output_fmts[i++] = MEDIA_BUS_FMT_RGB101010_1X30;
>> +	}
>> +
>> +	if (info->color_formats & DRM_COLOR_FORMAT_YCRCB422)
>> +		output_fmts[i++] = MEDIA_BUS_FMT_UYVY8_1X16;
>> +
>> +	if (info->color_formats & DRM_COLOR_FORMAT_YCRCB444)
>> +		output_fmts[i++] = MEDIA_BUS_FMT_YUV8_1X24;
>> +
>> +	/* Default 8bit RGB fallback */
>> +	output_fmts[i++] = MEDIA_BUS_FMT_RGB888_1X24;
>> +
>> +	*num_output_fmts = i;
>> +
>> +	return output_fmts;
>> +}
>> +
>> +/*
>> + * Possible input formats :
>> + * - MEDIA_BUS_FMT_RGB888_1X24
>> + * - MEDIA_BUS_FMT_YUV8_1X24
>> + * - MEDIA_BUS_FMT_UYVY8_1X16
>> + * - MEDIA_BUS_FMT_UYYVYY8_0_5X24
>> + * - MEDIA_BUS_FMT_RGB101010_1X30
>> + * - MEDIA_BUS_FMT_YUV10_1X30
>> + * - MEDIA_BUS_FMT_UYVY10_1X20
>> + * - MEDIA_BUS_FMT_UYYVYY10_0_5X30
>> + * - MEDIA_BUS_FMT_RGB121212_1X36
>> + * - MEDIA_BUS_FMT_YUV12_1X36
>> + * - MEDIA_BUS_FMT_UYVY12_1X24
>> + * - MEDIA_BUS_FMT_UYYVYY12_0_5X36
>> + * - MEDIA_BUS_FMT_RGB161616_1X48
>> + * - MEDIA_BUS_FMT_YUV16_1X48
>> + * - MEDIA_BUS_FMT_UYYVYY16_0_5X48
>> + */
> 
> Same here.

I'll prefer keeping these aswell

> 
>> +
>> +/* Can return a maximum of 4 possible input formats for an output format */
>> +#define MAX_INPUT_SEL_FORMATS	4
> 
> As Boris pointed out, that should be 3.

Yep

> 
>> +
>> +static u32 *dw_hdmi_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
>> +					struct drm_bridge_state *bridge_state,
>> +					struct drm_crtc_state *crtc_state,
>> +					struct drm_connector_state *conn_state,
>> +					u32 output_fmt,
>> +					unsigned int *num_input_fmts)
>> +{
>> +	u32 *input_fmts;
>> +	int i = 0;
> 
> i is never negative, you can make it an unsigned int.
ok

> 
>> +
>> +	*num_input_fmts = 0;
>> +
>> +	input_fmts = kcalloc(MAX_INPUT_SEL_FORMATS, sizeof(*input_fmts),
>> +			     GFP_KERNEL);
>> +	if (!input_fmts)
>> +		return NULL;
>> +
>> +	switch (output_fmt) {
>> +	/* 8bit */
>> +	case MEDIA_BUS_FMT_RGB888_1X24:
>> +		input_fmts[i++] = MEDIA_BUS_FMT_RGB888_1X24;
>> +		input_fmts[i++] = MEDIA_BUS_FMT_YUV8_1X24;
>> +		input_fmts[i++] = MEDIA_BUS_FMT_UYVY8_1X16;
>> +		break;
>> +	case MEDIA_BUS_FMT_YUV8_1X24:
>> +		input_fmts[i++] = MEDIA_BUS_FMT_YUV8_1X24;
>> +		input_fmts[i++] = MEDIA_BUS_FMT_UYVY8_1X16;
>> +		input_fmts[i++] = MEDIA_BUS_FMT_RGB888_1X24;
>> +		break;
>> +	case MEDIA_BUS_FMT_UYVY8_1X16:
>> +		input_fmts[i++] = MEDIA_BUS_FMT_UYVY8_1X16;
>> +		input_fmts[i++] = MEDIA_BUS_FMT_YUV8_1X24;
>> +		input_fmts[i++] = MEDIA_BUS_FMT_RGB888_1X24;
>> +		break;
>> +
>> +	/* 10bit */
>> +	case MEDIA_BUS_FMT_RGB101010_1X30:
>> +		input_fmts[i++] = MEDIA_BUS_FMT_RGB101010_1X30;
>> +		input_fmts[i++] = MEDIA_BUS_FMT_YUV10_1X30;
>> +		input_fmts[i++] = MEDIA_BUS_FMT_UYVY10_1X20;
>> +		break;
>> +	case MEDIA_BUS_FMT_YUV10_1X30:
>> +		input_fmts[i++] = MEDIA_BUS_FMT_YUV10_1X30;
>> +		input_fmts[i++] = MEDIA_BUS_FMT_UYVY10_1X20;
>> +		input_fmts[i++] = MEDIA_BUS_FMT_RGB101010_1X30;
>> +		break;
>> +	case MEDIA_BUS_FMT_UYVY10_1X20:
>> +		input_fmts[i++] = MEDIA_BUS_FMT_UYVY10_1X20;
>> +		input_fmts[i++] = MEDIA_BUS_FMT_YUV10_1X30;
>> +		input_fmts[i++] = MEDIA_BUS_FMT_RGB101010_1X30;
>> +		break;
>> +
>> +	/* 12bit */
>> +	case MEDIA_BUS_FMT_RGB121212_1X36:
>> +		input_fmts[i++] = MEDIA_BUS_FMT_RGB121212_1X36;
>> +		input_fmts[i++] = MEDIA_BUS_FMT_YUV12_1X36;
>> +		input_fmts[i++] = MEDIA_BUS_FMT_UYVY12_1X24;
>> +		break;
>> +	case MEDIA_BUS_FMT_YUV12_1X36:
>> +		input_fmts[i++] = MEDIA_BUS_FMT_YUV12_1X36;
>> +		input_fmts[i++] = MEDIA_BUS_FMT_UYVY12_1X24;
>> +		input_fmts[i++] = MEDIA_BUS_FMT_RGB121212_1X36;
>> +		break;
>> +	case MEDIA_BUS_FMT_UYVY12_1X24:
>> +		input_fmts[i++] = MEDIA_BUS_FMT_UYVY12_1X24;
>> +		input_fmts[i++] = MEDIA_BUS_FMT_YUV12_1X36;
>> +		input_fmts[i++] = MEDIA_BUS_FMT_RGB121212_1X36;
>> +		break;
>> +
>> +	/* 16bit */
>> +	case MEDIA_BUS_FMT_RGB161616_1X48:
>> +		input_fmts[i++] = MEDIA_BUS_FMT_RGB161616_1X48;
>> +		input_fmts[i++] = MEDIA_BUS_FMT_YUV16_1X48;
>> +		break;
>> +	case MEDIA_BUS_FMT_YUV16_1X48:
>> +		input_fmts[i++] = MEDIA_BUS_FMT_YUV16_1X48;
>> +		input_fmts[i++] = MEDIA_BUS_FMT_RGB161616_1X48;
>> +		break;
>> +
>> +	/* 420 */
> 
> s/420/YUV 4:2:0/ ?

Looks better

> 
>> +	case MEDIA_BUS_FMT_UYYVYY8_0_5X24:
>> +	case MEDIA_BUS_FMT_UYYVYY10_0_5X30:
>> +	case MEDIA_BUS_FMT_UYYVYY12_0_5X36:
>> +	case MEDIA_BUS_FMT_UYYVYY16_0_5X48:
>> +		input_fmts[i++] = output_fmt;
>> +		break;
>> +	}
>> +
>> +	*num_input_fmts = i;
>> +
>> +	if (*num_input_fmts == 0) {
>> +		kfree(input_fmts);
>> +		input_fmts = NULL;
>> +	}
>> +
>> +	return input_fmts;
>> +}
>> +
>> +static int dw_hdmi_bridge_atomic_check(struct drm_bridge *bridge,
>> +				       struct drm_bridge_state *bridge_state,
>> +				       struct drm_crtc_state *crtc_state,
>> +				       struct drm_connector_state *conn_state)
>> +{
>> +	struct dw_hdmi *hdmi = bridge->driver_private;
>> +
>> +	dev_dbg(hdmi->dev, "selected output format %x\n",
> 
> s/%x/0x%04x/
> 
>> +			bridge_state->output_bus_cfg.format);
> 
> Misalignment ?

Fixed

> 
>> +
>> +	hdmi->hdmi_data.enc_out_bus_format =
>> +			bridge_state->output_bus_cfg.format;
>> +
>> +	dev_dbg(hdmi->dev, "selected input format %x\n",
>> +			bridge_state->input_bus_cfg.format);
> 
> Same here. I would combine both messages:
> 
> 	dev_dbg(hdmi->dev, "input format: 0x%04x, output format: 0x04x\n",
> 		bridge_state->input_bus_cfg.format,
> 		bridge_state->output_bus_cfg.format);

Looks better

> 
>> +
>> +	hdmi->hdmi_data.enc_in_bus_format =
>> +			bridge_state->input_bus_cfg.format;
>> +
>> +	return 0;
>> +}
>> +
>>  static int dw_hdmi_bridge_attach(struct drm_bridge *bridge)
>>  {
>>  	struct dw_hdmi *hdmi = bridge->driver_private;
>> @@ -2499,6 +2759,9 @@ static const struct drm_bridge_funcs dw_hdmi_bridge_funcs = {
>>  	.atomic_reset = drm_atomic_helper_bridge_reset,
>>  	.attach = dw_hdmi_bridge_attach,
>>  	.detach = dw_hdmi_bridge_detach,
>> +	.atomic_check = dw_hdmi_bridge_atomic_check,
>> +	.atomic_get_output_bus_fmts = dw_hdmi_bridge_atomic_get_output_bus_fmts,
>> +	.atomic_get_input_bus_fmts = dw_hdmi_bridge_atomic_get_input_bus_fmts,
>>  	.enable = dw_hdmi_bridge_enable,
>>  	.disable = dw_hdmi_bridge_disable,
>>  	.mode_set = dw_hdmi_bridge_mode_set,
>> @@ -2963,6 +3226,7 @@ __dw_hdmi_probe(struct platform_device *pdev,
>>  
>>  	hdmi->bridge.driver_private = hdmi;
>>  	hdmi->bridge.funcs = &dw_hdmi_bridge_funcs;
>> +
> 
> This seems unrelated.

Yep

> 
>>  #ifdef CONFIG_OF
>>  	hdmi->bridge.of_node = pdev->dev.of_node;
>>  #endif
> 

Thanks,
Neil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
