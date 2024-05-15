Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F028C65A9
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2024 13:25:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E849610E791;
	Wed, 15 May 2024 11:25:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="mME2bu14";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C972610E791
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 11:25:17 +0000 (UTC)
X-UUID: c9f02a1012ad11efb92737409a0e9459-20240515
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=FILbHLsoC2YltkJoNtU7nsRSNNn5gGVusUvbdUJZ6J8=; 
 b=mME2bu14J5R2+r6buYy5qu+Ye+27nZIUjaZb6Of9gdsjjkqVoex1HMnk5I2JkgxWiBHznCOEZKTz0o07V2RvkcVxw/aSB+b2elPMqwESo3D/21mFaUqxNtF85bFofJPzIUZDtt7qFMOacFUAHNjLvHINAumZkEUqruXuNAHsWGA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38, REQID:03726ce3-3030-43c4-a7f1-46851604b8bb, IP:0,
 U
 RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:-25
X-CID-META: VersionHash:82c5f88, CLOUDID:6440ca92-e2c0-40b0-a8fe-7c7e47299109,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: c9f02a1012ad11efb92737409a0e9459-20240515
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw01.mediatek.com (envelope-from <yong.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 330037144; Wed, 15 May 2024 19:25:09 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 15 May 2024 19:25:05 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 15 May 2024 19:25:04 +0800
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
Subject: [PATCH v5 8/9] dma-buf: heaps: restricted_heap_mtk: Add TEE memory
 service call
Date: Wed, 15 May 2024 19:23:07 +0800
Message-ID: <20240515112308.10171-9-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240515112308.10171-1-yong.wu@mediatek.com>
References: <20240515112308.10171-1-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--1.973000-8.000000
X-TMASE-MatchedRID: aB9y29Ha6vOtGUuyWCB/Khes/RxhysDbRtu4vtjjtzTW6l1sryBPgVYW
 Bwk9rOXyW8YvtW5WE4RdHuYgvxmEiiDvmSibVtANw69AIwXJn0ZAq6/y5AEOOmHZ+cd7VyKXqjK
 1cw/inhOxyoRMFTZcHRXXfLCAeq/9QOfw0USEkBwwiJTf3kjwfdklRclwFkioHApIKLQpe4RXkH
 7BatgOcTDXuOmpeyC0mpa5UQq0cVBveCKWtaLcaOTuT3JcmKqqhV0srjoqtx/4JyR+b5tvoPbg0
 hgNqDashVmF9kz2wxKQgguZUjlwgXW3L6pBOFB7ydRP56yRRA99LQinZ4QefPcjNeVeWlqY+gtH
 j7OwNO0Q+z869mqTM19bqZ4J9Rsn1EiKSmPYLndW5gDTm3Jrk9gxta8Rn3kRTvtyv08Sakpdanq
 9VHjABnuHvqOnadGqqsHBx4Fj5VJFm3rJAv4l6ZG9hlNtb+P+aaeeX2Q5bK9+HGPweyal2mGdUe
 zV59DHQZpgl3CshRSeqD9WtJkSIw==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--1.973000-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: FE66631E03E60F2F85D55C5A270D96CEB3978309E7065A2F6139BD7352F4028B2000:8
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

Add TEE service call for MediaTek heap. We have a limited number of
hardware entries to protect memory, therefore we cannot protect memory
arbitrarily, and our secure memory management is actually inside OPTEE.

Totally there are 3 commands:
1) MTK_TZCMD_SECMEM_ZALLOC: The kernel tells the TEE what size I want and
the TEE will return a "secure handle"/"secure address". To make the name
more general, We call it "restricted_addr" here. The restricted_addr is a
reference to the secure buffer within TEE.
2) MTK_TZCMD_SECMEM_FREE: Free the buffer. Match with the ALLOC command
above.
3) MTK_TZCMD_SECMEM_RETRIEVE_SG: If the tee buffer is discrete, this
command can retrieve the detailed PA list from the TEE with which the
kernel will initialize the sg table. Of course, if the tee buffer is
contiguous, the PA will be obtained directly from MTK_TZCMD_SECMEM_ZALLOC.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/dma-buf/heaps/restricted_heap.h     |   3 +
 drivers/dma-buf/heaps/restricted_heap_mtk.c | 193 ++++++++++++++++++++
 2 files changed, 196 insertions(+)

diff --git a/drivers/dma-buf/heaps/restricted_heap.h b/drivers/dma-buf/heaps/restricted_heap.h
index 2a33a1c7a48b..8cb9211093c5 100644
--- a/drivers/dma-buf/heaps/restricted_heap.h
+++ b/drivers/dma-buf/heaps/restricted_heap.h
@@ -13,6 +13,9 @@ struct restricted_buffer {
 	size_t			size;
 
 	struct sg_table		sg_table;
+
+	/* A reference to a buffer in the trusted or secure world. */
+	u64			restricted_addr;
 };
 
 struct restricted_heap {
diff --git a/drivers/dma-buf/heaps/restricted_heap_mtk.c b/drivers/dma-buf/heaps/restricted_heap_mtk.c
index 52e805eb9858..e571eae719e0 100644
--- a/drivers/dma-buf/heaps/restricted_heap_mtk.c
+++ b/drivers/dma-buf/heaps/restricted_heap_mtk.c
@@ -27,6 +27,46 @@ enum mtk_secure_mem_type {
 	MTK_SECURE_MEMORY_TYPE_CM_TZ	= 1,
 };
 
+/* This structure also is synchronized with tee, thus not use the phys_addr_t */
+struct mtk_tee_scatterlist {
+	u64		pa;
+	u32		length;
+} __packed;
+
+enum mtk_secure_buffer_tee_cmd {
+	/*
+	 * Allocate the zeroed secure memory from TEE.
+	 *
+	 * [in]  value[0].a: The buffer size.
+	 *       value[0].b: alignment.
+	 * [in]  value[1].a: enum mtk_secure_mem_type.
+	 * [inout]
+	 *         [out] value[2].a: entry number of memory block.
+	 *                           If this is 1, it means the memory is continuous.
+	 *               value[2].b: buffer PA base.
+	 * [out] value[3].a: The secure handle.
+	 */
+	MTK_TZCMD_SECMEM_ZALLOC		= 0x10000, /* MTK TEE Command ID Base */
+
+	/*
+	 * Free secure memory.
+	 *
+	 * [in]  value[0].a: The secure handle of this buffer, It's value[3].a of
+	 *                   MTK_TZCMD_SECMEM_ZALLOC.
+	 * [out] value[1].a: return value, 0 means successful, otherwise fail.
+	 */
+	MTK_TZCMD_SECMEM_FREE		= 0x10001,
+
+	/*
+	 * Get secure memory sg-list.
+	 *
+	 * [in]  value[0].a: The secure handle of this buffer, It's value[3].a of
+	 *                   MTK_TZCMD_SECMEM_ZALLOC.
+	 * [out] value[1].a: The array of sg items (struct mtk_tee_scatterlist).
+	 */
+	MTK_TZCMD_SECMEM_RETRIEVE_SG	= 0x10002,
+};
+
 struct mtk_restricted_heap_data {
 	struct tee_context	*tee_ctx;
 	u32			tee_session;
@@ -76,6 +116,155 @@ static int mtk_tee_session_init(struct mtk_restricted_heap_data *data)
 	return ret;
 }
 
+static int mtk_tee_service_call(struct tee_context *tee_ctx, u32 session,
+				unsigned int command, struct tee_param *params)
+{
+	struct tee_ioctl_invoke_arg arg = {0};
+	int ret;
+
+	arg.num_params = TEE_PARAM_NUM;
+	arg.session = session;
+	arg.func = command;
+
+	ret = tee_client_invoke_func(tee_ctx, &arg, params);
+	if (ret < 0 || arg.ret) {
+		pr_err("%s: cmd 0x%x ret %d:%x.\n", __func__, command, ret, arg.ret);
+		ret = -EOPNOTSUPP;
+	}
+	return ret;
+}
+
+static int mtk_tee_secmem_free(struct restricted_heap *rheap, u64 restricted_addr)
+{
+	struct mtk_restricted_heap_data *data = rheap->priv_data;
+	struct tee_param params[TEE_PARAM_NUM] = {0};
+
+	params[0].attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT;
+	params[0].u.value.a = restricted_addr;
+	params[1].attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_OUTPUT;
+
+	mtk_tee_service_call(data->tee_ctx, data->tee_session,
+			     MTK_TZCMD_SECMEM_FREE, params);
+	if (params[1].u.value.a) {
+		pr_err("%s, SECMEM_FREE buffer(0x%llx) fail(%lld) from TEE.\n",
+		       rheap->name, restricted_addr, params[1].u.value.a);
+		return -EINVAL;
+	}
+	return 0;
+}
+
+static int mtk_tee_restrict_memory(struct restricted_heap *rheap, struct restricted_buffer *buf)
+{
+	struct mtk_restricted_heap_data *data = rheap->priv_data;
+	struct tee_param params[TEE_PARAM_NUM] = {0};
+	struct mtk_tee_scatterlist *tee_sg_item;
+	struct mtk_tee_scatterlist *tee_sg_buf;
+	unsigned int sg_num, size, i;
+	struct tee_shm *sg_shm;
+	struct scatterlist *sg;
+	phys_addr_t pa_tee;
+	u64 r_addr;
+	int ret;
+
+	/* Alloc the secure buffer and get the sg-list number from TEE */
+	params[0].attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT;
+	params[0].u.value.a = buf->size;
+	params[0].u.value.b = PAGE_SIZE;
+	params[1].attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT;
+	params[1].u.value.a = data->mem_type;
+	params[2].attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INOUT;
+	params[3].attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_OUTPUT;
+	ret = mtk_tee_service_call(data->tee_ctx, data->tee_session,
+				   MTK_TZCMD_SECMEM_ZALLOC, params);
+	if (ret)
+		return -ENOMEM;
+
+	sg_num = params[2].u.value.a;
+	r_addr = params[3].u.value.a;
+
+	/* If there is only one entry, It means the buffer is continuous, Get the PA directly. */
+	if (sg_num == 1) {
+		pa_tee = params[2].u.value.b;
+		if (!pa_tee)
+			goto tee_secmem_free;
+		if (sg_alloc_table(&buf->sg_table, 1, GFP_KERNEL))
+			goto tee_secmem_free;
+		sg_set_page(buf->sg_table.sgl, phys_to_page(pa_tee), buf->size, 0);
+		buf->restricted_addr = r_addr;
+		return 0;
+	}
+
+	/*
+	 * If the buffer inside TEE are discontinuous, Use sharemem to retrieve
+	 * the detail sg list from TEE.
+	 */
+	tee_sg_buf = kmalloc_array(sg_num, sizeof(*tee_sg_item), GFP_KERNEL);
+	if (!tee_sg_buf) {
+		ret = -ENOMEM;
+		goto tee_secmem_free;
+	}
+
+	size = sg_num * sizeof(*tee_sg_item);
+	sg_shm = tee_shm_register_kernel_buf(data->tee_ctx, tee_sg_buf, size);
+	if (!sg_shm)
+		goto free_tee_sg_buf;
+
+	memset(params, 0, sizeof(params));
+	params[0].attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT;
+	params[0].u.value.a = r_addr;
+	params[1].attr = TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT;
+	params[1].u.memref.shm = sg_shm;
+	params[1].u.memref.size = size;
+	ret = mtk_tee_service_call(data->tee_ctx, data->tee_session,
+				   MTK_TZCMD_SECMEM_RETRIEVE_SG, params);
+	if (ret)
+		goto put_shm;
+
+	if (sg_alloc_table(&buf->sg_table, sg_num, GFP_KERNEL))
+		goto put_shm;
+
+	for_each_sgtable_sg(&buf->sg_table, sg, i) {
+		tee_sg_item = tee_sg_buf + i;
+		if (!tee_sg_item->pa)
+			goto free_buf_sg;
+		sg_set_page(sg, phys_to_page(tee_sg_item->pa),
+			    tee_sg_item->length, 0);
+	}
+
+	tee_shm_put(sg_shm);
+	kfree(tee_sg_buf);
+	buf->restricted_addr = r_addr;
+	return 0;
+
+free_buf_sg:
+	sg_free_table(&buf->sg_table);
+put_shm:
+	tee_shm_put(sg_shm);
+free_tee_sg_buf:
+	kfree(tee_sg_buf);
+tee_secmem_free:
+	mtk_tee_secmem_free(rheap, r_addr);
+	return ret;
+}
+
+static void mtk_tee_unrestrict_memory(struct restricted_heap *rheap, struct restricted_buffer *buf)
+{
+	sg_free_table(&buf->sg_table);
+	mtk_tee_secmem_free(rheap, buf->restricted_addr);
+}
+
+static int
+mtk_restricted_memory_allocate(struct restricted_heap *rheap, struct restricted_buffer *buf)
+{
+	/* The memory allocating is within the TEE. */
+	return 0;
+}
+
+static void
+mtk_restricted_memory_free(struct restricted_heap *rheap, struct restricted_buffer *buf)
+{
+}
+
 static int mtk_restricted_heap_init(struct restricted_heap *rheap)
 {
 	struct mtk_restricted_heap_data *data = rheap->priv_data;
@@ -87,6 +276,10 @@ static int mtk_restricted_heap_init(struct restricted_heap *rheap)
 
 static const struct restricted_heap_ops mtk_restricted_heap_ops = {
 	.heap_init		= mtk_restricted_heap_init,
+	.alloc			= mtk_restricted_memory_allocate,
+	.free			= mtk_restricted_memory_free,
+	.restrict_buf		= mtk_tee_restrict_memory,
+	.unrestrict_buf		= mtk_tee_unrestrict_memory,
 };
 
 static struct mtk_restricted_heap_data mtk_restricted_heap_data = {
-- 
2.25.1

