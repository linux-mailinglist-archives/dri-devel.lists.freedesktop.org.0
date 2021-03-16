Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D7033CF4D
	for <lists+dri-devel@lfdr.de>; Tue, 16 Mar 2021 09:09:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EA1B6E22B;
	Tue, 16 Mar 2021 08:09:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4436.biz.mail.alibaba.com (out4436.biz.mail.alibaba.com
 [47.88.44.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C6956E22B;
 Tue, 16 Mar 2021 08:09:08 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R201e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04395;
 MF=jiapeng.chong@linux.alibaba.com; NM=1; PH=DS; RN=10; SR=0;
 TI=SMTPD_---0US7bm7Q_1615882130; 
Received: from
 j63c13417.sqa.eu95.tbsite.net(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0US7bm7Q_1615882130) by smtp.aliyun-inc.com(127.0.0.1);
 Tue, 16 Mar 2021 16:08:56 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: harry.wentland@amd.com
Subject: [PATCH] drm/amd/display: Remove unnecessary conversion to bool
Date: Tue, 16 Mar 2021 16:08:49 +0800
Message-Id: <1615882129-14822-1-git-send-email-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
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
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, sunpeng.li@amd.com,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com,
 christian.koenig@amd.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the following coccicheck warnings:

./drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c:721:65-70: WARNING:
conversion to bool not needed here.

./drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c:1139:67-72: WARNING:
conversion to bool not needed here.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c
index 6e864b1..434d3c4 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c
@@ -718,7 +718,7 @@ bool dpp3_program_blnd_lut(
 		next_mode = LUT_RAM_B;
 
 	dpp3_power_on_blnd_lut(dpp_base, true);
-	dpp3_configure_blnd_lut(dpp_base, next_mode == LUT_RAM_A ? true:false);
+	dpp3_configure_blnd_lut(dpp_base, next_mode == LUT_RAM_A);
 
 	if (next_mode == LUT_RAM_A)
 		dpp3_program_blnd_luta_settings(dpp_base, params);
@@ -1136,7 +1136,7 @@ bool dpp3_program_shaper(
 	else
 		next_mode = LUT_RAM_A;
 
-	dpp3_configure_shaper_lut(dpp_base, next_mode == LUT_RAM_A ? true:false);
+	dpp3_configure_shaper_lut(dpp_base, next_mode == LUT_RAM_A);
 
 	if (next_mode == LUT_RAM_A)
 		dpp3_program_shaper_luta_settings(dpp_base, params);
-- 
1.8.3.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
