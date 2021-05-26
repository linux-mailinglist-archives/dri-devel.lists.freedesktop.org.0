Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C051E391727
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 14:13:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E1546E1B4;
	Wed, 26 May 2021 12:13:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44FE96E1B4;
 Wed, 26 May 2021 12:13:34 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7DB6A613D6;
 Wed, 26 May 2021 12:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622031214;
 bh=6cgAAAry3KXjHYICFlfgug7HP7MtfiezqAbh5vyjbAk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dD4raOXl4m/1dmUYxCXd+9Zhh/XbrtQC52Qny8ZwVBaqmrNGpiCc5ZIU1b4WjGm8H
 uJa3jIZybN6M6kTMpAfuccsLT4/wRQbg2MVSjmE1yL01mC3lcM16NVvL5naGjFRQ57
 RUc8/qmG6+LKY4mt6jNuAHGXfU60PflHdIRn81RXVX/L8quJSpzl4wYs9fdYRMYSyz
 TDHUTCxqGOaTMeMxI6d2iUlniRYHOiu06+32s75wchffQ8s3cbbJwvz7Jm6fWP5KI+
 RznUS6G8WImqfu6sIHm02R4cmQSm1/c2dk4BLfXSL89hrwovsmQduosVw5UITnC7eb
 z+DGv0xJWhG6g==
Date: Wed, 26 May 2021 13:13:23 +0100
From: Will Deacon <will@kernel.org>
To: Claire Chang <tientzu@chromium.org>
Subject: Re: [PATCH v7 14/15] dt-bindings: of: Add restricted DMA pool
Message-ID: <20210526121322.GA19313@willie-the-truck>
References: <20210518064215.2856977-1-tientzu@chromium.org>
 <20210518064215.2856977-15-tientzu@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210518064215.2856977-15-tientzu@chromium.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
 Frank Rowand <frowand.list@gmail.com>, mingo@kernel.org,
 Marek Szyprowski <m.szyprowski@samsung.com>, sstabellini@kernel.org,
 Saravana Kannan <saravanak@google.com>, mpe@ellerman.id.au,
 Joerg Roedel <joro@8bytes.org>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Christoph Hellwig <hch@lst.de>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, bskeggs@redhat.com,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 Thierry Reding <treding@nvidia.com>, intel-gfx@lists.freedesktop.org,
 matthew.auld@intel.com, linux-devicetree <devicetree@vger.kernel.org>,
 jxgao@google.com, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 airlied@linux.ie, Dan Williams <dan.j.williams@intel.com>,
 linuxppc-dev@lists.ozlabs.org, Rob Herring <robh+dt@kernel.org>,
 rodrigo.vivi@intel.com, bhelgaas@google.com, boris.ostrovsky@oracle.com,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, jgross@suse.com,
 Nicolas Boichat <drinkcat@chromium.org>, Greg KH <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, lkml <linux-kernel@vger.kernel.org>,
 tfiga@chromium.org,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Jim Quinlan <james.quinlan@broadcom.com>, xypron.glpk@gmx.de,
 Robin Murphy <robin.murphy@arm.com>, bauerman@linux.ibm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Claire,

On Tue, May 18, 2021 at 02:42:14PM +0800, Claire Chang wrote:
> Introduce the new compatible string, restricted-dma-pool, for restricted
> DMA. One can specify the address and length of the restricted DMA memory
> region by restricted-dma-pool in the reserved-memory node.
> 
> Signed-off-by: Claire Chang <tientzu@chromium.org>
> ---
>  .../reserved-memory/reserved-memory.txt       | 27 +++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt b/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
> index e8d3096d922c..284aea659015 100644
> --- a/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
> +++ b/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
> @@ -51,6 +51,23 @@ compatible (optional) - standard definition
>            used as a shared pool of DMA buffers for a set of devices. It can
>            be used by an operating system to instantiate the necessary pool
>            management subsystem if necessary.
> +        - restricted-dma-pool: This indicates a region of memory meant to be
> +          used as a pool of restricted DMA buffers for a set of devices. The
> +          memory region would be the only region accessible to those devices.
> +          When using this, the no-map and reusable properties must not be set,
> +          so the operating system can create a virtual mapping that will be used
> +          for synchronization. The main purpose for restricted DMA is to
> +          mitigate the lack of DMA access control on systems without an IOMMU,
> +          which could result in the DMA accessing the system memory at
> +          unexpected times and/or unexpected addresses, possibly leading to data
> +          leakage or corruption. The feature on its own provides a basic level
> +          of protection against the DMA overwriting buffer contents at
> +          unexpected times. However, to protect against general data leakage and
> +          system memory corruption, the system needs to provide way to lock down
> +          the memory access, e.g., MPU. Note that since coherent allocation
> +          needs remapping, one must set up another device coherent pool by
> +          shared-dma-pool and use dma_alloc_from_dev_coherent instead for atomic
> +          coherent allocation.
>          - vendor specific string in the form <vendor>,[<device>-]<usage>
>  no-map (optional) - empty property
>      - Indicates the operating system must not create a virtual mapping
> @@ -120,6 +137,11 @@ one for multimedia processing (named multimedia-memory@77000000, 64MiB).
>  			compatible = "acme,multimedia-memory";
>  			reg = <0x77000000 0x4000000>;
>  		};
> +
> +		restricted_dma_mem_reserved: restricted_dma_mem_reserved {
> +			compatible = "restricted-dma-pool";
> +			reg = <0x50000000 0x400000>;
> +		};

nit: You need to update the old text that states "This example defines 3
contiguous regions ...".

>  	};
>  
>  	/* ... */
> @@ -138,4 +160,9 @@ one for multimedia processing (named multimedia-memory@77000000, 64MiB).
>  		memory-region = <&multimedia_reserved>;
>  		/* ... */
>  	};
> +
> +	pcie_device: pcie_device@0,0 {
> +		memory-region = <&restricted_dma_mem_reserved>;
> +		/* ... */
> +	};

I still don't understand how this works for individual PCIe devices -- how
is dev->of_node set to point at the node you have above?

I tried adding the memory-region to the host controller instead, and then
I see it crop up in dmesg:

  | pci-host-generic 40000000.pci: assigned reserved memory node restricted_dma_mem_reserved

but none of the actual PCI devices end up with 'dma_io_tlb_mem' set, and
so the restricted DMA area is not used. In fact, swiotlb isn't used at all.

What am I missing to make this work with PCIe devices?

Thanks,

Will
