Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E4C76ACCF
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 11:22:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 181A210E371;
	Tue,  1 Aug 2023 09:22:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out28-115.mail.aliyun.com (out28-115.mail.aliyun.com
 [115.124.28.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FBDD10E36F;
 Tue,  1 Aug 2023 09:22:24 +0000 (UTC)
X-Alimail-AntiSpam: AC=SUSPECT; BC=0.6030169|-1; BR=01201311R211b1; CH=blue;
 DM=|SUSPECT|false|; DS=CONTINUE|ham_alarm|0.122626-0.119945-0.757429;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047198; MF=sunran001@208suo.com; NM=1;
 PH=DS; RN=7; RT=7; SR=0; TI=SMTPD_---.U5qaegt_1690881734; 
Received: from localhost.localdomain(mailfrom:sunran001@208suo.com
 fp:SMTPD_---.U5qaegt_1690881734) by smtp.aliyun-inc.com;
 Tue, 01 Aug 2023 17:22:17 +0800
From: Ran Sun <sunran001@208suo.com>
To: alexander.deucher@amd.com,
	airlied@gmail.com,
	daniel@ffwll.ch
Subject: [PATCH] drm/amdgpu/powerplay: Clean up errors in smu_helper.h
Date: Tue,  1 Aug 2023 09:22:13 +0000
Message-Id: <20230801092213.7360-1-sunran001@208suo.com>
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

ERROR: space prohibited before that close parenthesis ')'

Signed-off-by: Ran Sun <sunran001@208suo.com>
---
 drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu_helper.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu_helper.h b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu_helper.h
index 2a75da1e9f03..83b3c9315143 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu_helper.h
+++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu_helper.h
@@ -194,7 +194,7 @@ int smu_set_watermarks_for_clocks_ranges(void *wt_table,
 #define PHM_WAIT_INDIRECT_FIELD_UNEQUAL(hwmgr, port, reg, field, fieldval)                          \
 		PHM_WAIT_INDIRECT_REGISTER_UNEQUAL(hwmgr, port, reg, \
 				(fieldval) << PHM_FIELD_SHIFT(reg, field), \
-					PHM_FIELD_MASK(reg, field) )
+					PHM_FIELD_MASK(reg, field))
 
 
 #define PHM_WAIT_VFPF_INDIRECT_REGISTER_UNEQUAL_GIVEN_INDEX(hwmgr,	\
-- 
2.17.1

