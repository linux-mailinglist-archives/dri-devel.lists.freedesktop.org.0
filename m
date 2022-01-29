Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21ED24A2AD0
	for <lists+dri-devel@lfdr.de>; Sat, 29 Jan 2022 02:04:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D81210E20F;
	Sat, 29 Jan 2022 01:04:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out30-131.freemail.mail.aliyun.com
 (out30-131.freemail.mail.aliyun.com [115.124.30.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57BAF10E152;
 Sat, 29 Jan 2022 01:04:18 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R131e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04395; MF=yang.lee@linux.alibaba.com;
 NM=1; PH=DS; RN=13; SR=0; TI=SMTPD_---0V34fUPz_1643418255; 
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com
 fp:SMTPD_---0V34fUPz_1643418255) by smtp.aliyun-inc.com(127.0.0.1);
 Sat, 29 Jan 2022 09:04:15 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: airlied@linux.ie
Subject: [PATCH -next] drm/amd/display: clean up some inconsistent indenting
Date: Sat, 29 Jan 2022 09:04:13 +0800
Message-Id: <20220129010413.97801-1-yang.lee@linux.alibaba.com>
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
Cc: sunpeng.li@amd.com, Abaci Robot <abaci@linux.alibaba.com>,
 Xinhui.Pan@amd.com, Rodrigo.Siqueira@amd.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Yang Li <yang.lee@linux.alibaba.com>,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Eliminate the follow smatch warning:
drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c:2246
dp_perform_8b_10b_link_training() warn: inconsistent indenting

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
index daaec3164875..34ffcd5bb1d7 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
@@ -2243,11 +2243,11 @@ static enum link_training_result dp_perform_8b_10b_link_training(
 
 	if (status == LINK_TRAINING_SUCCESS) {
 		status = perform_clock_recovery_sequence(link, link_res, lt_settings, DPRX);
-	if (status == LINK_TRAINING_SUCCESS) {
-		status = perform_channel_equalization_sequence(link,
-					link_res,
-					lt_settings,
-					DPRX);
+		if (status == LINK_TRAINING_SUCCESS) {
+			status = perform_channel_equalization_sequence(link,
+								       link_res,
+								       lt_settings,
+								       DPRX);
 		}
 	}
 
-- 
2.20.1.7.g153144c

