Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C14604D03B3
	for <lists+dri-devel@lfdr.de>; Mon,  7 Mar 2022 17:08:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B244F10E04C;
	Mon,  7 Mar 2022 16:08:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25F6410E057
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Mar 2022 16:08:28 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:6100:2d37:4115:c358])
 by andre.telenet-ops.be with bizsmtp
 id 3U8S2700E1Yj8bA01U8Sj9; Mon, 07 Mar 2022 17:08:26 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1nRFuL-0034Qx-Mw; Mon, 07 Mar 2022 17:08:25 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1nRFuL-002vlz-60; Mon, 07 Mar 2022 17:08:25 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Simon Ser <contact@emersion.fr>
Subject: [PATCH v2] drm/mode: Improve drm_mode_fb_cmd2 documentation
Date: Mon,  7 Mar 2022 17:08:23 +0100
Message-Id: <20220307160823.698692-1-geert+renesas@glider.be>
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
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Geert Uytterhoeven <geert@linux-m68k.org>

Fix various grammar mistakes in the kerneldoc comments documenting the
drm_mode_fb_cmd2 structure:
  - s/is/are/,
  - s/8 bit/8-bit/.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
---
v2:
  - Add Acked-by,
  - Rebase on top of commit a3574119826d9a4e ("drm: document struct
    drm_mode_fb_cmd2") in drm-next.
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

