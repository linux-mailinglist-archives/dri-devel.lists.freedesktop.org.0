Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A61664B8397
	for <lists+dri-devel@lfdr.de>; Wed, 16 Feb 2022 10:04:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AE0210E791;
	Wed, 16 Feb 2022 09:04:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6672110E73F
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Feb 2022 09:04:32 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:7534:e0be:5adf:2691])
 by michel.telenet-ops.be with bizsmtp
 id vl4V2600X18GbK106l4VEt; Wed, 16 Feb 2022 10:04:30 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1nKGEf-000wtW-Bu; Wed, 16 Feb 2022 10:04:29 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1nKFsN-00CE2Y-Jg; Wed, 16 Feb 2022 09:41:27 +0100
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/mode: Improve drm_mode_fb_cmd2 documentation
Date: Wed, 16 Feb 2022 09:41:26 +0100
Message-Id: <20220216084126.2913861-1-geert@linux-m68k.org>
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
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix various grammar mistakes in the kerneldoc comments documenting the
drm_mode_fb_cmd2 structure:
  - s/is/are/,
  - s/8 bit/8-bit/.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 include/uapi/drm/drm_mode.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index e1e351682872ebb3..5cea483c7be7a29e 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -673,12 +673,12 @@ struct drm_mode_fb_cmd2 {
 	/*
 	 * In case of planar formats, this ioctl allows up to 4
 	 * buffer objects with offsets and pitches per plane.
-	 * The pitch and offset order is dictated by the fourcc,
+	 * The pitch and offset order are dictated by the fourcc,
 	 * e.g. NV12 (https://fourcc.org/yuv.php#NV12) is described as:
 	 *
-	 *   YUV 4:2:0 image with a plane of 8 bit Y samples
+	 *   YUV 4:2:0 image with a plane of 8-bit Y samples
 	 *   followed by an interleaved U/V plane containing
-	 *   8 bit 2x2 subsampled colour difference samples.
+	 *   8-bit 2x2 subsampled colour difference samples.
 	 *
 	 * So it would consist of Y as offsets[0] and UV as
 	 * offsets[1].  Note that offsets[0] will generally
-- 
2.25.1

