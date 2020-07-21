Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97FE12279F6
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jul 2020 09:55:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6D4B6E4C4;
	Tue, 21 Jul 2020 07:55:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E586E6E4C4
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 07:55:33 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id y3so2845291wrl.4
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 00:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=pC+MGteSaMp2RBo9D5sBnIPWSphfRqDbYcC1LuuInP0=;
 b=RerIcbVYT+ToH2PS40TmLP+Hdsgw2OT71mvs/T5kbPeY6hp3Ol0b7D+elEWJ3TrRrG
 6evA7WgT+vCgDv70GzXAG3f6CV3lwIyRmxrNXx6ckMvgA+1YfnbX4pwHBhQoJh9FnawY
 GhmAUqguH1I1waahe5o3lNn+LZzO5rHvNz8mE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=pC+MGteSaMp2RBo9D5sBnIPWSphfRqDbYcC1LuuInP0=;
 b=pD7ZLxXUNPNuIG323RxFjp+01NuRc+u4+MATN2TJStyyaKVAn9awcghQgtEh7mVW++
 S7PsvAvakmPZCXgleLAmpH5VPW8qr5FDz78BbZqUkxjPIiHfhRstv84g+Pf+mul4hQpt
 mg+FjweJL6T048S6usDv5A1B1TcNrBMYcq+TMCzhSmkfBsz8vCVb14Y9k6JkLj8BMwOL
 VCY06QmXBOoJG+JtLaXJI4zsYE+I1H2uQZUVqIjl7BYHsv2AG8M+uTUtHMndany4SHaD
 8gh9AUOSfnOPJ9mS0MpBIVCL4ZTr/ULPkROyYSqbJEYnCazYCyseqNlqohjlJ6N9f911
 Og8g==
X-Gm-Message-State: AOAM530u9G3tcg1VIPrwD4oqYoAXNyAXNOlKdkXWtEWrfDu2xLJBK2P9
 diRCr/SNn9Kq/LDc7SZjnmFchw==
X-Google-Smtp-Source: ABdhPJyBiIhIdHCuPngi6T5lVyRtpPE9JF1UmoFOu6WcQ3sp7JC/inXzrYZ8ZYybVpNdMbIXv55DFg==
X-Received: by 2002:adf:8562:: with SMTP id 89mr27523981wrh.57.1595318132529; 
 Tue, 21 Jul 2020 00:55:32 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id g126sm1700186wme.16.2020.07.21.00.55.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 00:55:31 -0700 (PDT)
Date: Tue, 21 Jul 2020 09:55:30 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 01/11] drm: remove optional dummy function from drivers
 using TTM
Message-ID: <20200721075530.GC3278063@phenom.ffwll.local>
References: <20200721073245.2484-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200721073245.2484-1-christian.koenig@amd.com>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
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

On Tue, Jul 21, 2020 at 09:32:35AM +0200, Christian K=F6nig wrote:
> Implementing those is completely unecessary.
> =

> Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    |  5 -----
>  drivers/gpu/drm/drm_gem_vram_helper.c      |  5 -----
>  drivers/gpu/drm/qxl/qxl_ttm.c              |  6 ------
>  drivers/gpu/drm/radeon/radeon_ttm.c        |  5 -----
>  drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c | 11 -----------
>  5 files changed, 32 deletions(-)
> =

> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_ttm.c
> index 3df685287cc1..9c0f12f74af9 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -836,10 +836,6 @@ static int amdgpu_ttm_io_mem_reserve(struct ttm_bo_d=
evice *bdev, struct ttm_mem_
>  	return 0;
>  }
>  =

> -static void amdgpu_ttm_io_mem_free(struct ttm_bo_device *bdev, struct tt=
m_mem_reg *mem)
> -{
> -}
> -
>  static unsigned long amdgpu_ttm_io_mem_pfn(struct ttm_buffer_object *bo,
>  					   unsigned long page_offset)
>  {
> @@ -1754,7 +1750,6 @@ static struct ttm_bo_driver amdgpu_bo_driver =3D {
>  	.release_notify =3D &amdgpu_bo_release_notify,
>  	.fault_reserve_notify =3D &amdgpu_bo_fault_reserve_notify,
>  	.io_mem_reserve =3D &amdgpu_ttm_io_mem_reserve,
> -	.io_mem_free =3D &amdgpu_ttm_io_mem_free,
>  	.io_mem_pfn =3D amdgpu_ttm_io_mem_pfn,
>  	.access_memory =3D &amdgpu_ttm_access_memory,
>  	.del_from_lru_notify =3D &amdgpu_vm_del_from_lru_notify
> diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_=
gem_vram_helper.c
> index d107a2679e23..3296ed3df358 100644
> --- a/drivers/gpu/drm/drm_gem_vram_helper.c
> +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
> @@ -1081,10 +1081,6 @@ static int bo_driver_io_mem_reserve(struct ttm_bo_=
device *bdev,
>  	return 0;
>  }
>  =

> -static void bo_driver_io_mem_free(struct ttm_bo_device *bdev,
> -				  struct ttm_mem_reg *mem)
> -{ }
> -
>  static struct ttm_bo_driver bo_driver =3D {
>  	.ttm_tt_create =3D bo_driver_ttm_tt_create,
>  	.ttm_tt_populate =3D ttm_pool_populate,
> @@ -1094,7 +1090,6 @@ static struct ttm_bo_driver bo_driver =3D {
>  	.evict_flags =3D bo_driver_evict_flags,
>  	.move_notify =3D bo_driver_move_notify,
>  	.io_mem_reserve =3D bo_driver_io_mem_reserve,
> -	.io_mem_free =3D bo_driver_io_mem_free,
>  };
>  =

>  /*
> diff --git a/drivers/gpu/drm/qxl/qxl_ttm.c b/drivers/gpu/drm/qxl/qxl_ttm.c
> index 52eaa2d22745..a6e67149ef4a 100644
> --- a/drivers/gpu/drm/qxl/qxl_ttm.c
> +++ b/drivers/gpu/drm/qxl/qxl_ttm.c
> @@ -129,11 +129,6 @@ int qxl_ttm_io_mem_reserve(struct ttm_bo_device *bde=
v,
>  	return 0;
>  }
>  =

> -static void qxl_ttm_io_mem_free(struct ttm_bo_device *bdev,
> -				struct ttm_mem_reg *mem)
> -{
> -}
> -
>  /*
>   * TTM backend functions.
>   */
> @@ -247,7 +242,6 @@ static struct ttm_bo_driver qxl_bo_driver =3D {
>  	.evict_flags =3D &qxl_evict_flags,
>  	.move =3D &qxl_bo_move,
>  	.io_mem_reserve =3D &qxl_ttm_io_mem_reserve,
> -	.io_mem_free =3D &qxl_ttm_io_mem_free,
>  	.move_notify =3D &qxl_bo_move_notify,
>  };
>  =

> diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon=
/radeon_ttm.c
> index f4f1e63731a5..73085523fad7 100644
> --- a/drivers/gpu/drm/radeon/radeon_ttm.c
> +++ b/drivers/gpu/drm/radeon/radeon_ttm.c
> @@ -457,10 +457,6 @@ static int radeon_ttm_io_mem_reserve(struct ttm_bo_d=
evice *bdev, struct ttm_mem_
>  	return 0;
>  }
>  =

> -static void radeon_ttm_io_mem_free(struct ttm_bo_device *bdev, struct tt=
m_mem_reg *mem)
> -{
> -}
> -
>  /*
>   * TTM backend functions.
>   */
> @@ -774,7 +770,6 @@ static struct ttm_bo_driver radeon_bo_driver =3D {
>  	.move_notify =3D &radeon_bo_move_notify,
>  	.fault_reserve_notify =3D &radeon_bo_fault_reserve_notify,
>  	.io_mem_reserve =3D &radeon_ttm_io_mem_reserve,
> -	.io_mem_free =3D &radeon_ttm_io_mem_free,
>  };
>  =

>  int radeon_ttm_init(struct radeon_device *rdev)
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c b/drivers/gpu/drm=
/vmwgfx/vmwgfx_ttm_buffer.c
> index fbcd11a7b215..bfd0c54ec30a 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
> @@ -815,15 +815,6 @@ static int vmw_ttm_io_mem_reserve(struct ttm_bo_devi=
ce *bdev, struct ttm_mem_reg
>  	return 0;
>  }
>  =

> -static void vmw_ttm_io_mem_free(struct ttm_bo_device *bdev, struct ttm_m=
em_reg *mem)
> -{
> -}
> -
> -static int vmw_ttm_fault_reserve_notify(struct ttm_buffer_object *bo)
> -{
> -	return 0;
> -}
> -
>  /**
>   * vmw_move_notify - TTM move_notify_callback
>   *
> @@ -866,7 +857,5 @@ struct ttm_bo_driver vmw_bo_driver =3D {
>  	.verify_access =3D vmw_verify_access,
>  	.move_notify =3D vmw_move_notify,
>  	.swap_notify =3D vmw_swap_notify,
> -	.fault_reserve_notify =3D &vmw_ttm_fault_reserve_notify,
>  	.io_mem_reserve =3D &vmw_ttm_io_mem_reserve,
> -	.io_mem_free =3D &vmw_ttm_io_mem_free,
>  };
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
