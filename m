Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18FF276C2BD
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 04:15:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5340E10E183;
	Wed,  2 Aug 2023 02:15:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out28-126.mail.aliyun.com (out28-126.mail.aliyun.com
 [115.124.28.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7EEB10E183;
 Wed,  2 Aug 2023 02:15:16 +0000 (UTC)
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.4795925|-1; CH=blue; DM=|OVERLOAD|false|;
 DS=CONTINUE|ham_alarm|0.198135-0.00156503-0.8003; FP=0|0|0|0|0|-1|-1|-1;
 HT=ay29a033018047188; MF=sunran001@208suo.com; NM=1; PH=DS; RN=5; RT=5; SR=0;
 TI=SMTPD_---.U6L.8nL_1690942507; 
Received: from localhost.localdomain(mailfrom:sunran001@208suo.com
 fp:SMTPD_---.U6L.8nL_1690942507) by smtp.aliyun-inc.com;
 Wed, 02 Aug 2023 10:15:09 +0800
From: Ran Sun <sunran001@208suo.com>
To: alexander.deucher@amd.com
Subject: [PATCH] drm/amd/pm: Clean up errors in r600_dpm.h
Date: Wed,  2 Aug 2023 02:15:04 +0000
Message-Id: <20230802021504.9439-1-sunran001@208suo.com>
X-Mailer: git-send-email 2.17.1
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
Cc: Ran Sun <sunran001@208suo.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the following errors reported by checkpatch:

ERROR: that open brace { should be on the previous line

Signed-off-by: Ran Sun <sunran001@208suo.com>
---
 drivers/gpu/drm/amd/pm/legacy-dpm/r600_dpm.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/legacy-dpm/r600_dpm.h b/drivers/gpu/drm/amd/pm/legacy-dpm/r600_dpm.h
index 055321f61ca7..3e7caa715533 100644
--- a/drivers/gpu/drm/amd/pm/legacy-dpm/r600_dpm.h
+++ b/drivers/gpu/drm/amd/pm/legacy-dpm/r600_dpm.h
@@ -117,8 +117,7 @@ enum r600_display_watermark {
 	R600_DISPLAY_WATERMARK_HIGH = 1,
 };
 
-enum r600_display_gap
-{
+enum r600_display_gap {
     R600_PM_DISPLAY_GAP_VBLANK_OR_WM = 0,
     R600_PM_DISPLAY_GAP_VBLANK       = 1,
     R600_PM_DISPLAY_GAP_WATERMARK    = 2,
-- 
2.17.1

