Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FEE0B1CE90
	for <lists+dri-devel@lfdr.de>; Wed,  6 Aug 2025 23:42:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4943910E7BE;
	Wed,  6 Aug 2025 21:42:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="gzoSR8q7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E07DC10E7BE
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Aug 2025 21:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1754516539;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UEyeHS4HV3rZ/wSqVLFMAOzjnboPPP41DAzDFsrqTZs=;
 b=gzoSR8q7cp3nMlecMWMhJvFMf1kygaOcadqfgj2VkVNaMVd7iwHT1E3ei2y2LmDw0s9UVY
 uoOn56HrUqB7y7D59UxDMrEfkyInqLXp9t1IVnuOa/owH4pVHY/oKRy3chkomxVQ/nZQ0F
 MrIGUYRUM3AJUJHcn9zCm37L3PwSPW0=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-661-Z5u2-E5zM2KXKkCgQcjT4Q-1; Wed, 06 Aug 2025 17:42:18 -0400
X-MC-Unique: Z5u2-E5zM2KXKkCgQcjT4Q-1
X-Mimecast-MFC-AGG-ID: Z5u2-E5zM2KXKkCgQcjT4Q_1754516538
Received: by mail-ot1-f70.google.com with SMTP id
 46e09a7af769-742e3d0ad61so22632a34.3
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Aug 2025 14:42:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754516538; x=1755121338;
 h=content-transfer-encoding:mime-version:organization:references
 :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UEyeHS4HV3rZ/wSqVLFMAOzjnboPPP41DAzDFsrqTZs=;
 b=EdV7qCNbmApf+a3MYRAhJFAty9M3GxBwWF1qgX6++Jl08/BMSpJQYATTVvIIWtYxYe
 yiY/E7p7eaSY/q29eSATRXqr35xeLE2TDSiFubxqvkU2mi5/DAcH/8+HjjC6vaWTt3+y
 Br54WRc8CylLW7/0W4EuiLXPsktul+HHHEiVC27DAHg9aHK+S4FtZL1ILFBKS+Exb2+E
 ompX0bEppQR2isYfm4wjjvHjCM1Zy9/cN1niA6mdTdWGYnJRJM6h3Q0nWm9pGLBt7kDT
 72sBhnDPcr9lQciBpbJ6tpx3Oickapthdbco/a+PXQ9ql+O/GHVeTLyYfEwk5a9azmhl
 vz7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBwNV3ZjTi7ab4cLkz8kdAnSUj3bCEI0nroqRHwNqPXiDBm1Ih6n6x2/6XAwpgXAtMV349NFXU53A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwqYRuMGHWeuHcBPuGnApTTSiUhwcVMa4YrIKXOb9VjqhUOUdDp
 YZeFfNaADNf/0+5M0CJzhTjiArJinJapIE5QPszpsX0PWh0KFlquqxR5jQdO2mbxk8dstR4MkLe
 YUPVeETGO5xi253cr0oFS0vG3XKV8QWv9hHtajz8K0UgcLrjijo7B2xDAiHg2LLlPUbbohQ==
X-Gm-Gg: ASbGnct/iN9WM/T4PnwXGquAVitBE8J7CaRcKR8ViXdLT7J0nWNj69DPtqgrgP3MJB7
 VqJrcCKPEWcdjeqF3yNskRNnAlCF8vfPuOm7UKTtG5JwEv5ZkJZKwqR7RMF1EsrOqCtNL4uF24/
 sUGT5qu2hRtgjC8QYys07/Mu1oXEs6A6QBQ3bjcBPYg2DzT1kP/XMWs+Syc5wugIqD6EVfT5ayr
 RQLmW3dM61YnVDO9218mLBkVOaRY0Pkjpqt6qEobBOhts9j71umZ8ITWZ71c463AkGTQw6xFD9j
 nFVQambyafuXKgm4d82Gm1lz0c3S4DH18LD8c18c1Fk=
X-Received: by 2002:a05:6830:3145:b0:741:a217:720f with SMTP id
 46e09a7af769-7430e2000b0mr942372a34.2.1754516537615; 
 Wed, 06 Aug 2025 14:42:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH5QU5ZQlpYSxfTPMUFCWfqP/wnHyNw5oOZqDg/+tC9OzPbWJoK2cj/jTsdC9+aUwDUHNbnjQ==
X-Received: by 2002:a05:6830:3145:b0:741:a217:720f with SMTP id
 46e09a7af769-7430e2000b0mr942353a34.2.1754516537077; 
 Wed, 06 Aug 2025 14:42:17 -0700 (PDT)
Received: from redhat.com ([38.15.36.11]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-74186cc4e1bsm3606901a34.21.2025.08.06.14.42.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Aug 2025 14:42:16 -0700 (PDT)
Date: Wed, 6 Aug 2025 15:42:14 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Leon Romanovsky <leon@kernel.org>
Cc: Leon Romanovsky <leonro@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Andrew Morton <akpm@linux-foundation.org>, Bjorn Helgaas
 <bhelgaas@google.com>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, Christoph Hellwig <hch@lst.de>,
 dri-devel@lists.freedesktop.org, iommu@lists.linux.dev, Jens Axboe
 <axboe@kernel.dk>, Joerg Roedel <joro@8bytes.org>, kvm@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mm@kvack.org, linux-pci@vger.kernel.org, Logan Gunthorpe
 <logang@deltatee.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Robin
 Murphy <robin.murphy@arm.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH v1 04/10] PCI/P2PDMA: Refactor to separate core P2P
 functionality from memory allocation
Message-ID: <20250806154214.1c2618e8.alex.williamson@redhat.com>
In-Reply-To: <cab5f1bfd64becafcc887107bb4386f2c8630ef3.1754311439.git.leon@kernel.org>
References: <cover.1754311439.git.leon@kernel.org>
 <cab5f1bfd64becafcc887107bb4386f2c8630ef3.1754311439.git.leon@kernel.org>
Organization: Red Hat
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: KD1kX-3UbTfoj39yKXLfOMR7uhgiBeRxigBX0TjjkHs_1754516538
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon,  4 Aug 2025 16:00:39 +0300
Leon Romanovsky <leon@kernel.org> wrote:

> From: Leon Romanovsky <leonro@nvidia.com>
> 
> Refactor the PCI P2PDMA subsystem to separate the core peer-to-peer DMA
> functionality from the optional memory allocation layer. This creates a
> two-tier architecture:
> 
> The core layer provides P2P mapping functionality for physical addresses
> based on PCI device MMIO BARs and integrates with the DMA API for
> mapping operations. This layer is required for all P2PDMA users.
> 
> The optional upper layer provides memory allocation capabilities
> including gen_pool allocator, struct page support, and sysfs interface
> for user space access.
> 
> This separation allows subsystems like VFIO to use only the core P2P
> mapping functionality without the overhead of memory allocation features
> they don't need. The core functionality is now available through the
> new pci_p2pdma_enable() function that returns a p2pdma_provider
> structure.
> 
> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> ---
>  drivers/pci/p2pdma.c       | 118 ++++++++++++++++++++++++++-----------
>  include/linux/pci-p2pdma.h |   5 ++
>  2 files changed, 89 insertions(+), 34 deletions(-)
> 
> diff --git a/drivers/pci/p2pdma.c b/drivers/pci/p2pdma.c
> index 176a99232fdca..24a6c8ff88520 100644
> --- a/drivers/pci/p2pdma.c
> +++ b/drivers/pci/p2pdma.c
> @@ -25,11 +25,12 @@ struct pci_p2pdma {
>  	struct gen_pool *pool;
>  	bool p2pmem_published;
>  	struct xarray map_types;
> +	struct p2pdma_provider mem;
>  };
>  
>  struct pci_p2pdma_pagemap {
>  	struct dev_pagemap pgmap;
> -	struct p2pdma_provider mem;
> +	struct p2pdma_provider *mem;
>  };
>  
>  static struct pci_p2pdma_pagemap *to_p2p_pgmap(struct dev_pagemap *pgmap)
> @@ -204,7 +205,7 @@ static void p2pdma_page_free(struct page *page)
>  	struct pci_p2pdma_pagemap *pgmap = to_p2p_pgmap(page_pgmap(page));
>  	/* safe to dereference while a reference is held to the percpu ref */
>  	struct pci_p2pdma *p2pdma = rcu_dereference_protected(
> -		to_pci_dev(pgmap->mem.owner)->p2pdma, 1);
> +		to_pci_dev(pgmap->mem->owner)->p2pdma, 1);
>  	struct percpu_ref *ref;
>  
>  	gen_pool_free_owner(p2pdma->pool, (uintptr_t)page_to_virt(page),
> @@ -227,44 +228,82 @@ static void pci_p2pdma_release(void *data)
>  
>  	/* Flush and disable pci_alloc_p2p_mem() */
>  	pdev->p2pdma = NULL;
> -	synchronize_rcu();
> +	if (p2pdma->pool)
> +		synchronize_rcu();
> +	xa_destroy(&p2pdma->map_types);
> +
> +	if (!p2pdma->pool)
> +		return;
>  
>  	gen_pool_destroy(p2pdma->pool);
>  	sysfs_remove_group(&pdev->dev.kobj, &p2pmem_group);
> -	xa_destroy(&p2pdma->map_types);
>  }
>  
> -static int pci_p2pdma_setup(struct pci_dev *pdev)
> +/**
> + * pci_p2pdma_enable - Enable peer-to-peer DMA support for a PCI device
> + * @pdev: The PCI device to enable P2PDMA for
> + *
> + * This function initializes the peer-to-peer DMA infrastructure for a PCI
> + * device. It allocates and sets up the necessary data structures to support
> + * P2PDMA operations, including mapping type tracking.
> + */
> +struct p2pdma_provider *pci_p2pdma_enable(struct pci_dev *pdev)
>  {
> -	int error = -ENOMEM;
>  	struct pci_p2pdma *p2p;
> +	int ret;
> +
> +	p2p = rcu_dereference_protected(pdev->p2pdma, 1);
> +	if (p2p)
> +		/* PCI device was "rebound" to the driver */
> +		return &p2p->mem;
>  
>  	p2p = devm_kzalloc(&pdev->dev, sizeof(*p2p), GFP_KERNEL);
>  	if (!p2p)
> -		return -ENOMEM;
> +		return ERR_PTR(-ENOMEM);
>  
>  	xa_init(&p2p->map_types);
> +	p2p->mem.owner = &pdev->dev;
> +	/* On all p2p platforms bus_offset is the same for all BARs */
> +	p2p->mem.bus_offset =
> +		pci_bus_address(pdev, 0) - pci_resource_start(pdev, 0);

But not all devices implement BAR0, nor is BAR0 necessarily in the
memory space, wouldn't this calculation be wrong if BAR0 were
unimplemented or an IO BAR?  Even within memory BARs I can imagine
different translations for 32 vs 64 bit, prefetch vs non-prefetch, but
per the comment I guess we're excluding those.  Thanks,

Alex

