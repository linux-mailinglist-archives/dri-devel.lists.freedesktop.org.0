Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF98B23C74B
	for <lists+dri-devel@lfdr.de>; Wed,  5 Aug 2020 09:59:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BD6D89D02;
	Wed,  5 Aug 2020 07:59:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE67B89D02
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Aug 2020 07:59:29 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id c80so4943658wme.0
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Aug 2020 00:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=0ytblG5YsE2zO12D2KPy5Snku3dDFUFb5fBRNk3uxfM=;
 b=YDd1IZMDaRzppM724SOXWNEI6/IoPp3SyRDUwmCCFEk+tkw50W1z+E7gejg5z+XfJZ
 aoyiFxhlPsqGr6q2DUPZtFoGrncFFAZ29HKohEWYz0tZyCUpApWSX3YI+VOQrBm99HYv
 4Y6qX2tXeauTwl/uB8dYlND9z+tFscUN8deAc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0ytblG5YsE2zO12D2KPy5Snku3dDFUFb5fBRNk3uxfM=;
 b=e+XX/PFE+RQ2uh6DkpoF0ezS6e5dlf1KjOQObazhxhL4fsy5I/UyIhivE5XJF0lBlI
 P62CGuaZu6qfr+3/NWPGsTfWwQfoyKhZxmi73YSuxVvMZ6LS9Mnxmszo+3D4VdgBTRia
 M1tEOx0wJyJY6R1MQCGBWrQOoEnDOtfQqX1y1gmIgiTKf8UKiT3cSrENNjAAKInpbqb6
 1Yy5YjXaYbhPEHz4OjH8HbXFR7nyrAxZjvtODFfDwc++qpGtI0q0H5EUth1V9+9m8C4N
 dyD/KV48ssNjiaAqhrFScf+HbJKyF/XdTw7nLWNyjqcJN4GtY4R2HKC+OZ0+pjYDAG6l
 kqBw==
X-Gm-Message-State: AOAM530CH5NpQWQJNbDV4c/el8Pzae0Xv0SqLsuAZGztBlEqlL52W8m0
 CfOMGkxCfnx0zOwq6VshYAYVTw==
X-Google-Smtp-Source: ABdhPJz3JgsBr9FSE1pyp/P/E6h77myQArlAbUz8C9/BRe6naCX6vF+5DCOqfHhBLsJ9KWCT97sbhg==
X-Received: by 2002:a1c:23c2:: with SMTP id j185mr2069173wmj.84.1596614368398; 
 Wed, 05 Aug 2020 00:59:28 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id w2sm1723407wre.5.2020.08.05.00.59.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Aug 2020 00:59:27 -0700 (PDT)
Date: Wed, 5 Aug 2020 09:59:26 +0200
From: daniel@ffwll.ch
To: 
Subject: Re: [PATCH 02/59] drm/vmwgfx: drop bo map/unmap dma functions.
Message-ID: <20200805075926.GW6419@phenom.ffwll.local>
References: <20200804025632.3868079-1-airlied@gmail.com>
 <20200804025632.3868079-3-airlied@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200804025632.3868079-3-airlied@gmail.com>
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
Cc: sroland@vmware.com, dri-devel@lists.freedesktop.org,
 linux-graphics-maintainer@vmware.com, kraxel@redhat.com,
 christian.koenig@amd.com, bskeggs@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 04, 2020 at 12:55:35PM +1000, Dave Airlie wrote:
> From: Dave Airlie <airlied@redhat.com>
> 
> The map one was used once, just inline it, and drop them both.
> 
> Signed-off-by: Dave Airlie <airlied@redhat.com>
> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.h        |  2 -
>  drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c | 46 +++-------------------
>  2 files changed, 6 insertions(+), 42 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> index b7c763713b4c..65c414f119c0 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> @@ -1019,8 +1019,6 @@ extern struct ttm_placement vmw_mob_placement;
>  extern struct ttm_placement vmw_mob_ne_placement;
>  extern struct ttm_placement vmw_nonfixed_placement;
>  extern struct ttm_bo_driver vmw_bo_driver;
> -extern int vmw_bo_map_dma(struct ttm_buffer_object *bo);
> -extern void vmw_bo_unmap_dma(struct ttm_buffer_object *bo);
>  extern const struct vmw_sg_table *
>  vmw_bo_sg_table(struct ttm_buffer_object *bo);
>  extern int vmw_bo_create_and_populate(struct vmw_private *dev_priv,
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
> index 8e2a82ded900..3a141a08d4bd 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
> @@ -519,43 +519,6 @@ static void vmw_ttm_unmap_dma(struct vmw_ttm_tt *vmw_tt)
>  	vmw_tt->mapped = false;
>  }
>  
> -
> -/**
> - * vmw_bo_map_dma - Make sure buffer object pages are visible to the device
> - *
> - * @bo: Pointer to a struct ttm_buffer_object
> - *
> - * Wrapper around vmw_ttm_map_dma, that takes a TTM buffer object pointer
> - * instead of a pointer to a struct vmw_ttm_backend as argument.
> - * Note that the buffer object must be either pinned or reserved before
> - * calling this function.
> - */
> -int vmw_bo_map_dma(struct ttm_buffer_object *bo)
> -{
> -	struct vmw_ttm_tt *vmw_tt =
> -		container_of(bo->ttm, struct vmw_ttm_tt, dma_ttm.ttm);
> -
> -	return vmw_ttm_map_dma(vmw_tt);
> -}
> -
> -
> -/**
> - * vmw_bo_unmap_dma - Make sure buffer object pages are visible to the device
> - *
> - * @bo: Pointer to a struct ttm_buffer_object
> - *
> - * Wrapper around vmw_ttm_unmap_dma, that takes a TTM buffer object pointer
> - * instead of a pointer to a struct vmw_ttm_backend as argument.
> - */
> -void vmw_bo_unmap_dma(struct ttm_buffer_object *bo)
> -{
> -	struct vmw_ttm_tt *vmw_tt =
> -		container_of(bo->ttm, struct vmw_ttm_tt, dma_ttm.ttm);
> -
> -	vmw_ttm_unmap_dma(vmw_tt);
> -}
> -
> -
>  /**
>   * vmw_bo_sg_table - Return a struct vmw_sg_table object for a
>   * TTM buffer object
> @@ -839,9 +802,12 @@ int vmw_bo_create_and_populate(struct vmw_private *dev_priv,
>  
>  	ret = ttm_bo_reserve(bo, false, true, NULL);
>  	BUG_ON(ret != 0);
> -	ret = vmw_bo_driver.ttm_tt_populate(bo->ttm, &ctx);
> -	if (likely(ret == 0))
> -		ret = vmw_bo_map_dma(bo);
> +	ret = vmw_ttm_populate(bo->ttm, &ctx);

Snuck a replacement for a vfunc call with a direct all in here, maybe
mention that in the commit message.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> +	if (likely(ret == 0)) {
> +		struct vmw_ttm_tt *vmw_tt =
> +			container_of(bo->ttm, struct vmw_ttm_tt, dma_ttm.ttm);
> +		ret = vmw_ttm_map_dma(vmw_tt);
> +	}
>  
>  	ttm_bo_unreserve(bo);
>  
> -- 
> 2.26.2
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
