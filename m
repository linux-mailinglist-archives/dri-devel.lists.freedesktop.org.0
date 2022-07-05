Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DEBC566997
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jul 2022 13:34:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F3D81123E6;
	Tue,  5 Jul 2022 11:30:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A0B610E048
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Jul 2022 10:25:38 +0000 (UTC)
X-UUID: 97de2dd08bf74424afe93a7b053a3fca-20220705
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8, REQID:2767743d-9db3-4103-be55-2f0f30d08cb4, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:95,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:90
X-CID-INFO: VERSION:1.1.8, REQID:2767743d-9db3-4103-be55-2f0f30d08cb4, OB:0,
 LOB:
 0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:95,FILE:0,RULE:Spam_GS981B3D,AC
 TION:quarantine,TS:90
X-CID-META: VersionHash:0f94e32, CLOUDID:96a47563-0b3f-4b2c-b3a6-ed5c044366a0,
 C
 OID:75d5afd46aa7,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:1,File:nil,QS:nil,BEC:nil,COL:0
X-UUID: 97de2dd08bf74424afe93a7b053a3fca-20220705
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw01.mediatek.com (envelope-from <rex-bc.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 649888291; Tue, 05 Jul 2022 18:25:32 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Tue, 5 Jul 2022 18:25:31 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Tue, 5 Jul 2022 18:25:30 +0800
From: Bo-Chen Chen <rex-bc.chen@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <daniel@ffwll.ch>,
 <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
 <matthias.bgg@gmail.com>, <airlied@linux.ie>
Subject: [PATCH v16 0/5] drm/mediatek: Add MT8195 dp_intf driver
Date: Tue, 5 Jul 2022 18:25:25 +0800
Message-ID: <20220705102530.1344-1-rex-bc.chen@mediatek.com>
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
Cc: devicetree@vger.kernel.org, granquet@baylibre.com, jitao.shi@mediatek.com,
 xinlei.lee@mediatek.com, liangxu.xu@mediatek.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, msp@baylibre.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Bo-Chen Chen <rex-bc.chen@mediatek.com>, linux-mediatek@lists.infradead.org,
 wenst@chromium.org, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The dpi/dpintf driver and the added helper functions are required for
the DisplayPort driver to work.

This series is separated from [1] which is original from Guillaume.
The display port driver is [2].

Changes for v16:
1. Separate input_2pixel and pixels_per_iter to other patches.
2. Remove function "mtk_dpi_matrix_sel" and color_fmt_trans_support
   in patch "Add YUV422 output support".
3. Drop patches which are accepted.

Changes for v15:
1. Add a patch to remove support for output yuv422 for previous socs.
2. Only remain output format of reg888/yuv422 support for mt8195.
3. Adjust the order of patches.

Changes for v14:
1. Separate a new binding patch to modify mediatek string format.
2. Use GENMASK(4, 0) for INT_MATRIX_SEL_MASK in patch
   "Add YUV422 output support"
3. Change kernel doc description of support_direct_pin.
4. Change to use pixels_per_iter to control quantity of transferred
   pixels per iterration.

Changes for v13:
1. Change mediatek,mt8195-dp_intf to mediatek,mt8195-dp-intf.
2. Add kernel doc for mtk_dpi_conf.
3. Drop patch of tvd_pll enable.
4. Squash some color format transfer related patches.
5. Add new patch to support setting of direct connection to pins.
6. Change fix tag of "drm/mediatek: dpi: Only enable dpi after the bridge
   is enabled".

Changes for v12:
1. Remove pll_gate.
2. Add more detailed commit message.
3. Separate tvd_clk patch and yuv422 output support from add dpintf
   support patch
4. Remove limit patch and use common driver codes to determine this.

Changes for v11:
1. Rename ck_cg to pll_gate.
2. Add some commit message to clarify the modification reason.
3. Fix some driver order and modify for reviewers' comments.

[1]:https://lore.kernel.org/all/20220523104758.29531-1-granquet@baylibre.com/
[2]:https://lore.kernel.org/all/20220610105522.13449-1-rex-bc.chen@mediatek.com/

Bo-Chen Chen (4):
  drm/mediatek: dpi: Add YUV422 output support
  drm/mediatek: dpi: add config to support direct connection to dpi
    panels
  drm/mediatek: dpi: Add input_2pixel config support
  drm/mediatek: dpi: Add pixels_per_iter config support

Guillaume Ranquet (1):
  drm/mediatek: dpi: Add dp_intf support

 drivers/gpu/drm/mediatek/mtk_dpi.c          | 115 +++++++++++++++++---
 drivers/gpu/drm/mediatek/mtk_dpi_regs.h     |  18 +++
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c |   4 +
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |   1 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c      |   3 +
 5 files changed, 126 insertions(+), 15 deletions(-)

-- 
2.18.0

