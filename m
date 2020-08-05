Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E039323C528
	for <lists+dri-devel@lfdr.de>; Wed,  5 Aug 2020 07:40:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 642D789EF7;
	Wed,  5 Aug 2020 05:40:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb43.google.com (mail-yb1-xb43.google.com
 [IPv6:2607:f8b0:4864:20::b43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8B9689EF7
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Aug 2020 05:40:29 +0000 (UTC)
Received: by mail-yb1-xb43.google.com with SMTP id y134so17935962yby.2
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Aug 2020 22:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GedR4FO3b+D+mStbotcsp1tQ7PsM3bvYs9nPA6XDqKM=;
 b=sS63OrpkyZp5h9rwYofPLW8xVSpBPok6VpNsBCvliGL5KpDowH1HyxkeFXEnbRaCFE
 UBXsIoF1lmzH3leFiTNCsMrRxiTwPuSjKy6xyA/LkY2H6GfNf1wHpCLUrepIXrsDkWeP
 gIgIPNDwKIbl4VIe0vzfXvqxywhaSgl+X1nnIVfsMaOAOLeXoZrG8CtnMPAPfEbrW/TN
 cAc+SPBcG8mKmYy8SU5YLXGPoOof6rA2VeAnsrs3KgnKVYViENCwYL2VXvKfxFQdzprL
 TfOdRK13W4pMBY5b5sbmunCorQgBJTDCXJC056nozODBaepEWcphVcOofhIHFQcpFNCD
 01OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GedR4FO3b+D+mStbotcsp1tQ7PsM3bvYs9nPA6XDqKM=;
 b=R1CWNULxt2apXCMEpqGfmRqoEodIEUmRdosoXQiL7krROcBLRk0d54YMzhrr21LBxs
 DoEkZVXUGVMfXBVYLAOI4EeaRbfLF/EcbhDWtZ/jCxZydP6DRIlYnqlpoP+jNWBsOx/v
 6WXxTIQ1kcg5RfEDq/el83mKLvKLMZlvgiGHuCduZW2xNwSX8YQ1mKgCEoTeDb+q3cCX
 JU/SjWmjFe2dOCDTha53MXOf59S2VHt3r2zDygvF8PNXWPbs6+MryPay4SU16GSKCrYP
 Gs+JSfl2G8aPYedwJMtH0PdPUDyx8H8d1JmXHNq6tKL6s/mmAPa8FnedkcC92WootnTi
 LZ1A==
X-Gm-Message-State: AOAM531RUJrRe7oL7cQ9fkg/CYJ/v86C4FF/s/zUm+cSZB8Mhv0hzRQT
 HJviNrP1Quz0/M4ZVLFplU7iy2aZsc5+HH+m7oo=
X-Google-Smtp-Source: ABdhPJwp8qKudoaHKM9rtW5qsaxWnth65y3Mh7gi7lXvYngxRtO+yBryGaAK0wuaAX5B0sYaSUpwfWK2SWvfgd5fexA=
X-Received: by 2002:a25:c4c5:: with SMTP id u188mr2276427ybf.162.1596606028961; 
 Tue, 04 Aug 2020 22:40:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200804025632.3868079-1-airlied@gmail.com>
 <20200804025632.3868079-20-airlied@gmail.com>
In-Reply-To: <20200804025632.3868079-20-airlied@gmail.com>
From: Ben Skeggs <skeggsb@gmail.com>
Date: Wed, 5 Aug 2020 15:40:17 +1000
Message-ID: <CACAvsv4c3CtqNfg3WdfC4v+MWGNz0qufVhMcYB86PEnJmpVUaA@mail.gmail.com>
Subject: Re: [PATCH 19/59] drm/nouveau: use new memory manager init paths
To: Dave Airlie <airlied@gmail.com>
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
Cc: sroland@vmware.com, ML dri-devel <dri-devel@lists.freedesktop.org>,
 linux-graphics-maintainer@vmware.com, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 4 Aug 2020 at 12:57, Dave Airlie <airlied@gmail.com> wrote:
>
> From: Dave Airlie <airlied@redhat.com>
>
> Signed-off-by: Dave Airlie <airlied@redhat.com>
Reviewed-by: Ben Skeggs <bskeggs@redhat.com>

> ---
>  drivers/gpu/drm/nouveau/nouveau_ttm.c | 43 ++++++++++++---------------
>  1 file changed, 19 insertions(+), 24 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_ttm.c b/drivers/gpu/drm/nouveau/nouveau_ttm.c
> index 6de762a0c229..cfcbecd332ef 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_ttm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_ttm.c
> @@ -31,12 +31,6 @@
>
>  #include <core/tegra.h>
>
> -static int
> -nouveau_manager_init(struct ttm_mem_type_manager *man, unsigned long psize)
> -{
> -       return 0;
> -}
> -
>  static int
>  nouveau_manager_fini(struct ttm_mem_type_manager *man)
>  {
> @@ -76,7 +70,6 @@ nouveau_vram_manager_new(struct ttm_mem_type_manager *man,
>  }
>
>  const struct ttm_mem_type_manager_func nouveau_vram_manager = {
> -       .init = nouveau_manager_init,
>         .takedown = nouveau_manager_fini,
>         .get_node = nouveau_vram_manager_new,
>         .put_node = nouveau_manager_del,
> @@ -101,7 +94,6 @@ nouveau_gart_manager_new(struct ttm_mem_type_manager *man,
>  }
>
>  const struct ttm_mem_type_manager_func nouveau_gart_manager = {
> -       .init = nouveau_manager_init,
>         .takedown = nouveau_manager_fini,
>         .get_node = nouveau_gart_manager_new,
>         .put_node = nouveau_manager_del,
> @@ -135,7 +127,6 @@ nv04_gart_manager_new(struct ttm_mem_type_manager *man,
>  }
>
>  const struct ttm_mem_type_manager_func nv04_gart_manager = {
> -       .init = nouveau_manager_init,
>         .takedown = nouveau_manager_fini,
>         .get_node = nv04_gart_manager_new,
>         .put_node = nouveau_manager_del,
> @@ -191,27 +182,21 @@ nouveau_ttm_init_vram(struct nouveau_drm *drm)
>
>                 man->func = &nouveau_vram_manager;
>                 man->use_io_reserve_lru = true;
> +               ttm_mem_type_manager_init(&drm->ttm.bdev, man,
> +                                         drm->gem.vram_available >> PAGE_SHIFT);
> +               ttm_mem_type_manager_set_used(man, true);
> +               return 0;
>         } else {
> -               man->func = &ttm_bo_manager_func;
> +               return ttm_range_man_init(&drm->ttm.bdev, man,
> +                                         drm->gem.vram_available >> PAGE_SHIFT);
>         }
> -
> -       return ttm_bo_init_mm(&drm->ttm.bdev, TTM_PL_VRAM,
> -                             drm->gem.vram_available >> PAGE_SHIFT);
>  }
>
>  static int
>  nouveau_ttm_init_gtt(struct nouveau_drm *drm)
>  {
>         struct ttm_mem_type_manager *man = &drm->ttm.bdev.man[TTM_PL_TT];
> -
> -       if (drm->client.device.info.family >= NV_DEVICE_INFO_V0_TESLA)
> -               man->func = &nouveau_gart_manager;
> -       else
> -       if (!drm->agp.bridge)
> -               man->func = &nv04_gart_manager;
> -       else
> -               man->func = &ttm_bo_manager_func;
> -
> +       unsigned long size_pages = drm->gem.gart_available >> PAGE_SHIFT;
>         man->use_tt = true;
>         if (drm->agp.bridge) {
>                 man->available_caching = TTM_PL_FLAG_UNCACHED |
> @@ -222,8 +207,18 @@ nouveau_ttm_init_gtt(struct nouveau_drm *drm)
>                 man->default_caching = TTM_PL_FLAG_CACHED;
>         }
>
> -       return ttm_bo_init_mm(&drm->ttm.bdev, TTM_PL_TT,
> -                             drm->gem.gart_available >> PAGE_SHIFT);
> +       if (drm->client.device.info.family >= NV_DEVICE_INFO_V0_TESLA)
> +               man->func = &nouveau_gart_manager;
> +       else if (!drm->agp.bridge)
> +               man->func = &nv04_gart_manager;
> +       else
> +               return ttm_range_man_init(&drm->ttm.bdev, man,
> +                                         size_pages);
> +
> +       ttm_mem_type_manager_init(&drm->ttm.bdev, man,
> +                                 size_pages);
> +       ttm_mem_type_manager_set_used(man, true);
> +       return 0;
>  }
>
>  int
> --
> 2.26.2
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
