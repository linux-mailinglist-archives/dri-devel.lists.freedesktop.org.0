Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37BD049F8E9
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jan 2022 13:07:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BF3310E3C6;
	Fri, 28 Jan 2022 12:07:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5551310E398
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jan 2022 12:07:26 +0000 (UTC)
X-UUID: 686009ec37ba427bb52f2eeb8bb912f7-20220128
X-UUID: 686009ec37ba427bb52f2eeb8bb912f7-20220128
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw02.mediatek.com (envelope-from <yongqiang.niu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 39610135; Fri, 28 Jan 2022 20:07:21 +0800
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 28 Jan 2022 20:07:20 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 28 Jan 2022 20:07:20 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 28 Jan 2022 20:07:19 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH v1, 0/4] add display support for mediatek SOC MT8186
Date: Fri, 28 Jan 2022 20:07:14 +0800
Message-ID: <20220128120718.30545-1-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
 Project_Global_Chrome_Upstream_Group@mediatek.com, David
 Airlie <airlied@linux.ie>, Jassi Brar <jassisinghbrar@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>,
 Fabien Parent <fparent@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Yongqiang Niu (4):
  soc: mediatek: mmsys: Add mt8186 mmsys routing table
  soc: mediatek: add mtk mutex support for MT8186
  drm/mediatek: split postmask component
  drm/mediatek: add mt8186 display support

 drivers/gpu/drm/mediatek/Makefile            |   1 +
 drivers/gpu/drm/mediatek/mtk_disp_drv.h      |   8 +
 drivers/gpu/drm/mediatek/mtk_disp_postmask.c | 155 +++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c  |  30 +---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c       |  41 +++++
 drivers/gpu/drm/mediatek/mtk_drm_drv.h       |   1 +
 drivers/soc/mediatek/mt8186-mmsys.h          | 113 ++++++++++++++
 drivers/soc/mediatek/mtk-mmsys.c             |  11 ++
 drivers/soc/mediatek/mtk-mutex.c             |  45 ++++++
 9 files changed, 378 insertions(+), 27 deletions(-)
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_postmask.c
 create mode 100644 drivers/soc/mediatek/mt8186-mmsys.h

-- 
2.25.1

