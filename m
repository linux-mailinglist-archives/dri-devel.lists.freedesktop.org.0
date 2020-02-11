Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A56159382
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2020 16:44:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78D8A6EE99;
	Tue, 11 Feb 2020 15:44:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02C376EE98
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2020 15:44:32 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id w12so12979147wrt.2
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2020 07:44:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=mrqvVZsVn7mKog9esm7coIiEbXaaJCC1Rfcqj+IiqOM=;
 b=eGIZMXSMMBGZESPC3d5T1L7ViUEpL2IcB9tW7HBQnsr6eo0QpjlO+Q4kFb/sZmLX1L
 6RVlHr5dRNvcDQrVwbmF8zwgXdLLVaeDc0+1yKDirD8N54Ju8PP/tuKbbODgz+DzF/en
 l5pe3fLB4cOn4MNkgbSTKlbRdLBqf0YtOLRts=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=mrqvVZsVn7mKog9esm7coIiEbXaaJCC1Rfcqj+IiqOM=;
 b=JV3TzqL2gY73C6jICM5nPxIdvKRe9OLXQKLvFRCsNfxKfqAYXsgoYKdciSFLHhzH5S
 AFBOJ59T1h7gVh6g7WEEyv7AD35dtKJ2XTX+1J+CAOsMkfzSmxMj+yZhM/OoU2GFUP3X
 Kf6UbuZe+7SEDD3fw00/Q+uYRxSYeTvGnJ3dlPTjpohqlFgSc5ND6A71FdGngMDUD5lY
 u6uhZ9qadWIOXd6a/ttVcbeGWyp98YyRcLXt/TlvySbUK4Kt7GAeWP5aAwZQBDsXzqFo
 lTmSEwkUEmbtRABPRgXlmP8Nb6QqQdijo/BJRshJU1Zi2slg2KcyNRnmHxFQXqEBlPVc
 r4Ww==
X-Gm-Message-State: APjAAAW2/YkR871MW8oOMb+6LaYtX76uEXSY4kMyhP3dZCsr9DPMQvoq
 oTLGyeDZ8XUTejXDngs9M2uDsA==
X-Google-Smtp-Source: APXvYqwdMQB0ue7ACvsZYPC15pFoiUgzd/eTdfxdfCsnGlHwMqTG8gjUl279cbMLPm15eMg4GGpe3Q==
X-Received: by 2002:adf:fa86:: with SMTP id h6mr8940823wrr.418.1581435870743; 
 Tue, 11 Feb 2020 07:44:30 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 25sm4089987wmi.32.2020.02.11.07.44.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2020 07:44:29 -0800 (PST)
Date: Tue, 11 Feb 2020 16:44:27 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH] drm/ttm: replace dma_resv object on deleted BOs v3
Message-ID: <20200211154427.GJ2363188@phenom.ffwll.local>
References: <20200211154326.83858-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200211154326.83858-1-christian.koenig@amd.com>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 11, 2020 at 04:43:26PM +0100, Christian K=F6nig wrote:
> When non-imported BOs are resurrected for delayed delete we replace
> the dma_resv object to allow for easy reclaiming of the resources.
> =

> v2: move that to ttm_bo_individualize_resv
> v3: add a comment to explain what's going on
> =

> Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>
> Reviewed-by: xinhui pan <xinhui.pan@amd.com>
> ---
>  drivers/gpu/drm/ttm/ttm_bo.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> =

> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index bfc42a9e4fb4..8174603d390f 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -393,6 +393,18 @@ static int ttm_bo_individualize_resv(struct ttm_buff=
er_object *bo)
>  =

>  	r =3D dma_resv_copy_fences(&bo->base._resv, bo->base.resv);
>  	dma_resv_unlock(&bo->base._resv);
> +	if (r)
> +		return r;
> +
> +	if (bo->type !=3D ttm_bo_type_sg) {
> +		/* This works because the BO is about to be destroyed and nobody
> +		 * reference it any more. The only tricky case is the trylock on
> +		 * the resv object while holding the lru_lock.
> +		 */

I'm foolish enough to believe this is correct :-)

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> +		spin_lock(&ttm_bo_glob.lru_lock);
> +		bo->base.resv =3D &bo->base._resv;
> +		spin_unlock(&ttm_bo_glob.lru_lock);
> +	}
>  =

>  	return r;
>  }
> @@ -724,7 +736,7 @@ static bool ttm_bo_evict_swapout_allowable(struct ttm=
_buffer_object *bo,
>  =

>  	if (bo->base.resv =3D=3D ctx->resv) {
>  		dma_resv_assert_held(bo->base.resv);
> -		if (ctx->flags & TTM_OPT_FLAG_ALLOW_RES_EVICT || bo->deleted)
> +		if (ctx->flags & TTM_OPT_FLAG_ALLOW_RES_EVICT)
>  			ret =3D true;
>  		*locked =3D false;
>  		if (busy)
> -- =

> 2.17.1
> =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
