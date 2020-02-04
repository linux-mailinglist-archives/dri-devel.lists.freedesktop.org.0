Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5DF151BFF
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2020 15:18:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E41B6EF3B;
	Tue,  4 Feb 2020 14:18:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ABE76EF3B
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2020 14:18:41 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id m10so2318127wmc.0
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Feb 2020 06:18:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=SZvtZEmEuBu9Lert2Y7308cs5ofq7lqleSOqJXTV/3I=;
 b=eQs/O/hfCevU7Ml98ikRT5G9UP81ZiTe8L6gQTAtmzx3GUxMB8pKrgyWdEjY41iW/p
 7am5BXFWlCi5z4xAmrFK1m2z4rXFgg4GPtJ4/I6dKYpYP+Psc7CkqMjDTv8Hi4xxL/Pi
 9vHAeH1P8xUOzCdRZ788a/vbUNK7JUBvcbu3M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=SZvtZEmEuBu9Lert2Y7308cs5ofq7lqleSOqJXTV/3I=;
 b=CAgzBb3muu2aTEyEdAL7L730aGKj9sBQSQBHNKYs5Dg3+H6KnDEJNjz+j7uOOU0R8/
 EdnIUSE4HqBRuUBSRESOENrSfHcVvppDu4IY33sTjEQ3G7+IVPC7KKJUH/U//y3tj9G3
 IZM0KHb5PTLMQsNIvblYXecSLPMiF/8HP0bqsfozf2NB42lCRfBc88OTbk0oiYQ5dOq4
 Dq/T0KFeMU8sA9I27oX1h11zwZEjvpV4bwe4ft9kW8hnLyAzwwsJo6TfTzCG50qUPbk/
 g4Jf6X6Jy2GUaf4Rk1TbdROSqcgjBat04QlIb9DppzmfxrCwTiTnd0vsVrH97kzxNeUH
 bCew==
X-Gm-Message-State: APjAAAVAdJRsHutKtWCXC9MzFB97T/+f9mesXBp0tBCoHrGfdG7/TUWX
 o5HDgdEHd68pvYedJ1jiUdSdo7sNh8xPDQ==
X-Google-Smtp-Source: APXvYqzw0bQRLgFFXpEaTJgMksbHk/nROFDaiUYzeWqUjVMPPeCYAbxi4ETiPER3yR+Qh3mrz+KuIw==
X-Received: by 2002:a05:600c:1007:: with SMTP id
 c7mr5976608wmc.158.1580825919833; 
 Tue, 04 Feb 2020 06:18:39 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id c9sm4029858wme.41.2020.02.04.06.18.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Feb 2020 06:18:39 -0800 (PST)
Date: Tue, 4 Feb 2020 15:18:37 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [Intel-gfx] [PATCH 5/5] drm: Remove exports for
 drm_pci_alloc/drm_pci_free
Message-ID: <20200204141837.GW43062@phenom.ffwll.local>
References: <20200202171635.4039044-1-chris@chris-wilson.co.uk>
 <20200202171635.4039044-5-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200202171635.4039044-5-chris@chris-wilson.co.uk>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Feb 02, 2020 at 05:16:35PM +0000, Chris Wilson wrote:
> The drm_pci_alloc routines have been a thin wrapper around the core dma
> coherent routines. Remove the crutch of a wrapper and the exported
> symbols, marking it for only internal legacy use.
> 
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>

Since Alex bothered to review the drm_bufs&r128 patches ...

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

I think all the other patches I've r-b stamped somewhere else already, but
if they changed pls poke.
-Daniel


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
>  	if (entry->seg_count) {
>  		for (i = 0; i < entry->seg_count; i++) {
>  			if (entry->seglist[i]) {
> -				drm_pci_free(dev, entry->seglist[i]);
> +				drm_legacy_pci_free(dev, entry->seglist[i]);
>  			}
>  		}
>  		kfree(entry->seglist);
> @@ -975,7 +975,8 @@ int drm_legacy_addbufs_pci(struct drm_device *dev,
>  
>  	while (entry->buf_count < count) {
>  
> -		dmah = drm_pci_alloc(dev, PAGE_SIZE << page_order, 0x1000);
> +		dmah = drm_legacy_pci_alloc(dev,
> +					    PAGE_SIZE << page_order, 0x1000);
>  
>  		if (!dmah) {
>  			/* Set count correctly so we free the proper amount. */
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
> +	return NULL;
> +}
> +
> +static inline void drm_legacy_pci_free(struct drm_device *dev,
> +				       struct drm_dma_handle *dmah)
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
>  	drm_dma_handle_t *dmah;
>  
> @@ -76,24 +67,14 @@ drm_dma_handle_t *drm_pci_alloc(struct drm_device * dev, size_t size, size_t ali
>  	return dmah;
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
>  	dma_free_coherent(&dev->pdev->dev, dmah->size, dmah->vaddr,
>  			  dmah->busaddr);
>  	kfree(dmah);
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
> -				     size_t align);
> -void drm_pci_free(struct drm_device *dev, struct drm_dma_handle * dmah);
> -
>  int drm_get_pci_dev(struct pci_dev *pdev,
>  		    const struct pci_device_id *ent,
>  		    struct drm_driver *driver);
>  
>  #else
>  
> -static inline struct drm_dma_handle *drm_pci_alloc(struct drm_device *dev,
> -						   size_t size, size_t align)
> -{
> -	return NULL;
> -}
> -
> -static inline void drm_pci_free(struct drm_device *dev,
> -				struct drm_dma_handle *dmah)
> -{
> -}
> -
>  static inline int drm_get_pci_dev(struct pci_dev *pdev,
>  				  const struct pci_device_id *ent,
>  				  struct drm_driver *driver)
> -- 
> 2.25.0
> 
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
