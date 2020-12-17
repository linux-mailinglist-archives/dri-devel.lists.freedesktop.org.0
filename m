Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4CE32DD9E3
	for <lists+dri-devel@lfdr.de>; Thu, 17 Dec 2020 21:29:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1BE4893EC;
	Thu, 17 Dec 2020 20:29:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEB2B893EC
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 20:29:07 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id m5so27872100wrx.9
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 12:29:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=9WruSaTCP9lmXKSEW5WJ1pKJ7OBeeoW2oBwZ/y9oi/o=;
 b=lB2WryaVawhWQ1TUvoyctMh1Fy8c0ZPrGZQczQBcR3Rf/T2MpJ9cMtHuPsTMMphKdt
 zKfgWItko++7BZDF4GucbQx6DYxHWmMk7ml5g/864pltDgQvuq8fwR1WB+V7XbMulYbI
 RYbBSU5nUh9fyQAKejtMsNJYQQHPFB6Lt6tAY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9WruSaTCP9lmXKSEW5WJ1pKJ7OBeeoW2oBwZ/y9oi/o=;
 b=rX62tol95XO4leLahe6QKXjeEZyicofGkQS8TL7CqU7W/atnvoucK5po7o0ApditSu
 mE3CdaZJRNgQQgSiNkxynry6ApgcrPHXjcfrg0yvqA3Q1rWQwClXjoRtHDtuyhCogcGy
 Qv/nGVzo4vqPpEshnGwNFyv2/AVbQDxafM9OEiMtVvf4qmYlxfeKERqvBK0UsWFH1/Mp
 a+rFGrD2lpTTpzsJ1mslrMydr8KYNnV75aslgkxtU1OiHkS/GI3paHcfCpXEAT+zM+7u
 RNbVdKqkW5PsIPD89ZvM0b3hvkFHMLg9OGs2W3eZ5RxRVwtpjCwT97MUpJavdxh8XDqO
 6mBQ==
X-Gm-Message-State: AOAM533TajvSTbrCNI38dCIvZ7ahrgkwlSNk7q3Ken5VmiuF8PwU7XWK
 z0nVh6vKPZwvLzdOuU9crGPG6IT6Nl2I9w==
X-Google-Smtp-Source: ABdhPJx0vFm5VZGrllq25/dWAWMMSnZ8/o3GFP0F+iR9T3eDm4wz4GsIsL8SV70vW4zruRNKnDTB6w==
X-Received: by 2002:a5d:43ce:: with SMTP id v14mr608806wrr.342.1608236946563; 
 Thu, 17 Dec 2020 12:29:06 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id e16sm11029769wra.94.2020.12.17.12.29.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 12:29:05 -0800 (PST)
Date: Thu, 17 Dec 2020 21:29:03 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Dave Airlie <airlied@gmail.com>
Subject: Re: [PATCH] drm/nouveau: fix multihop when move doesn't work.
Message-ID: <X9u/j9zPS/uJURJX@phenom.ffwll.local>
References: <20201217200943.30511-1-airlied@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201217200943.30511-1-airlied@gmail.com>
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 18, 2020 at 06:09:43AM +1000, Dave Airlie wrote:
> From: Dave Airlie <airlied@redhat.com>
> 
> As per the radeon/amdgpu fix don't use multihop is hw moves
> aren't enabled.
> 
> Reported-by: Mike Galbraith <efault@gmx.de>
> Tested-by: Mike Galbraith <efault@gmx.de>
> Fixes: 0c8c0659d74 ("drm/nouveau/ttm: use multihop")
> Signed-off-by: Dave Airlie <airlied@redhat.com>

Pulled to drm-next directly, will go out to Linus tomorrow.
-Daniel

> ---
>  drivers/gpu/drm/nouveau/nouveau_bo.c | 31 ++++++++++++++--------------
>  1 file changed, 16 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
> index 1386b0fc1640..c85b1af06b7b 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> @@ -942,16 +942,6 @@ nouveau_bo_move(struct ttm_buffer_object *bo, bool evict,
>  	struct nouveau_drm_tile *new_tile = NULL;
>  	int ret = 0;
>  
> -	if ((old_reg->mem_type == TTM_PL_SYSTEM &&
> -	     new_reg->mem_type == TTM_PL_VRAM) ||
> -	    (old_reg->mem_type == TTM_PL_VRAM &&
> -	     new_reg->mem_type == TTM_PL_SYSTEM)) {
> -		hop->fpfn = 0;
> -		hop->lpfn = 0;
> -		hop->mem_type = TTM_PL_TT;
> -		hop->flags = 0;
> -		return -EMULTIHOP;
> -	}
>  
>  	if (new_reg->mem_type == TTM_PL_TT) {
>  		ret = nouveau_ttm_tt_bind(bo->bdev, bo->ttm, new_reg);
> @@ -995,14 +985,25 @@ nouveau_bo_move(struct ttm_buffer_object *bo, bool evict,
>  
>  	/* Hardware assisted copy. */
>  	if (drm->ttm.move) {
> +		if ((old_reg->mem_type == TTM_PL_SYSTEM &&
> +		     new_reg->mem_type == TTM_PL_VRAM) ||
> +		    (old_reg->mem_type == TTM_PL_VRAM &&
> +		     new_reg->mem_type == TTM_PL_SYSTEM)) {
> +			hop->fpfn = 0;
> +			hop->lpfn = 0;
> +			hop->mem_type = TTM_PL_TT;
> +			hop->flags = 0;
> +			return -EMULTIHOP;
> +		}
>  		ret = nouveau_bo_move_m2mf(bo, evict, ctx,
>  					   new_reg);
> -		if (!ret)
> -			goto out;
> -	}
> +	} else
> +		ret = -ENODEV;
>  
> -	/* Fallback to software copy. */
> -	ret = ttm_bo_move_memcpy(bo, ctx, new_reg);
> +	if (ret) {
> +		/* Fallback to software copy. */
> +		ret = ttm_bo_move_memcpy(bo, ctx, new_reg);
> +	}
>  
>  out:
>  	if (drm->client.device.info.family < NV_DEVICE_INFO_V0_TESLA) {
> -- 
> 2.27.0
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
