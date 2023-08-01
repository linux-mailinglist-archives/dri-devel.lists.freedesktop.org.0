Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0315B76A75F
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 05:16:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13F2B10E0C3;
	Tue,  1 Aug 2023 03:16:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out28-99.mail.aliyun.com (out28-99.mail.aliyun.com
 [115.124.28.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C15510E0C3;
 Tue,  1 Aug 2023 03:16:13 +0000 (UTC)
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.08137069|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.0160256-0.000551174-0.983423;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047212; MF=sunran001@208suo.com; NM=1;
 PH=DS; RN=7; RT=7; SR=0; TI=SMTPD_---.U5JBFWQ_1690859764; 
Received: from localhost.localdomain(mailfrom:sunran001@208suo.com
 fp:SMTPD_---.U5JBFWQ_1690859764) by smtp.aliyun-inc.com;
 Tue, 01 Aug 2023 11:16:06 +0800
From: Ran Sun <sunran001@208suo.com>
To: alexander.deucher@amd.com,
	airlied@gmail.com,
	daniel@ffwll.ch
Subject: [PATCH] drm/amd/pm: Clean up errors in fiji_baco.c
Date: Tue,  1 Aug 2023 03:16:03 +0000
Message-Id: <20230801031603.5283-1-sunran001@208suo.com>
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

Signed-off-by: Ran Sun <sunran001@208suo.com>
---
 .../drm/amd/pm/powerplay/hwmgr/fiji_baco.c    | 24 +++++++------------
 1 file changed, 8 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/fiji_baco.c b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/fiji_baco.c
index c0368f2dfb21..b3e768fa79f2 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/fiji_baco.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/fiji_baco.c
@@ -36,8 +36,7 @@
 #include "smu/smu_7_1_3_sh_mask.h"
 
 
-static const struct baco_cmd_entry gpio_tbl[] =
-{
+static const struct baco_cmd_entry gpio_tbl[] = {
 	{ CMD_WRITE, mmGPIOPAD_EN, 0, 0, 0, 0x0 },
 	{ CMD_WRITE, mmGPIOPAD_PD_EN, 0, 0, 0, 0x0 },
 	{ CMD_WRITE, mmGPIOPAD_PU_EN, 0, 0, 0, 0x0 },
@@ -50,15 +49,13 @@ static const struct baco_cmd_entry gpio_tbl[] =
 	{ CMD_READMODIFYWRITE, mmDC_GPIO_SYNCA_MASK, 0, 0, 0, 0x00001111 }
 };
 
-static const struct baco_cmd_entry enable_fb_req_rej_tbl[] =
-{
+static const struct baco_cmd_entry enable_fb_req_rej_tbl[] = {
 	{ CMD_WRITE, mmGCK_SMC_IND_INDEX, 0, 0, 0, 0xC0300024 },
 	{ CMD_READMODIFYWRITE, mmGCK_SMC_IND_DATA, 0x1, 0x0, 0, 0x1 },
 	{ CMD_WRITE, mmBIF_FB_EN, 0, 0, 0, 0x0 }
 };
 
-static const struct baco_cmd_entry use_bclk_tbl[] =
-{
+static const struct baco_cmd_entry use_bclk_tbl[] = {
 	{ CMD_WRITE, mmGCK_SMC_IND_INDEX, 0, 0, 0, ixCG_SPLL_FUNC_CNTL },
 	{ CMD_READMODIFYWRITE, mmGCK_SMC_IND_DATA, CG_SPLL_FUNC_CNTL__SPLL_BYPASS_EN_MASK, CG_SPLL_FUNC_CNTL__SPLL_BYPASS_EN__SHIFT, 0, 0x1 },
 	{ CMD_WRITE, mmGCK_SMC_IND_INDEX, 0, 0, 0, ixCG_SPLL_FUNC_CNTL_2 },
@@ -78,8 +75,7 @@ static const struct baco_cmd_entry use_bclk_tbl[] =
 	{ CMD_READMODIFYWRITE, mmGCK_SMC_IND_DATA, MPLL_BYPASSCLK_SEL__MPLL_CLKOUT_SEL_MASK, MPLL_BYPASSCLK_SEL__MPLL_CLKOUT_SEL__SHIFT, 0, 0x2 }
 };
 
-static const struct baco_cmd_entry turn_off_plls_tbl[] =
-{
+static const struct baco_cmd_entry turn_off_plls_tbl[] = {
 	{ CMD_WRITE, mmGCK_SMC_IND_INDEX, 0, 0, 0, ixCG_SPLL_FUNC_CNTL },
 	{ CMD_READMODIFYWRITE, mmGCK_SMC_IND_DATA, CG_SPLL_FUNC_CNTL__SPLL_RESET_MASK, CG_SPLL_FUNC_CNTL__SPLL_RESET__SHIFT, 0,     0x1 },
 	{ CMD_READMODIFYWRITE, mmGCK_SMC_IND_DATA, CG_SPLL_FUNC_CNTL__SPLL_PWRON_MASK, CG_SPLL_FUNC_CNTL__SPLL_PWRON__SHIFT, 0,     0x0 },
@@ -88,8 +84,7 @@ static const struct baco_cmd_entry turn_off_plls_tbl[] =
 	{ CMD_READMODIFYWRITE, mmGCK_SMC_IND_DATA, 0x8000000, 0x1b, 0, 0x0 }
 };
 
-static const struct baco_cmd_entry clk_req_b_tbl[] =
-{
+static const struct baco_cmd_entry clk_req_b_tbl[] = {
 	{ CMD_WRITE, mmGCK_SMC_IND_INDEX, 0, 0, 0, ixCG_CLKPIN_CNTL_2 },
 	{ CMD_READMODIFYWRITE, mmGCK_SMC_IND_DATA, CG_CLKPIN_CNTL_2__FORCE_BIF_REFCLK_EN_MASK, CG_CLKPIN_CNTL_2__FORCE_BIF_REFCLK_EN__SHIFT, 0, 0x0 },
 	{ CMD_WRITE, mmGCK_SMC_IND_INDEX, 0, 0, 0, ixMPLL_BYPASSCLK_SEL },
@@ -104,8 +99,7 @@ static const struct baco_cmd_entry clk_req_b_tbl[] =
 	{ CMD_READMODIFYWRITE, mmGCK_SMC_IND_DATA, THM_CLK_CNTL__TMON_CLK_SEL_MASK, THM_CLK_CNTL__TMON_CLK_SEL__SHIFT, 0, 0x1 }
 };
 
-static const struct baco_cmd_entry enter_baco_tbl[] =
-{
+static const struct baco_cmd_entry enter_baco_tbl[] = {
 	{ CMD_READMODIFYWRITE, mmBACO_CNTL, BACO_CNTL__BACO_EN_MASK, BACO_CNTL__BACO_EN__SHIFT, 0, 0x01 },
 	{ CMD_READMODIFYWRITE, mmBACO_CNTL, BACO_CNTL__BACO_BIF_SCLK_SWITCH_MASK, BACO_CNTL__BACO_BIF_SCLK_SWITCH__SHIFT, 0, 0x01 },
 	{ CMD_WAITFOR, mmBACO_CNTL, BACO_CNTL__BACO_BIF_SCLK_SWITCH_MASK, 0, 5, 0x40000 },
@@ -122,8 +116,7 @@ static const struct baco_cmd_entry enter_baco_tbl[] =
 
 #define BACO_CNTL__PWRGOOD_MASK  BACO_CNTL__PWRGOOD_GPIO_MASK+BACO_CNTL__PWRGOOD_MEM_MASK+BACO_CNTL__PWRGOOD_DVO_MASK
 
-static const struct baco_cmd_entry exit_baco_tbl[] =
-{
+static const struct baco_cmd_entry exit_baco_tbl[] = {
 	{ CMD_READMODIFYWRITE, mmBACO_CNTL, BACO_CNTL__BACO_RESET_EN_MASK, BACO_CNTL__BACO_RESET_EN__SHIFT, 0, 0x01 },
 	{ CMD_READMODIFYWRITE, mmBACO_CNTL, BACO_CNTL__BACO_BCLK_OFF_MASK, BACO_CNTL__BACO_BCLK_OFF__SHIFT, 0, 0x00 },
 	{ CMD_READMODIFYWRITE, mmBACO_CNTL, BACO_CNTL__BACO_POWER_OFF_MASK, BACO_CNTL__BACO_POWER_OFF__SHIFT, 0, 0x00 },
@@ -138,8 +131,7 @@ static const struct baco_cmd_entry exit_baco_tbl[] =
 	{ CMD_WAITFOR, mmBACO_CNTL, BACO_CNTL__BACO_MODE_MASK, 0, 0xffffffff, 0x00 }
 };
 
-static const struct baco_cmd_entry clean_baco_tbl[] =
-{
+static const struct baco_cmd_entry clean_baco_tbl[] = {
 	{ CMD_WRITE, mmBIOS_SCRATCH_0, 0, 0, 0, 0 },
 	{ CMD_WRITE, mmBIOS_SCRATCH_1, 0, 0, 0, 0 },
 	{ CMD_WRITE, mmBIOS_SCRATCH_2, 0, 0, 0, 0 },
-- 
2.17.1

