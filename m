Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BCB382A961
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 09:51:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BF7910E804;
	Thu, 11 Jan 2024 08:50:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.7])
 by gabe.freedesktop.org (Postfix) with ESMTP id F1E0B10E036;
 Thu, 11 Jan 2024 02:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=IqMfAJKFYt6J+qstwg
 7rkqilU4HK/21NbhnZgMySj/E=; b=RTI1FQHLypmfWGLAY7ZqcpRrxF3YQq8VzK
 H1bOFKnOlWspRfCs5SM59xIyKpYM4GSmSAnnt8U4LPysJGWy6U+VzCD2p1IowMb1
 nFWXffRHqXpp5IEYt2AkHIBolwvREI9u/9iNFyyaBNPwhvVgVUyI/efKebkbsugx
 diIKSccV0=
Received: from localhost.localdomain (unknown [182.148.14.173])
 by gzga-smtp-mta-g0-5 (Coremail) with SMTP id _____wD3_3FKTZ9lOOObAA--.54228S2;
 Thu, 11 Jan 2024 10:07:06 +0800 (CST)
From: chenxuebing <chenxb_99091@126.com>
To: alexander.deucher@amd.com, daniel@ffwll.ch, airlied@gmail.com,
 Xinhui.Pan@amd.com, christian.koenig@amd.com
Subject: [PATCH] drm/amd: Clean up errors in sdma_v2_4.c
Date: Thu, 11 Jan 2024 02:07:05 +0000
Message-Id: <20240111020705.5699-1-chenxb_99091@126.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: _____wD3_3FKTZ9lOOObAA--.54228S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7KF4kGw1fWFyfJw1UJryxZrb_yoW8ur1rpF
 Z5Zr98uFsYyF13K34UX3WkXrn5Kw1Uuayjyr4jg34I9w15Ar9xXr1xtrWfu345JFWfZrWI
 qFy7Kry7ZF1jv3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UjtC7UUUUU=
X-Originating-IP: [182.148.14.173]
X-CM-SenderInfo: hfkh05lebzmiizr6ij2wof0z/1tbiOhpixWVEuXmeagABsT
X-Mailman-Approved-At: Thu, 11 Jan 2024 08:50:44 +0000
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
Cc: amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, chenxuebing <chenxb_99091@126.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the following errors reported by checkpatch:

ERROR: that open brace { should be on the previous line
ERROR: trailing statements should be on next line

Signed-off-by: chenxuebing <chenxb_99091@126.com>
---
 drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c b/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c
index 8d5d86675a7f..07e19caf2bc1 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c
@@ -57,22 +57,19 @@ static void sdma_v2_4_set_irq_funcs(struct amdgpu_device *adev);
 MODULE_FIRMWARE("amdgpu/topaz_sdma.bin");
 MODULE_FIRMWARE("amdgpu/topaz_sdma1.bin");
 
-static const u32 sdma_offsets[SDMA_MAX_INSTANCE] =
-{
+static const u32 sdma_offsets[SDMA_MAX_INSTANCE] = {
 	SDMA0_REGISTER_OFFSET,
 	SDMA1_REGISTER_OFFSET
 };
 
-static const u32 golden_settings_iceland_a11[] =
-{
+static const u32 golden_settings_iceland_a11[] = {
 	mmSDMA0_CHICKEN_BITS, 0xfc910007, 0x00810007,
 	mmSDMA0_CLK_CTRL, 0xff000fff, 0x00000000,
 	mmSDMA1_CHICKEN_BITS, 0xfc910007, 0x00810007,
 	mmSDMA1_CLK_CTRL, 0xff000fff, 0x00000000,
 };
 
-static const u32 iceland_mgcg_cgcg_init[] =
-{
+static const u32 iceland_mgcg_cgcg_init[] = {
 	mmSDMA0_CLK_CTRL, 0xff000ff0, 0x00000100,
 	mmSDMA1_CLK_CTRL, 0xff000ff0, 0x00000100
 };
@@ -142,7 +139,8 @@ static int sdma_v2_4_init_microcode(struct amdgpu_device *adev)
 	case CHIP_TOPAZ:
 		chip_name = "topaz";
 		break;
-	default: BUG();
+	default:
+		BUG();
 	}
 
 	for (i = 0; i < adev->sdma.num_instances; i++) {
@@ -1258,8 +1256,7 @@ static void sdma_v2_4_set_vm_pte_funcs(struct amdgpu_device *adev)
 	adev->vm_manager.vm_pte_num_scheds = adev->sdma.num_instances;
 }
 
-const struct amdgpu_ip_block_version sdma_v2_4_ip_block =
-{
+const struct amdgpu_ip_block_version sdma_v2_4_ip_block = {
 	.type = AMD_IP_BLOCK_TYPE_SDMA,
 	.major = 2,
 	.minor = 4,
-- 
2.17.1

