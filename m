Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B144ACCA9
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 00:49:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C6A810E460;
	Mon,  7 Feb 2022 23:49:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E87C10E162
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Feb 2022 23:49:23 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 ki18-20020a17090ae91200b001b8be87e9abso374941pjb.1
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Feb 2022 15:49:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=srqNW1EcIXWSL3YA9DB/cq+5wKzOkrj3L8GZFZFPp88=;
 b=01MLVSpGJcOLNshddxkhtSXXihKsoNqdx5vMNxTFv6bN6BYo1SzUvt/9GrJao02HnF
 Hb+sjT0ujjyEhZBcYaEd66uhrH2U82Bpll97CF5ng/E4ARrZPgn+43XxHckYHlvbZ2cV
 f+jtU4mZKMkJCdUAiiqidQXrgC4Uo9dYltnKCJah1zHCywOpfDTIJzzdLCdSte1qGkst
 3TMcL8koigGPS26Czk0t/YynCFMadqyzQa7PlOBrn/XujPHTtuWh/oT8H0p3MLl7Uhro
 o0Gdsh8bSiaHc0CBUQxnZNfGeQPOMJTi12vYqWQkg/+GUCDwEzHRF9C80zL1n7F4WwGt
 uBog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=srqNW1EcIXWSL3YA9DB/cq+5wKzOkrj3L8GZFZFPp88=;
 b=G1qopfzg3ItMGOHoC58Fg81srGZ/l0/XO2XmakX0FoLgWk0hji3tjhTZZ5S3PEcfLn
 zmTA1Nk+9oicVs2jTKo0fhh/gxntcmmQcVBZpvSelqpTgQLh608oUrKiwKcKsG8R5Tat
 J+7134+YCLm5g1BLXGtOHT+1M9jL905eJ2n0KtviN7GOiTd4G4D/+FB6OpVjZio7Q95l
 eWdN3HF4jqOohk6RL/uNw/MJ0AQYyWWj5H0CBTz5ftCBhv3ZcfQEF/XRLGgLhMCKY+Qe
 JApZIRj0ojkE+aq5cZVAsMxEmoCgcI524ow5GsTXt9zZzO04QMBQV69hszAnyrlcYq2O
 85ig==
X-Gm-Message-State: AOAM531sBZpYZW7dK5ZzPmif/0MFIJkolAS2rd/pVpRELySsmo6nEMkm
 KQm6bhImObzt/J5LnO/dD5rCjrm0CeVGOoElGL2xGw==
X-Google-Smtp-Source: ABdhPJxFGt5Dntgj+qwGhvXaFOpnQvWG0jHZ1p4j/IHgmQmdfIUoMiD/D2bs8RfxGHBUeq0VHi5bSlkknn7IBqEisQo=
X-Received: by 2002:a17:902:ccce:: with SMTP id
 z14mr1978185ple.34.1644277763021; 
 Mon, 07 Feb 2022 15:49:23 -0800 (PST)
MIME-Version: 1.0
References: <20220207063249.1833066-1-hch@lst.de>
 <20220207063249.1833066-7-hch@lst.de>
In-Reply-To: <20220207063249.1833066-7-hch@lst.de>
From: Dan Williams <dan.j.williams@intel.com>
Date: Mon, 7 Feb 2022 15:49:12 -0800
Message-ID: <CAPcyv4iYfnJN+5=0Gzw8gKpNCG3PJS1MEZxxoPwuojhU6XHNRA@mail.gmail.com>
Subject: Re: [PATCH 6/8] mm: don't include <linux/memremap.h> in <linux/mm.h>
To: Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Linux NVDIMM <nvdimm@lists.linux.dev>,
 Ralph Campbell <rcampbell@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Karol Herbst <kherbst@redhat.com>, Linux MM <linux-mm@kvack.org>,
 nouveau@lists.freedesktop.org, Felix Kuehling <Felix.Kuehling@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Ben Skeggs <bskeggs@redhat.com>, Alex Deucher <alexander.deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Logan Gunthorpe <logang@deltatee.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Feb 6, 2022 at 10:33 PM Christoph Hellwig <hch@lst.de> wrote:
>
> Move the check for the actual pgmap types that need the free at refcount
> one behavior into the out of line helper, and thus avoid the need to
> pull memremap.h into mm.h.

Looks good to me assuming the compile bots agree.

Reviewed-by: Dan Williams <dan.j.williams@intel.com>

>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  arch/arm64/mm/mmu.c                    |  1 +
>  drivers/gpu/drm/amd/amdkfd/kfd_priv.h  |  1 +
>  drivers/gpu/drm/drm_cache.c            |  2 +-
>  drivers/gpu/drm/nouveau/nouveau_dmem.c |  1 +
>  drivers/gpu/drm/nouveau/nouveau_svm.c  |  1 +
>  drivers/infiniband/core/rw.c           |  1 +
>  drivers/nvdimm/pmem.h                  |  1 +
>  drivers/nvme/host/pci.c                |  1 +
>  drivers/nvme/target/io-cmd-bdev.c      |  1 +
>  fs/fuse/virtio_fs.c                    |  1 +
>  include/linux/memremap.h               | 18 ++++++++++++++++++
>  include/linux/mm.h                     | 20 --------------------
>  lib/test_hmm.c                         |  1 +
>  mm/memremap.c                          |  6 +++++-
>  14 files changed, 34 insertions(+), 22 deletions(-)
>
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index acfae9b41cc8c9..580abae6c0b93f 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -17,6 +17,7 @@
>  #include <linux/mman.h>
>  #include <linux/nodemask.h>
>  #include <linux/memblock.h>
> +#include <linux/memremap.h>
>  #include <linux/memory.h>
>  #include <linux/fs.h>
>  #include <linux/io.h>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/=
amdkfd/kfd_priv.h
> index ea68f3b3a4e9cb..6d643b4b791d87 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
> @@ -25,6 +25,7 @@
>
>  #include <linux/hashtable.h>
>  #include <linux/mmu_notifier.h>
> +#include <linux/memremap.h>
>  #include <linux/mutex.h>
>  #include <linux/types.h>
>  #include <linux/atomic.h>
> diff --git a/drivers/gpu/drm/drm_cache.c b/drivers/gpu/drm/drm_cache.c
> index f19d9acbe95936..50b8a088f763a6 100644
> --- a/drivers/gpu/drm/drm_cache.c
> +++ b/drivers/gpu/drm/drm_cache.c
> @@ -27,11 +27,11 @@
>  /*
>   * Authors: Thomas Hellstr=C3=B6m <thomas-at-tungstengraphics-dot-com>
>   */
> -
>  #include <linux/dma-buf-map.h>
>  #include <linux/export.h>
>  #include <linux/highmem.h>
>  #include <linux/cc_platform.h>
> +#include <linux/ioport.h>
>  #include <xen/xen.h>
>
>  #include <drm/drm_cache.h>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nou=
veau/nouveau_dmem.c
> index e886a3b9e08c7d..a5cdfbe32b5e54 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> @@ -39,6 +39,7 @@
>
>  #include <linux/sched/mm.h>
>  #include <linux/hmm.h>
> +#include <linux/memremap.h>
>  #include <linux/migrate.h>
>
>  /*
> diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouv=
eau/nouveau_svm.c
> index 266809e511e2c1..090b9b47708cca 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_svm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
> @@ -35,6 +35,7 @@
>  #include <linux/sched/mm.h>
>  #include <linux/sort.h>
>  #include <linux/hmm.h>
> +#include <linux/memremap.h>
>  #include <linux/rmap.h>
>
>  struct nouveau_svm {
> diff --git a/drivers/infiniband/core/rw.c b/drivers/infiniband/core/rw.c
> index 5a3bd41b331c93..4d98f931a13ddd 100644
> --- a/drivers/infiniband/core/rw.c
> +++ b/drivers/infiniband/core/rw.c
> @@ -2,6 +2,7 @@
>  /*
>   * Copyright (c) 2016 HGST, a Western Digital Company.
>   */
> +#include <linux/memremap.h>
>  #include <linux/moduleparam.h>
>  #include <linux/slab.h>
>  #include <linux/pci-p2pdma.h>
> diff --git a/drivers/nvdimm/pmem.h b/drivers/nvdimm/pmem.h
> index 59cfe13ea8a85c..1f51a23614299b 100644
> --- a/drivers/nvdimm/pmem.h
> +++ b/drivers/nvdimm/pmem.h
> @@ -3,6 +3,7 @@
>  #define __NVDIMM_PMEM_H__
>  #include <linux/page-flags.h>
>  #include <linux/badblocks.h>
> +#include <linux/memremap.h>
>  #include <linux/types.h>
>  #include <linux/pfn_t.h>
>  #include <linux/fs.h>
> diff --git a/drivers/nvme/host/pci.c b/drivers/nvme/host/pci.c
> index 6a99ed68091589..ab15bc72710dbe 100644
> --- a/drivers/nvme/host/pci.c
> +++ b/drivers/nvme/host/pci.c
> @@ -15,6 +15,7 @@
>  #include <linux/init.h>
>  #include <linux/interrupt.h>
>  #include <linux/io.h>
> +#include <linux/memremap.h>
>  #include <linux/mm.h>
>  #include <linux/module.h>
>  #include <linux/mutex.h>
> diff --git a/drivers/nvme/target/io-cmd-bdev.c b/drivers/nvme/target/io-c=
md-bdev.c
> index 70ca9dfc1771a9..a141446db1bea3 100644
> --- a/drivers/nvme/target/io-cmd-bdev.c
> +++ b/drivers/nvme/target/io-cmd-bdev.c
> @@ -6,6 +6,7 @@
>  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>  #include <linux/blkdev.h>
>  #include <linux/blk-integrity.h>
> +#include <linux/memremap.h>
>  #include <linux/module.h>
>  #include "nvmet.h"
>
> diff --git a/fs/fuse/virtio_fs.c b/fs/fuse/virtio_fs.c
> index 9d737904d07c0b..86b7dbb6a0d43e 100644
> --- a/fs/fuse/virtio_fs.c
> +++ b/fs/fuse/virtio_fs.c
> @@ -8,6 +8,7 @@
>  #include <linux/dax.h>
>  #include <linux/pci.h>
>  #include <linux/pfn_t.h>
> +#include <linux/memremap.h>
>  #include <linux/module.h>
>  #include <linux/virtio.h>
>  #include <linux/virtio_fs.h>
> diff --git a/include/linux/memremap.h b/include/linux/memremap.h
> index 1fafcc38acbad6..514ab46f597e5c 100644
> --- a/include/linux/memremap.h
> +++ b/include/linux/memremap.h
> @@ -1,6 +1,8 @@
>  /* SPDX-License-Identifier: GPL-2.0 */
>  #ifndef _LINUX_MEMREMAP_H_
>  #define _LINUX_MEMREMAP_H_
> +
> +#include <linux/mm.h>
>  #include <linux/range.h>
>  #include <linux/ioport.h>
>  #include <linux/percpu-refcount.h>
> @@ -129,6 +131,22 @@ static inline unsigned long pgmap_vmemmap_nr(struct =
dev_pagemap *pgmap)
>         return 1 << pgmap->vmemmap_shift;
>  }
>
> +static inline bool is_device_private_page(const struct page *page)
> +{
> +       return IS_ENABLED(CONFIG_DEV_PAGEMAP_OPS) &&
> +               IS_ENABLED(CONFIG_DEVICE_PRIVATE) &&
> +               is_zone_device_page(page) &&
> +               page->pgmap->type =3D=3D MEMORY_DEVICE_PRIVATE;
> +}
> +
> +static inline bool is_pci_p2pdma_page(const struct page *page)
> +{
> +       return IS_ENABLED(CONFIG_DEV_PAGEMAP_OPS) &&
> +               IS_ENABLED(CONFIG_PCI_P2PDMA) &&
> +               is_zone_device_page(page) &&
> +               page->pgmap->type =3D=3D MEMORY_DEVICE_PCI_P2PDMA;
> +}
> +
>  #ifdef CONFIG_ZONE_DEVICE
>  void *memremap_pages(struct dev_pagemap *pgmap, int nid);
>  void memunmap_pages(struct dev_pagemap *pgmap);
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 26baadcef4556b..80fccfe31c3444 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -23,7 +23,6 @@
>  #include <linux/err.h>
>  #include <linux/page-flags.h>
>  #include <linux/page_ref.h>
> -#include <linux/memremap.h>
>  #include <linux/overflow.h>
>  #include <linux/sizes.h>
>  #include <linux/sched.h>
> @@ -1101,9 +1100,6 @@ static inline bool put_devmap_managed_page(struct p=
age *page)
>                 return false;
>         if (!is_zone_device_page(page))
>                 return false;
> -       if (page->pgmap->type !=3D MEMORY_DEVICE_PRIVATE &&
> -           page->pgmap->type !=3D MEMORY_DEVICE_FS_DAX)
> -               return false;
>         return __put_devmap_managed_page(page);
>  }
>
> @@ -1114,22 +1110,6 @@ static inline bool put_devmap_managed_page(struct =
page *page)
>  }
>  #endif /* CONFIG_DEV_PAGEMAP_OPS */
>
> -static inline bool is_device_private_page(const struct page *page)
> -{
> -       return IS_ENABLED(CONFIG_DEV_PAGEMAP_OPS) &&
> -               IS_ENABLED(CONFIG_DEVICE_PRIVATE) &&
> -               is_zone_device_page(page) &&
> -               page->pgmap->type =3D=3D MEMORY_DEVICE_PRIVATE;
> -}
> -
> -static inline bool is_pci_p2pdma_page(const struct page *page)
> -{
> -       return IS_ENABLED(CONFIG_DEV_PAGEMAP_OPS) &&
> -               IS_ENABLED(CONFIG_PCI_P2PDMA) &&
> -               is_zone_device_page(page) &&
> -               page->pgmap->type =3D=3D MEMORY_DEVICE_PCI_P2PDMA;
> -}
> -
>  /* 127: arbitrary random number, small enough to assemble well */
>  #define folio_ref_zero_or_close_to_overflow(folio) \
>         ((unsigned int) folio_ref_count(folio) + 127u <=3D 127u)
> diff --git a/lib/test_hmm.c b/lib/test_hmm.c
> index 396beee6b061d4..e5fc14ba71f33e 100644
> --- a/lib/test_hmm.c
> +++ b/lib/test_hmm.c
> @@ -12,6 +12,7 @@
>  #include <linux/kernel.h>
>  #include <linux/cdev.h>
>  #include <linux/device.h>
> +#include <linux/memremap.h>
>  #include <linux/mutex.h>
>  #include <linux/rwsem.h>
>  #include <linux/sched.h>
> diff --git a/mm/memremap.c b/mm/memremap.c
> index f41233a67edb12..a0ece2344c2cab 100644
> --- a/mm/memremap.c
> +++ b/mm/memremap.c
> @@ -4,7 +4,7 @@
>  #include <linux/io.h>
>  #include <linux/kasan.h>
>  #include <linux/memory_hotplug.h>
> -#include <linux/mm.h>
> +#include <linux/memremap.h>
>  #include <linux/pfn_t.h>
>  #include <linux/swap.h>
>  #include <linux/mmzone.h>
> @@ -504,6 +504,10 @@ void free_devmap_managed_page(struct page *page)
>
>  bool __put_devmap_managed_page(struct page *page)
>  {
> +       if (page->pgmap->type !=3D MEMORY_DEVICE_PRIVATE &&
> +           page->pgmap->type !=3D MEMORY_DEVICE_FS_DAX)
> +               return false;
> +
>         /*
>          * devmap page refcounts are 1-based, rather than 0-based: if
>          * refcount is 1, then the page is free and the refcount is
> --
> 2.30.2
>
