Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF76ADC7DE
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 12:16:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FB6110E5D6;
	Tue, 17 Jun 2025 10:16:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=foxmail.com header.i=@foxmail.com header.b="U78h4Hif";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 499 seconds by postgrey-1.36 at gabe;
 Tue, 17 Jun 2025 08:59:09 UTC
Received: from out162-62-57-49.mail.qq.com (out162-62-57-49.mail.qq.com
 [162.62.57.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A06010E541;
 Tue, 17 Jun 2025 08:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
 s=s201512; t=1750150746;
 bh=2gVFkORzM62hZB18JS/222UmlfBatrpXaEZJPo4NBDg=;
 h=From:To:Cc:Subject:Date;
 b=U78h4Hif9dVyWARrO5evDvy7A48bhkzKnkfCSjMtHxjiMtKkyC8yDd9sNp8dc5N6n
 FxyfiYgEtN8dzPGiA2//WaN8w7BkCLJeBaWR6PCUxHxxcwqR4poHv60facdCFS6x+A
 MftwUXYx0t5W3oJ9fwnTKuVRdALcREw7ZOPrqL9c=
Received: from localhost.localdomain ([116.128.244.169])
 by newxmesmtplogicsvrszb16-1.qq.com (NewEsmtp) with SMTP
 id B67830BE; Tue, 17 Jun 2025 16:45:39 +0800
X-QQ-mid: xmsmtpt1750149939tfjk0u1ko
Message-ID: <tencent_24A44EBAE7F05D812288B973A8EC2013BC09@qq.com>
X-QQ-XMAILINFO: No7DFzN00JnRs2AZ9M9EPgnY/wZEwJNUZpthjcQ9o7AUHD2ySvoAQVE5/Xy5ux
 pNO+Ng4Gwf8TbQ8rbFGQQdm2bVqnVopO+CXLLsY3WW3FHNoG3YJ8BgCT4T5jjL9s/BdbXk9p9BkV
 EFIWskl3v5kGMyqARd18knuJcUDyGiABD09PvMvCpOAZlPBs1zWXfLVoOccv/FlhPLr/KlHnhxnR
 fltVBMktIA+onVZVzcB9Na+SVPwXNoGBxf28LJ7JhqJ1vKYyF3c7fcHS/EnFthMdPjUHLK5Hvqbd
 bQi0j8y30uKNdaqoWAYFZJESb8sT8+XV9QqEINwbCBFFcMr4em0iG7kWj+sDIcYd+YbYsmgyYc01
 RHS/wk6BrfanRSxbBZk/1sHtWPeyBwyE9P71CoA+xRalrUiX2+5GibAAFLzw7w5wYZz+9fGIK0Hg
 sf44RLUPjIhSUy83w55Mxy/6DBTOh+qwNwY4WKe4mxL4Oayi3/jE6JTAUSZS8J90OWN7RDuj3v8a
 sd2jBB3S/INT2pyHKFrxOIFobSl9nQ/ho3qet2mhub1I5hSqRqUeHSZwXmv1K4Gfdqh9krnhzJ5O
 xkdhlOUqnpeENx1DfcDFyCdseEkf6pznxD9PaB2JNqd7rqU7esHu+2xRZAWCGyHCjIB/2+KzAcJ8
 JdlmbOUal6qiOrM8QMOmw5KjwkHKJY7nQZaBZO0pmvccCQASTK/EFLWpIAnHoMNLWqHr4arlc0lb
 pw9saynpmvFp8Xra6ATkhT+PxA1HBs2gC96aLP3DpSf+D6SWC6uEUiAWVTR4NWhL20ZfUPWyMgBj
 BPLvCr/FF+RAcUnchgwdF01OdiOF21iT5SjQ7AgWLki+l0TKMGPNbTVcrHmKPRq2aY433qmj1Fo2
 qMGAwpDC7QA66Ol/dadhDb4wsw9LBOr2vuoDI18QS+0Jpu3AhXZ3r4QaxLVyhWGnFqT77G4amLkK
 yNokzGpNtWkg8VodchsS4j8cQ0a6slvj2wKp8ZJuwW88gKyTxj2YigPTbzcxPJMgNh4H/Afmo=
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
From: xiaopeitux@foxmail.com
To: harry.wentland@amd.com, sunpeng.li@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@gmail.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Pei Xiao <xiaopei01@kylinos.cn>
Subject: [PATCH] drm/amd/display: sspl: Use of macro ARRAY_SIZE to calculate
 array size
Date: Tue, 17 Jun 2025 16:45:38 +0800
X-OQ-MSGID: <1a2b56dba50b9b4fc4b69ffdf84de6e67e7e3dff.1750148897.git.xiaopei01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 17 Jun 2025 10:16:27 +0000
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

From: Pei Xiao <xiaopei01@kylinos.cn>

Use of macro ARRAY_SIZE to calculate array size and reduce the number of
lines of code.

cocci warning:
drivers/gpu/drm/amd/display/dc/sspl/dc_spl_scl_easf_filters.c:
	WARNING: Use ARRAY_SIZE

Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
---
 .../display/dc/sspl/dc_spl_scl_easf_filters.c | 50 +++++++------------
 1 file changed, 17 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/sspl/dc_spl_scl_easf_filters.c b/drivers/gpu/drm/amd/display/dc/sspl/dc_spl_scl_easf_filters.c
index 0d1bd81ff04a..1b11dc886a7e 100644
--- a/drivers/gpu/drm/amd/display/dc/sspl/dc_spl_scl_easf_filters.c
+++ b/drivers/gpu/drm/amd/display/dc/sspl/dc_spl_scl_easf_filters.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: MIT
 //
 // Copyright 2024 Advanced Micro Devices, Inc.
-
+#include <linux/array_size.h>
 #include "spl_debug.h"
 #include "dc_spl_filters.h"
 #include "dc_spl_scl_filters.h"
@@ -2409,8 +2409,7 @@ static uint32_t spl_easf_get_scale_ratio_to_reg_value(struct spl_fixed31_32 rati
 uint32_t spl_get_v_bf3_mode(struct spl_fixed31_32 ratio)
 {
 	uint32_t value;
-	unsigned int num_entries = sizeof(easf_v_bf3_mode_lookup) /
-		sizeof(struct scale_ratio_to_reg_value_lookup);
+	unsigned int num_entries = ARRAY_SIZE(easf_v_bf3_mode_lookup);
 	value = spl_easf_get_scale_ratio_to_reg_value(ratio,
 		easf_v_bf3_mode_lookup, num_entries);
 	return value;
@@ -2418,8 +2417,7 @@ uint32_t spl_get_v_bf3_mode(struct spl_fixed31_32 ratio)
 uint32_t spl_get_h_bf3_mode(struct spl_fixed31_32 ratio)
 {
 	uint32_t value;
-	unsigned int num_entries = sizeof(easf_h_bf3_mode_lookup) /
-		sizeof(struct scale_ratio_to_reg_value_lookup);
+	unsigned int num_entries = ARRAY_SIZE(easf_h_bf3_mode_lookup);
 	value = spl_easf_get_scale_ratio_to_reg_value(ratio,
 		easf_h_bf3_mode_lookup, num_entries);
 	return value;
@@ -2430,13 +2428,11 @@ uint32_t spl_get_reducer_gain6(int taps, struct spl_fixed31_32 ratio)
 	unsigned int num_entries;
 
 	if (taps == 4) {
-		num_entries = sizeof(easf_reducer_gain6_4tap_lookup) /
-			sizeof(struct scale_ratio_to_reg_value_lookup);
+		num_entries = ARRAY_SIZE(easf_reducer_gain6_4tap_lookup);
 		value = spl_easf_get_scale_ratio_to_reg_value(ratio,
 			easf_reducer_gain6_4tap_lookup, num_entries);
 	} else if (taps == 6) {
-		num_entries = sizeof(easf_reducer_gain6_6tap_lookup) /
-			sizeof(struct scale_ratio_to_reg_value_lookup);
+		num_entries = ARRAY_SIZE(easf_reducer_gain6_6tap_lookup);
 		value = spl_easf_get_scale_ratio_to_reg_value(ratio,
 			easf_reducer_gain6_6tap_lookup, num_entries);
 	} else
@@ -2449,13 +2445,11 @@ uint32_t spl_get_reducer_gain4(int taps, struct spl_fixed31_32 ratio)
 	unsigned int num_entries;
 
 	if (taps == 4) {
-		num_entries = sizeof(easf_reducer_gain4_4tap_lookup) /
-			sizeof(struct scale_ratio_to_reg_value_lookup);
+		num_entries = ARRAY_SIZE(easf_reducer_gain4_4tap_lookup);
 		value = spl_easf_get_scale_ratio_to_reg_value(ratio,
 			easf_reducer_gain4_4tap_lookup, num_entries);
 	} else if (taps == 6) {
-		num_entries = sizeof(easf_reducer_gain4_6tap_lookup) /
-			sizeof(struct scale_ratio_to_reg_value_lookup);
+		num_entries = ARRAY_SIZE(easf_reducer_gain4_6tap_lookup);
 		value = spl_easf_get_scale_ratio_to_reg_value(ratio,
 			easf_reducer_gain4_6tap_lookup, num_entries);
 	} else
@@ -2468,13 +2462,11 @@ uint32_t spl_get_gainRing6(int taps, struct spl_fixed31_32 ratio)
 	unsigned int num_entries;
 
 	if (taps == 4) {
-		num_entries = sizeof(easf_gain_ring6_4tap_lookup) /
-			sizeof(struct scale_ratio_to_reg_value_lookup);
+		num_entries = ARRAY_SIZE(easf_gain_ring6_4tap_lookup);
 		value = spl_easf_get_scale_ratio_to_reg_value(ratio,
 			easf_gain_ring6_4tap_lookup, num_entries);
 	} else if (taps == 6) {
-		num_entries = sizeof(easf_gain_ring6_6tap_lookup) /
-			sizeof(struct scale_ratio_to_reg_value_lookup);
+		num_entries = ARRAY_SIZE(easf_gain_ring6_6tap_lookup);
 		value = spl_easf_get_scale_ratio_to_reg_value(ratio,
 			easf_gain_ring6_6tap_lookup, num_entries);
 	} else
@@ -2487,13 +2479,11 @@ uint32_t spl_get_gainRing4(int taps, struct spl_fixed31_32 ratio)
 	unsigned int num_entries;
 
 	if (taps == 4) {
-		num_entries = sizeof(easf_gain_ring4_4tap_lookup) /
-			sizeof(struct scale_ratio_to_reg_value_lookup);
+		num_entries = ARRAY_SIZE(easf_gain_ring4_4tap_lookup);
 		value = spl_easf_get_scale_ratio_to_reg_value(ratio,
 			easf_gain_ring4_4tap_lookup, num_entries);
 	} else if (taps == 6) {
-		num_entries = sizeof(easf_gain_ring4_6tap_lookup) /
-			sizeof(struct scale_ratio_to_reg_value_lookup);
+		num_entries = ARRAY_SIZE(easf_gain_ring4_6tap_lookup);
 		value = spl_easf_get_scale_ratio_to_reg_value(ratio,
 			easf_gain_ring4_6tap_lookup, num_entries);
 	} else
@@ -2506,8 +2496,7 @@ uint32_t spl_get_3tap_dntilt_uptilt_offset(int taps, struct spl_fixed31_32 ratio
 	unsigned int num_entries;
 
 	if (taps == 3) {
-		num_entries = sizeof(easf_3tap_dntilt_uptilt_offset_lookup) /
-			sizeof(struct scale_ratio_to_reg_value_lookup);
+		num_entries = ARRAY_SIZE(easf_3tap_dntilt_uptilt_offset_lookup);
 		value = spl_easf_get_scale_ratio_to_reg_value(ratio,
 			easf_3tap_dntilt_uptilt_offset_lookup, num_entries);
 	} else
@@ -2520,8 +2509,7 @@ uint32_t spl_get_3tap_uptilt_maxval(int taps, struct spl_fixed31_32 ratio)
 	unsigned int num_entries;
 
 	if (taps == 3) {
-		num_entries = sizeof(easf_3tap_uptilt_maxval_lookup) /
-			sizeof(struct scale_ratio_to_reg_value_lookup);
+		num_entries = ARRAY_SIZE(easf_3tap_uptilt_maxval_lookup);
 		value = spl_easf_get_scale_ratio_to_reg_value(ratio,
 			easf_3tap_uptilt_maxval_lookup, num_entries);
 	} else
@@ -2534,8 +2522,7 @@ uint32_t spl_get_3tap_dntilt_slope(int taps, struct spl_fixed31_32 ratio)
 	unsigned int num_entries;
 
 	if (taps == 3) {
-		num_entries = sizeof(easf_3tap_dntilt_slope_lookup) /
-			sizeof(struct scale_ratio_to_reg_value_lookup);
+		num_entries = ARRAY_SIZE(easf_3tap_dntilt_slope_lookup);
 		value = spl_easf_get_scale_ratio_to_reg_value(ratio,
 			easf_3tap_dntilt_slope_lookup, num_entries);
 	} else
@@ -2548,8 +2535,7 @@ uint32_t spl_get_3tap_uptilt1_slope(int taps, struct spl_fixed31_32 ratio)
 	unsigned int num_entries;
 
 	if (taps == 3) {
-		num_entries = sizeof(easf_3tap_uptilt1_slope_lookup) /
-			sizeof(struct scale_ratio_to_reg_value_lookup);
+		num_entries = ARRAY_SIZE(easf_3tap_uptilt1_slope_lookup);
 		value = spl_easf_get_scale_ratio_to_reg_value(ratio,
 			easf_3tap_uptilt1_slope_lookup, num_entries);
 	} else
@@ -2562,8 +2548,7 @@ uint32_t spl_get_3tap_uptilt2_slope(int taps, struct spl_fixed31_32 ratio)
 	unsigned int num_entries;
 
 	if (taps == 3) {
-		num_entries = sizeof(easf_3tap_uptilt2_slope_lookup) /
-			sizeof(struct scale_ratio_to_reg_value_lookup);
+		num_entries = ARRAY_SIZE(easf_3tap_uptilt2_slope_lookup);
 		value = spl_easf_get_scale_ratio_to_reg_value(ratio,
 			easf_3tap_uptilt2_slope_lookup, num_entries);
 	} else
@@ -2576,8 +2561,7 @@ uint32_t spl_get_3tap_uptilt2_offset(int taps, struct spl_fixed31_32 ratio)
 	unsigned int num_entries;
 
 	if (taps == 3) {
-		num_entries = sizeof(easf_3tap_uptilt2_offset_lookup) /
-			sizeof(struct scale_ratio_to_reg_value_lookup);
+		num_entries = ARRAY_SIZE(easf_3tap_uptilt2_offset_lookup);
 		value = spl_easf_get_scale_ratio_to_reg_value(ratio,
 			easf_3tap_uptilt2_offset_lookup, num_entries);
 	} else
-- 
2.25.1

