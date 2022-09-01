Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB0C5A9223
	for <lists+dri-devel@lfdr.de>; Thu,  1 Sep 2022 10:35:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB2A410E652;
	Thu,  1 Sep 2022 08:34:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out30-45.freemail.mail.aliyun.com
 (out30-45.freemail.mail.aliyun.com [115.124.30.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A253E10E652;
 Thu,  1 Sep 2022 08:34:45 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R541e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045168;
 MF=yang.lee@linux.alibaba.com; NM=1; PH=DS; RN=13; SR=0;
 TI=SMTPD_---0VNztQRr_1662021280; 
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com
 fp:SMTPD_---0VNztQRr_1662021280) by smtp.aliyun-inc.com;
 Thu, 01 Sep 2022 16:34:41 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: alexander.deucher@amd.com
Subject: [PATCH -next] drm/amd/display: remove possible condition with no
 effect (if == else)
Date: Thu,  1 Sep 2022 16:34:38 +0800
Message-Id: <20220901083438.105561-1-yang.lee@linux.alibaba.com>
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
Cc: sunpeng.li@amd.com, Abaci Robot <abaci@linux.alibaba.com>,
 Xinhui.Pan@amd.com, Rodrigo.Siqueira@amd.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, airlied@linux.ie,
 Yang Li <yang.lee@linux.alibaba.com>, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Conditional statements have no effect to next process.So remove it.

Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=2028
Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 .../drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.c   | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.c b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.c
index e4fd540dec0f..8f1c0e12dd86 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_util_32.c
@@ -4663,10 +4663,6 @@ void dml32_CalculateMinAndMaxPrefetchMode(
 	} else if (AllowForPStateChangeOrStutterInVBlankFinal == dm_prefetch_support_uclk_fclk_and_stutter) {
 		*MinPrefetchMode = 0;
 		*MaxPrefetchMode = 0;
-	} else if (AllowForPStateChangeOrStutterInVBlankFinal ==
-			dm_prefetch_support_uclk_fclk_and_stutter_if_possible) {
-		*MinPrefetchMode = 0;
-		*MaxPrefetchMode = 3;
 	} else {
 		*MinPrefetchMode = 0;
 		*MaxPrefetchMode = 3;
-- 
2.20.1.7.g153144c

