Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3020676C530
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 08:16:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 249E510E496;
	Wed,  2 Aug 2023 06:16:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out28-129.mail.aliyun.com (out28-129.mail.aliyun.com
 [115.124.28.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45DE410E496;
 Wed,  2 Aug 2023 06:16:48 +0000 (UTC)
X-Alimail-AntiSpam: AC=SUSPECT; BC=0.6541337|-1; BR=01201311R791b1; CH=blue;
 DM=|SUSPECT|false|; DS=CONTINUE|ham_alarm|0.028097-0.000655634-0.971247;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047203; MF=sunran001@208suo.com; NM=1;
 PH=DS; RN=5; RT=5; SR=0; TI=SMTPD_---.U6WzUYo_1690956999; 
Received: from localhost.localdomain(mailfrom:sunran001@208suo.com
 fp:SMTPD_---.U6WzUYo_1690956999) by smtp.aliyun-inc.com;
 Wed, 02 Aug 2023 14:16:41 +0800
From: Ran Sun <sunran001@208suo.com>
To: alexander.deucher@amd.com
Subject: [PATCH] drm/amd/display: Clean up errors in dcn10_dpp_dscl.c
Date: Wed,  2 Aug 2023 06:16:35 +0000
Message-Id: <20230802061635.11243-1-sunran001@208suo.com>
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

Signed-off-by: Ran Sun <sunran001@208suo.com>
---
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c
index 7e140c35a0ce..5ca9ab8a76e8 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c
@@ -197,8 +197,7 @@ static void dpp1_dscl_set_lb(
 			DITHER_EN, 0, /* Dithering enable: Disabled */
 			INTERLEAVE_EN, lb_params->interleave_en, /* Interleave source enable */
 			LB_DATA_FORMAT__ALPHA_EN, lb_params->alpha_en); /* Alpha enable */
-	}
-	else {
+	} else {
 		/* DSCL caps: pixel data processed in float format */
 		REG_SET_2(LB_DATA_FORMAT, 0,
 			INTERLEAVE_EN, lb_params->interleave_en, /* Interleave source enable */
-- 
2.17.1

