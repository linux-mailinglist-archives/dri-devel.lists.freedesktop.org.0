Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B134289ED4
	for <lists+dri-devel@lfdr.de>; Sat, 10 Oct 2020 09:09:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C9FE6EE8C;
	Sat, 10 Oct 2020 07:09:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2F9666EE8C
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Oct 2020 07:09:32 +0000 (UTC)
X-UUID: 9160f69c0f684fdba5d4d3874d373313-20201010
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=C40D6kRIOspyGH+GAWZ9vtsBg6ZMKOSD3x901/6t9jo=; 
 b=TgSGsnWlmLqe0iE2C6nOdongJJnb9lFTNJ/KJcDQzRctsYDayJwthbeQ2GjmKixX4wyGplgyHV1loLqLJNNwMF2hrlNb7PMkcBL9fcJku5ekbcE7t74skiRigKB9wdFtR3u8hFQzUBxxGZUax+Qojtil+jHnp3sL5HZixXN2Prc=;
X-UUID: 9160f69c0f684fdba5d4d3874d373313-20201010
Received: from mtkcas34.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 705913086; Sat, 10 Oct 2020 15:09:26 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS33N1.mediatek.inc
 (172.27.4.75) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Sat, 10 Oct 2020 15:09:24 +0800
Received: from mszsdaap41.gcn.mediatek.inc (10.16.6.141) by
 MTKCAS32.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Sat, 10 Oct 2020 15:09:23 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 1/2] Revert "drm/mediatek: dsi: Fix scrolling of panel with
 small hfp or hbp"
Date: Sat, 10 Oct 2020 15:09:09 +0800
Message-ID: <20201010070910.11294-2-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.12.5
In-Reply-To: <20201010070910.11294-1-jitao.shi@mediatek.com>
References: <20201010070910.11294-1-jitao.shi@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: D3BCC83A951E0A6A156273699799267B9A5C30B1482818190BB8C88026108A0A2000:8
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
Cc: devicetree@vger.kernel.org, Jitao Shi <jitao.shi@mediatek.com>,
 srv_heupstream@mediatek.com, huijuan.xie@mediatek.com, stonea168@163.com,
 cawa.cheng@mediatek.com, linux-mediatek@lists.infradead.org,
 yingjoe.chen@mediatek.com, eddie.huang@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This reverts commit 35bf948f1edbf507f6e57e0879fa6ea36d2d2930.

Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 80b7a082e874..16fd99dcdacf 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -466,13 +466,14 @@ static void mtk_dsi_config_vdo_timing(struct mtk_dsi *dsi)
 	horizontal_sync_active_byte = (vm->hsync_len * dsi_tmp_buf_bpp - 10);
 
 	if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE)
-		horizontal_backporch_byte = vm->hback_porch * dsi_tmp_buf_bpp;
+		horizontal_backporch_byte =
+			(vm->hback_porch * dsi_tmp_buf_bpp - 10);
 	else
-		horizontal_backporch_byte = (vm->hback_porch + vm->hsync_len) *
-					    dsi_tmp_buf_bpp;
+		horizontal_backporch_byte = ((vm->hback_porch + vm->hsync_len) *
+			dsi_tmp_buf_bpp - 10);
 
 	data_phy_cycles = timing->lpx + timing->da_hs_prepare +
-			  timing->da_hs_zero + timing->da_hs_exit;
+			  timing->da_hs_zero + timing->da_hs_exit + 3;
 
 	if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_BURST) {
 		if ((vm->hfront_porch + vm->hback_porch) * dsi_tmp_buf_bpp >
-- 
2.12.5
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
