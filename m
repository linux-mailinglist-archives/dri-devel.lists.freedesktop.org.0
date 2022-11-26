Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1AE4639537
	for <lists+dri-devel@lfdr.de>; Sat, 26 Nov 2022 11:12:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9795E10E125;
	Sat, 26 Nov 2022 10:12:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99B9510E02D
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Nov 2022 10:12:30 +0000 (UTC)
X-UUID: 7f8deccba73c4bcf90e3765705210d7c-20221126
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=uNBsJwFEvQ+Cp5uxrStONbIgDtgiR48WfYkGIYIjSkk=; 
 b=Kag0XqRMsjnOrzLuZ3U/tEEArqm5bUMvgZQVaBZhg13gJXBvoOX3BcPTKcj6HdNtZfQNTukTaIue/rj2nF6KFO32LsIIjbsr70KfovqdpIu5JetkhiTyqbnM9J6Hhm16byQd9H1t2RaFfuxqhBNpZgbxDysVKi7cXxHsZkb+DeM=;
X-CID-UNFAMILIAR: 1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14, REQID:31eaf1db-9311-490b-83b0-e51dd67258a2, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:100
X-CID-INFO: VERSION:1.1.14, REQID:31eaf1db-9311-490b-83b0-e51dd67258a2, IP:0,
 URL
 :0,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTIO
 N:quarantine,TS:100
X-CID-META: VersionHash:dcaaed0, CLOUDID:a21be22f-2938-482e-aafd-98d66723b8a9,
 B
 ulkID:221126181223JMQLPHQY,BulkQuantity:0,Recheck:0,SF:38|28|16|19|48,TC:n
 il,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 7f8deccba73c4bcf90e3765705210d7c-20221126
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1358361551; Sat, 26 Nov 2022 18:12:23 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Sat, 26 Nov 2022 18:12:21 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Sat, 26 Nov 2022 18:12:21 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v6 0/4] Change mmsys compatible for mt8195 mediatek-drm
Date: Sat, 26 Nov 2022 18:12:17 +0800
Message-ID: <20221126101220.18179-1-jason-jh.lin@mediatek.com>
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
Cc: Nathan Lu <nathan.lu@mediatek.com>,
 "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Nancy Lin <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org,
 Rex-BC Chen <rex-bc.chen@mediatek.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For previous MediaTek SoCs, such as MT8173, there are 2 display HW
pipelines binding to 1 mmsys with the same power domain, the same
clock driver and the same mediatek-drm driver.

For MT8195, VDOSYS0 and VDOSYS1 are 2 display HW pipelines binding to
2 different power domains, different clock drivers and different
mediatek-drm drivers.

Moreover, Hardware pipeline of VDOSYS0 has these components: COLOR,
CCORR, AAL, GAMMA, DITHER. They are related to the PQ (Picture Quality)
and they makes VDOSYS0 supports PQ function while they are not
including in VDOSYS1.

Hardware pipeline of VDOSYS1 has the component ETHDR (HDR related
component). It makes VDOSYS1 supports the HDR function while it's not
including in VDOSYS0.

To summarize0:
Only VDOSYS0 can support PQ adjustment.
Only VDOSYS1 can support HDR adjustment.

Therefore, we need to separate these two different mmsys hardwares to
2 different compatibles for MT8195.
---
Change in v6:
1. Add old driver data for mediatek-drm driver with deprecated compatible name.

Change in v5:
1. Add oneOf item to deprecate mediatek,mt8195-mmsys.

Change in v4:
1. Deprecate original mediatek,mt8195-mmsys at the first item.

Change in v3:
1. Keep the original compatible "mediatek,mt8195-mmsys" and add
   "mediatek,mt8195-vdosys0" into the same item to make the tree
   fallback compatible.

Change in v2:
1. Remove Ack tag in the first patch
2. Change the compatible name changing patch to one revert patch and
   one add vdosys0 support patch.
---
Jason-JH.Lin (3):
  Revert "drm/mediatek: Add mediatek-drm of vdosys0 support for mt8195"
  drm/mediatek: add mediatek-drm of vdosys0 support for mt8195
  soc: mediatek: remove DDP_DOMPONENT_DITHER from enum

 drivers/gpu/drm/mediatek/mtk_disp_rdma.c |   6 ++
 drivers/gpu/drm/mediatek/mtk_drm_drv.c   | 128 +++--------------------
 drivers/gpu/drm/mediatek/mtk_drm_drv.h   |   6 --
 include/linux/soc/mediatek/mtk-mmsys.h   |   3 +-
 4 files changed, 21 insertions(+), 122 deletions(-)

-- 
2.18.0

