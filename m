Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4573227BB7
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jul 2020 11:28:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 619916E532;
	Tue, 21 Jul 2020 09:28:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12C0F6E532
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 09:28:13 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id q5so20471860wru.6
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 02:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=zDsZ//iJ3akWw1ZyYk+DnXjCY2GZS+Kkbc1Ydr8CU/w=;
 b=jlJh0anjma3wFeWtXl3k9mYs2i9AY271MLgv0LDdZE4pj1hpLuWZKkwdi9fXW59NSn
 Yjzy/QgXas7gRS8PXlpFUQa0nA92bU0Y6cpbm6FCiHO9vbgSyxeLWsShKreOHTGL5D1M
 4RFEf5jO3WEH2R9Xff+xSkT84JNOrg6BVjEnY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=zDsZ//iJ3akWw1ZyYk+DnXjCY2GZS+Kkbc1Ydr8CU/w=;
 b=adgK+1Sd+J8KEI5jAMlfFsYe3kC3iAv8NFot3JAOLCOy0Nzi+hLQHVHbFS8Nb5zaY6
 RErE2IgPQmvTSoVYio9AnqofLHjwbi8+HP0XJlKkJdJpyPfr61phXSC8yOw0CbR4r8LG
 jaet2qfgTrzEJ4VwKvxWfs8w2YkO5mRIVl7iUpZVfb5MF38noum05AJ/ULibg10sWn+9
 DoUMvD1wa2CrKj+nC/IGC8Onbp62Qfp/gC2jeAf3k8nCJsb+WnhvmA6g+kL097/ltOol
 o3foP8V4cmgdYlXGU3PZFoicyJidULxabDpEUdti5RdrO45oVA/I1KcFMAlIsyqw0wF9
 8A6w==
X-Gm-Message-State: AOAM533Q7XlgvxqmWkz9AaVOAb4UiMFliz28iNKT7jQAFLX86LlgR/QQ
 LiPZFsKPwmrJxpCVG5+Cf+ppww==
X-Google-Smtp-Source: ABdhPJyMagsISboqnbHAMizktCsLvSqMKIq8YBVXkwRppjGEhVKrXqTAPpLtM1wMf52C+fCn8oC/mA==
X-Received: by 2002:adf:e6c1:: with SMTP id y1mr27728228wrm.116.1595323691726; 
 Tue, 21 Jul 2020 02:28:11 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id a10sm2229877wmd.3.2020.07.21.02.28.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 02:28:11 -0700 (PDT)
Date: Tue, 21 Jul 2020 11:28:09 +0200
From: daniel@ffwll.ch
To: 
Subject: Re: [PATCH 08/11] drm/amdgpu: stop using TTM_MEMTYPE_FLAG_MAPPABLE
Message-ID: <20200721092809.GG6419@phenom.ffwll.local>
References: <20200721073245.2484-1-christian.koenig@amd.com>
 <20200721073245.2484-8-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200721073245.2484-8-christian.koenig@amd.com>
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

On Tue, Jul 21, 2020 at 09:32:42AM +0200, Christian K=F6nig wrote:
> The driver does support some not-mapable resources, but
> those are already handled correctly in the switch/case
> statement in the code.
> =

> Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
> =

> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_ttm.c
> index 44fa8bc49d18..0dd5e802091d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -84,7 +84,7 @@ static int amdgpu_init_mem_type(struct ttm_bo_device *b=
dev, uint32_t type,
>  	switch (type) {
>  	case TTM_PL_SYSTEM:
>  		/* System memory */
> -		man->flags =3D TTM_MEMTYPE_FLAG_MAPPABLE;
> +		man->flags =3D 0;
>  		man->available_caching =3D TTM_PL_MASK_CACHING;
>  		man->default_caching =3D TTM_PL_FLAG_CACHED;
>  		break;
> @@ -93,13 +93,12 @@ static int amdgpu_init_mem_type(struct ttm_bo_device =
*bdev, uint32_t type,
>  		man->func =3D &amdgpu_gtt_mgr_func;
>  		man->available_caching =3D TTM_PL_MASK_CACHING;
>  		man->default_caching =3D TTM_PL_FLAG_CACHED;
> -		man->flags =3D TTM_MEMTYPE_FLAG_MAPPABLE;
> +		man->flags =3D 0;
>  		break;
>  	case TTM_PL_VRAM:
>  		/* "On-card" video ram */
>  		man->func =3D &amdgpu_vram_mgr_func;
> -		man->flags =3D TTM_MEMTYPE_FLAG_FIXED |
> -			     TTM_MEMTYPE_FLAG_MAPPABLE;
> +		man->flags =3D TTM_MEMTYPE_FLAG_FIXED;
>  		man->available_caching =3D TTM_PL_FLAG_UNCACHED | TTM_PL_FLAG_WC;
>  		man->default_caching =3D TTM_PL_FLAG_WC;
>  		break;
> @@ -796,7 +795,6 @@ static int amdgpu_bo_move(struct ttm_buffer_object *b=
o, bool evict,
>   */
>  static int amdgpu_ttm_io_mem_reserve(struct ttm_bo_device *bdev, struct =
ttm_mem_reg *mem)
>  {
> -	struct ttm_mem_type_manager *man =3D &bdev->man[mem->mem_type];
>  	struct amdgpu_device *adev =3D amdgpu_ttm_adev(bdev);
>  	struct drm_mm_node *mm_node =3D mem->mm_node;
>  =

> @@ -805,8 +803,7 @@ static int amdgpu_ttm_io_mem_reserve(struct ttm_bo_de=
vice *bdev, struct ttm_mem_
>  	mem->bus.size =3D mem->num_pages << PAGE_SHIFT;
>  	mem->bus.base =3D 0;
>  	mem->bus.is_iomem =3D false;
> -	if (!(man->flags & TTM_MEMTYPE_FLAG_MAPPABLE))
> -		return -EINVAL;

This check catches the various special on-board memories, or at least I
couldnt' find where mmap for these is disallowed.
-Daniel

> +
>  	switch (mem->mem_type) {
>  	case TTM_PL_SYSTEM:
>  		/* system memory */
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
