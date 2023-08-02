Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7024E76C768
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 09:50:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72D79892AE;
	Wed,  2 Aug 2023 07:50:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out28-77.mail.aliyun.com (out28-77.mail.aliyun.com
 [115.124.28.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62687892AE;
 Wed,  2 Aug 2023 07:50:25 +0000 (UTC)
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.6725605|0.7344689; CH=green;
 DM=|SPAM|false|; DS=CONTINUE|ham_alarm|0.0713018-0.00290472-0.925793;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047201; MF=sunran001@208suo.com; NM=1;
 PH=DS; RN=5; RT=5; SR=0; TI=SMTPD_---.U6dLqGx_1690962615; 
Received: from localhost.localdomain(mailfrom:sunran001@208suo.com
 fp:SMTPD_---.U6dLqGx_1690962615) by smtp.aliyun-inc.com;
 Wed, 02 Aug 2023 15:50:17 +0800
From: Ran Sun <sunran001@208suo.com>
To: alexander.deucher@amd.com
Subject: [PATCH] drm/amdgpu: Clean up errors in tonga_ih.c
Date: Wed,  2 Aug 2023 07:50:14 +0000
Message-Id: <20230802075014.13861-1-sunran001@208suo.com>
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
 drivers/gpu/drm/amd/amdgpu/tonga_ih.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/tonga_ih.c b/drivers/gpu/drm/amd/amdgpu/tonga_ih.c
index b08905d1c00f..917707bba7f3 100644
--- a/drivers/gpu/drm/amd/amdgpu/tonga_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/tonga_ih.c
@@ -493,8 +493,7 @@ static void tonga_ih_set_interrupt_funcs(struct amdgpu_device *adev)
 	adev->irq.ih_funcs = &tonga_ih_funcs;
 }
 
-const struct amdgpu_ip_block_version tonga_ih_ip_block =
-{
+const struct amdgpu_ip_block_version tonga_ih_ip_block = {
 	.type = AMD_IP_BLOCK_TYPE_IH,
 	.major = 3,
 	.minor = 0,
-- 
2.17.1

