Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3FD1866D14
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 09:51:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E23BB10EF7C;
	Mon, 26 Feb 2024 08:51:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="q+0mefl/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F12A10E64D
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 08:51:07 +0000 (UTC)
X-UUID: 2bed07aad48411eea528b71b88a53856-20240226
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=yIBNV7F7nUKl4z/itIR5FBNljQM4HJFIojS3Q3VKJeU=; 
 b=q+0mefl/61MY8Eh4aLmapLHsKRlUkJSMD79oQnyMCB7xqsx7KVfG+keGf63w6qMv/rxgHGNm5bSo9cR58YMLK3Sz6tyvtXIzjaChNK4xpu7FNfMjL3Yo6rpuEzhcLwT78uSB7VfpwUT3TuNoYzwZRaNtCfZkJRnBT+vBrao8q+o=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37, REQID:dcbce937-9f2c-4b60-a6d7-e64b798800f5, IP:0,
 U
 RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:-5
X-CID-META: VersionHash:6f543d0, CLOUDID:c95137ff-c16b-4159-a099-3b9d0558e447,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 2bed07aad48411eea528b71b88a53856-20240226
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw01.mediatek.com (envelope-from <shawn.sung@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 864359392; Mon, 26 Feb 2024 16:51:03 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 26 Feb 2024 16:51:01 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 26 Feb 2024 16:51:01 +0800
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
Subject: [PATCH 07/11] drm/mediatek: Rename files "mtk_drm_ddp_comp.*" to
 "mtk_ddp_comp.*"
Date: Mon, 26 Feb 2024 16:50:55 +0800
Message-ID: <20240226085059.26850-8-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240226085059.26850-1-shawn.sung@mediatek.com>
References: <20240226085059.26850-1-shawn.sung@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--4.418400-8.000000
X-TMASE-MatchedRID: k/L/ofNtQd0/5uXNh96gfjl/LoO+pjoA1cuIRwt/4MiSYqzYmxOFIrxX
 z8rVhwNpDISwwPi18PRg62EFNWAoiJhDg82nqVsGpvwZ9GmdwDOy4iyjvVWTorw2tvOM+/MnlwW
 f7/4SyDsqfUi2/QDieK6ARG1tM8qIr78SC5iivxwURSScn+QSXt0H8LFZNFG7CKFCmhdu5cWD5O
 tXitsuRGJgpEBF4PphZjhGjq2qFd7zKOIqtmTWU14H7SED8wK7QWniKmEzswAJ8rKgP3Pe4IJ25
 KzmtS2mcqQs/zSI+/0XRoPmWO3jekxwdkPqCq7vDEyN+J8hd+jCS9WgDXVPCp6oP1a0mRIj
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--4.418400-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 70D8503C79C3E6C2872EA53423EEAF6F8B45BBEC9BBF84C872250898DAFCF35D2000:8
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

Rename files mtk_drm_ddp_comp.* to mtk_ddp_comp.*.

Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.corp-partner.google.com>
---
 drivers/gpu/drm/mediatek/Makefile                               | 2 +-
 drivers/gpu/drm/mediatek/mtk_crtc.c                             | 2 +-
 drivers/gpu/drm/mediatek/mtk_crtc.h                             | 2 +-
 drivers/gpu/drm/mediatek/{mtk_drm_ddp_comp.c => mtk_ddp_comp.c} | 2 +-
 drivers/gpu/drm/mediatek/{mtk_drm_ddp_comp.h => mtk_ddp_comp.h} | 0
 drivers/gpu/drm/mediatek/mtk_disp_aal.c                         | 2 +-
 drivers/gpu/drm/mediatek/mtk_disp_ccorr.c                       | 2 +-
 drivers/gpu/drm/mediatek/mtk_disp_color.c                       | 2 +-
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c                       | 2 +-
 drivers/gpu/drm/mediatek/mtk_disp_merge.c                       | 2 +-
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c                         | 2 +-
 drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c                 | 2 +-
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c                        | 2 +-
 drivers/gpu/drm/mediatek/mtk_dpi.c                              | 2 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c                          | 2 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.h                          | 2 +-
 drivers/gpu/drm/mediatek/mtk_drm_plane.c                        | 2 +-
 drivers/gpu/drm/mediatek/mtk_dsi.c                              | 2 +-
 drivers/gpu/drm/mediatek/mtk_ethdr.c                            | 2 +-
 drivers/gpu/drm/mediatek/mtk_padding.c                          | 2 +-
 20 files changed, 19 insertions(+), 19 deletions(-)
 rename drivers/gpu/drm/mediatek/{mtk_drm_ddp_comp.c => mtk_ddp_comp.c} (99%)
 rename drivers/gpu/drm/mediatek/{mtk_drm_ddp_comp.h => mtk_ddp_comp.h} (100%)

diff --git a/drivers/gpu/drm/mediatek/Makefile b/drivers/gpu/drm/mediatek/Makefile
index edad718082a9..bbdf1e59ed84 100644
--- a/drivers/gpu/drm/mediatek/Makefile
+++ b/drivers/gpu/drm/mediatek/Makefile
@@ -9,7 +9,7 @@ mediatek-drm-y := mtk_disp_aal.o \
 		  mtk_disp_ovl_adaptor.o \
 		  mtk_disp_rdma.o \
 		  mtk_crtc.o \
-		  mtk_drm_ddp_comp.o \
+		  mtk_ddp_comp.o \
 		  mtk_drm_drv.o \
 		  mtk_drm_gem.o \
 		  mtk_drm_plane.o \
diff --git a/drivers/gpu/drm/mediatek/mtk_crtc.c b/drivers/gpu/drm/mediatek/mtk_crtc.c
index 503bdcd7e596..7bc4f76718e5 100644
--- a/drivers/gpu/drm/mediatek/mtk_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_crtc.c
@@ -21,7 +21,7 @@
 
 #include "mtk_drm_drv.h"
 #include "mtk_crtc.h"
-#include "mtk_drm_ddp_comp.h"
+#include "mtk_ddp_comp.h"
 #include "mtk_drm_gem.h"
 #include "mtk_drm_plane.h"
 
diff --git a/drivers/gpu/drm/mediatek/mtk_crtc.h b/drivers/gpu/drm/mediatek/mtk_crtc.h
index f081c54a349b..5865e4955471 100644
--- a/drivers/gpu/drm/mediatek/mtk_crtc.h
+++ b/drivers/gpu/drm/mediatek/mtk_crtc.h
@@ -7,7 +7,7 @@
 #define MTK_CRTC_H
 
 #include <drm/drm_crtc.h>
-#include "mtk_drm_ddp_comp.h"
+#include "mtk_ddp_comp.h"
 #include "mtk_drm_drv.h"
 #include "mtk_drm_plane.h"
 
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
similarity index 99%
rename from drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
rename to drivers/gpu/drm/mediatek/mtk_ddp_comp.c
index b2c0665867d3..98398993500f 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
@@ -17,7 +17,7 @@
 #include "mtk_disp_drv.h"
 #include "mtk_drm_drv.h"
 #include "mtk_drm_plane.h"
-#include "mtk_drm_ddp_comp.h"
+#include "mtk_ddp_comp.h"
 #include "mtk_crtc.h"
 
 
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_ddp_comp.h
similarity index 100%
rename from drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
rename to drivers/gpu/drm/mediatek/mtk_ddp_comp.h
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_aal.c b/drivers/gpu/drm/mediatek/mtk_disp_aal.c
index 005fc9de2ee9..53ea856a31a4 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_aal.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_aal.c
@@ -13,7 +13,7 @@
 
 #include "mtk_disp_drv.h"
 #include "mtk_crtc.h"
-#include "mtk_drm_ddp_comp.h"
+#include "mtk_ddp_comp.h"
 #include "mtk_drm_drv.h"
 
 #define DISP_AAL_EN				0x0000
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c b/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
index cbdee3986120..d97e1a15bf6e 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
@@ -12,7 +12,7 @@
 
 #include "mtk_disp_drv.h"
 #include "mtk_crtc.h"
-#include "mtk_drm_ddp_comp.h"
+#include "mtk_ddp_comp.h"
 #include "mtk_drm_drv.h"
 
 #define DISP_CCORR_EN				0x0000
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_color.c b/drivers/gpu/drm/mediatek/mtk_disp_color.c
index e2124b447767..69ed886f1388 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_color.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_color.c
@@ -12,7 +12,7 @@
 
 #include "mtk_disp_drv.h"
 #include "mtk_crtc.h"
-#include "mtk_drm_ddp_comp.h"
+#include "mtk_ddp_comp.h"
 #include "mtk_drm_drv.h"
 
 #define DISP_COLOR_CFG_MAIN			0x0400
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
index 84b02064808b..ed126ba8d600 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
@@ -13,7 +13,7 @@
 
 #include "mtk_disp_drv.h"
 #include "mtk_crtc.h"
-#include "mtk_drm_ddp_comp.h"
+#include "mtk_ddp_comp.h"
 #include "mtk_drm_drv.h"
 
 #define DISP_GAMMA_EN				0x0000
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_merge.c b/drivers/gpu/drm/mediatek/mtk_disp_merge.c
index 4d90a274380e..2d072f049078 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_merge.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_merge.c
@@ -10,7 +10,7 @@
 #include <linux/reset.h>
 #include <linux/soc/mediatek/mtk-cmdq.h>
 
-#include "mtk_drm_ddp_comp.h"
+#include "mtk_ddp_comp.h"
 #include "mtk_drm_drv.h"
 #include "mtk_disp_drv.h"
 
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index 0ab680e11862..74846dc31354 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -17,7 +17,7 @@
 
 #include "mtk_disp_drv.h"
 #include "mtk_crtc.h"
-#include "mtk_drm_ddp_comp.h"
+#include "mtk_ddp_comp.h"
 #include "mtk_drm_drv.h"
 
 #define DISP_REG_OVL_INTEN			0x0004
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
index f2d9c372879a..0e80629ceae8 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
@@ -19,7 +19,7 @@
 
 #include "mtk_disp_drv.h"
 #include "mtk_crtc.h"
-#include "mtk_drm_ddp_comp.h"
+#include "mtk_ddp_comp.h"
 #include "mtk_drm_drv.h"
 #include "mtk_ethdr.h"
 
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
index af78240229e8..669dc3f45a34 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
@@ -15,7 +15,7 @@
 
 #include "mtk_disp_drv.h"
 #include "mtk_crtc.h"
-#include "mtk_drm_ddp_comp.h"
+#include "mtk_ddp_comp.h"
 #include "mtk_drm_drv.h"
 
 #define DISP_REG_RDMA_INT_ENABLE		0x0000
diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index beb7d9d08e97..84745ec9dd7c 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -28,7 +28,7 @@
 
 #include "mtk_disp_drv.h"
 #include "mtk_dpi_regs.h"
-#include "mtk_drm_ddp_comp.h"
+#include "mtk_ddp_comp.h"
 #include "mtk_drm_drv.h"
 
 enum mtk_dpi_out_bit_num {
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 7be3b0546d3d..113fdbaac5a1 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -25,7 +25,7 @@
 #include <drm/drm_vblank.h>
 
 #include "mtk_crtc.h"
-#include "mtk_drm_ddp_comp.h"
+#include "mtk_ddp_comp.h"
 #include "mtk_drm_drv.h"
 #include "mtk_drm_gem.h"
 
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.h b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
index 24c4d59085bd..78d698ede1bf 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
@@ -7,7 +7,7 @@
 #define MTK_DRM_DRV_H
 
 #include <linux/io.h>
-#include "mtk_drm_ddp_comp.h"
+#include "mtk_ddp_comp.h"
 
 #define MAX_CONNECTOR	2
 #define DDP_COMPONENT_DRM_OVL_ADAPTOR (DDP_COMPONENT_ID_MAX + 1)
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.c b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
index 720f6b4b0821..63a7a24468c1 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_plane.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
@@ -14,7 +14,7 @@
 #include <linux/align.h>
 
 #include "mtk_crtc.h"
-#include "mtk_drm_ddp_comp.h"
+#include "mtk_ddp_comp.h"
 #include "mtk_drm_drv.h"
 #include "mtk_drm_gem.h"
 #include "mtk_drm_plane.h"
diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index ec9d96396d7b..a9071c4dce0e 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -29,7 +29,7 @@
 #include <drm/drm_simple_kms_helper.h>
 
 #include "mtk_disp_drv.h"
-#include "mtk_drm_ddp_comp.h"
+#include "mtk_ddp_comp.h"
 #include "mtk_drm_drv.h"
 
 #define DSI_START		0x00
diff --git a/drivers/gpu/drm/mediatek/mtk_ethdr.c b/drivers/gpu/drm/mediatek/mtk_ethdr.c
index 41efaafe26f1..9b0264bd5e73 100644
--- a/drivers/gpu/drm/mediatek/mtk_ethdr.c
+++ b/drivers/gpu/drm/mediatek/mtk_ethdr.c
@@ -15,7 +15,7 @@
 #include <linux/soc/mediatek/mtk-mmsys.h>
 
 #include "mtk_crtc.h"
-#include "mtk_drm_ddp_comp.h"
+#include "mtk_ddp_comp.h"
 #include "mtk_drm_drv.h"
 #include "mtk_ethdr.h"
 
diff --git a/drivers/gpu/drm/mediatek/mtk_padding.c b/drivers/gpu/drm/mediatek/mtk_padding.c
index cf233e43f95c..cdfdb7d8c449 100644
--- a/drivers/gpu/drm/mediatek/mtk_padding.c
+++ b/drivers/gpu/drm/mediatek/mtk_padding.c
@@ -13,7 +13,7 @@
 
 #include "mtk_disp_drv.h"
 #include "mtk_crtc.h"
-#include "mtk_drm_ddp_comp.h"
+#include "mtk_ddp_comp.h"
 
 #define PADDING_CONTROL_REG	0x00
 #define PADDING_BYPASS			BIT(0)
-- 
2.18.0

