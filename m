Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D004B436499
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 16:43:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58FEC6E456;
	Thu, 21 Oct 2021 14:43:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com
 [IPv6:2607:f8b0:4864:20::82b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5328C6E3F7;
 Thu, 21 Oct 2021 14:43:39 +0000 (UTC)
Received: by mail-qt1-x82b.google.com with SMTP id g17so654876qtk.8;
 Thu, 21 Oct 2021 07:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=lOgAv0RUn+G/h3WvMEWgZ+LgzmImBw3/7R1Zz0KDOtg=;
 b=JbQtoFS9ps06Qf0ri+JWZeO4wKq1V+fDSUNXZTuiquhHxWUEyclM9M//jaIwFDevRU
 2EBfo2bFF3suB5YhwKVdT6vEuQ3phhxFNaqDdk99XV0E/aTjhQliopuOOmkBWWZwqeA4
 h/IJ9c7qdFKvc73f3s5S/nZGK5OmJle0LT4c4rsXS3Nj2/xE0owMP28ZWQarT5WloNJu
 FO8NOG6VGABK/DgsYDDZ0gh+at7VZ8BMfvbVftY6QuNKyE+dAdbWTRecKi1GEVgoQonX
 ZuGuhlGtW43X290bD9E/rT8OxJ49Ul3iCrzxJhyI05YIY6N00xO30l8h88Xa69kjxHae
 bE5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=lOgAv0RUn+G/h3WvMEWgZ+LgzmImBw3/7R1Zz0KDOtg=;
 b=JGdg32rLTvO5xFf+kEkttozW3Q+YSyXEEUTfOulHYgPqN3+DZcvG4UMJPg4EdRntx5
 ql5XeS3XyrMtxJ4m/KNmtRrJ2Y+aCs9YKmB/VOeeg3g8tiIYsNz1eeax44iHge/D5Sau
 36qvJYbiRruUsYAMGbt0XCFDUJgZYgnfF6R04up99/nI6+P9Pflf4e8Na98Bh0YI9pvY
 0qnZryHnVnrzzOgspGI56IeZEFmzulLslxDlGrTBOHmWPPBTD2VdQeORyqhv87GiIRuY
 BNtGo6WAZmb+LMpfm+hYNHPtyWjaGg0Nsni6QzMhj7onngRNqI2lsMjeeqze/KmQ94KM
 CasQ==
X-Gm-Message-State: AOAM532PIHHHXGvAPAZ310uY7Y7YsQ+e6LcAdgnK56F9Fj+VQrVsCQrj
 PIUNAuJj8AQQ6LFUomunj4DgtVunjcQ4/qs64XT+HV0C/K0=
X-Google-Smtp-Source: ABdhPJz2APufizpjHUM2VocIwTBLUiinZotzIFP+iTeWUExgqbWuJ8raRpY1ueD85vDJ5NI3qSIAn94CKZ5DGa5mshI=
X-Received: by 2002:a05:622a:1998:: with SMTP id
 u24mr6478311qtc.156.1634827418296; 
 Thu, 21 Oct 2021 07:43:38 -0700 (PDT)
MIME-Version: 1.0
References: <20211021103605.735002-1-maarten.lankhorst@linux.intel.com>
 <20211021103605.735002-3-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20211021103605.735002-3-maarten.lankhorst@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Thu, 21 Oct 2021 15:43:10 +0100
Message-ID: <CAM0jSHNWC9zUJiqErU_Xt-=UDeEedpgYt2PeF1Ww65E9TZMD0g@mail.gmail.com>
Subject: Re: [PATCH 03/28] drm/i915: Remove dma_resv_prune
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>, 
 ML dri-devel <dri-devel@lists.freedesktop.org>
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

On Thu, 21 Oct 2021 at 11:36, Maarten Lankhorst
<maarten.lankhorst@linux.intel.com> wrote:
>
> The signaled bit is already used for quick testing if a fence is signaled=
.

Why do we need this change? Can you add some more details to the commit ple=
ase?

>
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/Makefile                |  1 -
>  drivers/gpu/drm/i915/dma_resv_utils.c        | 17 -----------------
>  drivers/gpu/drm/i915/dma_resv_utils.h        | 13 -------------
>  drivers/gpu/drm/i915/gem/i915_gem_shrinker.c |  3 ---
>  drivers/gpu/drm/i915/gem/i915_gem_wait.c     |  8 --------
>  5 files changed, 42 deletions(-)
>  delete mode 100644 drivers/gpu/drm/i915/dma_resv_utils.c
>  delete mode 100644 drivers/gpu/drm/i915/dma_resv_utils.h
>
> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefil=
e
> index 467872cca027..b87e3ed10d86 100644
> --- a/drivers/gpu/drm/i915/Makefile
> +++ b/drivers/gpu/drm/i915/Makefile
> @@ -60,7 +60,6 @@ i915-y +=3D i915_drv.o \
>
>  # core library code
>  i915-y +=3D \
> -       dma_resv_utils.o \
>         i915_memcpy.o \
>         i915_mm.o \
>         i915_sw_fence.o \
> diff --git a/drivers/gpu/drm/i915/dma_resv_utils.c b/drivers/gpu/drm/i915=
/dma_resv_utils.c
> deleted file mode 100644
> index 7df91b7e4ca8..000000000000
> --- a/drivers/gpu/drm/i915/dma_resv_utils.c
> +++ /dev/null
> @@ -1,17 +0,0 @@
> -// SPDX-License-Identifier: MIT
> -/*
> - * Copyright =C2=A9 2020 Intel Corporation
> - */
> -
> -#include <linux/dma-resv.h>
> -
> -#include "dma_resv_utils.h"
> -
> -void dma_resv_prune(struct dma_resv *resv)
> -{
> -       if (dma_resv_trylock(resv)) {
> -               if (dma_resv_test_signaled(resv, true))
> -                       dma_resv_add_excl_fence(resv, NULL);
> -               dma_resv_unlock(resv);
> -       }
> -}
> diff --git a/drivers/gpu/drm/i915/dma_resv_utils.h b/drivers/gpu/drm/i915=
/dma_resv_utils.h
> deleted file mode 100644
> index b9d8fb5f8367..000000000000
> --- a/drivers/gpu/drm/i915/dma_resv_utils.h
> +++ /dev/null
> @@ -1,13 +0,0 @@
> -/* SPDX-License-Identifier: MIT */
> -/*
> - * Copyright =C2=A9 2020 Intel Corporation
> - */
> -
> -#ifndef DMA_RESV_UTILS_H
> -#define DMA_RESV_UTILS_H
> -
> -struct dma_resv;
> -
> -void dma_resv_prune(struct dma_resv *resv);
> -
> -#endif /* DMA_RESV_UTILS_H */
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c b/drivers/gpu/d=
rm/i915/gem/i915_gem_shrinker.c
> index 5ab136ffdeb2..af3eb7fd951d 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
> @@ -15,7 +15,6 @@
>
>  #include "gt/intel_gt_requests.h"
>
> -#include "dma_resv_utils.h"
>  #include "i915_trace.h"
>
>  static bool swap_available(void)
> @@ -229,8 +228,6 @@ i915_gem_shrink(struct i915_gem_ww_ctx *ww,
>                                         i915_gem_object_unlock(obj);
>                         }
>
> -                       dma_resv_prune(obj->base.resv);

Like here, why do we want to drop this? Later in the series it looks
like it gets added back, just in a slightly different form.

> -
>                         scanned +=3D obj->base.size >> PAGE_SHIFT;
>  skip:
>                         i915_gem_object_put(obj);
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_wait.c b/drivers/gpu/drm/i=
915/gem/i915_gem_wait.c
> index 840c13706999..1592d95c3ead 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_wait.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_wait.c
> @@ -10,7 +10,6 @@
>
>  #include "gt/intel_engine.h"
>
> -#include "dma_resv_utils.h"
>  #include "i915_gem_ioctls.h"
>  #include "i915_gem_object.h"
>
> @@ -52,13 +51,6 @@ i915_gem_object_wait_reservation(struct dma_resv *resv=
,
>         }
>         dma_resv_iter_end(&cursor);
>
> -       /*
> -        * Opportunistically prune the fences iff we know they have *all*=
 been
> -        * signaled.
> -        */
> -       if (timeout > 0)
> -               dma_resv_prune(resv);
> -
>         return ret;
>  }
>
> --
> 2.33.0
>
