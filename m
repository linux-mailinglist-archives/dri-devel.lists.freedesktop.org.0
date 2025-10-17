Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6808DBE8D7C
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 15:29:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ADC510EBF4;
	Fri, 17 Oct 2025 13:29:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="TTe1uvtP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3396B10EBF4
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 13:29:18 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-63c444fe704so250631a12.1
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 06:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1760707757; x=1761312557; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fET2hkrSNswYRbNxi6KN02Ke+wf0IlqXuVRnwWg4juA=;
 b=TTe1uvtPAEnWjjn49EKS/tE39/WNrh/FHJ47wKnSwAHwT1+EHLmfcc4uuH+43BjJpc
 I0ueo3cVf628YFlzv07iEp+k5wO5aFFDiRbtpfwcQxsJmeMJbeoy35PWxyf+RDVHLSNw
 fmr8tCUvlhTiLftDmHtFcxlA96+QzxxgNqTq8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760707757; x=1761312557;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fET2hkrSNswYRbNxi6KN02Ke+wf0IlqXuVRnwWg4juA=;
 b=am2MjLZlcpcYkCuanPCuumEfFx8MIPAsiuud212VfUZ6TnThFBD5bZ6DgzFOXIQl8p
 WV9/sho5HBU7Opew5wSCcNK+xJ+UxfudnTehu3UxWvkoP5Vr9Yi9A1P6wMtyUXOgoXMD
 fViagOY25e8INpevfs8iJswwMujQK2dArDW1UF8iOy21EeBJaNbsKXIHGs0v61YsvvV5
 0y/NdK0h0nf3gd7sPkvrF/mOTy0BbdGj4cxwPtfUTAdo0GfjZRT2vLoTBFoc9rwH/E1h
 sOnFflVdQnKDa6QSxsZ81eoak7/VyyaMmLFVc6A2XXyrnI+v/fUVAkuN9TXw32m/RRNr
 bOnw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRFcR/N+699abUgnmWXrCQN+htpC/wKXlS+3ztZiYwkOwYq0EXVc30qc4CBIpto5ZN3VGWN47P4sg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzYn+In7huWU+PpBy1HozDI1l1Z0SE0A9awCjyhAgpA9IuuEgmd
 6UfYEbvAHof98Y28LrRBkPyggcxlisWkjRePcbnwg0tGLJynUq3j32d1fGFLygIEpLw=
X-Gm-Gg: ASbGncvh1WKIRJIqrwrJPmkn5/GhfRvCLqH1KUM2YCik0gB/+QP9nfpqneFf0PMpI/E
 zrZnnHKsdnDxqh3ye6yImk8u8dlIR1Crpk8UEUApXm3/gNyknxAgDw9qYcpmTgJ7VRS4aAMSEpl
 kMTe1EUGsZVleb3iwJEQy9oAg44gWCNbDNz6xiwhllwviT6qk6KlJOpkZidnIHkiuIJ8Sts4lu4
 I85hguPkMrZ6jyDOE7KhA0hc+bjFFa1Ttz3IrAmd++dbif8xu9B3qiD0qApL4dRvNEWVi71h34p
 tvqTy238+v3oSjglRT5xKTvKhtAS664gG1U4AWKgf2joyN1R2h5OhRaHabXBG55XHhrhrxZDSDC
 7hm4BZCYNbt68xTX2JNjkUp+YzZWLZemzOOKKen95N6MTNW4j6eiTOQ1Tvamg+LT/HQTXZ/jNjM
 WC6NyA01NU15c=
X-Google-Smtp-Source: AGHT+IGC0waoIIokthDkcGRnbTZDBEhB0/+m+SeCSjAI8kt0udo5OAvlv2YDFKlF0a/DkvjLbTH2NQ==
X-Received: by 2002:a05:6402:34c5:b0:63c:1e15:b9fb with SMTP id
 4fb4d7f45d1cf-63c1f6b4d28mr3703786a12.22.1760707756440; 
 Fri, 17 Oct 2025 06:29:16 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-63a5235e7ebsm18437185a12.1.2025.10.17.06.29.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Oct 2025 06:29:15 -0700 (PDT)
Date: Fri, 17 Oct 2025 15:29:11 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jyri Sarha <jyri.sarha@iki.fi>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Devarsh Thakkar <devarsht@ti.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 10/29] drm/atomic: Add atomic_state_readout infrastructure
Message-ID: <aPJEp50rf2u6VrqB@phenom.ffwll.local>
Mail-Followup-To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jyri Sarha <jyri.sarha@iki.fi>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Devarsh Thakkar <devarsht@ti.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250902-drm-state-readout-v1-0-14ad5315da3f@kernel.org>
 <20250902-drm-state-readout-v1-10-14ad5315da3f@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250902-drm-state-readout-v1-10-14ad5315da3f@kernel.org>
X-Operating-System: Linux phenom 6.12.38+deb13-amd64 
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

On Tue, Sep 02, 2025 at 10:32:38AM +0200, Maxime Ripard wrote:
> In order to enable drivers to fill their initial state from the hardware
> state, we need to provide an alternative atomic_reset helper.
> 
> This helper relies on each state having its own atomic_state_readout()
> hooks. Each component will thus be able to fill the initial state based
> on what they can figure out from the hardware.
> 
> It also allocates a dummy drm_atomic_state to glue the whole thing
> together so atomic_state_readout implementations can still figure out
> the state of other related entities.
> 
> Link: https://lore.kernel.org/dri-devel/CAKMK7uHtqHy_oz4W7F+hmp9iqp7W5Ra8CxPvJ=9BwmvfU-O0gg@mail.gmail.com/
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

First reply more covering your code logic, 2nd one with more the design
questions you've raised on irc.

> +/**
> + * drm_atomic_build_readout_state - Creates an initial state from the hardware
> + * @dev: DRM device to build the state for
> + *
> + * This function allocates a &struct drm_atomic_state, calls the
> + * atomic_readout_state callbacks, and fills the global state old states
> + * by what the callbacks returned.
> + *
> + * Returns:
> + *
> + * A partially initialized &struct drm_atomic_state on success, an error
> + * pointer otherwise.
> + */
> +static struct drm_atomic_state *
> +drm_atomic_build_readout_state(struct drm_device *dev)
> +{
> +	struct drm_connector_list_iter conn_iter;
> +	struct drm_atomic_state *state;
> +	struct drm_mode_config *config =
> +		&dev->mode_config;
> +	struct drm_connector *connector;
> +	struct drm_printer p =
> +		drm_info_printer(dev->dev);
> +	struct drm_encoder *encoder;
> +	struct drm_plane *plane;
> +	struct drm_crtc *crtc;
> +	int ret;
> +
> +	drm_dbg_kms(dev, "Starting to build atomic state from hardware state.\n");
> +
> +	state = drm_atomic_state_alloc(dev);
> +	if (WARN_ON(!state))
> +		return ERR_PTR(-ENOMEM);
> +
> +	state->connectors = kcalloc(config->num_connector, sizeof(*state->connectors), GFP_KERNEL);
> +	if (WARN_ON(!state->connectors)) {
> +		ret = -ENOMEM;
> +		goto err_state_put;
> +	}
> +
> +	state->private_objs = kcalloc(count_private_obj(dev), sizeof(*state->private_objs), GFP_KERNEL);
> +	if (WARN_ON(!state->private_objs)) {
> +		ret = -ENOMEM;
> +		goto err_state_put;
> +	}
> +
> +	drm_for_each_crtc(crtc, dev) {
> +		const struct drm_crtc_funcs *crtc_funcs =
> +			crtc->funcs;
> +		struct drm_crtc_state *crtc_state;
> +
> +		drm_dbg_kms(dev, "Initializing CRTC %s state.\n", crtc->name);
> +
> +		if (crtc_funcs->atomic_readout_state) {
> +			crtc_state = crtc_funcs->atomic_readout_state(crtc);
> +		} else if (crtc_funcs->reset) {

I'm very cautious about this fallback to existing hooks. I'm assuming this
is to make rolling out fastboot support easier, and often resetting planes
or similar gets you there faster. But:

- Resetting planes (which is about the only case where I think just using
  ->reset makes sense) means you break the boot-splash, which isn't great.
  It means you can avoid the modeset, but you're still flickering.

- Experience from atomic support and converting existing driver suggests
  this will be more pain than benefits. I've tried that there, felt like a
  great idea, mostly people complained that it made the conversion brittle
  for not much gain.

If you do decide fallback for a specific driver it's pretty easy to
implement reset without flickering by doing what i915 does for cases where
trying to capture the full state is too much work:

- You have some fastboot taint flags in your states that you set when
  stuff is on, but in an undefined way. You only try to figure out as much
  as you need to have all the knowledge about resources that are in use
  (like clocks).

- Upon first modeset you force a modeset on any crtc with such flagged
  states. You also put your hw reset code into a special path in your
  atomic_disable callback.

- The state compare function also short-circuits comparison for state
  that's not faithfully read out when such a flag is set.

This way you get flicker-free boot-up (if your boot-splash renders the
same image as your fw/bootloader, which at least on x86/acpi is doable
with fw calls to the right image), and it's still fairly clean fastboot
modeset overall.

Cheers, Sima

> +			crtc_funcs->reset(crtc);
> +
> +			/*
> +			 * We don't want to set crtc->state field yet. Let's save and clear it up.
> +			 */
> +			crtc_state = crtc->state;
> +			crtc->state = NULL;
> +		} else {
> +			drm_warn(dev, "No CRTC readout or reset implementation.");
> +			continue;
> +		}
> +
> +		if (WARN_ON(IS_ERR(crtc_state))) {
> +			ret = PTR_ERR(crtc_state);
> +			goto err_state_put;
> +		}
> +
> +		drm_atomic_set_old_crtc_state(state, crtc, crtc_state);
> +	}
> +
> +	drm_connector_list_iter_begin(dev, &conn_iter);
> +	drm_for_each_connector_iter(connector, &conn_iter) {
> +		const struct drm_connector_funcs *conn_funcs =
> +			connector->funcs;
> +		struct drm_connector_state *conn_state;
> +
> +		drm_dbg_kms(dev, "Initializing Connector %s state.\n", connector->name);
> +
> +		if (conn_funcs->atomic_readout_state) {
> +			conn_state = conn_funcs->atomic_readout_state(connector, state);
> +		} else if (conn_funcs->reset) {
> +			conn_funcs->reset(connector);
> +
> +			/*
> +			 * We don't want to set connector->state field yet. Let's save and clear it
> +			 * up.
> +			 */
> +			conn_state = connector->state;
> +			connector->state = NULL;
> +		} else {
> +			drm_warn(dev, "No Connector readout or reset implementation.");
> +			continue;
> +		}
> +
> +		if (WARN_ON(IS_ERR(conn_state))) {
> +			ret = PTR_ERR(conn_state);
> +			goto err_state_put;
> +		}
> +
> +		drm_atomic_set_old_connector_state(state, connector, conn_state);
> +	}
> +	drm_connector_list_iter_end(&conn_iter);
> +
> +	WARN_ON(state->num_connector != config->num_connector);
> +
> +	drm_for_each_encoder(encoder, dev) {
> +		struct drm_connector_state *enc_conn_state;
> +		struct drm_crtc_state *enc_crtc_state;
> +		struct drm_bridge *bridge;
> +
> +		/*
> +		 * It works a bit differently for bridges. Because they are
> +		 * using a drm_private_state, and because
> +		 * drm_atomic_private_obj_init() asks for its initial state when
> +		 * initializing, instead of doing it later on through a reset
> +		 * call like the other entities, we can't have reset xor
> +		 * readout.
> +		 *
> +		 * We'll need a mandatory reset to create that initial, blank,
> +		 * state, and then readout will fill that state later on if the
> +		 * driver implements it.
> +		 *
> +		 * This also means we don't need to call the readout state
> +		 * function if we don't have the bridge enabled (ie, if no
> +		 * drm_connector_state->best_encoder points to bridge->encoder,
> +		 * and / or if drm_connector_state->crtc is NULL).
> +		 *
> +		 * In such a case, we would get the blank state reset created
> +		 * during registration.
> +		 */
> +
> +		enc_conn_state = find_connector_state_for_encoder(state, encoder);
> +		if (!enc_conn_state)
> +			continue;
> +
> +		enc_crtc_state = drm_atomic_get_old_crtc_state(state, enc_conn_state->crtc);
> +		if (!enc_crtc_state)
> +			continue;
> +
> +		list_for_each_entry(bridge, &encoder->bridge_chain, chain_node) {
> +			const struct drm_bridge_funcs *bridge_funcs = bridge->funcs;
> +			struct drm_bridge_state *bridge_state;
> +
> +			bridge_state = drm_bridge_get_current_state(bridge);
> +			if (WARN_ON(!bridge_state)) {
> +				ret = -EINVAL;
> +				goto err_state_put;
> +			}
> +
> +			if (bridge_funcs->atomic_readout_state) {
> +				ret = bridge_funcs->atomic_readout_state(bridge,
> +									 bridge_state,
> +									 enc_crtc_state,
> +									 enc_conn_state);
> +				if (WARN_ON(ret))
> +					goto err_state_put;
> +			}
> +
> +			drm_atomic_set_old_bridge_state(state, bridge, bridge_state);
> +		}
> +	}
> +
> +	drm_for_each_plane(plane, dev) {
> +		const struct drm_plane_funcs *plane_funcs =
> +			plane->funcs;
> +		struct drm_plane_state *plane_state;
> +
> +		drm_dbg_kms(dev, "Initializing Plane %s state.\n", plane->name);
> +
> +		if (plane_funcs->atomic_readout_state) {
> +			plane_state = plane_funcs->atomic_readout_state(plane, state);
> +		} else if (plane_funcs->reset) {
> +			plane_funcs->reset(plane);
> +
> +			/*
> +			 * We don't want to set conn->state field yet. Let's save and clear it up.
> +			 */
> +			plane_state = plane->state;
> +			plane->state = NULL;
> +		} else {
> +			drm_warn(dev, "No plane readout or reset implementation.");
> +			continue;
> +		}
> +
> +		if (WARN_ON(IS_ERR(plane_state))) {
> +			ret = PTR_ERR(plane_state);
> +			goto err_state_put;
> +		}
> +
> +		drm_atomic_set_old_plane_state(state, plane, plane_state);
> +	}
> +
> +	drm_atomic_print_old_state(state, &p);
> +
> +	return state;
> +
> +err_state_put:
> +	drm_atomic_state_put(state);
> +	return ERR_PTR(ret);
> +}
> +
> +/**
> + * drm_atomic_helper_readout_state - Builds an initial state from hardware state
> + * @dev: DRM device to build the state for
> + *
> + * This function creates the initial state for all the entities on a
> + * @dev. Drivers can use this as their
> + * &drm_mode_config_helper_funcs.atomic_reset callback to implement
> + * hardware state readout suppport.
> + */
> +void drm_atomic_helper_readout_state(struct drm_device *dev)
> +{
> +	struct drm_atomic_state *state;
> +
> +	state = drm_atomic_build_readout_state(dev);
> +	if (IS_ERR(state))
> +		return;
> +
> +	drm_atomic_helper_install_readout_state(state);
> +	drm_atomic_state_put(state);
> +}
> +EXPORT_SYMBOL(drm_atomic_helper_readout_state);
>  
>  /**
>   * DOC: overview
>   *
>   * This helper library provides implementations of check and commit functions on
> diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
> index 82180760032d3490d63fe83136465d2c26551d08..96d38a49be501a0090457cbe96135f82bb1358b5 100644
> --- a/drivers/gpu/drm/drm_mode_config.c
> +++ b/drivers/gpu/drm/drm_mode_config.c
> @@ -26,10 +26,11 @@
>  #include <drm/drm_drv.h>
>  #include <drm/drm_encoder.h>
>  #include <drm/drm_file.h>
>  #include <drm/drm_framebuffer.h>
>  #include <drm/drm_managed.h>
> +#include <drm/drm_modeset_helper_vtables.h>
>  #include <drm/drm_mode_config.h>
>  #include <drm/drm_modeset_helper_vtables.h>
>  #include <drm/drm_print.h>
>  #include <linux/dma-resv.h>
>  
> diff --git a/include/drm/drm_atomic_helper.h b/include/drm/drm_atomic_helper.h
> index 53382fe93537bbcda9cee8827bc95de9a515efb5..47902a9181727a08581fb808faabe67d92a755cf 100644
> --- a/include/drm/drm_atomic_helper.h
> +++ b/include/drm/drm_atomic_helper.h
> @@ -45,10 +45,11 @@
>  
>  struct drm_atomic_state;
>  struct drm_private_obj;
>  struct drm_private_state;
>  
> +void drm_atomic_helper_readout_state(struct drm_device *dev);
>  int drm_atomic_helper_check_modeset(struct drm_device *dev,
>  				struct drm_atomic_state *state);
>  int drm_atomic_helper_check_wb_connector_state(struct drm_connector *connector,
>  					       struct drm_atomic_state *state);
>  int drm_atomic_helper_check_plane_state(struct drm_plane_state *plane_state,
> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index 8d9d4fd078e72977677fd992d725261232754e3e..15b63053f01869786831936ba28b7efc1e55e2e8 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -490,10 +490,31 @@ struct drm_bridge_funcs {
>  	 * The @atomic_post_disable callback is optional.
>  	 */
>  	void (*atomic_post_disable)(struct drm_bridge *bridge,
>  				    struct drm_atomic_state *state);
>  
> +	/**
> +	 * @atomic_readout_state:
> +	 *
> +	 * Initializes,this bridge atomic state.
> +	 *
> +	 * It's meant to be used by drivers that wants to implement fast
> +	 * / flicker-free boot and allows to initialize the atomic state
> +	 * from the hardware state left by the firmware.
> +	 *
> +	 * It's used at initialization time, so drivers must make sure
> +	 * that the power state is sensible when accessing the hardware.
> +	 *
> +	 * RETURNS:
> +	 *
> +	 * 0 on success, an error code otherwise.
> +	 */
> +	int (*atomic_readout_state)(struct drm_bridge *bridge,
> +				    struct drm_bridge_state *bridge_state,
> +				    struct drm_crtc_state *crtc_state,
> +				    struct drm_connector_state *conn_state);
> +
>  	/**
>  	 * @atomic_duplicate_state:
>  	 *
>  	 * Duplicate the current bridge state object (which is guaranteed to be
>  	 * non-NULL).
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index 8f34f4b8183d83dccd3e820a444fbf74fb6c16f2..f68bd9627c085c6d2463b847aaa245ccc651f27b 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -1464,10 +1464,36 @@ struct drm_connector_funcs {
>  	 * when a connector is being hot-unplugged for drivers that support
>  	 * connector hotplugging (e.g. DisplayPort MST).
>  	 */
>  	void (*destroy)(struct drm_connector *connector);
>  
> +	/**
> +	 * @atomic_readout_state:
> +	 *
> +	 * Allocates, initializes, and returns an atomic state for this
> +	 * connector.
> +	 *
> +	 * It's meant to be used by drivers that wants to implement fast
> +	 * / flicker-free boot and allows to initialize the atomic state
> +	 * from the hardware state left by the firmware.
> +	 *
> +	 * It's used at initialization time, so drivers must make sure
> +	 * that the power state is sensible when accessing the hardware.
> +	 *
> +	 * The drm_atomic_state being passed is not fully filled. Only
> +	 * the CRTC state are there when this hooks is called, and only
> +	 * their old state. The only safe operation one can do on this
> +	 * state in this hook is calling
> +	 * drm_atomic_get_old_crtc_state().
> +	 *
> +	 * RETURNS:
> +	 *
> +	 * An atomic state on success, an error pointer otherwise.
> +	 */
> +	struct drm_connector_state *(*atomic_readout_state)(struct drm_connector *connector,
> +							    struct drm_atomic_state *state);
> +
>  	/**
>  	 * @atomic_duplicate_state:
>  	 *
>  	 * Duplicate the current atomic state for this connector and return it.
>  	 * The core and helpers guarantee that any atomic state duplicated with
> diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
> index caa56e039da2a748cf40ebf45b37158acda439d9..c462bd9b2f7d3ae08e669463717002e5f78122fe 100644
> --- a/include/drm/drm_crtc.h
> +++ b/include/drm/drm_crtc.h
> @@ -613,10 +613,29 @@ struct drm_crtc_funcs {
>  	 * 0 on success or a negative error code on failure.
>  	 */
>  	int (*set_property)(struct drm_crtc *crtc,
>  			    struct drm_property *property, uint64_t val);
>  
> +	/**
> +	 * @atomic_readout_state:
> +	 *
> +	 * Allocates, initializes, and returns an atomic state for this
> +	 * CRTC.
> +	 *
> +	 * It's meant to be used by drivers that wants to implement fast
> +	 * / flicker-free boot and allows to initialize the atomic state
> +	 * from the hardware state left by the firmware.
> +	 *
> +	 * It's used at initialization time, so drivers must make sure
> +	 * that the power state is sensible when accessing the hardware.
> +	 *
> +	 * RETURNS:
> +	 *
> +	 * An atomic state on success, an error pointer otherwise.
> +	 */
> +	struct drm_crtc_state *(*atomic_readout_state)(struct drm_crtc *crtc);
> +
>  	/**
>  	 * @atomic_duplicate_state:
>  	 *
>  	 * Duplicate the current atomic state for this CRTC and return it.
>  	 * The core and helpers guarantee that any atomic state duplicated with
> diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
> index 01479dd94e76a8389a0c9e9d6744400aa2291064..691a267c857a228f674ef02a63fb6d1ff9e379a8 100644
> --- a/include/drm/drm_plane.h
> +++ b/include/drm/drm_plane.h
> @@ -378,10 +378,37 @@ struct drm_plane_funcs {
>  	 * 0 on success or a negative error code on failure.
>  	 */
>  	int (*set_property)(struct drm_plane *plane,
>  			    struct drm_property *property, uint64_t val);
>  
> +	/**
> +	 * @atomic_readout_state:
> +	 *
> +	 * Allocates, initializes, and returns an atomic state for this
> +	 * plane.
> +	 *
> +	 * It's meant to be used by drivers that wants to implement fast
> +	 * / flicker-free boot and allows to initialize the atomic state
> +	 * from the hardware state left by the firmware.
> +	 *
> +	 * It's used at initialization time, so drivers must make sure
> +	 * that the power state is sensible when accessing the hardware.
> +	 *
> +	 * The drm_atomic_state being passed is not fully filled. Only
> +	 * the CRTC and connector states are there when this hooks is
> +	 * called, and only their old state. The only safe operation one
> +	 * can do on this state in this hook is calling
> +	 * drm_atomic_get_old_crtc_state() and
> +	 * drm_atomic_get_old_connector_state().
> +	 *
> +	 * RETURNS:
> +	 *
> +	 * An atomic state on success, an error pointer otherwise.
> +	 */
> +	struct drm_plane_state *(*atomic_readout_state)(struct drm_plane *plane,
> +							struct drm_atomic_state *state);
> +
>  	/**
>  	 * @atomic_duplicate_state:
>  	 *
>  	 * Duplicate the current atomic state for this plane and return it.
>  	 * The core and helpers guarantee that any atomic state duplicated with
> 
> -- 
> 2.50.1
> 

-- 
Simona Vetter
Software Engineer
http://blog.ffwll.ch
