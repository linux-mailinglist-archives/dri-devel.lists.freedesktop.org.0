Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC079EA420
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2024 02:12:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3401610E35E;
	Tue, 10 Dec 2024 01:12:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="y53UsXOc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49FF910E35E
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2024 01:12:46 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-30219437e63so18931281fa.1
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Dec 2024 17:12:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733793164; x=1734397964; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=2QNfRzHxDC2/cm0Ugw4yVvaaGGlerGaNvv9c6fJmImY=;
 b=y53UsXOc57p4HUVG90E1/sJxog1wmdP0MuHxp8swAE6XEL4NWXNMOAcjyfO6l/e2In
 E0tN8jCr8BuEm/2nfczBayFE2WjBOBVpTvPeCJvbn/y3IbnCmGHsl3V/yQ1VA7m86Lpg
 cOv+bMZdhm44ewTrH25EGzsNlAP9XshdnAvVxrHcJrNpgkLts74DPnZ7TeHXClil2w2a
 nBvtFz3ANpfgdnsPaoujesf3WvgcTcqNEwbhaGT9C7ZT32092ceVdiLsRImiS024qhvD
 YrDxhCSQZY7PR/DeuUAIvxS3iHS6R2qsSVnPz+2bqDiRRcgUFWl63Vb0CBiVgbZ8O+DK
 yVJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733793164; x=1734397964;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2QNfRzHxDC2/cm0Ugw4yVvaaGGlerGaNvv9c6fJmImY=;
 b=pvyhOs2iMPHCM0Z7rLCc+OAEJN6NVBEw1kiGnKvODiGBp9UTXb00YWrmRNwHbm4iqW
 ec/N8r5U4JZUExRA5zmmygKxOxofOJQRm6X/FKN6RivLLNAzp8J6R35Qxd1o8G4z6ojY
 TbB6yDFg5E6LYfCK4Z7oNlXf1E/8w3PpLl5hMWOU/AlT0tPqe5+MQl/sILnI5gXMa7Uz
 /bIZfCjqviR63opjAjPyL/Y8cWSEiiCYPvjNqirxPY4GktBORHSxNxaHddkJRTnJB33j
 0/5IBtyNmNfi6A+fx6Dt9pvNrH8Na90WUpaSwWtzS/hyrT8A/vjyaeET7NaGC2PLoc/F
 126g==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1dF5gni94dkhHIgRV684hKAlGKLD0izS9xst47iRZ6buhYMnlI4j/1vbME3aKgr4U6USNM3VegBM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzGWc67CiX0KPeSQd/cc8mLgCmuALpIUKBr3ZLtVVWqnuxKWiPj
 +9353FmurqNt5w4b/oKvms8RI5PoxyEyu141Zu29Yiyb3AG02jDezkNiZo07RRE=
X-Gm-Gg: ASbGncsJK3gWe0kw8elb9e4K2lA7G0XNsLjOF/GX+NyoQVOvFCBffGVAB1O7HJp15qs
 Kt5WqdyFOdxlt4VtH0q7NQaFFgi5EU1lxD1h5tdnHE8MPYgJvwp9IN9AsiYnXRuiSMeLXNW5vhV
 8A62h6RoRex31B/KYUBbPjN1HgEHw5+ONmaFJDVcX8PQB8e4q+hyZ0HTfrl6azpk6zH+znowL+K
 7BxqHF8KfMI1q/CL6SIK9lpi6Tjv5dYuKjg1euPVPeo6XmktsY2mlTtihsclbW/Nvt6I4cRHHi1
 sAmxpV0TRjLtS2hboHNsG9XibyQJ+49prw==
X-Google-Smtp-Source: AGHT+IFeGVhuwlz8YbbARcWMz2AW/kzh60cS9g2mSnu2qLNh4HtWzelhCxg85jSiE86SJS+2GICamQ==
X-Received: by 2002:ac2:51cd:0:b0:53d:f769:14cb with SMTP id
 2adb3069b0e04-540251e571amr455241e87.9.1733793164271; 
 Mon, 09 Dec 2024 17:12:44 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53e387a42dfsm1070755e87.90.2024.12.09.17.12.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Dec 2024 17:12:42 -0800 (PST)
Date: Tue, 10 Dec 2024 03:12:40 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 kernel@collabora.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/bridge-connector: Prioritize supported_formats
 over ycbcr_420_allowed
Message-ID: <uw7uqw6zsmoe2cyxe3mqm3ok43afut47jms37nny6ecl44b5xe@byagwnayplse>
References: <20241206-bridge-conn-fmt-prio-v2-1-85c817529b88@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241206-bridge-conn-fmt-prio-v2-1-85c817529b88@collabora.com>
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

On Fri, Dec 06, 2024 at 10:00:46PM +0200, Cristian Ciocaltea wrote:
> Bridges having the DRM_BRIDGE_OP_HDMI flag set in drm_bridge->ops are
> supposed to rely on drm_bridge->supported_formats bitmask to advertise
> the supported colorspaces, including HDMI_COLORSPACE_YUV420.  Therefore,
> the newly introduced drm_bridge->ycbcr_420_allowed flag becomes
> redundant in this particular context.
> 
> Moreover, when drm_bridge_connector gets initialised, only
> drm_bridge->ycbcr_420_allowed is considered in the process of adjusting
> the equivalent property of the base drm_connector, which effectively
> discards the formats advertised by the HDMI bridge.

I think this should be handled in a different way: during HDMI connector
init verify that HDMI_COLORSPACE_YUV420 matches the
drm_connector->ycbcr_420_allowed value and rejects incompatible
connectors.

> Handle the inconsistency by ignoring ycbcr_420_allowed for HDMI bridges
> and, instead, make use of the supported_formats bitmask when setting up
> the bridge connector.
> 
> Additionally, ensure the YUV420 related bit is removed from the bitmask
> passed to drmm_connector_hdmi_init() when the final ycbcr_420_allowed
> flag for the connector ends up not being set (i.e. the case of having at
> least one non-HDMI bridge in the pipeline that didn't enable it).
> 
> Fixes: 3ced1c687512 ("drm/display: bridge_connector: handle ycbcr_420_allowed")
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
> Changes in v2:
> - Wrapped HDMI_COLORSPACE_YUV420 flag in the BIT() macro to properly
>   check its presence in supported_formats
> - Ensured YUV420 gets removed from the bitmask passed to
>   drmm_connector_hdmi_init() when ycbcr_420_allowed is not set
> - Link to v1: https://lore.kernel.org/r/20241130-bridge-conn-fmt-prio-v1-1-146b663f17f3@collabora.com
> ---
>  drivers/gpu/drm/display/drm_bridge_connector.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
> index 320c297008aaa8b6ef5b1f4c71928849b202e8ac..1f05278b8683a25a845f943720c76faeed24c2e2 100644
> --- a/drivers/gpu/drm/display/drm_bridge_connector.c
> +++ b/drivers/gpu/drm/display/drm_bridge_connector.c
> @@ -414,7 +414,7 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
>  	drm_for_each_bridge_in_chain(encoder, bridge) {
>  		if (!bridge->interlace_allowed)
>  			connector->interlace_allowed = false;
> -		if (!bridge->ycbcr_420_allowed)
> +		if (!bridge->ycbcr_420_allowed && !(bridge->ops & DRM_BRIDGE_OP_HDMI))
>  			connector->ycbcr_420_allowed = false;
>  
>  		if (bridge->ops & DRM_BRIDGE_OP_EDID)
> @@ -436,6 +436,10 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
>  
>  			if (bridge->supported_formats)
>  				supported_formats = bridge->supported_formats;
> +
> +			if (!(bridge->supported_formats & BIT(HDMI_COLORSPACE_YUV420)))
> +				connector->ycbcr_420_allowed = false;
> +
>  			if (bridge->max_bpc)
>  				max_bpc = bridge->max_bpc;
>  		}
> @@ -459,7 +463,10 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
>  	if (connector_type == DRM_MODE_CONNECTOR_Unknown)
>  		return ERR_PTR(-EINVAL);
>  
> -	if (bridge_connector->bridge_hdmi)
> +	if (bridge_connector->bridge_hdmi) {
> +		if (!connector->ycbcr_420_allowed)
> +			supported_formats &= ~BIT(HDMI_COLORSPACE_YUV420);
> +
>  		ret = drmm_connector_hdmi_init(drm, connector,
>  					       bridge_connector->bridge_hdmi->vendor,
>  					       bridge_connector->bridge_hdmi->product,
> @@ -468,10 +475,11 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
>  					       connector_type, ddc,
>  					       supported_formats,
>  					       max_bpc);
> -	else
> +	} else {
>  		ret = drmm_connector_init(drm, connector,
>  					  &drm_bridge_connector_funcs,
>  					  connector_type, ddc);
> +	}
>  	if (ret)
>  		return ERR_PTR(ret);
>  
> 
> ---
> base-commit: f486c8aa16b8172f63bddc70116a0c897a7f3f02
> change-id: 20241130-bridge-conn-fmt-prio-c517c1407ed5
> 

-- 
With best wishes
Dmitry
