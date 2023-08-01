Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 806CA76A752
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 05:09:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F9C610E304;
	Tue,  1 Aug 2023 03:09:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out28-196.mail.aliyun.com (out28-196.mail.aliyun.com
 [115.124.28.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7FD410E0CD;
 Tue,  1 Aug 2023 03:09:03 +0000 (UTC)
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07528824|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.00859234-0.000375804-0.991032;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047187; MF=sunran001@208suo.com; NM=1;
 PH=DS; RN=7; RT=7; SR=0; TI=SMTPD_---.U5IZH8f_1690859332; 
Received: from localhost.localdomain(mailfrom:sunran001@208suo.com
 fp:SMTPD_---.U5IZH8f_1690859332) by smtp.aliyun-inc.com;
 Tue, 01 Aug 2023 11:08:55 +0800
From: Ran Sun <sunran001@208suo.com>
To: alexander.deucher@amd.com,
	airlied@gmail.com,
	daniel@ffwll.ch
Subject: [PATCH] drm/amd/pm: Clean up errors in smu10_hwmgr.c
Date: Tue,  1 Aug 2023 03:08:51 +0000
Message-Id: <20230801030851.5158-1-sunran001@208suo.com>
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

ERROR: spaces required around that '=' (ctx:VxW)
ERROR: space required after that ',' (ctx:VxV)

Signed-off-by: Ran Sun <sunran001@208suo.com>
---
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c
index 86d6e88c7386..02ba68d7c654 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c
@@ -430,37 +430,37 @@ static int smu10_apply_state_adjust_rules(struct pp_hwmgr *hwmgr,
 }
 
 /* temporary hardcoded clock voltage breakdown tables */
-static const DpmClock_t VddDcfClk[]= {
+static const DpmClock_t VddDcfClk[] = {
 	{ 300, 2600},
 	{ 600, 3200},
 	{ 600, 3600},
 };
 
-static const DpmClock_t VddSocClk[]= {
+static const DpmClock_t VddSocClk[] = {
 	{ 478, 2600},
 	{ 722, 3200},
 	{ 722, 3600},
 };
 
-static const DpmClock_t VddFClk[]= {
+static const DpmClock_t VddFClk[] = {
 	{ 400, 2600},
 	{1200, 3200},
 	{1200, 3600},
 };
 
-static const DpmClock_t VddDispClk[]= {
+static const DpmClock_t VddDispClk[] = {
 	{ 435, 2600},
 	{ 661, 3200},
 	{1086, 3600},
 };
 
-static const DpmClock_t VddDppClk[]= {
+static const DpmClock_t VddDppClk[] = {
 	{ 435, 2600},
 	{ 661, 3200},
 	{ 661, 3600},
 };
 
-static const DpmClock_t VddPhyClk[]= {
+static const DpmClock_t VddPhyClk[] = {
 	{ 540, 2600},
 	{ 810, 3200},
 	{ 810, 3600},
@@ -1358,7 +1358,7 @@ static int smu10_set_watermarks_for_clocks_ranges(struct pp_hwmgr *hwmgr,
 	struct amdgpu_device *adev = hwmgr->adev;
 	int i;
 
-	smu_set_watermarks_for_clocks_ranges(table,wm_with_clock_ranges);
+	smu_set_watermarks_for_clocks_ranges(table, wm_with_clock_ranges);
 
 	if (adev->apu_flags & AMD_APU_IS_RAVEN2) {
 		for (i = 0; i < NUM_WM_RANGES; i++)
@@ -1461,7 +1461,7 @@ static int smu10_get_power_profile_mode(struct pp_hwmgr *hwmgr, char *buf)
 
 	phm_get_sysfs_buf(&buf, &size);
 
-	size += sysfs_emit_at(buf, size, "%s %16s %s %s %s %s\n",title[0],
+	size += sysfs_emit_at(buf, size, "%s %16s %s %s %s %s\n", title[0],
 			title[1], title[2], title[3], title[4], title[5]);
 
 	for (i = 0; i <= PP_SMC_POWER_PROFILE_COMPUTE; i++)
-- 
2.17.1

