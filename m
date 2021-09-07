Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7184D402BD4
	for <lists+dri-devel@lfdr.de>; Tue,  7 Sep 2021 17:30:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B5E689FC0;
	Tue,  7 Sep 2021 15:30:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com
 [IPv6:2607:f8b0:4864:20::c2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11DCC89FC0
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Sep 2021 15:30:47 +0000 (UTC)
Received: by mail-oo1-xc2a.google.com with SMTP id
 m11-20020a056820034b00b0028bb60b551fso3033227ooe.5
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Sep 2021 08:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=KVAUfYu12erMQUtn5pVVA9jqOWIvdwOGaz8Lo2+uh2c=;
 b=YSxSmarw1FMyj1TZ2apOCR33GouXlUSUzbz2nWR1AT434OI+nhOCtdv41Cji0Gn1Dk
 F2DGhHMeLOnHCNeOVRIYaE3ODplLXqrAQf0bW+ShXZGq/5ixTkLbzkFjSz83oBrOTKC/
 /ElQOr40N10l+V+gUxgPl6SVhruKgQ42NewvfL7gDMA0qzgKBgScYxaFOf2MHLr3ylmO
 62qDPnchIhFAMNOCBjKM+OgrcHEUQOG7IIv78WqdwAdEK91JbBlXExN3yK5vET5QbT38
 n3JH1geDQlT5rPM33XTGCPBmHxGF+rldGmWjcED4g3zRmKwI5sbIwIpVjiOE7hurwUtx
 2m9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=KVAUfYu12erMQUtn5pVVA9jqOWIvdwOGaz8Lo2+uh2c=;
 b=TwVvG0nuH/og8RMzNF5VAmwrLX5gBl36jaIoxK7KRpCyl6ds6BdMkaDm8Y+k9RGtvw
 0tY8T77cROmic8Pmz0gO837Qb/m18HfJr22c9Du+V7QExabLN/JU6YuZ2zssQ958DoKP
 /33UKeJ7dWZmxgsRqqIj74Jyhn0z23Ez16NbTrEaCjl1QSVxLjCzLzvtZ+Gv3cBJh6vE
 BGfiJKbCmbclXAa/gTloOpcnGhGyiLuKHWA/WAH+W3swpJvSKg1mWrn8hGPq8fvIS/95
 z45peXNqjJGORuPLLiUVVNe7ppMYQCZvQEndaI0wD2tt2VfYIHCGGcI1IUDMaTcOj+pZ
 /OfA==
X-Gm-Message-State: AOAM531OlTxrHtNfDEW5pzBeb2EVo1ELAzWN3dfCArcSFVBgCfkJWkdI
 I+9rtjW1IUIGw5+QWJpl0eZ7KsZ74gEi9zG3ysE=
X-Google-Smtp-Source: ABdhPJwlAQRvbck2nQ4Wj3a/cf62fHfZe2z8ZerHEFB+DpqAYZUl1eLjbXY+FEq41h1vYMk+FEtgZjKG7+yud+L1N+o=
X-Received: by 2002:a4a:d794:: with SMTP id c20mr318623oou.23.1631028646380;
 Tue, 07 Sep 2021 08:30:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210907080135.101452-1-christian.koenig@amd.com>
 <20210907080135.101452-8-christian.koenig@amd.com>
In-Reply-To: <20210907080135.101452-8-christian.koenig@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 7 Sep 2021 11:30:35 -0400
Message-ID: <CADnq5_PTT7RhSpOTeMrF0BFJmuhdXPEP=gPSt-W=rRThRQ5p2Q@mail.gmail.com>
Subject: Re: [PATCH 8/8] drm/ttm: enable TTM page pool kerneldoc
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 matthew.william.auld@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 7, 2021 at 4:01 AM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Fix the remaining warnings and finally enable this.
>
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  Documentation/gpu/drm-mm.rst | 9 +++++++++
>  include/drm/ttm/ttm_pool.h   | 5 +++--
>  2 files changed, 12 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
> index 69c4a20b95d0..e0538083a2c0 100644
> --- a/Documentation/gpu/drm-mm.rst
> +++ b/Documentation/gpu/drm-mm.rst
> @@ -67,6 +67,15 @@ TTM TT object reference
>  .. kernel-doc:: drivers/gpu/drm/ttm/ttm_tt.c
>     :export:
>
> +TTM page pool reference
> +-----------------------
> +
> +.. kernel-doc:: include/drm/ttm/ttm_pool.h
> +   :internal:
> +
> +.. kernel-doc:: drivers/gpu/drm/ttm/ttm_pool.c
> +   :export:
> +
>  The Graphics Execution Manager (GEM)
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> diff --git a/include/drm/ttm/ttm_pool.h b/include/drm/ttm/ttm_pool.h
> index 4321728bdd11..ef09b23d29e3 100644
> --- a/include/drm/ttm/ttm_pool.h
> +++ b/include/drm/ttm/ttm_pool.h
> @@ -37,7 +37,7 @@ struct ttm_pool;
>  struct ttm_operation_ctx;
>
>  /**
> - * ttm_pool_type - Pool for a certain memory type
> + * struct ttm_pool_type - Pool for a certain memory type
>   *
>   * @pool: the pool we belong to, might be NULL for the global ones
>   * @order: the allocation order our pages have
> @@ -58,8 +58,9 @@ struct ttm_pool_type {
>  };
>
>  /**
> - * ttm_pool - Pool for all caching and orders
> + * struct ttm_pool - Pool for all caching and orders
>   *
> + * @dev: the device we allocate pages for
>   * @use_dma_alloc: if coherent DMA allocations should be used
>   * @use_dma32: if GFP_DMA32 should be used
>   * @caching: pools for each caching/order
> --
> 2.25.1
>
