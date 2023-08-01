Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A18BA76A8B1
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 08:09:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4648B10E30F;
	Tue,  1 Aug 2023 06:09:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out28-5.mail.aliyun.com (out28-5.mail.aliyun.com [115.124.28.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5A7010E318;
 Tue,  1 Aug 2023 06:09:47 +0000 (UTC)
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.1864641|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.0136917-0.000435556-0.985873;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047198; MF=sunran001@208suo.com; NM=1;
 PH=DS; RN=7; RT=7; SR=0; TI=SMTPD_---.U5fuMlm_1690870177; 
Received: from localhost.localdomain(mailfrom:sunran001@208suo.com
 fp:SMTPD_---.U5fuMlm_1690870177) by smtp.aliyun-inc.com;
 Tue, 01 Aug 2023 14:09:39 +0800
From: Ran Sun <sunran001@208suo.com>
To: alexander.deucher@amd.com,
	airlied@gmail.com,
	daniel@ffwll.ch
Subject: [PATCH] drm/amd/pm: Clean up errors in vega12_baco.c
Date: Tue,  1 Aug 2023 06:09:37 +0000
Message-Id: <20230801060937.6178-1-sunran001@208suo.com>
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
 drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega12_baco.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega12_baco.c b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega12_baco.c
index bc53cce4f32d..32cc8de296e4 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega12_baco.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega12_baco.c
@@ -29,16 +29,14 @@
 #include "vega12_ppsmc.h"
 #include "vega12_baco.h"
 
-static const struct soc15_baco_cmd_entry  pre_baco_tbl[] =
-{
+static const struct soc15_baco_cmd_entry  pre_baco_tbl[] = {
 	{ CMD_READMODIFYWRITE, NBIF_HWID, 0, mmBIF_DOORBELL_CNTL_BASE_IDX, mmBIF_DOORBELL_CNTL, BIF_DOORBELL_CNTL__DOORBELL_MONITOR_EN_MASK, BIF_DOORBELL_CNTL__DOORBELL_MONITOR_EN__SHIFT, 0, 0 },
 	{ CMD_WRITE, NBIF_HWID, 0, mmBIF_FB_EN_BASE_IDX, mmBIF_FB_EN, 0, 0, 0, 0 },
 	{ CMD_READMODIFYWRITE, NBIF_HWID, 0, mmRCC_BACO_CNTL_MISC_BASE_IDX, mmBACO_CNTL, BACO_CNTL__BACO_DSTATE_BYPASS_MASK, BACO_CNTL__BACO_DSTATE_BYPASS__SHIFT, 0, 1 },
 	{ CMD_READMODIFYWRITE, NBIF_HWID, 0, mmRCC_BACO_CNTL_MISC_BASE_IDX, mmBACO_CNTL, BACO_CNTL__BACO_RST_INTR_MASK_MASK, BACO_CNTL__BACO_RST_INTR_MASK__SHIFT, 0, 1 }
 };
 
-static const struct soc15_baco_cmd_entry enter_baco_tbl[] =
-{
+static const struct soc15_baco_cmd_entry enter_baco_tbl[] = {
 	{ CMD_WAITFOR, THM_HWID, 0, mmTHM_BACO_CNTL_BASE_IDX, mmTHM_BACO_CNTL, THM_BACO_CNTL__SOC_DOMAIN_IDLE_MASK, THM_BACO_CNTL__SOC_DOMAIN_IDLE__SHIFT, 0xffffffff, 0x80000000 },
 	{ CMD_READMODIFYWRITE, NBIF_HWID, 0, mmRCC_BACO_CNTL_MISC_BASE_IDX, mmBACO_CNTL, BACO_CNTL__BACO_EN_MASK, BACO_CNTL__BACO_EN__SHIFT, 0, 1 },
 	{ CMD_READMODIFYWRITE, NBIF_HWID, 0, mmRCC_BACO_CNTL_MISC_BASE_IDX, mmBACO_CNTL, BACO_CNTL__BACO_BIF_LCLK_SWITCH_MASK, BACO_CNTL__BACO_BIF_LCLK_SWITCH__SHIFT, 0, 1 },
@@ -56,8 +54,7 @@ static const struct soc15_baco_cmd_entry enter_baco_tbl[] =
 	{ CMD_WAITFOR, NBIF_HWID, 0, mmRCC_BACO_CNTL_MISC_BASE_IDX, mmBACO_CNTL, BACO_CNTL__BACO_MODE_MASK, BACO_CNTL__BACO_MODE__SHIFT, 0xffffffff, 0x100 }
 };
 
-static const struct soc15_baco_cmd_entry exit_baco_tbl[] =
-{
+static const struct soc15_baco_cmd_entry exit_baco_tbl[] = {
 	{ CMD_READMODIFYWRITE, NBIF_HWID, 0, mmRCC_BACO_CNTL_MISC_BASE_IDX, mmBACO_CNTL, BACO_CNTL__BACO_POWER_OFF_MASK, BACO_CNTL__BACO_POWER_OFF__SHIFT, 0, 0 },
 	{ CMD_DELAY_MS, 0, 0, 0, 0, 0, 0, 10, 0 },
 	{ CMD_READMODIFYWRITE, THM_HWID, 0, mmTHM_BACO_CNTL_BASE_IDX, mmTHM_BACO_CNTL, THM_BACO_CNTL__BACO_SOC_REFCLK_OFF_MASK, THM_BACO_CNTL__BACO_SOC_REFCLK_OFF__SHIFT, 0, 0 },
@@ -77,8 +74,7 @@ static const struct soc15_baco_cmd_entry exit_baco_tbl[] =
 	{ CMD_WAITFOR, NBIF_HWID, 0, mmRCC_BACO_CNTL_MISC_BASE_IDX, mmBACO_CNTL, BACO_CNTL__BACO_MODE_MASK, 0, 0xffffffff, 0 }
 };
 
-static const struct soc15_baco_cmd_entry clean_baco_tbl[] =
-{
+static const struct soc15_baco_cmd_entry clean_baco_tbl[] = {
 	{ CMD_WRITE, NBIF_HWID, 0, mmBIOS_SCRATCH_6_BASE_IDX, mmBIOS_SCRATCH_6, 0, 0, 0, 0 },
 	{ CMD_WRITE, NBIF_HWID, 0, mmBIOS_SCRATCH_7_BASE_IDX, mmBIOS_SCRATCH_7, 0, 0, 0, 0 }
 };
-- 
2.17.1

