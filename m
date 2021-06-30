Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1FDD3B7F0D
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jun 2021 10:31:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFD026E959;
	Wed, 30 Jun 2021 08:31:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D09536E0BE;
 Wed, 30 Jun 2021 08:31:00 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7BA831FE4C;
 Wed, 30 Jun 2021 08:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1625041859; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ltRNr4B+l+889GdS96xK+Aj1swrLWkljO+/5u65nZ+o=;
 b=0tju0Z/57BS7BZyXyKgZCEffpW4KYDp5ZgJUuams3K/fJY4d6kBpRxHEKzIXGKO5bjykOs
 GTDwfUJNJb4Le36oHZRGkFZ4x9kGeA1qH5OOOvQ15UPdJwaiN3hFv9jdh4FBBLq5ovF+9u
 DVPG5t1MzZIM8jmLipE3BPbs9nhvbps=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1625041859;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ltRNr4B+l+889GdS96xK+Aj1swrLWkljO+/5u65nZ+o=;
 b=9DYJXknQYeljeht5N7tB9GhJanq3gedirdXJhep4JNA4kqziiiyEvXJ2/HGjtD7GXqtvCN
 49ilNXyyBaxVTfAw==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 303EE11906;
 Wed, 30 Jun 2021 08:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1625041859; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ltRNr4B+l+889GdS96xK+Aj1swrLWkljO+/5u65nZ+o=;
 b=0tju0Z/57BS7BZyXyKgZCEffpW4KYDp5ZgJUuams3K/fJY4d6kBpRxHEKzIXGKO5bjykOs
 GTDwfUJNJb4Le36oHZRGkFZ4x9kGeA1qH5OOOvQ15UPdJwaiN3hFv9jdh4FBBLq5ovF+9u
 DVPG5t1MzZIM8jmLipE3BPbs9nhvbps=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1625041859;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ltRNr4B+l+889GdS96xK+Aj1swrLWkljO+/5u65nZ+o=;
 b=9DYJXknQYeljeht5N7tB9GhJanq3gedirdXJhep4JNA4kqziiiyEvXJ2/HGjtD7GXqtvCN
 49ilNXyyBaxVTfAw==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id yNz1CsMr3GDkQQAALh3uQQ
 (envelope-from <tzimmermann@suse.de>); Wed, 30 Jun 2021 08:30:59 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@linux.ie, daniel@ffwll.ch,
 chris@chris-wilson.co.uk, mika.kuoppala@linux.intel.com,
 matthew.brost@intel.com, maarten.lankhorst@linux.intel.com,
 lucas.demarchi@intel.com, ville.syrjala@linux.intel.com
Subject: [PATCH v2 2/2] drm/i915: Drop all references to DRM IRQ midlayer
Date: Wed, 30 Jun 2021 10:30:57 +0200
Message-Id: <20210630083057.5475-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210630083057.5475-1-tzimmermann@suse.de>
References: <20210630083057.5475-1-tzimmermann@suse.de>
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
Cc: stable@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove all references to DRM's IRQ midlayer. i915 uses Linux' interrupt
functions directly.

v2:
	* also remove an outdated comment
	* move IRQ fix into separate patch
	* update Fixes tag (Daniel)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: b318b82455bd ("drm/i915: Nuke drm_driver irq vfuncs")
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v5.4+
---
 drivers/gpu/drm/i915/i915_drv.c | 1 -
 drivers/gpu/drm/i915/i915_irq.c | 5 -----
 2 files changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_drv.c b/drivers/gpu/drm/i915/i915_drv.c
index 850b499c71c8..73de45472f60 100644
--- a/drivers/gpu/drm/i915/i915_drv.c
+++ b/drivers/gpu/drm/i915/i915_drv.c
@@ -42,7 +42,6 @@
 #include <drm/drm_aperture.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_ioctl.h>
-#include <drm/drm_irq.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_probe_helper.h>
 
diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_irq.c
index 2203dca19895..1d4c683c9de9 100644
--- a/drivers/gpu/drm/i915/i915_irq.c
+++ b/drivers/gpu/drm/i915/i915_irq.c
@@ -33,7 +33,6 @@
 #include <linux/sysrq.h>
 
 #include <drm/drm_drv.h>
-#include <drm/drm_irq.h>
 
 #include "display/intel_de.h"
 #include "display/intel_display_types.h"
@@ -4564,10 +4563,6 @@ void intel_runtime_pm_enable_interrupts(struct drm_i915_private *dev_priv)
 
 bool intel_irqs_enabled(struct drm_i915_private *dev_priv)
 {
-	/*
-	 * We only use drm_irq_uninstall() at unload and VT switch, so
-	 * this is the only thing we need to check.
-	 */
 	return dev_priv->runtime_pm.irqs_enabled;
 }
 
-- 
2.32.0

