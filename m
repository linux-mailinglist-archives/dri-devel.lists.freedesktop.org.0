Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6EF580D97
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jul 2022 09:27:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BCF811BCDE;
	Tue, 26 Jul 2022 07:27:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out30-44.freemail.mail.aliyun.com
 (out30-44.freemail.mail.aliyun.com [115.124.30.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 002AE11B60F;
 Tue, 26 Jul 2022 07:27:40 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R171e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046060;
 MF=jiapeng.chong@linux.alibaba.com; NM=1; PH=DS; RN=10; SR=0;
 TI=SMTPD_---0VKUOHEZ_1658820454; 
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0VKUOHEZ_1658820454) by smtp.aliyun-inc.com;
 Tue, 26 Jul 2022 15:27:36 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: alexander.deucher@amd.com
Subject: [PATCH 18/20] drm/amd/display: Clean up some inconsistent indenting
Date: Tue, 26 Jul 2022 15:25:53 +0800
Message-Id: <20220726072555.91323-18-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
In-Reply-To: <20220726072555.91323-1-jiapeng.chong@linux.alibaba.com>
References: <20220726072555.91323-1-jiapeng.chong@linux.alibaba.com>
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
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, airlied@linux.ie,
 Xinhui.Pan@amd.com, Abaci Robot <abaci@linux.alibaba.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

No functional modification involved.

smatch warnings:

drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn303/dcn303_fpu.c:205 dcn303_fpu_update_bw_bounding_box() warn: inconsistent indenting.
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn303/dcn303_fpu.c:355 dcn303_fpu_init_soc_bounding_box() warn: inconsistent indenting.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 .../drm/amd/display/dc/dml/dcn303/dcn303_fpu.c    | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn303/dcn303_fpu.c b/drivers/gpu/drm/amd/display/dc/dml/dcn303/dcn303_fpu.c
index 8fb14baed208..3eb3a021ab7d 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn303/dcn303_fpu.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn303/dcn303_fpu.c
@@ -202,7 +202,7 @@ void dcn303_fpu_update_bw_bounding_box(struct dc *dc, struct clk_bw_params *bw_p
 	unsigned int num_dcfclk_sta_targets = 4;
 	unsigned int num_uclk_states;
 
-    dc_assert_fp_enabled();
+	dc_assert_fp_enabled();
 
 	if (dc->ctx->dc_bios->vram_info.num_chans)
 		dcn3_03_soc.num_chans = dc->ctx->dc_bios->vram_info.num_chans;
@@ -349,14 +349,11 @@ void dcn303_fpu_init_soc_bounding_box(struct bp_soc_bb_info bb_info)
 	dc_assert_fp_enabled();
 
 	if (bb_info.dram_clock_change_latency_100ns > 0)
-				dcn3_03_soc.dram_clock_change_latency_us =
-					bb_info.dram_clock_change_latency_100ns * 10;
+		dcn3_03_soc.dram_clock_change_latency_us = bb_info.dram_clock_change_latency_100ns * 10;
 
-			if (bb_info.dram_sr_enter_exit_latency_100ns > 0)
-				dcn3_03_soc.sr_enter_plus_exit_time_us =
-					bb_info.dram_sr_enter_exit_latency_100ns * 10;
+	if (bb_info.dram_sr_enter_exit_latency_100ns > 0)
+		dcn3_03_soc.sr_enter_plus_exit_time_us = bb_info.dram_sr_enter_exit_latency_100ns * 10;
 
-			if (bb_info.dram_sr_exit_latency_100ns > 0)
-				dcn3_03_soc.sr_exit_time_us =
-					bb_info.dram_sr_exit_latency_100ns * 10;
+	if (bb_info.dram_sr_exit_latency_100ns > 0)
+		dcn3_03_soc.sr_exit_time_us = bb_info.dram_sr_exit_latency_100ns * 10;
 }
-- 
2.20.1.7.g153144c

