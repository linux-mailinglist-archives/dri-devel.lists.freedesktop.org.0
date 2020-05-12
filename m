Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F451CFCA4
	for <lists+dri-devel@lfdr.de>; Tue, 12 May 2020 19:52:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E38666E951;
	Tue, 12 May 2020 17:52:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF72E6E951
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 17:52:41 +0000 (UTC)
IronPort-SDR: T4cn4V+IiNFecM29mrkq2eRrEGkB9XLTuNWWqgfB43bStM7dwwN+DNB0x/VrX/X46vqlf/Si5B
 osx5Xom/0hTw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2020 10:52:40 -0700
IronPort-SDR: ZL/7MhQfCbgOFA+eAZA11RQiRbCYYyQOo2xUToXFTjAB6Dkyx/1RtNCsU3sz9r8EizRDByU+ja
 eQqYQB5Qv/pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,384,1583222400"; d="scan'208";a="286736341"
Received: from fmsmsx105.amr.corp.intel.com ([10.18.124.203])
 by fmsmga004.fm.intel.com with ESMTP; 12 May 2020 10:52:40 -0700
Received: from fmsmsx112.amr.corp.intel.com (10.18.116.6) by
 FMSMSX105.amr.corp.intel.com (10.18.124.203) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 12 May 2020 10:52:40 -0700
Received: from fmsmsx108.amr.corp.intel.com ([169.254.9.60]) by
 FMSMSX112.amr.corp.intel.com ([169.254.5.239]) with mapi id 14.03.0439.000;
 Tue, 12 May 2020 10:52:40 -0700
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v4 38/38] videobuf2: use sgtable-based scatterlist wrappers
Thread-Topic: [PATCH v4 38/38] videobuf2: use sgtable-based scatterlist
 wrappers
Thread-Index: AQHWKDwP0fqa3BxGckm0EsGy+4sAaqikud8Q
Date: Tue, 12 May 2020 17:52:39 +0000
Message-ID: <14063C7AD467DE4B82DEDB5C278E8663010E210FAC@FMSMSX108.amr.corp.intel.com>
References: <20200512085710.14688-1-m.szyprowski@samsung.com>
 <20200512090058.14910-1-m.szyprowski@samsung.com>
 <CGME20200512090130eucas1p2eb86c5d34be56bbc81032bc0b6927d1e@eucas1p2.samsung.com>
 <20200512090058.14910-38-m.szyprowski@samsung.com>
In-Reply-To: <20200512090058.14910-38-m.szyprowski@samsung.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.1.200.106]
MIME-Version: 1.0
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
Cc: Pawel Osciak <pawel@osciak.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



>-----Original Message-----
>From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of
>Marek Szyprowski
>Sent: Tuesday, May 12, 2020 5:01 AM
>To: dri-devel@lists.freedesktop.org; iommu@lists.linux-foundation.org;
>linaro-mm-sig@lists.linaro.org; linux-kernel@vger.kernel.org
>Cc: Pawel Osciak <pawel@osciak.com>; Bartlomiej Zolnierkiewicz
><b.zolnierkie@samsung.com>; David Airlie <airlied@linux.ie>; linux-
>media@vger.kernel.org; Hans Verkuil <hverkuil-cisco@xs4all.nl>; Mauro
>Carvalho Chehab <mchehab@kernel.org>; Robin Murphy
><robin.murphy@arm.com>; Christoph Hellwig <hch@lst.de>; linux-arm-
>kernel@lists.infradead.org; Marek Szyprowski
><m.szyprowski@samsung.com>
>Subject: [PATCH v4 38/38] videobuf2: use sgtable-based scatterlist wrappers
>
>Use recently introduced common wrappers operating directly on the struct
>sg_table objects and scatterlist page iterators to make the code a bit
>more compact, robust, easier to follow and copy/paste safe.
>
>No functional change, because the code already properly did all the
>scaterlist related calls.
>
>Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>---
>For more information, see '[PATCH v4 00/38] DRM: fix struct sg_table nents
>vs. orig_nents misuse' thread:
>https://lore.kernel.org/dri-devel/20200512085710.14688-1-
>m.szyprowski@samsung.com/T/
>---
> .../media/common/videobuf2/videobuf2-dma-contig.c  | 41 ++++++++++----
>--------
> drivers/media/common/videobuf2/videobuf2-dma-sg.c  | 32 +++++++--------
>--
> drivers/media/common/videobuf2/videobuf2-vmalloc.c | 12 +++----
> 3 files changed, 34 insertions(+), 51 deletions(-)
>
>diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
>b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
>index d3a3ee5..bf31a9d 100644
>--- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
>+++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
>@@ -48,16 +48,15 @@ struct vb2_dc_buf {
>
> static unsigned long vb2_dc_get_contiguous_size(struct sg_table *sgt)
> {
>-	struct scatterlist *s;
> 	dma_addr_t expected = sg_dma_address(sgt->sgl);
>-	unsigned int i;
>+	struct sg_dma_page_iter dma_iter;
> 	unsigned long size = 0;
>
>-	for_each_sg(sgt->sgl, s, sgt->nents, i) {
>-		if (sg_dma_address(s) != expected)
>+	for_each_sgtable_dma_page(sgt, &dma_iter, 0) {
>+		if (sg_page_iter_dma_address(&dma_iter) != expected)
> 			break;
>-		expected = sg_dma_address(s) + sg_dma_len(s);
>-		size += sg_dma_len(s);
>+		expected += PAGE_SIZE;
>+		size += PAGE_SIZE;

This code in drm_prime_t_contiguous_size and here.  I seem to remember seeing
the same pattern in other drivers.

Would it worthwhile to make this a helper as well?

Also, isn't the sg_dma_len() the actual length of the chunk we are looking at?

If its I not PAGE_SIZE (ie. dma chunk is 4 * PAGE_SIZE?), does your loop/calculation still work?

Thanks,

Mike

> 	}
> 	return size;
> }
>@@ -99,8 +98,7 @@ static void vb2_dc_prepare(void *buf_priv)
> 	if (!sgt || buf->db_attach)
> 		return;
>
>-	dma_sync_sg_for_device(buf->dev, sgt->sgl, sgt->orig_nents,
>-			       buf->dma_dir);
>+	dma_sync_sgtable_for_device(buf->dev, sgt, buf->dma_dir);
> }
>
> static void vb2_dc_finish(void *buf_priv)
>@@ -112,7 +110,7 @@ static void vb2_dc_finish(void *buf_priv)
> 	if (!sgt || buf->db_attach)
> 		return;
>
>-	dma_sync_sg_for_cpu(buf->dev, sgt->sgl, sgt->orig_nents, buf-
>>dma_dir);
>+	dma_sync_sgtable_for_cpu(buf->dev, sgt, buf->dma_dir);
> }
>
> /*********************************************/
>@@ -273,8 +271,8 @@ static void vb2_dc_dmabuf_ops_detach(struct
>dma_buf *dbuf,
> 		 * memory locations do not require any explicit cache
> 		 * maintenance prior or after being used by the device.
> 		 */
>-		dma_unmap_sg_attrs(db_attach->dev, sgt->sgl, sgt-
>>orig_nents,
>-				   attach->dma_dir,
>DMA_ATTR_SKIP_CPU_SYNC);
>+		dma_unmap_sgtable(db_attach->dev, sgt, attach->dma_dir,
>+				  DMA_ATTR_SKIP_CPU_SYNC);
> 	sg_free_table(sgt);
> 	kfree(attach);
> 	db_attach->priv = NULL;
>@@ -299,8 +297,8 @@ static struct sg_table *vb2_dc_dmabuf_ops_map(
>
> 	/* release any previous cache */
> 	if (attach->dma_dir != DMA_NONE) {
>-		dma_unmap_sg_attrs(db_attach->dev, sgt->sgl, sgt-
>>orig_nents,
>-				   attach->dma_dir,
>DMA_ATTR_SKIP_CPU_SYNC);
>+		dma_unmap_sgtable(db_attach->dev, sgt, attach->dma_dir,
>+				  DMA_ATTR_SKIP_CPU_SYNC);
> 		attach->dma_dir = DMA_NONE;
> 	}
>
>@@ -308,9 +306,8 @@ static struct sg_table *vb2_dc_dmabuf_ops_map(
> 	 * mapping to the client with new direction, no cache sync
> 	 * required see comment in vb2_dc_dmabuf_ops_detach()
> 	 */
>-	sgt->nents = dma_map_sg_attrs(db_attach->dev, sgt->sgl, sgt-
>>orig_nents,
>-				      dma_dir, DMA_ATTR_SKIP_CPU_SYNC);
>-	if (!sgt->nents) {
>+	if (dma_map_sgtable(db_attach->dev, sgt, dma_dir,
>+			    DMA_ATTR_SKIP_CPU_SYNC)) {
> 		pr_err("failed to map scatterlist\n");
> 		mutex_unlock(lock);
> 		return ERR_PTR(-EIO);
>@@ -423,8 +420,8 @@ static void vb2_dc_put_userptr(void *buf_priv)
> 		 * No need to sync to CPU, it's already synced to the CPU
> 		 * since the finish() memop will have been called before this.
> 		 */
>-		dma_unmap_sg_attrs(buf->dev, sgt->sgl, sgt->orig_nents,
>-				   buf->dma_dir,
>DMA_ATTR_SKIP_CPU_SYNC);
>+		dma_unmap_sgtable(buf->dev, sgt, buf->dma_dir,
>+				  DMA_ATTR_SKIP_CPU_SYNC);
> 		pages = frame_vector_pages(buf->vec);
> 		/* sgt should exist only if vector contains pages... */
> 		BUG_ON(IS_ERR(pages));
>@@ -521,9 +518,8 @@ static void *vb2_dc_get_userptr(struct device *dev,
>unsigned long vaddr,
> 	 * No need to sync to the device, this will happen later when the
> 	 * prepare() memop is called.
> 	 */
>-	sgt->nents = dma_map_sg_attrs(buf->dev, sgt->sgl, sgt->orig_nents,
>-				      buf->dma_dir,
>DMA_ATTR_SKIP_CPU_SYNC);
>-	if (sgt->nents <= 0) {
>+	if (dma_map_sgtable(buf->dev, sgt, buf->dma_dir,
>+			    DMA_ATTR_SKIP_CPU_SYNC)) {
> 		pr_err("failed to map scatterlist\n");
> 		ret = -EIO;
> 		goto fail_sgt_init;
>@@ -545,8 +541,7 @@ static void *vb2_dc_get_userptr(struct device *dev,
>unsigned long vaddr,
> 	return buf;
>
> fail_map_sg:
>-	dma_unmap_sg_attrs(buf->dev, sgt->sgl, sgt->orig_nents,
>-			   buf->dma_dir, DMA_ATTR_SKIP_CPU_SYNC);
>+	dma_unmap_sgtable(buf->dev, sgt, buf->dma_dir,
>DMA_ATTR_SKIP_CPU_SYNC);
>
> fail_sgt_init:
> 	sg_free_table(sgt);
>diff --git a/drivers/media/common/videobuf2/videobuf2-dma-sg.c
>b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
>index 92072a0..6ddf953 100644
>--- a/drivers/media/common/videobuf2/videobuf2-dma-sg.c
>+++ b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
>@@ -142,9 +142,8 @@ static void *vb2_dma_sg_alloc(struct device *dev,
>unsigned long dma_attrs,
> 	 * No need to sync to the device, this will happen later when the
> 	 * prepare() memop is called.
> 	 */
>-	sgt->nents = dma_map_sg_attrs(buf->dev, sgt->sgl, sgt->orig_nents,
>-				      buf->dma_dir,
>DMA_ATTR_SKIP_CPU_SYNC);
>-	if (!sgt->nents)
>+	if (dma_map_sgtable(buf->dev, sgt, buf->dma_dir,
>+			    DMA_ATTR_SKIP_CPU_SYNC)) {
> 		goto fail_map;
>
> 	buf->handler.refcount = &buf->refcount;
>@@ -180,8 +179,8 @@ static void vb2_dma_sg_put(void *buf_priv)
> 	if (refcount_dec_and_test(&buf->refcount)) {
> 		dprintk(1, "%s: Freeing buffer of %d pages\n", __func__,
> 			buf->num_pages);
>-		dma_unmap_sg_attrs(buf->dev, sgt->sgl, sgt->orig_nents,
>-				   buf->dma_dir,
>DMA_ATTR_SKIP_CPU_SYNC);
>+		dma_unmap_sgtable(buf->dev, sgt, buf->dma_dir,
>+				  DMA_ATTR_SKIP_CPU_SYNC);
> 		if (buf->vaddr)
> 			vm_unmap_ram(buf->vaddr, buf->num_pages);
> 		sg_free_table(buf->dma_sgt);
>@@ -202,8 +201,7 @@ static void vb2_dma_sg_prepare(void *buf_priv)
> 	if (buf->db_attach)
> 		return;
>
>-	dma_sync_sg_for_device(buf->dev, sgt->sgl, sgt->orig_nents,
>-			       buf->dma_dir);
>+	dma_sync_sgtable_for_device(buf->dev, sgt, buf->dma_dir);
> }
>
> static void vb2_dma_sg_finish(void *buf_priv)
>@@ -215,7 +213,7 @@ static void vb2_dma_sg_finish(void *buf_priv)
> 	if (buf->db_attach)
> 		return;
>
>-	dma_sync_sg_for_cpu(buf->dev, sgt->sgl, sgt->orig_nents, buf-
>>dma_dir);
>+	dma_sync_sgtable_for_cpu(buf->dev, sgt, buf->dma_dir);
> }
>
> static void *vb2_dma_sg_get_userptr(struct device *dev, unsigned long
>vaddr,
>@@ -258,9 +256,8 @@ static void *vb2_dma_sg_get_userptr(struct device
>*dev, unsigned long vaddr,
> 	 * No need to sync to the device, this will happen later when the
> 	 * prepare() memop is called.
> 	 */
>-	sgt->nents = dma_map_sg_attrs(buf->dev, sgt->sgl, sgt->orig_nents,
>-				      buf->dma_dir,
>DMA_ATTR_SKIP_CPU_SYNC);
>-	if (!sgt->nents)
>+	if (dma_map_sgtable(buf->dev, sgt, buf->dma_dir,
>+			    DMA_ATTR_SKIP_CPU_SYNC)) {
> 		goto userptr_fail_map;
>
> 	return buf;
>@@ -286,8 +283,7 @@ static void vb2_dma_sg_put_userptr(void *buf_priv)
>
> 	dprintk(1, "%s: Releasing userspace buffer of %d pages\n",
> 	       __func__, buf->num_pages);
>-	dma_unmap_sg_attrs(buf->dev, sgt->sgl, sgt->orig_nents, buf-
>>dma_dir,
>-			   DMA_ATTR_SKIP_CPU_SYNC);
>+	dma_unmap_sgtable(buf->dev, sgt, buf->dma_dir,
>DMA_ATTR_SKIP_CPU_SYNC);
> 	if (buf->vaddr)
> 		vm_unmap_ram(buf->vaddr, buf->num_pages);
> 	sg_free_table(buf->dma_sgt);
>@@ -410,8 +406,7 @@ static void vb2_dma_sg_dmabuf_ops_detach(struct
>dma_buf *dbuf,
>
> 	/* release the scatterlist cache */
> 	if (attach->dma_dir != DMA_NONE)
>-		dma_unmap_sg(db_attach->dev, sgt->sgl, sgt->orig_nents,
>-			attach->dma_dir);
>+		dma_unmap_sgtable(db_attach->dev, sgt, attach->dma_dir);
> 	sg_free_table(sgt);
> 	kfree(attach);
> 	db_attach->priv = NULL;
>@@ -436,15 +431,12 @@ static struct sg_table
>*vb2_dma_sg_dmabuf_ops_map(
>
> 	/* release any previous cache */
> 	if (attach->dma_dir != DMA_NONE) {
>-		dma_unmap_sg(db_attach->dev, sgt->sgl, sgt->orig_nents,
>-			attach->dma_dir);
>+		dma_unmap_sgtable(db_attach->dev, sgt, attach->dma_dir);
> 		attach->dma_dir = DMA_NONE;
> 	}
>
> 	/* mapping to the client with new direction */
>-	sgt->nents = dma_map_sg(db_attach->dev, sgt->sgl, sgt->orig_nents,
>-				dma_dir);
>-	if (!sgt->nents) {
>+	if (dma_map_sgtable(db_attach->dev, sgt, dma_dir, 0)) {
> 		pr_err("failed to map scatterlist\n");
> 		mutex_unlock(lock);
> 		return ERR_PTR(-EIO);
>diff --git a/drivers/media/common/videobuf2/videobuf2-vmalloc.c
>b/drivers/media/common/videobuf2/videobuf2-vmalloc.c
>index c66fda4..bf5ac63 100644
>--- a/drivers/media/common/videobuf2/videobuf2-vmalloc.c
>+++ b/drivers/media/common/videobuf2/videobuf2-vmalloc.c
>@@ -229,7 +229,7 @@ static int vb2_vmalloc_dmabuf_ops_attach(struct
>dma_buf *dbuf,
> 		kfree(attach);
> 		return ret;
> 	}
>-	for_each_sg(sgt->sgl, sg, sgt->nents, i) {
>+	for_each_sgtable_sg(sgt, sg, i) {
> 		struct page *page = vmalloc_to_page(vaddr);
>
> 		if (!page) {
>@@ -259,8 +259,7 @@ static void vb2_vmalloc_dmabuf_ops_detach(struct
>dma_buf *dbuf,
>
> 	/* release the scatterlist cache */
> 	if (attach->dma_dir != DMA_NONE)
>-		dma_unmap_sg(db_attach->dev, sgt->sgl, sgt->orig_nents,
>-			attach->dma_dir);
>+		dma_unmap_sgtable(db_attach->dev, sgt, attach->dma_dir,
>0);
> 	sg_free_table(sgt);
> 	kfree(attach);
> 	db_attach->priv = NULL;
>@@ -285,15 +284,12 @@ static struct sg_table
>*vb2_vmalloc_dmabuf_ops_map(
>
> 	/* release any previous cache */
> 	if (attach->dma_dir != DMA_NONE) {
>-		dma_unmap_sg(db_attach->dev, sgt->sgl, sgt->orig_nents,
>-			attach->dma_dir);
>+		dma_unmap_sgtable(db_attach->dev, sgt, attach->dma_dir,
>0);
> 		attach->dma_dir = DMA_NONE;
> 	}
>
> 	/* mapping to the client with new direction */
>-	sgt->nents = dma_map_sg(db_attach->dev, sgt->sgl, sgt->orig_nents,
>-				dma_dir);
>-	if (!sgt->nents) {
>+	if (dma_map_sgtable(db_attach->dev, sgt, dma_dir, 0)) {
> 		pr_err("failed to map scatterlist\n");
> 		mutex_unlock(lock);
> 		return ERR_PTR(-EIO);
>--
>1.9.1
>
>_______________________________________________
>dri-devel mailing list
>dri-devel@lists.freedesktop.org
>https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
