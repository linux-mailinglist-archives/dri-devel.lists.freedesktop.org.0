Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E7412A21B
	for <lists+dri-devel@lfdr.de>; Tue, 24 Dec 2019 15:30:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53F3689FC0;
	Tue, 24 Dec 2019 14:29:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A21696E0DB;
 Tue, 24 Dec 2019 03:20:33 +0000 (UTC)
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 3E3E65504D56C2D0C355;
 Tue, 24 Dec 2019 11:20:31 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.439.0; Tue, 24 Dec 2019
 11:20:25 +0800
From: zhengbin <zhengbin13@huawei.com>
To: <harry.wentland@amd.com>, <sunpeng.li@amd.com>,
 <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <David1.Zhou@amd.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 8/8] drm/amd/display: use true,
 false for bool variable in display_rq_dlg_calc_21.c
Date: Tue, 24 Dec 2019 11:27:43 +0800
Message-ID: <1577158063-76188-9-git-send-email-zhengbin13@huawei.com>
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

drivers/gpu/drm/amd/display/dc/dml/dcn21/display_rq_dlg_calc_21.c:85:6-13: WARNING: Assignment of 0/1 to bool variable
drivers/gpu/drm/amd/display/dc/dml/dcn21/display_rq_dlg_calc_21.c:88:2-9: WARNING: Assignment of 0/1 to bool variable
drivers/gpu/drm/amd/display/dc/dml/dcn21/display_rq_dlg_calc_21.c:225:6-14: WARNING: Assignment of 0/1 to bool variable
drivers/gpu/drm/amd/display/dc/dml/dcn21/display_rq_dlg_calc_21.c:226:6-14: WARNING: Assignment of 0/1 to bool variable
drivers/gpu/drm/amd/display/dc/dml/dcn21/display_rq_dlg_calc_21.c:251:3-11: WARNING: Assignment of 0/1 to bool variable
drivers/gpu/drm/amd/display/dc/dml/dcn21/display_rq_dlg_calc_21.c:252:3-11: WARNING: Assignment of 0/1 to bool variable
drivers/gpu/drm/amd/display/dc/dml/dcn21/display_rq_dlg_calc_21.c:256:3-11: WARNING: Assignment of 0/1 to bool variable
drivers/gpu/drm/amd/display/dc/dml/dcn21/display_rq_dlg_calc_21.c:257:3-11: WARNING: Assignment of 0/1 to bool variable
drivers/gpu/drm/amd/display/dc/dml/dcn21/display_rq_dlg_calc_21.c:267:3-11: WARNING: Assignment of 0/1 to bool variable
drivers/gpu/drm/amd/display/dc/dml/dcn21/display_rq_dlg_calc_21.c:269:3-11: WARNING: Assignment of 0/1 to bool variable
drivers/gpu/drm/amd/display/dc/dml/dcn21/display_rq_dlg_calc_21.c:682:6-14: WARNING: Assignment of 0/1 to bool variable
drivers/gpu/drm/amd/display/dc/dml/dcn21/display_rq_dlg_calc_21.c:1013:1-9: WARNING: Assignment of 0/1 to bool variable

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: zhengbin <zhengbin13@huawei.com>
---
 .../display/dc/dml/dcn21/display_rq_dlg_calc_21.c  | 24 +++++++++++-----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn21/display_rq_dlg_calc_21.c b/drivers/gpu/drm/amd/display/dc/dml/dcn21/display_rq_dlg_calc_21.c
index e60af38..a38baa7 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn21/display_rq_dlg_calc_21.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn21/display_rq_dlg_calc_21.c
@@ -82,10 +82,10 @@ static unsigned int get_bytes_per_element(enum source_format_class source_format

 static bool is_dual_plane(enum source_format_class source_format)
 {
-	bool ret_val = 0;
+	bool ret_val = false;

 	if ((source_format == dm_420_8) || (source_format == dm_420_10))
-		ret_val = 1;
+		ret_val = true;

 	return ret_val;
 }
@@ -222,8 +222,8 @@ static void handle_det_buf_split(
 	unsigned int swath_bytes_c = 0;
 	unsigned int full_swath_bytes_packed_l = 0;
 	unsigned int full_swath_bytes_packed_c = 0;
-	bool req128_l = 0;
-	bool req128_c = 0;
+	bool req128_l = false;
+	bool req128_c = false;
 	bool surf_linear = (pipe_src_param.sw_mode == dm_sw_linear);
 	bool surf_vert = (pipe_src_param.source_scan == dm_vert);
 	unsigned int log2_swath_height_l = 0;
@@ -248,13 +248,13 @@ static void handle_det_buf_split(
 		total_swath_bytes = 2 * full_swath_bytes_packed_l + 2 * full_swath_bytes_packed_c;

 		if (total_swath_bytes <= detile_buf_size_in_bytes) { //full 256b request
-			req128_l = 0;
-			req128_c = 0;
+			req128_l = false;
+			req128_c = false;
 			swath_bytes_l = full_swath_bytes_packed_l;
 			swath_bytes_c = full_swath_bytes_packed_c;
 		} else { //128b request (for luma only for yuv420 8bpc)
-			req128_l = 1;
-			req128_c = 0;
+			req128_l = true;
+			req128_c = false;
 			swath_bytes_l = full_swath_bytes_packed_l / 2;
 			swath_bytes_c = full_swath_bytes_packed_c;
 		}
@@ -264,9 +264,9 @@ static void handle_det_buf_split(
 		total_swath_bytes = 2 * full_swath_bytes_packed_l;

 		if (total_swath_bytes <= detile_buf_size_in_bytes)
-			req128_l = 0;
+			req128_l = false;
 		else
-			req128_l = 1;
+			req128_l = true;

 		swath_bytes_l = total_swath_bytes;
 		swath_bytes_c = 0;
@@ -679,7 +679,7 @@ static void get_surf_rq_param(
 		const display_pipe_params_st pipe_param,
 		bool is_chroma)
 {
-	bool mode_422 = 0;
+	bool mode_422 = false;
 	unsigned int vp_width = 0;
 	unsigned int vp_height = 0;
 	unsigned int data_pitch = 0;
@@ -1010,7 +1010,7 @@ static void dml_rq_dlg_get_dlg_params(
 	// Source
 	//             dcc_en              = src.dcc;
 	dual_plane = is_dual_plane((enum source_format_class) (src->source_format));
-	mode_422 = 0; // FIXME
+	mode_422 = false; // FIXME
 	access_dir = (src->source_scan == dm_vert); // vp access direction: horizontal or vertical accessed
 						    //      bytes_per_element_l = get_bytes_per_element(source_format_class(src.source_format), 0);
 						    //      bytes_per_element_c = get_bytes_per_element(source_format_class(src.source_format), 1);
--
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
