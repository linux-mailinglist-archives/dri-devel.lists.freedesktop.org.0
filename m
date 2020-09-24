Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 904A6276D8B
	for <lists+dri-devel@lfdr.de>; Thu, 24 Sep 2020 11:33:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D01096E198;
	Thu, 24 Sep 2020 09:33:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 217336E198
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 09:33:17 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id x14so2971355wrl.12
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 02:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=gvJN9yZdT3+y76BUB3dTWS+FNrt/RK+O+3OrpM5GP4Y=;
 b=LoN9fhBrh8b5QqYJvm7z9oj2WRMtrI5//qFAANo5szuufYKG2azTfGsJwCrh/Ju8aN
 nDs90zDukxu1+QKd0iBUy3JXFt7w+bE9iiMttZv5SeCfP6Ea+ZyxvmuvjZ1EyYNqmNqO
 G6NX0DdMcefqtzTyW26wMs6gW0/x1HVs+vhfU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=gvJN9yZdT3+y76BUB3dTWS+FNrt/RK+O+3OrpM5GP4Y=;
 b=l2Khtalnoz7N8xJngxm3vOZxno4L+V1YBHmuKUHhfGa+mBDJJCtV02Ths9wsEskH1Y
 hopUMGKHOPDubElIzQ81tcyv+q5V5EAxbMAoiJuRZR18M7T78Nay56VXHGZkSB+r6kQc
 /SofVzSp5lgO0VQyWYKjHvE8+zxQS/OB36Hk2E/ZNIZMDhCipOXowpjkhy1/lbvKVt7z
 hZxrZDrMwsuXjn3SmxNXF4G61jOaIjOQbQB43rCymyl4gZ3oEOx1Fq6kVHb6vqIclVgB
 g9w4urXaNuFEC0TyT2A2jI2X5Et7i+OwxONYxp+nFEjtHQri+pmC7+1w+MzO+wCvhjk2
 bPlA==
X-Gm-Message-State: AOAM530KfrLCWKLo34rJnQVSgIfETVQuAMhMNfiG7QOoK8vKUR7eerf2
 vOgJFiCzOnv6XXi9WsFjvDSc9g==
X-Google-Smtp-Source: ABdhPJzSRf0KRza1xUk7GTunhUSbJAPra5AOPA70SnKuh5eenWLGwEYSh0IeB5B7Iv47RZtNDwi/pQ==
X-Received: by 2002:adf:f042:: with SMTP id t2mr3899131wro.385.1600939995754; 
 Thu, 24 Sep 2020 02:33:15 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 70sm2991720wme.15.2020.09.24.02.33.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Sep 2020 02:33:14 -0700 (PDT)
Date: Thu, 24 Sep 2020 11:33:13 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Dave Airlie <airlied@gmail.com>
Subject: Re: [PATCH 30/45] drm/ttm: add a new invalidate notify callback.
Message-ID: <20200924093313.GA438822@phenom.ffwll.local>
References: <20200924051845.397177-1-airlied@gmail.com>
 <20200924051845.397177-31-airlied@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200924051845.397177-31-airlied@gmail.com>
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
Cc: christian.koenig@amd.com, dri-devel@lists.freedesktop.org,
 bskeggs@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 24, 2020 at 03:18:30PM +1000, Dave Airlie wrote:
> From: Dave Airlie <airlied@redhat.com>
> 
> Signed-off-by: Dave Airlie <airlied@redhat.com>

A bikeshed, but why not just call this ->invalidate? ->move_notify needed
the _notify because we already had the ->move callback, but there's not
invalidate that also needs a invalidate_notify. And a callback kinda
implies that the driver gets notified about some stuff, but doesn't really
add anything about what it should do now. Plus if we go with notify, I
guess it should be called ->delete_notify, and use that to do it's
invalidation.

</bikeshed>

Otherwise I think this entire series is a solid demidlayer of all the move
stuff here.

Cheers, Daniel
> ---
>  drivers/gpu/drm/ttm/ttm_bo.c    | 4 +++-
>  include/drm/ttm/ttm_bo_driver.h | 7 +++++++
>  2 files changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index a2a61a8d1394..ba69c682e53b 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -282,7 +282,9 @@ static int ttm_bo_handle_move_mem(struct ttm_buffer_object *bo,
>  
>  static void ttm_bo_cleanup_memtype_use(struct ttm_buffer_object *bo)
>  {
> -	if (bo->bdev->driver->move_notify)
> +	if (bo->bdev->driver->invalidate_notify)
> +		bo->bdev->driver->invalidate_notify(bo);
> +	else if (bo->bdev->driver->move_notify)
>  		bo->bdev->driver->move_notify(bo, false, NULL);
>  
>  	ttm_bo_tt_destroy(bo);
> diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_driver.h
> index cfb151dbb2d0..da4afe669664 100644
> --- a/include/drm/ttm/ttm_bo_driver.h
> +++ b/include/drm/ttm/ttm_bo_driver.h
> @@ -165,6 +165,13 @@ struct ttm_bo_driver {
>  	void (*move_notify)(struct ttm_buffer_object *bo,
>  			    bool evict,
>  			    struct ttm_resource *new_mem);
> +
> +	/**
> +	 * Hook to notify driver about a bo being torn down.
> +	 * can be used for invalidation instead of move_notify.
> +	 */
> +	void (*invalidate_notify)(struct ttm_buffer_object *bo);
> +
>  	/* notify the driver we are taking a fault on this BO
>  	 * and have reserved it */
>  	int (*fault_reserve_notify)(struct ttm_buffer_object *bo);
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
