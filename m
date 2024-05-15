Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E523C8C65AD
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2024 13:25:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 965EB10E7C4;
	Wed, 15 May 2024 11:25:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="XTraS+Ia";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE09710E7AE
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 11:25:29 +0000 (UTC)
X-UUID: d119445c12ad11efb92737409a0e9459-20240515
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=pRII+MwEMjc7IBIb7T65bLDNnOYGy8L1r5/7E1ySfEk=; 
 b=XTraS+Ia6U18kmDn890Uqw9sPEXJ3+G4x6Z4OJ9YFg2lLlvgPEoe4++0PR+c03dyKyqhMYz+VY56NyruHhFskQFY42k1jFiHTACtCglSm/Ws38y9HGTZcz3mLa3px67WfHumiqlHs6HYMJq8Z8NBDsplHWxfc/o9ZcI+EkdHJSk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38, REQID:ffd7906c-23c2-49b4-90b3-c4a06efc92bb, IP:0,
 U
 RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:-25
X-CID-META: VersionHash:82c5f88, CLOUDID:bb2ce383-4f93-4875-95e7-8c66ea833d57,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: d119445c12ad11efb92737409a0e9459-20240515
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw01.mediatek.com (envelope-from <yong.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 75818985; Wed, 15 May 2024 19:25:21 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 15 May 2024 19:25:20 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 15 May 2024 19:25:19 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, <christian.koenig@amd.com>, Sumit Semwal
 <sumit.semwal@linaro.org>, Andrew Morton <akpm@linux-foundation.org>
CC: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 <tjmercier@google.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Yong Wu <yong.wu@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, Robin Murphy <robin.murphy@arm.com>,
 Vijayanand Jitta <quic_vjitta@quicinc.com>, Joakim Bech
 <joakim.bech@linaro.org>, Jeffrey Kardatzke <jkardatzke@google.com>, Pavel
 Machek <pavel@ucw.cz>, Simon Ser <contact@emersion.fr>, Pekka Paalanen
 <ppaalanen@gmail.com>, <willy@infradead.org>, Logan Gunthorpe
 <logang@deltatee.com>, Daniel Vetter <daniel@ffwll.ch>,
 <jianjiao.zeng@mediatek.com>, <kuohong.wang@mediatek.com>,
 <youlin.pei@mediatek.com>
Subject: [PATCH v5 9/9] dma_buf: heaps: restricted_heap_mtk: Add a new CMA heap
Date: Wed, 15 May 2024 19:23:08 +0800
Message-ID: <20240515112308.10171-10-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240515112308.10171-1-yong.wu@mediatek.com>
References: <20240515112308.10171-1-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
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

Create a new MediaTek CMA heap from the CMA reserved buffer.

In this heap, When the first allocating buffer, use cma_alloc to prepare
whole the CMA range, then send its range to TEE to protect and manage.
For the later allocating, we just adds the cma_used_size.

When SVP done, cma_release will release the buffer, then kernel may
reuse it.

For the "CMA" restricted heap, "struct cma *cma" is a common property,
not just for MediaTek, so put it into "struct restricted_heap" instead of
our private data.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/dma-buf/heaps/Kconfig               |   2 +-
 drivers/dma-buf/heaps/restricted_heap.h     |   4 +
 drivers/dma-buf/heaps/restricted_heap_mtk.c | 121 +++++++++++++++++++-
 3 files changed, 123 insertions(+), 4 deletions(-)

diff --git a/drivers/dma-buf/heaps/Kconfig b/drivers/dma-buf/heaps/Kconfig
index 84f748fb2856..58903bc62ac8 100644
--- a/drivers/dma-buf/heaps/Kconfig
+++ b/drivers/dma-buf/heaps/Kconfig
@@ -24,7 +24,7 @@ config DMABUF_HEAPS_RESTRICTED
 
 config DMABUF_HEAPS_RESTRICTED_MTK
 	bool "MediaTek DMA-BUF Restricted Heap"
-	depends on DMABUF_HEAPS_RESTRICTED && TEE=y
+	depends on DMABUF_HEAPS_RESTRICTED && DMA_CMA && TEE=y
 	help
 	  Enable restricted dma-buf heaps for MediaTek platform. This heap is backed by
 	  TEE client interfaces. If in doubt, say N.
diff --git a/drivers/dma-buf/heaps/restricted_heap.h b/drivers/dma-buf/heaps/restricted_heap.h
index 8cb9211093c5..7dec4b8a471b 100644
--- a/drivers/dma-buf/heaps/restricted_heap.h
+++ b/drivers/dma-buf/heaps/restricted_heap.h
@@ -23,6 +23,10 @@ struct restricted_heap {
 
 	const struct restricted_heap_ops *ops;
 
+	struct cma		*cma;
+	unsigned long		cma_paddr;
+	unsigned long		cma_size;
+
 	void			*priv_data;
 };
 
diff --git a/drivers/dma-buf/heaps/restricted_heap_mtk.c b/drivers/dma-buf/heaps/restricted_heap_mtk.c
index e571eae719e0..6d8119828485 100644
--- a/drivers/dma-buf/heaps/restricted_heap_mtk.c
+++ b/drivers/dma-buf/heaps/restricted_heap_mtk.c
@@ -6,9 +6,11 @@
  */
 #define pr_fmt(fmt)     "rheap_mtk: " fmt
 
+#include <linux/cma.h>
 #include <linux/dma-buf.h>
 #include <linux/err.h>
 #include <linux/module.h>
+#include <linux/of_reserved_mem.h>
 #include <linux/slab.h>
 #include <linux/tee_drv.h>
 #include <linux/uuid.h>
@@ -25,6 +27,13 @@ enum mtk_secure_mem_type {
 	 * management is inside the TEE.
 	 */
 	MTK_SECURE_MEMORY_TYPE_CM_TZ	= 1,
+	/*
+	 * MediaTek dynamic chunk memory carved out from CMA.
+	 * In normal case, the CMA could be used in kernel; When SVP start, we will
+	 * allocate whole this CMA and pass whole the CMA PA and size into TEE to
+	 * protect it, then the detail memory management also is inside the TEE.
+	 */
+	MTK_SECURE_MEMORY_TYPE_CM_CMA	= 2,
 };
 
 /* This structure also is synchronized with tee, thus not use the phys_addr_t */
@@ -40,7 +49,8 @@ enum mtk_secure_buffer_tee_cmd {
 	 * [in]  value[0].a: The buffer size.
 	 *       value[0].b: alignment.
 	 * [in]  value[1].a: enum mtk_secure_mem_type.
-	 * [inout]
+	 * [inout] [in]  value[2].a: pa base in cma case.
+	 *               value[2].b: The buffer size in cma case.
 	 *         [out] value[2].a: entry number of memory block.
 	 *                           If this is 1, it means the memory is continuous.
 	 *               value[2].b: buffer PA base.
@@ -73,6 +83,9 @@ struct mtk_restricted_heap_data {
 
 	const enum mtk_secure_mem_type mem_type;
 
+	struct page		*cma_page;
+	unsigned long		cma_used_size;
+	struct mutex		lock; /* lock for cma_used_size */
 };
 
 static int mtk_tee_ctx_match(struct tee_ioctl_version_data *ver, const void *data)
@@ -173,6 +186,10 @@ static int mtk_tee_restrict_memory(struct restricted_heap *rheap, struct restric
 	params[1].attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT;
 	params[1].u.value.a = data->mem_type;
 	params[2].attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INOUT;
+	if (rheap->cma && data->mem_type == MTK_SECURE_MEMORY_TYPE_CM_CMA) {
+		params[2].u.value.a = rheap->cma_paddr;
+		params[2].u.value.b = rheap->cma_size;
+	}
 	params[3].attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_OUTPUT;
 	ret = mtk_tee_service_call(data->tee_ctx, data->tee_session,
 				   MTK_TZCMD_SECMEM_ZALLOC, params);
@@ -265,6 +282,48 @@ mtk_restricted_memory_free(struct restricted_heap *rheap, struct restricted_buff
 {
 }
 
+static int mtk_restricted_memory_cma_allocate(struct restricted_heap *rheap,
+					      struct restricted_buffer *buf)
+{
+	struct mtk_restricted_heap_data *data = rheap->priv_data;
+	int ret = 0;
+	/*
+	 * Allocate CMA only when allocating buffer for the first time, and just
+	 * increase cma_used_size at the other time, Actually the memory
+	 * allocating is within the TEE.
+	 */
+	mutex_lock(&data->lock);
+	if (!data->cma_used_size) {
+		data->cma_page = cma_alloc(rheap->cma, rheap->cma_size >> PAGE_SHIFT,
+					   get_order(PAGE_SIZE), false);
+		if (!data->cma_page) {
+			ret = -ENOMEM;
+			goto out_unlock;
+		}
+	} else if (data->cma_used_size + buf->size > rheap->cma_size) {
+		ret = -EINVAL;
+		goto out_unlock;
+	}
+	data->cma_used_size += buf->size;
+
+out_unlock:
+	mutex_unlock(&data->lock);
+	return ret;
+}
+
+static void mtk_restricted_memory_cma_free(struct restricted_heap *rheap,
+					   struct restricted_buffer *buf)
+{
+	struct mtk_restricted_heap_data *data = rheap->priv_data;
+
+	mutex_lock(&data->lock);
+	data->cma_used_size -= buf->size;
+	if (!data->cma_used_size)
+		cma_release(rheap->cma, data->cma_page,
+			    rheap->cma_size >> PAGE_SHIFT);
+	mutex_unlock(&data->lock);
+}
+
 static int mtk_restricted_heap_init(struct restricted_heap *rheap)
 {
 	struct mtk_restricted_heap_data *data = rheap->priv_data;
@@ -286,21 +345,77 @@ static struct mtk_restricted_heap_data mtk_restricted_heap_data = {
 	.mem_type		= MTK_SECURE_MEMORY_TYPE_CM_TZ,
 };
 
+static const struct restricted_heap_ops mtk_restricted_heap_ops_cma = {
+	.heap_init		= mtk_restricted_heap_init,
+	.alloc			= mtk_restricted_memory_cma_allocate,
+	.free			= mtk_restricted_memory_cma_free,
+	.restrict_buf		= mtk_tee_restrict_memory,
+	.unrestrict_buf		= mtk_tee_unrestrict_memory,
+};
+
+static struct mtk_restricted_heap_data mtk_restricted_heap_data_cma = {
+	.mem_type		= MTK_SECURE_MEMORY_TYPE_CM_CMA,
+};
+
 static struct restricted_heap mtk_restricted_heaps[] = {
 	{
 		.name		= "restricted_mtk_cm",
 		.ops		= &mtk_restricted_heap_ops,
 		.priv_data	= &mtk_restricted_heap_data,
 	},
+	{
+		.name		= "restricted_mtk_cma",
+		.ops		= &mtk_restricted_heap_ops_cma,
+		.priv_data	= &mtk_restricted_heap_data_cma,
+	},
 };
 
+static int __init mtk_restricted_cma_init(struct reserved_mem *rmem)
+{
+	struct restricted_heap *rheap = mtk_restricted_heaps, *rheap_cma = NULL;
+	struct mtk_restricted_heap_data *data;
+	struct cma *cma;
+	int ret, i;
+
+	for (i = 0; i < ARRAY_SIZE(mtk_restricted_heaps); i++, rheap++) {
+		data = rheap->priv_data;
+		if (data->mem_type == MTK_SECURE_MEMORY_TYPE_CM_CMA) {
+			rheap_cma = rheap;
+			break;
+		}
+	}
+	if (!rheap_cma)
+		return -EINVAL;
+
+	ret = cma_init_reserved_mem(rmem->base, rmem->size, 0, rmem->name,
+				    &cma);
+	if (ret) {
+		pr_err("%s: %s set up CMA fail. ret %d.\n", __func__, rmem->name, ret);
+		return ret;
+	}
+
+	rheap_cma->cma = cma;
+	rheap_cma->cma_paddr = rmem->base;
+	rheap_cma->cma_size = rmem->size;
+	return 0;
+}
+
+RESERVEDMEM_OF_DECLARE(restricted_cma, "mediatek,dynamic-restricted-region",
+		       mtk_restricted_cma_init);
+
 static int mtk_restricted_heap_initialize(void)
 {
 	struct restricted_heap *rheap = mtk_restricted_heaps;
+	struct mtk_restricted_heap_data *data;
 	unsigned int i;
 
-	for (i = 0; i < ARRAY_SIZE(mtk_restricted_heaps); i++, rheap++)
-		restricted_heap_add(rheap);
+	for (i = 0; i < ARRAY_SIZE(mtk_restricted_heaps); i++, rheap++) {
+		data = rheap->priv_data;
+		if (data->mem_type == MTK_SECURE_MEMORY_TYPE_CM_CMA && !rheap->cma)
+			continue;
+		if (!restricted_heap_add(rheap))
+			mutex_init(&data->lock);
+	}
 	return 0;
 }
 module_init(mtk_restricted_heap_initialize);
-- 
2.25.1

