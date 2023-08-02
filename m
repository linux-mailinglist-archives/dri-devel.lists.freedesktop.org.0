Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F23676C5E2
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 08:55:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6574610E4BE;
	Wed,  2 Aug 2023 06:55:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out28-4.mail.aliyun.com (out28-4.mail.aliyun.com [115.124.28.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E814E10E4BE;
 Wed,  2 Aug 2023 06:55:28 +0000 (UTC)
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.4842786|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_enroll_verification|0.00285167-8.57873e-06-0.99714;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047201; MF=sunran001@208suo.com; NM=1;
 PH=DS; RN=5; RT=5; SR=0; TI=SMTPD_---.U6ZgWu6_1690959319; 
Received: from localhost.localdomain(mailfrom:sunran001@208suo.com
 fp:SMTPD_---.U6ZgWu6_1690959319) by smtp.aliyun-inc.com;
 Wed, 02 Aug 2023 14:55:21 +0800
From: Ran Sun <sunran001@208suo.com>
To: alexander.deucher@amd.com
Subject: [PATCH] drm/amd: Clean up errors in amdgpu_cgs.c
Date: Wed,  2 Aug 2023 06:55:18 +0000
Message-Id: <20230802065518.12271-1-sunran001@208suo.com>
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

Signed-off-by: Ran Sun <sunran001@208suo.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_cgs.c | 64 ++++++++++++-------------
 1 file changed, 32 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cgs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cgs.c
index 456e385333b6..fafe7057a8c9 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cgs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cgs.c
@@ -163,38 +163,38 @@ static uint16_t amdgpu_get_firmware_version(struct cgs_device *cgs_device,
 	uint16_t fw_version = 0;
 
 	switch (type) {
-		case CGS_UCODE_ID_SDMA0:
-			fw_version = adev->sdma.instance[0].fw_version;
-			break;
-		case CGS_UCODE_ID_SDMA1:
-			fw_version = adev->sdma.instance[1].fw_version;
-			break;
-		case CGS_UCODE_ID_CP_CE:
-			fw_version = adev->gfx.ce_fw_version;
-			break;
-		case CGS_UCODE_ID_CP_PFP:
-			fw_version = adev->gfx.pfp_fw_version;
-			break;
-		case CGS_UCODE_ID_CP_ME:
-			fw_version = adev->gfx.me_fw_version;
-			break;
-		case CGS_UCODE_ID_CP_MEC:
-			fw_version = adev->gfx.mec_fw_version;
-			break;
-		case CGS_UCODE_ID_CP_MEC_JT1:
-			fw_version = adev->gfx.mec_fw_version;
-			break;
-		case CGS_UCODE_ID_CP_MEC_JT2:
-			fw_version = adev->gfx.mec_fw_version;
-			break;
-		case CGS_UCODE_ID_RLC_G:
-			fw_version = adev->gfx.rlc_fw_version;
-			break;
-		case CGS_UCODE_ID_STORAGE:
-			break;
-		default:
-			DRM_ERROR("firmware type %d do not have version\n", type);
-			break;
+	case CGS_UCODE_ID_SDMA0:
+		fw_version = adev->sdma.instance[0].fw_version;
+		break;
+	case CGS_UCODE_ID_SDMA1:
+		fw_version = adev->sdma.instance[1].fw_version;
+		break;
+	case CGS_UCODE_ID_CP_CE:
+		fw_version = adev->gfx.ce_fw_version;
+		break;
+	case CGS_UCODE_ID_CP_PFP:
+		fw_version = adev->gfx.pfp_fw_version;
+		break;
+	case CGS_UCODE_ID_CP_ME:
+		fw_version = adev->gfx.me_fw_version;
+		break;
+	case CGS_UCODE_ID_CP_MEC:
+		fw_version = adev->gfx.mec_fw_version;
+		break;
+	case CGS_UCODE_ID_CP_MEC_JT1:
+		fw_version = adev->gfx.mec_fw_version;
+		break;
+	case CGS_UCODE_ID_CP_MEC_JT2:
+		fw_version = adev->gfx.mec_fw_version;
+		break;
+	case CGS_UCODE_ID_RLC_G:
+		fw_version = adev->gfx.rlc_fw_version;
+		break;
+	case CGS_UCODE_ID_STORAGE:
+		break;
+	default:
+		DRM_ERROR("firmware type %d do not have version\n", type);
+		break;
 	}
 	return fw_version;
 }
-- 
2.17.1

