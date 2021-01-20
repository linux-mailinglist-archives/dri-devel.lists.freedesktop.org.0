Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD8A2FE522
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jan 2021 09:36:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 013486E52F;
	Thu, 21 Jan 2021 08:36:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out30-131.freemail.mail.aliyun.com
 (out30-131.freemail.mail.aliyun.com [115.124.30.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C79BD6E12E;
 Wed, 20 Jan 2021 07:16:56 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R101e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04420;
 MF=abaci-bugfix@linux.alibaba.com; NM=1; PH=DS; RN=16; SR=0;
 TI=SMTPD_---0UMJjpYD_1611127009; 
Received: from
 j63c13417.sqa.eu95.tbsite.net(mailfrom:abaci-bugfix@linux.alibaba.com
 fp:SMTPD_---0UMJjpYD_1611127009) by smtp.aliyun-inc.com(127.0.0.1);
 Wed, 20 Jan 2021 15:16:53 +0800
From: Jiapeng Zhong <abaci-bugfix@linux.alibaba.com>
To: harry.wentland@amd.com
Subject: [PATCH] drm/amdgpu: Assign boolean values to a bool variable
Date: Wed, 20 Jan 2021 15:16:47 +0800
Message-Id: <1611127007-39308-1-git-send-email-abaci-bugfix@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
X-Mailman-Approved-At: Thu, 21 Jan 2021 08:36:20 +0000
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
Cc: Dmytro.Laktyushkin@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Jiapeng Zhong <abaci-bugfix@linux.alibaba.com>, airlied@linux.ie,
 luben.tuikov@amd.com, Eric.Bernstein@amd.com, dri-devel@lists.freedesktop.org,
 alexander.deucher@amd.com, Bhawanpreet.Lakha@amd.com, christian.koenig@amd.com,
 yebin10@huawei.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the following coccicheck warnings:

./drivers/gpu/drm/amd/display/dc/dml/dcn30/display_rq_dlg_calc_30.c:
1009:6-16: WARNING: Assignment of 0/1 to bool variable.

./drivers/gpu/drm/amd/display/dc/dml/dcn30/display_rq_dlg_calc_30.c:
200:2-10: WARNING: Assignment of 0/1 to bool variable.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Zhong <abaci-bugfix@linux.alibaba.com>
---
 .../display/dc/dml/dcn30/display_rq_dlg_calc_30.c  | 32 +++++++++++-----------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_rq_dlg_calc_30.c b/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_rq_dlg_calc_30.c
index 5b5916b..0f14f20 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_rq_dlg_calc_30.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_rq_dlg_calc_30.c
@@ -165,8 +165,8 @@ static void handle_det_buf_split(struct display_mode_lib *mode_lib,
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
@@ -191,37 +191,37 @@ static void handle_det_buf_split(struct display_mode_lib *mode_lib,
 		total_swath_bytes = 2 * full_swath_bytes_packed_l;
 
 	if (total_swath_bytes <= detile_buf_size_in_bytes) { //full 256b request
-		req128_l = 0;
-		req128_c = 0;
+		req128_l = false;
+		req128_c = false;
 		swath_bytes_l = full_swath_bytes_packed_l;
 		swath_bytes_c = full_swath_bytes_packed_c;
 	} else if (!rq_param->yuv420) {
-		req128_l = 1;
-		req128_c = 0;
+		req128_l = true;
+		req128_c = false;
 		swath_bytes_c = full_swath_bytes_packed_c;
 		swath_bytes_l = full_swath_bytes_packed_l / 2;
 	} else if ((double)full_swath_bytes_packed_l / (double)full_swath_bytes_packed_c < 1.5) {
-		req128_l = 0;
-		req128_c = 1;
+		req128_l = false;
+		req128_c = true;
 		swath_bytes_l = full_swath_bytes_packed_l;
 		swath_bytes_c = full_swath_bytes_packed_c / 2;
 
 		total_swath_bytes = 2 * swath_bytes_l + 2 * swath_bytes_c;
 
 		if (total_swath_bytes > detile_buf_size_in_bytes) {
-			req128_l = 1;
+			req128_l = true;
 			swath_bytes_l = full_swath_bytes_packed_l / 2;
 		}
 	} else {
-		req128_l = 1;
-		req128_c = 0;
+		req128_l = true;
+		req128_c = false;
 		swath_bytes_l = full_swath_bytes_packed_l/2;
 		swath_bytes_c = full_swath_bytes_packed_c;
 
 		total_swath_bytes = 2 * swath_bytes_l + 2 * swath_bytes_c;
 
 		if (total_swath_bytes > detile_buf_size_in_bytes) {
-			req128_c = 1;
+			req128_c = true;
 			swath_bytes_c = full_swath_bytes_packed_c/2;
 		}
 	}
@@ -1006,8 +1006,8 @@ static void dml_rq_dlg_get_dlg_params(struct display_mode_lib *mode_lib,
 
 	double min_dst_y_ttu_vblank = 0;
 	unsigned int dlg_vblank_start = 0;
-	bool dual_plane = 0;
-	bool mode_422 = 0;
+	bool dual_plane = false;
+	bool mode_422 = false;
 	unsigned int access_dir = 0;
 	unsigned int vp_height_l = 0;
 	unsigned int vp_width_l = 0;
@@ -1021,7 +1021,7 @@ static void dml_rq_dlg_get_dlg_params(struct display_mode_lib *mode_lib,
 	double hratio_c = 0;
 	double vratio_l = 0;
 	double vratio_c = 0;
-	bool scl_enable = 0;
+	bool scl_enable = false;
 
 	double line_time_in_us = 0;
 	//	double vinit_l;
@@ -1156,7 +1156,7 @@ static void dml_rq_dlg_get_dlg_params(struct display_mode_lib *mode_lib,
 	// Source
 	//			 dcc_en			  = src.dcc;
 	dual_plane = is_dual_plane((enum source_format_class)(src->source_format));
-	mode_422 = 0; // TODO
+	mode_422 = false; // TODO
 	access_dir = (src->source_scan == dm_vert); // vp access direction: horizontal or vertical accessed
 	vp_height_l = src->viewport_height;
 	vp_width_l = src->viewport_width;
-- 
1.8.3.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
