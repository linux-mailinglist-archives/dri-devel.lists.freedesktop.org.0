Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D3176C55F
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 08:40:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85F6010E4A2;
	Wed,  2 Aug 2023 06:40:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out28-146.mail.aliyun.com (out28-146.mail.aliyun.com
 [115.124.28.146])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F30210E4A2;
 Wed,  2 Aug 2023 06:40:37 +0000 (UTC)
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.2407244|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_alarm|0.00221003-7.23864e-05-0.997718; FP=0|0|0|0|0|-1|-1|-1;
 HT=ay29a033018047204; MF=sunran001@208suo.com; NM=1; PH=DS; RN=5; RT=5; SR=0;
 TI=SMTPD_---.U6YguAj_1690958427; 
Received: from localhost.localdomain(mailfrom:sunran001@208suo.com
 fp:SMTPD_---.U6YguAj_1690958427) by smtp.aliyun-inc.com;
 Wed, 02 Aug 2023 14:40:29 +0800
From: Ran Sun <sunran001@208suo.com>
To: alexander.deucher@amd.com
Subject: [PATCH] drm/amdgpu: Clean up errors in amdgpu_psp.h
Date: Wed,  2 Aug 2023 06:40:24 +0000
Message-Id: <20230802064024.11806-1-sunran001@208suo.com>
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

ERROR: open brace '{' following struct go on the same line
ERROR: open brace '{' following enum go on the same line

Signed-off-by: Ran Sun <sunran001@208suo.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h
index c3203de4a007..feef988bf0c1 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h
@@ -78,8 +78,7 @@ enum psp_bootloader_cmd {
 	PSP_BL__LOAD_TOS_SPL_TABLE	= 0x10000000,
 };
 
-enum psp_ring_type
-{
+enum psp_ring_type {
 	PSP_RING_TYPE__INVALID = 0,
 	/*
 	 * These values map to the way the PSP kernel identifies the
@@ -89,8 +88,7 @@ enum psp_ring_type
 	PSP_RING_TYPE__KM = 2  /* Kernel mode ring (formerly called GPCOM) */
 };
 
-struct psp_ring
-{
+struct psp_ring {
 	enum psp_ring_type		ring_type;
 	struct psp_gfx_rb_frame		*ring_mem;
 	uint64_t			ring_mem_mc_addr;
@@ -107,8 +105,7 @@ enum psp_reg_prog_id {
 	PSP_REG_LAST
 };
 
-struct psp_funcs
-{
+struct psp_funcs {
 	int (*init_microcode)(struct psp_context *psp);
 	int (*bootloader_load_kdb)(struct psp_context *psp);
 	int (*bootloader_load_spl)(struct psp_context *psp);
@@ -307,8 +304,7 @@ struct psp_runtime_scpm_entry {
 	enum psp_runtime_scpm_authentication scpm_status;
 };
 
-struct psp_context
-{
+struct psp_context {
 	struct amdgpu_device		*adev;
 	struct psp_ring			km_ring;
 	struct psp_gfx_cmd_resp		*cmd;
-- 
2.17.1

