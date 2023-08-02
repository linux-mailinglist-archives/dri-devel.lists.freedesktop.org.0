Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44DEA76C610
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 09:04:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14A0410E4BD;
	Wed,  2 Aug 2023 07:04:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out28-121.mail.aliyun.com (out28-121.mail.aliyun.com
 [115.124.28.121])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D669410E4BD;
 Wed,  2 Aug 2023 07:03:58 +0000 (UTC)
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.08088165|-1; CH=green;
 DM=|CONTINUE|false|; DS=CONTINUE|ham_regular_dialog|0.365273-0.011224-0.623503;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047213; MF=sunran001@208suo.com; NM=1;
 PH=DS; RN=5; RT=5; SR=0; TI=SMTPD_---.U6Zm35v_1690959829; 
Received: from localhost.localdomain(mailfrom:sunran001@208suo.com
 fp:SMTPD_---.U6Zm35v_1690959829) by smtp.aliyun-inc.com;
 Wed, 02 Aug 2023 15:03:51 +0800
From: Ran Sun <sunran001@208suo.com>
To: alexander.deucher@amd.com
Subject: [PATCH] drm/amdgpu: Clean up errors in dce_v10_0.c
Date: Wed,  2 Aug 2023 07:03:48 +0000
Message-Id: <20230802070348.12538-1-sunran001@208suo.com>
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
 drivers/gpu/drm/amd/amdgpu/dce_v10_0.c | 30 +++++++++-----------------
 1 file changed, 10 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
index 9a24ed463abd..584cd5277f92 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
@@ -52,8 +52,7 @@
 static void dce_v10_0_set_display_funcs(struct amdgpu_device *adev);
 static void dce_v10_0_set_irq_funcs(struct amdgpu_device *adev);
 
-static const u32 crtc_offsets[] =
-{
+static const u32 crtc_offsets[] = {
 	CRTC0_REGISTER_OFFSET,
 	CRTC1_REGISTER_OFFSET,
 	CRTC2_REGISTER_OFFSET,
@@ -63,8 +62,7 @@ static const u32 crtc_offsets[] =
 	CRTC6_REGISTER_OFFSET
 };
 
-static const u32 hpd_offsets[] =
-{
+static const u32 hpd_offsets[] = {
 	HPD0_REGISTER_OFFSET,
 	HPD1_REGISTER_OFFSET,
 	HPD2_REGISTER_OFFSET,
@@ -121,30 +119,26 @@ static const struct {
 	.hpd = DISP_INTERRUPT_STATUS_CONTINUE5__DC_HPD6_INTERRUPT_MASK
 } };
 
-static const u32 golden_settings_tonga_a11[] =
-{
+static const u32 golden_settings_tonga_a11[] = {
 	mmDCI_CLK_CNTL, 0x00000080, 0x00000000,
 	mmFBC_DEBUG_COMP, 0x000000f0, 0x00000070,
 	mmFBC_MISC, 0x1f311fff, 0x12300000,
 	mmHDMI_CONTROL, 0x31000111, 0x00000011,
 };
 
-static const u32 tonga_mgcg_cgcg_init[] =
-{
+static const u32 tonga_mgcg_cgcg_init[] = {
 	mmXDMA_CLOCK_GATING_CNTL, 0xffffffff, 0x00000100,
 	mmXDMA_MEM_POWER_CNTL, 0x00000101, 0x00000000,
 };
 
-static const u32 golden_settings_fiji_a10[] =
-{
+static const u32 golden_settings_fiji_a10[] = {
 	mmDCI_CLK_CNTL, 0x00000080, 0x00000000,
 	mmFBC_DEBUG_COMP, 0x000000f0, 0x00000070,
 	mmFBC_MISC, 0x1f311fff, 0x12300000,
 	mmHDMI_CONTROL, 0x31000111, 0x00000011,
 };
 
-static const u32 fiji_mgcg_cgcg_init[] =
-{
+static const u32 fiji_mgcg_cgcg_init[] = {
 	mmXDMA_CLOCK_GATING_CNTL, 0xffffffff, 0x00000100,
 	mmXDMA_MEM_POWER_CNTL, 0x00000101, 0x00000000,
 };
@@ -1425,8 +1419,7 @@ static void dce_v10_0_audio_enable(struct amdgpu_device *adev,
 			   enable ? AZALIA_F0_CODEC_PIN_CONTROL_HOT_PLUG_CONTROL__AUDIO_ENABLED_MASK : 0);
 }
 
-static const u32 pin_offsets[] =
-{
+static const u32 pin_offsets[] = {
 	AUD0_REGISTER_OFFSET,
 	AUD1_REGISTER_OFFSET,
 	AUD2_REGISTER_OFFSET,
@@ -1811,8 +1804,7 @@ static void dce_v10_0_afmt_fini(struct amdgpu_device *adev)
 	}
 }
 
-static const u32 vga_control_regs[6] =
-{
+static const u32 vga_control_regs[6] = {
 	mmD1VGA_CONTROL,
 	mmD2VGA_CONTROL,
 	mmD3VGA_CONTROL,
@@ -3651,8 +3643,7 @@ static void dce_v10_0_set_irq_funcs(struct amdgpu_device *adev)
 	adev->hpd_irq.funcs = &dce_v10_0_hpd_irq_funcs;
 }
 
-const struct amdgpu_ip_block_version dce_v10_0_ip_block =
-{
+const struct amdgpu_ip_block_version dce_v10_0_ip_block = {
 	.type = AMD_IP_BLOCK_TYPE_DCE,
 	.major = 10,
 	.minor = 0,
@@ -3660,8 +3651,7 @@ const struct amdgpu_ip_block_version dce_v10_0_ip_block =
 	.funcs = &dce_v10_0_ip_funcs,
 };
 
-const struct amdgpu_ip_block_version dce_v10_1_ip_block =
-{
+const struct amdgpu_ip_block_version dce_v10_1_ip_block = {
 	.type = AMD_IP_BLOCK_TYPE_DCE,
 	.major = 10,
 	.minor = 1,
-- 
2.17.1

