Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C14D923C52E
	for <lists+dri-devel@lfdr.de>; Wed,  5 Aug 2020 07:44:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 032F76E4CD;
	Wed,  5 Aug 2020 05:44:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com
 [IPv6:2607:f8b0:4864:20::b41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14A1D6E4CD
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Aug 2020 05:44:38 +0000 (UTC)
Received: by mail-yb1-xb41.google.com with SMTP id p191so6983129ybg.0
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Aug 2020 22:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qCua9q6lxnJBRDzQ+F10Dz2rmCuH2uduHzs181mQwIg=;
 b=fheWvqhjIyMyTqnPzqYmERRjJ/dc7wK2NBCh7EOSnqu2CBRR9k6Pdw+epYejAOzRVY
 AT7IcUyBdm8IcmBPvndCV1vyCwOABKfErK+8rQrIobQY0dgmOAcWUCH1aX6CJBnVPppC
 NiDmCDaewEixKq+kabS9N6BsbImWQ1P9Dx2wP2zEXAGnssGUDeteIiKlZF2+YXhMBYPY
 EOH9TZRMqdRvxLs003gYPMuESTvO5KqARiPc7agQh7a8/ca5VMT7GWyd7LxbvwDwmf0Z
 AqGEXdW4wB0igSzHvmWDIzd9rfPMDP+x/uneELXbEMkfAm5e+LSh8K3SuQVPxDiztdDL
 eyDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qCua9q6lxnJBRDzQ+F10Dz2rmCuH2uduHzs181mQwIg=;
 b=npRG+YNzBxeu9O4l2W09A3mCvb5Fp1CqbLNJO5yePev2AXQtR99vPTYWgHnHMZuY9/
 hm6h3uHa/YPAm/HT/w9+hwb36M1K84psYx7/S0xZujzP0w9vOoGenD0D3RFvAomejGCg
 N8oSLRTRUIVQFStY/yD4ihPshjtI6/2f9aOZ6Ucl2Tu9Uj4OT1eku+ddvAz/bPmFRBty
 z+XpdofrziXpdb1/f3kgcb+Dg1feFtSfzzjbYWmsrLSlU3DnyZ/SuUWse64a0ueW7auJ
 qff8C5QrgSNXMmPpJusETyY/ScPGtFHCF6S2hnEYZlrAYLIqfQtnfTOUimmfp69fi0Jn
 SP3g==
X-Gm-Message-State: AOAM533WyxA085FIZi9aSmYU++AZVjaF1UjenNf7OkUgkFf3rsoMqCSe
 +ZtBvI4L7/0WtCqDDfvOBQ6DYEWmHPM5KkmaJE4=
X-Google-Smtp-Source: ABdhPJxMhyA/G4Zp38X7PaNyb3NU6M1kP/L+t7Yj8qxvuGnB/atstHQ6KtRE2jrXqqCHPtuZ3FjEEcHQenjW51w10mI=
X-Received: by 2002:a25:4d41:: with SMTP id a62mr2576964ybb.83.1596606277347; 
 Tue, 04 Aug 2020 22:44:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200804025632.3868079-1-airlied@gmail.com>
 <20200804025632.3868079-31-airlied@gmail.com>
In-Reply-To: <20200804025632.3868079-31-airlied@gmail.com>
From: Ben Skeggs <skeggsb@gmail.com>
Date: Wed, 5 Aug 2020 15:44:26 +1000
Message-ID: <CACAvsv6M89HQ3H8ebUy68ox3T_TV8RDM5qS9Eec5rKVVGjGgTQ@mail.gmail.com>
Subject: Re: [PATCH 30/59] drm/nouveau: use new cleanup paths
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

On Tue, 4 Aug 2020 at 12:58, Dave Airlie <airlied@gmail.com> wrote:
>
> From: Dave Airlie <airlied@redhat.com>
>
> Signed-off-by: Dave Airlie <airlied@redhat.com>
Reviewed-by: Ben Skeggs <bskeggs@redhat.com>

> ---
>  drivers/gpu/drm/nouveau/nouveau_ttm.c | 41 ++++++++++++++++++++-------
>  1 file changed, 30 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_ttm.c b/drivers/gpu/drm/nouveau/nouveau_ttm.c
> index cfcbecd332ef..bb310719e3f5 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_ttm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_ttm.c
> @@ -31,12 +31,6 @@
>
>  #include <core/tegra.h>
>
> -static int
> -nouveau_manager_fini(struct ttm_mem_type_manager *man)
> -{
> -       return 0;
> -}
> -
>  static void
>  nouveau_manager_del(struct ttm_mem_type_manager *man, struct ttm_mem_reg *reg)
>  {
> @@ -70,7 +64,6 @@ nouveau_vram_manager_new(struct ttm_mem_type_manager *man,
>  }
>
>  const struct ttm_mem_type_manager_func nouveau_vram_manager = {
> -       .takedown = nouveau_manager_fini,
>         .get_node = nouveau_vram_manager_new,
>         .put_node = nouveau_manager_del,
>  };
> @@ -94,7 +87,6 @@ nouveau_gart_manager_new(struct ttm_mem_type_manager *man,
>  }
>
>  const struct ttm_mem_type_manager_func nouveau_gart_manager = {
> -       .takedown = nouveau_manager_fini,
>         .get_node = nouveau_gart_manager_new,
>         .put_node = nouveau_manager_del,
>  };
> @@ -127,7 +119,6 @@ nv04_gart_manager_new(struct ttm_mem_type_manager *man,
>  }
>
>  const struct ttm_mem_type_manager_func nv04_gart_manager = {
> -       .takedown = nouveau_manager_fini,
>         .get_node = nv04_gart_manager_new,
>         .put_node = nouveau_manager_del,
>  };
> @@ -192,6 +183,19 @@ nouveau_ttm_init_vram(struct nouveau_drm *drm)
>         }
>  }
>
> +static void
> +nouveau_ttm_fini_vram(struct nouveau_drm *drm)
> +{
> +       struct ttm_mem_type_manager *man = &drm->ttm.bdev.man[TTM_PL_VRAM];
> +
> +       if (drm->client.device.info.family >= NV_DEVICE_INFO_V0_TESLA) {
> +               ttm_mem_type_manager_disable(man);
> +               ttm_mem_type_manager_force_list_clean(&drm->ttm.bdev, man);
> +               ttm_mem_type_manager_cleanup(man);
> +       } else
> +               ttm_range_man_fini(&drm->ttm.bdev, man);
> +}
> +
>  static int
>  nouveau_ttm_init_gtt(struct nouveau_drm *drm)
>  {
> @@ -221,6 +225,21 @@ nouveau_ttm_init_gtt(struct nouveau_drm *drm)
>         return 0;
>  }
>
> +static void
> +nouveau_ttm_fini_gtt(struct nouveau_drm *drm)
> +{
> +       struct ttm_mem_type_manager *man = &drm->ttm.bdev.man[TTM_PL_TT];
> +
> +       if (drm->client.device.info.family < NV_DEVICE_INFO_V0_TESLA &&
> +           drm->agp.bridge)
> +               ttm_range_man_fini(&drm->ttm.bdev, man);
> +       else {
> +               ttm_mem_type_manager_disable(man);
> +               ttm_mem_type_manager_force_list_clean(&drm->ttm.bdev, man);
> +               ttm_mem_type_manager_cleanup(man);
> +       }
> +}
> +
>  int
>  nouveau_ttm_init(struct nouveau_drm *drm)
>  {
> @@ -310,8 +329,8 @@ nouveau_ttm_fini(struct nouveau_drm *drm)
>  {
>         struct nvkm_device *device = nvxx_device(&drm->client.device);
>
> -       ttm_bo_clean_mm(&drm->ttm.bdev, TTM_PL_VRAM);
> -       ttm_bo_clean_mm(&drm->ttm.bdev, TTM_PL_TT);
> +       nouveau_ttm_fini_vram(drm);
> +       nouveau_ttm_fini_gtt(drm);
>
>         ttm_bo_device_release(&drm->ttm.bdev);
>
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
