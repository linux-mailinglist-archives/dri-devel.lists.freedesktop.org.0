Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A31234ECFF6
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 01:19:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D907C10E192;
	Wed, 30 Mar 2022 23:19:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48D2A10E192
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Mar 2022 23:19:40 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id q5so29749759ljb.11
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Mar 2022 16:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=82kg8GbNLPihbHIwxajwTG3ST8umrp72ZCIO25BlT5A=;
 b=Y+FQboVOiXmkTsvhvvYkuFC2krtAm17JNktS6LMvrbGFmIjnF9FhROgrNP4HT0Z6a7
 tDV3h6Thx7KxbnlA2Vf9PHnnwc6zXF5PMLRYkgvRvJY8PU9062n9Ad4kWGVfReX6PJ0I
 lid9AcH+zgVV7GzoWU5zj5wt2s6556Sl4PXii3YYu//72PUYDUiqtXVoBTaij2fHMhtD
 5hTonqmUT34YPxRMSUYZefHKdWM7HL7QrfcuRJzc3wAYVe2Lou/iFfx0Kw+amTGER4yu
 dnx/ogJxDGctU0oQ9b1JIYWfkZybLWEUeKmMHKyf0VGqbsBV5FkCVHaw5r8Bu+VzaUcn
 xpug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=82kg8GbNLPihbHIwxajwTG3ST8umrp72ZCIO25BlT5A=;
 b=LaFVBQPBqYP3Ua4BpHKmxPzVyuH0V0kl6fvmnjgFAWSBgcjQxsZa+Yh+xv+kGGffup
 5ENid5eugISdhTj9ObvQrw5XCXXh9Ot6K4J6ACdqBOFXVvXx+Xxvsk+d1+dfjZgBQz1z
 tBZCUFIJ6j/gAQjLeOBQRSmjM6cwyTSquU14UpsZjWa6xGqGyf78uI3y3z8CX6T/0JvE
 YYNSOxP6rX7wSQMuxoLjq37NfoAaGpUDRhdQzNB8rn1H8712061MkN2NKq6T1op68mi6
 h4l+z9Mv+mD42r07OrwwYkv0oncQfxNOTJ39Aw5rg9PyQtDYZvnAC5z1EqPur3XHGcFd
 eyUg==
X-Gm-Message-State: AOAM531AmddCUl2Pn4a+1VQ9VsmdB1ihPXwjCMycoZj9E0U3zWMHNewE
 tCzvfufp15p07uv2TCRpZMT9lA==
X-Google-Smtp-Source: ABdhPJz9b1Ia01LKBTk0IwXpo0Sqca1x7f+N+dd6d7ZxvLVgu9JSBmfAQMV51DSaL8GjNTGi7kMobw==
X-Received: by 2002:a2e:a548:0:b0:249:917e:bcaf with SMTP id
 e8-20020a2ea548000000b00249917ebcafmr8554362ljn.237.1648682378428; 
 Wed, 30 Mar 2022 16:19:38 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 p24-20020a2e9ad8000000b0024af9bfce6asm9042ljj.30.2022.03.30.16.19.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Mar 2022 16:19:38 -0700 (PDT)
Message-ID: <daec6ea4-abb1-05e6-ad49-b0a418a1f43e@linaro.org>
Date: Thu, 31 Mar 2022 02:19:37 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v6 1/8] drm/msm/dp: Add eDP support via aux_bus
Content-Language: en-GB
To: Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <1648656179-10347-1-git-send-email-quic_sbillaka@quicinc.com>
 <1648656179-10347-2-git-send-email-quic_sbillaka@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1648656179-10347-2-git-send-email-quic_sbillaka@quicinc.com>
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
Cc: quic_kalyant@quicinc.com, bjorn.andersson@linaro.org,
 quic_vproddut@quicinc.com, airlied@linux.ie, quic_khsieh@quicinc.com,
 dianders@chromium.org, quic_abhinavk@quicinc.com, seanpaul@chromium.org,
 quic_aravindh@quicinc.com, swboyd@chromium.org, sean@poorly.run
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30/03/2022 19:02, Sankeerth Billakanti wrote:
> This patch adds support for generic eDP sink through aux_bus. The eDP/DP
> controller driver should support aux transactions originating from the
> panel-edp driver and hence should be initialized and ready.
> 
> The panel bridge supporting the panel should be ready before the bridge
> connector is initialized. The generic panel probe needs the controller
> resources to be enabled to support the aux transactions originating from
> the panel probe.
> 
> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> ---
> 
> Changes in v6:
>    - Remove initialization
>    - Fix aux_bus node leak
>    - Split the patches
> 
>   drivers/gpu/drm/msm/dp/dp_display.c | 54 +++++++++++++++++++++++++++++++++++--
>   drivers/gpu/drm/msm/dp/dp_drm.c     | 10 ++++---
>   drivers/gpu/drm/msm/dp/dp_parser.c  | 21 +--------------
>   drivers/gpu/drm/msm/dp/dp_parser.h  |  1 +
>   4 files changed, 60 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 382b3aa..e082d02 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -10,6 +10,7 @@
>   #include <linux/component.h>
>   #include <linux/of_irq.h>
>   #include <linux/delay.h>
> +#include <drm/dp/drm_dp_aux_bus.h>
>   
>   #include "msm_drv.h"
>   #include "msm_kms.h"
> @@ -265,8 +266,6 @@ static int dp_display_bind(struct device *dev, struct device *master,
>   		goto end;
>   	}
>   
> -	dp->dp_display.next_bridge = dp->parser->next_bridge;
> -
>   	dp->aux->drm_dev = drm;
>   	rc = dp_aux_register(dp->aux);
>   	if (rc) {
> @@ -1524,6 +1523,53 @@ void msm_dp_debugfs_init(struct msm_dp *dp_display, struct drm_minor *minor)
>   	}
>   }
>   
> +static int dp_display_get_next_bridge(struct msm_dp *dp)
> +{
> +	int rc;
> +	struct dp_display_private *dp_priv;
> +	struct device_node *aux_bus;
> +	struct device *dev;
> +
> +	dp_priv = container_of(dp, struct dp_display_private, dp_display);
> +	dev = &dp_priv->pdev->dev;
> +	aux_bus = of_get_child_by_name(dev->of_node, "aux-bus");
> +
> +	if (aux_bus) {
> +		dp_display_host_init(dp_priv);
> +		dp_catalog_ctrl_hpd_config(dp_priv->catalog);
> +		enable_irq(dp_priv->irq);
> +		dp_display_host_phy_init(dp_priv);
> +
> +		devm_of_dp_aux_populate_ep_devices(dp_priv->aux);
> +
> +		disable_irq(dp_priv->irq);
> +		of_node_put(aux_bus);
> +	}
> +
> +	/*
> +	 * External bridges are mandatory for eDP interfaces: one has to
> +	 * provide at least an eDP panel (which gets wrapped into panel-bridge).
> +	 *
> +	 * For DisplayPort interfaces external bridges are optional, so
> +	 * silently ignore an error if one is not present (-ENODEV).
> +	 */
> +	rc = dp_parser_find_next_bridge(dp_priv->parser);
> +	if (rc == -ENODEV) {
> +		if (dp->connector_type == DRM_MODE_CONNECTOR_eDP) {

The more I think about these conditions, the closer I dislike them (yes, 
I added this one in one of the patches). I'd suggest to change 
dp->connector_type to boolean 'is_edp' field use it in all conditions 
instead.

> +			DRM_ERROR("eDP: next bridge is not present\n");
> +			return rc;
> +		}
> +	} else if (rc) {
> +		if (rc != -EPROBE_DEFER)
> +			DRM_ERROR("DP: error parsing next bridge: %d\n", rc);
> +		return rc;
> +	}
> +
> +	dp->next_bridge = dp_priv->parser->next_bridge;
> +
> +	return 0;
> +}
> +
>   int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
>   			struct drm_encoder *encoder)
>   {
> @@ -1547,6 +1593,10 @@ int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
>   
>   	dp_display->encoder = encoder;
>   
> +	ret = dp_display_get_next_bridge(dp_display);
> +	if (ret)
> +		return ret;
> +
>   	dp_display->bridge = dp_bridge_init(dp_display, dev, encoder);
>   	if (IS_ERR(dp_display->bridge)) {
>   		ret = PTR_ERR(dp_display->bridge);
> diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
> index 7ce1aca..5254bd6 100644
> --- a/drivers/gpu/drm/msm/dp/dp_drm.c
> +++ b/drivers/gpu/drm/msm/dp/dp_drm.c
> @@ -114,10 +114,12 @@ struct drm_bridge *dp_bridge_init(struct msm_dp *dp_display, struct drm_device *
>   	bridge->funcs = &dp_bridge_ops;
>   	bridge->type = dp_display->connector_type;
>   
> -	bridge->ops =
> -		DRM_BRIDGE_OP_DETECT |
> -		DRM_BRIDGE_OP_HPD |
> -		DRM_BRIDGE_OP_MODES;
> +	if (bridge->type == DRM_MODE_CONNECTOR_DisplayPort) {

And in this case we can also check dp_display->connector_type (or the 
suggested dp_display->is_edp) for the uniformity of the code.

> +		bridge->ops =
> +			DRM_BRIDGE_OP_DETECT |
> +			DRM_BRIDGE_OP_HPD |
> +			DRM_BRIDGE_OP_MODES;

I think OP_MODES should be used for eDP, shouldn't it?

> +	}
>   
>   	rc = drm_bridge_attach(encoder, bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
>   	if (rc) {
> diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c b/drivers/gpu/drm/msm/dp/dp_parser.c
> index 1056b8d..6317dce 100644
> --- a/drivers/gpu/drm/msm/dp/dp_parser.c
> +++ b/drivers/gpu/drm/msm/dp/dp_parser.c
> @@ -265,7 +265,7 @@ static int dp_parser_clock(struct dp_parser *parser)
>   	return 0;
>   }
>   
> -static int dp_parser_find_next_bridge(struct dp_parser *parser)
> +int dp_parser_find_next_bridge(struct dp_parser *parser)
>   {
>   	struct device *dev = &parser->pdev->dev;
>   	struct drm_bridge *bridge;
> @@ -300,25 +300,6 @@ static int dp_parser_parse(struct dp_parser *parser, int connector_type)
>   	if (rc)
>   		return rc;
>   
> -	/*
> -	 * External bridges are mandatory for eDP interfaces: one has to
> -	 * provide at least an eDP panel (which gets wrapped into panel-bridge).
> -	 *
> -	 * For DisplayPort interfaces external bridges are optional, so
> -	 * silently ignore an error if one is not present (-ENODEV).
> -	 */
> -	rc = dp_parser_find_next_bridge(parser);
> -	if (rc == -ENODEV) {
> -		if (connector_type == DRM_MODE_CONNECTOR_eDP) {
> -			DRM_ERROR("eDP: next bridge is not present\n");
> -			return rc;
> -		}
> -	} else if (rc) {
> -		if (rc != -EPROBE_DEFER)
> -			DRM_ERROR("DP: error parsing next bridge: %d\n", rc);
> -		return rc;
> -	}
> -
>   	/* Map the corresponding regulator information according to
>   	 * version. Currently, since we only have one supported platform,
>   	 * mapping the regulator directly.
> diff --git a/drivers/gpu/drm/msm/dp/dp_parser.h b/drivers/gpu/drm/msm/dp/dp_parser.h
> index d371bae..091ff41 100644
> --- a/drivers/gpu/drm/msm/dp/dp_parser.h
> +++ b/drivers/gpu/drm/msm/dp/dp_parser.h
> @@ -140,5 +140,6 @@ struct dp_parser {
>    * can be parsed using this module.
>    */
>   struct dp_parser *dp_parser_get(struct platform_device *pdev);
> +int dp_parser_find_next_bridge(struct dp_parser *parser);
>   
>   #endif


-- 
With best wishes
Dmitry
