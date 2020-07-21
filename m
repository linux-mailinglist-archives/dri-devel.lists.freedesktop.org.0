Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68791227B0C
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jul 2020 10:50:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4BCB6E29A;
	Tue, 21 Jul 2020 08:50:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B56556E29A
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 08:50:40 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id q5so20354939wru.6
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 01:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=8vckIJrXE3nDwsAW19dMPxoxKoYZVQg/ALzXZZUhxeY=;
 b=SzR3sFdn9/qOElDTTtcIjoeqniW54b988Ohu/6zrZRmxzI9NAB8tebO0WtRUR0dJ6s
 9nmGSfsukBy3xzCwkWnPCwf1naka3R3Cck5pWHbOnj2helNADitYN8cFr1Re0BxunCm7
 uwn68Y/WaFoUuViDD2P1UppmwoIBb4YZMKvWw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=8vckIJrXE3nDwsAW19dMPxoxKoYZVQg/ALzXZZUhxeY=;
 b=XtNSG2/ZaUFRAmpGiDn09vTen7UlG0EtvJKjSaHBCFKUL+6MsaMp6Hv3AqfPgNeW3M
 QJwp+Wj04Zor8IPO/9Sdhc2WQOMDdmXeXlz+t0GqEUTgudNY1MCuh+Pv59F1+A3oTWsU
 MNfFBiFEv1n2erR8M2fGGrmBDhMPSFOI3091v4puoS9P2cjgqoU8vIr51qj6gMx1+fbx
 x5rrOLw+Zx2pLqFqQY+ILdVcYHwashvjukk0KYhABmuNT9FftNJQamomMFLpcoT7ILW6
 /4MaaK6epHnKNyG9YfklQ6Ey4/H80XZOPcVhLe+Ak0Y/9TqQJWYFiovImXdfqUxNw/b7
 aIig==
X-Gm-Message-State: AOAM530yTj7a+PuN83H+2GbwDOXvy4lQUOFPUmadGRUfKl9xJkPWag34
 ZPAhPcpUCaTh4kcn1ejVr1n8+A==
X-Google-Smtp-Source: ABdhPJxcmOVRTZ1LZDezNs1dE1wpAvp2FX9LwH4h9UziS/0096qVgDHSEUhhXsqpXYRNMxvG4PjEcQ==
X-Received: by 2002:adf:fd41:: with SMTP id h1mr9912054wrs.124.1595321439327; 
 Tue, 21 Jul 2020 01:50:39 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id n18sm7576295wrw.45.2020.07.21.01.50.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 01:50:38 -0700 (PDT)
Date: Tue, 21 Jul 2020 10:50:32 +0200
From: daniel@ffwll.ch
To: 
Subject: Re: [PATCH 02/11] drm/ttm: cleanup io_mem interface with nouveau
Message-ID: <20200721085032.GA6419@phenom.ffwll.local>
References: <20200721073245.2484-1-christian.koenig@amd.com>
 <20200721073245.2484-2-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200721073245.2484-2-christian.koenig@amd.com>
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

On Tue, Jul 21, 2020 at 09:32:36AM +0200, Christian K=F6nig wrote:
> Nouveau is the only user of this functionality and evicting io space
> on -EAGAIN is really a misuse of the return code.
> =

> Instead switch to using -ENOSPC here which makes much more sense and
> simplifies the code.
> =

> Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>

Going from EAGAIN to something else could unbreak something that's held
together as a almost livelock restarting ioctls or whatever. So I looked
for that a bit:

- mmap path seems fine, all errors from the io_reserve stuff here get
  remapped to sigbus

- but everywhere else we just pass down the errno it seems, and nouveau
  has a bunch of kmaps all around (gpu relocs on pre-nv50 is probably the
  big one, if we ignore the memcpy bo move fallback). I haven't found
  anything that indicates those chips don't have the ioremapping hw, so
  there's some risk I think. Otoh I also don't see anything that would
  unbreak the lifelook, so feels minimally.

With that impact to pushbuf ioctl documented in the commit message somehow
this is Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/nouveau/nouveau_bo.c | 2 --
>  drivers/gpu/drm/ttm/ttm_bo_util.c    | 4 ++--
>  2 files changed, 2 insertions(+), 4 deletions(-)
> =

> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouve=
au/nouveau_bo.c
> index 61355cfb7335..a48652826f67 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> @@ -1505,8 +1505,6 @@ nouveau_ttm_io_mem_reserve(struct ttm_bo_device *bd=
ev, struct ttm_mem_reg *reg)
>  			if (ret !=3D 1) {
>  				if (WARN_ON(ret =3D=3D 0))
>  					return -EINVAL;
> -				if (ret =3D=3D -ENOSPC)
> -					return -EAGAIN;
>  				return ret;
>  			}
>  =

> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_=
bo_util.c
> index 5e0f3a9caedc..7d2c50fef456 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> @@ -116,7 +116,7 @@ static int ttm_mem_io_evict(struct ttm_mem_type_manag=
er *man)
>  	struct ttm_buffer_object *bo;
>  =

>  	if (!man->use_io_reserve_lru || list_empty(&man->io_reserve_lru))
> -		return -EAGAIN;
> +		return -ENOSPC;
>  =

>  	bo =3D list_first_entry(&man->io_reserve_lru,
>  			      struct ttm_buffer_object,
> @@ -143,7 +143,7 @@ int ttm_mem_io_reserve(struct ttm_bo_device *bdev,
>  	    mem->bus.io_reserved_count++ =3D=3D 0) {
>  retry:
>  		ret =3D bdev->driver->io_mem_reserve(bdev, mem);
> -		if (ret =3D=3D -EAGAIN) {
> +		if (ret =3D=3D -ENOSPC) {
>  			ret =3D ttm_mem_io_evict(man);
>  			if (ret =3D=3D 0)
>  				goto retry;
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
