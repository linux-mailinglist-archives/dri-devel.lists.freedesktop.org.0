Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 329162C9F88
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 11:36:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 713596E84E;
	Tue,  1 Dec 2020 10:35:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6E846E578;
 Tue,  1 Dec 2020 10:35:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4712CAD4A;
 Tue,  1 Dec 2020 10:35:53 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH v2 06/20] drm/gma500: Fix trailing whitespaces
Date: Tue,  1 Dec 2020 11:35:28 +0100
Message-Id: <20201201103542.2182-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201201103542.2182-1-tzimmermann@suse.de>
References: <20201201103542.2182-1-tzimmermann@suse.de>
MIME-Version: 1.0
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
Cc: Sam Ravnborg <sam@ravnborg.org>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, amd-gfx@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, spice-devel@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Adhere to kernel coding style.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
---
 drivers/gpu/drm/gma500/cdv_device.c      | 8 ++++----
 drivers/gpu/drm/gma500/intel_bios.c      | 4 ++--
 drivers/gpu/drm/gma500/oaktrail_device.c | 2 +-
 drivers/gpu/drm/gma500/psb_intel_lvds.c  | 2 +-
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/gma500/cdv_device.c b/drivers/gpu/drm/gma500/cdv_device.c
index e75293e4a52f..e0b728f246fb 100644
--- a/drivers/gpu/drm/gma500/cdv_device.c
+++ b/drivers/gpu/drm/gma500/cdv_device.c
@@ -421,16 +421,16 @@ static int cdv_power_up(struct drm_device *dev)
 static void cdv_hotplug_work_func(struct work_struct *work)
 {
         struct drm_psb_private *dev_priv = container_of(work, struct drm_psb_private,
-							hotplug_work);                 
+							hotplug_work);
         struct drm_device *dev = dev_priv->dev;
 
         /* Just fire off a uevent and let userspace tell us what to do */
         drm_helper_hpd_irq_event(dev);
-}                       
+}
 
 /* The core driver has received a hotplug IRQ. We are in IRQ context
    so extract the needed information and kick off queued processing */
-   
+
 static int cdv_hotplug_event(struct drm_device *dev)
 {
 	struct drm_psb_private *dev_priv = dev->dev_private;
@@ -449,7 +449,7 @@ static void cdv_hotplug_enable(struct drm_device *dev, bool on)
 	}  else {
 		REG_WRITE(PORT_HOTPLUG_EN, 0);
 		REG_WRITE(PORT_HOTPLUG_STAT, REG_READ(PORT_HOTPLUG_STAT));
-	}	
+	}
 }
 
 static const char *force_audio_names[] = {
diff --git a/drivers/gpu/drm/gma500/intel_bios.c b/drivers/gpu/drm/gma500/intel_bios.c
index 8ad6337eeba3..08e1dacbdbc8 100644
--- a/drivers/gpu/drm/gma500/intel_bios.c
+++ b/drivers/gpu/drm/gma500/intel_bios.c
@@ -50,7 +50,7 @@ parse_edp(struct drm_psb_private *dev_priv, struct bdb_header *bdb)
 	uint8_t	panel_type;
 
 	edp = find_section(bdb, BDB_EDP);
-	
+
 	dev_priv->edp.bpp = 18;
 	if (!edp) {
 		if (dev_priv->edp.support) {
@@ -80,7 +80,7 @@ parse_edp(struct drm_psb_private *dev_priv, struct bdb_header *bdb)
 	dev_priv->edp.pps = *edp_pps;
 
 	DRM_DEBUG_KMS("EDP timing in vbt t1_t3 %d t8 %d t9 %d t10 %d t11_t12 %d\n",
-				dev_priv->edp.pps.t1_t3, dev_priv->edp.pps.t8, 
+				dev_priv->edp.pps.t1_t3, dev_priv->edp.pps.t8,
 				dev_priv->edp.pps.t9, dev_priv->edp.pps.t10,
 				dev_priv->edp.pps.t11_t12);
 
diff --git a/drivers/gpu/drm/gma500/oaktrail_device.c b/drivers/gpu/drm/gma500/oaktrail_device.c
index 8754290b0e23..d9f8324f7c58 100644
--- a/drivers/gpu/drm/gma500/oaktrail_device.c
+++ b/drivers/gpu/drm/gma500/oaktrail_device.c
@@ -505,7 +505,7 @@ static int oaktrail_chip_setup(struct drm_device *dev)
 {
 	struct drm_psb_private *dev_priv = dev->dev_private;
 	int ret;
-	
+
 	if (pci_enable_msi(dev->pdev))
 		dev_warn(dev->dev, "Enabling MSI failed!\n");
 
diff --git a/drivers/gpu/drm/gma500/psb_intel_lvds.c b/drivers/gpu/drm/gma500/psb_intel_lvds.c
index 063c66bb946d..49228e2cf480 100644
--- a/drivers/gpu/drm/gma500/psb_intel_lvds.c
+++ b/drivers/gpu/drm/gma500/psb_intel_lvds.c
@@ -216,7 +216,7 @@ static void psb_intel_lvds_set_power(struct drm_device *dev, bool on)
 	        dev_err(dev->dev, "set power, chip off!\n");
 		return;
         }
-        
+
 	if (on) {
 		REG_WRITE(PP_CONTROL, REG_READ(PP_CONTROL) |
 			  POWER_TARGET_ON);
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
