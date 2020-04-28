Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC4D1BBDEB
	for <lists+dri-devel@lfdr.de>; Tue, 28 Apr 2020 14:46:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8C2A6E397;
	Tue, 28 Apr 2020 12:46:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07D27894E0;
 Tue, 28 Apr 2020 06:31:48 +0000 (UTC)
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id EFF1AB7B043C4871D755;
 Tue, 28 Apr 2020 14:31:44 +0800 (CST)
Received: from huawei.com (10.175.124.28) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.487.0; Tue, 28 Apr 2020
 14:31:35 +0800
From: Jason Yan <yanaijie@huawei.com>
To: <harry.wentland@amd.com>, <sunpeng.li@amd.com>,
 <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <David1.Zhou@amd.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <Anthony.Koo@amd.com>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/amd/display: remove duplicate assignment of dcn21_funcs
 members
Date: Tue, 28 Apr 2020 14:31:01 +0800
Message-ID: <20200428063101.25556-1-yanaijie@huawei.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
X-Originating-IP: [10.175.124.28]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 28 Apr 2020 12:46:22 +0000
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
Cc: Jason Yan <yanaijie@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the following coccicheck warning:

drivers/gpu/drm/amd/display/dc/dcn21/dcn21_init.c:31:51-52:
exit_optimized_pwr_state: first occurrence line 86, second occurrence
line 92
drivers/gpu/drm/amd/display/dc/dcn21/dcn21_init.c:31:51-52:
optimize_pwr_state: first occurrence line 85, second occurrence line 91
drivers/gpu/drm/amd/display/dc/dcn21/dcn21_init.c:31:51-52:
set_cursor_attribute: first occurrence line 71, second occurrence line
89
drivers/gpu/drm/amd/display/dc/dcn21/dcn21_init.c:31:51-52:
set_cursor_position: first occurrence line 70, second occurrence line 88
drivers/gpu/drm/amd/display/dc/dcn21/dcn21_init.c:31:51-52:
set_cursor_sdr_white_level: first occurrence line 72, second occurrence
line 90

Signed-off-by: Jason Yan <yanaijie@huawei.com>
---
 drivers/gpu/drm/amd/display/dc/dcn21/dcn21_init.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_init.c b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_init.c
index 8410a6305a9a..fe64bcb49456 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_init.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_init.c
@@ -85,11 +85,6 @@ static const struct hw_sequencer_funcs dcn21_funcs = {
 	.optimize_pwr_state = dcn21_optimize_pwr_state,
 	.exit_optimized_pwr_state = dcn21_exit_optimized_pwr_state,
 	.get_vupdate_offset_from_vsync = dcn10_get_vupdate_offset_from_vsync,
-	.set_cursor_position = dcn10_set_cursor_position,
-	.set_cursor_attribute = dcn10_set_cursor_attribute,
-	.set_cursor_sdr_white_level = dcn10_set_cursor_sdr_white_level,
-	.optimize_pwr_state = dcn21_optimize_pwr_state,
-	.exit_optimized_pwr_state = dcn21_exit_optimized_pwr_state,
 	.power_down = dce110_power_down,
 };
 
-- 
2.21.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
