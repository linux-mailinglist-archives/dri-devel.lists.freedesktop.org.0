Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C31A1388AB
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2020 00:00:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B7488972D;
	Sun, 12 Jan 2020 23:00:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40F3B8972D
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Jan 2020 23:00:52 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id x185so3956423pfc.5
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Jan 2020 15:00:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=CwfMuvC2hvYR0XTpj3sBClHWpepFkZYtWFnlziVzfFk=;
 b=ieUC2cli8MCv7mHQt8+GMdqSkuPB0kYCgS+7yID38EOzzqRncDfnfLTCQJ+DVOZ+2R
 xXap0zJpcRxQlfIEfd72SMgYdrmFQ/uiNaDcH20Tu+CJ4PlMAgIsIqeOvTurdHRQ0Dfh
 FsnpenDt/Ieixvy7cFlHxztCqFVgZb+YhvFys=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=CwfMuvC2hvYR0XTpj3sBClHWpepFkZYtWFnlziVzfFk=;
 b=U55ssFf5FAlQ6qDySN6mmVFkEKPFJEg/A2rmkTWO6zNJ5nPjQUo2tlo5tWn5zJOLVt
 0LA1ZEbDQ/CPyKHRb0xPS5KItTevmcO/wWvWW34piZyOpvwmEVBZhX5mVMrl3PHuXn+U
 KVI7h8qTIP3h00cc66WZWCrxZCyJ9ZZLFbriuEYdgH1z/JJLHhY+lYjOGtGg3V73xe4C
 Ou56YyEC6eUzp0xNcYGdn+3EBsT3p/YSfdAk/yzqe2ChA0hUUDO9QnUlyvcbKfsmKnYF
 uKtAQAeZmuaDp3gpu0676twmS09St1Bn5JbdbGJRKxh8OzflO7WDe16DL99yTQbm59j3
 Lcag==
X-Gm-Message-State: APjAAAVKE7ddLzpAGQyAHs7FqYg5BJ1qc6JQcewgGJNMGSdEzzvQNcYw
 UAXZ/VXPGt71sSrdolmmyIOZkJE02q+wmA==
X-Google-Smtp-Source: APXvYqy02e8v8/s0tOnLAMFwoGvwXVi5pgKf19gDRUkhvGwfqbOiP5PiRyxfLsEi4gRtVULKXEKyYA==
X-Received: by 2002:aa7:9d87:: with SMTP id f7mr16616440pfq.138.1578870051961; 
 Sun, 12 Jan 2020 15:00:51 -0800 (PST)
Received: from dvetter-linux.ger.corp.intel.com ([138.44.248.126])
 by smtp.gmail.com with ESMTPSA id i3sm11767518pfo.72.2020.01.12.15.00.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Jan 2020 15:00:51 -0800 (PST)
Date: Mon, 13 Jan 2020 00:00:45 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/cirrus: Let DRM core send VBLANK events
Message-ID: <20200112230045.GE5340@dvetter-linux.ger.corp.intel.com>
References: <20200110115707.14080-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200110115707.14080-1-tzimmermann@suse.de>
X-Operating-System: Linux dvetter-linux.ger.corp.intel.com
 5.2.11-200.fc30.x86_64 
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
Cc: airlied@redhat.com, dri-devel@lists.freedesktop.org, kraxel@redhat.com,
 virtualization@lists.linux-foundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 10, 2020 at 12:57:07PM +0100, Thomas Zimmermann wrote:
> In drm_atomic_helper_fake_vblank() the DRM core sends out VBLANK
> events if struct drm_crtc_state.no_vblank is enabled. Replace cirrus'
> VBLANK events with the DRM core's functionality.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/cirrus/cirrus.c | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/cirrus/cirrus.c b/drivers/gpu/drm/cirrus/cirrus.c
> index 248c9f765c45..4a1729aa7e53 100644
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
> @@ -415,6 +414,8 @@ static void cirrus_pipe_enable(struct drm_simple_display_pipe *pipe,
>  {
>  	struct cirrus_device *cirrus = pipe->crtc.dev->dev_private;
>  
> +	crtc_state->no_vblank = true;

Huh, nice untended use of this stuff ... We've added this for writeback,
but I guess it can be used for anything that's a virtual connector ...

I've also spotted that you've done this same trick for ast & udl already.
But I think before we roll this out massively we should make this
official. Can you pls do a patch to update the kerneldoc for @no_vblank
that virtual hw can also use this stuff?

Also, computing state values in atomic_commit code is kinda uncool and
fraught with peril - design assumption is that with some very few
exceptions (which are kinda awkward, would be nice to make state pointers
const) all the core and helper codes that state structures stay unchanged
after atomic_check completed. This should be computed in atomic_check (like vc4
does). Can you pls also include patches to update ast and udl in this
series?

Thanks, Daniel


> +
>  	cirrus_mode_set(cirrus, &crtc_state->mode, plane_state->fb);
>  	cirrus_fb_blit_fullscreen(plane_state->fb);
>  }
> @@ -434,13 +435,6 @@ static void cirrus_pipe_update(struct drm_simple_display_pipe *pipe,
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
