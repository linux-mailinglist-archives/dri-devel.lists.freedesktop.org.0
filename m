Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC29C76C346
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 05:03:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4BA310E48B;
	Wed,  2 Aug 2023 03:03:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out28-50.mail.aliyun.com (out28-50.mail.aliyun.com
 [115.124.28.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAF6610E48B;
 Wed,  2 Aug 2023 03:03:23 +0000 (UTC)
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.5542499|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.208758-0.000138219-0.791104;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047193; MF=sunran001@208suo.com; NM=1;
 PH=DS; RN=5; RT=5; SR=0; TI=SMTPD_---.U6OiUn6_1690945394; 
Received: from localhost.localdomain(mailfrom:sunran001@208suo.com
 fp:SMTPD_---.U6OiUn6_1690945394) by smtp.aliyun-inc.com;
 Wed, 02 Aug 2023 11:03:16 +0800
From: Ran Sun <sunran001@208suo.com>
To: alexander.deucher@amd.com
Subject: [PATCH] drm/amd/display: Clean up errors in dcn316_smu.c
Date: Wed,  2 Aug 2023 03:03:11 +0000
Message-Id: <20230802030311.10746-1-sunran001@208suo.com>
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
 .../amd/display/dc/clk_mgr/dcn316/dcn316_smu.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn316/dcn316_smu.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn316/dcn316_smu.c
index 457a9254ae1c..3ed19197a755 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn316/dcn316_smu.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn316/dcn316_smu.c
@@ -34,23 +34,21 @@
 #define MAX_INSTANCE                                        7
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
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } } } };
+					{ { 0, 0, 0, 0, 0, 0 } },
+					{ { 0, 0, 0, 0, 0, 0 } },
+					{ { 0, 0, 0, 0, 0, 0 } },
+					{ { 0, 0, 0, 0, 0, 0 } },
+					{ { 0, 0, 0, 0, 0, 0 } },
+					{ { 0, 0, 0, 0, 0, 0 } } } };
 
 #define REG(reg_name) \
 	(MP0_BASE.instance[0].segment[reg ## reg_name ## _BASE_IDX] + reg ## reg_name)
-- 
2.17.1

