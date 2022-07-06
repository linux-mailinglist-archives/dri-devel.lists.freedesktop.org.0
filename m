Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55226568926
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jul 2022 15:16:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B18811B43A;
	Wed,  6 Jul 2022 13:16:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D70CE11B43A
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Jul 2022 13:16:23 +0000 (UTC)
Received: from ramsan.of.borg ([84.195.186.194])
 by michel.telenet-ops.be with bizsmtp
 id rpGL2700W4C55Sk06pGLll; Wed, 06 Jul 2022 15:16:21 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1o94tA-002L9t-35; Wed, 06 Jul 2022 15:16:20 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1o94t9-009enR-L2; Wed, 06 Jul 2022 15:16:19 +0200
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2] drm/fb: Improve drm_framebuffer.offsets documentation
Date: Wed,  6 Jul 2022 15:16:18 +0200
Message-Id: <33fda13b500b39645e7363806c6e458e915b581e.1657113304.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
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
Cc: Sam Ravnborg <sam@ravnborg.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix various spelling and grammar mistakes in the kerneldoc comments
documenting the offsets member in the drm_framebuffer structure:
  - s/laytou/layout/,
  - Add missing "is",
  - s/it/its/.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Simon Ser <contact@emersion.fr>
---
v2:
  - Add Acked-by, Reviewed-by.
---
 include/drm/drm_framebuffer.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/drm/drm_framebuffer.h b/include/drm/drm_framebuffer.h
index f67c5b7bcb68654a..0dcc07b68654844b 100644
--- a/include/drm/drm_framebuffer.h
+++ b/include/drm/drm_framebuffer.h
@@ -154,10 +154,10 @@ struct drm_framebuffer {
 	 * drm_mode_fb_cmd2.
 	 *
 	 * Note that this is a linear offset and does not take into account
-	 * tiling or buffer laytou per @modifier. It meant to be used when the
-	 * actual pixel data for this framebuffer plane starts at an offset,
-	 * e.g.  when multiple planes are allocated within the same backing
-	 * storage buffer object. For tiled layouts this generally means it
+	 * tiling or buffer layout per @modifier. It is meant to be used when
+	 * the actual pixel data for this framebuffer plane starts at an offset,
+	 * e.g. when multiple planes are allocated within the same backing
+	 * storage buffer object. For tiled layouts this generally means its
 	 * @offsets must at least be tile-size aligned, but hardware often has
 	 * stricter requirements.
 	 *
-- 
2.25.1

