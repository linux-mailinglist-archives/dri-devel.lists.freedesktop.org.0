Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF4C527C52D
	for <lists+dri-devel@lfdr.de>; Tue, 29 Sep 2020 13:33:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1BEE6E1A5;
	Tue, 29 Sep 2020 11:33:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34EA16E1A5
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Sep 2020 11:33:21 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id y15so4438209wmi.0
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Sep 2020 04:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=jVmYZJIhjQBYxLog8FMcX5c+SmyOyzYsdXEtWu3X4dk=;
 b=aJw7Hrs3L0leSvxWKB0PtQ/BZ19rL8HfswBQAobeSSZFGHHPM74kgQk2awwXjRnphl
 3y4cqOft3Aopg+OcjxVGWMCdWxj4la3cPT9L51XJVxw9Au40OMpxVqGkS88XoDNk+jdW
 87wj5tsR7VeMA5cU20Qsm6/WEQOabF0w+wM2Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=jVmYZJIhjQBYxLog8FMcX5c+SmyOyzYsdXEtWu3X4dk=;
 b=S8trjF5YUHiV0HIdcfCrUz85EJCvmDimcNRv1s1juHH6lI0+0djgFdSqKPwiP+3hYQ
 sCFrGr5lOljzJxQf+2vtF85fjqZ/Wm7sxDfKtxrOA4l3iaIlElQLJ/8jinkgy1eApwVz
 Zj6DmjffQRBBrstkXF8YQLmZPXXsaQnoD/7BjRPKhM58FamNyNP+e7Q//2mTzcWMYWCJ
 3wMbUk7L//4IJtfDwvKTFnWkko+7CUNxnPWpUQls34oyae9ttu5MOlPpVBQka3L1C2/H
 aEOmwrPmqCf7KnP6k1lgcMvh8f3bFvEDIHQe4cTMw2lh74/QPHjgsxvoHfhnGUsUrrlr
 nP9g==
X-Gm-Message-State: AOAM530aKVuL56A8WP0xwF0mhHL7W6zkzSYMXwMpLqFb82Y7kd2XPcUV
 S5z+O1OdHLWMR3q06qZt1EvFlw==
X-Google-Smtp-Source: ABdhPJz7shlIcaZJ1hDIpKKhHvzgQVfLh4UUoC2yaWe7eayFbTtRpvKcWxJID61hLOJsRANf6l6aAw==
X-Received: by 2002:a1c:20ce:: with SMTP id g197mr4241957wmg.72.1601379199946; 
 Tue, 29 Sep 2020 04:33:19 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id s26sm4969171wmh.44.2020.09.29.04.33.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Sep 2020 04:33:19 -0700 (PDT)
Date: Tue, 29 Sep 2020 13:33:17 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH] drm/qxl: fix usage of ttm_bo_init
Message-ID: <20200929113317.GO438822@phenom.ffwll.local>
References: <20200929112306.80952-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200929112306.80952-1-christian.koenig@amd.com>
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
Cc: airlied@redhat.com, dri-devel@lists.freedesktop.org, kraxel@redhat.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 29, 2020 at 01:23:06PM +0200, Christian K=F6nig wrote:
> We need to use ttm_bo_init_reserved here to make sure
> that the BO is pinned before it becomes visible on the LRU.
> =

> Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

But maybe let Gerd test this first before pushing :-)
-Daniel

> ---
>  drivers/gpu/drm/qxl/qxl_object.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> =

> diff --git a/drivers/gpu/drm/qxl/qxl_object.c b/drivers/gpu/drm/qxl/qxl_o=
bject.c
> index d3635e3e3267..c8b67e7a3f02 100644
> --- a/drivers/gpu/drm/qxl/qxl_object.c
> +++ b/drivers/gpu/drm/qxl/qxl_object.c
> @@ -106,6 +106,7 @@ int qxl_bo_create(struct qxl_device *qdev,
>  		  struct qxl_surface *surf,
>  		  struct qxl_bo **bo_ptr)
>  {
> +	struct ttm_operation_ctx ctx =3D { !kernel, false };
>  	struct qxl_bo *bo;
>  	enum ttm_bo_type type;
>  	int r;
> @@ -134,9 +135,9 @@ int qxl_bo_create(struct qxl_device *qdev,
>  =

>  	qxl_ttm_placement_from_domain(bo, domain);
>  =

> -	r =3D ttm_bo_init(&qdev->mman.bdev, &bo->tbo, size, type,
> -			&bo->placement, 0, !kernel, size,
> -			NULL, NULL, &qxl_ttm_bo_destroy);
> +	r =3D ttm_bo_init_reserved(&qdev->mman.bdev, &bo->tbo, size, type,
> +				 &bo->placement, 0, &ctx, size,
> +				 NULL, NULL, &qxl_ttm_bo_destroy);
>  	if (unlikely(r !=3D 0)) {
>  		if (r !=3D -ERESTARTSYS)
>  			dev_err(qdev->ddev.dev,
> @@ -146,6 +147,7 @@ int qxl_bo_create(struct qxl_device *qdev,
>  	}
>  	if (pinned)
>  		ttm_bo_pin(&bo->tbo);
> +	ttm_bo_unreserve(&bo->tbo);
>  	*bo_ptr =3D bo;
>  	return 0;
>  }
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
