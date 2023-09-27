Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2035F7B0904
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 17:39:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6AB410E560;
	Wed, 27 Sep 2023 15:38:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D10310E553
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Sep 2023 15:38:44 +0000 (UTC)
X-UUID: ebc94fbc5d4b11ee8051498923ad61e6-20230927
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=ndL2P4spg7WYQoYbrJ+19eXVIXXOkMNblwil/FuWbaQ=; 
 b=rdd6szu/Zh7U8BFxhevgSPiicJLZS6gyOIX5C2SHStIZqilbjDuiKkp7Ca94+Q3JwLL8BKZEGhOdc1X3ulmcryR8i43cGDw0R5D82wf+LRj7ls3njM8cQ9W78QpaQISGMXmKQRVMyW5TbN04L37x6zk9OZHXTv+cbZt2lDnHLLY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32, REQID:8ff9eb99-4166-4b74-ba18-19eaa83787b0, IP:0,
 U
 RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:-25
X-CID-META: VersionHash:5f78ec9, CLOUDID:f1be57bf-14cc-44ca-b657-2d2783296e72,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
 NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: ebc94fbc5d4b11ee8051498923ad61e6-20230927
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1521760245; Wed, 27 Sep 2023 23:38:35 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 27 Sep 2023 23:38:34 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 27 Sep 2023 23:38:34 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v10 2/9] drm/mediatek: Add crtc path enum for all_drm_priv
 array
Date: Wed, 27 Sep 2023 23:38:26 +0800
Message-ID: <20230927153833.23583-3-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230927153833.23583-1-jason-jh.lin@mediatek.com>
References: <20230927153833.23583-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
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
Cc: "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Jason-ch Chen <jason-ch.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.com>, Shawn Sung <shawn.sung@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add mtk_drm_crtc_path enum for each display path.

Instead of using array index of all_drm_priv in mtk_drm_kms_init(),
mtk_drm_crtc_path enum can make code more readable.

Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
Reviewed-by: Fei Shao <fshao@chromium.org>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
Tested-by: Fei Shao <fshao@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 6 +++---
 drivers/gpu/drm/mediatek/mtk_drm_drv.h | 8 +++++++-
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 2d6a979afe8f..efe36eace8f0 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -469,21 +469,21 @@ static int mtk_drm_kms_init(struct drm_device *drm)
 		for (j = 0; j < private->data->mmsys_dev_num; j++) {
 			priv_n = private->all_drm_private[j];
 
-			if (i == 0 && priv_n->data->main_len) {
+			if (i == CRTC_MAIN && priv_n->data->main_len) {
 				ret = mtk_drm_crtc_create(drm, priv_n->data->main_path,
 							  priv_n->data->main_len, j);
 				if (ret)
 					goto err_component_unbind;
 
 				continue;
-			} else if (i == 1 && priv_n->data->ext_len) {
+			} else if (i == CRTC_EXT && priv_n->data->ext_len) {
 				ret = mtk_drm_crtc_create(drm, priv_n->data->ext_path,
 							  priv_n->data->ext_len, j);
 				if (ret)
 					goto err_component_unbind;
 
 				continue;
-			} else if (i == 2 && priv_n->data->third_len) {
+			} else if (i == CRTC_THIRD && priv_n->data->third_len) {
 				ret = mtk_drm_crtc_create(drm, priv_n->data->third_path,
 							  priv_n->data->third_len, j);
 				if (ret)
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.h b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
index eb2fd45941f0..f4de8bb27685 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
@@ -9,11 +9,17 @@
 #include <linux/io.h>
 #include "mtk_drm_ddp_comp.h"
 
-#define MAX_CRTC	3
 #define MAX_CONNECTOR	2
 #define DDP_COMPONENT_DRM_OVL_ADAPTOR (DDP_COMPONENT_ID_MAX + 1)
 #define DDP_COMPONENT_DRM_ID_MAX (DDP_COMPONENT_DRM_OVL_ADAPTOR + 1)
 
+enum mtk_drm_crtc_path {
+	CRTC_MAIN,
+	CRTC_EXT,
+	CRTC_THIRD,
+	MAX_CRTC,
+};
+
 struct device;
 struct device_node;
 struct drm_crtc;
-- 
2.18.0

