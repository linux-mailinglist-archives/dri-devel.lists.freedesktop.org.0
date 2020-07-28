Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 478F6230645
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 11:14:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F141389CA4;
	Tue, 28 Jul 2020 09:14:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9201389CA4
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 09:14:13 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id g8so5430773wmk.3
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 02:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=bHn40kiSAHjs9vxZCiGeqY4wSv0B6MoAUSpQbezT6D8=;
 b=SGXTEh5iADsZ7z6pSWCjRq/v0yPFfnrgejXrLx76kk9HUzEscOH6Tjjk8TEITr2VOE
 HifOJPd3CpqU/z1m39BDbbXszX0Ry2MYJFWQBWAArYk+rAudnW2/4VGr5lxIdIR2vske
 rOcbKGGivX1pdvG8QdbGpDa4ApKtc3i9v+yNk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=bHn40kiSAHjs9vxZCiGeqY4wSv0B6MoAUSpQbezT6D8=;
 b=K80t2SobIIB5h+N9bK4sf4joK36kQsQz07uD+sXKOD3MVLyTofwbl0hb283+pjzHQT
 fBM4yWY9mIfnGKcpbrDhdrSOitBqOw6OmFBDrn6vtEcYIVWufBe1613VjXgJv41MJ+4R
 kF4PC6akGuVVCOnHPJeJbFKA1rNQksuYmgrBv73jYQ3fbmI/WTdZRLYZOPjYs/XElInK
 I/bAnhQaMyqBXEXpxC8ywUVguI1kfgGToySxhka4fSCEyl1B/YNx4yw3G6CdJ+ZnPIox
 a3ddViqpffC4pbjJjstCe5NmGM256iGhv/bQnt3FWT45ZNoqL7uICPf0+6+Um3BHpOXG
 ZdJA==
X-Gm-Message-State: AOAM532529X2j9hVwGOsYQM/Gv9B5sib5VoyCtamEiGF/SaPKZOQavZO
 jCNIrs+apK+OZ+jKQk3xQhCZeQ==
X-Google-Smtp-Source: ABdhPJzYhPGxdSt8KHpQPeg0pd4GdEEyRdv/C0rtMJsTGFCGm+V9NNPyyguDhJCoUhSgLMi/1ydncQ==
X-Received: by 2002:a1c:f70c:: with SMTP id v12mr3112174wmh.100.1595927652240; 
 Tue, 28 Jul 2020 02:14:12 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id i14sm19182924wrc.19.2020.07.28.02.14.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jul 2020 02:14:11 -0700 (PDT)
Date: Tue, 28 Jul 2020 11:14:09 +0200
From: daniel@ffwll.ch
To: 
Subject: Re: [PATCH] ttm: ttm_bo_swapout_all doesn't use it's argument.
Message-ID: <20200728091409.GA6419@phenom.ffwll.local>
References: <20200728034254.20114-1-airlied@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200728034254.20114-1-airlied@gmail.com>
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
Cc: linux-graphics-maintainer@vmware.com, sroland@vmware.com,
 christian.koenig@amd.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 28, 2020 at 01:42:54PM +1000, Dave Airlie wrote:
> From: Dave Airlie <airlied@redhat.com>
> 
> Just drop the argument from this.
> 
> This does ask the question if this is the function vmwgfx
> should be using or should it be doing an evict all like
> the other drivers.

Yeah this looks a bit like ttm_bo_swapout_all shouldn't even be exported
really, it's part of the internal shrinker stuff.
-Daniel

> 
> Signed-off-by: Dave Airlie <airlied@redhat.com>
> ---
>  drivers/gpu/drm/ttm/ttm_bo.c        | 2 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.c | 2 +-
>  include/drm/ttm/ttm_bo_api.h        | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index b03747717ec7..f297fd5e02d4 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -1838,7 +1838,7 @@ int ttm_bo_swapout(struct ttm_bo_global *glob, struct ttm_operation_ctx *ctx)
>  }
>  EXPORT_SYMBOL(ttm_bo_swapout);
>  
> -void ttm_bo_swapout_all(struct ttm_bo_device *bdev)
> +void ttm_bo_swapout_all(void)
>  {
>  	struct ttm_operation_ctx ctx = {
>  		.interruptible = false,
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> index 470428387878..fb39826f72c1 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> @@ -1352,7 +1352,7 @@ static int vmw_pm_freeze(struct device *kdev)
>  	vmw_execbuf_release_pinned_bo(dev_priv);
>  	vmw_resource_evict_all(dev_priv);
>  	vmw_release_device_early(dev_priv);
> -	ttm_bo_swapout_all(&dev_priv->bdev);
> +	ttm_bo_swapout_all();
>  	if (dev_priv->enable_fb)
>  		vmw_fifo_resource_dec(dev_priv);
>  	if (atomic_read(&dev_priv->num_fifo_resources) != 0) {
> diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
> index b1c705a93517..a9e13b252820 100644
> --- a/include/drm/ttm/ttm_bo_api.h
> +++ b/include/drm/ttm/ttm_bo_api.h
> @@ -692,7 +692,7 @@ ssize_t ttm_bo_io(struct ttm_bo_device *bdev, struct file *filp,
>  
>  int ttm_bo_swapout(struct ttm_bo_global *glob,
>  			struct ttm_operation_ctx *ctx);
> -void ttm_bo_swapout_all(struct ttm_bo_device *bdev);
> +void ttm_bo_swapout_all(void);
>  
>  /**
>   * ttm_bo_uses_embedded_gem_object - check if the given bo uses the
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
