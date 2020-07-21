Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9513B227B40
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jul 2020 10:56:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B05746E528;
	Tue, 21 Jul 2020 08:56:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A7756E528
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 08:56:29 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id s10so20321491wrw.12
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 01:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=9uzWoi/wCkdasRHzdl/GGpiJVuQvvdOImQa6SAFqqIc=;
 b=EKWsN+CsI+02WRjwwW/22Pr5fhxfi1yK4WIQq+SVUtWWtAA4eNzwmZnyMwQSEv4IUb
 mgNHEp5vero6YhvPqH4kx0qyICjadlBWXhWEqGQOyeIn1jfBkQkdACQqnPRL8nREkT47
 S/JEmzfzdO4xeE0V14oF71TEnx4Y7tsfx1xZo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=9uzWoi/wCkdasRHzdl/GGpiJVuQvvdOImQa6SAFqqIc=;
 b=khT7YXOkS+PQ9UFiYqeLO/jG+49cs4KeOj62yqrRKUvg08+7P4Dmtkv+GkPH7JA1Zb
 ar7Q6lgIufHpeBYBSZFql1zk7hnd2JHsjsCiFyWUrFZ7A5gwLWgOnMnb74zGFtwYmyzp
 73UoHTT4sWXjtEbuTmOAOx2TMTBPMXggjSejKRCVvP8bVL5KjDqRQo/18oM4NzQbr1V1
 6O0VV3T/VviWhw6FDuLTAWX+kGLLiEC/4ePyHflbyQAl9hFOUAi/P2/z7jsId1Py4ID3
 HjME1QKN+/IcAO07BhAahHGUwBsM1+QL4hbFpgzfaPeH2lKq3/SVjMaGZ8QZlVBg+JS/
 wpxw==
X-Gm-Message-State: AOAM532C6BfT/LsDItRaChXmIJQje/WTWrSDnGOf3QF8xxH4bTgJXkwG
 zOK598e52I8RA2kqIG73iKWdSex5L6w=
X-Google-Smtp-Source: ABdhPJyRPLBPzZ53FaYAzWZsd61W//azcZxrFNGYZuORIXAfcEs4BP8clVJftTIXPZIz/9VAPGD//Q==
X-Received: by 2002:a5d:4751:: with SMTP id o17mr26413040wrs.345.1595321787757; 
 Tue, 21 Jul 2020 01:56:27 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 133sm2892706wme.5.2020.07.21.01.56.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 01:56:27 -0700 (PDT)
Date: Tue, 21 Jul 2020 10:56:25 +0200
From: daniel@ffwll.ch
To: 
Subject: Re: [PATCH 04/11] drm/ttm: cleanup coding style and implementation.
Message-ID: <20200721085625.GC6419@phenom.ffwll.local>
References: <20200721073245.2484-1-christian.koenig@amd.com>
 <20200721073245.2484-4-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200721073245.2484-4-christian.koenig@amd.com>
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

On Tue, Jul 21, 2020 at 09:32:38AM +0200, Christian K=F6nig wrote:
> Only functional change is to always keep io_reserved_count up to date
> for debugging even when it is not used otherwise.

Functional change in a cleanup patch. Tsk. It looks correct though ...

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> =

> Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/ttm/ttm_bo_util.c | 97 +++++++++++++++----------------
>  1 file changed, 48 insertions(+), 49 deletions(-)
> =

> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_=
bo_util.c
> index 6c05f4fd15ae..7fb3e0bcbab4 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> @@ -115,39 +115,35 @@ static int ttm_mem_io_evict(struct ttm_mem_type_man=
ager *man)
>  {
>  	struct ttm_buffer_object *bo;
>  =

> -	if (!man->use_io_reserve_lru || list_empty(&man->io_reserve_lru))
> +	bo =3D list_first_entry_or_null(&man->io_reserve_lru,
> +				      struct ttm_buffer_object,
> +				      io_reserve_lru);
> +	if (!bo)
>  		return -ENOSPC;
>  =

> -	bo =3D list_first_entry(&man->io_reserve_lru,
> -			      struct ttm_buffer_object,
> -			      io_reserve_lru);
>  	list_del_init(&bo->io_reserve_lru);
>  	ttm_bo_unmap_virtual_locked(bo);
> -
>  	return 0;
>  }
>  =

> -
>  int ttm_mem_io_reserve(struct ttm_bo_device *bdev,
>  		       struct ttm_mem_reg *mem)
>  {
>  	struct ttm_mem_type_manager *man =3D &bdev->man[mem->mem_type];
> -	int ret =3D 0;
> +	int ret;
> +
> +	if (mem->bus.io_reserved_count++)
> +		return 0;
>  =

>  	if (!bdev->driver->io_mem_reserve)
>  		return 0;
> -	if (likely(!man->use_io_reserve_lru))
> -		return bdev->driver->io_mem_reserve(bdev, mem);
>  =

> -	if (bdev->driver->io_mem_reserve &&
> -	    mem->bus.io_reserved_count++ =3D=3D 0) {
>  retry:
> -		ret =3D bdev->driver->io_mem_reserve(bdev, mem);
> -		if (ret =3D=3D -ENOSPC) {
> -			ret =3D ttm_mem_io_evict(man);
> -			if (ret =3D=3D 0)
> -				goto retry;
> -		}
> +	ret =3D bdev->driver->io_mem_reserve(bdev, mem);
> +	if (ret =3D=3D -ENOSPC) {
> +		ret =3D ttm_mem_io_evict(man);
> +		if (ret =3D=3D 0)
> +			goto retry;
>  	}
>  	return ret;
>  }
> @@ -155,35 +151,31 @@ int ttm_mem_io_reserve(struct ttm_bo_device *bdev,
>  void ttm_mem_io_free(struct ttm_bo_device *bdev,
>  		     struct ttm_mem_reg *mem)
>  {
> -	struct ttm_mem_type_manager *man =3D &bdev->man[mem->mem_type];
> -
> -	if (likely(!man->use_io_reserve_lru))
> +	if (--mem->bus.io_reserved_count)
>  		return;
>  =

> -	if (bdev->driver->io_mem_reserve &&
> -	    --mem->bus.io_reserved_count =3D=3D 0 &&
> -	    bdev->driver->io_mem_free)
> -		bdev->driver->io_mem_free(bdev, mem);
> +	if (!bdev->driver->io_mem_free)
> +		return;
>  =

> +	bdev->driver->io_mem_free(bdev, mem);
>  }
>  =

>  int ttm_mem_io_reserve_vm(struct ttm_buffer_object *bo)
>  {
> +	struct ttm_mem_type_manager *man =3D &bo->bdev->man[bo->mem.mem_type];
>  	struct ttm_mem_reg *mem =3D &bo->mem;
>  	int ret;
>  =

> -	if (!mem->bus.io_reserved_vm) {
> -		struct ttm_mem_type_manager *man =3D
> -			&bo->bdev->man[mem->mem_type];
> +	if (mem->bus.io_reserved_vm)
> +		return 0;
>  =

> -		ret =3D ttm_mem_io_reserve(bo->bdev, mem);
> -		if (unlikely(ret !=3D 0))
> -			return ret;
> -		mem->bus.io_reserved_vm =3D true;
> -		if (man->use_io_reserve_lru)
> -			list_add_tail(&bo->io_reserve_lru,
> -				      &man->io_reserve_lru);
> -	}
> +	ret =3D ttm_mem_io_reserve(bo->bdev, mem);
> +	if (unlikely(ret !=3D 0))
> +		return ret;
> +	mem->bus.io_reserved_vm =3D true;
> +	if (man->use_io_reserve_lru)
> +		list_add_tail(&bo->io_reserve_lru,
> +			      &man->io_reserve_lru);
>  	return 0;
>  }
>  =

> @@ -191,15 +183,17 @@ void ttm_mem_io_free_vm(struct ttm_buffer_object *b=
o)
>  {
>  	struct ttm_mem_reg *mem =3D &bo->mem;
>  =

> -	if (mem->bus.io_reserved_vm) {
> -		mem->bus.io_reserved_vm =3D false;
> -		list_del_init(&bo->io_reserve_lru);
> -		ttm_mem_io_free(bo->bdev, mem);
> -	}
> +	if (!mem->bus.io_reserved_vm)
> +		return;
> +
> +	mem->bus.io_reserved_vm =3D false;
> +	list_del_init(&bo->io_reserve_lru);
> +	ttm_mem_io_free(bo->bdev, mem);
>  }
>  =

> -static int ttm_mem_reg_ioremap(struct ttm_bo_device *bdev, struct ttm_me=
m_reg *mem,
> -			void **virtual)
> +static int ttm_mem_reg_ioremap(struct ttm_bo_device *bdev,
> +			       struct ttm_mem_reg *mem,
> +			       void **virtual)
>  {
>  	struct ttm_mem_type_manager *man =3D &bdev->man[mem->mem_type];
>  	int ret;
> @@ -216,9 +210,11 @@ static int ttm_mem_reg_ioremap(struct ttm_bo_device =
*bdev, struct ttm_mem_reg *m
>  		addr =3D mem->bus.addr;
>  	} else {
>  		if (mem->placement & TTM_PL_FLAG_WC)
> -			addr =3D ioremap_wc(mem->bus.base + mem->bus.offset, mem->bus.size);
> +			addr =3D ioremap_wc(mem->bus.base + mem->bus.offset,
> +					  mem->bus.size);
>  		else
> -			addr =3D ioremap(mem->bus.base + mem->bus.offset, mem->bus.size);
> +			addr =3D ioremap(mem->bus.base + mem->bus.offset,
> +				       mem->bus.size);
>  		if (!addr) {
>  			(void) ttm_mem_io_lock(man, false);
>  			ttm_mem_io_free(bdev, mem);
> @@ -230,8 +226,9 @@ static int ttm_mem_reg_ioremap(struct ttm_bo_device *=
bdev, struct ttm_mem_reg *m
>  	return 0;
>  }
>  =

> -static void ttm_mem_reg_iounmap(struct ttm_bo_device *bdev, struct ttm_m=
em_reg *mem,
> -			 void *virtual)
> +static void ttm_mem_reg_iounmap(struct ttm_bo_device *bdev,
> +				struct ttm_mem_reg *mem,
> +				void *virtual)
>  {
>  	struct ttm_mem_type_manager *man;
>  =

> @@ -513,11 +510,13 @@ static int ttm_bo_ioremap(struct ttm_buffer_object =
*bo,
>  	} else {
>  		map->bo_kmap_type =3D ttm_bo_map_iomap;
>  		if (mem->placement & TTM_PL_FLAG_WC)
> -			map->virtual =3D ioremap_wc(bo->mem.bus.base + bo->mem.bus.offset + o=
ffset,
> +			map->virtual =3D ioremap_wc(bo->mem.bus.base +
> +						  bo->mem.bus.offset + offset,
>  						  size);
>  		else
> -			map->virtual =3D ioremap(bo->mem.bus.base + bo->mem.bus.offset + offs=
et,
> -						       size);
> +			map->virtual =3D ioremap(bo->mem.bus.base +
> +					       bo->mem.bus.offset + offset,
> +					       size);
>  	}
>  	return (!map->virtual) ? -ENOMEM : 0;
>  }
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
