Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF0676BE312
	for <lists+dri-devel@lfdr.de>; Fri, 17 Mar 2023 09:22:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C20410EE59;
	Fri, 17 Mar 2023 08:22:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69D6510E3BA
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Mar 2023 08:22:36 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D40ACB824FA;
 Fri, 17 Mar 2023 08:22:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32EC6C433EF;
 Fri, 17 Mar 2023 08:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679041352;
 bh=6IfSFdh6AdK8HaCzOcUswFzCYKHO1PH+7+IfW5t0LkQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WrWJF/AUKQb1vZClLM20LS4rHOGv9LzcDWeV/+RYyz5IKJQKrwfBRBmj9Bt4nfPbS
 Ue3yNzGkpdFrp/nGPPtud16ihHZVR/Pk7ryTt3huGGSpFqnI7kOZmaTjv8CQlWOC2j
 tQUYbC12xkFgU0o7KutLOy//Q/x5v/UBVvyexOMilpS6nmRUXH5I4hzgFudoCPnzA2
 /j3O8Lpw9reMrTwgSDeWuPXWMF23EX4KDZ3vXRCnJomEnn7ofErwCkp6OM+QVCD5y2
 VxSjNEU7PiL6S34PqfdD8XtltyN++241lKSO6eN16VgDRYGJmX0hY8kfHCRrLVvLtj
 EQheN98BQTGWg==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 06/37] drm/vkms/vkms_composer: Fix a few different kerneldoc
 formatting
Date: Fri, 17 Mar 2023 08:16:47 +0000
Message-Id: <20230317081718.2650744-7-lee@kernel.org>
X-Mailer: git-send-email 2.40.0.rc1.284.g88254d51c5-goog
In-Reply-To: <20230317081718.2650744-1-lee@kernel.org>
References: <20230317081718.2650744-1-lee@kernel.org>
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, linux-kernel@vger.kernel.org,
 Melissa Wen <melissa.srw@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/vkms/vkms_composer.c:41: warning: Function parameter or member 'frame_info' not described in 'pre_mul_alpha_blend'
 drivers/gpu/drm/vkms/vkms_composer.c:41: warning: Excess function parameter 'src_frame_info' description in 'pre_mul_alpha_blend'
 drivers/gpu/drm/vkms/vkms_composer.c:72: warning: Cannot understand  * @wb_frame_info: The writeback frame buffer metadata

Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Cc: Melissa Wen <melissa.srw@gmail.com>
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: David Airlie <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/gpu/drm/vkms/vkms_composer.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index 8e53fa80742b2..41668eedf4272 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -22,7 +22,7 @@ static u16 pre_mul_blend_channel(u16 src, u16 dst, u16 alpha)
 
 /**
  * pre_mul_alpha_blend - alpha blending equation
- * @src_frame_info: source framebuffer's metadata
+ * @frame_info: source framebuffer's metadata
  * @stage_buffer: The line with the pixels from src_plane
  * @output_buffer: A line buffer that receives all the blends output
  *
@@ -69,11 +69,13 @@ static void fill_background(const struct pixel_argb_u16 *background_color,
 }
 
 /**
- * @wb_frame_info: The writeback frame buffer metadata
+ * blend
+ * @wb: The writeback frame buffer metadata
  * @crtc_state: The crtc state
  * @crc32: The crc output of the final frame
  * @output_buffer: A buffer of a row that will receive the result of the blend(s)
  * @stage_buffer: The line with the pixels from plane being blend to the output
+ * @row_size: Size of memory taken up by row data (line_width * pixel_size)
  *
  * This function blends the pixels (Using the `pre_mul_alpha_blend`)
  * from all planes, calculates the crc32 of the output from the former step,
-- 
2.40.0.rc1.284.g88254d51c5-goog

