Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D4C076C70F
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 09:37:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA61210E512;
	Wed,  2 Aug 2023 07:37:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out28-49.mail.aliyun.com (out28-49.mail.aliyun.com
 [115.124.28.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6B6F10E512;
 Wed,  2 Aug 2023 07:37:25 +0000 (UTC)
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.6682332|0.5811412; CH=green;
 DM=|SPAM|false|; DS=CONTINUE|ham_alarm|0.05409-0.00146338-0.944447;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047206; MF=sunran001@208suo.com; NM=1;
 PH=DS; RN=5; RT=5; SR=0; TI=SMTPD_---.U6cMZwp_1690961835; 
Received: from localhost.localdomain(mailfrom:sunran001@208suo.com
 fp:SMTPD_---.U6cMZwp_1690961835) by smtp.aliyun-inc.com;
 Wed, 02 Aug 2023 15:37:17 +0800
From: Ran Sun <sunran001@208suo.com>
To: alexander.deucher@amd.com
Subject: [PATCH] drm/amdgpu: Clean up errors in uvd_v3_1.c
Date: Wed,  2 Aug 2023 07:37:15 +0000
Message-Id: <20230802073715.13598-1-sunran001@208suo.com>
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
 drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c b/drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c
index 0fef925b6602..5534c769b655 100644
--- a/drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c
+++ b/drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c
@@ -815,8 +815,7 @@ static const struct amd_ip_funcs uvd_v3_1_ip_funcs = {
 	.set_powergating_state = uvd_v3_1_set_powergating_state,
 };
 
-const struct amdgpu_ip_block_version uvd_v3_1_ip_block =
-{
+const struct amdgpu_ip_block_version uvd_v3_1_ip_block = {
 	.type = AMD_IP_BLOCK_TYPE_UVD,
 	.major = 3,
 	.minor = 1,
-- 
2.17.1

