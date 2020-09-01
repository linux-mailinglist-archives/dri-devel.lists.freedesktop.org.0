Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D94258DB0
	for <lists+dri-devel@lfdr.de>; Tue,  1 Sep 2020 13:53:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3A3B6E079;
	Tue,  1 Sep 2020 11:53:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 609556E079
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Sep 2020 11:53:23 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id o5so1164165wrn.13
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Sep 2020 04:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=4pbrbINpclANPHPoXjRh4jkprr4L6ijONzwCi7r/ZQc=;
 b=McsPMjmV6BnvyoPaMXhuniT/gN16/5NFBk7BieKnMO48d3+MYqxM9iQImMFJ0SIMmK
 BN6lOeoFupHtJAryOtxPTigOgTdEPVc47Ne75eSO4SQsO+Gqnw/DMNcB5sm4z2vcJ838
 7iELuEXikwyK+h1SVdPiw8YAoRONobCj7I1nY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4pbrbINpclANPHPoXjRh4jkprr4L6ijONzwCi7r/ZQc=;
 b=JPrSF4eTkgCPQveTwZlA9cXCyZqjziNmXiogY5Sk2P3aQ5Eprcpe/07XJvguyXMnLq
 gBfLITx8FNvAV8UD1vITOnbiw30JT02YDQv41AxPreWoqlV/4EJxxdrKrM/WQEByAGDB
 seGBTyX91WqF70lM9bQTHtWIHK0GiqnMtUFjCGpKi85UCeIClYYUN5CNQe+ELLSmIB8e
 M/egOPBoOcmAEopvxHj/tj9qMAGbdE5IBsAKvVXFnkUkDfa4HwGarvhnwuXgll4TKuGq
 i7JfNTw1ZBxYcKy6Fj3n3tIoTqztMzF7nJy1JNzxayDhiACzt8yBslQy0Z2+3a4/ddwY
 WFHA==
X-Gm-Message-State: AOAM5322Z+cNyo+TVVM1+Bo01ydGKYgUEDQRDI67Uyi2PbqoxqGRwlj5
 BGVxET566ZBMpUm6AXm9X4bzwg==
X-Google-Smtp-Source: ABdhPJz3sRNPz1HWeASRij9LcOVIZpmbXeoLWLZjhn1F5fwK1oZg9iMbb0+3Ek1RYJJrwG0WJ+9ENg==
X-Received: by 2002:a5d:608a:: with SMTP id w10mr1452184wrt.48.1598961201991; 
 Tue, 01 Sep 2020 04:53:21 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 32sm2293213wrh.18.2020.09.01.04.53.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Sep 2020 04:53:21 -0700 (PDT)
Date: Tue, 1 Sep 2020 13:53:19 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Dave Airlie <airlied@gmail.com>
Subject: Re: [PATCH 02/23] drm/radeon/ttm: don't store driver copy of device
 pointer.
Message-ID: <20200901115319.GB2352366@phenom.ffwll.local>
References: <20200826014428.828392-1-airlied@gmail.com>
 <20200826014428.828392-3-airlied@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200826014428.828392-3-airlied@gmail.com>
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
Cc: christian.koenig@amd.com, sroland@vmware.com, kraxel@redhat.com,
 dri-devel@lists.freedesktop.org, bskeggs@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 26, 2020 at 11:44:07AM +1000, Dave Airlie wrote:
> From: Dave Airlie <airlied@redhat.com>
> 
> This can be gotten back from bdev.
> 
> Signed-off-by: Dave Airlie <airlied@redhat.com>
> ---
>  drivers/gpu/drm/radeon/radeon_ttm.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
> index f6311f404db8..0923a8601112 100644
> --- a/drivers/gpu/drm/radeon/radeon_ttm.c
> +++ b/drivers/gpu/drm/radeon/radeon_ttm.c
> @@ -412,7 +412,6 @@ static int radeon_ttm_io_mem_reserve(struct ttm_bo_device *bdev, struct ttm_reso
>   */
>  struct radeon_ttm_tt {
>  	struct ttm_dma_tt		ttm;
> -	struct radeon_device		*rdev;

At least for amdgpu the drm_device embedding stuff landed, so I think we
can drop a lot more of these all over because upcasting from a struct
drm_device * to tha adev is just a container_of.

Entirely separate bikeshed cleanup, but I think it'd help to make ttm feel
a bit more like a helper for gpu drivers than it's entirely separate world
:-)

Cheers, Daniel

>  	u64				offset;
>  
>  	uint64_t			userptr;
> @@ -515,6 +514,7 @@ static int radeon_ttm_backend_bind(struct ttm_tt *ttm,
>  				   struct ttm_resource *bo_mem)
>  {
>  	struct radeon_ttm_tt *gtt = (void*)ttm;
> +	struct radeon_device *rdev = radeon_get_rdev(ttm->bdev);
>  	uint32_t flags = RADEON_GART_PAGE_VALID | RADEON_GART_PAGE_READ |
>  		RADEON_GART_PAGE_WRITE;
>  	int r;
> @@ -531,7 +531,7 @@ static int radeon_ttm_backend_bind(struct ttm_tt *ttm,
>  	}
>  	if (ttm->caching_state == tt_cached)
>  		flags |= RADEON_GART_PAGE_SNOOP;
> -	r = radeon_gart_bind(gtt->rdev, gtt->offset, ttm->num_pages,
> +	r = radeon_gart_bind(rdev, gtt->offset, ttm->num_pages,
>  			     ttm->pages, gtt->ttm.dma_address, flags);
>  	if (r) {
>  		DRM_ERROR("failed to bind %lu pages at 0x%08X\n",
> @@ -544,8 +544,9 @@ static int radeon_ttm_backend_bind(struct ttm_tt *ttm,
>  static void radeon_ttm_backend_unbind(struct ttm_tt *ttm)
>  {
>  	struct radeon_ttm_tt *gtt = (void *)ttm;
> +	struct radeon_device *rdev = radeon_get_rdev(ttm->bdev);
>  
> -	radeon_gart_unbind(gtt->rdev, gtt->offset, ttm->num_pages);
> +	radeon_gart_unbind(rdev, gtt->offset, ttm->num_pages);
>  
>  	if (gtt->userptr)
>  		radeon_ttm_tt_unpin_userptr(ttm);
> @@ -584,7 +585,6 @@ static struct ttm_tt *radeon_ttm_tt_create(struct ttm_buffer_object *bo,
>  		return NULL;
>  	}
>  	gtt->ttm.ttm.func = &radeon_backend_func;
> -	gtt->rdev = rdev;
>  	if (ttm_dma_tt_init(&gtt->ttm, bo, page_flags)) {
>  		kfree(gtt);
>  		return NULL;
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
