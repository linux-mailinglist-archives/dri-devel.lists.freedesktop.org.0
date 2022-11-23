Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 37BD1636AB1
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 21:16:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA88510E239;
	Wed, 23 Nov 2022 20:16:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com
 [IPv6:2607:f8b0:4864:20::835])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2E1310E239
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 20:16:39 +0000 (UTC)
Received: by mail-qt1-x835.google.com with SMTP id cg5so11955525qtb.12
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 12:16:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=uxGv3kzhxR8ww4pD26mStoo/spKfUXiA9jBRige5czY=;
 b=Y//ZtKSEYVadE93lrav/cQYmX4TGIu3e3q2dKtzGrx+eWs2ufu0BELDuiDB+h9qdl/
 m8+dWiZP6GGFzU/WZpLU6BKkfWjgiVy+8z2nZcqVWxeq/GfsBYvafwMfywkn5E9EJvI6
 dEmzkTU9oqQtz9wstjrxVCHigy+bsxV4WAopk4CcXqbOZSQpQ2C7tQo32tfRGS52walj
 NVOMnjnWW7H1gg4+GAlsSfmHmiXdHFbrtAvFZhGNQ7pfoCviv+3ZdxucbX12Luc/uoAw
 LZy2LJNvu4PkJbxdEuvLwHDrsfA8NoEXMppKo7S6vIkcHJW8Bjyhk1HqlHzrtSmLKwz0
 nPEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uxGv3kzhxR8ww4pD26mStoo/spKfUXiA9jBRige5czY=;
 b=ZeoaTZOGJN0VETaTjk+PICoCxOUwSBA07jTIyH7xleQazv1PyOr06shYXrDV0AC0ui
 9UK0NnQYNHVPMP2GPSEHoCCJSG45N6yebYqIiZwOnXpjT8o2c03Q3P5zqNYiZIGrfXpo
 OyhtDn3TIGDWxOOJSZYl/IZE793lnTwggYydT2jky4vq+nyjeKrWEfAesgVO2O6eS35Q
 VpZnbevgsZklnPZsnUl+5/V9QQYIpKeBwZFxXVGJJUHnDB159odLZL3eibQ+FRkdPbSv
 jLKsc9R+OdfzmtMc0yyqe/4T61FzBYNcWcV+9ut2k6T8NLU+XBSZ16ih2XorjGGGuHNH
 y6qA==
X-Gm-Message-State: ANoB5pkrppspR8G3IG9j9Qb79/e+WpDiJ0uwiYyB1ensJRZPHHaqrFTY
 rMBoffqcXKcP1T4B7JhtuRJmCA==
X-Google-Smtp-Source: AA0mqf7MNNEe2GBZwvZ8RB0O/KW4Ey7Js2tI10zsupO3mDLs9fBqoLvVbTadPEBYXYwA4U14DW6hrw==
X-Received: by 2002:a05:622a:1aa9:b0:3a5:32c8:7825 with SMTP id
 s41-20020a05622a1aa900b003a532c87825mr27939773qtc.486.1669234598760; 
 Wed, 23 Nov 2022 12:16:38 -0800 (PST)
Received: from localhost (200.234.86.34.bc.googleusercontent.com.
 [34.86.234.200]) by smtp.gmail.com with ESMTPSA id
 ca9-20020a05622a1f0900b00398a7c860c2sm10385366qtb.4.2022.11.23.12.16.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Nov 2022 12:16:38 -0800 (PST)
Date: Wed, 23 Nov 2022 20:16:37 +0000
From: Sean Paul <sean@poorly.run>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Subject: Re: [PATCH v7 3/3] drm/bridge: it6505: handle HDCP request
Message-ID: <Y35/pfy0QqP7l4Ru@art_vandelay>
References: <20221123100529.3943662-1-hsinyi@chromium.org>
 <20221123100529.3943662-3-hsinyi@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221123100529.3943662-3-hsinyi@chromium.org>
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
Cc: Allen Chen <allen.chen@ite.com.tw>, linux-kernel@vger.kernel.org,
 Robert Foss <robert.foss@linaro.org>, Douglas Anderson <dianders@chromium.org>,
 Sean Paul <seanpaul@chromium.org>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 23, 2022 at 10:05:29AM +0000, Hsin-Yi Wang wrote:
> it6505 supports HDCP 1.3, but current implementation lacks the update of
> HDCP status through drm_hdcp_update_content_protection().
> 
> it6505 default enables the HDCP. Remove this and only turn on when user
> requests it.
> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Reviewed-by: allen chen <allen.chen@ite.com.tw>
> ---
> v6->v7: remove enable hdcp by default.
> ---
>  drivers/gpu/drm/bridge/ite-it6505.c | 60 +++++++++++++++++++++++++++--
>  1 file changed, 57 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
> index 21a9b8422bda..93626698c31e 100644
> --- a/drivers/gpu/drm/bridge/ite-it6505.c
> +++ b/drivers/gpu/drm/bridge/ite-it6505.c
> @@ -423,6 +423,7 @@ struct it6505 {
>  	struct extcon_dev *extcon;
>  	struct work_struct extcon_wq;
>  	int extcon_state;
> +	struct drm_connector *connector;
>  	enum drm_connector_status connector_status;
>  	enum link_train_status link_state;
>  	struct work_struct link_works;
> @@ -2159,9 +2160,6 @@ static void it6505_link_train_ok(struct it6505 *it6505)
>  		DRM_DEV_DEBUG_DRIVER(dev, "Enable audio!");
>  		it6505_enable_audio(it6505);
>  	}
> -
> -	if (it6505->hdcp_desired)
> -		it6505_start_hdcp(it6505);
>  }
>  
>  static void it6505_link_step_train_process(struct it6505 *it6505)
> @@ -2399,6 +2397,14 @@ static void it6505_irq_hdcp_done(struct it6505 *it6505)
>  
>  	DRM_DEV_DEBUG_DRIVER(dev, "hdcp done interrupt");
>  	it6505->hdcp_status = HDCP_AUTH_DONE;
> +	if (it6505->connector) {
> +		struct drm_device *drm_dev = it6505->connector->dev;
> +
> +		drm_modeset_lock(&drm_dev->mode_config.connection_mutex, NULL);
> +		drm_hdcp_update_content_protection(it6505->connector,
> +						   DRM_MODE_CONTENT_PROTECTION_ENABLED);
> +		drm_modeset_unlock(&drm_dev->mode_config.connection_mutex);
> +	}
>  	it6505_show_hdcp_info(it6505);
>  }
>  
> @@ -2931,6 +2937,7 @@ static void it6505_bridge_atomic_enable(struct drm_bridge *bridge,
>  	if (WARN_ON(!connector))
>  		return;
>  
> +	it6505->connector = connector;
>  	conn_state = drm_atomic_get_new_connector_state(state, connector);
>  
>  	if (WARN_ON(!conn_state))
> @@ -2974,6 +2981,7 @@ static void it6505_bridge_atomic_disable(struct drm_bridge *bridge,
>  
>  	DRM_DEV_DEBUG_DRIVER(dev, "start");
>  
> +	it6505->connector = NULL;
>  	if (it6505->powered) {
>  		it6505_drm_dp_link_set_power(&it6505->aux, &it6505->link,
>  					     DP_SET_POWER_D3);
> @@ -3028,6 +3036,50 @@ static struct edid *it6505_bridge_get_edid(struct drm_bridge *bridge,
>  	return edid;
>  }
>  
> +static int it6505_connector_atomic_check(struct it6505 *it6505,
> +					 struct drm_connector_state *state)
> +{
> +	struct device *dev = &it6505->client->dev;
> +	int cp = state->content_protection;
> +
> +	DRM_DEV_DEBUG_DRIVER(dev, "hdcp connector state:%d, curr hdcp state:%d",
> +			     cp, it6505->hdcp_status);
> +
> +	if (!it6505->hdcp_desired) {
> +		DRM_DEV_DEBUG_DRIVER(dev, "sink not support hdcp");
> +		return 0;
> +	}
> +
> +	if (it6505->hdcp_status == HDCP_AUTH_GOING)
> +		return -EINVAL;
> +
> +	if (cp == DRM_MODE_CONTENT_PROTECTION_UNDESIRED) {
> +		if (it6505->hdcp_status == HDCP_AUTH_DONE)
> +			it6505_stop_hdcp(it6505);

You shouldn't touch the hardware in atomic_check, this should be done in the
commit.

> +	} else if (cp == DRM_MODE_CONTENT_PROTECTION_DESIRED) {
> +		if (it6505->hdcp_status == HDCP_AUTH_IDLE &&
> +		    it6505->link_state == LINK_OK)
> +			it6505_start_hdcp(it6505);

Same here

> +	} else {
> +		if (it6505->hdcp_status == HDCP_AUTH_IDLE) {
> +			DRM_DEV_DEBUG_DRIVER(dev, "invalid to set hdcp enabled");
> +			return -EINVAL;
> +		}
> +	}

In general, I think there are a number of locking and state issues with this
approach. I had pulled all of this logic into a set of helpers [1], but the
patchset has gotten stale on the list. You might consider looking at patches 1-4
to see how the state and locking should be handled to avoid races.

Sean

[1] - https://lore.kernel.org/all/20220411204741.1074308-1-sean@poorly.run/

> +
> +	return 0;
> +}
> +
> +static int it6505_bridge_atomic_check(struct drm_bridge *bridge,
> +				      struct drm_bridge_state *bridge_state,
> +				      struct drm_crtc_state *crtc_state,
> +				      struct drm_connector_state *conn_state)
> +{
> +	struct it6505 *it6505 = bridge_to_it6505(bridge);
> +
> +	return it6505_connector_atomic_check(it6505, conn_state);
> +}
> +
>  static const struct drm_bridge_funcs it6505_bridge_funcs = {
>  	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
>  	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> @@ -3035,6 +3087,7 @@ static const struct drm_bridge_funcs it6505_bridge_funcs = {
>  	.attach = it6505_bridge_attach,
>  	.detach = it6505_bridge_detach,
>  	.mode_valid = it6505_bridge_mode_valid,
> +	.atomic_check = it6505_bridge_atomic_check,
>  	.atomic_enable = it6505_bridge_atomic_enable,
>  	.atomic_disable = it6505_bridge_atomic_disable,
>  	.atomic_pre_enable = it6505_bridge_atomic_pre_enable,
> @@ -3354,6 +3407,7 @@ static int it6505_i2c_probe(struct i2c_client *client,
>  	it6505->bridge.type = DRM_MODE_CONNECTOR_DisplayPort;
>  	it6505->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID |
>  			     DRM_BRIDGE_OP_HPD;
> +	it6505->bridge.support_hdcp = true;
>  	drm_bridge_add(&it6505->bridge);
>  
>  	return 0;
> -- 
> 2.38.1.584.g0f3c55d4c2-goog
> 

-- 
Sean Paul, Software Engineer, Google / Chromium OS
