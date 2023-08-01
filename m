Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D6A76A88D
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 07:58:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA65210E30B;
	Tue,  1 Aug 2023 05:58:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out28-195.mail.aliyun.com (out28-195.mail.aliyun.com
 [115.124.28.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4381010E30B;
 Tue,  1 Aug 2023 05:58:46 +0000 (UTC)
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.1285285|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_regular_dialog|0.0182949-0.000150213-0.981555;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047211; MF=sunran001@208suo.com; NM=1;
 PH=DS; RN=7; RT=7; SR=0; TI=SMTPD_---.U5e9L-1_1690869507; 
Received: from localhost.localdomain(mailfrom:sunran001@208suo.com
 fp:SMTPD_---.U5e9L-1_1690869507) by smtp.aliyun-inc.com;
 Tue, 01 Aug 2023 13:58:29 +0800
From: Ran Sun <sunran001@208suo.com>
To: alexander.deucher@amd.com,
	airlied@gmail.com,
	daniel@ffwll.ch
Subject: [PATCH] drm/amd/pm: Clean up errors in vega10_hwmgr.c
Date: Tue,  1 Aug 2023 05:58:26 +0000
Message-Id: <20230801055826.6000-1-sunran001@208suo.com>
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

ERROR: trailing statements should be on next line
ERROR: space required before the open brace '{'
ERROR: space required before the open parenthesis '('
ERROR: space required after that ',' (ctx:VxV)

Signed-off-by: Ran Sun <sunran001@208suo.com>
---
 .../drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c  | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c
index 08518bc1cbbe..ba7294daddfe 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c
@@ -670,17 +670,23 @@ static int vega10_patch_voltage_dependency_tables_with_lookup_table(
 	for (i = 0; i < 6; i++) {
 		struct phm_ppt_v1_clock_voltage_dependency_table *vdt;
 		switch (i) {
-		case 0: vdt = table_info->vdd_dep_on_socclk;
+		case 0:
+			vdt = table_info->vdd_dep_on_socclk;
 			break;
-		case 1: vdt = table_info->vdd_dep_on_sclk;
+		case 1:
+			vdt = table_info->vdd_dep_on_sclk;
 			break;
-		case 2: vdt = table_info->vdd_dep_on_dcefclk;
+		case 2:
+			vdt = table_info->vdd_dep_on_dcefclk;
 			break;
-		case 3: vdt = table_info->vdd_dep_on_pixclk;
+		case 3:
+			vdt = table_info->vdd_dep_on_pixclk;
 			break;
-		case 4: vdt = table_info->vdd_dep_on_dispclk;
+		case 4:
+			vdt = table_info->vdd_dep_on_dispclk;
 			break;
-		case 5: vdt = table_info->vdd_dep_on_phyclk;
+		case 5:
+			vdt = table_info->vdd_dep_on_phyclk;
 			break;
 		}
 
-- 
2.17.1

