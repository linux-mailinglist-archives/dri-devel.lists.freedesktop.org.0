Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4943159BA09
	for <lists+dri-devel@lfdr.de>; Mon, 22 Aug 2022 09:10:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F7E59A7EA;
	Mon, 22 Aug 2022 07:10:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F12697AAE
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Aug 2022 03:33:09 +0000 (UTC)
X-UUID: 755b6d8862234ea296a6f238b2078cae-20220822
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=ZsbrfzKybYvRW5/qPp7y/GTzqWVq4D79s4UeFpi3Wl4=; 
 b=pflBzB9jGL7fzAAGjsV24ayHeYlrFzicSUPINfeCdcUfQPg4GEkr9Ij7FebzD39DKB08/EAmS0Mj++M9lKZQgiAkSaOtNHqcR/m8zf8ouEAdXN5ZBuQ1lCp5zj506wUXjxUK/RH5pe1NnSY9Zl7/Z5wqDLAXhavyiiDroMOktsg=;
X-CID-UNFAMILIAR: 1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10, REQID:3cec78d1-0a61-425d-8239-474b4d84d6f3, OB:0,
 L
 OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Releas
 e_Ham,ACTION:release,TS:100
X-CID-INFO: VERSION:1.1.10, REQID:3cec78d1-0a61-425d-8239-474b4d84d6f3, OB:0,
 LOB
 :0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Spam_GS9
 81B3D,ACTION:quarantine,TS:100
X-CID-META: VersionHash:84eae18, CLOUDID:3a59e067-a9d9-4672-a3c8-12721739a220,
 C
 OID:8c99063cfa61,Recheck:0,SF:28|16|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 755b6d8862234ea296a6f238b2078cae-20220822
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
 (envelope-from <nathan.lu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 330921496; Mon, 22 Aug 2022 11:32:51 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 22 Aug 2022 11:32:50 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Mon, 22 Aug 2022 11:32:50 +0800
From: nathan.lu <nathan.lu@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Matthias Brugger
 <matthias.bgg@gmail.com>
Subject: [PATCH v1 0/4] Add first version mt8188 vdosys0 driver
Date: Mon, 22 Aug 2022 11:32:09 +0800
Message-ID: <20220822033213.15769-1-nathan.lu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-Mailman-Approved-At: Mon, 22 Aug 2022 07:10:42 +0000
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
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 wsd_upstream@mediatek.com, srv_heupstream@mediatek.com,
 devicetree@vger.kernel.org, "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Rex-BC
 Chen <rex-bc.chen@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>,
 linux-mediatek@lists.infradead.org, lancelot.wu@mediatek.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Nathan Lu <nathan.lu@mediatek.com>

This path is based on [1] and [2]
[1] Add MediaTek SoC(vdosys1) support for mt8195
    - https://patchwork.kernel.org/project/linux-mediatek/list/?series=658416
[2] Add MediaTek SoC DRM (vdosys1) support for mt8195
    - https://patchwork.kernel.org/project/linux-mediatek/list/?series=665269

This patch is to add first version mt8188 vdosys0 driver
Modify and add new files include:
1. bindings documents
2. mtk mmsys
3. mtk mutex
4. mtk drm driver

Nathan Lu (4):
  dt-bindings: mediatek: modify VDOSYS0 device tree Documentations for
    MT8188
  soc: mediatek: add mtk-mmsys support for mt8188 vdosys0
  soc: mediatek: add mtk-mutex support for mt8188 vdosys0
  drm/mediatek: add mediatek-drm of vdosys0 support for mt8188

 .../bindings/arm/mediatek/mediatek,mmsys.yaml |   1 +
 .../display/mediatek/mediatek,aal.yaml        |   1 +
 .../display/mediatek/mediatek,ccorr.yaml      |   1 +
 .../display/mediatek/mediatek,color.yaml      |   1 +
 .../display/mediatek/mediatek,dither.yaml     |   1 +
 .../display/mediatek/mediatek,gamma.yaml      |   3 +-
 .../display/mediatek/mediatek,ovl.yaml        |   1 +
 .../display/mediatek/mediatek,postmask.yaml   |   1 +
 .../display/mediatek/mediatek,rdma.yaml       |   2 +
 .../bindings/soc/mediatek/mediatek,mutex.yaml |   1 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        |  30 ++++
 drivers/soc/mediatek/mt8188-mmsys.h           | 149 ++++++++++++++++++
 drivers/soc/mediatek/mtk-mmsys.c              |  19 +++
 drivers/soc/mediatek/mtk-mutex.c              |  51 ++++++
 14 files changed, 261 insertions(+), 1 deletion(-)
 create mode 100644 drivers/soc/mediatek/mt8188-mmsys.h

-- 
2.18.0

