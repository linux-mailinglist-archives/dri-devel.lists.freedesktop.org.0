Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 511388868EB
	for <lists+dri-devel@lfdr.de>; Fri, 22 Mar 2024 10:13:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D934E10F18E;
	Fri, 22 Mar 2024 09:13:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="LDjlWdc2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F31B10EEDD
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Mar 2024 09:12:44 +0000 (UTC)
X-UUID: 52dbd07ee82c11eeb8927bc1f75efef4-20240322
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=i1kklMu4cvbUpFDEymgCii8k7k+mBZwuXAwkO+sA+kA=; 
 b=LDjlWdc2Z//M1ewf8DNLXhvJsSYh0X+SMOYO0Nh1lUUOrMpQA4aajNO7R/mHUw+khaOqBUvvxn3P6IInzobAe+N8MmqfoQumBfRC0y2H3QlElnEDkTzB9rFPXzJ29X5Bb/yHZg8aAChez3lnf8rcYUPi5yjQB/gSURxHSNYMna8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37, REQID:aa389d12-ef5a-4574-94d1-25399b0afd92, IP:0,
 U
 RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:-5
X-CID-META: VersionHash:6f543d0, CLOUDID:8347b690-e2c0-40b0-a8fe-7c7e47299109,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
 :1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 52dbd07ee82c11eeb8927bc1f75efef4-20240322
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by
 mailgw01.mediatek.com (envelope-from <shawn.sung@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1551328578; Fri, 22 Mar 2024 17:12:36 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 22 Mar 2024 17:12:34 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 22 Mar 2024 17:12:34 +0800
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
Subject: [PATCH v5 06/14] drm/mediatek: Rename files "mtk_drm_crtc.h" to
 "mtk_crtc.h"
Date: Fri, 22 Mar 2024 17:12:24 +0800
Message-ID: <20240322091232.26387-7-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240322091232.26387-1-shawn.sung@mediatek.com>
References: <20240322091232.26387-1-shawn.sung@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--4.173300-8.000000
X-TMASE-MatchedRID: PbOQzqqs5Am4pD9RIlWSGjl/LoO+pjoA1cuIRwt/4Mg1LB46LFAAkkfp
 kQx2u0KsbDDGr42tgBN+joSlmQGbUiGdJ77k/6slA9lly13c/gGy4iyjvVWTon5h6y4KCSJccx0
 Y+I7jXmabuQcHZubU2q6ARG1tM8qIr78SC5iivxwURSScn+QSXt0H8LFZNFG7CKFCmhdu5cW4Sw
 EDVTR9LCerl/qy6DrnX/0YOnE2MiQjN92PW71xoD+eog2jWTfstmvRxtVGMkmE8Kivx8bGw+QIq
 9YGUDbrrLEflzW8+SEXRoPmWO3jekxwdkPqCq7vDEyN+J8hd+jCS9WgDXVPCp6oP1a0mRIj
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--4.173300-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 1A82C521283A6DDD61B23AA65E5E9290F8BA06F19E5815CADA84A506EB69F62D2000:8
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

Rename files mtk_drm_crtc.h to mtk_crtc.h.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.corp-partner.google.com>
---
 drivers/gpu/drm/mediatek/{mtk_drm_crtc.h => mtk_crtc.h} | 0
 drivers/gpu/drm/mediatek/mtk_disp_aal.c                 | 2 +-
 drivers/gpu/drm/mediatek/mtk_disp_ccorr.c               | 2 +-
 drivers/gpu/drm/mediatek/mtk_disp_color.c               | 2 +-
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c               | 2 +-
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c                 | 2 +-
 drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c         | 2 +-
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c                | 2 +-
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c                 | 2 +-
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c             | 2 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c                  | 2 +-
 drivers/gpu/drm/mediatek/mtk_drm_plane.c                | 2 +-
 drivers/gpu/drm/mediatek/mtk_ethdr.c                    | 2 +-
 drivers/gpu/drm/mediatek/mtk_padding.c                  | 2 +-
 14 files changed, 13 insertions(+), 13 deletions(-)
 rename drivers/gpu/drm/mediatek/{mtk_drm_crtc.h => mtk_crtc.h} (100%)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.h b/drivers/gpu/drm/mediatek/mtk_crtc.h
similarity index 100%
rename from drivers/gpu/drm/mediatek/mtk_drm_crtc.h
rename to drivers/gpu/drm/mediatek/mtk_crtc.h
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_aal.c b/drivers/gpu/drm/mediatek/mtk_disp_aal.c
index 40fe403086c3d..ba926e797af8a 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_aal.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_aal.c
@@ -11,8 +11,8 @@
 #include <linux/platform_device.h>
 #include <linux/soc/mediatek/mtk-cmdq.h>
 
+#include "mtk_crtc.h"
 #include "mtk_disp_drv.h"
-#include "mtk_drm_crtc.h"
 #include "mtk_drm_ddp_comp.h"
 #include "mtk_drm_drv.h"
 
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c b/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
index 465cddce0d324..79bcd3c487563 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
@@ -10,8 +10,8 @@
 #include <linux/platform_device.h>
 #include <linux/soc/mediatek/mtk-cmdq.h>
 
+#include "mtk_crtc.h"
 #include "mtk_disp_drv.h"
-#include "mtk_drm_crtc.h"
 #include "mtk_drm_ddp_comp.h"
 #include "mtk_drm_drv.h"
 
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_color.c b/drivers/gpu/drm/mediatek/mtk_disp_color.c
index 78ea99f1444fa..4aa41b1ff2602 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_color.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_color.c
@@ -10,8 +10,8 @@
 #include <linux/platform_device.h>
 #include <linux/soc/mediatek/mtk-cmdq.h>
 
+#include "mtk_crtc.h"
 #include "mtk_disp_drv.h"
-#include "mtk_drm_crtc.h"
 #include "mtk_drm_ddp_comp.h"
 #include "mtk_drm_drv.h"
 
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
index c1bc8b00d9380..1a1ee77127ee9 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
@@ -11,8 +11,8 @@
 #include <linux/platform_device.h>
 #include <linux/soc/mediatek/mtk-cmdq.h>
 
+#include "mtk_crtc.h"
 #include "mtk_disp_drv.h"
-#include "mtk_drm_crtc.h"
 #include "mtk_drm_ddp_comp.h"
 #include "mtk_drm_drv.h"
 
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index 2bffe42454666..7f2219c0119be 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -15,8 +15,8 @@
 #include <linux/pm_runtime.h>
 #include <linux/soc/mediatek/mtk-cmdq.h>
 
+#include "mtk_crtc.h"
 #include "mtk_disp_drv.h"
-#include "mtk_drm_crtc.h"
 #include "mtk_drm_ddp_comp.h"
 #include "mtk_drm_drv.h"
 
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
index 034d31824d4dc..542dc2a20ea90 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
@@ -17,8 +17,8 @@
 #include <linux/soc/mediatek/mtk-mmsys.h>
 #include <linux/soc/mediatek/mtk-mutex.h>
 
+#include "mtk_crtc.h"
 #include "mtk_disp_drv.h"
-#include "mtk_drm_crtc.h"
 #include "mtk_drm_ddp_comp.h"
 #include "mtk_drm_drv.h"
 #include "mtk_ethdr.h"
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
index faa907f2f443e..04f584372214f 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
@@ -13,8 +13,8 @@
 #include <linux/pm_runtime.h>
 #include <linux/soc/mediatek/mtk-cmdq.h>
 
+#include "mtk_crtc.h"
 #include "mtk_disp_drv.h"
-#include "mtk_drm_crtc.h"
 #include "mtk_drm_ddp_comp.h"
 #include "mtk_drm_drv.h"
 
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index 0f2e1be4ee1cb..d9f7febd24a6d 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -19,8 +19,8 @@
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
 
+#include "mtk_crtc.h"
 #include "mtk_drm_drv.h"
-#include "mtk_drm_crtc.h"
 #include "mtk_drm_ddp_comp.h"
 #include "mtk_drm_gem.h"
 #include "mtk_drm_plane.h"
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index a515e96cfefcb..24389c6c3561f 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -14,11 +14,11 @@
 #include <linux/soc/mediatek/mtk-cmdq.h>
 #include <drm/drm_print.h>
 
+#include "mtk_crtc.h"
 #include "mtk_disp_drv.h"
 #include "mtk_drm_drv.h"
 #include "mtk_drm_plane.h"
 #include "mtk_drm_ddp_comp.h"
-#include "mtk_drm_crtc.h"
 
 
 #define DISP_REG_DITHER_EN			0x0000
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 81e8aa65abd6d..7be3b0546d3df 100644
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
index db63a32c407e3..720f6b4b08215 100644
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
index 6a5d0c345aab9..41efaafe26f1a 100644
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
index 0d6451c149b67..ff6a5c695128c 100644
--- a/drivers/gpu/drm/mediatek/mtk_padding.c
+++ b/drivers/gpu/drm/mediatek/mtk_padding.c
@@ -11,8 +11,8 @@
 #include <linux/pm_runtime.h>
 #include <linux/soc/mediatek/mtk-cmdq.h>
 
+#include "mtk_crtc.h"
 #include "mtk_disp_drv.h"
-#include "mtk_drm_crtc.h"
 #include "mtk_drm_ddp_comp.h"
 
 #define PADDING_CONTROL_REG	0x00
-- 
2.18.0

