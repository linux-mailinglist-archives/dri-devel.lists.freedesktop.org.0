Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1105676C2E8
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 04:31:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 771E310E483;
	Wed,  2 Aug 2023 02:31:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out28-114.mail.aliyun.com (out28-114.mail.aliyun.com
 [115.124.28.114])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E199210E483;
 Wed,  2 Aug 2023 02:31:23 +0000 (UTC)
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.2471169|-1; CH=blue; DM=|OVERLOAD|false|;
 DS=CONTINUE|ham_alarm|0.00983395-0.000359475-0.989807; FP=0|0|0|0|0|-1|-1|-1;
 HT=ay29a033018047190; MF=sunran001@208suo.com; NM=1; PH=DS; RN=5; RT=5; SR=0;
 TI=SMTPD_---.U6LyXcz_1690943470; 
Received: from localhost.localdomain(mailfrom:sunran001@208suo.com
 fp:SMTPD_---.U6LyXcz_1690943470) by smtp.aliyun-inc.com;
 Wed, 02 Aug 2023 10:31:17 +0800
From: Ran Sun <sunran001@208suo.com>
To: alexander.deucher@amd.com
Subject: [PATCH] drm/amd/pm: Clean up errors in amdgpu_pm.c
Date: Wed,  2 Aug 2023 02:31:09 +0000
Message-Id: <20230802023109.9924-1-sunran001@208suo.com>
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
ERROR: space required before the open parenthesis '('

Signed-off-by: Ran Sun <sunran001@208suo.com>
---
 drivers/gpu/drm/amd/pm/amdgpu_pm.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/amdgpu_pm.c b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
index 3922dd274f30..acaab3441030 100644
--- a/drivers/gpu/drm/amd/pm/amdgpu_pm.c
+++ b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
@@ -743,7 +743,7 @@ static ssize_t amdgpu_set_pp_od_clk_voltage(struct device *dev,
 		type = PP_OD_EDIT_CCLK_VDDC_TABLE;
 	else if (*buf == 'm')
 		type = PP_OD_EDIT_MCLK_VDDC_TABLE;
-	else if(*buf == 'r')
+	else if (*buf == 'r')
 		type = PP_OD_RESTORE_DEFAULT_TABLE;
 	else if (*buf == 'c')
 		type = PP_OD_COMMIT_DPM_TABLE;
@@ -3532,7 +3532,8 @@ void amdgpu_pm_sysfs_fini(struct amdgpu_device *adev)
 #if defined(CONFIG_DEBUG_FS)
 
 static void amdgpu_debugfs_prints_cpu_info(struct seq_file *m,
-					   struct amdgpu_device *adev) {
+					   struct amdgpu_device *adev)
+{
 	uint16_t *p_val;
 	uint32_t size;
 	int i;
-- 
2.17.1

