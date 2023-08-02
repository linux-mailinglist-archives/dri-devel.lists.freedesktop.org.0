Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF85D76C73D
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 09:43:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5666610E05C;
	Wed,  2 Aug 2023 07:43:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out28-105.mail.aliyun.com (out28-105.mail.aliyun.com
 [115.124.28.105])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA81110E4DC;
 Wed,  2 Aug 2023 07:43:24 +0000 (UTC)
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.1447226|-1; CH=blue; DM=|OVERLOAD|false|;
 DS=CONTINUE|ham_system_inform|0.180895-0.00661834-0.812487;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047211; MF=sunran001@208suo.com; NM=1;
 PH=DS; RN=5; RT=5; SR=0; TI=SMTPD_---.U6d8ofZ_1690962195; 
Received: from localhost.localdomain(mailfrom:sunran001@208suo.com
 fp:SMTPD_---.U6d8ofZ_1690962195) by smtp.aliyun-inc.com;
 Wed, 02 Aug 2023 15:43:17 +0800
From: Ran Sun <sunran001@208suo.com>
To: alexander.deucher@amd.com
Subject: [PATCH] drm/amdgpu: Clean up errors in vcn_v4_0.c
Date: Wed,  2 Aug 2023 07:43:15 +0000
Message-Id: <20230802074315.13688-1-sunran001@208suo.com>
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

spaces required around that '==' (ctx:VxV)
ERROR: space required before the open parenthesis '('
ERROR: that open brace { should be on the previous line

Signed-off-by: Ran Sun <sunran001@208suo.com>
---
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
index 6089c7deba8a..ef5b16061e96 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
@@ -1139,11 +1139,11 @@ static int vcn_v4_0_start(struct amdgpu_device *adev)
 				if (status & 2)
 					break;
 				mdelay(10);
-				if (amdgpu_emu_mode==1)
+				if (amdgpu_emu_mode == 1)
 					msleep(1);
 			}
 
-			if (amdgpu_emu_mode==1) {
+			if (amdgpu_emu_mode == 1) {
 				r = -1;
 				if (status & 2) {
 					r = 0;
@@ -1959,7 +1959,7 @@ static int vcn_v4_0_set_powergating_state(void *handle, enum amd_powergating_sta
 		return 0;
 	}
 
-	if(state == adev->vcn.cur_state)
+	if (state == adev->vcn.cur_state)
 		return 0;
 
 	if (state == AMD_PG_STATE_GATE)
@@ -1967,7 +1967,7 @@ static int vcn_v4_0_set_powergating_state(void *handle, enum amd_powergating_sta
 	else
 		ret = vcn_v4_0_start(adev);
 
-	if(!ret)
+	if (!ret)
 		adev->vcn.cur_state = state;
 
 	return ret;
@@ -2101,8 +2101,7 @@ static const struct amd_ip_funcs vcn_v4_0_ip_funcs = {
 	.set_powergating_state = vcn_v4_0_set_powergating_state,
 };
 
-const struct amdgpu_ip_block_version vcn_v4_0_ip_block =
-{
+const struct amdgpu_ip_block_version vcn_v4_0_ip_block = {
 	.type = AMD_IP_BLOCK_TYPE_VCN,
 	.major = 4,
 	.minor = 0,
-- 
2.17.1

