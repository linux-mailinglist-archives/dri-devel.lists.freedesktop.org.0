Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1AE77CD301
	for <lists+dri-devel@lfdr.de>; Wed, 18 Oct 2023 06:37:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE3DD10E36B;
	Wed, 18 Oct 2023 04:37:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC5E410E368
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Oct 2023 04:36:59 +0000 (UTC)
X-UUID: f598414a6d6f11eea33bb35ae8d461a2-20231018
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=hvgZVSIYPCds3ptt3MEwvGHqQyAcV83C0yGNYmKo2Ts=; 
 b=mlLcDPiFryFSE51KpTyR+LwkRWfE35fkfNIhb5YcCp6RtQ5i+gmAix+NE+Su4rFavsuN0VGdWCe25cozqr/nSqO0maDFtb0zuZueSYGSgjlE0goE1/ZrUF2DwOKTTYwH7z0lZ02bjG9KK6srCMd/l+N2Vb3JbV5YvIonUnTIEW4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32, REQID:15a62073-915b-45a0-9009-bbee5111677e, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:5f78ec9, CLOUDID:8854ecf0-9a6e-4c39-b73e-f2bc08ca3dc5,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
 DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: f598414a6d6f11eea33bb35ae8d461a2-20231018
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by
 mailgw01.mediatek.com (envelope-from <shawn.sung@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 526962779; Wed, 18 Oct 2023 12:36:52 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 18 Oct 2023 12:36:51 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 18 Oct 2023 12:36:51 +0800
From: Hsiao Chien Sung <shawn.sung@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, CK
 Hu <ck.hu@mediatek.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v9 00/23] Add display driver for MT8188 VDOSYS1
Date: Wed, 18 Oct 2023 12:36:27 +0800
Message-ID: <20231018043650.22532-1-shawn.sung@mediatek.com>
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
Cc: Nathan Lu <nathan.lu@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Moudy Ho <moudy.ho@mediatek.com>, Fei Shao <fshao@chromium.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Johnson Wang <johnson.wang@mediatek.corp-partner.google.com>,
 "Nancy . Lin" <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
 Hsiao Chien Sung <shawn.sung@mediatek.com>, Sean Paul <sean@poorly.run>,
 devicetree@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series is based on mediatek-drm-next.

Changes in v9:
- Add a static inline function to power off the device
- Change driver name to "mediatek-disp-padding"
- Fix typo and kernel doc format error

Changes in v8:
- Power on/off the components with .power_on() and .power_off()
- Remove mtk_padding_config()
- Remove Reviewed-by tags in "drm/mediatek: Add Padding to OVL adaptor"
  because of the modifications.

Changes in v7:
- Start/Stop the components in OVL Adaptor with function pointers
- Refine Padding driver
- Fix underrun when the layer is switching off

Changes in v6:
- Separate the commits into smaller ones
- Add DPI input mode setting
- Fix VDOSYS1 power-on issues

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

Hsiao Chien Sung (23):
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
  drm/mediatek: Start/Stop components with function pointers
  drm/mediatek: Support MT8188 Padding in display driver
  drm/mediatek: Add Padding to OVL adaptor
  drm/mediatek: Return error if MDP RDMA failed to enable the clock
  drm/mediatek: Remove the redundant driver data for DPI
  drm/mediatek: Fix underrun in VDO1 when switches off the layer
  drm/mediatek: Power on devices in OVL adaptor when atomic enable
  drm/mediatek: Support MT8188 VDOSYS1 in display driver

 .../bindings/arm/mediatek/mediatek,mmsys.yaml |   1 +
 .../display/mediatek/mediatek,ethdr.yaml      |   6 +-
 .../display/mediatek/mediatek,mdp-rdma.yaml   |   6 +-
 .../display/mediatek/mediatek,merge.yaml      |   3 +
 .../display/mediatek/mediatek,padding.yaml    |  81 +++++
 drivers/gpu/drm/mediatek/Makefile             |   3 +-
 drivers/gpu/drm/mediatek/mtk_disp_drv.h       |   8 +
 drivers/gpu/drm/mediatek/mtk_disp_merge.c     |   2 +-
 .../gpu/drm/mediatek/mtk_disp_ovl_adaptor.c   | 286 +++++++++++-------
 drivers/gpu/drm/mediatek/mtk_dpi.c            |  16 +-
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c       |  28 +-
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c   |   2 +
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h   |  20 ++
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        |   5 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.h        |   2 +-
 drivers/gpu/drm/mediatek/mtk_mdp_rdma.c       |  19 +-
 drivers/gpu/drm/mediatek/mtk_padding.c        | 160 ++++++++++
 drivers/soc/mediatek/mt8188-mmsys.h           | 210 +++++++++++++
 drivers/soc/mediatek/mtk-mmsys.c              |  27 ++
 drivers/soc/mediatek/mtk-mmsys.h              |  32 ++
 drivers/soc/mediatek/mtk-mutex.c              |  51 ++++
 include/dt-bindings/reset/mt8188-resets.h     |  75 +++++
 include/linux/soc/mediatek/mtk-mmsys.h        |   8 +
 23 files changed, 897 insertions(+), 154 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,padding.yaml
 create mode 100644 drivers/gpu/drm/mediatek/mtk_padding.c

--
2.18.0

