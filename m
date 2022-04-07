Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A284F8F3C
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 09:11:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11E6610F8E5;
	Fri,  8 Apr 2022 07:11:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.meizu.com (unknown [14.29.68.187])
 by gabe.freedesktop.org (Postfix) with ESMTP id 57EC810E5B8;
 Thu,  7 Apr 2022 08:35:09 +0000 (UTC)
Received: from IT-EXMB-1-125.meizu.com (172.16.1.125) by mz-mail04.meizu.com
 (172.16.1.16) with Microsoft SMTP Server (TLS) id 14.3.487.0; Thu, 7 Apr 2022
 14:00:52 +0800
Received: from meizu.meizu.com (172.16.137.70) by IT-EXMB-1-125.meizu.com
 (172.16.1.125) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Thu, 7 Apr
 2022 14:00:51 +0800
From: Haowen Bai <baihaowen@meizu.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/amd/display: Fix indenting mistakes in
 dcn10_hw_sequencer.c
Date: Thu, 7 Apr 2022 14:00:50 +0800
Message-ID: <1649311250-17077-1-git-send-email-baihaowen@meizu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.16.137.70]
X-ClientProxiedBy: IT-EXMB-1-126.meizu.com (172.16.1.126) To
 IT-EXMB-1-125.meizu.com (172.16.1.125)
X-Mailman-Approved-At: Fri, 08 Apr 2022 07:11:00 +0000
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
Cc: Haowen Bai <baihaowen@meizu.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Smatch reports the following:
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn10/dcn10_hw_sequencer.c:2174
dcn10_enable_vblanks_synchronization() warn: if statement not indented

Signed-off-by: Haowen Bai <baihaowen@meizu.com>
---
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
index ee22f4422d26..3c338b85040c 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
@@ -2172,13 +2172,13 @@ void dcn10_enable_vblanks_synchronization(
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
+				grouped_pipes[i]->stream_res.tg->funcs->align_vblanks(
+					grouped_pipes[master]->stream_res.tg,
+					grouped_pipes[i]->stream_res.tg,
+					grouped_pipes[master]->stream->timing.pix_clk_100hz,
+					grouped_pipes[i]->stream->timing.pix_clk_100hz,
+					get_clock_divider(grouped_pipes[master], false),
+					get_clock_divider(grouped_pipes[i], false));
 				grouped_pipes[i]->stream->vblank_synchronized = true;
 		}
 		grouped_pipes[master]->stream->vblank_synchronized = true;
-- 
2.7.4

