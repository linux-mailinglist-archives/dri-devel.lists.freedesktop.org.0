Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B237F699D66
	for <lists+dri-devel@lfdr.de>; Thu, 16 Feb 2023 21:12:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E643A10E376;
	Thu, 16 Feb 2023 20:11:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A296810E370
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 20:11:56 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id r28so2493393wra.5
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 12:11:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=KmsCXE1cc+kjYkXP7Av8+g/i6Xiae0+2FF4SyY/8c1Y=;
 b=Z9/TpqTt2w1EyzDy+hgxyZZdv0XE+fU06DflDuxaxXsm04CxinixVlqeu8znsQttuk
 GIO1OONphJIuGmb3iSZ7CEdUen26WffWPdu6dgO16g8fJa2l6FIn6aiVDuHrA9kpO/9o
 P8y7zjNCb1eyevJNupis21d6YvG64TQOomKOQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KmsCXE1cc+kjYkXP7Av8+g/i6Xiae0+2FF4SyY/8c1Y=;
 b=nq5TpwVVFcPfh67tS+/PytM4TWEQeaa2wcX4YYtrWKJS1eBDmRdpLjMVotWuN5F0zZ
 1A0kJ+HAM+0JwELAwxm0OkUj8903hIq2lNCIh+/Zu9pSgghkMWjcCt72TpnDNXutA9DM
 tW2A1zPDxsHR9WBLyqTFs82F/vuOpcoDiM33hT0MjgYq/OI6agH9SPk95ad7ln/v5C1L
 madiCU+zOeQxQq+Wk4LPxLcSxd6IjG3KvELbwSje94Tw0IcxXn64565gv9kxgykeaMrI
 m2WNJ2clFUXOhJmYPOmBOmlkmeKHvgfyk9rJJmUOnQ6DGnfieaNH6oQoqBsAetawPPG+
 JyFA==
X-Gm-Message-State: AO0yUKU1XLxiD8+VfCA2wlJmkxX4he3X4R+XrwYafwkCQPtOkbCA8YaV
 cErXzoLYwrcJZoqh/Ve8DODlHw==
X-Google-Smtp-Source: AK7set9SaGzBuaVjPNmI5K6tL/a+m6AYcw8bkZU23dWsn9A1+haGPZXOjfFCDUkIWccpGoPjBGtWGQ==
X-Received: by 2002:adf:fd92:0:b0:2c5:60e2:ed68 with SMTP id
 d18-20020adffd92000000b002c560e2ed68mr4742497wrr.0.1676578314980; 
 Thu, 16 Feb 2023 12:11:54 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 h9-20020a5d6e09000000b002c56af32e8csm2365195wrz.35.2023.02.16.12.11.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 12:11:54 -0800 (PST)
Date: Thu, 16 Feb 2023 21:11:52 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/fb-helper: Remove drm_fb_helper_unprepare() from
 drm_fb_helper_fini()
Message-ID: <Y+6OCAJ9wyE1PfAw@phenom.ffwll.local>
References: <20230216140620.17699-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230216140620.17699-1-tzimmermann@suse.de>
X-Operating-System: Linux phenom 5.19.0-2-amd64 
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
Cc: freedreno@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 16, 2023 at 03:06:20PM +0100, Thomas Zimmermann wrote:
> Move drm_fb_helper_unprepare() from drm_fb_helper_fini() into the
> calling fbdev implementation. Avoids a possible stale mutex with
> generic fbdev code.
> 
> As indicated by its name, drm_fb_helper_prepare() prepares struct
> drm_fb_helper before setting up the fbdev support with a call to
> drm_fb_helper_init(). In legacy fbdev emulation, this happens next
> to each other. If successful, drm_fb_helper_fini() later tear down
> the fbdev device and also unprepare via drm_fb_helper_unprepare().
> 
> Generic fbdev emulation prepares struct drm_fb_helper immediately
> after allocating the instance. It only calls drm_fb_helper_init()
> as part of processing a hotplug event. If the hotplug-handling fails,
> it runs drm_fb_helper_fini(). This unprepares the fb-helper instance
> and the next hotplug event runs on stale data.
> 
> Solve this by moving drm_fb_helper_unprepare() from drm_fb_helper_fini()
> into the fbdev implementations. Call it right before freeing the
> fb-helper instance.
> 
> Fixes: 4825797c36da ("drm/fb-helper: Introduce drm_fb_helper_unprepare()")
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

This reminds me of an old patch I just recently stumbled over again:

https://lore.kernel.org/dri-devel/Y3St2VHJ7jEmcNFw@phenom.ffwll.local/

Should I resurrect that one maybe and send it out? I think that also ties
a bit into your story here.

> ---
>  drivers/gpu/drm/armada/armada_fbdev.c      | 3 +++
>  drivers/gpu/drm/drm_fb_helper.c            | 2 --
>  drivers/gpu/drm/drm_fbdev_generic.c        | 2 ++
>  drivers/gpu/drm/exynos/exynos_drm_fbdev.c  | 3 ++-
>  drivers/gpu/drm/gma500/framebuffer.c       | 2 ++
>  drivers/gpu/drm/i915/display/intel_fbdev.c | 1 +
>  drivers/gpu/drm/msm/msm_fbdev.c            | 2 ++
>  drivers/gpu/drm/omapdrm/omap_fbdev.c       | 2 ++
>  drivers/gpu/drm/radeon/radeon_fb.c         | 2 ++
>  drivers/gpu/drm/tegra/fb.c                 | 1 +
>  10 files changed, 17 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/armada/armada_fbdev.c b/drivers/gpu/drm/armada/armada_fbdev.c
> index 07e410c62b7a..0e44f53e9fa4 100644
> --- a/drivers/gpu/drm/armada/armada_fbdev.c
> +++ b/drivers/gpu/drm/armada/armada_fbdev.c
> @@ -147,6 +147,7 @@ int armada_fbdev_init(struct drm_device *dev)
>   err_fb_setup:
>  	drm_fb_helper_fini(fbh);
>   err_fb_helper:
> +	drm_fb_helper_unprepare(fbh);
>  	priv->fbdev = NULL;
>  	return ret;
>  }
> @@ -164,6 +165,8 @@ void armada_fbdev_fini(struct drm_device *dev)
>  		if (fbh->fb)
>  			fbh->fb->funcs->destroy(fbh->fb);
>  
> +		drm_fb_helper_unprepare(fbh);
> +
>  		priv->fbdev = NULL;
>  	}
>  }
> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> index 28c428e9c530..a39998047f8a 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -590,8 +590,6 @@ void drm_fb_helper_fini(struct drm_fb_helper *fb_helper)

I think it would be good to update the kerneldoc of _init() and _fini()
here to mention each another like we usually do with these pairs. Same
with prepare/unprepare() although the latter rerfences _prepare() already.

>  	}
>  	mutex_unlock(&kernel_fb_helper_lock);
>  
> -	drm_fb_helper_unprepare(fb_helper);
> -
>  	if (!fb_helper->client.funcs)
>  		drm_client_release(&fb_helper->client);
>  }
> diff --git a/drivers/gpu/drm/drm_fbdev_generic.c b/drivers/gpu/drm/drm_fbdev_generic.c
> index 365f80717fa1..4d6325e91565 100644
> --- a/drivers/gpu/drm/drm_fbdev_generic.c
> +++ b/drivers/gpu/drm/drm_fbdev_generic.c
> @@ -65,6 +65,8 @@ static void drm_fbdev_fb_destroy(struct fb_info *info)
>  
>  	drm_client_framebuffer_delete(fb_helper->buffer);
>  	drm_client_release(&fb_helper->client);
> +
> +	drm_fb_helper_unprepare(fb_helper);
>  	kfree(fb_helper);
>  }
>  
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
> index b89e33af8da8..4929ffe5a09a 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
> @@ -183,8 +183,8 @@ int exynos_drm_fbdev_init(struct drm_device *dev)
>  
>  err_setup:
>  	drm_fb_helper_fini(helper);
> -
>  err_init:
> +	drm_fb_helper_unprepare(helper);
>  	private->fb_helper = NULL;
>  	kfree(fbdev);
>  
> @@ -219,6 +219,7 @@ void exynos_drm_fbdev_fini(struct drm_device *dev)
>  	fbdev = to_exynos_fbdev(private->fb_helper);
>  
>  	exynos_drm_fbdev_destroy(dev, private->fb_helper);
> +	drm_fb_helper_unprepare(private->fb_helper);
>  	kfree(fbdev);
>  	private->fb_helper = NULL;
>  }
> diff --git a/drivers/gpu/drm/gma500/framebuffer.c b/drivers/gpu/drm/gma500/framebuffer.c
> index 1f04c07ee180..f471e0cb7298 100644
> --- a/drivers/gpu/drm/gma500/framebuffer.c
> +++ b/drivers/gpu/drm/gma500/framebuffer.c
> @@ -427,6 +427,7 @@ int psb_fbdev_init(struct drm_device *dev)
>  fini:
>  	drm_fb_helper_fini(fb_helper);
>  free:
> +	drm_fb_helper_unprepare(fb_helper);
>  	kfree(fb_helper);
>  	return ret;
>  }
> @@ -439,6 +440,7 @@ static void psb_fbdev_fini(struct drm_device *dev)
>  		return;
>  
>  	psb_fbdev_destroy(dev, dev_priv->fb_helper);
> +	drm_fb_helper_unprepare(dev_priv->fb_helper);
>  	kfree(dev_priv->fb_helper);
>  	dev_priv->fb_helper = NULL;
>  }
> diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
> index 6113d7627d45..98029059f701 100644
> --- a/drivers/gpu/drm/i915/display/intel_fbdev.c
> +++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
> @@ -352,6 +352,7 @@ static void intel_fbdev_destroy(struct intel_fbdev *ifbdev)
>  	if (ifbdev->fb)
>  		drm_framebuffer_remove(&ifbdev->fb->base);
>  
> +	drm_fb_helper_unprepare(&ifbdev->helper);
>  	kfree(ifbdev);
>  }
>  
> diff --git a/drivers/gpu/drm/msm/msm_fbdev.c b/drivers/gpu/drm/msm/msm_fbdev.c
> index 915b213f3a5c..c804e5ba682a 100644
> --- a/drivers/gpu/drm/msm/msm_fbdev.c
> +++ b/drivers/gpu/drm/msm/msm_fbdev.c
> @@ -170,6 +170,7 @@ struct drm_fb_helper *msm_fbdev_init(struct drm_device *dev)
>  fini:
>  	drm_fb_helper_fini(helper);
>  fail:
> +	drm_fb_helper_unprepare(helper);
>  	kfree(fbdev);
>  	return NULL;
>  }
> @@ -196,6 +197,7 @@ void msm_fbdev_free(struct drm_device *dev)
>  		drm_framebuffer_remove(fbdev->fb);
>  	}
>  
> +	drm_fb_helper_unprepare(helper);
>  	kfree(fbdev);
>  
>  	priv->fbdev = NULL;
> diff --git a/drivers/gpu/drm/omapdrm/omap_fbdev.c b/drivers/gpu/drm/omapdrm/omap_fbdev.c
> index fc5f52d567c6..84429728347f 100644
> --- a/drivers/gpu/drm/omapdrm/omap_fbdev.c
> +++ b/drivers/gpu/drm/omapdrm/omap_fbdev.c
> @@ -256,6 +256,7 @@ void omap_fbdev_init(struct drm_device *dev)
>  fini:
>  	drm_fb_helper_fini(helper);
>  fail:
> +	drm_fb_helper_unprepare(helper);
>  	kfree(fbdev);
>  
>  	dev_warn(dev->dev, "omap_fbdev_init failed\n");
> @@ -286,6 +287,7 @@ void omap_fbdev_fini(struct drm_device *dev)
>  	if (fbdev->fb)
>  		drm_framebuffer_remove(fbdev->fb);
>  
> +	drm_fb_helper_unprepare(helper);
>  	kfree(fbdev);
>  
>  	priv->fbdev = NULL;
> diff --git a/drivers/gpu/drm/radeon/radeon_fb.c b/drivers/gpu/drm/radeon/radeon_fb.c
> index 6e5eed0e157c..c4807f0c43bc 100644
> --- a/drivers/gpu/drm/radeon/radeon_fb.c
> +++ b/drivers/gpu/drm/radeon/radeon_fb.c
> @@ -367,6 +367,7 @@ int radeon_fbdev_init(struct radeon_device *rdev)
>  fini:
>  	drm_fb_helper_fini(&rfbdev->helper);
>  free:
> +	drm_fb_helper_unprepare(&rfbdev->helper);
>  	kfree(rfbdev);
>  	return ret;
>  }
> @@ -377,6 +378,7 @@ void radeon_fbdev_fini(struct radeon_device *rdev)
>  		return;
>  
>  	radeon_fbdev_destroy(rdev->ddev, rdev->mode_info.rfbdev);
> +	drm_fb_helper_unprepare(&rdev->mode_info.rfbdev->helper);
>  	kfree(rdev->mode_info.rfbdev);
>  	rdev->mode_info.rfbdev = NULL;
>  }
> diff --git a/drivers/gpu/drm/tegra/fb.c b/drivers/gpu/drm/tegra/fb.c
> index 153c39c32c71..bfebe2786d61 100644
> --- a/drivers/gpu/drm/tegra/fb.c
> +++ b/drivers/gpu/drm/tegra/fb.c
> @@ -315,6 +315,7 @@ static struct tegra_fbdev *tegra_fbdev_create(struct drm_device *drm)
>  
>  static void tegra_fbdev_free(struct tegra_fbdev *fbdev)
>  {
> +	drm_fb_helper_unprepare(&fbdev->base);

Ok this one tegra change was a bit tricky, drivers really should just use
drmm_/devm_ for everything :-)

With the kerneldoc augmented:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

>  	kfree(fbdev);
>  }
>  
> -- 
> 2.39.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
