Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA72D66BF0E
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jan 2023 14:13:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16AED10E417;
	Mon, 16 Jan 2023 13:12:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 371ED10E3FC;
 Mon, 16 Jan 2023 13:12:41 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D4405373E0;
 Mon, 16 Jan 2023 13:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1673874759; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gcxj11WVBAccv8ZPp8nm7Tpgxuacdx7+i90YDa/rA7o=;
 b=FDi/Er+CAgJDK4mkst7406IxvQExubvwkvanEro9mJsf2wNVKRv5vaqkhrUuEWZpk6h0Yc
 zXnvxLdGBIiJcAzwEe3ulMhpNlaPqBktr5hCFXCCQ7nbNMogQ1e6hRZw9R8MqI/OSYdcOC
 YbJUtu4alYsO/z2UEBYj2WEbxCgcuHM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1673874759;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gcxj11WVBAccv8ZPp8nm7Tpgxuacdx7+i90YDa/rA7o=;
 b=NHw2yTHEj9G/fxDbwsuYI6lRfOEf0sZrFMS3ZcADtGKUvRZkQulfpZeI0B76ohslwVGfMo
 rU4UlsBy6I9tQrAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 81A60138FA;
 Mon, 16 Jan 2023 13:12:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id oF22HkdNxWNrNQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 16 Jan 2023 13:12:39 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: sam@ravnborg.org,
	daniel@ffwll.ch,
	airlied@gmail.com
Subject: [PATCH 08/22] drm/gma500: Remove unnecessary include statements for
 drm_crtc_helper.h
Date: Mon, 16 Jan 2023 14:12:21 +0100
Message-Id: <20230116131235.18917-9-tzimmermann@suse.de>
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
 drivers/gpu/drm/gma500/cdv_device.c        | 1 +
 drivers/gpu/drm/gma500/cdv_intel_crt.c     | 2 ++
 drivers/gpu/drm/gma500/cdv_intel_display.c | 1 +
 drivers/gpu/drm/gma500/cdv_intel_dp.c      | 1 +
 drivers/gpu/drm/gma500/cdv_intel_hdmi.c    | 2 ++
 drivers/gpu/drm/gma500/cdv_intel_lvds.c    | 2 ++
 drivers/gpu/drm/gma500/framebuffer.c       | 2 ++
 drivers/gpu/drm/gma500/gma_display.c       | 2 ++
 drivers/gpu/drm/gma500/oaktrail_crtc.c     | 1 +
 drivers/gpu/drm/gma500/oaktrail_hdmi.c     | 2 ++
 drivers/gpu/drm/gma500/oaktrail_lvds.c     | 1 +
 drivers/gpu/drm/gma500/psb_device.c        | 1 +
 drivers/gpu/drm/gma500/psb_intel_display.c | 3 +++
 drivers/gpu/drm/gma500/psb_intel_drv.h     | 1 -
 drivers/gpu/drm/gma500/psb_intel_lvds.c    | 2 ++
 drivers/gpu/drm/gma500/psb_intel_sdvo.c    | 2 ++
 16 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/gma500/cdv_device.c b/drivers/gpu/drm/gma500/cdv_device.c
index 3065596257e9..3e83299113e3 100644
--- a/drivers/gpu/drm/gma500/cdv_device.c
+++ b/drivers/gpu/drm/gma500/cdv_device.c
@@ -8,6 +8,7 @@
 #include <linux/delay.h>
 
 #include <drm/drm.h>
+#include <drm/drm_crtc_helper.h>
 
 #include "cdv_device.h"
 #include "gma_device.h"
diff --git a/drivers/gpu/drm/gma500/cdv_intel_crt.c b/drivers/gpu/drm/gma500/cdv_intel_crt.c
index 7ff1e5141150..5a0acd914f76 100644
--- a/drivers/gpu/drm/gma500/cdv_intel_crt.c
+++ b/drivers/gpu/drm/gma500/cdv_intel_crt.c
@@ -28,6 +28,8 @@
 #include <linux/i2c.h>
 #include <linux/pm_runtime.h>
 
+#include <drm/drm_crtc_helper.h>
+#include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_simple_kms_helper.h>
 
 #include "cdv_device.h"
diff --git a/drivers/gpu/drm/gma500/cdv_intel_display.c b/drivers/gpu/drm/gma500/cdv_intel_display.c
index 0c3ddcdc29dc..bbd0abdd8382 100644
--- a/drivers/gpu/drm/gma500/cdv_intel_display.c
+++ b/drivers/gpu/drm/gma500/cdv_intel_display.c
@@ -10,6 +10,7 @@
 #include <linux/i2c.h>
 
 #include <drm/drm_crtc.h>
+#include <drm/drm_modeset_helper_vtables.h>
 
 #include "cdv_device.h"
 #include "framebuffer.h"
diff --git a/drivers/gpu/drm/gma500/cdv_intel_dp.c b/drivers/gpu/drm/gma500/cdv_intel_dp.c
index 53b967282d6a..8992a95076f2 100644
--- a/drivers/gpu/drm/gma500/cdv_intel_dp.c
+++ b/drivers/gpu/drm/gma500/cdv_intel_dp.c
@@ -33,6 +33,7 @@
 #include <drm/drm_crtc.h>
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_edid.h>
+#include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_simple_kms_helper.h>
 
 #include "gma_display.h"
diff --git a/drivers/gpu/drm/gma500/cdv_intel_hdmi.c b/drivers/gpu/drm/gma500/cdv_intel_hdmi.c
index 29ef45f14169..2d95e0471291 100644
--- a/drivers/gpu/drm/gma500/cdv_intel_hdmi.c
+++ b/drivers/gpu/drm/gma500/cdv_intel_hdmi.c
@@ -28,7 +28,9 @@
 
 #include <drm/drm.h>
 #include <drm/drm_crtc.h>
+#include <drm/drm_crtc_helper.h>
 #include <drm/drm_edid.h>
+#include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_simple_kms_helper.h>
 
 #include "cdv_device.h"
diff --git a/drivers/gpu/drm/gma500/cdv_intel_lvds.c b/drivers/gpu/drm/gma500/cdv_intel_lvds.c
index be6efcaaa3b3..f08a6803dc18 100644
--- a/drivers/gpu/drm/gma500/cdv_intel_lvds.c
+++ b/drivers/gpu/drm/gma500/cdv_intel_lvds.c
@@ -12,6 +12,8 @@
 #include <linux/i2c.h>
 #include <linux/pm_runtime.h>
 
+#include <drm/drm_crtc_helper.h>
+#include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_simple_kms_helper.h>
 
 #include "cdv_device.h"
diff --git a/drivers/gpu/drm/gma500/framebuffer.c b/drivers/gpu/drm/gma500/framebuffer.c
index 9e892a82e109..52ae3ade9a61 100644
--- a/drivers/gpu/drm/gma500/framebuffer.c
+++ b/drivers/gpu/drm/gma500/framebuffer.c
@@ -19,10 +19,12 @@
 
 #include <drm/drm.h>
 #include <drm/drm_crtc.h>
+#include <drm/drm_crtc_helper.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_modeset_helper.h>
 
 #include "framebuffer.h"
 #include "gem.h"
diff --git a/drivers/gpu/drm/gma500/gma_display.c b/drivers/gpu/drm/gma500/gma_display.c
index fe7b8436f87a..f65e90d890f4 100644
--- a/drivers/gpu/drm/gma500/gma_display.c
+++ b/drivers/gpu/drm/gma500/gma_display.c
@@ -11,8 +11,10 @@
 #include <linux/highmem.h>
 
 #include <drm/drm_crtc.h>
+#include <drm/drm_crtc_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
+#include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_vblank.h>
 
 #include "framebuffer.h"
diff --git a/drivers/gpu/drm/gma500/oaktrail_crtc.c b/drivers/gpu/drm/gma500/oaktrail_crtc.c
index 64761f46b434..de8ccfe9890f 100644
--- a/drivers/gpu/drm/gma500/oaktrail_crtc.c
+++ b/drivers/gpu/drm/gma500/oaktrail_crtc.c
@@ -9,6 +9,7 @@
 
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
+#include <drm/drm_modeset_helper_vtables.h>
 
 #include "framebuffer.h"
 #include "gem.h"
diff --git a/drivers/gpu/drm/gma500/oaktrail_hdmi.c b/drivers/gpu/drm/gma500/oaktrail_hdmi.c
index 95b7cb099e63..ed8626c73541 100644
--- a/drivers/gpu/drm/gma500/oaktrail_hdmi.c
+++ b/drivers/gpu/drm/gma500/oaktrail_hdmi.c
@@ -27,7 +27,9 @@
 #include <linux/delay.h>
 
 #include <drm/drm.h>
+#include <drm/drm_crtc_helper.h>
 #include <drm/drm_edid.h>
+#include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_simple_kms_helper.h>
 
 #include "psb_drv.h"
diff --git a/drivers/gpu/drm/gma500/oaktrail_lvds.c b/drivers/gpu/drm/gma500/oaktrail_lvds.c
index 75b4eb1c8884..d974d0c60d2a 100644
--- a/drivers/gpu/drm/gma500/oaktrail_lvds.c
+++ b/drivers/gpu/drm/gma500/oaktrail_lvds.c
@@ -14,6 +14,7 @@
 #include <asm/intel-mid.h>
 
 #include <drm/drm_edid.h>
+#include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_simple_kms_helper.h>
 
 #include "intel_bios.h"
diff --git a/drivers/gpu/drm/gma500/psb_device.c b/drivers/gpu/drm/gma500/psb_device.c
index 3c294c38bdb4..dcfcd7b89d4a 100644
--- a/drivers/gpu/drm/gma500/psb_device.c
+++ b/drivers/gpu/drm/gma500/psb_device.c
@@ -6,6 +6,7 @@
  **************************************************************************/
 
 #include <drm/drm.h>
+#include <drm/drm_crtc_helper.h>
 
 #include "gma_device.h"
 #include "intel_bios.h"
diff --git a/drivers/gpu/drm/gma500/psb_intel_display.c b/drivers/gpu/drm/gma500/psb_intel_display.c
index 531c1781a8fb..ff46e88c4768 100644
--- a/drivers/gpu/drm/gma500/psb_intel_display.c
+++ b/drivers/gpu/drm/gma500/psb_intel_display.c
@@ -9,6 +9,9 @@
 #include <linux/delay.h>
 #include <linux/i2c.h>
 
+#include <drm/drm_modeset_helper.h>
+#include <drm/drm_modeset_helper_vtables.h>
+
 #include "framebuffer.h"
 #include "gem.h"
 #include "gma_display.h"
diff --git a/drivers/gpu/drm/gma500/psb_intel_drv.h b/drivers/gpu/drm/gma500/psb_intel_drv.h
index 8a1111fe714b..0bb85494e3da 100644
--- a/drivers/gpu/drm/gma500/psb_intel_drv.h
+++ b/drivers/gpu/drm/gma500/psb_intel_drv.h
@@ -9,7 +9,6 @@
 #include <linux/i2c.h>
 #include <linux/i2c-algo-bit.h>
 #include <drm/drm_crtc.h>
-#include <drm/drm_crtc_helper.h>
 #include <drm/drm_encoder.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
diff --git a/drivers/gpu/drm/gma500/psb_intel_lvds.c b/drivers/gpu/drm/gma500/psb_intel_lvds.c
index 7ee6c8ce103b..8486de230ec9 100644
--- a/drivers/gpu/drm/gma500/psb_intel_lvds.c
+++ b/drivers/gpu/drm/gma500/psb_intel_lvds.c
@@ -11,6 +11,8 @@
 #include <linux/i2c.h>
 #include <linux/pm_runtime.h>
 
+#include <drm/drm_crtc_helper.h>
+#include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_simple_kms_helper.h>
 
 #include "intel_bios.h"
diff --git a/drivers/gpu/drm/gma500/psb_intel_sdvo.c b/drivers/gpu/drm/gma500/psb_intel_sdvo.c
index bdced46dd333..d6fd5d726216 100644
--- a/drivers/gpu/drm/gma500/psb_intel_sdvo.c
+++ b/drivers/gpu/drm/gma500/psb_intel_sdvo.c
@@ -33,7 +33,9 @@
 #include <linux/slab.h>
 
 #include <drm/drm_crtc.h>
+#include <drm/drm_crtc_helper.h>
 #include <drm/drm_edid.h>
+#include <drm/drm_modeset_helper_vtables.h>
 
 #include "psb_drv.h"
 #include "psb_intel_drv.h"
-- 
2.39.0

