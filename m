Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81660155ACC
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2020 16:36:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B9916E079;
	Fri,  7 Feb 2020 15:36:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D19D66E079
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2020 15:36:04 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id m16so3160211wrx.11
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Feb 2020 07:36:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:organization:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kGHPxdRFVQrgJXnpgqgxlndoa07xtd4Y2azSA2VRaZg=;
 b=q1PfpOsJPSQE+wV8Fc0qYMdXeQRb0FocFWo5skG+qIHaHokc5HShKR6TcT55jqRweM
 nEOPyfqenn7hjdb+Ewd9jv5cOXvPNDylYdlygDJFLzEecC8Or5Bdh0yOrCuWLmKGmxiF
 xqZ6PmAo03xW2H8TuIIMzz6l8rPEOnDvj5ea7FBgsfsS6cagNnhVLoQzIto2W/ReMWEe
 c3mA/6dELoIai57pkiGRLWeQ+QOznBX2ZqUs4vee3uqHu7j6qQbIEuuskzL26I5Whg9m
 PpCbhKtWJQjkk05gL39WymcV+euXCe9lYtcv4eAzgiCo5+SlRedUxpQgFLd7Y67bAavi
 oAXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=kGHPxdRFVQrgJXnpgqgxlndoa07xtd4Y2azSA2VRaZg=;
 b=mbYB6J19unaBAVyW5Zj5iOfrl9X0ZTUabtBywKvVLx29I9iogyvvFeztTHaRqHN2zo
 J3HSrhnuWTz1Njwjwor801eiZDGk7Y0nyQ1cwN6+pCa2I50fH0pPLf/p/sPTxbiXVToY
 M6SZv3zeH4WPVWeKqQM9qo7z3Dd2Uif3B/KY+krmhzRCRWS8qVIJOtdmZFc/FnGSLc4X
 6qBF186ZrJkui2T77nGCAABAW6AFTJhbp/6qZgViNRpYTHzWu+hW9siZZ44iwjkwophI
 EXGzXYAfgb9eF3MpXmnzVyNoGR5Xzym5ooH45AhXS+eXSgWQnCY8CXdMuocOz40EWiMi
 FXHQ==
X-Gm-Message-State: APjAAAWRglTNmLRNgrCRPiOtnb50WD7Zro3JWILJyY8rH3MAmsnKy2fy
 xG0KLe9JM7Yo2niflRrCW3vUmA==
X-Google-Smtp-Source: APXvYqzIo8aWuTxp75591wmpNNtPo0+KDFGZf/cHCzeo/iH46Jy6ytrerVvXWGy5T0WARMgulPjh7A==
X-Received: by 2002:a5d:4052:: with SMTP id w18mr5244714wrp.112.1581089763229; 
 Fri, 07 Feb 2020 07:36:03 -0800 (PST)
Received: from [10.1.2.12] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id f207sm4076247wme.9.2020.02.07.07.36.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Feb 2020 07:36:02 -0800 (PST)
Subject: Re: [PATCH v4 07/11] drm/meson: meson_dw_hdmi: add bridge and switch
 to drm_bridge_funcs
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <20200206191834.6125-1-narmstrong@baylibre.com>
 <20200206191834.6125-8-narmstrong@baylibre.com>
 <20200207155743.24ee9bf0@collabora.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 BSwxi7g3Mu7u5kUByanqHyA=
Organization: Baylibre
Message-ID: <b4a29800-7d87-221b-24a5-a53d141800c3@baylibre.com>
Date: Fri, 7 Feb 2020 16:36:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200207155743.24ee9bf0@collabora.com>
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
 Laurent.pinchart@ideasonboard.com, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 07/02/2020 15:57, Boris Brezillon wrote:
> On Thu,  6 Feb 2020 20:18:30 +0100
> Neil Armstrong <narmstrong@baylibre.com> wrote:
> 
>> Switch the dw-hdmi driver to drm_bridge_funcs by implementing a new local
>> bridge, connecting it to the dw-hdmi bridge, then implement the
>> atomic_get_input_bus_fmts/atomic_get_output_bus_fmts.
>>
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>> ---
>>  drivers/gpu/drm/meson/meson_dw_hdmi.c | 105 +++++++++++++++++++++-----
>>  1 file changed, 85 insertions(+), 20 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
>> index 3bb7ffe5fc39..4b3809626f7e 100644
>> --- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
>> +++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
>> @@ -16,6 +16,7 @@
>>  
>>  #include <drm/bridge/dw_hdmi.h>
>>  #include <drm/drm_atomic_helper.h>
>> +#include <drm/drm_bridge.h>
>>  #include <drm/drm_device.h>
>>  #include <drm/drm_edid.h>
>>  #include <drm/drm_probe_helper.h>
>> @@ -135,6 +136,7 @@ struct meson_dw_hdmi_data {
>>  
>>  struct meson_dw_hdmi {
>>  	struct drm_encoder encoder;
>> +	struct drm_bridge bridge;
>>  	struct dw_hdmi_plat_data dw_plat_data;
>>  	struct meson_drm *priv;
>>  	struct device *dev;
>> @@ -151,6 +153,8 @@ struct meson_dw_hdmi {
>>  };
>>  #define encoder_to_meson_dw_hdmi(x) \
>>  	container_of(x, struct meson_dw_hdmi, encoder)
>> +#define bridge_to_meson_dw_hdmi(x) \
>> +	container_of(x, struct meson_dw_hdmi, bridge)
>>  
>>  static inline int dw_hdmi_is_compatible(struct meson_dw_hdmi *dw_hdmi,
>>  					const char *compat)
>> @@ -368,7 +372,7 @@ static inline void meson_dw_hdmi_phy_reset(struct meson_dw_hdmi *dw_hdmi)
>>  }
>>  
>>  static void dw_hdmi_set_vclk(struct meson_dw_hdmi *dw_hdmi,
>> -			     struct drm_display_mode *mode)
>> +			     const struct drm_display_mode *mode)
>>  {
>>  	struct meson_drm *priv = dw_hdmi->priv;
>>  	int vic = drm_match_cea_mode(mode);
>> @@ -663,6 +667,10 @@ dw_hdmi_mode_valid(struct drm_connector *connector,
>>  
>>  /* Encoder */
>>  
>> +static const u32 meson_dw_hdmi_out_bus_fmts[] = {
>> +	MEDIA_BUS_FMT_YUV8_1X24,
>> +};
>> +
>>  static void meson_venc_hdmi_encoder_destroy(struct drm_encoder *encoder)
>>  {
>>  	drm_encoder_cleanup(encoder);
>> @@ -672,16 +680,63 @@ static const struct drm_encoder_funcs meson_venc_hdmi_encoder_funcs = {
>>  	.destroy        = meson_venc_hdmi_encoder_destroy,
>>  };
>>  
>> -static int meson_venc_hdmi_encoder_atomic_check(struct drm_encoder *encoder,
>> +static u32 *
>> +meson_venc_hdmi_encoder_get_out_bus_fmts(struct drm_bridge *bridge,
>> +					 struct drm_bridge_state *bridge_state,
>> +					 struct drm_crtc_state *crtc_state,
>> +					 struct drm_connector_state *conn_state,
>> +					 unsigned int *num_output_fmts)
>> +{
>> +	u32 *output_fmts;
>> +
>> +	*num_output_fmts = ARRAY_SIZE(meson_dw_hdmi_out_bus_fmts);
>> +	output_fmts = kcalloc(*num_output_fmts, sizeof(*output_fmts),
>> +			      GFP_KERNEL);
>> +	if (!output_fmts)
>> +		return NULL;
>> +
>> +	memcpy(output_fmts, meson_dw_hdmi_out_bus_fmts, *num_output_fmts);
>> +
>> +	return output_fmts;
>> +}
>> +
>> +static u32 *
>> +meson_venc_hdmi_encoder_get_inp_bus_fmts(struct drm_bridge *bridge,
>> +					struct drm_bridge_state *bridge_state,
>> +					struct drm_crtc_state *crtc_state,
>> +					struct drm_connector_state *conn_state,
>> +					u32 output_fmt,
>> +					unsigned int *num_input_fmts)
>> +{
>> +	u32 *input_fmts = NULL;
>> +
>> +	if (output_fmt == meson_dw_hdmi_out_bus_fmts[0]) {
>> +		*num_input_fmts = 1;
>> +		input_fmts = kcalloc(*num_input_fmts,
>> +				     sizeof(*input_fmts),
>> +				     GFP_KERNEL);
>> +		if (!input_fmts)
>> +			return NULL;
>> +
>> +		input_fmts[0] = output_fmt;
>> +	} else {
>> +		*num_input_fmts = 0;
>> +	}
>> +
>> +	return input_fmts;
>> +}
>> +
>> +static int meson_venc_hdmi_encoder_atomic_check(struct drm_bridge *bridge,
>> +					struct drm_bridge_state *bridge_state,
>>  					struct drm_crtc_state *crtc_state,
>>  					struct drm_connector_state *conn_state)
>>  {
>>  	return 0;
>>  }
>>  
>> -static void meson_venc_hdmi_encoder_disable(struct drm_encoder *encoder)
>> +static void meson_venc_hdmi_encoder_disable(struct drm_bridge *bridge)
>>  {
>> -	struct meson_dw_hdmi *dw_hdmi = encoder_to_meson_dw_hdmi(encoder);
>> +	struct meson_dw_hdmi *dw_hdmi = bridge_to_meson_dw_hdmi(bridge);
>>  	struct meson_drm *priv = dw_hdmi->priv;
>>  
>>  	DRM_DEBUG_DRIVER("\n");
>> @@ -693,9 +748,9 @@ static void meson_venc_hdmi_encoder_disable(struct drm_encoder *encoder)
>>  	writel_relaxed(0, priv->io_base + _REG(ENCP_VIDEO_EN));
>>  }
>>  
>> -static void meson_venc_hdmi_encoder_enable(struct drm_encoder *encoder)
>> +static void meson_venc_hdmi_encoder_enable(struct drm_bridge *bridge)
>>  {
>> -	struct meson_dw_hdmi *dw_hdmi = encoder_to_meson_dw_hdmi(encoder);
>> +	struct meson_dw_hdmi *dw_hdmi = bridge_to_meson_dw_hdmi(bridge);
>>  	struct meson_drm *priv = dw_hdmi->priv;
>>  
>>  	DRM_DEBUG_DRIVER("%s\n", priv->venc.hdmi_use_enci ? "VENCI" : "VENCP");
>> @@ -706,11 +761,11 @@ static void meson_venc_hdmi_encoder_enable(struct drm_encoder *encoder)
>>  		writel_relaxed(1, priv->io_base + _REG(ENCP_VIDEO_EN));
>>  }
>>  
>> -static void meson_venc_hdmi_encoder_mode_set(struct drm_encoder *encoder,
>> -				   struct drm_display_mode *mode,
>> -				   struct drm_display_mode *adjusted_mode)
>> +static void meson_venc_hdmi_encoder_mode_set(struct drm_bridge *bridge,
>> +				   const struct drm_display_mode *mode,
>> +				   const struct drm_display_mode *adjusted_mode)
>>  {
>> -	struct meson_dw_hdmi *dw_hdmi = encoder_to_meson_dw_hdmi(encoder);
>> +	struct meson_dw_hdmi *dw_hdmi = bridge_to_meson_dw_hdmi(bridge);
>>  	struct meson_drm *priv = dw_hdmi->priv;
>>  	int vic = drm_match_cea_mode(mode);
>>  
>> @@ -726,12 +781,16 @@ static void meson_venc_hdmi_encoder_mode_set(struct drm_encoder *encoder,
>>  	writel_relaxed(0, priv->io_base + _REG(VPU_HDMI_FMT_CTRL));
>>  }
>>  
>> -static const struct drm_encoder_helper_funcs
>> -				meson_venc_hdmi_encoder_helper_funcs = {
>> -	.atomic_check	= meson_venc_hdmi_encoder_atomic_check,
>> -	.disable	= meson_venc_hdmi_encoder_disable,
>> -	.enable		= meson_venc_hdmi_encoder_enable,
>> -	.mode_set	= meson_venc_hdmi_encoder_mode_set,
>> +static const struct drm_bridge_funcs meson_venc_hdmi_encoder_bridge_funcs = {
>> +	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
>> +	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
>> +	.atomic_get_output_bus_fmts = meson_venc_hdmi_encoder_get_out_bus_fmts,
> 
> Hm, can this bridge element be connected directly to the HDMI connector
> without the dw-hdmi bridge in the middle? If that's not the case, then
> you probably don't have to implement ->atomic_get_output_bus_fmts()
> (only used on the last bridge element).

No, the HDMI bridge is mandatory here.

Ok, makes sense, I'll remove it then.

Neil

> 
>> +	.atomic_get_input_bus_fmts = meson_venc_hdmi_encoder_get_inp_bus_fmts,
>> +	.atomic_reset = drm_atomic_helper_bridge_reset,
>> +	.atomic_check = meson_venc_hdmi_encoder_atomic_check,
>> +	.enable	= meson_venc_hdmi_encoder_enable,
>> +	.disable = meson_venc_hdmi_encoder_disable,
>> +	.mode_set = meson_venc_hdmi_encoder_mode_set,
>>  };
>>  
>>  /* DW HDMI Regmap */
>> @@ -852,6 +911,7 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
>>  	struct drm_device *drm = data;
>>  	struct meson_drm *priv = drm->dev_private;
>>  	struct dw_hdmi_plat_data *dw_plat_data;
>> +	struct drm_bridge *next_bridge;
>>  	struct drm_encoder *encoder;
>>  	struct resource *res;
>>  	int irq;
>> @@ -953,8 +1013,6 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
>>  
>>  	/* Encoder */
>>  
>> -	drm_encoder_helper_add(encoder, &meson_venc_hdmi_encoder_helper_funcs);
>> -
>>  	ret = drm_encoder_init(drm, encoder, &meson_venc_hdmi_encoder_funcs,
>>  			       DRM_MODE_ENCODER_TMDS, "meson_hdmi");
>>  	if (ret) {
>> @@ -962,6 +1020,9 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
>>  		return ret;
>>  	}
>>  
>> +	meson_dw_hdmi->bridge.funcs = &meson_venc_hdmi_encoder_bridge_funcs;
>> +	drm_bridge_attach(encoder, &meson_dw_hdmi->bridge, NULL);
>> +
>>  	encoder->possible_crtcs = BIT(0);
>>  
>>  	DRM_DEBUG_DRIVER("encoder initialized\n");
>> @@ -984,11 +1045,15 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
>>  
>>  	platform_set_drvdata(pdev, meson_dw_hdmi);
>>  
>> -	meson_dw_hdmi->hdmi = dw_hdmi_bind(pdev, encoder,
>> -					   &meson_dw_hdmi->dw_plat_data);
>> +	meson_dw_hdmi->hdmi = dw_hdmi_probe(pdev,
>> +					    &meson_dw_hdmi->dw_plat_data);
>>  	if (IS_ERR(meson_dw_hdmi->hdmi))
>>  		return PTR_ERR(meson_dw_hdmi->hdmi);
>>  
>> +	next_bridge = of_drm_find_bridge(pdev->dev.of_node);
>> +	if (next_bridge)
>> +		drm_bridge_attach(encoder, next_bridge, &meson_dw_hdmi->bridge);
>> +
>>  	DRM_DEBUG_DRIVER("HDMI controller initialized\n");
>>  
>>  	return 0;
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
