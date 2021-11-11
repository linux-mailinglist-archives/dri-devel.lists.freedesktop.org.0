Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B586544D489
	for <lists+dri-devel@lfdr.de>; Thu, 11 Nov 2021 10:59:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76B526E9F4;
	Thu, 11 Nov 2021 09:59:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out30-130.freemail.mail.aliyun.com
 (out30-130.freemail.mail.aliyun.com [115.124.30.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A3236EA55
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Nov 2021 09:59:21 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R151e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04423;
 MF=jiapeng.chong@linux.alibaba.com; NM=1; PH=DS; RN=9; SR=0;
 TI=SMTPD_---0Uw1deKi_1636624734; 
Received: from
 j63c13417.sqa.eu95.tbsite.net(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0Uw1deKi_1636624734) by smtp.aliyun-inc.com(127.0.0.1);
 Thu, 11 Nov 2021 17:59:17 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: alexander.deucher@amd.com
Subject: [PATCH] drm/amd/display: clean up some inconsistent indenting
Date: Thu, 11 Nov 2021 17:58:48 +0800
Message-Id: <1636624728-85197-1-git-send-email-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
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
 Xinhui.Pan@amd.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Eliminate the follow smatch warning:

drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_debugfs.c:2245
dp_dsc_slice_bpg_offset_read() warn: inconsistent indenting.

drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_debugfs.c:2044
dp_dsc_pic_width_read() warn: inconsistent indenting.

drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_debugfs.c:2101
dp_dsc_pic_height_read() warn: inconsistent indenting.

drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_debugfs.c:2173
dp_dsc_chunk_size_read() warn: inconsistent indenting.

drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_debugfs.c:1868
dp_dsc_bits_per_pixel_read() warn: inconsistent indenting.

drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_debugfs.c:1965
dp_dsc_bits_per_pixel_write() warn: inconsistent indenting.

drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_debugfs.c:1787
dp_dsc_slice_height_write() warn: inconsistent indenting.

drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_debugfs.c:1602
dp_dsc_slice_width_write() warn: inconsistent indenting.

drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_debugfs.c:1687
dp_dsc_slice_height_read() warn: inconsistent indenting.

vers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_debugfs.c:1417
dp_dsc_clock_en_write() warn: inconsistent indenting.

drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_debugfs.c:1502
dp_dsc_slice_width_read() warn: inconsistent indenting.

drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_debugfs.c:1315
dp_dsc_clock_en_read() warn: inconsistent indenting.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c  | 72 +++++++++++-----------
 1 file changed, 36 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
index 9d43ecb..50ef248 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
@@ -1312,9 +1312,9 @@ static ssize_t dp_dsc_clock_en_read(struct file *f, char __user *buf,
 
 	for (i = 0; i < MAX_PIPES; i++) {
 		pipe_ctx = &aconnector->dc_link->dc->current_state->res_ctx.pipe_ctx[i];
-			if (pipe_ctx && pipe_ctx->stream &&
-			    pipe_ctx->stream->link == aconnector->dc_link)
-				break;
+		if (pipe_ctx && pipe_ctx->stream &&
+		    pipe_ctx->stream->link == aconnector->dc_link)
+			break;
 	}
 
 	if (!pipe_ctx)
@@ -1414,9 +1414,9 @@ static ssize_t dp_dsc_clock_en_write(struct file *f, const char __user *buf,
 
 	for (i = 0; i < MAX_PIPES; i++) {
 		pipe_ctx = &aconnector->dc_link->dc->current_state->res_ctx.pipe_ctx[i];
-			if (pipe_ctx && pipe_ctx->stream &&
-			    pipe_ctx->stream->link == aconnector->dc_link)
-				break;
+		if (pipe_ctx && pipe_ctx->stream &&
+		    pipe_ctx->stream->link == aconnector->dc_link)
+			break;
 	}
 
 	if (!pipe_ctx || !pipe_ctx->stream)
@@ -1499,9 +1499,9 @@ static ssize_t dp_dsc_slice_width_read(struct file *f, char __user *buf,
 
 	for (i = 0; i < MAX_PIPES; i++) {
 		pipe_ctx = &aconnector->dc_link->dc->current_state->res_ctx.pipe_ctx[i];
-			if (pipe_ctx && pipe_ctx->stream &&
-			    pipe_ctx->stream->link == aconnector->dc_link)
-				break;
+		if (pipe_ctx && pipe_ctx->stream &&
+		    pipe_ctx->stream->link == aconnector->dc_link)
+			break;
 	}
 
 	if (!pipe_ctx)
@@ -1599,9 +1599,9 @@ static ssize_t dp_dsc_slice_width_write(struct file *f, const char __user *buf,
 
 	for (i = 0; i < MAX_PIPES; i++) {
 		pipe_ctx = &aconnector->dc_link->dc->current_state->res_ctx.pipe_ctx[i];
-			if (pipe_ctx && pipe_ctx->stream &&
-			    pipe_ctx->stream->link == aconnector->dc_link)
-				break;
+		if (pipe_ctx && pipe_ctx->stream &&
+		    pipe_ctx->stream->link == aconnector->dc_link)
+			break;
 	}
 
 	if (!pipe_ctx || !pipe_ctx->stream)
@@ -1684,9 +1684,9 @@ static ssize_t dp_dsc_slice_height_read(struct file *f, char __user *buf,
 
 	for (i = 0; i < MAX_PIPES; i++) {
 		pipe_ctx = &aconnector->dc_link->dc->current_state->res_ctx.pipe_ctx[i];
-			if (pipe_ctx && pipe_ctx->stream &&
-			    pipe_ctx->stream->link == aconnector->dc_link)
-				break;
+		if (pipe_ctx && pipe_ctx->stream &&
+		    pipe_ctx->stream->link == aconnector->dc_link)
+			break;
 	}
 
 	if (!pipe_ctx)
@@ -1784,9 +1784,9 @@ static ssize_t dp_dsc_slice_height_write(struct file *f, const char __user *buf,
 
 	for (i = 0; i < MAX_PIPES; i++) {
 		pipe_ctx = &aconnector->dc_link->dc->current_state->res_ctx.pipe_ctx[i];
-			if (pipe_ctx && pipe_ctx->stream &&
-			    pipe_ctx->stream->link == aconnector->dc_link)
-				break;
+		if (pipe_ctx && pipe_ctx->stream &&
+		    pipe_ctx->stream->link == aconnector->dc_link)
+			break;
 	}
 
 	if (!pipe_ctx || !pipe_ctx->stream)
@@ -1865,9 +1865,9 @@ static ssize_t dp_dsc_bits_per_pixel_read(struct file *f, char __user *buf,
 
 	for (i = 0; i < MAX_PIPES; i++) {
 		pipe_ctx = &aconnector->dc_link->dc->current_state->res_ctx.pipe_ctx[i];
-			if (pipe_ctx && pipe_ctx->stream &&
-			    pipe_ctx->stream->link == aconnector->dc_link)
-				break;
+		if (pipe_ctx && pipe_ctx->stream &&
+		    pipe_ctx->stream->link == aconnector->dc_link)
+			break;
 	}
 
 	if (!pipe_ctx)
@@ -1962,9 +1962,9 @@ static ssize_t dp_dsc_bits_per_pixel_write(struct file *f, const char __user *bu
 
 	for (i = 0; i < MAX_PIPES; i++) {
 		pipe_ctx = &aconnector->dc_link->dc->current_state->res_ctx.pipe_ctx[i];
-			if (pipe_ctx && pipe_ctx->stream &&
-			    pipe_ctx->stream->link == aconnector->dc_link)
-				break;
+		if (pipe_ctx && pipe_ctx->stream &&
+		    pipe_ctx->stream->link == aconnector->dc_link)
+			break;
 	}
 
 	if (!pipe_ctx || !pipe_ctx->stream)
@@ -2041,9 +2041,9 @@ static ssize_t dp_dsc_pic_width_read(struct file *f, char __user *buf,
 
 	for (i = 0; i < MAX_PIPES; i++) {
 		pipe_ctx = &aconnector->dc_link->dc->current_state->res_ctx.pipe_ctx[i];
-			if (pipe_ctx && pipe_ctx->stream &&
-			    pipe_ctx->stream->link == aconnector->dc_link)
-				break;
+		if (pipe_ctx && pipe_ctx->stream &&
+		    pipe_ctx->stream->link == aconnector->dc_link)
+			break;
 	}
 
 	if (!pipe_ctx)
@@ -2098,9 +2098,9 @@ static ssize_t dp_dsc_pic_height_read(struct file *f, char __user *buf,
 
 	for (i = 0; i < MAX_PIPES; i++) {
 		pipe_ctx = &aconnector->dc_link->dc->current_state->res_ctx.pipe_ctx[i];
-			if (pipe_ctx && pipe_ctx->stream &&
-			    pipe_ctx->stream->link == aconnector->dc_link)
-				break;
+		if (pipe_ctx && pipe_ctx->stream &&
+		    pipe_ctx->stream->link == aconnector->dc_link)
+			break;
 	}
 
 	if (!pipe_ctx)
@@ -2170,9 +2170,9 @@ static ssize_t dp_dsc_chunk_size_read(struct file *f, char __user *buf,
 
 	for (i = 0; i < MAX_PIPES; i++) {
 		pipe_ctx = &aconnector->dc_link->dc->current_state->res_ctx.pipe_ctx[i];
-			if (pipe_ctx && pipe_ctx->stream &&
-			    pipe_ctx->stream->link == aconnector->dc_link)
-				break;
+		if (pipe_ctx && pipe_ctx->stream &&
+		    pipe_ctx->stream->link == aconnector->dc_link)
+			break;
 	}
 
 	if (!pipe_ctx)
@@ -2242,9 +2242,9 @@ static ssize_t dp_dsc_slice_bpg_offset_read(struct file *f, char __user *buf,
 
 	for (i = 0; i < MAX_PIPES; i++) {
 		pipe_ctx = &aconnector->dc_link->dc->current_state->res_ctx.pipe_ctx[i];
-			if (pipe_ctx && pipe_ctx->stream &&
-			    pipe_ctx->stream->link == aconnector->dc_link)
-				break;
+		if (pipe_ctx && pipe_ctx->stream &&
+		    pipe_ctx->stream->link == aconnector->dc_link)
+			break;
 	}
 
 	if (!pipe_ctx)
-- 
1.8.3.1

