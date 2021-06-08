Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A2C39F22B
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 11:18:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0B6F6EB55;
	Tue,  8 Jun 2021 09:18:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2614A6EB55
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jun 2021 09:18:51 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id a20so20803404wrc.0
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Jun 2021 02:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=3bhq6qtWcjHlZB3mOOi8uKe0/ENCYsKG/DVsUuHuQL8=;
 b=dOLuFz1KuVyE5i4/cPfjHXgx3qbDYafH8MLQNcpJTad6hgbagJvgBfe9tO38qezBSf
 3bMXeHa9CAR7yzOlMTA/nVSlgS8E2rz0Dj0MTxd99Z3rPCUOfQZqzpjry/1GuT9vLKQc
 drBG1UBEOUHSl4xd9+cJs9HmZ6231rAsP38oo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3bhq6qtWcjHlZB3mOOi8uKe0/ENCYsKG/DVsUuHuQL8=;
 b=UVLMi0lsbx+0mzg3WC0nz4tkaFBYg+TdhT/7oRh7F8KJXSNhL8LhZ8jVat7MvCoxnQ
 sDA8CGd6EGGndp+v43beXZ/ld2dQCsoBbv6CzgABPXNxTH/3JIQVASWOJWHaMgMcXGPA
 0iLaZuiskxdL7uUo68bTHDHD9dsJ3RDJDdnhqYS8hWNb7dQCMNtcwPKBxblJs74Ml1ou
 1SBEplCzx4FBB5tFg9AY1XkJCiDZKwfurZ7FMMUdblU204cOl2+lQvSaFoZgkb/SGwda
 7HNpljdMwpoUEeN8MFvhlnzyQG4CC8Ju+r1/tqg/Fsej91/vwfz1EGsXl4f2oQ9/S/pW
 r11g==
X-Gm-Message-State: AOAM532BKGrtBM8i1XIVkhQFqQGAVJVvNWy+e4WPq3SIXVySExIX/rgo
 5yIN2VIHe7IF2fe4HcESc6Xg0Q==
X-Google-Smtp-Source: ABdhPJzvz0VKNXjxGR5C09X4H/KEdlcPjKtH36stkGNf7daNT0U6IukkrYBOZqZqxwFzB9ci55fbog==
X-Received: by 2002:a5d:5902:: with SMTP id v2mr21005537wrd.272.1623143929777; 
 Tue, 08 Jun 2021 02:18:49 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 89sm20289147wri.94.2021.06.08.02.18.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 02:18:49 -0700 (PDT)
Date: Tue, 8 Jun 2021 11:18:47 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm: Don't test for IRQ support in VBLANK ioctls
Message-ID: <YL8198Rj9lBlfoQE@phenom.ffwll.local>
References: <20210608090301.4752-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210608090301.4752-1-tzimmermann@suse.de>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 08, 2021 at 11:03:01AM +0200, Thomas Zimmermann wrote:
> Replace the IRQ check in VBLANK ioctls with a check for vblank
> support. IRQs might be enabled wthout vblanking being supported.

Nah, or if they are, that's a broken driver. irq_enabled here really only
means vblank_irq_enabled (maybe we should rename it). I'd like to
understand the motivation here a bit better to make sure we'r not just
papering over a driver bug.

Also as-is this breaks legacy drivers, which do enable/disable irqs at
runtime with the legacy IRQ_CONTROL ioctl, so we can't just throw this
out. Hence this cleanup here is only ok for non-legacy drivers.

Finally if you do this cleanup I think we should go through drivers and
drop the irq_enabled = true settings that are littered around. For that
cleanup I think this patch makes sense.
-Daniel
> 
> This change also removes the DRM framework's only dependency on
> IRQ state for non-legacy drivers.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/drm_irq.c    | 10 +++-------
>  drivers/gpu/drm/drm_vblank.c |  6 +++---
>  2 files changed, 6 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_irq.c b/drivers/gpu/drm/drm_irq.c
> index c3bd664ea733..1d7785721323 100644
> --- a/drivers/gpu/drm/drm_irq.c
> +++ b/drivers/gpu/drm/drm_irq.c
> @@ -74,10 +74,8 @@
>   * only supports devices with a single interrupt on the main device stored in
>   * &drm_device.dev and set as the device paramter in drm_dev_alloc().
>   *
> - * These IRQ helpers are strictly optional. Drivers which roll their own only
> - * need to set &drm_device.irq_enabled to signal the DRM core that vblank
> - * interrupts are working. Since these helpers don't automatically clean up the
> - * requested interrupt like e.g. devm_request_irq() they're not really
> + * These IRQ helpers are strictly optional. Since these helpers don't automatically
> + * clean up the requested interrupt like e.g. devm_request_irq() they're not really
>   * recommended.
>   */
>  
> @@ -91,9 +89,7 @@
>   * and after the installation.
>   *
>   * This is the simplified helper interface provided for drivers with no special
> - * needs. Drivers which need to install interrupt handlers for multiple
> - * interrupts must instead set &drm_device.irq_enabled to signal the DRM core
> - * that vblank interrupts are available.
> + * needs.
>   *
>   * @irq must match the interrupt number that would be passed to request_irq(),
>   * if called directly instead of using this helper function.
> diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
> index 3417e1ac7918..165286fef478 100644
> --- a/drivers/gpu/drm/drm_vblank.c
> +++ b/drivers/gpu/drm/drm_vblank.c
> @@ -1748,7 +1748,7 @@ int drm_wait_vblank_ioctl(struct drm_device *dev, void *data,
>  	unsigned int pipe_index;
>  	unsigned int flags, pipe, high_pipe;
>  
> -	if (!dev->irq_enabled)
> +	if (!drm_dev_has_vblank(dev))
>  		return -EOPNOTSUPP;
>  
>  	if (vblwait->request.type & _DRM_VBLANK_SIGNAL)
> @@ -2023,7 +2023,7 @@ int drm_crtc_get_sequence_ioctl(struct drm_device *dev, void *data,
>  	if (!drm_core_check_feature(dev, DRIVER_MODESET))
>  		return -EOPNOTSUPP;
>  
> -	if (!dev->irq_enabled)
> +	if (!drm_dev_has_vblank(dev))
>  		return -EOPNOTSUPP;
>  
>  	crtc = drm_crtc_find(dev, file_priv, get_seq->crtc_id);
> @@ -2082,7 +2082,7 @@ int drm_crtc_queue_sequence_ioctl(struct drm_device *dev, void *data,
>  	if (!drm_core_check_feature(dev, DRIVER_MODESET))
>  		return -EOPNOTSUPP;
>  
> -	if (!dev->irq_enabled)
> +	if (!drm_dev_has_vblank(dev))
>  		return -EOPNOTSUPP;
>  
>  	crtc = drm_crtc_find(dev, file_priv, queue_seq->crtc_id);
> -- 
> 2.31.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
