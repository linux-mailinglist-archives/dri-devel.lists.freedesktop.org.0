Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF61819C3F
	for <lists+dri-devel@lfdr.de>; Wed, 20 Dec 2023 11:09:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9789610E54B;
	Wed, 20 Dec 2023 10:09:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C1BA10E331
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Dec 2023 10:09:06 +0000 (UTC)
X-UUID: c8f85e0e9f1f11eeba30773df0976c77-20231220
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=BB/db8kwBAgYmnmKYFiiM6LqADno4HrExJ7cxr5YTxs=; 
 b=lIBMkDL7bs2HWDaru4WTJBYrxXDHxu4xeOtt3LVm1sJpFeWJnH2KYxbHSHRo5deRMtnsmr1s2wrGMpLO6XZs5HIyroFKuok4PpM/+jA8Rp3vd1dMRplVV4ck6WCvdB9bn59u/Y0ks5pK8liTpsTPPGLhL6MV/mo6UQz6laHg5IM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35, REQID:280067e6-3abe-41db-9c37-c72000c4bb1f, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:5d391d7, CLOUDID:9b537a7e-4f93-4875-95e7-8c66ea833d57,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
 DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: c8f85e0e9f1f11eeba30773df0976c77-20231220
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by
 mailgw02.mediatek.com (envelope-from <moudy.ho@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1194438982; Wed, 20 Dec 2023 18:08:55 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 20 Dec 2023 18:08:54 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 20 Dec 2023 18:08:54 +0800
From: Moudy Ho <moudy.ho@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>
Subject: [PATCH v10 00/16] introduce more MDP3 components in MT8195
Date: Wed, 20 Dec 2023 18:08:37 +0800
Message-ID: <20231220100853.20616-1-moudy.ho@mediatek.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 Moudy Ho <moudy.ho@mediatek.corp-partner.google.com>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Moudy Ho <moudy.ho@mediatek.corp-partner.google.com>

Changes since v9:
- Rebase on linux-next.
- Dependent dtsi files:
  Message ID = 20231030094840.2479-1-moudy.ho@mediatek.com
- Depends on:
  Message ID = 20231214055847.4936-1-shawn.sung@mediatek.com
- Include the missing compatible name 'mediatek,mt8188-vdo1-rdma' in
  patch [2/16].

Changes since v8:
- Rebase on linux-next.
- Dependent dtsi files:
  https://patchwork.kernel.org/project/linux-mediatek/list/?series=797543
- Depends on:
  Message ID = 20231024130048.14749-9-shawn.sung@mediatek.com
- Following Rob's suggestion, the number of 'clocks' and 'mboxes' items are
  restricted using the 'minItems' in [2/16] and [3/16].
- Revise the dependent mt8188 disp padding compatible name in [16/16].

Changes since v7:
- Rebase on linux-next.
- Dependent dtsi files:
  https://patchwork.kernel.org/project/linux-mediatek/list/?series=797543
- Depends on:
  Message ID = 20231024130048.14749-9-shawn.sung@mediatek.com
- Correct the bindings of the four components: FG, TCC, TDSHP and HDR.
  The names of the first three are expanded in the title, and
  the descriptions of all four have been enhanced.

Changes since v6:
- Rebase on v6.6-rc5.
- Dependent dtsi files:
  https://patchwork.kernel.org/project/linux-mediatek/list/?series=792079
- Depends on:
  Message ID = 20231006073831.10402-5-shawn.sung@mediatek.com
- Discard splitting RDMA's common properties and instead use 'allOf' to
  isolate different platform features.
- Revise the incorrect properties in FG, HDR, STITCH, TCC and TDAP bindings.
- Adding SoC-specific compatible string to components, like WROT and RSZ,
  that are inherited from MT8183.
- Fixed typos in TCC patch and enhancing its hardware description.

Changes since v5:
- Rebase on v6.6-rc2.
- Dependent dtsi files:
  https://patchwork.kernel.org/project/linux-mediatek/list/?series=786511
- Depends on:
  Message ID = 20230911074233.31556-5-shawn.sung@mediatek.com
- Split out common propertis for RDMA.
- Split each component into independent patches.

Changes since v4:
- Rebase on v6.6-rc1
- Organize identical hardware components into their respective files.

Hi,

The purpose of this patch is to separate the MDP3-related bindings from
the original mailing list mentioned below:
https://lore.kernel.org/all/20230208092209.19472-1-moudy.ho@mediatek.com/
Those binding files describe additional components that
are present in the mt8195.

Moudy Ho (16):
  dt-bindings: media: mediatek: mdp3: correct RDMA and WROT node with
    generic names
  dt-bindings: media: mediatek: mdp3: merge the indentical RDMA under
    display
  dt-bindings: media: mediatek: mdp3: add config for MT8195 RDMA
  dt-bindings: media: mediatek: mdp3: add compatible for MT8195 RSZ
  dt-bindings: media: mediatek: mdp3: add compatible for MT8195 WROT
  dt-bindings: media: mediatek: mdp3: add component FG for MT8195
  dt-bindings: media: mediatek: mdp3: add component HDR for MT8195
  dt-bindings: media: mediatek: mdp3: add component STITCH for MT8195
  dt-bindings: media: mediatek: mdp3: add component TCC for MT8195
  dt-bindings: media: mediatek: mdp3: add component TDSHP for MT8195
  dt-bindings: display: mediatek: aal: add compatible for MT8195
  dt-bindings: display: mediatek: color: add compatible for MT8195
  dt-bindings: display: mediatek: merge: add compatible for MT8195
  dt-bindings: display: mediatek: ovl: add compatible for MT8195
  dt-bindings: display: mediatek: split: add compatible for MT8195
  dt-bindings: display: mediatek: padding: add compatible for MT8195

 .../display/mediatek/mediatek,aal.yaml        |  1 +
 .../display/mediatek/mediatek,color.yaml      |  1 +
 .../display/mediatek/mediatek,mdp-rdma.yaml   | 92 ------------------
 .../display/mediatek/mediatek,merge.yaml      |  1 +
 .../display/mediatek/mediatek,ovl.yaml        |  1 +
 .../display/mediatek/mediatek,padding.yaml    |  4 +-
 .../display/mediatek/mediatek,split.yaml      | 27 ++++++
 .../bindings/media/mediatek,mdp3-fg.yaml      | 61 ++++++++++++
 .../bindings/media/mediatek,mdp3-hdr.yaml     | 61 ++++++++++++
 .../bindings/media/mediatek,mdp3-rdma.yaml    | 93 ++++++++++++++++---
 .../bindings/media/mediatek,mdp3-rsz.yaml     |  6 +-
 .../bindings/media/mediatek,mdp3-stitch.yaml  | 61 ++++++++++++
 .../bindings/media/mediatek,mdp3-tcc.yaml     | 62 +++++++++++++
 .../bindings/media/mediatek,mdp3-tdshp.yaml   | 61 ++++++++++++
 .../bindings/media/mediatek,mdp3-wrot.yaml    | 29 ++++--
 15 files changed, 442 insertions(+), 119 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,mdp-rdma.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-fg.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-hdr.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-stitch.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-tcc.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-tdshp.yaml

-- 
2.18.0

