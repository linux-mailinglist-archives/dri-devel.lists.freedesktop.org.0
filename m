Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC7CC76A711
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 04:37:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CDFF10E2F7;
	Tue,  1 Aug 2023 02:37:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out28-5.mail.aliyun.com (out28-5.mail.aliyun.com [115.124.28.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38D5C10E068;
 Tue,  1 Aug 2023 02:37:08 +0000 (UTC)
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07440288|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_regular_dialog|0.241969-0.00335738-0.754673;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047194; MF=sunran001@208suo.com; NM=1;
 PH=DS; RN=7; RT=7; SR=0; TI=SMTPD_---.U5Gdet3_1690857420; 
Received: from localhost.localdomain(mailfrom:sunran001@208suo.com
 fp:SMTPD_---.U5Gdet3_1690857420) by smtp.aliyun-inc.com;
 Tue, 01 Aug 2023 10:37:01 +0800
From: Ran Sun <sunran001@208suo.com>
To: alexander.deucher@amd.com,
	airlied@gmail.com,
	daniel@ffwll.ch
Subject: [PATCH] drm/amd/pm: Clean up errors in amd_powerplay.c
Date: Tue,  1 Aug 2023 02:36:58 +0000
Message-Id: <20230801023658.4667-1-sunran001@208suo.com>
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
ERROR: spaces required around that '||' (ctx:WxO)

Signed-off-by: Ran Sun <sunran001@208suo.com>
---
 drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c b/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c
index ff360c699171..9e4f8a4104a3 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c
@@ -612,7 +612,7 @@ static int pp_dpm_get_pp_num_states(void *handle,
 
 	memset(data, 0, sizeof(*data));
 
-	if (!hwmgr || !hwmgr->pm_en ||!hwmgr->ps)
+	if (!hwmgr || !hwmgr->pm_en || !hwmgr->ps)
 		return -EINVAL;
 
 	data->nums = hwmgr->num_ps;
@@ -644,7 +644,7 @@ static int pp_dpm_get_pp_table(void *handle, char **table)
 {
 	struct pp_hwmgr *hwmgr = handle;
 
-	if (!hwmgr || !hwmgr->pm_en ||!hwmgr->soft_pp_table)
+	if (!hwmgr || !hwmgr->pm_en || !hwmgr->soft_pp_table)
 		return -EINVAL;
 
 	*table = (char *)hwmgr->soft_pp_table;
@@ -1002,7 +1002,7 @@ static int pp_get_power_limit(void *handle, uint32_t *limit,
 	struct pp_hwmgr *hwmgr = handle;
 	int ret = 0;
 
-	if (!hwmgr || !hwmgr->pm_en ||!limit)
+	if (!hwmgr || !hwmgr->pm_en || !limit)
 		return -EINVAL;
 
 	if (power_type != PP_PWR_TYPE_SUSTAINED)
@@ -1047,7 +1047,7 @@ static int pp_get_display_power_level(void *handle,
 {
 	struct pp_hwmgr *hwmgr = handle;
 
-	if (!hwmgr || !hwmgr->pm_en ||!output)
+	if (!hwmgr || !hwmgr->pm_en || !output)
 		return -EINVAL;
 
 	return phm_get_dal_power_level(hwmgr, output);
@@ -1120,7 +1120,7 @@ static int pp_get_clock_by_type_with_latency(void *handle,
 {
 	struct pp_hwmgr *hwmgr = handle;
 
-	if (!hwmgr || !hwmgr->pm_en ||!clocks)
+	if (!hwmgr || !hwmgr->pm_en || !clocks)
 		return -EINVAL;
 
 	return phm_get_clock_by_type_with_latency(hwmgr, type, clocks);
@@ -1132,7 +1132,7 @@ static int pp_get_clock_by_type_with_voltage(void *handle,
 {
 	struct pp_hwmgr *hwmgr = handle;
 
-	if (!hwmgr || !hwmgr->pm_en ||!clocks)
+	if (!hwmgr || !hwmgr->pm_en || !clocks)
 		return -EINVAL;
 
 	return phm_get_clock_by_type_with_voltage(hwmgr, type, clocks);
@@ -1155,7 +1155,7 @@ static int pp_display_clock_voltage_request(void *handle,
 {
 	struct pp_hwmgr *hwmgr = handle;
 
-	if (!hwmgr || !hwmgr->pm_en ||!clock)
+	if (!hwmgr || !hwmgr->pm_en || !clock)
 		return -EINVAL;
 
 	return phm_display_clock_voltage_request(hwmgr, clock);
@@ -1167,7 +1167,7 @@ static int pp_get_display_mode_validation_clocks(void *handle,
 	struct pp_hwmgr *hwmgr = handle;
 	int ret = 0;
 
-	if (!hwmgr || !hwmgr->pm_en ||!clocks)
+	if (!hwmgr || !hwmgr->pm_en || !clocks)
 		return -EINVAL;
 
 	clocks->level = PP_DAL_POWERLEVEL_7;
-- 
2.17.1

