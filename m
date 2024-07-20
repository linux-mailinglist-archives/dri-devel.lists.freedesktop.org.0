Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED36E937F71
	for <lists+dri-devel@lfdr.de>; Sat, 20 Jul 2024 09:16:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63A6710E242;
	Sat, 20 Jul 2024 07:16:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="X5STxMHo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66D8010E242
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Jul 2024 07:16:32 +0000 (UTC)
X-UUID: f8eeec0a466711ef87684b57767b52b1-20240720
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=G5Ua7lYvtev4qePlY6O+c2BJ7ykrV6jyDAJLqyMnz0w=; 
 b=X5STxMHoLedTKN7DVs0HsnenbGIlk+nKovI+x0mts4etsQwGo6qLmh7Sb1/rWiH7yPNvP8YMZo57uW/pC3UfJqKHqNH1F9gaPsDzu9gqoEA9R1+l9cLeT5UMcMZazYxtVZsfdnoMwdma6iA292UI4VbSVECtDebeWrAdYtWuc94=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.40, REQID:2bb3dd3f-0c4d-4cad-a3f5-4c124d6fefb7, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:ba885a6, CLOUDID:7114b4d1-436f-4604-ad9d-558fa44a3bbe,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:1,EDM:-3,IP:nil,U
 RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: f8eeec0a466711ef87684b57767b52b1-20240720
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by
 mailgw02.mediatek.com (envelope-from <yunfei.dong@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1654511204; Sat, 20 Jul 2024 15:16:24 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sat, 20 Jul 2024 15:16:23 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sat, 20 Jul 2024 15:16:22 +0800
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
Subject: [PATCH v7 10/28] media: mediatek: vcodec: send share memory data to
 optee
Date: Sat, 20 Jul 2024 15:15:48 +0800
Message-ID: <20240720071606.27930-11-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240720071606.27930-1-yunfei.dong@mediatek.com>
References: <20240720071606.27930-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--12.299500-8.000000
X-TMASE-MatchedRID: WwYPrb4hulWQG6Uyrf0PKFVN8laWo90MTJDl9FKHbrk1LB46LFAAkt6M
 yUV+2+DZzKPeLlju3dvVDlcUGlyCB6YofNn3TZqQtw+xHnsmQjPaoFJAcCHymE4K0IMk2m3GVSd
 AA6mVeIbLqCJZs0VuwI6aNvX7ROYGCNmyKN5cwZbJ5W6OZe5hhSGlZBSK0BYbW+jwVKpqvlJkiT
 b3qnEXb7qtHHbrub22gDLqnrRlXrZ8nn9tnqel2MprJP8FBOIanzEbdasY8vR4AjMyulFZN5UaB
 yt0CpwsfAS1qTKrn76DV0WvKd1Y3g==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--12.299500-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 3376F95AEF5677CA4EC6E039F9D64A01A01FB7CC25C694F8AA4F7B5B2A9252102000:8
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

Setting msg and vsi information to shared buffer, then call tee invoke
function to send it to optee-os.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../vcodec/decoder/mtk_vcodec_dec_optee.c     | 156 +++++++++++++++++-
 .../vcodec/decoder/mtk_vcodec_dec_optee.h     |  74 +++++++++
 2 files changed, 226 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_optee.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_optee.c
index bcef86f54d84..8af9a81a02e1 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_optee.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_optee.c
@@ -27,6 +27,13 @@ static int mtk_vcodec_dec_optee_match(struct tee_ioctl_version_data *ver_data, c
 	return ver_data->impl_id == TEE_IMPL_ID_OPTEE;
 }
 
+static inline
+struct mtk_vdec_optee_ca_info *get_ca_info(struct mtk_vdec_optee_private *optee_private,
+					   enum mtk_vdec_hw_id hw_id)
+{
+	return hw_id == MTK_VDEC_LAT0 ? &optee_private->lat_ca : &optee_private->core_ca;
+}
+
 int mtk_vcodec_dec_optee_private_init(struct mtk_vcodec_dec_dev *vcodec_dev)
 {
 	vcodec_dev->optee_private = devm_kzalloc(&vcodec_dev->plat_dev->dev,
@@ -164,10 +171,7 @@ static void mtk_vcodec_dec_optee_deinit_hw_info(struct mtk_vdec_optee_private *o
 	struct mtk_vdec_optee_ca_info *ca_info;
 	int i;
 
-	if (hw_id == MTK_VDEC_LAT0)
-		ca_info = &optee_private->lat_ca;
-	else
-		ca_info = &optee_private->core_ca;
+	ca_info = get_ca_info(optee_private, hw_id);
 
 	for (i = 0; i < OPTEE_MAX_INDEX; i++)
 		mtk_vcodec_dec_optee_deinit_memref(ca_info, i);
@@ -241,3 +245,147 @@ void mtk_vcodec_dec_optee_close(struct mtk_vcodec_dec_dev *vcodec_dev)
 	mutex_unlock(&optee_private->tee_mutex);
 }
 EXPORT_SYMBOL_GPL(mtk_vcodec_dec_optee_close);
+
+static int mtk_vcodec_dec_optee_fill_shm(struct tee_param *command_params,
+					 struct mtk_vdec_optee_shm_memref *shm_memref,
+					 struct mtk_vdec_optee_data_to_shm *data,
+					 int index, struct device *dev)
+{
+	if (!data->msg_buf_size[index] || !data->msg_buf[index]) {
+		pr_err(MTK_DBG_VCODEC_STR "tee invalid buf param: %d.\n", index);
+		return -EINVAL;
+	}
+
+	*command_params = (struct tee_param) {
+		.attr = shm_memref->param_type,
+		.u.memref = {
+			.shm = shm_memref->msg_shm,
+			.size = data->msg_buf_size[index],
+			.shm_offs = 0,
+		},
+	};
+
+	if (!shm_memref->copy_to_ta) {
+		dev_dbg(dev, MTK_DBG_VCODEC_STR "share memref data: 0x%x param_type:%llu.\n",
+			*((unsigned int *)shm_memref->msg_shm_ca_buf), shm_memref->param_type);
+		return 0;
+	}
+
+	memset(shm_memref->msg_shm_ca_buf, 0, shm_memref->msg_shm_size);
+	memcpy(shm_memref->msg_shm_ca_buf, data->msg_buf[index], data->msg_buf_size[index]);
+
+	dev_dbg(dev, MTK_DBG_VCODEC_STR "share memref data => msg id:0x%x 0x%x param_type:%llu.\n",
+		*((unsigned int *)data->msg_buf[index]),
+		*((unsigned int *)shm_memref->msg_shm_ca_buf),
+		shm_memref->param_type);
+
+	return 0;
+}
+
+static int mtk_vcodec_dec_get_shm_buffer_size(struct mtk_vdec_optee_private *optee_private,
+					      enum mtk_vdec_hw_id hw_id,
+					      enum mtk_vdec_optee_data_index data_index)
+{
+	struct mtk_vdec_optee_ca_info *ca_info;
+
+	ca_info = get_ca_info(optee_private, hw_id);
+
+	return ca_info->shm_memref[data_index].msg_shm_size;
+}
+
+void mtk_vcodec_dec_optee_set_msg_info(struct mtk_vdec_optee_data_to_shm *data,
+				       void *buf, int buf_size)
+{
+	data->msg_buf[OPTEE_MSG_INDEX] = buf;
+	data->msg_buf_size[OPTEE_MSG_INDEX] = buf_size;
+}
+EXPORT_SYMBOL_GPL(mtk_vcodec_dec_optee_set_msg_info);
+
+void mtk_vcodec_dec_optee_set_data_info(struct mtk_vdec_optee_data_to_shm *data,
+					struct mtk_vcodec_dec_dev *vcodec_dev,
+					int hw_id)
+{
+	data->msg_buf[OPTEE_DATA_INDEX] =
+		mtk_vcodec_dec_get_shm_buffer_va(vcodec_dev, hw_id, OPTEE_DATA_INDEX);
+
+	data->msg_buf_size[OPTEE_DATA_INDEX] =
+		mtk_vcodec_dec_get_shm_buffer_size(vcodec_dev->optee_private,
+						   hw_id, OPTEE_DATA_INDEX);
+}
+EXPORT_SYMBOL_GPL(mtk_vcodec_dec_optee_set_data_info);
+
+int mtk_vcodec_dec_optee_invokd_cmd(struct mtk_vcodec_dec_dev *vcodec_dev,
+				    enum mtk_vdec_hw_id hw_id,
+				    struct mtk_vdec_optee_data_to_shm *data)
+{
+	struct mtk_vdec_optee_private *optee_private = vcodec_dev->optee_private;
+	struct device *dev = &optee_private->vcodec_dev->plat_dev->dev;
+	struct tee_ioctl_invoke_arg trans_args;
+	struct tee_param command_params[MTK_OPTEE_MAX_TEE_PARAMS];
+	struct mtk_vdec_optee_ca_info *ca_info;
+	struct mtk_vdec_optee_shm_memref *shm_memref;
+	int ret, index;
+
+	ca_info = get_ca_info(optee_private, hw_id);
+
+	memset(&trans_args, 0, sizeof(trans_args));
+	memset(command_params, 0, sizeof(command_params));
+
+	trans_args = (struct tee_ioctl_invoke_arg) {
+		.func = ca_info->vdec_session_func,
+		.session = ca_info->vdec_session_id,
+		.num_params = MTK_OPTEE_MAX_TEE_PARAMS,
+	};
+
+	/* Fill msg command parameters */
+	for (index = 0; index < MTK_OPTEE_MAX_TEE_PARAMS; index++) {
+		shm_memref = &ca_info->shm_memref[index];
+
+		if (shm_memref->param_type == TEE_IOCTL_PARAM_ATTR_TYPE_NONE ||
+		    data->msg_buf_size[index] == 0)
+			continue;
+
+		dev_dbg(dev, MTK_DBG_VCODEC_STR "tee share memory data size: %d -> %d.\n",
+			data->msg_buf_size[index], shm_memref->msg_shm_size);
+
+		if (data->msg_buf_size[index] > shm_memref->msg_shm_size) {
+			dev_err(dev, MTK_DBG_VCODEC_STR "tee buf size bigger than shm (%d->%d).\n",
+				data->msg_buf_size[index], shm_memref->msg_shm_size);
+			return -EINVAL;
+		}
+
+		ret = mtk_vcodec_dec_optee_fill_shm(&command_params[index], shm_memref,
+						    data, index, dev);
+		if (ret)
+			return ret;
+	}
+
+	ret = tee_client_invoke_func(optee_private->tee_vdec_ctx, &trans_args, command_params);
+	if (ret < 0 || trans_args.ret != 0) {
+		dev_err(dev, MTK_DBG_VCODEC_STR "tee submit command fail: 0x%x 0x%x.\n",
+			trans_args.ret, ret);
+
+		return (ret < 0) ? ret : trans_args.ret;
+	}
+
+	/* clear all attrs, set all command param to unused */
+	for (index = 0; index < MTK_OPTEE_MAX_TEE_PARAMS; index++) {
+		data->msg_buf[index] = NULL;
+		data->msg_buf_size[index] = 0;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(mtk_vcodec_dec_optee_invokd_cmd);
+
+void *mtk_vcodec_dec_get_shm_buffer_va(struct mtk_vcodec_dec_dev *vcodec_dev,
+				       enum mtk_vdec_hw_id hw_id,
+				       enum mtk_vdec_optee_data_index data_index)
+{
+	struct mtk_vdec_optee_ca_info *ca_info;
+
+	ca_info = get_ca_info(vcodec_dev->optee_private, hw_id);
+
+	return ca_info->shm_memref[data_index].msg_shm_ca_buf;
+}
+EXPORT_SYMBOL_GPL(mtk_vcodec_dec_get_shm_buffer_va);
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_optee.h b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_optee.h
index 271545a864d3..f9c4d0e8b9c7 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_optee.h
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_optee.h
@@ -62,6 +62,16 @@ enum mtk_vdec_optee_data_index {
 	OPTEE_MAX_INDEX,
 };
 
+/**
+ * struct mtk_vdec_optee_data_to_shm - shm data used for TA
+ * @msg_buf:      msg information to TA.
+ * @msg_buf_size: length of msg information.
+ */
+struct mtk_vdec_optee_data_to_shm {
+	void *msg_buf[MTK_OPTEE_MAX_TEE_PARAMS];
+	int msg_buf_size[MTK_OPTEE_MAX_TEE_PARAMS];
+};
+
 /**
  * struct mtk_vdec_optee_private - optee private data
  * @vcodec_dev:     pointer to the mtk_vcodec_dec_dev of the device
@@ -103,6 +113,45 @@ int mtk_vcodec_dec_optee_private_init(struct mtk_vcodec_dec_dev *vcodec_dev);
  */
 void mtk_vcodec_dec_optee_close(struct mtk_vcodec_dec_dev *vcodec_dev);
 
+/**
+ * mtk_vcodec_dec_optee_set_msg_info - set buffer to message shared memref.
+ * @data:     normal world data used to init optee shared memory
+ * @buf:      normal world buffer address
+ * @buf_size: buf size
+ */
+void mtk_vcodec_dec_optee_set_msg_info(struct mtk_vdec_optee_data_to_shm *data,
+				       void *buf, int buf_size);
+
+/**
+ * mtk_vcodec_dec_optee_set_data - set buffer to data shared memref.
+ * @data:       normal world data used to init optee shared memory
+ * @vcodec_dev: pointer to the mtk_vcodec_dec_dev of the device
+ * @hw_id:      hardware index
+ */
+void mtk_vcodec_dec_optee_set_data_info(struct mtk_vdec_optee_data_to_shm *data,
+					struct mtk_vcodec_dec_dev *vcodec_dev,
+					int hw_id);
+
+/**
+ * mtk_vcodec_dec_optee_invokd_cmd - send share memory data to optee.
+ * @vcodec_dev: pointer to the mtk_vcodec_dec_dev of the device
+ * @hw_id:      hardware index
+ * @data:       normal world data used to init optee share memory
+ */
+int mtk_vcodec_dec_optee_invokd_cmd(struct mtk_vcodec_dec_dev *vcodec_dev,
+				    enum mtk_vdec_hw_id hw_id,
+				    struct mtk_vdec_optee_data_to_shm *data);
+
+/**
+ * mtk_vcodec_dec_get_shm_buffer_va - get the shared memory virtual address
+ * @vcodec_dev: pointer to the mtk_vcodec_dec_dev of the device
+ * @hw_id:      hardware index
+ * @data_index: indentify each share memory informaiton
+ */
+void *mtk_vcodec_dec_get_shm_buffer_va(struct mtk_vcodec_dec_dev *vcodec_dev,
+				       enum mtk_vdec_hw_id hw_id,
+				       enum mtk_vdec_optee_data_index data_index);
+
 #else
 
 static inline int mtk_vcodec_dec_optee_open(struct mtk_vcodec_dec_dev *vcodec_dev)
@@ -119,6 +168,31 @@ static inline void mtk_vcodec_dec_optee_close(struct mtk_vcodec_dec_dev *vcodec_
 {
 }
 
+static inline void mtk_vcodec_dec_optee_set_msg_info(struct mtk_vdec_optee_data_to_shm *data,
+						     void *buf, int buf_size)
+{
+}
+
+static inline void mtk_vcodec_dec_optee_set_data_info(struct mtk_vdec_optee_data_to_shm *data,
+						      struct mtk_vcodec_dec_dev *vcodec_dev,
+						      int hw_id)
+{
+}
+
+static inline int mtk_vcodec_dec_optee_invokd_cmd(struct mtk_vcodec_dec_dev *vcodec_dev,
+						  enum mtk_vdec_hw_id hw_id,
+						  struct mtk_vdec_optee_data_to_shm *data)
+{
+	return 0;
+}
+
+static inline void *mtk_vcodec_dec_get_shm_buffer_va(struct mtk_vcodec_dec_dev *vcodec_dev,
+						     enum mtk_vdec_hw_id hw_id,
+						     enum mtk_vdec_optee_data_index data_index)
+{
+	return NULL;
+}
+
 #endif /* CONFIG_VIDEO_MEDIATEK_VCODEC_TEE */
 
 #endif /* _MTK_VCODEC_DEC_OPTEE_H_ */
-- 
2.18.0

