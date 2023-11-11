Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF2F97E8AA4
	for <lists+dri-devel@lfdr.de>; Sat, 11 Nov 2023 12:18:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93E0010E27C;
	Sat, 11 Nov 2023 11:18:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7E9110E27C
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Nov 2023 11:18:08 +0000 (UTC)
X-UUID: fadfc61a808311ee8051498923ad61e6-20231111
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=PTkJwhlG295J7Fq7DBG9f0P0y9BIpK10DHJxLIVe19g=; 
 b=g0D6tp7hVsbc7lPPx2KqtJoCZpLVTtmSCZk1Pmvnw7riV943Zn8C5G9rv4nIT2Dl28iH4vQhTMxZ+W3Jck88BlyMmYMPqKrE92Dwb+aPBxeGP0OnTBN3oT3v7IRS1+RM2T+VwBTVHkaIfX20fUObAzyfiwuoX/IcNhplQfjKmSc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33, REQID:5c67a7ac-e03b-4394-9eb9-398b44ce7acd, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:364b77b, CLOUDID:79184695-10ce-4e4b-85c2-c9b5229ff92b,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
 DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: fadfc61a808311ee8051498923ad61e6-20231111
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by
 mailgw02.mediatek.com (envelope-from <yong.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 339753797; Sat, 11 Nov 2023 19:18:03 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sat, 11 Nov 2023 19:18:01 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sat, 11 Nov 2023 19:18:00 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
 <christian.koenig@amd.com>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v2 8/8] dma-buf: heaps: secure_heap: Add normal CMA heap
Date: Sat, 11 Nov 2023 19:15:59 +0800
Message-ID: <20231111111559.8218-9-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231111111559.8218-1-yong.wu@mediatek.com>
References: <20231111111559.8218-1-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--8.713600-8.000000
X-TMASE-MatchedRID: XAa2d/45j8QtJMbDWD8p3pEbNXwHGDRxqQ9UezeTkTjb6Y+fnTZULzAg
 xTloju5/Xt8ERZJyv5z+zbn+OlN0IkPbYPqd/GaJwCZxkTHxccnWSrKtwxqWpaj5v7I4/SgYU7g
 EPucszGeVMlcqqHWd7WAecQuhpQq2v94QsDvR6NwbmaDSnOqZfofsPVs/8Vw6RY/QCO8+EY40ZG
 lGdzy556HPibXQz0iw3BTxUdcaKkIfE8yM4pjsDwtuKBGekqUpIG4YlbCDECsYpN+2ZkfdFw5Eg
 x2RURWzOX6Gf/YkVyO2bMkQ2ubJ+3p46hvecdNTC8XKjsVbJjU=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--8.713600-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: C57F37D27EAEC8D1A7ABBC4D4778A4F2275F843CCD29DDAD8C5D302DE4BE19C92000:8
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
Cc: dri-devel@lists.freedesktop.org, John Stultz <jstultz@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jeffrey Kardatzke <jkardatzke@google.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Vijayanand Jitta <quic_vjitta@quicinc.com>,
 Nicolas Dufresne <nicolas@ndufresne.ca>, Yong Wu <yong.wu@mediatek.com>,
 jianjiao.zeng@mediatek.com, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 ckoenig.leichtzumerken@gmail.com, linaro-mm-sig@lists.linaro.org,
 linux-mediatek@lists.infradead.org, Joakim Bech <joakim.bech@linaro.org>,
 tjmercier@google.com, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 kuohong.wang@mediatek.com, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a normal CMA heap which use the standard cma allocate.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
Hi Vijay and Jaskaran,

For this heap,
1) It uses sec_heap_buf_ops currently. I guess we cann't use the
cma_heap_buf_ops. since if it is secure buffer, some operations such
as mmap should not be allowed.
2) I didn't add how to protect/secure the buffer.

Please feel free to change to meet your requirements.
Thanks.
---
 drivers/dma-buf/heaps/secure_heap.c | 38 ++++++++++++++++++++++++++++-
 1 file changed, 37 insertions(+), 1 deletion(-)

diff --git a/drivers/dma-buf/heaps/secure_heap.c b/drivers/dma-buf/heaps/secure_heap.c
index f8b84fd16288..8989ad5d03e9 100644
--- a/drivers/dma-buf/heaps/secure_heap.c
+++ b/drivers/dma-buf/heaps/secure_heap.c
@@ -43,6 +43,8 @@ enum secure_buffer_tee_cmd { /* PARAM NUM always is 4. */
 };
 
 enum secure_memory_type {
+	/* CMA for the secure memory, Use the normal cma ops to alloc/free. */
+	SECURE_MEMORY_TYPE_CMA		= 0,
 	/*
 	 * MediaTek static chunk memory carved out for TrustZone. The memory
 	 * management is inside the TEE.
@@ -65,6 +67,7 @@ struct secure_buffer {
 	 * a value got from TEE.
 	 */
 	u32				sec_handle;
+	struct page			*cma_page;
 };
 
 #define TEE_MEM_COMMAND_ID_BASE_MTK	0x10000
@@ -287,6 +290,33 @@ const struct secure_heap_prv_data mtk_sec_mem_data = {
 	.unsecure_the_memory	= secure_heap_tee_unsecure_memory,
 };
 
+static int cma_secure_memory_allocate(struct secure_heap *sec_heap,
+				      struct secure_buffer *sec_buf)
+{
+	if (!sec_heap->cma)
+		return -EINVAL;
+
+	sec_buf->cma_page = cma_alloc(sec_heap->cma, sec_buf->size >> PAGE_SHIFT,
+				      get_order(PAGE_SIZE), false);
+	if (!sec_buf->cma_page)
+		return -ENOMEM;
+
+	memset(page_address(sec_buf->cma_page), 0, sec_buf->size);
+	return 0;
+}
+
+static void cma_secure_memory_free(struct secure_heap *sec_heap,
+				   struct secure_buffer *sec_buf)
+{
+	cma_release(sec_heap->cma, sec_buf->cma_page, sec_buf->size >> PAGE_SHIFT);
+}
+
+const struct secure_heap_prv_data cma_sec_mem_data = {
+	.memory_alloc	= cma_secure_memory_allocate,
+	.memory_free	= cma_secure_memory_free,
+	/* TODO : secure the buffer. */
+};
+
 static int secure_heap_secure_memory_allocate(struct secure_heap *sec_heap,
 					      struct secure_buffer *sec_buf)
 {
@@ -496,6 +526,11 @@ static const struct dma_heap_ops sec_heap_ops = {
 };
 
 static struct secure_heap secure_heaps[] = {
+	{
+		.name		= "secure_cma",
+		.mem_type	= SECURE_MEMORY_TYPE_CMA,
+		.data		= &cma_sec_mem_data,
+	},
 	{
 		.name		= "secure_mtk_cm",
 		.mem_type	= SECURE_MEMORY_TYPE_MTK_CM_TZ,
@@ -522,7 +557,8 @@ static int __init secure_cma_init(struct reserved_mem *rmem)
 	}
 
 	for (i = 0; i < ARRAY_SIZE(secure_heaps); i++, sec_heap++) {
-		if (sec_heap->mem_type != SECURE_MEMORY_TYPE_MTK_CM_CMA)
+		if (sec_heap->mem_type != SECURE_MEMORY_TYPE_MTK_CM_CMA &&
+		    sec_heap->mem_type != SECURE_MEMORY_TYPE_CMA)
 			continue;
 
 		sec_heap->cma = sec_cma;
-- 
2.25.1

