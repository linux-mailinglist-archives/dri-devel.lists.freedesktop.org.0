Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D2F737C85
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 09:54:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D557A10E0A2;
	Wed, 21 Jun 2023 07:54:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 563F010E0A2
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 07:54:32 +0000 (UTC)
X-UUID: d6e6f562100811eeb20a276fd37b9834-20230621
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=J1PGEBaE5jy4F0xsx2ihC7H50qF8Y8OmmG73BXEbN/c=; 
 b=eMmkIabsAv7n7PiACRERSdzQoxL5TtZEny3VYVBUJu28eA7vDPrXPtyVH0CyIfsbMTdSKgkHmSoMq+6c1IJ+ePpR4c3goH+xLRAB10MfhcZVLXq0Ry6IAHFOK17jTe5XTlxXcGfDRsXkRS02L4eHCHjckXsFOPNU2/t5amrt8Oo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.27, REQID:3878b4a9-c4f2-47a0-8322-2f22e58188ad, IP:0,
 U
 RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTI
 ON:release,TS:70
X-CID-INFO: VERSION:1.1.27, REQID:3878b4a9-c4f2-47a0-8322-2f22e58188ad, IP:0,
 URL
 :0,TC:0,Content:-25,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTI
 ON:quarantine,TS:70
X-CID-META: VersionHash:01c9525, CLOUDID:4edd1f3f-de1e-4348-bc35-c96f92f1dcbb,
 B
 ulkID:230621155427VHISTTUQ,BulkQuantity:0,Recheck:0,SF:28|17|19|48|38|29,T
 C:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
 ,OSI:0,OSA:0,AV:0,LES:1,SPR:NO
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_ULS, TF_CID_SPAM_SNR, TF_CID_SPAM_SDM,
 TF_CID_SPAM_ASC, TF_CID_SPAM_FAS,TF_CID_SPAM_FSD
X-UUID: d6e6f562100811eeb20a276fd37b9834-20230621
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1911199820; Wed, 21 Jun 2023 15:54:24 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 21 Jun 2023 15:54:23 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 21 Jun 2023 15:54:23 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2] drm/mediatek: Fix void-pointer-to-enum-cast warning
Date: Wed, 21 Jun 2023 15:54:21 +0800
Message-ID: <20230621075421.1982-1-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
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
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

1. Fix build warning message in mtk_disp_ovl_adaptor.c
>> drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c:415:10:
  warning: cast to smaller integer type 'enum mtk_ovl_adaptor_comp_type'
  from 'const void *' [-Wvoid-pointer-to-enum-cast]

  type = (enum mtk_ovl_adaptor_comp_type)of_id->data;

         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         1 warning generated.

2. Also fix the same warning message in mtk_drm_drv.c
>> drivers/gpu/drm/mediatek/mtk_drm_drv.c:832:15:
   warning: cast to smaller integer type 'enum mtk_ddp_comp_type'
   from 'const void *' [-Wvoid-pointer-to-enum-cast]

   comp_type = (enum mtk_ddp_comp_type)of_id->data;

               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
               1 warning generated.

Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
Fixes: 453c3364632a ("drm/mediatek: Add ovl_adaptor support for MT8195")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202305042054.ZtWME9OU-lkp@intel.com/
---
V1 -> V2: Add casting to (uintprt_t) before casting from (void *) to (enum).
---
 drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c | 2 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c          | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
index c0a38f5217ee..f2f6a5c01a6d 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
@@ -426,7 +426,7 @@ static int ovl_adaptor_comp_init(struct device *dev, struct component_match **ma
 			continue;
 		}
 
-		type = (enum mtk_ovl_adaptor_comp_type)of_id->data;
+		type = (enum mtk_ovl_adaptor_comp_type)(uintptr_t)of_id->data;
 		id = ovl_adaptor_comp_get_id(dev, node, type);
 		if (id < 0) {
 			dev_warn(dev, "Skipping unknown component %pOF\n",
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 6dcb4ba2466c..80d3bcd315a9 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -829,7 +829,7 @@ static int mtk_drm_probe(struct platform_device *pdev)
 			continue;
 		}
 
-		comp_type = (enum mtk_ddp_comp_type)of_id->data;
+		comp_type = (enum mtk_ddp_comp_type)(uintptr_t)of_id->data;
 
 		if (comp_type == MTK_DISP_MUTEX) {
 			int id;
-- 
2.18.0

