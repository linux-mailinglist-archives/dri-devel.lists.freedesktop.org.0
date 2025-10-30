Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2157C23A81
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 09:05:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7607710EABE;
	Fri, 31 Oct 2025 08:05:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=shazbot.org header.i=@shazbot.org header.b="DsC38lET";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="yWVHoBY1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 446 seconds by postgrey-1.36 at gabe;
 Thu, 30 Oct 2025 20:46:08 UTC
Received: from fhigh-a1-smtp.messagingengine.com
 (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 972BF10EA1F
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 20:46:08 +0000 (UTC)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 8C9A014001DA;
 Thu, 30 Oct 2025 16:38:41 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-02.internal (MEProxy); Thu, 30 Oct 2025 16:38:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shazbot.org; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm2; t=1761856721;
 x=1761943121; bh=p/8nyxWirOj4W+hYeRtMTG+81adajTiGVYuh/z6LXOE=; b=
 DsC38lETCmk/UCR0NCEwSG/uMsWXv3KF8nqtv5mXrxnOSNXAuNpeCuWFpcBvb+Rd
 qJBjT5+eedr1G7iNzvqfrWIs8YRmqr2Wn21vsB0Emgw2ammXeAjJNTKT8X3CRF7f
 sgThj4w6Go/EWjZJV5hnPtkmvfi6+pv64RwRGY8broPbxr/l47tuMqaHoojfoTlR
 x8NDbZZySjAGPtlXTOwEeVtGqPiFwdzOMit5oo4Jlrg3Xiv12ZeKHlQsjJ2dfLoo
 Dd4zchU1KSWfT+xErx3Qp84XfWS++Q21slSUIXTr2Vf+w51bpou71HnP2egRiZFl
 JYynwj6jAFgGlfam/THdRQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1761856721; x=
 1761943121; bh=p/8nyxWirOj4W+hYeRtMTG+81adajTiGVYuh/z6LXOE=; b=y
 WVHoBY1ck0fhOfaNyfXlK3MsltrJ16L4JMUjk4/8F1vhiZvK9+ByZAPE2Fr+lDEn
 31wuiMAdQO9JUckxnFimEg9qgiR7Buz2VVu3gcL2K4BISNU112JvnuEfmtkVFPU/
 WkKn9wiMCn/ibulsR45YnPo3Fgmy6RI+6Fk3aMG8co7oZG18ttXuQ58m649z8toG
 uT5IEDW7hMQMIpoPYi22aGzWDJxfD1aqI4Iw7ZnDH3Ltcib06o+rASeKq7T4jlRO
 a3slUeUe0CCl0KdMKPV16WqcZAYF7H/sqwJXPOUxsj0SzU4xV0yEV9o7Tp0CRH3k
 UOAJNTt/tx/Lco0qxnstA==
X-ME-Sender: <xms:z8wDaZLo5dD7ZxDV6II0FqH4O7jccYwOPy06udjLAl4RXkxI_trqqw>
 <xme:z8wDaW3NyxbzGjLL5VL8Xo8PzYRVFCOzMbstflMQqva5Wle0FjF3VlMyKQrzHC5El
 q3grRf5LAMq5wsIJswOZBD4TQxX7zoQ86zYjcR_77WmesqtyRs2M7A>
X-ME-Received: <xmr:z8wDaVIW0bK32xwhEPjPTrLSw9kl2duIIdiJN2tr1QWnNDZ4iA2BxWRaG40>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdduieejheelucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
 gurhepfffhvfevuffkjghfgggtgfesthejredttddtvdenucfhrhhomheptehlvgigucgh
 ihhllhhirghmshhonhcuoegrlhgvgiesshhhrgiisghothdrohhrgheqnecuggftrfgrth
 htvghrnhepteetudelgeekieegudegleeuvdffgeehleeivddtfeektdekkeehffehudet
 hffhnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
 hlvgigsehshhgriigsohhtrdhorhhgpdhnsggprhgtphhtthhopedvgedpmhhouggvpehs
 mhhtphhouhhtpdhrtghpthhtoheplhgvohhnsehkvghrnhgvlhdrohhrghdprhgtphhtth
 hopegrlhgvgidrfihilhhlihgrmhhsohhnsehrvgguhhgrthdrtghomhdprhgtphhtthho
 pehlvghonhhrohesnhhvihguihgrrdgtohhmpdhrtghpthhtohepjhhgghesnhhvihguih
 grrdgtohhmpdhrtghpthhtoheprghkphhmsehlihhnuhigqdhfohhunhgurghtihhonhdr
 ohhrghdprhgtphhtthhopegshhgvlhhgrggrshesghhoohhglhgvrdgtohhmpdhrtghpth
 htoheptghhrhhishhtihgrnhdrkhhovghnihhgsegrmhgurdgtohhmpdhrtghpthhtohep
 ughrihdquggvvhgvlheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdprhgtph
 htthhopehiohhmmhhusehlihhsthhsrdhlihhnuhigrdguvghv
X-ME-Proxy: <xmx:z8wDaaMiGwbWX7czDe5iiad6EIpQFwJ1yQIteZ0s-dAUbUDysgOuAQ>
 <xmx:z8wDaWyOXEdvkv2nByzkDyCMSCs83bIcsse_dM2y2-1KvLiBXmR81Q>
 <xmx:z8wDaSIr0J6kFZz5NMvG-wATtPZO5nIJ7XYS0F5DucQqhu-KLzZWag>
 <xmx:z8wDaVrwkjuhIMeJQEscr9oJy00Glt_Gj0UMB1ES18qD9i2fTKlcuQ>
 <xmx:0cwDacSuknghBUpyXTe85wMhy52PcPg_FWLjbD2hGGkyV4h7HjHD1dZT>
Feedback-ID: i03f14258:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 30 Oct 2025 16:38:37 -0400 (EDT)
Date: Thu, 30 Oct 2025 14:38:36 -0600
From: Alex Williamson <alex@shazbot.org>
To: Leon Romanovsky <leon@kernel.org>
Cc: Alex Williamson <alex.williamson@redhat.com>, Leon Romanovsky
 <leonro@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>, Andrew Morton
 <akpm@linux-foundation.org>, Bjorn Helgaas <bhelgaas@google.com>, Christian
 =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, iommu@lists.linux.dev, Jens Axboe
 <axboe@kernel.dk>, Joerg Roedel <joro@8bytes.org>, kvm@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mm@kvack.org, linux-pci@vger.kernel.org, Logan Gunthorpe
 <logang@deltatee.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Robin
 Murphy <robin.murphy@arm.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH v5 9/9] vfio/pci: Add dma-buf export support for MMIO
 regions
Message-ID: <20251030143836.66cdf116@shazbot.org>
In-Reply-To: <72ecaa13864ca346797e342d23a7929562788148.1760368250.git.leon@kernel.org>
References: <cover.1760368250.git.leon@kernel.org>
 <72ecaa13864ca346797e342d23a7929562788148.1760368250.git.leon@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 31 Oct 2025 08:05:47 +0000
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

On Mon, 13 Oct 2025 18:26:11 +0300
Leon Romanovsky <leon@kernel.org> wrote:
> diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
> index fe247d0e2831..56b1320238a9 100644
> --- a/drivers/vfio/pci/vfio_pci_core.c
> +++ b/drivers/vfio/pci/vfio_pci_core.c
> @@ -1511,6 +1520,19 @@ int vfio_pci_core_ioctl_feature(struct vfio_device *device, u32 flags,
>  		return vfio_pci_core_pm_exit(vdev, flags, arg, argsz);
>  	case VFIO_DEVICE_FEATURE_PCI_VF_TOKEN:
>  		return vfio_pci_core_feature_token(vdev, flags, arg, argsz);
> +	case VFIO_DEVICE_FEATURE_DMA_BUF:
> +		if (device->ops->ioctl != vfio_pci_core_ioctl)
> +			/*
> +			 * Devices that overwrite general .ioctl() callback
> +			 * usually do it to implement their own
> +			 * VFIO_DEVICE_GET_REGION_INFO handlerm and they present

Typo, "handlerm"

> +			 * different BAR information from the real PCI.
> +			 *
> +			 * DMABUF relies on real PCI information.
> +			 */
> +			return -EOPNOTSUPP;
> +
> +		return vfio_pci_core_feature_dma_buf(vdev, flags, arg, argsz);
>  	default:
>  		return -ENOTTY;
>  	}
...
> @@ -2459,6 +2482,7 @@ static int vfio_pci_dev_set_hot_reset(struct vfio_device_set *dev_set,
>  			break;
>  		}
>  
> +		vfio_pci_dma_buf_move(vdev, true);
>  		vfio_pci_zap_bars(vdev);
>  	}
>  
> @@ -2482,6 +2506,10 @@ static int vfio_pci_dev_set_hot_reset(struct vfio_device_set *dev_set,
>  
>  	ret = pci_reset_bus(pdev);
>  
> +	list_for_each_entry(vdev, &dev_set->device_list, vdev.dev_set_list)
> +		if (__vfio_pci_memory_enabled(vdev))
> +			vfio_pci_dma_buf_move(vdev, false);
> +
>  	vdev = list_last_entry(&dev_set->device_list,
>  			       struct vfio_pci_core_device, vdev.dev_set_list);
>  

This needs to be placed in the existing undo loop with the up_write(),
otherwise it can be missed in the error case.

> diff --git a/drivers/vfio/pci/vfio_pci_dmabuf.c b/drivers/vfio/pci/vfio_pci_dmabuf.c
> new file mode 100644
> index 000000000000..eaba010777f3
> --- /dev/null
> +++ b/drivers/vfio/pci/vfio_pci_dmabuf.c
> +static unsigned int calc_sg_nents(struct vfio_pci_dma_buf *priv,
> +				  struct dma_iova_state *state)
> +{
> +	struct phys_vec *phys_vec = priv->phys_vec;
> +	unsigned int nents = 0;
> +	u32 i;
> +
> +	if (!state || !dma_use_iova(state))
> +		for (i = 0; i < priv->nr_ranges; i++)
> +			nents += DIV_ROUND_UP(phys_vec[i].len, UINT_MAX);
> +	else
> +		/*
> +		 * In IOVA case, there is only one SG entry which spans
> +		 * for whole IOVA address space, but we need to make sure
> +		 * that it fits sg->length, maybe we need more.
> +		 */
> +		nents = DIV_ROUND_UP(priv->size, UINT_MAX);

I think we're arguably running afoul of the coding style standard here
that this is not a single simple statement and should use braces.

> +
> +	return nents;
> +}
> +
> +static struct sg_table *
> +vfio_pci_dma_buf_map(struct dma_buf_attachment *attachment,
> +		     enum dma_data_direction dir)
> +{
> +	struct vfio_pci_dma_buf *priv = attachment->dmabuf->priv;
> +	struct dma_iova_state *state = attachment->priv;
> +	struct phys_vec *phys_vec = priv->phys_vec;
> +	unsigned long attrs = DMA_ATTR_MMIO;
> +	unsigned int nents, mapped_len = 0;
> +	struct scatterlist *sgl;
> +	struct sg_table *sgt;
> +	dma_addr_t addr;
> +	int ret;
> +	u32 i;
> +
> +	dma_resv_assert_held(priv->dmabuf->resv);
> +
> +	if (priv->revoked)
> +		return ERR_PTR(-ENODEV);
> +
> +	sgt = kzalloc(sizeof(*sgt), GFP_KERNEL);
> +	if (!sgt)
> +		return ERR_PTR(-ENOMEM);
> +
> +	nents = calc_sg_nents(priv, state);
> +	ret = sg_alloc_table(sgt, nents, GFP_KERNEL | __GFP_ZERO);
> +	if (ret)
> +		goto err_kfree_sgt;
> +
> +	sgl = sgt->sgl;
> +
> +	for (i = 0; i < priv->nr_ranges; i++) {
> +		if (!state) {
> +			addr = pci_p2pdma_bus_addr_map(priv->provider,
> +						       phys_vec[i].paddr);
> +		} else if (dma_use_iova(state)) {
> +			ret = dma_iova_link(attachment->dev, state,
> +					    phys_vec[i].paddr, 0,
> +					    phys_vec[i].len, dir, attrs);
> +			if (ret)
> +				goto err_unmap_dma;
> +
> +			mapped_len += phys_vec[i].len;
> +		} else {
> +			addr = dma_map_phys(attachment->dev, phys_vec[i].paddr,
> +					    phys_vec[i].len, dir, attrs);
> +			ret = dma_mapping_error(attachment->dev, addr);
> +			if (ret)
> +				goto err_unmap_dma;
> +		}
> +
> +		if (!state || !dma_use_iova(state))
> +			sgl = fill_sg_entry(sgl, phys_vec[i].len, addr);
> +	}
> +
> +	if (state && dma_use_iova(state)) {
> +		WARN_ON_ONCE(mapped_len != priv->size);
> +		ret = dma_iova_sync(attachment->dev, state, 0, mapped_len);
> +		if (ret)
> +			goto err_unmap_dma;
> +		sgl = fill_sg_entry(sgl, mapped_len, state->addr);
> +	}
> +
> +	/*
> +	 * SGL must be NULL to indicate that SGL is the last one
> +	 * and we allocated correct number of entries in sg_alloc_table()
> +	 */
> +	WARN_ON_ONCE(sgl);
> +	return sgt;
> +
> +err_unmap_dma:
> +	if (!i || !state)
> +		; /* Do nothing */
> +	else if (dma_use_iova(state))
> +		dma_iova_destroy(attachment->dev, state, mapped_len, dir,
> +				 attrs);
> +	else
> +		for_each_sgtable_dma_sg(sgt, sgl, i)
> +			dma_unmap_phys(attachment->dev, sg_dma_address(sgl),
> +					sg_dma_len(sgl), dir, attrs);

Same, here for braces.

> +	sg_free_table(sgt);
> +err_kfree_sgt:
> +	kfree(sgt);
> +	return ERR_PTR(ret);
> +}
> +
> +static void vfio_pci_dma_buf_unmap(struct dma_buf_attachment *attachment,
> +				   struct sg_table *sgt,
> +				   enum dma_data_direction dir)
> +{
> +	struct vfio_pci_dma_buf *priv = attachment->dmabuf->priv;
> +	struct dma_iova_state *state = attachment->priv;
> +	unsigned long attrs = DMA_ATTR_MMIO;
> +	struct scatterlist *sgl;
> +	int i;
> +
> +	if (!state)
> +		; /* Do nothing */
> +	else if (dma_use_iova(state))
> +		dma_iova_destroy(attachment->dev, state, priv->size, dir,
> +				 attrs);
> +	else
> +		for_each_sgtable_dma_sg(sgt, sgl, i)
> +			dma_unmap_phys(attachment->dev, sg_dma_address(sgl),
> +				       sg_dma_len(sgl), dir, attrs);
> +

Here too.

> +	sg_free_table(sgt);
> +	kfree(sgt);
> +}
...
> diff --git a/include/uapi/linux/vfio.h b/include/uapi/linux/vfio.h
> index 75100bf009ba..63214467c875 100644
> --- a/include/uapi/linux/vfio.h
> +++ b/include/uapi/linux/vfio.h
> @@ -1478,6 +1478,31 @@ struct vfio_device_feature_bus_master {
>  };
>  #define VFIO_DEVICE_FEATURE_BUS_MASTER 10
>  
> +/**
> + * Upon VFIO_DEVICE_FEATURE_GET create a dma_buf fd for the
> + * regions selected.
> + *
> + * open_flags are the typical flags passed to open(2), eg O_RDWR, O_CLOEXEC,
> + * etc. offset/length specify a slice of the region to create the dmabuf from.
> + * nr_ranges is the total number of (P2P DMA) ranges that comprise the dmabuf.
> + *

Probably worth noting that .flags should be zero, I see we enforce
that.  Thanks,

Alex

> + * Return: The fd number on success, -1 and errno is set on failure.
> + */
> +#define VFIO_DEVICE_FEATURE_DMA_BUF 11
> +
> +struct vfio_region_dma_range {
> +	__u64 offset;
> +	__u64 length;
> +};
> +
> +struct vfio_device_feature_dma_buf {
> +	__u32	region_index;
> +	__u32	open_flags;
> +	__u32   flags;
> +	__u32   nr_ranges;
> +	struct vfio_region_dma_range dma_ranges[];
> +};
> +
>  /* -------- API for Type1 VFIO IOMMU -------- */
>  
>  /**

