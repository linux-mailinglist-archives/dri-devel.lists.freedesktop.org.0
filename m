Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67DE414A8E5
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2020 18:27:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D2916E02A;
	Mon, 27 Jan 2020 17:26:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 044D36E405
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2020 17:26:57 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id z7so12349551wrl.13
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2020 09:26:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=EtF5TM4/UwEOw4p9Ep6CDdO1pYY1vfTp+zcCXzMNi9A=;
 b=F/MbNnOpVUXPZNV5ZcFJ2D/rsmAqestZOoLtbk01IfChndfJZF5lq7idY71qavEaz4
 HgAkyHJ/Zq4NrYDVCZ+zwt4rdE6NbBrHtYIGTLOhi2QjaFziKXS2yirXJ/fHgDZIVtzG
 WPkm27Sv2TZgLuPasxO6nWpxvn+hfzdOsEmd4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=EtF5TM4/UwEOw4p9Ep6CDdO1pYY1vfTp+zcCXzMNi9A=;
 b=VZWng+i9huxhe+3pwNbTS8bHKWZZpONMjAx2VqwhvBcJu4a2aXtC6/ohOZS3lWI65K
 xrAsGGLM17fvuDAf+d24zvmaX3H64CvrB+Bbq+Sesm6DCzXf81lX80IUp+ber8YQlCV2
 kGLoRPd3TWfzXkl7HLDLMktn3fwAJ/VJH9/gXkxGAobSgXNeirRqRU2pBn1AR+HOr1N2
 7nvdda/CLQI3qzvtiNkkK9w/GsAJv8G21Pdv1hGugVKVHbZVJ/7AOXCh3rKN6RllcazL
 viLFb2+K60ebWx7n9Gu8dV/DGNZW26YxwR5Hq5eOM6a3n5kIx1qTEvJXRiZebHBAlFb8
 lt7w==
X-Gm-Message-State: APjAAAVV++GSyQXgbod7gsTyRBhrhjcI+jgAP1+5fE+cNVsTPNRXBcCl
 l/Wzg32bxJ2g8gsO2P4dlDlBOg==
X-Google-Smtp-Source: APXvYqwjDA9yGc5h9FzOt1JUwJycie3JQmOBgPryx5XCNQq/k4RCYCVDCg+79ySpHTPxK/zjNGGFfA==
X-Received: by 2002:adf:fc08:: with SMTP id i8mr22616457wrr.82.1580146015397; 
 Mon, 27 Jan 2020 09:26:55 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id m7sm19302692wma.39.2020.01.27.09.26.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jan 2020 09:26:54 -0800 (PST)
Date: Mon, 27 Jan 2020 18:26:52 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v9 01/12] drm/bridge: Add a drm_bridge_state object
Message-ID: <20200127172652.GB43062@phenom.ffwll.local>
References: <20200127110043.2731697-1-boris.brezillon@collabora.com>
 <20200127110043.2731697-2-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200127110043.2731697-2-boris.brezillon@collabora.com>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
Cc: Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
 Mark Rutland <mark.rutland@arm.com>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 intel-gfx-trybot@lists.freedesktop.org, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 devicetree@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 kernel@collabora.com, Sam Ravnborg <sam@ravnborg.org>,
 Chris Healy <cphealy@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 27, 2020 at 12:00:32PM +0100, Boris Brezillon wrote:
> One of the last remaining objects to not have its atomic state.
> 
> This is being motivated by our attempt to support runtime bus-format
> negotiation between elements of the bridge chain.
> This patch just paves the road for such a feature by adding a new
> drm_bridge_state object inheriting from drm_private_obj so we can
> re-use some of the existing state initialization/tracking logic.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
> Changes in v9:
> * Clarify the fact that the bridge->atomic_reset() and
>   {connector,plane,crtc,...}->reset() semantics are different
> * Move the drm_atomic_private_obj_init() call back to
>   drm_bridge_attach()
> * Check the presence of ->atomic_duplicate_state instead of
>   ->atomic_reset in drm_atomic_add_encoder_bridges()
> * Fix copy&paste errors in the atomic bridge state helpers doc
> * Add A-b/R-b tags
> 
> Changes in v8:
> * Move bridge state helpers out of the CONFIG_DEBUGFS section
> 
> Changes in v7:
> * Move helpers, struct-defs, ... to atomic helper files to avoid the
>   drm -> drm_kms_helper -> drm circular dep
> * Stop providing default implementation for atomic state reset,
>   duplicate and destroy hooks (has to do with the helper/core split)
> * Drop all R-b/T-b as helpers have now be moved to other places

^^ we generally keep the changelog when committing in drm, since it
contains useful stuff. If you don't want to do that, then at least update
the commit message to make sure all the design discussion is reflected in
there somewhere. Which atm it definitely isn't.
-Daniel

> ---
>  drivers/gpu/drm/drm_atomic.c              | 116 ++++++++++++++++++++++
>  drivers/gpu/drm/drm_atomic_helper.c       |  20 ++++
>  drivers/gpu/drm/drm_atomic_state_helper.c | 103 +++++++++++++++++++
>  drivers/gpu/drm/drm_bridge.c              |  59 ++++++++++-
>  include/drm/drm_atomic.h                  |  34 +++++++
>  include/drm/drm_atomic_state_helper.h     |  13 +++
>  include/drm/drm_bridge.h                  |  60 +++++++++++
>  7 files changed, 400 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index d33691512a8e..65c46ed049c5 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@ -30,6 +30,7 @@
>  
>  #include <drm/drm_atomic.h>
>  #include <drm/drm_atomic_uapi.h>
> +#include <drm/drm_bridge.h>
>  #include <drm/drm_debugfs.h>
>  #include <drm/drm_device.h>
>  #include <drm/drm_drv.h>
> @@ -1017,6 +1018,121 @@ static void drm_atomic_connector_print_state(struct drm_printer *p,
>  		connector->funcs->atomic_print_state(p, state);
>  }
>  
> +/**
> + * drm_atomic_get_bridge_state - get bridge state
> + * @state: global atomic state object
> + * @bridge: bridge to get state object for
> + *
> + * This function returns the bridge state for the given bridge, allocating it
> + * if needed. It will also grab the relevant bridge lock to make sure that the
> + * state is consistent.
> + *
> + * Returns:
> + *
> + * Either the allocated state or the error code encoded into the pointer. When
> + * the error is EDEADLK then the w/w mutex code has detected a deadlock and the
> + * entire atomic sequence must be restarted.
> + */
> +struct drm_bridge_state *
> +drm_atomic_get_bridge_state(struct drm_atomic_state *state,
> +			    struct drm_bridge *bridge)
> +{
> +	struct drm_private_state *obj_state;
> +
> +	obj_state = drm_atomic_get_private_obj_state(state, &bridge->base);
> +	if (IS_ERR(obj_state))
> +		return ERR_CAST(obj_state);
> +
> +	return drm_priv_to_bridge_state(obj_state);
> +}
> +EXPORT_SYMBOL(drm_atomic_get_bridge_state);
> +
> +/**
> + * drm_atomic_get_old_bridge_state - get old bridge state, if it exists
> + * @state: global atomic state object
> + * @bridge: bridge to grab
> + *
> + * This function returns the old bridge state for the given bridge, or NULL if
> + * the bridge is not part of the global atomic state.
> + */
> +struct drm_bridge_state *
> +drm_atomic_get_old_bridge_state(struct drm_atomic_state *state,
> +				struct drm_bridge *bridge)
> +{
> +	struct drm_private_state *obj_state;
> +
> +	obj_state = drm_atomic_get_old_private_obj_state(state, &bridge->base);
> +	if (!obj_state)
> +		return NULL;
> +
> +	return drm_priv_to_bridge_state(obj_state);
> +}
> +EXPORT_SYMBOL(drm_atomic_get_old_bridge_state);
> +
> +/**
> + * drm_atomic_get_new_bridge_state - get new bridge state, if it exists
> + * @state: global atomic state object
> + * @bridge: bridge to grab
> + *
> + * This function returns the new bridge state for the given bridge, or NULL if
> + * the bridge is not part of the global atomic state.
> + */
> +struct drm_bridge_state *
> +drm_atomic_get_new_bridge_state(struct drm_atomic_state *state,
> +				struct drm_bridge *bridge)
> +{
> +	struct drm_private_state *obj_state;
> +
> +	obj_state = drm_atomic_get_new_private_obj_state(state, &bridge->base);
> +	if (!obj_state)
> +		return NULL;
> +
> +	return drm_priv_to_bridge_state(obj_state);
> +}
> +EXPORT_SYMBOL(drm_atomic_get_new_bridge_state);
> +
> +/**
> + * drm_atomic_add_encoder_bridges - add bridges attached to an encoder
> + * @state: atomic state
> + * @encoder: DRM encoder
> + *
> + * This function adds all bridges attached to @encoder. This is needed to add
> + * bridge states to @state and make them available when
> + * &bridge_funcs.atomic_{check,pre_enable,enable,disable_post_disable}() are
> + * called
> + *
> + * Returns:
> + * 0 on success or can fail with -EDEADLK or -ENOMEM. When the error is EDEADLK
> + * then the w/w mutex code has detected a deadlock and the entire atomic
> + * sequence must be restarted. All other errors are fatal.
> + */
> +int
> +drm_atomic_add_encoder_bridges(struct drm_atomic_state *state,
> +			       struct drm_encoder *encoder)
> +{
> +	struct drm_bridge_state *bridge_state;
> +	struct drm_bridge *bridge;
> +
> +	if (!encoder)
> +		return 0;
> +
> +	DRM_DEBUG_ATOMIC("Adding all bridges for [encoder:%d:%s] to %p\n",
> +			 encoder->base.id, encoder->name, state);
> +
> +	drm_for_each_bridge_in_chain(encoder, bridge) {
> +		/* Skip bridges that don't implement the atomic state hooks. */
> +		if (!bridge->funcs->atomic_duplicate_state)
> +			continue;
> +
> +		bridge_state = drm_atomic_get_bridge_state(state, bridge);
> +		if (IS_ERR(bridge_state))
> +			return PTR_ERR(bridge_state);
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_atomic_add_encoder_bridges);
> +
>  /**
>   * drm_atomic_add_affected_connectors - add connectors for CRTC
>   * @state: atomic state
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> index 4511c2e07bb9..ad8eae98d9e8 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -730,6 +730,26 @@ drm_atomic_helper_check_modeset(struct drm_device *dev,
>  			return ret;
>  	}
>  
> +	/*
> +	 * Iterate over all connectors again, and add all affected bridges to
> +	 * the state.
> +	 */
> +	for_each_oldnew_connector_in_state(state, connector,
> +					   old_connector_state,
> +					   new_connector_state, i) {
> +		struct drm_encoder *encoder;
> +
> +		encoder = old_connector_state->best_encoder;
> +		ret = drm_atomic_add_encoder_bridges(state, encoder);
> +		if (ret)
> +			return ret;
> +
> +		encoder = new_connector_state->best_encoder;
> +		ret = drm_atomic_add_encoder_bridges(state, encoder);
> +		if (ret)
> +			return ret;
> +	}
> +
>  	ret = mode_valid(state);
>  	if (ret)
>  		return ret;
> diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
> index 7cf3cf936547..33141d2cdad4 100644
> --- a/drivers/gpu/drm/drm_atomic_state_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_state_helper.c
> @@ -26,6 +26,7 @@
>  
>  #include <drm/drm_atomic.h>
>  #include <drm/drm_atomic_state_helper.h>
> +#include <drm/drm_bridge.h>
>  #include <drm/drm_connector.h>
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_device.h>
> @@ -551,3 +552,105 @@ void __drm_atomic_helper_private_obj_duplicate_state(struct drm_private_obj *obj
>  	memcpy(state, obj->state, sizeof(*state));
>  }
>  EXPORT_SYMBOL(__drm_atomic_helper_private_obj_duplicate_state);
> +
> +/**
> + * __drm_atomic_helper_bridge_duplicate_state() - Copy atomic bridge state
> + * @bridge: bridge object
> + * @state: atomic bridge state
> + *
> + * Copies atomic state from a bridge's current state and resets inferred values.
> + * This is useful for drivers that subclass the bridge state.
> + */
> +void __drm_atomic_helper_bridge_duplicate_state(struct drm_bridge *bridge,
> +						struct drm_bridge_state *state)
> +{
> +	__drm_atomic_helper_private_obj_duplicate_state(&bridge->base,
> +							&state->base);
> +	state->bridge = bridge;
> +}
> +EXPORT_SYMBOL(__drm_atomic_helper_bridge_duplicate_state);
> +
> +/**
> + * drm_atomic_helper_bridge_duplicate_state() - Duplicate a bridge state object
> + * @bridge: bridge object
> + *
> + * Allocates a new bridge state and initializes it with the current bridge
> + * state values. This helper is meant to be used as a bridge
> + * &drm_bridge_funcs.atomic_duplicate_state hook for bridges that don't
> + * subclass the bridge state.
> + */
> +struct drm_bridge_state *
> +drm_atomic_helper_bridge_duplicate_state(struct drm_bridge *bridge)
> +{
> +	struct drm_bridge_state *new;
> +
> +	if (WARN_ON(!bridge->base.state))
> +		return NULL;
> +
> +	new = kzalloc(sizeof(*new), GFP_KERNEL);
> +	if (new)
> +		__drm_atomic_helper_bridge_duplicate_state(bridge, new);
> +
> +	return new;
> +}
> +EXPORT_SYMBOL(drm_atomic_helper_bridge_duplicate_state);
> +
> +/**
> + * drm_atomic_helper_bridge_destroy_state() - Destroy a bridge state object
> + * @bridge: the bridge this state refers to
> + * @state: bridge state to destroy
> + *
> + * Destroys a bridge state previously created by
> + * &drm_atomic_helper_bridge_reset() or
> + * &drm_atomic_helper_bridge_duplicate_state(). This helper is meant to be
> + * used as a bridge &drm_bridge_funcs.atomic_destroy_state hook for bridges
> + * that don't subclass the bridge state.
> + */
> +void drm_atomic_helper_bridge_destroy_state(struct drm_bridge *bridge,
> +					    struct drm_bridge_state *state)
> +{
> +	kfree(state);
> +}
> +EXPORT_SYMBOL(drm_atomic_helper_bridge_destroy_state);
> +
> +/**
> + * __drm_atomic_helper_bridge_reset() - Initialize a bridge state to its
> + *					default
> + * @bridge: the bridge this state refers to
> + * @state: bridge state to initialize
> + *
> + * Initializes the bridge state to default values. This is meant to be called
> + * by the bridge &drm_bridge_funcs.atomic_reset hook for bridges that subclass
> + * the bridge state.
> + */
> +void __drm_atomic_helper_bridge_reset(struct drm_bridge *bridge,
> +				      struct drm_bridge_state *state)
> +{
> +	memset(state, 0, sizeof(*state));
> +	state->bridge = bridge;
> +}
> +EXPORT_SYMBOL(__drm_atomic_helper_bridge_reset);
> +
> +/**
> + * drm_atomic_helper_bridge_reset() - Allocate and initialize a bridge state
> + *				      to its default
> + * @bridge: the bridge this state refers to
> + * @state: bridge state to initialize
> + *
> + * Allocates the bridge state and initializes it to default values. This helper
> + * is meant to be used as a bridge &drm_bridge_funcs.atomic_reset hook for
> + * bridges that don't subclass the bridge state.
> + */
> +struct drm_bridge_state *
> +drm_atomic_helper_bridge_reset(struct drm_bridge *bridge)
> +{
> +	struct drm_bridge_state *bridge_state;
> +
> +	bridge_state = kzalloc(sizeof(*bridge_state), GFP_KERNEL);
> +	if (!bridge_state)
> +		return ERR_PTR(-ENOMEM);
> +
> +	__drm_atomic_helper_bridge_reset(bridge, bridge_state);
> +	return bridge_state;
> +}
> +EXPORT_SYMBOL(drm_atomic_helper_bridge_reset);
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index c2cf0c90fa26..6b08158ebb7e 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -25,6 +25,7 @@
>  #include <linux/module.h>
>  #include <linux/mutex.h>
>  
> +#include <drm/drm_atomic_state_helper.h>
>  #include <drm/drm_bridge.h>
>  #include <drm/drm_encoder.h>
>  
> @@ -89,6 +90,31 @@ void drm_bridge_remove(struct drm_bridge *bridge)
>  }
>  EXPORT_SYMBOL(drm_bridge_remove);
>  
> +static struct drm_private_state *
> +drm_bridge_atomic_duplicate_priv_state(struct drm_private_obj *obj)
> +{
> +	struct drm_bridge *bridge = drm_priv_to_bridge(obj);
> +	struct drm_bridge_state *state;
> +
> +	state = bridge->funcs->atomic_duplicate_state(bridge);
> +	return state ? &state->base : NULL;
> +}
> +
> +static void
> +drm_bridge_atomic_destroy_priv_state(struct drm_private_obj *obj,
> +				     struct drm_private_state *s)
> +{
> +	struct drm_bridge_state *state = drm_priv_to_bridge_state(s);
> +	struct drm_bridge *bridge = drm_priv_to_bridge(obj);
> +
> +	bridge->funcs->atomic_destroy_state(bridge, state);
> +}
> +
> +static const struct drm_private_state_funcs drm_bridge_priv_state_funcs = {
> +	.atomic_duplicate_state = drm_bridge_atomic_duplicate_priv_state,
> +	.atomic_destroy_state = drm_bridge_atomic_destroy_priv_state,
> +};
> +
>  /**
>   * drm_bridge_attach - attach the bridge to an encoder's chain
>   *
> @@ -135,15 +161,35 @@ int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
>  
>  	if (bridge->funcs->attach) {
>  		ret = bridge->funcs->attach(bridge);
> -		if (ret < 0) {
> -			list_del(&bridge->chain_node);
> -			bridge->dev = NULL;
> -			bridge->encoder = NULL;
> -			return ret;
> +		if (ret < 0)
> +			goto err_reset_bridge;
> +	}
> +
> +	if (bridge->funcs->atomic_reset) {
> +		struct drm_bridge_state *state;
> +
> +		state = bridge->funcs->atomic_reset(bridge);
> +		if (IS_ERR(state)) {
> +			ret = PTR_ERR(state);
> +			goto err_detach_bridge;
>  		}
> +
> +		drm_atomic_private_obj_init(bridge->dev, &bridge->base,
> +					    &state->base,
> +					    &drm_bridge_priv_state_funcs);
>  	}
>  
>  	return 0;
> +
> +err_detach_bridge:
> +	if (bridge->funcs->detach)
> +		bridge->funcs->detach(bridge);
> +
> +err_reset_bridge:
> +	bridge->dev = NULL;
> +	bridge->encoder = NULL;
> +	list_del(&bridge->chain_node);
> +	return ret;
>  }
>  EXPORT_SYMBOL(drm_bridge_attach);
>  
> @@ -155,6 +201,9 @@ void drm_bridge_detach(struct drm_bridge *bridge)
>  	if (WARN_ON(!bridge->dev))
>  		return;
>  
> +	if (bridge->funcs->atomic_reset)
> +		drm_atomic_private_obj_fini(&bridge->base);
> +
>  	if (bridge->funcs->detach)
>  		bridge->funcs->detach(bridge);
>  
> diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
> index 951dfb15c27b..82a888769b3d 100644
> --- a/include/drm/drm_atomic.h
> +++ b/include/drm/drm_atomic.h
> @@ -669,6 +669,9 @@ __drm_atomic_get_current_plane_state(struct drm_atomic_state *state,
>  	return plane->state;
>  }
>  
> +int __must_check
> +drm_atomic_add_encoder_bridges(struct drm_atomic_state *state,
> +			       struct drm_encoder *encoder);
>  int __must_check
>  drm_atomic_add_affected_connectors(struct drm_atomic_state *state,
>  				   struct drm_crtc *crtc);
> @@ -992,4 +995,35 @@ drm_atomic_crtc_effectively_active(const struct drm_crtc_state *state)
>  	return state->active || state->self_refresh_active;
>  }
>  
> +/**
> + * struct drm_bridge_state - Atomic bridge state object
> + */
> +struct drm_bridge_state {
> +	/**
> +	 * @base: inherit from &drm_private_state
> +	 */
> +	struct drm_private_state base;
> +
> +	/**
> +	 * @bridge: the bridge this state refers to
> +	 */
> +	struct drm_bridge *bridge;
> +};
> +
> +static inline struct drm_bridge_state *
> +drm_priv_to_bridge_state(struct drm_private_state *priv)
> +{
> +	return container_of(priv, struct drm_bridge_state, base);
> +}
> +
> +struct drm_bridge_state *
> +drm_atomic_get_bridge_state(struct drm_atomic_state *state,
> +			    struct drm_bridge *bridge);
> +struct drm_bridge_state *
> +drm_atomic_get_old_bridge_state(struct drm_atomic_state *state,
> +				struct drm_bridge *bridge);
> +struct drm_bridge_state *
> +drm_atomic_get_new_bridge_state(struct drm_atomic_state *state,
> +				struct drm_bridge *bridge);
> +
>  #endif /* DRM_ATOMIC_H_ */
> diff --git a/include/drm/drm_atomic_state_helper.h b/include/drm/drm_atomic_state_helper.h
> index 8171dea4cc22..3f8f1d627f7c 100644
> --- a/include/drm/drm_atomic_state_helper.h
> +++ b/include/drm/drm_atomic_state_helper.h
> @@ -26,6 +26,8 @@
>  
>  #include <linux/types.h>
>  
> +struct drm_bridge;
> +struct drm_bridge_state;
>  struct drm_crtc;
>  struct drm_crtc_state;
>  struct drm_plane;
> @@ -80,3 +82,14 @@ void drm_atomic_helper_connector_destroy_state(struct drm_connector *connector,
>  					  struct drm_connector_state *state);
>  void __drm_atomic_helper_private_obj_duplicate_state(struct drm_private_obj *obj,
>  						     struct drm_private_state *state);
> +
> +void __drm_atomic_helper_bridge_duplicate_state(struct drm_bridge *bridge,
> +						struct drm_bridge_state *state);
> +struct drm_bridge_state *
> +drm_atomic_helper_bridge_duplicate_state(struct drm_bridge *bridge);
> +void drm_atomic_helper_bridge_destroy_state(struct drm_bridge *bridge,
> +					    struct drm_bridge_state *state);
> +void __drm_atomic_helper_bridge_reset(struct drm_bridge *bridge,
> +				      struct drm_bridge_state *state);
> +struct drm_bridge_state *
> +drm_atomic_helper_bridge_reset(struct drm_bridge *bridge);
> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index 694e153a7531..8883dcfe63cb 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -25,6 +25,8 @@
>  
>  #include <linux/list.h>
>  #include <linux/ctype.h>
> +
> +#include <drm/drm_atomic.h>
>  #include <drm/drm_encoder.h>
>  #include <drm/drm_mode_object.h>
>  #include <drm/drm_modes.h>
> @@ -338,6 +340,56 @@ struct drm_bridge_funcs {
>  	 */
>  	void (*atomic_post_disable)(struct drm_bridge *bridge,
>  				    struct drm_atomic_state *old_state);
> +
> +	/**
> +	 * @atomic_duplicate_state:
> +	 *
> +	 * Duplicate the current bridge state object (which is guaranteed to be
> +	 * non-NULL).
> +	 *
> +	 * The atomic_duplicate_state() is optional. When not implemented the
> +	 * core allocates a drm_bridge_state object and calls
> +	 * &__drm_atomic_helper_bridge_duplicate_state() to initialize it.
> +	 *
> +	 * RETURNS:
> +	 * A valid drm_bridge_state object or NULL if the allocation fails.
> +	 */
> +	struct drm_bridge_state *(*atomic_duplicate_state)(struct drm_bridge *bridge);
> +
> +	/**
> +	 * @atomic_destroy_state:
> +	 *
> +	 * Destroy a bridge state object previously allocated by
> +	 * &drm_bridge_funcs.atomic_duplicate_state().
> +	 *
> +	 * The atomic_destroy_state hook is optional. When not implemented the
> +	 * core calls kfree() on the state.
> +	 */
> +	void (*atomic_destroy_state)(struct drm_bridge *bridge,
> +				     struct drm_bridge_state *state);
> +
> +	/**
> +	 * @atomic_reset:
> +	 *
> +	 * Reset the bridge to a predefined state (or retrieve its current
> +	 * state) and return a &drm_bridge_state object matching this state.
> +	 * This function is called at attach time.
> +	 *
> +	 * The atomic_reset hook is mandatory if the bridge implements any of
> +	 * the atomic hooks, and should be left unassigned otherwise.
> +	 *
> +	 * Note that the atomic_reset() semantics is not exactly matching the
> +	 * reset() semantics found on other components (connector, plane, ...).
> +	 * 1/ The reset operation happens when the bridge is attached, not when
> +	 *    drm_mode_config_reset() is called
> +	 * 2/ It's meant to be used exclusively on bridges that have been
> +	 *    converted to the ATOMIC API
> +	 *
> +	 * RETURNS:
> +	 * A valid drm_bridge_state object in case of success, an ERR_PTR()
> +	 * giving the reason of the failure otherwise.
> +	 */
> +	struct drm_bridge_state *(*atomic_reset)(struct drm_bridge *bridge);
>  };
>  
>  /**
> @@ -380,6 +432,8 @@ struct drm_bridge_timings {
>   * struct drm_bridge - central DRM bridge control structure
>   */
>  struct drm_bridge {
> +	/** @base: inherit from &drm_private_object */
> +	struct drm_private_obj base;
>  	/** @dev: DRM device this bridge belongs to */
>  	struct drm_device *dev;
>  	/** @encoder: encoder to which this bridge is connected */
> @@ -404,6 +458,12 @@ struct drm_bridge {
>  	void *driver_private;
>  };
>  
> +static inline struct drm_bridge *
> +drm_priv_to_bridge(struct drm_private_obj *priv)
> +{
> +	return container_of(priv, struct drm_bridge, base);
> +}
> +
>  void drm_bridge_add(struct drm_bridge *bridge);
>  void drm_bridge_remove(struct drm_bridge *bridge);
>  struct drm_bridge *of_drm_find_bridge(struct device_node *np);
> -- 
> 2.24.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
