Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF5AE403408
	for <lists+dri-devel@lfdr.de>; Wed,  8 Sep 2021 08:04:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F0736E116;
	Wed,  8 Sep 2021 06:04:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBDFF6E113
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Sep 2021 06:04:15 +0000 (UTC)
X-UUID: eb8ef70efc5e46ff98ee6bb3e9d1b659-20210908
X-UUID: eb8ef70efc5e46ff98ee6bb3e9d1b659-20210908
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2118680535; Wed, 08 Sep 2021 14:04:10 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 8 Sep 2021 14:04:08 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 8 Sep 2021 14:04:08 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp
 Zabel <p.zabel@pengutronix.de>
CC: Enric Balletbo i Serra <enric.balletbo@collabora.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 <hsinyi@chromium.org>, <fshao@chromium.org>, <jason-jh.lin@mediatek.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, <nancy.lin@mediatek.com>,
 <singo.chang@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v10 00/17] Add Mediatek Soc DRM (vdosys0) support for mt8195
Date: Wed, 8 Sep 2021 14:02:55 +0800
Message-ID: <20210908060312.24007-1-jason-jh.lin@mediatek.com>
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

Change in v10:
- rebase on "drm/mediatek: add support for mediatek SOC MT8192" series
  https://patchwork.kernel.org/project/linux-mediatek/list/?series=529489
- rebase on "soc: mediatek: mmsys: add mt8192 mmsys support" series
  https://patchwork.kernel.org/project/linux-mediatek/list/?series=524857
- fix some typo and "mediatek" start with capital in every dt-bindings
- move mutex yaml from dfisplay folder to soc folder
- separate merge additional propoerties to an individual dt-bindings patch

Change in v9:
- seperate power and gce properties of mmsys into another dt-binding patch
- rebase on "Separate aal module" series
  https://patchwork.kernel.org/project/linux-mediatek/list/?series=516463
- keep mtk_ddp_clk_enable/disable in the same place
- change mtk_dsc_start config register to mtk_drm_ddp_write_mask
- remove the 0 setting of merge fifo config function
- add CCORR driver data for mt8195

Change in v8:
- add DP_INTF0 mux into mmsys routing table
- add DP_INTF0 mutex mod and enum into add/remove comp funtion
- remove bypass DSC enum in mtk_ddp_comp_init

Change in v7:
- add dt=binding of mmsys and disp path into this series
- separate th modidfication of alphabetic order, remove unused define and
  rename the define of register offset to individual patch
- add comment for MERGE ultra and preultra setting

Change in v6:
- adjust alphabetic order for mediatek-drm
- move the patch that add mt8195 support for mediatek-drm as the lastest patch
- add MERGE define for const varriable 

Change in v5:
- add power-domain property into vdosys0 and vdosys1 dts node.
- add MT8195 prifix and remove unused VDO1 define in mt8195-mmsys.h

Change in v4:
- extract dt-binding patches to another patch series
  https://patchwork.kernel.org/project/linux-mediatek/list/?series=519597
- squash DSC module into mtk_drm_ddp_comp.c
- add coment and simplify MERGE config function

Change in v3:
- change mmsys and display dt-bindings document from txt to yaml
- add MERGE additional description in display dt-bindings document
- fix mboxes-cells number of vdosys0 node in dts
- drop mutex eof convert define
- remove pm_runtime apis in DSC and MERGE
- change DSC and MERGE enum to alphabetic order

Change in v2:
- add DSC yaml file
- add mt8195 drm driver porting parts in to one patch
- remove useless define, variable, structure member and function
- simplify DSC and MERGE file and switch threre order

jason-jh.lin (17):
  dt-bindings: arm: mediatek: mmsys: add power and gce properties
  dt-bindings: arm: mediatek: mmsys: add mt8195 SoC binding
  dt-bindings: display: mediatek: disp: split each block to individual
    yaml
  dt-bindings: arm: mediatek: mutex: move mutex binding from display
    folder
  dt-bindings: arm: mediatek: mutex: add mt8195 SoC binding
  dt-bindings: display: mediatek: dsc: add yaml for mt8195 SoC binding
  dt-bindings: display: mediatek: merge: add additional prop for mt8195
  dt-bindings: display: mediatek: add mt8195 SoC binding for vdosys0
  arm64: dts: mt8195: add display node for vdosys0
  soc: mediatek: add mtk-mmsys support for mt8195 vdosys0
  soc: mediatek: add mtk-mutex support for mt8195 vdosys0
  drm/mediatek: remove unused define in mtk_drm_ddp_comp.c
  drm/mediatek: rename the define of register offset
  drm/mediatek: adjust to the alphabetic order for mediatek-drm
  drm/mediatek: add DSC support for mediatek-drm
  drm/mediatek: add MERGE support for mediatek-drm
  drm/mediatek: add mediatek-drm of vdosys0 support for mt8195

 .../bindings/arm/mediatek/mediatek,mmsys.yaml |  32 ++-
 .../bindings/arm/mediatek/mediatek,mutex.yaml |  83 ++++++
 .../display/mediatek/mediatek,aal.yaml        |  80 ++++++
 .../display/mediatek/mediatek,ccorr.yaml      |  79 ++++++
 .../display/mediatek/mediatek,color.yaml      |  89 +++++++
 .../display/mediatek/mediatek,disp.txt        | 219 ----------------
 .../display/mediatek/mediatek,dither.yaml     |  79 ++++++
 .../display/mediatek/mediatek,dsc.yaml        |  71 ++++++
 .../display/mediatek/mediatek,gamma.yaml      |  80 ++++++
 .../display/mediatek/mediatek,merge.yaml      | 101 ++++++++
 .../display/mediatek/mediatek,od.yaml         |  53 ++++
 .../display/mediatek/mediatek,ovl-2l.yaml     |  91 +++++++
 .../display/mediatek/mediatek,ovl.yaml        | 106 ++++++++
 .../display/mediatek/mediatek,postmask.yaml   |  72 ++++++
 .../display/mediatek/mediatek,rdma.yaml       | 120 +++++++++
 .../display/mediatek/mediatek,split.yaml      |  58 +++++
 .../display/mediatek/mediatek,ufoe.yaml       |  61 +++++
 .../display/mediatek/mediatek,wdma.yaml       |  89 +++++++
 arch/arm64/boot/dts/mediatek/mt8195.dtsi      | 111 ++++++++
 drivers/gpu/drm/mediatek/Makefile             |   1 +
 drivers/gpu/drm/mediatek/mtk_disp_drv.h       |   8 +
 drivers/gpu/drm/mediatek/mtk_disp_merge.c     | 239 ++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c      |   6 +
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c   | 222 +++++++++-------
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h   |  26 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        | 132 ++++++----
 drivers/gpu/drm/mediatek/mtk_drm_drv.h        |   1 +
 drivers/soc/mediatek/mt8195-mmsys.h           | 114 +++++++++
 drivers/soc/mediatek/mtk-mmsys.c              |  11 +
 drivers/soc/mediatek/mtk-mutex.c              |  95 ++++++-
 include/linux/soc/mediatek/mtk-mmsys.h        |   9 +
 31 files changed, 2167 insertions(+), 371 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mutex.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,od.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,postmask.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_merge.c
 create mode 100644 drivers/soc/mediatek/mt8195-mmsys.h

-- 
2.18.0

