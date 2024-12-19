Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9DD9F8302
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2024 19:15:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5658D10ED9B;
	Thu, 19 Dec 2024 18:15:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="DpZ/hGDl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C562010ED92
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2024 18:15:41 +0000 (UTC)
X-UUID: 3e09fa24be3511efbd192953cf12861f-20241220
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=ZRNlClTpyAMqK+J6+xpp8yNx43isLwpFhXRlwgj4Ew4=; 
 b=DpZ/hGDlxdTcwqUw7s+9F2Tlj7deXDsqVE4oROcN+eEFI5NMLX26qT+UC8gyTgVv7DpNWjLHEzvvxyAeNEHXLFB+RbciCFMFnKi5eC8RSoITqwVIkJNIjxSqZvRtA1uaBUSES2/JQT9djiydjzFFGGYx7q+ShlDKQ9kIlrPXMK0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45, REQID:45438874-5ef6-42b7-8287-ae0bea902230, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:6493067, CLOUDID:7020cc28-d2eb-4de2-b5c9-495d1bc17256,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:1,File:nil,RT:100,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_ULS,TF_CID_SPAM_SNR
X-UUID: 3e09fa24be3511efbd192953cf12861f-20241220
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 397039482; Fri, 20 Dec 2024 02:15:35 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 20 Dec 2024 02:15:34 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 20 Dec 2024 02:15:34 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, "Jason-JH . Lin"
 <jason-jh.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, "Nancy
 Lin" <nancy.lin@mediatek.com>, Shawn Sung <shawn.sung@mediatek.com>,
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Fei Shao
 <fshao@chromium.org>, Pin-yen Lin <treapking@chromium.org>
Subject: [PATCH v3 0/4] Update MT8188 OVL compatible from MT8183 to MT8195
Date: Fri, 20 Dec 2024 02:15:27 +0800
Message-ID: <20241219181531.4282-1-jason-jh.lin@mediatek.com>
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

The first patch is adding the MT8188 compatible strings, refer to:
- https://lore.kernel.org/all/20241218105320.38980-2-angelogioacchino.delregno@collabora.com/

The 2nd patch is resending the reviewed and acked patch from:
- https://lore.kernel.org/all/5d9e6f6c-604d-4e2d-a448-fc5b8bd24a75@collabora.com/
and rebase it to the latest linux-next-20241212.

The 3rd and the 4th patches are updating the mt8188.dtsi and mt8195.dtsi
according to the 1st patch.

---

Change in v3:
1. Add a dt-bindings ptach for MT8188 MDP3 OVL.

Change in v2:
1. Add missing mt8195 compatible in the beginning of compatible property.
2. Add fix patch to mt8195.

---

Hsiao Chien Sung (1):
  dt-bindings: display: mediatek: ovl: Modify rules for MT8195/MT8188

Jason-JH.Lin (3):
  dt-bindings: display: mediatek: ovl: Add compatible strings for MT8188
    MDP3
  dts: arm64: mediatek: mt8188: Update OVL compatible from MT8183 to
    MT8195
  dts: arm64: mediatek: mt8195: Remove MT8183 compatible for OVL

 .../bindings/display/mediatek/mediatek,ovl.yaml      | 12 +++++++-----
 arch/arm64/boot/dts/mediatek/mt8188.dtsi             |  2 +-
 arch/arm64/boot/dts/mediatek/mt8195.dtsi             |  2 +-
 3 files changed, 9 insertions(+), 7 deletions(-)

-- 
2.43.0

