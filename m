Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EEEBF1D5045
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 16:22:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 842646ECBE;
	Fri, 15 May 2020 14:22:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A129D6ECBE
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 14:22:32 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id f134so2524696wmf.1
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 07:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=MDs6Yd3EVK/fC0+noRyydPEHjN7dGk9S4e3S8C+oHA0=;
 b=gBriY3D7HvOkdW50MzjYstkLoxuVX8WTFSBQLQCw7BoC3gVE4lAd9UjOH6N0Eg6AiP
 yd6m8BGI8iOf8l+x9WaeKdKGRaisANZsoXzVMKqAvf1FpLVadTTHWmv/BKyqtBVa/qG6
 9VESNPevv86HLo+sc4CmgTaDqjtXesnZO3O+g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=MDs6Yd3EVK/fC0+noRyydPEHjN7dGk9S4e3S8C+oHA0=;
 b=ixTI02/fsg7+MhnBQv9FjjdpNARmuXILNJlkAZgXODRtD+ftkUCjTqEiXhuL3e725j
 U02D9i9WY60oGizkqNVjjqm+lKsRUM1f6zcV7TmFkZ8o3ETeuGalm4rHKK/zBCXTLXMn
 7tixPyVgVnXf8VrhCI/vLgS+ZwbEp9WK28CJHQagz/n2GTxkCstibIcYM1UWAK1oGhBK
 jNEJ0mvdD5JJuLJaavgp8PWlPksNNkuw8vHZoomaKkaRL+9LYH0du0Po7Y0NmF9emh6s
 rXjvCXFIFv1f87pQQ2xcHuI5A3LxX4qGiF6B6qnePAbBY7LbH4DD/pJ3fKna7B02f20q
 E6KA==
X-Gm-Message-State: AOAM5332HWt1wXOY2fBwTUvVc+pg0KM+TdPXDADWjXqm4QKtYINaXD1I
 SFv+uk6aINquSuik4Z+wxZ0AZdyKWJ4=
X-Google-Smtp-Source: ABdhPJz6bbEGHp11OJy3PpEP9387ntiJAUFHDiEnVx6CaCDuLyKPh2kd0CDN3vMRCZy7wZ+dFUwm2A==
X-Received: by 2002:a1c:9d17:: with SMTP id g23mr4162073wme.38.1589552551283; 
 Fri, 15 May 2020 07:22:31 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id r2sm3894347wrg.84.2020.05.15.07.22.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2020 07:22:30 -0700 (PDT)
Date: Fri, 15 May 2020 16:22:28 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH v2 09/38] drm: remove drm_driver::gem_free_object
Message-ID: <20200515142228.GJ206103@phenom.ffwll.local>
References: <20200515095118.2743122-1-emil.l.velikov@gmail.com>
 <20200515095118.2743122-10-emil.l.velikov@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200515095118.2743122-10-emil.l.velikov@gmail.com>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 15, 2020 at 10:50:49AM +0100, Emil Velikov wrote:
> From: Emil Velikov <emil.velikov@collabora.com>
> 
> No drivers set the callback, so remove it all together.
> 
> Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

If I've read your series correctly I think you've missed one kerneldoc
line for @gem_free_object_unlocked:

	 * Compared to @gem_free_object this is not encumbered with
	 * &drm_device.struct_mutex legacy locking schemes.


With that also removed:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/drm_gem.c | 22 +++-------------------
>  include/drm/drm_drv.h     |  8 --------
>  include/drm/drm_gem.h     |  5 +++--
>  3 files changed, 6 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index 12fa121d0966..dab8763b2e73 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -975,15 +975,10 @@ drm_gem_object_free(struct kref *kref)
>  		container_of(kref, struct drm_gem_object, refcount);
>  	struct drm_device *dev = obj->dev;
>  
> -	if (obj->funcs) {
> +	if (obj->funcs)
>  		obj->funcs->free(obj);
> -	} else if (dev->driver->gem_free_object_unlocked) {
> +	else if (dev->driver->gem_free_object_unlocked)
>  		dev->driver->gem_free_object_unlocked(obj);
> -	} else if (dev->driver->gem_free_object) {
> -		WARN_ON(!mutex_is_locked(&dev->struct_mutex));
> -
> -		dev->driver->gem_free_object(obj);
> -	}
>  }
>  EXPORT_SYMBOL(drm_gem_object_free);
>  
> @@ -999,21 +994,10 @@ EXPORT_SYMBOL(drm_gem_object_free);
>  void
>  drm_gem_object_put_unlocked(struct drm_gem_object *obj)
>  {
> -	struct drm_device *dev;
> -
>  	if (!obj)
>  		return;
>  
> -	dev = obj->dev;
> -
> -	if (dev->driver->gem_free_object) {
> -		might_lock(&dev->struct_mutex);
> -		if (kref_put_mutex(&obj->refcount, drm_gem_object_free,
> -				&dev->struct_mutex))
> -			mutex_unlock(&dev->struct_mutex);
> -	} else {
> -		kref_put(&obj->refcount, drm_gem_object_free);
> -	}
> +	kref_put(&obj->refcount, drm_gem_object_free);
>  }
>  EXPORT_SYMBOL(drm_gem_object_put_unlocked);
>  
> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
> index 6d457652f199..e6eff508f687 100644
> --- a/include/drm/drm_drv.h
> +++ b/include/drm/drm_drv.h
> @@ -327,14 +327,6 @@ struct drm_driver {
>  	 */
>  	void (*debugfs_init)(struct drm_minor *minor);
>  
> -	/**
> -	 * @gem_free_object: deconstructor for drm_gem_objects
> -	 *
> -	 * This is deprecated and should not be used by new drivers. Use
> -	 * &drm_gem_object_funcs.free instead.
> -	 */
> -	void (*gem_free_object) (struct drm_gem_object *obj);
> -
>  	/**
>  	 * @gem_free_object_unlocked: deconstructor for drm_gem_objects
>  	 *
> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> index 0b375069cd48..ec2d24a60a76 100644
> --- a/include/drm/drm_gem.h
> +++ b/include/drm/drm_gem.h
> @@ -272,8 +272,9 @@ struct drm_gem_object {
>  	 * attachment point for the device. This is invariant over the lifetime
>  	 * of a gem object.
>  	 *
> -	 * The &drm_driver.gem_free_object callback is responsible for cleaning
> -	 * up the dma_buf attachment and references acquired at import time.
> +	 * The &drm_driver.gem_free_object_unlocked callback is responsible for
> +	 * cleaning up the dma_buf attachment and references acquired at import
> +	 * time.
>  	 *
>  	 * Note that the drm gem/prime core does not depend upon drivers setting
>  	 * this field any more. So for drivers where this doesn't make sense
> -- 
> 2.25.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
