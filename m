Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 483BE86E29E
	for <lists+dri-devel@lfdr.de>; Fri,  1 Mar 2024 14:45:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4354F10EE49;
	Fri,  1 Mar 2024 13:44:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="aEUMznBI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pSrr0gzH";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="aEUMznBI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pSrr0gzH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A664C10EE3A;
 Fri,  1 Mar 2024 13:44:54 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id DAF33204BE;
 Fri,  1 Mar 2024 13:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1709300692; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=09WxZEI/6ZvZsDLBNIScV/J4JMtln4dkHew2mnwn7MU=;
 b=aEUMznBIjVPQwmHEXW8MgdPgMXHvnq8cdsW1vn2JL3BaW1P4mr2gx7KKlECTl7OO2uDIFx
 A2RDbMdmOuQBEEYIOiNluU628gAuzKfMDIrykYSxlQounxPb9hb6hAWHDBud//NTuSuL9G
 nhmWocob/oxx44Dlkvqu2q6dG7hxu8M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1709300692;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=09WxZEI/6ZvZsDLBNIScV/J4JMtln4dkHew2mnwn7MU=;
 b=pSrr0gzHkcWf3nZhDey/5AswYV6+HnhgNkOp6ASduDhcrEpU17J1+sRI4RnhZVKDQyDAxp
 ZaqOUDcDMm/oc2CQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1709300692; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=09WxZEI/6ZvZsDLBNIScV/J4JMtln4dkHew2mnwn7MU=;
 b=aEUMznBIjVPQwmHEXW8MgdPgMXHvnq8cdsW1vn2JL3BaW1P4mr2gx7KKlECTl7OO2uDIFx
 A2RDbMdmOuQBEEYIOiNluU628gAuzKfMDIrykYSxlQounxPb9hb6hAWHDBud//NTuSuL9G
 nhmWocob/oxx44Dlkvqu2q6dG7hxu8M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1709300692;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=09WxZEI/6ZvZsDLBNIScV/J4JMtln4dkHew2mnwn7MU=;
 b=pSrr0gzHkcWf3nZhDey/5AswYV6+HnhgNkOp6ASduDhcrEpU17J1+sRI4RnhZVKDQyDAxp
 ZaqOUDcDMm/oc2CQ==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 5917113581;
 Fri,  1 Mar 2024 13:44:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap2.dmz-prg2.suse.org with ESMTPSA id iFFOFNTb4WU2WAAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Fri, 01 Mar 2024 13:44:52 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tvrtko.ursulin@linux.intel.com,
 ville.syrjala@linux.intel.com, imre.deak@intel.com,
 tejas.upadhyay@intel.com, jouni.hogander@intel.com, javierm@redhat.com,
 airlied@gmail.com, daniel@ffwll.ch, lucas.demarchi@intel.com,
 ogabbay@kernel.org, thomas.hellstrom@linux.intel.com
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v7 2/6] drm/i915: Unregister in-kernel clients
Date: Fri,  1 Mar 2024 14:42:55 +0100
Message-ID: <20240301134448.31289-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240301134448.31289-1-tzimmermann@suse.de>
References: <20240301134448.31289-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spamd-Result: default: False [1.90 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 R_MISSING_CHARSET(2.50)[]; MIME_GOOD(-0.10)[text/plain];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; BROKEN_CONTENT_TYPE(1.50)[];
 R_RATELIMIT(0.00)[to_ip_from(RL9pqk354j4esf7wsagg6iyf8a)];
 RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCPT_COUNT_TWELVE(0.00)[18]; MID_CONTAINS_FROM(1.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
 FREEMAIL_TO(0.00)[linux.intel.com,intel.com,redhat.com,gmail.com,ffwll.ch,kernel.org];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_TLS_ALL(0.00)[];
 BAYES_HAM(-3.00)[100.00%]
X-Spam-Level: *
X-Spam-Score: 1.90
X-Spam-Flag: NO
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Unregister all in-kernel clients before unloading the i915 driver. For
other drivers, drm_dev_unregister() does this automatically. As i915
does not use this helper, it has to perform the call by itself. For xe,
do the same in xe_device_remove()

Note that there are currently no in-kernel clients in i915 or xe. The
patch prepares the drivers for a related update of their fbdev support.

v7:
	* update xe driver

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/i915/i915_driver.c | 3 +++
 drivers/gpu/drm/xe/xe_device.c     | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index 9ee902d5b72c4..97910a85e3917 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -41,6 +41,7 @@
 
 #include <drm/drm_aperture.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_client.h>
 #include <drm/drm_ioctl.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_probe_helper.h>
@@ -852,6 +853,8 @@ void i915_driver_remove(struct drm_i915_private *i915)
 {
 	intel_wakeref_t wakeref;
 
+	drm_client_dev_unregister(&i915->drm);
+
 	wakeref = intel_runtime_pm_get(&i915->runtime_pm);
 
 	i915_driver_unregister(i915);
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 919ad88f0495a..7f41f0ec819f0 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -9,6 +9,7 @@
 
 #include <drm/drm_aperture.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_client.h>
 #include <drm/drm_gem_ttm_helper.h>
 #include <drm/drm_ioctl.h>
 #include <drm/drm_managed.h>
@@ -614,6 +615,8 @@ void xe_device_remove(struct xe_device *xe)
 	struct xe_gt *gt;
 	u8 id;
 
+	drm_client_dev_unregister(&xe->drm);
+
 	xe_device_remove_display(xe);
 
 	xe_display_fini(xe);
-- 
2.43.2

