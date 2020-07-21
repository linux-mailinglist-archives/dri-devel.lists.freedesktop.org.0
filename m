Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 986A3227BB8
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jul 2020 11:28:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA5096E544;
	Tue, 21 Jul 2020 09:28:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAB706E53E
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 09:28:46 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id q5so20473522wru.6
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 02:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=NTw4lCdVfoJ+8yNyc+wjorVBXWCd0x4fPr6aHyvgI1Q=;
 b=ScOOlF9dmXAuWWv4nX6y1aRdhY8Bjde+sgSW2RW5bO764ON34fuWw4Md2mQT9lZZG5
 gBGBP9coC+7PuOV0sRWMedyf0x9vToZ5zONr/z7jn3bmt3BEr/YLMg9EVWdp1iGqoqZX
 jA3xnOFr8sG4Bx3LEzW4mVmHuydIijVkqFZpU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=NTw4lCdVfoJ+8yNyc+wjorVBXWCd0x4fPr6aHyvgI1Q=;
 b=UELgfyj8yxVTu3kMXqonSSIXLmV3+G2tLCmpXB7EPBp5lEU7xYim8kutxoaX/JluZq
 x/kSAN5bkYTsgmOyQDP4ixBIfFNJt3Ij10PLTMQeDpz9c954sqskea0t1a6nmKYJfrEt
 HeTb3slifhWO5dy1KIu+h0YlpkO4qj6ratmpyLHDSuSHWp6uzJzQ1+YwmpxlLC4utTC4
 6nUF/Sr+y6Yb1C6NoKtyReLC0YD5zKKsPlhQ0D0jab2Oku0kgPAhfRyLXZFpxXjYMVqV
 FSykOxF+9OWOkonX1qaJWBp8eBcEhGn5o3VbqfKJEOqM1ImgvK/IGHLJzo80PMkXHuIn
 9BJA==
X-Gm-Message-State: AOAM530gNPSC9PSJ/sbBVydT1AeOjCk21CybmJWJMESi4t4uaXX9ME8j
 N3G3S+4wxLIZi/HOqQFdWi+KOw==
X-Google-Smtp-Source: ABdhPJzr06soee6Wj6VWCYTz+KEySfcfBtTnyRiDejT+ZICW7pqC3UlPZB18uTGxQicM/mG8o466Ew==
X-Received: by 2002:adf:a11d:: with SMTP id o29mr7802327wro.421.1595323725385; 
 Tue, 21 Jul 2020 02:28:45 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id t13sm13123207wru.65.2020.07.21.02.28.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 02:28:44 -0700 (PDT)
Date: Tue, 21 Jul 2020 11:28:43 +0200
From: daniel@ffwll.ch
To: 
Subject: Re: [PATCH 09/11] drm/nouveau: stop using TTM_MEMTYPE_FLAG_MAPPABLE
Message-ID: <20200721092843.GH6419@phenom.ffwll.local>
References: <20200721073245.2484-1-christian.koenig@amd.com>
 <20200721073245.2484-9-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200721073245.2484-9-christian.koenig@amd.com>
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
Cc: Madhav.Chauhan@amd.com, michael.j.ruhl@intel.com, tzimmermann@suse.de,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 21, 2020 at 09:32:43AM +0200, Christian K=F6nig wrote:
> The driver doesn't expose any not-mapable memory resources.
> =

> Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/nouveau/nouveau_bo.c | 13 +++++--------
>  1 file changed, 5 insertions(+), 8 deletions(-)
> =

> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouve=
au/nouveau_bo.c
> index 7883341f8c83..4ccf937df0d0 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> @@ -655,13 +655,12 @@ nouveau_bo_init_mem_type(struct ttm_bo_device *bdev=
, uint32_t type,
>  =

>  	switch (type) {
>  	case TTM_PL_SYSTEM:
> -		man->flags =3D TTM_MEMTYPE_FLAG_MAPPABLE;
> +		man->flags =3D 0;
>  		man->available_caching =3D TTM_PL_MASK_CACHING;
>  		man->default_caching =3D TTM_PL_FLAG_CACHED;
>  		break;
>  	case TTM_PL_VRAM:
> -		man->flags =3D TTM_MEMTYPE_FLAG_FIXED |
> -			     TTM_MEMTYPE_FLAG_MAPPABLE;
> +		man->flags =3D TTM_MEMTYPE_FLAG_FIXED;
>  		man->available_caching =3D TTM_PL_FLAG_UNCACHED |
>  					 TTM_PL_FLAG_WC;
>  		man->default_caching =3D TTM_PL_FLAG_WC;
> @@ -690,12 +689,12 @@ nouveau_bo_init_mem_type(struct ttm_bo_device *bdev=
, uint32_t type,
>  			man->func =3D &ttm_bo_manager_func;
>  =

>  		if (drm->agp.bridge) {
> -			man->flags =3D TTM_MEMTYPE_FLAG_MAPPABLE;
> +			man->flags =3D 0;
>  			man->available_caching =3D TTM_PL_FLAG_UNCACHED |
>  				TTM_PL_FLAG_WC;
>  			man->default_caching =3D TTM_PL_FLAG_WC;
>  		} else {
> -			man->flags =3D TTM_MEMTYPE_FLAG_MAPPABLE;
> +			man->flags =3D 0;
>  			man->available_caching =3D TTM_PL_MASK_CACHING;
>  			man->default_caching =3D TTM_PL_FLAG_CACHED;
>  		}
> @@ -1437,7 +1436,6 @@ nouveau_bo_verify_access(struct ttm_buffer_object *=
bo, struct file *filp)
>  static int
>  nouveau_ttm_io_mem_reserve(struct ttm_bo_device *bdev, struct ttm_mem_re=
g *reg)
>  {
> -	struct ttm_mem_type_manager *man =3D &bdev->man[reg->mem_type];
>  	struct nouveau_drm *drm =3D nouveau_bdev(bdev);
>  	struct nvkm_device *device =3D nvxx_device(&drm->client.device);
>  	struct nouveau_mem *mem =3D nouveau_mem(reg);
> @@ -1447,8 +1445,7 @@ nouveau_ttm_io_mem_reserve(struct ttm_bo_device *bd=
ev, struct ttm_mem_reg *reg)
>  	reg->bus.size =3D reg->num_pages << PAGE_SHIFT;
>  	reg->bus.base =3D 0;
>  	reg->bus.is_iomem =3D false;
> -	if (!(man->flags & TTM_MEMTYPE_FLAG_MAPPABLE))
> -		return -EINVAL;
> +
>  	switch (reg->mem_type) {
>  	case TTM_PL_SYSTEM:
>  		/* System memory */
> -- =

> 2.17.1
> =

> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
