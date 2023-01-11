Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F446665BFC
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 14:02:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3FA310E726;
	Wed, 11 Jan 2023 13:02:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C8BC10E092;
 Wed, 11 Jan 2023 13:02:12 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5090568053;
 Wed, 11 Jan 2023 13:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1673442130; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eCgEoSzGQrIBgeE4VTSyVWd4/4BcVXWPRVXv3akFVwU=;
 b=sKI+1Pv0veSI2q+fXsLFIU7ZKXRQHAjsRXueUws1RRqBuzmlxerI7MedRD+mVvWvBLfR8b
 ILHPrQBFsgeEz3RQFPK8MN7oLV1XJ1ayMYzIS0apzigyIH5YZthoL9ODdAH99++WjiTmED
 JnI5meJLF5/gqu9gl0VXd55JmzvRgac=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1673442130;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eCgEoSzGQrIBgeE4VTSyVWd4/4BcVXWPRVXv3akFVwU=;
 b=efvISctzIGyBsbLFP6t42k2pDRPfe9cGMvVA921VNaMk4fjubpKk2KBJ1/4FjjX9aTiNSZ
 QxC3rsIs5GYdiyBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F187413594;
 Wed, 11 Jan 2023 13:02:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id UGoVOlGzvmMaXAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 11 Jan 2023 13:02:09 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 patrik.r.jakobsson@gmail.com, thierry.reding@gmail.com, sam@ravnborg.org,
 f.fainelli@gmail.com, james.qian.wang@arm.com, liviu.dudau@arm.com
Subject: [PATCH v2 01/10] drm: Include <linux/backlight.h> where needed
Date: Wed, 11 Jan 2023 14:01:57 +0100
Message-Id: <20230111130206.29974-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230111130206.29974-1-tzimmermann@suse.de>
References: <20230111130206.29974-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Acked-by: Christian König <christian.koenig@amd.com> # amd
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

