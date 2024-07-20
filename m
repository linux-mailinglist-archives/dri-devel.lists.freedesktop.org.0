Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA422937F73
	for <lists+dri-devel@lfdr.de>; Sat, 20 Jul 2024 09:16:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1824E10E248;
	Sat, 20 Jul 2024 07:16:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="kJUnh10f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EC4010E245
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Jul 2024 07:16:35 +0000 (UTC)
X-UUID: fa787c94466711ef87684b57767b52b1-20240720
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=lYTlPgixUduBTjBpEvV+SXDmJ2OZaQCVAay1WWmtXlc=; 
 b=kJUnh10f0W+mtyIX0lb4S460qowbT9MFzp6plaASeJWr6ZBB8C5dqtWQSlP5NmjySI8icuKuAg+7QqaLl9gytwLd+upK8giAtQm9uSt/idJEGe+QjiYFl/0q/R+opfO0wa0z87CQd7LGH3VHNrLQVSS14XbMcWEYPyaEAg06q/M=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.40, REQID:7ea4f082-4c70-431b-82d7-9902b6b9023e, IP:0,
 U
 RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:-25
X-CID-META: VersionHash:ba885a6, CLOUDID:8914b4d1-436f-4604-ad9d-558fa44a3bbe,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: fa787c94466711ef87684b57767b52b1-20240720
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by
 mailgw02.mediatek.com (envelope-from <yunfei.dong@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1716758340; Sat, 20 Jul 2024 15:16:26 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sat, 20 Jul 2024 00:16:26 -0700
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sat, 20 Jul 2024 15:16:25 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Jeffrey Kardatzke <jkardatzke@google.com>,
 =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
 <nfraprado@collabora.com>, Nathan Hebert <nhebert@chromium.org>, Nicolas
 Dufresne <nicolas.dufresne@collabora.com>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Sebastian Fricke
 <sebastian.fricke@collabora.com>, Tomasz Figa <tfiga@chromium.org>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Marek Szyprowski
 <m.szyprowski@samsung.com>
CC: Chen-Yu Tsai <wenst@chromium.org>, Yong Wu <yong.wu@mediatek.com>, Hsin-Yi
 Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>, Daniel
 Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>, Yunfei Dong
 <yunfei.dong@mediatek.com>, Sumit Semwal <sumit.semwal@linaro.org>, Brian
 Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, "T . J .
 Mercier" <tjmercier@google.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v7 12/28] media: mediatek: vcodec: add interface to
 allocate/free secure memory
Date: Sat, 20 Jul 2024 15:15:50 +0800
Message-ID: <20240720071606.27930-13-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240720071606.27930-1-yunfei.dong@mediatek.com>
References: <20240720071606.27930-1-yunfei.dong@mediatek.com>
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

Calling dma heap interface to allocate/free secure memory when
playing secure video.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../media/platform/mediatek/vcodec/Kconfig    |   1 +
 .../mediatek/vcodec/common/mtk_vcodec_util.c  | 117 +++++++++++++++++-
 .../mediatek/vcodec/common/mtk_vcodec_util.h  |   8 +-
 3 files changed, 122 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/Kconfig b/drivers/media/platform/mediatek/vcodec/Kconfig
index ce63e1fa6118..f4c105b1d39b 100644
--- a/drivers/media/platform/mediatek/vcodec/Kconfig
+++ b/drivers/media/platform/mediatek/vcodec/Kconfig
@@ -37,6 +37,7 @@ config VIDEO_MEDIATEK_VCODEC
 
 config VIDEO_MEDIATEK_VCODEC_TEE
 	bool "MediaTek Video Codec TEE driver"
+	depends on DMABUF_HEAPS
 	depends on OPTEE
 	depends on TEE
 	select VIDEO_MEDIATEK_VCODEC
diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_util.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_util.c
index fc4e34c29192..a77832f8cf46 100644
--- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_util.c
+++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_util.c
@@ -5,9 +5,11 @@
 *	Tiffany Lin <tiffany.lin@mediatek.com>
 */
 
+#include <linux/dma-heap.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/regmap.h>
+#include <uapi/linux/dma-heap.h>
 
 #include "../decoder/mtk_vcodec_dec_drv.h"
 #include "../encoder/mtk_vcodec_enc_drv.h"
@@ -45,7 +47,7 @@ int mtk_vcodec_write_vdecsys(struct mtk_vcodec_dec_ctx *ctx, unsigned int reg,
 }
 EXPORT_SYMBOL(mtk_vcodec_write_vdecsys);
 
-int mtk_vcodec_mem_alloc(void *priv, struct mtk_vcodec_mem *mem)
+static int mtk_vcodec_mem_alloc_nor(void *priv, struct mtk_vcodec_mem *mem)
 {
 	enum mtk_instance_type inst_type = *((unsigned int *)priv);
 	struct platform_device *plat_dev;
@@ -76,9 +78,71 @@ int mtk_vcodec_mem_alloc(void *priv, struct mtk_vcodec_mem *mem)
 
 	return 0;
 }
-EXPORT_SYMBOL(mtk_vcodec_mem_alloc);
 
-void mtk_vcodec_mem_free(void *priv, struct mtk_vcodec_mem *mem)
+static int mtk_vcodec_mem_alloc_sec(struct mtk_vcodec_dec_ctx *ctx, struct mtk_vcodec_mem *mem)
+{
+#if IS_ENABLED(CONFIG_DMABUF_HEAPS)
+	struct device *dev = &ctx->dev->plat_dev->dev;
+	struct dma_buf *dma_buffer;
+	struct dma_heap *dma_heap;
+	struct dma_buf_attachment *attach;
+	struct sg_table *sgt;
+	unsigned long size = mem->size;
+
+	if (!size)
+		return -EINVAL;
+
+	dma_heap = dma_heap_find("restricted_mtk_cma");
+	if (!dma_heap) {
+		mtk_v4l2_vdec_err(ctx, "dma heap find failed!");
+		goto err_alloc_mem;
+	}
+
+	dma_buffer = dma_heap_buffer_alloc(dma_heap, size, DMA_HEAP_VALID_FD_FLAGS,
+					   DMA_HEAP_VALID_HEAP_FLAGS);
+	if (IS_ERR(dma_buffer)) {
+		mtk_v4l2_vdec_err(ctx, "dma heap alloc size=0x%lx failed!", size);
+		dma_heap_put(dma_heap);
+		goto err_alloc_mem;
+	}
+	dma_heap_put(dma_heap);
+
+	attach = dma_buf_attach(dma_buffer, dev);
+	if (IS_ERR(attach)) {
+		mtk_v4l2_vdec_err(ctx, "dma attach size=0x%lx failed!", size);
+		dma_buf_put(dma_buffer);
+		goto err_alloc_mem;
+	}
+
+	sgt = dma_buf_map_attachment(attach, DMA_BIDIRECTIONAL);
+	if (IS_ERR(sgt)) {
+		mtk_v4l2_vdec_err(ctx, "dma map attach size=0x%lx failed!", size);
+		dma_buf_detach(dma_buffer, attach);
+		dma_buf_put(dma_buffer);
+		goto err_alloc_mem;
+	}
+
+	mem->dma_addr = sg_dma_address(sgt->sgl);
+	mem->dma_buf = dma_buffer;
+	mem->attach = attach;
+	mem->sgt = sgt;
+
+	return 0;
+
+err_alloc_mem:
+	mem->attach = NULL;
+	mem->dma_buf = NULL;
+	mem->sgt = NULL;
+	mem->dma_addr = 0;
+	mem->size = 0;
+
+	return -ENOMEM;
+#else
+	return -EOPNOTSUPP;
+#endif
+}
+
+static void mtk_vcodec_mem_free_nor(void *priv, struct mtk_vcodec_mem *mem)
 {
 	enum mtk_instance_type inst_type = *((unsigned int *)priv);
 	struct platform_device *plat_dev;
@@ -111,6 +175,52 @@ void mtk_vcodec_mem_free(void *priv, struct mtk_vcodec_mem *mem)
 	mem->dma_addr = 0;
 	mem->size = 0;
 }
+
+static void mtk_vcodec_mem_free_sec(struct mtk_vcodec_mem *mem)
+{
+#if IS_ENABLED(CONFIG_DMABUF_HEAPS)
+	dma_buf_unmap_attachment(mem->attach, mem->sgt, DMA_BIDIRECTIONAL);
+	dma_buf_detach(mem->dma_buf, mem->attach);
+	dma_buf_put(mem->dma_buf);
+
+	mem->attach = NULL;
+	mem->dma_buf = NULL;
+	mem->sgt = NULL;
+	mem->dma_addr = 0;
+	mem->size = 0;
+#endif
+}
+
+int mtk_vcodec_mem_alloc(void *priv, struct mtk_vcodec_mem *mem)
+{
+	enum mtk_instance_type inst_type = *((unsigned int *)priv);
+
+	if (inst_type == MTK_INST_DECODER) {
+		struct mtk_vcodec_dec_ctx *dec_ctx = priv;
+
+		if (dec_ctx->is_secure_playback)
+			return mtk_vcodec_mem_alloc_sec(dec_ctx, mem);
+	}
+
+	return mtk_vcodec_mem_alloc_nor(priv, mem);
+}
+EXPORT_SYMBOL(mtk_vcodec_mem_alloc);
+
+void mtk_vcodec_mem_free(void *priv, struct mtk_vcodec_mem *mem)
+{
+	enum mtk_instance_type inst_type = *((unsigned int *)priv);
+
+	if (inst_type == MTK_INST_DECODER) {
+		struct mtk_vcodec_dec_ctx *dec_ctx = priv;
+
+		if (dec_ctx->is_secure_playback) {
+			mtk_vcodec_mem_free_sec(mem);
+			return;
+		}
+	}
+
+	mtk_vcodec_mem_free_nor(priv, mem);
+}
 EXPORT_SYMBOL(mtk_vcodec_mem_free);
 
 void *mtk_vcodec_get_hw_dev(struct mtk_vcodec_dec_dev *dev, int hw_idx)
@@ -172,3 +282,4 @@ EXPORT_SYMBOL(mtk_vcodec_get_curr_ctx);
 
 MODULE_LICENSE("GPL v2");
 MODULE_DESCRIPTION("Mediatek video codec driver");
+MODULE_IMPORT_NS(DMA_BUF);
diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_util.h b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_util.h
index 85f615cdd4d3..0a264e4f52bf 100644
--- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_util.h
+++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_util.h
@@ -16,8 +16,14 @@
 
 struct mtk_vcodec_mem {
 	size_t size;
-	void *va;
+	union {
+		void *va;
+		struct dma_buf *dma_buf;
+	};
 	dma_addr_t dma_addr;
+
+	struct dma_buf_attachment *attach;
+	struct sg_table *sgt;
 };
 
 struct mtk_vcodec_fb {
-- 
2.18.0

