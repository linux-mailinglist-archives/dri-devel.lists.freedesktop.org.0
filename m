Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD5D8A2A73
	for <lists+dri-devel@lfdr.de>; Fri, 12 Apr 2024 11:09:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C17E10F514;
	Fri, 12 Apr 2024 09:09:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="Q6VegYSP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BC1610F50F
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Apr 2024 09:09:17 +0000 (UTC)
X-UUID: 53a1db08f8ac11eeb8927bc1f75efef4-20240412
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Qsu2a6pWuI9r9UzNG4biPlS5wzwndp0NR6vZ8LjQ+Ww=; 
 b=Q6VegYSPwaJS7M0rvVbloTBx8+lhxdp0Y/SFCRxhzrQP9Vam0hGbp24kmqU9TUlvrpZf3ajaH7xsUF/KgsVCSasvNEfVPIPAn1nHH7xMnNGxAxmX+3GsTJA/asE43LeKYBk+6FPxU0u+U19ohtMal8NVVb2ZQvD4UZpv9Uhburo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37, REQID:8d46acbc-c3c8-43c4-b74c-9941eb6e2069, IP:0,
 U
 RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:-5
X-CID-META: VersionHash:6f543d0, CLOUDID:b5e4d5fa-ed05-4274-9204-014369d201e8,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 53a1db08f8ac11eeb8927bc1f75efef4-20240412
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by
 mailgw01.mediatek.com (envelope-from <yunfei.dong@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1419512488; Fri, 12 Apr 2024 17:09:11 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 12 Apr 2024 17:09:09 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 12 Apr 2024 17:09:08 +0800
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
Subject: [PATCH v5,
 10/23] media: mediatek: vcodec: send share memory data to optee
Date: Fri, 12 Apr 2024 17:08:38 +0800
Message-ID: <20240412090851.24999-11-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240412090851.24999-1-yunfei.dong@mediatek.com>
References: <20240412090851.24999-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--11.706700-8.000000
X-TMASE-MatchedRID: AyztauQSwYCQG6Uyrf0PKFVN8laWo90MTJDl9FKHbrk1LB46LFAAkotf
 Mtu9FfbrPcGjGTU7TnemGallF1XuaEDn8NFEhJAcFYJUGv4DL3yH7D1bP/FcOhL6MU7t349b3vY
 rsfFYjWsgY9Nu1Ql6APqPSFsdX1B029aHfVG01jzJ1E39jKDimGaq8BZOZSelzrexXSWzstSgzz
 s1FNpEXGOFciOhsJ4zgDLqnrRlXrZ8nn9tnqel2DsAVzN+Ov/sUxeZzrp4VFNLDXTQO5fDMw8XB
 qf0pq8h28s3Rxggvn20AWWhtDiZ1w==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--11.706700-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 981A53180650D3E51D631B0793FD81A9CE70963FF31A3F746D7A9DCE560DA8D62000:8
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
 .../vcodec/decoder/mtk_vcodec_dec_optee.c     | 140 ++++++++++++++++++
 .../vcodec/decoder/mtk_vcodec_dec_optee.h     |  51 +++++++
 2 files changed, 191 insertions(+)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_optee.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_optee.c
index 611fb0e56480..f29a8d143fee 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_optee.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_optee.c
@@ -241,3 +241,143 @@ void mtk_vcodec_dec_optee_release(struct mtk_vdec_optee_private *optee_private)
 	mutex_unlock(&optee_private->tee_mutex);
 }
 EXPORT_SYMBOL_GPL(mtk_vcodec_dec_optee_release);
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
+void mtk_vcodec_dec_optee_set_data(struct mtk_vdec_optee_data_to_shm *data,
+				   void *buf, int buf_size,
+				   enum mtk_vdec_optee_data_index index)
+{
+	data->msg_buf[index] = buf;
+	data->msg_buf_size[index] = buf_size;
+}
+EXPORT_SYMBOL_GPL(mtk_vcodec_dec_optee_set_data);
+
+int mtk_vcodec_dec_optee_invokd_cmd(struct mtk_vdec_optee_private *optee_private,
+				    enum mtk_vdec_hw_id hw_id,
+				    struct mtk_vdec_optee_data_to_shm *data)
+{
+	struct device *dev = &optee_private->vcodec_dev->plat_dev->dev;
+	struct tee_ioctl_invoke_arg trans_args;
+	struct tee_param command_params[MTK_OPTEE_MAX_TEE_PARAMS];
+	struct mtk_vdec_optee_ca_info *ca_info;
+	struct mtk_vdec_optee_shm_memref *shm_memref;
+	int ret, index;
+
+	if (hw_id == MTK_VDEC_LAT0)
+		ca_info = &optee_private->lat_ca;
+	else
+		ca_info = &optee_private->core_ca;
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
+			dev_err(dev, MTK_DBG_VCODEC_STR "tee buf size big than shm (%d -> %d).\n",
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
+void *mtk_vcodec_dec_get_shm_buffer_va(struct mtk_vdec_optee_private *optee_private,
+				       enum mtk_vdec_hw_id hw_id,
+				       enum mtk_vdec_optee_data_index data_index)
+{
+	struct mtk_vdec_optee_ca_info *ca_info;
+
+	if (hw_id == MTK_VDEC_LAT0)
+		ca_info = &optee_private->lat_ca;
+	else
+		ca_info = &optee_private->core_ca;
+
+	return ca_info->shm_memref[data_index].msg_shm_ca_buf;
+}
+EXPORT_SYMBOL_GPL(mtk_vcodec_dec_get_shm_buffer_va);
+
+int mtk_vcodec_dec_get_shm_buffer_size(struct mtk_vdec_optee_private *optee_private,
+				       enum mtk_vdec_hw_id hw_id,
+				       enum mtk_vdec_optee_data_index data_index)
+{
+	struct mtk_vdec_optee_ca_info *ca_info;
+
+	if (hw_id == MTK_VDEC_LAT0)
+		ca_info = &optee_private->lat_ca;
+	else
+		ca_info = &optee_private->core_ca;
+
+	return ca_info->shm_memref[data_index].msg_shm_size;
+}
+EXPORT_SYMBOL_GPL(mtk_vcodec_dec_get_shm_buffer_size);
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_optee.h b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_optee.h
index 24aa63af9887..c24a567ec877 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_optee.h
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_optee.h
@@ -62,6 +62,16 @@ enum mtk_vdec_optee_data_index {
 	OPTEE_MAX_INDEX,
 };
 
+/**
+ * struct mtk_vdec_optee_data_to_shm - shm data used for TA
+ * @msg_buf:     msg information to TA.
+ * @msg_buf_len: length of msg information.
+ */
+struct mtk_vdec_optee_data_to_shm {
+	void *msg_buf[MTK_OPTEE_MAX_TEE_PARAMS];
+	int msg_buf_size[MTK_OPTEE_MAX_TEE_PARAMS];
+};
+
 /**
  * struct mtk_vdec_optee_private - optee private data
  * @vcodec_dev:     pointer to the mtk_vcodec_dev of the device
@@ -102,4 +112,45 @@ int mtk_vcodec_dec_optee_private_init(struct mtk_vcodec_dec_dev *vcodec_dev);
  */
 void mtk_vcodec_dec_optee_release(struct mtk_vdec_optee_private *optee_private);
 
+/**
+ * mtk_vcodec_dec_optee_set_data - set buffer to share memref.
+ * @vcodec_dev: normal world data used to init optee share memory
+ * @buf: normal world buffer address
+ * @buf_size: buf size
+ * @data_index: indentify each share memory informaiton
+ */
+void mtk_vcodec_dec_optee_set_data(struct mtk_vdec_optee_data_to_shm *data,
+				   void *buf, int buf_size,
+				   enum mtk_vdec_optee_data_index data_index);
+
+/**
+ * mtk_vcodec_dec_optee_invokd_cmd - send share memory data to optee .
+ * @optee_private: optee private context
+ * @hw_id: hardware index
+ * @data: normal world data used to init optee share memory
+ */
+int mtk_vcodec_dec_optee_invokd_cmd(struct mtk_vdec_optee_private *optee_private,
+				    enum mtk_vdec_hw_id hw_id,
+				    struct mtk_vdec_optee_data_to_shm *data);
+
+/**
+ * mtk_vcodec_dec_get_shm_buffer_va - close the communication channels with TA.
+ * @optee_private: optee private context
+ * @hw_id:         hardware index
+ * @@data_index: indentify each share memory informaiton
+ */
+void *mtk_vcodec_dec_get_shm_buffer_va(struct mtk_vdec_optee_private *optee_private,
+				       enum mtk_vdec_hw_id hw_id,
+				       enum mtk_vdec_optee_data_index data_index);
+
+/**
+ * mtk_vcodec_dec_get_shm_buffer_size - close the communication channels with TA.
+ * @optee_private: optee private context
+ * @hw_id:         hardware index
+ * @@data_index: indentify each share memory informaiton
+ */
+int mtk_vcodec_dec_get_shm_buffer_size(struct mtk_vdec_optee_private *optee_private,
+				       enum mtk_vdec_hw_id hw_id,
+				       enum mtk_vdec_optee_data_index data_index);
+
 #endif /* _MTK_VCODEC_FW_OPTEE_H_ */
-- 
2.18.0

