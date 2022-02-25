Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E834C41CB
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 10:54:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AA7710E4AC;
	Fri, 25 Feb 2022 09:54:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFC8810E370
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Feb 2022 09:54:03 +0000 (UTC)
X-UUID: 1a8b16150ca44b63b0207fdef9faede8-20220225
X-UUID: 1a8b16150ca44b63b0207fdef9faede8-20220225
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw01.mediatek.com (envelope-from <xinlei.lee@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1201820668; Fri, 25 Feb 2022 17:53:59 +0800
Received: from MTKMBS34N1.mediatek.inc (172.27.4.172) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 25 Feb 2022 17:53:57 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS34N1.mediatek.inc
 (172.27.4.172) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 25 Feb 2022 17:53:57 +0800
Received: from mszsdaap41.gcn.mediatek.inc (10.16.6.141) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Fri, 25 Feb 2022 17:53:56 +0800
From: <xinlei.lee@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <matthias.bgg@gmail.com>
Subject: [PATCH v1,0/3] Add TOPCKGEN control dpi_clk and mt8186 dpi
Date: Fri, 25 Feb 2022 17:53:50 +0800
Message-ID: <1645782833-27875-1-git-send-email-xinlei.lee@mediatek.com>
X-Mailer: git-send-email 2.6.4
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
Cc: jitao.shi@mediatek.com, allen-kh.cheng@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, rex-bc.chen@mediatek.com,
 linux-arm-kernel@lists.infradead.org, Xinlei Lee <xinlei.lee@mediatek.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Xinlei Lee <xinlei.lee@mediatek.com>

TOPCKGEN's control of dpi_clk was added in this series because in this
patch:
http://lists.infradead.org/pipermail/linux-mediatek/2016-May/005281.html
Give CCF-controlled TOPCKGEN to dpi driver control, as described below:
The dpi0_sel clock should not propagate rate changes to its parent clock
so the dpi driver can have full control over PLL and divider.
This requires corresponding modifications in dpi_driver.

Change-Id: Id5182cc64a71e15f5326a95310c3296967d0693f

Xinlei Lee (3):
  dt-bindings: display: mediatek: dpi: Add compatible for MediaTek
    MT8186
  drm/mediatek: Add TOPCKGEN select mux control dpi_clk
  drm/mediatek: Add mt8186 dpi compatible to mtk_dpi.c

 .../display/mediatek/mediatek,dpi.yaml        |  1 +
 drivers/gpu/drm/mediatek/mtk_dpi.c            | 49 +++++++++++++++++--
 2 files changed, 46 insertions(+), 4 deletions(-)

-- 
2.18.0

