Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D3E15121C
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2020 22:53:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB2126ED0C;
	Mon,  3 Feb 2020 21:53:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62E9D6ED0C;
 Mon,  3 Feb 2020 21:53:36 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id k11so20260568wrd.9;
 Mon, 03 Feb 2020 13:53:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vQXhOgn8dO7XWOvgMGSGEET/LsiSZKIE56eNIssbDJY=;
 b=arM5IEtbhIS1LEB0VzSGyzhfs65OgzjxyKbp6DAj0wraRJ+Fg1kAb7MyOKfSN+sfmc
 cBA966nTjy7lWZw+X5BJEqM5sH7kFgNdsvW9NKJPvZfHX14OTXHTJLA/8wBH/kYPSoC7
 1VooMuTjTVMcKis59mp7eaSJ21dCMqF2T8QLQLwQdkEvXJ+bD1dxZOM8kFlvvMSWgOkA
 dE7mjPxH0SdZIcgKZs3Zn7woYRoVnTPia+NmU21Y8D/SAmmAyqUEw0mUY5nGxE1wJubM
 R40rtMepQIGKiCaRCzqDmvVnEXhKMtQYDS3VZVMe+Z8QPEBzFn7iosZgT8ZaNaSYKRjr
 2lwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vQXhOgn8dO7XWOvgMGSGEET/LsiSZKIE56eNIssbDJY=;
 b=ibR4REzLfNeMi7MrE756D5RR4sHgR1lJZldwsH7r9HvM9o0/lqPPe1hnF0GHbQIoxd
 z7bcRmc6lTPaQr/6rYiy3LIX2RwXDWvzcNG/MiqqUQ8CE2iEtzLYJiJvNYV7/RU+EJ9F
 fbtkyQ8Um5r445H8bRZGm/rbcXEZweN2me8N0Fv/H3RODV48+Tfthh0DhCXuRYHllhbP
 cRpUKHeiMUrbZ3oHJ0/FU0V7sUdjfjskiZONAEwesGWD93BzzeJoScY1/TzfYVvP+juR
 WuWcy5dTs1Wb037wn01WfVQzqCqi66JV4MH/6UKyZS5DL2AsJGKWaZPJTWlqgXEqqy2v
 1mqg==
X-Gm-Message-State: APjAAAX6+0FsyMtXQRAvX5tAf51Ipedf3x6VffBQMwV3M6vI5uVznPm4
 aIYlFOcvxBYiw0Ue6KYxxhDPOi+bYvfft98wbvnM/4UF
X-Google-Smtp-Source: APXvYqwAsRox/ppdDkBprl0jeHw7p1mGU1+eyR9Pirv5vlxoFaX9mk0wHWa5Mms1WwZ2jiQpHEAEteBmqM9H0VdUtTA=
X-Received: by 2002:a5d:51c8:: with SMTP id n8mr15338407wrv.111.1580766815073; 
 Mon, 03 Feb 2020 13:53:35 -0800 (PST)
MIME-Version: 1.0
References: <20200202171635.4039044-1-chris@chris-wilson.co.uk>
 <20200202171635.4039044-3-chris@chris-wilson.co.uk>
In-Reply-To: <20200202171635.4039044-3-chris@chris-wilson.co.uk>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 3 Feb 2020 16:53:23 -0500
Message-ID: <CADnq5_OCHhLfyzciHuN06wCk=to77rZqzFcffpqEZkX0KPYOog@mail.gmail.com>
Subject: Re: [PATCH 3/5] drm/r128: Wean off drm_pci_alloc
To: Chris Wilson <chris@chris-wilson.co.uk>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Feb 2, 2020 at 12:16 PM Chris Wilson <chris@chris-wilson.co.uk> wrote:
>
> drm_pci_alloc is a thin wrapper over dma_coherent_alloc. Ditch the
> wrapper and just use the dma routines directly.
>
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> ---
>  drivers/gpu/drm/r128/ati_pcigart.c | 32 +++++++++++++++---------------
>  drivers/gpu/drm/r128/ati_pcigart.h |  2 +-
>  2 files changed, 17 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/gpu/drm/r128/ati_pcigart.c b/drivers/gpu/drm/r128/ati_pcigart.c
> index 9b4072f97215..3d67afbbf0fc 100644
> --- a/drivers/gpu/drm/r128/ati_pcigart.c
> +++ b/drivers/gpu/drm/r128/ati_pcigart.c
> @@ -44,9 +44,12 @@
>  static int drm_ati_alloc_pcigart_table(struct drm_device *dev,
>                                        struct drm_ati_pcigart_info *gart_info)
>  {
> -       gart_info->table_handle = drm_pci_alloc(dev, gart_info->table_size,
> -                                               PAGE_SIZE);
> -       if (gart_info->table_handle == NULL)
> +       gart_info->addr =
> +               dma_alloc_coherent(&dev->pdev->dev,
> +                                 gart_info->table_size,
> +                                 ^gart_info->bus_addr,

Stray ^ here.  With that fixed:
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

> +                                 GFP_KERNEL);
> +       if (!gart_info->addr)
>                 return -ENOMEM;
>
>         return 0;
> @@ -55,8 +58,10 @@ static int drm_ati_alloc_pcigart_table(struct drm_device *dev,
>  static void drm_ati_free_pcigart_table(struct drm_device *dev,
>                                        struct drm_ati_pcigart_info *gart_info)
>  {
> -       drm_pci_free(dev, gart_info->table_handle);
> -       gart_info->table_handle = NULL;
> +       dma_free_coherent(&dev->pdev->dev,
> +                         gart_info->table_size,
> +                         gart_info->addr,
> +                         gart_info->bus_addr);
>  }
>
>  int drm_ati_pcigart_cleanup(struct drm_device *dev, struct drm_ati_pcigart_info *gart_info)
> @@ -89,8 +94,7 @@ int drm_ati_pcigart_cleanup(struct drm_device *dev, struct drm_ati_pcigart_info
>                         gart_info->bus_addr = 0;
>         }
>
> -       if (gart_info->gart_table_location == DRM_ATI_GART_MAIN &&
> -           gart_info->table_handle) {
> +       if (gart_info->gart_table_location == DRM_ATI_GART_MAIN)
>                 drm_ati_free_pcigart_table(dev, gart_info);
>         }
>
> @@ -103,7 +107,7 @@ int drm_ati_pcigart_init(struct drm_device *dev, struct drm_ati_pcigart_info *ga
>         struct drm_sg_mem *entry = dev->sg;
>         void *address = NULL;
>         unsigned long pages;
> -       u32 *pci_gart = NULL, page_base, gart_idx;
> +       u32 *page_base, gart_idx;
>         dma_addr_t bus_address = 0;
>         int i, j, ret = -ENOMEM;
>         int max_ati_pages, max_real_pages;
> @@ -128,18 +132,14 @@ int drm_ati_pcigart_init(struct drm_device *dev, struct drm_ati_pcigart_info *ga
>                         DRM_ERROR("cannot allocate PCI GART page!\n");
>                         goto done;
>                 }
> -
> -               pci_gart = gart_info->table_handle->vaddr;
> -               address = gart_info->table_handle->vaddr;
> -               bus_address = gart_info->table_handle->busaddr;
>         } else {
> -               address = gart_info->addr;
> -               bus_address = gart_info->bus_addr;
>                 DRM_DEBUG("PCI: Gart Table: VRAM %08LX mapped at %08lX\n",
>                           (unsigned long long)bus_address,
>                           (unsigned long)address);
>         }
>
> +       address = gart_info->addr;
> +       bus_address = gart_info->bus_addr;
>
>         max_ati_pages = (gart_info->table_size / sizeof(u32));
>         max_real_pages = max_ati_pages / (PAGE_SIZE / ATI_PCIGART_PAGE_SIZE);
> @@ -147,7 +147,7 @@ int drm_ati_pcigart_init(struct drm_device *dev, struct drm_ati_pcigart_info *ga
>             ? entry->pages : max_real_pages;
>
>         if (gart_info->gart_table_location == DRM_ATI_GART_MAIN) {
> -               memset(pci_gart, 0, max_ati_pages * sizeof(u32));
> +               memset(address, 0, max_ati_pages * sizeof(u32));
>         } else {
>                 memset_io((void __iomem *)map->handle, 0, max_ati_pages * sizeof(u32));
>         }
> @@ -185,7 +185,7 @@ int drm_ati_pcigart_init(struct drm_device *dev, struct drm_ati_pcigart_info *ga
>                         }
>                         if (gart_info->gart_table_location ==
>                             DRM_ATI_GART_MAIN) {
> -                               pci_gart[gart_idx] = cpu_to_le32(val);
> +                               address[gart_idx] = cpu_to_le32(val);
>                         } else {
>                                 offset = gart_idx * sizeof(u32);
>                                 writel(val, (void __iomem *)map->handle + offset);
> diff --git a/drivers/gpu/drm/r128/ati_pcigart.h b/drivers/gpu/drm/r128/ati_pcigart.h
> index a728a1364e66..6219aced7e84 100644
> --- a/drivers/gpu/drm/r128/ati_pcigart.h
> +++ b/drivers/gpu/drm/r128/ati_pcigart.h
> @@ -18,7 +18,7 @@ struct drm_ati_pcigart_info {
>         void *addr;
>         dma_addr_t bus_addr;
>         dma_addr_t table_mask;
> -       struct drm_dma_handle *table_handle;
> +       dma_addr_t dma_addr;
>         struct drm_local_map mapping;
>         int table_size;
>  };
> --
> 2.25.0
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
