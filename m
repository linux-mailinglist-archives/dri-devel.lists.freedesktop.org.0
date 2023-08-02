Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F075276C559
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 08:35:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAFEF10E49E;
	Wed,  2 Aug 2023 06:35:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out28-131.mail.aliyun.com (out28-131.mail.aliyun.com
 [115.124.28.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5940010E49E;
 Wed,  2 Aug 2023 06:35:40 +0000 (UTC)
X-Alimail-AntiSpam: AC=SUSPECT; BC=0.6725605|-1; BR=01201311R631b1; CH=blue;
 DM=|SUSPECT|false|; DS=CONTINUE|ham_alarm|0.0743208-0.00313566-0.922544;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047193; MF=sunran001@208suo.com; NM=1;
 PH=DS; RN=5; RT=5; SR=0; TI=SMTPD_---.U6YI7xD_1690958130; 
Received: from localhost.localdomain(mailfrom:sunran001@208suo.com
 fp:SMTPD_---.U6YI7xD_1690958130) by smtp.aliyun-inc.com;
 Wed, 02 Aug 2023 14:35:32 +0800
From: Ran Sun <sunran001@208suo.com>
To: alexander.deucher@amd.com
Subject: [PATCH] drm/amdgpu: Clean up errors in cik_ih.c
Date: Wed,  2 Aug 2023 06:35:29 +0000
Message-Id: <20230802063529.11608-1-sunran001@208suo.com>
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
 drivers/gpu/drm/amd/amdgpu/cik_ih.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/cik_ih.c b/drivers/gpu/drm/amd/amdgpu/cik_ih.c
index df385ffc9768..6f7c031dd197 100644
--- a/drivers/gpu/drm/amd/amdgpu/cik_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/cik_ih.c
@@ -442,8 +442,7 @@ static void cik_ih_set_interrupt_funcs(struct amdgpu_device *adev)
 	adev->irq.ih_funcs = &cik_ih_funcs;
 }
 
-const struct amdgpu_ip_block_version cik_ih_ip_block =
-{
+const struct amdgpu_ip_block_version cik_ih_ip_block = {
 	.type = AMD_IP_BLOCK_TYPE_IH,
 	.major = 2,
 	.minor = 0,
-- 
2.17.1

