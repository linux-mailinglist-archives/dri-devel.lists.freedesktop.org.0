Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D482A739CC6
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jun 2023 11:23:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87D0D10E526;
	Thu, 22 Jun 2023 09:22:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8321710E4F3
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 09:22:46 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:991a:a831:ea4b:6058])
 by xavier.telenet-ops.be with bizsmtp
 id C9Nj2A0131yfRTD019NjEq; Thu, 22 Jun 2023 11:22:44 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qCGWY-000BxS-7R;
 Thu, 22 Jun 2023 11:22:43 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qCGWZ-003VyC-QU;
 Thu, 22 Jun 2023 11:22:43 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Magnus Damm <magnus.damm@gmail.com>
Subject: [PATCH 33/39] drm: renesas: shmobile: Cleanup encoder
Date: Thu, 22 Jun 2023 11:21:45 +0200
Message-Id: <736a0b26a9393f82769b185e2daa30eb128ff240.1687423204.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687423204.git.geert+renesas@glider.be>
References: <cover.1687423204.git.geert+renesas@glider.be>
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
Cc: linux-renesas-soc@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Most unused callbacks can be NULL pointers these days.
Drop a bunch of empty encoder callbacks.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 .../gpu/drm/renesas/shmobile/shmob_drm_crtc.c | 26 -------------------
 1 file changed, 26 deletions(-)

diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
index b184019d8b1ed89c..ef327da39bca415a 100644
--- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
+++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
@@ -586,11 +586,6 @@ int shmob_drm_crtc_create(struct shmob_drm_device *sdev)
  * Encoder
  */
 
-static void shmob_drm_encoder_dpms(struct drm_encoder *encoder, int mode)
-{
-	/* No-op, everything is handled in the CRTC code. */
-}
-
 static bool shmob_drm_encoder_mode_fixup(struct drm_encoder *encoder,
 					 const struct drm_display_mode *mode,
 					 struct drm_display_mode *adjusted_mode)
@@ -613,29 +608,8 @@ static bool shmob_drm_encoder_mode_fixup(struct drm_encoder *encoder,
 	return true;
 }
 
-static void shmob_drm_encoder_mode_prepare(struct drm_encoder *encoder)
-{
-	/* No-op, everything is handled in the CRTC code. */
-}
-
-static void shmob_drm_encoder_mode_set(struct drm_encoder *encoder,
-				       struct drm_display_mode *mode,
-				       struct drm_display_mode *adjusted_mode)
-{
-	/* No-op, everything is handled in the CRTC code. */
-}
-
-static void shmob_drm_encoder_mode_commit(struct drm_encoder *encoder)
-{
-	/* No-op, everything is handled in the CRTC code. */
-}
-
 static const struct drm_encoder_helper_funcs encoder_helper_funcs = {
-	.dpms = shmob_drm_encoder_dpms,
 	.mode_fixup = shmob_drm_encoder_mode_fixup,
-	.prepare = shmob_drm_encoder_mode_prepare,
-	.commit = shmob_drm_encoder_mode_commit,
-	.mode_set = shmob_drm_encoder_mode_set,
 };
 
 int shmob_drm_encoder_create(struct shmob_drm_device *sdev)
-- 
2.34.1

