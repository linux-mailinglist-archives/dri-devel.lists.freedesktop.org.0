Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE272812763
	for <lists+dri-devel@lfdr.de>; Thu, 14 Dec 2023 06:59:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 873BA10E8CC;
	Thu, 14 Dec 2023 05:59:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C2E310E8D4
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Dec 2023 05:58:59 +0000 (UTC)
X-UUID: dbacb9709a4511eeba30773df0976c77-20231214
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=aW/XsAA8hGCSog7BqSGudf9VoMOqK1HzMz+l6/m7oNo=; 
 b=nlQ7zJL8wj9ExI+iDWe0o+9iB8oiY6IK3ROadp2BrBNAhTw33CVn+Qv7E1+dmolKaUwDnnJiABLQki+97opgTdB1cRCI2DvNJOchuCOncYdeuTAxGOZngyzMtGYFzF+MvYEVsDT2jNxMsAEXxsbK/yRQfF/wBmOHWCvU8/2YuMo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35, REQID:9f0bebda-7cef-4e25-b369-1c8f493cbfd2, IP:0,
 U
 RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:-5
X-CID-META: VersionHash:5d391d7, CLOUDID:c4fc2e61-c89d-4129-91cb-8ebfae4653fc,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
 NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: dbacb9709a4511eeba30773df0976c77-20231214
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by
 mailgw02.mediatek.com (envelope-from <shawn.sung@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1054811641; Thu, 14 Dec 2023 13:58:52 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 14 Dec 2023 13:58:50 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 14 Dec 2023 13:58:50 +0800
From: Hsiao Chien Sung <shawn.sung@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "CK
 Hu" <ck.hu@mediatek.com>
Subject: [PATCH v12 15/23] drm/mediatek: Start/Stop components with function
 pointers
Date: Thu, 14 Dec 2023 13:58:39 +0800
Message-ID: <20231214055847.4936-16-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231214055847.4936-1-shawn.sung@mediatek.com>
References: <20231214055847.4936-1-shawn.sung@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--1.542100-8.000000
X-TMASE-MatchedRID: aEd/qsqbLK4b7D0aLEL5Ob2xWbKjBfWPkos2tunL8DT/evmlVf9xZkN+
 V6ZFLcNdXQfL6gqs5OQd5e75RGwObaK176S49UNHkDpLRKO9xhSZ2scyRQcer19eTSR8I6dudjd
 NwycGaR/v5TZdm2T2Kr1Odlcux5HWHxPMjOKY7A8LbigRnpKlKZvjAepGmdoOsRunbcic21kj5J
 4TaJJuPa2i+dnS6f5T20mnMsmkbaLJzkAlfa4X5MFCRr0IKekVKIYKIq6+TbixUcgMLkVKCwwI0
 +X/rE7HSZrfNhP3sgUBh9AgBSEFrJm+YJspVvj2xkvrHlT8euJ0YHKn7N1oOA==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--1.542100-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 39A1D386ECE4448F1E4203CDECE5BBB47864444C603CE240FAD4FB491F2338602000:8
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 "Nancy . Lin" <nancy.lin@mediatek.com>, xinlei lee <xinlei.lee@mediatek.com>,
 "Roy-CW .
 Yeh" <roy-cw.yeh@mediatek.com>, Hsiao Chien Sung <shawn.sung@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Nathan Lu <nathan.lu@mediatek.com>,
 "Jason-JH . Lin" <jason-jh.lin@mediatek.com>, linux-kernel@vger.kernel.org,
 Moudy Ho <moudy.ho@mediatek.com>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

By registering component related functions to the pointers,
we can easily manage them within a for-loop and simplify the
logic of component start/stop process.

Reviewed-by: CK Hu <ck.hu@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 .../gpu/drm/mediatek/mtk_disp_ovl_adaptor.c   | 20 +++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
index e00d8a395ca0..65c5153bdcd8 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
@@ -72,6 +72,8 @@ static const char * const private_comp_stem[OVL_ADAPTOR_TYPE_NUM] = {
 static const struct mtk_ddp_comp_funcs ethdr = {
 	.clk_enable = mtk_ethdr_clk_enable,
 	.clk_disable = mtk_ethdr_clk_disable,
+	.start = mtk_ethdr_start,
+	.stop = mtk_ethdr_stop,
 };
 
 static const struct mtk_ddp_comp_funcs merge = {
@@ -191,16 +193,30 @@ void mtk_ovl_adaptor_config(struct device *dev, unsigned int w,
 
 void mtk_ovl_adaptor_start(struct device *dev)
 {
+	int i;
 	struct mtk_disp_ovl_adaptor *ovl_adaptor = dev_get_drvdata(dev);
 
-	mtk_ethdr_start(ovl_adaptor->ovl_adaptor_comp[OVL_ADAPTOR_ETHDR0]);
+	for (i = 0; i < OVL_ADAPTOR_ID_MAX; i++) {
+		if (!ovl_adaptor->ovl_adaptor_comp[i] ||
+		    !comp_matches[i].funcs->start)
+			continue;
+
+		comp_matches[i].funcs->start(ovl_adaptor->ovl_adaptor_comp[i]);
+	}
 }
 
 void mtk_ovl_adaptor_stop(struct device *dev)
 {
+	int i;
 	struct mtk_disp_ovl_adaptor *ovl_adaptor = dev_get_drvdata(dev);
 
-	mtk_ethdr_stop(ovl_adaptor->ovl_adaptor_comp[OVL_ADAPTOR_ETHDR0]);
+	for (i = 0; i < OVL_ADAPTOR_ID_MAX; i++) {
+		if (!ovl_adaptor->ovl_adaptor_comp[i] ||
+		    !comp_matches[i].funcs->stop)
+			continue;
+
+		comp_matches[i].funcs->stop(ovl_adaptor->ovl_adaptor_comp[i]);
+	}
 }
 
 /**
-- 
2.18.0

