Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A3C87F7F8
	for <lists+dri-devel@lfdr.de>; Tue, 19 Mar 2024 08:03:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59C8810ED8E;
	Tue, 19 Mar 2024 07:03:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="It8wqpj+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 817B510ED8E
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Mar 2024 07:03:04 +0000 (UTC)
X-UUID: b96e8ce8e5be11eeb8927bc1f75efef4-20240319
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=CGihiINE4jr8gwW1duxiJk5+r7phZbsvGQSK+VEZn4I=; 
 b=It8wqpj+soHhLdyvVywZ+cGjSrzvVZk9e0gvFvRdn2LM+0YyC/oPj8Us8mXWxdSTpD1h8QhbPK6m9PgZZI3AkjUppVCkelihvJm8cUY9XFNDlj03h+cMOCGbrYos5YsfKUo6DfFTBTg0zECFIxCzQYQEEMJ+dK5D6jYZRbw5UIY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37, REQID:2e21e8d4-2c35-4e30-a6fb-32619ef7fa7d, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:6f543d0, CLOUDID:e394aa81-4f93-4875-95e7-8c66ea833d57,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
 :1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: b96e8ce8e5be11eeb8927bc1f75efef4-20240319
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw01.mediatek.com (envelope-from <shawn.sung@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1389189189; Tue, 19 Mar 2024 15:03:01 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 19 Mar 2024 15:02:59 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 19 Mar 2024 15:02:59 +0800
From: Shawn Sung <shawn.sung@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
CC: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, <dri-devel@lists.freedesktop.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-media@vger.kernel.org>,
 <linaro-mm-sig@lists.linaro.org>, Hsiao Chien Sung
 <shawn.sung@mediatek.corp-partner.google.com>
Subject: [PATCH v2 03/14] drm/mediatek: Rename "mtk_drm_plane" to "mtk_plane"
Date: Tue, 19 Mar 2024 15:02:46 +0800
Message-ID: <20240319070257.6443-4-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240319070257.6443-1-shawn.sung@mediatek.com>
References: <20240319070257.6443-1-shawn.sung@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--4.098600-8.000000
X-TMASE-MatchedRID: LAlCrEnopVW4pD9RIlWSGjl/LoO+pjoA1cuIRwt/4Miaecho1pk4scbK
 +pu0ZYwRgaTV+OEAOBbnftxNodBrx9m0JHSAKf2wH5YQyOg71ZZMkOX0UoduuQqiCYa6w8tvVRr
 UWxu78PgR4d+Uvhl0qrBFBlMmSjdIVJTV35UngiOeAiCmPx4NwBnUJ0Ek6yhjxEHRux+uk8hxKp
 vEGAbTDkmgskU2xwom4nUm8qVokM2hiFLwKQlGCIxlvtHYclZPKo3q+Ki8Pg5JxT/D5r3nQKCq9
 RlDeyQisLfXuW/4bbAX+Mbl/tX/i3mVKZusLp922v9OjYWA2uMMswg45VMfPXY3pGDmoik6
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--4.098600-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 90AD28AA0EAABDA7594ED146C686DF9BDD5D64896D250B6A8035FE47413215262000:8
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

From: Hsiao Chien Sung <shawn.sung@mediatek.corp-partner.google.com>

Rename all "mtk_drm_plane" to "mtk_plane":
- To align the naming rule
- To reduce the code size

Reviewed-by: AngeloGiaocchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.corp-partner.google.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_plane.c | 6 +++---
 drivers/gpu/drm/mediatek/mtk_drm_plane.h | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.c b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
index cbdb70677d305..43137c46fc148 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_plane.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
@@ -93,8 +93,8 @@ static bool mtk_plane_format_mod_supported(struct drm_plane *plane,
 	return true;
 }
 
-static void mtk_drm_plane_destroy_state(struct drm_plane *plane,
-					struct drm_plane_state *state)
+static void mtk_plane_destroy_state(struct drm_plane *plane,
+				    struct drm_plane_state *state)
 {
 	__drm_atomic_helper_plane_destroy_state(state);
 	kfree(to_mtk_plane_state(state));
@@ -241,7 +241,7 @@ static const struct drm_plane_funcs mtk_plane_funcs = {
 	.destroy = drm_plane_cleanup,
 	.reset = mtk_plane_reset,
 	.atomic_duplicate_state = mtk_plane_duplicate_state,
-	.atomic_destroy_state = mtk_drm_plane_destroy_state,
+	.atomic_destroy_state = mtk_plane_destroy_state,
 	.format_mod_supported = mtk_plane_format_mod_supported,
 };
 
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.h b/drivers/gpu/drm/mediatek/mtk_drm_plane.h
index 99aff7da0831d..231bb7aac9473 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_plane.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.h
@@ -4,8 +4,8 @@
  * Author: CK Hu <ck.hu@mediatek.com>
  */
 
-#ifndef _MTK_DRM_PLANE_H_
-#define _MTK_DRM_PLANE_H_
+#ifndef _MTK_PLANE_H_
+#define _MTK_PLANE_H_
 
 #include <drm/drm_crtc.h>
 #include <linux/types.h>
-- 
2.18.0

