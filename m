Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F7722A946
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jul 2020 09:03:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21DDC6E353;
	Thu, 23 Jul 2020 07:03:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 301 seconds by postgrey-1.36 at gabe;
 Thu, 23 Jul 2020 02:09:46 UTC
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTP id 492C66E03A
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jul 2020 02:09:46 +0000 (UTC)
X-UUID: 37846e38e6154bd4a32b9135f1a1732c-20200723
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=e5iSRY4VliKQs90FY/j7EHQD5eERa91+EY28FFLkydA=; 
 b=FiaEZ+RHglj5btdVr3Auaj+2XheVUaJZzv5yfdIDQHX6NuVLTW1CCo+67D1loHFA/QZioFP+FMzpeegegC14GkQQjD6FrvyaqcMRmzP24f6ccczZtmsUjdBU9JJyiIA7/ScvsdrJxi+fXr7FMxVXuB0w1Mto8aC2U2HIKdSPqBo=;
X-UUID: 37846e38e6154bd4a32b9135f1a1732c-20200723
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw02.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 993325964; Thu, 23 Jul 2020 10:04:42 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 23 Jul 2020 10:04:41 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 23 Jul 2020 10:04:37 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob
 Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [v7,
 PATCH 1/7] drm/mediatek: move ddp component defint into mtk_mmsys.h
Date: Thu, 23 Jul 2020 10:03:12 +0800
Message-ID: <1595469798-3824-2-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1595469798-3824-1-git-send-email-yongqiang.niu@mediatek.com>
References: <1595469798-3824-1-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-Mailman-Approved-At: Thu, 23 Jul 2020 07:03:15 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

move ddp component defint into mtk_mmsys.h

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h | 34 +----------------------------
 drivers/soc/mediatek/mtk-mmsys.c            |  4 +---
 include/linux/soc/mediatek/mtk-mmsys.h      | 33 ++++++++++++++++++++++++++++
 3 files changed, 35 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
index debe363..161201f 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
@@ -7,6 +7,7 @@
 #define MTK_DRM_DDP_COMP_H
 
 #include <linux/io.h>
+#include <linux/soc/mediatek/mtk-mmsys.h>
 
 struct device;
 struct device_node;
@@ -35,39 +36,6 @@ enum mtk_ddp_comp_type {
 	MTK_DDP_COMP_TYPE_MAX,
 };
 
-enum mtk_ddp_comp_id {
-	DDP_COMPONENT_AAL0,
-	DDP_COMPONENT_AAL1,
-	DDP_COMPONENT_BLS,
-	DDP_COMPONENT_CCORR,
-	DDP_COMPONENT_COLOR0,
-	DDP_COMPONENT_COLOR1,
-	DDP_COMPONENT_DITHER,
-	DDP_COMPONENT_DPI0,
-	DDP_COMPONENT_DPI1,
-	DDP_COMPONENT_DSI0,
-	DDP_COMPONENT_DSI1,
-	DDP_COMPONENT_DSI2,
-	DDP_COMPONENT_DSI3,
-	DDP_COMPONENT_GAMMA,
-	DDP_COMPONENT_OD0,
-	DDP_COMPONENT_OD1,
-	DDP_COMPONENT_OVL0,
-	DDP_COMPONENT_OVL_2L0,
-	DDP_COMPONENT_OVL_2L1,
-	DDP_COMPONENT_OVL1,
-	DDP_COMPONENT_PWM0,
-	DDP_COMPONENT_PWM1,
-	DDP_COMPONENT_PWM2,
-	DDP_COMPONENT_RDMA0,
-	DDP_COMPONENT_RDMA1,
-	DDP_COMPONENT_RDMA2,
-	DDP_COMPONENT_UFOE,
-	DDP_COMPONENT_WDMA0,
-	DDP_COMPONENT_WDMA1,
-	DDP_COMPONENT_ID_MAX,
-};
-
 struct mtk_ddp_comp;
 struct cmdq_pkt;
 struct mtk_ddp_comp_funcs {
diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index a55f255..36ad66b 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -5,13 +5,11 @@
  */
 
 #include <linux/device.h>
+#include <linux/io.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/soc/mediatek/mtk-mmsys.h>
 
-#include "../../gpu/drm/mediatek/mtk_drm_ddp.h"
-#include "../../gpu/drm/mediatek/mtk_drm_ddp_comp.h"
-
 #define DISP_REG_CONFIG_DISP_OVL0_MOUT_EN	0x040
 #define DISP_REG_CONFIG_DISP_OVL1_MOUT_EN	0x044
 #define DISP_REG_CONFIG_DISP_OD_MOUT_EN		0x048
diff --git a/include/linux/soc/mediatek/mtk-mmsys.h b/include/linux/soc/mediatek/mtk-mmsys.h
index 7bab5d9..2228bf6 100644
--- a/include/linux/soc/mediatek/mtk-mmsys.h
+++ b/include/linux/soc/mediatek/mtk-mmsys.h
@@ -9,6 +9,39 @@
 enum mtk_ddp_comp_id;
 struct device;
 
+enum mtk_ddp_comp_id {
+	DDP_COMPONENT_AAL0,
+	DDP_COMPONENT_AAL1,
+	DDP_COMPONENT_BLS,
+	DDP_COMPONENT_CCORR,
+	DDP_COMPONENT_COLOR0,
+	DDP_COMPONENT_COLOR1,
+	DDP_COMPONENT_DITHER,
+	DDP_COMPONENT_DPI0,
+	DDP_COMPONENT_DPI1,
+	DDP_COMPONENT_DSI0,
+	DDP_COMPONENT_DSI1,
+	DDP_COMPONENT_DSI2,
+	DDP_COMPONENT_DSI3,
+	DDP_COMPONENT_GAMMA,
+	DDP_COMPONENT_OD0,
+	DDP_COMPONENT_OD1,
+	DDP_COMPONENT_OVL0,
+	DDP_COMPONENT_OVL_2L0,
+	DDP_COMPONENT_OVL_2L1,
+	DDP_COMPONENT_OVL1,
+	DDP_COMPONENT_PWM0,
+	DDP_COMPONENT_PWM1,
+	DDP_COMPONENT_PWM2,
+	DDP_COMPONENT_RDMA0,
+	DDP_COMPONENT_RDMA1,
+	DDP_COMPONENT_RDMA2,
+	DDP_COMPONENT_UFOE,
+	DDP_COMPONENT_WDMA0,
+	DDP_COMPONENT_WDMA1,
+	DDP_COMPONENT_ID_MAX,
+};
+
 void mtk_mmsys_ddp_connect(struct device *dev,
 			   enum mtk_ddp_comp_id cur,
 			   enum mtk_ddp_comp_id next);
-- 
1.8.1.1.dirty
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
