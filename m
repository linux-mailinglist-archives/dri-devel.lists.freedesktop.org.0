Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eIG6Cg/uhWlvIQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 14:35:11 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF498FE2FE
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 14:35:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D76A610E6D0;
	Fri,  6 Feb 2026 13:35:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="tlUrwNNL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Nmq1C7wp";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="npzWHS5n";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3FBuBta0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4CE210E6D0
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Feb 2026 13:35:04 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5E5043E6D0;
 Fri,  6 Feb 2026 13:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1770384903; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=WhgmwDf8wocWSSAiH0Y9kxrFIfNPyzJAeHYwjcu7Mv8=;
 b=tlUrwNNLmi1lsMaleB6KkNHuwZiwNb9Hk4p+TVkoSwqGhkgHFJ4fo0P/hSfW2l4KgLDrnZ
 IMYQDP5dKs2AD80oBVda97hEglHp/ntAVIz/V4kgR7hOZh530upJg2+1j5lu/jqsgMc6e7
 DknbQBz7167QgP62IJDCHZvqCMLgoGc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1770384903;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=WhgmwDf8wocWSSAiH0Y9kxrFIfNPyzJAeHYwjcu7Mv8=;
 b=Nmq1C7wpzaZX1EEoMOrhslBhFkJMqgBShXZTlGV+Ne2CPf0ksv3s8DqD655WvCrllQcgEd
 n2QpW2tLmT3OugDQ==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=npzWHS5n;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=3FBuBta0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1770384902; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=WhgmwDf8wocWSSAiH0Y9kxrFIfNPyzJAeHYwjcu7Mv8=;
 b=npzWHS5nYcDm6fWsY9wJR7wWbUedhtpsPwzrRmrvr+rDIKHABwmMcojdQ9oOWvE3VaNYTA
 o1B6Gdc+HeMlQ5wFUQO2jZsi+RJznjoGoSmoe40DOfB+btx5wuhHVBbTRyBTUvxnyQvSZj
 0KxOXRjhGwRBFH12uz1etkOsik4s9X8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1770384902;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=WhgmwDf8wocWSSAiH0Y9kxrFIfNPyzJAeHYwjcu7Mv8=;
 b=3FBuBta0BI6XXWq0HVWbf6zAoq9kYPvEk4UyM1lHQJKXLGKQU42zXhW+AvcyWrYwCieebi
 3Y+pbQSuZYdK0pCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1EF053EA63;
 Fri,  6 Feb 2026 13:35:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id u3YCBgbuhWnncwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 06 Feb 2026 13:35:02 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: patrik.r.jakobsson@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 0/5] drm/gma500: fbdev: Use client buffers
Date: Fri,  6 Feb 2026 14:21:53 +0100
Message-ID: <20260206133458.226467-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -1.51
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,linux.intel.com,kernel.org,ffwll.ch];
	FORGED_RECIPIENTS(0.00)[m:patrik.r.jakobsson@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:tzimmermann@suse.de,m:patrikrjakobsson@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[suse.de:+];
	NEURAL_HAM(-0.00)[-0.986];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,suse.de:mid,suse.de:dkim]
X-Rspamd-Queue-Id: BF498FE2FE
X-Rspamd-Action: no action

A client buffer holds the DRM framebuffer for an in-kernel DRM
client. So far, gma500 has created an internal ad-hoc framebuffer
for its fbdev emulation, while by-passing the regular interfaces
used by user-space compositors.

Replacing the existing code with a client buffer allows for stream-
lining gma500 code and later also the fbdev helpers. The new framebuffer
will be registered against the client's file and will support handles
for GEM objects. This is then just another framebuffer within the DRM
ecosystem.

As there's still a custom GEM buffer object involved, patch 1 exports
an interface to create a client buffer around it.

Patches 2 and 3 update size calculation in gma500's fbdev emulation and
makes it use the helpers provided by DRM.

Patch 4 converts the code to client buffers and patch 5 removes the
now-unused framebuffer code.

Tested on an Atom N2800 Cedarview system.

Thomas Zimmermann (5):
  drm/client: Export drm_client_buffer_create()
  drm/gma500: fbdev: Set framebuffer size to GEM object size
  drm/gma500: fbdev: Calculate buffer geometry with format helpers
  drm/gma500: fbdev: Use a DRM client buffer
  drm/gma500: Create framebuffers with drm_gem_fb_create()

 drivers/gpu/drm/drm_client.c         |   3 +-
 drivers/gpu/drm/gma500/fbdev.c       | 101 +++++++++++++-------------
 drivers/gpu/drm/gma500/framebuffer.c | 104 +++------------------------
 drivers/gpu/drm/gma500/psb_drv.h     |   6 --
 include/drm/drm_client.h             |   3 +
 5 files changed, 64 insertions(+), 153 deletions(-)

-- 
2.52.0

