Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9047E79FC42
	for <lists+dri-devel@lfdr.de>; Thu, 14 Sep 2023 08:42:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34BD210E50B;
	Thu, 14 Sep 2023 06:42:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out30-118.freemail.mail.aliyun.com
 (out30-118.freemail.mail.aliyun.com [115.124.30.118])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D04A10E50B;
 Thu, 14 Sep 2023 06:42:40 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R101e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045168;
 MF=jiapeng.chong@linux.alibaba.com; NM=1; PH=DS; RN=13; SR=0;
 TI=SMTPD_---0Vs1G6jX_1694673747; 
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0Vs1G6jX_1694673747) by smtp.aliyun-inc.com;
 Thu, 14 Sep 2023 14:42:36 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: harry.wentland@amd.com
Subject: [PATCH] alpha: clean up some inconsistent indenting
Date: Thu, 14 Sep 2023 14:42:25 +0800
Message-Id: <20230914064225.122860-1-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
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
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, sunpeng.li@amd.com,
 Abaci Robot <abaci@linux.alibaba.com>, Xinhui.Pan@amd.com,
 Rodrigo.Siqueira@amd.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

No functional modification involved.

drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c:491 dcn32_auto_dpm_test_log() warn: inconsistent indenting.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=6574
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 .../display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c  | 72 +++++++++----------
 1 file changed, 34 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c
index 37ffa0050e60..e34b1d6dd964 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c
@@ -460,25 +460,25 @@ static int dcn32_get_dispclk_from_dentist(struct clk_mgr *clk_mgr_base)
 
 static void dcn32_auto_dpm_test_log(struct dc_clocks *new_clocks, struct clk_mgr_internal *clk_mgr)
 {
-    unsigned int dispclk_khz_reg    = REG_READ(CLK1_CLK0_CURRENT_CNT); // DISPCLK
-    unsigned int dppclk_khz_reg     = REG_READ(CLK1_CLK1_CURRENT_CNT); // DPPCLK
-    unsigned int dprefclk_khz_reg   = REG_READ(CLK1_CLK2_CURRENT_CNT); // DPREFCLK
-    unsigned int dcfclk_khz_reg     = REG_READ(CLK1_CLK3_CURRENT_CNT); // DCFCLK
-    unsigned int dtbclk_khz_reg     = REG_READ(CLK1_CLK4_CURRENT_CNT); // DTBCLK
-    unsigned int fclk_khz_reg       = REG_READ(CLK4_CLK0_CURRENT_CNT); // FCLK
-
-    // Overrides for these clocks in case there is no p_state change support
-    int dramclk_khz_override = new_clocks->dramclk_khz;
-    int fclk_khz_override = new_clocks->fclk_khz;
-
-    int num_fclk_levels = clk_mgr->base.bw_params->clk_table.num_entries_per_clk.num_fclk_levels - 1;
-
-    if (!new_clocks->p_state_change_support) {
-	    dramclk_khz_override = clk_mgr->base.bw_params->max_memclk_mhz * 1000;
-    }
-    if (!new_clocks->fclk_p_state_change_support) {
-	    fclk_khz_override = clk_mgr->base.bw_params->clk_table.entries[num_fclk_levels].fclk_mhz * 1000;
-    }
+	unsigned int dispclk_khz_reg    = REG_READ(CLK1_CLK0_CURRENT_CNT); // DISPCLK
+	unsigned int dppclk_khz_reg     = REG_READ(CLK1_CLK1_CURRENT_CNT); // DPPCLK
+	unsigned int dprefclk_khz_reg   = REG_READ(CLK1_CLK2_CURRENT_CNT); // DPREFCLK
+	unsigned int dcfclk_khz_reg     = REG_READ(CLK1_CLK3_CURRENT_CNT); // DCFCLK
+	unsigned int dtbclk_khz_reg     = REG_READ(CLK1_CLK4_CURRENT_CNT); // DTBCLK
+	unsigned int fclk_khz_reg       = REG_READ(CLK4_CLK0_CURRENT_CNT); // FCLK
+
+	// Overrides for these clocks in case there is no p_state change support
+	int dramclk_khz_override = new_clocks->dramclk_khz;
+	int fclk_khz_override = new_clocks->fclk_khz;
+
+	int num_fclk_levels = clk_mgr->base.bw_params->clk_table.num_entries_per_clk.num_fclk_levels - 1;
+
+	if (!new_clocks->p_state_change_support) {
+		dramclk_khz_override = clk_mgr->base.bw_params->max_memclk_mhz * 1000;
+	}
+	if (!new_clocks->fclk_p_state_change_support) {
+		fclk_khz_override = clk_mgr->base.bw_params->clk_table.entries[num_fclk_levels].fclk_mhz * 1000;
+	}
 
 	////////////////////////////////////////////////////////////////////////////
 	//	IMPORTANT: 	When adding more clocks to these logs, do NOT put a newline
@@ -488,26 +488,22 @@ static void dcn32_auto_dpm_test_log(struct dc_clocks *new_clocks, struct clk_mgr
 	//
 	//				AutoDPMTest: clk1:%d - clk2:%d - clk3:%d - clk4:%d\n"
 	////////////////////////////////////////////////////////////////////////////
-	if (new_clocks &&
-		new_clocks->dramclk_khz > 0 &&
-		new_clocks->fclk_khz > 0 &&
-		new_clocks->dcfclk_khz > 0 &&
-		new_clocks->dppclk_khz > 0) {
-
+	if (new_clocks && new_clocks->dramclk_khz > 0 && new_clocks->fclk_khz > 0 &&
+	    new_clocks->dcfclk_khz > 0 && new_clocks->dppclk_khz > 0) {
 		DC_LOG_AUTO_DPM_TEST("AutoDPMTest: dramclk:%d - fclk:%d - "
-			"dcfclk:%d - dppclk:%d - dispclk_hw:%d - "
-			"dppclk_hw:%d - dprefclk_hw:%d - dcfclk_hw:%d - "
-			"dtbclk_hw:%d - fclk_hw:%d\n",
-			dramclk_khz_override,
-			fclk_khz_override,
-			new_clocks->dcfclk_khz,
-			new_clocks->dppclk_khz,
-			dispclk_khz_reg,
-			dppclk_khz_reg,
-			dprefclk_khz_reg,
-			dcfclk_khz_reg,
-			dtbclk_khz_reg,
-			fclk_khz_reg);
+				     "dcfclk:%d - dppclk:%d - dispclk_hw:%d - "
+				     "dppclk_hw:%d - dprefclk_hw:%d - dcfclk_hw:%d - "
+				     "dtbclk_hw:%d - fclk_hw:%d\n",
+				     dramclk_khz_override,
+				     fclk_khz_override,
+				     new_clocks->dcfclk_khz,
+				     new_clocks->dppclk_khz,
+				     dispclk_khz_reg,
+				     dppclk_khz_reg,
+				     dprefclk_khz_reg,
+				     dcfclk_khz_reg,
+				     dtbclk_khz_reg,
+				     fclk_khz_reg);
 	}
 }
 
-- 
2.20.1.7.g153144c

