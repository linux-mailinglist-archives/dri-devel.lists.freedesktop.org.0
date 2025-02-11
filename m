Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC74A304F5
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2025 08:56:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEB0B10E424;
	Tue, 11 Feb 2025 07:56:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="ckVtcGyy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0954810E1FF
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 02:53:27 +0000 (UTC)
X-UUID: 5bf29f4ce82311efb8f9918b5fc74e19-20250211
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=keKohg8hOTFLfdJBLpLuY7turgd/R5WQW4fSD4VLxnc=; 
 b=ckVtcGyyfuGvs8EvIuNFqLOdKfoH4F9ewySkQK9dei/0FiDISPWoK5fbfRGU3uR+o1NktwiIN/fb6t3FkES6ROpYpx3UmH0nfctnSX5y/u4zdAJ0U/wTZjGKHs9CHVr1fGun3BLMNrI3cZBdUBbiFNeYWg1BpsCx1hJFLRkNTnE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46, REQID:35cb6343-fc81-4559-a73a-ae1d5c12c3d0, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:60aa074, CLOUDID:06d76b92-d651-4ec6-81e1-a3deb10c9ff8,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
 l,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
 :1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 5bf29f4ce82311efb8f9918b5fc74e19-20250211
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by
 mailgw01.mediatek.com (envelope-from <sunny.shen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 921413999; Tue, 11 Feb 2025 10:53:23 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Tue, 11 Feb 2025 10:53:22 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Tue, 11 Feb 2025 10:53:22 +0800
From: Sunny Shen <sunny.shen@mediatek.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Fei Shao <fshao@chromium.org>, Pin-yen Lin
 <treapking@chromium.org>, "Jason-JH . Lin" <jason-jh.lin@mediatek.com>, Nancy
 Lin <nancy.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, "Paul
 Chen --cc=devicetree @ vger . kernel . org" <paul-pl.chen@mediatek.com>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Sunny Shen
 <sunny.shen@mediatek.com>
Subject: [PATCH 0/5] Add components to support PQ in display path for MT8196
Date: Tue, 11 Feb 2025 10:52:49 +0800
Message-ID: <20250211025317.399534-1-sunny.shen@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Mailman-Approved-At: Tue, 11 Feb 2025 07:56:48 +0000
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

Due to the path mux design of the MT8196, the following components need to be configured to support Picture Quality (PQ) in the display path:CCORR0, CCORR1, DITHER0, GAMMA0, MDP_RSZ0, POSTMASK0, TDSHP0.

This patch series is based on [1]
[1] Add Mediatek Soc DRM Soc support for mt8196
    - https://patchwork.kernel.org/project/linux-mediatek/list/?series=924191

Sunny Shen (5):
  dt-bindings: display: mediatek: mdp-rsz: Add rules for MT8196
  dt-bindings: display: mediatek: postmask: Modify rules for MT8196
  soc: mediatek: Add components to support PQ in display path for MT8196
  drm/mediatek: Add MDP-RSZ component support for MT8196
  drm/mediatek: Change main display path to support PQ for MT8196

 .../display/mediatek/mediatek,mdp-rsz.yaml    | 46 ++++++++++++
 .../display/mediatek/mediatek,postmask.yaml   |  1 +
 drivers/gpu/drm/mediatek/mtk_ddp_comp.c       | 24 +++++++
 drivers/gpu/drm/mediatek/mtk_ddp_comp.h       |  1 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        |  9 +++
 drivers/soc/mediatek/mt8196-mmsys.h           | 70 ++++++++++++++++++-
 drivers/soc/mediatek/mtk-mutex.c              | 17 +++++
 include/linux/soc/mediatek/mtk-mmsys.h        |  5 ++
 8 files changed, 171 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,mdp-rsz.yaml

-- 
2.34.1

