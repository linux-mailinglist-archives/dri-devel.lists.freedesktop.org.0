Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AED4D2D93EA
	for <lists+dri-devel@lfdr.de>; Mon, 14 Dec 2020 09:18:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 839466E081;
	Mon, 14 Dec 2020 08:17:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by gabe.freedesktop.org (Postfix) with ESMTP id 932CE6E56A
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Dec 2020 04:12:07 +0000 (UTC)
X-UUID: ae8caa889a4b48009cdf03b6d2b6f2de-20201212
X-UUID: ae8caa889a4b48009cdf03b6d2b6f2de-20201212
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw01.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2
 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1996836764; Sat, 12 Dec 2020 12:12:02 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 12 Dec 2020 12:12:01 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 12 Dec 2020 12:12:00 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob
 Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v2, 00/17] drm/mediatek: add support for mediatek SOC MT8192
Date: Sat, 12 Dec 2020 12:11:40 +0800
Message-ID: <1607746317-4696-1-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-MTK: N
X-Mailman-Approved-At: Mon, 14 Dec 2020 08:17:40 +0000
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

This series are based on 5.10-rc1 and provid 17 patch
to support mediatek SOC MT8192

Changes in v2:
- base mmsys
https://patchwork.kernel.org/project/linux-mediatek/cover/1607506379-10998-1-git-send-email-yongqiang.niu@mediatek.com/
- base mt8192 gce dtbinding file
https://patchwork.kernel.org/project/linux-mediatek/patch/1607141728-17307-2-git-send-email-yongqiang.niu@mediatek.com/
- add dt-bindings description for post mask
- add dt-bindings description for mt8192 display
- fix some comment in v1
- add mt8192 mmsys function call

Changes in v1:
- add some more ddp component
- add mt8192 mmsys support
- add ovl mount on support
- add 2 more clock into mutex device
- fix ovl smi_id_en and fb null software bug
- fix ddp compoent size config bug
- add mt8192 drm support
- add ddp bypass shadow register function
- add 8192 dts description

Yongqiang Niu (17):
  dt-bindings: mediatek: add description for postmask
  dt-bindings: mediatek: add CLK_MM_DISP_CONFIG control description for
    mt8192 display
  dt-bindings: mediatek: add description for mt8192 display
  drm/mediatek: add component OVL_2L2
  drm/mediatek: add component POSTMASK
  drm/mediatek: add component RDMA4
  drm/mediatek: add disp config and mm 26mhz clock into mutex device
  drm/mediatek: enable OVL_LAYER_SMI_ID_EN for multi-layer usecase
  drm/mediatek: check if fb is null
  drm/mediatek: fix aal size config
  drm/mediatek: fix dither size config
  drm/mediatek: fix gamma size config
  drm/mediatek: fix ccorr size config
  soc: mediatek: mmsys: Use function call for setting mmsys ovl mout
    register
  soc: mediatek: mmsys: add mt8192 mmsys support
  drm/mediatek: add support for mediatek SOC MT8192
  arm64: dts: mt8192: add display node

 .../bindings/display/mediatek/mediatek,disp.txt    |   6 +-
 arch/arm64/boot/dts/mediatek/mt8192.dtsi           | 130 +++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_disp_color.c          |   6 +
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c            |  34 +++++-
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c           |   6 +
 drivers/gpu/drm/mediatek/mtk_drm_ddp.c             |  84 +++++++++++--
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c        |  50 +++++++-
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h        |   1 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c             |  48 ++++++++
 drivers/soc/mediatek/mmsys/Makefile                |   1 +
 drivers/soc/mediatek/mmsys/mt8192-mmsys.c          | 119 +++++++++++++++++++
 drivers/soc/mediatek/mmsys/mtk-mmsys.c             |  18 +++
 include/linux/soc/mediatek/mtk-mmsys.h             |   7 ++
 13 files changed, 496 insertions(+), 14 deletions(-)
 create mode 100644 drivers/soc/mediatek/mmsys/mt8192-mmsys.c

-- 
1.8.1.1.dirty

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
