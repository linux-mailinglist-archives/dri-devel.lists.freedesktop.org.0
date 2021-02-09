Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3482B314BF5
	for <lists+dri-devel@lfdr.de>; Tue,  9 Feb 2021 10:44:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EAA389E11;
	Tue,  9 Feb 2021 09:44:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B10289E11
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Feb 2021 09:44:13 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id v14so5222322wro.7
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Feb 2021 01:44:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=EHKpDWH2FUfiOQcUZjCzHREVg+6fEV+qe2eFfPN8ecM=;
 b=IxumFLzWSnSCaFxhi1YkM2vbhI2VGo/epU3L7cfEv9+fMcGDgJTCfWuSC9hfmzVrVW
 W9JLxmQw97AFptvGRKxKKcgxjVuljCcFgdHrCJ8AiVWXDtY4xuVKOGqKmaYajXPo7jn6
 zBgzAz3U68VDBzxb+lcE368qgEiVL8Vv09Pjk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=EHKpDWH2FUfiOQcUZjCzHREVg+6fEV+qe2eFfPN8ecM=;
 b=cWbuGSfJpZC0TpPKEv/+Ojk/3+P03BckfydbsQVyfIvr5sFCucwgjCWhuCMneVH9UP
 0m5U1h7H4pv1XSZt0cQmJUJCE9QH5A78NZ4BmccsaUBX9aPzc1DTBOq8/tf5uaWubrQz
 1FdXeO5PmshsgjT7keb0DSEqzwIrWuvQkypE0pG9NDLpuKsEff0DBtUM2a1j3c/d5Xsw
 Al1ix4xLB82uOISHCgTX7C37UHMJoEeS0RrF3Pr0pc5AGSucqsUGpYdyNpbY4LUXo+r+
 MtFiiIJUlrdNrPq7u+1f73hgdYkJcxZrrLMILx+KSzQQQs5k8T0vRQofIstT+GTDonDz
 2z8Q==
X-Gm-Message-State: AOAM532qwAv4EoKPCuQujZR/cRcn7RGg+zLIRy6T15PYwHGe0CJdE/m+
 274YWbKrMbHIKAu/PaG+EXouEw==
X-Google-Smtp-Source: ABdhPJwPDhkbLVYj7rmq+FuFfPP2Sth3qCkLkDZMQnSqKigUySBrnoOq042743RIi4+EOuB7XDKtCA==
X-Received: by 2002:a5d:5611:: with SMTP id l17mr25295940wrv.2.1612863851769; 
 Tue, 09 Feb 2021 01:44:11 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 13sm3579679wmj.11.2021.02.09.01.44.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 01:44:10 -0800 (PST)
Date: Tue, 9 Feb 2021 10:44:09 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 1/2] drm/gem: Export helpers for shadow-buffered planes
Message-ID: <YCJZaTR1Q2MrOm81@phenom.ffwll.local>
References: <20210208135044.27827-1-tzimmermann@suse.de>
 <20210208135044.27827-2-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210208135044.27827-2-tzimmermann@suse.de>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, hdegoede@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 08, 2021 at 02:50:43PM +0100, Thomas Zimmermann wrote:
> Export the helpers for shadow-buffered planes. These will be used by
> several drivers.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/drm_gem_atomic_helper.c | 148 +++++++++++++++++++++++-
>  include/drm/drm_gem_atomic_helper.h     |  32 +++++
>  2 files changed, 174 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem_atomic_helper.c b/drivers/gpu/drm/drm_gem_atomic_helper.c
> index e27762cef360..79b4d3f0495a 100644
> --- a/drivers/gpu/drm/drm_gem_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_gem_atomic_helper.c
> @@ -14,13 +14,101 @@
>   * functions for drivers that use GEM objects. Currently, it provides
>   * plane state and framebuffer BO mappings for planes with shadow
>   * buffers.
> + *
> + * A driver using a shadow buffer copies the content of the shadow buffers
> + * into the HW's framebuffer memory during an atomic update. This requires
> + * a mapping of the shadow buffer into kernel address space. The mappings
> + * cannot be established by commit-tail functions, such as atomic_update,
> + * as this would violate locking rules vmap.

"... locking rules around dma_buf_vmap()"?

> + *
> + * The helpers for shadow-buffered planes establish and release mappings,
> + * and provide struct drm_shadow_plane_state, which stores the plane's mapping
> + * for commit-tail functons.
> + *
> + * Shadow-buffered planes can easily be enabled by using the provided macros
> + * DRM_GEM_PLANE_SHADOW_FUNCS and DRM_GEM_SHADOE_PLANE_HELPER_FUNCS.

I think for hyperlinks/highlights we need %CONSTANT? Maybe check what works.

> + * These macros set up the plane and plane-helper callbacks to point to the
> + * shadow-buffer helpers.
> + *
> + * .. code-block:: c
> + *
> + *	#include <drm/drm/gem_atomic_helper.h>
> + *
> + *	struct drm_plane_funcs driver_plane_funcs = {
> + *		...,
> + *		DRM_GEM_SHADOW_PLANE_FUNCS,
> + *	};
> + *
> + *	struct drm_plane_helper_funcs driver_plane_helper_funcs = {
> + *		...,
> + *		DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
> + *	};
> + *
> + * In the driver's atomic-update function, shadow-buffer mappings are available
> + * from the plane state. Use to_drm_shadow_plane_state() to upcast from
> + * struct drm_plane_state.
> + *
> + * .. code-block:: c
> + *
> + *	void driver_plane_atomic_update(struct drm_plane *plane,
> + *					struct drm_plane_state *old_plane_state)
> + *	{
> + *		struct drm_plane_state *plane_state = plane->state;
> + *		struct drm_shadow_plane_state *shadow_plane_state =
> + *			to_drm_shadow_plane_state(plane_state);
> + *
> + *		// access shadow buffer via shadow_plane_state->map
> + *	}
> + *
> + * A mapping address for each of the framebuffer's buffer object is stored in
> + * struct drm_shadow_plane_state.map. The mappings are valid while the state
> + * is being used.
> + *
> + * Drivers that use struct drm_simple_display_pipe can use
> + * DRM_GEM_SIMPLE_DISPLAY_PIPE_SHADOW_PLANE_FUNCS to initialize the rsp
> + * callbacks. Access to shadow-buffer mappings is similar to regular
> + * atomic_update.
> + *
> + * .. code-block:: c
> + *
> + *	struct drm_simple_display_pipe_funcs driver_pipe_funcs = {
> + *		...,
> + *		DRM_GEM_SIMPLE_DISPLAY_PIPE_SHADOW_PLANE_FUNCS,
> + *	};
> + *
> + *	void driver_pipe_enable(struct drm_simple_display_pipe *pipe,
> + *				struct drm_crtc_state *crtc_state,
> + *				struct drm_plane_state *plane_state)
> + *	{
> + *		struct drm_shadow_plane_state *shadow_plane_state =
> + *			to_drm_shadow_plane_state(plane_state);
> + *
> + *		// access shadow buffer via shadow_plane_state->map
> + *	}
>   */
>  
>  /*
>   * Shadow-buffered Planes
>   */
>  
> -static struct drm_plane_state *
> +/**
> + * drm_gem_duplicate_shadow_plane_state - duplicates shadow-buffered plane state
> + * @plane: the plane
> + *
> + * This function implements struct drm_plane_funcs.atomic_duplicate_state for

Does this hyperlink automatically? I didn't know it works since for
members I just always use &struct.member myself.

> + * shadow-buffered planes. It assumes the existing state to be of type
> + * struct drm_shadow_plane_state and it allocates the new state to be of this
> + * type.
> + *
> + * The function does not duplicate existing mappings of the shadow buffers.
> + * Mappings are maintained during the atomic commit by the plane's prepare_fb
> + * and cleanup_fb helpers. See drm_gem_prepare_shadow_fb() and drm_gem_cleanup_shadow_fb()
> + * for corresponding helpers.
> + *
> + * Returns:
> + * A pointer to a new plane state on success, or NULL otherwise.
> + */
> +struct drm_plane_state *
>  drm_gem_duplicate_shadow_plane_state(struct drm_plane *plane)
>  {
>  	struct drm_plane_state *plane_state = plane->state;
> @@ -36,9 +124,19 @@ drm_gem_duplicate_shadow_plane_state(struct drm_plane *plane)
>  
>  	return &new_shadow_plane_state->base;
>  }
> +EXPORT_SYMBOL(drm_gem_duplicate_shadow_plane_state);
>  
> -static void drm_gem_destroy_shadow_plane_state(struct drm_plane *plane,
> -					       struct drm_plane_state *plane_state)
> +/**
> + * drm_gem_destroy_shadow_plane_state - deletes shadow-buffered plane state
> + * @plane: the plane
> + * @plane_state: the plane state of type struct drm_shadow_plane_state
> + *
> + * This function implements struct drm_plane_funcs.atomic_destroy_state
> + * for shadow-buffered planes. It expects that mappings of shadow buffers
> + * have been released already.
> + */
> +void drm_gem_destroy_shadow_plane_state(struct drm_plane *plane,
> +					struct drm_plane_state *plane_state)
>  {
>  	struct drm_shadow_plane_state *shadow_plane_state =
>  		to_drm_shadow_plane_state(plane_state);
> @@ -46,8 +144,18 @@ static void drm_gem_destroy_shadow_plane_state(struct drm_plane *plane,
>  	__drm_atomic_helper_plane_destroy_state(&shadow_plane_state->base);
>  	kfree(shadow_plane_state);
>  }
> +EXPORT_SYMBOL(drm_gem_destroy_shadow_plane_state);
>  
> -static void drm_gem_reset_shadow_plane(struct drm_plane *plane)
> +/**
> + * drm_gem_reset_shadow_plane - resets a shadow-buffered plane
> + * @plane: the plane
> + *
> + * This function implements struct drm_plane_funcs.reset_plane for
> + * shadow-buffered planes. It assumes the current plane state to be
> + * of type struct drm_shadow_plane and it allocates the new state of
> + * this type.
> + */
> +void drm_gem_reset_shadow_plane(struct drm_plane *plane)
>  {
>  	struct drm_shadow_plane_state *shadow_plane_state;
>  
> @@ -61,8 +169,24 @@ static void drm_gem_reset_shadow_plane(struct drm_plane *plane)
>  		return;
>  	__drm_atomic_helper_plane_reset(plane, &shadow_plane_state->base);
>  }
> +EXPORT_SYMBOL(drm_gem_reset_shadow_plane);
>  
> -static int drm_gem_prepare_shadow_fb(struct drm_plane *plane, struct drm_plane_state *plane_state)
> +/**
> + * drm_gem_prepare_shadow_fb - prepares shadow framebuffers
> + * @plane: the plane
> + * @plane_state: the plane state of type struct drm_shadow_plane_state
> + *
> + * This function implements struct drm_plane_helper_funcs.prepare_fb. It
> + * maps all buffer objects of the plane's framebuffer into kernel address
> + * space and stores them in struct drm_shadow_plane_state.map. The
> + * framebuffer will be synchronized as part of the atomic commit.
> + *
> + * See drm_gem_cleanup_shadow_fb() for cleanup.
> + *
> + * Returns:
> + * 0 on success, or a negative errno code otherwise.
> + */
> +int drm_gem_prepare_shadow_fb(struct drm_plane *plane, struct drm_plane_state *plane_state)
>  {
>  	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
>  	struct drm_framebuffer *fb = plane_state->fb;
> @@ -100,8 +224,19 @@ static int drm_gem_prepare_shadow_fb(struct drm_plane *plane, struct drm_plane_s
>  	}
>  	return ret;
>  }
> +EXPORT_SYMBOL(drm_gem_prepare_shadow_fb);
>  
> -static void drm_gem_cleanup_shadow_fb(struct drm_plane *plane, struct drm_plane_state *plane_state)
> +/**
> + * drm_gem_cleanup_shadow_fb - releases shadow framebuffers
> + * @plane: the plane
> + * @plane_state: the plane state of type struct drm_shadow_plane_state
> + *
> + * This function implements struct drm_plane_helper_funcs.cleanup_fb.
> + * This function unmaps all buffer objects of the plane's framebuffer.
> + *
> + * See drm_gem_prepare_shadow_fb() for more inforamtion.
> + */
> +void drm_gem_cleanup_shadow_fb(struct drm_plane *plane, struct drm_plane_state *plane_state)
>  {
>  	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
>  	struct drm_framebuffer *fb = plane_state->fb;
> @@ -119,6 +254,7 @@ static void drm_gem_cleanup_shadow_fb(struct drm_plane *plane, struct drm_plane_
>  		drm_gem_vunmap(obj, &shadow_plane_state->map[i]);
>  	}
>  }
> +EXPORT_SYMBOL(drm_gem_cleanup_shadow_fb);
>  
>  /**
>   * drm_gem_simple_kms_prepare_shadow_fb - prepares shadow framebuffers
> diff --git a/include/drm/drm_gem_atomic_helper.h b/include/drm/drm_gem_atomic_helper.h
> index 08b96ccea325..7abf40bdab3d 100644
> --- a/include/drm/drm_gem_atomic_helper.h
> +++ b/include/drm/drm_gem_atomic_helper.h
> @@ -45,6 +45,38 @@ to_drm_shadow_plane_state(struct drm_plane_state *state)
>  	return container_of(state, struct drm_shadow_plane_state, base);
>  }
>  
> +void drm_gem_reset_shadow_plane(struct drm_plane *plane);
> +struct drm_plane_state *drm_gem_duplicate_shadow_plane_state(struct drm_plane *plane);
> +void drm_gem_destroy_shadow_plane_state(struct drm_plane *plane,
> +					struct drm_plane_state *plane_state);
> +
> +/**
> + * DRM_GEM_SHADOW_PLANE_FUNCS -
> + *	Initializes struct drm_plane_funcs for shadow-buffered planes
> + *
> + * Drivers may use GEM BOs as shadow buffers over the framebuffer memory. This
> + * macro initializes struct drm_plane_funcs to use the rsp helper functions.
> + */
> +#define DRM_GEM_SHADOW_PLANE_FUNCS \
> +	.reset = drm_gem_reset_shadow_plane, \
> +	.atomic_duplicate_state = drm_gem_duplicate_shadow_plane_state, \
> +	.atomic_destroy_state = drm_gem_destroy_shadow_plane_state
> +
> +int drm_gem_prepare_shadow_fb(struct drm_plane *plane, struct drm_plane_state *plane_state);
> +void drm_gem_cleanup_shadow_fb(struct drm_plane *plane, struct drm_plane_state *plane_state);
> +
> +/**
> + * DRM_GEM_SHADOW_PLANE_HELPER_FUNCS -
> + *	Initializes struct drm_plane_helper_funcs for shadow-buffered planes
> + *
> + * Drivers may use GEM BOs as shadow buffers over the framebuffer memory. This
> + * macro initializes struct drm_plane_helper_funcs to use the rsp helper
> + * functions.
> + */
> +#define DRM_GEM_SHADOW_PLANE_HELPER_FUNCS \
> +	.prepare_fb = drm_gem_prepare_shadow_fb, \
> +	.cleanup_fb = drm_gem_cleanup_shadow_fb
> +
>  int drm_gem_simple_kms_prepare_shadow_fb(struct drm_simple_display_pipe *pipe,
>  					 struct drm_plane_state *plane_state);
>  void drm_gem_simple_kms_cleanup_shadow_fb(struct drm_simple_display_pipe *pipe,


Very nice and thoroughly explained docs!

Thanks, Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> -- 
> 2.30.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
