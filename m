Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC03262BAE
	for <lists+dri-devel@lfdr.de>; Wed,  9 Sep 2020 11:22:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 739E16E243;
	Wed,  9 Sep 2020 09:22:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CE756E243;
 Wed,  9 Sep 2020 09:22:33 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id w5so2115646wrp.8;
 Wed, 09 Sep 2020 02:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=7r5Cx33QsEMoJjR07X1CbUk3K6iW8mhXGWKzZATC/VY=;
 b=uoTvChrgnHn0imlBYaSxgGcCWCzl2Zb7QOrwrA06XnkhiTckXNMP1TlMAXnfM2mixb
 gOiAAZ+f+XFqie0vvNLqbinI1ut5nsYpJSX6NHd3l1owpkxk7M+XVLQ4Go4+iUaU5Kgi
 aGZmp4WCAT1ivll0zoQq6DhXE0TZXiea94IMyANPNX+LaoiRa8kCSwjog861TUOz8PxJ
 O0kHvJN6suOXGaIbU7dHA4oq07LWVRLf1r28rqGqULY891+E/vCUlnw0Js65GUWdcNH7
 o+Ouos5nNTrEGchlqC9PpumTidpAKAxNYikKjzN5qBzbAChgQNxt1dxuwLMuwp8x1T5Y
 6DNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7r5Cx33QsEMoJjR07X1CbUk3K6iW8mhXGWKzZATC/VY=;
 b=sgNXZ5wWzXQnw2o7EMhnBy3tJHhgZ1rM/0kSkf/Q8UKbsT0mwWLxs+3HmekkqAXLoh
 /8ZOxqFDyiJCopTvrnWW/uoNU4raAZ32bfCQJn9je6RKF8VPDh8V2gDw71rdHZn5lU2U
 vMO422Rvy5oTIUmJZ4uGBdp2kgOcu+wriuZ8may/kuHpQPzVHyxtvbun37moJYde0l2S
 fzJdqFbeTzjZWWNmKYt3hK5atC0nsMHwfuK5KlIBdRlsfpJzu+Px1d1mZEqqmyrAscqF
 M7xvDXSJ5JP6TEx0SyTq7T2z72mBgG79v0w0zKDQ2Z3uDiKwu3fcbs0Qrb21iRJ+XIAS
 Nu6g==
X-Gm-Message-State: AOAM5329YBXpTllSJwG3YuYApbFNQu0lGPHR/4S17Vp98ElYn6A54h1R
 KJMUgZlhXUUWtdU87NPErjw=
X-Google-Smtp-Source: ABdhPJxkmaSN1z8mvP3bO8AQ4KxqyKLowY6cdhqxEXZGolcrgmNF2KZ3AhSo32LgkcDPbQNG+Ua0DA==
X-Received: by 2002:adf:fc0a:: with SMTP id i10mr2826546wrr.111.1599643351739; 
 Wed, 09 Sep 2020 02:22:31 -0700 (PDT)
Received: from smtp.gmail.com (a95-92-181-29.cpe.netcabo.pt. [95.92.181.29])
 by smtp.gmail.com with ESMTPSA id s124sm3187680wme.29.2020.09.09.02.22.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2020 02:22:31 -0700 (PDT)
Date: Wed, 9 Sep 2020 06:22:19 -0300
From: Melissa Wen <melissa.srw@gmail.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] drm/vkms: Use devm_drm_dev_alloc
Message-ID: <20200909092219.l2ovmfs4pttmp7je@smtp.gmail.com>
References: <20200904143941.110665-6-daniel.vetter@ffwll.ch>
 <20200909091833.440548-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200909091833.440548-1-daniel.vetter@ffwll.ch>
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/09, Daniel Vetter wrote:
> This means we also need to slightly restructure the exit code, so that
> final cleanup of the drm_device is triggered by unregistering the
> platform device. Note that devres is both clean up when the driver is
> unbound (not the case for vkms, we don't bind), and also when unregistering
> the device (very much the case for vkms). Therefore we can rely on devres
> even though vkms isn't a proper platform device driver.
> 
> This also somewhat untangles the load code, since the drm and platform device
> setup are no longer interleaved, but two distinct steps.
> 
> v2: use devres_open/release_group so we can use devm without real
> hacks in the driver core or having to create an entire fake bus for
> testing drivers. Might want to extract this into helpers eventually,
> maybe as a mock_drm_dev_alloc or test_drm_dev_alloc.
> 
> v3: Only deref vkms_device after checking it (Melissa)
Thanks :)
> 
> Cc: Melissa Wen <melissa.srw@gmail.com>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
> Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> ---
>  drivers/gpu/drm/vkms/vkms_drv.c | 56 ++++++++++++++++-----------------
>  1 file changed, 28 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
> index 83dd5567de8b..cb0b6230c22c 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.c
> +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> @@ -61,9 +61,6 @@ static void vkms_release(struct drm_device *dev)
>  {
>  	struct vkms_device *vkms = container_of(dev, struct vkms_device, drm);
>  
> -	platform_device_unregister(vkms->platform);
> -	drm_atomic_helper_shutdown(&vkms->drm);
> -	drm_mode_config_cleanup(&vkms->drm);
>  	destroy_workqueue(vkms->output.composer_workq);
>  }
>  
> @@ -144,30 +141,31 @@ static int vkms_modeset_init(struct vkms_device *vkmsdev)
>  static int __init vkms_init(void)
>  {
>  	int ret;
> +	struct platform_device *pdev;
>  
> -	vkms_device = kzalloc(sizeof(*vkms_device), GFP_KERNEL);
> -	if (!vkms_device)
> -		return -ENOMEM;
> +	pdev = platform_device_register_simple(DRIVER_NAME, -1, NULL, 0);
> +	if (IS_ERR(pdev))
> +		return PTR_ERR(pdev);
>  
> -	vkms_device->platform =
> -		platform_device_register_simple(DRIVER_NAME, -1, NULL, 0);
> -	if (IS_ERR(vkms_device->platform)) {
> -		ret = PTR_ERR(vkms_device->platform);
> -		goto out_free;
> +	if (!devres_open_group(&pdev->dev, NULL, GFP_KERNEL)) {
> +		ret = -ENOMEM;
> +		goto out_unregister;
>  	}
>  
> -	ret = drm_dev_init(&vkms_device->drm, &vkms_driver,
> -			   &vkms_device->platform->dev);
> -	if (ret)
> -		goto out_unregister;
> -	drmm_add_final_kfree(&vkms_device->drm, vkms_device);
> +	vkms_device = devm_drm_dev_alloc(&pdev->dev, &vkms_driver,
> +					 struct vkms_device, drm);
> +	if (IS_ERR(vkms_device)) {
> +		ret = PTR_ERR(vkms_device);
> +		goto out_devres;
> +	}
> +	vkms_device->platform = pdev;
>  
>  	ret = dma_coerce_mask_and_coherent(vkms_device->drm.dev,
>  					   DMA_BIT_MASK(64));
>  
>  	if (ret) {
>  		DRM_ERROR("Could not initialize DMA support\n");
> -		goto out_put;
> +		goto out_devres;
>  	}
>  
>  	vkms_device->drm.irq_enabled = true;
> @@ -175,39 +173,41 @@ static int __init vkms_init(void)
>  	ret = drm_vblank_init(&vkms_device->drm, 1);
>  	if (ret) {
>  		DRM_ERROR("Failed to vblank\n");
> -		goto out_put;
> +		goto out_devres;
>  	}
>  
>  	ret = vkms_modeset_init(vkms_device);
>  	if (ret)
> -		goto out_put;
> +		goto out_devres;
>  
>  	ret = drm_dev_register(&vkms_device->drm, 0);
>  	if (ret)
> -		goto out_put;
> +		goto out_devres;
>  
>  	return 0;
>  
> -out_put:
> -	drm_dev_put(&vkms_device->drm);
> -	platform_device_unregister(vkms_device->platform);
> -	return ret;
> +out_devres:
> +	devres_release_group(&pdev->dev, NULL);
>  out_unregister:
> -	platform_device_unregister(vkms_device->platform);
> -out_free:
> -	kfree(vkms_device);
> +	platform_device_unregister(pdev);
>  	return ret;
>  }
>  
>  static void __exit vkms_exit(void)
>  {
> +	struct platform_device *pdev;
> +
>  	if (!vkms_device) {
>  		DRM_INFO("vkms_device is NULL.\n");
>  		return;
>  	}
>  
> +	pdev = vkms_device->platform;
> +
>  	drm_dev_unregister(&vkms_device->drm);
> -	drm_dev_put(&vkms_device->drm);
> +	drm_atomic_helper_shutdown(&vkms_device->drm);
> +	devres_release_group(&pdev->dev, NULL);
> +	platform_device_unregister(pdev);
>  }
>  
>  module_init(vkms_init);
> -- 
> 2.28.0
> 

Reviewed-by: Melissa Wen <melissa.srw@gmail.com>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
