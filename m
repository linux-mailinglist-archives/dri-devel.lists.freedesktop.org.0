Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B2AD225872
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jul 2020 09:27:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 151B2899F2;
	Mon, 20 Jul 2020 07:27:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06CE0899F2
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jul 2020 07:27:08 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id g10so11282248wmc.1
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jul 2020 00:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=Bhwo7XtedxgO680QCApPkufZDGLDVkIrfASA3vSME98=;
 b=KnQ0XXlGMXIms2qzb4Z98253tPDTM28PDEhkizmnH+dcRJ7NkxEM8fEAY4mnorwZI6
 ta9yoa2xdBzD8Nqaehbz9uuv2nFZTnnYvLjV+6/DQKjsPrhE5iPGCI/n2+GCl5V5xBRA
 U+ONURY/664cWghXmUxsVSTWtmdshPqnZIhsw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=Bhwo7XtedxgO680QCApPkufZDGLDVkIrfASA3vSME98=;
 b=a+4Sl7n/18Z+KObgaRmv9LnmJ24lKjP9GibGTZes8cXb5JIO91SJfDIeuoqzJrgkkx
 wMlmj63oIqCJBVwk4HRrOpSKMwRakm21FadA3fiM9ITOe/2vb/4FMQ4OQdwaHjV0r6Tg
 r+nPRQNAD5ngModeobjERfrTsb6pD9P6qmhgSbesN9HarOrytyHc2c1ZMe3tvUGQ3jjI
 +KEJFkY4YwN1FXR6ORSXFtQQJc/D9XuWZa3FnnN+h5tFkRXbiegRwEbVcYvQikU3XgsN
 7khXHIG0aAfN9dyi/tmAdYgRi/iYy1mzatSCGEYv2WHKk36MaIjaG6oBLppd9IWuDh+d
 epGw==
X-Gm-Message-State: AOAM533qGndp3R573FPLHUTs9rj/16sG9dP/Kf1f5kdJCcvtZkwUN+rH
 2LBP8FcmVIMPbAn2CKb8Rx4Akw==
X-Google-Smtp-Source: ABdhPJyI4WGGxHQ56OUuIoYvCXVBVwOM6TFIJ1ZhwGAeZ7exEvdOrnkxabsQBl2LMjC/IykBS+3RWQ==
X-Received: by 2002:a7b:c194:: with SMTP id y20mr21445339wmi.83.1595230026550; 
 Mon, 20 Jul 2020 00:27:06 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id w128sm34493308wmb.19.2020.07.20.00.27.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2020 00:27:05 -0700 (PDT)
Date: Mon, 20 Jul 2020 09:27:04 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] drm/i810: switch from 'pci_' to 'dma_' API
Message-ID: <20200720072704.GT3278063@phenom.ffwll.local>
Mail-Followup-To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 airlied@linux.ie, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <20200718072822.339064-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200718072822.339064-1-christophe.jaillet@wanadoo.fr>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
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
Cc: airlied@linux.ie, kernel-janitors@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jul 18, 2020 at 09:28:22AM +0200, Christophe JAILLET wrote:
> The wrappers in include/linux/pci-dma-compat.h should go away.
> 
> The patch has been generated with the coccinelle script below and has been
> hand modified to replace GFP_ with a correct flag.
> It has been compile tested.
> 
> When memory is allocated in 'i810_dma_initialize()' GFP_KERNEL can be used
> because its only caller, 'i810_dma_init()', already use it and no lock is
> taken in the between.
> 
> 
> @@
> @@
> -    PCI_DMA_BIDIRECTIONAL
> +    DMA_BIDIRECTIONAL
> 
> @@
> @@
> -    PCI_DMA_TODEVICE
> +    DMA_TO_DEVICE
> 
> @@
> @@
> -    PCI_DMA_FROMDEVICE
> +    DMA_FROM_DEVICE
> 
> @@
> @@
> -    PCI_DMA_NONE
> +    DMA_NONE
> 
> @@
> expression e1, e2, e3;
> @@
> -    pci_alloc_consistent(e1, e2, e3)
> +    dma_alloc_coherent(&e1->dev, e2, e3, GFP_)
> 
> @@
> expression e1, e2, e3;
> @@
> -    pci_zalloc_consistent(e1, e2, e3)
> +    dma_alloc_coherent(&e1->dev, e2, e3, GFP_)
> 
> @@
> expression e1, e2, e3, e4;
> @@
> -    pci_free_consistent(e1, e2, e3, e4)
> +    dma_free_coherent(&e1->dev, e2, e3, e4)
> 
> @@
> expression e1, e2, e3, e4;
> @@
> -    pci_map_single(e1, e2, e3, e4)
> +    dma_map_single(&e1->dev, e2, e3, e4)
> 
> @@
> expression e1, e2, e3, e4;
> @@
> -    pci_unmap_single(e1, e2, e3, e4)
> +    dma_unmap_single(&e1->dev, e2, e3, e4)
> 
> @@
> expression e1, e2, e3, e4, e5;
> @@
> -    pci_map_page(e1, e2, e3, e4, e5)
> +    dma_map_page(&e1->dev, e2, e3, e4, e5)
> 
> @@
> expression e1, e2, e3, e4;
> @@
> -    pci_unmap_page(e1, e2, e3, e4)
> +    dma_unmap_page(&e1->dev, e2, e3, e4)
> 
> @@
> expression e1, e2, e3, e4;
> @@
> -    pci_map_sg(e1, e2, e3, e4)
> +    dma_map_sg(&e1->dev, e2, e3, e4)
> 
> @@
> expression e1, e2, e3, e4;
> @@
> -    pci_unmap_sg(e1, e2, e3, e4)
> +    dma_unmap_sg(&e1->dev, e2, e3, e4)
> 
> @@
> expression e1, e2, e3, e4;
> @@
> -    pci_dma_sync_single_for_cpu(e1, e2, e3, e4)
> +    dma_sync_single_for_cpu(&e1->dev, e2, e3, e4)
> 
> @@
> expression e1, e2, e3, e4;
> @@
> -    pci_dma_sync_single_for_device(e1, e2, e3, e4)
> +    dma_sync_single_for_device(&e1->dev, e2, e3, e4)
> 
> @@
> expression e1, e2, e3, e4;
> @@
> -    pci_dma_sync_sg_for_cpu(e1, e2, e3, e4)
> +    dma_sync_sg_for_cpu(&e1->dev, e2, e3, e4)
> 
> @@
> expression e1, e2, e3, e4;
> @@
> -    pci_dma_sync_sg_for_device(e1, e2, e3, e4)
> +    dma_sync_sg_for_device(&e1->dev, e2, e3, e4)
> 
> @@
> expression e1, e2;
> @@
> -    pci_dma_mapping_error(e1, e2)
> +    dma_mapping_error(&e1->dev, e2)
> 
> @@
> expression e1, e2;
> @@
> -    pci_set_dma_mask(e1, e2)
> +    dma_set_mask(&e1->dev, e2)
> 
> @@
> expression e1, e2;
> @@
> -    pci_set_consistent_dma_mask(e1, e2)
> +    dma_set_coherent_mask(&e1->dev, e2)
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied to drm-misc-next. Since we're already past -rc6 I think it'll go
into 5.10.

Thanks, Daniel

> ---
> If needed, see post from Christoph Hellwig on the kernel-janitors ML:
>    https://marc.info/?l=kernel-janitors&m=158745678307186&w=4
> ---
>  drivers/gpu/drm/i810/i810_dma.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i810/i810_dma.c b/drivers/gpu/drm/i810/i810_dma.c
> index b88c3d5f92b4..303c2d483c6e 100644
> --- a/drivers/gpu/drm/i810/i810_dma.c
> +++ b/drivers/gpu/drm/i810/i810_dma.c
> @@ -220,9 +220,9 @@ static int i810_dma_cleanup(struct drm_device *dev)
>  		if (dev_priv->ring.virtual_start)
>  			drm_legacy_ioremapfree(&dev_priv->ring.map, dev);
>  		if (dev_priv->hw_status_page) {
> -			pci_free_consistent(dev->pdev, PAGE_SIZE,
> -					    dev_priv->hw_status_page,
> -					    dev_priv->dma_status_page);
> +			dma_free_coherent(&dev->pdev->dev, PAGE_SIZE,
> +					  dev_priv->hw_status_page,
> +					  dev_priv->dma_status_page);
>  		}
>  		kfree(dev->dev_private);
>  		dev->dev_private = NULL;
> @@ -398,8 +398,8 @@ static int i810_dma_initialize(struct drm_device *dev,
>  
>  	/* Program Hardware Status Page */
>  	dev_priv->hw_status_page =
> -		pci_zalloc_consistent(dev->pdev, PAGE_SIZE,
> -				      &dev_priv->dma_status_page);
> +		dma_alloc_coherent(&dev->pdev->dev, PAGE_SIZE,
> +				   &dev_priv->dma_status_page, GFP_KERNEL);
>  	if (!dev_priv->hw_status_page) {
>  		dev->dev_private = (void *)dev_priv;
>  		i810_dma_cleanup(dev);
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
