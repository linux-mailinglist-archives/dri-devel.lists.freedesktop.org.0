Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 96588580D95
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jul 2022 09:27:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA73611BCC5;
	Tue, 26 Jul 2022 07:27:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out30-42.freemail.mail.aliyun.com
 (out30-42.freemail.mail.aliyun.com [115.124.30.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34E6C11B5B7;
 Tue, 26 Jul 2022 07:27:03 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R651e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046060;
 MF=jiapeng.chong@linux.alibaba.com; NM=1; PH=DS; RN=10; SR=0;
 TI=SMTPD_---0VKUPgin_1658820416; 
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0VKUPgin_1658820416) by smtp.aliyun-inc.com;
 Tue, 26 Jul 2022 15:26:58 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: alexander.deucher@amd.com
Subject: [PATCH 09/20] drm/amd/display: Clean up some inconsistent indenting
Date: Tue, 26 Jul 2022 15:25:44 +0800
Message-Id: <20220726072555.91323-9-jiapeng.chong@linux.alibaba.com>
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

smatch warnings:

drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_dpp.c:724 dpp3_get_blndgam_current() warn: inconsistent indenting.
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_dpp.c:823 dpp3_get_shaper_current() warn: inconsistent indenting.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 .../gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c  | 77 +++++++++----------
 1 file changed, 38 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c
index 787b852eeaf2..77b00f86c216 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c
@@ -716,28 +716,27 @@ static enum dc_lut_mode dpp3_get_blndgam_current(struct dpp *dpp_base)
 
 	struct dcn3_dpp *dpp = TO_DCN30_DPP(dpp_base);
 
-	REG_GET(CM_BLNDGAM_CONTROL,
-			CM_BLNDGAM_MODE_CURRENT, &mode_current);
-	REG_GET(CM_BLNDGAM_CONTROL,
-			CM_BLNDGAM_SELECT_CURRENT, &in_use);
-
-		switch (mode_current) {
-		case 0:
-		case 1:
-			mode = LUT_BYPASS;
-			break;
-
-		case 2:
-			if (in_use == 0)
-				mode = LUT_RAM_A;
-			else
-				mode = LUT_RAM_B;
-			break;
-		default:
-			mode = LUT_BYPASS;
-			break;
-		}
-		return mode;
+	REG_GET(CM_BLNDGAM_CONTROL, CM_BLNDGAM_MODE_CURRENT, &mode_current);
+	REG_GET(CM_BLNDGAM_CONTROL, CM_BLNDGAM_SELECT_CURRENT, &in_use);
+
+	switch (mode_current) {
+	case 0:
+	case 1:
+		mode = LUT_BYPASS;
+		break;
+
+	case 2:
+		if (in_use == 0)
+			mode = LUT_RAM_A;
+		else
+			mode = LUT_RAM_B;
+		break;
+	default:
+		mode = LUT_BYPASS;
+		break;
+	}
+
+	return mode;
 }
 
 static bool dpp3_program_blnd_lut(struct dpp *dpp_base,
@@ -817,24 +816,24 @@ static enum dc_lut_mode dpp3_get_shaper_current(struct dpp *dpp_base)
 	uint32_t state_mode;
 	struct dcn3_dpp *dpp = TO_DCN30_DPP(dpp_base);
 
-	REG_GET(CM_SHAPER_CONTROL,
-			CM_SHAPER_MODE_CURRENT, &state_mode);
+	REG_GET(CM_SHAPER_CONTROL, CM_SHAPER_MODE_CURRENT, &state_mode);
 
-		switch (state_mode) {
-		case 0:
-			mode = LUT_BYPASS;
-			break;
-		case 1:
-			mode = LUT_RAM_A;
-			break;
-		case 2:
-			mode = LUT_RAM_B;
-			break;
-		default:
-			mode = LUT_BYPASS;
-			break;
-		}
-		return mode;
+	switch (state_mode) {
+	case 0:
+		mode = LUT_BYPASS;
+		break;
+	case 1:
+		mode = LUT_RAM_A;
+		break;
+	case 2:
+		mode = LUT_RAM_B;
+		break;
+	default:
+		mode = LUT_BYPASS;
+		break;
+	}
+
+	return mode;
 }
 
 static void dpp3_configure_shaper_lut(
-- 
2.20.1.7.g153144c

