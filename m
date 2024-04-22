Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 452C08ACFC8
	for <lists+dri-devel@lfdr.de>; Mon, 22 Apr 2024 16:44:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4248C10F63B;
	Mon, 22 Apr 2024 14:44:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JMC3a54C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 714C010F63B
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 14:44:42 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-41a5b68ed85so6082625e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 07:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713797080; x=1714401880; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=vDWbGa8maG8Iw8x1I8Ywl77W0jRn/UC+uqATAgFyavw=;
 b=JMC3a54Cem+KComZ+ge47apCYCR6hMuCoGz1Hy9X2fl67WKeSNSDaWTEvA8jmQnJrp
 23T4wpgqpUkVsdhYoIXp+E5/bVhBAoLBDWwQ8yCX58RV5V10mMzHmLlvCvXbWYs0rg64
 XhJsRKCitVGd20ZU3Aw3PlpFqZJVRwXKwQRmauYFEBPAuv3503hPmnoscLGPogfGyzkC
 1rU/nR4NMFkL/05YD7PJvYhJu9uQapQ5K7eLkTM1DaZrUeTRO/2mzLAes6Anetxd8veG
 5XDs+XkZNbNHt3NXjU+4jn4gkgJrIkjqv8Z9d/XQWZ62WDYkPhxEyucOnuR/ixrTRXmk
 SStQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713797080; x=1714401880;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:user-agent:mime-version:date:message-id:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vDWbGa8maG8Iw8x1I8Ywl77W0jRn/UC+uqATAgFyavw=;
 b=bf0RaTBX69q4sxYtXSYxK+dVF9/PdJL8A6phDyeJst5e1riI6go9AHjB5xebD1DQVU
 6pEgdpegx0ErYeG2bMQTV3nxoRSj93DmsBhiEozeExaKYHK6HwnjFQ7gPNtNHGAJfN8b
 dTgY5DfzhPraM+G9br3US3oUmaSJd3Mp8b0BE//i8HVScpBdVWSa8aE43BrdbzI5yOi6
 u0gwhH/iPNP2r5A1pzIQz8jZSvBRRy5OH4zbQLPxP7FZOuckIzLWlT1nE4vu2gpNywZN
 TktsT5+xODkC0ej5KpyBp9ZODmDfi8rpoIdddbWuoKEHpVW9cfJS5BYsgXC2qJoaabL2
 p0aA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXkt+Jw4RJOXq/jUGCXZZxdsbc0QZ2Op9hKGMahzudMwMgM/dKG2yHc1mSdd93brL5Iv8LLy6X/PTjjqt35n61Ibd7xyHz27Cm49jHd7d1u
X-Gm-Message-State: AOJu0YwzJwG4jkWwhwwLCNGrW1UbQqEqZZRz35vzeP9UvSZlKvce/iZ7
 9EJ+SjQVldoJkclmMYf79Xhjh5nQUbWCogzDtMwW09M+Jq6p8RGT
X-Google-Smtp-Source: AGHT+IGTJVDV53SvCHVd9C3udpd1MZBEced2KBo4BwrLR81iO/sW69n3KHswjsroP/cPDIMC/Xk9Ng==
X-Received: by 2002:a05:600c:3b19:b0:418:de31:7148 with SMTP id
 m25-20020a05600c3b1900b00418de317148mr7793236wms.3.1713797080185; 
 Mon, 22 Apr 2024 07:44:40 -0700 (PDT)
Received: from [10.16.124.60] ([212.227.34.98])
 by smtp.gmail.com with ESMTPSA id
 he5-20020a05600c540500b00418e3c5bc8esm16045956wmb.18.2024.04.22.07.44.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Apr 2024 07:44:39 -0700 (PDT)
From: Zhu Yanjun <zyjzyj2000@gmail.com>
X-Google-Original-From: Zhu Yanjun <yanjun.zhu@linux.dev>
Message-ID: <00c270c7-dff9-4682-9bf8-44195b72cf04@linux.dev>
Date: Mon, 22 Apr 2024 16:44:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] vfio/pci: Allow MMIO regions to be exported
 through dma-buf
To: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 dri-devel@lists.freedesktop.org, kvm@vger.kernel.org,
 linux-rdma@vger.kernel.org
Cc: Jason Gunthorpe <jgg@nvidia.com>
References: <20240422063602.3690124-1-vivek.kasireddy@intel.com>
 <20240422063602.3690124-3-vivek.kasireddy@intel.com>
Content-Language: en-US
In-Reply-To: <20240422063602.3690124-3-vivek.kasireddy@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 22.04.24 08:30, Vivek Kasireddy wrote:
>  From Jason Gunthorpe:
> "dma-buf has become a way to safely acquire a handle to non-struct page
> memory that can still have lifetime controlled by the exporter. Notably
> RDMA can now import dma-buf FDs and build them into MRs which allows for
> PCI P2P operations. Extend this to allow vfio-pci to export MMIO memory
> from PCI device BARs.
> 
> The patch design loosely follows the pattern in commit
> db1a8dd916aa ("habanalabs: add support for dma-buf exporter") except this
> does not support pinning.
> 
> Instead, this implements what, in the past, we've called a revocable
> attachment using move. In normal situations the attachment is pinned, as a
> BAR does not change physical address. However when the VFIO device is
> closed, or a PCI reset is issued, access to the MMIO memory is revoked.
> 
> Revoked means that move occurs, but an attempt to immediately re-map the
> memory will fail. In the reset case a future move will be triggered when
> MMIO access returns. As both close and reset are under userspace control
> it is expected that userspace will suspend use of the dma-buf before doing
> these operations, the revoke is purely for kernel self-defense against a
> hostile userspace."
> 
> Following enhancements are made to the original patch:
> - Use P2P DMA APIs to create pages (ZONE_DEVICE) instead of DMA addrs
> - Add a mmap handler to provide CPU access to the dmabuf
> - Add support for creating dmabuf from multiple areas (or ranges)
> 
> Original-patch-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
> ---
>   drivers/vfio/pci/Makefile          |   1 +
>   drivers/vfio/pci/dma_buf.c         | 348 +++++++++++++++++++++++++++++
>   drivers/vfio/pci/vfio_pci_config.c |   8 +-
>   drivers/vfio/pci/vfio_pci_core.c   |  28 ++-
>   drivers/vfio/pci/vfio_pci_priv.h   |  23 ++
>   include/linux/vfio_pci_core.h      |   1 +
>   include/uapi/linux/vfio.h          |  25 +++
>   7 files changed, 426 insertions(+), 8 deletions(-)
>   create mode 100644 drivers/vfio/pci/dma_buf.c
> 
> diff --git a/drivers/vfio/pci/Makefile b/drivers/vfio/pci/Makefile
> index ce7a61f1d912..b2374856ff62 100644
> --- a/drivers/vfio/pci/Makefile
> +++ b/drivers/vfio/pci/Makefile
> @@ -2,6 +2,7 @@
>   
>   vfio-pci-core-y := vfio_pci_core.o vfio_pci_intrs.o vfio_pci_rdwr.o vfio_pci_config.o
>   vfio-pci-core-$(CONFIG_VFIO_PCI_ZDEV_KVM) += vfio_pci_zdev.o
> +vfio-pci-core-$(CONFIG_DMA_SHARED_BUFFER) += dma_buf.o
>   obj-$(CONFIG_VFIO_PCI_CORE) += vfio-pci-core.o
>   
>   vfio-pci-y := vfio_pci.o
> diff --git a/drivers/vfio/pci/dma_buf.c b/drivers/vfio/pci/dma_buf.c
> new file mode 100644
> index 000000000000..7bf00fdee69b
> --- /dev/null
> +++ b/drivers/vfio/pci/dma_buf.c
> @@ -0,0 +1,348 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/* Copyright (c) 2022, NVIDIA CORPORATION & AFFILIATES.

Not sure if this Copyright (c) is 2022 or 2024.

Zhu Yanjun

> + */
> +#include <linux/dma-buf.h>
> +#include <linux/pci-p2pdma.h>
> +#include <linux/dma-resv.h>
> +
> +#include "vfio_pci_priv.h"
> +
> +MODULE_IMPORT_NS(DMA_BUF);
> +
> +struct vfio_pci_dma_buf {
> +	struct dma_buf *dmabuf;
> +	struct vfio_pci_core_device *vdev;
> +	struct list_head dmabufs_elm;
> +	struct page **pages;
> +	struct sg_table *sg;
> +	unsigned int nr_pages;
> +	bool revoked;
> +};
> +
> +static vm_fault_t vfio_pci_dma_buf_fault(struct vm_fault *vmf)
> +{
> +	struct vm_area_struct *vma = vmf->vma;
> +	struct vfio_pci_dma_buf *priv = vma->vm_private_data;
> +	pgoff_t pgoff = vmf->pgoff;
> +
> +	if (pgoff >= priv->nr_pages)
> +		return VM_FAULT_SIGBUS;
> +
> +	return vmf_insert_pfn(vma, vmf->address,
> +			      page_to_pfn(priv->pages[pgoff]));
> +}
> +
> +static const struct vm_operations_struct vfio_pci_dma_buf_vmops = {
> +	.fault = vfio_pci_dma_buf_fault,
> +};
> +
> +static int vfio_pci_dma_buf_mmap(struct dma_buf *dmabuf,
> +				 struct vm_area_struct *vma)
> +{
> +	struct vfio_pci_dma_buf *priv = dmabuf->priv;
> +
> +	if ((vma->vm_flags & (VM_SHARED | VM_MAYSHARE)) == 0)
> +		return -EINVAL;
> +
> +	vma->vm_ops = &vfio_pci_dma_buf_vmops;
> +	vma->vm_private_data = priv;
> +	vm_flags_set(vma, VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP);
> +	return 0;
> +}
> +
> +static int vfio_pci_dma_buf_attach(struct dma_buf *dmabuf,
> +				   struct dma_buf_attachment *attachment)
> +{
> +	struct vfio_pci_dma_buf *priv = dmabuf->priv;
> +	int rc;
> +
> +	rc = pci_p2pdma_distance_many(priv->vdev->pdev, &attachment->dev, 1,
> +				      true);
> +	if (rc < 0)
> +		attachment->peer2peer = false;
> +	return 0;
> +}
> +
> +static void vfio_pci_dma_buf_unpin(struct dma_buf_attachment *attachment)
> +{
> +}
> +
> +static int vfio_pci_dma_buf_pin(struct dma_buf_attachment *attachment)
> +{
> +	/*
> +	 * Uses the dynamic interface but must always allow for
> +	 * dma_buf_move_notify() to do revoke
> +	 */
> +	return -EINVAL;
> +}
> +
> +static struct sg_table *
> +vfio_pci_dma_buf_map(struct dma_buf_attachment *attachment,
> +		     enum dma_data_direction dir)
> +{
> +	struct vfio_pci_dma_buf *priv = attachment->dmabuf->priv;
> +	struct scatterlist *sgl;
> +	struct sg_table *sgt;
> +	unsigned int i = 0;
> +	int ret;
> +
> +	dma_resv_assert_held(priv->dmabuf->resv);
> +
> +	if (!attachment->peer2peer)
> +		return ERR_PTR(-EPERM);
> +
> +	if (priv->revoked)
> +		return ERR_PTR(-ENODEV);
> +
> +	sgt = kzalloc(sizeof(*sgt), GFP_KERNEL);
> +	if (!sgt)
> +		return ERR_PTR(-ENOMEM);
> +
> +	ret = sg_alloc_table(sgt, priv->nr_pages, GFP_KERNEL);
> +	if (ret)
> +		goto err_kfree_sgt;
> +
> +	for_each_sg(sgt->sgl, sgl, priv->nr_pages, i)
> +		sg_set_page(sgl, priv->pages[i], PAGE_SIZE, 0);
> +
> +	ret = dma_map_sgtable(attachment->dev, sgt, dir, 0);
> +	if (ret < 0)
> +		goto err_free_sgt;
> +
> +	return sgt;
> +
> +err_free_sgt:
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
> +	dma_unmap_sgtable(attachment->dev, sgt, dir, 0);
> +	sg_free_table(sgt);
> +	kfree(sgt);
> +}
> +
> +static void release_p2p_pages(struct vfio_pci_dma_buf *priv,
> +			      unsigned int nr_pages)
> +{
> +	while (nr_pages > 0 && priv->pages[--nr_pages])
> +		pci_free_p2pmem(priv->vdev->pdev,
> +				page_to_virt(priv->pages[nr_pages]),
> +				PAGE_SIZE);
> +}
> +
> +static void vfio_pci_dma_buf_release(struct dma_buf *dmabuf)
> +{
> +	struct vfio_pci_dma_buf *priv = dmabuf->priv;
> +
> +	/*
> +	 * Either this or vfio_pci_dma_buf_cleanup() will remove from the list.
> +	 * The refcount prevents both.
> +	 */
> +	if (priv->vdev) {
> +		release_p2p_pages(priv, priv->nr_pages);
> +		kfree(priv->pages);
> +		down_write(&priv->vdev->memory_lock);
> +		list_del_init(&priv->dmabufs_elm);
> +		up_write(&priv->vdev->memory_lock);
> +		vfio_device_put_registration(&priv->vdev->vdev);
> +	}
> +	kfree(priv);
> +}
> +
> +static const struct dma_buf_ops vfio_pci_dmabuf_ops = {
> +	.attach = vfio_pci_dma_buf_attach,
> +	.map_dma_buf = vfio_pci_dma_buf_map,
> +	.pin = vfio_pci_dma_buf_pin,
> +	.unpin = vfio_pci_dma_buf_unpin,
> +	.release = vfio_pci_dma_buf_release,
> +	.unmap_dma_buf = vfio_pci_dma_buf_unmap,
> +	.mmap = vfio_pci_dma_buf_mmap,
> +};
> +
> +static int create_p2p_pages(struct vfio_pci_dma_buf *priv, uint32_t nr_areas,
> +			    struct vfio_region_p2p_area *p2p_areas)
> +{
> +	struct pci_dev *pdev = priv->vdev->pdev;
> +	resource_size_t bar_size;
> +	unsigned int pg = 0;
> +	void *vaddr;
> +	size_t size;
> +	int i, ret;
> +
> +	for (i = 0; i < nr_areas; i++) {
> +		bar_size = pci_resource_len(pdev, p2p_areas[i].region_index);
> +		if (p2p_areas[i].offset > bar_size ||
> +		    p2p_areas[i].offset + p2p_areas[i].length > bar_size) {
> +			ret = -ERANGE;
> +			goto err;
> +		}
> +
> +		ret = pci_p2pdma_add_resource(pdev,
> +					      p2p_areas[i].region_index,
> +					      p2p_areas[i].length,
> +					      p2p_areas[i].offset);
> +		if (ret)
> +			goto err;
> +
> +		vaddr = pci_alloc_p2pmem(pdev, p2p_areas[i].length);
> +		if (!vaddr) {
> +			ret = -EINVAL;
> +			goto err;
> +		}
> +
> +		for (size = 0; size < p2p_areas[i].length;) {
> +			priv->pages[pg++] = virt_to_page(vaddr + size);
> +			size += PAGE_SIZE;
> +		}
> +	}
> +
> +	return 0;
> +
> +err:
> +	release_p2p_pages(priv, pg);
> +	return ret;
> +}
> +
> +int vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 flags,
> +				  struct vfio_device_feature_dma_buf __user *arg,
> +				  size_t argsz)
> +{
> +	struct vfio_device_feature_dma_buf get_dma_buf;
> +	struct vfio_region_p2p_area *p2p_areas;
> +	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
> +	struct vfio_pci_dma_buf *priv;
> +	int i, ret;
> +
> +	ret = vfio_check_feature(flags, argsz, VFIO_DEVICE_FEATURE_GET,
> +				 sizeof(get_dma_buf));
> +	if (ret != 1)
> +		return ret;
> +
> +	if (copy_from_user(&get_dma_buf, arg, sizeof(get_dma_buf)))
> +		return -EFAULT;
> +
> +	p2p_areas = memdup_array_user(&arg->p2p_areas,
> +				      get_dma_buf.nr_areas,
> +				      sizeof(*p2p_areas));
> +	if (IS_ERR(p2p_areas))
> +		return PTR_ERR(p2p_areas);
> +
> +	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	ret = -ERANGE;
> +	for (i = 0; i < get_dma_buf.nr_areas; i++) {
> +		/*
> +		 * For PCI the region_index is the BAR number like
> +		 * everything else.
> +		 */
> +		if (p2p_areas[i].region_index >= VFIO_PCI_ROM_REGION_INDEX) {
> +			goto err_free_priv;
> +		}
> +
> +		if (!IS_ALIGNED(p2p_areas[i].offset, PAGE_SIZE) ||
> +		    !IS_ALIGNED(p2p_areas[i].length, PAGE_SIZE))
> +			goto err_free_priv;
> +
> +		priv->nr_pages += p2p_areas[i].length >> PAGE_SHIFT;
> +	}
> +
> +	if (!priv->nr_pages)
> +		goto err_free_priv;
> +
> +	priv->pages = kmalloc_array(priv->nr_pages,
> +				    sizeof(*priv->pages), GFP_KERNEL);
> +	if (!priv->pages) {
> +		ret = -ENOMEM;
> +		goto err_free_priv;
> +	}
> +
> +	priv->vdev = vdev;
> +	ret = create_p2p_pages(priv, get_dma_buf.nr_areas, p2p_areas);
> +	if (ret)
> +		goto err_free_priv;
> +
> +	exp_info.ops = &vfio_pci_dmabuf_ops;
> +	exp_info.size = priv->nr_pages << PAGE_SHIFT;
> +	exp_info.flags = get_dma_buf.open_flags;
> +	exp_info.priv = priv;
> +
> +	priv->dmabuf = dma_buf_export(&exp_info);
> +	if (IS_ERR(priv->dmabuf)) {
> +		ret = PTR_ERR(priv->dmabuf);
> +		goto err_free_pages;
> +	}
> +
> +	/* dma_buf_put() now frees priv */
> +	INIT_LIST_HEAD(&priv->dmabufs_elm);
> +	down_write(&vdev->memory_lock);
> +	dma_resv_lock(priv->dmabuf->resv, NULL);
> +	priv->revoked = !__vfio_pci_memory_enabled(vdev);
> +	vfio_device_try_get_registration(&vdev->vdev);
> +	list_add_tail(&priv->dmabufs_elm, &vdev->dmabufs);
> +	dma_resv_unlock(priv->dmabuf->resv);
> +	up_write(&vdev->memory_lock);
> +	kfree(p2p_areas);
> +
> +	/*
> +	 * dma_buf_fd() consumes the reference, when the file closes the dmabuf
> +	 * will be released.
> +	 */
> +	return dma_buf_fd(priv->dmabuf, get_dma_buf.open_flags);
> +
> +err_free_pages:
> +	release_p2p_pages(priv, priv->nr_pages);
> +err_free_priv:
> +	kfree(p2p_areas);
> +	kfree(priv->pages);
> +	kfree(priv);
> +	return ret;
> +}
> +
> +void vfio_pci_dma_buf_move(struct vfio_pci_core_device *vdev, bool revoked)
> +{
> +	struct vfio_pci_dma_buf *priv;
> +	struct vfio_pci_dma_buf *tmp;
> +
> +	lockdep_assert_held_write(&vdev->memory_lock);
> +
> +	list_for_each_entry_safe(priv, tmp, &vdev->dmabufs, dmabufs_elm) {
> +		if (!get_file_rcu(&priv->dmabuf->file))
> +			continue;
> +		if (priv->revoked != revoked) {
> +			dma_resv_lock(priv->dmabuf->resv, NULL);
> +			priv->revoked = revoked;
> +			dma_buf_move_notify(priv->dmabuf);
> +			dma_resv_unlock(priv->dmabuf->resv);
> +		}
> +		dma_buf_put(priv->dmabuf);
> +	}
> +}
> +
> +void vfio_pci_dma_buf_cleanup(struct vfio_pci_core_device *vdev)
> +{
> +	struct vfio_pci_dma_buf *priv;
> +	struct vfio_pci_dma_buf *tmp;
> +
> +	down_write(&vdev->memory_lock);
> +	list_for_each_entry_safe(priv, tmp, &vdev->dmabufs, dmabufs_elm) {
> +		if (!get_file_rcu(&priv->dmabuf->file))
> +			continue;
> +		dma_resv_lock(priv->dmabuf->resv, NULL);
> +		list_del_init(&priv->dmabufs_elm);
> +		priv->vdev = NULL;
> +		priv->revoked = true;
> +		dma_buf_move_notify(priv->dmabuf);
> +		dma_resv_unlock(priv->dmabuf->resv);
> +		vfio_device_put_registration(&vdev->vdev);
> +		dma_buf_put(priv->dmabuf);
> +	}
> +	up_write(&vdev->memory_lock);
> +}
> diff --git a/drivers/vfio/pci/vfio_pci_config.c b/drivers/vfio/pci/vfio_pci_config.c
> index 97422aafaa7b..c605c5cb0078 100644
> --- a/drivers/vfio/pci/vfio_pci_config.c
> +++ b/drivers/vfio/pci/vfio_pci_config.c
> @@ -585,10 +585,12 @@ static int vfio_basic_config_write(struct vfio_pci_core_device *vdev, int pos,
>   		virt_mem = !!(le16_to_cpu(*virt_cmd) & PCI_COMMAND_MEMORY);
>   		new_mem = !!(new_cmd & PCI_COMMAND_MEMORY);
>   
> -		if (!new_mem)
> +		if (!new_mem) {
>   			vfio_pci_zap_and_down_write_memory_lock(vdev);
> -		else
> +			vfio_pci_dma_buf_move(vdev, true);
> +		} else {
>   			down_write(&vdev->memory_lock);
> +		}
>   
>   		/*
>   		 * If the user is writing mem/io enable (new_mem/io) and we
> @@ -623,6 +625,8 @@ static int vfio_basic_config_write(struct vfio_pci_core_device *vdev, int pos,
>   		*virt_cmd &= cpu_to_le16(~mask);
>   		*virt_cmd |= cpu_to_le16(new_cmd & mask);
>   
> +		if (__vfio_pci_memory_enabled(vdev))
> +			vfio_pci_dma_buf_move(vdev, false);
>   		up_write(&vdev->memory_lock);
>   	}
>   
> diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
> index d94d61b92c1a..d2ef982bdb3e 100644
> --- a/drivers/vfio/pci/vfio_pci_core.c
> +++ b/drivers/vfio/pci/vfio_pci_core.c
> @@ -700,6 +700,8 @@ void vfio_pci_core_close_device(struct vfio_device *core_vdev)
>   #endif
>   	vfio_pci_core_disable(vdev);
>   
> +	vfio_pci_dma_buf_cleanup(vdev);
> +
>   	mutex_lock(&vdev->igate);
>   	if (vdev->err_trigger) {
>   		eventfd_ctx_put(vdev->err_trigger);
> @@ -1246,7 +1248,10 @@ static int vfio_pci_ioctl_reset(struct vfio_pci_core_device *vdev,
>   	 */
>   	vfio_pci_set_power_state(vdev, PCI_D0);
>   
> +	vfio_pci_dma_buf_move(vdev, true);
>   	ret = pci_try_reset_function(vdev->pdev);
> +	if (__vfio_pci_memory_enabled(vdev))
> +		vfio_pci_dma_buf_move(vdev, false);
>   	up_write(&vdev->memory_lock);
>   
>   	return ret;
> @@ -1467,11 +1472,10 @@ long vfio_pci_core_ioctl(struct vfio_device *core_vdev, unsigned int cmd,
>   }
>   EXPORT_SYMBOL_GPL(vfio_pci_core_ioctl);
>   
> -static int vfio_pci_core_feature_token(struct vfio_device *device, u32 flags,
> -				       uuid_t __user *arg, size_t argsz)
> +static int vfio_pci_core_feature_token(struct vfio_pci_core_device *vdev,
> +				       u32 flags, uuid_t __user *arg,
> +				       size_t argsz)
>   {
> -	struct vfio_pci_core_device *vdev =
> -		container_of(device, struct vfio_pci_core_device, vdev);
>   	uuid_t uuid;
>   	int ret;
>   
> @@ -1498,6 +1502,9 @@ static int vfio_pci_core_feature_token(struct vfio_device *device, u32 flags,
>   int vfio_pci_core_ioctl_feature(struct vfio_device *device, u32 flags,
>   				void __user *arg, size_t argsz)
>   {
> +	struct vfio_pci_core_device *vdev =
> +			container_of(device, struct vfio_pci_core_device, vdev);
> +
>   	switch (flags & VFIO_DEVICE_FEATURE_MASK) {
>   	case VFIO_DEVICE_FEATURE_LOW_POWER_ENTRY:
>   		return vfio_pci_core_pm_entry(device, flags, arg, argsz);
> @@ -1507,7 +1514,9 @@ int vfio_pci_core_ioctl_feature(struct vfio_device *device, u32 flags,
>   	case VFIO_DEVICE_FEATURE_LOW_POWER_EXIT:
>   		return vfio_pci_core_pm_exit(device, flags, arg, argsz);
>   	case VFIO_DEVICE_FEATURE_PCI_VF_TOKEN:
> -		return vfio_pci_core_feature_token(device, flags, arg, argsz);
> +		return vfio_pci_core_feature_token(vdev, flags, arg, argsz);
> +	case VFIO_DEVICE_FEATURE_DMA_BUF:
> +		return vfio_pci_core_feature_dma_buf(vdev, flags, arg, argsz);
>   	default:
>   		return -ENOTTY;
>   	}
> @@ -2182,6 +2191,7 @@ int vfio_pci_core_init_dev(struct vfio_device *core_vdev)
>   	mutex_init(&vdev->vma_lock);
>   	INIT_LIST_HEAD(&vdev->vma_list);
>   	INIT_LIST_HEAD(&vdev->sriov_pfs_item);
> +	INIT_LIST_HEAD(&vdev->dmabufs);
>   	init_rwsem(&vdev->memory_lock);
>   	xa_init(&vdev->ctx);
>   
> @@ -2576,11 +2586,17 @@ static int vfio_pci_dev_set_hot_reset(struct vfio_device_set *dev_set,
>   	 * cause the PCI config space reset without restoring the original
>   	 * state (saved locally in 'vdev->pm_save').
>   	 */
> -	list_for_each_entry(cur, &dev_set->device_list, vdev.dev_set_list)
> +	list_for_each_entry(cur, &dev_set->device_list, vdev.dev_set_list) {
> +		vfio_pci_dma_buf_move(cur, true);
>   		vfio_pci_set_power_state(cur, PCI_D0);
> +	}
>   
>   	ret = pci_reset_bus(pdev);
>   
> +	list_for_each_entry(cur, &dev_set->device_list, vdev.dev_set_list)
> +		if (__vfio_pci_memory_enabled(cur))
> +			vfio_pci_dma_buf_move(cur, false);
> +
>   err_undo:
>   	list_for_each_entry(cur, &dev_set->device_list, vdev.dev_set_list) {
>   		if (cur == cur_mem)
> diff --git a/drivers/vfio/pci/vfio_pci_priv.h b/drivers/vfio/pci/vfio_pci_priv.h
> index 5e4fa69aee16..09d3c300918c 100644
> --- a/drivers/vfio/pci/vfio_pci_priv.h
> +++ b/drivers/vfio/pci/vfio_pci_priv.h
> @@ -101,4 +101,27 @@ static inline bool vfio_pci_is_vga(struct pci_dev *pdev)
>   	return (pdev->class >> 8) == PCI_CLASS_DISPLAY_VGA;
>   }
>   
> +#ifdef CONFIG_DMA_SHARED_BUFFER
> +int vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 flags,
> +				  struct vfio_device_feature_dma_buf __user *arg,
> +				  size_t argsz);
> +void vfio_pci_dma_buf_cleanup(struct vfio_pci_core_device *vdev);
> +void vfio_pci_dma_buf_move(struct vfio_pci_core_device *vdev, bool revoked);
> +#else
> +static int
> +vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 flags,
> +			      struct vfio_device_feature_dma_buf __user *arg,
> +			      size_t argsz)
> +{
> +	return -ENOTTY;
> +}
> +static inline void vfio_pci_dma_buf_cleanup(struct vfio_pci_core_device *vdev)
> +{
> +}
> +static inline void vfio_pci_dma_buf_move(struct vfio_pci_core_device *vdev,
> +					 bool revoked)
> +{
> +}
> +#endif
> +
>   #endif
> diff --git a/include/linux/vfio_pci_core.h b/include/linux/vfio_pci_core.h
> index a2c8b8bba711..387cce561dad 100644
> --- a/include/linux/vfio_pci_core.h
> +++ b/include/linux/vfio_pci_core.h
> @@ -96,6 +96,7 @@ struct vfio_pci_core_device {
>   	struct mutex		vma_lock;
>   	struct list_head	vma_list;
>   	struct rw_semaphore	memory_lock;
> +	struct list_head	dmabufs;
>   };
>   
>   /* Will be exported for vfio pci drivers usage */
> diff --git a/include/uapi/linux/vfio.h b/include/uapi/linux/vfio.h
> index 2b68e6cdf190..47d230c5df25 100644
> --- a/include/uapi/linux/vfio.h
> +++ b/include/uapi/linux/vfio.h
> @@ -1458,6 +1458,31 @@ struct vfio_device_feature_bus_master {
>   };
>   #define VFIO_DEVICE_FEATURE_BUS_MASTER 10
>   
> +/**
> + * Upon VFIO_DEVICE_FEATURE_GET create a dma_buf fd for the
> + * region selected.
> + *
> + * open_flags are the typical flags passed to open(2), eg O_RDWR, O_CLOEXEC,
> + * etc. offset/length specify a slice of the region to create the dmabuf from.
> + * If both are 0 then the whole region is used.
> + *
> + * Return: The fd number on success, -1 and errno is set on failure.
> + */
> +#define VFIO_DEVICE_FEATURE_DMA_BUF 11
> +
> +struct vfio_region_p2p_area {
> +	__u32	region_index;
> +	__u32	__pad;
> +	__u64	offset;
> +	__u64	length;
> +};
> +
> +struct vfio_device_feature_dma_buf {
> +	__u32	open_flags;
> +	__u32	nr_areas;
> +	struct vfio_region_p2p_area p2p_areas[];
> +};
> +
>   /* -------- API for Type1 VFIO IOMMU -------- */
>   
>   /**

