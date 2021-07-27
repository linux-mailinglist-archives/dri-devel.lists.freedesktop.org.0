Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C01663D7226
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 11:39:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E97826E94A;
	Tue, 27 Jul 2021 09:39:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 445756E94A
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 09:39:46 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id h14so6447142wrx.10
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 02:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=kDmkw1EqHL3aF4RUhWn55hPa3djBJFLDK2P/5+N6cFg=;
 b=DZXF9NSUWCMixAOV12GXeIliwcu4mz81nJmbst9CbLExgZq21eweuMxkjZPdfkZmqo
 tjIahswu7jV9vttN4d2DpvLRUG2PTXpU39tJ9Y4Bcg3znYvJOkWvClfcfARlLo1UgQHs
 z0/Rkz1bTeavxIOFFhTAacX7f2NHluea4bH6A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=kDmkw1EqHL3aF4RUhWn55hPa3djBJFLDK2P/5+N6cFg=;
 b=LZRCI3Qf9BaKjG7e91sVW6E0UPkKCLJrFQTxf96ZLbk/DjpdZngwQABc95NERBjBmW
 o9gOIWVR9qNxSYIZZjAPn2qHHQSV0yDOoyvaNZvV3wL5phB5/ZLV/zn+/Sfk1zJJ1RKI
 Uu42hRjBcltiHfjMtxS82+aCi2YnZMKYNAyFSHcyFjaSg0mbHQm9BksQ8Vs9l/GbMqEf
 XF/5uQdTGYEKEEDbQtWzC/Esdxc7R5HaRjblNfnE3sRnkAWvXFWVwr258XPLE57yL9ja
 uVOWOkado0vYN55Wx176Lkt9rR4hpI/zgVamlugI2Z7O2Vmki8SZtJ6lpIofFgHGcnZS
 JLzA==
X-Gm-Message-State: AOAM5319Vl+I9k9vLRKNXE8EUzN8p1wVzwXmSLVZEFnDFXszQwGPRle+
 /7Wh45Lnix4lWM2pX4zwbYXCh6P29QZ8wg==
X-Google-Smtp-Source: ABdhPJwwISVvARQ3TmUGUlldYHWRSunkngn+ziJ4YKKtJ82pZzeSHU6Q1WZUd+krCx43l4EbkL2fKQ==
X-Received: by 2002:a5d:5906:: with SMTP id v6mr26823wrd.194.1627378784753;
 Tue, 27 Jul 2021 02:39:44 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id e11sm3224485wrt.0.2021.07.27.02.39.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 02:39:44 -0700 (PDT)
Date: Tue, 27 Jul 2021 11:39:42 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v2] drm: add logging for RMFB ioctl
Message-ID: <YP/UXrNDk25LB2Y2@phenom.ffwll.local>
References: <EghsoRDcn1SJV0nxVqRCisPd7v0627yLZbBjn4A8Yg@cp3-web-048.plabs.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <EghsoRDcn1SJV0nxVqRCisPd7v0627yLZbBjn4A8Yg@cp3-web-048.plabs.ch>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 26, 2021 at 07:49:06AM +0000, Simon Ser wrote:
> We already have logging for ADDFB2. Add some logging for RMFB as
> well.
> 
> This can be handy when trying to find out why a CRTC gets magically
> disabled.
> 
> v2: make log message more explicit, add log messages to
> drm_framebuffer_remove (Daniel)
> 
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/drm_framebuffer.c | 22 +++++++++++++++++++++-
>  1 file changed, 21 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_framebuffer.c
> index 4d01464b6f95..d3d09aba9833 100644
> --- a/drivers/gpu/drm/drm_framebuffer.c
> +++ b/drivers/gpu/drm/drm_framebuffer.c
> @@ -404,6 +404,9 @@ static void drm_mode_rmfb_work_fn(struct work_struct *w)
>  		struct drm_framebuffer *fb =
>  			list_first_entry(&arg->fbs, typeof(*fb), filp_head);
>  
> +		drm_dbg_kms(fb->dev,
> +			    "Removing [FB:%d] from all active usage due to RMFB ioctl\n",
> +			    fb->base.id);
>  		list_del_init(&fb->filp_head);
>  		drm_framebuffer_remove(fb);
>  	}
> @@ -981,6 +984,10 @@ static int atomic_remove_fb(struct drm_framebuffer *fb)
>  		if (plane->state->fb != fb)
>  			continue;
>  
> +		drm_dbg_kms(dev,
> +			    "Disabling [PLANE:%d:%s] because [FB:%d] is removed\n",
> +			    plane->base.id, plane->name, fb->base.id);
> +
>  		plane_state = drm_atomic_get_plane_state(state, plane);
>  		if (IS_ERR(plane_state)) {
>  			ret = PTR_ERR(plane_state);
> @@ -990,6 +997,11 @@ static int atomic_remove_fb(struct drm_framebuffer *fb)
>  		if (disable_crtcs && plane_state->crtc->primary == plane) {
>  			struct drm_crtc_state *crtc_state;
>  
> +			drm_dbg_kms(dev,
> +				    "Disabling [CRTC:%d:%s] because [FB:%d] is removed\n",
> +				    plane_state->crtc->base.id,
> +				    plane_state->crtc->name, fb->base.id);
> +
>  			crtc_state = drm_atomic_get_existing_crtc_state(state, plane_state->crtc);
>  
>  			ret = drm_atomic_add_affected_connectors(state, plane_state->crtc);
> @@ -1052,6 +1064,10 @@ static void legacy_remove_fb(struct drm_framebuffer *fb)
>  	/* remove from any CRTC */
>  	drm_for_each_crtc(crtc, dev) {
>  		if (crtc->primary->fb == fb) {
> +			drm_dbg_kms(dev,
> +				    "Disabling [CRTC:%d:%s] because [FB:%d] is removed\n",
> +				    crtc->base.id, crtc->name, fb->base.id);
> +
>  			/* should turn off the crtc */
>  			if (drm_crtc_force_disable(crtc))
>  				DRM_ERROR("failed to reset crtc %p when fb was deleted\n", crtc);
> @@ -1059,8 +1075,12 @@ static void legacy_remove_fb(struct drm_framebuffer *fb)
>  	}
>  
>  	drm_for_each_plane(plane, dev) {
> -		if (plane->fb == fb)
> +		if (plane->fb == fb) {
> +			drm_dbg_kms(dev,
> +				    "Disabling [PLANE:%d:%s] because [FB:%d] is removed\n",
> +				    plane->base.id, plane->name, fb->base.id);
>  			drm_plane_force_disable(plane);
> +		}
>  	}
>  	drm_modeset_unlock_all(dev);
>  }
> -- 
> 2.32.0
> 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
