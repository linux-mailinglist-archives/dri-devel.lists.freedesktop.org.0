Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A914402BD1
	for <lists+dri-devel@lfdr.de>; Tue,  7 Sep 2021 17:30:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FA4589F77;
	Tue,  7 Sep 2021 15:30:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B82389F77
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Sep 2021 15:30:19 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id w144so13204208oie.13
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Sep 2021 08:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=BzmTMMtHABSwF8+UrfkOaRFrBtoAv6wf7kePohoXqMU=;
 b=T0Iq7Wn2u+kuxe8e/O1Y33P+3lNPejwsv3mkJbjhEko0Vkt5Ebt9MUZXWJ1AG4AOId
 dnPHiRG2yx/t2/17w026LmWJ8jQhyGqmq3SImnV0RQfc3Q4gZTHENUA80xupzDBuQCXO
 vrrEDnlo9EokUF8KpjpPWQhD0eRfKNq9pwkH/LDgd/3Cx2U5ppMLB1YXMrRfLPhGoEEM
 xD/q9dwRh9zx41Sq7SDxorunksadRB9QH8d5fdAxgQikJoNdECZEiCaw25qKnDRuELma
 42Qkz2uESBUT1fLSxENwZp5Eqh00Zs8tQcFCK0/Mt49BCnibfqfv6vmONVyk6CujHwPM
 UAOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=BzmTMMtHABSwF8+UrfkOaRFrBtoAv6wf7kePohoXqMU=;
 b=K/udZlU8a5iM7tfFgJOahCjyy7LbaAb/8qR2L3RzhHfs36sfirnoc90dtj9Fb/waSZ
 3wNs2aAk81iBXQmL5P3008IK877rTDjL5IJ9t2Cm2ibGTJyHWqCtxAEb7m2j/VFsej6N
 g7gxNxrdoIwlwQvFoRlMWfUMAO/avzZ5hxTFRcQMDUrQO/tuMYdhHej3EpQyKvGwdNQQ
 tA/b5JbQzQQ/M0GEHvo+pFmjw5vPFjM9PwaCPmIx92igP4sR8Z5KxRe20EQHlj6PxYfy
 7532pi+CODhiSinmtFSdRRMl4UhPdFC9+EzuFnIZMO+KmCIf4dFCXsNJ4jP6We8ouOEp
 bkoA==
X-Gm-Message-State: AOAM530wuqfzGXmhnFfqme0MOeWpydJyPSOXgvLA8BRos1NKuVhTTmKH
 /5Q/cYLm/cGI5tOEgn6phDAfHZ+Mts8biit9tJk=
X-Google-Smtp-Source: ABdhPJwWVVJW3NnPzT3dPp3pG3qIbKgUek9MFmx2IqgnzGXla7tcTx90aJjGk8ZpLqt9CB20sPSQwPzJE7LORK2cxN0=
X-Received: by 2002:a05:6808:483:: with SMTP id z3mr3280127oid.5.1631028618897; 
 Tue, 07 Sep 2021 08:30:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210907080135.101452-1-christian.koenig@amd.com>
 <20210907080135.101452-7-christian.koenig@amd.com>
In-Reply-To: <20210907080135.101452-7-christian.koenig@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 7 Sep 2021 11:30:08 -0400
Message-ID: <CADnq5_POr3d8+xqggsni4Q+Tp=EpyM_7oWGncUzQ2AR7FyqyrQ@mail.gmail.com>
Subject: Re: [PATCH 7/8] drm/ttm: enable TTM TT object kerneldoc v2
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
> v2: add caching enum link
>
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  Documentation/gpu/drm-mm.rst |  9 +++++++++
>  include/drm/ttm/ttm_tt.h     | 11 ++++++++---
>  2 files changed, 17 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
> index 1c9930fb5e7d..69c4a20b95d0 100644
> --- a/Documentation/gpu/drm-mm.rst
> +++ b/Documentation/gpu/drm-mm.rst
> @@ -58,6 +58,15 @@ TTM resource object reference
>  .. kernel-doc:: drivers/gpu/drm/ttm/ttm_resource.c
>     :export:
>
> +TTM TT object reference
> +-----------------------
> +
> +.. kernel-doc:: include/drm/ttm/ttm_tt.h
> +   :internal:
> +
> +.. kernel-doc:: drivers/gpu/drm/ttm/ttm_tt.c
> +   :export:
> +
>  The Graphics Execution Manager (GEM)
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
> index e402dab1d0f6..b3963ab12e1f 100644
> --- a/include/drm/ttm/ttm_tt.h
> +++ b/include/drm/ttm/ttm_tt.h
> @@ -54,7 +54,7 @@ struct ttm_operation_ctx;
>   * @dma_address: The DMA (bus) addresses of the pages
>   * @swap_storage: Pointer to shmem struct file for swap storage.
>   * @pages_list: used by some page allocation backend
> - * @caching: The current caching state of the pages.
> + * @caching: The current caching state of the pages, see enum ttm_cachin=
g.
>   *
>   * This is a structure holding the pages, caching- and aperture binding
>   * status for a buffer object that isn't backed by fixed (VRAM / AGP)
> @@ -126,8 +126,9 @@ int ttm_sg_tt_init(struct ttm_tt *ttm_dma, struct ttm=
_buffer_object *bo,
>  void ttm_tt_fini(struct ttm_tt *ttm);
>
>  /**
> - * ttm_ttm_destroy:
> + * ttm_tt_destroy:
>   *
> + * @bdev: the ttm_device this object belongs to
>   * @ttm: The struct ttm_tt.
>   *
>   * Unbind, unpopulate and destroy common struct ttm_tt.
> @@ -148,15 +149,19 @@ int ttm_tt_swapout(struct ttm_device *bdev, struct =
ttm_tt *ttm,
>  /**
>   * ttm_tt_populate - allocate pages for a ttm
>   *
> + * @bdev: the ttm_device this object belongs to
>   * @ttm: Pointer to the ttm_tt structure
> + * @ctx: operation context for populating the tt object.
>   *
>   * Calls the driver method to allocate pages for a ttm
>   */
> -int ttm_tt_populate(struct ttm_device *bdev, struct ttm_tt *ttm, struct =
ttm_operation_ctx *ctx);
> +int ttm_tt_populate(struct ttm_device *bdev, struct ttm_tt *ttm,
> +                   struct ttm_operation_ctx *ctx);
>
>  /**
>   * ttm_tt_unpopulate - free pages from a ttm
>   *
> + * @bdev: the ttm_device this object belongs to
>   * @ttm: Pointer to the ttm_tt structure
>   *
>   * Calls the driver method to free all pages from a ttm
> --
> 2.25.1
>
