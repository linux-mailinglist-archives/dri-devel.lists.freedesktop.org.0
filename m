Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 859C8C0A086
	for <lists+dri-devel@lfdr.de>; Sun, 26 Oct 2025 00:07:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A4DF10E083;
	Sat, 25 Oct 2025 22:07:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=qq.com header.i=@qq.com header.b="aJEuZCW1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out203-205-221-173.mail.qq.com (out203-205-221-173.mail.qq.com
 [203.205.221.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A73DE10E9F0;
 Fri, 24 Oct 2025 07:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1761291005; bh=ADOIOMbXPgRYUiwWuCKOoBk0K2INBLNj7OFpUvxFPJk=;
 h=From:To:Cc:Subject:Date;
 b=aJEuZCW135xR00UwlN8mbrRFL3lOW8z5zwkuCJ7Q6JgU4CbXWdravNGwp9FFeMdM1
 1aqbFmgQHrCemQvbrFOJI/nioJv3ceE4aw3C444Azmvvq+tPyM34xN+Wu3MaxUrMdU
 iEX2o6tlr/0vzhsHYomaobGvhAGAm1ZEiKekgUQo=
Received: from localhost.localdomain ([116.128.244.169])
 by newxmesmtplogicsvrsza36-0.qq.com (NewEsmtp) with SMTP
 id 77992C6A; Fri, 24 Oct 2025 15:29:57 +0800
X-QQ-mid: xmsmtpt1761290997te50iyx90
Message-ID: <tencent_2F3D865C2D4C1960CBBE360187953F0B6907@qq.com>
X-QQ-XMAILINFO: N/WmRbclY25GDTLo9mBrt7giouVYEdlQC294tLu56K28Z88M4+3osnpIvPp61s
 OBm12cyVboC/KSP4R9F0W5mkj1jE9R+OOhYoaxwWu6kiMrlf49toVXK/gLNAdPQnC9+S2SDTZw4E
 aqUjMLKHdzm5AKnx959O6A7rgxdWBI+ja9NRLIz7EzaoXS5uKUfOYU45nzigl3Q5Fu6/bBybfmdZ
 iPd2VXFsUUiuFMqWBYkuS1VZ94N0EvbOP3X3AHh3987+NDmolb/MOoqnNb40RyUw9wrwtgThosFR
 9WyHwogqJt7g6vdq9v+Vl2lFUzMo9EegVxFuTdwZkOF0ck/ZYUJkNAY1BmEbpIRcXGzkHqcMCh8/
 7ZMCQ98A0be5Fz76vhWpmm+FwKAW1+CmShPtU6ncIXZriraq2Wo0Wtv9EZV+0AbFxL7Or/fEw/1b
 zLvSsqrpLINhjMCZswpQF79E3ZtWY97nPsaw7AJTAudRbjQfVtQDUSS84ibz9GjD2wF4j1ow1GFY
 j71OlZtN/JafhK2JehW2EOba6HvSiecZ+ij8PmDCgSKSZ5ERVCGllfY6PpR4Mi+uuDeAwpIUlUz+
 kh5itUYi8kFi1m83WUr22/tksdpZg2HCiJ6kRW51JX/GTsXRC+uCjJ+X81yw9euG3sr98hPJh9N5
 qSgl0a8YfQkiEXrkX0EkuGrd8nljYw3m0dmMo5u9gDuCNQGyuN4MuEhFSKsE2kVYnZZ+Z/mPLCqd
 CpFZG+63C8nA1ahMNFpq7tKI67pY+1ZuKi0or+YGhHB13824c9MITyGnnEmVo3opYkDFBpKjD8xP
 LKFw7i0l0+1rFjnuJhRm0pTAVUdGl6eixuQi++j1bfYHo28UMThrAFFm6VWxhuwCMdDwmTrz7uax
 jSmaFCDS163PNAwIh7NjTbcEO3KnCoxid96GU5NYLbsNYXTDbHEI7TcrFLoaMd0xOuCptsSD+OMH
 wB9osTKX0w/yLMANBThwPbiWQvM7ck/DuHVLmsxuVtUz526Wd2hvfTZOQPaPND0Qpm3do9FgZ2CF
 fgj4UofsBGEApAAZK99x5qv+eVf8TSKjbJ1swRj35hOP3kwfeL
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
From: 724364708@qq.com
To: harry.wentland@amd.com, sunpeng.li@amd.com, siqueira@igalia.com,
 alexander.deucher@amd.com, christian.koenig@amd.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Lu Yao <yaolu@kylinos.cn>
Subject: [PATCH] drm/amd/display: fix audio playing speed up on POLARIS12
Date: Fri, 24 Oct 2025 15:29:56 +0800
X-OQ-MSGID: <20251024072956.137133-1-724364708@qq.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 25 Oct 2025 22:07:05 +0000
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

From: Lu Yao <yaolu@kylinos.cn>

Playing audio/video will speed up when color space is NV12.
For POLARIS12, audio request clock has to be same as
'stream->timing.pix_clk_100hz', so double clock now for it
has been halved in the 'get_pixel_clock_parameters' function.

Signed-off-by: Lu Yao <yaolu@kylinos.cn>
---
 .../amd/display/dc/hwss/dce110/dce110_hwseq.c  | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)
---
Test environment:
  Card: RX550  device id: 0X699F
  Display mode: 4K@60 clock:59400

A similar issue was reported in the community a long time ago,
but it was not dealt with, link as follow:
https://gitlab.freedesktop.org/drm/amd/-/issues/556

Discovered through logs audio_output requested&calculated is half
of stream->timing.pix_clk_100hz before, so I double it.
I'm not sure if this patch modification has correctly solved the
root cause and whether all DCE_VERSION_11_2 have problem or POLARIS12
only, but it's working properly on my machine now.
---

diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c
index 24184b4eb352..a93313248db3 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c
@@ -1440,13 +1440,21 @@ void build_audio_output(
 
 /*for HDMI, audio ACR is with deep color ratio factor*/
 	if (dc_is_hdmi_tmds_signal(pipe_ctx->stream->signal) &&
-		audio_output->crtc_info.requested_pixel_clock_100Hz ==
-				(stream->timing.pix_clk_100hz)) {
-		if (pipe_ctx->stream_res.pix_clk_params.pixel_encoding == PIXEL_ENCODING_YCBCR420) {
+		pipe_ctx->stream_res.pix_clk_params.pixel_encoding == PIXEL_ENCODING_YCBCR420) {
+		struct hw_asic_id asic_id = stream->link->ctx->asic_id;
+
+		if (asic_id.chip_family == FAMILY_VI &&
+		    ASIC_REV_IS_POLARIS12_V(asic_id.hw_internal_rev)) {
+			audio_output->crtc_info.requested_pixel_clock_100Hz =
+				audio_output->crtc_info.requested_pixel_clock_100Hz*2;
+			audio_output->crtc_info.calculated_pixel_clock_100Hz =
+				pipe_ctx->stream_res.pix_clk_params.requested_pix_clk_100hz*2;
+		} else if (audio_output->crtc_info.requested_pixel_clock_100Hz ==
+			   (stream->timing.pix_clk_100hz)) {
 			audio_output->crtc_info.requested_pixel_clock_100Hz =
-					audio_output->crtc_info.requested_pixel_clock_100Hz/2;
+				audio_output->crtc_info.requested_pixel_clock_100Hz/2;
 			audio_output->crtc_info.calculated_pixel_clock_100Hz =
-					pipe_ctx->stream_res.pix_clk_params.requested_pix_clk_100hz/2;
+				pipe_ctx->stream_res.pix_clk_params.requested_pix_clk_100hz/2;
 
 		}
 	}
-- 
2.25.1

