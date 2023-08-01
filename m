Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A072B76A6BC
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 04:06:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C46E810E043;
	Tue,  1 Aug 2023 02:06:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out28-147.mail.aliyun.com (out28-147.mail.aliyun.com
 [115.124.28.147])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88B5D10E043;
 Tue,  1 Aug 2023 02:06:38 +0000 (UTC)
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.08576864|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.0754816-0.000674398-0.923844;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047201; MF=sunran001@208suo.com; NM=1;
 PH=DS; RN=7; RT=7; SR=0; TI=SMTPD_---.U5Ek3oJ_1690855589; 
Received: from localhost.localdomain(mailfrom:sunran001@208suo.com
 fp:SMTPD_---.U5Ek3oJ_1690855589) by smtp.aliyun-inc.com;
 Tue, 01 Aug 2023 10:06:31 +0800
From: Ran Sun <sunran001@208suo.com>
To: alexander.deucher@amd.com,
	airlied@gmail.com,
	daniel@ffwll.ch
Subject: [PATCH] drm/amd/pm: Clean up errors in smu_v13_0_6_ppt.c
Date: Tue,  1 Aug 2023 02:06:25 +0000
Message-Id: <20230801020625.4281-1-sunran001@208suo.com>
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
ERROR: that open brace { should be on the previous line

Signed-off-by: Ran Sun <sunran001@208suo.com>
---
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c
index 1ac552142763..43afa1ee1b4a 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c
@@ -1248,9 +1248,9 @@ static int smu_v13_0_6_get_power_limit(struct smu_context *smu,
 				       uint32_t *default_power_limit,
 				       uint32_t *max_power_limit)
 {
-        struct smu_table_context *smu_table = &smu->smu_table;
-        struct PPTable_t *pptable =
-                (struct PPTable_t *)smu_table->driver_pptable;
+	struct smu_table_context *smu_table = &smu->smu_table;
+	struct PPTable_t *pptable =
+		(struct PPTable_t *)smu_table->driver_pptable;
 	uint32_t power_limit = 0;
 	int ret;
 
@@ -1366,8 +1366,7 @@ static int smu_v13_0_6_set_irq_state(struct amdgpu_device *adev,
 	return 0;
 }
 
-static const struct amdgpu_irq_src_funcs smu_v13_0_6_irq_funcs =
-{
+static const struct amdgpu_irq_src_funcs smu_v13_0_6_irq_funcs = {
 	.set = smu_v13_0_6_set_irq_state,
 	.process = smu_v13_0_6_irq_process,
 };
-- 
2.17.1

