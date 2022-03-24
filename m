Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36CEB4E678E
	for <lists+dri-devel@lfdr.de>; Thu, 24 Mar 2022 18:14:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEB0010E44F;
	Thu, 24 Mar 2022 17:14:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97F5110E44F
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Mar 2022 17:14:24 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id t11so7575508wrm.5
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Mar 2022 10:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=iWC72kktEe1NgTGzVdHKe9dKFt/ZRFXLIlNKVNgT5lE=;
 b=Jfmfdj1GadYB2e9czRhhIv7vihGen+OX1T16ajeL99zqWogwPUzL98I/u70FWVozpj
 48oON+LllofapUwPCn1IsGQM+ywjGMmKQQ9IWv11e9tuzJRyUb6mftQ25vEezJTJtPBj
 amwH+nF8GaeHj+zQVa/HVEbVjbTAppMrEwUcY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=iWC72kktEe1NgTGzVdHKe9dKFt/ZRFXLIlNKVNgT5lE=;
 b=pGxsOfL8Gxw9j0+oTXDzVG5IwuKPJE7AxOrTdWPhA6HC5WCw9Z2uBh3xlvT3Ckzgvs
 dFt+itB2u54JA7+KpESznohUrdUcX2d0Xv6E2VOt4R/pV9WJBL13BetzCyGUMmXiThPn
 ICxHhnX+2219GLdO42S6Tr6pO6eJaXwhSdzbwGnJMFkPd88T+2JVfQss8zRJfpvBxCw1
 FnuTiJAVSQYJZkZhwV/OU86aVGzuhLgZ8FQz4JrRy1+M8Nwk4OA+z+tm6NQvAeZI0Qms
 eYJaptwwahUQqZ5OyfSa//2DXvefwE+/7+/Gj9P6uy7VdwkzpyFgVGeUm4LwdzLvhWW4
 lKQw==
X-Gm-Message-State: AOAM5321Uv1udp1KrIy8SDhpBRmBnq8vLILgvsnuElcvpOoGMw9wADL/
 3wxRmY/k3PvxCw5Sj4hvwv/8Kg==
X-Google-Smtp-Source: ABdhPJyF7ZJmhpGmN08hWvidoIa5GcsM4OArY11cI+quZ02YcXt1R2T8T5S6VWkdbi6fpPVQ/64Ihg==
X-Received: by 2002:a5d:6842:0:b0:204:72d:e97e with SMTP id
 o2-20020a5d6842000000b00204072de97emr5399386wrw.254.1648142063031; 
 Thu, 24 Mar 2022 10:14:23 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 n8-20020adf8b08000000b001f046cc8891sm3166156wra.24.2022.03.24.10.14.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Mar 2022 10:14:22 -0700 (PDT)
Date: Thu, 24 Mar 2022 18:14:20 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH 2/4] drm/atomic: Add atomic_print_state to private objects
Message-ID: <Yjym7I3SzqoiZEIM@phenom.ffwll.local>
References: <20220324144724.1306133-1-maxime@cerno.tech>
 <20220324144724.1306133-3-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220324144724.1306133-3-maxime@cerno.tech>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 24, 2022 at 03:47:22PM +0100, Maxime Ripard wrote:
> A number of drivers (amdgpu, komeda, vc4, etc.) leverage the
> drm_private_state structure, but we don't have any infrastructure to
> provide debugging like we do for the other components state. Let's add
> an atomic_print_state hook to be consistent.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  drivers/gpu/drm/drm_atomic.c | 16 ++++++++++++++++
>  include/drm/drm_atomic.h     | 13 +++++++++++++
>  2 files changed, 29 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index ee2496ff3dcc..b9246206ed54 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@ -789,6 +789,8 @@ drm_atomic_private_obj_init(struct drm_device *dev,
>  	obj->state = state;
>  	obj->funcs = funcs;
>  	list_add_tail(&obj->head, &dev->mode_config.privobj_list);
> +
> +	state->obj = obj;
>  }
>  EXPORT_SYMBOL(drm_atomic_private_obj_init);
>  
> @@ -1640,6 +1642,15 @@ int __drm_atomic_helper_set_config(struct drm_mode_set *set,
>  }
>  EXPORT_SYMBOL(__drm_atomic_helper_set_config);
>  
> +static void drm_atomic_private_obj_print_state(struct drm_printer *p,
> +					       const struct drm_private_state *state)
> +{
> +	struct drm_private_obj *obj = state->obj;
> +
> +	if (obj->funcs->atomic_print_state)
> +		obj->funcs->atomic_print_state(p, state);
> +}
> +
>  /**
>   * drm_atomic_print_new_state - prints drm atomic state
>   * @state: atomic configuration to check
> @@ -1660,6 +1671,8 @@ void drm_atomic_print_new_state(const struct drm_atomic_state *state,
>  	struct drm_crtc_state *crtc_state;
>  	struct drm_connector *connector;
>  	struct drm_connector_state *connector_state;
> +	struct drm_private_obj *obj;
> +	struct drm_private_state *obj_state;
>  	int i;
>  
>  	if (!p) {
> @@ -1677,6 +1690,9 @@ void drm_atomic_print_new_state(const struct drm_atomic_state *state,
>  
>  	for_each_new_connector_in_state(state, connector, connector_state, i)
>  		drm_atomic_connector_print_state(p, connector_state);
> +
> +	for_each_new_private_obj_in_state(state, obj, obj_state, i)
> +		drm_atomic_private_obj_print_state(p, obj_state);
>  }
>  EXPORT_SYMBOL(drm_atomic_print_new_state);
>  
> diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
> index 1701c2128a5c..7e188cd9452b 100644
> --- a/include/drm/drm_atomic.h
> +++ b/include/drm/drm_atomic.h
> @@ -227,6 +227,18 @@ struct drm_private_state_funcs {
>  	 */
>  	void (*atomic_destroy_state)(struct drm_private_obj *obj,
>  				     struct drm_private_state *state);
> +
> +	/**
> +	 * @atomic_print_state:
> +	 *
> +	 * If driver subclasses &struct drm_private_state, it should implement
> +	 * this optional hook for printing additional driver specific state.
> +	 *
> +	 * Do not call this directly, use drm_atomic_private_obj_print_state()
> +	 * instead.
> +	 */
> +	void (*atomic_print_state)(struct drm_printer *p,
> +				   const struct drm_private_state *state);
>  };
>  
>  /**
> @@ -319,6 +331,7 @@ struct drm_private_obj {
>   */
>  struct drm_private_state {
>  	struct drm_atomic_state *state;
> +	struct drm_private_obj *obj;

kerneldoc for this is missing. Maybe switch to inline style while at it.
With that:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

>  };
>  
>  struct __drm_private_objs_state {
> -- 
> 2.35.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
