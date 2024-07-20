Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 839A3937F6F
	for <lists+dri-devel@lfdr.de>; Sat, 20 Jul 2024 09:16:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02FAA10E23F;
	Sat, 20 Jul 2024 07:16:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="OIQvyuv/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFC4310E23D
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Jul 2024 07:16:25 +0000 (UTC)
X-UUID: f6694412466711efb5b96b43b535fdb4-20240720
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=81mOomD9D9mP7IkEQxu9YKdBkp81NzgBBrMCA0+IKkY=; 
 b=OIQvyuv/UuGRmukxoNPp4Z9BzxOTKTSJej5Kk4RdhPC0n6MLfLuSA3IddUQNPj62ZnH4DNpIFRAyAYW9v6QCM8u6fSiUqLZiOOIfPGZUiC1ruLWnImEE2HhrIhcZYk5kHqJHNIw7AHBuvnn1IZ64cZfRgvuPfKeuUd56wc9CY6E=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.40, REQID:754fd821-1cc0-4943-bf77-ea46527f131a, IP:0,
 U
 RL:0,TC:0,Content:-20,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:-20
X-CID-META: VersionHash:ba885a6, CLOUDID:4d14b4d1-436f-4604-ad9d-558fa44a3bbe,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:1,EDM:-3,IP:nil,U
 RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: f6694412466711efb5b96b43b535fdb4-20240720
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by
 mailgw01.mediatek.com (envelope-from <yunfei.dong@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 48598797; Sat, 20 Jul 2024 15:16:20 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sat, 20 Jul 2024 15:16:19 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sat, 20 Jul 2024 15:16:17 +0800
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
Subject: [PATCH v7 07/28] media: mediatek: vcodec: add tee client interface to
 communiate with optee-os
Date: Sat, 20 Jul 2024 15:15:45 +0800
Message-ID: <20240720071606.27930-8-yunfei.dong@mediatek.com>
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

Open tee context to initialize the environment in order to
communication with optee-os, then open tee session as the
communication pipeline for lat and core to send data for
hardware decode.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../platform/mediatek/vcodec/decoder/Makefile |   1 +
 .../vcodec/decoder/mtk_vcodec_dec_drv.h       |   5 +
 .../vcodec/decoder/mtk_vcodec_dec_optee.c     | 168 ++++++++++++++++++
 .../vcodec/decoder/mtk_vcodec_dec_optee.h     |  73 ++++++++
 4 files changed, 247 insertions(+)
 create mode 100644 drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_optee.c
 create mode 100644 drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_optee.h

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/Makefile b/drivers/media/platform/mediatek/vcodec/decoder/Makefile
index 904cd22def84..1624933dfd5e 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/Makefile
+++ b/drivers/media/platform/mediatek/vcodec/decoder/Makefile
@@ -21,5 +21,6 @@ mtk-vcodec-dec-y := vdec/vdec_h264_if.o \
 		mtk_vcodec_dec_stateful.o \
 		mtk_vcodec_dec_stateless.o \
 		mtk_vcodec_dec_pm.o \
+		mtk_vcodec_dec_optee.o \
 
 mtk-vcodec-dec-hw-y := mtk_vcodec_dec_hw.o
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
index ac568ed14fa2..0996a8d2a537 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
@@ -11,6 +11,7 @@
 #include "../common/mtk_vcodec_dbgfs.h"
 #include "../common/mtk_vcodec_fw_priv.h"
 #include "../common/mtk_vcodec_util.h"
+#include "mtk_vcodec_dec_optee.h"
 #include "vdec_msg_queue.h"
 
 #define MTK_VCODEC_DEC_NAME	"mtk-vcodec-dec"
@@ -262,6 +263,8 @@ struct mtk_vcodec_dec_ctx {
  * @dbgfs: debug log related information
  *
  * @chip_name: used to distinguish platforms and select the correct codec configuration values
+ *
+ * @optee_private: optee private data
  */
 struct mtk_vcodec_dec_dev {
 	struct v4l2_device v4l2_dev;
@@ -305,6 +308,8 @@ struct mtk_vcodec_dec_dev {
 	struct mtk_vcodec_dbgfs dbgfs;
 
 	enum mtk_vcodec_dec_chip_name chip_name;
+
+	struct mtk_vdec_optee_private *optee_private;
 };
 
 static inline struct mtk_vcodec_dec_ctx *fh_to_dec_ctx(struct v4l2_fh *fh)
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_optee.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_optee.c
new file mode 100644
index 000000000000..6fce32f9ba18
--- /dev/null
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_optee.c
@@ -0,0 +1,168 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2024 MediaTek Inc.
+ * Author: Yunfei Dong <yunfei.dong@mediatek.com>
+ */
+
+#include "mtk_vcodec_dec_drv.h"
+#include "mtk_vcodec_dec_optee.h"
+
+/*
+ * Randomly generated, and must correspond to the GUID on the TA side.
+ */
+static const uuid_t mtk_vdec_lat_uuid =
+	UUID_INIT(0xBC50D971, 0xD4C9, 0x42C4,
+		  0x82, 0xCB, 0x34, 0x3F, 0xB7, 0xF3, 0x78, 0x90);
+
+static const uuid_t mtk_vdec_core_uuid =
+	UUID_INIT(0xBC50D971, 0xD4C9, 0x42C4,
+		  0x82, 0xCB, 0x34, 0x3F, 0xB7, 0xF3, 0x78, 0x91);
+
+/*
+ * Check whether this driver supports decoder TA in the TEE instance,
+ * represented by the params (ver/data) of this function.
+ */
+static int mtk_vcodec_dec_optee_match(struct tee_ioctl_version_data *ver_data, const void *not_used)
+{
+	return ver_data->impl_id == TEE_IMPL_ID_OPTEE;
+}
+
+int mtk_vcodec_dec_optee_private_init(struct mtk_vcodec_dec_dev *vcodec_dev)
+{
+	vcodec_dev->optee_private = devm_kzalloc(&vcodec_dev->plat_dev->dev,
+						 sizeof(*vcodec_dev->optee_private),
+						 GFP_KERNEL);
+	if (!vcodec_dev->optee_private)
+		return -ENOMEM;
+
+	vcodec_dev->optee_private->vcodec_dev = vcodec_dev;
+
+	atomic_set(&vcodec_dev->optee_private->tee_active_cnt, 0);
+	mutex_init(&vcodec_dev->optee_private->tee_mutex);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(mtk_vcodec_dec_optee_private_init);
+
+static int mtk_vcodec_dec_optee_init_hw_info(struct mtk_vdec_optee_private *optee_private,
+					     enum mtk_vdec_hw_id hardware_index)
+{
+	struct device *dev = &optee_private->vcodec_dev->plat_dev->dev;
+	struct tee_ioctl_open_session_arg session_arg;
+	struct mtk_vdec_optee_ca_info *ca_info;
+	int err = 0, session_func;
+
+	/* Open lat and core session with vdec TA. */
+	switch (hardware_index) {
+	case MTK_VDEC_LAT0:
+		export_uuid(session_arg.uuid, &mtk_vdec_lat_uuid);
+		session_func = MTK_VDEC_OPTEE_TA_LAT_SUBMIT_COMMAND;
+		ca_info = &optee_private->lat_ca;
+		break;
+	case MTK_VDEC_CORE:
+		export_uuid(session_arg.uuid, &mtk_vdec_core_uuid);
+		session_func = MTK_VDEC_OPTEE_TA_CORE_SUBMIT_COMMAND;
+		ca_info = &optee_private->core_ca;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	session_arg.clnt_login = TEE_IOCTL_LOGIN_PUBLIC;
+	session_arg.num_params = 0;
+
+	err = tee_client_open_session(optee_private->tee_vdec_ctx, &session_arg, NULL);
+	if (err < 0 || session_arg.ret != 0) {
+		dev_err(dev, MTK_DBG_VCODEC_STR "open vdec tee session fail hw_id:%d err:%x.\n",
+			hardware_index, session_arg.ret);
+		return -EINVAL;
+	}
+	ca_info->vdec_session_id = session_arg.session;
+	ca_info->hw_id = hardware_index;
+	ca_info->vdec_session_func = session_func;
+
+	dev_dbg(dev, MTK_DBG_VCODEC_STR "open vdec tee session hw_id:%d session_id=%x.\n",
+		hardware_index, ca_info->vdec_session_id);
+
+	return err;
+}
+
+static void mtk_vcodec_dec_optee_deinit_hw_info(struct mtk_vdec_optee_private *optee_private,
+						enum mtk_vdec_hw_id hw_id)
+{
+	struct mtk_vdec_optee_ca_info *ca_info;
+
+	if (hw_id == MTK_VDEC_LAT0)
+		ca_info = &optee_private->lat_ca;
+	else
+		ca_info = &optee_private->core_ca;
+
+	tee_client_close_session(optee_private->tee_vdec_ctx, ca_info->vdec_session_id);
+}
+
+int mtk_vcodec_dec_optee_open(struct mtk_vcodec_dec_dev *vcodec_dev)
+{
+	struct mtk_vdec_optee_private *optee_private = vcodec_dev->optee_private;
+	struct device *dev = &optee_private->vcodec_dev->plat_dev->dev;
+	int ret;
+
+	mutex_lock(&optee_private->tee_mutex);
+	if (atomic_inc_return(&optee_private->tee_active_cnt) > 1) {
+		mutex_unlock(&optee_private->tee_mutex);
+		dev_dbg(dev, MTK_DBG_VCODEC_STR "already initialized vdec optee private data!\n");
+		return 0;
+	}
+
+	/* Open context with TEE driver */
+	optee_private->tee_vdec_ctx = tee_client_open_context(NULL, mtk_vcodec_dec_optee_match,
+							      NULL, NULL);
+	if (IS_ERR(optee_private->tee_vdec_ctx)) {
+		dev_err(dev, MTK_DBG_VCODEC_STR "optee vdec tee context failed.\n");
+		ret = PTR_ERR(optee_private->tee_vdec_ctx);
+		goto err_ctx_open;
+	}
+
+	ret = mtk_vcodec_dec_optee_init_hw_info(optee_private, MTK_VDEC_CORE);
+	if (ret < 0)
+		goto err_core_init;
+
+	if (IS_VDEC_LAT_ARCH(optee_private->vcodec_dev->vdec_pdata->hw_arch)) {
+		ret = mtk_vcodec_dec_optee_init_hw_info(optee_private, MTK_VDEC_LAT0);
+		if (ret < 0)
+			goto err_lat_init;
+	}
+
+	mutex_unlock(&optee_private->tee_mutex);
+
+	return 0;
+
+err_lat_init:
+	mtk_vcodec_dec_optee_deinit_hw_info(optee_private, MTK_VDEC_CORE);
+err_core_init:
+	tee_client_close_context(optee_private->tee_vdec_ctx);
+err_ctx_open:
+
+	mutex_unlock(&optee_private->tee_mutex);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(mtk_vcodec_dec_optee_open);
+
+void mtk_vcodec_dec_optee_close(struct mtk_vcodec_dec_dev *vcodec_dev)
+{
+	struct mtk_vdec_optee_private *optee_private = vcodec_dev->optee_private;
+
+	mutex_lock(&optee_private->tee_mutex);
+	if (!atomic_dec_and_test(&optee_private->tee_active_cnt)) {
+		mutex_unlock(&optee_private->tee_mutex);
+		return;
+	}
+
+	mtk_vcodec_dec_optee_deinit_hw_info(optee_private, MTK_VDEC_CORE);
+	if (IS_VDEC_LAT_ARCH(optee_private->vcodec_dev->vdec_pdata->hw_arch))
+		mtk_vcodec_dec_optee_deinit_hw_info(optee_private, MTK_VDEC_LAT0);
+
+	tee_client_close_context(optee_private->tee_vdec_ctx);
+	mutex_unlock(&optee_private->tee_mutex);
+}
+EXPORT_SYMBOL_GPL(mtk_vcodec_dec_optee_close);
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_optee.h b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_optee.h
new file mode 100644
index 000000000000..33134cf0d5d5
--- /dev/null
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_optee.h
@@ -0,0 +1,73 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2024 MediaTek Inc.
+ * Author: Yunfei Dong <yunfei.dong@mediatek.com>
+ */
+
+#ifndef _MTK_VCODEC_DEC_OPTEE_H_
+#define _MTK_VCODEC_DEC_OPTEE_H_
+
+#include <linux/tee_drv.h>
+#include <linux/uuid.h>
+
+#include "mtk_vcodec_dec_drv.h"
+
+/* The TA ID implemented in this TA */
+#define MTK_VDEC_OPTEE_TA_LAT_SUBMIT_COMMAND  (0x10)
+#define MTK_VDEC_OPTEE_TA_CORE_SUBMIT_COMMAND  (0x20)
+
+#define MTK_OPTEE_MAX_TEE_PARAMS 4
+
+/**
+ * struct mtk_vdec_optee_ca_info - ca related param
+ * @vdec_session_id:   optee TA session identifier.
+ * @hw_id:             hardware index.
+ * @vdec_session_func: trusted application function id used specific to the TA.
+ */
+struct mtk_vdec_optee_ca_info {
+	u32 vdec_session_id;
+	enum mtk_vdec_hw_id hw_id;
+	u32 vdec_session_func;
+};
+
+/**
+ * struct mtk_vdec_optee_private - optee private data
+ * @vcodec_dev:     pointer to the mtk_vcodec_dec_dev of the device
+ * @tee_vdec_ctx:   decoder TEE context handler.
+ * @lat_ca:         lat hardware information used to communicate with TA.
+ * @core_ca:        core hardware information used to communicate with TA.
+ *
+ * @tee_active_cnt: used to mark whether need to init optee
+ * @tee_mutex:      mutex lock used for optee
+ */
+struct mtk_vdec_optee_private {
+	struct mtk_vcodec_dec_dev *vcodec_dev;
+	struct tee_context *tee_vdec_ctx;
+
+	struct mtk_vdec_optee_ca_info lat_ca;
+	struct mtk_vdec_optee_ca_info core_ca;
+
+	atomic_t tee_active_cnt;
+	/* mutext used to lock optee open and release information. */
+	struct mutex tee_mutex;
+};
+
+/**
+ * mtk_vcodec_dec_optee_open - setup the communication channels with TA.
+ * @vcodec_dev: pointer to the mtk_vcodec_dec_dev of the device
+ */
+int mtk_vcodec_dec_optee_open(struct mtk_vcodec_dec_dev *vcodec_dev);
+
+/**
+ * mtk_vcodec_dec_optee_private_init - init optee parameters.
+ * @vcodec_dev: pointer to the mtk_vcodec_dec_dev of the device
+ */
+int mtk_vcodec_dec_optee_private_init(struct mtk_vcodec_dec_dev *vcodec_dev);
+
+/**
+ * mtk_vcodec_dec_optee_close - close the communication channels with TA.
+ * @vcodec_dev: pointer to the mtk_vcodec_dec_dev of the device
+ */
+void mtk_vcodec_dec_optee_close(struct mtk_vcodec_dec_dev *vcodec_dev);
+
+#endif /* _MTK_VCODEC_DEC_OPTEE_H_ */
-- 
2.18.0

