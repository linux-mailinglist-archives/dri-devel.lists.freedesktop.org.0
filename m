Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52760937FCE
	for <lists+dri-devel@lfdr.de>; Sat, 20 Jul 2024 09:54:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3E2E10E15C;
	Sat, 20 Jul 2024 07:54:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="OeKGkQv2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D132E10E15C
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Jul 2024 07:54:50 +0000 (UTC)
X-UUID: f3c9ecf2466711ef87684b57767b52b1-20240720
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=t55MQIgMEx4p4MEJHDKfM0Ly5GklrK5skqp8MOiYDJY=; 
 b=OeKGkQv2Ass4HZszrmHukPHUJ2yhgKqbgqk+vTNArrEzm9Y6TizS1wyGuky+CNdjpTpdgViZyKafJFJ5pxhhv4E1QFU7gwlb0pHZt+wjhHxbG657kwXKLP6iP42NVo7mztR2rFZlmb4BSRNwxzPCw6osxHz3UtLjZY0bu0OTRSg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.40, REQID:1ebd9357-65fc-4c94-a613-805d8585ec32, IP:0,
 U
 RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:-5
X-CID-META: VersionHash:ba885a6, CLOUDID:141e91d5-0d68-4615-a20f-01d7bd41f0bb,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: f3c9ecf2466711ef87684b57767b52b1-20240720
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by
 mailgw02.mediatek.com (envelope-from <yunfei.dong@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1442330623; Sat, 20 Jul 2024 15:16:15 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sat, 20 Jul 2024 15:16:14 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sat, 20 Jul 2024 15:16:13 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Jeffrey Kardatzke <jkardatzke@google.com>,
 =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
 <nfraprado@collabora.com>, Nathan Hebert <nhebert@chromium.org>, "Nicolas
 Dufresne" <nicolas.dufresne@collabora.com>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Sebastian Fricke
 <sebastian.fricke@collabora.com>, Tomasz Figa <tfiga@chromium.org>, "Mauro
 Carvalho Chehab" <mchehab@kernel.org>, Marek Szyprowski
 <m.szyprowski@samsung.com>
CC: Chen-Yu Tsai <wenst@chromium.org>, Yong Wu <yong.wu@mediatek.com>,
 "Hsin-Yi Wang" <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
 "Daniel Vetter" <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>, Yunfei
 Dong <yunfei.dong@mediatek.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 "Brian Starkey" <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, "T
 . J . Mercier" <tjmercier@google.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v7 04/28] dma-buf: heaps: Deduplicate docs and adopt common
 format
Date: Sat, 20 Jul 2024 15:15:42 +0800
Message-ID: <20240720071606.27930-5-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240720071606.27930-1-yunfei.dong@mediatek.com>
References: <20240720071606.27930-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--0.731800-8.000000
X-TMASE-MatchedRID: +2zAcmHD8Q7wUuSygkLx9JD6BbDN9+jOQKuv8uQBDjpU4V1pMvNQR62r
 pHsK32BkBMhVYRT3oC/ANNz/A2ARw8VLWPBZNJvOhK8o4aoss8pKPIx+MJF9o99RlPzeVuQQOAX
 Ig5vwe9o0ULOv9iNOM/3selkw4oOREKA/i6/8kSnJ1E/nrJFED+rRJDUyDHkImyiLZetSf8mfop
 0ytGwvXiq2rl3dzGQ19+9ZqEp9FTjXPo0z12/ROTwabOz3sXuUEFC9e5y4FdRPp2EJbxyQMRNGO
 R3mIPS0sgmJnZJxzECAf086W8np7I+ZbND4/NfDqkwQ8MbhzZZpp55fZDlsr34cY/B7JqXaYZ1R
 7NXn0MdBmmCXcKyFFJ6oP1a0mRIj
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--0.731800-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: C2F6328C4AF53B2CA44004E41C627CB7C3290F7E11A2C3450739939986EB07992000:8
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

From: "T.J. Mercier" <tjmercier@google.com>

The docs for dma_heap_get_name were incorrect, and since they were
duplicated in the header they were wrong there too.

The docs formatting was inconsistent so I tried to make it more
consistent across functions since I'm already in here doing cleanup.

Remove multiple unused includes and alphabetize.

Signed-off-by: T.J. Mercier <tjmercier@google.com>
Signed-off-by: Yong Wu <yong.wu@mediatek.com>
[Yong: Just add a comment for "priv" to mute build warning]
Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 drivers/dma-buf/dma-heap.c | 27 +++++++++++++++------------
 include/linux/dma-heap.h   | 21 +--------------------
 2 files changed, 16 insertions(+), 32 deletions(-)

diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
index 84ae708fafe7..22f6c193db0d 100644
--- a/drivers/dma-buf/dma-heap.c
+++ b/drivers/dma-buf/dma-heap.c
@@ -7,17 +7,15 @@
  */
 
 #include <linux/cdev.h>
-#include <linux/debugfs.h>
 #include <linux/device.h>
 #include <linux/dma-buf.h>
+#include <linux/dma-heap.h>
 #include <linux/err.h>
-#include <linux/xarray.h>
 #include <linux/list.h>
-#include <linux/slab.h>
 #include <linux/nospec.h>
-#include <linux/uaccess.h>
 #include <linux/syscalls.h>
-#include <linux/dma-heap.h>
+#include <linux/uaccess.h>
+#include <linux/xarray.h>
 #include <uapi/linux/dma-heap.h>
 
 #define DEVNAME "dma_heap"
@@ -28,9 +26,10 @@
  * struct dma_heap - represents a dmabuf heap in the system
  * @name:		used for debugging/device-node name
  * @ops:		ops struct for this heap
- * @heap_devt		heap device node
- * @list		list head connecting to list of heaps
- * @heap_cdev		heap char device
+ * @priv:		private data for this heap
+ * @heap_devt:		heap device node
+ * @list:		list head connecting to list of heaps
+ * @heap_cdev:		heap char device
  *
  * Represents a heap of memory from which buffers can be made.
  */
@@ -193,11 +192,11 @@ static const struct file_operations dma_heap_fops = {
 };
 
 /**
- * dma_heap_get_drvdata() - get per-subdriver data for the heap
+ * dma_heap_get_drvdata - get per-heap driver data
  * @heap: DMA-Heap to retrieve private data for
  *
  * Returns:
- * The per-subdriver data for the heap.
+ * The per-heap data for the heap.
  */
 void *dma_heap_get_drvdata(struct dma_heap *heap)
 {
@@ -205,8 +204,8 @@ void *dma_heap_get_drvdata(struct dma_heap *heap)
 }
 
 /**
- * dma_heap_get_name() - get heap name
- * @heap: DMA-Heap to retrieve private data for
+ * dma_heap_get_name - get heap name
+ * @heap: DMA-Heap to retrieve the name of
  *
  * Returns:
  * The char* for the heap name.
@@ -216,6 +215,10 @@ const char *dma_heap_get_name(struct dma_heap *heap)
 	return heap->name;
 }
 
+/**
+ * dma_heap_add - adds a heap to dmabuf heaps
+ * @exp_info: information needed to register this heap
+ */
 struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info)
 {
 	struct dma_heap *heap, *h, *err_ret;
diff --git a/include/linux/dma-heap.h b/include/linux/dma-heap.h
index 0c05561cad6e..fbe86ec889a8 100644
--- a/include/linux/dma-heap.h
+++ b/include/linux/dma-heap.h
@@ -9,14 +9,13 @@
 #ifndef _DMA_HEAPS_H
 #define _DMA_HEAPS_H
 
-#include <linux/cdev.h>
 #include <linux/types.h>
 
 struct dma_heap;
 
 /**
  * struct dma_heap_ops - ops to operate on a given heap
- * @allocate:		allocate dmabuf and return struct dma_buf ptr
+ * @allocate:	allocate dmabuf and return struct dma_buf ptr
  *
  * allocate returns dmabuf on success, ERR_PTR(-errno) on error.
  */
@@ -41,28 +40,10 @@ struct dma_heap_export_info {
 	void *priv;
 };
 
-/**
- * dma_heap_get_drvdata() - get per-heap driver data
- * @heap: DMA-Heap to retrieve private data for
- *
- * Returns:
- * The per-heap data for the heap.
- */
 void *dma_heap_get_drvdata(struct dma_heap *heap);
 
-/**
- * dma_heap_get_name() - get heap name
- * @heap: DMA-Heap to retrieve private data for
- *
- * Returns:
- * The char* for the heap name.
- */
 const char *dma_heap_get_name(struct dma_heap *heap);
 
-/**
- * dma_heap_add - adds a heap to dmabuf heaps
- * @exp_info:		information needed to register this heap
- */
 struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info);
 
 #endif /* _DMA_HEAPS_H */
-- 
2.18.0

