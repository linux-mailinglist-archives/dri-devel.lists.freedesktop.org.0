Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04FD776A6F6
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 04:28:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 179E610E0BB;
	Tue,  1 Aug 2023 02:28:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out28-74.mail.aliyun.com (out28-74.mail.aliyun.com
 [115.124.28.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B47910E0BB;
 Tue,  1 Aug 2023 02:28:24 +0000 (UTC)
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.0744491|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_regular_dialog|0.00483132-0.000711951-0.994457;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047192; MF=sunran001@208suo.com; NM=1;
 PH=DS; RN=7; RT=7; SR=0; TI=SMTPD_---.U5Fqw-3_1690856895; 
Received: from localhost.localdomain(mailfrom:sunran001@208suo.com
 fp:SMTPD_---.U5Fqw-3_1690856895) by smtp.aliyun-inc.com;
 Tue, 01 Aug 2023 10:28:17 +0800
From: Ran Sun <sunran001@208suo.com>
To: alexander.deucher@amd.com,
	airlied@gmail.com,
	daniel@ffwll.ch
Subject: [PATCH] drm/amd/pm: Clean up errors in amdgpu_smu.c
Date: Tue,  1 Aug 2023 02:28:14 +0000
Message-Id: <20230801022814.4577-1-sunran001@208suo.com>
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

ERROR: spaces required around that '=' (ctx:WxV)
ERROR: spaces required around that '&&' (ctx:VxW)
ERROR: that open brace { should be on the previous line
ERROR: space required before the open parenthesis '('
ERROR: space required before the open brace '{'
ERROR: spaces required around that ':' (ctx:VxW)

Signed-off-by: Ran Sun <sunran001@208suo.com>
---
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
index ce41a8309582..a7199275ffb8 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
@@ -618,7 +618,7 @@ static int smu_set_funcs(struct amdgpu_device *adev)
 		adev->pm.pp_feature &= ~PP_GFXOFF_MASK;
 		arcturus_set_ppt_funcs(smu);
 		/* OD is not supported on Arcturus */
-		smu->od_enabled =false;
+		smu->od_enabled = false;
 		break;
 	case IP_VERSION(13, 0, 2):
 		aldebaran_set_ppt_funcs(smu);
@@ -1648,7 +1648,7 @@ static int smu_hw_fini(void *handle)
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
 	struct smu_context *smu = adev->powerplay.pp_handle;
 
-	if (amdgpu_sriov_vf(adev)&& !amdgpu_sriov_is_pp_one_vf(adev))
+	if (amdgpu_sriov_vf(adev) && !amdgpu_sriov_is_pp_one_vf(adev))
 		return 0;
 
 	smu_dpm_set_vcn_enable(smu, false);
@@ -1700,7 +1700,7 @@ static int smu_suspend(void *handle)
 	int ret;
 	uint64_t count;
 
-	if (amdgpu_sriov_vf(adev)&& !amdgpu_sriov_is_pp_one_vf(adev))
+	if (amdgpu_sriov_vf(adev) && !amdgpu_sriov_is_pp_one_vf(adev))
 		return 0;
 
 	if (!smu->pm_enabled)
@@ -2217,8 +2217,7 @@ const struct amd_ip_funcs smu_ip_funcs = {
 	.set_powergating_state = smu_set_powergating_state,
 };
 
-const struct amdgpu_ip_block_version smu_v11_0_ip_block =
-{
+const struct amdgpu_ip_block_version smu_v11_0_ip_block = {
 	.type = AMD_IP_BLOCK_TYPE_SMC,
 	.major = 11,
 	.minor = 0,
@@ -2226,8 +2225,7 @@ const struct amdgpu_ip_block_version smu_v11_0_ip_block =
 	.funcs = &smu_ip_funcs,
 };
 
-const struct amdgpu_ip_block_version smu_v12_0_ip_block =
-{
+const struct amdgpu_ip_block_version smu_v12_0_ip_block = {
 	.type = AMD_IP_BLOCK_TYPE_SMC,
 	.major = 12,
 	.minor = 0,
@@ -2235,8 +2233,7 @@ const struct amdgpu_ip_block_version smu_v12_0_ip_block =
 	.funcs = &smu_ip_funcs,
 };
 
-const struct amdgpu_ip_block_version smu_v13_0_ip_block =
-{
+const struct amdgpu_ip_block_version smu_v13_0_ip_block = {
 	.type = AMD_IP_BLOCK_TYPE_SMC,
 	.major = 13,
 	.minor = 0,
@@ -2337,7 +2334,7 @@ int smu_get_power_limit(void *handle,
 	if (!smu->pm_enabled || !smu->adev->pm.dpm_enabled)
 		return -EOPNOTSUPP;
 
-	switch(pp_power_type) {
+	switch (pp_power_type) {
 	case PP_PWR_TYPE_SUSTAINED:
 		limit_type = SMU_DEFAULT_PPT_LIMIT;
 		break;
@@ -2349,7 +2346,7 @@ int smu_get_power_limit(void *handle,
 		break;
 	}
 
-	switch(pp_limit_level){
+	switch (pp_limit_level) {
 	case PP_PWR_LIMIT_CURRENT:
 		limit_level = SMU_PPT_LIMIT_CURRENT;
 		break;
@@ -2595,7 +2592,7 @@ static int smu_read_sensor(void *handle,
 		*size = 4;
 		break;
 	case AMDGPU_PP_SENSOR_VCN_POWER_STATE:
-		*(uint32_t *)data = atomic_read(&smu->smu_power.power_gate.vcn_gated) ? 0: 1;
+		*(uint32_t *)data = atomic_read(&smu->smu_power.power_gate.vcn_gated) ? 0 : 1;
 		*size = 4;
 		break;
 	case AMDGPU_PP_SENSOR_MIN_FAN_RPM:
@@ -2868,7 +2865,7 @@ static int smu_set_xgmi_pstate(void *handle,
 	if (smu->ppt_funcs->set_xgmi_pstate)
 		ret = smu->ppt_funcs->set_xgmi_pstate(smu, pstate);
 
-	if(ret)
+	if (ret)
 		dev_err(smu->adev->dev, "Failed to set XGMI pstate!\n");
 
 	return ret;
-- 
2.17.1

