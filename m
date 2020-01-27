Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2767A14A0FC
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2020 10:41:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C01666EA90;
	Mon, 27 Jan 2020 09:41:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D3706EA90
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2020 09:41:02 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id p17so6257506wma.1
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2020 01:41:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=wUiJeP3sb9FoVRey/J/jF1e4AeTkT556St8bvwvM930=;
 b=hLP8zzWNbQctE3j265ZDAN8Mj+AJBc80NKO08gNpWs0VlbcJQGjAsnUmAkivYyNk9q
 ofuqeePo6IJYMe1SFbsBFoYcfFZiXDQ4Ws09Cxjoes6hgCwzPLUenMfU6D8o7h9FR/IX
 099X6fDqBW5eBxGAKMmtjvgR3IlKnzA/laUuk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wUiJeP3sb9FoVRey/J/jF1e4AeTkT556St8bvwvM930=;
 b=A7RO3wb6NbWVM8sKaHbW5PDCADz5SxN02IfyM6kyRZwK20/VeNowlZkWvPNqrT35Qy
 eynbLTq0kVNG9BKK/D58gWXFhPl4tnRSBmCxWTCA14RC11gsIdi68FECSfVF3HNIkP5Z
 lYMlIjelvgy7oq080RnOijZ4iEB829IDtlgVVaApPpBxisEcFnSTTlODwmTjZIk/qFmG
 B9imPg0OWeH5NjAGOfrb92xJlyMfz/VjvH5w0iNa26izQ3OIvJKlNnH5dz6Z/9jk+0Sm
 VC7AdAAcv0967tknTdD+cEDdqlczhIgXLuCmgwM6Tyj2z5lYIP+seCSfMpoYrQHfH66B
 t9zQ==
X-Gm-Message-State: APjAAAUPzQxuR7O/VP4NctDiP75PR6qFCqqu7GghszbGPrLm8XxIuw0X
 9XOFuaST+HlS0SG/u1/h0nplHB6rLztRlg==
X-Google-Smtp-Source: APXvYqwu7+yyryOWJcgA1WBQbyexBCEfeuqqS7AjAG5uVqU0OZiWWlyYOdULux7tc3u8UTN8Nx3JvA==
X-Received: by 2002:a05:600c:2409:: with SMTP id
 9mr12691722wmp.109.1580118061332; 
 Mon, 27 Jan 2020 01:41:01 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id n8sm19746656wrx.42.2020.01.27.01.40.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jan 2020 01:41:00 -0800 (PST)
Date: Mon, 27 Jan 2020 10:40:58 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v4 01/15] drm: Initialize struct drm_crtc_state.no_vblank
 from device settings
Message-ID: <20200127094058.GZ43062@phenom.ffwll.local>
References: <20200123092123.28368-1-tzimmermann@suse.de>
 <20200123092123.28368-2-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200123092123.28368-2-tzimmermann@suse.de>
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
Cc: david@lechnology.com, oleksandr_andrushchenko@epam.com, airlied@linux.ie,
 sam@ravnborg.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, hdegoede@redhat.com,
 kraxel@redhat.com, xen-devel@lists.xenproject.org, emil.velikov@collabora.com,
 sean@poorly.run, laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 23, 2020 at 10:21:09AM +0100, Thomas Zimmermann wrote:
> At the end of a commit, atomic helpers can generate a VBLANK event
> automatically. Originally implemented for writeback connectors, the
> functionality can be used by any driver and/or hardware without proper
> VBLANK interrupt.
> 
> The patch updates the documentation to make this behaviour official:
> settings struct drm_crtc_state.no_vblank to true enables automatic
> VBLANK generation.
> 
> The new interface drm_dev_has_vblank() returns true if vblanking has
> been initialized for a device, or false otherwise. This function will
> be useful when initializing no_vblank in the CRTC state.
> 
> Atomic modesetting helper set the initial value of no_vblank in
> drm_atomic_helper_check_modeset(). If vblanking has been initialized
> for a device, no_blank is disabled. Otherwise it's enabled. Hence,
> atomic helpers will automatically send out VBLANK events with any
> driver that did not initialize vblanking.
> 
> v4:
> 	* replace drm_crtc_has_vblank() with drm_dev_has_vblank()
> 	* add drm_dev_crtc_has_vblank() in this patch

drm_dev_has_vblank I guess?

> 	* move driver changes into separate patches
> v3:
> 	* squash all related changes patches into this patch
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Acked-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  drivers/gpu/drm/drm_atomic_helper.c | 10 +++++++++-
>  drivers/gpu/drm/drm_vblank.c        | 28 ++++++++++++++++++++++++++++
>  include/drm/drm_crtc.h              | 27 ++++++++++++++++++++-------
>  include/drm/drm_simple_kms_helper.h |  7 +++++--
>  include/drm/drm_vblank.h            |  1 +
>  5 files changed, 63 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> index 4511c2e07bb9..d7b73cd89b79 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -583,6 +583,7 @@ mode_valid(struct drm_atomic_state *state)
>   * &drm_crtc_state.connectors_changed is set when a connector is added or
>   * removed from the CRTC.  &drm_crtc_state.active_changed is set when
>   * &drm_crtc_state.active changes, which is used for DPMS.
> + * &drm_crtc_state.no_vblank is set from the result of drm_dev_has_vblank().
>   * See also: drm_atomic_crtc_needs_modeset()
>   *
>   * IMPORTANT:
> @@ -649,6 +650,11 @@ drm_atomic_helper_check_modeset(struct drm_device *dev,
>  
>  			return -EINVAL;
>  		}
> +
> +		if (drm_dev_has_vblank(dev))
> +			new_crtc_state->no_vblank = false;
> +		else
> +			new_crtc_state->no_vblank = true;
>  	}
>  
>  	ret = handle_conflicting_encoders(state, false);
> @@ -2215,7 +2221,9 @@ EXPORT_SYMBOL(drm_atomic_helper_wait_for_dependencies);
>   * when a job is queued, and any change to the pipeline that does not touch the
>   * connector is leading to timeouts when calling
>   * drm_atomic_helper_wait_for_vblanks() or
> - * drm_atomic_helper_wait_for_flip_done().
> + * drm_atomic_helper_wait_for_flip_done(). In addition to writeback
> + * connectors, this function can also fake VBLANK events for CRTCs without
> + * VBLANK interrupt.
>   *
>   * This is part of the atomic helper support for nonblocking commits, see
>   * drm_atomic_helper_setup_commit() for an overview.
> diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
> index 1659b13b178c..433dec6230b1 100644
> --- a/drivers/gpu/drm/drm_vblank.c
> +++ b/drivers/gpu/drm/drm_vblank.c
> @@ -69,6 +69,12 @@
>   * &drm_driver.max_vblank_count. In that case the vblank core only disables the
>   * vblanks after a timer has expired, which can be configured through the
>   * ``vblankoffdelay`` module parameter.
> + *
> + * Drivers for hardware without support for vertical-blanking interrupts
> + * must not call drm_vblank_init(). For such drivers, atomic helpers will
> + * automatically generate vblank events as part of the display update. This
> + * functionality also can be controlled by the driver by enabling and disabling
> + * struct drm_crtc_state.no_vblank.
>   */
>  
>  /* Retry timestamp calculation up to 3 times to satisfy
> @@ -501,6 +507,28 @@ int drm_vblank_init(struct drm_device *dev, unsigned int num_crtcs)
>  }
>  EXPORT_SYMBOL(drm_vblank_init);
>  
> +/**
> + * drm_dev_has_vblank - test if vblanking has been initialized for
> + *                      a device
> + * @dev: the device
> + *
> + * Drivers may call this function to test if vblank support is
> + * initialized for a device. For most hardware this means that vblanking
> + * can also be enabled.
> + *
> + * Atomic helpers use this function to initialize
> + * &drm_crtc_state.no_vblank. See also drm_atomic_helper_check_modeset().
> + *
> + * Returns:
> + * True if vblanking has been initialized for the given device, false
> + * otherwise.
> + */
> +bool drm_dev_has_vblank(const struct drm_device *dev)
> +{
> +	return dev->num_crtcs != 0;
> +}
> +EXPORT_SYMBOL(drm_dev_has_vblank);
> +
>  /**
>   * drm_crtc_vblank_waitqueue - get vblank waitqueue for the CRTC
>   * @crtc: which CRTC's vblank waitqueue to retrieve
> diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
> index 5e9b15a0e8c5..5363e31c9abe 100644
> --- a/include/drm/drm_crtc.h
> +++ b/include/drm/drm_crtc.h
> @@ -174,12 +174,22 @@ struct drm_crtc_state {
>  	 * @no_vblank:
>  	 *
>  	 * Reflects the ability of a CRTC to send VBLANK events. This state
> -	 * usually depends on the pipeline configuration, and the main usuage
> -	 * is CRTCs feeding a writeback connector operating in oneshot mode.
> -	 * In this case the VBLANK event is only generated when a job is queued
> -	 * to the writeback connector, and we want the core to fake VBLANK
> -	 * events when this part of the pipeline hasn't changed but others had
> -	 * or when the CRTC and connectors are being disabled.
> +	 * usually depends on the pipeline configuration. If set to true, DRM
> +	 * atomic helpers will sendout a fake VBLANK event during display

s/sendout/ send out/

> +	 * updates.

maby add "... updates, after all hardware changes have been committed.
This is implemented in drm_atomic_helper_fake_vblank()."

That at least reflects the default behaviour.

> +	 *
> +	 * One usage is for drivers and/or hardware without support for VBLANK
> +	 * interrupts. Such drivers typically do not initialize vblanking
> +	 * (i.e., call drm_vblank_init() wit the number of CRTCs). For CRTCs

s/wit/with/

> +	 * without initialized vblanking, the field is initialized to true and

"initialized to true" is a bit a stretch, since this is done in the
helpers. Maybe instead "... this field is set to true in
drm_atomic_helper_check_modeset() and ..."

> +	 * a VBLANK event will be send out on each update of the display
> +	 * pipeline.

Maybe also reiterate that this is done through
drm_atomic_helper_fake_vblank() again? Imo for stuff done by helpers it's
important to highligh where that's done, since it's all opt-in (even if
most drivers will opt-in automatically).

> +	 *
> +	 * Another usage is CRTCs feeding a writeback connector operating in
> +	 * oneshot mode. In this case the VBLANK event is only generated when
> +	 * a job is queued to the writeback connector, and we want the core
> +	 * to fake VBLANK events when this part of the pipeline hasn't changed
> +	 * but others had or when the CRTC and connectors are being disabled.
>  	 *
>  	 * __drm_atomic_helper_crtc_duplicate_state() will not reset the value
>  	 * from the current state, the CRTC driver is then responsible for
> @@ -335,7 +345,10 @@ struct drm_crtc_state {
>  	 *  - Events for disabled CRTCs are not allowed, and drivers can ignore
>  	 *    that case.
>  	 *
> -	 * This can be handled by the drm_crtc_send_vblank_event() function,
> +	 * For very simple hardware without VBLANK interrupt, enabling
> +	 * &struct drm_crtc_state.no_vblank makes DRM's atomic commit helpers
> +	 * send the event at an appropriate time. For more complex hardware this
> +	 * can be handled by the drm_crtc_send_vblank_event() function,
>  	 * which the driver should call on the provided event upon completion of
>  	 * the atomic commit. Note that if the driver supports vblank signalling
>  	 * and timestamping the vblank counters and timestamps must agree with
> diff --git a/include/drm/drm_simple_kms_helper.h b/include/drm/drm_simple_kms_helper.h
> index 15afee9cf049..e253ba7bea9d 100644
> --- a/include/drm/drm_simple_kms_helper.h
> +++ b/include/drm/drm_simple_kms_helper.h
> @@ -100,8 +100,11 @@ struct drm_simple_display_pipe_funcs {
>  	 * This is the function drivers should submit the
>  	 * &drm_pending_vblank_event from. Using either
>  	 * drm_crtc_arm_vblank_event(), when the driver supports vblank
> -	 * interrupt handling, or drm_crtc_send_vblank_event() directly in case
> -	 * the hardware lacks vblank support entirely.
> +	 * interrupt handling, or drm_crtc_send_vblank_event() for more
> +	 * complex case. In case the hardware lacks vblank support entirely,
> +	 * drivers can set &struct drm_crtc_state.no_vblank in
> +	 * &struct drm_simple_display_pipe_funcs.check and let DRM's
> +	 * atomic helper fake a vblank event.
>  	 */
>  	void (*update)(struct drm_simple_display_pipe *pipe,
>  		       struct drm_plane_state *old_plane_state);
> diff --git a/include/drm/drm_vblank.h b/include/drm/drm_vblank.h
> index c16c44052b3d..94275e93fd27 100644
> --- a/include/drm/drm_vblank.h
> +++ b/include/drm/drm_vblank.h
> @@ -206,6 +206,7 @@ struct drm_vblank_crtc {
>  };
>  
>  int drm_vblank_init(struct drm_device *dev, unsigned int num_crtcs);
> +bool drm_dev_has_vblank(const struct drm_device *dev);
>  u64 drm_crtc_vblank_count(struct drm_crtc *crtc);
>  u64 drm_crtc_vblank_count_and_time(struct drm_crtc *crtc,
>  				   ktime_t *vblanktime);

With the doc nits addressed:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

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
