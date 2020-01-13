Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A33138903
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2020 01:07:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB9AB89CF9;
	Mon, 13 Jan 2020 00:07:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x931.google.com (mail-ua1-x931.google.com
 [IPv6:2607:f8b0:4864:20::931])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A62589CE1;
 Mon, 13 Jan 2020 00:07:17 +0000 (UTC)
Received: by mail-ua1-x931.google.com with SMTP id 1so2713199uao.1;
 Sun, 12 Jan 2020 16:07:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ni1dsk4zQuirgan391D3nIBqR+fxZP8zwkgVrPSLMyE=;
 b=MkTqD2zddrvNJVuacif3IaKo9o4ZcuvBHo8hi3lg+TBK+H8BFbjbTvHR9+EAMNdTYJ
 WjjqL6Unue/SF4hnaz93AJmi4hcLnjoCGXEurbCntUrHtgbd6KLRahlKz5NFS58Vx/C4
 ce//VG0uUvtrEkO34VPYlQWRgbBE0t2+1WG4GIcsVLkBeA0fVKZdTIikIsfBolWw2teo
 wcmcU8IejtRZvDXLBoUPh6gl7TnxuBnA8H45mrv0GnHhmwWHAefhmGpTWi7xCex+SkXi
 1JGGZfD1KoXo3SioS0hKePFE56IK4C+MZAvibGIWdAR0Jibvsj68q1K+NVTt600PlGWe
 IIBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ni1dsk4zQuirgan391D3nIBqR+fxZP8zwkgVrPSLMyE=;
 b=L1NYkXcbsfDairr0i1RnRAgoSAg7Q4EJj7nYJVP6yjwW+mHwYESI5+GzXHME4BaoqS
 qoVhCzsqJtbmKtS1tKuAzcvyBEM4zMJpHPvfns1xBniVLBP+WydrK2jEwBva7LWGNHJh
 4h/AFBZUQUPj8lgnjTCOBC+ngF9Bhi7lVqwOYhX4EPU0KykbO048HbSbHyS69sr6FaGw
 FQ6HKzbp1jAnYF3+Tozk+x7pTgREcRjopRa/WC7GUF97Q3eiG0d8iCZZhC9Zx7BB7lAi
 aMdaEgWH6uAyQ2nvwRYxjqX/WNjseYn7kQluKFm7YKRpG46PYhgvHbvag9eV7/KFTJSt
 9b5Q==
X-Gm-Message-State: APjAAAV3fM4wKkbzAbnRjnTPnl+IyxlaJ+yJi/izv1xC2/qfRenNViVN
 2KFFoB0vQzMdki4JIWKd3N0jmUF7+STj3wBdIAvfXzsjIdQ=
X-Google-Smtp-Source: APXvYqyFFBC8dpNMD69+EuEZSci28AmYlHt/twpN4MrbjgbZwGM7Il8XTOOj7wxDtZqsqieKQqHbTh47ZNWd7OBTNy0=
X-Received: by 2002:ab0:14ea:: with SMTP id f39mr5758331uae.40.1578874036638; 
 Sun, 12 Jan 2020 16:07:16 -0800 (PST)
MIME-Version: 1.0
References: <20200110072837.48060-1-yuehaibing@huawei.com>
In-Reply-To: <20200110072837.48060-1-yuehaibing@huawei.com>
From: Ben Skeggs <skeggsb@gmail.com>
Date: Mon, 13 Jan 2020 10:07:05 +1000
Message-ID: <CACAvsv4LQAs_GAavgywod1ksxvKe5JE6FNGMnULbnJACJ280KQ@mail.gmail.com>
Subject: Re: [Nouveau] [PATCH -next] drm/ttm: Remove set but not used variable
 'mem'
To: YueHaibing <yuehaibing@huawei.com>
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
Cc: Dave Airlie <airlied@linux.ie>, ML nouveau <nouveau@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 10 Jan 2020 at 17:32, YueHaibing <yuehaibing@huawei.com> wrote:
>
> drivers/gpu/drm/nouveau/nouveau_ttm.c: In function nouveau_vram_manager_new:
> drivers/gpu/drm/nouveau/nouveau_ttm.c:66:22: warning: variable mem set but not used [-Wunused-but-set-variable]
> drivers/gpu/drm/nouveau/nouveau_ttm.c: In function nouveau_gart_manager_new:
> drivers/gpu/drm/nouveau/nouveau_ttm.c:106:22: warning: variable mem set but not used [-Wunused-but-set-variable]
>
> They are not used any more, so remove it.
Thanks!

>
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_ttm.c | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_ttm.c b/drivers/gpu/drm/nouveau/nouveau_ttm.c
> index 77a0c6a..7ca0a24 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_ttm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_ttm.c
> @@ -63,14 +63,12 @@ nouveau_vram_manager_new(struct ttm_mem_type_manager *man,
>  {
>         struct nouveau_bo *nvbo = nouveau_bo(bo);
>         struct nouveau_drm *drm = nouveau_bdev(bo->bdev);
> -       struct nouveau_mem *mem;
>         int ret;
>
>         if (drm->client.device.info.ram_size == 0)
>                 return -ENOMEM;
>
>         ret = nouveau_mem_new(&drm->master, nvbo->kind, nvbo->comp, reg);
> -       mem = nouveau_mem(reg);
>         if (ret)
>                 return ret;
>
> @@ -103,11 +101,9 @@ nouveau_gart_manager_new(struct ttm_mem_type_manager *man,
>  {
>         struct nouveau_bo *nvbo = nouveau_bo(bo);
>         struct nouveau_drm *drm = nouveau_bdev(bo->bdev);
> -       struct nouveau_mem *mem;
>         int ret;
>
>         ret = nouveau_mem_new(&drm->master, nvbo->kind, nvbo->comp, reg);
> -       mem = nouveau_mem(reg);
>         if (ret)
>                 return ret;
>
> --
> 2.7.4
>
>
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
