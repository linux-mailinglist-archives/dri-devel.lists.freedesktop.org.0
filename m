Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A52AD6A67
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 10:21:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 535D810E7C1;
	Thu, 12 Jun 2025 08:21:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="02FQjV0Y";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="VI1xKYpg";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="02FQjV0Y";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="VI1xKYpg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 329FE10E7B1
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 08:21:50 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 328211F834;
 Thu, 12 Jun 2025 08:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1749716488; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K1Jj3eY0WmQc7qvx6vdw2IPsmgQPX/Ti18eweGsKxXc=;
 b=02FQjV0YpI2FbBn9ITbF7KyHxS0f831q9ToQs4bC4O29lrnK8sC+WgN9Tgw1pPESIJoLtZ
 xR12Vqrz7TvQWFiP5um/HFiOUcHKzKO9aYoIFG8KKrWMcAVjS0tM1SdxabSF4hrYNeka9h
 mBNmKHXQyq93vKE8vMWEaHcIyyGBJQA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1749716488;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K1Jj3eY0WmQc7qvx6vdw2IPsmgQPX/Ti18eweGsKxXc=;
 b=VI1xKYpgS4cgj0wfr1zi1sJbRM+4S7RgYr+5RVg99Y118UvDp1ScPW3ui5NEsFllRnf3ql
 8SkizvqjSalDgMCA==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=02FQjV0Y;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=VI1xKYpg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1749716488; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K1Jj3eY0WmQc7qvx6vdw2IPsmgQPX/Ti18eweGsKxXc=;
 b=02FQjV0YpI2FbBn9ITbF7KyHxS0f831q9ToQs4bC4O29lrnK8sC+WgN9Tgw1pPESIJoLtZ
 xR12Vqrz7TvQWFiP5um/HFiOUcHKzKO9aYoIFG8KKrWMcAVjS0tM1SdxabSF4hrYNeka9h
 mBNmKHXQyq93vKE8vMWEaHcIyyGBJQA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1749716488;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K1Jj3eY0WmQc7qvx6vdw2IPsmgQPX/Ti18eweGsKxXc=;
 b=VI1xKYpgS4cgj0wfr1zi1sJbRM+4S7RgYr+5RVg99Y118UvDp1ScPW3ui5NEsFllRnf3ql
 8SkizvqjSalDgMCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D30F7132D8;
 Thu, 12 Jun 2025 08:21:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 6HwiMgeOSmgILAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 12 Jun 2025 08:21:27 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de, soci@c64.rulez.org, simona@ffwll.ch, linux@armlinux.org.uk,
 FlorianSchandinat@gmx.de, alchark@gmail.com, krzk@kernel.org
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 08/14] fbdev/omap2: Include <linux/export.h>
Date: Thu, 12 Jun 2025 10:16:31 +0200
Message-ID: <20250612081738.197826-9-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250612081738.197826-1-tzimmermann@suse.de>
References: <20250612081738.197826-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 328211F834
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 FREEMAIL_TO(0.00)[gmx.de,c64.rulez.org,ffwll.ch,armlinux.org.uk,gmail.com,kernel.org];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 RCPT_COUNT_TWELVE(0.00)[12]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FROM_HAS_DN(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
 FROM_EQ_ENVFROM(0.00)[];
 R_RATELIMIT(0.00)[to_ip_from(RLwqwbgho3bgbo9wb3ecq1qfng)];
 RCVD_TLS_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 TO_DN_SOME(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]
X-Spam-Score: -3.01
X-Spam-Level: 
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

Fix the compile-time warnings

  drivers/video/fbdev/omap2/omapfb/dss/apply.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/video/fbdev/omap2/omapfb/dss/core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/video/fbdev/omap2/omapfb/dss/dispc-compat.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/video/fbdev/omap2/omapfb/dss/display.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/video/fbdev/omap2/omapfb/dss/dss-of.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/video/fbdev/omap2/omapfb/dss/dss_features.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/video/fbdev/omap2/omapfb/dss/manager.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/video/fbdev/omap2/omapfb/dss/output.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/video/fbdev/omap2/omapfb/dss/overlay.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/video/fbdev/omap2/omapfb/dss/venc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/video/fbdev/omap2/omapfb/vrfb.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/omap2/omapfb/dss/apply.c        | 1 +
 drivers/video/fbdev/omap2/omapfb/dss/core.c         | 1 +
 drivers/video/fbdev/omap2/omapfb/dss/dispc-compat.c | 1 +
 drivers/video/fbdev/omap2/omapfb/dss/display.c      | 1 +
 drivers/video/fbdev/omap2/omapfb/dss/dss-of.c       | 1 +
 drivers/video/fbdev/omap2/omapfb/dss/dss_features.c | 1 +
 drivers/video/fbdev/omap2/omapfb/dss/manager.c      | 1 +
 drivers/video/fbdev/omap2/omapfb/dss/output.c       | 1 +
 drivers/video/fbdev/omap2/omapfb/dss/overlay.c      | 1 +
 drivers/video/fbdev/omap2/omapfb/dss/venc.c         | 1 +
 drivers/video/fbdev/omap2/omapfb/vrfb.c             | 1 +
 11 files changed, 11 insertions(+)

diff --git a/drivers/video/fbdev/omap2/omapfb/dss/apply.c b/drivers/video/fbdev/omap2/omapfb/dss/apply.c
index acca991c7540..39947e569a54 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/apply.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/apply.c
@@ -6,6 +6,7 @@
 
 #define DSS_SUBSYS_NAME "APPLY"
 
+#include <linux/export.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/slab.h>
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/core.c b/drivers/video/fbdev/omap2/omapfb/dss/core.c
index 55b640f2f245..02ea41f6c8f4 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/core.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/core.c
@@ -15,6 +15,7 @@
 #include <linux/module.h>
 #include <linux/clk.h>
 #include <linux/err.h>
+#include <linux/export.h>
 #include <linux/platform_device.h>
 #include <linux/seq_file.h>
 #include <linux/debugfs.h>
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dispc-compat.c b/drivers/video/fbdev/omap2/omapfb/dss/dispc-compat.c
index cc2ad787d493..7831c6a2eedb 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/dispc-compat.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/dispc-compat.c
@@ -6,6 +6,7 @@
 
 #define DSS_SUBSYS_NAME "APPLY"
 
+#include <linux/export.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/slab.h>
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/display.c b/drivers/video/fbdev/omap2/omapfb/dss/display.c
index f91db94c9905..16543425bd84 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/display.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/display.c
@@ -11,6 +11,7 @@
 
 #define DSS_SUBSYS_NAME "DISPLAY"
 
+#include <linux/export.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/jiffies.h>
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c b/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c
index 7c636db79882..f90a8eff7259 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c
@@ -6,6 +6,7 @@
 
 #include <linux/device.h>
 #include <linux/err.h>
+#include <linux/export.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_graph.h>
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dss_features.c b/drivers/video/fbdev/omap2/omapfb/dss/dss_features.c
index 62c2d48d9e09..38be57ba8c28 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/dss_features.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/dss_features.c
@@ -6,6 +6,7 @@
  * Author: Archit Taneja <archit@ti.com>
  */
 
+#include <linux/export.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/types.h>
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/manager.c b/drivers/video/fbdev/omap2/omapfb/dss/manager.c
index 2c2da35345d0..c59e5689d6cc 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/manager.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/manager.c
@@ -11,6 +11,7 @@
 
 #define DSS_SUBSYS_NAME "MANAGER"
 
+#include <linux/export.h>
 #include <linux/kernel.h>
 #include <linux/slab.h>
 #include <linux/module.h>
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/output.c b/drivers/video/fbdev/omap2/omapfb/dss/output.c
index 4e2992a0ce50..48cbfb75443f 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/output.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/output.c
@@ -4,6 +4,7 @@
  * Author: Archit Taneja <archit@ti.com>
  */
 
+#include <linux/export.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/overlay.c b/drivers/video/fbdev/omap2/omapfb/dss/overlay.c
index 8c8e627da13d..bbbdc233ee61 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/overlay.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/overlay.c
@@ -14,6 +14,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/err.h>
+#include <linux/export.h>
 #include <linux/sysfs.h>
 #include <linux/platform_device.h>
 #include <linux/delay.h>
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/venc.c b/drivers/video/fbdev/omap2/omapfb/dss/venc.c
index f99dda9e55a5..ed283029ad95 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/venc.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/venc.c
@@ -14,6 +14,7 @@
 #include <linux/module.h>
 #include <linux/clk.h>
 #include <linux/err.h>
+#include <linux/export.h>
 #include <linux/io.h>
 #include <linux/mutex.h>
 #include <linux/completion.h>
diff --git a/drivers/video/fbdev/omap2/omapfb/vrfb.c b/drivers/video/fbdev/omap2/omapfb/vrfb.c
index 568e6e1eca62..675482cde519 100644
--- a/drivers/video/fbdev/omap2/omapfb/vrfb.c
+++ b/drivers/video/fbdev/omap2/omapfb/vrfb.c
@@ -9,6 +9,7 @@
 /*#define DEBUG*/
 
 #include <linux/err.h>
+#include <linux/export.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/ioport.h>
-- 
2.49.0

