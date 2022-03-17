Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFFA64DBE1A
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 06:18:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E31A010EC35;
	Thu, 17 Mar 2022 05:18:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BF4410EC36
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Mar 2022 05:18:42 +0000 (UTC)
X-UUID: dde2b11c55ad4989adfa33422d3f638f-20220317
X-UUID: dde2b11c55ad4989adfa33422d3f638f-20220317
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw01.mediatek.com (envelope-from <rex-bc.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1579895920; Thu, 17 Mar 2022 13:18:33 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 17 Mar 2022 13:18:32 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 17 Mar 2022 13:18:32 +0800
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: <chunkuang.hu@kernel.org>, <matthias.bgg@gmail.com>, <robh+dt@kernel.org>
Subject: [PATCH V9 0/5] add display support for MediaTek SoC MT8186
Date: Thu, 17 Mar 2022 13:18:26 +0800
Message-ID: <20220317051831.7107-1-rex-bc.chen@mediatek.com>
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
Cc: devicetree@vger.kernel.org, krzysztof.kozlowski@canonical.com,
 airlied@linux.ie, jassisinghbrar@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, yongqiang.niu@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com, fparent@baylibre.com,
 linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 Rex-BC Chen <rex-bc.chen@mediatek.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

v9:
1. Revise [1/5] dt-bindings: display: mediatek: add aal binding for MT8183.

v8:
1. Revise [1/5] dt-bindings: display: mediatek: add aal binding for MT8183.

v7:
1. Rebase to chunkuang.hu/linux.git mediatek-drm-fixes

v6:
1. Remove mmsys patches which are accepted.
2. Fix error of dt-binding.

v5:
1. Add binding patch of aal for MT8183.
2. Revise enum to const.
3. Change to use enum for mutex.
4. Remove patches which are accepted by maintainers. (mmsys and mutex)

v4:
1. Remove binding of dsi and dpi.
2. Revise aal binding.
3. Fix indention in [4/5].

v3:
1. Modify display binding based on mtk display binding patch. ([1])
2. Remove patch: drm/mediatek: separate postmask component from mtk_disp_drv.c
3. Remove compatible of 8186 ovl because we can re-use compatible of 8192 for 8186.
4. Fix issue of space before tab on mutex patch.

[1]: https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/commit/?h=mediatek-drm-next&id=4ed545e7d10049b5492afc184e61a67e478a2cfd

v2:
1. Add binding documentation for mmsys, mutex and mtk_display.
2. Remove duplicated definition of postmask registers on mtk_drm_drv.
3. Add disp_ovl support for MT8186.
4. Add detailed commit messages.

Rex-BC Chen (4):
  dt-bindings: display: mediatek: add aal binding for MT8183
  dt-bindings: display: mediatek: revise enum to const
  dt-bindings: display: mediatek: change to use enum for mutex
  dt-bindings: display: mediatek: add MT8186 SoC binding

Yongqiang Niu (1):
  drm/mediatek: add display support for MT8186

 .../display/mediatek/mediatek,aal.yaml        | 10 ++++--
 .../display/mediatek/mediatek,ccorr.yaml      |  5 ++-
 .../display/mediatek/mediatek,color.yaml      |  7 ++--
 .../display/mediatek/mediatek,dither.yaml     |  4 +--
 .../display/mediatek/mediatek,gamma.yaml      |  4 +--
 .../display/mediatek/mediatek,mutex.yaml      | 25 ++++++--------
 .../display/mediatek/mediatek,ovl-2l.yaml     |  4 +++
 .../display/mediatek/mediatek,ovl.yaml        |  8 +++--
 .../display/mediatek/mediatek,postmask.yaml   |  4 +++
 .../display/mediatek/mediatek,rdma.yaml       |  7 ++--
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        | 33 +++++++++++++++++++
 11 files changed, 77 insertions(+), 34 deletions(-)

-- 
2.18.0

