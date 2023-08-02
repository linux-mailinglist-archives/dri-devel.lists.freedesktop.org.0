Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 687DC76C5F8
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 08:58:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C05D610E4C0;
	Wed,  2 Aug 2023 06:58:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out28-196.mail.aliyun.com (out28-196.mail.aliyun.com
 [115.124.28.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8770B10E4C0;
 Wed,  2 Aug 2023 06:58:14 +0000 (UTC)
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.3522126|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.0108132-0.00065214-0.988535;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047208; MF=sunran001@208suo.com; NM=1;
 PH=DS; RN=5; RT=5; SR=0; TI=SMTPD_---.U6a9kda_1690959486; 
Received: from localhost.localdomain(mailfrom:sunran001@208suo.com
 fp:SMTPD_---.U6a9kda_1690959486) by smtp.aliyun-inc.com;
 Wed, 02 Aug 2023 14:58:08 +0800
From: Ran Sun <sunran001@208suo.com>
To: alexander.deucher@amd.com
Subject: [PATCH] drm/amdgpu: Clean up errors in uvd_v7_0.c
Date: Wed,  2 Aug 2023 06:58:04 +0000
Message-Id: <20230802065804.12360-1-sunran001@208suo.com>
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

ERROR: spaces required around that ':' (ctx:VxE)
that open brace { should be on the previous line

Signed-off-by: Ran Sun <sunran001@208suo.com>
---
 drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c b/drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c
index abaa4463e906..86d1d46e1e5e 100644
--- a/drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c
@@ -679,11 +679,11 @@ static void uvd_v7_0_mc_resume(struct amdgpu_device *adev)
 		if (adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) {
 			WREG32_SOC15(UVD, i, mmUVD_LMI_VCPU_CACHE_64BIT_BAR_LOW,
 				i == 0 ?
-				adev->firmware.ucode[AMDGPU_UCODE_ID_UVD].tmr_mc_addr_lo:
+				adev->firmware.ucode[AMDGPU_UCODE_ID_UVD].tmr_mc_addr_lo :
 				adev->firmware.ucode[AMDGPU_UCODE_ID_UVD1].tmr_mc_addr_lo);
 			WREG32_SOC15(UVD, i, mmUVD_LMI_VCPU_CACHE_64BIT_BAR_HIGH,
 				i == 0 ?
-				adev->firmware.ucode[AMDGPU_UCODE_ID_UVD].tmr_mc_addr_hi:
+				adev->firmware.ucode[AMDGPU_UCODE_ID_UVD].tmr_mc_addr_hi :
 				adev->firmware.ucode[AMDGPU_UCODE_ID_UVD1].tmr_mc_addr_hi);
 			WREG32_SOC15(UVD, i, mmUVD_VCPU_CACHE_OFFSET0, 0);
 			offset = 0;
@@ -1908,8 +1908,7 @@ static void uvd_v7_0_set_irq_funcs(struct amdgpu_device *adev)
 	}
 }
 
-const struct amdgpu_ip_block_version uvd_v7_0_ip_block =
-{
+const struct amdgpu_ip_block_version uvd_v7_0_ip_block = {
 		.type = AMD_IP_BLOCK_TYPE_UVD,
 		.major = 7,
 		.minor = 0,
-- 
2.17.1

