Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1096776A6C0
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 04:08:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B86010E08B;
	Tue,  1 Aug 2023 02:08:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out28-122.mail.aliyun.com (out28-122.mail.aliyun.com
 [115.124.28.122])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1195510E08B;
 Tue,  1 Aug 2023 02:08:49 +0000 (UTC)
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.4466546|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_alarm|0.0186576-0.00180561-0.979537; FP=0|0|0|0|0|-1|-1|-1;
 HT=ay29a033018047213; MF=sunran001@208suo.com; NM=1; PH=DS; RN=7; RT=7; SR=0;
 TI=SMTPD_---.U5DrTdc_1690855720; 
Received: from localhost.localdomain(mailfrom:sunran001@208suo.com
 fp:SMTPD_---.U5DrTdc_1690855720) by smtp.aliyun-inc.com;
 Tue, 01 Aug 2023 10:08:42 +0800
From: Ran Sun <sunran001@208suo.com>
To: alexander.deucher@amd.com,
	airlied@gmail.com,
	daniel@ffwll.ch
Subject: [PATCH] drm/amd/pm: Clean up errors in smu_v13_0_5_ppt.c
Date: Tue,  1 Aug 2023 02:08:39 +0000
Message-Id: <20230801020839.4369-1-sunran001@208suo.com>
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

ERROR: space prohibited before that ',' (ctx:WxW)

Signed-off-by: Ran Sun <sunran001@208suo.com>
---
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_5_ppt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_5_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_5_ppt.c
index 42f110602eb1..87a79e6f983b 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_5_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_5_ppt.c
@@ -75,7 +75,7 @@ static struct cmn2asic_msg_mapping smu_v13_0_5_message_map[SMU_MSG_MAX_COUNT] =
 	MSG_MAP(SetDriverDramAddrHigh,            PPSMC_MSG_SetDriverDramAddrHigh,      1),
 	MSG_MAP(SetDriverDramAddrLow,          PPSMC_MSG_SetDriverDramAddrLow,	1),
 	MSG_MAP(TransferTableSmu2Dram,           PPSMC_MSG_TransferTableSmu2Dram,		1),
-	MSG_MAP(TransferTableDram2Smu,          PPSMC_MSG_TransferTableDram2Smu ,	1),
+	MSG_MAP(TransferTableDram2Smu,          PPSMC_MSG_TransferTableDram2Smu,	1),
 	MSG_MAP(GetGfxclkFrequency,          PPSMC_MSG_GetGfxclkFrequency,	1),
 	MSG_MAP(GetEnabledSmuFeatures,           PPSMC_MSG_GetEnabledSmuFeatures,		1),
 	MSG_MAP(SetSoftMaxVcn,          PPSMC_MSG_SetSoftMaxVcn,	1),
-- 
2.17.1

