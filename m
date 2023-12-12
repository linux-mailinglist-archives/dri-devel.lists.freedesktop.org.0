Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9904C80E785
	for <lists+dri-devel@lfdr.de>; Tue, 12 Dec 2023 10:26:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B46B610E11C;
	Tue, 12 Dec 2023 09:26:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 400 seconds by postgrey-1.36 at gabe;
 Tue, 12 Dec 2023 09:26:08 UTC
Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3815E10E105;
 Tue, 12 Dec 2023 09:26:08 +0000 (UTC)
Received: from 8bytes.org (p4ffe1e67.dip0.t-ipconnect.de [79.254.30.103])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPSA id 985681A4F1D;
 Tue, 12 Dec 2023 10:19:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
 s=default; t=1702372767;
 bh=bEwFfSnf2RFnsUSszwfjtJnyVAQAG+2ku4jSVsqYtho=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=abG4gKivOGRZ/AI3r3S4ykAogD7/67qJfPpecLXixxPdCLvNaaHplc2zY7kr49dVW
 //lK3CmDXn8kgeq/V0CZR9ktKlB8X0k+ITJm0ltQTznpuMo6Vb74aQpMwh3nTTGVkp
 Vy6AfWo4XcQNBdkAhhR+006eTJRikgSpnu1zxfyJ76UClAzcqQ5x8fI3bS/syUfk5j
 4EzlogNC4F5cinu2gbIPFhhEV/M0hyHlrd2XxZSENppE6ttNDQtHQ8JgEKvxnsEjaT
 tGQK7YmKPtfzARKk+wVIW1dNCyoJC63TSQbXOzaQtz4LM+81hJrx/weWcfjW4iINH9
 K1OBYT39fG51A==
Date: Tue, 12 Dec 2023 10:19:25 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v2 0/7] IOMMU related FW parsing cleanup
Message-ID: <ZXglne-jYLXHZbtn@8bytes.org>
References: <0-v2-16e4def25ebb+820-iommu_fwspec_p1_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0-v2-16e4def25ebb+820-iommu_fwspec_p1_jgg@nvidia.com>
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
 Catalin Marinas <catalin.marinas@arm.com>, Moritz Fischer <moritzf@google.com>,
 Jerry Snitselaar <jsnitsel@redhat.com>, dri-devel@lists.freedesktop.org,
 patches@lists.linux.dev, Laxman Dewangan <ldewangan@nvidia.com>,
 linux-riscv@lists.infradead.org, "K. Y. Srinivasan" <kys@microsoft.com>,
 Frank Rowand <frowand.list@gmail.com>, Christoph Hellwig <hch@lst.de>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Wei Liu <wei.liu@kernel.org>,
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
 linux-mips@vger.kernel.org, Thierry Reding <treding@nvidia.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 asahi@lists.linux.dev, dmaengine@vger.kernel.org,
 David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 07, 2023 at 02:03:07PM -0400, Jason Gunthorpe wrote:
> Jason Gunthorpe (7):
>   iommu: Remove struct iommu_ops *iommu from arch_setup_dma_ops()
>   iommmu/of: Do not return struct iommu_ops from of_iommu_configure()
>   iommu/of: Use -ENODEV consistently in of_iommu_configure()
>   iommu: Mark dev_iommu_get() with lockdep
>   iommu: Mark dev_iommu_priv_set() with a lockdep
>   acpi: Do not return struct iommu_ops from acpi_iommu_configure_id()
>   iommu/tegra: Use tegra_dev_iommu_get_stream_id() in the remaining
>     places

Applied, thanks.
