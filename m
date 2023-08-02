Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62ED976C222
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 03:23:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BECB910E14E;
	Wed,  2 Aug 2023 01:23:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out28-146.mail.aliyun.com (out28-146.mail.aliyun.com
 [115.124.28.146])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16FDB10E14E;
 Wed,  2 Aug 2023 01:23:12 +0000 (UTC)
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07436496|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.00356363-8.25022e-05-0.996354;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047201; MF=sunran001@208suo.com; NM=1;
 PH=DS; RN=5; RT=5; SR=0; TI=SMTPD_---.U6IxzhY_1690939383; 
Received: from localhost.localdomain(mailfrom:sunran001@208suo.com
 fp:SMTPD_---.U6IxzhY_1690939383) by smtp.aliyun-inc.com;
 Wed, 02 Aug 2023 09:23:05 +0800
From: Ran Sun <sunran001@208suo.com>
To: alexander.deucher@amd.com
Subject: [PATCH] drm/amd/pm: Clean up errors in smu71.h
Date: Wed,  2 Aug 2023 01:23:02 +0000
Message-Id: <20230802012302.8498-1-sunran001@208suo.com>
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

Signed-off-by: Ran Sun <sunran001@208suo.com>
---
 drivers/gpu/drm/amd/pm/powerplay/inc/smu71.h | 22 +++++++-------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/powerplay/inc/smu71.h b/drivers/gpu/drm/amd/pm/powerplay/inc/smu71.h
index 71c9b2d28640..b5f177412769 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/inc/smu71.h
+++ b/drivers/gpu/drm/amd/pm/powerplay/inc/smu71.h
@@ -118,8 +118,7 @@ typedef struct {
 
 #endif
 
-struct SMU71_PIDController
-{
+struct SMU71_PIDController {
     uint32_t Ki;
     int32_t LFWindupUpperLim;
     int32_t LFWindupLowerLim;
@@ -133,8 +132,7 @@ struct SMU71_PIDController
 
 typedef struct SMU71_PIDController SMU71_PIDController;
 
-struct SMU7_LocalDpmScoreboard
-{
+struct SMU7_LocalDpmScoreboard {
     uint32_t PercentageBusy;
 
     int32_t  PIDError;
@@ -179,8 +177,8 @@ struct SMU7_LocalDpmScoreboard
     uint8_t  DteClampMode;
     uint8_t  FpsClampMode;
 
-    uint16_t LevelResidencyCounters [SMU71_MAX_LEVELS_GRAPHICS];
-    uint16_t LevelSwitchCounters [SMU71_MAX_LEVELS_GRAPHICS];
+    uint16_t LevelResidencyCounters[SMU71_MAX_LEVELS_GRAPHICS];
+    uint16_t LevelSwitchCounters[SMU71_MAX_LEVELS_GRAPHICS];
 
     void     (*TargetStateCalculator)(uint8_t);
     void     (*SavedTargetStateCalculator)(uint8_t);
@@ -200,8 +198,7 @@ typedef struct SMU7_LocalDpmScoreboard SMU7_LocalDpmScoreboard;
 
 #define SMU7_MAX_VOLTAGE_CLIENTS 12
 
-struct SMU7_VoltageScoreboard
-{
+struct SMU7_VoltageScoreboard {
     uint16_t CurrentVoltage;
     uint16_t HighestVoltage;
     uint16_t MaxVid;
@@ -325,8 +322,7 @@ typedef struct SMU7_PowerScoreboard SMU7_PowerScoreboard;
 
 // --------------------------------------------------------------------------------------------------
 
-struct SMU7_ThermalScoreboard
-{
+struct SMU7_ThermalScoreboard {
    int16_t  GpuLimit;
    int16_t  GpuHyst;
    uint16_t CurrGnbTemp;
@@ -360,8 +356,7 @@ typedef struct SMU7_ThermalScoreboard SMU7_ThermalScoreboard;
 #define SMU7_VCE_SCLK_HANDSHAKE_DISABLE                  0x00020000
 
 // All 'soft registers' should be uint32_t.
-struct SMU71_SoftRegisters
-{
+struct SMU71_SoftRegisters {
     uint32_t        RefClockFrequency;
     uint32_t        PmTimerPeriod;
     uint32_t        FeatureEnables;
@@ -413,8 +408,7 @@ struct SMU71_SoftRegisters
 
 typedef struct SMU71_SoftRegisters SMU71_SoftRegisters;
 
-struct SMU71_Firmware_Header
-{
+struct SMU71_Firmware_Header {
     uint32_t Digest[5];
     uint32_t Version;
     uint32_t HeaderSize;
-- 
2.17.1

