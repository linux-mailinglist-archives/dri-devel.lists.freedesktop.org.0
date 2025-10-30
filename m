Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9158BC20BBD
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 15:52:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA2F510E9CD;
	Thu, 30 Oct 2025 14:52:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="M9suxPhZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D68FA10E9CA
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 14:51:56 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 165B5C0DAB4;
 Thu, 30 Oct 2025 14:51:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 7F5356068C;
 Thu, 30 Oct 2025 14:51:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 079FB11808B2B; Thu, 30 Oct 2025 15:51:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1761835914; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references:autocrypt;
 bh=SAkDdkrnxH9N/ncz0nq8og9iGrS3NoyIUN1wj9EeHkA=;
 b=M9suxPhZ/3r+pqZL04nEu7fiHuxDWJ7d9ndA4h7qbdZvKbY2FyCdbSpefzCXzAeGpxMMux
 UBiyCQRAJzUyy9HDrgK5k82LOKRtseSLjD6GH8GQ8o/Pj/aFOVHopS6OvKl1sTkTnBK2PK
 z9NNz7ASvM59n+j3yXHVY6vtwnR6KeMKDERHIrQGB7A6RkRrLtNt75MPr4rCnNiKGbKIgC
 6YUfiTb7cfBasx2cBDdYa9GIwuW0xvRZMouoFYMoizxB2VMiOOAUAgfv5gG3YFDBFs3adu
 aigCRdJTiiH+K8YN4ME8QpdBTcYDN4Kzfm2i2N4/LQgC4UEMdHUnKZNinKDhCQ==
Message-ID: <4b9ac257-1f9e-4e07-bb07-13624cd5ae64@bootlin.com>
Date: Thu, 30 Oct 2025 15:51:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] Revert "drm/display: bridge_connector: get/put the
 stored bridges"
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Naresh Kamboju <naresh.kamboju@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251017-drm-bridge-alloc-getput-bridge-connector-fix-hdmi_cec-v2-0-667abf6d47c0@bootlin.com>
 <20251017-drm-bridge-alloc-getput-bridge-connector-fix-hdmi_cec-v2-1-667abf6d47c0@bootlin.com>
Content-Language: en-US, fr
From: Louis Chauvet <louis.chauvet@bootlin.com>
Autocrypt: addr=louis.chauvet@bootlin.com; keydata=
 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
In-Reply-To: <20251017-drm-bridge-alloc-getput-bridge-connector-fix-hdmi_cec-v2-1-667abf6d47c0@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
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



Le 17/10/2025 à 18:15, Luca Ceresoli a écrit :
> This reverts commit 2be300f9a0b6f6b0ae2a90be97e558ec0535be54.
> 
> The commit being reverted moved all the bridge_connector->bridge_*
> assignments to just before the final successful return in order to handle
> the bridge refcounting in a clean way.
> 
> This introduced a bug, because a bit before the successful return
> drmm_connector_hdmi_cec_register() is called, which calls funcs->init()
> which is drm_bridge_connector_hdmi_cec_init() which needs
> bridge_connector->bridge_hdmi_cec to be set.
> 
> The reported bug may be fixed in a relatively simple way, but other similar
> patterns are potentially present, so just revert the offending commit. A
> different approach will be implemented.
> 
> Fixes: 2be300f9a0b6 ("drm/display: bridge_connector: get/put the stored bridges")
> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Closes: https://lore.kernel.org/all/336fbfdd-c424-490e-b5d1-8ee84043dc80@samsung.com/
> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> Closes: https://lore.kernel.org/r/CA+G9fYuKHp3QgPKjgFY3TfkDdh5Vf=Ae5pCW+eU41Bu=D7th2g@mail.gmail.com
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>

> ---
> 
> Changes in v2: none
> ---
>   drivers/gpu/drm/display/drm_bridge_connector.c | 114 ++++++++-----------------
>   1 file changed, 36 insertions(+), 78 deletions(-)
> 
> diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
> index 7b18be3ff9a32b362468351835bdab43c3f524f1..a5bdd6c1064399ece6b19560f145b877c9e0680e 100644
> --- a/drivers/gpu/drm/display/drm_bridge_connector.c
> +++ b/drivers/gpu/drm/display/drm_bridge_connector.c
> @@ -618,20 +618,6 @@ static const struct drm_connector_hdmi_cec_funcs drm_bridge_connector_hdmi_cec_f
>    * Bridge Connector Initialisation
>    */
>   
> -static void drm_bridge_connector_put_bridges(struct drm_device *dev, void *data)
> -{
> -	struct drm_bridge_connector *bridge_connector = (struct drm_bridge_connector *)data;
> -
> -	drm_bridge_put(bridge_connector->bridge_edid);
> -	drm_bridge_put(bridge_connector->bridge_hpd);
> -	drm_bridge_put(bridge_connector->bridge_detect);
> -	drm_bridge_put(bridge_connector->bridge_modes);
> -	drm_bridge_put(bridge_connector->bridge_hdmi);
> -	drm_bridge_put(bridge_connector->bridge_hdmi_audio);
> -	drm_bridge_put(bridge_connector->bridge_dp_audio);
> -	drm_bridge_put(bridge_connector->bridge_hdmi_cec);
> -}
> -
>   /**
>    * drm_bridge_connector_init - Initialise a connector for a chain of bridges
>    * @drm: the DRM device
> @@ -652,15 +638,7 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
>   	struct drm_bridge_connector *bridge_connector;
>   	struct drm_connector *connector;
>   	struct i2c_adapter *ddc = NULL;
> -	struct drm_bridge *panel_bridge      __free(drm_bridge_put) = NULL;
> -	struct drm_bridge *bridge_edid       __free(drm_bridge_put) = NULL;
> -	struct drm_bridge *bridge_hpd        __free(drm_bridge_put) = NULL;
> -	struct drm_bridge *bridge_detect     __free(drm_bridge_put) = NULL;
> -	struct drm_bridge *bridge_modes      __free(drm_bridge_put) = NULL;
> -	struct drm_bridge *bridge_hdmi       __free(drm_bridge_put) = NULL;
> -	struct drm_bridge *bridge_hdmi_audio __free(drm_bridge_put) = NULL;
> -	struct drm_bridge *bridge_dp_audio   __free(drm_bridge_put) = NULL;
> -	struct drm_bridge *bridge_hdmi_cec   __free(drm_bridge_put) = NULL;
> +	struct drm_bridge *panel_bridge = NULL;
>   	unsigned int supported_formats = BIT(HDMI_COLORSPACE_RGB);
>   	unsigned int max_bpc = 8;
>   	bool support_hdcp = false;
> @@ -671,10 +649,6 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
>   	if (!bridge_connector)
>   		return ERR_PTR(-ENOMEM);
>   
> -	ret = drmm_add_action(drm, drm_bridge_connector_put_bridges, bridge_connector);
> -	if (ret)
> -		return ERR_PTR(ret);
> -
>   	bridge_connector->encoder = encoder;
>   
>   	/*
> @@ -698,30 +672,22 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
>   		if (!bridge->ycbcr_420_allowed)
>   			connector->ycbcr_420_allowed = false;
>   
> -		if (bridge->ops & DRM_BRIDGE_OP_EDID) {
> -			drm_bridge_put(bridge_edid);
> -			bridge_edid = drm_bridge_get(bridge);
> -		}
> -		if (bridge->ops & DRM_BRIDGE_OP_HPD) {
> -			drm_bridge_put(bridge_hpd);
> -			bridge_hpd = drm_bridge_get(bridge);
> -		}
> -		if (bridge->ops & DRM_BRIDGE_OP_DETECT) {
> -			drm_bridge_put(bridge_detect);
> -			bridge_detect = drm_bridge_get(bridge);
> -		}
> -		if (bridge->ops & DRM_BRIDGE_OP_MODES) {
> -			drm_bridge_put(bridge_modes);
> -			bridge_modes = drm_bridge_get(bridge);
> -		}
> +		if (bridge->ops & DRM_BRIDGE_OP_EDID)
> +			bridge_connector->bridge_edid = bridge;
> +		if (bridge->ops & DRM_BRIDGE_OP_HPD)
> +			bridge_connector->bridge_hpd = bridge;
> +		if (bridge->ops & DRM_BRIDGE_OP_DETECT)
> +			bridge_connector->bridge_detect = bridge;
> +		if (bridge->ops & DRM_BRIDGE_OP_MODES)
> +			bridge_connector->bridge_modes = bridge;
>   		if (bridge->ops & DRM_BRIDGE_OP_HDMI) {
> -			if (bridge_hdmi)
> +			if (bridge_connector->bridge_hdmi)
>   				return ERR_PTR(-EBUSY);
>   			if (!bridge->funcs->hdmi_write_infoframe ||
>   			    !bridge->funcs->hdmi_clear_infoframe)
>   				return ERR_PTR(-EINVAL);
>   
> -			bridge_hdmi = drm_bridge_get(bridge);
> +			bridge_connector->bridge_hdmi = bridge;
>   
>   			if (bridge->supported_formats)
>   				supported_formats = bridge->supported_formats;
> @@ -730,10 +696,10 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
>   		}
>   
>   		if (bridge->ops & DRM_BRIDGE_OP_HDMI_AUDIO) {
> -			if (bridge_hdmi_audio)
> +			if (bridge_connector->bridge_hdmi_audio)
>   				return ERR_PTR(-EBUSY);
>   
> -			if (bridge_dp_audio)
> +			if (bridge_connector->bridge_dp_audio)
>   				return ERR_PTR(-EBUSY);
>   
>   			if (!bridge->hdmi_audio_max_i2s_playback_channels &&
> @@ -744,14 +710,14 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
>   			    !bridge->funcs->hdmi_audio_shutdown)
>   				return ERR_PTR(-EINVAL);
>   
> -			bridge_hdmi_audio = drm_bridge_get(bridge);
> +			bridge_connector->bridge_hdmi_audio = bridge;
>   		}
>   
>   		if (bridge->ops & DRM_BRIDGE_OP_DP_AUDIO) {
> -			if (bridge_dp_audio)
> +			if (bridge_connector->bridge_dp_audio)
>   				return ERR_PTR(-EBUSY);
>   
> -			if (bridge_hdmi_audio)
> +			if (bridge_connector->bridge_hdmi_audio)
>   				return ERR_PTR(-EBUSY);
>   
>   			if (!bridge->hdmi_audio_max_i2s_playback_channels &&
> @@ -762,7 +728,7 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
>   			    !bridge->funcs->dp_audio_shutdown)
>   				return ERR_PTR(-EINVAL);
>   
> -			bridge_dp_audio = drm_bridge_get(bridge);
> +			bridge_connector->bridge_dp_audio = bridge;
>   		}
>   
>   		if (bridge->ops & DRM_BRIDGE_OP_HDMI_CEC_NOTIFIER) {
> @@ -773,10 +739,10 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
>   		}
>   
>   		if (bridge->ops & DRM_BRIDGE_OP_HDMI_CEC_ADAPTER) {
> -			if (bridge_hdmi_cec)
> +			if (bridge_connector->bridge_hdmi_cec)
>   				return ERR_PTR(-EBUSY);
>   
> -			bridge_hdmi_cec = drm_bridge_get(bridge);
> +			bridge_connector->bridge_hdmi_cec = bridge;
>   
>   			if (!bridge->funcs->hdmi_cec_enable ||
>   			    !bridge->funcs->hdmi_cec_log_addr ||
> @@ -796,7 +762,7 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
>   			ddc = bridge->ddc;
>   
>   		if (drm_bridge_is_panel(bridge))
> -			panel_bridge = drm_bridge_get(bridge);
> +			panel_bridge = bridge;
>   
>   		if (bridge->support_hdcp)
>   			support_hdcp = true;
> @@ -805,13 +771,13 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
>   	if (connector_type == DRM_MODE_CONNECTOR_Unknown)
>   		return ERR_PTR(-EINVAL);
>   
> -	if (bridge_hdmi) {
> +	if (bridge_connector->bridge_hdmi) {
>   		if (!connector->ycbcr_420_allowed)
>   			supported_formats &= ~BIT(HDMI_COLORSPACE_YUV420);
>   
>   		ret = drmm_connector_hdmi_init(drm, connector,
> -					       bridge_hdmi->vendor,
> -					       bridge_hdmi->product,
> +					       bridge_connector->bridge_hdmi->vendor,
> +					       bridge_connector->bridge_hdmi->product,
>   					       &drm_bridge_connector_funcs,
>   					       &drm_bridge_connector_hdmi_funcs,
>   					       connector_type, ddc,
> @@ -827,14 +793,15 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
>   			return ERR_PTR(ret);
>   	}
>   
> -	if (bridge_hdmi_audio || bridge_dp_audio) {
> +	if (bridge_connector->bridge_hdmi_audio ||
> +	    bridge_connector->bridge_dp_audio) {
>   		struct device *dev;
>   		struct drm_bridge *bridge;
>   
> -		if (bridge_hdmi_audio)
> -			bridge = bridge_hdmi_audio;
> +		if (bridge_connector->bridge_hdmi_audio)
> +			bridge = bridge_connector->bridge_hdmi_audio;
>   		else
> -			bridge = bridge_dp_audio;
> +			bridge = bridge_connector->bridge_dp_audio;
>   
>   		dev = bridge->hdmi_audio_dev;
>   
> @@ -848,9 +815,9 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
>   			return ERR_PTR(ret);
>   	}
>   
> -	if (bridge_hdmi_cec &&
> -	    bridge_hdmi_cec->ops & DRM_BRIDGE_OP_HDMI_CEC_NOTIFIER) {
> -		struct drm_bridge *bridge = bridge_hdmi_cec;
> +	if (bridge_connector->bridge_hdmi_cec &&
> +	    bridge_connector->bridge_hdmi_cec->ops & DRM_BRIDGE_OP_HDMI_CEC_NOTIFIER) {
> +		struct drm_bridge *bridge = bridge_connector->bridge_hdmi_cec;
>   
>   		ret = drmm_connector_hdmi_cec_notifier_register(connector,
>   								NULL,
> @@ -859,9 +826,9 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
>   			return ERR_PTR(ret);
>   	}
>   
> -	if (bridge_hdmi_cec &&
> -	    bridge_hdmi_cec->ops & DRM_BRIDGE_OP_HDMI_CEC_ADAPTER) {
> -		struct drm_bridge *bridge = bridge_hdmi_cec;
> +	if (bridge_connector->bridge_hdmi_cec &&
> +	    bridge_connector->bridge_hdmi_cec->ops & DRM_BRIDGE_OP_HDMI_CEC_ADAPTER) {
> +		struct drm_bridge *bridge = bridge_connector->bridge_hdmi_cec;
>   
>   		ret = drmm_connector_hdmi_cec_register(connector,
>   						       &drm_bridge_connector_hdmi_cec_funcs,
> @@ -874,9 +841,9 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
>   
>   	drm_connector_helper_add(connector, &drm_bridge_connector_helper_funcs);
>   
> -	if (bridge_hpd)
> +	if (bridge_connector->bridge_hpd)
>   		connector->polled = DRM_CONNECTOR_POLL_HPD;
> -	else if (bridge_detect)
> +	else if (bridge_connector->bridge_detect)
>   		connector->polled = DRM_CONNECTOR_POLL_CONNECT
>   				  | DRM_CONNECTOR_POLL_DISCONNECT;
>   
> @@ -887,15 +854,6 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
>   	    IS_ENABLED(CONFIG_DRM_DISPLAY_HDCP_HELPER))
>   		drm_connector_attach_content_protection_property(connector, true);
>   
> -	bridge_connector->bridge_edid       = drm_bridge_get(bridge_edid);
> -	bridge_connector->bridge_hpd        = drm_bridge_get(bridge_hpd);
> -	bridge_connector->bridge_detect     = drm_bridge_get(bridge_detect);
> -	bridge_connector->bridge_modes      = drm_bridge_get(bridge_modes);
> -	bridge_connector->bridge_hdmi       = drm_bridge_get(bridge_hdmi);
> -	bridge_connector->bridge_hdmi_audio = drm_bridge_get(bridge_hdmi_audio);
> -	bridge_connector->bridge_dp_audio   = drm_bridge_get(bridge_dp_audio);
> -	bridge_connector->bridge_hdmi_cec   = drm_bridge_get(bridge_hdmi_cec);
> -
>   	return connector;
>   }
>   EXPORT_SYMBOL_GPL(drm_bridge_connector_init);
> 

-- 
--
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

