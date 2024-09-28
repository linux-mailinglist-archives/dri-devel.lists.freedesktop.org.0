Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B222898904A
	for <lists+dri-devel@lfdr.de>; Sat, 28 Sep 2024 18:16:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FB6D10E232;
	Sat, 28 Sep 2024 16:16:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="L9JESVzo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 074B110E228
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Sep 2024 16:15:56 +0000 (UTC)
X-UUID: ece9967e7db411ef8b96093e013ec31c-20240929
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=k+FloIWMtHZZm4aATcGYsWZCs+EV07E0DjiRL95KXi4=; 
 b=L9JESVzod4ZXnUihMLwfNaSDRfhnDl+rYk64Yu9jZlYlMMj3uRvHHV3cKMGE8GbYAb5BdDFN86ZU6GW/ZLGqjLv6vM03kK0Oe8d8DrAenMiDe52v1WsPyCYxjOwu/GmmSktbu4JNv5vuuUTIw349CbwdEfW9fVW6zI7pp8kxz0c=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41, REQID:5368883c-6c84-4cff-9b7d-bca26a39a957, IP:0,
 U
 RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:-5
X-CID-META: VersionHash:6dc6a47, CLOUDID:fada6518-b42d-49a6-94d2-a75fa0df01d2,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
 :1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: ece9967e7db411ef8b96093e013ec31c-20240929
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1249426946; Sun, 29 Sep 2024 00:15:49 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sat, 28 Sep 2024 09:15:48 -0700
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sun, 29 Sep 2024 00:15:48 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Alper Nebi Yasak <alpernebiyasak@gmail.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
CC: Shawn Sung <shawn.sung@mediatek.com>, <dri-devel@lists.freedesktop.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, "Jason-JH . Lin"
 <jason-jh.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, Nancy
 Lin <nancy.lin@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v8 1/3] drm/mediatek: ovl: Remove the color format comment for
 ovl_fmt_convert()
Date: Sun, 29 Sep 2024 00:15:44 +0800
Message-ID: <20240928161546.9285-2-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240928161546.9285-1-jason-jh.lin@mediatek.com>
References: <20240928161546.9285-1-jason-jh.lin@mediatek.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since we changed MACROs to be consistent with DRM input color format
naming, the comment for ovl_fmt_conver() is no longer needed.

Fixes: 9f428b95ac89 ("drm/mediatek: Add new color format MACROs in OVL")
Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index 89b439dcf3a6..4a4bc27a67f0 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -389,11 +389,6 @@ void mtk_ovl_layer_off(struct device *dev, unsigned int idx,
 static unsigned int ovl_fmt_convert(struct mtk_disp_ovl *ovl, unsigned int fmt,
 				    unsigned int blend_mode)
 {
-	/* The return value in switch "MEM_MODE_INPUT_FORMAT_XXX"
-	 * is defined in mediatek HW data sheet.
-	 * The alphabet order in XXX is no relation to data
-	 * arrangement in memory.
-	 */
 	switch (fmt) {
 	default:
 	case DRM_FORMAT_RGB565:
-- 
2.43.0

