Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 39FB8260E36
	for <lists+dri-devel@lfdr.de>; Tue,  8 Sep 2020 10:57:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6515E6E5C8;
	Tue,  8 Sep 2020 08:57:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECA6E6E5C8
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Sep 2020 08:57:24 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id a17so18204709wrn.6
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Sep 2020 01:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=aLJYrm5bOjZd8IZxBRURG7tcIZly4NiWd1EjKr3Vqfg=;
 b=b6cEBE6njyXvZevcnqFZzEoXBFtDdCvYCkNrDwZNfhuKbJExzPQU7/msU4sYTd9qen
 t7N65xdspMnc5iK2UaZ6awIAJhnUswLYotvlUeI5TKUX2QzHS9UNyOVSGdyB4cwZxZVy
 3sn3/rJhRkWOVW8TWAIcE8fuE9DhfQvgPVt+M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=aLJYrm5bOjZd8IZxBRURG7tcIZly4NiWd1EjKr3Vqfg=;
 b=ioH/ilusQZ2ngy2MntrvclHY0wU4KYmAPbSwW0UM2wAuK9XMS+066eXyvfeb6UvMOx
 +GZFE9ODNYZtdPYOtSlInM8oV0Me+AosmnMchQo9RDnBUnii2uXfLuFiGbv7jDbnP8qJ
 RalFzWSKpnjl4Aol4cyQJR6BNIdqMf+svGooVspMhKcz37L/LWP7GEsToc+XpI2Bv7Y3
 9oMfZVyXdRgXxoZTYK/AVuvB0blVNErjf6t8eDKGAgHHYEv2EGpJto/OaI6rKyL1y+0s
 7QzRnGgiUtOv5z9enHJTc5JWhmWL1PuWktmOaC4Dp0FG9igXNYaIX+n00JZl27VpdbJW
 U3hg==
X-Gm-Message-State: AOAM533tKt5ng3rsaidZSx3ENGWiWEVmu7Hv+MNBOPLP5QV4X3mMFPA3
 te/KTrbau6rDPc/K0+kSL/oRTQ==
X-Google-Smtp-Source: ABdhPJw/Z7glRjkptNRj0qyVEzDSlDhIfCzudDaFL00qxvdRc+SQk3yofJBPi3m6TSbiWuo2ewZk7w==
X-Received: by 2002:a05:6000:83:: with SMTP id
 m3mr25405078wrx.165.1599555443634; 
 Tue, 08 Sep 2020 01:57:23 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id i16sm29552687wrq.73.2020.09.08.01.57.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2020 01:57:22 -0700 (PDT)
Date: Tue, 8 Sep 2020 10:57:21 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH] drm/virtio: drop quirks handling
Message-ID: <20200908085721.GJ2352366@phenom.ffwll.local>
Mail-Followup-To: Gerd Hoffmann <kraxel@redhat.com>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20200908064741.1010-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200908064741.1010-1-kraxel@redhat.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 08, 2020 at 08:47:41AM +0200, Gerd Hoffmann wrote:
> These days dma ops can be overridden per device, and the virtio core

"can be overridden" or "are"? The comment above vring_use_dma_api()
suggests that's not yet done. If that's wrong then I think updating the
comment would be really good.
-Daniel

> uses that to handle the dma quirks transparently for the rest of the
> kernel.  So we can drop the virtio_has_dma_quirk() checks, just use
> the dma api unconditionally and depend on the virtio core having setup
> dma_ops as needed.
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  drivers/gpu/drm/virtio/virtgpu_object.c | 19 ++++++-------------
>  drivers/gpu/drm/virtio/virtgpu_vq.c     | 16 ++++++----------
>  2 files changed, 12 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
> index 729f98ad7c02..9c35ce64ff9e 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_object.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_object.c
> @@ -141,7 +141,6 @@ static int virtio_gpu_object_shmem_init(struct virtio_gpu_device *vgdev,
>  					struct virtio_gpu_mem_entry **ents,
>  					unsigned int *nents)
>  {
> -	bool use_dma_api = !virtio_has_dma_quirk(vgdev->vdev);
>  	struct virtio_gpu_object_shmem *shmem = to_virtio_gpu_shmem(bo);
>  	struct scatterlist *sg;
>  	int si, ret;
> @@ -162,15 +161,11 @@ static int virtio_gpu_object_shmem_init(struct virtio_gpu_device *vgdev,
>  		return -EINVAL;
>  	}
>  
> -	if (use_dma_api) {
> -		shmem->mapped = dma_map_sg(vgdev->vdev->dev.parent,
> -					   shmem->pages->sgl,
> -					   shmem->pages->nents,
> -					   DMA_TO_DEVICE);
> -		*nents = shmem->mapped;
> -	} else {
> -		*nents = shmem->pages->nents;
> -	}
> +	shmem->mapped = dma_map_sg(vgdev->vdev->dev.parent,
> +				   shmem->pages->sgl,
> +				   shmem->pages->nents,
> +				   DMA_TO_DEVICE);
> +	*nents = shmem->mapped;
>  
>  	*ents = kmalloc_array(*nents, sizeof(struct virtio_gpu_mem_entry),
>  			      GFP_KERNEL);
> @@ -180,9 +175,7 @@ static int virtio_gpu_object_shmem_init(struct virtio_gpu_device *vgdev,
>  	}
>  
>  	for_each_sg(shmem->pages->sgl, sg, *nents, si) {
> -		(*ents)[si].addr = cpu_to_le64(use_dma_api
> -					       ? sg_dma_address(sg)
> -					       : sg_phys(sg));
> +		(*ents)[si].addr = cpu_to_le64(sg_dma_address(sg));
>  		(*ents)[si].length = cpu_to_le32(sg->length);
>  		(*ents)[si].padding = 0;
>  	}
> diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
> index c93c2db35aaf..1c1d2834547d 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_vq.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
> @@ -599,13 +599,11 @@ void virtio_gpu_cmd_transfer_to_host_2d(struct virtio_gpu_device *vgdev,
>  	struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(objs->objs[0]);
>  	struct virtio_gpu_transfer_to_host_2d *cmd_p;
>  	struct virtio_gpu_vbuffer *vbuf;
> -	bool use_dma_api = !virtio_has_dma_quirk(vgdev->vdev);
>  	struct virtio_gpu_object_shmem *shmem = to_virtio_gpu_shmem(bo);
>  
> -	if (use_dma_api)
> -		dma_sync_sg_for_device(vgdev->vdev->dev.parent,
> -				       shmem->pages->sgl, shmem->pages->nents,
> -				       DMA_TO_DEVICE);
> +	dma_sync_sg_for_device(vgdev->vdev->dev.parent,
> +			       shmem->pages->sgl, shmem->pages->nents,
> +			       DMA_TO_DEVICE);
>  
>  	cmd_p = virtio_gpu_alloc_cmd(vgdev, &vbuf, sizeof(*cmd_p));
>  	memset(cmd_p, 0, sizeof(*cmd_p));
> @@ -1015,13 +1013,11 @@ void virtio_gpu_cmd_transfer_to_host_3d(struct virtio_gpu_device *vgdev,
>  	struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(objs->objs[0]);
>  	struct virtio_gpu_transfer_host_3d *cmd_p;
>  	struct virtio_gpu_vbuffer *vbuf;
> -	bool use_dma_api = !virtio_has_dma_quirk(vgdev->vdev);
>  	struct virtio_gpu_object_shmem *shmem = to_virtio_gpu_shmem(bo);
>  
> -	if (use_dma_api)
> -		dma_sync_sg_for_device(vgdev->vdev->dev.parent,
> -				       shmem->pages->sgl, shmem->pages->nents,
> -				       DMA_TO_DEVICE);
> +	dma_sync_sg_for_device(vgdev->vdev->dev.parent,
> +			       shmem->pages->sgl, shmem->pages->nents,
> +			       DMA_TO_DEVICE);
>  
>  	cmd_p = virtio_gpu_alloc_cmd(vgdev, &vbuf, sizeof(*cmd_p));
>  	memset(cmd_p, 0, sizeof(*cmd_p));
> -- 
> 2.27.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
