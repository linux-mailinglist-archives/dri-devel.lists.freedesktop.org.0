Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A00517FD73B
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 13:55:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 858B289A86;
	Wed, 29 Nov 2023 12:55:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCC5B10E1CA;
 Wed, 29 Nov 2023 12:55:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C2512615B9;
 Wed, 29 Nov 2023 12:55:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E359C433C8;
 Wed, 29 Nov 2023 12:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701262523;
 bh=EjcKHBcdIRPeS1Jr3Xl1RByJy2jdZRnaeHgtLca5xvw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=B7LzFukE5dLDnjFimKjS9MzsDlyjw2TystsfEqKZQoF3X0ypDR27ShYPrtl8a4hDA
 NJpjxQGGyxZWEsXW8iuNcZhKohbcA/aqSnTm0M4FaNA2iGO+NYSrUn6Py4Nri/ePlp
 6q+xpqSCX/D4UrdrxiaqNtzCTiHavix0EiBQCRhmLqMpgR0ZYgs/JzAEoWb+9i5JTB
 Oe+1+75v5eXMmJzgFHrdDl81TfuAg+2NbIX93el81U7iGTeg6IV4SGN5q4PuHW91Kd
 ubXJDdo+ZPM5cWSGL7AsbHeYdmv+aYCsKzrJkAOks6DDY5k/SnNe6msZhjyp96wYb4
 GEiHLnbD5cmcA==
Date: Wed, 29 Nov 2023 13:55:04 +0100
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH 10/10] ACPI: IORT: Allow COMPILE_TEST of IORT
Message-ID: <ZWc0qPWzNWPkL8vt@lpieralisi>
References: <0-v1-720585788a7d+811b-iommu_fwspec_p1_jgg@nvidia.com>
 <10-v1-720585788a7d+811b-iommu_fwspec_p1_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <10-v1-720585788a7d+811b-iommu_fwspec_p1_jgg@nvidia.com>
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
Cc: linux-hyperv@vger.kernel.org, Karol Herbst <kherbst@redhat.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Jerry Snitselaar <jsnitsel@redhat.com>, dri-devel@lists.freedesktop.org,
 patches@lists.linux.dev, Laxman Dewangan <ldewangan@nvidia.com>,
 Hanjun Guo <guohanjun@huawei.com>, linux-riscv@lists.infradead.org,
 "K. Y. Srinivasan" <kys@microsoft.com>, Frank Rowand <frowand.list@gmail.com>,
 Christoph Hellwig <hch@lst.de>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Wei Liu <wei.liu@kernel.org>,
 Joerg Roedel <joro@8bytes.org>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Dexuan Cui <decui@microsoft.com>, Russell King <linux@armlinux.org.uk>,
 Jon Hunter <jonathanh@nvidia.com>, linux-acpi@vger.kernel.org,
 iommu@lists.linux.dev, Danilo Krummrich <dakr@redhat.com>,
 nouveau@lists.freedesktop.org, linux-snps-arc@lists.infradead.org,
 Len Brown <lenb@kernel.org>, devicetree@vger.kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Will Deacon <will@kernel.org>, Sven Peter <sven@svenpeter.dev>,
 Haiyang Zhang <haiyangz@microsoft.com>, Vineet Gupta <vgupta@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Moritz Fischer <mdf@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Vinod Koul <vkoul@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Robin Murphy <robin.murphy@arm.com>, Hector Martin <marcan@marcan.st>,
 linux-mips@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 asahi@lists.linux.dev, Sudeep Holla <sudeep.holla@arm.com>,
 dmaengine@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>,
 Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 28, 2023 at 08:48:06PM -0400, Jason Gunthorpe wrote:
> The arm-smmu driver can COMPILE_TEST on x86, so expand this to also
> enable the IORT code so it can be COMPILE_TEST'd too.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/acpi/Kconfig        | 2 --
>  drivers/acpi/Makefile       | 2 +-
>  drivers/acpi/arm64/Kconfig  | 1 +
>  drivers/acpi/arm64/Makefile | 2 +-
>  drivers/iommu/Kconfig       | 1 +
>  5 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/acpi/Kconfig b/drivers/acpi/Kconfig
> index f819e760ff195a..3b7f77b227d13a 100644
> --- a/drivers/acpi/Kconfig
> +++ b/drivers/acpi/Kconfig
> @@ -541,9 +541,7 @@ config ACPI_PFRUT
>  	  To compile the drivers as modules, choose M here:
>  	  the modules will be called pfr_update and pfr_telemetry.
>  
> -if ARM64
>  source "drivers/acpi/arm64/Kconfig"
> -endif
>  
>  config ACPI_PPTT
>  	bool
> diff --git a/drivers/acpi/Makefile b/drivers/acpi/Makefile
> index eaa09bf52f1760..4e77ae37b80726 100644
> --- a/drivers/acpi/Makefile
> +++ b/drivers/acpi/Makefile
> @@ -127,7 +127,7 @@ obj-y				+= pmic/
>  video-objs			+= acpi_video.o video_detect.o
>  obj-y				+= dptf/
>  
> -obj-$(CONFIG_ARM64)		+= arm64/
> +obj-y				+= arm64/
>  
>  obj-$(CONFIG_ACPI_VIOT)		+= viot.o
>  
> diff --git a/drivers/acpi/arm64/Kconfig b/drivers/acpi/arm64/Kconfig
> index b3ed6212244c1e..537d49d8ace69e 100644
> --- a/drivers/acpi/arm64/Kconfig
> +++ b/drivers/acpi/arm64/Kconfig
> @@ -11,6 +11,7 @@ config ACPI_GTDT
>  
>  config ACPI_AGDI
>  	bool "Arm Generic Diagnostic Dump and Reset Device Interface"
> +	depends on ARM64
>  	depends on ARM_SDE_INTERFACE
>  	help
>  	  Arm Generic Diagnostic Dump and Reset Device Interface (AGDI) is
> diff --git a/drivers/acpi/arm64/Makefile b/drivers/acpi/arm64/Makefile
> index 143debc1ba4a9d..71d0e635599390 100644
> --- a/drivers/acpi/arm64/Makefile
> +++ b/drivers/acpi/arm64/Makefile
> @@ -4,4 +4,4 @@ obj-$(CONFIG_ACPI_IORT) 	+= iort.o
>  obj-$(CONFIG_ACPI_GTDT) 	+= gtdt.o
>  obj-$(CONFIG_ACPI_APMT) 	+= apmt.o
>  obj-$(CONFIG_ARM_AMBA)		+= amba.o
> -obj-y				+= dma.o init.o
> +obj-$(CONFIG_ARM64)		+= dma.o init.o
> diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
> index 7673bb82945b6c..309378e76a9bc9 100644
> --- a/drivers/iommu/Kconfig
> +++ b/drivers/iommu/Kconfig
> @@ -318,6 +318,7 @@ config ARM_SMMU
>  	select IOMMU_API
>  	select IOMMU_IO_PGTABLE_LPAE
>  	select ARM_DMA_USE_IOMMU if ARM
> +	select ACPI_IORT if ACPI
>  	help
>  	  Support for implementations of the ARM System MMU architecture
>  	  versions 1 and 2.
> -- 

I don't think it should be done this way. Is the goal compile testing
IORT code ? If so, why are we forcing it through the SMMU (only because
it can be compile tested while eg SMMUv3 driver can't ?) menu entry ?

This looks a bit artificial (and it is unclear from the Kconfig
file why only that driver selects IORT, it looks like eg the SMMUv3
does not have the same dependency - there is also the SMMUv3 perf
driver to consider).

Maybe we can move IORT code into drivers/acpi and add a silent config
option there with a dependency on ARM64 || COMPILE_TEST.

Don't know but at least it is clearer. As for the benefits of compile
testing IORT code - yes the previous patch is a warning to fix but
I am not so sure about the actual benefits.

Thanks,
Lorenzo
