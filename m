Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A38F87738A8
	for <lists+dri-devel@lfdr.de>; Tue,  8 Aug 2023 09:40:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A81E10E3AF;
	Tue,  8 Aug 2023 07:40:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BBCD10E1CE
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Aug 2023 06:21:08 +0000 (UTC)
Received: from dggpemm500024.china.huawei.com (unknown [172.30.72.54])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4RK5jN1YGpz1Z1Y8;
 Mon,  7 Aug 2023 14:18:16 +0800 (CST)
Received: from huawei.com (10.67.175.31) by dggpemm500024.china.huawei.com
 (7.185.36.203) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 7 Aug
 2023 14:21:03 +0800
From: GUO Zihua <guozihua@huawei.com>
To: <anitha.chrisanthus@intel.com>, <edmund.j.dea@intel.com>
Subject: [PATCH -next v2] drm/kmb: Remove unused variable layer_irqs
Date: Mon, 7 Aug 2023 14:20:36 +0800
Message-ID: <20230807062036.7006-1-guozihua@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.175.31]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm500024.china.huawei.com (7.185.36.203)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 08 Aug 2023 07:40:06 +0000
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
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

layer_irqs does not seems to have any user. So remove it completely.

This resolves sparse warning:
  warning: symbol 'layer_irqs' was not declared. Should it be static?

Signed-off-by: GUO Zihua <guozihua@huawei.com>
---

v2:
  V1 is titled "drm/kmb: Make layer_irqs static". This patch removes
layer_irqs completely as there does not seems to be a user for it.

---
 drivers/gpu/drm/kmb/kmb_plane.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/gpu/drm/kmb/kmb_plane.c b/drivers/gpu/drm/kmb/kmb_plane.c
index 9e0562aa2bcb..5a8c7cbf27b0 100644
--- a/drivers/gpu/drm/kmb/kmb_plane.c
+++ b/drivers/gpu/drm/kmb/kmb_plane.c
@@ -17,13 +17,6 @@
 #include "kmb_plane.h"
 #include "kmb_regs.h"
 
-const u32 layer_irqs[] = {
-	LCD_INT_VL0,
-	LCD_INT_VL1,
-	LCD_INT_GL0,
-	LCD_INT_GL1
-};
-
 /* Conversion (yuv->rgb) matrix from myriadx */
 static const u32 csc_coef_lcd[] = {
 	1024, 0, 1436,
-- 
2.17.1

