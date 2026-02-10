Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cF/aLeb9imlyPAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 10:44:06 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D414E11907B
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 10:44:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79409890CE;
	Tue, 10 Feb 2026 09:44:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="hcDEE08C";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="NmLPCIom";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hcDEE08C";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="NmLPCIom";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33D8B890CE
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 09:44:02 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D94953E71A;
 Tue, 10 Feb 2026 09:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1770716640; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=tp3/7kKxJDVlRvvsjIgvoPaEEEKscWloYkrvsVEjZHE=;
 b=hcDEE08C1a3jFjodQfaDRnjcuN0J+P4rySv94+rMLfv+dF/aQTWKSYa6SyhpwTT78lAURP
 0TItJ4I0/nE+bfPqf/sM7VCXcbz2+gcggL//B714Ea/3559juWCE7KDf7ke9oMk0eHC5mK
 P3JodqwGO09oKBRhBjiWRDJEoayF4c4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1770716640;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=tp3/7kKxJDVlRvvsjIgvoPaEEEKscWloYkrvsVEjZHE=;
 b=NmLPCIomJCnWzsQ8lacx4be3R8WAuL51yRIPlSjT5tcdaIJXVHMT6PJMAoMBxTAEwAdDQS
 ncMcjzpe3FEiPyCg==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=hcDEE08C;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=NmLPCIom
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1770716640; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=tp3/7kKxJDVlRvvsjIgvoPaEEEKscWloYkrvsVEjZHE=;
 b=hcDEE08C1a3jFjodQfaDRnjcuN0J+P4rySv94+rMLfv+dF/aQTWKSYa6SyhpwTT78lAURP
 0TItJ4I0/nE+bfPqf/sM7VCXcbz2+gcggL//B714Ea/3559juWCE7KDf7ke9oMk0eHC5mK
 P3JodqwGO09oKBRhBjiWRDJEoayF4c4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1770716640;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=tp3/7kKxJDVlRvvsjIgvoPaEEEKscWloYkrvsVEjZHE=;
 b=NmLPCIomJCnWzsQ8lacx4be3R8WAuL51yRIPlSjT5tcdaIJXVHMT6PJMAoMBxTAEwAdDQS
 ncMcjzpe3FEiPyCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A77DE3EA62;
 Tue, 10 Feb 2026 09:44:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id tvCqJ+D9imlbMAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 10 Feb 2026 09:44:00 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH] fbcon: Declare struct fb_info.fbcon_par as of type struct
 fbcon_par
Date: Tue, 10 Feb 2026 10:43:32 +0100
Message-ID: <20260210094356.23645-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -3.01
X-Spam-Level: 
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:deller@gmx.de,m:linux-fbdev@vger.kernel.org,m:tzimmermann@suse.de,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmx.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[suse.de:+];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,suse.de:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: D414E11907B
X-Rspamd-Action: no action

The only correct type for the field fbcon_par in struct fb_info
is struct fbcon_par. Declare is as such. The field is a pointer
to fbcon-private data.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 include/linux/fb.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/linux/fb.h b/include/linux/fb.h
index 65fb70382675..b8b6f54f3312 100644
--- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -18,6 +18,7 @@ struct backlight_device;
 struct device;
 struct device_node;
 struct fb_info;
+struct fbcon_par;
 struct file;
 struct i2c_adapter;
 struct inode;
@@ -506,7 +507,7 @@ struct fb_info {
 #define FBINFO_STATE_RUNNING	0
 #define FBINFO_STATE_SUSPENDED	1
 	u32 state;			/* Hardware state i.e suspend */
-	void *fbcon_par;                /* fbcon use-only private area */
+	struct fbcon_par *fbcon_par;    /* fbcon use-only private area */
 	/* From here on everything is device dependent */
 	void *par;
 
-- 
2.52.0

