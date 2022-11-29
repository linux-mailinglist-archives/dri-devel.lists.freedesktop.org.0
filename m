Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4BB63C2B0
	for <lists+dri-devel@lfdr.de>; Tue, 29 Nov 2022 15:35:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9425A10E0AD;
	Tue, 29 Nov 2022 14:35:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC4A610E01F
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 14:35:14 +0000 (UTC)
X-UUID: 3619c803a0a34d3298c5899696548cac-20221129
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=zfY50VX4M6sNW4B5w4SSNiRWrhUnaRgHjLJgNB/qNrI=; 
 b=qxuoEetdv5XKvhtRMRs97i229N+OOf/xCFJiGwuNp/DwLlVsnEKO0GKEnnLWZZhx3lfojo9Q5KVonFiTAV9PNzeJVMGu0+8PGsjOdcaCGWh2hw0lLIAuHTlqPpmL6pel4tbTRXRaMjI2RUdMeRUe/rmuDqdpCY+5Wvb4GW7FrG0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14, REQID:e1e675d7-9f9f-4b2e-b2c4-adb504d46f03, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:dcaaed0, CLOUDID:21f18e17-81a9-4b5f-95c6-b6b92590fd73,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 3619c803a0a34d3298c5899696548cac-20221129
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw01.mediatek.com (envelope-from <nathan.lu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1956292492; Tue, 29 Nov 2022 22:35:09 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Tue, 29 Nov 2022 22:35:07 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 29 Nov 2022 22:35:07 +0800
From: nathan.lu <nathan.lu@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Matthias Brugger
 <matthias.bgg@gmail.com>
Subject: [PATCH v3 0/6] Add first version mt8188 vdosys0 driver
Date: Tue, 29 Nov 2022 22:34:57 +0800
Message-ID: <20221129143503.16638-1-nathan.lu@mediatek.com>
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
Cc: Nathan Lu <nathan.lu@mediatek.com>, devicetree@vger.kernel.org,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, Rex-BC
 Chen <rex-bc.chen@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>,
 linux-mediatek@lists.infradead.org, lancelot.wu@mediatek.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Nathan Lu <nathan.lu@mediatek.com>

This patch is to add first version mt8188 vdosys0 driver
Modify and add new files include:
1. bindings documents
2. mtk mmsys
3. mtk mutex
4. mtk drm driver

Change in V3:
- based on [1]
[1] Change mmsys compatible for mt8195 mediatek-drm
    - https://patchwork.kernel.org/project/linux-mediatek/list/?series=699386
- Modify mediatek,mmsys.yaml mt8188-mmsys name to mt8188-vdosys0
- Modify mtk-mmsys.c compatible name to mt8188-vdosys0
- Add DSI mutex in mtk-mutex.c
- Modify mtk_drm_drv.c mt8188-mmsysy name to mt8188-vdosys0


Change in V2:
- based on [2] and [3]
[2] Add MediaTek SoC(vdosys1) support for mt8195
    - https://patchwork.kernel.org/project/linux-mediatek/list/?series=658416
[3] Add MediaTek SoC DRM (vdosys1) support for mt8195
    - https://patchwork.kernel.org/project/linux-mediatek/list/?series=665269
- Seperate bindings doucment into mmsys/mutex/display 3 parts
- Remove redundent char in mediatek,gamma.yaml
- Add another mediatek,mt8188-disp-rdma in mediatek,rdma.yaml
- Remove io_start variable setting in mtk_drm_drv.c and mtk_mmsys.c

Nathan Lu (6):
  dt-bindings: mediatek: modify VDOSYS0 display device tree
    Documentations for MT8188
  dt-bindings: mediatek: modify VDOSYS0 mmsys device tree Documentations
    for MT8188
  dt-bindings: mediatek: modify VDOSYS0 mutex device tree Documentations
    for MT8188
  soc: mediatek: add mtk-mmsys support for mt8188 vdosys0
  soc: mediatek: add mtk-mutex support for mt8188 vdosys0
  drm/mediatek: add mediatek-drm of vdosys0 support for mt8188

 .../bindings/arm/mediatek/mediatek,mmsys.yaml |   4 +
 .../display/mediatek/mediatek,aal.yaml        |   1 +
 .../display/mediatek/mediatek,ccorr.yaml      |   1 +
 .../display/mediatek/mediatek,color.yaml      |   1 +
 .../display/mediatek/mediatek,dither.yaml     |   1 +
 .../display/mediatek/mediatek,gamma.yaml      |   1 +
 .../display/mediatek/mediatek,ovl.yaml        |   1 +
 .../display/mediatek/mediatek,postmask.yaml   |   1 +
 .../display/mediatek/mediatek,rdma.yaml       |   4 +
 .../bindings/soc/mediatek/mediatek,mutex.yaml |   1 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        |  21 +++
 drivers/soc/mediatek/mt8188-mmsys.h           | 149 ++++++++++++++++++
 drivers/soc/mediatek/mtk-mmsys.c              |  11 ++
 drivers/soc/mediatek/mtk-mutex.c              |  53 +++++++
 14 files changed, 250 insertions(+)
 create mode 100644 drivers/soc/mediatek/mt8188-mmsys.h

-- 
2.18.0

