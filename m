Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 265E476C761
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 09:49:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0541410E516;
	Wed,  2 Aug 2023 07:49:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out28-93.mail.aliyun.com (out28-93.mail.aliyun.com
 [115.124.28.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FCED10E055;
 Wed,  2 Aug 2023 07:48:56 +0000 (UTC)
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07469802|-1; CH=blue; DM=|OVERLOAD|false|;
 DS=CONTINUE|ham_system_inform|0.324824-0.00276745-0.672408;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047193; MF=sunran001@208suo.com; NM=1;
 PH=DS; RN=5; RT=5; SR=0; TI=SMTPD_---.U6ccNrv_1690962528; 
Received: from localhost.localdomain(mailfrom:sunran001@208suo.com
 fp:SMTPD_---.U6ccNrv_1690962528) by smtp.aliyun-inc.com;
 Wed, 02 Aug 2023 15:48:49 +0800
From: Ran Sun <sunran001@208suo.com>
To: alexander.deucher@amd.com
Subject: [PATCH] drm/amdgpu: Clean up errors in gfx_v7_0.c
Date: Wed,  2 Aug 2023 07:48:44 +0000
Message-Id: <20230802074844.13773-1-sunran001@208suo.com>
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
ERROR: trailing statements should be on next line
ERROR: open brace '{' following struct go on the same line
ERROR: space prohibited before that '++' (ctx:WxB)

Signed-off-by: Ran Sun <sunran001@208suo.com>
---
 drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c | 28 +++++++++++----------------
 1 file changed, 11 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c
index 8c174c11eaee..90b034b173c1 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c
@@ -90,8 +90,7 @@ MODULE_FIRMWARE("amdgpu/mullins_ce.bin");
 MODULE_FIRMWARE("amdgpu/mullins_rlc.bin");
 MODULE_FIRMWARE("amdgpu/mullins_mec.bin");
 
-static const struct amdgpu_gds_reg_offset amdgpu_gds_reg_offset[] =
-{
+static const struct amdgpu_gds_reg_offset amdgpu_gds_reg_offset[] = {
 	{mmGDS_VMID0_BASE, mmGDS_VMID0_SIZE, mmGDS_GWS_VMID0, mmGDS_OA_VMID0},
 	{mmGDS_VMID1_BASE, mmGDS_VMID1_SIZE, mmGDS_GWS_VMID1, mmGDS_OA_VMID1},
 	{mmGDS_VMID2_BASE, mmGDS_VMID2_SIZE, mmGDS_GWS_VMID2, mmGDS_OA_VMID2},
@@ -110,8 +109,7 @@ static const struct amdgpu_gds_reg_offset amdgpu_gds_reg_offset[] =
 	{mmGDS_VMID15_BASE, mmGDS_VMID15_SIZE, mmGDS_GWS_VMID15, mmGDS_OA_VMID15}
 };
 
-static const u32 spectre_rlc_save_restore_register_list[] =
-{
+static const u32 spectre_rlc_save_restore_register_list[] = {
 	(0x0e00 << 16) | (0xc12c >> 2),
 	0x00000000,
 	(0x0e00 << 16) | (0xc140 >> 2),
@@ -557,8 +555,7 @@ static const u32 spectre_rlc_save_restore_register_list[] =
 	(0x0e00 << 16) | (0x9600 >> 2),
 };
 
-static const u32 kalindi_rlc_save_restore_register_list[] =
-{
+static const u32 kalindi_rlc_save_restore_register_list[] = {
 	(0x0e00 << 16) | (0xc12c >> 2),
 	0x00000000,
 	(0x0e00 << 16) | (0xc140 >> 2),
@@ -933,7 +930,8 @@ static int gfx_v7_0_init_microcode(struct amdgpu_device *adev)
 	case CHIP_MULLINS:
 		chip_name = "mullins";
 		break;
-	default: BUG();
+	default:
+		BUG();
 	}
 
 	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_pfp.bin", chip_name);
@@ -2759,8 +2757,7 @@ static int gfx_v7_0_mec_init(struct amdgpu_device *adev)
 	return 0;
 }
 
-struct hqd_registers
-{
+struct hqd_registers {
 	u32 cp_mqd_base_addr;
 	u32 cp_mqd_base_addr_hi;
 	u32 cp_hqd_active;
@@ -5124,11 +5121,11 @@ static void gfx_v7_0_get_cu_info(struct amdgpu_device *adev)
 			bitmap = gfx_v7_0_get_cu_active_bitmap(adev);
 			cu_info->bitmap[i][j] = bitmap;
 
-			for (k = 0; k < adev->gfx.config.max_cu_per_sh; k ++) {
+			for (k = 0; k < adev->gfx.config.max_cu_per_sh; k++) {
 				if (bitmap & mask) {
 					if (counter < ao_cu_num)
 						ao_bitmap |= mask;
-					counter ++;
+					counter++;
 				}
 				mask <<= 1;
 			}
@@ -5150,8 +5147,7 @@ static void gfx_v7_0_get_cu_info(struct amdgpu_device *adev)
 	cu_info->lds_size = 64;
 }
 
-const struct amdgpu_ip_block_version gfx_v7_1_ip_block =
-{
+const struct amdgpu_ip_block_version gfx_v7_1_ip_block = {
 	.type = AMD_IP_BLOCK_TYPE_GFX,
 	.major = 7,
 	.minor = 1,
@@ -5159,8 +5155,7 @@ const struct amdgpu_ip_block_version gfx_v7_1_ip_block =
 	.funcs = &gfx_v7_0_ip_funcs,
 };
 
-const struct amdgpu_ip_block_version gfx_v7_2_ip_block =
-{
+const struct amdgpu_ip_block_version gfx_v7_2_ip_block = {
 	.type = AMD_IP_BLOCK_TYPE_GFX,
 	.major = 7,
 	.minor = 2,
@@ -5168,8 +5163,7 @@ const struct amdgpu_ip_block_version gfx_v7_2_ip_block =
 	.funcs = &gfx_v7_0_ip_funcs,
 };
 
-const struct amdgpu_ip_block_version gfx_v7_3_ip_block =
-{
+const struct amdgpu_ip_block_version gfx_v7_3_ip_block = {
 	.type = AMD_IP_BLOCK_TYPE_GFX,
 	.major = 7,
 	.minor = 3,
-- 
2.17.1

