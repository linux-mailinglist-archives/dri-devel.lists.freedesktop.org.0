Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C59BA3CB2A9
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jul 2021 08:32:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B57806E920;
	Fri, 16 Jul 2021 06:32:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FACE6E913
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jul 2021 06:32:31 +0000 (UTC)
X-UUID: 70b33d81283f4b4cbc426b167f3e57b6-20210716
X-UUID: 70b33d81283f4b4cbc426b167f3e57b6-20210716
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 966662236; Fri, 16 Jul 2021 14:32:28 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 16 Jul 2021 14:32:26 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 16 Jul 2021 14:32:25 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH v3, 0/3] drm/mediatek: Separate aal module
Date: Fri, 16 Jul 2021 14:32:20 +0800
Message-ID: <1626417143-8015-1-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
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
Cc: devicetree@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 David Airlie <airlied@linux.ie>, Jassi Brar <jassisinghbrar@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>,
 Fabien Parent <fparent@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Change since v2:
- skip aal in mtk_ddp_comp_init

Yongqiang Niu (3):
  drm/mediatek: Separate aal module
  drm/mediatek: add mt8183 aal support
  arm64: dts: mt8183: refine aal compatible name

 arch/arm64/boot/dts/mediatek/mt8183.dtsi    |   3 +-
 drivers/gpu/drm/mediatek/Makefile           |   3 +-
 drivers/gpu/drm/mediatek/mtk_disp_aal.c     | 167 ++++++++++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_disp_drv.h     |   9 ++
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c |  42 +------
 drivers/gpu/drm/mediatek/mtk_drm_drv.c      |   8 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.h      |   1 +
 7 files changed, 190 insertions(+), 43 deletions(-)
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_aal.c

-- 
1.8.1.1.dirty

