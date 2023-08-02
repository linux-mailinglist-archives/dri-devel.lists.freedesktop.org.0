Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2CDD76C379
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 05:23:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BEF010E48C;
	Wed,  2 Aug 2023 03:23:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out28-220.mail.aliyun.com (out28-220.mail.aliyun.com
 [115.124.28.220])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB59D10E011;
 Wed,  2 Aug 2023 03:23:06 +0000 (UTC)
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.08068386|-1; CH=green;
 DM=|CONTINUE|false|; DS=CONTINUE|ham_alarm|0.0424418-0.000212042-0.957346;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047212; MF=sunran001@208suo.com; NM=1;
 PH=DS; RN=5; RT=5; SR=0; TI=SMTPD_---.U6PnZk8_1690946577; 
Received: from localhost.localdomain(mailfrom:sunran001@208suo.com
 fp:SMTPD_---.U6PnZk8_1690946577) by smtp.aliyun-inc.com;
 Wed, 02 Aug 2023 11:22:59 +0800
From: Ran Sun <sunran001@208suo.com>
To: alexander.deucher@amd.com
Subject: [PATCH] drm/amd/display: Clean up errors in bios_parser2.c
Date: Wed,  2 Aug 2023 03:22:56 +0000
Message-Id: <20230802032256.10846-1-sunran001@208suo.com>
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

ERROR: switch and case should be at the same indent
ERROR: code indent should use tabs where possible

Signed-off-by: Ran Sun <sunran001@208suo.com>
---
 .../drm/amd/display/dc/bios/bios_parser2.c    | 32 +++++++++----------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c b/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c
index 540d19efad8f..033ce2638eb2 100644
--- a/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c
+++ b/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c
@@ -772,20 +772,20 @@ static enum bp_result bios_parser_get_device_tag(
 		return BP_RESULT_BADINPUT;
 
 	switch (bp->object_info_tbl.revision.minor) {
-	    case 4:
-	    default:
+	case 4:
+	default:
 	        /* getBiosObject will return MXM object */
-	        object = get_bios_object(bp, connector_object_id);
+		object = get_bios_object(bp, connector_object_id);
 
 		if (!object) {
 			BREAK_TO_DEBUGGER(); /* Invalid object id */
 			return BP_RESULT_BADINPUT;
 		}
 
-	        info->acpi_device = 0; /* BIOS no longer provides this */
-	        info->dev_id = device_type_from_device_id(object->device_tag);
-	        break;
-	    case 5:
+		info->acpi_device = 0; /* BIOS no longer provides this */
+		info->dev_id = device_type_from_device_id(object->device_tag);
+		break;
+	case 5:
 		object_path_v3 = get_bios_object_from_path_v3(bp, connector_object_id);
 
 		if (!object_path_v3) {
@@ -1580,13 +1580,13 @@ static bool bios_parser_is_device_id_supported(
 	uint32_t mask = get_support_mask_for_device_id(id);
 
 	switch (bp->object_info_tbl.revision.minor) {
-	    case 4:
-	    default:
-	        return (le16_to_cpu(bp->object_info_tbl.v1_4->supporteddevices) & mask) != 0;
-			break;
-	    case 5:
-			return (le16_to_cpu(bp->object_info_tbl.v1_5->supporteddevices) & mask) != 0;
-			break;
+	case 4:
+	default:
+		return (le16_to_cpu(bp->object_info_tbl.v1_4->supporteddevices) & mask) != 0;
+		break;
+	case 5:
+		return (le16_to_cpu(bp->object_info_tbl.v1_5->supporteddevices) & mask) != 0;
+		break;
 	}
 
 	return false;
@@ -1755,7 +1755,7 @@ static enum bp_result bios_parser_get_firmware_info(
 			case 2:
 			case 3:
 				result = get_firmware_info_v3_2(bp, info);
-                                break;
+			break;
 			case 4:
 				result = get_firmware_info_v3_4(bp, info);
 				break;
@@ -2225,7 +2225,7 @@ static enum bp_result bios_parser_get_disp_connector_caps_info(
 		return BP_RESULT_BADINPUT;
 
 	switch (bp->object_info_tbl.revision.minor) {
-	    case 4:
+	case 4:
 	    default:
 		    object = get_bios_object(bp, object_id);
 
-- 
2.17.1

