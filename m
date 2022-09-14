Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF795B80D8
	for <lists+dri-devel@lfdr.de>; Wed, 14 Sep 2022 07:28:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 236A610E865;
	Wed, 14 Sep 2022 05:27:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out30-57.freemail.mail.aliyun.com
 (out30-57.freemail.mail.aliyun.com [115.124.30.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1364710E870;
 Wed, 14 Sep 2022 05:27:53 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R181e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046056;
 MF=jiapeng.chong@linux.alibaba.com; NM=1; PH=DS; RN=10; SR=0;
 TI=SMTPD_---0VPlk9BD_1663133266; 
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0VPlk9BD_1663133266) by smtp.aliyun-inc.com;
 Wed, 14 Sep 2022 13:27:49 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: alexander.deucher@amd.com
Subject: [PATCH 1/8] drm/amd/display: make some functions static
Date: Wed, 14 Sep 2022 13:27:35 +0800
Message-Id: <20220914052742.116297-1-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, airlied@linux.ie,
 Xinhui.Pan@amd.com, Abaci Robot <abaci@linux.alibaba.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

These functions are not used outside the file dcn30_resource.c, so the
modification is defined as static.

drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_resource.c:1949:6: warning: no previous prototype for ‘is_refresh_rate_support_mclk_switch_using_fw_based_vblank_stretch’.
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_resource.c:1919:5: warning: no previous prototype for ‘get_frame_rate_at_max_stretch_100hz’.

Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=2143
Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_resource.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_resource.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_resource.c
index 64320e0ca446..f6f3878c99b8 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_resource.c
@@ -1916,7 +1916,7 @@ static int get_refresh_rate(struct dc_state *context)
  */
 #define V_SCALE (10000 / MAX_STRETCHED_V_BLANK)
 
-int get_frame_rate_at_max_stretch_100hz(struct dc_state *context)
+static int get_frame_rate_at_max_stretch_100hz(struct dc_state *context)
 {
 	struct dc_crtc_timing *timing = NULL;
 	uint32_t sec_per_100_lines;
@@ -1946,7 +1946,7 @@ int get_frame_rate_at_max_stretch_100hz(struct dc_state *context)
 	return scaled_refresh_rate;
 }
 
-bool is_refresh_rate_support_mclk_switch_using_fw_based_vblank_stretch(struct dc_state *context)
+static bool is_refresh_rate_support_mclk_switch_using_fw_based_vblank_stretch(struct dc_state *context)
 {
 	int refresh_rate_max_stretch_100hz;
 	int min_refresh_100hz;
-- 
2.20.1.7.g153144c

