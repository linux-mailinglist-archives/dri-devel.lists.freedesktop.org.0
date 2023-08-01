Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C9E76AD5D
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 11:28:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A99C410E374;
	Tue,  1 Aug 2023 09:28:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out28-98.mail.aliyun.com (out28-98.mail.aliyun.com
 [115.124.28.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A28D410E374;
 Tue,  1 Aug 2023 09:28:32 +0000 (UTC)
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07480418|-1; CH=green;
 DM=|CONTINUE|false|; DS=CONTINUE|ham_alarm|0.0163373-0.000708181-0.982955;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047194; MF=sunran001@208suo.com; NM=1;
 PH=DS; RN=7; RT=7; SR=0; TI=SMTPD_---.U5rUvp6_1690882103; 
Received: from localhost.localdomain(mailfrom:sunran001@208suo.com
 fp:SMTPD_---.U5rUvp6_1690882103) by smtp.aliyun-inc.com;
 Tue, 01 Aug 2023 17:28:25 +0800
From: Ran Sun <sunran001@208suo.com>
To: alexander.deucher@amd.com,
	airlied@gmail.com,
	daniel@ffwll.ch
Subject: [PATCH] drm/amdgpu/powerplay: Clean up errors in vega20_hwmgr.c
Date: Tue,  1 Aug 2023 09:28:21 +0000
Message-Id: <20230801092821.7495-1-sunran001@208suo.com>
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

ERROR: code indent should use tabs where possible
ERROR: space required before the open parenthesis '('
ERROR: space prohibited before that close parenthesis ')'

Signed-off-by: Ran Sun <sunran001@208suo.com>
---
 .../gpu/drm/amd/pm/powerplay/hwmgr/vega20_hwmgr.c    | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_hwmgr.c b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_hwmgr.c
index 4e19ccbdb807..492ca33637d6 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_hwmgr.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_hwmgr.c
@@ -1402,7 +1402,7 @@ static int vega20_od8_set_settings(
 			"Failed to export over drive table!",
 			return ret);
 
-	switch(index) {
+	switch (index) {
 	case OD8_SETTING_GFXCLK_FMIN:
 		od_table.GfxclkFmin = (uint16_t)value;
 		break;
@@ -2360,7 +2360,7 @@ static int vega20_notify_smc_display_config_after_ps_adjustment(
 		dpm_table->dpm_state.hard_min_level = min_clocks.memoryClock / 100;
 		PP_ASSERT_WITH_CODE(!(ret = smum_send_msg_to_smc_with_parameter(hwmgr,
 				PPSMC_MSG_SetHardMinByFreq,
-				(PPCLK_UCLK << 16 ) | dpm_table->dpm_state.hard_min_level,
+				(PPCLK_UCLK << 16) | dpm_table->dpm_state.hard_min_level,
 				NULL)),
 				"[SetHardMinFreq] Set hard min uclk failed!",
 				return ret);
@@ -3579,7 +3579,7 @@ static int vega20_set_uclk_to_highest_dpm_level(struct pp_hwmgr *hwmgr,
 		dpm_table->dpm_state.hard_min_level = dpm_table->dpm_levels[dpm_table->count - 1].value;
 		PP_ASSERT_WITH_CODE(!(ret = smum_send_msg_to_smc_with_parameter(hwmgr,
 				PPSMC_MSG_SetHardMinByFreq,
-				(PPCLK_UCLK << 16 ) | dpm_table->dpm_state.hard_min_level,
+				(PPCLK_UCLK << 16) | dpm_table->dpm_state.hard_min_level,
 				NULL)),
 				"[SetUclkToHightestDpmLevel] Set hard min uclk failed!",
 				return ret);
@@ -3605,7 +3605,7 @@ static int vega20_set_fclk_to_highest_dpm_level(struct pp_hwmgr *hwmgr)
 		dpm_table->dpm_state.soft_min_level = dpm_table->dpm_levels[dpm_table->count - 1].value;
 		PP_ASSERT_WITH_CODE(!(ret = smum_send_msg_to_smc_with_parameter(hwmgr,
 				PPSMC_MSG_SetSoftMinByFreq,
-				(PPCLK_FCLK << 16 ) | dpm_table->dpm_state.soft_min_level,
+				(PPCLK_FCLK << 16) | dpm_table->dpm_state.soft_min_level,
 				NULL)),
 				"[SetFclkToHightestDpmLevel] Set soft min fclk failed!",
 				return ret);
@@ -3727,8 +3727,8 @@ static int vega20_apply_clocks_adjust_rules(struct pp_hwmgr *hwmgr)
 	uint32_t i, latency;
 
 	disable_mclk_switching = ((1 < hwmgr->display_config->num_display) &&
-                           !hwmgr->display_config->multi_monitor_in_sync) ||
-                            vblank_too_short;
+				!hwmgr->display_config->multi_monitor_in_sync) ||
+				vblank_too_short;
 	latency = hwmgr->display_config->dce_tolerable_mclk_in_active_latency;
 
 	/* gfxclk */
-- 
2.17.1

