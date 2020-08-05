Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 474CD23C521
	for <lists+dri-devel@lfdr.de>; Wed,  5 Aug 2020 07:32:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9571E89D4D;
	Wed,  5 Aug 2020 05:32:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com
 [IPv6:2607:f8b0:4864:20::b41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEEB889D4D
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Aug 2020 05:32:39 +0000 (UTC)
Received: by mail-yb1-xb41.google.com with SMTP id x2so3009755ybf.12
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Aug 2020 22:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/mlHyzju4hGivhSRJIwgLM+Tiq763UFg/w4d+foQp+4=;
 b=lLIUQ4Js2MkNzkw0pYO8TwA9bOJZGGnQbBBad0foIlswUrQjsIqIDrZoH0axxV8YnT
 xBJEPpMX54d1r0hw3BH1FduwvIa3X+XRt2ow0vZqJxFEbQkWveXiku/JB93sHCcsQadc
 kdJWXRDt753fXvC3dVS3Ow2C2Pha13x7ZtAB3Fqziro0XwTPqr4Of5XKMinHNxGKCVjj
 GZO4fzsD+pv73LulLRGSUvVtzJjiD4AA+IpdBPs88/8uMuGYh6vXpWCU9Pg/ViCqzXjI
 EPYG1rDr5iFLxwE2PrYZ465gh5H3oUz7uxyp97OWnQsEaRuC/5VVYKtaPPVMVk5OkPk/
 ojXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/mlHyzju4hGivhSRJIwgLM+Tiq763UFg/w4d+foQp+4=;
 b=fBsx0U1a8hZ7X96flciuU+IZoIPw6oQPQmJ36yqh0NzNIlXRPku/sL/FAEkjCQ0ozo
 M9DYcw5C/fDTtXOh61O9Op1lppLNigAsbDGaBgLr1U4at4fIszHKi1KSoXZcFs4PU0Nd
 xhmhHByZsv6N/h+zPUHcftB2ofvLpTLOuIpCkEqANnJCQXGnAq3JO/v9eo3to16tHXzC
 LFuw4qmuQOJcUWEOYvZSK4+Y/g1DFinzJYiSSMkQoGr4+fPC6PEsDXYxBAlS/lIt7xau
 7rZbvcAr4nf7jJHSfbl5QFrEq8XcuozgLVQqUR3i8RZ8SuF3hNBrlycRauVw+1O3TOY4
 aYlw==
X-Gm-Message-State: AOAM5324CW3o+Gs1GcwjJUgBk/ZV/7/hAuBWt99KG1Yl58wQ2QKPYeaL
 XJEX4Z2o9PdpVObVfQZExuUbD5HnAF3msdSbHfg=
X-Google-Smtp-Source: ABdhPJxlYOLFUMwaqtJQtBODigZnPocYJUMxXXuuoMRsMDE7ee1pGhpjIt3iK72wLdqK//TjubuZdJlZXUm0Qy7xyDM=
X-Received: by 2002:a25:3803:: with SMTP id f3mr2228874yba.470.1596605558937; 
 Tue, 04 Aug 2020 22:32:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200804025632.3868079-1-airlied@gmail.com>
 <20200804025632.3868079-4-airlied@gmail.com>
In-Reply-To: <20200804025632.3868079-4-airlied@gmail.com>
From: Ben Skeggs <skeggsb@gmail.com>
Date: Wed, 5 Aug 2020 15:32:27 +1000
Message-ID: <CACAvsv6J0DZDapHmYDYGjGU9z7BcBDk0omE55mmP8ksYiGnadw@mail.gmail.com>
Subject: Re: [PATCH 03/59] nouveau: use ttm populate mapping functions. (v2)
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
> Instead of rolling driver copies of them.
>
> v2: cleanup return handling (Ben)
> Signed-off-by: Dave Airlie <airlied@redhat.com>
Reviewed-by: Ben Skeggs <bskeggs@redhat.com>

> ---
>  drivers/gpu/drm/nouveau/nouveau_bo.c | 38 ++--------------------------
>  1 file changed, 2 insertions(+), 36 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
> index 356c1aae327d..aebec45b8416 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> @@ -1171,8 +1171,6 @@ nouveau_ttm_tt_populate(struct ttm_tt *ttm, struct ttm_operation_ctx *ctx)
>         struct ttm_dma_tt *ttm_dma = (void *)ttm;
>         struct nouveau_drm *drm;
>         struct device *dev;
> -       unsigned i;
> -       int r;
>         bool slave = !!(ttm->page_flags & TTM_PAGE_FLAG_SG);
>
>         if (ttm->state != tt_unpopulated)
> @@ -1200,31 +1198,7 @@ nouveau_ttm_tt_populate(struct ttm_tt *ttm, struct ttm_operation_ctx *ctx)
>                 return ttm_dma_populate((void *)ttm, dev, ctx);
>         }
>  #endif
> -
> -       r = ttm_pool_populate(ttm, ctx);
> -       if (r) {
> -               return r;
> -       }
> -
> -       for (i = 0; i < ttm->num_pages; i++) {
> -               dma_addr_t addr;
> -
> -               addr = dma_map_page(dev, ttm->pages[i], 0, PAGE_SIZE,
> -                                   DMA_BIDIRECTIONAL);
> -
> -               if (dma_mapping_error(dev, addr)) {
> -                       while (i--) {
> -                               dma_unmap_page(dev, ttm_dma->dma_address[i],
> -                                              PAGE_SIZE, DMA_BIDIRECTIONAL);
> -                               ttm_dma->dma_address[i] = 0;
> -                       }
> -                       ttm_pool_unpopulate(ttm);
> -                       return -EFAULT;
> -               }
> -
> -               ttm_dma->dma_address[i] = addr;
> -       }
> -       return 0;
> +       return ttm_populate_and_map_pages(dev, ttm_dma, ctx);
>  }
>
>  static void
> @@ -1233,7 +1207,6 @@ nouveau_ttm_tt_unpopulate(struct ttm_tt *ttm)
>         struct ttm_dma_tt *ttm_dma = (void *)ttm;
>         struct nouveau_drm *drm;
>         struct device *dev;
> -       unsigned i;
>         bool slave = !!(ttm->page_flags & TTM_PAGE_FLAG_SG);
>
>         if (slave)
> @@ -1256,14 +1229,7 @@ nouveau_ttm_tt_unpopulate(struct ttm_tt *ttm)
>         }
>  #endif
>
> -       for (i = 0; i < ttm->num_pages; i++) {
> -               if (ttm_dma->dma_address[i]) {
> -                       dma_unmap_page(dev, ttm_dma->dma_address[i], PAGE_SIZE,
> -                                      DMA_BIDIRECTIONAL);
> -               }
> -       }
> -
> -       ttm_pool_unpopulate(ttm);
> +       ttm_unmap_and_unpopulate_pages(dev, ttm_dma);
>  }
>
>  void
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
