Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D721F79C811
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 09:19:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3688B10E397;
	Tue, 12 Sep 2023 07:19:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF0AF10E2C9
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Sep 2023 11:30:05 +0000 (UTC)
X-UUID: 8bc8f2a0509611ee8051498923ad61e6-20230911
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=8Wc0C//ZFIUk4bGiU2mG/6OEkogqZJF2AkljuEJa1ws=; 
 b=d+2g5ouPo5QVJfSMhWLkLzRipzzHXeOdSuygmUeaFR2f9nO1ut4We/6b65sO26W03np04Sl5/tTaY6JdzrFcLfab1pFKmlQ6ettOju4xkirBAsnJ634k9KmNoRwqkM7jsfnpjVC5MnPSaqEpUW0+xU3zZQtM3PdGItYjUJ3RjS4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31, REQID:c420191b-2253-4087-b703-9dbeefb3a1ea, IP:0,
 U
 RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:-5
X-CID-META: VersionHash:0ad78a4, CLOUDID:2882b3be-14cc-44ca-b657-2d2783296e72,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
 DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 8bc8f2a0509611ee8051498923ad61e6-20230911
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by
 mailgw02.mediatek.com (envelope-from <shawn.sung@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1451906846; Mon, 11 Sep 2023 19:30:01 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with ShadowRedundancy id
 15.2.1118.7; Mon, 11 Sep 2023 11:29:57 +0000
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 11 Sep 2023 15:42:43 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 11 Sep 2023 15:42:43 +0800
From: Hsiao Chien Sung <shawn.sung@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, CK
 Hu <ck.hu@mediatek.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
Subject: [RESEND PATCH v6 00/20] Add display driver for MT8188 VDOSYS1
Date: Mon, 11 Sep 2023 15:42:13 +0800
Message-ID: <20230911074233.31556-1-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-Mailman-Approved-At: Tue, 12 Sep 2023 07:19:12 +0000
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
 <nfraprado@collabora.com>, "Jason-JH
 . Lin" <jason-jh.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 "Nancy . Lin" <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org,
 Hsiao Chien Sung <shawn.sung@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Resend patch to add devicetree@vger.kernel.org to cc list for
automated tooling.

Changes in v6:
- Separate the commits into smaller ones
- Add DPI input mode setting

Changes in v5:
- Reuse .clk_enable/.clk_disable in struct mtk_ddp_comp_funcs
  in mtk_disp_ovl_adaptor.c
- Adjust commits order

Changes in v4:
- Add new functions in mtk_disp_ovl_adaptor.c to enable/disable
  components and reuse them when clock enable/disable
- Rename components in mtk_disp_ovl_adaptor.c and sort them in
  alphabetical order

Changes in v3:
- Define macro MMSYS_RST_NR in mtk-mmsys.h and update reset table
- Fix typos (ETDHR -> ETHDR, VSNYC -> VSYNC)
- Rebase dt-bindings on linux-next
- Refine description of Padding
- Squash reset bit map commits for VDO0 and VDO1 into one

Changes in v2:
- Remove redundant compatibles of MT8188 because it shares the same
  configuration with MT8195
- Separate dt-bindings by modules
- Support reset bit mapping in mmsys driver

Hsiao Chien Sung (20):
  dt-bindings: display: mediatek: ethdr: Add compatible for MT8188
  dt-bindings: display: mediatek: mdp-rdma: Add compatible for MT8188
  dt-bindings: display: mediatek: merge: Add compatible for MT8188
  dt-bindings: display: mediatek: padding: Add MT8188
  dt-bindings: arm: mediatek: Add compatible for MT8188
  dt-bindings: reset: mt8188: Add VDOSYS reset control bits
  soc: mediatek: Support MT8188 VDOSYS1 in mtk-mmsys
  soc: mediatek: Support MT8188 VDOSYS1 Padding in mtk-mmsys
  soc: mediatek: Support reset bit mapping in mmsys driver
  soc: mediatek: Add MT8188 VDOSYS reset bit map
  drm/mediatek: Rename OVL_ADAPTOR_TYPE_RDMA
  drm/mediatek: Refine device table of OVL adaptor
  drm/mediatek: Sort OVL adaptor components
  drm/mediatek: Add component ID to component match structure
  drm/mediatek: Manage component's clock with function pointers
  drm/mediatek: Make sure the power-on sequence of LARB and RDMA
  drm/mediatek: Support MT8188 Padding in display driver
  drm/mediatek: Add Padding to OVL adaptor
  drm/mediatek: Support MT8188 VDOSYS1 in display driver
  drm/mediatek: Set DPI input to 1T2P mode

 .../bindings/arm/mediatek/mediatek,mmsys.yaml |   1 +
 .../display/mediatek/mediatek,ethdr.yaml      |   6 +-
 .../display/mediatek/mediatek,mdp-rdma.yaml   |   6 +-
 .../display/mediatek/mediatek,merge.yaml      |   3 +
 .../display/mediatek/mediatek,padding.yaml    |  81 +++++++
 drivers/gpu/drm/mediatek/Makefile             |   3 +-
 drivers/gpu/drm/mediatek/mtk_disp_drv.h       |   3 +
 .../gpu/drm/mediatek/mtk_disp_ovl_adaptor.c   | 216 +++++++++---------
 drivers/gpu/drm/mediatek/mtk_dpi.c            |   2 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        |   4 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.h        |   2 +-
 drivers/gpu/drm/mediatek/mtk_mdp_rdma.c       |  20 +-
 drivers/gpu/drm/mediatek/mtk_padding.c        | 136 +++++++++++
 drivers/soc/mediatek/mt8188-mmsys.h           | 210 +++++++++++++++++
 drivers/soc/mediatek/mtk-mmsys.c              |  23 ++
 drivers/soc/mediatek/mtk-mmsys.h              |  32 +++
 drivers/soc/mediatek/mtk-mutex.c              |  51 +++++
 include/dt-bindings/reset/mt8188-resets.h     |  75 ++++++
 include/linux/soc/mediatek/mtk-mmsys.h        |   8 +
 19 files changed, 764 insertions(+), 118 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,padding.yaml
 create mode 100644 drivers/gpu/drm/mediatek/mtk_padding.c

--
2.18.0

