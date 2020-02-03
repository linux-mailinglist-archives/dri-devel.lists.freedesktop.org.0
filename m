Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC593151221
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2020 22:55:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49DC36E442;
	Mon,  3 Feb 2020 21:55:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08A106E442;
 Mon,  3 Feb 2020 21:55:42 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id t14so1091070wmi.5;
 Mon, 03 Feb 2020 13:55:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4E9f8I92yihbsVSUNCE3Lky+EwbjWrJog3x386ioidA=;
 b=htmI1Sn4Y90VBTnpntgey0V40GRD848NbEOt/BWw3gcyg7lxlFx7ORWnt+E0CZVcp6
 YfhQuQKYWIloySoBdoeAkb2p6AlC1mp6U/2T6N6Wv7x+1BUrxHqQm9bYBwY7pabo6WwH
 QijQXbGMZexxJUzYRD2zb3V2MZ5FoV4WuqTG21I9rHGKbzHwipBCoELzedrRH/s238v6
 xIkqE/3cltxwLsH9EfzEm4HB8RI3riAaHP2knoZIbHYlTVDuMQUS3y6cNRFZI3SwRonK
 R+pePgw4R9AsD8AhxPwR8M2g3+b/oMJMETFM7HZOUcdl6R8pVRhcLE2vIS5xh0iN8UyT
 Wd7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4E9f8I92yihbsVSUNCE3Lky+EwbjWrJog3x386ioidA=;
 b=j6RVviYqByO37/2R8Dbb56vUQXThUNqAgMWZ2Xb7/cGLG3D99d2XSAV9rEtueLY/c/
 dpdpBTfNvfcKWKS8nnmk5R1GnEU9JGMMIavZsawkSJCFv5gl2Pxuf/Y2jCVDKCJsutXZ
 2PbAQ9o9Am+1LXj8NkGqqulK5HLIRICxCwaITnU6kROHJxhDjTmTX9XCd5DYv7rXPBqh
 f4vatIII/TvU0VEBH4ADJmEIvDbT0BlToblARut9Ghq1PzPmHMIRIT3Z2EA/j9TIEAqJ
 S1kls+/7C9kVnDyaObV2Kk8tl3OZqq3MI3mjlT5KDjAEJA8cZ94YlBQxYmbT88ejd3H4
 y7jw==
X-Gm-Message-State: APjAAAUeNlu8Ni1EzSuO3rj5dCQL8OCx8CIpWM0Oq/8Bzg5upIlkYorW
 abUwz2O7f36sxjyB214tZ/AC5SWrXecGaiGW8vs6fw==
X-Google-Smtp-Source: APXvYqxLecNJtcnO6PQ/IxBzsglq8GeN67l5tKNINreFSX4AW+Al4sM3NKU9oHVyci1bkMJN05TsmdGl3Ocw0h+4xao=
X-Received: by 2002:a1c:9a56:: with SMTP id c83mr1097788wme.79.1580766940693; 
 Mon, 03 Feb 2020 13:55:40 -0800 (PST)
MIME-Version: 1.0
References: <20200202171635.4039044-1-chris@chris-wilson.co.uk>
 <20200202171635.4039044-5-chris@chris-wilson.co.uk>
In-Reply-To: <20200202171635.4039044-5-chris@chris-wilson.co.uk>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 3 Feb 2020 16:55:29 -0500
Message-ID: <CADnq5_PEa8UrXOCokq3CQn2QDqA=zm3XHkKNp6tbvCe9Tm__ng@mail.gmail.com>
Subject: Re: [PATCH 5/5] drm: Remove exports for drm_pci_alloc/drm_pci_free
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
> The drm_pci_alloc routines have been a thin wrapper around the core dma
> coherent routines. Remove the crutch of a wrapper and the exported
> symbols, marking it for only internal legacy use.
>
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>


> ---
>  drivers/gpu/drm/drm_bufs.c   |  5 +++--
>  drivers/gpu/drm/drm_legacy.h | 23 +++++++++++++++++++++++
>  drivers/gpu/drm/drm_pci.c    | 31 ++++++-------------------------
>  include/drm/drm_pci.h        | 18 ------------------
>  4 files changed, 32 insertions(+), 45 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_bufs.c b/drivers/gpu/drm/drm_bufs.c
> index 19297e58b232..a33df3744f76 100644
> --- a/drivers/gpu/drm/drm_bufs.c
> +++ b/drivers/gpu/drm/drm_bufs.c
> @@ -675,7 +675,7 @@ static void drm_cleanup_buf_error(struct drm_device *dev,
>         if (entry->seg_count) {
>                 for (i = 0; i < entry->seg_count; i++) {
>                         if (entry->seglist[i]) {
> -                               drm_pci_free(dev, entry->seglist[i]);
> +                               drm_legacy_pci_free(dev, entry->seglist[i]);
>                         }
>                 }
>                 kfree(entry->seglist);
> @@ -975,7 +975,8 @@ int drm_legacy_addbufs_pci(struct drm_device *dev,
>
>         while (entry->buf_count < count) {
>
> -               dmah = drm_pci_alloc(dev, PAGE_SIZE << page_order, 0x1000);
> +               dmah = drm_legacy_pci_alloc(dev,
> +                                           PAGE_SIZE << page_order, 0x1000);
>
>                 if (!dmah) {
>                         /* Set count correctly so we free the proper amount. */
> diff --git a/drivers/gpu/drm/drm_legacy.h b/drivers/gpu/drm/drm_legacy.h
> index 1be3ea320474..3853b45341c7 100644
> --- a/drivers/gpu/drm/drm_legacy.h
> +++ b/drivers/gpu/drm/drm_legacy.h
> @@ -36,6 +36,7 @@
>
>  struct agp_memory;
>  struct drm_device;
> +struct drm_dma_handle;
>  struct drm_file;
>  struct drm_buf_desc;
>
> @@ -211,4 +212,26 @@ void drm_master_legacy_init(struct drm_master *master);
>  static inline void drm_master_legacy_init(struct drm_master *master) {}
>  #endif
>
> +
> +#if IS_ENABLED(CONFIG_DRM_LEGACY) && IS_ENABLED(CONFIG_PCI)
> +
> +struct drm_dma_handle *
> +drm_legacy_pci_alloc(struct drm_device *dev, size_t size, size_t align);
> +void drm_legacy_pci_free(struct drm_device *dev, struct drm_dma_handle * dmah);
> +
> +#else
> +
> +static inline struct drm_dma_handle *
> +drm_legacy_pci_alloc(struct drm_device *dev, size_t size, size_t align)
> +{
> +       return NULL;
> +}
> +
> +static inline void drm_legacy_pci_free(struct drm_device *dev,
> +                                      struct drm_dma_handle *dmah)
> +{
> +}
> +
> +#endif
> +
>  #endif /* __DRM_LEGACY_H__ */
> diff --git a/drivers/gpu/drm/drm_pci.c b/drivers/gpu/drm/drm_pci.c
> index c6bb98729a26..12239498538c 100644
> --- a/drivers/gpu/drm/drm_pci.c
> +++ b/drivers/gpu/drm/drm_pci.c
> @@ -36,19 +36,10 @@
>  #include "drm_internal.h"
>  #include "drm_legacy.h"
>
> -/**
> - * drm_pci_alloc - Allocate a PCI consistent memory block, for DMA.
> - * @dev: DRM device
> - * @size: size of block to allocate
> - * @align: alignment of block
> - *
> - * FIXME: This is a needless abstraction of the Linux dma-api and should be
> - * removed.
> - *
> - * Return: A handle to the allocated memory block on success or NULL on
> - * failure.
> - */
> -drm_dma_handle_t *drm_pci_alloc(struct drm_device * dev, size_t size, size_t align)
> +#if IS_ENABLED(CONFIG_DRM_LEGACY) && IS_ENABLED(CONFIG_PCI)
> +
> +drm_dma_handle_t *
> +drm_legacy_pci_alloc(struct drm_device * dev, size_t size, size_t align)
>  {
>         drm_dma_handle_t *dmah;
>
> @@ -76,24 +67,14 @@ drm_dma_handle_t *drm_pci_alloc(struct drm_device * dev, size_t size, size_t ali
>         return dmah;
>  }
>
> -EXPORT_SYMBOL(drm_pci_alloc);
> -
> -/**
> - * drm_pci_free - Free a PCI consistent memory block
> - * @dev: DRM device
> - * @dmah: handle to memory block
> - *
> - * FIXME: This is a needless abstraction of the Linux dma-api and should be
> - * removed.
> - */
> -void drm_pci_free(struct drm_device * dev, drm_dma_handle_t * dmah)
> +void drm_legacy_pci_free(struct drm_device * dev, drm_dma_handle_t * dmah)
>  {
>         dma_free_coherent(&dev->pdev->dev, dmah->size, dmah->vaddr,
>                           dmah->busaddr);
>         kfree(dmah);
>  }
>
> -EXPORT_SYMBOL(drm_pci_free);
> +#endif
>
>  static int drm_get_pci_domain(struct drm_device *dev)
>  {
> diff --git a/include/drm/drm_pci.h b/include/drm/drm_pci.h
> index 9031e217b506..cade5b60b643 100644
> --- a/include/drm/drm_pci.h
> +++ b/include/drm/drm_pci.h
> @@ -34,34 +34,16 @@
>
>  #include <linux/pci.h>
>
> -struct drm_dma_handle;
> -struct drm_device;
>  struct drm_driver;
> -struct drm_master;
>
>  #ifdef CONFIG_PCI
>
> -struct drm_dma_handle *drm_pci_alloc(struct drm_device *dev, size_t size,
> -                                    size_t align);
> -void drm_pci_free(struct drm_device *dev, struct drm_dma_handle * dmah);
> -
>  int drm_get_pci_dev(struct pci_dev *pdev,
>                     const struct pci_device_id *ent,
>                     struct drm_driver *driver);
>
>  #else
>
> -static inline struct drm_dma_handle *drm_pci_alloc(struct drm_device *dev,
> -                                                  size_t size, size_t align)
> -{
> -       return NULL;
> -}
> -
> -static inline void drm_pci_free(struct drm_device *dev,
> -                               struct drm_dma_handle *dmah)
> -{
> -}
> -
>  static inline int drm_get_pci_dev(struct pci_dev *pdev,
>                                   const struct pci_device_id *ent,
>                                   struct drm_driver *driver)
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
