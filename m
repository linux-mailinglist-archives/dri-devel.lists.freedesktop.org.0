Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD74144DE5
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2020 09:48:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1BA86F427;
	Wed, 22 Jan 2020 08:48:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA6806F42F
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2020 08:48:00 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id f129so6242890wmf.2
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2020 00:48:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Uq5t2nHKeAbata66c80z73yaauEQidgUJUc1sD9+41c=;
 b=UKSBiEYw2Ff2u9o8skUQjAGWRCWizC/tt+PKPjMUuBS1MKwkZk7S9ZXRRirzOIGMcL
 ytEdLy/V5Esjgq08STJdU23PvuzyXx2x1yD+vek8h+lp7NLfYGioMcx0ybEQhz/JLzWz
 rDRRRwjScx3CMEbSKmp6XPOLGe1npQjEq9sYc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Uq5t2nHKeAbata66c80z73yaauEQidgUJUc1sD9+41c=;
 b=chMQvgYx+mV82esUHjT9xTGWNGEl2Je3/h/SZgIIwum3pFh7JsAqvfFQkSpiQhZd/m
 3AoaXsa1b9C1w8d+1JxqzHtiARHSY55rybwGPIyz9vP1qARB3IlVUn1jnMhmPt1YkOG2
 aqWbbEbMi1ptBecFK8reocAd738xPIvCcgxg0d2YUNpiuW0Kl9v7cfOPw9WSnolQmDsQ
 CbUJozKOtPLQGJaSgaQQV9Fw7BOHj+7Hnsl028eB5J8wALQdkM76EvjXJ0n8zw6YgN19
 3Yq8/KUVAYCtgKWQ66HxRQ6GTf/I7moXTK1mDMzNdbGVuMl1kH6B/GBQNZAPq2lr0tLq
 dhjQ==
X-Gm-Message-State: APjAAAUY0xYxcTc8s+HppSsEl3jwuPyzn+ANH8n98xDZiATKLkKqu3Vs
 Q4VeGmljBfuVpGS0glpeKyJMTg==
X-Google-Smtp-Source: APXvYqwUwlSIIgmpnI5/agyTykFWWTZ7dQHIO2RCE6ucbX6R8SaUXaZpU7ceSLj4x1bRORovWhX96Q==
X-Received: by 2002:a7b:c450:: with SMTP id l16mr1801170wmi.31.1579682878837; 
 Wed, 22 Jan 2020 00:47:58 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id y7sm3867654wmd.1.2020.01.22.00.47.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jan 2020 00:47:58 -0800 (PST)
Date: Wed, 22 Jan 2020 09:47:56 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 2/4] drm: Initialize struct drm_crtc_state.no_vblank
 from device settings
Message-ID: <20200122084756.GQ43062@phenom.ffwll.local>
References: <20200120122051.25178-1-tzimmermann@suse.de>
 <20200120122051.25178-3-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200120122051.25178-3-tzimmermann@suse.de>
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

On Mon, Jan 20, 2020 at 01:20:49PM +0100, Thomas Zimmermann wrote:
> At the end of a commit, atomic helpers can generate a VBLANK event
> automatically. Originally implemented for writeback connectors, the
> functionality can be used by any driver and/or hardware without proper
> VBLANK interrupt.
> 
> First of all, the patch updates the documentation to make this behaviour
> official: settings struct drm_crtc_state.no_vblank to true enables
> automatic VBLANK generation.
> 
> Atomic modesetting helper set the initial value of no_vblank in
> drm_atomic_helper_check_modeset(). If vblanking has been initialized
> for a CRTC, no_blank is disabled. Otherwise it's enabled. Hence,
> atomic helpers will automatically send out VBLANK events with any
> driver that did not initialize vblanking.
> 
> As drivers previously send out VBLANK events by themselves, all
> affected drivers have to be updated as well. Usually, deleting the
> driver's vblanking code is sufficient. Xen implements its own logic
> for generating events and therefore needs to override no_vblank
> with a value of false.
> 
> v3:
> 	* squash all related changes patches into this patch

Hm, since the fall-back only happens when the driver hasn't sent out the
even I think it'd be safe to split the driver cleanups into a separate
patch. Makes the core/helper changes stand out more properly.

Even the xen hunk I think isn't strictly needed, since that pick up the
event correctly and clears state->event to NULL.

> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/arc/arcpgu_crtc.c        | 16 --------------
>  drivers/gpu/drm/bochs/bochs_kms.c        |  9 --------
>  drivers/gpu/drm/cirrus/cirrus.c          |  8 -------
>  drivers/gpu/drm/drm_atomic_helper.c      | 10 ++++++++-
>  drivers/gpu/drm/drm_mipi_dbi.c           |  9 --------
>  drivers/gpu/drm/drm_vblank.c             |  9 ++++++++
>  drivers/gpu/drm/qxl/qxl_display.c        | 14 ------------
>  drivers/gpu/drm/tiny/gm12u320.c          |  9 --------
>  drivers/gpu/drm/tiny/ili9225.c           |  9 --------
>  drivers/gpu/drm/tiny/repaper.c           |  9 --------
>  drivers/gpu/drm/tiny/st7586.c            |  9 --------
>  drivers/gpu/drm/vboxvideo/vbox_mode.c    | 12 -----------
>  drivers/gpu/drm/virtio/virtgpu_display.c |  8 -------
>  drivers/gpu/drm/xen/xen_drm_front_kms.c  | 13 ++++++++++++
>  include/drm/drm_crtc.h                   | 27 ++++++++++++++++++------
>  include/drm/drm_simple_kms_helper.h      |  7 ++++--
>  16 files changed, 56 insertions(+), 122 deletions(-)
> 
> diff --git a/drivers/gpu/drm/arc/arcpgu_crtc.c b/drivers/gpu/drm/arc/arcpgu_crtc.c
> index 8ae1e1f97a73..be7c29cec318 100644
> --- a/drivers/gpu/drm/arc/arcpgu_crtc.c
> +++ b/drivers/gpu/drm/arc/arcpgu_crtc.c
> @@ -9,7 +9,6 @@
>  #include <drm/drm_device.h>
>  #include <drm/drm_fb_cma_helper.h>
>  #include <drm/drm_gem_cma_helper.h>
> -#include <drm/drm_vblank.h>
>  #include <drm/drm_plane_helper.h>
>  #include <drm/drm_probe_helper.h>
>  #include <linux/clk.h>
> @@ -138,24 +137,9 @@ static void arc_pgu_crtc_atomic_disable(struct drm_crtc *crtc,
>  			      ~ARCPGU_CTRL_ENABLE_MASK);
>  }
>  
> -static void arc_pgu_crtc_atomic_begin(struct drm_crtc *crtc,
> -				      struct drm_crtc_state *state)
> -{
> -	struct drm_pending_vblank_event *event = crtc->state->event;
> -
> -	if (event) {
> -		crtc->state->event = NULL;
> -
> -		spin_lock_irq(&crtc->dev->event_lock);
> -		drm_crtc_send_vblank_event(crtc, event);
> -		spin_unlock_irq(&crtc->dev->event_lock);
> -	}
> -}
> -
>  static const struct drm_crtc_helper_funcs arc_pgu_crtc_helper_funcs = {
>  	.mode_valid	= arc_pgu_crtc_mode_valid,
>  	.mode_set_nofb	= arc_pgu_crtc_mode_set_nofb,
> -	.atomic_begin	= arc_pgu_crtc_atomic_begin,
>  	.atomic_enable	= arc_pgu_crtc_atomic_enable,
>  	.atomic_disable	= arc_pgu_crtc_atomic_disable,
>  };
> diff --git a/drivers/gpu/drm/bochs/bochs_kms.c b/drivers/gpu/drm/bochs/bochs_kms.c
> index 3f0006c2470d..ff275faee88d 100644
> --- a/drivers/gpu/drm/bochs/bochs_kms.c
> +++ b/drivers/gpu/drm/bochs/bochs_kms.c
> @@ -7,7 +7,6 @@
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_gem_framebuffer_helper.h>
>  #include <drm/drm_probe_helper.h>
> -#include <drm/drm_vblank.h>
>  
>  #include "bochs.h"
>  
> @@ -57,16 +56,8 @@ static void bochs_pipe_update(struct drm_simple_display_pipe *pipe,
>  			      struct drm_plane_state *old_state)
>  {
>  	struct bochs_device *bochs = pipe->crtc.dev->dev_private;
> -	struct drm_crtc *crtc = &pipe->crtc;
>  
>  	bochs_plane_update(bochs, pipe->plane.state);
> -
> -	if (crtc->state->event) {
> -		spin_lock_irq(&crtc->dev->event_lock);
> -		drm_crtc_send_vblank_event(crtc, crtc->state->event);
> -		crtc->state->event = NULL;
> -		spin_unlock_irq(&crtc->dev->event_lock);
> -	}
>  }
>  
>  static const struct drm_simple_display_pipe_funcs bochs_pipe_funcs = {
> diff --git a/drivers/gpu/drm/cirrus/cirrus.c b/drivers/gpu/drm/cirrus/cirrus.c
> index 248c9f765c45..a91fb0d7282c 100644
> --- a/drivers/gpu/drm/cirrus/cirrus.c
> +++ b/drivers/gpu/drm/cirrus/cirrus.c
> @@ -38,7 +38,6 @@
>  #include <drm/drm_modeset_helper_vtables.h>
>  #include <drm/drm_probe_helper.h>
>  #include <drm/drm_simple_kms_helper.h>
> -#include <drm/drm_vblank.h>
>  
>  #define DRIVER_NAME "cirrus"
>  #define DRIVER_DESC "qemu cirrus vga"
> @@ -434,13 +433,6 @@ static void cirrus_pipe_update(struct drm_simple_display_pipe *pipe,
>  
>  	if (drm_atomic_helper_damage_merged(old_state, state, &rect))
>  		cirrus_fb_blit_rect(pipe->plane.state->fb, &rect);
> -
> -	if (crtc->state->event) {
> -		spin_lock_irq(&crtc->dev->event_lock);
> -		drm_crtc_send_vblank_event(crtc, crtc->state->event);
> -		crtc->state->event = NULL;
> -		spin_unlock_irq(&crtc->dev->event_lock);
> -	}
>  }
>  
>  static const struct drm_simple_display_pipe_funcs cirrus_pipe_funcs = {
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> index 4511c2e07bb9..6e9c730a8919 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -583,6 +583,7 @@ mode_valid(struct drm_atomic_state *state)
>   * &drm_crtc_state.connectors_changed is set when a connector is added or
>   * removed from the CRTC.  &drm_crtc_state.active_changed is set when
>   * &drm_crtc_state.active changes, which is used for DPMS.
> + * &drm_crtc_state.no_vblank is set from the result of drm_crtc_has_vblank().
>   * See also: drm_atomic_crtc_needs_modeset()
>   *
>   * IMPORTANT:
> @@ -649,6 +650,11 @@ drm_atomic_helper_check_modeset(struct drm_device *dev,
>  
>  			return -EINVAL;
>  		}
> +
> +		if (drm_crtc_has_vblank(crtc))
> +			new_crtc_state->no_vblank = false;
> +		else
> +			new_crtc_state->no_vblank = true;

Yeah this looks much better than my hack :-)

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

I still think we should reword this entire paragraph to make the "hw has
no vblank" the main use-case, with writeback connectors as the "Also used
for ..." special case.

>   *
>   * This is part of the atomic helper support for nonblocking commits, see
>   * drm_atomic_helper_setup_commit() for an overview.
> diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.c
> index 16bff1be4b8a..13b753cb3f67 100644
> --- a/drivers/gpu/drm/drm_mipi_dbi.c
> +++ b/drivers/gpu/drm/drm_mipi_dbi.c
> @@ -24,7 +24,6 @@
>  #include <drm/drm_modes.h>
>  #include <drm/drm_probe_helper.h>
>  #include <drm/drm_rect.h>
> -#include <drm/drm_vblank.h>
>  #include <video/mipi_display.h>
>  
>  #define MIPI_DBI_MAX_SPI_READ_SPEED 2000000 /* 2MHz */
> @@ -299,18 +298,10 @@ void mipi_dbi_pipe_update(struct drm_simple_display_pipe *pipe,
>  			  struct drm_plane_state *old_state)
>  {
>  	struct drm_plane_state *state = pipe->plane.state;
> -	struct drm_crtc *crtc = &pipe->crtc;
>  	struct drm_rect rect;
>  
>  	if (drm_atomic_helper_damage_merged(old_state, state, &rect))
>  		mipi_dbi_fb_dirty(state->fb, &rect);
> -
> -	if (crtc->state->event) {
> -		spin_lock_irq(&crtc->dev->event_lock);
> -		drm_crtc_send_vblank_event(crtc, crtc->state->event);
> -		spin_unlock_irq(&crtc->dev->event_lock);
> -		crtc->state->event = NULL;
> -	}
>  }
>  EXPORT_SYMBOL(mipi_dbi_pipe_update);
>  
> diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
> index c20102899411..d1d39ae47b0e 100644
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
> @@ -510,6 +516,9 @@ EXPORT_SYMBOL(drm_vblank_init);
>   * initialized for a CRTC. For most hardware this means that vblanking
>   * can also be enabled on the CRTC.
>   *
> + * Atomic helpers use this function to initialize
> + * &drm_crtc_state.no_vblank. See also drm_atomic_helper_check_modeset().
> + *
>   * Returns:
>   * True if vblanking has been initialized for the given CRTC, false
>   * otherwise.
> diff --git a/drivers/gpu/drm/qxl/qxl_display.c b/drivers/gpu/drm/qxl/qxl_display.c
> index 16d73b22f3f5..ab4f8dd00400 100644
> --- a/drivers/gpu/drm/qxl/qxl_display.c
> +++ b/drivers/gpu/drm/qxl/qxl_display.c
> @@ -31,7 +31,6 @@
>  #include <drm/drm_gem_framebuffer_helper.h>
>  #include <drm/drm_plane_helper.h>
>  #include <drm/drm_probe_helper.h>
> -#include <drm/drm_vblank.h>
>  
>  #include "qxl_drv.h"
>  #include "qxl_object.h"
> @@ -372,19 +371,6 @@ static void qxl_crtc_update_monitors_config(struct drm_crtc *crtc,
>  static void qxl_crtc_atomic_flush(struct drm_crtc *crtc,
>  				  struct drm_crtc_state *old_crtc_state)
>  {
> -	struct drm_device *dev = crtc->dev;
> -	struct drm_pending_vblank_event *event;
> -	unsigned long flags;
> -
> -	if (crtc->state && crtc->state->event) {
> -		event = crtc->state->event;
> -		crtc->state->event = NULL;
> -
> -		spin_lock_irqsave(&dev->event_lock, flags);
> -		drm_crtc_send_vblank_event(crtc, event);
> -		spin_unlock_irqrestore(&dev->event_lock, flags);
> -	}
> -
>  	qxl_crtc_update_monitors_config(crtc, "flush");
>  }
>  
> diff --git a/drivers/gpu/drm/tiny/gm12u320.c b/drivers/gpu/drm/tiny/gm12u320.c
> index 94fb1f593564..a48173441ae0 100644
> --- a/drivers/gpu/drm/tiny/gm12u320.c
> +++ b/drivers/gpu/drm/tiny/gm12u320.c
> @@ -22,7 +22,6 @@
>  #include <drm/drm_modeset_helper_vtables.h>
>  #include <drm/drm_probe_helper.h>
>  #include <drm/drm_simple_kms_helper.h>
> -#include <drm/drm_vblank.h>
>  
>  static bool eco_mode;
>  module_param(eco_mode, bool, 0644);
> @@ -610,18 +609,10 @@ static void gm12u320_pipe_update(struct drm_simple_display_pipe *pipe,
>  				 struct drm_plane_state *old_state)
>  {
>  	struct drm_plane_state *state = pipe->plane.state;
> -	struct drm_crtc *crtc = &pipe->crtc;
>  	struct drm_rect rect;
>  
>  	if (drm_atomic_helper_damage_merged(old_state, state, &rect))
>  		gm12u320_fb_mark_dirty(pipe->plane.state->fb, &rect);
> -
> -	if (crtc->state->event) {
> -		spin_lock_irq(&crtc->dev->event_lock);
> -		drm_crtc_send_vblank_event(crtc, crtc->state->event);
> -		crtc->state->event = NULL;
> -		spin_unlock_irq(&crtc->dev->event_lock);
> -	}
>  }
>  
>  static const struct drm_simple_display_pipe_funcs gm12u320_pipe_funcs = {
> diff --git a/drivers/gpu/drm/tiny/ili9225.c b/drivers/gpu/drm/tiny/ili9225.c
> index c66acc566c2b..802fb8dde1b6 100644
> --- a/drivers/gpu/drm/tiny/ili9225.c
> +++ b/drivers/gpu/drm/tiny/ili9225.c
> @@ -26,7 +26,6 @@
>  #include <drm/drm_gem_framebuffer_helper.h>
>  #include <drm/drm_mipi_dbi.h>
>  #include <drm/drm_rect.h>
> -#include <drm/drm_vblank.h>
>  
>  #define ILI9225_DRIVER_READ_CODE	0x00
>  #define ILI9225_DRIVER_OUTPUT_CONTROL	0x01
> @@ -165,18 +164,10 @@ static void ili9225_pipe_update(struct drm_simple_display_pipe *pipe,
>  				struct drm_plane_state *old_state)
>  {
>  	struct drm_plane_state *state = pipe->plane.state;
> -	struct drm_crtc *crtc = &pipe->crtc;
>  	struct drm_rect rect;
>  
>  	if (drm_atomic_helper_damage_merged(old_state, state, &rect))
>  		ili9225_fb_dirty(state->fb, &rect);
> -
> -	if (crtc->state->event) {
> -		spin_lock_irq(&crtc->dev->event_lock);
> -		drm_crtc_send_vblank_event(crtc, crtc->state->event);
> -		spin_unlock_irq(&crtc->dev->event_lock);
> -		crtc->state->event = NULL;
> -	}
>  }
>  
>  static void ili9225_pipe_enable(struct drm_simple_display_pipe *pipe,
> diff --git a/drivers/gpu/drm/tiny/repaper.c b/drivers/gpu/drm/tiny/repaper.c
> index 76d179200775..183484595aea 100644
> --- a/drivers/gpu/drm/tiny/repaper.c
> +++ b/drivers/gpu/drm/tiny/repaper.c
> @@ -33,7 +33,6 @@
>  #include <drm/drm_gem_framebuffer_helper.h>
>  #include <drm/drm_modes.h>
>  #include <drm/drm_rect.h>
> -#include <drm/drm_vblank.h>
>  #include <drm/drm_probe_helper.h>
>  #include <drm/drm_simple_kms_helper.h>
>  
> @@ -856,18 +855,10 @@ static void repaper_pipe_update(struct drm_simple_display_pipe *pipe,
>  				struct drm_plane_state *old_state)
>  {
>  	struct drm_plane_state *state = pipe->plane.state;
> -	struct drm_crtc *crtc = &pipe->crtc;
>  	struct drm_rect rect;
>  
>  	if (drm_atomic_helper_damage_merged(old_state, state, &rect))
>  		repaper_fb_dirty(state->fb);
> -
> -	if (crtc->state->event) {
> -		spin_lock_irq(&crtc->dev->event_lock);
> -		drm_crtc_send_vblank_event(crtc, crtc->state->event);
> -		spin_unlock_irq(&crtc->dev->event_lock);
> -		crtc->state->event = NULL;
> -	}
>  }
>  
>  static const struct drm_simple_display_pipe_funcs repaper_pipe_funcs = {
> diff --git a/drivers/gpu/drm/tiny/st7586.c b/drivers/gpu/drm/tiny/st7586.c
> index 060cc756194f..9ef559dd3191 100644
> --- a/drivers/gpu/drm/tiny/st7586.c
> +++ b/drivers/gpu/drm/tiny/st7586.c
> @@ -23,7 +23,6 @@
>  #include <drm/drm_gem_framebuffer_helper.h>
>  #include <drm/drm_mipi_dbi.h>
>  #include <drm/drm_rect.h>
> -#include <drm/drm_vblank.h>
>  
>  /* controller-specific commands */
>  #define ST7586_DISP_MODE_GRAY	0x38
> @@ -159,18 +158,10 @@ static void st7586_pipe_update(struct drm_simple_display_pipe *pipe,
>  			       struct drm_plane_state *old_state)
>  {
>  	struct drm_plane_state *state = pipe->plane.state;
> -	struct drm_crtc *crtc = &pipe->crtc;
>  	struct drm_rect rect;
>  
>  	if (drm_atomic_helper_damage_merged(old_state, state, &rect))
>  		st7586_fb_dirty(state->fb, &rect);
> -
> -	if (crtc->state->event) {
> -		spin_lock_irq(&crtc->dev->event_lock);
> -		drm_crtc_send_vblank_event(crtc, crtc->state->event);
> -		spin_unlock_irq(&crtc->dev->event_lock);
> -		crtc->state->event = NULL;
> -	}
>  }
>  
>  static void st7586_pipe_enable(struct drm_simple_display_pipe *pipe,
> diff --git a/drivers/gpu/drm/vboxvideo/vbox_mode.c b/drivers/gpu/drm/vboxvideo/vbox_mode.c
> index 19612132c8a3..8b7f005c4d20 100644
> --- a/drivers/gpu/drm/vboxvideo/vbox_mode.c
> +++ b/drivers/gpu/drm/vboxvideo/vbox_mode.c
> @@ -18,7 +18,6 @@
>  #include <drm/drm_gem_framebuffer_helper.h>
>  #include <drm/drm_plane_helper.h>
>  #include <drm/drm_probe_helper.h>
> -#include <drm/drm_vblank.h>
>  
>  #include "hgsmi_channels.h"
>  #include "vbox_drv.h"
> @@ -226,17 +225,6 @@ static void vbox_crtc_atomic_disable(struct drm_crtc *crtc,
>  static void vbox_crtc_atomic_flush(struct drm_crtc *crtc,
>  				   struct drm_crtc_state *old_crtc_state)
>  {
> -	struct drm_pending_vblank_event *event;
> -	unsigned long flags;
> -
> -	if (crtc->state && crtc->state->event) {
> -		event = crtc->state->event;
> -		crtc->state->event = NULL;
> -
> -		spin_lock_irqsave(&crtc->dev->event_lock, flags);
> -		drm_crtc_send_vblank_event(crtc, event);
> -		spin_unlock_irqrestore(&crtc->dev->event_lock, flags);
> -	}
>  }
>  
>  static const struct drm_crtc_helper_funcs vbox_crtc_helper_funcs = {
> diff --git a/drivers/gpu/drm/virtio/virtgpu_display.c b/drivers/gpu/drm/virtio/virtgpu_display.c
> index 0966208ec30d..ecf4ba7cc32b 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_display.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_display.c
> @@ -30,7 +30,6 @@
>  #include <drm/drm_fourcc.h>
>  #include <drm/drm_gem_framebuffer_helper.h>
>  #include <drm/drm_probe_helper.h>
> -#include <drm/drm_vblank.h>
>  
>  #include "virtgpu_drv.h"
>  
> @@ -121,13 +120,6 @@ static int virtio_gpu_crtc_atomic_check(struct drm_crtc *crtc,
>  static void virtio_gpu_crtc_atomic_flush(struct drm_crtc *crtc,
>  					 struct drm_crtc_state *old_state)
>  {
> -	unsigned long flags;
> -
> -	spin_lock_irqsave(&crtc->dev->event_lock, flags);
> -	if (crtc->state->event)
> -		drm_crtc_send_vblank_event(crtc, crtc->state->event);
> -	crtc->state->event = NULL;
> -	spin_unlock_irqrestore(&crtc->dev->event_lock, flags);
>  }
>  
>  static const struct drm_crtc_helper_funcs virtio_gpu_crtc_helper_funcs = {
> diff --git a/drivers/gpu/drm/xen/xen_drm_front_kms.c b/drivers/gpu/drm/xen/xen_drm_front_kms.c
> index 4f34c5208180..efde4561836f 100644
> --- a/drivers/gpu/drm/xen/xen_drm_front_kms.c
> +++ b/drivers/gpu/drm/xen/xen_drm_front_kms.c
> @@ -220,6 +220,18 @@ static bool display_send_page_flip(struct drm_simple_display_pipe *pipe,
>  	return false;
>  }
>  
> +static int display_check(struct drm_simple_display_pipe *pipe,
> +			 struct drm_plane_state *plane_state,
> +			 struct drm_crtc_state *crtc_state)
> +{
> +	/* Make sure that DRM helpers don't send VBLANK events
> +	 * automatically. Xen has it's own logic to do so.
> +	 */
> +	crtc_state->no_vblank = false;
> +
> +	return 0;
> +}
> +
>  static void display_update(struct drm_simple_display_pipe *pipe,
>  			   struct drm_plane_state *old_plane_state)
>  {
> @@ -284,6 +296,7 @@ static const struct drm_simple_display_pipe_funcs display_funcs = {
>  	.enable = display_enable,
>  	.disable = display_disable,
>  	.prepare_fb = drm_gem_fb_simple_display_pipe_prepare_fb,
> +	.check = display_check,
>  	.update = display_update,
>  };
>  
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
> +	 * updates.
> +	 *
> +	 * One usage is for drivers and/or hardware without support for VBLANK
> +	 * interrupts. Such drivers typically do not initialize vblanking
> +	 * (i.e., call drm_vblank_init() wit the number of CRTCs). For CRTCs
> +	 * without initialized vblanking, the field is initialized to true and

... is initialized to true in the atomic helpers by calling
drm_atomic_helper_check_modeset() and ...

Just to clarify that this isn't done for everyone by default, but a helper
thing.

> +	 * a VBLANK event will be send out on each update of the display
> +	 * pipeline.
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

With the kerneldoc fixed, for the core parts of this patch (driver changes
all split out):

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
