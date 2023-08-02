Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B17E576C23A
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 03:29:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C29E710E14F;
	Wed,  2 Aug 2023 01:29:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out28-104.mail.aliyun.com (out28-104.mail.aliyun.com
 [115.124.28.104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97EEA10E14F;
 Wed,  2 Aug 2023 01:29:14 +0000 (UTC)
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.0743626|-1; CH=blue; DM=|OVERLOAD|false|;
 DS=CONTINUE|ham_system_inform|0.0504505-0.0256508-0.923899;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047202; MF=sunran001@208suo.com; NM=1;
 PH=DS; RN=5; RT=5; SR=0; TI=SMTPD_---.U6J0HG2_1690939745; 
Received: from localhost.localdomain(mailfrom:sunran001@208suo.com
 fp:SMTPD_---.U6J0HG2_1690939745) by smtp.aliyun-inc.com;
 Wed, 02 Aug 2023 09:29:07 +0800
From: Ran Sun <sunran001@208suo.com>
To: alexander.deucher@amd.com
Subject: [PATCH] drm/amd/pm: Clean up errors in smu7_fusion.h
Date: Wed,  2 Aug 2023 01:29:03 +0000
Message-Id: <20230802012903.8589-1-sunran001@208suo.com>
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
 .../drm/amd/pm/powerplay/inc/smu7_fusion.h    | 42 +++++++------------
 1 file changed, 16 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/powerplay/inc/smu7_fusion.h b/drivers/gpu/drm/amd/pm/powerplay/inc/smu7_fusion.h
index 78ada9ffd508..e130f52fe8d6 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/inc/smu7_fusion.h
+++ b/drivers/gpu/drm/amd/pm/powerplay/inc/smu7_fusion.h
@@ -36,8 +36,7 @@
 #define SMU7_NUM_NON_TES 2
 
 // All 'soft registers' should be uint32_t.
-struct SMU7_SoftRegisters
-{
+struct SMU7_SoftRegisters {
     uint32_t        RefClockFrequency;
     uint32_t        PmTimerP;
     uint32_t        FeatureEnables;
@@ -80,8 +79,7 @@ struct SMU7_SoftRegisters
 
 typedef struct SMU7_SoftRegisters SMU7_SoftRegisters;
 
-struct SMU7_Fusion_GraphicsLevel
-{
+struct SMU7_Fusion_GraphicsLevel {
     uint32_t    MinVddNb;
 
     uint32_t    SclkFrequency;
@@ -111,8 +109,7 @@ struct SMU7_Fusion_GraphicsLevel
 
 typedef struct SMU7_Fusion_GraphicsLevel SMU7_Fusion_GraphicsLevel;
 
-struct SMU7_Fusion_GIOLevel
-{
+struct SMU7_Fusion_GIOLevel {
     uint8_t     EnabledForActivity;
     uint8_t     LclkDid;
     uint8_t     Vid;
@@ -137,8 +134,7 @@ struct SMU7_Fusion_GIOLevel
 typedef struct SMU7_Fusion_GIOLevel SMU7_Fusion_GIOLevel;
 
 // UVD VCLK/DCLK state (level) definition.
-struct SMU7_Fusion_UvdLevel
-{
+struct SMU7_Fusion_UvdLevel {
     uint32_t VclkFrequency;
     uint32_t DclkFrequency;
     uint16_t MinVddNb;
@@ -155,8 +151,7 @@ struct SMU7_Fusion_UvdLevel
 typedef struct SMU7_Fusion_UvdLevel SMU7_Fusion_UvdLevel;
 
 // Clocks for other external blocks (VCE, ACP, SAMU).
-struct SMU7_Fusion_ExtClkLevel
-{
+struct SMU7_Fusion_ExtClkLevel {
     uint32_t Frequency;
     uint16_t MinVoltage;
     uint8_t  Divider;
@@ -166,8 +161,7 @@ struct SMU7_Fusion_ExtClkLevel
 };
 typedef struct SMU7_Fusion_ExtClkLevel SMU7_Fusion_ExtClkLevel;
 
-struct SMU7_Fusion_ACPILevel
-{
+struct SMU7_Fusion_ACPILevel {
     uint32_t    Flags;
     uint32_t    MinVddNb;
     uint32_t    SclkFrequency;
@@ -181,8 +175,7 @@ struct SMU7_Fusion_ACPILevel
 
 typedef struct SMU7_Fusion_ACPILevel SMU7_Fusion_ACPILevel;
 
-struct SMU7_Fusion_NbDpm
-{
+struct SMU7_Fusion_NbDpm {
     uint8_t DpmXNbPsHi;
     uint8_t DpmXNbPsLo;
     uint8_t Dpm0PgNbPsHi;
@@ -197,8 +190,7 @@ struct SMU7_Fusion_NbDpm
 
 typedef struct SMU7_Fusion_NbDpm SMU7_Fusion_NbDpm;
 
-struct SMU7_Fusion_StateInfo
-{
+struct SMU7_Fusion_StateInfo {
     uint32_t SclkFrequency;
     uint32_t LclkFrequency;
     uint32_t VclkFrequency;
@@ -214,8 +206,7 @@ struct SMU7_Fusion_StateInfo
 
 typedef struct SMU7_Fusion_StateInfo SMU7_Fusion_StateInfo;
 
-struct SMU7_Fusion_DpmTable
-{
+struct SMU7_Fusion_DpmTable {
     uint32_t                            SystemFlags;
 
     SMU7_PIDController                  GraphicsPIDController;
@@ -230,12 +221,12 @@ struct SMU7_Fusion_DpmTable
     uint8_t                            SamuLevelCount;
     uint16_t                           FpsHighT;
 
-    SMU7_Fusion_GraphicsLevel         GraphicsLevel           [SMU__NUM_SCLK_DPM_STATE];
+    SMU7_Fusion_GraphicsLevel         GraphicsLevel[SMU__NUM_SCLK_DPM_STATE];
     SMU7_Fusion_ACPILevel             ACPILevel;
-    SMU7_Fusion_UvdLevel              UvdLevel                [SMU7_MAX_LEVELS_UVD];
-    SMU7_Fusion_ExtClkLevel           VceLevel                [SMU7_MAX_LEVELS_VCE];
-    SMU7_Fusion_ExtClkLevel           AcpLevel                [SMU7_MAX_LEVELS_ACP];
-    SMU7_Fusion_ExtClkLevel           SamuLevel               [SMU7_MAX_LEVELS_SAMU];
+    SMU7_Fusion_UvdLevel              UvdLevel[SMU7_MAX_LEVELS_UVD];
+    SMU7_Fusion_ExtClkLevel           VceLevel[SMU7_MAX_LEVELS_VCE];
+    SMU7_Fusion_ExtClkLevel           AcpLevel[SMU7_MAX_LEVELS_ACP];
+    SMU7_Fusion_ExtClkLevel           SamuLevel[SMU7_MAX_LEVELS_SAMU];
 
     uint8_t                           UvdBootLevel;
     uint8_t                           VceBootLevel;
@@ -266,10 +257,9 @@ struct SMU7_Fusion_DpmTable
 
 };
 
-struct SMU7_Fusion_GIODpmTable
-{
+struct SMU7_Fusion_GIODpmTable {
 
-    SMU7_Fusion_GIOLevel              GIOLevel                [SMU7_MAX_LEVELS_GIO];
+    SMU7_Fusion_GIOLevel              GIOLevel[SMU7_MAX_LEVELS_GIO];
 
     SMU7_PIDController                GioPIDController;
 
-- 
2.17.1

