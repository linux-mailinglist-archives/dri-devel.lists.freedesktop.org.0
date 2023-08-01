Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE6876A714
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 04:39:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DBE710E068;
	Tue,  1 Aug 2023 02:39:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out28-99.mail.aliyun.com (out28-99.mail.aliyun.com
 [115.124.28.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED81710E068;
 Tue,  1 Aug 2023 02:39:24 +0000 (UTC)
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.2376815|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_alarm|0.0270291-0.000544939-0.972426; FP=0|0|0|0|0|-1|-1|-1;
 HT=ay29a033018047187; MF=sunran001@208suo.com; NM=1; PH=DS; RN=7; RT=7; SR=0;
 TI=SMTPD_---.U5H.BoE_1690857556; 
Received: from localhost.localdomain(mailfrom:sunran001@208suo.com
 fp:SMTPD_---.U5H.BoE_1690857556) by smtp.aliyun-inc.com;
 Tue, 01 Aug 2023 10:39:18 +0800
From: Ran Sun <sunran001@208suo.com>
To: alexander.deucher@amd.com,
	airlied@gmail.com,
	daniel@ffwll.ch
Subject: [PATCH] drm/amd/pm: Clean up errors in vega20_hwmgr.h
Date: Tue,  1 Aug 2023 02:39:15 +0000
Message-Id: <20230801023915.4756-1-sunran001@208suo.com>
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

ERROR: open brace '{' following enum go on the same line

Signed-off-by: Ran Sun <sunran001@208suo.com>
---
 drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_hwmgr.h | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_hwmgr.h b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_hwmgr.h
index 075c0094da9c..1ba9b5fe2a5d 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_hwmgr.h
+++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_hwmgr.h
@@ -385,8 +385,7 @@ struct vega20_odn_data {
 	struct vega20_odn_temp_table	odn_temp_table;
 };
 
-enum OD8_FEATURE_ID
-{
+enum OD8_FEATURE_ID {
 	OD8_GFXCLK_LIMITS               = 1 << 0,
 	OD8_GFXCLK_CURVE                = 1 << 1,
 	OD8_UCLK_MAX                    = 1 << 2,
@@ -399,8 +398,7 @@ enum OD8_FEATURE_ID
 	OD8_FAN_ZERO_RPM_CONTROL        = 1 << 9
 };
 
-enum OD8_SETTING_ID
-{
+enum OD8_SETTING_ID {
 	OD8_SETTING_GFXCLK_FMIN = 0,
 	OD8_SETTING_GFXCLK_FMAX,
 	OD8_SETTING_GFXCLK_FREQ1,
-- 
2.17.1

