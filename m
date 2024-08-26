Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D145995F3EF
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2024 16:34:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90B3410E21D;
	Mon, 26 Aug 2024 14:34:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Y1VdhP4J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D5A810E21D;
 Mon, 26 Aug 2024 14:34:04 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id
 41be03b00d2f7-7cd9cfe4748so2631390a12.2; 
 Mon, 26 Aug 2024 07:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724682843; x=1725287643; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=NAtqRu/b0jhdd68hvf5beb85uHO+b3KNcBWcH7+HYbA=;
 b=Y1VdhP4JoAdAXQpSe4OhKPJ1c6w9S2mNKutAL7RKDFW48ilO630rn0qXMgJ+6wfQKe
 tYPQMxXyVuJEQfeYDC/OoMM5NORKFoCVP2BxmGvmoD/3U2xC8adTE2eoAkOWF9gwyGUu
 3DhoAdHTwcSixkkGhl12pKTv8MwkPeXbFa5PQKVg3qqiS0EqHfLSDdWehdgfcvwb2WXM
 6YvQLAGtmrR+xi4WW8s5Dkh46AFpezQ0Zq21s4L+NrlinzdUsasIo5X3ZsvFr/nxsJcM
 PtMTVS+oxIVapylh1pWzWVRV9Caqkl4KU/oWDmVJqpUsil6VdvLbdRdMxLlnWt9QbMky
 Dd2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724682843; x=1725287643;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NAtqRu/b0jhdd68hvf5beb85uHO+b3KNcBWcH7+HYbA=;
 b=YWcv/1CDadt+5vRm6xm7gkwNHkf6T/d5cQqUJfOF7zPex7RZnsOrBbTD6OyIryEB/H
 2S2aXbxNiED2E4m11XVUvqXdCCZHKynnBO10RNyNRSspgeqySkoLuXt53mk5CLgeWwvs
 L4i2CYCYThPb5ubGQnO0UYBxHfNSW9W/BhboNAwPNrUbLU/kNI411+EOPuT6tnpHvg+X
 CfYGUIhrZ77NO0xq+QiWYAFSzrJSjqFjFybgONklJ/52arHTbz1+NBndwyfjrN0sHqHC
 7z369pAd2Vr8QzUV9L4yHCbU1ToejxNJREHr2bDcrRTWGbF1k3UcYSYBc+yTfBUQhsTL
 7BqQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVnvimtHfIm2hPh/wh1a4H70LsV5GU0yVNeoaxw441bPJBkyctpCHJ1P4H1eSiFj7Izit6dZTrzcZg=@lists.freedesktop.org,
 AJvYcCXZPT7QBt8c59kWG0jSX9+cDXs9hF0X0BvIh8zpkbF2BZ7Wce0iEAVrPXsyxx7KbouDctzBFNA3Pg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz9G8Tuidk8bLCQMJ4AVw4B1VX+lRQIYqANk2Q6hvAMYz0xFnnh
 pclHsf93pgHs8VGA983rpVt6T8K9DMi3Jddpk1CTLd74fK0iMEFtHHVKZR1s7QAoqYDOWC66Kb9
 mcXWod44Da83H5ydW21iycXrQ0OM=
X-Google-Smtp-Source: AGHT+IHGswmu4skCSJTV0utPI/Jjq8Beu87ivVDe/S41pb2YNsrW0F54bj3C8C2XPPfoOu3Cyfsxm1RuQtIteMKHkZA=
X-Received: by 2002:a17:90b:b0c:b0:2c9:e0d3:1100 with SMTP id
 98e67ed59e1d1-2d646be07c3mr8467021a91.19.1724682843343; Mon, 26 Aug 2024
 07:34:03 -0700 (PDT)
MIME-Version: 1.0
References: <20240825121452.363342-1-sui.jingfeng@linux.dev>
In-Reply-To: <20240825121452.363342-1-sui.jingfeng@linux.dev>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Mon, 26 Aug 2024 16:33:52 +0200
Message-ID: <CAH9NwWf-BODALL3dPgERY6i-KzeghbsWR_zHFv_BPjkiLQbQhw@mail.gmail.com>
Subject: Re: [PATCH] drm/etnaviv: Fix missing mutex_destroy()
To: Sui Jingfeng <sui.jingfeng@linux.dev>
Cc: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 etnaviv@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am So., 25. Aug. 2024 um 14:15 Uhr schrieb Sui Jingfeng
<sui.jingfeng@linux.dev>:
>
> Currently, the calling of mutex_destroy() is ignored on error handling
> code path. It is safe for now, since mutex_destroy() actually does
> nothing in non-debug builds. But the mutex_destroy() is used to mark
> the mutex uninitialized on debug builds, and any subsequent use of the
> mutex is forbidden.
>
> It also could lead to problems if mutex_destroy() gets extended, add
> missing mutex_destroy() to eliminate potential concerns.
>
> Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>

Reviewed-by: Christian Gmeiner <cgmeiner@igalia.com>

> ---
>  drivers/gpu/drm/etnaviv/etnaviv_cmdbuf.c | 3 +++
>  drivers/gpu/drm/etnaviv/etnaviv_drv.c    | 1 +
>  drivers/gpu/drm/etnaviv/etnaviv_gem.c    | 1 +
>  drivers/gpu/drm/etnaviv/etnaviv_gpu.c    | 5 +++++
>  drivers/gpu/drm/etnaviv/etnaviv_mmu.c    | 2 +-
>  5 files changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_cmdbuf.c b/drivers/gpu/drm/etnaviv/etnaviv_cmdbuf.c
> index 721d633aece9..1edc02022be4 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_cmdbuf.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_cmdbuf.c
> @@ -79,6 +79,9 @@ void etnaviv_cmdbuf_suballoc_destroy(struct etnaviv_cmdbuf_suballoc *suballoc)
>  {
>         dma_free_wc(suballoc->dev, SUBALLOC_SIZE, suballoc->vaddr,
>                     suballoc->paddr);
> +
> +       mutex_destroy(&suballoc->lock);
> +
>         kfree(suballoc);
>  }
>
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> index 6500f3999c5f..7844cd961a29 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> @@ -564,6 +564,7 @@ static int etnaviv_bind(struct device *dev)
>  out_destroy_suballoc:
>         etnaviv_cmdbuf_suballoc_destroy(priv->cmdbuf_suballoc);
>  out_free_priv:
> +       mutex_destroy(&priv->gem_lock);
>         kfree(priv);
>  out_put:
>         drm_dev_put(drm);
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> index fe665ca20c02..b68e3b235a7d 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> @@ -515,6 +515,7 @@ void etnaviv_gem_free_object(struct drm_gem_object *obj)
>         etnaviv_obj->ops->release(etnaviv_obj);
>         drm_gem_object_release(obj);
>
> +       mutex_destroy(&etnaviv_obj->lock);
>         kfree(etnaviv_obj);
>  }
>
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> index af52922ff494..d6acc4c68102 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> @@ -1929,8 +1929,13 @@ static int etnaviv_gpu_platform_probe(struct platform_device *pdev)
>
>  static void etnaviv_gpu_platform_remove(struct platform_device *pdev)
>  {
> +       struct etnaviv_gpu *gpu = dev_get_drvdata(&pdev->dev);
> +
>         component_del(&pdev->dev, &gpu_ops);
>         pm_runtime_disable(&pdev->dev);
> +
> +       mutex_destroy(&gpu->lock);
> +       mutex_destroy(&gpu->sched_lock);
>  }
>
>  static int etnaviv_gpu_rpm_suspend(struct device *dev)
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_mmu.c b/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
> index e3be16165c86..ed6c42384856 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
> @@ -361,7 +361,7 @@ static void etnaviv_iommu_context_free(struct kref *kref)
>                 container_of(kref, struct etnaviv_iommu_context, refcount);
>
>         etnaviv_cmdbuf_suballoc_unmap(context, &context->cmdbuf_mapping);
> -
> +       mutex_destroy(&context->lock);
>         context->global->ops->free(context);
>  }
>  void etnaviv_iommu_context_put(struct etnaviv_iommu_context *context)
> --
> 2.34.1
>


-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
