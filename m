Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B13EA49E549
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 15:57:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 315AD10EEDB;
	Thu, 27 Jan 2022 14:57:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D155C10E30F
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 11:43:02 +0000 (UTC)
X-UUID: 6c5a1d64556d4b0fad0377b4c7bf2c42-20220127
X-UUID: 6c5a1d64556d4b0fad0377b4c7bf2c42-20220127
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw02.mediatek.com
 (envelope-from <xinlei.lee@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1983196097; Thu, 27 Jan 2022 19:42:58 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by mtkmbs10n1.mediatek.inc
 (172.21.101.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.15; Thu, 27 Jan
 2022 19:42:57 +0800
Received: from mszsdaap41.gcn.mediatek.inc (10.16.6.141) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Thu, 27 Jan 2022 19:42:55 +0800
From: <xinlei.lee@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <matthias.bgg@gmail.com>
Subject: [v1, 0/3] Add mt8186 dsi compatoble & Move the getting bridge node
 function
Date: Thu, 27 Jan 2022 19:42:50 +0800
Message-ID: <1643283773-7081-1-git-send-email-xinlei.lee@mediatek.com>
X-Mailer: git-send-email 2.6.4
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-Mailman-Approved-At: Thu, 27 Jan 2022 14:57:22 +0000
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
Cc: jitao.shi@mediatek.com, xinlei lee <xinlei.lee@mediatek.com>,
 srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: xinlei lee <xinlei.lee@mediatek.com>

The modification is based on avoiding screen shift:
https://patchwork.kernel.org/project/linux-mediatek/cover/20220114092110.12137-1-rex-bc.chen@mediatek.com/

xinlei lee (3):
  dt-bindings: display: mediatek: dsi: add documentation for MT8186 SoC
  drm/mediatek: Add mt8186 dsi compatible to mtk_dsi.c
  drm/mediatek: Move the getting bridge node function to mtk_dsi_bind

 .../bindings/display/mediatek/mediatek,dsi.txt     |  2 +-
 drivers/gpu/drm/mediatek/mtk_dsi.c                 | 37 ++++++++++++++--------
 2 files changed, 24 insertions(+), 15 deletions(-)

-- 
2.6.4

