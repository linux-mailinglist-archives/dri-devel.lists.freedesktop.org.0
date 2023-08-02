Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C9EF76C337
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 04:58:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 833BA10E1ED;
	Wed,  2 Aug 2023 02:58:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out28-171.mail.aliyun.com (out28-171.mail.aliyun.com
 [115.124.28.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3719B10E1ED;
 Wed,  2 Aug 2023 02:58:25 +0000 (UTC)
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.4185161|-1;
 BR=01201311R171S39rulernew2018_352553_221103; CH=green; DM=|CONTINUE|false|;
 DS=SPAM|spam_ad|0.839017-0.000101946-0.160881; FP=0|0|0|0|0|-1|-1|-1;
 HT=ay29a033018047190; MF=sunran001@208suo.com; NM=1; PH=DS; RN=5; RT=5; SR=0;
 TI=SMTPD_---.U6NpUjh_1690945096; 
Received: from localhost.localdomain(mailfrom:sunran001@208suo.com
 fp:SMTPD_---.U6NpUjh_1690945096) by smtp.aliyun-inc.com;
 Wed, 02 Aug 2023 10:58:18 +0800
From: Ran Sun <sunran001@208suo.com>
To: alexander.deucher@amd.com
Subject: [PATCH] drm/amd/display: Clean up errors in dcn315_smu.c
Date: Wed,  2 Aug 2023 02:58:14 +0000
Message-Id: <20230802025814.10569-1-sunran001@208suo.com>
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

ERROR: open brace '{' following struct go on the same line
ERROR: code indent should use tabs where possible

Signed-off-by: Ran Sun <sunran001@208suo.com>
---
 .../display/dc/clk_mgr/dcn315/dcn315_smu.c    | 26 +++++++++----------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn315/dcn315_smu.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn315/dcn315_smu.c
index 925d6e13620e..3e0da873cf4c 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn315/dcn315_smu.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn315/dcn315_smu.c
@@ -33,28 +33,26 @@
 #define MAX_INSTANCE                                        6
 #define MAX_SEGMENT                                         6
 
-struct IP_BASE_INSTANCE
-{
+struct IP_BASE_INSTANCE {
     unsigned int segment[MAX_SEGMENT];
 };
 
-struct IP_BASE
-{
+struct IP_BASE {
     struct IP_BASE_INSTANCE instance[MAX_INSTANCE];
 };
 
 static const struct IP_BASE MP0_BASE = { { { { 0x00016000, 0x00DC0000, 0x00E00000, 0x00E40000, 0x0243FC00, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } } } };
+					{ { 0, 0, 0, 0, 0, 0 } },
+					{ { 0, 0, 0, 0, 0, 0 } },
+					{ { 0, 0, 0, 0, 0, 0 } },
+					{ { 0, 0, 0, 0, 0, 0 } },
+					{ { 0, 0, 0, 0, 0, 0 } } } };
 static const struct IP_BASE NBIO_BASE = { { { { 0x00000000, 0x00000014, 0x00000D20, 0x00010400, 0x0241B000, 0x04040000 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } } } };
+					{ { 0, 0, 0, 0, 0, 0 } },
+					{ { 0, 0, 0, 0, 0, 0 } },
+					{ { 0, 0, 0, 0, 0, 0 } },
+					{ { 0, 0, 0, 0, 0, 0 } },
+					{ { 0, 0, 0, 0, 0, 0 } } } };
 
 #define regBIF_BX_PF2_RSMU_INDEX                                                                        0x0000
 #define regBIF_BX_PF2_RSMU_INDEX_BASE_IDX                                                               1
-- 
2.17.1

