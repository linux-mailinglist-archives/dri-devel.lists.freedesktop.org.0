Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E7EB73CC4B6
	for <lists+dri-devel@lfdr.de>; Sat, 17 Jul 2021 19:08:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34E496EA91;
	Sat, 17 Jul 2021 17:08:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CC7E6EA1D
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Jul 2021 09:09:32 +0000 (UTC)
X-UUID: 2157498aca424e82b6ab02a77d95bd58-20210717
X-UUID: 2157498aca424e82b6ab02a77d95bd58-20210717
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw01.mediatek.com
 (envelope-from <nancy.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 730742864; Sat, 17 Jul 2021 17:04:25 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 17 Jul 2021 17:04:23 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 17 Jul 2021 17:04:23 +0800
From: Nancy.Lin <nancy.lin@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>
Subject: [PATCH v1 00/10] Add MediaTek SoC DRM (vdosys1) support for mt8195
Date: Sat, 17 Jul 2021 17:03:58 +0800
Message-ID: <20210717090408.28283-1-nancy.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-Mailman-Approved-At: Sat, 17 Jul 2021 17:08:05 +0000
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, srv_heupstream@mediatek.com,
 devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>, singo.chang@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 "Nancy . Lin" <nancy.lin@mediatek.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The hardware path of vdosys1 with DPTx output need to go through
by several modules, such as, PSEUDO_OVL, ETHDR, and MERGE.

Add DRM and these modules support by the patches below:

Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
---
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
    https://patchwork.kernel.org/project/linux-mediatek/list/?series=516277
---

Nancy.Lin (10):
  [PATCH v1 01/10] dt-bindings: mediatek: add pseudo-ovl definition for mt8195
  [PATCH v1 02/10] dt-bindings: mediatek: add ethdr definition for mt8195
  [PATCH v1 03/10] arm64: dts: mt8195: add display node for vdosys1
  [PATCH v1 04/10] soc: mediatek: add mtk-mmsys support for mt8195 vdosys1
  [PATCH v1 05/10] soc: mediatek: add mtk-mutex support for mt8195 vdosys1
  [PATCH v1 06/10] drm/mediatek: add ETHDR support for MT8195
  [PATCH v1 07/10] drm/mediatek: add pseudo ovl support for MT8195
  [PATCH v1 08/10] drm/mediatek: add merge vblank support for MT8195
  [PATCH v1 09/10] soc: mediatek: mmsys: add new mtk_mmsys struct member to store drm
    data.
  [PATCH v1 10/10] drm/mediatek: add mediatek-drm of vdosys1 support for MT8195

 .../display/mediatek/mediatek,disp.yaml       |  10 +
 .../display/mediatek/mediatek,ethdr.yaml      | 137 ++++
 .../display/mediatek/mediatek,pseudo-ovl.yaml | 105 +++
 arch/arm64/boot/dts/mediatek/mt8195.dtsi      | 206 ++++++
 drivers/gpu/drm/mediatek/Makefile             |   5 +-
 drivers/gpu/drm/mediatek/mtk_disp_drv.h       |  24 +
 drivers/gpu/drm/mediatek/mtk_disp_merge.c     |  56 ++
 .../gpu/drm/mediatek/mtk_disp_pseudo_ovl.c    | 655 ++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c       |  37 +-
 drivers/gpu/drm/mediatek/mtk_drm_crtc.h       |   3 +-
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c   |  63 ++
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h   |  18 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        | 375 ++++++++--
 drivers/gpu/drm/mediatek/mtk_drm_drv.h        |  17 +-
 drivers/gpu/drm/mediatek/mtk_ethdr.c          | 537 ++++++++++++++
 drivers/gpu/drm/mediatek/mtk_ethdr.h          |  20 +
 drivers/gpu/drm/mediatek/mtk_mdp_rdma.c       | 456 ++++++++++++
 drivers/gpu/drm/mediatek/mtk_mdp_rdma.h       | 109 +++
 drivers/gpu/drm/mediatek/mtk_mdp_reg_rdma.h   | 160 +++++
 drivers/soc/mediatek/mt8195-mmsys.h           |  83 ++-
 drivers/soc/mediatek/mtk-mmsys.c              |  11 +
 drivers/soc/mediatek/mtk-mutex.c              | 270 +++++---
 include/linux/soc/mediatek/mtk-mmsys.h        |   3 +
 23 files changed, 3166 insertions(+), 194 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,pseudo-ovl.yaml
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_pseudo_ovl.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_ethdr.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_ethdr.h
 create mode 100644 drivers/gpu/drm/mediatek/mtk_mdp_rdma.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_mdp_rdma.h
 create mode 100644 drivers/gpu/drm/mediatek/mtk_mdp_reg_rdma.h

-- 
2.18.0

