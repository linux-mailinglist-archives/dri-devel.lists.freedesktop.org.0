Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89AD276C61B
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 09:06:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A75D110E4C7;
	Wed,  2 Aug 2023 07:06:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out28-52.mail.aliyun.com (out28-52.mail.aliyun.com
 [115.124.28.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D27410E4C5;
 Wed,  2 Aug 2023 07:06:43 +0000 (UTC)
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.4053487|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_alarm|0.00345508-0.000378098-0.996167; FP=0|0|0|0|0|-1|-1|-1;
 HT=ay29a033018047207; MF=sunran001@208suo.com; NM=1; PH=DS; RN=5; RT=5; SR=0;
 TI=SMTPD_---.U6aqPgd_1690959995; 
Received: from localhost.localdomain(mailfrom:sunran001@208suo.com
 fp:SMTPD_---.U6aqPgd_1690959995) by smtp.aliyun-inc.com;
 Wed, 02 Aug 2023 15:06:36 +0800
From: Ran Sun <sunran001@208suo.com>
To: alexander.deucher@amd.com
Subject: [PATCH] drm/amdgpu: Clean up errors in mxgpu_nv.c
Date: Wed,  2 Aug 2023 07:06:32 +0000
Message-Id: <20230802070632.12626-1-sunran001@208suo.com>
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

ERROR: else should follow close brace '}'
ERROR: that open brace { should be on the previous line

Signed-off-by: Ran Sun <sunran001@208suo.com>
---
 drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c b/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
index cae1aaa4ddb6..6a68ee946f1c 100644
--- a/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
+++ b/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
@@ -183,12 +183,10 @@ static int xgpu_nv_send_access_requests(struct amdgpu_device *adev,
 			if (req != IDH_REQ_GPU_INIT_DATA) {
 				pr_err("Doesn't get msg:%d from pf, error=%d\n", event, r);
 				return r;
-			}
-			else /* host doesn't support REQ_GPU_INIT_DATA handshake */
+			} else /* host doesn't support REQ_GPU_INIT_DATA handshake */
 				adev->virt.req_init_data_ver = 0;
 		} else {
-			if (req == IDH_REQ_GPU_INIT_DATA)
-			{
+			if (req == IDH_REQ_GPU_INIT_DATA) {
 				adev->virt.req_init_data_ver =
 					RREG32_NO_KIQ(mmMAILBOX_MSGBUF_RCV_DW1);
 
-- 
2.17.1

