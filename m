Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D2A73E1A29
	for <lists+dri-devel@lfdr.de>; Thu,  5 Aug 2021 19:14:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 582036E841;
	Thu,  5 Aug 2021 17:13:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 901B56E210
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Aug 2021 17:13:55 +0000 (UTC)
X-UUID: 1c05dfc6992e4e65b78427267cd4eba9-20210806
X-UUID: 1c05dfc6992e4e65b78427267cd4eba9-20210806
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw01.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 624831978; Fri, 06 Aug 2021 01:13:52 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 6 Aug 2021 01:13:50 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 6 Aug 2021 01:13:50 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp
 Zabel <p.zabel@pengutronix.de>, Enric Balletbo i Serra
 <enric.balletbo@collabora.com>, <fshao@chromium.org>
CC: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Fabien
 Parent <fparent@baylibre.com>, <hsinyi@chromium.org>, "jason-jh . lin"
 <jason-jh.lin@mediatek.com>, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 <nancy.lin@mediatek.com>, <singo.chang@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 0/4] add mt8195 SoC DRM binding
Date: Fri, 6 Aug 2021 01:13:42 +0800
Message-ID: <20210805171346.24249-1-jason-jh.lin@mediatek.com>
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

Change in v3:
- slpit each display function block to individual taml file.

Change in v2:
- add power-domain property into mediatek,mmsys.yaml
  and modify commit message.

jason-jh.lin (4):
  dt-bindings: arm: mediatek: mmsys: add mt8195 SoC binding
  dt-bindings: mediatek: display: split each block to individual yaml
  dt-bindings: mediatek: add mediatek,dsc.yaml for mt8195 SoC binding
  dt-bindings: mediatek: display: add mt8195 SoC binding

 .../bindings/arm/mediatek/mediatek,mmsys.yaml |   8 +
 .../display/mediatek/mediatek,aal.yaml        |  76 ++++++
 .../display/mediatek/mediatek,ccorr.yaml      |  74 ++++++
 .../display/mediatek/mediatek,color.yaml      |  85 +++++++
 .../display/mediatek/mediatek,disp.txt        | 219 ------------------
 .../display/mediatek/mediatek,dither.yaml     |  75 ++++++
 .../display/mediatek/mediatek,dsc.yaml        |  69 ++++++
 .../display/mediatek/mediatek,gamma.yaml      |  76 ++++++
 .../display/mediatek/mediatek,merge.yaml      |  97 ++++++++
 .../display/mediatek/mediatek,mutex.yaml      |  79 +++++++
 .../display/mediatek/mediatek,od.yaml         |  52 +++++
 .../display/mediatek/mediatek,ovl-2l.yaml     |  86 +++++++
 .../display/mediatek/mediatek,ovl.yaml        | 101 ++++++++
 .../display/mediatek/mediatek,rdma.yaml       | 112 +++++++++
 .../display/mediatek/mediatek,split.yaml      |  56 +++++
 .../display/mediatek/mediatek,ufoe.yaml       |  59 +++++
 .../display/mediatek/mediatek,wdma.yaml       |  86 +++++++
 17 files changed, 1191 insertions(+), 219 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,od.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml

-- 
2.18.0

