Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3633176C303
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 04:40:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D72B10E00D;
	Wed,  2 Aug 2023 02:40:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out28-133.mail.aliyun.com (out28-133.mail.aliyun.com
 [115.124.28.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 066CE10E485;
 Wed,  2 Aug 2023 02:40:05 +0000 (UTC)
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.4055942|-1; CH=blue; DM=|OVERLOAD|false|;
 DS=CONTINUE|ham_alarm|0.00105794-0.000121474-0.998821; FP=0|0|0|0|0|-1|-1|-1;
 HT=ay29a033018047199; MF=sunran001@208suo.com; NM=1; PH=DS; RN=5; RT=5; SR=0;
 TI=SMTPD_---.U6N4oZg_1690943996; 
Received: from localhost.localdomain(mailfrom:sunran001@208suo.com
 fp:SMTPD_---.U6N4oZg_1690943996) by smtp.aliyun-inc.com;
 Wed, 02 Aug 2023 10:39:58 +0800
From: Ran Sun <sunran001@208suo.com>
To: alexander.deucher@amd.com
Subject: [PATCH] drm/amd/display: Clean up errors in color_gamma.c
Date: Wed,  2 Aug 2023 02:39:55 +0000
Message-Id: <20230802023955.10014-1-sunran001@208suo.com>
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

ERROR: trailing whitespace
ERROR: else should follow close brace '}'

Signed-off-by: Ran Sun <sunran001@208suo.com>
---
 drivers/gpu/drm/amd/display/modules/color/color_gamma.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/modules/color/color_gamma.c b/drivers/gpu/drm/amd/display/modules/color/color_gamma.c
index 67a062af3ab0..ff8e5708735d 100644
--- a/drivers/gpu/drm/amd/display/modules/color/color_gamma.c
+++ b/drivers/gpu/drm/amd/display/modules/color/color_gamma.c
@@ -359,7 +359,7 @@ static struct fixed31_32 translate_from_linear_space(
 		scratch_1 = dc_fixpt_add(one, args->a3);
 		/* In the first region (first 16 points) and in the
 		 * region delimited by START/END we calculate with
-		 * full precision to avoid error accumulation. 
+		 * full precision to avoid error accumulation.
 		 */
 		if ((cal_buffer->buffer_index >= PRECISE_LUT_REGION_START &&
 			cal_buffer->buffer_index <= PRECISE_LUT_REGION_END) ||
@@ -379,8 +379,7 @@ static struct fixed31_32 translate_from_linear_space(
 		scratch_1 = dc_fixpt_sub(scratch_1, args->a2);
 
 		return scratch_1;
-	}
-	else
+	} else
 		return dc_fixpt_mul(args->arg, args->a1);
 }
 
-- 
2.17.1

