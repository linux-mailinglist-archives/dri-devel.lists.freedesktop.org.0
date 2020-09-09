Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C67B8262D8C
	for <lists+dri-devel@lfdr.de>; Wed,  9 Sep 2020 13:01:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 717DA6EB4B;
	Wed,  9 Sep 2020 11:01:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C5AB6EB4B;
 Wed,  9 Sep 2020 11:01:52 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id x23so1847081wmi.3;
 Wed, 09 Sep 2020 04:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=2qWMBVUqXi4XgQq5WwZcWyAqWIfseZViekRt6sHx27k=;
 b=IQHbDYStOM2yz1HkBR5w9Rk7jCMXo9YO1BYFdvFI8SP4MaU1AZ0ns5J9VGI3+9C8fJ
 oMATL13O2PxMSVI/VLXIUnj7lAxQwWkCRgOkg+53E/aMgeIaIE4IXvVAU3iLLb22RB1d
 YnpCHtALyB73y4MAgpob3+5F8SgS5TZqA+Kk7Rxq1zhub27Ezdkch5l0Y3JkUm0JcntC
 ZIBhCzouOfH1YWwa487FI0rosU50OyCy5IbH/21+Azi3vDR+lN8ftm/2hLiTLEh6CZ2/
 NwWA25zLEqmDNK6CbRD1lu/umT/kwG+IOwMVcBUIckdJR9diyoM1jKXtm7cT8Ik2MwGg
 JTYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2qWMBVUqXi4XgQq5WwZcWyAqWIfseZViekRt6sHx27k=;
 b=Tzk3S1qzYuWA1TvYhBWZtZwcLXNByXwtsIKbNrGYe08sUHijQWgQ/gYytU5pvxprs0
 VBaVDx4Fx8PMH6S5HqXP5Zjt5M849VRONRG9RY+T6YgWWmkloVniKi/S9TKhOJa6AKhR
 jMf8QPLCaA+Oxx4revnEF4ibVQwhqaGGbHBRtqbQPC5W2YooPhhWBYuKd3gazS9iq++T
 EMJi+387vv1j4lf0i+SScQxfWjYq9Hr3ntNkYwMO6Vk1ir52RmOxYTRKVUUSiA5cIOkw
 JCfVZ8kYDijYO1DQky91ke9LlIy9ibcVyGI+Zw9DXyyd5blOMmuMiETtYlhEnFVrtgTn
 IBBg==
X-Gm-Message-State: AOAM532PfkKfnqp9Do+TeMuxdOMuHQOdkxKKgFl5J7Eyo+4QCwIuy1qI
 4pURaIoFnokXBH0cJxbNGdk=
X-Google-Smtp-Source: ABdhPJwEUnSEqwz5q0c8lMr6nF+81XDVt0DhT6kQANd9SCaO16JpdvhS5rIhksy3L6i3JjFfk4sHPQ==
X-Received: by 2002:a1c:a506:: with SMTP id o6mr2974419wme.3.1599649311128;
 Wed, 09 Sep 2020 04:01:51 -0700 (PDT)
Received: from smtp.gmail.com (a95-92-181-29.cpe.netcabo.pt. [95.92.181.29])
 by smtp.gmail.com with ESMTPSA id u66sm3475436wme.12.2020.09.09.04.01.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2020 04:01:50 -0700 (PDT)
Date: Wed, 9 Sep 2020 08:01:44 -0300
From: Melissa Wen <melissa.srw@gmail.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 04/24] drm/vgem: Use devm_drm_dev_alloc
Message-ID: <20200909110144.pyptgix7y7yftuxy@smtp.gmail.com>
References: <20200904143941.110665-1-daniel.vetter@ffwll.ch>
 <20200904143941.110665-5-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200904143941.110665-5-daniel.vetter@ffwll.ch>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>, Sean Paul <seanpaul@chromium.org>,
 Sam Ravnborg <sam@ravnborg.org>, Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

looks good to me, just a few things inline.

On 09/04, Daniel Vetter wrote:
> This means we also need to slightly restructure the exit code, so that
> final cleanup of the drm_device is triggered by unregistering the
> platform device. Note that devres is both clean up when the driver is
> unbound (not the case for vgem, we don't bind), and also when unregistering
> the device (very much the case for vgem). Therefore we can rely on devres
> even though vgem isn't a proper platform device driver.
> 
> This also somewhat untangles the load code, since the drm and platform device
> setup are no longer interleaved, but two distinct steps.
> 
> v2: use devres_open/release_group so we can use devm without real
> hacks in the driver core or having to create an entire fake bus for
> testing drivers. Might want to extract this into helpers eventually,
> maybe as a mock_drm_dev_alloc or test_drm_dev_alloc.
> 
> Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Emil Velikov <emil.velikov@collabora.com>
> Cc: Sean Paul <seanpaul@chromium.org>
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/vgem/vgem_drv.c | 55 ++++++++++++++-------------------
>  1 file changed, 24 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vgem/vgem_drv.c b/drivers/gpu/drm/vgem/vgem_drv.c
> index 313339bbff90..f95537627463 100644
> --- a/drivers/gpu/drm/vgem/vgem_drv.c
> +++ b/drivers/gpu/drm/vgem/vgem_drv.c
> @@ -401,16 +401,8 @@ static int vgem_prime_mmap(struct drm_gem_object *obj,
>  	return 0;
>  }
>  
> -static void vgem_release(struct drm_device *dev)
> -{
> -	struct vgem_device *vgem = container_of(dev, typeof(*vgem), drm);
> -
> -	platform_device_unregister(vgem->platform);
> -}
> -
>  static struct drm_driver vgem_driver = {
>  	.driver_features		= DRIVER_GEM | DRIVER_RENDER,
> -	.release			= vgem_release,
>  	.open				= vgem_open,
>  	.postclose			= vgem_postclose,
>  	.gem_free_object_unlocked	= vgem_gem_free_object,
> @@ -442,48 +434,49 @@ static struct drm_driver vgem_driver = {
>  static int __init vgem_init(void)
>  {
>  	int ret;
> +	struct platform_device *pdev;
>  
> -	vgem_device = kzalloc(sizeof(*vgem_device), GFP_KERNEL);
> -	if (!vgem_device)
> -		return -ENOMEM;
> +	pdev = platform_device_register_simple("vgem", -1, NULL, 0);
> +	if (IS_ERR(pdev))
> +		return PTR_ERR(vgem_device->platform);
I caught this line right above.
It should be: return PTR_ERR (pdev), right?
>  
> -	vgem_device->platform =
> -		platform_device_register_simple("vgem", -1, NULL, 0);
> -	if (IS_ERR(vgem_device->platform)) {
> -		ret = PTR_ERR(vgem_device->platform);
> -		goto out_free;
> +	if (!devres_open_group(&pdev->dev, NULL, GFP_KERNEL)) {
> +		ret = -ENOMEM;
> +		goto out_unregister;
>  	}
>  
> -	dma_coerce_mask_and_coherent(&vgem_device->platform->dev,
> +	dma_coerce_mask_and_coherent(&pdev->dev,
>  				     DMA_BIT_MASK(64));
> -	ret = drm_dev_init(&vgem_device->drm, &vgem_driver,
> -			   &vgem_device->platform->dev);
> -	if (ret)
> -		goto out_unregister;
> -	drmm_add_final_kfree(&vgem_device->drm, vgem_device);
> +
> +	vgem_device = devm_drm_dev_alloc(&pdev->dev, &vgem_driver,
> +					 struct vgem_device, drm);
> +	if (IS_ERR(vgem_device)) {
> +		ret = PTR_ERR(vgem_device);
> +		goto out_devres;
> +	}
> +	vgem_device->platform = pdev;
>  
>  	/* Final step: expose the device/driver to userspace */
>  	ret = drm_dev_register(&vgem_device->drm, 0);
>  	if (ret)
> -		goto out_put;
> +		goto out_devres;
>  
>  	return 0;
>  
> -out_put:
> -	drm_dev_put(&vgem_device->drm);
> -	platform_device_unregister(vgem_device->platform);
> -	return ret;
> +out_devres:
> +	devres_release_group(&pdev->dev, NULL);
>  out_unregister:
> -	platform_device_unregister(vgem_device->platform);
> -out_free:
> -	kfree(vgem_device);
> +	platform_device_unregister(pdev);
>  	return ret;
>  }
>  
>  static void __exit vgem_exit(void)
>  {
> +	struct platform_device *pdev = vgem_device->platform;
> +
Well, there has never been a check for a null vgem_device here before,
as in vkms. Should?
>  	drm_dev_unregister(&vgem_device->drm);
> -	drm_dev_put(&vgem_device->drm);
> +	devres_release_group(&pdev->dev, NULL);
> +	platform_device_unregister(pdev);
>  }
>  
>  module_init(vgem_init);
> -- 
> 2.28.0

Apart from these two points,

Reviewed-by: Melissa Wen <melissa.srw@gmail.com>

Thanks!
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
