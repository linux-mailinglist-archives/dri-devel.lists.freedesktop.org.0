Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC1F756979D
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jul 2022 03:38:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E76010EF10;
	Thu,  7 Jul 2022 01:38:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out30-45.freemail.mail.aliyun.com
 (out30-45.freemail.mail.aliyun.com [115.124.30.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3484010EF10;
 Thu,  7 Jul 2022 01:38:18 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R221e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046059;
 MF=yang.lee@linux.alibaba.com; NM=1; PH=DS; RN=12; SR=0;
 TI=SMTPD_---0VIadX3N_1657157894; 
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com
 fp:SMTPD_---0VIadX3N_1657157894) by smtp.aliyun-inc.com;
 Thu, 07 Jul 2022 09:38:14 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: alexander.deucher@amd.com
Subject: [PATCH -next] drm/amd/display: clean up some inconsistent indenting
Date: Thu,  7 Jul 2022 09:38:12 +0800
Message-Id: <20220707013812.64057-1-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: sunpeng.li@amd.com, Xinhui.Pan@amd.com, Rodrigo.Siqueira@amd.com,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, airlied@linux.ie,
 Yang Li <yang.lee@linux.alibaba.com>, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Eliminate the follow smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/dc/bios/bios_parser2.c:405 get_bios_object_from_path_v3() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/bios/bios_parser2.c:611 bios_parser_get_hpd_info() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/bios/bios_parser2.c:818 bios_parser_get_device_tag() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/bios/bios_parser2.c:1599 bios_parser_is_device_id_supported() warn: inconsistent indenting

Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 .../gpu/drm/amd/display/dc/bios/bios_parser2.c   | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c b/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c
index c332650b7048..6f514d92b401 100644
--- a/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c
+++ b/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c
@@ -402,7 +402,7 @@ static struct atom_display_object_path_v3 *get_bios_object_from_path_v3(
 		return NULL;
 	}
 
-    return NULL;
+	return NULL;
 }
 
 static enum bp_result bios_parser_get_i2c_info(struct dc_bios *dcb,
@@ -605,8 +605,8 @@ static enum bp_result bios_parser_get_hpd_info(
 	    default:
 	        object = get_bios_object(bp, id);
 
-			if (!object)
-				return BP_RESULT_BADINPUT;
+		if (!object)
+			return BP_RESULT_BADINPUT;
 
 	        record = get_hpd_record(bp, object);
 
@@ -810,10 +810,10 @@ static enum bp_result bios_parser_get_device_tag(
 	        /* getBiosObject will return MXM object */
 	        object = get_bios_object(bp, connector_object_id);
 
-			if (!object) {
-				BREAK_TO_DEBUGGER(); /* Invalid object id */
-				return BP_RESULT_BADINPUT;
-			}
+		if (!object) {
+			BREAK_TO_DEBUGGER(); /* Invalid object id */
+			return BP_RESULT_BADINPUT;
+		}
 
 	        info->acpi_device = 0; /* BIOS no longer provides this */
 	        info->dev_id = device_type_from_device_id(object->device_tag);
@@ -1596,7 +1596,7 @@ static bool bios_parser_is_device_id_supported(
 			break;
 	}
 
-    return false;
+	return false;
 }
 
 static uint32_t bios_parser_get_ss_entry_number(
-- 
2.20.1.7.g153144c

