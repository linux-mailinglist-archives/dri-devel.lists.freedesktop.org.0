Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08FBB580D99
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jul 2022 09:28:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBC0311BDD3;
	Tue, 26 Jul 2022 07:27:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out30-44.freemail.mail.aliyun.com
 (out30-44.freemail.mail.aliyun.com [115.124.30.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BF0411BC57;
 Tue, 26 Jul 2022 07:27:45 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R141e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04400;
 MF=jiapeng.chong@linux.alibaba.com; NM=1; PH=DS; RN=10; SR=0;
 TI=SMTPD_---0VKUOHFo_1658820458; 
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0VKUOHFo_1658820458) by smtp.aliyun-inc.com;
 Tue, 26 Jul 2022 15:27:41 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: alexander.deucher@amd.com
Subject: [PATCH 19/20] drm/amd/display: Clean up some inconsistent indenting
Date: Tue, 26 Jul 2022 15:25:54 +0800
Message-Id: <20220726072555.91323-19-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
In-Reply-To: <20220726072555.91323-1-jiapeng.chong@linux.alibaba.com>
References: <20220726072555.91323-1-jiapeng.chong@linux.alibaba.com>
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
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, airlied@linux.ie,
 Xinhui.Pan@amd.com, Abaci Robot <abaci@linux.alibaba.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Clean up some inconsistent indenting, replace sizeof(x) / sizeof((x)[0]))
with ARRAY_SIZE(x).

smatch warnings:

drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/dcn30_fpu.c:185 optc3_fpu_set_vrr_m_const() warn: inconsistent indenting.
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/dcn30_fpu.c:355 dcn30_fpu_set_mcif_arb_params() warn: inconsistent indenting.
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/dcn30_fpu.c:384 dcn30_fpu_calculate_wm_and_dlg() warn: inconsistent indenting.
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/dcn30_fpu.c:390 dcn30_fpu_calculate_wm_and_dlg() warn: inconsistent indenting.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 .../drm/amd/display/dc/dml/dcn30/dcn30_fpu.c   | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn30/dcn30_fpu.c b/drivers/gpu/drm/amd/display/dc/dml/dcn30/dcn30_fpu.c
index c00f759fdded..060426916998 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn30/dcn30_fpu.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn30/dcn30_fpu.c
@@ -181,7 +181,7 @@ struct _vcs_dpi_soc_bounding_box_st dcn3_0_soc = {
 void optc3_fpu_set_vrr_m_const(struct timing_generator *optc,
 		double vtotal_avg)
 {
-struct optc *optc1 = DCN10TG_FROM_TG(optc);
+	struct optc *optc1 = DCN10TG_FROM_TG(optc);
 	double vtotal_min, vtotal_max;
 	double ratio, modulo, phase;
 	uint32_t vblank_start;
@@ -350,24 +350,24 @@ void dcn30_fpu_set_mcif_arb_params(struct mcif_arb_params *wb_arb_params,
 	int pipe_cnt,
 	int cur_pipe)
 {
-    int i;
+	int i;
 
 	dc_assert_fp_enabled();
 
-    for (i = 0; i < sizeof(wb_arb_params->cli_watermark)/sizeof(wb_arb_params->cli_watermark[0]); i++) {
+	for (i = 0; i < ARRAY_SIZE(wb_arb_params->cli_watermark); i++) {
 		wb_arb_params->cli_watermark[i] = get_wm_writeback_urgent(dml, pipes, pipe_cnt) * 1000;
 		wb_arb_params->pstate_watermark[i] = get_wm_writeback_dram_clock_change(dml, pipes, pipe_cnt) * 1000;
-    }
+	}
 
-    wb_arb_params->dram_speed_change_duration = dml->vba.WritebackAllowDRAMClockChangeEndPosition[cur_pipe] * pipes[0].clks_cfg.refclk_mhz; /* num_clock_cycles = us * MHz */
+	wb_arb_params->dram_speed_change_duration = dml->vba.WritebackAllowDRAMClockChangeEndPosition[cur_pipe] * pipes[0].clks_cfg.refclk_mhz; /* num_clock_cycles = us * MHz */
 }
 
 void dcn30_fpu_update_soc_for_wm_a(struct dc *dc, struct dc_state *context)
 {
 
-dc_assert_fp_enabled();
+	dc_assert_fp_enabled();
 
-if (dc->clk_mgr->bw_params->wm_table.nv_entries[WM_A].valid) {
+	if (dc->clk_mgr->bw_params->wm_table.nv_entries[WM_A].valid) {
 		context->bw_ctx.dml.soc.dram_clock_change_latency_us = dc->clk_mgr->bw_params->wm_table.nv_entries[WM_A].dml_input.pstate_latency_us;
 		context->bw_ctx.dml.soc.sr_enter_plus_exit_time_us = dc->clk_mgr->bw_params->wm_table.nv_entries[WM_A].dml_input.sr_enter_plus_exit_time_us;
 		context->bw_ctx.dml.soc.sr_exit_time_us = dc->clk_mgr->bw_params->wm_table.nv_entries[WM_A].dml_input.sr_exit_time_us;
@@ -380,12 +380,12 @@ void dcn30_fpu_calculate_wm_and_dlg(
 		int pipe_cnt,
 		int vlevel)
 {
-int maxMpcComb = context->bw_ctx.dml.vba.maxMpcComb;
+	int maxMpcComb = context->bw_ctx.dml.vba.maxMpcComb;
 	int i, pipe_idx;
 	double dcfclk = context->bw_ctx.dml.vba.DCFCLKState[vlevel][maxMpcComb];
 	bool pstate_en = context->bw_ctx.dml.vba.DRAMClockChangeSupport[vlevel][maxMpcComb] != dm_dram_clock_change_unsupported;
 
-dc_assert_fp_enabled();
+	dc_assert_fp_enabled();
 
 	if (context->bw_ctx.dml.soc.min_dcfclk > dcfclk)
 		dcfclk = context->bw_ctx.dml.soc.min_dcfclk;
-- 
2.20.1.7.g153144c

