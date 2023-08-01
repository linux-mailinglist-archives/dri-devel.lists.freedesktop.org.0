Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B4B76A73B
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 04:57:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB74A10E0C1;
	Tue,  1 Aug 2023 02:57:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out28-219.mail.aliyun.com (out28-219.mail.aliyun.com
 [115.124.28.219])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 288A610E0C1;
 Tue,  1 Aug 2023 02:57:14 +0000 (UTC)
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.09616855|-1; CH=green;
 DM=|CONTINUE|false|; DS=CONTINUE|ham_alarm|0.0129007-0.000684149-0.986415;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047202; MF=sunran001@208suo.com; NM=1;
 PH=DS; RN=7; RT=7; SR=0; TI=SMTPD_---.U5ISByU_1690858625; 
Received: from localhost.localdomain(mailfrom:sunran001@208suo.com
 fp:SMTPD_---.U5ISByU_1690858625) by smtp.aliyun-inc.com;
 Tue, 01 Aug 2023 10:57:07 +0800
From: Ran Sun <sunran001@208suo.com>
To: alexander.deucher@amd.com,
	airlied@gmail.com,
	daniel@ffwll.ch
Subject: [PATCH] drm/amd/pm: Clean up errors in vega12_hwmgr.c
Date: Tue,  1 Aug 2023 02:57:03 +0000
Message-Id: <20230801025703.4979-1-sunran001@208suo.com>
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

ERROR: need consistent spacing around '/' (ctx:WxV)
ERROR: code indent should use tabs where possible

Signed-off-by: Ran Sun <sunran001@208suo.com>
---
 drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega12_hwmgr.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega12_hwmgr.c b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega12_hwmgr.c
index 1937be1cf5b4..4bd573d815ff 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega12_hwmgr.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega12_hwmgr.c
@@ -1623,13 +1623,13 @@ static int vega12_notify_smc_display_config_after_ps_adjustment(
 
 	if (data->smu_features[GNLD_DPM_DCEFCLK].supported) {
 		clock_req.clock_type = amd_pp_dcef_clock;
-		clock_req.clock_freq_in_khz = min_clocks.dcefClock/10;
+		clock_req.clock_freq_in_khz = min_clocks.dcefClock / 10;
 		if (!vega12_display_clock_voltage_request(hwmgr, &clock_req)) {
 			if (data->smu_features[GNLD_DS_DCEFCLK].supported)
 				PP_ASSERT_WITH_CODE(
 					!smum_send_msg_to_smc_with_parameter(
 					hwmgr, PPSMC_MSG_SetMinDeepSleepDcefclk,
-					min_clocks.dcefClockInSR /100,
+					min_clocks.dcefClockInSR / 100,
 					NULL),
 					"Attempt to set divider for DCEFCLK Failed!",
 					return -1);
@@ -2354,8 +2354,8 @@ static int vega12_apply_clocks_adjust_rules(struct pp_hwmgr *hwmgr)
 	uint32_t i, latency;
 
 	disable_mclk_switching = ((1 < hwmgr->display_config->num_display) &&
-			          !hwmgr->display_config->multi_monitor_in_sync) ||
-			          vblank_too_short;
+				!hwmgr->display_config->multi_monitor_in_sync) ||
+				vblank_too_short;
 	latency = hwmgr->display_config->dce_tolerable_mclk_in_active_latency;
 
 	/* gfxclk */
@@ -2522,7 +2522,7 @@ static int vega12_set_uclk_to_highest_dpm_level(struct pp_hwmgr *hwmgr,
 		dpm_table->dpm_state.hard_min_level = dpm_table->dpm_levels[dpm_table->count - 1].value;
 		PP_ASSERT_WITH_CODE(!(ret = smum_send_msg_to_smc_with_parameter(hwmgr,
 				PPSMC_MSG_SetHardMinByFreq,
-				(PPCLK_UCLK << 16 ) | dpm_table->dpm_state.hard_min_level,
+				(PPCLK_UCLK << 16) | dpm_table->dpm_state.hard_min_level,
 				NULL)),
 				"[SetUclkToHightestDpmLevel] Set hard min uclk failed!",
 				return ret);
-- 
2.17.1

