Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E97A10542
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 12:25:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4042210E0E3;
	Tue, 14 Jan 2025 11:25:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Mg88cLt0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F01F10E0E3
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 11:25:17 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-5401c52000fso4569251e87.2
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 03:25:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736853856; x=1737458656; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=hoxvb0VGfvT9PSeGHUYHbLzcK9w24aYghT2+IlGYAEk=;
 b=Mg88cLt0ybTw32qf7cPvxgKDAi7nzVGz8gLlzXm0J/MhRnH5xhjhGImAw9pkVqPZmO
 xDdZJD6amvyp71UIjh4fxPan6g/uGo+5VWJVeLhNQ1yrlLPqjKxx06WaGx6GLM0sirew
 cFdy11jwyP1/BOZsFdHKc/DVuSQ+1md75TPX8tNXGqizL0nAEXZ1m3pr5bnej2LXjpGh
 PqXbke4tr9Z873O4nJkcJFB0fea8z2FBxER7GFag6mh7D6i6xE1pz8hkCn07xypeiOhq
 auNR0CxGJS6n01A9HgIDgmHTC7dDqMCqIY16NiBj5BTisx2CSH5NpCx0k72lxkZ1nNj7
 J1Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736853856; x=1737458656;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hoxvb0VGfvT9PSeGHUYHbLzcK9w24aYghT2+IlGYAEk=;
 b=LdyLg9Nm7UJ+LjlrSWIxSLsBv2LOvakZIjJYspQgy7sH5zogW044ugGbMdxxf7nvcP
 B/U/csnRaTSvcNNp3drqQRnm1SaWkxzBILaTsuVMdXyr61zkPGW2MfiYR696ZdxoDfx6
 e2/8ds7rbvutr6YXXBPk9sSmUfZb2oGNVlJuChxwPZqfr30JZlJ3koqqL5c9nbqoQ/nT
 Z39Y1+peecKjfww6mzOA4svaKh3O3KBcC7g8hyVKezmKUN4XbyGdMB4sHD081NNg6jIw
 VTGaIsz5aL2IRD7xlEkiDLQpvgQ4tgH7XOEAl0iNOq4DngQu4sWInVEjRf6x81Ro8eix
 f01A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNuHaLxtfVcumuobxz9dEhDUDn2to4smoEIupLYVH1hmgdsG0yX66cNGNUT74dmUIVnkTvYa1UBhc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyzBaasPxeLoqS32YwMAqx2SRHP2NL/gq1XqhLHaYDpAfpy74zi
 IsAfJk750Ovi3BGKBwFiDiOR+fsPihYXrSwoINewvTR+BWo/ZEtIEYv0vaoL1Ms=
X-Gm-Gg: ASbGncskGXUHYNN31PM/UE82BmznyAz63GPdVSCSwYrD1Qdh5TurFMt1KcLDtY3SVFB
 PZb11Dh776p2r6KprnVuOumCMBBX0jaBlHMVKDhM7Mf91vAfj90K3VtLXO1dGuUv8XElmwt5Idq
 Mf/OmHEfisNQEQL43quBzBw+IEe2glaBwzLf403RHXB9YV/SHbWYC5oMe9LbleEsGfl5wjBCH5/
 Wpa6lOVfxVS7Wo8CGzBcKHecubx0woFsV6WeNL9JV0d3BN/qWAiuofMUyQ+AyMomGiIs1GEUVd3
 1sgCZ1Qdwupo8DKSfbhInjgA10N0RGUIAFOw
X-Google-Smtp-Source: AGHT+IEoy7oEvCT+N4EcO1KZeFTAaqsmnljYh+Egt53Lqtp/GPyMUbFUmCBPp/JcS5jGMpb8Gj1JMA==
X-Received: by 2002:a05:6512:15a3:b0:542:28a9:dcac with SMTP id
 2adb3069b0e04-542845d84f7mr7545747e87.30.1736853855858; 
 Tue, 14 Jan 2025 03:24:15 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5428becb27csm1639099e87.251.2025.01.14.03.24.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jan 2025 03:24:14 -0800 (PST)
Date: Tue, 14 Jan 2025 13:24:12 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Aradhya Bhatia <aradhya.bhatia@linux.dev>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Nishanth Menon <nm@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Devarsh Thakkar <devarsht@ti.com>, 
 Praneeth Bajjuri <praneeth@ti.com>, Udit Kumar <u-kumar1@ti.com>, 
 Jayesh Choudhary <j-choudhary@ti.com>,
 DRI Development List <dri-devel@lists.freedesktop.org>, 
 Linux Kernel List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 11/12] drm/atomic-helper: Re-order bridge chain
 pre-enable and post-disable
Message-ID: <psce5mzs5kyw76pkb75lmxliddph6b7yob6nunmxy4ne7g7zin@axa67tkcgr5j>
References: <20250114055626.18816-1-aradhya.bhatia@linux.dev>
 <20250114055626.18816-12-aradhya.bhatia@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250114055626.18816-12-aradhya.bhatia@linux.dev>
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

On Tue, Jan 14, 2025 at 11:26:25AM +0530, Aradhya Bhatia wrote:
> Move the bridge pre_enable call before crtc enable, and the bridge
> post_disable call after the crtc disable.
> 
> The sequence of enable after this patch will look like:
> 
> 	bridge[n]_pre_enable
> 	...
> 	bridge[1]_pre_enable
> 
> 	crtc_enable
> 	encoder_enable
> 
> 	bridge[1]_enable
> 	...
> 	bridge[n]_enable
> 
> And, the disable sequence for the display pipeline will look like:
> 
> 	bridge[n]_disable
> 	...
> 	bridge[1]_disable
> 
> 	encoder_disable
> 	crtc_disable
> 
> 	bridge[1]_post_disable
> 	...
> 	bridge[n]_post_disable
> 
> The definition of bridge pre_enable hook says that,
> "The display pipe (i.e. clocks and timing signals) feeding this bridge
> will not yet be running when this callback is called".
> 
> Since CRTC is also a source feeding the bridge, it should not be enabled
> before the bridges in the pipeline are pre_enabled. Fix that by
> re-ordering the sequence of bridge pre_enable and bridge post_disable.

The patch contains both refactoring of the corresponding functions and
changing of the order. Please split it into two separate commits.

> 
> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
> Signed-off-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>
> ---
>  drivers/gpu/drm/drm_atomic_helper.c | 300 +++++++++++++++++-----------
>  1 file changed, 181 insertions(+), 119 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> index 5186d2114a50..ad6290a4a528 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -74,6 +74,12 @@
>   * also shares the &struct drm_plane_helper_funcs function table with the plane
>   * helpers.
>   */
> +
> +enum bridge_chain_operation_type {
> +	DRM_BRIDGE_PRE_ENABLE_OR_POST_DISABLE,
> +	DRM_BRIDGE_ENABLE_OR_DISABLE,
> +};
> +

I have mixed feelings towards this approach. I doubt that it actually
helps. Would you mind replacing it with just 'bool pre_enable' / 'bool
post_disable' arguments?

>  static void
>  drm_atomic_helper_plane_changed(struct drm_atomic_state *state,
>  				struct drm_plane_state *old_plane_state,
> @@ -1122,74 +1128,12 @@ crtc_needs_disable(struct drm_crtc_state *old_state,
>  }
>  
>  static void
> -disable_outputs(struct drm_device *dev, struct drm_atomic_state *old_state)
> +crtc_disable(struct drm_device *dev, struct drm_atomic_state *old_state)
>  {
> -	struct drm_connector *connector;
> -	struct drm_connector_state *old_conn_state, *new_conn_state;
>  	struct drm_crtc *crtc;
>  	struct drm_crtc_state *old_crtc_state, *new_crtc_state;
>  	int i;
>  
> -	for_each_oldnew_connector_in_state(old_state, connector, old_conn_state, new_conn_state, i) {
> -		const struct drm_encoder_helper_funcs *funcs;
> -		struct drm_encoder *encoder;
> -		struct drm_bridge *bridge;
> -
> -		/*
> -		 * Shut down everything that's in the changeset and currently
> -		 * still on. So need to check the old, saved state.
> -		 */
> -		if (!old_conn_state->crtc)
> -			continue;
> -
> -		old_crtc_state = drm_atomic_get_old_crtc_state(old_state, old_conn_state->crtc);
> -
> -		if (new_conn_state->crtc)
> -			new_crtc_state = drm_atomic_get_new_crtc_state(
> -						old_state,
> -						new_conn_state->crtc);
> -		else
> -			new_crtc_state = NULL;
> -
> -		if (!crtc_needs_disable(old_crtc_state, new_crtc_state) ||
> -		    !drm_atomic_crtc_needs_modeset(old_conn_state->crtc->state))
> -			continue;
> -
> -		encoder = old_conn_state->best_encoder;
> -
> -		/* We shouldn't get this far if we didn't previously have
> -		 * an encoder.. but WARN_ON() rather than explode.
> -		 */
> -		if (WARN_ON(!encoder))
> -			continue;
> -
> -		funcs = encoder->helper_private;
> -
> -		drm_dbg_atomic(dev, "disabling [ENCODER:%d:%s]\n",
> -			       encoder->base.id, encoder->name);
> -
> -		/*
> -		 * Each encoder has at most one connector (since we always steal
> -		 * it away), so we won't call disable hooks twice.
> -		 */
> -		bridge = drm_bridge_chain_get_first_bridge(encoder);
> -		drm_atomic_bridge_chain_disable(bridge, old_state);
> -
> -		/* Right function depends upon target state. */
> -		if (funcs) {
> -			if (funcs->atomic_disable)
> -				funcs->atomic_disable(encoder, old_state);
> -			else if (new_conn_state->crtc && funcs->prepare)
> -				funcs->prepare(encoder);
> -			else if (funcs->disable)
> -				funcs->disable(encoder);
> -			else if (funcs->dpms)
> -				funcs->dpms(encoder, DRM_MODE_DPMS_OFF);
> -		}
> -
> -		drm_atomic_bridge_chain_post_disable(bridge, old_state);
> -	}
> -
>  	for_each_oldnew_crtc_in_state(old_state, crtc, old_crtc_state, new_crtc_state, i) {
>  		const struct drm_crtc_helper_funcs *funcs;
>  		int ret;
> @@ -1206,7 +1150,6 @@ disable_outputs(struct drm_device *dev, struct drm_atomic_state *old_state)
>  		drm_dbg_atomic(dev, "disabling [CRTC:%d:%s]\n",
>  			       crtc->base.id, crtc->name);
>  
> -

Irrelevant, please drop.

>  		/* Right function depends upon target state. */
>  		if (new_crtc_state->enable && funcs->prepare)
>  			funcs->prepare(crtc);
> @@ -1236,6 +1179,97 @@ disable_outputs(struct drm_device *dev, struct drm_atomic_state *old_state)
>  	}
>  }
>  
> +static void
> +encoder_bridge_chain_disable(struct drm_device *dev, struct drm_atomic_state *old_state,
> +			     enum bridge_chain_operation_type op_type)
> +{
> +	struct drm_connector *connector;
> +	struct drm_connector_state *old_conn_state, *new_conn_state;
> +	struct drm_crtc_state *old_crtc_state, *new_crtc_state;
> +	int i;
> +
> +	for_each_oldnew_connector_in_state(old_state, connector, old_conn_state, new_conn_state, i) {
> +		const struct drm_encoder_helper_funcs *funcs;
> +		struct drm_encoder *encoder;
> +		struct drm_bridge *bridge;
> +
> +		/*
> +		 * Shut down everything that's in the changeset and currently
> +		 * still on. So need to check the old, saved state.
> +		 */
> +		if (!old_conn_state->crtc)
> +			continue;
> +
> +		old_crtc_state = drm_atomic_get_old_crtc_state(old_state, old_conn_state->crtc);
> +
> +		if (new_conn_state->crtc)
> +			new_crtc_state = drm_atomic_get_new_crtc_state(
> +						old_state,
> +						new_conn_state->crtc);
> +		else
> +			new_crtc_state = NULL;
> +
> +		if (!crtc_needs_disable(old_crtc_state, new_crtc_state) ||
> +		    !drm_atomic_crtc_needs_modeset(old_conn_state->crtc->state))
> +			continue;
> +
> +		encoder = old_conn_state->best_encoder;
> +
> +		/* We shouldn't get this far if we didn't previously have
> +		 * an encoder.. but WARN_ON() rather than explode.
> +		 */
> +		if (WARN_ON(!encoder))
> +			continue;
> +
> +		/*
> +		 * Each encoder has at most one connector (since we always steal
> +		 * it away), so we won't call disable hooks twice.
> +		 */
> +		bridge = drm_bridge_chain_get_first_bridge(encoder);
> +
> +		switch (op_type) {
> +		case DRM_BRIDGE_ENABLE_OR_DISABLE:
> +			funcs = encoder->helper_private;
> +
> +			drm_dbg_atomic(dev, "disabling [ENCODER:%d:%s]\n",
> +				       encoder->base.id, encoder->name);
> +
> +			drm_atomic_bridge_chain_disable(bridge, old_state);
> +
> +			/* Right function depends upon target state. */
> +			if (funcs) {
> +				if (funcs->atomic_disable)
> +					funcs->atomic_disable(encoder, old_state);
> +				else if (new_conn_state->crtc && funcs->prepare)
> +					funcs->prepare(encoder);
> +				else if (funcs->disable)
> +					funcs->disable(encoder);
> +				else if (funcs->dpms)
> +					funcs->dpms(encoder, DRM_MODE_DPMS_OFF);
> +			}
> +
> +			break;
> +
> +		case DRM_BRIDGE_PRE_ENABLE_OR_POST_DISABLE:
> +			drm_atomic_bridge_chain_post_disable(bridge, old_state);
> +			break;
> +
> +		default:
> +			drm_err(dev, "Unrecognized Encoder/Bridge operation (%d).\n", op_type);
> +		}
> +	}
> +}
> +
> +static void
> +disable_outputs(struct drm_device *dev, struct drm_atomic_state *old_state)
> +{
> +	encoder_bridge_chain_disable(dev, old_state, DRM_BRIDGE_ENABLE_OR_DISABLE);
> +
> +	crtc_disable(dev, old_state);
> +
> +	encoder_bridge_chain_disable(dev, old_state, DRM_BRIDGE_PRE_ENABLE_OR_POST_DISABLE);
> +}
> +
>  /**
>   * drm_atomic_helper_update_legacy_modeset_state - update legacy modeset state
>   * @dev: DRM device
> @@ -1445,28 +1479,69 @@ static void drm_atomic_helper_commit_writebacks(struct drm_device *dev,
>  	}
>  }
>  
> -/**
> - * drm_atomic_helper_commit_modeset_enables - modeset commit to enable outputs
> - * @dev: DRM device
> - * @old_state: atomic state object with old state structures
> - *
> - * This function enables all the outputs with the new configuration which had to
> - * be turned off for the update.
> - *
> - * For compatibility with legacy CRTC helpers this should be called after
> - * drm_atomic_helper_commit_planes(), which is what the default commit function
> - * does. But drivers with different needs can group the modeset commits together
> - * and do the plane commits at the end. This is useful for drivers doing runtime
> - * PM since planes updates then only happen when the CRTC is actually enabled.
> - */
> -void drm_atomic_helper_commit_modeset_enables(struct drm_device *dev,
> -					      struct drm_atomic_state *old_state)
> +static void
> +encoder_bridge_chain_enable(struct drm_device *dev, struct drm_atomic_state *old_state,
> +			    enum bridge_chain_operation_type op_type)
> +{
> +	struct drm_connector *connector;
> +	struct drm_connector_state *new_conn_state;
> +	int i;
> +
> +	for_each_new_connector_in_state(old_state, connector, new_conn_state, i) {
> +		const struct drm_encoder_helper_funcs *funcs;
> +		struct drm_encoder *encoder;
> +		struct drm_bridge *bridge;
> +
> +		if (!new_conn_state->best_encoder)
> +			continue;
> +
> +		if (!new_conn_state->crtc->state->active ||
> +		    !drm_atomic_crtc_needs_modeset(new_conn_state->crtc->state))
> +			continue;
> +
> +		encoder = new_conn_state->best_encoder;
> +		/*
> +		 * Each encoder has at most one connector (since we always steal
> +		 * it away), so we won't call enable hooks twice.
> +		 */
> +		bridge = drm_bridge_chain_get_first_bridge(encoder);
> +
> +		switch (op_type) {
> +		case DRM_BRIDGE_PRE_ENABLE_OR_POST_DISABLE:
> +			drm_atomic_bridge_chain_pre_enable(bridge, old_state);
> +			break;
> +
> +		case DRM_BRIDGE_ENABLE_OR_DISABLE:
> +			funcs = encoder->helper_private;
> +
> +			drm_dbg_atomic(dev, "enabling [ENCODER:%d:%s]\n",
> +				       encoder->base.id, encoder->name);
> +
> +			if (funcs) {
> +				if (funcs->atomic_enable)
> +					funcs->atomic_enable(encoder, old_state);
> +				else if (funcs->enable)
> +					funcs->enable(encoder);
> +				else if (funcs->commit)
> +					funcs->commit(encoder);
> +			}
> +
> +			drm_atomic_bridge_chain_enable(bridge, old_state);
> +			break;
> +
> +		default:
> +			drm_err(dev, "Unrecognized Encoder/Bridge Operation (%d).\n", op_type);
> +			break;
> +		}
> +	}
> +}
> +
> +static void
> +crtc_enable(struct drm_device *dev, struct drm_atomic_state *old_state)
>  {
>  	struct drm_crtc *crtc;
>  	struct drm_crtc_state *old_crtc_state;
>  	struct drm_crtc_state *new_crtc_state;
> -	struct drm_connector *connector;
> -	struct drm_connector_state *new_conn_state;
>  	int i;
>  
>  	for_each_oldnew_crtc_in_state(old_state, crtc, old_crtc_state, new_crtc_state, i) {
> @@ -1490,43 +1565,30 @@ void drm_atomic_helper_commit_modeset_enables(struct drm_device *dev,
>  				funcs->commit(crtc);
>  		}
>  	}
> -
> -	for_each_new_connector_in_state(old_state, connector, new_conn_state, i) {
> -		const struct drm_encoder_helper_funcs *funcs;
> -		struct drm_encoder *encoder;
> -		struct drm_bridge *bridge;
> -
> -		if (!new_conn_state->best_encoder)
> -			continue;
> -
> -		if (!new_conn_state->crtc->state->active ||
> -		    !drm_atomic_crtc_needs_modeset(new_conn_state->crtc->state))
> -			continue;
> -
> -		encoder = new_conn_state->best_encoder;
> -		funcs = encoder->helper_private;
> -
> -		drm_dbg_atomic(dev, "enabling [ENCODER:%d:%s]\n",
> -			       encoder->base.id, encoder->name);
> -
> -		/*
> -		 * Each encoder has at most one connector (since we always steal
> -		 * it away), so we won't call enable hooks twice.
> -		 */
> -		bridge = drm_bridge_chain_get_first_bridge(encoder);
> -		drm_atomic_bridge_chain_pre_enable(bridge, old_state);
> -
> -		if (funcs) {
> -			if (funcs->atomic_enable)
> -				funcs->atomic_enable(encoder, old_state);
> -			else if (funcs->enable)
> -				funcs->enable(encoder);
> -			else if (funcs->commit)
> -				funcs->commit(encoder);
> -		}
> -
> -		drm_atomic_bridge_chain_enable(bridge, old_state);
> -	}
> +}
> +
> +/**
> + * drm_atomic_helper_commit_modeset_enables - modeset commit to enable outputs
> + * @dev: DRM device
> + * @old_state: atomic state object with old state structures
> + *
> + * This function enables all the outputs with the new configuration which had to
> + * be turned off for the update.
> + *
> + * For compatibility with legacy CRTC helpers this should be called after
> + * drm_atomic_helper_commit_planes(), which is what the default commit function
> + * does. But drivers with different needs can group the modeset commits together
> + * and do the plane commits at the end. This is useful for drivers doing runtime
> + * PM since planes updates then only happen when the CRTC is actually enabled.
> + */
> +void drm_atomic_helper_commit_modeset_enables(struct drm_device *dev,
> +					      struct drm_atomic_state *old_state)
> +{
> +	encoder_bridge_chain_enable(dev, old_state, DRM_BRIDGE_PRE_ENABLE_OR_POST_DISABLE);
> +
> +	crtc_enable(dev, old_state);
> +
> +	encoder_bridge_chain_enable(dev, old_state, DRM_BRIDGE_ENABLE_OR_DISABLE);
>  
>  	drm_atomic_helper_commit_writebacks(dev, old_state);
>  }
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
