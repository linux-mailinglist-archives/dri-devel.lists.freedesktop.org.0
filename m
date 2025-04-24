Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 694E4A9BF5D
	for <lists+dri-devel@lfdr.de>; Fri, 25 Apr 2025 09:13:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB1B410E8A5;
	Fri, 25 Apr 2025 07:12:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=abv.bg header.i=@abv.bg header.b="PZDZQc85";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 394 seconds by postgrey-1.36 at gabe;
 Thu, 24 Apr 2025 18:44:29 UTC
Received: from pop36.abv.bg (pop36.abv.bg [194.153.145.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D47010E18B
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 18:44:29 +0000 (UTC)
Received: from smtp.abv.bg (localhost [127.0.0.1])
 by pop36.abv.bg (Postfix) with ESMTP id B05621805D29;
 Thu, 24 Apr 2025 21:37:53 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=abv.bg; s=smtp-out;
 t=1745519873; bh=vJsJYKKCAboGpLq0CAiXL5li3+HPTt5PnuNQ75PMrds=;
 h=From:To:Cc:Subject:Date:From;
 b=PZDZQc85QnPaY8qhHcEIvLhzDc7B6QMWoi6hgE+VmZjUrSsxYfWM2guoU1rkjY9Ts
 5Gg6lA0MaJCaaci3AaU3VEqegjXC68p8mZOCfZnW3ZSfxL2Sayd5b0JIvHHW9Wk7Sy
 7Swx8vpRk6vzRi/t++aAPWgU9b09ZOusPr5iMw2w=
X-HELO: laptop..
Authentication-Results: smtp.abv.bg;
 auth=pass (plain) smtp.auth=ivan.shamliev.dev@abv.bg
Received: from pop-144.92.escom.bg (HELO laptop..) (93.183.144.92)
 by smtp.abv.bg (qpsmtpd/0.96) with ESMTPSA (ECDHE-RSA-AES256-GCM-SHA384
 encrypted); Thu, 24 Apr 2025 21:37:53 +0300
From: Ivan Shamliev <ivan.shamliev.dev@abv.bg>
To: austin.zheng@amd.com,
	jun.lei@amd.com,
	harry.wentland@amd.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Ivan Shamliev <ivan.shamliev.dev@abv.bg>
Subject: [PATCH] drm/amd/display: Use true/false for boolean variables in
 dcn314
Date: Thu, 24 Apr 2025 21:37:20 +0300
Message-ID: <20250424183720.26387-1-ivan.shamliev.dev@abv.bg>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 25 Apr 2025 07:12:50 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace 1 and 0 with true/false for booleans in display_rq_dlg_calc_314.c
to follow Linux kernel coding style, preferring C99 bool with true/false.

Signed-off-by: Ivan Shamliev <ivan.shamliev.dev@abv.bg>
---
 .../dc/dml/dcn314/display_rq_dlg_calc_314.c   | 28 +++++++++----------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_rq_dlg_calc_314.c b/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_rq_dlg_calc_314.c
index b7d2a0caec11..8c43b84ad034 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_rq_dlg_calc_314.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_rq_dlg_calc_314.c
@@ -119,10 +119,10 @@ static bool CalculateBytePerPixelAnd256BBlockSizes(
 
 static bool is_dual_plane(enum source_format_class source_format)
 {
-	bool ret_val = 0;
+	bool ret_val = false;
 
 	if ((source_format == dm_420_12) || (source_format == dm_420_8) || (source_format == dm_420_10) || (source_format == dm_rgbe_alpha))
-		ret_val = 1;
+		ret_val = true;
 
 	return ret_val;
 }
@@ -259,8 +259,8 @@ static void handle_det_buf_split(struct display_mode_lib *mode_lib, display_rq_p
 	unsigned int swath_bytes_c = 0;
 	unsigned int full_swath_bytes_packed_l = 0;
 	unsigned int full_swath_bytes_packed_c = 0;
-	bool req128_l = 0;
-	bool req128_c = 0;
+	bool req128_l = false;
+	bool req128_c = false;
 	bool surf_linear = (pipe_src_param->sw_mode == dm_sw_linear);
 	bool surf_vert = (pipe_src_param->source_scan == dm_vert);
 	unsigned int log2_swath_height_l = 0;
@@ -295,37 +295,37 @@ static void handle_det_buf_split(struct display_mode_lib *mode_lib, display_rq_p
 #endif
 
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
 	} else if ((double) full_swath_bytes_packed_l / (double) full_swath_bytes_packed_c < 1.5) {
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
 		swath_bytes_l = full_swath_bytes_packed_l / 2;
 		swath_bytes_c = full_swath_bytes_packed_c;
 
 		total_swath_bytes = 2 * swath_bytes_l + 2 * swath_bytes_c;
 
 		if (total_swath_bytes > detile_buf_size_in_bytes) {
-			req128_c = 1;
+			req128_c = true;
 			swath_bytes_c = full_swath_bytes_packed_c / 2;
 		}
 	}
-- 
2.43.0

