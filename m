Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDFB8975986
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2024 19:36:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EF9E10E9B6;
	Wed, 11 Sep 2024 17:35:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XrHc1PSM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6991210E0A2;
 Wed, 11 Sep 2024 17:35:57 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id
 98e67ed59e1d1-2da4e84c198so55889a91.0; 
 Wed, 11 Sep 2024 10:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726076157; x=1726680957; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=J+zugMFoquGTXa/VfqrdIPbdRGro0VHIjtqIBxGTLnU=;
 b=XrHc1PSM1hWTFiu9U1q3J6O8biKf4Iknj0DiLknDJP9E4tkSYNlrT/rg9v7JjsdS2y
 EaK6CZ1z2MwB+3tJPrPcCmfieI7+BQEs9vN2v2qLvRbJy8aPCs7Zho4uSZf2Cw/Q5RyH
 xJh0t3scEFq4Yu1cca1juHLq2k+4LoVBY+Oy9ELttLhN1/zCSEzKefy6EWJvCoPaXs9G
 NZoVbGzQ8+1jteVqLDd0PEFezjlRBne454U4HpcPSCZogsydktCz4uxsPXbowdrxff0U
 RfWLqq7CVC6vIjPuIg848iqJOcY3UA+SYurrLgsPPhq28Y79oSE1ueecj1wVzkcQiDs8
 HRSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726076157; x=1726680957;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=J+zugMFoquGTXa/VfqrdIPbdRGro0VHIjtqIBxGTLnU=;
 b=ZmOe7OTlAUm/tnoIaicMDBotDdpOpqr70hbyauT96TVWjYkNsrqABSY//Ojxc+Wp1E
 z3jHiGrxWjC9foQIWoVbq6D1cXhEtXe+cdEZF6KAAB3SfHOWJnP5z2vicKv1P4ei0pn1
 uYkimknRPPRrt+v8XvHAvMSz7PFuaUst+r0Mu1ge4Ip0VAzjJbVc3ShZfB5ZaB2EAEHY
 dsGyhkxnyD8V+CK0DhMoui+YyOMbRjoTDS2OhpVNyVrsZhgmc1+wlPeF0QhPi3wTZz6o
 OXBCTPqSoLnou+OBGCG/jVewIN4zGrj5N1x01Unij0qeGXBKERZOmWiwhCINnHZA8A9M
 Tu5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOzfiojDLmOI+HOb1PprDQt+4tvlvB1oY6rsTt0CpTgXGd23Z8iysXjB2rJfZ0dyk0TQCMVwhARTY=@lists.freedesktop.org,
 AJvYcCXkh2k9DXQOYCRUdXzwoErT0TMy3z3T6WBqLjRpYWfM4lJMRF1kKE1pgbJPvWzImwm8RSOhOt1b3w==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyEZxLIj8TVCGiyseMcluvmMRLmqbIPf9f2NTCtQUCggVNSx5Fl
 wj+k7/EWQRfg5OEq5KqRr2PSa8HoFWmrpHBN9ADCJcn6AAByfbMUpOBVt/qdulqTduNKFULgN9J
 1IuJj8D++GbDafUazkl7K8yqlN8U=
X-Google-Smtp-Source: AGHT+IGmCpPj+I32nVJBJWnsPgRGIwZW08YCd5TauOT9KzvM3pY9ncXxsjRUyjSchdeuMp3HLi2SRenTt9L9UoAjmUg=
X-Received: by 2002:a17:90b:3696:b0:2d3:dca0:89b7 with SMTP id
 98e67ed59e1d1-2daffa3a9d4mr15698133a91.3.1726076156520; Wed, 11 Sep 2024
 10:35:56 -0700 (PDT)
MIME-Version: 1.0
References: <20240903020857.3250038-1-xiaolei.wang@windriver.com>
In-Reply-To: <20240903020857.3250038-1-xiaolei.wang@windriver.com>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Wed, 11 Sep 2024 19:35:44 +0200
Message-ID: <CAH9NwWczgAmgRbHiKD1614Yc1fAXRYV2ZDUeuEunPDUcRmPwgA@mail.gmail.com>
Subject: Re: [PATCH v3] drm/etnaviv: Request pages from DMA32 zone on
 addressing_limited
To: Xiaolei Wang <xiaolei.wang@windriver.com>
Cc: sui.jingfeng@linux.dev, l.stach@pengutronix.de, 
 linux+etnaviv@armlinux.org.uk, airlied@gmail.com, daniel@ffwll.ch, 
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

Am Di., 3. Sept. 2024 um 04:09 Uhr schrieb Xiaolei Wang
<xiaolei.wang@windriver.com>:
>
> Remove __GFP_HIGHMEM when requesting a page from DMA32 zone,
> and since all vivante GPUs in the system will share the same
> DMA constraints, move the check of whether to get a page from
> DMA32 to etnaviv_bind().
>
> Fixes: b72af445cd38 ("drm/etnaviv: request pages from DMA32 zone when needed")
> Suggested-by: Sui Jingfeng <sui.jingfeng@linux.dev>
> Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>

Reviewed-by: Christian Gmeiner <cgmeiner@igalia.com>

> ---
>
> change log
>
> v1:
>   https://patchwork.kernel.org/project/dri-devel/patch/20240806104733.2018783-1-xiaolei.wang@windriver.com/
>
> v2:
>   Modify the issue of not retaining GFP_USER in v1 and update the commit log.
>
> v3:
>   Use "priv->shm_gfp_mask = GFP_USER | __GFP_RETRY_MAYFAIL | __GFP_NOWARN;"
> instead of
>   "priv->shm_gfp_mask = GFP_HIGHUSER | __GFP_RETRY_MAYFAIL | __GFP_NOWARN;"
> and move the check of whether to get a page from DMA32 to etnaviv_bind().
>
>  drivers/gpu/drm/etnaviv/etnaviv_drv.c | 10 +++++++++-
>  drivers/gpu/drm/etnaviv/etnaviv_gpu.c |  8 --------
>  2 files changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> index 6500f3999c5f..8cb2c3ec8e5d 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> @@ -536,7 +536,15 @@ static int etnaviv_bind(struct device *dev)
>         mutex_init(&priv->gem_lock);
>         INIT_LIST_HEAD(&priv->gem_list);
>         priv->num_gpus = 0;
> -       priv->shm_gfp_mask = GFP_HIGHUSER | __GFP_RETRY_MAYFAIL | __GFP_NOWARN;
> +       priv->shm_gfp_mask = GFP_USER | __GFP_RETRY_MAYFAIL | __GFP_NOWARN;
> +
> +       /*
> +        * If the GPU is part of a system with DMA addressing limitations,
> +        * request pages for our SHM backend buffers from the DMA32 zone to
> +        * hopefully avoid performance killing SWIOTLB bounce buffering.
> +        */
> +       if (dma_addressing_limited(dev))
> +               priv->shm_gfp_mask |= GFP_DMA32;
>
>         priv->cmdbuf_suballoc = etnaviv_cmdbuf_suballoc_new(drm->dev);
>         if (IS_ERR(priv->cmdbuf_suballoc)) {
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> index 7c7f97793ddd..5e753dd42f72 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> @@ -839,14 +839,6 @@ int etnaviv_gpu_init(struct etnaviv_gpu *gpu)
>         if (ret)
>                 goto fail;
>
> -       /*
> -        * If the GPU is part of a system with DMA addressing limitations,
> -        * request pages for our SHM backend buffers from the DMA32 zone to
> -        * hopefully avoid performance killing SWIOTLB bounce buffering.
> -        */
> -       if (dma_addressing_limited(gpu->dev))
> -               priv->shm_gfp_mask |= GFP_DMA32;
> -
>         /* Create buffer: */
>         ret = etnaviv_cmdbuf_init(priv->cmdbuf_suballoc, &gpu->buffer,
>                                   PAGE_SIZE);
> --
> 2.25.1
>


-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
