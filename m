Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B014176C590
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 08:48:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57CAD10E4A7;
	Wed,  2 Aug 2023 06:48:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out28-171.mail.aliyun.com (out28-171.mail.aliyun.com
 [115.124.28.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91FB510E4A6;
 Wed,  2 Aug 2023 06:48:33 +0000 (UTC)
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.3444751|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_alarm|0.00639894-4.13957e-05-0.99356; FP=0|0|0|0|0|-1|-1|-1;
 HT=ay29a033018047193; MF=sunran001@208suo.com; NM=1; PH=DS; RN=5; RT=5; SR=0;
 TI=SMTPD_---.U6YuGG9_1690958904; 
Received: from localhost.localdomain(mailfrom:sunran001@208suo.com
 fp:SMTPD_---.U6YuGG9_1690958904) by smtp.aliyun-inc.com;
 Wed, 02 Aug 2023 14:48:25 +0800
From: Ran Sun <sunran001@208suo.com>
To: alexander.deucher@amd.com
Subject: [PATCH] drm/amdgpu: Clean up errors in mmhub_v9_4.c
Date: Wed,  2 Aug 2023 06:48:22 +0000
Message-Id: <20230802064822.12093-1-sunran001@208suo.com>
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

ERROR: code indent should use tabs where possible
ERROR: space required before the open parenthesis '('

Signed-off-by: Ran Sun <sunran001@208suo.com>
---
 drivers/gpu/drm/amd/amdgpu/mmhub_v9_4.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/mmhub_v9_4.c b/drivers/gpu/drm/amd/amdgpu/mmhub_v9_4.c
index e790f890aec6..5718e4d40e66 100644
--- a/drivers/gpu/drm/amd/amdgpu/mmhub_v9_4.c
+++ b/drivers/gpu/drm/amd/amdgpu/mmhub_v9_4.c
@@ -108,7 +108,7 @@ static void mmhub_v9_4_setup_vm_pt_regs(struct amdgpu_device *adev, uint32_t vmi
 }
 
 static void mmhub_v9_4_init_system_aperture_regs(struct amdgpu_device *adev,
-					         int hubid)
+						int hubid)
 {
 	uint64_t value;
 	uint32_t tmp;
@@ -1568,7 +1568,7 @@ static int mmhub_v9_4_get_ras_error_count(struct amdgpu_device *adev,
 	uint32_t sec_cnt, ded_cnt;
 
 	for (i = 0; i < ARRAY_SIZE(mmhub_v9_4_ras_fields); i++) {
-		if(mmhub_v9_4_ras_fields[i].reg_offset != reg->reg_offset)
+		if (mmhub_v9_4_ras_fields[i].reg_offset != reg->reg_offset)
 			continue;
 
 		sec_cnt = (value &
-- 
2.17.1

