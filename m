Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B66AD3464
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 13:03:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20D5D10E505;
	Tue, 10 Jun 2025 11:03:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="rlhvlR+U";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="l1WVTku3";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rlhvlR+U";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="l1WVTku3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A88010E505
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 11:03:45 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 73BC11F852;
 Tue, 10 Jun 2025 11:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1749553406; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G3FyHIoikmcz/gU+8T29N/Q9anRoC0fTRgVb+97m9RA=;
 b=rlhvlR+UiKVZj1BbdntIP2jXL3lI4ixzg4F90ypK71Vn+GQOfgTql9fgNwZZlWIp31lvbE
 q7aTFRD+h11hzPt50I4roVy06UHPh+n8LxuXbzJdkTuOAxUlDrCkHlhi+yhwaQjjoBdV9w
 iTxJg0njiSIn5fPuccpHCeXO00T5IUE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1749553406;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G3FyHIoikmcz/gU+8T29N/Q9anRoC0fTRgVb+97m9RA=;
 b=l1WVTku3H5tVEG7Ao1t2VB12ojtE0QsoQX0AjzmYFuDmEbu2Z3nqmX4FlDPTew+bdXqhMm
 TQY9kLMgaDyMwTDA==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=rlhvlR+U;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=l1WVTku3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1749553406; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G3FyHIoikmcz/gU+8T29N/Q9anRoC0fTRgVb+97m9RA=;
 b=rlhvlR+UiKVZj1BbdntIP2jXL3lI4ixzg4F90ypK71Vn+GQOfgTql9fgNwZZlWIp31lvbE
 q7aTFRD+h11hzPt50I4roVy06UHPh+n8LxuXbzJdkTuOAxUlDrCkHlhi+yhwaQjjoBdV9w
 iTxJg0njiSIn5fPuccpHCeXO00T5IUE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1749553406;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G3FyHIoikmcz/gU+8T29N/Q9anRoC0fTRgVb+97m9RA=;
 b=l1WVTku3H5tVEG7Ao1t2VB12ojtE0QsoQX0AjzmYFuDmEbu2Z3nqmX4FlDPTew+bdXqhMm
 TQY9kLMgaDyMwTDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2490213A17;
 Tue, 10 Jun 2025 11:03:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id GHCTB/4QSGgOTAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 10 Jun 2025 11:03:26 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de, soci@c64.rulez.org, simona@ffwll.ch, jayalk@intworks.biz,
 linux@armlinux.org.uk, FlorianSchandinat@gmx.de, alchark@gmail.com,
 krzk@kernel.org
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 09/14] fbdev/omap2: Do not include <linux/export.h>
Date: Tue, 10 Jun 2025 12:56:42 +0200
Message-ID: <20250610105948.384540-10-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250610105948.384540-1-tzimmermann@suse.de>
References: <20250610105948.384540-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; RCPT_COUNT_TWELVE(0.00)[13];
 FREEMAIL_TO(0.00)[gmx.de,c64.rulez.org,ffwll.ch,intworks.biz,armlinux.org.uk,gmail.com,kernel.org];
 FUZZY_BLOCKED(0.00)[rspamd.com]; MIME_TRACE(0.00)[0:+];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 ARC_NA(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 R_RATELIMIT(0.00)[to_ip_from(RLwqwbgho3bgbo9wb3ecq1qfng)];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
 FROM_EQ_ENVFROM(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 FROM_HAS_DN(0.00)[]; RCVD_TLS_ALL(0.00)[]; TO_DN_SOME(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 73BC11F852
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -3.01
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

  drivers/video/fbdev/omap2/omapfb/dss/dpi.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
  drivers/video/fbdev/omap2/omapfb/dss/sdi.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
  drivers/video/fbdev/omap2/omapfb/omapfb-ioctl.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/omap2/omapfb/dss/dpi.c      | 1 -
 drivers/video/fbdev/omap2/omapfb/dss/sdi.c      | 1 -
 drivers/video/fbdev/omap2/omapfb/omapfb-ioctl.c | 1 -
 3 files changed, 3 deletions(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dpi.c b/drivers/video/fbdev/omap2/omapfb/dss/dpi.c
index 86ed4c077c30..ad8ae1727966 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/dpi.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/dpi.c
@@ -13,7 +13,6 @@
 
 #include <linux/kernel.h>
 #include <linux/delay.h>
-#include <linux/export.h>
 #include <linux/err.h>
 #include <linux/errno.h>
 #include <linux/platform_device.h>
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/sdi.c b/drivers/video/fbdev/omap2/omapfb/dss/sdi.c
index 2d3e5d4467c5..68e569ec0f83 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/sdi.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/sdi.c
@@ -12,7 +12,6 @@
 #include <linux/delay.h>
 #include <linux/err.h>
 #include <linux/regulator/consumer.h>
-#include <linux/export.h>
 #include <linux/platform_device.h>
 #include <linux/string.h>
 #include <linux/of.h>
diff --git a/drivers/video/fbdev/omap2/omapfb/omapfb-ioctl.c b/drivers/video/fbdev/omap2/omapfb/omapfb-ioctl.c
index ea8c88aa4477..152dbeaa6451 100644
--- a/drivers/video/fbdev/omap2/omapfb/omapfb-ioctl.c
+++ b/drivers/video/fbdev/omap2/omapfb/omapfb-ioctl.c
@@ -16,7 +16,6 @@
 #include <linux/mm.h>
 #include <linux/omapfb.h>
 #include <linux/vmalloc.h>
-#include <linux/export.h>
 #include <linux/sizes.h>
 
 #include <video/omapfb_dss.h>
-- 
2.49.0

