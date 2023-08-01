Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ECDD076A8A3
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 08:05:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C53610E30C;
	Tue,  1 Aug 2023 06:04:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out28-50.mail.aliyun.com (out28-50.mail.aliyun.com
 [115.124.28.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17B2010E30C;
 Tue,  1 Aug 2023 06:04:53 +0000 (UTC)
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07723793|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.0904852-0.0047855-0.904729;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047194; MF=sunran001@208suo.com; NM=1;
 PH=DS; RN=7; RT=7; SR=0; TI=SMTPD_---.U5eilLU_1690869884; 
Received: from localhost.localdomain(mailfrom:sunran001@208suo.com
 fp:SMTPD_---.U5eilLU_1690869884) by smtp.aliyun-inc.com;
 Tue, 01 Aug 2023 14:04:46 +0800
From: Ran Sun <sunran001@208suo.com>
To: alexander.deucher@amd.com,
	airlied@gmail.com,
	daniel@ffwll.ch
Subject: [PATCH] drm/amd/pm: Clean up errors in vega12_pptable.h
Date: Tue,  1 Aug 2023 06:04:43 +0000
Message-Id: <20230801060443.6090-1-sunran001@208suo.com>
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
 .../gpu/drm/amd/pm/powerplay/hwmgr/vega12_pptable.h   | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega12_pptable.h b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega12_pptable.h
index bf4f5095b80d..9b8435a4d306 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega12_pptable.h
+++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega12_pptable.h
@@ -72,8 +72,7 @@ enum ATOM_VEGA12_PPCLOCK_ID {
 typedef enum ATOM_VEGA12_PPCLOCK_ID ATOM_VEGA12_PPCLOCK_ID;
 
 
-typedef struct _ATOM_VEGA12_POWERPLAYTABLE
-{
+typedef struct _ATOM_VEGA12_POWERPLAYTABLE {
       struct atom_common_table_header sHeader;
       UCHAR  ucTableRevision;
       USHORT usTableSize;
@@ -92,11 +91,11 @@ typedef struct _ATOM_VEGA12_POWERPLAYTABLE
       USHORT usODPowerSavePowerLimit;
       USHORT usSoftwareShutdownTemp;
 
-      ULONG PowerSavingClockMax  [ATOM_VEGA12_PPCLOCK_COUNT];
-      ULONG PowerSavingClockMin  [ATOM_VEGA12_PPCLOCK_COUNT];
+      ULONG PowerSavingClockMax[ATOM_VEGA12_PPCLOCK_COUNT];
+      ULONG PowerSavingClockMin[ATOM_VEGA12_PPCLOCK_COUNT];
 
-      ULONG ODSettingsMax [ATOM_VEGA12_ODSETTING_COUNT];
-      ULONG ODSettingsMin [ATOM_VEGA12_ODSETTING_COUNT];
+      ULONG ODSettingsMax[ATOM_VEGA12_ODSETTING_COUNT];
+      ULONG ODSettingsMin[ATOM_VEGA12_ODSETTING_COUNT];
 
       USHORT usReserve[5];
 
-- 
2.17.1

