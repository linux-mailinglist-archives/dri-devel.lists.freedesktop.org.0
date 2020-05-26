Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F0A1E2200
	for <lists+dri-devel@lfdr.de>; Tue, 26 May 2020 14:35:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D85C6E0BF;
	Tue, 26 May 2020 12:35:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5B9C6E0BF
 for <dri-devel@lists.freedesktop.org>; Tue, 26 May 2020 12:35:22 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id i15so20183802wrx.10
 for <dri-devel@lists.freedesktop.org>; Tue, 26 May 2020 05:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:organization:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NsLXugu3APIVjRo46I2+TT+8l38+WgGk90t1S6FHpmM=;
 b=TYoR44ViTV/hUGk60qEomhGlNneucOk70bKiVRnUG13sDoxCNa6kAc4z0TcrrIaFQL
 nzs5xinv+Hp152qyid0h+0rRE/RnKmi+c9x5Oaidu8L3XvS4s8OGoFoHhUpNVY9caVYc
 p3VaFfO+/ZSSK3dG3L0Xww7p9u1w8gDcqdV7zpDYgWtkYf01hSBedPFsEHfXOmqahkt7
 u7pbCKHNB9tEQzQ2GTBZjLffYs4vWBRckXo1qIzLQ1Ko8dUhT6SXAyn7XZFSnLHmXOOL
 3/FjU2dys4c9eVcg91g3bLYvDAktRxoPbywG74Fmpl5CbYna40HB92xh3d4qR+5ZMWhq
 10eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=NsLXugu3APIVjRo46I2+TT+8l38+WgGk90t1S6FHpmM=;
 b=CrV/Nn9LJXCHbaHTxB4ehNywN3z+2fIeXm1f+2ZTfMowrjqyWiG/QTkPp2SYXqwUku
 ru4+D02/oopEXJQIMkTpUp4lizQ2YG3o2MyZZNIEiz45fDwEMv7THDIMhKnyZhgwUqZM
 pa3XXcE1hsx3RuEvatlPNautEGtTFE7J/mSVaFy9aPfnzXljEYRVhwtUHIQLEiRnHK1m
 TL3KuItS3NGWnpkBXXifyW9jWFpSHXi/AD+GtJTB8xXM9YNOAn02F6HaxdXp6T3gUQxV
 BCxdN5our+2fQyfR+Lws4beepvg+vC3X7oPa3VCOC61KSGRed4vaHRsUInps5oddczkW
 3Dbw==
X-Gm-Message-State: AOAM530L9fJInCk3V4sOgFKjru6CUdfhrfjPMjwFnrR9soMu48e9x5OV
 qSbBJMgMcWw3lKhyYxkDIQMJTVWO0Xgqig==
X-Google-Smtp-Source: ABdhPJxkpfFS6k7lAgJ1GXJNz6kk4hWWKHX8h/0HcUyHrC/PQH8j5VEqcnQRHeaLXmnEcfVrRo7UHA==
X-Received: by 2002:adf:e381:: with SMTP id e1mr18886116wrm.320.1590496521353; 
 Tue, 26 May 2020 05:35:21 -0700 (PDT)
Received: from ?IPv6:2a01:e35:2ec0:82b0:acf8:18a8:b3a5:a17b?
 ([2a01:e35:2ec0:82b0:acf8:18a8:b3a5:a17b])
 by smtp.gmail.com with ESMTPSA id f11sm6398892wrm.13.2020.05.26.05.35.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 May 2020 05:35:20 -0700 (PDT)
Subject: Re: [PATCH 22/27] drm: bridge: dw-hdmi: Make connector creation
 optional
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
References: <20200526011505.31884-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200526011505.31884-23-laurent.pinchart+renesas@ideasonboard.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 BSwxi7g3Mu7u5kUByanqHyA=
Organization: Baylibre
Message-ID: <3146e372-f900-fd2b-1b2d-2f68cf8697c6@baylibre.com>
Date: Tue, 26 May 2020 14:35:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200526011505.31884-23-laurent.pinchart+renesas@ideasonboard.com>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 linux-renesas-soc@vger.kernel.org, Andrzej Hajda <a.hajda@samsung.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 26/05/2020 03:15, Laurent Pinchart wrote:
> Implement the drm_bridge_funcs .detect() and .get_edid() operations, and
> call drm_bridge_hpd_notify() notify to report HPD. This provides the
> necessary API to support disabling connector creation, do so by
> accepting DRM_BRIDGE_ATTACH_NO_CONNECTOR in dw_hdmi_bridge_attach().
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 104 +++++++++++++++-------
>  1 file changed, 74 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index b69c14b9de62..6148a022569a 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -2323,15 +2323,8 @@ static void dw_hdmi_update_phy_mask(struct dw_hdmi *hdmi)
>  					  hdmi->rxsense);
>  }
>  
> -/* -----------------------------------------------------------------------------
> - * DRM Connector Operations
> - */
> -
> -static enum drm_connector_status
> -dw_hdmi_connector_detect(struct drm_connector *connector, bool force)
> +static enum drm_connector_status dw_hdmi_detect(struct dw_hdmi *hdmi)
>  {
> -	struct dw_hdmi *hdmi = container_of(connector, struct dw_hdmi,
> -					     connector);
>  	enum drm_connector_status result;
>  
>  	mutex_lock(&hdmi->mutex);
> @@ -2354,31 +2347,57 @@ dw_hdmi_connector_detect(struct drm_connector *connector, bool force)
>  	return result;
>  }
>  
> -static int dw_hdmi_connector_get_modes(struct drm_connector *connector)
> +static struct edid *dw_hdmi_get_edid(struct dw_hdmi *hdmi,
> +				     struct drm_connector *connector)
>  {
> -	struct dw_hdmi *hdmi = container_of(connector, struct dw_hdmi,
> -					     connector);
>  	struct edid *edid;
> -	int ret = 0;
>  
>  	if (!hdmi->ddc)
> -		return 0;
> +		return NULL;
>  
>  	edid = drm_get_edid(connector, hdmi->ddc);
> -	if (edid) {
> -		dev_dbg(hdmi->dev, "got edid: width[%d] x height[%d]\n",
> -			edid->width_cm, edid->height_cm);
> -
> -		hdmi->sink_is_hdmi = drm_detect_hdmi_monitor(edid);
> -		hdmi->sink_has_audio = drm_detect_monitor_audio(edid);
> -		drm_connector_update_edid_property(connector, edid);
> -		cec_notifier_set_phys_addr_from_edid(hdmi->cec_notifier, edid);
> -		ret = drm_add_edid_modes(connector, edid);
> -		kfree(edid);
> -	} else {
> +	if (!edid) {
>  		dev_dbg(hdmi->dev, "failed to get edid\n");
> +		return NULL;
>  	}
>  
> +	dev_dbg(hdmi->dev, "got edid: width[%d] x height[%d]\n",
> +		edid->width_cm, edid->height_cm);
> +
> +	hdmi->sink_is_hdmi = drm_detect_hdmi_monitor(edid);
> +	hdmi->sink_has_audio = drm_detect_monitor_audio(edid);
> +
> +	return edid;
> +}
> +
> +/* -----------------------------------------------------------------------------
> + * DRM Connector Operations
> + */
> +
> +static enum drm_connector_status
> +dw_hdmi_connector_detect(struct drm_connector *connector, bool force)
> +{
> +	struct dw_hdmi *hdmi = container_of(connector, struct dw_hdmi,
> +					     connector);
> +	return dw_hdmi_detect(hdmi);
> +}
> +
> +static int dw_hdmi_connector_get_modes(struct drm_connector *connector)
> +{
> +	struct dw_hdmi *hdmi = container_of(connector, struct dw_hdmi,
> +					     connector);
> +	struct edid *edid;
> +	int ret;
> +
> +	edid = dw_hdmi_get_edid(hdmi, connector);
> +	if (!edid)
> +		return 0;
> +
> +	drm_connector_update_edid_property(connector, edid);
> +	cec_notifier_set_phys_addr_from_edid(hdmi->cec_notifier, edid);
> +	ret = drm_add_edid_modes(connector, edid);
> +	kfree(edid);
> +
>  	return ret;
>  }
>  
> @@ -2777,10 +2796,8 @@ static int dw_hdmi_bridge_attach(struct drm_bridge *bridge,
>  {
>  	struct dw_hdmi *hdmi = bridge->driver_private;
>  
> -	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
> -		DRM_ERROR("Fix bridge driver to make connector optional!");
> -		return -EINVAL;
> -	}
> +	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
> +		return 0;
>  
>  	return dw_hdmi_connector_create(hdmi);
>  }
> @@ -2860,6 +2877,21 @@ static void dw_hdmi_bridge_atomic_enable(struct drm_bridge *bridge,
>  	mutex_unlock(&hdmi->mutex);
>  }
>  
> +static enum drm_connector_status dw_hdmi_bridge_detect(struct drm_bridge *bridge)
> +{
> +	struct dw_hdmi *hdmi = bridge->driver_private;
> +
> +	return dw_hdmi_detect(hdmi);
> +}
> +
> +static struct edid *dw_hdmi_bridge_get_edid(struct drm_bridge *bridge,
> +					    struct drm_connector *connector)
> +{
> +	struct dw_hdmi *hdmi = bridge->driver_private;
> +
> +	return dw_hdmi_get_edid(hdmi, connector);
> +}
> +
>  static const struct drm_bridge_funcs dw_hdmi_bridge_funcs = {
>  	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
>  	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> @@ -2873,6 +2905,8 @@ static const struct drm_bridge_funcs dw_hdmi_bridge_funcs = {
>  	.atomic_disable = dw_hdmi_bridge_atomic_disable,
>  	.mode_set = dw_hdmi_bridge_mode_set,
>  	.mode_valid = dw_hdmi_bridge_mode_valid,
> +	.detect = dw_hdmi_bridge_detect,
> +	.get_edid = dw_hdmi_bridge_get_edid,
>  };
>  
>  /* -----------------------------------------------------------------------------
> @@ -2988,10 +3022,18 @@ static irqreturn_t dw_hdmi_irq(int irq, void *dev_id)
>  	}
>  
>  	if (intr_stat & HDMI_IH_PHY_STAT0_HPD) {
> +		enum drm_connector_status status = phy_int_pol & HDMI_PHY_HPD
> +						 ? connector_status_connected
> +						 : connector_status_disconnected;
> +
>  		dev_dbg(hdmi->dev, "EVENT=%s\n",
> -			phy_int_pol & HDMI_PHY_HPD ? "plugin" : "plugout");
> -		if (hdmi->bridge.dev)
> +			status == connector_status_connected ?
> +			"plugin" : "plugout");
> +
> +		if (hdmi->bridge.dev) {
>  			drm_helper_hpd_irq_event(hdmi->bridge.dev);
> +			drm_bridge_hpd_notify(&hdmi->bridge, status);

I suspect I will also need to add drm_bridge_hpd_notify() in meson_dw_hdmi.c in dw_hdmi_top_thread_irq() for HPD event, right ?

> +		}
>  	}
>  
>  	hdmi_writeb(hdmi, intr_stat, HDMI_IH_PHY_STAT0);
> @@ -3337,6 +3379,8 @@ __dw_hdmi_probe(struct platform_device *pdev,
>  
>  	hdmi->bridge.driver_private = hdmi;
>  	hdmi->bridge.funcs = &dw_hdmi_bridge_funcs;
> +	hdmi->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID
> +			 | DRM_BRIDGE_OP_HPD;

same here for meson_dw_hdmi ?
could I also assume we could disable the dw_hdmi bridge & hpd ops when using with meson_dw_hdmi and
implement these in meson_dw_hdmi ?

>  #ifdef CONFIG_OF
>  	hdmi->bridge.of_node = pdev->dev.of_node;
>  #endif
> 

Anyway

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
