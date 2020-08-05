Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8409023C54E
	for <lists+dri-devel@lfdr.de>; Wed,  5 Aug 2020 07:54:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82E896E4DE;
	Wed,  5 Aug 2020 05:54:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb44.google.com (mail-yb1-xb44.google.com
 [IPv6:2607:f8b0:4864:20::b44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24CB16E4DE
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Aug 2020 05:54:08 +0000 (UTC)
Received: by mail-yb1-xb44.google.com with SMTP id n141so21022676ybf.3
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Aug 2020 22:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3psiKbas/uLdk90iDtYQLLy2/myClf0YhdTxB5nj6TI=;
 b=ZhBq1OvpS8jxNRFKU5novrzxlWfgPCZoIOIDyKRSCesltCP+mIxxIR7sOjsb4twIP0
 o4VUGAKE37oesehJpNBSo/mvdpZhg4oQf4K7aEFuBCxPmkaG60sFCssTooUNHLYdto0X
 w5cVRY6lmKkZ3L1x7b1f+N/3TnVgTa6vH2x3OE5W9U1d8TgmzBYfSm4yTQJL6G4sa0Fs
 d/WtQL5VrUTYug3wyXU6Jvt69WDJcT3HWk4ADP3PdXjWfv4Kg/BIlcTHTJHvK4g9Y9BB
 Pb+DsnptBbzD6cCOJzVP98igVIFS/d6M9fWSyS7yQQWQ/AqbIEJH9d3Xs7jJvekf+Yu0
 T7kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3psiKbas/uLdk90iDtYQLLy2/myClf0YhdTxB5nj6TI=;
 b=NHll2/b2Wcq7Ff8EdjGVpnPv7kksnkYCKsNkgi7H6p7xEKH9piIE6q/Q9WjEMjTrHV
 SH1lFj+xqqWz6zB0VU0MGsqjTP5JNdMINRbLk7k7eHFpQq3gihuPIFAho0804LgRCaUT
 HbTl1JJv3cPg+p88B6rp9axXi/l3nq32cGS6ADqltmkg5J0Y5TykyekNdwsZ80Icb/ZK
 nLvoOwgcKn9QMqwscXzXTvQhD7e3j4a55/4BeIviROyUkcUHvB+EPYAL5XbWCM3e+b6S
 3JjXwrF7MTnX1jfRkrwZsCWWkBtYSQWbzKrxwwOhcWQO73VA1lRXmloI4BNxzflXFh5A
 SSYA==
X-Gm-Message-State: AOAM530RoHqDfygoDk7ayp040UEOB5P99R2kbdI2kt7KJivN7wYVf3Ud
 JjtXMWjJlNkJoV0efAlrPw1XnSkpIIZGe5xevOw=
X-Google-Smtp-Source: ABdhPJyhtAacFigVJGEF94GfXh7YtMG1enSJYwI2qcrgpFwqJXUaD3t0XvYjsBTvJFCGLWcAj/CQhdY6zwGurT6Ws/4=
X-Received: by 2002:a25:c4c5:: with SMTP id u188mr2327224ybf.162.1596606847397; 
 Tue, 04 Aug 2020 22:54:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200804025632.3868079-1-airlied@gmail.com>
 <20200804025632.3868079-51-airlied@gmail.com>
In-Reply-To: <20200804025632.3868079-51-airlied@gmail.com>
From: Ben Skeggs <skeggsb@gmail.com>
Date: Wed, 5 Aug 2020 15:53:56 +1000
Message-ID: <CACAvsv74r4Ymdz+-Mb2iJuFbGpwK_cxCZnsucYZS1x5DHGyCiQ@mail.gmail.com>
Subject: Re: [PATCH 50/59] drm/nouveau/ttm: move to driver allocated manager
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
>  drivers/gpu/drm/nouveau/nouveau_ttm.c | 45 +++++++++++++++++++--------
>  1 file changed, 32 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_ttm.c b/drivers/gpu/drm/nouveau/nouveau_ttm.c
> index 1c636723823c..58d9bd708e95 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_ttm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_ttm.c
> @@ -157,12 +157,12 @@ static int
>  nouveau_ttm_init_vram(struct nouveau_drm *drm)
>  {
>         struct nvif_mmu *mmu = &drm->client.mmu;
> -
>         if (drm->client.device.info.family >= NV_DEVICE_INFO_V0_TESLA) {
> -               struct ttm_mem_type_manager *man = ttm_manager_type(&drm->ttm.bdev, TTM_PL_VRAM);
> -
>                 /* Some BARs do not support being ioremapped WC */
>                 const u8 type = mmu->type[drm->ttm.type_vram].type;
> +               struct ttm_mem_type_manager *man = kzalloc(sizeof(struct ttm_mem_type_manager), GFP_KERNEL);
> +               if (!man)
> +                       return -ENOMEM;
>
>                 man->available_caching = TTM_PL_FLAG_UNCACHED | TTM_PL_FLAG_WC;
>                 man->default_caching = TTM_PL_FLAG_WC;
> @@ -174,8 +174,10 @@ nouveau_ttm_init_vram(struct nouveau_drm *drm)
>
>                 man->func = &nouveau_vram_manager;
>                 man->use_io_reserve_lru = true;
> +
>                 ttm_mem_type_manager_init(&drm->ttm.bdev, man,
>                                           drm->gem.vram_available >> PAGE_SHIFT);
> +               ttm_set_driver_manager(&drm->ttm.bdev, TTM_PL_VRAM, man);
>                 ttm_mem_type_manager_set_used(man, true);
>                 return 0;
>         } else {
> @@ -195,6 +197,8 @@ nouveau_ttm_fini_vram(struct nouveau_drm *drm)
>                 ttm_mem_type_manager_disable(man);
>                 ttm_mem_type_manager_force_list_clean(&drm->ttm.bdev, man);
>                 ttm_mem_type_manager_cleanup(man);
> +               ttm_set_driver_manager(&drm->ttm.bdev, TTM_PL_VRAM, NULL);
> +               kfree(man);
>         } else
>                 ttm_range_man_fini(&drm->ttm.bdev, TTM_PL_VRAM);
>  }
> @@ -202,30 +206,43 @@ nouveau_ttm_fini_vram(struct nouveau_drm *drm)
>  static int
>  nouveau_ttm_init_gtt(struct nouveau_drm *drm)
>  {
> -       struct ttm_mem_type_manager *man = ttm_manager_type(&drm->ttm.bdev, TTM_PL_TT);
> +       struct ttm_mem_type_manager *man;
>         unsigned long size_pages = drm->gem.gart_available >> PAGE_SHIFT;
> -       man->use_tt = true;
> +       unsigned available_caching, default_caching;
> +       const struct ttm_mem_type_manager_func *func = NULL;
>         if (drm->agp.bridge) {
> -               man->available_caching = TTM_PL_FLAG_UNCACHED |
> +               available_caching = TTM_PL_FLAG_UNCACHED |
>                         TTM_PL_FLAG_WC;
> -               man->default_caching = TTM_PL_FLAG_WC;
> +               default_caching = TTM_PL_FLAG_WC;
>         } else {
> -               man->available_caching = TTM_PL_MASK_CACHING;
> -               man->default_caching = TTM_PL_FLAG_CACHED;
> +               available_caching = TTM_PL_MASK_CACHING;
> +               default_caching = TTM_PL_FLAG_CACHED;
>         }
>
>         if (drm->client.device.info.family >= NV_DEVICE_INFO_V0_TESLA)
> -               man->func = &nouveau_gart_manager;
> +               func = &nouveau_gart_manager;
>         else if (!drm->agp.bridge)
> -               man->func = &nv04_gart_manager;
> +               func = &nv04_gart_manager;
>         else
>                 return ttm_range_man_init(&drm->ttm.bdev, TTM_PL_TT,
> -                                         TTM_PL_FLAG_UNCACHED | TTM_PL_FLAG_WC,
> -                                         TTM_PL_FLAG_WC, true,
> +                                         available_caching, default_caching,
> +                                         true,
>                                           size_pages);
> +
> +       man = kzalloc(sizeof(struct ttm_mem_type_manager), GFP_KERNEL);
> +       if (!man)
> +               return -ENOMEM;
> +
> +       man->func = func;
> +       man->available_caching = available_caching;
> +       man->default_caching = default_caching;
> +       man->use_tt = true;
>         ttm_mem_type_manager_init(&drm->ttm.bdev, man,
>                                   size_pages);
> +
> +       ttm_set_driver_manager(&drm->ttm.bdev, TTM_PL_TT, man);
>         ttm_mem_type_manager_set_used(man, true);
> +
>         return 0;
>  }
>
> @@ -241,6 +258,8 @@ nouveau_ttm_fini_gtt(struct nouveau_drm *drm)
>                 ttm_mem_type_manager_disable(man);
>                 ttm_mem_type_manager_force_list_clean(&drm->ttm.bdev, man);
>                 ttm_mem_type_manager_cleanup(man);
> +               ttm_set_driver_manager(&drm->ttm.bdev, TTM_PL_TT, NULL);
> +               kfree(man);
>         }
>  }
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
