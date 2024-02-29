Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC50986BEF6
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 03:35:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B77210E28A;
	Thu, 29 Feb 2024 02:35:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="WxLEzrzo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B021510E27A
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 02:35:30 +0000 (UTC)
X-UUID: 31bf646ad6ab11ee935d6952f98a51a9-20240229
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=/4b6Fa5B/5D8CIvq27+rD7xKd5V7SopVAeiyzUdv4zA=; 
 b=WxLEzrzoBa6XiFC/6TkHMhSLEefUOVJBibjx4G1E4q8Kk0NTk3Zm6ik82T1Qkb2QFPDy6Yp6JiNkL5j/6UciW4iPIjTJDYKTine7bQuyuo8+0Ad177SE2ew3AoV2ZupGPw+Vx7yyK191+FJeIsD54EwUl/LjR0Gf0UkgsBItXKc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37, REQID:04c228d7-6df1-493a-92eb-047f887bf96c, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:6f543d0, CLOUDID:d1016e84-8d4f-477b-89d2-1e3bdbef96d1,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 31bf646ad6ab11ee935d6952f98a51a9-20240229
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1729247641; Thu, 29 Feb 2024 10:35:25 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 29 Feb 2024 10:35:24 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 29 Feb 2024 10:35:24 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <dri-devel@lists.freedesktop.org>, <linux-media@vger.kernel.org>,
 <linaro-mm-sig@lists.linaro.org>, Jason-ch Chen <jason-ch.chen@mediatek.com>, 
 Johnson Wang <johnson.wang@mediatek.com>, "Jason-JH . Lin"
 <jason-jh.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, Nancy
 Lin <nancy.lin@mediatek.com>, Shawn Sung <shawn.sung@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Fei Shao
 <fshao@chromium.org>, Jason-jh Lin
 <jason-jh.lin@mediatek.corp-partner.google.com>
Subject: [PATCH 0/3] Add GAMMA 12-bit LUT support for MT8188
Date: Thu, 29 Feb 2024 10:35:19 +0800
Message-ID: <20240229023522.15870-1-jason-jh.lin@mediatek.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jason-jh Lin <jason-jh.lin@mediatek.corp-partner.google.com>

Since MT8195 supports GAMMA 12-bit LUT after the landing of [1] series,
we can now add support for MT8188.

[1] MediaTek DDP GAMMA - 12-bit LUT support
- https://patchwork.kernel.org/project/linux-mediatek/list/?series=792516

Jason-JH.Lin (3):
  dt-bindings: display: mediatek: gamma: Change MT8195 to single enum
    group
  dt-bindings: display: mediatek: gamma: Add support for MT8188
  drm/mediatek: Add gamma support for MT8195

 .../bindings/display/mediatek/mediatek,gamma.yaml           | 6 +++++-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c                      | 2 ++
 2 files changed, 7 insertions(+), 1 deletion(-)

-- 
2.18.0

