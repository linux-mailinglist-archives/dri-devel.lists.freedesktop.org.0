Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A6354F79A6
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 10:28:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32CCE10E49D;
	Thu,  7 Apr 2022 08:28:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2015710E49D
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Apr 2022 08:28:09 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id n35so2999043wms.5
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Apr 2022 01:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=+e1NZ6colT9K9Aodlk0zyl4XLbh3SXyJD053sriqcag=;
 b=Wv4jTnGk0CV1q55qSLseT0b+FtlM9TtOC4AIGxdaE4u6EKxzTs7FJat5wKRv9R7bwl
 tUeMlOrjUm6hQVvy2JgjUAFWrfi5T40fF+ByDauvhErs68x28QqzKsE7xHKwjGpDtFt3
 evoWcOxNJdkHjCd0RVfPQ5SvTsY7KbYREwkdXVjOtbrSXa2Osaw00eBRIgxXin+Rcczj
 XF5kUeA4b1Q9TNTol5xDC3p8dCutokbE41YxJpSVN3kamhc7FJZeFm7t+zgaC/sZ0a/u
 nGuJAPZY3jzMfnsoMZppJOGqcABJ9UZPRRL1faNxEXjPHmNfLtEfd57QLZUO2qRctV6k
 FIIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=+e1NZ6colT9K9Aodlk0zyl4XLbh3SXyJD053sriqcag=;
 b=OJ5focjZsbfsEcjTFyjdIgoDsIb0K3Gk/0vv/X47ZJsZejfERnB6lBR3laQI+whES4
 90StJZFTCjLeCRvlGHrTPIPM8JGmkt4huEit13PPBsqX+iVcd8qDRmrEoqALPddcaTAt
 rHU1MO+Q2vJ5rU5ZRKWc2Izomlpmm4WJnv7dOAHz/Vk1h44rtCMyDLR3UElVBIOra7uN
 4ySSXl2mUUN634A/lswpgJ+JBoCsgulJuUF/vrh6V5dGLuYs24GJ9OLJGAZAI6elBQwj
 iPbApj0JnW1kzc61YfQ8nkD6rElLASvTYvvuSBDRz2bfAnfP23G+ZCLny77SCmhhUHoG
 Qxug==
X-Gm-Message-State: AOAM531xhvY68YuQVHY45a2UaNtSYt9hkX4x3hBFEcc1dTZ/+R4nn3Ef
 2CkdzgbXodoxBYVwnucHoyxRLA==
X-Google-Smtp-Source: ABdhPJxSXEtOAnQxdlWaugcxhuODI21n7wvqx1biFVHscVzsagxA8RRYFjlM9tjfx+Ix/DTWGz+Vhg==
X-Received: by 2002:a05:600c:4e03:b0:38e:13ba:d906 with SMTP id
 b3-20020a05600c4e0300b0038e13bad906mr11473520wmq.131.1649320087502; 
 Thu, 07 Apr 2022 01:28:07 -0700 (PDT)
Received: from [10.1.3.188]
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id
 y6-20020a05600015c600b00203fa70b4ebsm20351585wry.53.2022.04.07.01.28.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Apr 2022 01:28:06 -0700 (PDT)
Message-ID: <0a8e4e32-cc86-e901-364b-d1e6e2bd37b5@baylibre.com>
Date: Thu, 7 Apr 2022 10:28:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v17 4/6] drm/bridge: dw-hdmi: handle unusable or
 non-configured CSC module
Content-Language: en-US
To: "H. Nikolaus Schaller" <hns@goldelico.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss
 <robert.foss@linaro.org>, Paul Boddie <paul@boddie.org.uk>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Paul Cercueil <paul@crapouillou.net>,
 Maxime Ripard <maxime@cerno.tech>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
References: <cover.1649262368.git.hns@goldelico.com>
 <8de76ca2b478016f4dbed84e37db231e7810e56c.1649262368.git.hns@goldelico.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <8de76ca2b478016f4dbed84e37db231e7810e56c.1649262368.git.hns@goldelico.com>
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
Cc: Jonas Karlman <jonas@kwiboo.se>, letux-kernel@openphoenux.org,
 linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 06/04/2022 18:26, H. Nikolaus Schaller wrote:
> From: Neil Armstrong <narmstrong@baylibre.com>
> 
> The dw-hdmi integrates an optional Color Space Conversion feature used
> to handle color-space conversions.
> 
> On some platforms, the CSC isn't built-in or non-functional.
> 
> This adds the necessary code to disable the CSC functionality
> and limit the bus format negotiation to force using the same
> input bus format as the output bus format.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> ---
>   drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 100 +++++++++++++++-------
>   drivers/gpu/drm/bridge/synopsys/dw-hdmi.h |   1 +
>   include/drm/bridge/dw_hdmi.h              |   1 +
>   3 files changed, 71 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index f50af40e10340..b5a665c5e406e 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -158,6 +158,8 @@ struct dw_hdmi {
>   	struct hdmi_data_info hdmi_data;
>   	const struct dw_hdmi_plat_data *plat_data;
>   
> +	bool csc_available;		/* indicates if the CSC engine is usable */
> +
>   	int vic;
>   
>   	u8 edid[HDMI_EDID_LEN];
> @@ -1009,9 +1011,10 @@ static int is_color_space_interpolation(struct dw_hdmi *hdmi)
>   
>   static bool is_csc_needed(struct dw_hdmi *hdmi)
>   {
> -	return is_color_space_conversion(hdmi) ||
> -	       is_color_space_decimation(hdmi) ||
> -	       is_color_space_interpolation(hdmi);
> +	return hdmi->csc_available &&
> +	       (is_color_space_conversion(hdmi) ||
> +		is_color_space_decimation(hdmi) ||
> +		is_color_space_interpolation(hdmi));
>   }
>   
>   static void dw_hdmi_update_csc_coeffs(struct dw_hdmi *hdmi)
> @@ -1064,6 +1067,9 @@ static void hdmi_video_csc(struct dw_hdmi *hdmi)
>   	int interpolation = HDMI_CSC_CFG_INTMODE_DISABLE;
>   	int decimation = 0;
>   
> +	if (!hdmi->csc_available)
> +		return;
> +
>   	/* YCC422 interpolation to 444 mode */
>   	if (is_color_space_interpolation(hdmi))
>   		interpolation = HDMI_CSC_CFG_INTMODE_CHROMA_INT_FORMULA1;
> @@ -2665,6 +2671,7 @@ static u32 *dw_hdmi_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
>   					u32 output_fmt,
>   					unsigned int *num_input_fmts)
>   {
> +	struct dw_hdmi *hdmi = bridge->driver_private;
>   	u32 *input_fmts;
>   	unsigned int i = 0;
>   
> @@ -2683,62 +2690,81 @@ static u32 *dw_hdmi_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
>   	/* 8bit */
>   	case MEDIA_BUS_FMT_RGB888_1X24:
>   		input_fmts[i++] = MEDIA_BUS_FMT_RGB888_1X24;
> -		input_fmts[i++] = MEDIA_BUS_FMT_YUV8_1X24;
> -		input_fmts[i++] = MEDIA_BUS_FMT_UYVY8_1X16;
> +		if (hdmi->csc_available) {
> +			input_fmts[i++] = MEDIA_BUS_FMT_YUV8_1X24;
> +			input_fmts[i++] = MEDIA_BUS_FMT_UYVY8_1X16;
> +		}
>   		break;
>   	case MEDIA_BUS_FMT_YUV8_1X24:
>   		input_fmts[i++] = MEDIA_BUS_FMT_YUV8_1X24;
> -		input_fmts[i++] = MEDIA_BUS_FMT_UYVY8_1X16;
> -		input_fmts[i++] = MEDIA_BUS_FMT_RGB888_1X24;
> +		if (hdmi->csc_available) {
> +			input_fmts[i++] = MEDIA_BUS_FMT_UYVY8_1X16;
> +			input_fmts[i++] = MEDIA_BUS_FMT_RGB888_1X24;
> +		}
>   		break;
>   	case MEDIA_BUS_FMT_UYVY8_1X16:
>   		input_fmts[i++] = MEDIA_BUS_FMT_UYVY8_1X16;
> -		input_fmts[i++] = MEDIA_BUS_FMT_YUV8_1X24;
> -		input_fmts[i++] = MEDIA_BUS_FMT_RGB888_1X24;
> +		if (hdmi->csc_available) {
> +			input_fmts[i++] = MEDIA_BUS_FMT_YUV8_1X24;
> +			input_fmts[i++] = MEDIA_BUS_FMT_RGB888_1X24;
> +		}
>   		break;
>   
>   	/* 10bit */
>   	case MEDIA_BUS_FMT_RGB101010_1X30:
>   		input_fmts[i++] = MEDIA_BUS_FMT_RGB101010_1X30;
> -		input_fmts[i++] = MEDIA_BUS_FMT_YUV10_1X30;
> -		input_fmts[i++] = MEDIA_BUS_FMT_UYVY10_1X20;
> +		if (hdmi->csc_available) {
> +			input_fmts[i++] = MEDIA_BUS_FMT_YUV10_1X30;
> +			input_fmts[i++] = MEDIA_BUS_FMT_UYVY10_1X20;
> +		}
>   		break;
>   	case MEDIA_BUS_FMT_YUV10_1X30:
>   		input_fmts[i++] = MEDIA_BUS_FMT_YUV10_1X30;
> -		input_fmts[i++] = MEDIA_BUS_FMT_UYVY10_1X20;
> -		input_fmts[i++] = MEDIA_BUS_FMT_RGB101010_1X30;
> +		if (hdmi->csc_available) {
> +			input_fmts[i++] = MEDIA_BUS_FMT_UYVY10_1X20;
> +			input_fmts[i++] = MEDIA_BUS_FMT_RGB101010_1X30;
> +		}
>   		break;
>   	case MEDIA_BUS_FMT_UYVY10_1X20:
>   		input_fmts[i++] = MEDIA_BUS_FMT_UYVY10_1X20;
> -		input_fmts[i++] = MEDIA_BUS_FMT_YUV10_1X30;
> -		input_fmts[i++] = MEDIA_BUS_FMT_RGB101010_1X30;
> +		if (hdmi->csc_available) {
> +			input_fmts[i++] = MEDIA_BUS_FMT_YUV10_1X30;
> +			input_fmts[i++] = MEDIA_BUS_FMT_RGB101010_1X30;
> +		}
>   		break;
>   
>   	/* 12bit */
>   	case MEDIA_BUS_FMT_RGB121212_1X36:
>   		input_fmts[i++] = MEDIA_BUS_FMT_RGB121212_1X36;
> -		input_fmts[i++] = MEDIA_BUS_FMT_YUV12_1X36;
> -		input_fmts[i++] = MEDIA_BUS_FMT_UYVY12_1X24;
> +		if (hdmi->csc_available) {
> +			input_fmts[i++] = MEDIA_BUS_FMT_YUV12_1X36;
> +			input_fmts[i++] = MEDIA_BUS_FMT_UYVY12_1X24;
> +		}
>   		break;
>   	case MEDIA_BUS_FMT_YUV12_1X36:
>   		input_fmts[i++] = MEDIA_BUS_FMT_YUV12_1X36;
> -		input_fmts[i++] = MEDIA_BUS_FMT_UYVY12_1X24;
> -		input_fmts[i++] = MEDIA_BUS_FMT_RGB121212_1X36;
> +		if (hdmi->csc_available) {
> +			input_fmts[i++] = MEDIA_BUS_FMT_UYVY12_1X24;
> +			input_fmts[i++] = MEDIA_BUS_FMT_RGB121212_1X36;
> +		}
>   		break;
>   	case MEDIA_BUS_FMT_UYVY12_1X24:
>   		input_fmts[i++] = MEDIA_BUS_FMT_UYVY12_1X24;
> -		input_fmts[i++] = MEDIA_BUS_FMT_YUV12_1X36;
> -		input_fmts[i++] = MEDIA_BUS_FMT_RGB121212_1X36;
> +		if (hdmi->csc_available) {
> +			input_fmts[i++] = MEDIA_BUS_FMT_YUV12_1X36;
> +			input_fmts[i++] = MEDIA_BUS_FMT_RGB121212_1X36;
> +		}
>   		break;
>   
>   	/* 16bit */
>   	case MEDIA_BUS_FMT_RGB161616_1X48:
>   		input_fmts[i++] = MEDIA_BUS_FMT_RGB161616_1X48;
> -		input_fmts[i++] = MEDIA_BUS_FMT_YUV16_1X48;
> +		if (hdmi->csc_available)
> +			input_fmts[i++] = MEDIA_BUS_FMT_YUV16_1X48;
>   		break;
>   	case MEDIA_BUS_FMT_YUV16_1X48:
> -		input_fmts[i++] = MEDIA_BUS_FMT_YUV16_1X48;
> -		input_fmts[i++] = MEDIA_BUS_FMT_RGB161616_1X48;
> +		if (hdmi->csc_available)
> +			input_fmts[i++] = MEDIA_BUS_FMT_YUV16_1X48;
>   		break;
>   
>   	/*YUV 4:2:0 */
> @@ -2767,15 +2793,24 @@ static int dw_hdmi_bridge_atomic_check(struct drm_bridge *bridge,
>   {
>   	struct dw_hdmi *hdmi = bridge->driver_private;
>   
> -	hdmi->hdmi_data.enc_out_bus_format =
> -			bridge_state->output_bus_cfg.format;
> +	if (!hdmi->csc_available &&
> +	    bridge_state->output_bus_cfg.format != bridge_state->input_bus_cfg.format) {
> +		dev_warn(hdmi->dev, "different input format 0x%04x & output format 0x%04x while CSC isn't usable, fallback to safe format\n",
> +			 bridge_state->input_bus_cfg.format,
> +			 bridge_state->output_bus_cfg.format);
> +		hdmi->hdmi_data.enc_out_bus_format = MEDIA_BUS_FMT_FIXED;
> +		hdmi->hdmi_data.enc_in_bus_format = MEDIA_BUS_FMT_FIXED;
> +	} else {
> +		hdmi->hdmi_data.enc_out_bus_format =
> +				bridge_state->output_bus_cfg.format;
>   
> -	hdmi->hdmi_data.enc_in_bus_format =
> -			bridge_state->input_bus_cfg.format;
> +		hdmi->hdmi_data.enc_in_bus_format =
> +				bridge_state->input_bus_cfg.format;
>   
> -	dev_dbg(hdmi->dev, "input format 0x%04x, output format 0x%04x\n",
> -		bridge_state->input_bus_cfg.format,
> -		bridge_state->output_bus_cfg.format);
> +		dev_dbg(hdmi->dev, "input format 0x%04x, output format 0x%04x\n",
> +			bridge_state->input_bus_cfg.format,
> +			bridge_state->output_bus_cfg.format);
> +	}
>   
>   	return 0;
>   }
> @@ -3481,6 +3516,9 @@ struct dw_hdmi *dw_hdmi_probe(struct platform_device *pdev,
>   		hdmi->cec = platform_device_register_full(&pdevinfo);
>   	}
>   
> +	/* Get CSC useability from config0 register and permit override for platforms */
> +	hdmi->csc_available = !plat_data->disable_csc || (config0 & HDMI_CONFIG0_CSC);
> +
>   	drm_bridge_add(&hdmi->bridge);
>   
>   	return hdmi;
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.h b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.h
> index 1999db05bc3b2..279722e4d1898 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.h
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.h
> @@ -541,6 +541,7 @@ enum {
>   
>   /* CONFIG0_ID field values */
>   	HDMI_CONFIG0_I2S = 0x10,
> +	HDMI_CONFIG0_CSC = 0x04,
>   	HDMI_CONFIG0_CEC = 0x02,
>   
>   /* CONFIG1_ID field values */
> diff --git a/include/drm/bridge/dw_hdmi.h b/include/drm/bridge/dw_hdmi.h
> index 2a1f85f9a8a3f..b2f689cbe864c 100644
> --- a/include/drm/bridge/dw_hdmi.h
> +++ b/include/drm/bridge/dw_hdmi.h
> @@ -157,6 +157,7 @@ struct dw_hdmi_plat_data {
>   			     unsigned long mpixelclock);
>   
>   	unsigned int disable_cec : 1;
> +	unsigned int disable_csc : 1;
>   };
>   
>   struct dw_hdmi *dw_hdmi_probe(struct platform_device *pdev,

Is this really still needed now you filter correctly the possible
modes in patch 1 ?

Neil
