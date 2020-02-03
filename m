Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82281151217
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2020 22:51:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 913FE6E44B;
	Mon,  3 Feb 2020 21:51:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B02E6E44B;
 Mon,  3 Feb 2020 21:51:01 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id f129so1111740wmf.2;
 Mon, 03 Feb 2020 13:51:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5WHLKjs5vKxBAv4LP02Et1szjZNI558BLfCCdmQcGRA=;
 b=rkE8O83yHrPSifd4190TzVv6P6BbbqkWDqfI9cIpKuynj8+FU11daiaf4Gr0K/iqTY
 CrRIU9pyGaSQiPaOjBlXhSk8WCcwRWKDCny4+ZFYPjU6vfBbPE2bDfBwbqMLhBTmIquH
 97PJ7lxeLkB4wq1hzdjTXjZDSmadXiG+1YbMGsKoivp7cFS3fXE5ND+0zbaNtHurOWAm
 ja9hcFTkf3C9AGONTq+zTqbhcCVcQ8qUt9fd16plioNll1WDqXmHSLigdCajwvSstoDe
 Pu0dBrq+2QXMzxtE4DmjUjCBxfruOxMMA0zHsSLy0GZ7la69ETWQQoSUDbM2FaQ+5qXU
 E89A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5WHLKjs5vKxBAv4LP02Et1szjZNI558BLfCCdmQcGRA=;
 b=ISQW4ZUadmxru63mJExYgib3CZkRujcEU/WmKC0Kqh0Q6yp7yT+pJn08APWnQfJGVK
 urZjueY2k+mejZLi0Lgnkj7GLgle+u/fpvD+pGWCdL3a5oFXqCeqI+DUdvyKsi1I+0dB
 LE/+a+BpB7L1Y36IV/Rw190hj+blJCw6lQwJxmxC6oPF7eaiTCEy7y+G+E6If9t+JXqC
 fZTACgf0GLcIbOj+bOYKailf/wkr2o1IcUd5SbT3DMC6AagBoHYSJ8h8QsAJa23pc2oJ
 Q52zX+tjdiwHqJhjjl5k2why29NRC4WsWijPkn3nH8yR28Fga6fDQd35nQeo6h3dDH/a
 4Wyg==
X-Gm-Message-State: APjAAAWd06f8Jt/kGNRLI6+s7+dECDFq+/PQEw6Fe/lop3ntFMZeVta7
 QcCDFAAvo5jiJ/HY5YrPTN7JCD/gS4oAlhQ+sGhDWpAW
X-Google-Smtp-Source: APXvYqy49VnMaROssdlL0nnLaaXrzvRojLG6OcHIN/5wwgqUfflWKVPk8M3nR9pBC9hbuW2KYaZtzLD0kRbUVBMJkEg=
X-Received: by 2002:a1c:f009:: with SMTP id a9mr1039751wmb.73.1580766659899;
 Mon, 03 Feb 2020 13:50:59 -0800 (PST)
MIME-Version: 1.0
References: <20200202171635.4039044-1-chris@chris-wilson.co.uk>
 <20200202171635.4039044-2-chris@chris-wilson.co.uk>
In-Reply-To: <20200202171635.4039044-2-chris@chris-wilson.co.uk>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 3 Feb 2020 16:50:48 -0500
Message-ID: <CADnq5_Ny2u7Fb94cwiaCkh1TzkXXA++4Y2EWmj-v7aJ8f4mQDQ@mail.gmail.com>
Subject: Re: [PATCH 2/5] drm: Remove the dma_alloc_coherent wrapper for
 internal usage
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
> Internally for "consistent" maps, we create a temporary struct
> drm_dma_handle in order to user our own dma_alloc_coherent wrapper then
> destroy the temporary wrap. Simplify our logic by removing the temporary
> wrapper!
>
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/drm_bufs.c | 20 +++++++++-----------
>  drivers/gpu/drm/drm_pci.c  | 15 ++-------------
>  drivers/gpu/drm/drm_vm.c   | 10 ++++------
>  include/drm/drm_legacy.h   |  6 ------
>  4 files changed, 15 insertions(+), 36 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_bufs.c b/drivers/gpu/drm/drm_bufs.c
> index 8ce9d73fab4f..19297e58b232 100644
> --- a/drivers/gpu/drm/drm_bufs.c
> +++ b/drivers/gpu/drm/drm_bufs.c
> @@ -149,7 +149,6 @@ static int drm_addmap_core(struct drm_device *dev, resource_size_t offset,
>  {
>         struct drm_local_map *map;
>         struct drm_map_list *list;
> -       drm_dma_handle_t *dmah;
>         unsigned long user_token;
>         int ret;
>
> @@ -324,14 +323,14 @@ static int drm_addmap_core(struct drm_device *dev, resource_size_t offset,
>                  * As we're limiting the address to 2^32-1 (or less),
>                  * casting it down to 32 bits is no problem, but we
>                  * need to point to a 64bit variable first. */
> -               dmah = drm_pci_alloc(dev, map->size, map->size);
> -               if (!dmah) {
> +               map->handle = dma_alloc_coherent(&dev->pdev->dev,
> +                                                map->size,
> +                                                &map->offset,
> +                                                GFP_KERNEL);
> +               if (!map->handle) {
>                         kfree(map);
>                         return -ENOMEM;
>                 }
> -               map->handle = dmah->vaddr;
> -               map->offset = (unsigned long)dmah->busaddr;
> -               kfree(dmah);
>                 break;
>         default:
>                 kfree(map);
> @@ -513,7 +512,6 @@ int drm_legacy_getmap_ioctl(struct drm_device *dev, void *data,
>  int drm_legacy_rmmap_locked(struct drm_device *dev, struct drm_local_map *map)
>  {
>         struct drm_map_list *r_list = NULL, *list_t;
> -       drm_dma_handle_t dmah;
>         int found = 0;
>         struct drm_master *master;
>
> @@ -554,10 +552,10 @@ int drm_legacy_rmmap_locked(struct drm_device *dev, struct drm_local_map *map)
>         case _DRM_SCATTER_GATHER:
>                 break;
>         case _DRM_CONSISTENT:
> -               dmah.vaddr = map->handle;
> -               dmah.busaddr = map->offset;
> -               dmah.size = map->size;
> -               __drm_legacy_pci_free(dev, &dmah);
> +               dma_free_coherent(&dev->pdev->dev,
> +                                 map->size,
> +                                 map->handle,
> +                                 map->offset);
>                 break;
>         }
>         kfree(map);
> diff --git a/drivers/gpu/drm/drm_pci.c b/drivers/gpu/drm/drm_pci.c
> index d16dac4325f9..c6bb98729a26 100644
> --- a/drivers/gpu/drm/drm_pci.c
> +++ b/drivers/gpu/drm/drm_pci.c
> @@ -78,18 +78,6 @@ drm_dma_handle_t *drm_pci_alloc(struct drm_device * dev, size_t size, size_t ali
>
>  EXPORT_SYMBOL(drm_pci_alloc);
>
> -/*
> - * Free a PCI consistent memory block without freeing its descriptor.
> - *
> - * This function is for internal use in the Linux-specific DRM core code.
> - */
> -void __drm_legacy_pci_free(struct drm_device * dev, drm_dma_handle_t * dmah)
> -{
> -       if (dmah->vaddr)
> -               dma_free_coherent(&dev->pdev->dev, dmah->size, dmah->vaddr,
> -                                 dmah->busaddr);
> -}
> -
>  /**
>   * drm_pci_free - Free a PCI consistent memory block
>   * @dev: DRM device
> @@ -100,7 +88,8 @@ void __drm_legacy_pci_free(struct drm_device * dev, drm_dma_handle_t * dmah)
>   */
>  void drm_pci_free(struct drm_device * dev, drm_dma_handle_t * dmah)
>  {
> -       __drm_legacy_pci_free(dev, dmah);
> +       dma_free_coherent(&dev->pdev->dev, dmah->size, dmah->vaddr,
> +                         dmah->busaddr);
>         kfree(dmah);
>  }
>
> diff --git a/drivers/gpu/drm/drm_vm.c b/drivers/gpu/drm/drm_vm.c
> index 52e87e4869a5..64619fe90046 100644
> --- a/drivers/gpu/drm/drm_vm.c
> +++ b/drivers/gpu/drm/drm_vm.c
> @@ -269,8 +269,6 @@ static void drm_vm_shm_close(struct vm_area_struct *vma)
>                 }
>
>                 if (!found_maps) {
> -                       drm_dma_handle_t dmah;
> -
>                         switch (map->type) {
>                         case _DRM_REGISTERS:
>                         case _DRM_FRAME_BUFFER:
> @@ -284,10 +282,10 @@ static void drm_vm_shm_close(struct vm_area_struct *vma)
>                         case _DRM_SCATTER_GATHER:
>                                 break;
>                         case _DRM_CONSISTENT:
> -                               dmah.vaddr = map->handle;
> -                               dmah.busaddr = map->offset;
> -                               dmah.size = map->size;
> -                               __drm_legacy_pci_free(dev, &dmah);
> +                               dma_free_coherent(&dev->pdev->dev,
> +                                                 map->size,
> +                                                 map->handle,
> +                                                 map->offset);
>                                 break;
>                         }
>                         kfree(map);
> diff --git a/include/drm/drm_legacy.h b/include/drm/drm_legacy.h
> index 5745710453c8..dcef3598f49e 100644
> --- a/include/drm/drm_legacy.h
> +++ b/include/drm/drm_legacy.h
> @@ -194,17 +194,11 @@ void drm_legacy_idlelock_release(struct drm_lock_data *lock);
>
>  #ifdef CONFIG_PCI
>
> -void __drm_legacy_pci_free(struct drm_device *dev, drm_dma_handle_t * dmah);
>  int drm_legacy_pci_init(struct drm_driver *driver, struct pci_driver *pdriver);
>  void drm_legacy_pci_exit(struct drm_driver *driver, struct pci_driver *pdriver);
>
>  #else
>
> -static inline void __drm_legacy_pci_free(struct drm_device *dev,
> -                                        drm_dma_handle_t *dmah)
> -{
> -}
> -
>  static inline int drm_legacy_pci_init(struct drm_driver *driver,
>                                       struct pci_driver *pdriver)
>  {
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
