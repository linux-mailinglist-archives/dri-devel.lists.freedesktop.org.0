Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 491753B1D92
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jun 2021 17:23:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 652F96E93B;
	Wed, 23 Jun 2021 15:23:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ED2D6E935
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jun 2021 15:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624461819;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KqNfBw+DZy7VZXBvahJMXyxmm59IKQhUiq2dn1235vw=;
 b=al5+qDE98xCfMMjJOInGnGtQG/Jre0q0BjMjH+tHe1KQOOnoinpuHXdsDj7FR/N7MOkyNg
 +GBDV1Ve5dxbXhv4wvoZZ5tbPnItUFmvNiFxzEDHFlezcjFCRmZ/ydxSUjDTrs1Rup70gB
 FrAw49aPIt/ocgz9LR8xDJ6xnjRxCjA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-109-rdIxGbVbPJeYmYmTQLsSsQ-1; Wed, 23 Jun 2021 11:23:37 -0400
X-MC-Unique: rdIxGbVbPJeYmYmTQLsSsQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 t10-20020a5d49ca0000b029011a61d5c96bso1188563wrs.11
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jun 2021 08:23:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KqNfBw+DZy7VZXBvahJMXyxmm59IKQhUiq2dn1235vw=;
 b=ESe36jOU97NOVlP3R3s0XZ6HxayLa/Xm4PijBWano/m3VZ9q9j8/G9hVsYwkwnpZK9
 8DTD73INqDqJqlavXMvex2c7QgWa1Xj6nlnifwrdP9GWgECNWlj6IXFi1tiRYbz6NBEV
 JtarXRKgeFUC9w1AOnPb9BcJfFVNANH60MXEoo3vUtmmBWDYufH3CmerIGfwZC8ImJtJ
 IzcTYxy7tF0LeatxbtM3BRpN0SHa2PwElGIiAWoGWHCjX3xVynC5TMLP1/mkqcf1WgpS
 o32sLEDKWp4oSL1jnd7LLw9/YkwbNEbb5q/7su6FbyZLsfILxVncq8Ltxl393AOOwBv0
 6PnA==
X-Gm-Message-State: AOAM530PURJoSrSPUS5GUY6Wmoqmb5WdF+XD14brYzSEhU4wKiso/vHy
 3KB74KGSy4odTWDe5YbGJCB21B9dtko95F32jboI7iXnwFn1SuPvQeeobJP8nPA11nmnmu4Eu8h
 O8ing3qfx5xuguy0c3XhhWrQnRRxv63Vr1KY0Bsd13O/y
X-Received: by 2002:a05:600c:2907:: with SMTP id
 i7mr4087030wmd.139.1624461816649; 
 Wed, 23 Jun 2021 08:23:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzkwprwBs+4+m2cINYxKCit9IeKr9Iv1V9yb/mYUuehMDtRmPDtVVvRYTjDw7TLfVWQ+DO40JMT0djrFoge9kc=
X-Received: by 2002:a05:600c:2907:: with SMTP id
 i7mr4087017wmd.139.1624461816527; 
 Wed, 23 Jun 2021 08:23:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210622125803.640-1-caihuoqing@baidu.com>
In-Reply-To: <20210622125803.640-1-caihuoqing@baidu.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Wed, 23 Jun 2021 17:23:25 +0200
Message-ID: <CACO55ttH-BbGzT+2ZXPiONdmtv5s-4qCCLWAx+sxQ9kyJoKtfQ@mail.gmail.com>
Subject: Re: [PATCH] remove unused varialble "struct device *dev"
To: Cai Huoqing <caihuoqing@baidu.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: David Airlie <airlied@linux.ie>, nouveau <nouveau@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 22, 2021 at 5:14 PM Cai Huoqing <caihuoqing@baidu.com> wrote:
>
> fix the warning- variable 'dev' set but not used
>

the patch title needs a prefix to indicate which subsystem it belongs
to. Check git log for examples.

With that fixed: Reviewed-by: Karol Herbst <kherbst@redhat.com>

> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_bo.c | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
> index 984721b..cb3ff4a 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> @@ -1242,7 +1242,6 @@ vm_fault_t nouveau_ttm_fault_reserve_notify(struct ttm_buffer_object *bo)
>  {
>         struct ttm_tt *ttm_dma = (void *)ttm;
>         struct nouveau_drm *drm;
> -       struct device *dev;
>         bool slave = !!(ttm->page_flags & TTM_PAGE_FLAG_SG);
>
>         if (ttm_tt_is_populated(ttm))
> @@ -1255,7 +1254,6 @@ vm_fault_t nouveau_ttm_fault_reserve_notify(struct ttm_buffer_object *bo)
>         }
>
>         drm = nouveau_bdev(bdev);
> -       dev = drm->dev->dev;
>
>         return ttm_pool_alloc(&drm->ttm.bdev.pool, ttm, ctx);
>  }
> @@ -1265,14 +1263,12 @@ vm_fault_t nouveau_ttm_fault_reserve_notify(struct ttm_buffer_object *bo)
>                           struct ttm_tt *ttm)
>  {
>         struct nouveau_drm *drm;
> -       struct device *dev;
>         bool slave = !!(ttm->page_flags & TTM_PAGE_FLAG_SG);
>
>         if (slave)
>                 return;
>
>         drm = nouveau_bdev(bdev);
> -       dev = drm->dev->dev;
>
>         return ttm_pool_free(&drm->ttm.bdev.pool, ttm);
>  }
> --
> 1.8.3.1
>

