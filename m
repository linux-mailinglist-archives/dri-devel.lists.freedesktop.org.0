Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sLIUFRHuhWlvIQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 14:35:13 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C61FE30B
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 14:35:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFF3D10E6E7;
	Fri,  6 Feb 2026 13:35:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="nliEVrLI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PdTG2bLa";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="nliEVrLI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PdTG2bLa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C620910E6E6
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Feb 2026 13:35:09 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id DA5FC5BCC9;
 Fri,  6 Feb 2026 13:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1770384902; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=COcTxUbuBRKCnWcfnJkJVVRmPPV1XoNZPS/P7E/B+is=;
 b=nliEVrLIkOlMQ9uWeZbuIw5meHbu/2SMsoiTDcl9Y1udWnzzobL82lR8yVId/mpG4KkBM2
 3JrDHJUxu3aFoCntFmTnba6oe7DoLfD/6JW1Tukv/nwHbr4UM8fUpKQy7kij/9jORqtnR3
 gpGfaLsErcRV2fr0nTMdfIoIWnzX+C0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1770384902;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=COcTxUbuBRKCnWcfnJkJVVRmPPV1XoNZPS/P7E/B+is=;
 b=PdTG2bLaUX70+gNBoLcQG/TDRV7rYqclLtxtlEt3JdKAANBfLo8o1qSlmJpEKGgJ5yT6Cj
 L5OO1BkmoId9GEAw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1770384902; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=COcTxUbuBRKCnWcfnJkJVVRmPPV1XoNZPS/P7E/B+is=;
 b=nliEVrLIkOlMQ9uWeZbuIw5meHbu/2SMsoiTDcl9Y1udWnzzobL82lR8yVId/mpG4KkBM2
 3JrDHJUxu3aFoCntFmTnba6oe7DoLfD/6JW1Tukv/nwHbr4UM8fUpKQy7kij/9jORqtnR3
 gpGfaLsErcRV2fr0nTMdfIoIWnzX+C0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1770384902;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=COcTxUbuBRKCnWcfnJkJVVRmPPV1XoNZPS/P7E/B+is=;
 b=PdTG2bLaUX70+gNBoLcQG/TDRV7rYqclLtxtlEt3JdKAANBfLo8o1qSlmJpEKGgJ5yT6Cj
 L5OO1BkmoId9GEAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 974763EA65;
 Fri,  6 Feb 2026 13:35:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id wJ6vIwbuhWnncwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 06 Feb 2026 13:35:02 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: patrik.r.jakobsson@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 2/5] drm/gma500: fbdev: Set framebuffer size to GEM object size
Date: Fri,  6 Feb 2026 14:21:55 +0100
Message-ID: <20260206133458.226467-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260206133458.226467-1-tzimmermann@suse.de>
References: <20260206133458.226467-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -1.30
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,suse.de:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: E1C61FE30B
X-Rspamd-Action: no action

Framebuffer emulation sets the size of the available memory to the
value that has been requested. As the allocated GEM buffer object
acts as full framebuffer memory, set the size to the value of the
actually allocated buffer.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/gma500/fbdev.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/gma500/fbdev.c b/drivers/gpu/drm/gma500/fbdev.c
index c26926babc2a..f5e60ada6de2 100644
--- a/drivers/gpu/drm/gma500/fbdev.c
+++ b/drivers/gpu/drm/gma500/fbdev.c
@@ -171,12 +171,12 @@ int psb_fbdev_driver_fbdev_probe(struct drm_fb_helper *fb_helper,
 
 	/* Accessed stolen memory directly */
 	info->screen_base = dev_priv->vram_addr + backing->offset;
-	info->screen_size = size;
+	info->screen_size = obj->size;
 
 	drm_fb_helper_fill_info(info, fb_helper, sizes);
 
 	info->fix.smem_start = dev_priv->stolen_base + backing->offset;
-	info->fix.smem_len = size;
+	info->fix.smem_len = obj->size;
 	info->fix.ywrapstep = 0;
 	info->fix.ypanstep = 0;
 	info->fix.mmio_start = pci_resource_start(pdev, 0);
-- 
2.52.0

