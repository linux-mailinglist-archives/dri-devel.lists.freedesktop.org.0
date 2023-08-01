Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B458C76AF13
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 11:45:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA46810E381;
	Tue,  1 Aug 2023 09:44:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out28-194.mail.aliyun.com (out28-194.mail.aliyun.com
 [115.124.28.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D32010E37E;
 Tue,  1 Aug 2023 09:44:54 +0000 (UTC)
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.0743643|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_alarm|0.0623864-0.000420737-0.937193; FP=0|0|0|0|0|-1|-1|-1;
 HT=ay29a033018047211; MF=sunran001@208suo.com; NM=1; PH=DS; RN=7; RT=7; SR=0;
 TI=SMTPD_---.U5rttun_1690883085; 
Received: from localhost.localdomain(mailfrom:sunran001@208suo.com
 fp:SMTPD_---.U5rttun_1690883085) by smtp.aliyun-inc.com;
 Tue, 01 Aug 2023 17:44:47 +0800
From: Ran Sun <sunran001@208suo.com>
To: alexander.deucher@amd.com,
	airlied@gmail.com,
	daniel@ffwll.ch
Subject: [PATCH] drm/amd/pm: Clean up errors in vega20_pptable.h
Date: Tue,  1 Aug 2023 09:44:43 +0000
Message-Id: <20230801094443.7942-1-sunran001@208suo.com>
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
 .../amd/pm/powerplay/hwmgr/vega20_pptable.h   | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_pptable.h b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_pptable.h
index 2222e29405c6..b468dddbefff 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_pptable.h
+++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_pptable.h
@@ -73,14 +73,13 @@ enum ATOM_VEGA20_ODSETTING_ID {
 };
 typedef enum ATOM_VEGA20_ODSETTING_ID ATOM_VEGA20_ODSETTING_ID;
 
-typedef struct _ATOM_VEGA20_OVERDRIVE8_RECORD
-{
+typedef struct _ATOM_VEGA20_OVERDRIVE8_RECORD {
   UCHAR ucODTableRevision;
   ULONG ODFeatureCount;
-  UCHAR ODFeatureCapabilities [ATOM_VEGA20_ODFEATURE_MAX_COUNT];   //OD feature support flags
+  UCHAR ODFeatureCapabilities[ATOM_VEGA20_ODFEATURE_MAX_COUNT];   //OD feature support flags
   ULONG ODSettingCount;
-  ULONG ODSettingsMax [ATOM_VEGA20_ODSETTING_MAX_COUNT];           //Upper Limit for each OD Setting
-  ULONG ODSettingsMin [ATOM_VEGA20_ODSETTING_MAX_COUNT];           //Lower Limit for each OD Setting
+  ULONG ODSettingsMax[ATOM_VEGA20_ODSETTING_MAX_COUNT];           //Upper Limit for each OD Setting
+  ULONG ODSettingsMin[ATOM_VEGA20_ODSETTING_MAX_COUNT];           //Lower Limit for each OD Setting
 } ATOM_VEGA20_OVERDRIVE8_RECORD;
 
 enum ATOM_VEGA20_PPCLOCK_ID {
@@ -99,16 +98,14 @@ enum ATOM_VEGA20_PPCLOCK_ID {
 };
 typedef enum ATOM_VEGA20_PPCLOCK_ID ATOM_VEGA20_PPCLOCK_ID;
 
-typedef struct _ATOM_VEGA20_POWER_SAVING_CLOCK_RECORD
-{
+typedef struct _ATOM_VEGA20_POWER_SAVING_CLOCK_RECORD {
   UCHAR ucTableRevision;
   ULONG PowerSavingClockCount;                                 // Count of PowerSavingClock Mode
-  ULONG PowerSavingClockMax  [ATOM_VEGA20_PPCLOCK_MAX_COUNT];      // PowerSavingClock Mode Clock Maximum array In MHz
-  ULONG PowerSavingClockMin  [ATOM_VEGA20_PPCLOCK_MAX_COUNT];      // PowerSavingClock Mode Clock Minimum array In MHz
+  ULONG PowerSavingClockMax[ATOM_VEGA20_PPCLOCK_MAX_COUNT];      // PowerSavingClock Mode Clock Maximum array In MHz
+  ULONG PowerSavingClockMin[ATOM_VEGA20_PPCLOCK_MAX_COUNT];      // PowerSavingClock Mode Clock Minimum array In MHz
 } ATOM_VEGA20_POWER_SAVING_CLOCK_RECORD;
 
-typedef struct _ATOM_VEGA20_POWERPLAYTABLE
-{
+typedef struct _ATOM_VEGA20_POWERPLAYTABLE {
       struct atom_common_table_header sHeader;
       UCHAR  ucTableRevision;
       USHORT usTableSize;
-- 
2.17.1

