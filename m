Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD316148BB0
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2020 17:15:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 712D972B0E;
	Fri, 24 Jan 2020 16:15:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1789772B0E
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2020 16:15:06 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id z7so2621571wrl.13
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2020 08:15:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:organization:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dIoMhAUvhafLiibTXc16ThIdRD+A0hQT59O1DhGhxlg=;
 b=rTYsLc6OEq99GZ8j9n+TUc/ZwfeAga00BZhYS0eFnFvaA20vyVCAiB5QX9M2u5d7nb
 X+tFuk2IgJlghfSQklPbUlbJJFgTbandlwDIWGk37zLLD5pssSObxqxDHRWKBCLU4s9+
 NafT46iWe1uQA0da8mafNVFCqGv/RFdsjeM/j3WI0lbGtt9UyQnEkiEcpFYLNYgxg+IX
 fSkS3b2LBO3x/tYqUShKuhBskGdd3vKIHwB7Bbtfl+CcPchSdt1MN8An10Q7jBjcpDm2
 O9PkDLKQ7nszXJsjtUhJTwSQ1PGleHqU/PHIRRb1u+3jYEqR69rIMuu6QpecHRCBR1n9
 U1qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=dIoMhAUvhafLiibTXc16ThIdRD+A0hQT59O1DhGhxlg=;
 b=FV1Z5PTt8pS4UbzEPkb4qeugzCvzy3n7hCP7TaSvrDkVwLUW+yWh3yOuJfc1k7LHId
 c8eW85cPBfEJupFkrQSWEq7zXX3AMTbq/FAZzDIgBk7aszPzsivjyYkn9yyxKxAXslpO
 CskEg3jzC2cLTLuBowYHxFOGTRNWnLlVgqBtvNogQEkLS3Z3WCCMqK95spiOANPXiNc0
 serLb527JsamxumMfTXtX6yQiw0TmykKPEbWwwGQ4Sb/e2NSZzLYnpn14wptxLp5F49R
 q0Y4HNWDkSMDnIQqnoUQPZtGht6KsAhQfBVE/kruyVG5Bw3L4UHSgPrejImGS4ge/NER
 dIWQ==
X-Gm-Message-State: APjAAAW5vtcw9pb8lA2bqwQ/2y/oixLTAVFixsNQ36hGwWtkGy4ddaDs
 OzsKnQBoB33yYBUN6q87Dnm3yw==
X-Google-Smtp-Source: APXvYqzKqayd2+2sOYvXVmYeGGcsN8Klse9f/QH8xbzldm3ndEl5cKe9jacgCeYxkAflSEaT1NzXgA==
X-Received: by 2002:adf:df0e:: with SMTP id y14mr4943062wrl.377.1579882504288; 
 Fri, 24 Jan 2020 08:15:04 -0800 (PST)
Received: from [10.1.2.12] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id k13sm7649722wrx.59.2020.01.24.08.15.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Jan 2020 08:15:03 -0800 (PST)
Subject: Re: [PATCH v8 01/12] drm/bridge: Add a drm_bridge_state object
To: Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org
References: <20200123095333.2085810-1-boris.brezillon@collabora.com>
 <20200123095333.2085810-2-boris.brezillon@collabora.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 BSwxi7g3Mu7u5kUByanqHyA=
Organization: Baylibre
Message-ID: <4a03bc5c-9d6c-cfb6-6dc0-71568408999e@baylibre.com>
Date: Fri, 24 Jan 2020 17:15:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200123095333.2085810-2-boris.brezillon@collabora.com>
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
Cc: Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
 Mark Rutland <mark.rutland@arm.com>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Jonas Karlman <jonas@kwiboo.se>, Andrey Smirnov <andrew.smirnov@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Andrzej Hajda <a.hajda@samsung.com>,
 devicetree@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 intel-gfx-trybot@lists.freedesktop.org, kernel@collabora.com,
 Sam Ravnborg <sam@ravnborg.org>, Chris Healy <cphealy@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 23/01/2020 10:53, Boris Brezillon wrote:
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
> ---
> Changes in v8:
> * Move bridge state helpers out of the CONFIG_DEBUGFS section
> 
> Changes in v7:
> * Move helpers, struct-defs, ... to atomic helper files to avoid the
>   drm -> drm_kms_helper -> drm circular dep
> * Stop providing default implementation for atomic state reset,
>   duplicate and destroy hooks (has to do with the helper/core split)
> * Drop all R-b/T-b as helpers have now be moved to other places
> ---
>  drivers/gpu/drm/drm_atomic.c              | 116 +++++++++++++++++++
>  drivers/gpu/drm/drm_atomic_helper.c       |  20 ++++
>  drivers/gpu/drm/drm_atomic_state_helper.c | 131 ++++++++++++++++++++++
>  drivers/gpu/drm/drm_bridge.c              |  29 ++++-
>  include/drm/drm_atomic.h                  |  34 ++++++
>  include/drm/drm_atomic_state_helper.h     |  13 +++
>  include/drm/drm_bridge.h                  |  53 +++++++++
>  7 files changed, 391 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index d33691512a8e..85f8d2218a94 100644
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
> +		if (!bridge->funcs->atomic_reset)
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
> index 7cf3cf936547..dcd0592aa48c 100644
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
> @@ -551,3 +552,133 @@ void __drm_atomic_helper_private_obj_duplicate_state(struct drm_private_obj *obj
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
> + * drm_atomic_helper_bridge_destroy_state() - Duplicate a bridge state object
> + * @bridge: bridge object
> + *
> + * Allocates a new bridge state and initializes it with the current bridge
> + * state values. This helper is meant to be used as a bridge
> + * &drm_plane_funcs.duplicate_state hook for bridges that don't subclass
> + * the bridge state.
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
> + * used as a bridge &drm_plane_funcs.reset hook for bridges that don't subclass
> + * the bridge state.
> + */
> +void drm_atomic_helper_bridge_destroy_state(struct drm_bridge *bridge,
> +					    struct drm_bridge_state *state)
> +{
> +	kfree(state);
> +}
> +EXPORT_SYMBOL(drm_atomic_helper_bridge_destroy_state);
> +
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
> +/**
> + * __drm_atomic_helper_bridge_reset() - Initialize a bridge state to its
> + *					default
> + * @bridge: the bridge this state refers to
> + * @state: bridge state to initialize
> + *
> + * Initializes the bridge state to default values. This is meant to be called
> + * by the bridge &drm_plane_funcs.reset hook for bridges that subclass the
> + * bridge state.
> + */
> +void __drm_atomic_helper_bridge_reset(struct drm_bridge *bridge,
> +				      struct drm_bridge_state *state)
> +{
> +	memset(state, 0, sizeof(*state));
> +	state->bridge = bridge;
> +	drm_atomic_private_obj_init(bridge->dev, &bridge->base,
> +				    &state->base,
> +				    &drm_bridge_priv_state_funcs);
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
> + * is meant to be used as a bridge &drm_plane_funcs.reset hook for bridges that
> + * don't subclass the bridge state.
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
> index c2cf0c90fa26..31d658f7312f 100644
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
> @@ -135,15 +136,31 @@ int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
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
> @@ -155,6 +172,8 @@ void drm_bridge_detach(struct drm_bridge *bridge)
>  	if (WARN_ON(!bridge->dev))
>  		return;
>  
> +	drm_atomic_private_obj_fini(&bridge->base);
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
> index 694e153a7531..3ec37f6d4dff 100644
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
> @@ -338,6 +340,49 @@ struct drm_bridge_funcs {
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
> +	 * The atomic_reset hook is optional. When not implemented the core
> +	 * allocates a new state and calls &__drm_atomic_helper_bridge_reset().
> +	 *
> +	 * RETURNS:
> +	 * A valid drm_bridge_state object in case of success, an ERR_PTR()
> +	 * giving the reason of the failure otherwise.
> +	 */
> +	struct drm_bridge_state *(*atomic_reset)(struct drm_bridge *bridge);
>  };
>  
>  /**
> @@ -380,6 +425,8 @@ struct drm_bridge_timings {
>   * struct drm_bridge - central DRM bridge control structure
>   */
>  struct drm_bridge {
> +	/** @base: inherit from &drm_private_object */
> +	struct drm_private_obj base;
>  	/** @dev: DRM device this bridge belongs to */
>  	struct drm_device *dev;
>  	/** @encoder: encoder to which this bridge is connected */
> @@ -404,6 +451,12 @@ struct drm_bridge {
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
> 

Thanks for solving this !

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

Neil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
