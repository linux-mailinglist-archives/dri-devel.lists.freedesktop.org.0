Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B6CA676A78E
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 05:38:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACF5D10E308;
	Tue,  1 Aug 2023 03:37:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out28-50.mail.aliyun.com (out28-50.mail.aliyun.com
 [115.124.28.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA05D10E306;
 Tue,  1 Aug 2023 03:37:51 +0000 (UTC)
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07608756|-1; CH=green;
 DM=|CONTINUE|false|; DS=CONTINUE|ham_alarm|0.00974679-0.00027722-0.989976;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047212; MF=sunran001@208suo.com; NM=1;
 PH=DS; RN=7; RT=7; SR=0; TI=SMTPD_---.U5KM4oz_1690861062; 
Received: from localhost.localdomain(mailfrom:sunran001@208suo.com
 fp:SMTPD_---.U5KM4oz_1690861062) by smtp.aliyun-inc.com;
 Tue, 01 Aug 2023 11:37:44 +0800
From: Ran Sun <sunran001@208suo.com>
To: alexander.deucher@amd.com,
	airlied@gmail.com,
	daniel@ffwll.ch
Subject: [PATCH] drm/amd/pm: Clean up errors in vega10_powertune.c
Date: Tue,  1 Aug 2023 03:37:41 +0000
Message-Id: <20230801033741.5664-1-sunran001@208suo.com>
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
ERROR: space prohibited after that open parenthesis '('

Signed-off-by: Ran Sun <sunran001@208suo.com>
---
 .../amd/pm/powerplay/hwmgr/vega10_powertune.c | 89 +++++++------------
 1 file changed, 31 insertions(+), 58 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_powertune.c b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_powertune.c
index 309a9d3bc1b7..3007b054c873 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_powertune.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_powertune.c
@@ -30,8 +30,7 @@
 #include "pp_debug.h"
 #include "soc15_common.h"
 
-static const struct vega10_didt_config_reg SEDiDtTuningCtrlConfig_Vega10[] =
-{
+static const struct vega10_didt_config_reg SEDiDtTuningCtrlConfig_Vega10[] = {
 /* ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  *      Offset                             Mask                                                 Shift                                                  Value
  * ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
@@ -55,8 +54,7 @@ static const struct vega10_didt_config_reg SEDiDtTuningCtrlConfig_Vega10[] =
 	{   0xFFFFFFFF  }  /* End of list */
 };
 
-static const struct vega10_didt_config_reg SEDiDtCtrl3Config_vega10[] =
-{
+static const struct vega10_didt_config_reg SEDiDtCtrl3Config_vega10[] = {
 /* ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  *      Offset               Mask                                                     Shift                                                            Value
  * ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
@@ -120,8 +118,7 @@ static const struct vega10_didt_config_reg SEDiDtCtrl3Config_vega10[] =
 	{   0xFFFFFFFF  }  /* End of list */
 };
 
-static const struct vega10_didt_config_reg SEDiDtCtrl2Config_Vega10[] =
-{
+static const struct vega10_didt_config_reg SEDiDtCtrl2Config_Vega10[] = {
 /* ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  *      Offset                            Mask                                                 Shift                                                  Value
  * ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
@@ -149,8 +146,7 @@ static const struct vega10_didt_config_reg SEDiDtCtrl2Config_Vega10[] =
 	{   0xFFFFFFFF  }  /* End of list */
 };
 
-static const struct vega10_didt_config_reg SEDiDtCtrl1Config_Vega10[] =
-{
+static const struct vega10_didt_config_reg SEDiDtCtrl1Config_Vega10[] = {
 /* ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  *      Offset                             Mask                                                 Shift                                                  Value
  * ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
@@ -172,8 +168,7 @@ static const struct vega10_didt_config_reg SEDiDtCtrl1Config_Vega10[] =
 };
 
 
-static const struct vega10_didt_config_reg SEDiDtWeightConfig_Vega10[] =
-{
+static const struct vega10_didt_config_reg SEDiDtWeightConfig_Vega10[] = {
 /* ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  *      Offset                             Mask                                                  Shift                                                 Value
  * ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
@@ -201,8 +196,7 @@ static const struct vega10_didt_config_reg SEDiDtWeightConfig_Vega10[] =
 	{   0xFFFFFFFF  }  /* End of list */
 };
 
-static const struct vega10_didt_config_reg SEDiDtCtrl0Config_Vega10[] =
-{
+static const struct vega10_didt_config_reg SEDiDtCtrl0Config_Vega10[] = {
 /* ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  *      Offset                             Mask                                                 Shift                                                  Value
  * ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
@@ -260,8 +254,7 @@ static const struct vega10_didt_config_reg SEDiDtCtrl0Config_Vega10[] =
 };
 
 
-static const struct vega10_didt_config_reg SEDiDtStallCtrlConfig_vega10[] =
-{
+static const struct vega10_didt_config_reg SEDiDtStallCtrlConfig_vega10[] = {
 /* ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  *      Offset                   Mask                                                     Shift                                                      Value
  * ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
@@ -293,8 +286,7 @@ static const struct vega10_didt_config_reg SEDiDtStallCtrlConfig_vega10[] =
 	{   0xFFFFFFFF  }  /* End of list */
 };
 
-static const struct vega10_didt_config_reg SEDiDtStallPatternConfig_vega10[] =
-{
+static const struct vega10_didt_config_reg SEDiDtStallPatternConfig_vega10[] = {
 /* ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  *      Offset                        Mask                                                      Shift                                                    Value
  * ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
@@ -362,8 +354,7 @@ static const struct vega10_didt_config_reg SEDiDtStallPatternConfig_vega10[] =
 	{   0xFFFFFFFF  }  /* End of list */
 };
 
-static const struct vega10_didt_config_reg SELCacConfig_Vega10[] =
-{
+static const struct vega10_didt_config_reg SELCacConfig_Vega10[] = {
 /* ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  *      Offset                             Mask                                                 Shift                                                  Value
  * ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
@@ -401,8 +392,7 @@ static const struct vega10_didt_config_reg SELCacConfig_Vega10[] =
 };
 
 
-static const struct vega10_didt_config_reg SEEDCStallPatternConfig_Vega10[] =
-{
+static const struct vega10_didt_config_reg SEEDCStallPatternConfig_Vega10[] = {
 /* ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  *      Offset                             Mask                                                 Shift                                                  Value
  * ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
@@ -431,8 +421,7 @@ static const struct vega10_didt_config_reg SEEDCStallPatternConfig_Vega10[] =
 	{   0xFFFFFFFF  }  /* End of list */
 };
 
-static const struct vega10_didt_config_reg SEEDCForceStallPatternConfig_Vega10[] =
-{
+static const struct vega10_didt_config_reg SEEDCForceStallPatternConfig_Vega10[] = {
 /* ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  *      Offset                             Mask                                                 Shift                                                  Value
  * ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
@@ -451,8 +440,7 @@ static const struct vega10_didt_config_reg SEEDCForceStallPatternConfig_Vega10[]
 	{   0xFFFFFFFF  }  /* End of list */
 };
 
-static const struct vega10_didt_config_reg SEEDCStallDelayConfig_Vega10[] =
-{
+static const struct vega10_didt_config_reg SEEDCStallDelayConfig_Vega10[] = {
 /* ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  *      Offset                             Mask                                                 Shift                                                  Value
  * ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
@@ -478,8 +466,7 @@ static const struct vega10_didt_config_reg SEEDCStallDelayConfig_Vega10[] =
 	{   0xFFFFFFFF  }  /* End of list */
 };
 
-static const struct vega10_didt_config_reg SEEDCThresholdConfig_Vega10[] =
-{
+static const struct vega10_didt_config_reg SEEDCThresholdConfig_Vega10[] = {
 /* ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  *      Offset                             Mask                                                 Shift                                                  Value
  * ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
@@ -492,8 +479,7 @@ static const struct vega10_didt_config_reg SEEDCThresholdConfig_Vega10[] =
 	{   0xFFFFFFFF  }  /* End of list */
 };
 
-static const struct vega10_didt_config_reg SEEDCCtrlResetConfig_Vega10[] =
-{
+static const struct vega10_didt_config_reg SEEDCCtrlResetConfig_Vega10[] = {
 /* ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  *      Offset                             Mask                                                 Shift                                                  Value
  * ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
@@ -514,8 +500,7 @@ static const struct vega10_didt_config_reg SEEDCCtrlResetConfig_Vega10[] =
 	{   0xFFFFFFFF  }  /* End of list */
 };
 
-static const struct vega10_didt_config_reg SEEDCCtrlConfig_Vega10[] =
-{
+static const struct vega10_didt_config_reg SEEDCCtrlConfig_Vega10[] = {
 /* ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  *      Offset                             Mask                                                 Shift                                                  Value
  * ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
@@ -536,8 +521,7 @@ static const struct vega10_didt_config_reg SEEDCCtrlConfig_Vega10[] =
 	{   0xFFFFFFFF  }  /* End of list */
 };
 
-static const struct vega10_didt_config_reg SEEDCCtrlForceStallConfig_Vega10[] =
-{
+static const struct vega10_didt_config_reg SEEDCCtrlForceStallConfig_Vega10[] = {
 /* ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  *      Offset                             Mask                                                 Shift                                                  Value
  * ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
@@ -571,8 +555,7 @@ static const struct vega10_didt_config_reg SEEDCCtrlForceStallConfig_Vega10[] =
 	{   0xFFFFFFFF  }  /* End of list */
 };
 
-static const struct vega10_didt_config_reg    GCDiDtDroopCtrlConfig_vega10[] =
-{
+static const struct vega10_didt_config_reg    GCDiDtDroopCtrlConfig_vega10[] = {
 /* ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  *      Offset                             Mask                                                 Shift                                                  Value
  * ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
@@ -586,8 +569,7 @@ static const struct vega10_didt_config_reg    GCDiDtDroopCtrlConfig_vega10[] =
 	{   0xFFFFFFFF  }  /* End of list */
 };
 
-static const struct vega10_didt_config_reg    GCDiDtCtrl0Config_vega10[] =
-{
+static const struct vega10_didt_config_reg    GCDiDtCtrl0Config_vega10[] = {
 /* ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  *      Offset                             Mask                                                 Shift                                                  Value
  * ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
@@ -601,8 +583,7 @@ static const struct vega10_didt_config_reg    GCDiDtCtrl0Config_vega10[] =
 };
 
 
-static const struct vega10_didt_config_reg   PSMSEEDCStallPatternConfig_Vega10[] =
-{
+static const struct vega10_didt_config_reg   PSMSEEDCStallPatternConfig_Vega10[] = {
 /* ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  *      Offset                             Mask                                                 Shift                                                  Value
  * ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
@@ -621,8 +602,7 @@ static const struct vega10_didt_config_reg   PSMSEEDCStallPatternConfig_Vega10[]
 	{   0xFFFFFFFF  }  /* End of list */
 };
 
-static const struct vega10_didt_config_reg   PSMSEEDCStallDelayConfig_Vega10[] =
-{
+static const struct vega10_didt_config_reg   PSMSEEDCStallDelayConfig_Vega10[] = {
 /* ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  *      Offset                             Mask                                                 Shift                                                  Value
  * ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
@@ -651,8 +631,7 @@ static const struct vega10_didt_config_reg   PSMSEEDCStallDelayConfig_Vega10[] =
 	{   0xFFFFFFFF  }  /* End of list */
 };
 
-static const struct vega10_didt_config_reg   PSMSEEDCCtrlResetConfig_Vega10[] =
-{
+static const struct vega10_didt_config_reg   PSMSEEDCCtrlResetConfig_Vega10[] = {
 /* ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  *      Offset                             Mask                                                 Shift                                                  Value
  * ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
@@ -673,8 +652,7 @@ static const struct vega10_didt_config_reg   PSMSEEDCCtrlResetConfig_Vega10[] =
 	{   0xFFFFFFFF  }  /* End of list */
 };
 
-static const struct vega10_didt_config_reg   PSMSEEDCCtrlConfig_Vega10[] =
-{
+static const struct vega10_didt_config_reg   PSMSEEDCCtrlConfig_Vega10[] = {
 /* ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  *      Offset                             Mask                                                 Shift                                                  Value
  * ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
@@ -695,8 +673,7 @@ static const struct vega10_didt_config_reg   PSMSEEDCCtrlConfig_Vega10[] =
 	{   0xFFFFFFFF  }  /* End of list */
 };
 
-static const struct vega10_didt_config_reg   PSMGCEDCDroopCtrlConfig_vega10[] =
-{
+static const struct vega10_didt_config_reg   PSMGCEDCDroopCtrlConfig_vega10[] = {
 /* ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  *      Offset                             Mask                                                 Shift                                                  Value
  * ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
@@ -710,8 +687,7 @@ static const struct vega10_didt_config_reg   PSMGCEDCDroopCtrlConfig_vega10[] =
 	{   0xFFFFFFFF  }  /* End of list */
 };
 
-static const struct vega10_didt_config_reg   PSMGCEDCCtrlResetConfig_vega10[] =
-{
+static const struct vega10_didt_config_reg   PSMGCEDCCtrlResetConfig_vega10[] = {
 /* ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  *      Offset                             Mask                                                 Shift                                                  Value
  * ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
@@ -726,8 +702,7 @@ static const struct vega10_didt_config_reg   PSMGCEDCCtrlResetConfig_vega10[] =
 	{   0xFFFFFFFF  }  /* End of list */
 };
 
-static const struct vega10_didt_config_reg   PSMGCEDCCtrlConfig_vega10[] =
-{
+static const struct vega10_didt_config_reg   PSMGCEDCCtrlConfig_vega10[] = {
 /* ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  *      Offset                             Mask                                                 Shift                                                  Value
  * ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
@@ -742,8 +717,7 @@ static const struct vega10_didt_config_reg   PSMGCEDCCtrlConfig_vega10[] =
 	{   0xFFFFFFFF  }  /* End of list */
 };
 
-static const struct vega10_didt_config_reg    AvfsPSMResetConfig_vega10[]=
-{
+static const struct vega10_didt_config_reg    AvfsPSMResetConfig_vega10[] = {
 /* ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  *      Offset                             Mask                                                 Shift                                                  Value
  * ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
@@ -756,8 +730,7 @@ static const struct vega10_didt_config_reg    AvfsPSMResetConfig_vega10[]=
 	{   0xFFFFFFFF  }  /* End of list */
 };
 
-static const struct vega10_didt_config_reg    AvfsPSMInitConfig_vega10[] =
-{
+static const struct vega10_didt_config_reg    AvfsPSMInitConfig_vega10[] = {
 /* ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  *      Offset                             Mask                                                 Shift                                                  Value
  * ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
@@ -919,7 +892,7 @@ static int vega10_enable_cac_driving_se_didt_config(struct pp_hwmgr *hwmgr)
 
 	mutex_lock(&adev->grbm_idx_mutex);
 	for (count = 0; count < num_se; count++) {
-		data = GRBM_GFX_INDEX__INSTANCE_BROADCAST_WRITES_MASK | GRBM_GFX_INDEX__SH_BROADCAST_WRITES_MASK | ( count << GRBM_GFX_INDEX__SE_INDEX__SHIFT);
+		data = GRBM_GFX_INDEX__INSTANCE_BROADCAST_WRITES_MASK | GRBM_GFX_INDEX__SH_BROADCAST_WRITES_MASK | (count << GRBM_GFX_INDEX__SE_INDEX__SHIFT);
 		WREG32_SOC15(GC, 0, mmGRBM_GFX_INDEX, data);
 
 		result =  vega10_program_didt_config_registers(hwmgr, SEDiDtStallCtrlConfig_vega10, VEGA10_CONFIGREG_DIDT);
@@ -970,7 +943,7 @@ static int vega10_enable_psm_gc_didt_config(struct pp_hwmgr *hwmgr)
 
 	mutex_lock(&adev->grbm_idx_mutex);
 	for (count = 0; count < num_se; count++) {
-		data = GRBM_GFX_INDEX__INSTANCE_BROADCAST_WRITES_MASK | GRBM_GFX_INDEX__SH_BROADCAST_WRITES_MASK | ( count << GRBM_GFX_INDEX__SE_INDEX__SHIFT);
+		data = GRBM_GFX_INDEX__INSTANCE_BROADCAST_WRITES_MASK | GRBM_GFX_INDEX__SH_BROADCAST_WRITES_MASK | (count << GRBM_GFX_INDEX__SE_INDEX__SHIFT);
 		WREG32_SOC15(GC, 0, mmGRBM_GFX_INDEX, data);
 
 		result = vega10_program_didt_config_registers(hwmgr, SEDiDtStallCtrlConfig_vega10, VEGA10_CONFIGREG_DIDT);
@@ -1031,7 +1004,7 @@ static int vega10_enable_se_edc_config(struct pp_hwmgr *hwmgr)
 
 	mutex_lock(&adev->grbm_idx_mutex);
 	for (count = 0; count < num_se; count++) {
-		data = GRBM_GFX_INDEX__INSTANCE_BROADCAST_WRITES_MASK | GRBM_GFX_INDEX__SH_BROADCAST_WRITES_MASK | ( count << GRBM_GFX_INDEX__SE_INDEX__SHIFT);
+		data = GRBM_GFX_INDEX__INSTANCE_BROADCAST_WRITES_MASK | GRBM_GFX_INDEX__SH_BROADCAST_WRITES_MASK | (count << GRBM_GFX_INDEX__SE_INDEX__SHIFT);
 		WREG32_SOC15(GC, 0, mmGRBM_GFX_INDEX, data);
 		result = vega10_program_didt_config_registers(hwmgr, SEDiDtWeightConfig_Vega10, VEGA10_CONFIGREG_DIDT);
 		result |= vega10_program_didt_config_registers(hwmgr, SEEDCStallPatternConfig_Vega10, VEGA10_CONFIGREG_DIDT);
@@ -1081,7 +1054,7 @@ static int vega10_enable_psm_gc_edc_config(struct pp_hwmgr *hwmgr)
 
 	mutex_lock(&adev->grbm_idx_mutex);
 	for (count = 0; count < num_se; count++) {
-		data = GRBM_GFX_INDEX__INSTANCE_BROADCAST_WRITES_MASK | GRBM_GFX_INDEX__SH_BROADCAST_WRITES_MASK | ( count << GRBM_GFX_INDEX__SE_INDEX__SHIFT);
+		data = GRBM_GFX_INDEX__INSTANCE_BROADCAST_WRITES_MASK | GRBM_GFX_INDEX__SH_BROADCAST_WRITES_MASK | (count << GRBM_GFX_INDEX__SE_INDEX__SHIFT);
 		WREG32_SOC15(GC, 0, mmGRBM_GFX_INDEX, data);
 		result = vega10_program_didt_config_registers(hwmgr, PSMSEEDCStallPatternConfig_Vega10, VEGA10_CONFIGREG_DIDT);
 		result |= vega10_program_didt_config_registers(hwmgr, PSMSEEDCStallDelayConfig_Vega10, VEGA10_CONFIGREG_DIDT);
-- 
2.17.1

