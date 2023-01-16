Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F5066BF22
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jan 2023 14:13:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE76F10E440;
	Mon, 16 Jan 2023 13:12:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D74210E405;
 Mon, 16 Jan 2023 13:12:42 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4F3FC67772;
 Mon, 16 Jan 2023 13:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1673874761; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GMxRGMODRHRCWoWD0z2EXXJAWYxszVLDYr6+jCvQwXE=;
 b=VCAPGoD34nanx1z/wpWUdWWasuc12dibcP1ESmrn0pjXPsygLWYvGW/+SyxuSaX8NhnOjf
 DkZwYckIZINf3AXlTW89O8ThyIwRq53M8ZYwz/8WQjWqRly3sZx8/5D9T9iTNmpXRoQD5i
 myYwFikA4IGWfI78Majwgg/TW6/OHRQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1673874761;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GMxRGMODRHRCWoWD0z2EXXJAWYxszVLDYr6+jCvQwXE=;
 b=Xqaf2ySKKRO3zMmwsMhEHFJiK9EjeQ2Gmwb/z55AiOf4tN4SRSLFfo8hloWzWIoroubvJ2
 eVAnvkdx6+zNigDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0F33D139C3;
 Mon, 16 Jan 2023 13:12:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id CBjOAklNxWNrNQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 16 Jan 2023 13:12:41 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: sam@ravnborg.org,
	daniel@ffwll.ch,
	airlied@gmail.com
Subject: [PATCH 13/22] drm/nouveau: Remove unnecessary include statements for
 drm_crtc_helper.h
Date: Mon, 16 Jan 2023 14:12:26 +0100
Message-Id: <20230116131235.18917-14-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230116131235.18917-1-tzimmermann@suse.de>
References: <20230116131235.18917-1-tzimmermann@suse.de>
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
Cc: linux-aspeed@lists.ozlabs.org, nouveau@lists.freedesktop.org,
 linux-mips@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Several source files include drm_crtc_helper.h without needing it or
only to get its transitive include statements; leading to unnecessary
compile-time dependencies.

Directly include required headers and drop drm_crtc_helper.h where
possible.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/nouveau/dispnv04/crtc.c        | 1 +
 drivers/gpu/drm/nouveau/dispnv04/dac.c         | 2 +-
 drivers/gpu/drm/nouveau/dispnv04/dfp.c         | 2 +-
 drivers/gpu/drm/nouveau/dispnv04/tvmodesnv17.c | 1 -
 drivers/gpu/drm/nouveau/dispnv04/tvnv04.c      | 2 +-
 drivers/gpu/drm/nouveau/dispnv04/tvnv17.c      | 1 +
 drivers/gpu/drm/nouveau/dispnv50/head.c        | 1 -
 drivers/gpu/drm/nouveau/nouveau_drm.c          | 1 -
 drivers/gpu/drm/nouveau/nouveau_vga.c          | 1 -
 9 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv04/crtc.c b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
index ca6d07d8c2c6..a6f2e681bde9 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/crtc.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
@@ -24,6 +24,7 @@
  */
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_fourcc.h>
+#include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_plane_helper.h>
 #include <drm/drm_vblank.h>
 
diff --git a/drivers/gpu/drm/nouveau/dispnv04/dac.c b/drivers/gpu/drm/nouveau/dispnv04/dac.c
index 22d10f328559..d6b8e0cce2ac 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/dac.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/dac.c
@@ -24,7 +24,7 @@
  * DEALINGS IN THE SOFTWARE.
  */
 
-#include <drm/drm_crtc_helper.h>
+#include <drm/drm_modeset_helper_vtables.h>
 
 #include "nouveau_drv.h"
 #include "nouveau_encoder.h"
diff --git a/drivers/gpu/drm/nouveau/dispnv04/dfp.c b/drivers/gpu/drm/nouveau/dispnv04/dfp.c
index ce3d8c6ef000..d5b129dc623b 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/dfp.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/dfp.c
@@ -24,8 +24,8 @@
  * DEALINGS IN THE SOFTWARE.
  */
 
-#include <drm/drm_crtc_helper.h>
 #include <drm/drm_fourcc.h>
+#include <drm/drm_modeset_helper_vtables.h>
 
 #include "nouveau_drv.h"
 #include "nouveau_reg.h"
diff --git a/drivers/gpu/drm/nouveau/dispnv04/tvmodesnv17.c b/drivers/gpu/drm/nouveau/dispnv04/tvmodesnv17.c
index 2f6d2b6711ab..a3fedd226854 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/tvmodesnv17.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/tvmodesnv17.c
@@ -24,7 +24,6 @@
  *
  */
 
-#include <drm/drm_crtc_helper.h>
 #include "nouveau_drv.h"
 #include "nouveau_encoder.h"
 #include "nouveau_crtc.h"
diff --git a/drivers/gpu/drm/nouveau/dispnv04/tvnv04.c b/drivers/gpu/drm/nouveau/dispnv04/tvnv04.c
index 3ba7b59580d5..de3ea731d6e6 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/tvnv04.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/tvnv04.c
@@ -30,7 +30,7 @@
 #include "nouveau_connector.h"
 #include "nouveau_crtc.h"
 #include "hw.h"
-#include <drm/drm_crtc_helper.h>
+#include <drm/drm_modeset_helper_vtables.h>
 
 #include <drm/i2c/ch7006.h>
 
diff --git a/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c b/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c
index e5480dab55e3..670c9739e5e1 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c
@@ -25,6 +25,7 @@
  */
 
 #include <drm/drm_crtc_helper.h>
+#include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_probe_helper.h>
 #include "nouveau_drv.h"
 #include "nouveau_reg.h"
diff --git a/drivers/gpu/drm/nouveau/dispnv50/head.c b/drivers/gpu/drm/nouveau/dispnv50/head.c
index f006e56e1e08..5f490fbf1877 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/head.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/head.c
@@ -32,7 +32,6 @@
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
-#include <drm/drm_crtc_helper.h>
 #include <drm/drm_vblank.h>
 #include "nouveau_connector.h"
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 574a8abf6a1d..cc7c5b4a05fd 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -31,7 +31,6 @@
 #include <linux/dynamic_debug.h>
 
 #include <drm/drm_aperture.h>
-#include <drm/drm_crtc_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fbdev_generic.h>
 #include <drm/drm_gem_ttm_helper.h>
diff --git a/drivers/gpu/drm/nouveau/nouveau_vga.c b/drivers/gpu/drm/nouveau/nouveau_vga.c
index 789393b94291..f8bf0ec26844 100644
--- a/drivers/gpu/drm/nouveau/nouveau_vga.c
+++ b/drivers/gpu/drm/nouveau/nouveau_vga.c
@@ -2,7 +2,6 @@
 #include <linux/vgaarb.h>
 #include <linux/vga_switcheroo.h>
 
-#include <drm/drm_crtc_helper.h>
 #include <drm/drm_fb_helper.h>
 
 #include "nouveau_drv.h"
-- 
2.39.0

