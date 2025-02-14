Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB8AAA352F0
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 01:33:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13E8110EBC2;
	Fri, 14 Feb 2025 00:33:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="EgsZ8XAF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 010C810EBC0
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 00:33:01 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-5450b91da41so1262216e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 16:33:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739493180; x=1740097980; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=gCJQvmJXiPFh2goOM9jkGtpXIXlz22/vifOcphOgUtE=;
 b=EgsZ8XAFOjRXQ9kvr+iisj27YmJI+spMysT9+Tzu07zoYkgMU5wtPgUPidLQBAqFNT
 5NjWx49rQn84XttbMEU1TCA99jKBz9Acu5X4Og5LJuyPvao4NdeyoAGW34wlKK7AD4Er
 T5CCC4a+88egQrGJLwlhEcBYdno5Vm212WE9QkLiQPfqZJCb7YqdFf9yWmj2FJYW7Y4d
 OxBFr/HP+et8/q7NTnva1d8I8QgMeN9p8OQJz1UNpJnnd4c1T9NXyqvPDIx8l1nliZIQ
 zxvMzXJGkqTbhxOxYEIFurd45JaaQGPtrkab1sacXh06wTwj7zwfVJOFPeLxxzUgOQHk
 esBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739493180; x=1740097980;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gCJQvmJXiPFh2goOM9jkGtpXIXlz22/vifOcphOgUtE=;
 b=FBj986OdiqrClKX86qGL2on66cRtFb0C7rbdlWBsnGPc1EX5P+/uITYFVHdnpPZVkN
 cD8Ajns4BtZknet8fQpgmVROsVyLkuMGpra0qyyR5ev40/9ApdCqnrzC9+EjFmUFGw8f
 R0KiNbh4/YC7csjxf3b0Ya3+cA2gpvFAX52wC7BHn9FMm0K9lY9siRg6TuSJ2lyLb7WJ
 DiVu4Atbjj4fT3lQmSGIF1YgDcPmgLBrOOck9wnCAgU2uNi63iuxeTKKXfKG6GXVwVYV
 fjmoPb2JtuMjdCDe9BZdiPleSRQmACXpC11x7KZqoFZiJ19KBOw0YYXhO3TjdIij853F
 U85w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUITjMxCb8atMSpv1PJnRZLPm+h3e/0hTfIPBjCMFH+MKTdzmfU5GQP34bMXIcf5K4g20GMPmMfJN8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yywcce1LprFx7p8r1hEhdxchzwtQWPgnoL4Isvn38uAdZ0acGoa
 tVHMKXvPw4zb5yDNfv5KePoyzEfnReq6fUayOH+6SjtXl5eJWBPBJbJPHstPi8M=
X-Gm-Gg: ASbGncvbAmNF5BHTWwQmKvEUPxzpG3Pp2W1tn2BX+aY1F+hfw3RFK1FUqKRybZgiCkK
 q87ktm8sevBxYf10mXepfEO9dp6ATGrQ9TnwNR4ENmiYObb2DMf24iBUyE+uAwmE2sNjheWyXbS
 bxzQ7O+zhUUnuGfn4cO++g9ZLXza1a+Tg5wHixdHU/fFeZvLQC72WmvPmbBVyN6d2V9i9CRgFBP
 SESodq7wnKnPoTvfDqta5Ht1GnsAlBkb/l9PgzRamOOBSzJHAHjeZ2IDPmYbuSbnxjFnDJqE0oi
 7aeA3QsubT+JFlbEASIgXb+aNO0dbv8fMhNqh9MW274HwuTcDcebcaSKGZbuglUOZ5nZ84s=
X-Google-Smtp-Source: AGHT+IEfydBKcHof3VEaXy+2/v6L3kM2LOQCgM22hAujPdM+MNRwYuWCbjJn5LEHHlguyNWJRt4mCw==
X-Received: by 2002:ac2:5e77:0:b0:545:9e:bed4 with SMTP id
 2adb3069b0e04-54518166d55mr2546299e87.52.1739493180145; 
 Thu, 13 Feb 2025 16:33:00 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-545284e2817sm26859e87.116.2025.02.13.16.32.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2025 16:32:58 -0800 (PST)
Date: Fri, 14 Feb 2025 02:32:56 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Hermes Wu <Hermes.wu@ite.com.tw>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2 1/3] drm/display: bridge-connector: add DisplayPort
 bridges
Message-ID: <teokrp5lycipuchh6e64tvqabxzzf4ez7epuyrae5ahd7dqnjs@x7vyrjgzth2i>
References: <20250209-dp-hdmi-audio-v2-0-16db6ebf22ff@linaro.org>
 <20250209-dp-hdmi-audio-v2-1-16db6ebf22ff@linaro.org>
 <20250213235745.GA7688@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250213235745.GA7688@pendragon.ideasonboard.com>
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

On Fri, Feb 14, 2025 at 01:57:45AM +0200, Laurent Pinchart wrote:
> Hi Dmitry,
> 
> Thank you for the patch.
> 
> On Sun, Feb 09, 2025 at 03:41:18PM +0200, Dmitry Baryshkov wrote:
> > DRM HDMI Codec framework is useful not only for the HDMI bridges, but
> > also for the DisplayPort bridges. Add new DRM_BRIDGE_OP_DisplayPort
> > define in order to distinguish DP bridges. Create HDMI codec device
> > automatically for DP bridges which have declared audio support.
> > 
> > Note, unlike HDMI devices, which already have a framework to handle HPD
> > notifications in a standard way, DP drivers don't (yet?) have such a
> > framework. As such it is necessary to manually call
> > drm_connector_hdmi_audio_plugged_notify(). This requirement hopefully
> > can be lifted later on, if/when DRM framework gets better DisplayPort
> > ports support in the core layer.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/gpu/drm/display/drm_bridge_connector.c | 66 ++++++++++++++++++++------
> >  include/drm/drm_bridge.h                       | 14 +++++-
> >  2 files changed, 65 insertions(+), 15 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
> > index 30c736fc0067e31a97db242e5b16ea8a5b4cf359..5e031395b801f9a1371dcb4ac09f3da23e4615dd 100644
> > --- a/drivers/gpu/drm/display/drm_bridge_connector.c
> > +++ b/drivers/gpu/drm/display/drm_bridge_connector.c
> > @@ -98,6 +98,13 @@ struct drm_bridge_connector {
> >  	 * HDMI connector infrastructure, if any (see &DRM_BRIDGE_OP_HDMI).
> >  	 */
> >  	struct drm_bridge *bridge_hdmi;
> > +	/**
> > +	 * @bridge_dp:
> > +	 *
> > +	 * The bridge in the chain that implements necessary support for the
> > +	 * DisplayPort connector infrastructure, if any (see &DRM_BRIDGE_OP_DisplayPort).
> > +	 */
> > +	struct drm_bridge *bridge_dp;
> >  };
> >  
> >  #define to_drm_bridge_connector(x) \
> > @@ -496,6 +503,25 @@ static const struct drm_connector_hdmi_audio_funcs drm_bridge_connector_hdmi_aud
> >  	.mute_stream = drm_bridge_connector_audio_mute_stream,
> >  };
> >  
> > +static int drm_bridge_connector_hdmi_audio_init(struct drm_connector *connector,
> > +						struct drm_bridge *bridge)
> > +{
> > +	if (!bridge->hdmi_audio_max_i2s_playback_channels &&
> > +	    !bridge->hdmi_audio_spdif_playback)
> > +		return 0;
> > +
> > +	if (!bridge->funcs->hdmi_audio_prepare ||
> > +	    !bridge->funcs->hdmi_audio_shutdown)
> > +		return -EINVAL;
> > +
> > +	return drm_connector_hdmi_audio_init(connector,
> > +					     bridge->hdmi_audio_dev,
> > +					     &drm_bridge_connector_hdmi_audio_funcs,
> > +					     bridge->hdmi_audio_max_i2s_playback_channels,
> > +					     bridge->hdmi_audio_spdif_playback,
> > +					     bridge->hdmi_audio_dai_port);
> > +}
> > +
> >  /* -----------------------------------------------------------------------------
> >   * Bridge Connector Initialisation
> >   */
> > @@ -564,6 +590,8 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
> >  		if (bridge->ops & DRM_BRIDGE_OP_HDMI) {
> >  			if (bridge_connector->bridge_hdmi)
> >  				return ERR_PTR(-EBUSY);
> > +			if (bridge_connector->bridge_dp)
> > +				return ERR_PTR(-EINVAL);
> >  			if (!bridge->funcs->hdmi_write_infoframe ||
> >  			    !bridge->funcs->hdmi_clear_infoframe)
> >  				return ERR_PTR(-EINVAL);
> > @@ -576,6 +604,16 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
> >  				max_bpc = bridge->max_bpc;
> >  		}
> >  
> > +		if (bridge->ops & DRM_BRIDGE_OP_DisplayPort) {
> > +			if (bridge_connector->bridge_dp)
> > +				return ERR_PTR(-EBUSY);
> > +			if (bridge_connector->bridge_hdmi)
> > +				return ERR_PTR(-EINVAL);
> > +
> > +			bridge_connector->bridge_dp = bridge;
> > +
> > +		}
> > +
> >  		if (!drm_bridge_get_next_bridge(bridge))
> >  			connector_type = bridge->type;
> >  
> > @@ -612,21 +650,21 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
> >  		if (ret)
> >  			return ERR_PTR(ret);
> >  
> > -		if (bridge->hdmi_audio_max_i2s_playback_channels ||
> > -		    bridge->hdmi_audio_spdif_playback) {
> > -			if (!bridge->funcs->hdmi_audio_prepare ||
> > -			    !bridge->funcs->hdmi_audio_shutdown)
> > -				return ERR_PTR(-EINVAL);
> > +		ret = drm_bridge_connector_hdmi_audio_init(connector, bridge);
> > +		if (ret)
> > +			return ERR_PTR(ret);
> > +	} else if (bridge_connector->bridge_dp) {
> > +		bridge = bridge_connector->bridge_dp;
> >  
> > -			ret = drm_connector_hdmi_audio_init(connector,
> > -							    bridge->hdmi_audio_dev,
> > -							    &drm_bridge_connector_hdmi_audio_funcs,
> > -							    bridge->hdmi_audio_max_i2s_playback_channels,
> > -							    bridge->hdmi_audio_spdif_playback,
> > -							    bridge->hdmi_audio_dai_port);
> > -			if (ret)
> > -				return ERR_PTR(ret);
> > -		}
> > +		ret = drmm_connector_init(drm, connector,
> > +					  &drm_bridge_connector_funcs,
> > +					  connector_type, ddc);
> > +		if (ret)
> > +			return ERR_PTR(ret);
> > +
> > +		ret = drm_bridge_connector_hdmi_audio_init(connector, bridge);
> > +		if (ret)
> > +			return ERR_PTR(ret);
> >  	} else {
> >  		ret = drmm_connector_init(drm, connector,
> >  					  &drm_bridge_connector_funcs,
> > diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> > index 496dbbd2ad7edff7f091adfbe62de1e33ef0cf07..40f37444426b1b8ded25da9ba9e2963f18ad6267 100644
> > --- a/include/drm/drm_bridge.h
> > +++ b/include/drm/drm_bridge.h
> > @@ -811,9 +811,21 @@ enum drm_bridge_ops {
> >  	 *
> >  	 * Note: currently there can be at most one bridge in a chain that sets
> >  	 * this bit. This is to simplify corresponding glue code in connector
> > -	 * drivers.
> > +	 * drivers. Having both HDMI and DisplayPort bridges in the same bridge
> > +	 * chain is also not allowed.
> >  	 */
> >  	DRM_BRIDGE_OP_HDMI = BIT(4),
> > +	/**
> > +	 * @DRM_BRIDGE_OP_DisplayPort: The bridge provides DisplayPort connector
> > +	 * operations. Currently this is limited to the optional HDMI codec
> > +	 * support.
> > +	 *
> > +	 * Note: currently there can be at most one bridge in a chain that sets
> > +	 * this bit. This is to simplify corresponding glue code in connector
> > +	 * drivers. Having both HDMI and DisplayPort bridges in the same bridge
> > +	 * chain is also not allowed.
> > +	 */
> > +	DRM_BRIDGE_OP_DisplayPort = BIT(5),
> 
> The OP bits are not supposed to describe tbe type of bridge, but the
> operations it implements. I see quite a bit of duplication between HDMI
> and DisplayPort in this patch. Can we have a single bit named after the
> feature that you want to support ? The bridge_hdmi and bridge_dp fields
> should also be merged into a single one.

In this case these ops actually describe the set of ops implemented by
the bridge. DRM_BRIDGE_OP_HDMI implements hdmi_tmds_char_rate_valid(),
hdmi_write_infoframe(), hdmi_clear_infoframe() and hdmi_audio_*()
callbacks. It is impossible to just use HDMI helpers for any
DRM_MODE_CONNECTOR_HDMIA bridge as they lack required callbacks.
At the same time it is perfectly legic to have a
DRM_MODE_CONNECTOR_HDMIA bridge which doesn't set DRM_BRIDGE_OP_HDMI:
this bridge chain will not use HDMI Connector / HDMI State helpers, but
it should be fine otherwise.

DRM_BRIDGE_OP_DisplayPort bridges currently implement hdmi_audio_*(),
but I have long-term plans for that set of ops.

It is not quite possible to merge bridge_hdmi and bridge_dp fields:
for bridges, which implement DRM_BRIDGE_OP_HDMI, drm_bridge_connector
call various drm_atomic_helper_connector_hdmi_*() functions. For
DisplayPort there is no corresponding functionality (yet).

-- 
With best wishes
Dmitry
