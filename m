Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D096C70F195
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 10:57:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D437010E5D8;
	Wed, 24 May 2023 08:57:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out30-113.freemail.mail.aliyun.com
 (out30-113.freemail.mail.aliyun.com [115.124.30.113])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 614D610E5B9;
 Wed, 24 May 2023 08:57:35 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R941e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045192;
 MF=jiapeng.chong@linux.alibaba.com; NM=1; PH=DS; RN=10; SR=0;
 TI=SMTPD_---0VjNRKW._1684918648; 
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0VjNRKW._1684918648) by smtp.aliyun-inc.com;
 Wed, 24 May 2023 16:57:31 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: alexander.deucher@amd.com
Subject: [PATCH 2/2] drm/amd/display: clean up some inconsistent indenting
Date: Wed, 24 May 2023 16:57:09 +0800
Message-Id: <20230524085709.59128-2-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
In-Reply-To: <20230524085709.59128-1-jiapeng.chong@linux.alibaba.com>
References: <20230524085709.59128-1-jiapeng.chong@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, Xinhui.Pan@amd.com,
 Abaci Robot <abaci@linux.alibaba.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

No functional modification involved.

drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn321/dcn321_fpu.c:556 dcn321_update_bw_bounding_box_fpu() warn: inconsistent indenting.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=5304
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 .../amd/display/dc/dml/dcn321/dcn321_fpu.c    | 242 +++++++++---------
 1 file changed, 121 insertions(+), 121 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn321/dcn321_fpu.c b/drivers/gpu/drm/amd/display/dc/dml/dcn321/dcn321_fpu.c
index ffd7c3c1b142..1aaff6f2d453 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn321/dcn321_fpu.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn321/dcn321_fpu.c
@@ -553,148 +553,148 @@ void dcn321_update_bw_bounding_box_fpu(struct dc *dc, struct clk_bw_params *bw_p
 	dc->dml.soc.dispclk_dppclk_vco_speed_mhz = dc->clk_mgr->dentist_vco_freq_khz / 1000.0;
 
 	/* Overrides Clock levelsfrom CLK Mgr table entries as reported by PM FW */
-		if (dc->debug.use_legacy_soc_bb_mechanism) {
-			unsigned int i = 0, j = 0, num_states = 0;
-
-			unsigned int dcfclk_mhz[DC__VOLTAGE_STATES] = {0};
-			unsigned int dram_speed_mts[DC__VOLTAGE_STATES] = {0};
-			unsigned int optimal_uclk_for_dcfclk_sta_targets[DC__VOLTAGE_STATES] = {0};
-			unsigned int optimal_dcfclk_for_uclk[DC__VOLTAGE_STATES] = {0};
-
-			unsigned int dcfclk_sta_targets[DC__VOLTAGE_STATES] = {615, 906, 1324, 1564};
-			unsigned int num_dcfclk_sta_targets = 4, num_uclk_states = 0;
-			unsigned int max_dcfclk_mhz = 0, max_dispclk_mhz = 0, max_dppclk_mhz = 0, max_phyclk_mhz = 0;
-
-			for (i = 0; i < MAX_NUM_DPM_LVL; i++) {
-				if (bw_params->clk_table.entries[i].dcfclk_mhz > max_dcfclk_mhz)
-					max_dcfclk_mhz = bw_params->clk_table.entries[i].dcfclk_mhz;
-				if (bw_params->clk_table.entries[i].dispclk_mhz > max_dispclk_mhz)
-					max_dispclk_mhz = bw_params->clk_table.entries[i].dispclk_mhz;
-				if (bw_params->clk_table.entries[i].dppclk_mhz > max_dppclk_mhz)
-					max_dppclk_mhz = bw_params->clk_table.entries[i].dppclk_mhz;
-				if (bw_params->clk_table.entries[i].phyclk_mhz > max_phyclk_mhz)
-					max_phyclk_mhz = bw_params->clk_table.entries[i].phyclk_mhz;
-			}
-			if (!max_dcfclk_mhz)
-				max_dcfclk_mhz = dcn3_21_soc.clock_limits[0].dcfclk_mhz;
-			if (!max_dispclk_mhz)
-				max_dispclk_mhz = dcn3_21_soc.clock_limits[0].dispclk_mhz;
-			if (!max_dppclk_mhz)
-				max_dppclk_mhz = dcn3_21_soc.clock_limits[0].dppclk_mhz;
-			if (!max_phyclk_mhz)
-				max_phyclk_mhz = dcn3_21_soc.clock_limits[0].phyclk_mhz;
-
-			if (max_dcfclk_mhz > dcfclk_sta_targets[num_dcfclk_sta_targets-1]) {
-				// If max DCFCLK is greater than the max DCFCLK STA target, insert into the DCFCLK STA target array
-				dcfclk_sta_targets[num_dcfclk_sta_targets] = max_dcfclk_mhz;
-				num_dcfclk_sta_targets++;
-			} else if (max_dcfclk_mhz < dcfclk_sta_targets[num_dcfclk_sta_targets-1]) {
-				// If max DCFCLK is less than the max DCFCLK STA target, cap values and remove duplicates
-				for (i = 0; i < num_dcfclk_sta_targets; i++) {
-					if (dcfclk_sta_targets[i] > max_dcfclk_mhz) {
-						dcfclk_sta_targets[i] = max_dcfclk_mhz;
-						break;
-					}
+	if (dc->debug.use_legacy_soc_bb_mechanism) {
+		unsigned int i = 0, j = 0, num_states = 0;
+
+		unsigned int dcfclk_mhz[DC__VOLTAGE_STATES] = {0};
+		unsigned int dram_speed_mts[DC__VOLTAGE_STATES] = {0};
+		unsigned int optimal_uclk_for_dcfclk_sta_targets[DC__VOLTAGE_STATES] = {0};
+		unsigned int optimal_dcfclk_for_uclk[DC__VOLTAGE_STATES] = {0};
+
+		unsigned int dcfclk_sta_targets[DC__VOLTAGE_STATES] = {615, 906, 1324, 1564};
+		unsigned int num_dcfclk_sta_targets = 4, num_uclk_states = 0;
+		unsigned int max_dcfclk_mhz = 0, max_dispclk_mhz = 0, max_dppclk_mhz = 0, max_phyclk_mhz = 0;
+
+		for (i = 0; i < MAX_NUM_DPM_LVL; i++) {
+			if (bw_params->clk_table.entries[i].dcfclk_mhz > max_dcfclk_mhz)
+				max_dcfclk_mhz = bw_params->clk_table.entries[i].dcfclk_mhz;
+			if (bw_params->clk_table.entries[i].dispclk_mhz > max_dispclk_mhz)
+				max_dispclk_mhz = bw_params->clk_table.entries[i].dispclk_mhz;
+			if (bw_params->clk_table.entries[i].dppclk_mhz > max_dppclk_mhz)
+				max_dppclk_mhz = bw_params->clk_table.entries[i].dppclk_mhz;
+			if (bw_params->clk_table.entries[i].phyclk_mhz > max_phyclk_mhz)
+				max_phyclk_mhz = bw_params->clk_table.entries[i].phyclk_mhz;
+		}
+		if (!max_dcfclk_mhz)
+			max_dcfclk_mhz = dcn3_21_soc.clock_limits[0].dcfclk_mhz;
+		if (!max_dispclk_mhz)
+			max_dispclk_mhz = dcn3_21_soc.clock_limits[0].dispclk_mhz;
+		if (!max_dppclk_mhz)
+			max_dppclk_mhz = dcn3_21_soc.clock_limits[0].dppclk_mhz;
+		if (!max_phyclk_mhz)
+			max_phyclk_mhz = dcn3_21_soc.clock_limits[0].phyclk_mhz;
+
+		if (max_dcfclk_mhz > dcfclk_sta_targets[num_dcfclk_sta_targets-1]) {
+			// If max DCFCLK is greater than the max DCFCLK STA target, insert into the DCFCLK STA target array
+			dcfclk_sta_targets[num_dcfclk_sta_targets] = max_dcfclk_mhz;
+			num_dcfclk_sta_targets++;
+		} else if (max_dcfclk_mhz < dcfclk_sta_targets[num_dcfclk_sta_targets-1]) {
+			// If max DCFCLK is less than the max DCFCLK STA target, cap values and remove duplicates
+			for (i = 0; i < num_dcfclk_sta_targets; i++) {
+				if (dcfclk_sta_targets[i] > max_dcfclk_mhz) {
+					dcfclk_sta_targets[i] = max_dcfclk_mhz;
+					break;
 				}
-				// Update size of array since we "removed" duplicates
-				num_dcfclk_sta_targets = i + 1;
 			}
+			// Update size of array since we "removed" duplicates
+			num_dcfclk_sta_targets = i + 1;
+		}
 
-			num_uclk_states = bw_params->clk_table.num_entries;
+		num_uclk_states = bw_params->clk_table.num_entries;
 
-			// Calculate optimal dcfclk for each uclk
-			for (i = 0; i < num_uclk_states; i++) {
-				dcn321_get_optimal_dcfclk_fclk_for_uclk(bw_params->clk_table.entries[i].memclk_mhz * 16,
-						&optimal_dcfclk_for_uclk[i], NULL);
-				if (optimal_dcfclk_for_uclk[i] < bw_params->clk_table.entries[0].dcfclk_mhz) {
-					optimal_dcfclk_for_uclk[i] = bw_params->clk_table.entries[0].dcfclk_mhz;
-				}
+		// Calculate optimal dcfclk for each uclk
+		for (i = 0; i < num_uclk_states; i++) {
+			dcn321_get_optimal_dcfclk_fclk_for_uclk(bw_params->clk_table.entries[i].memclk_mhz * 16,
+					&optimal_dcfclk_for_uclk[i], NULL);
+			if (optimal_dcfclk_for_uclk[i] < bw_params->clk_table.entries[0].dcfclk_mhz) {
+				optimal_dcfclk_for_uclk[i] = bw_params->clk_table.entries[0].dcfclk_mhz;
 			}
+		}
 
-			// Calculate optimal uclk for each dcfclk sta target
-			for (i = 0; i < num_dcfclk_sta_targets; i++) {
-				for (j = 0; j < num_uclk_states; j++) {
-					if (dcfclk_sta_targets[i] < optimal_dcfclk_for_uclk[j]) {
-						optimal_uclk_for_dcfclk_sta_targets[i] =
-								bw_params->clk_table.entries[j].memclk_mhz * 16;
-						break;
-					}
+		// Calculate optimal uclk for each dcfclk sta target
+		for (i = 0; i < num_dcfclk_sta_targets; i++) {
+			for (j = 0; j < num_uclk_states; j++) {
+				if (dcfclk_sta_targets[i] < optimal_dcfclk_for_uclk[j]) {
+					optimal_uclk_for_dcfclk_sta_targets[i] =
+							bw_params->clk_table.entries[j].memclk_mhz * 16;
+					break;
 				}
 			}
+		}
 
-			i = 0;
-			j = 0;
-			// create the final dcfclk and uclk table
-			while (i < num_dcfclk_sta_targets && j < num_uclk_states && num_states < DC__VOLTAGE_STATES) {
-				if (dcfclk_sta_targets[i] < optimal_dcfclk_for_uclk[j] && i < num_dcfclk_sta_targets) {
-					dcfclk_mhz[num_states] = dcfclk_sta_targets[i];
-					dram_speed_mts[num_states++] = optimal_uclk_for_dcfclk_sta_targets[i++];
+		i = 0;
+		j = 0;
+		// create the final dcfclk and uclk table
+		while (i < num_dcfclk_sta_targets && j < num_uclk_states && num_states < DC__VOLTAGE_STATES) {
+			if (dcfclk_sta_targets[i] < optimal_dcfclk_for_uclk[j] && i < num_dcfclk_sta_targets) {
+				dcfclk_mhz[num_states] = dcfclk_sta_targets[i];
+				dram_speed_mts[num_states++] = optimal_uclk_for_dcfclk_sta_targets[i++];
+			} else {
+				if (j < num_uclk_states && optimal_dcfclk_for_uclk[j] <= max_dcfclk_mhz) {
+					dcfclk_mhz[num_states] = optimal_dcfclk_for_uclk[j];
+					dram_speed_mts[num_states++] = bw_params->clk_table.entries[j++].memclk_mhz * 16;
 				} else {
-					if (j < num_uclk_states && optimal_dcfclk_for_uclk[j] <= max_dcfclk_mhz) {
-						dcfclk_mhz[num_states] = optimal_dcfclk_for_uclk[j];
-						dram_speed_mts[num_states++] = bw_params->clk_table.entries[j++].memclk_mhz * 16;
-					} else {
-						j = num_uclk_states;
-					}
+					j = num_uclk_states;
 				}
 			}
+		}
 
-			while (i < num_dcfclk_sta_targets && num_states < DC__VOLTAGE_STATES) {
-				dcfclk_mhz[num_states] = dcfclk_sta_targets[i];
-				dram_speed_mts[num_states++] = optimal_uclk_for_dcfclk_sta_targets[i++];
-			}
+		while (i < num_dcfclk_sta_targets && num_states < DC__VOLTAGE_STATES) {
+			dcfclk_mhz[num_states] = dcfclk_sta_targets[i];
+			dram_speed_mts[num_states++] = optimal_uclk_for_dcfclk_sta_targets[i++];
+		}
 
-			while (j < num_uclk_states && num_states < DC__VOLTAGE_STATES &&
-					optimal_dcfclk_for_uclk[j] <= max_dcfclk_mhz) {
-				dcfclk_mhz[num_states] = optimal_dcfclk_for_uclk[j];
-				dram_speed_mts[num_states++] = bw_params->clk_table.entries[j++].memclk_mhz * 16;
-			}
+		while (j < num_uclk_states && num_states < DC__VOLTAGE_STATES &&
+				optimal_dcfclk_for_uclk[j] <= max_dcfclk_mhz) {
+			dcfclk_mhz[num_states] = optimal_dcfclk_for_uclk[j];
+			dram_speed_mts[num_states++] = bw_params->clk_table.entries[j++].memclk_mhz * 16;
+		}
 
-			dcn3_21_soc.num_states = num_states;
-			for (i = 0; i < dcn3_21_soc.num_states; i++) {
-				dcn3_21_soc.clock_limits[i].state = i;
-				dcn3_21_soc.clock_limits[i].dcfclk_mhz = dcfclk_mhz[i];
-				dcn3_21_soc.clock_limits[i].fabricclk_mhz = dcfclk_mhz[i];
-
-				/* Fill all states with max values of all these clocks */
-				dcn3_21_soc.clock_limits[i].dispclk_mhz = max_dispclk_mhz;
-				dcn3_21_soc.clock_limits[i].dppclk_mhz  = max_dppclk_mhz;
-				dcn3_21_soc.clock_limits[i].phyclk_mhz  = max_phyclk_mhz;
-				dcn3_21_soc.clock_limits[i].dscclk_mhz  = max_dispclk_mhz / 3;
-
-				/* Populate from bw_params for DTBCLK, SOCCLK */
-				if (i > 0) {
-					if (!bw_params->clk_table.entries[i].dtbclk_mhz) {
-						dcn3_21_soc.clock_limits[i].dtbclk_mhz  = dcn3_21_soc.clock_limits[i-1].dtbclk_mhz;
-					} else {
-						dcn3_21_soc.clock_limits[i].dtbclk_mhz  = bw_params->clk_table.entries[i].dtbclk_mhz;
-					}
-				} else if (bw_params->clk_table.entries[i].dtbclk_mhz) {
+		dcn3_21_soc.num_states = num_states;
+		for (i = 0; i < dcn3_21_soc.num_states; i++) {
+			dcn3_21_soc.clock_limits[i].state = i;
+			dcn3_21_soc.clock_limits[i].dcfclk_mhz = dcfclk_mhz[i];
+			dcn3_21_soc.clock_limits[i].fabricclk_mhz = dcfclk_mhz[i];
+
+			/* Fill all states with max values of all these clocks */
+			dcn3_21_soc.clock_limits[i].dispclk_mhz = max_dispclk_mhz;
+			dcn3_21_soc.clock_limits[i].dppclk_mhz  = max_dppclk_mhz;
+			dcn3_21_soc.clock_limits[i].phyclk_mhz  = max_phyclk_mhz;
+			dcn3_21_soc.clock_limits[i].dscclk_mhz  = max_dispclk_mhz / 3;
+
+			/* Populate from bw_params for DTBCLK, SOCCLK */
+			if (i > 0) {
+				if (!bw_params->clk_table.entries[i].dtbclk_mhz) {
+					dcn3_21_soc.clock_limits[i].dtbclk_mhz  = dcn3_21_soc.clock_limits[i-1].dtbclk_mhz;
+				} else {
 					dcn3_21_soc.clock_limits[i].dtbclk_mhz  = bw_params->clk_table.entries[i].dtbclk_mhz;
 				}
+			} else if (bw_params->clk_table.entries[i].dtbclk_mhz) {
+				dcn3_21_soc.clock_limits[i].dtbclk_mhz  = bw_params->clk_table.entries[i].dtbclk_mhz;
+			}
 
-				if (!bw_params->clk_table.entries[i].socclk_mhz && i > 0)
-					dcn3_21_soc.clock_limits[i].socclk_mhz = dcn3_21_soc.clock_limits[i-1].socclk_mhz;
-				else
-					dcn3_21_soc.clock_limits[i].socclk_mhz = bw_params->clk_table.entries[i].socclk_mhz;
+			if (!bw_params->clk_table.entries[i].socclk_mhz && i > 0)
+				dcn3_21_soc.clock_limits[i].socclk_mhz = dcn3_21_soc.clock_limits[i-1].socclk_mhz;
+			else
+				dcn3_21_soc.clock_limits[i].socclk_mhz = bw_params->clk_table.entries[i].socclk_mhz;
 
-				if (!dram_speed_mts[i] && i > 0)
-					dcn3_21_soc.clock_limits[i].dram_speed_mts = dcn3_21_soc.clock_limits[i-1].dram_speed_mts;
-				else
-					dcn3_21_soc.clock_limits[i].dram_speed_mts = dram_speed_mts[i];
+			if (!dram_speed_mts[i] && i > 0)
+				dcn3_21_soc.clock_limits[i].dram_speed_mts = dcn3_21_soc.clock_limits[i-1].dram_speed_mts;
+			else
+				dcn3_21_soc.clock_limits[i].dram_speed_mts = dram_speed_mts[i];
 
-				/* These clocks cannot come from bw_params, always fill from dcn3_21_soc[0] */
-				/* PHYCLK_D18, PHYCLK_D32 */
-				dcn3_21_soc.clock_limits[i].phyclk_d18_mhz = dcn3_21_soc.clock_limits[0].phyclk_d18_mhz;
-				dcn3_21_soc.clock_limits[i].phyclk_d32_mhz = dcn3_21_soc.clock_limits[0].phyclk_d32_mhz;
-			}
-		} else {
-			build_synthetic_soc_states(bw_params, dcn3_21_soc.clock_limits, &dcn3_21_soc.num_states);
+			/* These clocks cannot come from bw_params, always fill from dcn3_21_soc[0] */
+			/* PHYCLK_D18, PHYCLK_D32 */
+			dcn3_21_soc.clock_limits[i].phyclk_d18_mhz = dcn3_21_soc.clock_limits[0].phyclk_d18_mhz;
+			dcn3_21_soc.clock_limits[i].phyclk_d32_mhz = dcn3_21_soc.clock_limits[0].phyclk_d32_mhz;
 		}
+	} else {
+		build_synthetic_soc_states(bw_params, dcn3_21_soc.clock_limits, &dcn3_21_soc.num_states);
+	}
 
-		/* Re-init DML with updated bb */
-		dml_init_instance(&dc->dml, &dcn3_21_soc, &dcn3_21_ip, DML_PROJECT_DCN32);
-		if (dc->current_state)
-			dml_init_instance(&dc->current_state->bw_ctx.dml, &dcn3_21_soc, &dcn3_21_ip, DML_PROJECT_DCN32);
+	/* Re-init DML with updated bb */
+	dml_init_instance(&dc->dml, &dcn3_21_soc, &dcn3_21_ip, DML_PROJECT_DCN32);
+	if (dc->current_state)
+		dml_init_instance(&dc->current_state->bw_ctx.dml, &dcn3_21_soc, &dcn3_21_ip, DML_PROJECT_DCN32);
 }
 
-- 
2.20.1.7.g153144c

