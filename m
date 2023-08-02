Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC61B76C286
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 03:56:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E992D10E1E3;
	Wed,  2 Aug 2023 01:56:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out28-134.mail.aliyun.com (out28-134.mail.aliyun.com
 [115.124.28.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61B4A10E1E3;
 Wed,  2 Aug 2023 01:56:06 +0000 (UTC)
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07436259|-1; CH=blue; DM=|OVERLOAD|false|;
 DS=CONTINUE|ham_regular_dialog|0.00525346-3.70405e-05-0.994709;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047192; MF=sunran001@208suo.com; NM=1;
 PH=DS; RN=5; RT=5; SR=0; TI=SMTPD_---.U6KbKP9_1690941358; 
Received: from localhost.localdomain(mailfrom:sunran001@208suo.com
 fp:SMTPD_---.U6KbKP9_1690941358) by smtp.aliyun-inc.com;
 Wed, 02 Aug 2023 09:56:00 +0800
From: Ran Sun <sunran001@208suo.com>
To: alexander.deucher@amd.com
Subject: [PATCH] drm/amd/pm: Clean up errors in smu73.h
Date: Wed,  2 Aug 2023 01:55:57 +0000
Message-Id: <20230802015557.9034-1-sunran001@208suo.com>
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

ERROR: open brace '{' following struct go on the same line
ERROR: space prohibited before open square bracket '['
ERROR: "foo * bar" should be "foo *bar"

Signed-off-by: Ran Sun <sunran001@208suo.com>
---
 drivers/gpu/drm/amd/pm/powerplay/inc/smu73.h | 45 ++++++++------------
 1 file changed, 17 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/powerplay/inc/smu73.h b/drivers/gpu/drm/amd/pm/powerplay/inc/smu73.h
index c6b12a4c00db..cf4b2c3c65bc 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/inc/smu73.h
+++ b/drivers/gpu/drm/amd/pm/powerplay/inc/smu73.h
@@ -37,8 +37,7 @@ enum Poly3rdOrderCoeff {
     POLY_3RD_ORDER_COUNT
 };
 
-struct SMU7_Poly3rdOrder_Data
-{
+struct SMU7_Poly3rdOrder_Data {
     int32_t a;
     int32_t b;
     int32_t c;
@@ -51,8 +50,7 @@ struct SMU7_Poly3rdOrder_Data
 
 typedef struct SMU7_Poly3rdOrder_Data SMU7_Poly3rdOrder_Data;
 
-struct Power_Calculator_Data
-{
+struct Power_Calculator_Data {
   uint16_t NoLoadVoltage;
   uint16_t LoadVoltage;
   uint16_t Resistance;
@@ -71,8 +69,7 @@ struct Power_Calculator_Data
 
 typedef struct Power_Calculator_Data PowerCalculatorData_t;
 
-struct Gc_Cac_Weight_Data
-{
+struct Gc_Cac_Weight_Data {
   uint8_t index;
   uint32_t value;
 };
@@ -187,8 +184,7 @@ typedef struct {
 #define SMU73_THERMAL_CLAMP_MODE_COUNT 8
 
 
-struct SMU7_HystController_Data
-{
+struct SMU7_HystController_Data {
     uint16_t waterfall_up;
     uint16_t waterfall_down;
     uint16_t waterfall_limit;
@@ -199,8 +195,7 @@ struct SMU7_HystController_Data
 
 typedef struct SMU7_HystController_Data SMU7_HystController_Data;
 
-struct SMU73_PIDController
-{
+struct SMU73_PIDController {
     uint32_t Ki;
     int32_t LFWindupUpperLim;
     int32_t LFWindupLowerLim;
@@ -215,8 +210,7 @@ struct SMU73_PIDController
 
 typedef struct SMU73_PIDController SMU73_PIDController;
 
-struct SMU7_LocalDpmScoreboard
-{
+struct SMU7_LocalDpmScoreboard {
     uint32_t PercentageBusy;
 
     int32_t  PIDError;
@@ -261,8 +255,8 @@ struct SMU7_LocalDpmScoreboard
     uint8_t  DteClampMode;
     uint8_t  FpsClampMode;
 
-    uint16_t LevelResidencyCounters [SMU73_MAX_LEVELS_GRAPHICS];
-    uint16_t LevelSwitchCounters [SMU73_MAX_LEVELS_GRAPHICS];
+    uint16_t LevelResidencyCounters[SMU73_MAX_LEVELS_GRAPHICS];
+    uint16_t LevelSwitchCounters[SMU73_MAX_LEVELS_GRAPHICS];
 
     void     (*TargetStateCalculator)(uint8_t);
     void     (*SavedTargetStateCalculator)(uint8_t);
@@ -315,8 +309,7 @@ typedef uint8_t (*VoltageChangeHandler_t)(uint16_t, uint8_t);
 
 typedef uint32_t SMU_VoltageLevel;
 
-struct SMU7_VoltageScoreboard
-{
+struct SMU7_VoltageScoreboard {
     SMU_VoltageLevel TargetVoltage;
     uint16_t MaxVid;
     uint8_t  HighestVidOffset;
@@ -354,7 +347,7 @@ struct SMU7_VoltageScoreboard
 
     VoltageChangeHandler_t functionLinks[6];
 
-    uint16_t * VddcFollower1;
+    uint16_t *VddcFollower1;
 
     int16_t  Driver_OD_RequestedVidOffset1;
     int16_t  Driver_OD_RequestedVidOffset2;
@@ -366,8 +359,7 @@ typedef struct SMU7_VoltageScoreboard SMU7_VoltageScoreboard;
 // -------------------------------------------------------------------------------------------------------------------------
 #define SMU7_MAX_PCIE_LINK_SPEEDS 3 /* 0:Gen1 1:Gen2 2:Gen3 */
 
-struct SMU7_PCIeLinkSpeedScoreboard
-{
+struct SMU7_PCIeLinkSpeedScoreboard {
     uint8_t     DpmEnable;
     uint8_t     DpmRunning;
     uint8_t     DpmForce;
@@ -396,8 +388,7 @@ typedef struct SMU7_PCIeLinkSpeedScoreboard SMU7_PCIeLinkSpeedScoreboard;
 #define SMU7_SCALE_I  7
 #define SMU7_SCALE_R 12
 
-struct SMU7_PowerScoreboard
-{
+struct SMU7_PowerScoreboard {
     uint32_t GpuPower;
 
     uint32_t VddcPower;
@@ -436,8 +427,7 @@ typedef struct SMU7_PowerScoreboard SMU7_PowerScoreboard;
 #define SMU7_VCE_SCLK_HANDSHAKE_DISABLE                  0x00020000
 
 // All 'soft registers' should be uint32_t.
-struct SMU73_SoftRegisters
-{
+struct SMU73_SoftRegisters {
     uint32_t        RefClockFrequency;
     uint32_t        PmTimerPeriod;
     uint32_t        FeatureEnables;
@@ -493,8 +483,7 @@ struct SMU73_SoftRegisters
 
 typedef struct SMU73_SoftRegisters SMU73_SoftRegisters;
 
-struct SMU73_Firmware_Header
-{
+struct SMU73_Firmware_Header {
     uint32_t Digest[5];
     uint32_t Version;
     uint32_t HeaderSize;
@@ -708,9 +697,9 @@ typedef struct VFT_CELL_t VFT_CELL_t;
 
 struct VFT_TABLE_t {
   VFT_CELL_t    Cell[TEMP_RANGE_MAXSTEPS][NUM_VFT_COLUMNS];
-  uint16_t      AvfsGbv [NUM_VFT_COLUMNS];
-  uint16_t      BtcGbv  [NUM_VFT_COLUMNS];
-  uint16_t      Temperature [TEMP_RANGE_MAXSTEPS];
+  uint16_t      AvfsGbv[NUM_VFT_COLUMNS];
+  uint16_t      BtcGbv[NUM_VFT_COLUMNS];
+  uint16_t      Temperature[TEMP_RANGE_MAXSTEPS];
 
   uint8_t       NumTemperatureSteps;
   uint8_t       padding[3];
-- 
2.17.1

