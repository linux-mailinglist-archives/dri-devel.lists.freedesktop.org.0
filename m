Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF7C5BAE5A
	for <lists+dri-devel@lfdr.de>; Fri, 16 Sep 2022 15:39:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A80610ED3B;
	Fri, 16 Sep 2022 13:38:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46BD210ED3B
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Sep 2022 13:38:30 +0000 (UTC)
X-UUID: 040ff4831cfd42468ee16e9419cb2095-20220916
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=hoRjnQP+iJgX3vDZVUJNXCXH+t6RhqgwPTXsIfV7CNY=; 
 b=crHHXGdNMVwygRgPz596IVf5M0JicW0lBrJPbMI5pw+Bx2SvUIxOvrqcIXqOAHUHJU+uE/ur5u8Nml4litfpSyrTjymwNt1NVORPjP4L/JhGkvchAjMvyCpImj1vDAMy1rY1XZWHkB8XMDOHtTAy1glgbg+T/K4LqWfFm6y3Vww=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11, REQID:d55f8d61-1057-4d52-9cb4-e81601c8f5df, IP:0,
 U
 RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:90
X-CID-INFO: VERSION:1.1.11, REQID:d55f8d61-1057-4d52-9cb4-e81601c8f5df, IP:0,
 URL
 :0,TC:0,Content:-5,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTIO
 N:quarantine,TS:90
X-CID-META: VersionHash:39a5ff1, CLOUDID:2a96aaf6-6e85-48d9-afd8-0504bbfe04cb,
 B
 ulkID:220916213826DCFQSS47,BulkQuantity:0,Recheck:0,SF:28|17|19|48|823|824
 ,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL
 :0
X-UUID: 040ff4831cfd42468ee16e9419cb2095-20220916
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 992509251; Fri, 16 Sep 2022 21:38:24 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 16 Sep 2022 21:38:23 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 16 Sep 2022 21:38:23 +0800
From: Bo-Chen Chen <rex-bc.chen@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@linux.ie>
Subject: [PATCH v2 1/3] drm/mediatek: dp: Reduce indentation in
 mtk_dp_bdg_detect()
Date: Fri, 16 Sep 2022 21:38:19 +0800
Message-ID: <20220916133821.27980-2-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220916133821.27980-1-rex-bc.chen@mediatek.com>
References: <20220916133821.27980-1-rex-bc.chen@mediatek.com>
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
Cc: granquet@baylibre.com, jitao.shi@mediatek.com, liangxu.xu@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 Bo-Chen Chen <rex-bc.chen@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In order to improve human readability, reduce the indentation by
returning early if the dp/edp cable is not plugged in.

Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_dp.c | 66 ++++++++++++++++---------------
 1 file changed, 34 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index dfa942ca62da..c72c646e25e9 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -1933,39 +1933,41 @@ static enum drm_connector_status mtk_dp_bdg_detect(struct drm_bridge *bridge)
 	bool enabled = mtk_dp->enabled;
 	u8 sink_count = 0;
 
-	if (mtk_dp->train_info.cable_plugged_in) {
-		if (!enabled) {
-			/* power on aux */
-			mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE,
-					   DP_PWR_STATE_BANDGAP_TPLL_LANE,
-					   DP_PWR_STATE_MASK);
-
-			/* power on panel */
-			drm_dp_dpcd_writeb(&mtk_dp->aux, DP_SET_POWER, DP_SET_POWER_D0);
-			usleep_range(2000, 5000);
-		}
-		/*
-		 * Some dongles still source HPD when they do not connect to any
-		 * sink device. To avoid this, we need to read the sink count
-		 * to make sure we do connect to sink devices. After this detect
-		 * function, we just need to check the HPD connection to check
-		 * whether we connect to a sink device.
-		 */
-		drm_dp_dpcd_readb(&mtk_dp->aux, DP_SINK_COUNT, &sink_count);
-		if (DP_GET_SINK_COUNT(sink_count))
-			ret = connector_status_connected;
-
-		if (!enabled) {
-			/* power off panel */
-			drm_dp_dpcd_writeb(&mtk_dp->aux, DP_SET_POWER, DP_SET_POWER_D3);
-			usleep_range(2000, 3000);
-
-			/* power off aux */
-			mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE,
-					   DP_PWR_STATE_BANDGAP_TPLL,
-					   DP_PWR_STATE_MASK);
-		}
+	if (!mtk_dp->train_info.cable_plugged_in)
+		return ret;
+
+	if (!enabled) {
+		/* power on aux */
+		mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE,
+				   DP_PWR_STATE_BANDGAP_TPLL_LANE,
+				   DP_PWR_STATE_MASK);
+
+		/* power on panel */
+		drm_dp_dpcd_writeb(&mtk_dp->aux, DP_SET_POWER, DP_SET_POWER_D0);
+		usleep_range(2000, 5000);
 	}
+	/*
+	 * Some dongles still source HPD when they do not connect to any
+	 * sink device. To avoid this, we need to read the sink count
+	 * to make sure we do connect to sink devices. After this detect
+	 * function, we just need to check the HPD connection to check
+	 * whether we connect to a sink device.
+	 */
+	drm_dp_dpcd_readb(&mtk_dp->aux, DP_SINK_COUNT, &sink_count);
+	if (DP_GET_SINK_COUNT(sink_count))
+		ret = connector_status_connected;
+
+	if (!enabled) {
+		/* power off panel */
+		drm_dp_dpcd_writeb(&mtk_dp->aux, DP_SET_POWER, DP_SET_POWER_D3);
+		usleep_range(2000, 3000);
+
+		/* power off aux */
+		mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE,
+				   DP_PWR_STATE_BANDGAP_TPLL,
+				   DP_PWR_STATE_MASK);
+	}
+
 	return ret;
 }
 
-- 
2.18.0

