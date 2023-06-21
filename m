Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35ACD737C12
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 09:34:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5059710E3D8;
	Wed, 21 Jun 2023 07:34:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com
 [IPv6:2001:4860:4864:20::29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CDDE10E3DC;
 Wed, 21 Jun 2023 07:34:17 +0000 (UTC)
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-1aa291b3fc9so2886512fac.0; 
 Wed, 21 Jun 2023 00:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687332856; x=1689924856;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=VQZ7QLRGowARVqbu56gXLoyfMnzp8YiaIUml3/XIVg8=;
 b=REHgQqy/hli0EtNRC4D9KFb7jY3xyjh31ykF4Xvcl4Eh+5qnWkZGGzQfD356cDOADD
 KBgEKx7SN06VreAZk5Dj9ozg9wRGkWQ4mHfrO5JjLc1lFVvNU5QndVNFuk3JMPHF4AtY
 G1DB/HFVFuk4MG7nnL5UQFDSvkC62x5cbpLVbiKmjOXKM0lhBmXuohbU6aDPNZi7e7XV
 IomGr03tFlv60bIVKGx3KVrEWowZeOVF6xQZcpcPTLnxzszbM7VfIddaUbKukdwenci2
 0XYrTSNpAmlMS4JCqJ1Zz0CsN/3W7fNFCnv/y/jvDVHdsNf/oP4Y/9HVeWGCZiiex9+r
 X6tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687332856; x=1689924856;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VQZ7QLRGowARVqbu56gXLoyfMnzp8YiaIUml3/XIVg8=;
 b=a6JiFCq+TTVkLwIZyc/X6nvYT+Fll0aGr3zVdoy6C6uGlr8znQrOP9crTB3yAdSf8r
 AhGqFw8nwzgxJ/chMimhislHAxLX1XNlKUymj72A+xEcf/cL9R2s0HVsyMCyq1iIRujg
 EErDyn629KkwxsrMCHdUBiUxm82RPotl2CTHhki1tw2rYzVd8S02Qq7zDefzrO5BGpYb
 ke1V6tcxBW2OIKSTSUSfQuN3+zrRfkAo8l9YKCUtEwsomJuur4YirPL1ABFfqfvVHmYg
 FyKpO4gO3RxFu7HRniEw4HrowUMrS+arl8eh01vfybiurnH/en0WowfnQlUl98wboFcm
 XREg==
X-Gm-Message-State: AC+VfDxTGxn0vDo3l+KyWeMRRJWohwSjAv92gdoEDS2dW6TX45OUtxmI
 Ymrl3sM/UUvRp0BD9BZXMAjC8y8Eoj7yYeVTzA2BHz+sXHwi2w==
X-Google-Smtp-Source: ACHHUZ4x5iAaXar0vo6e1PJCGsC1nG24xHfpONE7LHD6MpISQ0TzUtXbmKIYr0OB/6J8WcIeA4CMdEe0IvqVo+UqrKs=
X-Received: by 2002:a05:6870:1a8e:b0:1ac:fc39:1653 with SMTP id
 ef14-20020a0568701a8e00b001acfc391653mr2678180oab.2.1687332855666; Wed, 21
 Jun 2023 00:34:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230607130223.3533464-1-l.stach@pengutronix.de>
 <20230607130223.3533464-7-l.stach@pengutronix.de>
In-Reply-To: <20230607130223.3533464-7-l.stach@pengutronix.de>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Wed, 21 Jun 2023 09:34:04 +0200
Message-ID: <CAH9NwWdH40-sEP3ue8=L458QPRZ5=d8CHKhkT-xPS1pmpSGQKA@mail.gmail.com>
Subject: Re: [PATCH 7/8] drm/etnaviv: drop GPU initialized property
To: Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
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
Cc: kernel@pengutronix.de, patchwork-lst@pengutronix.de,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Russell King <linux+etnaviv@armlinux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Lucas

Am Mi., 7. Juni 2023 um 15:02 Uhr schrieb Lucas Stach <l.stach@pengutronix.de>:
>
> Now that it is only used to track the driver internal state of
> the MMU global and cmdbuf objects, we can get rid of this property
> by making the free/finit functions of those objects safe to call
> on an uninitialized object.
>
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>

Reviewed-by: Christian Gmeiner <cgmeiner@igalia.com>

> ---
>  drivers/gpu/drm/etnaviv/etnaviv_cmdbuf.c | 3 +++
>  drivers/gpu/drm/etnaviv/etnaviv_gpu.c    | 9 ++-------
>  drivers/gpu/drm/etnaviv/etnaviv_gpu.h    | 1 -
>  drivers/gpu/drm/etnaviv/etnaviv_mmu.c    | 3 +++
>  4 files changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_cmdbuf.c b/drivers/gpu/drm/etnaviv/etnaviv_cmdbuf.c
> index 9dc20d892c15..721d633aece9 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_cmdbuf.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_cmdbuf.c
> @@ -121,6 +121,9 @@ void etnaviv_cmdbuf_free(struct etnaviv_cmdbuf *cmdbuf)
>         int order = order_base_2(ALIGN(cmdbuf->size, SUBALLOC_GRANULE) /
>                                  SUBALLOC_GRANULE);
>
> +       if (!suballoc)
> +               return;
> +
>         mutex_lock(&suballoc->lock);
>         bitmap_release_region(suballoc->granule_map,
>                               cmdbuf->suballoc_offset / SUBALLOC_GRANULE,
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> index 96cbb290b869..e62761032afe 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> @@ -868,8 +868,6 @@ int etnaviv_gpu_init(struct etnaviv_gpu *gpu)
>         pm_runtime_mark_last_busy(gpu->dev);
>         pm_runtime_put_autosuspend(gpu->dev);
>
> -       gpu->initialized = true;
> -
>         return 0;
>
>  fail:
> @@ -1797,11 +1795,8 @@ static void etnaviv_gpu_unbind(struct device *dev, struct device *master,
>         if (gpu->mmu_context)
>                 etnaviv_iommu_context_put(gpu->mmu_context);
>
> -       if (gpu->initialized) {
> -               etnaviv_cmdbuf_free(&gpu->buffer);
> -               etnaviv_iommu_global_fini(gpu);
> -               gpu->initialized = false;
> -       }
> +       etnaviv_cmdbuf_free(&gpu->buffer);
> +       etnaviv_iommu_global_fini(gpu);
>
>         gpu->drm = NULL;
>         xa_destroy(&gpu->user_fences);
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
> index 33ecc1bf84b1..a4a9253f0d52 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
> @@ -114,7 +114,6 @@ struct etnaviv_gpu {
>         struct mutex sched_lock;
>         struct drm_gpu_scheduler sched;
>         enum etnaviv_gpu_state state;
> -       bool initialized;
>
>         /* 'ring'-buffer: */
>         struct etnaviv_cmdbuf buffer;
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_mmu.c b/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
> index 67bdce5326c6..4fa72567183a 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
> @@ -553,6 +553,9 @@ void etnaviv_iommu_global_fini(struct etnaviv_gpu *gpu)
>         struct etnaviv_drm_private *priv = gpu->drm->dev_private;
>         struct etnaviv_iommu_global *global = priv->mmu_global;
>
> +       if (!global)
> +               return;
> +
>         if (--global->use > 0)
>                 return;
>
> --
> 2.39.2
>


-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
