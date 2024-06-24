Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 732DC9140C8
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 05:12:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B59210E046;
	Mon, 24 Jun 2024 03:12:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="vIfJJrs7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out30-100.freemail.mail.aliyun.com
 (out30-100.freemail.mail.aliyun.com [115.124.30.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E15710E046;
 Mon, 24 Jun 2024 03:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux.alibaba.com; s=default;
 t=1719198723; h=From:To:Subject:Date:Message-Id:MIME-Version;
 bh=h/k/C2qs1pKcv+sRC2nv2zMOr9MwmxizBcFEz86gVOo=;
 b=vIfJJrs74daCYzuJYPBgBtiXpu2034gGcur61/mfBsFVk5JSUll2YwbhphqVmymVbLMiDp18CU9E0L6QMZtgTAOLofGBXl8G2YkwWvyXryxGC7JY06UA2+xPGO6Aiq/kfb39RLmkXA6oUsRsTsad4jYgn34zMoG28n2ZZshKUjU=
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R211e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=maildocker-contentspam033045075189;
 MF=jiapeng.chong@linux.alibaba.com; NM=1; PH=DS; RN=13; SR=0;
 TI=SMTPD_---0W916qKp_1719198719; 
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0W916qKp_1719198719) by smtp.aliyun-inc.com;
 Mon, 24 Jun 2024 11:12:02 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: harry.wentland@amd.com
Cc: sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH] drm/amd/display: Use ARRAY_SIZE for array length
Date: Mon, 24 Jun 2024 11:11:58 +0800
Message-Id: <20240624031158.98502-1-jiapeng.chong@linux.alibaba.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use of macro ARRAY_SIZE to calculate array size minimizes
the redundant code and improves code reusability.

./drivers/gpu/drm/amd/display/modules/hdcp/hdcp_ddc.c:164:45-46: WARNING: Use ARRAY_SIZE.
./drivers/gpu/drm/amd/display/modules/hdcp/hdcp_ddc.c:183:47-48: WARNING: Use ARRAY_SIZE.
./drivers/gpu/drm/amd/display/modules/hdcp/hdcp_ddc.c:237:45-46: WARNING: Use ARRAY_SIZE.
./drivers/gpu/drm/amd/display/modules/hdcp/hdcp_ddc.c:257:47-48: WARNING: Use ARRAY_SIZE.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=9405
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/gpu/drm/amd/display/modules/hdcp/hdcp_ddc.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/modules/hdcp/hdcp_ddc.c b/drivers/gpu/drm/amd/display/modules/hdcp/hdcp_ddc.c
index 1b2df97226a3..7ecf76aea950 100644
--- a/drivers/gpu/drm/amd/display/modules/hdcp/hdcp_ddc.c
+++ b/drivers/gpu/drm/amd/display/modules/hdcp/hdcp_ddc.c
@@ -161,8 +161,7 @@ static enum mod_hdcp_status read(struct mod_hdcp *hdcp,
 		return MOD_HDCP_STATUS_DDC_FAILURE;
 
 	if (is_dp_hdcp(hdcp)) {
-		int num_dpcd_addrs = sizeof(hdcp_dpcd_addrs) /
-			sizeof(hdcp_dpcd_addrs[0]);
+		int num_dpcd_addrs = ARRAY_SIZE(hdcp_dpcd_addrs);
 		if (msg_id >= num_dpcd_addrs)
 			return MOD_HDCP_STATUS_DDC_FAILURE;
 
@@ -180,8 +179,7 @@ static enum mod_hdcp_status read(struct mod_hdcp *hdcp,
 			data_offset += cur_size;
 		}
 	} else {
-		int num_i2c_offsets = sizeof(hdcp_i2c_offsets) /
-			sizeof(hdcp_i2c_offsets[0]);
+		int num_i2c_offsets = ARRAY_SIZE(hdcp_i2c_offsets);
 		if (msg_id >= num_i2c_offsets)
 			return MOD_HDCP_STATUS_DDC_FAILURE;
 
@@ -234,8 +232,7 @@ static enum mod_hdcp_status write(struct mod_hdcp *hdcp,
 		return MOD_HDCP_STATUS_DDC_FAILURE;
 
 	if (is_dp_hdcp(hdcp)) {
-		int num_dpcd_addrs = sizeof(hdcp_dpcd_addrs) /
-			sizeof(hdcp_dpcd_addrs[0]);
+		int num_dpcd_addrs = ARRAY_SIZE(hdcp_dpcd_addrs);
 		if (msg_id >= num_dpcd_addrs)
 			return MOD_HDCP_STATUS_DDC_FAILURE;
 
@@ -254,8 +251,7 @@ static enum mod_hdcp_status write(struct mod_hdcp *hdcp,
 			data_offset += cur_size;
 		}
 	} else {
-		int num_i2c_offsets = sizeof(hdcp_i2c_offsets) /
-			sizeof(hdcp_i2c_offsets[0]);
+		int num_i2c_offsets = ARRAY_SIZE(hdcp_i2c_offsets);
 		if (msg_id >= num_i2c_offsets)
 			return MOD_HDCP_STATUS_DDC_FAILURE;
 
-- 
2.20.1.7.g153144c

