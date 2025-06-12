Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB10AD7010
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 14:20:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6EFE10E817;
	Thu, 12 Jun 2025 12:20:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="I4oG1S4F";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JY2IgPiy";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="FaOui+iT";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/6dA76Xo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78C4810E81D
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 12:20:33 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id EC8861F7ED;
 Thu, 12 Jun 2025 12:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1749730822; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XJUBx8LSDc6/YKZXC8M7VQ4VUZf2nvg94yG3ot8viUg=;
 b=I4oG1S4FGVfLd6fDC/a4n6kc/3Q9V6CEvg7Y2l0EOkTTf4BXhd3OQYHc9eWU8QvOfNZwGq
 AcgIjzZHYI+G7nhWDcrR+GBxXnHCBBuoslHUTjL43W0sqkN0EDnTVPJJzLKrLyt//AzGoH
 ykD/4qtJc99/HU4fnAu2A1K9bmP5dII=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1749730822;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XJUBx8LSDc6/YKZXC8M7VQ4VUZf2nvg94yG3ot8viUg=;
 b=JY2IgPiyn7EUXZIg4g3z7QUL+x+j4lhXs5qmX53ga5lPVo1btLkQtKkmYSK6t8O1DK+Yfq
 5sv9S88ZYL72ykCg==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=FaOui+iT;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="/6dA76Xo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1749730821; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XJUBx8LSDc6/YKZXC8M7VQ4VUZf2nvg94yG3ot8viUg=;
 b=FaOui+iTjWRGs8l1tAvJB0jjROJ6V1BzgArDA2665QmeVhuxrGrsUu4sP1h5IOAS6gO71n
 mL99Mv/cKcTRbOSYlz49X8J+y5e4rR16NPy033PoGg24j1//T/20NEOeKXyn2aiVSGI3rN
 ComDLNwOkDYF3nLJL9qBTvNZpW9ZYuI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1749730821;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XJUBx8LSDc6/YKZXC8M7VQ4VUZf2nvg94yG3ot8viUg=;
 b=/6dA76Xout2cNTIHbVbJkHPcno0bynCFIoGNLuB1ksKitvMidsoYjFwq6zkilpKutgXXlK
 g8C76orSifoTlcAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 86CE613A6D;
 Thu, 12 Jun 2025 12:20:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id KCUcHgXGSmhBdAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 12 Jun 2025 12:20:21 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: simona.vetter@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 8/9] drm/scheduler: Include <linux/export.h>
Date: Thu, 12 Jun 2025 14:10:02 +0200
Message-ID: <20250612121633.229222-9-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250612121633.229222-1-tzimmermann@suse.de>
References: <20250612121633.229222-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: EC8861F7ED
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; MIME_TRACE(0.00)[0:+];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,kernel.org,linux.intel.com];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:dkim,suse.de:email];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_FIVE(0.00)[6];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DKIM_TRACE(0.00)[suse.de:+]
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

  drivers/gpu/drm/scheduler/sched_entity.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/gpu/drm/scheduler/sched_fence.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/gpu/drm/scheduler/sched_main.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/scheduler/sched_entity.c | 1 +
 drivers/gpu/drm/scheduler/sched_fence.c  | 1 +
 drivers/gpu/drm/scheduler/sched_main.c   | 1 +
 3 files changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index 86214b6e02d7..5635b3a826d8 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -21,6 +21,7 @@
  *
  */
 
+#include <linux/export.h>
 #include <linux/slab.h>
 #include <linux/completion.h>
 
diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
index 725de257d60d..9391d6f0dc01 100644
--- a/drivers/gpu/drm/scheduler/sched_fence.c
+++ b/drivers/gpu/drm/scheduler/sched_fence.c
@@ -21,6 +21,7 @@
  *
  */
 
+#include <linux/export.h>
 #include <linux/module.h>
 #include <linux/sched.h>
 #include <linux/slab.h>
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index d20726d7adf0..c63543132f9d 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -66,6 +66,7 @@
  * This implies waiting for previously executed jobs.
  */
 
+#include <linux/export.h>
 #include <linux/wait.h>
 #include <linux/sched.h>
 #include <linux/completion.h>
-- 
2.49.0

