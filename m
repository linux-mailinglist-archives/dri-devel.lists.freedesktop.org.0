Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD6F35909F9
	for <lists+dri-devel@lfdr.de>; Fri, 12 Aug 2022 03:40:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 169F89961B;
	Fri, 12 Aug 2022 01:39:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out30-130.freemail.mail.aliyun.com
 (out30-130.freemail.mail.aliyun.com [115.124.30.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AB7499516;
 Fri, 12 Aug 2022 01:39:20 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R751e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045168;
 MF=yang.lee@linux.alibaba.com; NM=1; PH=DS; RN=13; SR=0;
 TI=SMTPD_---0VM.f8BQ_1660268355; 
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com
 fp:SMTPD_---0VM.f8BQ_1660268355) by smtp.aliyun-inc.com;
 Fri, 12 Aug 2022 09:39:16 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: daniel@ffwll.ch
Subject: [PATCH -next 2/4] drm/amd/display: clean up one inconsistent indenting
Date: Fri, 12 Aug 2022 09:39:10 +0800
Message-Id: <20220812013912.70000-2-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
In-Reply-To: <20220812013912.70000-1-yang.lee@linux.alibaba.com>
References: <20220812013912.70000-1-yang.lee@linux.alibaba.com>
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
Cc: airlied@linux.ie, Abaci Robot <abaci@linux.alibaba.com>, Xinhui.Pan@amd.com,
 Rodrigo.Siqueira@amd.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, sunpeng.li@amd.com,
 Yang Li <yang.lee@linux.alibaba.com>, dri-devel@lists.freedesktop.org,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

1. The indentation of statements in the same curly bracket should be
consistent.
2. Variable declarations in the same function should be aligned.

Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=1887
Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=1888
Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=1889
Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 .../gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c    | 13 ++++++++-----
 .../amd/display/dc/dml/dcn32/display_mode_vba_32.c  |  6 +++---
 .../display/dc/dml/dcn32/display_mode_vba_util_32.c |  2 +-
 3 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c b/drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c
index 3316c4a64901..a8539922715e 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c
@@ -2135,13 +2135,16 @@ void dcn32_update_bw_bounding_box_fpu(struct dc *dc, struct clk_bw_params *bw_pa
 
 			if (dc->ctx->dc_bios->funcs->get_soc_bb_info(dc->ctx->dc_bios, &bb_info) == BP_RESULT_OK) {
 				if (bb_info.dram_clock_change_latency_100ns > 0)
-					dcn3_2_soc.dram_clock_change_latency_us = bb_info.dram_clock_change_latency_100ns * 10;
+					dcn3_2_soc.dram_clock_change_latency_us =
+						bb_info.dram_clock_change_latency_100ns * 10;
 
-			if (bb_info.dram_sr_enter_exit_latency_100ns > 0)
-				dcn3_2_soc.sr_enter_plus_exit_time_us = bb_info.dram_sr_enter_exit_latency_100ns * 10;
+				if (bb_info.dram_sr_enter_exit_latency_100ns > 0)
+					dcn3_2_soc.sr_enter_plus_exit_time_us =
+						bb_info.dram_sr_enter_exit_latency_100ns * 10;
 
-			if (bb_info.dram_sr_exit_latency_100ns > 0)
-				dcn3_2_soc.sr_exit_time_us = bb_info.dram_sr_exit_latency_100ns * 10;
+				if (bb_info.dram_sr_exit_latency_100ns > 0)
+					dcn3_2_soc.sr_exit_time_us =
+						bb_info.dram_sr_exit_latency_100ns * 10;
 			}
 		}
 
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_32.c b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_32.c
index cb2025771646..6a4f730419c0 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_32.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_32.c
@@ -677,9 +677,9 @@ static void DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerforman
 				dml_ceil((double) v->WritebackDelay[mode_lib->vba.VoltageLevel][k]
 				/ (mode_lib->vba.HTotal[k] / mode_lib->vba.PixelClock[k]), 1));
 
-	// Clamp to max OTG vstartup register limit
-	if (v->MaxVStartupLines[k] > 1023)
-		v->MaxVStartupLines[k] = 1023;
+		// Clamp to max OTG vstartup register limit
+		if (v->MaxVStartupLines[k] > 1023)
+			v->MaxVStartupLines[k] = 1023;
 
 #ifdef __DML_VBA_DEBUG__
 		dml_print("DML::%s: k=%d MaxVStartupLines = %d\n", __func__, k, v->MaxVStartupLines[k]);
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.c b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.c
index 05fc14a47fba..3ba76aab0a20 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.c
@@ -4277,7 +4277,7 @@ void dml32_CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport(
 	double ActiveClockChangeLatencyHidingY;
 	double ActiveClockChangeLatencyHidingC;
 	double ActiveClockChangeLatencyHiding;
-    double EffectiveDETBufferSizeY;
+	double EffectiveDETBufferSizeY;
 	double     ActiveFCLKChangeLatencyMargin[DC__NUM_DPP__MAX];
 	double     USRRetrainingLatencyMargin[DC__NUM_DPP__MAX];
 	double TotalPixelBW = 0.0;
-- 
2.20.1.7.g153144c

