Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B29DB15470
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jul 2025 22:54:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 086EE10E670;
	Tue, 29 Jul 2025 20:54:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=deltatee.com header.i=@deltatee.com header.b="ShHf+ekc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ale.deltatee.com (ale.deltatee.com [204.191.154.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0909F10E2B4
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 20:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=deltatee.com; s=20200525; h=Subject:In-Reply-To:References:Cc:To:From:
 MIME-Version:Date:Message-ID:content-disposition;
 bh=NNh1yThG7TvPWKpLvY5OC7tLgkYClB2Gxhne1Vp0HTw=; b=ShHf+ekceHcINuu8D0K30j3qUO
 L9xqTvYP9Zh8bk//ApqFzejUahb6bACPQNlM5iV2A1IRyuDGPfzEQSqmXhx/bf9dL9cTxYDN4p1dO
 50kSae/x3VuYLc4DSVcE7A32AkN9a8vnc7cWq76JX7ZFC29ItBPasnUx2PUIOypT5NvQJIqqQpb+A
 hKS/mcRzJw9NmBzbYunfCu5/y6lbCyBnLxF5fuWkORd2HDquxo3R8hxzx9e/Jxu7yv1HNrpU9R5TP
 HOqWZkyevVjQIYp4dmyfA+4gv+aeKblKfLpxMhglWKNR2gAcipr0qNsWYlfNjGHBFoQ3Nad1bjaCo
 0fckrAUw==;
Received: from guinness.priv.deltatee.com ([172.16.1.162])
 by ale.deltatee.com with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <logang@deltatee.com>) id 1ugrL8-009DTi-1i;
 Tue, 29 Jul 2025 14:54:27 -0600
Message-ID: <f332e2b9-151f-49ca-ac0c-8c9494c38027@deltatee.com>
Date: Tue, 29 Jul 2025 14:54:13 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Logan Gunthorpe <logang@deltatee.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Leon Romanovsky <leon@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Alex Williamson <alex.williamson@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, iommu@lists.linux.dev,
 Jens Axboe <axboe@kernel.dk>, =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?=
 <jglisse@redhat.com>, Joerg Roedel <joro@8bytes.org>, kvm@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mm@kvack.org, linux-pci@vger.kernel.org,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, Will Deacon <will@kernel.org>
References: <cover.1753274085.git.leonro@nvidia.com>
 <82e62eb59afcd39b68ae143573d5ed113a92344e.1753274085.git.leonro@nvidia.com>
 <20250724080313.GA31887@lst.de> <20250724081321.GT402218@unreal>
 <b32ae619-6c4a-46fc-a368-6ad4e245d581@deltatee.com>
 <20250727190514.GG7551@nvidia.com>
 <d69e0d74-285e-4cde-a2e4-a803accfa9e1@deltatee.com>
 <20250728164136.GD402218@unreal>
 <d3c8c573-f201-4450-9400-cc3ccafd2c04@deltatee.com>
 <20250728231107.GE36037@nvidia.com>
Content-Language: en-CA
In-Reply-To: <20250728231107.GE36037@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 172.16.1.162
X-SA-Exim-Rcpt-To: jgg@nvidia.com, leon@kernel.org, hch@lst.de,
 alex.williamson@redhat.com, akpm@linux-foundation.org, bhelgaas@google.com,
 christian.koenig@amd.com, dri-devel@lists.freedesktop.org,
 iommu@lists.linux.dev, axboe@kernel.dk, jglisse@redhat.com, joro@8bytes.org,
 kvm@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mm@kvack.org, linux-pci@vger.kernel.org,
 m.szyprowski@samsung.com, robin.murphy@arm.com, sumit.semwal@linaro.org,
 vivek.kasireddy@intel.com, will@kernel.org
X-SA-Exim-Mail-From: logang@deltatee.com
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on ale.deltatee.com
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=5.0 tests=ALL_TRUSTED,BAYES_00,
 MYRULES_FREE autolearn=no autolearn_force=no version=4.0.1
Subject: Re: [PATCH 05/10] PCI/P2PDMA: Export pci_p2pdma_map_type() function
X-SA-Exim-Version: 4.2.1 (built Wed, 06 Jul 2022 17:57:39 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
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



On 2025-07-28 17:11, Jason Gunthorpe wrote:
>> If the dma mapping for P2P memory doesn't need to create an iommu
>> mapping then that's fine. But it should be the dma-iommu layer to decide
>> that.
> 
> So above, we can't use dma-iommu.c, it might not be compiled into the
> kernel but the dma_map_phys() path is still valid.

This is an easily solved problem. I did a very rough sketch below to say
it's really not that hard. (Note it has some rough edges that could be
cleaned up and I based it off Leon's git repo which appears to not be
the same as what was posted, but the core concept is sound).

Logan


diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index 1853a969e197..da1a6003620a 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -1806,6 +1806,22 @@ bool dma_iova_try_alloc(struct device *dev,
struct dma_iova_state *state,
 }
 EXPORT_SYMBOL_GPL(dma_iova_try_alloc);
 +void dma_iova_try_alloc_p2p(struct p2pdma_provider *provider, struct
device *dev,
+		struct dma_iova_state *state, phys_addr_t phys, size_t size)
+{
+	switch (pci_p2pdma_map_type(provider, dev)) {
+	case PCI_P2PDMA_MAP_THRU_HOST_BRIDGE:
+		dma_iova_try_alloc(dev, state, phys, size);
+		return;
+	case PCI_P2PDMA_MAP_BUS_ADDR:
+		state->bus_addr = true;
+		return;
+	default:
+		return;
+	}
+}
+EXPORT_SYMBOL_GPL(dma_iova_try_alloc_p2p);
+
 /**
  * dma_iova_free - Free an IOVA space
  * @dev: Device to free the IOVA space for
diff --git a/drivers/vfio/pci/vfio_pci_dmabuf.c
b/drivers/vfio/pci/vfio_pci_dmabuf.c
index 455541d21538..5749be3a9b58 100644
--- a/drivers/vfio/pci/vfio_pci_dmabuf.c
+++ b/drivers/vfio/pci/vfio_pci_dmabuf.c
@@ -30,25 +30,12 @@ static int vfio_pci_dma_buf_attach(struct dma_buf
*dmabuf,
 	if (priv->revoked)
 		return -ENODEV;
 -	switch (pci_p2pdma_map_type(priv->vdev->provider, attachment->dev)) {
-	case PCI_P2PDMA_MAP_THRU_HOST_BRIDGE:
-		break;
-	case PCI_P2PDMA_MAP_BUS_ADDR:
-		/*
-		 * There is no need in IOVA at all for this flow.
-		 * We rely on attachment->priv == NULL as a marker
-		 * for this mode.
-		 */
-		return 0;
-	default:
-		return -EINVAL;
-	}
-
 	attachment->priv = kzalloc(sizeof(struct dma_iova_state), GFP_KERNEL);
 	if (!attachment->priv)
 		return -ENOMEM;
 -	dma_iova_try_alloc(attachment->dev, attachment->priv, 0, priv->size);
+	dma_iova_try_alloc_p2p(priv->vdev->provider, attachment->dev,
+			       attachment->priv, 0, priv->size);
 	return 0;
 }
 @@ -98,26 +85,11 @@ vfio_pci_dma_buf_map(struct dma_buf_attachment
*attachment,
 	sgl = sgt->sgl;
  	for (i = 0; i < priv->nr_ranges; i++) {
-		if (!state) {
-			addr = pci_p2pdma_bus_addr_map(provider,
-						       phys_vec[i].paddr);
-		} else if (dma_use_iova(state)) {
-			ret = dma_iova_link(attachment->dev, state,
-					    phys_vec[i].paddr, 0,
-					    phys_vec[i].len, dir, attrs);
-			if (ret)
-				goto err_unmap_dma;
-
-			mapped_len += phys_vec[i].len;
-		} else {
-			addr = dma_map_phys(attachment->dev, phys_vec[i].paddr,
-					    phys_vec[i].len, dir, attrs);
-			ret = dma_mapping_error(attachment->dev, addr);
-			if (ret)
-				goto err_unmap_dma;
-		}
+		addr = dma_map_phys_prealloc(attachment->dev, phys_vec[i].paddr,
+					     phys_vec[i].len, dir, attrs, state,
+					     provider);
 -		if (!state || !dma_use_iova(state)) {
+		if (addr != DMA_MAPPING_USE_IOVA) {
 			/*
 			 * In IOVA case, there is only one SG entry which spans
 			 * for whole IOVA address space. So there is no need
@@ -128,7 +100,7 @@ vfio_pci_dma_buf_map(struct dma_buf_attachment
*attachment,
 		}
 	}
 -	if (state && dma_use_iova(state)) {
+	if (addr == DMA_MAPPING_USE_IOVA) {
 		WARN_ON_ONCE(mapped_len != priv->size);
 		ret = dma_iova_sync(attachment->dev, state, 0, mapped_len);
 		if (ret)
@@ -139,7 +111,7 @@ vfio_pci_dma_buf_map(struct dma_buf_attachment
*attachment,
 	return sgt;
  err_unmap_dma:
-	if (!i || !state)
+	if (!i || state->bus_addr)
 		; /* Do nothing */
 	else if (dma_use_iova(state))
 		dma_iova_destroy(attachment->dev, state, mapped_len, dir,
@@ -164,7 +136,7 @@ static void vfio_pci_dma_buf_unmap(struct
dma_buf_attachment *attachment,
 	struct scatterlist *sgl;
 	int i;
 -	if (!state)
+	if (state->bus_addr)
 		; /* Do nothing */
 	else if (dma_use_iova(state))
 		dma_iova_destroy(attachment->dev, state, priv->size, dir,
diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
index ba54bbeca861..675e5ac13265 100644
--- a/include/linux/dma-mapping.h
+++ b/include/linux/dma-mapping.h
@@ -70,11 +70,14 @@
  */
 #define DMA_MAPPING_ERROR		(~(dma_addr_t)0)
 +#define DMA_MAPPING_USE_IOVA		((dma_addr_t)-2)
+
 #define DMA_BIT_MASK(n)	(((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
  struct dma_iova_state {
 	dma_addr_t addr;
 	u64 __size;
+	bool bus_addr;
 };
  /*
@@ -120,6 +123,12 @@ void dma_unmap_page_attrs(struct device *dev,
dma_addr_t addr, size_t size,
 		enum dma_data_direction dir, unsigned long attrs);
 dma_addr_t dma_map_phys(struct device *dev, phys_addr_t phys, size_t size,
 		enum dma_data_direction dir, unsigned long attrs);
+
+struct p2pdma_provider;
+dma_addr_t dma_map_phys_prealloc(struct device *dev, phys_addr_t phys,
size_t size,
+		enum dma_data_direction dir, unsigned long attrs,
+		struct dma_iova_state *state, struct p2pdma_provider *provider);
+
 void dma_unmap_phys(struct device *dev, dma_addr_t addr, size_t size,
 		enum dma_data_direction dir, unsigned long attrs);
 unsigned int dma_map_sg_attrs(struct device *dev, struct scatterlist *sg,
@@ -321,6 +330,8 @@ static inline bool dma_use_iova(struct
dma_iova_state *state)
  bool dma_iova_try_alloc(struct device *dev, struct dma_iova_state *state,
 		phys_addr_t phys, size_t size);
+void dma_iova_try_alloc_p2p(struct p2pdma_provider *provider, struct
device *dev,
+		struct dma_iova_state *state, phys_addr_t phys, size_t size);
 void dma_iova_free(struct device *dev, struct dma_iova_state *state);
 void dma_iova_destroy(struct device *dev, struct dma_iova_state *state,
 		size_t mapped_len, enum dma_data_direction dir,
@@ -343,6 +354,11 @@ static inline bool dma_iova_try_alloc(struct device
*dev,
 {
 	return false;
 }
+static inline void dma_iova_try_alloc_p2p(struct p2pdma_provider *provider,
+		struct device *dev, struct dma_iova_state *state, phys_addr_t phys,
+		size_t size)
+{
+}
 static inline void dma_iova_free(struct device *dev,
 		struct dma_iova_state *state)
 {
diff --git a/kernel/dma/mapping.c b/kernel/dma/mapping.c
index e1586eb52ab3..b2110098a29b 100644
--- a/kernel/dma/mapping.c
+++ b/kernel/dma/mapping.c
@@ -13,6 +13,7 @@
 #include <linux/iommu-dma.h>
 #include <linux/kmsan.h>
 #include <linux/of_device.h>
+#include <linux/pci-p2pdma.h>
 #include <linux/slab.h>
 #include <linux/vmalloc.h>
 #include "debug.h"
@@ -202,6 +203,27 @@ dma_addr_t dma_map_phys(struct device *dev,
phys_addr_t phys, size_t size,
 }
 EXPORT_SYMBOL_GPL(dma_map_phys);
 +dma_addr_t dma_map_phys_prealloc(struct device *dev, phys_addr_t phys,
size_t size,
+		enum dma_data_direction dir, unsigned long attrs,
+		struct dma_iova_state *state, struct p2pdma_provider *provider)
+{
+	int ret;
+
+	if (state->bus_addr)
+		return pci_p2pdma_bus_addr_map(provider, phys);
+
+	if (dma_use_iova(state)) {
+		ret = dma_iova_link(dev, state, phys, 0, size, dir, attrs);
+		if (ret)
+			return DMA_MAPPING_ERROR;
+
+		return DMA_MAPPING_USE_IOVA;
+	}
+
+	return dma_map_phys(dev, phys, size, dir, attrs);
+}
+EXPORT_SYMBOL_GPL(dma_map_phys_prealloc);
+
 dma_addr_t dma_map_page_attrs(struct device *dev, struct page *page,
 		size_t offset, size_t size, enum dma_data_direction dir,
 		unsigned long attrs)


