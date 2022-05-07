Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC4051E33D
	for <lists+dri-devel@lfdr.de>; Sat,  7 May 2022 03:46:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C37BF10F2F7;
	Sat,  7 May 2022 01:46:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AB7B10F4E0
 for <dri-devel@lists.freedesktop.org>; Sat,  7 May 2022 01:46:32 +0000 (UTC)
X-UUID: f6e1ffa707ac43ccb240e2a300e3f820-20220507
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:fb276cfc-b7ee-4fa0-988d-8ab128d154e0, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:-20,EDM:0,RT:0,SF:-3,FILE:0,RULE:Release_Ham,A
 CTION:release,TS:-23
X-CID-INFO: VERSION:1.1.4, REQID:fb276cfc-b7ee-4fa0-988d-8ab128d154e0, OB:0,
 LOB:
 0,IP:0,URL:0,TC:0,Content:-20,EDM:0,RT:0,SF:-3,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:-23
X-CID-META: VersionHash:faefae9, CLOUDID:12dee4b2-56b5-4c9e-8d83-0070b288eb6a,
 C
 OID:IGNORED,Recheck:0,SF:28|100|17|19|48|101|20,TC:nil,Content:0,EDM:-3,Fi
 le:nil,QS:0,BEC:nil
X-UUID: f6e1ffa707ac43ccb240e2a300e3f820-20220507
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw01.mediatek.com
 (envelope-from <yunfei.dong@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 70366744; Sat, 07 May 2022 09:46:25 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Sat, 7 May 2022 09:46:24 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Sat, 7 May 2022 09:46:22 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>, Alexandre Courbot
 <acourbot@chromium.org>, Nicolas Dufresne <nicolas@ndufresne.ca>, "Hans
 Verkuil" <hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>
Subject: [PATCH v5,
 2/7] media: mediatek: vcodec: Add to support lat soc hardware
Date: Sat, 7 May 2022 09:46:13 +0800
Message-ID: <20220507014618.29412-3-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220507014618.29412-1-yunfei.dong@mediatek.com>
References: <20220507014618.29412-1-yunfei.dong@mediatek.com>
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
Cc: Irui Wang <irui.wang@mediatek.com>, George Sun <george.sun@mediatek.com>,
 Steve Cho <stevecho@chromium.org>, devicetree@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>,
 Xiaoyong Lu <xiaoyong.lu@mediatek.com>, linux-mediatek@lists.infradead.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add lat soc compatible and to support lat soc power/clk helper.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../platform/mediatek/vcodec/mtk_vcodec_dec_hw.c | 12 +++++++++---
 .../platform/mediatek/vcodec/mtk_vcodec_dec_hw.h |  2 ++
 .../platform/mediatek/vcodec/mtk_vcodec_dec_pm.c | 16 ++++++++++++++++
 .../platform/mediatek/vcodec/mtk_vcodec_drv.h    |  1 +
 4 files changed, 28 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_hw.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_hw.c
index 14bed2bd4283..376db0e433d7 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_hw.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_hw.c
@@ -28,6 +28,10 @@ static const struct of_device_id mtk_vdec_hw_match[] = {
 		.compatible = "mediatek,mtk-vcodec-core",
 		.data = (void *)MTK_VDEC_CORE,
 	},
+	{
+		.compatible = "mediatek,mtk-vcodec-lat-soc",
+		.data = (void *)MTK_VDEC_LAT_SOC,
+	},
 	{},
 };
 MODULE_DEVICE_TABLE(of, mtk_vdec_hw_match);
@@ -166,9 +170,11 @@ static int mtk_vdec_hw_probe(struct platform_device *pdev)
 	subdev_dev->reg_base[VDEC_HW_SYS] = main_dev->reg_base[VDEC_HW_SYS];
 	set_bit(subdev_dev->hw_idx, main_dev->subdev_bitmap);
 
-	ret = mtk_vdec_hw_init_irq(subdev_dev);
-	if (ret)
-		goto err;
+	if (IS_SUPPORT_VDEC_HW_IRQ(hw_idx)) {
+		ret = mtk_vdec_hw_init_irq(subdev_dev);
+		if (ret)
+			goto err;
+	}
 
 	subdev_dev->reg_base[VDEC_HW_MISC] =
 		devm_platform_ioremap_resource(pdev, 0);
diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_hw.h b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_hw.h
index a63e4b1b81c3..b8938c6c3e72 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_hw.h
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_hw.h
@@ -17,6 +17,8 @@
 #define VDEC_IRQ_CLR 0x10
 #define VDEC_IRQ_CFG_REG 0xa4
 
+#define IS_SUPPORT_VDEC_HW_IRQ(hw_idx) (hw_idx != MTK_VDEC_LAT_SOC)
+
 /**
  * enum mtk_vdec_hw_reg_idx - subdev hardware register base index
  * @VDEC_HW_SYS : vdec soc register index
diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_pm.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_pm.c
index 0fb7e5ba635b..d69faa463d04 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_pm.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_pm.c
@@ -174,6 +174,14 @@ static void mtk_vcodec_dec_child_dev_on(struct mtk_vcodec_dev *vdec_dev,
 		mtk_vcodec_dec_pw_on(pm);
 		mtk_vcodec_dec_clock_on(pm);
 	}
+
+	if (hw_idx == MTK_VDEC_LAT0) {
+		pm = mtk_vcodec_dec_get_pm(vdec_dev, MTK_VDEC_LAT_SOC);
+		if (pm) {
+			mtk_vcodec_dec_pw_on(pm);
+			mtk_vcodec_dec_clock_on(pm);
+		}
+	}
 }
 
 static void mtk_vcodec_dec_child_dev_off(struct mtk_vcodec_dev *vdec_dev,
@@ -186,6 +194,14 @@ static void mtk_vcodec_dec_child_dev_off(struct mtk_vcodec_dev *vdec_dev,
 		mtk_vcodec_dec_clock_off(pm);
 		mtk_vcodec_dec_pw_off(pm);
 	}
+
+	if (hw_idx == MTK_VDEC_LAT0) {
+		pm = mtk_vcodec_dec_get_pm(vdec_dev, MTK_VDEC_LAT_SOC);
+		if (pm) {
+			mtk_vcodec_dec_clock_off(pm);
+			mtk_vcodec_dec_pw_off(pm);
+		}
+	}
 }
 
 void mtk_vcodec_dec_enable_hardware(struct mtk_vcodec_ctx *ctx, int hw_idx)
diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_drv.h
index a29041a0b7e0..0e3db8ccb398 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_drv.h
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_drv.h
@@ -104,6 +104,7 @@ enum mtk_vdec_hw_id {
 	MTK_VDEC_CORE,
 	MTK_VDEC_LAT0,
 	MTK_VDEC_LAT1,
+	MTK_VDEC_LAT_SOC,
 	MTK_VDEC_HW_MAX,
 };
 
-- 
2.18.0

