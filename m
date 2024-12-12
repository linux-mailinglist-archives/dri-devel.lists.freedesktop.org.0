Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F7A9EEC58
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 16:33:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48C9010E52C;
	Thu, 12 Dec 2024 15:33:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="dnVUqQ+k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18E0410E6B4
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 15:33:53 +0000 (UTC)
X-UUID: 7aaf02d6b89e11ef99858b75a2457dd9-20241212
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=zRv4gIVobaa+kTHMR3lPKYtayqlhOe1elNpsMFFmacU=; 
 b=dnVUqQ+kLxfQAOnjYGds/gxiF+hD2ELq+0l5KKLEOGMKQlPFdCZjwwqDu6JI7lSV4nh0deK+NxemD/6A0pRWXXPya0fIUNXqp2+Aa+j7OW+9tU1+lzv/Xx8y9GxVHpfWMy511R7KakKgUF9PaZxZd0iYumjJHavDlOY4/ArQhnU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45, REQID:1570ec2e-91c2-4731-8543-3d8f60d910dd, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:6493067, CLOUDID:46e90813-8f5d-4ac6-9276-7b9691c7b8d6,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 7aaf02d6b89e11ef99858b75a2457dd9-20241212
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 199065366; Thu, 12 Dec 2024 23:33:47 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 12 Dec 2024 23:33:46 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 12 Dec 2024 23:33:46 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, "Jason-JH . Lin"
 <jason-jh.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, Nancy
 Lin <nancy.lin@mediatek.com>, Shawn Sung <shawn.sung@mediatek.com>,
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Fei Shao
 <fshao@chromium.org>
Subject: [PATCH 0/2] Update MT8188 OVL compatible from MT8183 to MT8195
Date: Thu, 12 Dec 2024 23:33:42 +0800
Message-ID: <20241212153344.27408-1-jason-jh.lin@mediatek.com>
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

This patch series updates the compatible strings for the MediaTek OVL
in the MT8188 dts and the corresponding dt-binding.
The changes ensure that the MT8188 OVL device is correctly identified
and managed by the appropriate drivers.

The first patch is resending the reviewed and acked patch from:
- https://lore.kernel.org/all/5d9e6f6c-604d-4e2d-a448-fc5b8bd24a75@collabora.com/
and rebase it to the latest linux-next-20241212.

The second patch is updating the mt8188.dtsi according to the first patch.

Hsiao Chien Sung (1):
  dt-bindings: display: mediatek: ovl: Modify rules for MT8195/MT8188

Jason-JH.Lin (1):
  dts: arm64: mediatek: mt8188: Update OVL compatible from MT8183 to
    MT8195

 .../bindings/display/mediatek/mediatek,ovl.yaml           | 8 +++-----
 arch/arm64/boot/dts/mediatek/mt8188.dtsi                  | 2 +-
 2 files changed, 4 insertions(+), 6 deletions(-)

-- 
2.43.0

