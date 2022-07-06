Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4445568941
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jul 2022 15:20:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F476112A35;
	Wed,  6 Jul 2022 13:20:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D54610FAAC
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Jul 2022 13:20:22 +0000 (UTC)
Received: from ramsan.of.borg ([84.195.186.194])
 by michel.telenet-ops.be with bizsmtp
 id rpLL2700B4C55Sk06pLLLQ; Wed, 06 Jul 2022 15:20:20 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1o94x1-002LC2-P3; Wed, 06 Jul 2022 15:20:19 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1o94x1-009ewI-F5; Wed, 06 Jul 2022 15:20:19 +0200
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v3] drm/mode: Improve drm_mode_fb_cmd2 documentation
Date: Wed,  6 Jul 2022 15:20:18 +0200
Message-Id: <536de72eab09242e1faf22fa58d91c9005d6ea51.1657113597.git.geert@linux-m68k.org>
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

Fix various grammar mistakes in the kerneldoc comments documenting the
drm_mode_fb_cmd2 structure:
  - s/is/are/,
  - s/8 bit/8-bit/.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Simon Ser <contact@emersion.fr>
---
v3:
  - Add Reviewed-by.

v2:
  - Add Acked-by,
  - Rebase on top of commit a3574119826d9a4e ("drm: document struct
    drm_mode_fb_cmd2") in v5.18.
---
 include/uapi/drm/drm_mode.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index 0a0d56a6158e6327..fa953309d9ce5775 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -675,11 +675,11 @@ struct drm_mode_fb_cmd {
  *   fetch metadata about an existing frame-buffer.
  *
  * In case of planar formats, this struct allows up to 4 buffer objects with
- * offsets and pitches per plane. The pitch and offset order is dictated by the
- * format FourCC as defined by ``drm_fourcc.h``, e.g. NV12 is described as:
+ * offsets and pitches per plane. The pitch and offset order are dictated by
+ * the format FourCC as defined by ``drm_fourcc.h``, e.g. NV12 is described as:
  *
- *     YUV 4:2:0 image with a plane of 8 bit Y samples followed by an
- *     interleaved U/V plane containing 8 bit 2x2 subsampled colour difference
+ *     YUV 4:2:0 image with a plane of 8-bit Y samples followed by an
+ *     interleaved U/V plane containing 8-bit 2x2 subsampled colour difference
  *     samples.
  *
  * So it would consist of a Y plane at ``offsets[0]`` and a UV plane at
-- 
2.25.1

