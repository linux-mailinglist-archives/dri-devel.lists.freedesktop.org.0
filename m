Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F37227B27
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jul 2020 10:53:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B65B16E519;
	Tue, 21 Jul 2020 08:53:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 919A06E519
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 08:53:01 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id b6so20345529wrs.11
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 01:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=imBSeFM8n6CGU7vrKI3JDy9S4/eegL2w02ghXujmWk8=;
 b=hvng1htDblD5b/7124uzI1QD70XEYqnarOQY1jbwbTHb/5SjKm2lO6ZJFBfAbyKSk1
 f6M/AC3Yd6j+H3DA/Cz58TLwcGmz8rYlbwLs+7kxZE0xSI3oOja+ki9vStWfhjUdNlca
 hK/D0g5/K9rsW/Wlf7JmnQqG3gEV7JaJ5UY78=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=imBSeFM8n6CGU7vrKI3JDy9S4/eegL2w02ghXujmWk8=;
 b=S3n0xXKqVbCRz0GMffRSnkbjfH+K/6u61D8Vctsy5czI/Vc1TbNcrTXfIJGSnXaIds
 FO+Szcvz01xL3DqPQNMnC9exmqrZc/wPlvx4OYyxjcWew9cUV3czgT6vUsKpwfV4fT4e
 Z0npCvA28Y/8Z1U/XN/fyTV4g2vnK5WFHl6e8j4dM4wvYTzsZihNSYoyAe6qC9E2oNNU
 4wIQTwRMLC/SjJSBWRuPZdgoeLwqy0wxE29WFXUnxmFUmySzH9Zkf67YVkcZuZyCxW6W
 z0WRYWfyKpn+Zg9pwi4WZaCYZ4TW+61cwuqHB60s1453L1zqT9cyQpbK7Rs1c1uoMcxd
 D6gw==
X-Gm-Message-State: AOAM530ES3r5vZQbQxPbaGa+7PTkyV7x57cvW8BvG25CyG6lC5UvHliv
 0n+eM/Zs6J5j+Hsd6Iv0SB9ZIA==
X-Google-Smtp-Source: ABdhPJx5pH3lvWy8CigUYMkgMHcdrzIZAQjvnq5mXfSFkOnH2aceZLAZP9Z5Y7Ym74S4BTt9gdWxtg==
X-Received: by 2002:adf:fe0a:: with SMTP id n10mr416643wrr.125.1595321580262; 
 Tue, 21 Jul 2020 01:53:00 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id c194sm2690575wme.8.2020.07.21.01.52.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 01:52:59 -0700 (PDT)
Date: Tue, 21 Jul 2020 10:52:57 +0200
From: daniel@ffwll.ch
To: 
Subject: Re: [PATCH 03/11] drm/ttm: remove io_reserve_fastpath flag
Message-ID: <20200721085257.GB6419@phenom.ffwll.local>
References: <20200721073245.2484-1-christian.koenig@amd.com>
 <20200721073245.2484-3-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200721073245.2484-3-christian.koenig@amd.com>
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

On Tue, Jul 21, 2020 at 09:32:37AM +0200, Christian K=F6nig wrote:
> Just use the use_io_reserve_lru flag. It doesn't make much
> sense to have two flags.
> =

> Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>

Yeah looks entirely redundant.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/nouveau/nouveau_bo.c | 1 -
>  drivers/gpu/drm/ttm/ttm_bo.c         | 1 -
>  drivers/gpu/drm/ttm/ttm_bo_util.c    | 8 ++++----
>  include/drm/ttm/ttm_bo_driver.h      | 2 --
>  4 files changed, 4 insertions(+), 8 deletions(-)
> =

> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouve=
au/nouveau_bo.c
> index a48652826f67..a1037478fa3f 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> @@ -675,7 +675,6 @@ nouveau_bo_init_mem_type(struct ttm_bo_device *bdev, =
uint32_t type,
>  			}
>  =

>  			man->func =3D &nouveau_vram_manager;
> -			man->io_reserve_fastpath =3D false;
>  			man->use_io_reserve_lru =3D true;
>  		} else {
>  			man->func =3D &ttm_bo_manager_func;
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index 7be36b9996ed..8b9e7f62bea7 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -1521,7 +1521,6 @@ int ttm_bo_init_mm(struct ttm_bo_device *bdev, unsi=
gned type,
>  	BUG_ON(type >=3D TTM_NUM_MEM_TYPES);
>  	man =3D &bdev->man[type];
>  	BUG_ON(man->has_type);
> -	man->io_reserve_fastpath =3D true;
>  	man->use_io_reserve_lru =3D false;
>  	mutex_init(&man->io_reserve_mutex);
>  	spin_lock_init(&man->move_lock);
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_=
bo_util.c
> index 7d2c50fef456..6c05f4fd15ae 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> @@ -93,7 +93,7 @@ EXPORT_SYMBOL(ttm_bo_move_ttm);
>  =

>  int ttm_mem_io_lock(struct ttm_mem_type_manager *man, bool interruptible)
>  {
> -	if (likely(man->io_reserve_fastpath))
> +	if (likely(!man->use_io_reserve_lru))
>  		return 0;
>  =

>  	if (interruptible)
> @@ -105,7 +105,7 @@ int ttm_mem_io_lock(struct ttm_mem_type_manager *man,=
 bool interruptible)
>  =

>  void ttm_mem_io_unlock(struct ttm_mem_type_manager *man)
>  {
> -	if (likely(man->io_reserve_fastpath))
> +	if (likely(!man->use_io_reserve_lru))
>  		return;
>  =

>  	mutex_unlock(&man->io_reserve_mutex);
> @@ -136,7 +136,7 @@ int ttm_mem_io_reserve(struct ttm_bo_device *bdev,
>  =

>  	if (!bdev->driver->io_mem_reserve)
>  		return 0;
> -	if (likely(man->io_reserve_fastpath))
> +	if (likely(!man->use_io_reserve_lru))
>  		return bdev->driver->io_mem_reserve(bdev, mem);
>  =

>  	if (bdev->driver->io_mem_reserve &&
> @@ -157,7 +157,7 @@ void ttm_mem_io_free(struct ttm_bo_device *bdev,
>  {
>  	struct ttm_mem_type_manager *man =3D &bdev->man[mem->mem_type];
>  =

> -	if (likely(man->io_reserve_fastpath))
> +	if (likely(!man->use_io_reserve_lru))
>  		return;
>  =

>  	if (bdev->driver->io_mem_reserve &&
> diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_dri=
ver.h
> index 732167cad130..45522e4fbd6b 100644
> --- a/include/drm/ttm/ttm_bo_driver.h
> +++ b/include/drm/ttm/ttm_bo_driver.h
> @@ -155,7 +155,6 @@ struct ttm_mem_type_manager_func {
>   * @use_io_reserve_lru: Use an lru list to try to unreserve io_mem_regio=
ns
>   * reserved by the TTM vm system.
>   * @io_reserve_lru: Optional lru list for unreserving io mem regions.
> - * @io_reserve_fastpath: Only use bdev::driver::io_mem_reserve to obtain
>   * @move_lock: lock for move fence
>   * static information. bdev::driver::io_mem_free is never used.
>   * @lru: The lru list for this memory type.
> @@ -184,7 +183,6 @@ struct ttm_mem_type_manager {
>  	void *priv;
>  	struct mutex io_reserve_mutex;
>  	bool use_io_reserve_lru;
> -	bool io_reserve_fastpath;
>  	spinlock_t move_lock;
>  =

>  	/*
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
