Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A712B590413
	for <lists+dri-devel@lfdr.de>; Thu, 11 Aug 2022 18:41:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0E77113250;
	Thu, 11 Aug 2022 16:41:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [IPv6:2a00:1450:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 722391135C5
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Aug 2022 16:41:40 +0000 (UTC)
Received: by mail-ej1-x641.google.com with SMTP id dc19so34398177ejb.12
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Aug 2022 09:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc;
 bh=utRfjYYHwJ+vmSyOadRJzbHFzcRjcOzsy9ZtT0khBNU=;
 b=O4z4+slX9vmODG4ihaz2pPUJsMXLlwUVt9vrk6RYE1ifodmuU33ECW+WZJ4L+TC5F5
 n5//NFymI9ZMUtqrGKtZclP1Np7OhMVl8zEoedyxnq2/RjaMxFH5WHUEDy4PR8Y4glWK
 MNLw20LsOvOd1DS0hmqF/N8h/31bIMb6md75s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=utRfjYYHwJ+vmSyOadRJzbHFzcRjcOzsy9ZtT0khBNU=;
 b=ViKDTqzkNzkR3d/P/De5GaSI2UPw8Xku86w/ie1oIMijcs/fJ00m8UI1iew4ELlNEY
 bTUcObmtAgyzIxOlaerfasUMc37I7c28dPTRw6ciFrkARfGo+NNp7T7ahkrFSooNS3DJ
 03jyMR80bScGjBfOuwUN38A5NBB6BW5m5ftW/KEzuVe/TGvIhdqpCuAYGZV2vB4CYO76
 0Btb1/txE1DI8JAGgSmZOaRXTnt6la3FXshqgV1rF+DQOsCIjJCc816LOOulzyefhr8T
 dryh45WrhwUm5Jhc7e0mqxyXVOQjqVQFq7JQOlu7gz5uhLWHCcT38cr2JI+b7JfkApCU
 d+bg==
X-Gm-Message-State: ACgBeo1HpxJzJDpe/0dzW9ml0oDiIDgSA7ln8toAfRDIoHCdhInN4vIu
 yIndDoK/VgEi8uefdjbsy+mYxg==
X-Google-Smtp-Source: AA6agR4SiUnops1fYZQ3G90EtK67hnirkdM2JpzvbfQB6kdj32b9iZxheKTLna9hEIHQCY4HZFoTTg==
X-Received: by 2002:a17:907:60c7:b0:731:148b:c515 with SMTP id
 hv7-20020a17090760c700b00731148bc515mr19902946ejc.724.1660236098919; 
 Thu, 11 Aug 2022 09:41:38 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 z4-20020aa7cf84000000b0043d5ead65a6sm9341353edx.84.2022.08.11.09.41.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Aug 2022 09:41:38 -0700 (PDT)
Date: Thu, 11 Aug 2022 18:41:36 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 5/7] drm/plane-helper: Export individual helpers
Message-ID: <YvUxQG5M1C6hc9Q2@phenom.ffwll.local>
References: <20220720083058.15371-1-tzimmermann@suse.de>
 <20220720083058.15371-6-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220720083058.15371-6-tzimmermann@suse.de>
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
Cc: airlied@linux.ie, alison.wang@nxp.com, linux@armlinux.org.uk,
 linux-graphics-maintainer@vmware.com, dri-devel@lists.freedesktop.org,
 airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 20, 2022 at 10:30:56AM +0200, Thomas Zimmermann wrote:
> Export the individual plane helpers that make up the plane functions and
> align the naming with other helpers. The plane helpers are for non-atomic
> modesetting and exporting them will simplify a later conversion of drivers
> to atomic modesetting.
> 
> With struct drm_plane_funcs removed from drm_plane_helper.h, also remove
> the include statements. It only needs linux/types.h for uint32_t and a
> number of forward declarations.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

So my commit message was maybe not super motivated, but I intentionally
hid these because atomic drivers where using them, which is all bad no
good. Now they're more exposed again, which sucks a bit. Exporting the
complete function table for legacy helpers (and the one open-coded one in
nouveau, not sure we could not move that back to drm_crtc_init) feels much
safer against abuse to me.

I'm not entirely clear why we're doing this, because the include untangle
could also have been achieved with a struct forward decl, which is what
we're usually doing. Can we walk this back please, or am I missing
something here?

Cheers, Daniel

> ---
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  3 +-
>  drivers/gpu/drm/armada/armada_plane.c         |  2 +-
>  drivers/gpu/drm/drm_modeset_helper.c          |  8 ++-
>  drivers/gpu/drm/drm_plane_helper.c            | 70 ++++++++++++++-----
>  drivers/gpu/drm/nouveau/dispnv04/crtc.c       |  8 ++-
>  drivers/gpu/drm/qxl/qxl_display.c             |  4 +-
>  drivers/gpu/drm/vboxvideo/vbox_mode.c         |  4 +-
>  include/drm/drm_plane_helper.h                | 22 ++++--
>  8 files changed, 88 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 3e83fed540e8..1548f0a1b1c0 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -86,6 +86,7 @@
>  #include <drm/drm_vblank.h>
>  #include <drm/drm_audio_component.h>
>  #include <drm/drm_gem_atomic_helper.h>
> +#include <drm/drm_plane_helper.h>
>  
>  #include "ivsrcid/dcn/irqsrcs_dcn_1_0.h"
>  
> @@ -7824,7 +7825,7 @@ static void dm_drm_plane_destroy_state(struct drm_plane *plane,
>  static const struct drm_plane_funcs dm_plane_funcs = {
>  	.update_plane	= drm_atomic_helper_update_plane,
>  	.disable_plane	= drm_atomic_helper_disable_plane,
> -	.destroy	= drm_primary_helper_destroy,
> +	.destroy	= drm_plane_helper_destroy,
>  	.reset = dm_drm_plane_reset,
>  	.atomic_duplicate_state = dm_drm_plane_duplicate_state,
>  	.atomic_destroy_state = dm_drm_plane_destroy_state,
> diff --git a/drivers/gpu/drm/armada/armada_plane.c b/drivers/gpu/drm/armada/armada_plane.c
> index 959d7f0a5108..cc47c032dbc1 100644
> --- a/drivers/gpu/drm/armada/armada_plane.c
> +++ b/drivers/gpu/drm/armada/armada_plane.c
> @@ -288,7 +288,7 @@ struct drm_plane_state *armada_plane_duplicate_state(struct drm_plane *plane)
>  static const struct drm_plane_funcs armada_primary_plane_funcs = {
>  	.update_plane	= drm_atomic_helper_update_plane,
>  	.disable_plane	= drm_atomic_helper_disable_plane,
> -	.destroy	= drm_primary_helper_destroy,
> +	.destroy	= drm_plane_helper_destroy,
>  	.reset		= armada_plane_reset,
>  	.atomic_duplicate_state = armada_plane_duplicate_state,
>  	.atomic_destroy_state = drm_atomic_helper_plane_destroy_state,
> diff --git a/drivers/gpu/drm/drm_modeset_helper.c b/drivers/gpu/drm/drm_modeset_helper.c
> index 0f08319453b2..bd609a978848 100644
> --- a/drivers/gpu/drm/drm_modeset_helper.c
> +++ b/drivers/gpu/drm/drm_modeset_helper.c
> @@ -108,6 +108,12 @@ static const uint32_t safe_modeset_formats[] = {
>  	DRM_FORMAT_ARGB8888,
>  };
>  
> +static const struct drm_plane_funcs primary_plane_funcs = {
> +	.update_plane = drm_plane_helper_update_primary,
> +	.disable_plane = drm_plane_helper_disable_primary,
> +	.destroy = drm_plane_helper_destroy,
> +};
> +
>  static struct drm_plane *create_primary_plane(struct drm_device *dev)
>  {
>  	struct drm_plane *primary;
> @@ -127,7 +133,7 @@ static struct drm_plane *create_primary_plane(struct drm_device *dev)
>  
>  	/* possible_crtc's will be filled in later by crtc_init */
>  	ret = drm_universal_plane_init(dev, primary, 0,
> -				       &drm_primary_helper_funcs,
> +				       &primary_plane_funcs,
>  				       safe_modeset_formats,
>  				       ARRAY_SIZE(safe_modeset_formats),
>  				       NULL,
> diff --git a/drivers/gpu/drm/drm_plane_helper.c b/drivers/gpu/drm/drm_plane_helper.c
> index bc08edd69030..c7785967f5bf 100644
> --- a/drivers/gpu/drm/drm_plane_helper.c
> +++ b/drivers/gpu/drm/drm_plane_helper.c
> @@ -145,13 +145,36 @@ static int drm_plane_helper_check_update(struct drm_plane *plane,
>  	return 0;
>  }
>  
> -static int drm_primary_helper_update(struct drm_plane *plane, struct drm_crtc *crtc,
> -				     struct drm_framebuffer *fb,
> -				     int crtc_x, int crtc_y,
> -				     unsigned int crtc_w, unsigned int crtc_h,
> -				     uint32_t src_x, uint32_t src_y,
> -				     uint32_t src_w, uint32_t src_h,
> -				     struct drm_modeset_acquire_ctx *ctx)
> +/**
> + * drm_plane_helper_update_primary - Helper for updating primary planes
> + * @plane: plane to update
> + * @crtc: the plane's new CRTC
> + * @fb: the plane's new framebuffer
> + * @crtc_x: x coordinate within CRTC
> + * @crtc_y: y coordinate within CRTC
> + * @crtc_w: width coordinate within CRTC
> + * @crtc_h: height coordinate within CRTC
> + * @src_x: x coordinate within source
> + * @src_y: y coordinate within source
> + * @src_w: width coordinate within source
> + * @src_h: height coordinate within source
> + * @ctx: modeset locking context
> + *
> + * This helper validates the given parameters and updates the primary plane.
> + *
> + * This function is only useful for non-atomic modesetting. Don't use
> + * it in new drivers.
> + *
> + * Returns:
> + * Zero on success, or an errno code otherwise.
> + */
> +int drm_plane_helper_update_primary(struct drm_plane *plane, struct drm_crtc *crtc,
> +				    struct drm_framebuffer *fb,
> +				    int crtc_x, int crtc_y,
> +				    unsigned int crtc_w, unsigned int crtc_h,
> +				    uint32_t src_x, uint32_t src_y,
> +				    uint32_t src_w, uint32_t src_h,
> +				    struct drm_modeset_acquire_ctx *ctx)
>  {
>  	struct drm_mode_set set = {
>  		.crtc = crtc,
> @@ -218,31 +241,40 @@ static int drm_primary_helper_update(struct drm_plane *plane, struct drm_crtc *c
>  	kfree(connector_list);
>  	return ret;
>  }
> +EXPORT_SYMBOL(drm_plane_helper_update_primary);
>  
> -static int drm_primary_helper_disable(struct drm_plane *plane,
> -				      struct drm_modeset_acquire_ctx *ctx)
> +/**
> + * drm_plane_helper_disable_primary - Helper for disabling primary planes
> + * @plane: plane to disable
> + * @ctx: modeset locking context
> + *
> + * This helper returns an error when trying to disable the primary
> + * plane.
> + *
> + * This function is only useful for non-atomic modesetting. Don't use
> + * it in new drivers.
> + *
> + * Returns:
> + * An errno code.
> + */
> +int drm_plane_helper_disable_primary(struct drm_plane *plane,
> +				     struct drm_modeset_acquire_ctx *ctx)
>  {
>  	return -EINVAL;
>  }
> +EXPORT_SYMBOL(drm_plane_helper_disable_primary);
>  
>  /**
> - * drm_primary_helper_destroy() - Helper for primary plane destruction
> + * drm_plane_helper_destroy() - Helper for primary plane destruction
>   * @plane: plane to destroy
>   *
>   * Provides a default plane destroy handler for primary planes.  This handler
>   * is called during CRTC destruction.  We disable the primary plane, remove
>   * it from the DRM plane list, and deallocate the plane structure.
>   */
> -void drm_primary_helper_destroy(struct drm_plane *plane)
> +void drm_plane_helper_destroy(struct drm_plane *plane)
>  {
>  	drm_plane_cleanup(plane);
>  	kfree(plane);
>  }
> -EXPORT_SYMBOL(drm_primary_helper_destroy);
> -
> -const struct drm_plane_funcs drm_primary_helper_funcs = {
> -	.update_plane = drm_primary_helper_update,
> -	.disable_plane = drm_primary_helper_disable,
> -	.destroy = drm_primary_helper_destroy,
> -};
> -EXPORT_SYMBOL(drm_primary_helper_funcs);
> +EXPORT_SYMBOL(drm_plane_helper_destroy);
> diff --git a/drivers/gpu/drm/nouveau/dispnv04/crtc.c b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
> index f9e962fd94d0..660c4cbc0b3d 100644
> --- a/drivers/gpu/drm/nouveau/dispnv04/crtc.c
> +++ b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
> @@ -1275,6 +1275,12 @@ static const uint32_t modeset_formats[] = {
>          DRM_FORMAT_XRGB1555,
>  };
>  
> +static const struct drm_plane_funcs nv04_primary_plane_funcs = {
> +	.update_plane = drm_plane_helper_update_primary,
> +	.disable_plane = drm_plane_helper_disable_primary,
> +	.destroy = drm_plane_helper_destroy,
> +};
> +
>  static struct drm_plane *
>  create_primary_plane(struct drm_device *dev)
>  {
> @@ -1289,7 +1295,7 @@ create_primary_plane(struct drm_device *dev)
>  
>          /* possible_crtc's will be filled in later by crtc_init */
>          ret = drm_universal_plane_init(dev, primary, 0,
> -                                       &drm_primary_helper_funcs,
> +				       &nv04_primary_plane_funcs,
>                                         modeset_formats,
>                                         ARRAY_SIZE(modeset_formats), NULL,
>                                         DRM_PLANE_TYPE_PRIMARY, NULL);
> diff --git a/drivers/gpu/drm/qxl/qxl_display.c b/drivers/gpu/drm/qxl/qxl_display.c
> index 2e8949863d6b..a152a7c6db21 100644
> --- a/drivers/gpu/drm/qxl/qxl_display.c
> +++ b/drivers/gpu/drm/qxl/qxl_display.c
> @@ -902,7 +902,7 @@ static const struct drm_plane_helper_funcs qxl_cursor_helper_funcs = {
>  static const struct drm_plane_funcs qxl_cursor_plane_funcs = {
>  	.update_plane	= drm_atomic_helper_update_plane,
>  	.disable_plane	= drm_atomic_helper_disable_plane,
> -	.destroy	= drm_primary_helper_destroy,
> +	.destroy	= drm_plane_helper_destroy,
>  	.reset		= drm_atomic_helper_plane_reset,
>  	.atomic_duplicate_state = drm_atomic_helper_plane_duplicate_state,
>  	.atomic_destroy_state = drm_atomic_helper_plane_destroy_state,
> @@ -924,7 +924,7 @@ static const struct drm_plane_helper_funcs primary_helper_funcs = {
>  static const struct drm_plane_funcs qxl_primary_plane_funcs = {
>  	.update_plane	= drm_atomic_helper_update_plane,
>  	.disable_plane	= drm_atomic_helper_disable_plane,
> -	.destroy	= drm_primary_helper_destroy,
> +	.destroy	= drm_plane_helper_destroy,
>  	.reset		= drm_atomic_helper_plane_reset,
>  	.atomic_duplicate_state = drm_atomic_helper_plane_duplicate_state,
>  	.atomic_destroy_state = drm_atomic_helper_plane_destroy_state,
> diff --git a/drivers/gpu/drm/vboxvideo/vbox_mode.c b/drivers/gpu/drm/vboxvideo/vbox_mode.c
> index 604ebfbef314..341edd982cb3 100644
> --- a/drivers/gpu/drm/vboxvideo/vbox_mode.c
> +++ b/drivers/gpu/drm/vboxvideo/vbox_mode.c
> @@ -477,7 +477,7 @@ static const struct drm_plane_helper_funcs vbox_cursor_helper_funcs = {
>  static const struct drm_plane_funcs vbox_cursor_plane_funcs = {
>  	.update_plane	= drm_atomic_helper_update_plane,
>  	.disable_plane	= drm_atomic_helper_disable_plane,
> -	.destroy	= drm_primary_helper_destroy,
> +	.destroy	= drm_plane_helper_destroy,
>  	DRM_GEM_SHADOW_PLANE_FUNCS,
>  };
>  
> @@ -496,7 +496,7 @@ static const struct drm_plane_helper_funcs vbox_primary_helper_funcs = {
>  static const struct drm_plane_funcs vbox_primary_plane_funcs = {
>  	.update_plane	= drm_atomic_helper_update_plane,
>  	.disable_plane	= drm_atomic_helper_disable_plane,
> -	.destroy	= drm_primary_helper_destroy,
> +	.destroy	= drm_plane_helper_destroy,
>  	.reset		= drm_atomic_helper_plane_reset,
>  	.atomic_duplicate_state = drm_atomic_helper_plane_duplicate_state,
>  	.atomic_destroy_state = drm_atomic_helper_plane_destroy_state,
> diff --git a/include/drm/drm_plane_helper.h b/include/drm/drm_plane_helper.h
> index ff85ef41cb33..1781fab24dd6 100644
> --- a/include/drm/drm_plane_helper.h
> +++ b/include/drm/drm_plane_helper.h
> @@ -24,12 +24,22 @@
>  #ifndef DRM_PLANE_HELPER_H
>  #define DRM_PLANE_HELPER_H
>  
> -#include <drm/drm_rect.h>
> -#include <drm/drm_crtc.h>
> -#include <drm/drm_modeset_helper_vtables.h>
> -#include <drm/drm_modeset_helper.h>
> +#include <linux/types.h>
>  
> -void drm_primary_helper_destroy(struct drm_plane *plane);
> -extern const struct drm_plane_funcs drm_primary_helper_funcs;
> +struct drm_crtc;
> +struct drm_framebuffer;
> +struct drm_modeset_acquire_ctx;
> +struct drm_plane;
> +
> +int drm_plane_helper_update_primary(struct drm_plane *plane, struct drm_crtc *crtc,
> +				    struct drm_framebuffer *fb,
> +				    int crtc_x, int crtc_y,
> +				    unsigned int crtc_w, unsigned int crtc_h,
> +				    uint32_t src_x, uint32_t src_y,
> +				    uint32_t src_w, uint32_t src_h,
> +				    struct drm_modeset_acquire_ctx *ctx);
> +int drm_plane_helper_disable_primary(struct drm_plane *plane,
> +				     struct drm_modeset_acquire_ctx *ctx);
> +void drm_plane_helper_destroy(struct drm_plane *plane);
>  
>  #endif
> -- 
> 2.36.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
