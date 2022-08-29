Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A255A4541
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 10:37:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 642D510F0F7;
	Mon, 29 Aug 2022 08:36:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out30-130.freemail.mail.aliyun.com
 (out30-130.freemail.mail.aliyun.com [115.124.30.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09B7710F0F1;
 Mon, 29 Aug 2022 08:36:39 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R121e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046051;
 MF=yang.lee@linux.alibaba.com; NM=1; PH=DS; RN=13; SR=0;
 TI=SMTPD_---0VNb2UWF_1661762194; 
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com
 fp:SMTPD_---0VNb2UWF_1661762194) by smtp.aliyun-inc.com;
 Mon, 29 Aug 2022 16:36:35 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: alexander.deucher@amd.com
Subject: [PATCH -next 3/4 RESEND] drm/amd/display: clean up some inconsistent
 indentings
Date: Mon, 29 Aug 2022 16:36:26 +0800
Message-Id: <20220829083627.12774-3-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
In-Reply-To: <20220829083627.12774-1-yang.lee@linux.alibaba.com>
References: <20220829083627.12774-1-yang.lee@linux.alibaba.com>
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
 amd-gfx@lists.freedesktop.org, airlied@linux.ie,
 Yang Li <yang.lee@linux.alibaba.com>, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The indentation of statements in the same curly bracket should be
consistent.

Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=1890
Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=1891
Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 .../amd/display/dc/dcn10/dcn10_hw_sequencer.c | 20 +++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
index 37246e965457..66e6c070a463 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
@@ -2151,8 +2151,8 @@ static int dcn10_align_pixel_clocks(struct dc *dc, int group_size,
 				dc->res_pool->dp_clock_source->funcs->get_pixel_clk_frequency_100hz(
 					dc->res_pool->dp_clock_source,
 					grouped_pipes[i]->stream_res.tg->inst, &pclk);
-					grouped_pipes[i]->stream->timing.pix_clk_100hz =
-						pclk*get_clock_divider(grouped_pipes[i], false);
+				grouped_pipes[i]->stream->timing.pix_clk_100hz =
+					pclk*get_clock_divider(grouped_pipes[i], false);
 				if (master == -1)
 					master = i;
 			}
@@ -2199,14 +2199,14 @@ void dcn10_enable_vblanks_synchronization(
 	if (master >= 0) {
 		for (i = 0; i < group_size; i++) {
 			if (i != master && !grouped_pipes[i]->stream->has_non_synchronizable_pclk)
-			grouped_pipes[i]->stream_res.tg->funcs->align_vblanks(
-				grouped_pipes[master]->stream_res.tg,
-				grouped_pipes[i]->stream_res.tg,
-				grouped_pipes[master]->stream->timing.pix_clk_100hz,
-				grouped_pipes[i]->stream->timing.pix_clk_100hz,
-				get_clock_divider(grouped_pipes[master], false),
-				get_clock_divider(grouped_pipes[i], false));
-				grouped_pipes[i]->stream->vblank_synchronized = true;
+				grouped_pipes[i]->stream_res.tg->funcs->align_vblanks(
+					grouped_pipes[master]->stream_res.tg,
+					grouped_pipes[i]->stream_res.tg,
+					grouped_pipes[master]->stream->timing.pix_clk_100hz,
+					grouped_pipes[i]->stream->timing.pix_clk_100hz,
+					get_clock_divider(grouped_pipes[master], false),
+					get_clock_divider(grouped_pipes[i], false));
+			grouped_pipes[i]->stream->vblank_synchronized = true;
 		}
 		grouped_pipes[master]->stream->vblank_synchronized = true;
 		DC_SYNC_INFO("Sync complete\n");
-- 
2.20.1.7.g153144c

