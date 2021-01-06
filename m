Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 297CF2EC6AE
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 00:17:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBA196E332;
	Wed,  6 Jan 2021 23:17:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5665B6E332
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Jan 2021 23:17:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 34A202333B;
 Wed,  6 Jan 2021 23:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609975063;
 bh=twgw02Taay/sWVg0dngMR1CiRJClXLEXiaSzITlWvoU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=m2fQue0iFzGeutPfG564mOyFEGaejgxyOsiMeeNaLIBReCUuux4itudBaaKb0SBKK
 8hyZHi/gmTcIM/w7wkm+Ixn8chzCILwn9yKb79LijyK0xuOp4Ll4xmD2G/lM3h1xPA
 0NPS0tUst40i/xdAN8DD5iLVRJ++r6PHx3nnxNc0TWAIce8u+APSfUGkqgHkgoWMmh
 KErT9RCmj7vKjMEOqfHVua5ErfIZBwfA20fT08jqw7y8keIAomjPCNZK5pl+tf5d/h
 3++Pm/oEi0fPTbhKA85jxcEIoVxg+v62wYL7LvHRP/57evCwd/ooq7O1JejDpqZSDr
 9bFUOeMujiuUw==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 2/5] drm/mediatek: Rename file mtk_drm_ddp to mtk_mutex
Date: Thu,  7 Jan 2021 07:17:26 +0800
Message-Id: <20210106231729.17173-3-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210106231729.17173-1-chunkuang.hu@kernel.org>
References: <20210106231729.17173-1-chunkuang.hu@kernel.org>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: CK Hu <ck.hu@mediatek.com>

After mmsys routing function is moved out of mtk_drm_ddp.c, mtk_drm_ddp.c
has only mtk mutex function, so rename it to match the function in it.

Signed-off-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 drivers/gpu/drm/mediatek/Makefile                       | 4 ++--
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c                 | 2 +-
 drivers/gpu/drm/mediatek/{mtk_drm_ddp.c => mtk_mutex.c} | 2 +-
 drivers/gpu/drm/mediatek/{mtk_drm_ddp.h => mtk_mutex.h} | 6 +++---
 4 files changed, 7 insertions(+), 7 deletions(-)
 rename drivers/gpu/drm/mediatek/{mtk_drm_ddp.c => mtk_mutex.c} (99%)
 rename drivers/gpu/drm/mediatek/{mtk_drm_ddp.h => mtk_mutex.h} (92%)

diff --git a/drivers/gpu/drm/mediatek/Makefile b/drivers/gpu/drm/mediatek/Makefile
index a892edec5563..09979c4c340a 100644
--- a/drivers/gpu/drm/mediatek/Makefile
+++ b/drivers/gpu/drm/mediatek/Makefile
@@ -4,13 +4,13 @@ mediatek-drm-y := mtk_disp_color.o \
 		  mtk_disp_ovl.o \
 		  mtk_disp_rdma.o \
 		  mtk_drm_crtc.o \
-		  mtk_drm_ddp.o \
 		  mtk_drm_ddp_comp.o \
 		  mtk_drm_drv.o \
 		  mtk_drm_gem.o \
 		  mtk_drm_plane.o \
 		  mtk_dsi.o \
-		  mtk_dpi.o
+		  mtk_dpi.o \
+		  mtk_mutex.o
 
 obj-$(CONFIG_DRM_MEDIATEK) += mediatek-drm.o
 
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index bf44a14ea0b6..fd97b7d195e3 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -19,10 +19,10 @@
 
 #include "mtk_drm_drv.h"
 #include "mtk_drm_crtc.h"
-#include "mtk_drm_ddp.h"
 #include "mtk_drm_ddp_comp.h"
 #include "mtk_drm_gem.h"
 #include "mtk_drm_plane.h"
+#include "mtk_mutex.h"
 
 /*
  * struct mtk_drm_crtc - MediaTek specific crtc structure.
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp.c b/drivers/gpu/drm/mediatek/mtk_mutex.c
similarity index 99%
rename from drivers/gpu/drm/mediatek/mtk_drm_ddp.c
rename to drivers/gpu/drm/mediatek/mtk_mutex.c
index 1f99db6b1a42..1c8a253f4788 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
+++ b/drivers/gpu/drm/mediatek/mtk_mutex.c
@@ -10,8 +10,8 @@
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
-#include "mtk_drm_ddp.h"
 #include "mtk_drm_ddp_comp.h"
+#include "mtk_mutex.h"
 
 #define MT2701_DISP_MUTEX0_MOD0			0x2c
 #define MT2701_DISP_MUTEX0_SOF0			0x30
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp.h b/drivers/gpu/drm/mediatek/mtk_mutex.h
similarity index 92%
rename from drivers/gpu/drm/mediatek/mtk_drm_ddp.h
rename to drivers/gpu/drm/mediatek/mtk_mutex.h
index a1ee21d15334..3abcc20e88fb 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp.h
+++ b/drivers/gpu/drm/mediatek/mtk_mutex.h
@@ -3,8 +3,8 @@
  * Copyright (c) 2015 MediaTek Inc.
  */
 
-#ifndef MTK_DRM_DDP_H
-#define MTK_DRM_DDP_H
+#ifndef MTK_MUTEX_H
+#define MTK_MUTEX_H
 
 struct regmap;
 struct device;
@@ -23,4 +23,4 @@ void mtk_disp_mutex_put(struct mtk_disp_mutex *mutex);
 void mtk_disp_mutex_acquire(struct mtk_disp_mutex *mutex);
 void mtk_disp_mutex_release(struct mtk_disp_mutex *mutex);
 
-#endif /* MTK_DRM_DDP_H */
+#endif /* MTK_MUTEX_H */
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
