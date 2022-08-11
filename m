Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A445902CA
	for <lists+dri-devel@lfdr.de>; Thu, 11 Aug 2022 18:17:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43FA514BAED;
	Thu, 11 Aug 2022 16:17:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DB0711BDB8
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Aug 2022 16:17:01 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id x21so23588121edd.3
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Aug 2022 09:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc;
 bh=FKiZACvkKw9LJYBJ2h3jlaGgAsQU1bwnXLwRDR9yT3I=;
 b=CKb5yp5AlsHOzRnjW6gGGKOXnJHJFuoFfFWlOYaU+zjwicn+RgMPO4SmLrqrOTi2Ep
 zNC3p5ZCmouBZEqqCEHTpqpjfsJLyLKU90h6yE+U7CNoNRiOd1N7lRwUhUXlgQeVUlbc
 hLil7mpA+SEHHDIhGNsQkU1pfPKKLmBOGJH7Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc;
 bh=FKiZACvkKw9LJYBJ2h3jlaGgAsQU1bwnXLwRDR9yT3I=;
 b=nkjsZJ+2FFxo/mQuUa/bs7n79Oy5MVe6xoYivgYFl3m6eBotfycAbQQZwjZVsjVmiL
 R0SSwiUdozNDa7PhbsotqHuDkcOIDYLADIPCwL77BVKm4wy5XFJIs1J80wjDGM3y7Dka
 9WNK5D0J/YUMcGiYcO2Pes4fwKXU63BwH3SVzXA1MlRGPdjjbzTss+z6nw36ZGiUOBH0
 XxyXnGnch+Ax7nU+z9S9AKFlHTBjJbT3V8OCqmGYt9JWReNSl1IkFLEFu1pPwiQCTteB
 7dd8Px/VSdyixksx+z96nfK+WS074ji5OpijVyI1EQTMRDeJgncKJ086/1pd2Ea0I+Hf
 awng==
X-Gm-Message-State: ACgBeo1YX2eh5gCr81KqZVEbGMdP3H8WgJlnIau6mbwO2o6MUJE65Cz9
 fEbUdQw1z6owOPaFiOto6ZSPhw==
X-Google-Smtp-Source: AA6agR4WXsL0j3WbG+fDyqOnb9nTbr1O3ieXgLW+b78d3bIIny4GyRZsyNatCGfGS9ZuSMQgwou8Dw==
X-Received: by 2002:aa7:db44:0:b0:43d:267c:edd9 with SMTP id
 n4-20020aa7db44000000b0043d267cedd9mr31885768edt.385.1660234619848; 
 Thu, 11 Aug 2022 09:16:59 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 o15-20020aa7dd4f000000b0043bba5ed21csm9261609edw.15.2022.08.11.09.16.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Aug 2022 09:16:58 -0700 (PDT)
Date: Thu, 11 Aug 2022 18:16:57 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Danilo Krummrich <dakr@redhat.com>
Subject: Re: [PATCH 2/2] drm/virtio: kms: use drm managed resources
Message-ID: <YvUrefus4/EoCV2J@phenom.ffwll.local>
Mail-Followup-To: Danilo Krummrich <dakr@redhat.com>, airlied@linux.ie,
 kraxel@redhat.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20220714130028.2127858-1-dakr@redhat.com>
 <20220714130028.2127858-3-dakr@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220714130028.2127858-3-dakr@redhat.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, kraxel@redhat.com,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 14, 2022 at 03:00:28PM +0200, Danilo Krummrich wrote:
> Allocate driver structures with drm managed resource allocators in order
> to cleanup/simplify the drm driver .release callback.
> 
> Signed-off-by: Danilo Krummrich <dakr@redhat.com>

On both patches:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

I'm assuming you have commits rights or know someone who does :-)
-Daniel


> ---
>  drivers/gpu/drm/virtio/virtgpu_kms.c | 16 +++++++---------
>  1 file changed, 7 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
> index 3313b92db531..63ebe63ef409 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_kms.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
> @@ -28,6 +28,7 @@
>  #include <linux/virtio_ring.h>
>  
>  #include <drm/drm_file.h>
> +#include <drm/drm_managed.h>
>  
>  #include "virtgpu_drv.h"
>  
> @@ -66,10 +67,11 @@ static void virtio_gpu_get_capsets(struct virtio_gpu_device *vgdev,
>  {
>  	int i, ret;
>  	bool invalid_capset_id = false;
> +	struct drm_device *drm = vgdev->ddev;
>  
> -	vgdev->capsets = kcalloc(num_capsets,
> -				 sizeof(struct virtio_gpu_drv_capset),
> -				 GFP_KERNEL);
> +	vgdev->capsets = drmm_kcalloc(drm, num_capsets,
> +				      sizeof(struct virtio_gpu_drv_capset),
> +				      GFP_KERNEL);
>  	if (!vgdev->capsets) {
>  		DRM_ERROR("failed to allocate cap sets\n");
>  		return;
> @@ -94,7 +96,7 @@ static void virtio_gpu_get_capsets(struct virtio_gpu_device *vgdev,
>  
>  		if (ret == 0 || invalid_capset_id) {
>  			spin_lock(&vgdev->display_info_lock);
> -			kfree(vgdev->capsets);
> +			drmm_kfree(drm, vgdev->capsets);
>  			vgdev->capsets = NULL;
>  			spin_unlock(&vgdev->display_info_lock);
>  			return;
> @@ -126,7 +128,7 @@ int virtio_gpu_init(struct drm_device *dev)
>  	if (!virtio_has_feature(dev_to_virtio(dev->dev), VIRTIO_F_VERSION_1))
>  		return -ENODEV;
>  
> -	vgdev = kzalloc(sizeof(struct virtio_gpu_device), GFP_KERNEL);
> +	vgdev = drmm_kzalloc(dev, sizeof(struct virtio_gpu_device), GFP_KERNEL);
>  	if (!vgdev)
>  		return -ENOMEM;
>  
> @@ -257,7 +259,6 @@ int virtio_gpu_init(struct drm_device *dev)
>  	vgdev->vdev->config->del_vqs(vgdev->vdev);
>  err_vqs:
>  	dev->dev_private = NULL;
> -	kfree(vgdev);
>  	return ret;
>  }
>  
> @@ -296,9 +297,6 @@ void virtio_gpu_release(struct drm_device *dev)
>  
>  	if (vgdev->has_host_visible)
>  		drm_mm_takedown(&vgdev->host_visible_mm);
> -
> -	kfree(vgdev->capsets);
> -	kfree(vgdev);
>  }
>  
>  int virtio_gpu_driver_open(struct drm_device *dev, struct drm_file *file)
> -- 
> 2.36.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
