Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ACF76622A3
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 11:12:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D092710E3AC;
	Mon,  9 Jan 2023 10:12:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E61A610E3AB;
 Mon,  9 Jan 2023 10:12:47 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 48CD638127;
 Mon,  9 Jan 2023 10:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1673259165; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Uz25sbYmxNllutJAdHH/s3tUsJ9HiR/zlJriuvptI8g=;
 b=XWQYyydove7HRrD2c7SyRMQgJ6BVyTfpq78BHV4i+oFiiHjAs28XuhLNbHK3GHi7r4vQMQ
 c7UAj1ZHfXqHX7j8TDqsd/DyLFPXew3+0R7TEpFelRWUQqEWlVw+Yg9Bhi6307jhtPY6ox
 pyfvu+WaEAIOre8RlrqgFNGF9gvxww4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1673259165;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Uz25sbYmxNllutJAdHH/s3tUsJ9HiR/zlJriuvptI8g=;
 b=gVrpzuZa09rokSOMbX9tjVCUck8RrtRQwbKPlaO4c4b1IDKmdt38Cyuo9Ya48H+cROrlYx
 R7KPHYnOIWp+W+Cg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F294813583;
 Mon,  9 Jan 2023 10:12:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id SC1WOZzou2O3EwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 09 Jan 2023 10:12:44 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 patrik.r.jakobsson@gmail.com, thierry.reding@gmail.com, sam@ravnborg.org,
 f.fainelli@gmail.com
Subject: [PATCH 1/5] drm: Include <linux/backlight.h> where needed
Date: Mon,  9 Jan 2023 11:12:39 +0100
Message-Id: <20230109101243.26995-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230109101243.26995-1-tzimmermann@suse.de>
References: <20230109101243.26995-1-tzimmermann@suse.de>
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Include <linux/backlight.h> in source files that need it. Some of
DRM's source code gets the backlight header via drm_crtc_helper.h
and <linux/fb.h>, which can leed to unnecessary recompilation. If
possible, do not include drm_crtc_helper.h any longer.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c          | 2 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 1 +
 drivers/gpu/drm/gma500/backlight.c                | 2 ++
 drivers/gpu/drm/radeon/radeon_acpi.c              | 2 +-
 4 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
index 57b5e11446c6..f29c1d0ad4c1 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
@@ -24,6 +24,7 @@
 
 #include <linux/pci.h>
 #include <linux/acpi.h>
+#include <linux/backlight.h>
 #include <linux/slab.h>
 #include <linux/power_supply.h>
 #include <linux/pm_runtime.h>
@@ -31,7 +32,6 @@
 #include <acpi/video.h>
 #include <acpi/actbl.h>
 
-#include <drm/drm_crtc_helper.h>
 #include "amdgpu.h"
 #include "amdgpu_pm.h"
 #include "amdgpu_display.h"
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 1b7f20a9d4ae..55a845eb0c6d 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -67,6 +67,7 @@
 #include "ivsrcid/ivsrcid_vislands30.h"
 
 #include "i2caux_interface.h"
+#include <linux/backlight.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/types.h>
diff --git a/drivers/gpu/drm/gma500/backlight.c b/drivers/gpu/drm/gma500/backlight.c
index 577a4987b193..8711a7a5b8da 100644
--- a/drivers/gpu/drm/gma500/backlight.c
+++ b/drivers/gpu/drm/gma500/backlight.c
@@ -7,6 +7,8 @@
  * Authors: Eric Knopp
  */
 
+#include <linux/backlight.h>
+
 #include <acpi/video.h>
 
 #include "psb_drv.h"
diff --git a/drivers/gpu/drm/radeon/radeon_acpi.c b/drivers/gpu/drm/radeon/radeon_acpi.c
index b603c0b77075..5771d1fcb073 100644
--- a/drivers/gpu/drm/radeon/radeon_acpi.c
+++ b/drivers/gpu/drm/radeon/radeon_acpi.c
@@ -22,6 +22,7 @@
  */
 
 #include <linux/acpi.h>
+#include <linux/backlight.h>
 #include <linux/pci.h>
 #include <linux/pm_runtime.h>
 #include <linux/power_supply.h>
@@ -30,7 +31,6 @@
 #include <acpi/acpi_bus.h>
 #include <acpi/video.h>
 
-#include <drm/drm_crtc_helper.h>
 #include <drm/drm_probe_helper.h>
 
 #include "atom.h"
-- 
2.39.0

