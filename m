Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7523B48D139
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jan 2022 05:11:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFA5110F6F6;
	Thu, 13 Jan 2022 04:11:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1C3A10F6F1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jan 2022 04:11:07 +0000 (UTC)
X-UUID: 05d3e1f81ad741458731bc7ef37b53ec-20220113
X-UUID: 05d3e1f81ad741458731bc7ef37b53ec-20220113
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
 (envelope-from <yunfei.dong@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 879275838; Thu, 13 Jan 2022 12:11:05 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 13 Jan 2022 12:11:03 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 13 Jan 2022 12:11:02 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>, Alexandre Courbot
 <acourbot@chromium.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Tzung-Bi
 Shih <tzungbi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>
Subject: [PATCH v19, 04/19] media: mtk-vcodec: export decoder pm functions
Date: Thu, 13 Jan 2022 12:10:40 +0800
Message-ID: <20220113041055.25213-5-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220113041055.25213-1-yunfei.dong@mediatek.com>
References: <20220113041055.25213-1-yunfei.dong@mediatek.com>
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
Cc: Irui Wang <irui.wang@mediatek.com>, George Sun <george.sun@mediatek.com>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>, srv_heupstream@mediatek.com,
 devicetree@vger.kernel.org, Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>,
 Xiaoyong Lu <xiaoyong.lu@mediatek.com>, linux-mediatek@lists.infradead.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Steve Cho <stevecho@chromium.org>, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When mtk vcodec decoder is build as a module, we need to export
mtk-vcodec-dec pm functions to make them visible by the other components.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
index 5ba54bb813c8..64535d33bff8 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
@@ -76,12 +76,14 @@ int mtk_vcodec_init_dec_pm(struct platform_device *pdev, struct mtk_vcodec_pm *p
 	put_device(pm->larbvdec);
 	return ret;
 }
+EXPORT_SYMBOL_GPL(mtk_vcodec_init_dec_pm);
 
 void mtk_vcodec_release_dec_pm(struct mtk_vcodec_pm *pm)
 {
 	pm_runtime_disable(pm->dev);
 	put_device(pm->larbvdec);
 }
+EXPORT_SYMBOL_GPL(mtk_vcodec_release_dec_pm);
 
 int mtk_vcodec_dec_pw_on(struct mtk_vcodec_pm *pm)
 {
@@ -93,6 +95,7 @@ int mtk_vcodec_dec_pw_on(struct mtk_vcodec_pm *pm)
 
 	return ret;
 }
+EXPORT_SYMBOL_GPL(mtk_vcodec_dec_pw_on);
 
 void mtk_vcodec_dec_pw_off(struct mtk_vcodec_pm *pm)
 {
@@ -102,6 +105,7 @@ void mtk_vcodec_dec_pw_off(struct mtk_vcodec_pm *pm)
 	if (ret)
 		mtk_v4l2_err("pm_runtime_put_sync fail %d", ret);
 }
+EXPORT_SYMBOL_GPL(mtk_vcodec_dec_pw_off);
 
 void mtk_vcodec_dec_clock_on(struct mtk_vcodec_pm *pm)
 {
@@ -128,6 +132,7 @@ void mtk_vcodec_dec_clock_on(struct mtk_vcodec_pm *pm)
 	for (i -= 1; i >= 0; i--)
 		clk_disable_unprepare(dec_clk->clk_info[i].vcodec_clk);
 }
+EXPORT_SYMBOL_GPL(mtk_vcodec_dec_clock_on);
 
 void mtk_vcodec_dec_clock_off(struct mtk_vcodec_pm *pm)
 {
@@ -138,3 +143,4 @@ void mtk_vcodec_dec_clock_off(struct mtk_vcodec_pm *pm)
 	for (i = dec_clk->clk_num - 1; i >= 0; i--)
 		clk_disable_unprepare(dec_clk->clk_info[i].vcodec_clk);
 }
+EXPORT_SYMBOL_GPL(mtk_vcodec_dec_clock_off);
-- 
2.25.1

