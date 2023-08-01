Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 523B876A649
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 03:26:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3622E10E2E8;
	Tue,  1 Aug 2023 01:26:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out28-148.mail.aliyun.com (out28-148.mail.aliyun.com
 [115.124.28.148])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72C9610E2E8;
 Tue,  1 Aug 2023 01:26:19 +0000 (UTC)
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07736829|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.0982606-0.000258943-0.90148;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047203; MF=sunran001@208suo.com; NM=1;
 PH=DS; RN=8; RT=8; SR=0; TI=SMTPD_---.U5CBZxW_1690853169; 
Received: from localhost.localdomain(mailfrom:sunran001@208suo.com
 fp:SMTPD_---.U5CBZxW_1690853169) by smtp.aliyun-inc.com;
 Tue, 01 Aug 2023 09:26:12 +0800
From: Ran Sun <sunran001@208suo.com>
To: apw@canonical.com,
	joe@perches.com,
	alexander.deucher@amd.com
Subject: [PATCH] drm/amd/pm: Clean up errors in smu_v13_0_7_ppt.c
Date: Tue,  1 Aug 2023 01:26:08 +0000
Message-Id: <20230801012608.4003-1-sunran001@208suo.com>
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
Cc: bpf@vger.kernel.org, Ran Sun <sunran001@208suo.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the following errors reported by checkpatch:

ERROR: open brace '{' following struct go on the same line
ERROR: spaces required around that '=' (ctx:VxW)
ERROR: that open brace { should be on the previous line

Signed-off-by: Ran Sun <sunran001@208suo.com>
---
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c
index b1f0937ccade..26ba51ec0567 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c
@@ -386,8 +386,7 @@ static int smu_v13_0_7_check_fw_status(struct smu_context *smu)
 }
 
 #ifndef atom_smc_dpm_info_table_13_0_7
-struct atom_smc_dpm_info_table_13_0_7
-{
+struct atom_smc_dpm_info_table_13_0_7 {
 	struct atom_common_table_header table_header;
 	BoardTable_t BoardTable;
 };
@@ -494,7 +493,7 @@ static int smu_v13_0_7_tables_init(struct smu_context *smu)
 		       PAGE_SIZE, AMDGPU_GEM_DOMAIN_VRAM);
 	SMU_TABLE_INIT(tables, SMU_TABLE_ACTIVITY_MONITOR_COEFF,
 		       sizeof(DpmActivityMonitorCoeffIntExternal_t), PAGE_SIZE,
-	               AMDGPU_GEM_DOMAIN_VRAM);
+		       AMDGPU_GEM_DOMAIN_VRAM);
 	SMU_TABLE_INIT(tables, SMU_TABLE_COMBO_PPTABLE, MP0_MP1_DATA_REGION_SIZE_COMBOPPTABLE,
 			PAGE_SIZE, AMDGPU_GEM_DOMAIN_VRAM);
 
@@ -728,7 +727,7 @@ static int smu_v13_0_7_get_smu_metrics_data(struct smu_context *smu,
 					    MetricsMember_t member,
 					    uint32_t *value)
 {
-	struct smu_table_context *smu_table= &smu->smu_table;
+	struct smu_table_context *smu_table = &smu->smu_table;
 	SmuMetrics_t *metrics =
 		&(((SmuMetricsExternal_t *)(smu_table->metrics_table))->SmuMetrics);
 	int ret = 0;
@@ -1635,8 +1634,7 @@ static int smu_v13_0_7_force_clk_levels(struct smu_context *smu,
 	return ret;
 }
 
-static const struct smu_temperature_range smu13_thermal_policy[] =
-{
+static const struct smu_temperature_range smu13_thermal_policy[] = {
 	{-273150,  99000, 99000, -273150, 99000, 99000, -273150, 99000, 99000},
 	{ 120000, 120000, 120000, 120000, 120000, 120000, 120000, 120000, 120000},
 };
-- 
2.17.1

