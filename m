Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3154CC49328
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 21:11:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2355A10E0D0;
	Mon, 10 Nov 2025 20:11:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=shazbot.org header.i=@shazbot.org header.b="P44njGbF";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="SNeUHhP4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fhigh-b7-smtp.messagingengine.com
 (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BC1810E1A3
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 20:11:04 +0000 (UTC)
Received: from phl-compute-07.internal (phl-compute-07.internal [10.202.2.47])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 75B2F7A0140;
 Mon, 10 Nov 2025 15:05:46 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-07.internal (MEProxy); Mon, 10 Nov 2025 15:05:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shazbot.org; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm2; t=1762805146;
 x=1762891546; bh=QWavr1Y4jetO7CpzWCAeEensv2XOEaKTErTM/rpJMIg=; b=
 P44njGbFkl3pOTaDtIZBVRumI3etEDzgSsJYEJ8FvFVsFvwvVLXMDMsvn6aUehvD
 tX23j4ZkuYzzNKblPl5eoRtBEwnsSMAgClGzI595rx7rUTrPQrccQGCdhtWJhilp
 DFNty4cB/vIdK2tbepFMl7R/oTdPaRpKD4aNfVR+Xglecv1lvs4o0i2y6hWz2K1k
 hjQOHjtCIZX9JmdHtiVpZ3ytfYqE4fFhMOL2BauRmP34rlF8J3bLqEyyVgUd1Wxf
 uivNmBy88n3BAYyUQvOeYyEMuRLR6HK6JD6EBQGVAM0wM0LqzVwMMkgCnjKZLOQg
 DgK238GhJfZEC29HeBHAiw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1762805146; x=
 1762891546; bh=QWavr1Y4jetO7CpzWCAeEensv2XOEaKTErTM/rpJMIg=; b=S
 NeUHhP4zFIIIq8T0qOoLspDmGo3aV7LstNjwQx/zOpqRPdikfwAhxZr1Vjza2V2E
 XW/K9QSUwZMXVc1cpd8LZrXLMFISDLbA0gMT9DzEKhBjwLHv5lFAfjRT83KCvDG0
 x+VbyV+GmrJlh9dG/d80U9KO5LcHh9ZfYF+WKaE8l/l8mwyerixOC3CYxhpxK7QT
 utY6WevmBVi4E+itP3599pH3VYKeulT8r4BhTOEtO8xRecVlR3ctKNC4jSXmtxvC
 2h7nADaicKEmXWPbqEmkAL4m9KLPQNtUHOf/1R6e0gVSWAnSSl3UOnKMj0isFnwa
 eNkSbkIGUulICAJOtYeAw==
X-ME-Sender: <xms:mUUSaaaK5cwS-xhU9OVo403uDM8aHpHjvUOkJEga3bQfJI6eFJYotw>
 <xme:mUUSaUOSdeHiAs0fTeiXjMbzaJmVlggDHFik_3fnmUbem9yoBi-ZjsckApbF86-U7
 ynkRiGLLEv74esQKOBTOEMDauyHwyQ0Mj3pKmcyAmMMdjGtG08YaQ>
X-ME-Received: <xmr:mUUSad4OyW2iSq-SNa365c0LP2qomzGAB1q2q49mc7CXAe2Fugl7AT7Z>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdduleelvddvucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
 gurhepfffhvfevuffkjghfgggtgfesthejredttddtvdenucfhrhhomheptehlvgigucgh
 ihhllhhirghmshhonhcuoegrlhgvgiesshhhrgiisghothdrohhrgheqnecuggftrfgrth
 htvghrnhepteetudelgeekieegudegleeuvdffgeehleeivddtfeektdekkeehffehudet
 hffhnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
 hlvgigsehshhgriigsohhtrdhorhhgpdhnsggprhgtphhtthhopeefgedpmhhouggvpehs
 mhhtphhouhhtpdhrtghpthhtoheplhgvohhnsehkvghrnhgvlhdrohhrghdprhgtphhtth
 hopegshhgvlhhgrggrshesghhoohhglhgvrdgtohhmpdhrtghpthhtoheplhhoghgrnhhg
 seguvghlthgrthgvvgdrtghomhdprhgtphhtthhopegrgigsohgvsehkvghrnhgvlhdrug
 hkpdhrtghpthhtoheprhhosghinhdrmhhurhhphhihsegrrhhmrdgtohhmpdhrtghpthht
 ohepjhhorhhoseeksgihthgvshdrohhrghdprhgtphhtthhopeifihhllheskhgvrhhnvg
 hlrdhorhhgpdhrtghpthhtohepmhdrshiihihprhhofihskhhisehsrghmshhunhhgrdgt
 ohhmpdhrtghpthhtohepjhhgghesiihivghpvgdrtggr
X-ME-Proxy: <xmx:mUUSafeToLKTsQbuLZM6kEmGdnK__q1ufNj_7mjY6TPn4Cb2l9HtQA>
 <xmx:mUUSaZ5tswyqdbZYVqwJwNXvGQKkUU-n3FXTHXWCfaR3FD8zq7k_Gw>
 <xmx:mUUSaYwIeBG_38H1jrw5nP_NkQ8U-7_BWcif5aZgNIXiDaOxcE8Rgg>
 <xmx:mUUSaVGomZsS1WpLMnPVYNXNtmHmLgLExnf6bot2yiXh6XuqFT7b2Q>
 <xmx:mkUSad78fRNbEVrZWG_CzNExS_1JTTFN64vZAtv96-z5USrKjNrkIkun>
Feedback-ID: i03f14258:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 10 Nov 2025 15:05:43 -0500 (EST)
Date: Mon, 10 Nov 2025 13:05:34 -0700
From: Alex Williamson <alex@shazbot.org>
To: Leon Romanovsky <leon@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
 Logan Gunthorpe <logang@deltatee.com>, Jens Axboe <axboe@kernel.dk>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Andrew Morton <akpm@linux-foundation.org>,
 Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Ankit Agrawal <ankita@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>,
 Shameer Kolothum <skolothumtho@nvidia.com>,
 Kevin Tian <kevin.tian@intel.com>, Krishnakant Jaju <kjaju@nvidia.com>,
 Matt Ochs <mochs@nvidia.com>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
 iommu@lists.linux.dev, linux-mm@kvack.org, linux-doc@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, kvm@vger.kernel.org,
 linux-hardening@vger.kernel.org, Alex Mastro <amastro@fb.com>,
 Nicolin Chen <nicolinc@nvidia.com>
Subject: Re: [PATCH v7 11/11] vfio/nvgrace: Support get_dmabuf_phys
Message-ID: <20251110130534.4d4b17ad.alex@shazbot.org>
In-Reply-To: <20251106-dmabuf-vfio-v7-11-2503bf390699@nvidia.com>
References: <20251106-dmabuf-vfio-v7-0-2503bf390699@nvidia.com>
 <20251106-dmabuf-vfio-v7-11-2503bf390699@nvidia.com>
MIME-Version: 1.0
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

On Thu,  6 Nov 2025 16:16:56 +0200
Leon Romanovsky <leon@kernel.org> wrote:

> From: Jason Gunthorpe <jgg@nvidia.com>
> 
> Call vfio_pci_core_fill_phys_vec() with the proper physical ranges for the
> synthetic BAR 2 and BAR 4 regions. Otherwise use the normal flow based on
> the PCI bar.
> 
> This demonstrates a DMABUF that follows the region info report to only
> allow mapping parts of the region that are mmapable. Since the BAR is
> power of two sized and the "CXL" region is just page aligned the there can
> be a padding region at the end that is not mmaped or passed into the
> DMABUF.
> 
> The "CXL" ranges that are remapped into BAR 2 and BAR 4 areas are not PCI
> MMIO, they actually run over the CXL-like coherent interconnect and for
> the purposes of DMA behave identically to DRAM. We don't try to model this
> distinction between true PCI BAR memory that takes a real PCI path and the
> "CXL" memory that takes a different path in the p2p framework for now.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> Tested-by: Alex Mastro <amastro@fb.com>
> Tested-by: Nicolin Chen <nicolinc@nvidia.com>
> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> ---
>  drivers/vfio/pci/nvgrace-gpu/main.c | 56 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 56 insertions(+)
> 
> diff --git a/drivers/vfio/pci/nvgrace-gpu/main.c b/drivers/vfio/pci/nvgrace-gpu/main.c
> index e346392b72f6..7d7ab2c84018 100644
> --- a/drivers/vfio/pci/nvgrace-gpu/main.c
> +++ b/drivers/vfio/pci/nvgrace-gpu/main.c
> @@ -7,6 +7,7 @@
>  #include <linux/vfio_pci_core.h>
>  #include <linux/delay.h>
>  #include <linux/jiffies.h>
> +#include <linux/pci-p2pdma.h>
>  
>  /*
>   * The device memory usable to the workloads running in the VM is cached
> @@ -683,6 +684,54 @@ nvgrace_gpu_write(struct vfio_device *core_vdev,
>  	return vfio_pci_core_write(core_vdev, buf, count, ppos);
>  }
>  
> +static int nvgrace_get_dmabuf_phys(struct vfio_pci_core_device *core_vdev,
> +				   struct p2pdma_provider **provider,
> +				   unsigned int region_index,
> +				   struct dma_buf_phys_vec *phys_vec,
> +				   struct vfio_region_dma_range *dma_ranges,
> +				   size_t nr_ranges)
> +{
> +	struct nvgrace_gpu_pci_core_device *nvdev = container_of(
> +		core_vdev, struct nvgrace_gpu_pci_core_device, core_device);
> +	struct pci_dev *pdev = core_vdev->pdev;
> +
> +	if (nvdev->resmem.memlength && region_index == RESMEM_REGION_INDEX) {
> +		/*
> +		 * The P2P properties of the non-BAR memory is the same as the
> +		 * BAR memory, so just use the provider for index 0. Someday
> +		 * when CXL gets P2P support we could create CXLish providers
> +		 * for the non-BAR memory.
> +		 */
> +		*provider = pcim_p2pdma_provider(pdev, 0);
> +		if (!*provider)
> +			return -EINVAL;
> +		return vfio_pci_core_fill_phys_vec(phys_vec, dma_ranges,
> +						   nr_ranges,
> +						   nvdev->resmem.memphys,
> +						   nvdev->resmem.memlength);
> +	} else if (region_index == USEMEM_REGION_INDEX) {
> +		/*
> +		 * This is actually cachable memory and isn't treated as P2P in
> +		 * the chip. For now we have no way to push cachable memory
> +		 * through everything and the Grace HW doesn't care what caching
> +		 * attribute is programmed into the SMMU. So use BAR 0.
> +		 */
> +		*provider = pcim_p2pdma_provider(pdev, 0);
> +		if (!*provider)
> +			return -EINVAL;
> +		return vfio_pci_core_fill_phys_vec(phys_vec, dma_ranges,
> +						   nr_ranges,
> +						   nvdev->usemem.memphys,
> +						   nvdev->usemem.memlength);
> +	}
> +	return vfio_pci_core_get_dmabuf_phys(core_vdev, provider, region_index,
> +					     phys_vec, dma_ranges, nr_ranges);
> +}


Unless my eyes deceive, we could reduce the redundancy a bit:

	struct mem_region *mem_region = NULL;

	if (nvdev->resmem.memlength && region_index == RESMEM_REGION_INDEX) {
		/*
		 * The P2P properties of the non-BAR memory is the same as the
		 * BAR memory, so just use the provider for index 0. Someday
		 * when CXL gets P2P support we could create CXLish providers
		 * for the non-BAR memory.
		 */
		mem_region = &nvdev->resmem;
	} else if (region_index == USEMEM_REGION_INDEX) {
		/*
		 * This is actually cachable memory and isn't treated as P2P in
		 * the chip. For now we have no way to push cachable memory
		 * through everything and the Grace HW doesn't care what caching
		 * attribute is programmed into the SMMU. So use BAR 0.
		 */
		mem_region = &nvdev->usemem;
	}

	if (mem_region) {
		*provider = pcim_p2pdma_provider(pdev, 0);
		if (!*provider)
			return -EINVAL;
		return vfio_pci_core_fill_phys_vec(phys_vec, dma_ranges,
						   nr_ranges,
						   mem_region->memphys,
						   mem_region->memlength);
	}

	return vfio_pci_core_get_dmabuf_phys(core_vdev, provider, region_index,
					     phys_vec, dma_ranges, nr_ranges);
		
Thanks,
Alex
