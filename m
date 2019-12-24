Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E4912A24C
	for <lists+dri-devel@lfdr.de>; Tue, 24 Dec 2019 15:31:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2D1A89B99;
	Tue, 24 Dec 2019 14:30:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7136F6E0DB;
 Tue, 24 Dec 2019 03:20:35 +0000 (UTC)
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 84F6334BE736BA1BE3CF;
 Tue, 24 Dec 2019 11:20:31 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.439.0; Tue, 24 Dec 2019
 11:20:24 +0800
From: zhengbin <zhengbin13@huawei.com>
To: <harry.wentland@amd.com>, <sunpeng.li@amd.com>,
 <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <David1.Zhou@amd.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 5/8] drm/amd/display: use true,
 false for bool variable in dce_calcs.c
Date: Tue, 24 Dec 2019 11:27:40 +0800
Message-ID: <1577158063-76188-6-git-send-email-zhengbin13@huawei.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1577158063-76188-1-git-send-email-zhengbin13@huawei.com>
References: <1577158063-76188-1-git-send-email-zhengbin13@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 24 Dec 2019 14:29:55 +0000
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
Cc: zhengbin13@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes coccicheck warning:

drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c:157:46-64: WARNING: Assignment of 0/1 to bool variable
drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c:159:2-20: WARNING: Assignment of 0/1 to bool variable
drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c:161:46-64: WARNING: Assignment of 0/1 to bool variable
drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c:163:2-20: WARNING: Assignment of 0/1 to bool variable
drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c:289:1-12: WARNING: Assignment of 0/1 to bool variable
drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c:290:1-12: WARNING: Assignment of 0/1 to bool variable
drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c:341:3-14: WARNING: Assignment of 0/1 to bool variable
drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c:343:4-15: WARNING: Assignment of 0/1 to bool variable

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: zhengbin <zhengbin13@huawei.com>
---
 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c b/drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c
index a1d4925..5d081c4 100644
--- a/drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c
+++ b/drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c
@@ -154,14 +154,14 @@ static void calculate_bandwidth(



-	if (data->d0_underlay_mode == bw_def_none) { d0_underlay_enable = 0; }
-	else {
-		d0_underlay_enable = 1;
-	}
-	if (data->d1_underlay_mode == bw_def_none) { d1_underlay_enable = 0; }
-	else {
-		d1_underlay_enable = 1;
-	}
+	if (data->d0_underlay_mode == bw_def_none)
+		d0_underlay_enable = false;
+	else
+		d0_underlay_enable = true;
+	if (data->d1_underlay_mode == bw_def_none)
+		d1_underlay_enable = false;
+	else
+		d1_underlay_enable = true;
 	data->number_of_underlay_surfaces = d0_underlay_enable + d1_underlay_enable;
 	switch (data->underlay_surface_type) {
 	case bw_def_420:
@@ -286,8 +286,8 @@ static void calculate_bandwidth(
 	data->cursor_width_pixels[2] = bw_int_to_fixed(0);
 	data->cursor_width_pixels[3] = bw_int_to_fixed(0);
 	/* graphics surface parameters from spreadsheet*/
-	fbc_enabled = 0;
-	lpt_enabled = 0;
+	fbc_enabled = false;
+	lpt_enabled = false;
 	for (i = 4; i <= maximum_number_of_surfaces - 3; i++) {
 		if (i < data->number_of_displays + 4) {
 			if (i == 4 && data->d0_underlay_mode == bw_def_underlay_only) {
@@ -338,9 +338,9 @@ static void calculate_bandwidth(
 			data->access_one_channel_only[i] = 0;
 		}
 		if (data->fbc_en[i] == 1) {
-			fbc_enabled = 1;
+			fbc_enabled = true;
 			if (data->lpt_en[i] == 1) {
-				lpt_enabled = 1;
+				lpt_enabled = true;
 			}
 		}
 		data->cursor_width_pixels[i] = bw_int_to_fixed(vbios->cursor_width);
--
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
