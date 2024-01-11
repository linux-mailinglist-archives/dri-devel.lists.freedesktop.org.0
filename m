Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A8F82AA22
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 10:04:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ABD510E832;
	Thu, 11 Jan 2024 09:04:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m15.mail.163.com [45.254.50.220])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1904C10E866;
 Thu, 11 Jan 2024 09:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=yIRdTiFNyHb0/qm6Ef
 AjWM6tlpKk3ddwfpRKBB+4ypg=; b=kfnBLjdku5GJ0NIswW5tYgTmDZsdXwhSPe
 7G26bLH+jsDmSZrICt0Qpm2eq/c4bxdAuQtO0tfjnuZtGhsu4sbT7nUEsfyN9YbJ
 Mej/uelWwbJtZawfHgtn8Y082/2dOoof0mc9YyB05X67VEpM+80I9xl8YNhHpOS2
 IgYG6vRZc=
Received: from localhost.localdomain (unknown [182.148.14.173])
 by gzga-smtp-mta-g0-5 (Coremail) with SMTP id _____wDnL10Fr59l9pSXAA--.18295S2;
 Thu, 11 Jan 2024 17:04:06 +0800 (CST)
From: GuoHua Chen <chenguohua_716@163.com>
To: daniel@ffwll.ch, Xinhui.Pan@amd.com, alexander.deucher@amd.com,
 airlied@gmail.com, christian.koenig@amd.com
Subject: [PATCH] drm/radeon/kms: Clean up errors in smu7_fusion.h
Date: Thu, 11 Jan 2024 09:04:03 +0000
Message-Id: <20240111090403.13324-1-chenguohua_716@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: _____wDnL10Fr59l9pSXAA--.18295S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxXFWkZF15Jr48GFWfWry3Jwb_yoWrArWfp3
 y5Aa1agayrA34agry8Cr4rXw4ftr1UurWkCr12k3yrJ3W2kr42gF10kw40yryI9r4kuwnx
 ZwsFqF1IgrW7ZrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UFZXrUUUUU=
X-Originating-IP: [182.148.14.173]
X-CM-SenderInfo: xfkh0w5xrk3tbbxrlqqrwthudrp/1tbiqAli1mVOBlFrDAACsM
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
Cc: GuoHua Chen <chenguohua_716@163.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the following errors reported by checkpatch:

ERROR: open brace '{' following struct go on the same line
ERROR: space prohibited before open square bracket '['

Signed-off-by: GuoHua Chen <chenguohua_716@163.com>
---
 drivers/gpu/drm/radeon/smu7_fusion.h | 42 +++++++++++-----------------
 1 file changed, 16 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/radeon/smu7_fusion.h b/drivers/gpu/drm/radeon/smu7_fusion.h
index 78ada9ffd508..e130f52fe8d6 100644
--- a/drivers/gpu/drm/radeon/smu7_fusion.h
+++ b/drivers/gpu/drm/radeon/smu7_fusion.h
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

