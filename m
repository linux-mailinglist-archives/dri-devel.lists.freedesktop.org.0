Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C44DE2623B2
	for <lists+dri-devel@lfdr.de>; Wed,  9 Sep 2020 01:42:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F7416E0CC;
	Tue,  8 Sep 2020 23:42:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CCB76E0C1;
 Tue,  8 Sep 2020 23:42:41 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id w2so579754wmi.1;
 Tue, 08 Sep 2020 16:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=n7ux27HOKrOXej9DZ3uZ7OTZU29xet2/IanneRat7K8=;
 b=dEXtg6pZnOqKUqf5Cbz8aNOyMfnx4bQc2RWRxtED6J9BcdrdzA2DyfkeO6sqVrnPt0
 zsxCPOjzhMEqjLk9PrFbXPFYWIfMbbbxds7+Yp+Nf2mwg3/Zqymkpsu+PyBd0P9IsAB9
 yc9Si4GuFOG8R9pLYtIjXeS4q/dgSut9+heFVchWz2tv3XkdsnGcIq4Zsvumrj4P/IdG
 nE1b8f/tkJcNH8DIih2FbkmdN/XIZgSXlgzNJig0hUVpr8URwUem1KM/WYoh3nOmmblM
 EPF9dXpIfG6M51RakYlffXCmSVmTv3MqmK8t8v8NyvUvH5hMpg5ZrUdK6Bu6iCp0xmtj
 o24w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=n7ux27HOKrOXej9DZ3uZ7OTZU29xet2/IanneRat7K8=;
 b=EsBzVblD/F4ii/k8A5FxK/yZw1mYFPPMZcyDkoNmeK7l2naeVFOHOFKy/BGj9AUQAx
 DDhGeNwFmX7FDGKQtLM6tRLZfJ5Hyop/1JgBv3+VoUNjbAGU7jyrNmgLK4erQykGJX9r
 NMTqH16cwMveOYqgyiJ/zS0TUpkLyrvoI1aZbqlSn9DhzoBTCBerrHQ39k+33rcemLaK
 ibBO52D72DlvUzWit66pDl35KCpAMOTE3D7fkoi3oqxzgbpBg7HDFXYO06e+PyEgBu8E
 qUZpHqxrUWV6+xkrIjKeM2tfoF5DHYHuAuuFOvhxZSnVOC2LDphAEv7FGfKDFI5QfntJ
 QQyQ==
X-Gm-Message-State: AOAM532hVsrSNDCsMcWnP3NkQHbkcvBMtOeBzagyMRGujIldBRcRdkN5
 LXioQAZ9kSZacFBh7cuWiiB7JK17e80=
X-Google-Smtp-Source: ABdhPJyOjLYEyuWjio3JhRfxv7GC/5Q2bv9GyUanouuG00z5cj3h6i5VAfe5Ih97dh2LfqezrFR2eA==
X-Received: by 2002:a1c:6385:: with SMTP id x127mr740932wmb.95.1599608559827; 
 Tue, 08 Sep 2020 16:42:39 -0700 (PDT)
Received: from smtp.gmail.com (a95-92-181-29.cpe.netcabo.pt. [95.92.181.29])
 by smtp.gmail.com with ESMTPSA id q4sm1336072wru.65.2020.09.08.16.42.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2020 16:42:39 -0700 (PDT)
Date: Tue, 8 Sep 2020 20:42:31 -0300
From: Melissa Wen <melissa.srw@gmail.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 05/24] drm/vkms: Use devm_drm_dev_alloc
Message-ID: <20200908234231.pizidtjqua77mewc@smtp.gmail.com>
References: <20200904143941.110665-1-daniel.vetter@ffwll.ch>
 <20200904143941.110665-6-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200904143941.110665-6-daniel.vetter@ffwll.ch>
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
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

Thanks for this work.

This change works smoothly to me. However, there is a check in the vkms_exit
that doesn't look very good. Please, see inline comment.

On 09/04, Daniel Vetter wrote:
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
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
> Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> ---
>  drivers/gpu/drm/vkms/vkms_drv.c | 54 ++++++++++++++++-----------------
>  1 file changed, 26 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
> index 83dd5567de8b..0d2c6dcf73c3 100644
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
> @@ -175,39 +173,39 @@ static int __init vkms_init(void)
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
> +	struct platform_device *pdev = vkms_device->platform;
> +
>  	if (!vkms_device) {
>  		DRM_INFO("vkms_device is NULL.\n");
>  		return;
>  	}

I think it would be better to check vkms_device before assigning
vkms_device->platform to the pdev above. I don't know if the compiler
handles this, but doing the validation first seems more clear.

>  
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
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
