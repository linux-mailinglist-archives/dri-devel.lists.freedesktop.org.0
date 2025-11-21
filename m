Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5476C76B17
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 01:04:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1874610E062;
	Fri, 21 Nov 2025 00:04:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=shazbot.org header.i=@shazbot.org header.b="A4DQbQTO";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="DdwiK8V+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fhigh-b5-smtp.messagingengine.com
 (fhigh-b5-smtp.messagingengine.com [202.12.124.156])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B38210E062
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 00:04:21 +0000 (UTC)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 879FA7A016A;
 Thu, 20 Nov 2025 19:04:19 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-04.internal (MEProxy); Thu, 20 Nov 2025 19:04:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shazbot.org; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm2; t=1763683459;
 x=1763769859; bh=HjvLzwzMxld1mKMp0zyef95cQ5dfE6rG/eqr2WGdSgw=; b=
 A4DQbQTOyZxcwypC3+L5HNDKquu8alZqgjdhfxqZhbERLv0+0bVTi2URYY9SzrLO
 cIA7+3vgf/rnkv+XeyQZkg532nvGvpUxuRuwx8L/Uic271UWSaf9xReKLuEuvY74
 TXftCb/sHWzhJltogSGXj4K0/ZbPmRRaXRFkmo3sRy+Z4z8++d48fHWnyoTm5Rd9
 aH/FdoWkLMRiNni0STbqvQYOU5pdxxsY7e52rmKgWsiBf8fqGFqAxCDG3kL1PeG2
 7GxTPsfg7ei7jvBCMfCyaQh0d+BBQYxa1SY8i0Kfw7zj/+JdqdB22GSLh+Fs90K6
 u32o+RuLRjdGGSIuhBj9Zg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1763683459; x=
 1763769859; bh=HjvLzwzMxld1mKMp0zyef95cQ5dfE6rG/eqr2WGdSgw=; b=D
 dwiK8V+/jfQWiXQ4xfgr/qIY0MMzH+L4GlO/SbVTzukbW8v4IZsujct5M/7WHsGU
 KJYRNfKXTpBUBZzevF7fYkXShA08TaKjEn7NKAD0fgTmLpjMlQw7jiuEY0bMZwZn
 VccsOxjUPSrk4Ypi3Td2udeXQFCQSKbah3t7VMkpMgQAXlzIHM3l/phBNUmqAbsT
 DpQzFdvi8RlbqpLR/grhmVmP/RW6ZfN97T+HzwghRhTZ8ofBo2MW2Y7y3xw+jjnc
 vC3t58oLkrJxxKLSXx/zPq4Pu6J9ROujv6iqpDupZqdrM1VaUpFUxHq5MXTwkadv
 zU0wpSwt6t6kGWO6qd5gg==
X-ME-Sender: <xms:gawfaQpKfCI9uTs4scyVMdG0pHsQRE0PiBFHB_XYgFSu1KW_IQsjVA>
 <xme:gawfaW2e_QMZXgkEpQ4dQAIhH754U_TcX65CFkHK4BzhBZeujWK2leqdh1rKUCtjh
 4tLTjYQmkHsFx6m9HuoO30v226Seho2vROg9ws3UOb7QkFzwUN8>
X-ME-Received: <xmr:gawfaX3HsXWu4ErPEmHODuiTinVc3SxzIhtZwD7cdqamrNVqEBbkCxqj>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvvdekgeejucetufdoteggodetrf
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
X-ME-Proxy: <xmx:gqwfaTc1qHnh0-i3KO6tJsUVtNtxTcxs3s7vL3whUFJvperGF6WN6g>
 <xmx:gqwfaT4HBIK9hrr9a_hBvYAFnQ7rPa0nLaI-32DuwCrkmnxah0vROg>
 <xmx:gqwfaQhMKw1KHBszqSGzGjVlPYaxt6EqZf0UcaWVJr34DnEzzh9nUg>
 <xmx:gqwfaVrbusXEFt0RPAKnPhFRWA6SjT0BpwWPLXloz2sEwqtMNFS0HQ>
 <xmx:g6wfae0YvvvtVTx0cpC_54SaFJugeR6HLLLdi1mavPKyN1Xc4JF--XDn>
Feedback-ID: i03f14258:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 20 Nov 2025 19:04:15 -0500 (EST)
Date: Thu, 20 Nov 2025 17:04:13 -0700
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
Subject: Re: [PATCH v9 10/11] vfio/pci: Add dma-buf export support for MMIO
 regions
Message-ID: <20251120170413.050ccbb5.alex@shazbot.org>
In-Reply-To: <20251120-dmabuf-vfio-v9-10-d7f71607f371@nvidia.com>
References: <20251120-dmabuf-vfio-v9-0-d7f71607f371@nvidia.com>
 <20251120-dmabuf-vfio-v9-10-d7f71607f371@nvidia.com>
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

On Thu, 20 Nov 2025 11:28:29 +0200
Leon Romanovsky <leon@kernel.org> wrote:
> diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
> index 142b84b3f225..51a3bcc26f8b 100644
> --- a/drivers/vfio/pci/vfio_pci_core.c
> +++ b/drivers/vfio/pci/vfio_pci_core.c
...
> @@ -2487,8 +2500,11 @@ static int vfio_pci_dev_set_hot_reset(struct vfio_device_set *dev_set,
>  
>  err_undo:
>  	list_for_each_entry_from_reverse(vdev, &dev_set->device_list,
> -					 vdev.dev_set_list)
> +					 vdev.dev_set_list) {
> +		if (__vfio_pci_memory_enabled(vdev))
> +			vfio_pci_dma_buf_move(vdev, false);
>  		up_write(&vdev->memory_lock);
> +	}

I ran into a bug here.  In the hot reset path we can have dev_sets
where one or more devices are not opened by the user.  The vconfig
buffer for the device is established on open.  However:

bool __vfio_pci_memory_enabled(struct vfio_pci_core_device *vdev)
{
        struct pci_dev *pdev = vdev->pdev;
        u16 cmd = le16_to_cpu(*(__le16 *)&vdev->vconfig[PCI_COMMAND]);
	...

Leads to a NULL pointer dereference.

I think the most straightforward fix is simply to test the open_count
on the vfio_device, which is also protected by the dev_set->lock that
we already hold here:

--- a/drivers/vfio/pci/vfio_pci_core.c
+++ b/drivers/vfio/pci/vfio_pci_core.c
@@ -2501,7 +2501,7 @@ static int vfio_pci_dev_set_hot_reset(struct vfio_device_set *dev_set,
 err_undo:
        list_for_each_entry_from_reverse(vdev, &dev_set->device_list,
                                         vdev.dev_set_list) {
-               if (__vfio_pci_memory_enabled(vdev))
+               if (vdev->vdev.open_count && __vfio_pci_memory_enabled(vdev))
                        vfio_pci_dma_buf_move(vdev, false);
                up_write(&vdev->memory_lock);
        }

Any other suggestions?  This should be the only reset path with this
nuance of affecting non-opened devices.  Thanks,

Alex
