Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63FC3580D93
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jul 2022 09:27:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E60A11BC0D;
	Tue, 26 Jul 2022 07:27:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out30-44.freemail.mail.aliyun.com
 (out30-44.freemail.mail.aliyun.com [115.124.30.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74E3211BBE3;
 Tue, 26 Jul 2022 07:26:58 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R631e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046051;
 MF=jiapeng.chong@linux.alibaba.com; NM=1; PH=DS; RN=10; SR=0;
 TI=SMTPD_---0VKUN8hD_1658820412; 
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0VKUN8hD_1658820412) by smtp.aliyun-inc.com;
 Tue, 26 Jul 2022 15:26:54 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: alexander.deucher@amd.com
Subject: [PATCH 08/20] drm/amd/display: Clean up some inconsistent indenting
Date: Tue, 26 Jul 2022 15:25:43 +0800
Message-Id: <20220726072555.91323-8-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
In-Reply-To: <20220726072555.91323-1-jiapeng.chong@linux.alibaba.com>
References: <20220726072555.91323-1-jiapeng.chong@linux.alibaba.com>
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
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, airlied@linux.ie,
 Xinhui.Pan@amd.com, Abaci Robot <abaci@linux.alibaba.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

No functional modification involved.

smatch warning:

drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_dpp_cm.c:67 dpp30_get_gamcor_current() warn: inconsistent indenting.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 .../drm/amd/display/dc/dcn30/dcn30_dpp_cm.c   | 25 ++++++++-----------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp_cm.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp_cm.c
index 87dbeca18984..e43f77c11c00 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp_cm.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp_cm.c
@@ -61,23 +61,20 @@ static enum dc_lut_mode dpp30_get_gamcor_current(struct dpp *dpp_base)
 	uint32_t lut_mode;
 	struct dcn3_dpp *dpp = TO_DCN30_DPP(dpp_base);
 
-	REG_GET(CM_GAMCOR_CONTROL,
-			CM_GAMCOR_MODE_CURRENT, &state_mode);
+	REG_GET(CM_GAMCOR_CONTROL, CM_GAMCOR_MODE_CURRENT, &state_mode);
 
-		if (state_mode == 0)
-			mode = LUT_BYPASS;
+	if (state_mode == 0)
+		mode = LUT_BYPASS;
 
-		if (state_mode == 2) {//Programmable RAM LUT
-			REG_GET(CM_GAMCOR_CONTROL,
-					CM_GAMCOR_SELECT_CURRENT, &lut_mode);
-
-			if (lut_mode == 0)
-				mode = LUT_RAM_A;
-			else
-				mode = LUT_RAM_B;
-		}
+	if (state_mode == 2) {//Programmable RAM LUT
+		REG_GET(CM_GAMCOR_CONTROL, CM_GAMCOR_SELECT_CURRENT, &lut_mode);
+		if (lut_mode == 0)
+			mode = LUT_RAM_A;
+		else
+			mode = LUT_RAM_B;
+	}
 
-		return mode;
+	return mode;
 }
 
 static void dpp3_program_gammcor_lut(
-- 
2.20.1.7.g153144c

