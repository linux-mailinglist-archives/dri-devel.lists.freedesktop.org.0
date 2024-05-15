Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0CB8C6594
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2024 13:24:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CE2410E6AB;
	Wed, 15 May 2024 11:24:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="k6voYFuR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F58E10E6AB
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 11:24:42 +0000 (UTC)
X-UUID: b68da3c612ad11ef8065b7b53f7091ad-20240515
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=b62MFZCKZYClERIcSnVzKxk/kLwYIFY6WRjWetJojiY=; 
 b=k6voYFuRQFWQ5htmljjM4/eyStQjtozswBumIt972NYdmNmKrmLmk37mh308sBs8DwrSw47LC61AicXT9JhVCfAY2LtLZejdOOB8XkaLymU6c8/W0cVHFZXVhLjF4PVZZzSquHJKsbLNgaOMTvq6y//VCSDLX1YnNLJ2Mf928n8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38, REQID:fd12e1bc-6463-42e1-8644-ce54b2c65132, IP:0,
 U
 RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:-25
X-CID-META: VersionHash:82c5f88, CLOUDID:8f786387-8d4f-477b-89d2-1e3bdbef96d1,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: b68da3c612ad11ef8065b7b53f7091ad-20240515
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw02.mediatek.com (envelope-from <yong.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 2126874861; Wed, 15 May 2024 19:24:37 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 15 May 2024 19:24:31 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 15 May 2024 19:24:30 +0800
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
 <joakim.bech@linaro.org>, Jeffrey Kardatzke <jkardatzke@google.com>, "Pavel
 Machek" <pavel@ucw.cz>, Simon Ser <contact@emersion.fr>, Pekka Paalanen
 <ppaalanen@gmail.com>, <willy@infradead.org>, Logan Gunthorpe
 <logang@deltatee.com>, Daniel Vetter <daniel@ffwll.ch>,
 <jianjiao.zeng@mediatek.com>, <kuohong.wang@mediatek.com>,
 <youlin.pei@mediatek.com>
Subject: [PATCH v5 5/9] dma-buf: heaps: restricted_heap: Add private heap ops
Date: Wed, 15 May 2024 19:23:04 +0800
Message-ID: <20240515112308.10171-6-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240515112308.10171-1-yong.wu@mediatek.com>
References: <20240515112308.10171-1-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--1.511100-8.000000
X-TMASE-MatchedRID: 9DomuZeNnSYxaBEU4bKrV0hEDfw/93BuMApqy5cfknVX4H/AHZTAKsg8
 wayHBdO7rOOppPTYnnjVL7DIQyVd77BAQLqGlKiv4pdq9sdj8LW6hgVvSdGKoxS11FlOYRoheKL
 mRI5Hi0abuQcHZubU2v3EE/72W02OSSOWVJeuO1AURSScn+QSXt0H8LFZNFG7gaH1JgrOSO4Jpe
 vTilEwkAIlJ+SeTxt8M78kjWgPIvku/9MlpPMpE018g8B8tThlw6Gk3uypg8eT2qM+VJ76tKASz
 D9Y/9Fwsc5392oMuYZSC2TRJDkZy21Rjoup2VCcWve+eVz4Pp5Vk5utmQ1VlGVF3+d9rnoxXsgQ
 Sqx49gY=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--1.511100-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 4D73BE4E88C5968707784482A7B4FCD08AB357438873D5A387C89F82BA4748E12000:8
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

Add "struct restricted_heap_ops". For the restricted memory, totally there
are two steps:
a) alloc: Allocate the buffer in kernel;
b) restrict_buf: Restrict/Protect/Secure that buffer.
The "alloc" is mandatory while "restrict_buf" is optional since it may
be part of "alloc".

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/dma-buf/heaps/restricted_heap.c | 41 ++++++++++++++++++++++++-
 drivers/dma-buf/heaps/restricted_heap.h | 12 ++++++++
 2 files changed, 52 insertions(+), 1 deletion(-)

diff --git a/drivers/dma-buf/heaps/restricted_heap.c b/drivers/dma-buf/heaps/restricted_heap.c
index c2ae19ba7d7e..8bb3c1876a69 100644
--- a/drivers/dma-buf/heaps/restricted_heap.c
+++ b/drivers/dma-buf/heaps/restricted_heap.c
@@ -12,10 +12,44 @@
 
 #include "restricted_heap.h"
 
+static int
+restricted_heap_memory_allocate(struct restricted_heap *rheap, struct restricted_buffer *buf)
+{
+	const struct restricted_heap_ops *ops = rheap->ops;
+	int ret;
+
+	ret = ops->alloc(rheap, buf);
+	if (ret)
+		return ret;
+
+	if (ops->restrict_buf) {
+		ret = ops->restrict_buf(rheap, buf);
+		if (ret)
+			goto buf_free;
+	}
+	return 0;
+
+buf_free:
+	ops->free(rheap, buf);
+	return ret;
+}
+
+static void
+restricted_heap_memory_free(struct restricted_heap *rheap, struct restricted_buffer *buf)
+{
+	const struct restricted_heap_ops *ops = rheap->ops;
+
+	if (ops->unrestrict_buf)
+		ops->unrestrict_buf(rheap, buf);
+
+	ops->free(rheap, buf);
+}
+
 static struct dma_buf *
 restricted_heap_allocate(struct dma_heap *heap, unsigned long size,
 			 unsigned long fd_flags, unsigned long heap_flags)
 {
+	struct restricted_heap *rheap = dma_heap_get_drvdata(heap);
 	struct restricted_buffer *restricted_buf;
 	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
 	struct dma_buf *dmabuf;
@@ -28,6 +62,9 @@ restricted_heap_allocate(struct dma_heap *heap, unsigned long size,
 	restricted_buf->size = ALIGN(size, PAGE_SIZE);
 	restricted_buf->heap = heap;
 
+	ret = restricted_heap_memory_allocate(rheap, restricted_buf);
+	if (ret)
+		goto err_free_buf;
 	exp_info.exp_name = dma_heap_get_name(heap);
 	exp_info.size = restricted_buf->size;
 	exp_info.flags = fd_flags;
@@ -36,11 +73,13 @@ restricted_heap_allocate(struct dma_heap *heap, unsigned long size,
 	dmabuf = dma_buf_export(&exp_info);
 	if (IS_ERR(dmabuf)) {
 		ret = PTR_ERR(dmabuf);
-		goto err_free_buf;
+		goto err_free_rstrd_mem;
 	}
 
 	return dmabuf;
 
+err_free_rstrd_mem:
+	restricted_heap_memory_free(rheap, restricted_buf);
 err_free_buf:
 	kfree(restricted_buf);
 	return ERR_PTR(ret);
diff --git a/drivers/dma-buf/heaps/restricted_heap.h b/drivers/dma-buf/heaps/restricted_heap.h
index b448f77616ac..5783275d5714 100644
--- a/drivers/dma-buf/heaps/restricted_heap.h
+++ b/drivers/dma-buf/heaps/restricted_heap.h
@@ -15,6 +15,18 @@ struct restricted_buffer {
 
 struct restricted_heap {
 	const char		*name;
+
+	const struct restricted_heap_ops *ops;
+};
+
+struct restricted_heap_ops {
+	int	(*heap_init)(struct restricted_heap *rheap);
+
+	int	(*alloc)(struct restricted_heap *rheap, struct restricted_buffer *buf);
+	void	(*free)(struct restricted_heap *rheap, struct restricted_buffer *buf);
+
+	int	(*restrict_buf)(struct restricted_heap *rheap, struct restricted_buffer *buf);
+	void	(*unrestrict_buf)(struct restricted_heap *rheap, struct restricted_buffer *buf);
 };
 
 int restricted_heap_add(struct restricted_heap *rheap);
-- 
2.25.1

