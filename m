Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D19C4932B
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 21:11:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BF7F10E1A3;
	Mon, 10 Nov 2025 20:11:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=shazbot.org header.i=@shazbot.org header.b="VTtNveK1";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="ehVjo0kN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 330 seconds by postgrey-1.36 at gabe;
 Mon, 10 Nov 2025 20:11:04 UTC
Received: from fout-b7-smtp.messagingengine.com
 (fout-b7-smtp.messagingengine.com [202.12.124.150])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 926C210E0D0
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 20:11:04 +0000 (UTC)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
 by mailfout.stl.internal (Postfix) with ESMTP id 6D7811D00147;
 Mon, 10 Nov 2025 15:05:33 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-04.internal (MEProxy); Mon, 10 Nov 2025 15:05:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shazbot.org; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm2; t=1762805133;
 x=1762891533; bh=LRTbnDgOZdkcWyYb0TrSsTJyowo8VQnXM0W6ONAWUts=; b=
 VTtNveK1sP3RdPO0iA1mluhOTIezB/pxiWEOpTMtRrXpqSxqoom2HwDYk67QuWkW
 sPYOFU9wblpXDKzCcGaz76SsbUIjzORvB2iixAZGqW2fpsMJzqP5XDSLJZuUeose
 gUs7geKqCEZxyILKTVR1G6bjEdT1IDPI9lORfC7uU7VXjawAWvGl2cthKxtM67hg
 2LGDVSp2fb5+OY7d95VBUt3xXcg4zmyZNGQJvu4WmoOyjyktai2rEvD59ntUSPrz
 noD0hx+3MnVDFBYoEm291EVo6ioNy0I4iVxIt4URSUSibY5VQFYlMAenBohjrrqE
 5M+jBIsmcKEZFKzLT7cG6Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1762805133; x=
 1762891533; bh=LRTbnDgOZdkcWyYb0TrSsTJyowo8VQnXM0W6ONAWUts=; b=e
 hVjo0kNkpXpEnjyGLa3/HioTTAA5OcK4yDT+dT+kSj8VoCNpXQicmGnR1r8kl3i4
 n/q1SGSEgGz8mmhYlrkKrESCZwS6ZmjcXz2B3B9WVYhcun1l7NR44AgVENlnLqvu
 a1zJZ2CuMWjHrlkgrKrx6rKTVBu03wGm/PEyRLxXjeJPUmeJkA1RNRcTv4vkR077
 UeYkeuPv7KXX5jjN3Q3Admhq/wVV39C97HYyXRwatVk2JzsEizOnKtCy3nYrgUV0
 f16CdLzVqw7okI7dfupJaRHAfGhXWIUe34rM5F+7RmgptMF8UZmdovDBQ67FlOmL
 bbZtZ4jSrTcVOKqnpDH4g==
X-ME-Sender: <xms:i0USacfcdiFukOkHlGoqV_M4dCc620hY4NSllrMdUQNN1jhyNXA0dA>
 <xme:i0USaebmv-CqTmGTtMURt40eSNK-Wx58zPcA6lUAMFk6_sJ7kTrwfXO5-hJI7QP35
 WOjketLVpgzAmupEQaOyA0CSU46lUmN1quCAYwRJCTFcTgJGFD4>
X-ME-Received: <xmr:i0USaQJZE78F87doANetcSybuW5K51r7sW1QPQxDU2rb0XeXgAf-OVXV>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdduleelvdefucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
 gurhepfffhvfevuffkjghfgggtgfesthejredttddtvdenucfhrhhomheptehlvgigucgh
 ihhllhhirghmshhonhcuoegrlhgvgiesshhhrgiisghothdrohhrgheqnecuggftrfgrth
 htvghrnhepteetudelgeekieegudegleeuvdffgeehleeivddtfeektdekkeehffehudet
 hffhnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
 hlvgigsehshhgriigsohhtrdhorhhgpdhnsggprhgtphhtthhopeeffedpmhhouggvpehs
 mhhtphhouhhtpdhrtghpthhtoheplhgvohhnsehkvghrnhgvlhdrohhrghdprhgtphhtth
 hopegshhgvlhhgrggrshesghhoohhglhgvrdgtohhmpdhrtghpthhtoheplhhoghgrnhhg
 seguvghlthgrthgvvgdrtghomhdprhgtphhtthhopegrgigsohgvsehkvghrnhgvlhdrug
 hkpdhrtghpthhtoheprhhosghinhdrmhhurhhphhihsegrrhhmrdgtohhmpdhrtghpthht
 ohepjhhorhhoseeksgihthgvshdrohhrghdprhgtphhtthhopeifihhllheskhgvrhhnvg
 hlrdhorhhgpdhrtghpthhtohepmhdrshiihihprhhofihskhhisehsrghmshhunhhgrdgt
 ohhmpdhrtghpthhtohepjhhgghesiihivghpvgdrtggr
X-ME-Proxy: <xmx:i0USadiojN3-M4EVjjaRRugj8V8QuJnr5MsQlLluVx8g5hN9fuNwjw>
 <xmx:i0USacvol4BakuBUda4qcSsYifPCPIwHmQFFbRa4tQipabSTTp737w>
 <xmx:i0USaREDw4I87L0odND3wJ85uUDm4QaLw4uwBFQIJ-AXU7QEY82_xw>
 <xmx:i0USaS_gEbCoj0gRiNt7PSMpEk5gV19bFOSSEZSZfZgUVR07IZj5bA>
 <xmx:jUUSaRJMGClENgI7ttLAOXLiOuPL8ZATIaHOyPe6Y_F7QjCcID7VjG5j>
Feedback-ID: i03f14258:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 10 Nov 2025 15:05:29 -0500 (EST)
Date: Mon, 10 Nov 2025 13:05:25 -0700
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
 linux-hardening@vger.kernel.org,
 Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: Re: [PATCH v7 10/11] vfio/pci: Add dma-buf export support for MMIO
 regions
Message-ID: <20251110130525.6712552b.alex@shazbot.org>
In-Reply-To: <20251106-dmabuf-vfio-v7-10-2503bf390699@nvidia.com>
References: <20251106-dmabuf-vfio-v7-0-2503bf390699@nvidia.com>
 <20251106-dmabuf-vfio-v7-10-2503bf390699@nvidia.com>
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

On Thu,  6 Nov 2025 16:16:55 +0200
Leon Romanovsky <leon@kernel.org> wrote:
> diff --git a/drivers/vfio/pci/vfio_pci_dmabuf.c b/drivers/vfio/pci/vfio_pci_dmabuf.c
> new file mode 100644
> index 000000000000..cbf502b14e3c
> --- /dev/null
> +++ b/drivers/vfio/pci/vfio_pci_dmabuf.c
...
> +
> +int vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 flags,
> +				  struct vfio_device_feature_dma_buf __user *arg,
> +				  size_t argsz)
> +{
> +	struct vfio_device_feature_dma_buf get_dma_buf = {};
> +	struct vfio_region_dma_range *dma_ranges;
> +	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
> +	struct vfio_pci_dma_buf *priv;
> +	size_t length;
> +	int ret;
> +
> +	if (!vdev->pci_ops->get_dmabuf_phys)


vdev->pci_ops can be NULL.

Thanks,
Alex
