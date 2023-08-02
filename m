Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F5376C623
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 09:12:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB56410E4C5;
	Wed,  2 Aug 2023 07:12:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out28-194.mail.aliyun.com (out28-194.mail.aliyun.com
 [115.124.28.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D314110E4C5;
 Wed,  2 Aug 2023 07:12:12 +0000 (UTC)
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.1645156|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.0352353-0.000645299-0.964119;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047207; MF=sunran001@208suo.com; NM=1;
 PH=DS; RN=5; RT=5; SR=0; TI=SMTPD_---.U6anUDl_1690960322; 
Received: from localhost.localdomain(mailfrom:sunran001@208suo.com
 fp:SMTPD_---.U6anUDl_1690960322) by smtp.aliyun-inc.com;
 Wed, 02 Aug 2023 15:12:04 +0800
From: Ran Sun <sunran001@208suo.com>
To: alexander.deucher@amd.com
Subject: [PATCH] drm/amdgpu/jpeg: Clean up errors in vcn_v1_0.c
Date: Wed,  2 Aug 2023 07:12:01 +0000
Message-Id: <20230802071201.12717-1-sunran001@208suo.com>
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

ERROR: space required before the open parenthesis '('
ERROR: space prohibited after that '~' (ctx:WxW)

Signed-off-by: Ran Sun <sunran001@208suo.com>
---
 drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c
index 16feb491adf5..25ba27151ac0 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c
@@ -473,7 +473,7 @@ static void vcn_v1_0_disable_clock_gating(struct amdgpu_device *adev)
 	if (adev->cg_flags & AMD_CG_SUPPORT_VCN_MGCG)
 		data |= 1 << UVD_CGC_CTRL__DYN_CLOCK_MODE__SHIFT;
 	else
-		data &= ~ UVD_CGC_CTRL__DYN_CLOCK_MODE_MASK;
+		data &= ~UVD_CGC_CTRL__DYN_CLOCK_MODE_MASK;
 
 	data |= 1 << UVD_CGC_CTRL__CLK_GATE_DLY_TIMER__SHIFT;
 	data |= 4 << UVD_CGC_CTRL__CLK_OFF_DELAY__SHIFT;
@@ -1772,7 +1772,7 @@ static int vcn_v1_0_set_powergating_state(void *handle,
 	int ret;
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
 
-	if(state == adev->vcn.cur_state)
+	if (state == adev->vcn.cur_state)
 		return 0;
 
 	if (state == AMD_PG_STATE_GATE)
@@ -1780,7 +1780,7 @@ static int vcn_v1_0_set_powergating_state(void *handle,
 	else
 		ret = vcn_v1_0_start(adev);
 
-	if(!ret)
+	if (!ret)
 		adev->vcn.cur_state = state;
 	return ret;
 }
@@ -2065,8 +2065,7 @@ static void vcn_v1_0_set_irq_funcs(struct amdgpu_device *adev)
 	adev->vcn.inst->irq.funcs = &vcn_v1_0_irq_funcs;
 }
 
-const struct amdgpu_ip_block_version vcn_v1_0_ip_block =
-{
+const struct amdgpu_ip_block_version vcn_v1_0_ip_block = {
 		.type = AMD_IP_BLOCK_TYPE_VCN,
 		.major = 1,
 		.minor = 0,
-- 
2.17.1

