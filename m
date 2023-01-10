Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90CD7663C86
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 10:16:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9CCA10E570;
	Tue, 10 Jan 2023 09:16:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B661A10E570
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 09:16:53 +0000 (UTC)
X-UUID: fa10b7af4f5c49b5ae1258a0217371a9-20230110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=Z5SWkjHFUcPB57dyxsSgJTsbrRzl7x0XxIf/mFqL7yw=; 
 b=j7Pf0BJc2MoPMybzbx1S16kARn8UrWorsWxdfOR1Yl9QFMHp1yTfZio3BOWMdDjI9fP5jrzpyIccWfI79mRB3XRD+qO57mcGsRCXZUWELzTTJnaZRhiHAqTeyMflABZAcqw6MMawCKl4AqBdWdYbCfeHto8AgTcZh886JjY7eO8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17, REQID:bdd86dd3-3a10-4946-8296-8c6bce57a676, IP:0,
 U
 RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:90
X-CID-INFO: VERSION:1.1.17, REQID:bdd86dd3-3a10-4946-8296-8c6bce57a676, IP:0,
 URL
 :0,TC:0,Content:-5,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTIO
 N:quarantine,TS:90
X-CID-META: VersionHash:543e81c, CLOUDID:ac4d62f5-ff42-4fb0-b929-626456a83c14,
 B
 ulkID:230110171651TYF6DIFR,BulkQuantity:0,Recheck:0,SF:38|28|17|19|48,TC:n
 il,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
 I:0,OSA:0
X-CID-BVR: 0,NGT
X-UUID: fa10b7af4f5c49b5ae1258a0217371a9-20230110
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw01.mediatek.com (envelope-from <miles.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 548763566; Tue, 10 Jan 2023 17:16:50 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Tue, 10 Jan 2023 17:16:49 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 10 Jan 2023 17:16:49 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH] drm/mediatek: include missing headers
Date: Tue, 10 Jan 2023 17:16:46 +0800
Message-ID: <20230110091647.13265-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
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
Cc: linux-arm-kernel@lists.infradead.org, Miles Chen <miles.chen@mediatek.com>,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the follow sparse warnings by adding missing headers:

drivers/gpu/drm/mediatek/mtk_cec.c:251:24: sparse: warning: symbol 'mtk_cec_driver' was not declared. Should it be static?
drivers/gpu/drm/mediatek/mtk_disp_ccorr.c:221:24: sparse: warning: symbol 'mtk_disp_ccorr_driver' was not declared. Should it be static?
drivers/gpu/drm/mediatek/mtk_disp_rdma.c:390:24: sparse: warning: symbol 'mtk_disp_rdma_driver' was not declared. Should it be static?
drivers/gpu/drm/mediatek/mtk_disp_gamma.c:209:24: sparse: warning: symbol 'mtk_disp_gamma_driver' was not declared. Should it be static?
drivers/gpu/drm/mediatek/mtk_disp_ovl.c:565:24: sparse: warning: symbol 'mtk_disp_ovl_driver' was not declared. Should it be static?
drivers/gpu/drm/mediatek/mtk_disp_color.c:164:24: sparse: warning: symbol 'mtk_disp_color_driver' was not declared. Should it be static?
drivers/gpu/drm/mediatek/mtk_disp_aal.c:161:24: sparse: warning: symbol 'mtk_disp_aal_driver' was not declared. Should it be static?
drivers/gpu/drm/mediatek/mtk_dpi.c:1109:24: sparse: warning: symbol 'mtk_dpi_driver' was not declared. Should it be static?
drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c:340:24: sparse: warning: symbol 'mtk_hdmi_ddc_driver' was not declared. Should it be static?
drivers/gpu/drm/mediatek/mtk_dsi.c:1223:24: sparse: warning: symbol 'mtk_dsi_driver' was not declared. Should it be static?

Signed-off-by: Miles Chen <miles.chen@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_cec.c        | 2 ++
 drivers/gpu/drm/mediatek/mtk_disp_aal.c   | 1 +
 drivers/gpu/drm/mediatek/mtk_disp_ccorr.c | 1 +
 drivers/gpu/drm/mediatek/mtk_disp_color.c | 1 +
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c | 1 +
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c   | 1 +
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c  | 1 +
 drivers/gpu/drm/mediatek/mtk_dpi.c        | 1 +
 drivers/gpu/drm/mediatek/mtk_dsi.c        | 1 +
 drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c   | 3 +++
 10 files changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_cec.c b/drivers/gpu/drm/mediatek/mtk_cec.c
index cdfa648910b2..b640bc0559e7 100644
--- a/drivers/gpu/drm/mediatek/mtk_cec.c
+++ b/drivers/gpu/drm/mediatek/mtk_cec.c
@@ -12,6 +12,8 @@
 #include <linux/platform_device.h>
 
 #include "mtk_cec.h"
+#include "mtk_hdmi.h"
+#include "mtk_drm_drv.h"
 
 #define TR_CONFIG		0x00
 #define CLEAR_CEC_IRQ			BIT(15)
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_aal.c b/drivers/gpu/drm/mediatek/mtk_disp_aal.c
index 0f9d7efb61d7..434e8a9ce8ab 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_aal.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_aal.c
@@ -14,6 +14,7 @@
 #include "mtk_disp_drv.h"
 #include "mtk_drm_crtc.h"
 #include "mtk_drm_ddp_comp.h"
+#include "mtk_drm_drv.h"
 
 #define DISP_AAL_EN				0x0000
 #define AAL_EN						BIT(0)
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c b/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
index 3a53ebc4e172..1773379b2439 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
@@ -14,6 +14,7 @@
 #include "mtk_disp_drv.h"
 #include "mtk_drm_crtc.h"
 #include "mtk_drm_ddp_comp.h"
+#include "mtk_drm_drv.h"
 
 #define DISP_CCORR_EN				0x0000
 #define CCORR_EN					BIT(0)
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_color.c b/drivers/gpu/drm/mediatek/mtk_disp_color.c
index 473f5bb5cbad..cac9206079e7 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_color.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_color.c
@@ -14,6 +14,7 @@
 #include "mtk_disp_drv.h"
 #include "mtk_drm_crtc.h"
 #include "mtk_drm_ddp_comp.h"
+#include "mtk_drm_drv.h"
 
 #define DISP_COLOR_CFG_MAIN			0x0400
 #define DISP_COLOR_START_MT2701			0x0f00
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
index bbd558a036ec..c844942603f7 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
@@ -14,6 +14,7 @@
 #include "mtk_disp_drv.h"
 #include "mtk_drm_crtc.h"
 #include "mtk_drm_ddp_comp.h"
+#include "mtk_drm_drv.h"
 
 #define DISP_GAMMA_EN				0x0000
 #define GAMMA_EN					BIT(0)
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index 84daeaffab6a..9d8c986700ee 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -19,6 +19,7 @@
 #include "mtk_disp_drv.h"
 #include "mtk_drm_crtc.h"
 #include "mtk_drm_ddp_comp.h"
+#include "mtk_drm_drv.h"
 
 #define DISP_REG_OVL_INTEN			0x0004
 #define OVL_FME_CPL_INT					BIT(1)
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
index 0ec2e4049e07..a5a0c3bac35d 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
@@ -17,6 +17,7 @@
 #include "mtk_disp_drv.h"
 #include "mtk_drm_crtc.h"
 #include "mtk_drm_ddp_comp.h"
+#include "mtk_drm_drv.h"
 
 #define DISP_REG_RDMA_INT_ENABLE		0x0000
 #define DISP_REG_RDMA_INT_STATUS		0x0004
diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index 4317595a15d1..3158dd3896a8 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -29,6 +29,7 @@
 #include "mtk_disp_drv.h"
 #include "mtk_dpi_regs.h"
 #include "mtk_drm_ddp_comp.h"
+#include "mtk_drm_drv.h"
 
 enum mtk_dpi_out_bit_num {
 	MTK_DPI_OUT_BIT_NUM_8BITS,
diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 3b7d13028fb6..357301fa2e7d 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -28,6 +28,7 @@
 
 #include "mtk_disp_drv.h"
 #include "mtk_drm_ddp_comp.h"
+#include "mtk_drm_drv.h"
 
 #define DSI_START		0x00
 
diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c b/drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c
index 6207eac88550..2fc9214ffa82 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c
@@ -19,6 +19,9 @@
 #include <linux/of_irq.h>
 #include <linux/of_platform.h>
 
+#include "mtk_drm_drv.h"
+#include "mtk_hdmi.h"
+
 #define SIF1_CLOK		(288)
 #define DDC_DDCMCTL0		(0x0)
 #define DDCM_ODRAIN			BIT(31)
-- 
2.18.0

