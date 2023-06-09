Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E3EB7292A2
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 10:18:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 635C810E658;
	Fri,  9 Jun 2023 08:17:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B90210E653
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jun 2023 08:17:52 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1983861300;
 Fri,  9 Jun 2023 08:17:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9ED4C433D2;
 Fri,  9 Jun 2023 08:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686298671;
 bh=Pv1wU5KAiTG2NqIbaiHMThlUj2m+iKFsaTZ+K1VxTYA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CyyMLY9G9flUQzJlNsCDG4Nrkwef2ebn/lN7hvCXlDzdNZKVM3OWgdlfmV2MYcThy
 D/hPVE25LoNsux3ot4mwpyIF3mGUdK0laqJshhaDONDYhE0NqlJ/BanDNLLI7NrtaI
 5qNpau/9gddwppfKg42n3xVjWR8KH/MmbZXiMTWHlBdGvlXCI/PfEBmcat13te+PbV
 vIXSjLrzGZ43/OyThVwRxFiyFot21x9z6U0Iz7xHEIOo9fqw2RsbTw6ZZvNyIj2Zci
 74YeF/jigBnDn3IItetU8gDHMr/0enPMB+htsHx9KNuvjhtCxp4OygIg8GAcG6eybJ
 6FG8ASYhPNHyQ==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org
Subject: [RESEND 03/15] drm/vkms/vkms_composer: Fix a few different kerneldoc
 formatting
Date: Fri,  9 Jun 2023 09:17:06 +0100
Message-ID: <20230609081732.3842341-4-lee@kernel.org>
X-Mailer: git-send-email 2.41.0.162.gfafddb0af9-goog
In-Reply-To: <20230609081732.3842341-1-lee@kernel.org>
References: <20230609081732.3842341-1-lee@kernel.org>
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
 dri-devel@lists.freedesktop.org, Melissa Wen <melissa.srw@gmail.com>
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
index 906d3df40cdbe..03fa3eeef678c 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -23,7 +23,7 @@ static u16 pre_mul_blend_channel(u16 src, u16 dst, u16 alpha)
 
 /**
  * pre_mul_alpha_blend - alpha blending equation
- * @src_frame_info: source framebuffer's metadata
+ * @frame_info: source framebuffer's metadata
  * @stage_buffer: The line with the pixels from src_plane
  * @output_buffer: A line buffer that receives all the blends output
  *
@@ -90,11 +90,13 @@ static void fill_background(const struct pixel_argb_u16 *background_color,
 }
 
 /**
- * @wb_frame_info: The writeback frame buffer metadata
+ * blend - blend pixels from a given row and calculate CRC
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
2.41.0.162.gfafddb0af9-goog

