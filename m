Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6230976AA78
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 10:03:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CCE610E319;
	Tue,  1 Aug 2023 08:02:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out28-74.mail.aliyun.com (out28-74.mail.aliyun.com
 [115.124.28.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B38F310E31E;
 Tue,  1 Aug 2023 08:02:56 +0000 (UTC)
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.3852659|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_alarm|0.00401577-0.000669347-0.995315; FP=0|0|0|0|0|-1|-1|-1;
 HT=ay29a033018047211; MF=sunran001@208suo.com; NM=1; PH=DS; RN=7; RT=7; SR=0;
 TI=SMTPD_---.U5lXUi6_1690876967; 
Received: from localhost.localdomain(mailfrom:sunran001@208suo.com
 fp:SMTPD_---.U5lXUi6_1690876967) by smtp.aliyun-inc.com;
 Tue, 01 Aug 2023 16:02:49 +0800
From: Ran Sun <sunran001@208suo.com>
To: alexander.deucher@amd.com,
	airlied@gmail.com,
	daniel@ffwll.ch
Subject: [PATCH] drm/amdgpu: Clean up errors in vega20_baco.c
Date: Tue,  1 Aug 2023 08:02:46 +0000
Message-Id: <20230801080246.6556-1-sunran001@208suo.com>
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
ERROR: space required before the open parenthesis '('

Signed-off-by: Ran Sun <sunran001@208suo.com>
---
 drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_baco.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_baco.c b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_baco.c
index 8d99c7a5abf8..994c0d374bfa 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_baco.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_baco.c
@@ -31,8 +31,7 @@
 
 #include "amdgpu_ras.h"
 
-static const struct soc15_baco_cmd_entry clean_baco_tbl[] =
-{
+static const struct soc15_baco_cmd_entry clean_baco_tbl[] = {
 	{CMD_WRITE, SOC15_REG_ENTRY(NBIF, 0, mmBIOS_SCRATCH_6), 0, 0, 0, 0},
 	{CMD_WRITE, SOC15_REG_ENTRY(NBIF, 0, mmBIOS_SCRATCH_7), 0, 0, 0, 0},
 };
@@ -90,11 +89,11 @@ int vega20_baco_set_state(struct pp_hwmgr *hwmgr, enum BACO_STATE state)
 			data |= 0x80000000;
 			WREG32_SOC15(THM, 0, mmTHM_BACO_CNTL, data);
 
-			if(smum_send_msg_to_smc_with_parameter(hwmgr,
+			if (smum_send_msg_to_smc_with_parameter(hwmgr,
 					PPSMC_MSG_EnterBaco, 0, NULL))
 				return -EINVAL;
 		} else {
-			if(smum_send_msg_to_smc_with_parameter(hwmgr,
+			if (smum_send_msg_to_smc_with_parameter(hwmgr,
 					PPSMC_MSG_EnterBaco, 1, NULL))
 				return -EINVAL;
 		}
-- 
2.17.1

