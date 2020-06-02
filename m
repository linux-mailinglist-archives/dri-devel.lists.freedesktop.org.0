Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 563051EC56E
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jun 2020 01:06:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B7F46E231;
	Tue,  2 Jun 2020 23:06:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79E7C6E231;
 Tue,  2 Jun 2020 23:06:10 +0000 (UTC)
Received: from localhost (mobile-166-175-190-200.mycingular.net
 [166.175.190.200])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C44632068D;
 Tue,  2 Jun 2020 23:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591139170;
 bh=dvLM3cdlal5jXxXjQhFjq4BA4K8flepdxyFABrfGsNg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=1P8ubDEnGAo40qhfTSIPqFWyX96gbQAhXR4omu0qaVZRc7OPm1IHBt4ueo7nBsRuX
 XFAumleRMMIPh2m5lMZfxRi2SAU/s8tsvqheYyICk59842a8XugF+QSPLzbIw133DP
 sAJ63k2KZBH14wWe8f4XyqVSmyGcCoQalRZ7wsv8=
Date: Tue, 2 Jun 2020 18:06:08 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Piotr Stankiewicz <piotr.stankiewicz@intel.com>
Subject: Re: [PATCH 00/15] forward MSIx vector enable error code in
 pci_alloc_irq_vectors_affinity
Message-ID: <20200602230608.GA868767@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200602091617.31395-1-piotr.stankiewicz@intel.com>
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Igor Russkikh <irusskikh@marvell.com>,
 linux-doc@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-pci@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jim Gill <jgill@vmware.com>, netdev@vger.kernel.org,
 Kurt Schwemmer <kurt.schwemmer@microsemi.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, linux-scsi@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, linux-rdma@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Jason Gunthorpe <jgg@ziepe.ca>,
 Doug Ledford <dledford@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 Yisen Zhuang <yisen.zhuang@huawei.com>, linux-media@vger.kernel.org,
 Tom Lendacky <thomas.lendacky@amd.com>, Arnd Bergmann <arnd@arndb.de>,
 Antoine Tenart <antoine.tenart@bootlin.com>, linux-kernel@vger.kernel.org,
 "James E . J . Bottomley" <jejb@linux.ibm.com>,
 Salil Mehta <salil.mehta@huawei.com>, dmaengine@vger.kernel.org,
 Brian King <brking@us.ibm.com>, VMware PV-Drivers <pv-drivers@vmware.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Jens Axboe <axboe@kernel.dk>,
 Mike Marciniszyn <mike.marciniszyn@intel.com>,
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 Dennis Dalessandro <dennis.dalessandro@intel.com>, linux-mmc@vger.kernel.org,
 Adrian Hunter <adrian.hunter@intel.com>,
 "David S . Miller" <davem@davemloft.net>, Vinod Koul <vkoul@kernel.org>,
 linux-crypto@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Logan Gunthorpe <logang@deltatee.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 02, 2020 at 11:16:17AM +0200, Piotr Stankiewicz wrote:
> The primary objective of this patch series is to change the behaviour
> of pci_alloc_irq_vectors_affinity such that it forwards the MSI-X enable
> error code when appropriate. In the process, though, it was pointed out
> that there are multiple places in the kernel which check/ask for message
> signalled interrupts (MSI or MSI-X), which spawned the first patch adding
> PCI_IRQ_MSI_TYPES. Finally the rest of the chain converts all users to
> take advantage of PCI_IRQ_MSI_TYPES or PCI_IRQ_ALL_TYPES, as
> appropriate.
> 
> Piotr Stankiewicz (15):
>   PCI: add shorthand define for message signalled interrupt types
>   PCI/MSI: forward MSIx vector enable error code in
>     pci_alloc_irq_vectors_affinity
>   PCI: use PCI_IRQ_MSI_TYPES where appropriate
>   ahci: use PCI_IRQ_MSI_TYPES where appropriate
>   crypto: inside-secure - use PCI_IRQ_MSI_TYPES where appropriate
>   dmaengine: dw-edma: use PCI_IRQ_MSI_TYPES  where appropriate
>   drm/amdgpu: use PCI_IRQ_MSI_TYPES where appropriate
>   IB/qib: Use PCI_IRQ_MSI_TYPES where appropriate
>   media: ddbridge: use PCI_IRQ_MSI_TYPES where appropriate
>   vmw_vmci: use PCI_IRQ_ALL_TYPES where appropriate
>   mmc: sdhci: use PCI_IRQ_MSI_TYPES where appropriate
>   amd-xgbe: use PCI_IRQ_MSI_TYPES where appropriate
>   aquantia: atlantic: use PCI_IRQ_ALL_TYPES where appropriate
>   net: hns3: use PCI_IRQ_MSI_TYPES where appropriate
>   scsi: use PCI_IRQ_MSI_TYPES and PCI_IRQ_ALL_TYPES where appropriate
> 
>  Documentation/PCI/msi-howto.rst                           | 5 +++--
>  drivers/ata/ahci.c                                        | 2 +-
>  drivers/crypto/inside-secure/safexcel.c                   | 2 +-
>  drivers/dma/dw-edma/dw-edma-pcie.c                        | 2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c                   | 8 ++++----
>  drivers/infiniband/hw/qib/qib_pcie.c                      | 2 +-
>  drivers/media/pci/ddbridge/ddbridge-main.c                | 2 +-
>  drivers/misc/vmw_vmci/vmci_guest.c                        | 3 +--
>  drivers/mmc/host/sdhci-pci-gli.c                          | 3 +--
>  drivers/mmc/host/sdhci-pci-o2micro.c                      | 3 +--
>  drivers/net/ethernet/amd/xgbe/xgbe-pci.c                  | 2 +-
>  drivers/net/ethernet/aquantia/atlantic/aq_pci_func.c      | 4 +---
>  drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c   | 3 +--
>  drivers/net/ethernet/hisilicon/hns3/hns3vf/hclgevf_main.c | 2 +-
>  drivers/pci/msi.c                                         | 4 ++--
>  drivers/pci/pcie/portdrv_core.c                           | 4 ++--
>  drivers/pci/switch/switchtec.c                            | 3 +--
>  drivers/scsi/ipr.c                                        | 2 +-
>  drivers/scsi/vmw_pvscsi.c                                 | 2 +-
>  include/linux/pci.h                                       | 4 ++--
>  20 files changed, 28 insertions(+), 34 deletions(-)

I think I'm OK with this, and since they all depend on the first PCI
patch, it will probably be easiest to merge them all through the PCI
tree.  I'm happy to do that, but can you please:

  - Update the subject lines so they start with a capital letter to
    match the historical convention.

  - Use "MSI-X" instead of "MSIx" so it matches the spec and other
    usage in the kernel.

  - Add "()" after function names, e.g.,
    "pci_alloc_irq_vectors_affinity()" instead of
    "pci_alloc_irq_vectors_affinity".

  - Reorder them so the actual fix (02/15) is first and the cleanups
    later.

  - Post them all to linux-pci (I only saw the drivers/pci patches).

  - If possible, post them with all the patches as replies to the
    cover letter.  These all appear to be unrelated messages, which
    makes it a bit of a hassle to collect them all up.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
