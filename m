Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A0F976AB91
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 11:00:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7871B10E36A;
	Tue,  1 Aug 2023 09:00:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out28-5.mail.aliyun.com (out28-5.mail.aliyun.com [115.124.28.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8B4A10E368;
 Tue,  1 Aug 2023 09:00:34 +0000 (UTC)
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.1658784|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.0435724-0.000151813-0.956276;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047213; MF=sunran001@208suo.com; NM=1;
 PH=DS; RN=7; RT=7; SR=0; TI=SMTPD_---.U5p0NjW_1690880424; 
Received: from localhost.localdomain(mailfrom:sunran001@208suo.com
 fp:SMTPD_---.U5p0NjW_1690880424) by smtp.aliyun-inc.com;
 Tue, 01 Aug 2023 17:00:27 +0800
From: Ran Sun <sunran001@208suo.com>
To: alexander.deucher@amd.com,
	airlied@gmail.com,
	daniel@ffwll.ch
Subject: [PATCH] drm/amd: Clean up errors in smu7_hwmgr.c
Date: Tue,  1 Aug 2023 09:00:22 +0000
Message-Id: <20230801090022.6923-1-sunran001@208suo.com>
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
ERROR: spaces required around that '=' (ctx:VxV)
ERROR: spaces required around that '<' (ctx:VxV)

Signed-off-by: Ran Sun <sunran001@208suo.com>
---
 .../drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c   | 26 +++++++++----------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c
index 1cb402264497..425859682fab 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c
@@ -83,15 +83,15 @@
 #define PCIE_BUS_CLK                10000
 #define TCLK                        (PCIE_BUS_CLK / 10)
 
-static struct profile_mode_setting smu7_profiling[7] =
-					{{0, 0, 0, 0, 0, 0, 0, 0},
+static struct profile_mode_setting smu7_profiling[7] = {
+					 {0, 0, 0, 0, 0, 0, 0, 0},
 					 {1, 0, 100, 30, 1, 0, 100, 10},
 					 {1, 10, 0, 30, 0, 0, 0, 0},
 					 {0, 0, 0, 0, 1, 10, 16, 31},
 					 {1, 0, 11, 50, 1, 0, 100, 10},
 					 {1, 0, 5, 30, 0, 0, 0, 0},
 					 {0, 0, 0, 0, 0, 0, 0, 0},
-					};
+};
 
 #define PPSMC_MSG_SetVBITimeout_VEGAM    ((uint16_t) 0x310)
 
@@ -950,7 +950,7 @@ static int smu7_odn_initial_default_setting(struct pp_hwmgr *hwmgr)
 	odn_table->odn_core_clock_dpm_levels.num_of_pl =
 						data->golden_dpm_table.sclk_table.count;
 	entries = odn_table->odn_core_clock_dpm_levels.entries;
-	for (i=0; i<data->golden_dpm_table.sclk_table.count; i++) {
+	for (i = 0; i < data->golden_dpm_table.sclk_table.count; i++) {
 		entries[i].clock = data->golden_dpm_table.sclk_table.dpm_levels[i].value;
 		entries[i].enabled = true;
 		entries[i].vddc = dep_sclk_table->entries[i].vddc;
@@ -962,7 +962,7 @@ static int smu7_odn_initial_default_setting(struct pp_hwmgr *hwmgr)
 	odn_table->odn_memory_clock_dpm_levels.num_of_pl =
 						data->golden_dpm_table.mclk_table.count;
 	entries = odn_table->odn_memory_clock_dpm_levels.entries;
-	for (i=0; i<data->golden_dpm_table.mclk_table.count; i++) {
+	for (i = 0; i < data->golden_dpm_table.mclk_table.count; i++) {
 		entries[i].clock = data->golden_dpm_table.mclk_table.dpm_levels[i].value;
 		entries[i].enabled = true;
 		entries[i].vddc = dep_mclk_table->entries[i].vddc;
@@ -1813,13 +1813,13 @@ static void smu7_init_dpm_defaults(struct pp_hwmgr *hwmgr)
 	data->static_screen_threshold = SMU7_STATICSCREENTHRESHOLD_DFLT;
 	data->static_screen_threshold_unit = SMU7_STATICSCREENTHRESHOLDUNIT_DFLT;
 	data->voting_rights_clients[0] = SMU7_VOTINGRIGHTSCLIENTS_DFLT0;
-	data->voting_rights_clients[1]= SMU7_VOTINGRIGHTSCLIENTS_DFLT1;
+	data->voting_rights_clients[1] = SMU7_VOTINGRIGHTSCLIENTS_DFLT1;
 	data->voting_rights_clients[2] = SMU7_VOTINGRIGHTSCLIENTS_DFLT2;
-	data->voting_rights_clients[3]= SMU7_VOTINGRIGHTSCLIENTS_DFLT3;
-	data->voting_rights_clients[4]= SMU7_VOTINGRIGHTSCLIENTS_DFLT4;
-	data->voting_rights_clients[5]= SMU7_VOTINGRIGHTSCLIENTS_DFLT5;
-	data->voting_rights_clients[6]= SMU7_VOTINGRIGHTSCLIENTS_DFLT6;
-	data->voting_rights_clients[7]= SMU7_VOTINGRIGHTSCLIENTS_DFLT7;
+	data->voting_rights_clients[3] = SMU7_VOTINGRIGHTSCLIENTS_DFLT3;
+	data->voting_rights_clients[4] = SMU7_VOTINGRIGHTSCLIENTS_DFLT4;
+	data->voting_rights_clients[5] = SMU7_VOTINGRIGHTSCLIENTS_DFLT5;
+	data->voting_rights_clients[6] = SMU7_VOTINGRIGHTSCLIENTS_DFLT6;
+	data->voting_rights_clients[7] = SMU7_VOTINGRIGHTSCLIENTS_DFLT7;
 
 	data->mclk_dpm_key_disabled = hwmgr->feature_mask & PP_MCLK_DPM_MASK ? false : true;
 	data->sclk_dpm_key_disabled = hwmgr->feature_mask & PP_SCLK_DPM_MASK ? false : true;
@@ -2002,7 +2002,7 @@ static int smu7_calculate_ro_range(struct pp_hwmgr *hwmgr)
 	} else if (ASICID_IS_P21(adev->pdev->device, adev->pdev->revision) ||
 		   ASICID_IS_P31(adev->pdev->device, adev->pdev->revision)) {
 		min = 900;
-		max= 2100;
+		max = 2100;
 	} else if (hwmgr->chip_id == CHIP_POLARIS10) {
 		if (adev->pdev->subsystem_vendor == 0x106B) {
 			min = 1000;
@@ -4018,7 +4018,7 @@ static int smu7_read_sensor(struct pp_hwmgr *hwmgr, int idx,
 		offset = data->soft_regs_start + smum_get_offsetof(hwmgr,
 								SMU_SoftRegisters,
 								(idx == AMDGPU_PP_SENSOR_GPU_LOAD) ?
-								AverageGraphicsActivity:
+								AverageGraphicsActivity :
 								AverageMemoryActivity);
 
 		activity_percent = cgs_read_ind_register(hwmgr->device, CGS_IND_REG__SMC, offset);
-- 
2.17.1

