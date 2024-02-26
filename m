Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB95866D15
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 09:51:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D3FA10EF7D;
	Mon, 26 Feb 2024 08:51:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="lhcPHgFP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 364B810E672
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 08:51:09 +0000 (UTC)
X-UUID: 2b905dc0d48411eea4ad694c3f9da370-20240226
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=ThaHLF9k2VDhj9VeeukJCit1zrJzsfQMihTndF3u4e4=; 
 b=lhcPHgFPybRd7E4AOBdBQD8F9mRngyDs7pboB+fll/ahZDkmCXZeDGEUZHbY3HqwHcxhUBsQfYomwNaBTUcDVnzhEoLlhza06C9i9im20xtrRzktDblCDfpjCODzIBY217/khw7vBHhJd+QyR3p+cx2AEwjU/UGtHgaZMuw69j8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37, REQID:3304b7a3-1b7a-4546-86b9-8cc4f6859e19, IP:0,
 U
 RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:-5
X-CID-META: VersionHash:6f543d0, CLOUDID:0856b98f-e2c0-40b0-a8fe-7c7e47299109,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 2b905dc0d48411eea4ad694c3f9da370-20240226
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw02.mediatek.com (envelope-from <shawn.sung@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1999247529; Mon, 26 Feb 2024 16:51:02 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
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
Subject: [PATCH 06/11] drm/mediatek: Rename files "mtk_drm_crtc.*" to
 "mtk_crtc.*"
Date: Mon, 26 Feb 2024 16:50:54 +0800
Message-ID: <20240226085059.26850-7-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240226085059.26850-1-shawn.sung@mediatek.com>
References: <20240226085059.26850-1-shawn.sung@mediatek.com>
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

From: Hsiao Chien Sung <shawn.sung@mediatek.corp-partner.google.com>

Rename files mtk_drm_crtc.* to mtk_crtc.*.

Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.corp-partner.google.com>
---
 drivers/gpu/drm/mediatek/Makefile                       | 2 +-
 drivers/gpu/drm/mediatek/{mtk_drm_crtc.c => mtk_crtc.c} | 2 +-
 drivers/gpu/drm/mediatek/{mtk_drm_crtc.h => mtk_crtc.h} | 0
 drivers/gpu/drm/mediatek/mtk_disp_aal.c                 | 2 +-
 drivers/gpu/drm/mediatek/mtk_disp_ccorr.c               | 2 +-
 drivers/gpu/drm/mediatek/mtk_disp_color.c               | 2 +-
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c               | 2 +-
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c                 | 2 +-
 drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c         | 2 +-
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c                | 2 +-
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c             | 2 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c                  | 2 +-
 drivers/gpu/drm/mediatek/mtk_drm_plane.c                | 2 +-
 drivers/gpu/drm/mediatek/mtk_ethdr.c                    | 2 +-
 drivers/gpu/drm/mediatek/mtk_padding.c                  | 2 +-
 15 files changed, 14 insertions(+), 14 deletions(-)
 rename drivers/gpu/drm/mediatek/{mtk_drm_crtc.c => mtk_crtc.c} (99%)
 rename drivers/gpu/drm/mediatek/{mtk_drm_crtc.h => mtk_crtc.h} (100%)

diff --git a/drivers/gpu/drm/mediatek/Makefile b/drivers/gpu/drm/mediatek/Makefile
index 5e4436403b8d..edad718082a9 100644
--- a/drivers/gpu/drm/mediatek/Makefile
+++ b/drivers/gpu/drm/mediatek/Makefile
@@ -8,7 +8,7 @@ mediatek-drm-y := mtk_disp_aal.o \
 		  mtk_disp_ovl.o \
 		  mtk_disp_ovl_adaptor.o \
 		  mtk_disp_rdma.o \
-		  mtk_drm_crtc.o \
+		  mtk_crtc.o \
 		  mtk_drm_ddp_comp.o \
 		  mtk_drm_drv.o \
 		  mtk_drm_gem.o \
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_crtc.c
similarity index 99%
rename from drivers/gpu/drm/mediatek/mtk_drm_crtc.c
rename to drivers/gpu/drm/mediatek/mtk_crtc.c
index d8b591aff3c2..503bdcd7e596 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_crtc.c
@@ -20,7 +20,7 @@
 #include <drm/drm_vblank.h>
 
 #include "mtk_drm_drv.h"
-#include "mtk_drm_crtc.h"
+#include "mtk_crtc.h"
 #include "mtk_drm_ddp_comp.h"
 #include "mtk_drm_gem.h"
 #include "mtk_drm_plane.h"
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.h b/drivers/gpu/drm/mediatek/mtk_crtc.h
similarity index 100%
rename from drivers/gpu/drm/mediatek/mtk_drm_crtc.h
rename to drivers/gpu/drm/mediatek/mtk_crtc.h
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_aal.c b/drivers/gpu/drm/mediatek/mtk_disp_aal.c
index 40fe403086c3..005fc9de2ee9 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_aal.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_aal.c
@@ -12,7 +12,7 @@
 #include <linux/soc/mediatek/mtk-cmdq.h>
 
 #include "mtk_disp_drv.h"
-#include "mtk_drm_crtc.h"
+#include "mtk_crtc.h"
 #include "mtk_drm_ddp_comp.h"
 #include "mtk_drm_drv.h"
 
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c b/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
index 465cddce0d32..cbdee3986120 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
@@ -11,7 +11,7 @@
 #include <linux/soc/mediatek/mtk-cmdq.h>
 
 #include "mtk_disp_drv.h"
-#include "mtk_drm_crtc.h"
+#include "mtk_crtc.h"
 #include "mtk_drm_ddp_comp.h"
 #include "mtk_drm_drv.h"
 
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_color.c b/drivers/gpu/drm/mediatek/mtk_disp_color.c
index 78ea99f1444f..e2124b447767 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_color.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_color.c
@@ -11,7 +11,7 @@
 #include <linux/soc/mediatek/mtk-cmdq.h>
 
 #include "mtk_disp_drv.h"
-#include "mtk_drm_crtc.h"
+#include "mtk_crtc.h"
 #include "mtk_drm_ddp_comp.h"
 #include "mtk_drm_drv.h"
 
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
index c1bc8b00d938..84b02064808b 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
@@ -12,7 +12,7 @@
 #include <linux/soc/mediatek/mtk-cmdq.h>
 
 #include "mtk_disp_drv.h"
-#include "mtk_drm_crtc.h"
+#include "mtk_crtc.h"
 #include "mtk_drm_ddp_comp.h"
 #include "mtk_drm_drv.h"
 
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index 2bffe4245466..0ab680e11862 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -16,7 +16,7 @@
 #include <linux/soc/mediatek/mtk-cmdq.h>
 
 #include "mtk_disp_drv.h"
-#include "mtk_drm_crtc.h"
+#include "mtk_crtc.h"
 #include "mtk_drm_ddp_comp.h"
 #include "mtk_drm_drv.h"
 
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
index 034d31824d4d..f2d9c372879a 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
@@ -18,7 +18,7 @@
 #include <linux/soc/mediatek/mtk-mutex.h>
 
 #include "mtk_disp_drv.h"
-#include "mtk_drm_crtc.h"
+#include "mtk_crtc.h"
 #include "mtk_drm_ddp_comp.h"
 #include "mtk_drm_drv.h"
 #include "mtk_ethdr.h"
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
index faa907f2f443..af78240229e8 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
@@ -14,7 +14,7 @@
 #include <linux/soc/mediatek/mtk-cmdq.h>
 
 #include "mtk_disp_drv.h"
-#include "mtk_drm_crtc.h"
+#include "mtk_crtc.h"
 #include "mtk_drm_ddp_comp.h"
 #include "mtk_drm_drv.h"
 
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index a515e96cfefc..b2c0665867d3 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -18,7 +18,7 @@
 #include "mtk_drm_drv.h"
 #include "mtk_drm_plane.h"
 #include "mtk_drm_ddp_comp.h"
-#include "mtk_drm_crtc.h"
+#include "mtk_crtc.h"
 
 
 #define DISP_REG_DITHER_EN			0x0000
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 81e8aa65abd6..7be3b0546d3d 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -24,7 +24,7 @@
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
 
-#include "mtk_drm_crtc.h"
+#include "mtk_crtc.h"
 #include "mtk_drm_ddp_comp.h"
 #include "mtk_drm_drv.h"
 #include "mtk_drm_gem.h"
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.c b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
index db63a32c407e..720f6b4b0821 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_plane.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
@@ -13,7 +13,7 @@
 #include <drm/drm_gem_atomic_helper.h>
 #include <linux/align.h>
 
-#include "mtk_drm_crtc.h"
+#include "mtk_crtc.h"
 #include "mtk_drm_ddp_comp.h"
 #include "mtk_drm_drv.h"
 #include "mtk_drm_gem.h"
diff --git a/drivers/gpu/drm/mediatek/mtk_ethdr.c b/drivers/gpu/drm/mediatek/mtk_ethdr.c
index 6a5d0c345aab..41efaafe26f1 100644
--- a/drivers/gpu/drm/mediatek/mtk_ethdr.c
+++ b/drivers/gpu/drm/mediatek/mtk_ethdr.c
@@ -14,7 +14,7 @@
 #include <linux/soc/mediatek/mtk-cmdq.h>
 #include <linux/soc/mediatek/mtk-mmsys.h>
 
-#include "mtk_drm_crtc.h"
+#include "mtk_crtc.h"
 #include "mtk_drm_ddp_comp.h"
 #include "mtk_drm_drv.h"
 #include "mtk_ethdr.h"
diff --git a/drivers/gpu/drm/mediatek/mtk_padding.c b/drivers/gpu/drm/mediatek/mtk_padding.c
index 0d6451c149b6..cf233e43f95c 100644
--- a/drivers/gpu/drm/mediatek/mtk_padding.c
+++ b/drivers/gpu/drm/mediatek/mtk_padding.c
@@ -12,7 +12,7 @@
 #include <linux/soc/mediatek/mtk-cmdq.h>
 
 #include "mtk_disp_drv.h"
-#include "mtk_drm_crtc.h"
+#include "mtk_crtc.h"
 #include "mtk_drm_ddp_comp.h"
 
 #define PADDING_CONTROL_REG	0x00
-- 
2.18.0

