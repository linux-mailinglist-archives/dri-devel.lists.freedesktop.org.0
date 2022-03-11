Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CFA14D56E5
	for <lists+dri-devel@lfdr.de>; Fri, 11 Mar 2022 01:42:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6219810E07F;
	Fri, 11 Mar 2022 00:42:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out30-42.freemail.mail.aliyun.com
 (out30-42.freemail.mail.aliyun.com [115.124.30.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A341810E07F;
 Fri, 11 Mar 2022 00:42:44 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R561e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04426; MF=yang.lee@linux.alibaba.com;
 NM=1; PH=DS; RN=10; SR=0; TI=SMTPD_---0V6qUi.A_1646959359; 
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com
 fp:SMTPD_---0V6qUi.A_1646959359) by smtp.aliyun-inc.com(127.0.0.1);
 Fri, 11 Mar 2022 08:42:40 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: christian.koenig@amd.com
Subject: [PATCH -next] drm/amd/pm: clean up some inconsistent indenting
Date: Fri, 11 Mar 2022 08:42:38 +0800
Message-Id: <20220311004238.112196-1-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: airlied@linux.ie, Xinhui.Pan@amd.com, Abaci Robot <abaci@linux.alibaba.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Yang Li <yang.lee@linux.alibaba.com>, amd-gfx@lists.freedesktop.org,
 alexander.deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Eliminate the follow smatch warning:
drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu_cmn.c:174
__smu_cmn_reg_print_error() warn: inconsistent indenting

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c b/drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c
index ae64d1980f10..5ed11624f144 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c
@@ -164,17 +164,17 @@ static void __smu_cmn_reg_print_error(struct smu_context *smu,
 
 	switch (reg_c2pmsg_90) {
 	case SMU_RESP_NONE: {
-	if (adev->ip_versions[MP1_HWIP][0] == IP_VERSION(13, 0, 5)) {
-		msg_idx = RREG32_SOC15(MP1, 0, mmMP1_C2PMSG_2);
-		prm     = RREG32_SOC15(MP1, 0, mmMP1_C2PMSG_34);
-	} else {
-		msg_idx = RREG32_SOC15(MP1, 0, mmMP1_SMN_C2PMSG_66);
-		prm     = RREG32_SOC15(MP1, 0, mmMP1_SMN_C2PMSG_82);
-	}
-		dev_err_ratelimited(adev->dev,
-				    "SMU: I'm not done with your previous command: SMN_C2PMSG_66:0x%08X SMN_C2PMSG_82:0x%08X",
-				    msg_idx, prm);
-	}
+		if (adev->ip_versions[MP1_HWIP][0] == IP_VERSION(13, 0, 5)) {
+			msg_idx = RREG32_SOC15(MP1, 0, mmMP1_C2PMSG_2);
+			prm     = RREG32_SOC15(MP1, 0, mmMP1_C2PMSG_34);
+		} else {
+			msg_idx = RREG32_SOC15(MP1, 0, mmMP1_SMN_C2PMSG_66);
+			prm     = RREG32_SOC15(MP1, 0, mmMP1_SMN_C2PMSG_82);
+		}
+			dev_err_ratelimited(adev->dev,
+				"SMU: I'm not done with your previous command: SMN_C2PMSG_66:0x%08X SMN_C2PMSG_82:0x%08X",
+				msg_idx, prm);
+		}
 		break;
 	case SMU_RESP_OK:
 		/* The SMU executed the command. It completed with a
-- 
2.20.1.7.g153144c

