Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C163F728E
	for <lists+dri-devel@lfdr.de>; Wed, 25 Aug 2021 12:06:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2ED46E193;
	Wed, 25 Aug 2021 10:05:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4CA46E187
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Aug 2021 10:05:40 +0000 (UTC)
X-UUID: e5efa0bdaa454ff691d2460da34631d5-20210825
X-UUID: e5efa0bdaa454ff691d2460da34631d5-20210825
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw02.mediatek.com (envelope-from <nancy.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 136059727; Wed, 25 Aug 2021 18:05:35 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 25 Aug 2021 18:05:33 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 25 Aug 2021 18:05:33 +0800
From: Nancy.Lin <nancy.lin@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>
CC: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 "Nancy . Lin" <nancy.lin@mediatek.com>, Yongqiang Niu
 <yongqiang.niu@mediatek.com>, <dri-devel@lists.freedesktop.org>,
 <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <singo.chang@mediatek.com>, <srv_heupstream@mediatek.com>
Subject: [PATCH v4 00/17] Add MediaTek SoC DRM (vdosys1) support for mt8195
Date: Wed, 25 Aug 2021 18:05:14 +0800
Message-ID: <20210825100531.5653-1-nancy.lin@mediatek.com>
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

The hardware path of vdosys1 with DPTx output need to go through by several modules, such as, OVL_ADAPTOR and MERGE.

Add DRM and these modules support by the patches below:

Changes in v4:
- use merge common driver for merge1~4.
- refine ovl_adaptor rdma driver.
- use ovl_adaptor ddp_comp function instead of ethdr.
- modify for reviewer's comment in v3.

Changes in v3:
- modify for reviewer's comment in v2.
- add vdosys1 2 pixels align limit.
- add mixer odd offset support.

Changes in v2:
- Merge PSEUDO_OVL and ETHDR into one DRM component.
- Add mmsys config API for vdosys1 hardware setting.
- Add mmsys reset control using linux reset framework.

Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>

This series are based on the following patch:
[1] arm64: dts: Add Mediatek SoC MT8195 and evaluation board dts and Makefile
    https://patchwork.kernel.org/project/linux-mediatek/patch/20210601075350.31515-2-seiya.wang@mediatek.com/
[2] arm64: dts: mt8195: add IOMMU and smi nodes
    https://patchwork.kernel.org/project/linux-mediatek/patch/20210615173233.26682-15-tinghan.shen@mediatek.com/
[3] [01/24] dt-bindings: mediatek: mt8195: Add binding for MM IOMMU
    https://patchwork.kernel.org/project/linux-mediatek/patch/20210630023504.18177-2-yong.wu@mediatek.com/
[4] Add gce support for mt8195
    https://patchwork.kernel.org/project/linux-mediatek/list/?series=515599
[5] Add MediaTek SoC DRM (vdosys0) support for mt8195
    https://patchwork.kernel.org/project/linux-mediatek/list/?series=531695
[6] [v8,1/2] dt-bindings: reset: mt8195: add toprgu reset-controller header file
    https://patchwork.kernel.org/project/linux-mediatek/patch/20210806023606.16867-2-Christine.Zhu@mediatek.com/

Nancy.Lin (17):
  dt-bindings: mediatek: add vdosys1 RDMA definition for mt8195
  dt-bindings: mediatek: add vdosys1 MERGE property for mt8195
  dt-bindings: mediatek: add ethdr definition for mt8195
  dt-bindings: mediatek: Add #reset-cells to mmsys system controller
  dt-bindings: reset: mt8195: add vdosys1 reset control bit
  arm64: dts: mt8195: add display node for vdosys1
  soc: mediatek: add mtk-mmsys support for mt8195 vdosys1
  soc: mediatek: add mtk-mmsys config API for mt8195 vdosys1
  soc: mediatek: add cmdq support of mtk-mmsys config API for mt8195
    vdosys1
  soc: mediatek: mmsys: Add reset controller support for MT8195 vdosys1
  soc: mediatek: add mtk-mutex support for mt8195 vdosys1
  drm/mediatek: add display MDP RDMA support for MT8195
  drm/mediatek: add display merge api support for MT8195
  drm/mediatek: add ETHDR support for MT8195
  drm/mediatek: add ovl_adaptor support for MT8195
  drm/mediatek: modify mediatek-drm for mt8195 multi mmsys support
  drm/mediatek: add mediatek-drm of vdosys1 support for MT8195

 .../bindings/arm/mediatek/mediatek,mmsys.yaml |   3 +
 .../display/mediatek/mediatek,ethdr.yaml      | 144 ++++++
 .../display/mediatek/mediatek,mdp-rdma.yaml   |  77 ++++
 .../display/mediatek/mediatek,merge.yaml      |   3 +
 arch/arm64/boot/dts/mediatek/mt8195.dtsi      | 221 +++++++++
 drivers/gpu/drm/mediatek/Makefile             |   5 +-
 drivers/gpu/drm/mediatek/mtk_disp_drv.h       |  29 ++
 drivers/gpu/drm/mediatek/mtk_disp_merge.c     |  78 +++-
 .../gpu/drm/mediatek/mtk_disp_ovl_adaptor.c   | 406 +++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c       |  25 +-
 drivers/gpu/drm/mediatek/mtk_drm_crtc.h       |   3 +-
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c   |  15 +
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h   |   1 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        | 377 +++++++++++++---
 drivers/gpu/drm/mediatek/mtk_drm_drv.h        |   9 +-
 drivers/gpu/drm/mediatek/mtk_ethdr.c          | 424 ++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_ethdr.h          |  25 ++
 drivers/gpu/drm/mediatek/mtk_mdp_rdma.c       | 306 +++++++++++++
 drivers/gpu/drm/mediatek/mtk_mdp_rdma.h       |  37 ++
 drivers/soc/mediatek/mt8195-mmsys.h           | 199 ++++++++
 drivers/soc/mediatek/mtk-mmsys.c              | 137 ++++++
 drivers/soc/mediatek/mtk-mmsys.h              |  11 +
 drivers/soc/mediatek/mtk-mutex.c              | 270 ++++++-----
 include/dt-bindings/reset/mt8195-resets.h     |  12 +
 include/linux/soc/mediatek/mtk-mmsys.h        |  22 +
 25 files changed, 2644 insertions(+), 195 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,mdp-rdma.yaml
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_ethdr.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_ethdr.h
 create mode 100644 drivers/gpu/drm/mediatek/mtk_mdp_rdma.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_mdp_rdma.h

-- 
2.18.0

