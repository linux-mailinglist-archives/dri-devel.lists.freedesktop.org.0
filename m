Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5724D151214
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2020 22:50:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B0236E448;
	Mon,  3 Feb 2020 21:50:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5C656E448;
 Mon,  3 Feb 2020 21:50:00 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id s10so972041wmh.3;
 Mon, 03 Feb 2020 13:50:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Bz9H+rEoz42N2PohEklI4SsWSqfVLbtbYz6f4dlWqHo=;
 b=XGoDm4C7Ws0L6899IO4mI2wTFfMnh2NrICZh4Oix8pkovjle7RGdl5wTXqF5cBNXLn
 HVCrk1A7SWTs2MuCsgoDLl6kewc5yGJviw9sEaYNstVqguBv3EumaC+QUZonn4WiRw59
 L6YJJhB3Ss47Movu5i3OMEKFpYkC8N1rfnyxtcFccfVINeWPD7k64nTH4/81lPG0iYo2
 qSD6O62eCD2LC7Q26R4gJs/FSCt80zBkEGd3xahN9+yzMy+kvueE+F/RLtEpcA6e9BvH
 XWiRVtzvE6upcKVdr8Wy3KiU7tHE4Xg9Qa+d4UVA0hN6KVHGOKBx/FXGJC6GTYLKJdTm
 oJJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Bz9H+rEoz42N2PohEklI4SsWSqfVLbtbYz6f4dlWqHo=;
 b=SOIj1sV692hR8z3qDIAsyIpNV7HtjMGLJtjCMcE8EZIzsCcHI6cXxCWEQJmJ4bzNw6
 m5BznbkN2AEUPilOs98mrupnJo1OflGr7S2yQ8QuIj4t83mI6UmbvV3Ds9EL6R/zOVGp
 +6p0ovU6U6ndnS4RDY8v5e9sdPn9UTrCt55QNI7RCvAE21bXskWNsX8lA0cbEu9l0V/I
 VN0F/hE1JzftXsIGSUoVmPMRFk0LDTmwv6w4TWDIddx3mFviLFEpd8b11sNjGFAX8oZ3
 SgDq6ZHMGdUHGqm9weXXr/gzy9JPaAK2Kb+ljHLwsaxl3YAFSRMPU09aWiRC2sSV61Ls
 ejEg==
X-Gm-Message-State: APjAAAXKHJ+3XLkyhvcsRaBlIFRj7Tp1RHgl9IK6fuI4xOehQw0nLq6+
 2+yzAq+MnNm8Ud4JZpwnKXvYNDk9iClJ9Isr2YM=
X-Google-Smtp-Source: APXvYqyfoL3COtXhpTnhOUXZO+tkz1VpE8SA5wR1Bis4thbGX3S9VMZLXkKBQqgF1m53SOrLdMLOQmfMZhgL1gJ+njc=
X-Received: by 2002:a05:600c:218b:: with SMTP id
 e11mr1105264wme.56.1580766599264; 
 Mon, 03 Feb 2020 13:49:59 -0800 (PST)
MIME-Version: 1.0
References: <20200202171635.4039044-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200202171635.4039044-1-chris@chris-wilson.co.uk>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 3 Feb 2020 16:49:48 -0500
Message-ID: <CADnq5_N7azVKP0iB1NMWz7KM79cU7HvR7Ssh1nbLDyBP946hxw@mail.gmail.com>
Subject: Re: [PATCH 1/5] drm: Remove PageReserved manipulation from
 drm_pci_alloc
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
 "for 3.8" <stable@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Feb 2, 2020 at 12:16 PM Chris Wilson <chris@chris-wilson.co.uk> wrote:
>
> drm_pci_alloc/drm_pci_free are very thin wrappers around the core dma
> facilities, and we have no special reason within the drm layer to behave
> differently. In particular, since
>
> commit de09d31dd38a50fdce106c15abd68432eebbd014
> Author: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> Date:   Fri Jan 15 16:51:42 2016 -0800
>
>     page-flags: define PG_reserved behavior on compound pages
>
>     As far as I can see there's no users of PG_reserved on compound pages.
>     Let's use PF_NO_COMPOUND here.
>
> it has been illegal to combine GFP_COMP with SetPageReserved, so lets
> stop doing both and leave the dma layer to its own devices.
>
> Reported-by: Taketo Kabe

Needs an email address.

> Closes: https://gitlab.freedesktop.org/drm/intel/issues/1027

Should be Bug: rather than Closes:

> Fixes: de09d31dd38a ("page-flags: define PG_reserved behavior on compound pages")
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: <stable@vger.kernel.org> # v4.5+

With those fixed:
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/drm_pci.c | 23 ++---------------------
>  1 file changed, 2 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_pci.c b/drivers/gpu/drm/drm_pci.c
> index f2e43d341980..d16dac4325f9 100644
> --- a/drivers/gpu/drm/drm_pci.c
> +++ b/drivers/gpu/drm/drm_pci.c
> @@ -51,8 +51,6 @@
>  drm_dma_handle_t *drm_pci_alloc(struct drm_device * dev, size_t size, size_t align)
>  {
>         drm_dma_handle_t *dmah;
> -       unsigned long addr;
> -       size_t sz;
>
>         /* pci_alloc_consistent only guarantees alignment to the smallest
>          * PAGE_SIZE order which is greater than or equal to the requested size.
> @@ -68,20 +66,13 @@ drm_dma_handle_t *drm_pci_alloc(struct drm_device * dev, size_t size, size_t ali
>         dmah->size = size;
>         dmah->vaddr = dma_alloc_coherent(&dev->pdev->dev, size,
>                                          &dmah->busaddr,
> -                                        GFP_KERNEL | __GFP_COMP);
> +                                        GFP_KERNEL);
>
>         if (dmah->vaddr == NULL) {
>                 kfree(dmah);
>                 return NULL;
>         }
>
> -       /* XXX - Is virt_to_page() legal for consistent mem? */
> -       /* Reserve */
> -       for (addr = (unsigned long)dmah->vaddr, sz = size;
> -            sz > 0; addr += PAGE_SIZE, sz -= PAGE_SIZE) {
> -               SetPageReserved(virt_to_page((void *)addr));
> -       }
> -
>         return dmah;
>  }
>
> @@ -94,19 +85,9 @@ EXPORT_SYMBOL(drm_pci_alloc);
>   */
>  void __drm_legacy_pci_free(struct drm_device * dev, drm_dma_handle_t * dmah)
>  {
> -       unsigned long addr;
> -       size_t sz;
> -
> -       if (dmah->vaddr) {
> -               /* XXX - Is virt_to_page() legal for consistent mem? */
> -               /* Unreserve */
> -               for (addr = (unsigned long)dmah->vaddr, sz = dmah->size;
> -                    sz > 0; addr += PAGE_SIZE, sz -= PAGE_SIZE) {
> -                       ClearPageReserved(virt_to_page((void *)addr));
> -               }
> +       if (dmah->vaddr)
>                 dma_free_coherent(&dev->pdev->dev, dmah->size, dmah->vaddr,
>                                   dmah->busaddr);
> -       }
>  }
>
>  /**
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
