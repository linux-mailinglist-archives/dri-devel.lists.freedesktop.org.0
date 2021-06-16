Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67BE43A9231
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jun 2021 08:25:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4FED6E4F4;
	Wed, 16 Jun 2021 06:25:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F38A6E4F1
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jun 2021 06:25:48 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id e22so1110075pgv.10
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jun 2021 23:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ahYpHO9B/+cUbYyFJd5R0IQOMPNRU7XLvRaVxvXYrwA=;
 b=jKYxRf5BLwVd+aOILdWyEQ9NEe6v5aYFQD8W2wYKnYxbx/kY+mKyD67t59FT+p6nN5
 Mpk6mfOcBOKrQiveQedh4qw5JCQtFiqVzV2RVlhONm9wznK7lpmoPFuDVcf3/tc5Ov2+
 CFj22Re2YUg+UI7p9tNWP8f+4QqCG/oIc1mEo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ahYpHO9B/+cUbYyFJd5R0IQOMPNRU7XLvRaVxvXYrwA=;
 b=LH6IVb1IyXoschSlBrZwJ6QecibKodtIfqNM+aLPgys1kiiaufbHjLHWxvhLwuw/VR
 +SZCzVo3yR8ZVOya7+EN9vYt37SF+dyDEqkFtod41uA2gFMmyMwxGaG3VM9TZRtLyg6K
 qBo4VUUtg+bGPnKfzWgLTEmI57sjU2U4r51HvgK+GUHIjWx0Uwcm1qq/GRR/P1NGctJY
 zJ1dRg73KTpIXE+tm9NXgmw6d4UAk/UVu6miui3Iq+7B3HrJ4UbsaeRo9R3iU1VbGLsL
 M/LyRMoPbdBPTAQqVt0bFt+VB5c9i4reZ9UqpeMQbnYwD3+7Rme3lmGJnpi/IHjZA87W
 QpAA==
X-Gm-Message-State: AOAM532FTUPCmz5aqdqZRJBEX+Goz5yUtSQGxbGxKXQQakA6iuHLs/fJ
 yW0s6UAHA7Qku0617jWXVbI35Ve8nAlL9g==
X-Google-Smtp-Source: ABdhPJwZtwOpRD5eRKKGkEBT+Cz/GiVV0HHWyxCM7fRnSBn+6J6ypZBQb8NT0UE0S8h7xged8Aa5ZA==
X-Received: by 2002:a63:5511:: with SMTP id j17mr3494540pgb.191.1623824747744; 
 Tue, 15 Jun 2021 23:25:47 -0700 (PDT)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com.
 [209.85.215.177])
 by smtp.gmail.com with ESMTPSA id b6sm1100151pgw.67.2021.06.15.23.25.46
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jun 2021 23:25:47 -0700 (PDT)
Received: by mail-pg1-f177.google.com with SMTP id q15so1107657pgg.12
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jun 2021 23:25:46 -0700 (PDT)
X-Received: by 2002:a05:6e02:e8d:: with SMTP id
 t13mr2425681ilj.189.1623824734590; 
 Tue, 15 Jun 2021 23:25:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210616035240.840463-1-tientzu@chromium.org>
In-Reply-To: <20210616035240.840463-1-tientzu@chromium.org>
From: Claire Chang <tientzu@chromium.org>
Date: Wed, 16 Jun 2021 14:25:23 +0800
X-Gmail-Original-Message-ID: <CALiNf29qdqmk4Uzysz3VfGd=QcQse8Hu0MajcMeOauykxMyqXg@mail.gmail.com>
Message-ID: <CALiNf29qdqmk4Uzysz3VfGd=QcQse8Hu0MajcMeOauykxMyqXg@mail.gmail.com>
Subject: Re: [PATCH v11 00/12] Restricted DMA
To: Rob Herring <robh+dt@kernel.org>, mpe@ellerman.id.au,
 Joerg Roedel <joro@8bytes.org>, 
 Will Deacon <will@kernel.org>, Frank Rowand <frowand.list@gmail.com>, 
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, boris.ostrovsky@oracle.com,
 jgross@suse.com, 
 Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>
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
Cc: heikki.krogerus@linux.intel.com, thomas.hellstrom@linux.intel.com,
 peterz@infradead.org, dri-devel@lists.freedesktop.org,
 chris@chris-wilson.co.uk, grant.likely@arm.com, paulus@samba.org,
 mingo@kernel.org, Jianxiong Gao <jxgao@google.com>, sstabellini@kernel.org,
 Saravana Kannan <saravanak@google.com>, xypron.glpk@gmx.de,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, bskeggs@redhat.com,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 Thierry Reding <treding@nvidia.com>, intel-gfx@lists.freedesktop.org,
 matthew.auld@intel.com, linux-devicetree <devicetree@vger.kernel.org>,
 airlied@linux.ie, Robin Murphy <robin.murphy@arm.com>,
 Nicolas Boichat <drinkcat@chromium.org>, rodrigo.vivi@intel.com,
 Bjorn Helgaas <bhelgaas@google.com>, Dan Williams <dan.j.williams@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Greg KH <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 lkml <linux-kernel@vger.kernel.org>, Tomasz Figa <tfiga@chromium.org>,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Jim Quinlan <james.quinlan@broadcom.com>, linuxppc-dev@lists.ozlabs.org,
 bauerman@linux.ibm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

v12: https://lore.kernel.org/patchwork/cover/1447254/

On Wed, Jun 16, 2021 at 11:52 AM Claire Chang <tientzu@chromium.org> wrote:
>
> This series implements mitigations for lack of DMA access control on
> systems without an IOMMU, which could result in the DMA accessing the
> system memory at unexpected times and/or unexpected addresses, possibly
> leading to data leakage or corruption.
>
> For example, we plan to use the PCI-e bus for Wi-Fi and that PCI-e bus is
> not behind an IOMMU. As PCI-e, by design, gives the device full access to
> system memory, a vulnerability in the Wi-Fi firmware could easily escalate
> to a full system exploit (remote wifi exploits: [1a], [1b] that shows a
> full chain of exploits; [2], [3]).
>
> To mitigate the security concerns, we introduce restricted DMA. Restricted
> DMA utilizes the existing swiotlb to bounce streaming DMA in and out of a
> specially allocated region and does memory allocation from the same region.
> The feature on its own provides a basic level of protection against the DMA
> overwriting buffer contents at unexpected times. However, to protect
> against general data leakage and system memory corruption, the system needs
> to provide a way to restrict the DMA to a predefined memory region (this is
> usually done at firmware level, e.g. MPU in ATF on some ARM platforms [4]).
>
> [1a] https://googleprojectzero.blogspot.com/2017/04/over-air-exploiting-broadcoms-wi-fi_4.html
> [1b] https://googleprojectzero.blogspot.com/2017/04/over-air-exploiting-broadcoms-wi-fi_11.html
> [2] https://blade.tencent.com/en/advisories/qualpwn/
> [3] https://www.bleepingcomputer.com/news/security/vulnerabilities-found-in-highly-popular-firmware-for-wifi-chips/
> [4] https://github.com/ARM-software/arm-trusted-firmware/blob/master/plat/mediatek/mt8183/drivers/emi_mpu/emi_mpu.c#L132
>
> v11:
> - Rebase against swiotlb devel/for-linus-5.14
> - s/mempry/memory/g
> - exchange the order of patch 09/12 and 10/12
> https://lore.kernel.org/patchwork/cover/1446882/
>
> v10:
> Address the comments in v9 to
>   - fix the dev->dma_io_tlb_mem assignment
>   - propagate swiotlb_force setting into io_tlb_default_mem->force
>   - move set_memory_decrypted out of swiotlb_init_io_tlb_mem
>   - move debugfs_dir declaration into the main CONFIG_DEBUG_FS block
>   - add swiotlb_ prefix to find_slots and release_slots
>   - merge the 3 alloc/free related patches
>   - move the CONFIG_DMA_RESTRICTED_POOL later
>
> v9:
> Address the comments in v7 to
>   - set swiotlb active pool to dev->dma_io_tlb_mem
>   - get rid of get_io_tlb_mem
>   - dig out the device struct for is_swiotlb_active
>   - move debugfs_create_dir out of swiotlb_create_debugfs
>   - do set_memory_decrypted conditionally in swiotlb_init_io_tlb_mem
>   - use IS_ENABLED in kernel/dma/direct.c
>   - fix redefinition of 'of_dma_set_restricted_buffer'
> https://lore.kernel.org/patchwork/cover/1445081/
>
> v8:
> - Fix reserved-memory.txt and add the reg property in example.
> - Fix sizeof for of_property_count_elems_of_size in
>   drivers/of/address.c#of_dma_set_restricted_buffer.
> - Apply Will's suggestion to try the OF node having DMA configuration in
>   drivers/of/address.c#of_dma_set_restricted_buffer.
> - Fix typo in the comment of drivers/of/address.c#of_dma_set_restricted_buffer.
> - Add error message for PageHighMem in
>   kernel/dma/swiotlb.c#rmem_swiotlb_device_init and move it to
>   rmem_swiotlb_setup.
> - Fix the message string in rmem_swiotlb_setup.
> https://lore.kernel.org/patchwork/cover/1437112/
>
> v7:
> Fix debugfs, PageHighMem and comment style in rmem_swiotlb_device_init
> https://lore.kernel.org/patchwork/cover/1431031/
>
> v6:
> Address the comments in v5
> https://lore.kernel.org/patchwork/cover/1423201/
>
> v5:
> Rebase on latest linux-next
> https://lore.kernel.org/patchwork/cover/1416899/
>
> v4:
> - Fix spinlock bad magic
> - Use rmem->name for debugfs entry
> - Address the comments in v3
> https://lore.kernel.org/patchwork/cover/1378113/
>
> v3:
> Using only one reserved memory region for both streaming DMA and memory
> allocation.
> https://lore.kernel.org/patchwork/cover/1360992/
>
> v2:
> Building on top of swiotlb.
> https://lore.kernel.org/patchwork/cover/1280705/
>
> v1:
> Using dma_map_ops.
> https://lore.kernel.org/patchwork/cover/1271660/
>
> Claire Chang (12):
>   swiotlb: Refactor swiotlb init functions
>   swiotlb: Refactor swiotlb_create_debugfs
>   swiotlb: Set dev->dma_io_tlb_mem to the swiotlb pool used
>   swiotlb: Update is_swiotlb_buffer to add a struct device argument
>   swiotlb: Update is_swiotlb_active to add a struct device argument
>   swiotlb: Use is_dev_swiotlb_force for swiotlb data bouncing
>   swiotlb: Move alloc_size to swiotlb_find_slots
>   swiotlb: Refactor swiotlb_tbl_unmap_single
>   swiotlb: Add restricted DMA alloc/free support
>   swiotlb: Add restricted DMA pool initialization
>   dt-bindings: of: Add restricted DMA pool
>   of: Add plumbing for restricted DMA pool
>
>  .../reserved-memory/reserved-memory.txt       |  36 ++-
>  drivers/base/core.c                           |   4 +
>  drivers/gpu/drm/i915/gem/i915_gem_internal.c  |   2 +-
>  drivers/gpu/drm/nouveau/nouveau_ttm.c         |   2 +-
>  drivers/iommu/dma-iommu.c                     |  12 +-
>  drivers/of/address.c                          |  33 +++
>  drivers/of/device.c                           |   3 +
>  drivers/of/of_private.h                       |   6 +
>  drivers/pci/xen-pcifront.c                    |   2 +-
>  drivers/xen/swiotlb-xen.c                     |   2 +-
>  include/linux/device.h                        |   4 +
>  include/linux/swiotlb.h                       |  40 ++-
>  kernel/dma/Kconfig                            |  14 +
>  kernel/dma/direct.c                           |  60 +++--
>  kernel/dma/direct.h                           |   8 +-
>  kernel/dma/swiotlb.c                          | 255 +++++++++++++-----
>  16 files changed, 380 insertions(+), 103 deletions(-)
>
> --
> 2.32.0.272.g935e593368-goog
>
