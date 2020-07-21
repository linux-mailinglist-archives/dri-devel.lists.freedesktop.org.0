Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03AD6227BB9
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jul 2020 11:29:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C57F6E536;
	Tue, 21 Jul 2020 09:29:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 475FD6E550
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 09:29:05 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id a15so5534864wrh.10
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 02:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=1Ie6G74XJdw7VgUpbgB8b+JX6BNo4qUcTXsFkruZ7aM=;
 b=eGNWM6fuPOkmvrpbVweU79Ki/KRE/o4TuM764JKnhrNkvf2cBqymNDZJtPWfO0UMGE
 114BOLdeYHhzT1Cc6GlpgcB/Wx4gkIB9YwCK42Lusu2nqusWPNsOPkMzVeouYqBNHmv1
 9A6J63bX+9IdQZhzOmBCugM0/pAvC2p6/vNfM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=1Ie6G74XJdw7VgUpbgB8b+JX6BNo4qUcTXsFkruZ7aM=;
 b=irmYj3pjqTl5y9yRNCtKw3J2l7b1EJCx84tm7AadWsGMAzfmPXGnWPwy2YH2cqCOkV
 ul1jXzAOK3pS5X1stMb0uBj+7IVnIWD/PQIis42RFkXfoqOPABz7S7ocYkUzx2YIgFjZ
 pPcvejEoxc6cLd9YiyWN1TkI1hljz81uS9Fyyky62anjo0So6Im6y2rTzzZC3rh7Jhdm
 F5VjBQNH8wYFHwg32q95KTDtdrtNwL167v1tD2O1Zw8+lfLO/XOuCVcb/lsSPBzPLnqK
 7AnS6GyCDngz+4FIDO2qFvP2Wb5YU2gWFaXR5+OTsDfkAdtwKC0ziHY8jlEcknHr9Jxl
 1GnQ==
X-Gm-Message-State: AOAM530AaDyXCU8XGnGtNaNnC1BEorInLro52c9QR92Xfy9Z+i1+UWtD
 wr2wpyM09ih8EYYBdrG+D/49Ig==
X-Google-Smtp-Source: ABdhPJwKz89W/tf9byzkXIdXhLgwLzJ5i7AEDmA75tAuiTwlxhZQyE/ZQcSpELqqEFjO5L2vos9kBQ==
X-Received: by 2002:a5d:6683:: with SMTP id l3mr27000437wru.288.1595323743984; 
 Tue, 21 Jul 2020 02:29:03 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 1sm2657726wmf.0.2020.07.21.02.29.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 02:29:03 -0700 (PDT)
Date: Tue, 21 Jul 2020 11:29:01 +0200
From: daniel@ffwll.ch
To: 
Subject: Re: [PATCH 10/11] drm/qxl: stop using TTM_MEMTYPE_FLAG_MAPPABLE v2
Message-ID: <20200721092901.GI6419@phenom.ffwll.local>
References: <20200721073245.2484-1-christian.koenig@amd.com>
 <20200721073245.2484-10-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200721073245.2484-10-christian.koenig@amd.com>
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

On Tue, Jul 21, 2020 at 09:32:44AM +0200, Christian K=F6nig wrote:
> The driver doesn't expose any not-mapable memory resources.
> =

> v2: remove unused man variable as well
> =

> Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/qxl/qxl_ttm.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> =

> diff --git a/drivers/gpu/drm/qxl/qxl_ttm.c b/drivers/gpu/drm/qxl/qxl_ttm.c
> index a6e67149ef4a..1d8e07b8b19e 100644
> --- a/drivers/gpu/drm/qxl/qxl_ttm.c
> +++ b/drivers/gpu/drm/qxl/qxl_ttm.c
> @@ -54,7 +54,7 @@ static int qxl_init_mem_type(struct ttm_bo_device *bdev=
, uint32_t type,
>  	switch (type) {
>  	case TTM_PL_SYSTEM:
>  		/* System memory */
> -		man->flags =3D TTM_MEMTYPE_FLAG_MAPPABLE;
> +		man->flags =3D 0;
>  		man->available_caching =3D TTM_PL_MASK_CACHING;
>  		man->default_caching =3D TTM_PL_FLAG_CACHED;
>  		break;
> @@ -62,8 +62,7 @@ static int qxl_init_mem_type(struct ttm_bo_device *bdev=
, uint32_t type,
>  	case TTM_PL_PRIV:
>  		/* "On-card" video ram */
>  		man->func =3D &ttm_bo_manager_func;
> -		man->flags =3D TTM_MEMTYPE_FLAG_FIXED |
> -			     TTM_MEMTYPE_FLAG_MAPPABLE;
> +		man->flags =3D TTM_MEMTYPE_FLAG_FIXED;
>  		man->available_caching =3D TTM_PL_MASK_CACHING;
>  		man->default_caching =3D TTM_PL_FLAG_CACHED;
>  		break;
> @@ -99,7 +98,6 @@ static void qxl_evict_flags(struct ttm_buffer_object *b=
o,
>  int qxl_ttm_io_mem_reserve(struct ttm_bo_device *bdev,
>  			   struct ttm_mem_reg *mem)
>  {
> -	struct ttm_mem_type_manager *man =3D &bdev->man[mem->mem_type];
>  	struct qxl_device *qdev =3D qxl_get_qdev(bdev);
>  =

>  	mem->bus.addr =3D NULL;
> @@ -107,8 +105,7 @@ int qxl_ttm_io_mem_reserve(struct ttm_bo_device *bdev,
>  	mem->bus.size =3D mem->num_pages << PAGE_SHIFT;
>  	mem->bus.base =3D 0;
>  	mem->bus.is_iomem =3D false;
> -	if (!(man->flags & TTM_MEMTYPE_FLAG_MAPPABLE))
> -		return -EINVAL;
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
