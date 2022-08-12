Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 173E15909F7
	for <lists+dri-devel@lfdr.de>; Fri, 12 Aug 2022 03:40:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3618399603;
	Fri, 12 Aug 2022 01:39:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out30-43.freemail.mail.aliyun.com
 (out30-43.freemail.mail.aliyun.com [115.124.30.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B20919956F;
 Fri, 12 Aug 2022 01:39:22 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R881e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046056;
 MF=yang.lee@linux.alibaba.com; NM=1; PH=DS; RN=13; SR=0;
 TI=SMTPD_---0VM.Wval_1660268357; 
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com
 fp:SMTPD_---0VM.Wval_1660268357) by smtp.aliyun-inc.com;
 Fri, 12 Aug 2022 09:39:18 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: daniel@ffwll.ch
Subject: [PATCH -next 3/4] drm/amd/display: clean up one inconsistent indenting
Date: Fri, 12 Aug 2022 09:39:11 +0800
Message-Id: <20220812013912.70000-3-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
In-Reply-To: <20220812013912.70000-1-yang.lee@linux.alibaba.com>
References: <20220812013912.70000-1-yang.lee@linux.alibaba.com>
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
Cc: airlied@linux.ie, Abaci Robot <abaci@linux.alibaba.com>, Xinhui.Pan@amd.com,
 Rodrigo.Siqueira@amd.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, sunpeng.li@amd.com,
 Yang Li <yang.lee@linux.alibaba.com>, dri-devel@lists.freedesktop.org,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The indentation of statements in the same curly bracket should be
consistent.

Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=1890
Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=1891
Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
index 5b5d952b2b8c..4ac8e4fcba77 100644
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
@@ -2206,7 +2206,7 @@ void dcn10_enable_vblanks_synchronization(
 				grouped_pipes[i]->stream->timing.pix_clk_100hz,
 				get_clock_divider(grouped_pipes[master], false),
 				get_clock_divider(grouped_pipes[i], false));
-				grouped_pipes[i]->stream->vblank_synchronized = true;
+			grouped_pipes[i]->stream->vblank_synchronized = true;
 		}
 		grouped_pipes[master]->stream->vblank_synchronized = true;
 		DC_SYNC_INFO("Sync complete\n");
-- 
2.20.1.7.g153144c

