Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC33937F6E
	for <lists+dri-devel@lfdr.de>; Sat, 20 Jul 2024 09:16:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D87C10E23D;
	Sat, 20 Jul 2024 07:16:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="WO+QWW9U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E056110E237
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Jul 2024 07:16:24 +0000 (UTC)
X-UUID: f7572100466711efb5b96b43b535fdb4-20240720
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=RUz5ot+LaS7Lg1KmiTaf3FjChjpgDncj5aIQCsdvBSc=; 
 b=WO+QWW9USltr2CdYtx+BTgMnPffKbD21miseHcyCqGDFjGWsw6BX5s9iLPINaOy80ta+CdFcs08XQp5dXUnLTcGNYuTLd77DT58DvBm3BVRNsRXk1nffe7A5lE+TwFmm/2kAhQR3B0QaCaUtwMfEMqu8ChHPjy1MlqG+1Ol6ZJc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.40, REQID:b754e8ae-77d1-41a4-b475-898d66f04a4b, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:-25
X-CID-META: VersionHash:ba885a6, CLOUDID:4c14b4d1-436f-4604-ad9d-558fa44a3bbe,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:1,IP:nil,UR
 L:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,S
 PR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: f7572100466711efb5b96b43b535fdb4-20240720
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw01.mediatek.com (envelope-from <yunfei.dong@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1349028742; Sat, 20 Jul 2024 15:16:21 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sat, 20 Jul 2024 15:16:20 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sat, 20 Jul 2024 15:16:19 +0800
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
Subject: [PATCH v7 08/28] media: mediatek: vcodec: build decoder OPTEE driver
 as module
Date: Sat, 20 Jul 2024 15:15:46 +0800
Message-ID: <20240720071606.27930-9-yunfei.dong@mediatek.com>
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

The tee_* function make the driver depends on the TEE driver, isolate
the decoder OPTEE client into a separate module, and make it depends on
CONFIG_TEE. The driver can open/close the TEE driver dynamically.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../media/platform/mediatek/vcodec/Kconfig    | 12 ++++++++++++
 .../platform/mediatek/vcodec/decoder/Makefile |  5 ++++-
 .../vcodec/decoder/mtk_vcodec_dec_drv.h       |  2 ++
 .../vcodec/decoder/mtk_vcodec_dec_optee.h     | 19 +++++++++++++++++++
 4 files changed, 37 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/vcodec/Kconfig b/drivers/media/platform/mediatek/vcodec/Kconfig
index bc8292232530..ce63e1fa6118 100644
--- a/drivers/media/platform/mediatek/vcodec/Kconfig
+++ b/drivers/media/platform/mediatek/vcodec/Kconfig
@@ -34,3 +34,15 @@ config VIDEO_MEDIATEK_VCODEC
 
 	  To compile this driver as modules, choose M here: the
 	  modules will be called mtk-vcodec-dec and mtk-vcodec-enc.
+
+config VIDEO_MEDIATEK_VCODEC_TEE
+	bool "MediaTek Video Codec TEE driver"
+	depends on OPTEE
+	depends on TEE
+	select VIDEO_MEDIATEK_VCODEC
+	help
+	  MediaTek video codec TEE driver provides interface to
+	  communicate with secure os to process secure video.
+
+	  Setting this config with Y when the driver need to support
+	  secure video playback(SVP).
\ No newline at end of file
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/Makefile b/drivers/media/platform/mediatek/vcodec/decoder/Makefile
index 1624933dfd5e..797ad9ebafb6 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/Makefile
+++ b/drivers/media/platform/mediatek/vcodec/decoder/Makefile
@@ -3,6 +3,8 @@
 obj-$(CONFIG_VIDEO_MEDIATEK_VCODEC) += mtk-vcodec-dec.o \
 				       mtk-vcodec-dec-hw.o
 
+obj-$(CONFIG_VIDEO_MEDIATEK_VCODEC_TEE) += mtk-vcodec-optee.o
+
 mtk-vcodec-dec-y := vdec/vdec_h264_if.o \
 		vdec/vdec_vp8_if.o \
 		vdec/vdec_vp8_req_if.o \
@@ -21,6 +23,7 @@ mtk-vcodec-dec-y := vdec/vdec_h264_if.o \
 		mtk_vcodec_dec_stateful.o \
 		mtk_vcodec_dec_stateless.o \
 		mtk_vcodec_dec_pm.o \
-		mtk_vcodec_dec_optee.o \
 
 mtk-vcodec-dec-hw-y := mtk_vcodec_dec_hw.o
+
+mtk-vcodec-optee-y := mtk_vcodec_dec_optee.o
\ No newline at end of file
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
index 0996a8d2a537..dcab8a257380 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
@@ -309,7 +309,9 @@ struct mtk_vcodec_dec_dev {
 
 	enum mtk_vcodec_dec_chip_name chip_name;
 
+#ifdef CONFIG_VIDEO_MEDIATEK_VCODEC_TEE
 	struct mtk_vdec_optee_private *optee_private;
+#endif
 };
 
 static inline struct mtk_vcodec_dec_ctx *fh_to_dec_ctx(struct v4l2_fh *fh)
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_optee.h b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_optee.h
index 33134cf0d5d5..8a2a82874597 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_optee.h
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_optee.h
@@ -52,6 +52,7 @@ struct mtk_vdec_optee_private {
 	struct mutex tee_mutex;
 };
 
+#ifdef CONFIG_VIDEO_MEDIATEK_VCODEC_TEE
 /**
  * mtk_vcodec_dec_optee_open - setup the communication channels with TA.
  * @vcodec_dev: pointer to the mtk_vcodec_dec_dev of the device
@@ -70,4 +71,22 @@ int mtk_vcodec_dec_optee_private_init(struct mtk_vcodec_dec_dev *vcodec_dev);
  */
 void mtk_vcodec_dec_optee_close(struct mtk_vcodec_dec_dev *vcodec_dev);
 
+#else
+
+static inline int mtk_vcodec_dec_optee_open(struct mtk_vcodec_dec_dev *vcodec_dev)
+{
+	return 0;
+}
+
+static inline int mtk_vcodec_dec_optee_private_init(struct mtk_vcodec_dec_dev *vcodec_dev)
+{
+	return 0;
+}
+
+static inline void mtk_vcodec_dec_optee_close(struct mtk_vcodec_dec_dev *vcodec_dev)
+{
+}
+
+#endif /* CONFIG_VIDEO_MEDIATEK_VCODEC_TEE */
+
 #endif /* _MTK_VCODEC_DEC_OPTEE_H_ */
-- 
2.18.0

