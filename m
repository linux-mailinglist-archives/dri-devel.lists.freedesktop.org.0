Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 521517FED91
	for <lists+dri-devel@lfdr.de>; Thu, 30 Nov 2023 12:12:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 422EC10E2D3;
	Thu, 30 Nov 2023 11:12:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DBC510E15C;
 Thu, 30 Nov 2023 11:12:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 98D2961E51;
 Thu, 30 Nov 2023 11:12:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEC73C433C7;
 Thu, 30 Nov 2023 11:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701342762;
 bh=GGfXE9jnMr/28RJ1AbOcy/7HFYYF7xL3m95Mfm15Tps=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hS29cAaeUtXdeK+kiZWZ8qW3M4rlyGHM7IrFWTDxn8Nt0aXiAvnbAmRc/aoZ3Gp0j
 V7SRDf/8hQJMNOEslGbmVEQwuQ3v/n0aab4QU6apKhqRzbBW1fGVCc4o5+lNiYt0iI
 /7/amZz6HtQ5TNJ7z/1iEkJX2GzxXQ/d0Y8W3VVN2EeZqpbt6InWklo12ZeEHk9H/Z
 dLnoiGTasJF7l2Ws/GUmhIMMkZ/lsrZ8w7RC7r6TB1mn3zon1xzXFqjFmv6WUa2sKK
 u5jJfB5MNcKrcJC5o7DP2m9wYEaZRsNjXWMH0W1KpYnQMkdMULlFup8a//0ud2c0XX
 Dh6gxHxqd0DdA==
Date: Thu, 30 Nov 2023 12:12:26 +0100
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH 10/10] ACPI: IORT: Allow COMPILE_TEST of IORT
Message-ID: <ZWhuGl1l5V5b+w4P@lpieralisi>
References: <0-v1-720585788a7d+811b-iommu_fwspec_p1_jgg@nvidia.com>
 <10-v1-720585788a7d+811b-iommu_fwspec_p1_jgg@nvidia.com>
 <ZWc0qPWzNWPkL8vt@lpieralisi> <20231129191240.GZ436702@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231129191240.GZ436702@nvidia.com>
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
 linux-mips@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Laxman Dewangan <ldewangan@nvidia.com>, Hanjun Guo <guohanjun@huawei.com>,
 linux-riscv@lists.infradead.org, "K. Y. Srinivasan" <kys@microsoft.com>,
 Frank Rowand <frowand.list@gmail.com>, Christoph Hellwig <hch@lst.de>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Wei Liu <wei.liu@kernel.org>,
 Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Dexuan Cui <decui@microsoft.com>, Russell King <linux@armlinux.org.uk>,
 Jon Hunter <jonathanh@nvidia.com>, linux-acpi@vger.kernel.org,
 iommu@lists.linux.dev, Danilo Krummrich <dakr@redhat.com>,
 nouveau@lists.freedesktop.org, linux-snps-arc@lists.infradead.org,
 Len Brown <lenb@kernel.org>, devicetree@vger.kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>, Sven Peter <sven@svenpeter.dev>,
 Haiyang Zhang <haiyangz@microsoft.com>, Vineet Gupta <vgupta@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Moritz Fischer <mdf@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 David Woodhouse <dwmw2@infradead.org>, Hector Martin <marcan@marcan.st>,
 patches@lists.linux.dev, Vinod Koul <vkoul@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 asahi@lists.linux.dev, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Sudeep Holla <sudeep.holla@arm.com>, dmaengine@vger.kernel.org,
 Robin Murphy <robin.murphy@arm.com>, Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 29, 2023 at 03:12:40PM -0400, Jason Gunthorpe wrote:
> On Wed, Nov 29, 2023 at 01:55:04PM +0100, Lorenzo Pieralisi wrote:
> 
> > I don't think it should be done this way. Is the goal compile testing
> > IORT code ? 
> 
> Yes
> 
> > If so, why are we forcing it through the SMMU (only because
> > it can be compile tested while eg SMMUv3 driver can't ?) menu entry ?
> 
> Because something needs to select it, and SMMU is one of the places
> that are implicitly using it.
> 
> It isn't (and shouldn't be) a user selectable kconfig. Currently the
> only thing that selects it is the ARM64 master kconfig.

I never said it should be a user selectable kconfig. I said that
I don't like using the SMMU entry (only) to select it just because
that entry allows COMPILE_TEST.

> > This looks a bit artificial (and it is unclear from the Kconfig
> > file why only that driver selects IORT, it looks like eg the SMMUv3
> > does not have the same dependency - there is also the SMMUv3 perf
> > driver to consider).
> 
> SMMUv3 doesn't COMPILE_TEST so it picks up the dependency transitivity
> through ARM64. I'm not sure why IORT was put as a global ARM64 kconfig
> dependency and not put in the places that directly need it.

Because IORT is used by few ARM64 system IPs (that are enabled by
default, eg GIC), it makes sense to have a generic ARM64 select (if ACPI).

> "perf driver" ? There is a bunch of GIC stuff that uses this too but I
> don't know if it compile tests.

"SMMUv3 perf driver" drivers/perf/arm_smmuv3_pmu.c

> > Maybe we can move IORT code into drivers/acpi and add a silent config
> > option there with a dependency on ARM64 || COMPILE_TEST.
> 
> That seems pretty weird to me, this is the right way to approach it,
> IMHO. Making an entire directory condition is pretty incompatible with
> COMPILE_TEST as a philosophy.

That's not what I was suggesting. I was suggesting to move iort.c (or
some portions of it) into drivers/acpi if we care enough to compile test
it on arches !ARM64.

It is also weird to have a file in drivers/acpi/arm64 that you want
to compile test on other arches IMO (and I don't think it is very useful
to compile test it either).

> > Don't know but at least it is clearer. As for the benefits of compile
> > testing IORT code - yes the previous patch is a warning to fix but
> > I am not so sure about the actual benefits.
> 
> IMHO COMPILE_TEST is an inherently good thing. It makes development
> easier for everyone because you have a less fractured code base to
> work with.

I am talking about IORT code, not COMPILE_TEST as a whole.

I am not sure what "less fractured" means in this context.

Anyway - it is not a big deal either way but I don't like selecting
ACPI_IORT only on kconfig entries that allow COMPILE_TEST to implicitly
compile test it so *if* we want to do it we will have to do it
differently.

Thanks,
Lorenzo
