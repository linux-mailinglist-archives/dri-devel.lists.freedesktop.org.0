Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87CB42EC6AD
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 00:17:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 766BD6E32F;
	Wed,  6 Jan 2021 23:17:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC1B76E32F
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Jan 2021 23:17:40 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id DF82923339;
 Wed,  6 Jan 2021 23:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609975060;
 bh=RuKbU26yuLZJAE82ECbyxWKAfxQoGE+1gpGy1pi6ErU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=i+oQrZOhV8uWRogTMJD4O/ez9I/Wy0nAK4BwCY8iCpKgMinLRhX3BWKsNpJbBRDfV
 LRaF/jWeIs4tCLU2E5cSej0rqMsI4gvUZjkmVsgnH8D0/LrQK40LEBiWJT159nAJad
 08nwmtoYqX3DUkZWV9/NkzjG4UJd6Qzh3WajQf/lTWxhNdURiKpCapMBQPmzpxPtdY
 Qz1FBI0m95m/q7lcb3oHdnE6STL8DsOYiAv66xD5VYH/iRNtZAc6dErwxJ4LFSroYL
 1VswneUBbwbZBmIKgypo9sIzUnX/N7wczp/LfA0lJYriybigoQPs5+6VV6Cdh/M3Xt
 VHauJxrZ4J3lw==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 1/5] drm/mediatek: Remove redundant file including
Date: Thu,  7 Jan 2021 07:17:25 +0800
Message-Id: <20210106231729.17173-2-chunkuang.hu@kernel.org>
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

Those file includings are useless, so remove them.

Signed-off-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_ddp.h | 2 --
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 2 --
 2 files changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp.h
index 6b691a57be4a..a1ee21d15334 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp.h
@@ -6,8 +6,6 @@
 #ifndef MTK_DRM_DDP_H
 #define MTK_DRM_DDP_H
 
-#include "mtk_drm_ddp_comp.h"
-
 struct regmap;
 struct device;
 struct mtk_disp_mutex;
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 8514d68bde32..25a24f69b986 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -10,7 +10,6 @@
 #include <linux/of_address.h>
 #include <linux/of_platform.h>
 #include <linux/pm_runtime.h>
-#include <linux/soc/mediatek/mtk-mmsys.h>
 #include <linux/dma-mapping.h>
 
 #include <drm/drm_atomic.h>
@@ -26,7 +25,6 @@
 #include <drm/drm_vblank.h>
 
 #include "mtk_drm_crtc.h"
-#include "mtk_drm_ddp.h"
 #include "mtk_drm_ddp_comp.h"
 #include "mtk_drm_drv.h"
 #include "mtk_drm_gem.h"
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
