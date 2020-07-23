Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B91822A938
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jul 2020 09:03:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C5988934F;
	Thu, 23 Jul 2020 07:03:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTP id 25E086E03A
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jul 2020 02:09:47 +0000 (UTC)
X-UUID: 6d44cec7ecd54cb5b98e8b01c0b0980a-20200723
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=qFRLx/+6VxdIz+jDbGtfOLe8xjP4LdN/gpj4rcMmUbQ=; 
 b=U4GnLzzBYuGpVTTf5/wG2PFZ/0d/W0V305H+5hbnJWDoWbbtFP4I86ds7fSgZFGMMU2OoDti4snB0+hKFk0g/CGUSAPZHttPMb7FfJUssY3oz55DLFcmagQVe/8B6BaSBqVp/pG6YVDGf3YEOBW+HqwzjSTnUOJbjeYYK8+GLhI=;
X-UUID: 6d44cec7ecd54cb5b98e8b01c0b0980a-20200723
Received: from mtkcas08.mediatek.inc [(172.21.101.126)] by
 mailgw02.mediatek.com (envelope-from <yongqiang.niu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 76920452; Thu, 23 Jul 2020 10:04:41 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 23 Jul 2020 10:04:40 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 23 Jul 2020 10:04:36 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob
 Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [v7, PATCH 0/7] add drm support for MT8183
Date: Thu, 23 Jul 2020 10:03:11 +0800
Message-ID: <1595469798-3824-1-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-MTK: N
X-Mailman-Approved-At: Thu, 23 Jul 2020 07:03:15 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series are based on 5.8-rc1 and provide 7 patch
to support mediatek SOC MT8183

Change since v6
- move ddp component define into mtk_mmsys.h
- add mmsys private data to support different ic path connection
- add mt8183-mmsys.c to support 8183 path connection
- fix reviewed issue in v6

Change since v5
- fix reviewed issue in v5
base https://patchwork.kernel.org/project/linux-mediatek/list/?series=213219

Change since v4
- fix reviewed issue in v4

Change since v3
- fix reviewed issue in v3
- fix type error in v3
- fix conflict with iommu patch

Change since v2
- fix reviewed issue in v2
- add mutex node into dts file

Changes since v1:
- fix reviewed issue in v1
- add dts for mt8183 display nodes
- adjust display clock control flow in patch 22
- add vmap support for mediatek drm in patch 23
- fix page offset issue for mmap function in patch 24
- enable allow_fb_modifiers for mediatek drm in patch 25


Yongqiang Niu (7):
  drm/mediatek: move ddp component define into mtk_mmsys.h
  mtk-mmsys: add mmsys private data
  mtk-mmsys: add mt8183 mmsys support
  dt-bindings: mediatek: add rdma_fifo_size description for mt8183
    display
  arm64: dts: add display nodes for mt8183
  drm/mediatek: add fifo_size into rdma private data
  drm/mediatek: add support for mediatek SOC MT8183

 .../bindings/display/mediatek/mediatek,disp.txt    |  14 ++
 arch/arm64/boot/dts/mediatek/mt8183.dtsi           |  98 ++++++++
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c            |  18 ++
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c           |  25 +-
 drivers/gpu/drm/mediatek/mtk_drm_ddp.c             |  47 ++++
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h        |  34 +--
 drivers/gpu/drm/mediatek/mtk_drm_drv.c             |  43 ++++
 drivers/soc/mediatek/Makefile                      |   1 +
 drivers/soc/mediatek/mmsys/Makefile                |   3 +
 drivers/soc/mediatek/mmsys/mt2701-mmsys.c          | 250 +++++++++++++++++++
 drivers/soc/mediatek/mmsys/mt8183-mmsys.c          | 161 ++++++++++++
 drivers/soc/mediatek/mtk-mmsys.c                   | 276 ++++-----------------
 include/linux/soc/mediatek/mtk-mmsys.h             |  48 ++++
 13 files changed, 756 insertions(+), 262 deletions(-)
 create mode 100644 drivers/soc/mediatek/mmsys/Makefile
 create mode 100644 drivers/soc/mediatek/mmsys/mt2701-mmsys.c
 create mode 100644 drivers/soc/mediatek/mmsys/mt8183-mmsys.c

-- 
1.8.1.1.dirty
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
