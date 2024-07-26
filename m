Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F91393D099
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2024 11:47:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5F9C10E5B1;
	Fri, 26 Jul 2024 09:47:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="jOWGv1kf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out30-111.freemail.mail.aliyun.com
 (out30-111.freemail.mail.aliyun.com [115.124.30.111])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31C2D10E5B1;
 Fri, 26 Jul 2024 09:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux.alibaba.com; s=default;
 t=1721987259; h=From:To:Subject:Date:Message-Id:MIME-Version;
 bh=K1O75+dU/oxc7RMbWfEpo6GrZGyE2ZFXuZ+LFp9QDcw=;
 b=jOWGv1kf0f1029Ahsy0Spn2i3SIgsIcfs8c7Q9G7kHyaup6wy9kqjCyUF2iM25XEL8d1PvkPtle2w1pMzqEN+HZ3vhZNY3/LOTQXx2t/JWUOQZMDfGQsLtwwls1g0LJK5YzY4qQM1XSNUDnzuNpEUVfVc031MB7H7niq+BYQ95k=
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R171e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=maildocker-contentspam033037067109;
 MF=jiapeng.chong@linux.alibaba.com; NM=1; PH=DS; RN=13; SR=0;
 TI=SMTPD_---0WBLOnXO_1721987249; 
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0WBLOnXO_1721987249) by smtp.aliyun-inc.com;
 Fri, 26 Jul 2024 17:47:38 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: harry.wentland@amd.com
Cc: sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH -next] drm/amd/display: Use ARRAY_SIZE for array length
Date: Fri, 26 Jul 2024 17:47:28 +0800
Message-Id: <20240726094728.1161-1-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.32.0.3.g01195cf9f
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use of macro ARRAY_SIZE to calculate array size minimizes
the redundant code and improves code reusability.

./drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c:1552:57-58: WARNING: Use ARRAY_SIZE.
./drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c:1561:57-58: WARNING: Use ARRAY_SIZE.
./drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c:1573:53-54: WARNING: Use ARRAY_SIZE.
./drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c:1578:53-54: WARNING: Use ARRAY_SIZE.
./drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c:1592:53-54: WARNING: Use ARRAY_SIZE.
./drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c:1597:53-54: WARNING: Use ARRAY_SIZE.
./drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c:1611:50-51: WARNING: Use ARRAY_SIZE.
./drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c:1616:50-51: WARNING: Use ARRAY_SIZE.
./drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c:1630:50-51: WARNING: Use ARRAY_SIZE.
./drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c:1635:50-51: WARNING: Use ARRAY_SIZE.
./drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c:1649:60-61: WARNING: Use ARRAY_SIZE.
./drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c:1663:53-54: WARNING: Use ARRAY_SIZE.
./drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c:1677:52-53: WARNING: Use ARRAY_SIZE.
./drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c:1691:53-54: WARNING: Use ARRAY_SIZE.
./drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c:1705:53-54: WARNING: Use ARRAY_SIZE.
./drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c:1719:54-55: WARNING: Use ARRAY_SIZE.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=9580
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 .../display/dc/spl/dc_spl_scl_easf_filters.c  | 63 ++++++-------------
 1 file changed, 20 insertions(+), 43 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c b/drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c
index 09bf82f7d468..e847af94419a 100644
--- a/drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c
+++ b/drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_easf_filters.c
@@ -1530,14 +1530,13 @@ static uint32_t spl_easf_get_scale_ratio_to_reg_value(struct spl_fixed31_32 rati
 	value = lookup_table_index_ptr->reg_value;
 
 	while (count < num_entries) {
-
 		lookup_table_index_ptr = (lookup_table_base_ptr + count);
 		if (lookup_table_index_ptr->numer < 0)
 			break;
 
 		if (ratio.value < spl_fixpt_from_fraction(
-			lookup_table_index_ptr->numer,
-			lookup_table_index_ptr->denom).value) {
+		    lookup_table_index_ptr->numer,
+		    lookup_table_index_ptr->denom).value) {
 			value = lookup_table_index_ptr->reg_value;
 			break;
 		}
@@ -1548,21 +1547,13 @@ static uint32_t spl_easf_get_scale_ratio_to_reg_value(struct spl_fixed31_32 rati
 }
 uint32_t spl_get_v_bf3_mode(struct spl_fixed31_32 ratio)
 {
-	uint32_t value;
-	unsigned int num_entries = sizeof(easf_v_bf3_mode_lookup) /
-		sizeof(struct scale_ratio_to_reg_value_lookup);
-	value = spl_easf_get_scale_ratio_to_reg_value(ratio,
-		easf_v_bf3_mode_lookup, num_entries);
-	return value;
+	unsigned int num_entries = ARRAY_SIZE(easf_v_bf3_mode_lookup);
+	return spl_easf_get_scale_ratio_to_reg_value(ratio, easf_v_bf3_mode_lookup, num_entries);
 }
 uint32_t spl_get_h_bf3_mode(struct spl_fixed31_32 ratio)
 {
-	uint32_t value;
-	unsigned int num_entries = sizeof(easf_h_bf3_mode_lookup) /
-		sizeof(struct scale_ratio_to_reg_value_lookup);
-	value = spl_easf_get_scale_ratio_to_reg_value(ratio,
-		easf_h_bf3_mode_lookup, num_entries);
-	return value;
+	unsigned int num_entries = ARRAY_SIZE(easf_h_bf3_mode_lookup);
+	return spl_easf_get_scale_ratio_to_reg_value(ratio, easf_h_bf3_mode_lookup, num_entries);
 }
 uint32_t spl_get_reducer_gain6(int taps, struct spl_fixed31_32 ratio)
 {
@@ -1570,13 +1561,11 @@ uint32_t spl_get_reducer_gain6(int taps, struct spl_fixed31_32 ratio)
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
@@ -1589,13 +1578,11 @@ uint32_t spl_get_reducer_gain4(int taps, struct spl_fixed31_32 ratio)
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
@@ -1608,13 +1595,11 @@ uint32_t spl_get_gainRing6(int taps, struct spl_fixed31_32 ratio)
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
@@ -1627,13 +1612,11 @@ uint32_t spl_get_gainRing4(int taps, struct spl_fixed31_32 ratio)
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
@@ -1646,8 +1629,7 @@ uint32_t spl_get_3tap_dntilt_uptilt_offset(int taps, struct spl_fixed31_32 ratio
 	unsigned int num_entries;
 
 	if (taps == 3) {
-		num_entries = sizeof(easf_3tap_dntilt_uptilt_offset_lookup) /
-			sizeof(struct scale_ratio_to_reg_value_lookup);
+		num_entries = ARRAY_SIZE(easf_3tap_dntilt_uptilt_offset_lookup);
 		value = spl_easf_get_scale_ratio_to_reg_value(ratio,
 			easf_3tap_dntilt_uptilt_offset_lookup, num_entries);
 	} else
@@ -1660,8 +1642,7 @@ uint32_t spl_get_3tap_uptilt_maxval(int taps, struct spl_fixed31_32 ratio)
 	unsigned int num_entries;
 
 	if (taps == 3) {
-		num_entries = sizeof(easf_3tap_uptilt_maxval_lookup) /
-			sizeof(struct scale_ratio_to_reg_value_lookup);
+		num_entries = ARRAY_SIZE(easf_3tap_uptilt_maxval_lookup);
 		value = spl_easf_get_scale_ratio_to_reg_value(ratio,
 			easf_3tap_uptilt_maxval_lookup, num_entries);
 	} else
@@ -1674,8 +1655,7 @@ uint32_t spl_get_3tap_dntilt_slope(int taps, struct spl_fixed31_32 ratio)
 	unsigned int num_entries;
 
 	if (taps == 3) {
-		num_entries = sizeof(easf_3tap_dntilt_slope_lookup) /
-			sizeof(struct scale_ratio_to_reg_value_lookup);
+		num_entries = ARRAY_SIZE(easf_3tap_dntilt_slope_lookup);
 		value = spl_easf_get_scale_ratio_to_reg_value(ratio,
 			easf_3tap_dntilt_slope_lookup, num_entries);
 	} else
@@ -1688,8 +1668,7 @@ uint32_t spl_get_3tap_uptilt1_slope(int taps, struct spl_fixed31_32 ratio)
 	unsigned int num_entries;
 
 	if (taps == 3) {
-		num_entries = sizeof(easf_3tap_uptilt1_slope_lookup) /
-			sizeof(struct scale_ratio_to_reg_value_lookup);
+		num_entries = ARRAY_SIZE(easf_3tap_uptilt1_slope_lookup);
 		value = spl_easf_get_scale_ratio_to_reg_value(ratio,
 			easf_3tap_uptilt1_slope_lookup, num_entries);
 	} else
@@ -1702,8 +1681,7 @@ uint32_t spl_get_3tap_uptilt2_slope(int taps, struct spl_fixed31_32 ratio)
 	unsigned int num_entries;
 
 	if (taps == 3) {
-		num_entries = sizeof(easf_3tap_uptilt2_slope_lookup) /
-			sizeof(struct scale_ratio_to_reg_value_lookup);
+		num_entries = ARRAY_SIZE(easf_3tap_uptilt2_slope_lookup);
 		value = spl_easf_get_scale_ratio_to_reg_value(ratio,
 			easf_3tap_uptilt2_slope_lookup, num_entries);
 	} else
@@ -1716,8 +1694,7 @@ uint32_t spl_get_3tap_uptilt2_offset(int taps, struct spl_fixed31_32 ratio)
 	unsigned int num_entries;
 
 	if (taps == 3) {
-		num_entries = sizeof(easf_3tap_uptilt2_offset_lookup) /
-			sizeof(struct scale_ratio_to_reg_value_lookup);
+		num_entries = ARRAY_SIZE(easf_3tap_uptilt2_offset_lookup);
 		value = spl_easf_get_scale_ratio_to_reg_value(ratio,
 			easf_3tap_uptilt2_offset_lookup, num_entries);
 	} else
-- 
2.32.0.3.g01195cf9f

