Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 244DEBC5313
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 15:27:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 673AD10E80A;
	Wed,  8 Oct 2025 13:27:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="B30tVejt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97B1010E80A
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Oct 2025 13:27:40 +0000 (UTC)
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3F47519C4;
 Wed,  8 Oct 2025 15:26:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1759929965;
 bh=+jDpXlBGm196RVdxZD2HUvqj1z2+6UEYORkCtuVTM7I=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=B30tVejtpnsn2jgawr7w+k1N1xyO7BUy2viRmO2F5w+7H5+DT8omC5ewm8nhyvs2W
 Y3U4u4zw8LceSm80WOFb2bzQU6APnRsrERwgrQMSjmA3mP8KS7z6h/Oe68VG/xRxRs
 LAHHbY1qT8brB/j4akKwbfj3RLp+zCiOhi6QlgT4=
Message-ID: <d43eeb11-f26b-4f9a-88b2-c0445bfc0402@ideasonboard.com>
Date: Wed, 8 Oct 2025 16:27:36 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/16] drm/atomic-helper: Add private_obj reset helper
To: Maxime Ripard <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
References: <20251008-drm-private-obj-reset-v1-0-805ab43ae65a@kernel.org>
 <20251008-drm-private-obj-reset-v1-3-805ab43ae65a@kernel.org>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <20251008-drm-private-obj-reset-v1-3-805ab43ae65a@kernel.org>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 08/10/2025 15:04, Maxime Ripard wrote:
> Now that we have a reset callback for drm_private_objs, we can provide a
> helper for it.
> 
> It's somewhat different from the other similar helpers though, because
> we definitely expect drm_private_obj to be subclassed. It wouldn't make
> sense for a driver to use it as-is.
> 
> So we can't provide a straight implementation of the reset callback, but
> rather we provide the parts that will deal with the drm_private_obj
> initialization, and we will leave the allocation and initialization of
> the subclass to drivers.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

 Tomi

>  drivers/gpu/drm/drm_atomic_state_helper.c | 24 ++++++++++++++++++++++++
>  include/drm/drm_atomic_state_helper.h     |  3 +++
>  2 files changed, 27 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
> index 7142e163e618ea0d7d9d828e1bd9ff2a6ec0dfeb..f88007fe8dba2e79d5942deec3cfdd7757c1a460 100644
> --- a/drivers/gpu/drm/drm_atomic_state_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_state_helper.c
> @@ -707,10 +707,34 @@ void drm_atomic_helper_connector_destroy_state(struct drm_connector *connector,
>  	__drm_atomic_helper_connector_destroy_state(state);
>  	kfree(state);
>  }
>  EXPORT_SYMBOL(drm_atomic_helper_connector_destroy_state);
>  
> +/**
> + * __drm_atomic_helper_private_obj_reset - reset state on private objects
> + * @obj: private object
> + * @state: new state to initialize
> + *
> + * Initializes the newly allocated @state and assigns it to the
> + * &drm_private_obj->state pointer of @obj, usually required when
> + * initializing the drivers or when called from the
> + * &drm_private_state_funcs.reset hook.
> + *
> + * @obj is assumed to be zeroed.
> + *
> + * This is useful for drivers that use private states.
> + */
> +void __drm_atomic_helper_private_obj_reset(struct drm_private_obj *obj,
> +					   struct drm_private_state *state)
> +{
> +	if (state)
> +		state->obj = obj;
> +
> +	obj->state = state;
> +}
> +EXPORT_SYMBOL(__drm_atomic_helper_private_obj_reset);
> +
>  /**
>   * __drm_atomic_helper_private_obj_duplicate_state - copy atomic private state
>   * @obj: CRTC object
>   * @state: new private object state
>   *
> diff --git a/include/drm/drm_atomic_state_helper.h b/include/drm/drm_atomic_state_helper.h
> index b9740edb26586d58f99a5223902bb8e333ac75a2..150ea227c595eab8c45b106baf09ce5b27a89a5a 100644
> --- a/include/drm/drm_atomic_state_helper.h
> +++ b/include/drm/drm_atomic_state_helper.h
> @@ -82,10 +82,13 @@ struct drm_connector_state *
>  drm_atomic_helper_connector_duplicate_state(struct drm_connector *connector);
>  void
>  __drm_atomic_helper_connector_destroy_state(struct drm_connector_state *state);
>  void drm_atomic_helper_connector_destroy_state(struct drm_connector *connector,
>  					  struct drm_connector_state *state);
> +
> +void __drm_atomic_helper_private_obj_reset(struct drm_private_obj *obj,
> +					   struct drm_private_state *state);
>  void __drm_atomic_helper_private_obj_duplicate_state(struct drm_private_obj *obj,
>  						     struct drm_private_state *state);
>  
>  void __drm_atomic_helper_bridge_duplicate_state(struct drm_bridge *bridge,
>  						struct drm_bridge_state *state);
> 

