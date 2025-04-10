Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5960BA8415F
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 13:03:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93A8B10E95B;
	Thu, 10 Apr 2025 11:03:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="Ch3F3myz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="FHg+gKWG";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Ch3F3myz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="FHg+gKWG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 526B810E95B
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 11:03:18 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 82E062117F;
 Thu, 10 Apr 2025 11:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1744282981; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kNEnjrTnrZ7V4c1VlmytJa4LecMLsC2OEmZW2wbag4U=;
 b=Ch3F3myzZetps6AgbEBAAhL7Z4KTxyGnp/p8c29dQyBwwrG0UKIqccQs0oFWHs1LuNjRuB
 HqA9VATRYmF2la0cLNoZjV43k1R2xNskLvlqZKZF/q5tqn4BRC8qXZK43vW3PjlGxgsNLz
 R3BqrPFhMBwQmvfBGYK0Fr1cmN7utfA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1744282981;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kNEnjrTnrZ7V4c1VlmytJa4LecMLsC2OEmZW2wbag4U=;
 b=FHg+gKWG27pYRZcTcpPUnmdOkCfdv6Xe8eURD+IsPHGaSEkkDNVEncypyb4O1DCCAihHqQ
 CWiNgZ+McPCYm+AQ==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Ch3F3myz;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=FHg+gKWG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1744282981; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kNEnjrTnrZ7V4c1VlmytJa4LecMLsC2OEmZW2wbag4U=;
 b=Ch3F3myzZetps6AgbEBAAhL7Z4KTxyGnp/p8c29dQyBwwrG0UKIqccQs0oFWHs1LuNjRuB
 HqA9VATRYmF2la0cLNoZjV43k1R2xNskLvlqZKZF/q5tqn4BRC8qXZK43vW3PjlGxgsNLz
 R3BqrPFhMBwQmvfBGYK0Fr1cmN7utfA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1744282981;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kNEnjrTnrZ7V4c1VlmytJa4LecMLsC2OEmZW2wbag4U=;
 b=FHg+gKWG27pYRZcTcpPUnmdOkCfdv6Xe8eURD+IsPHGaSEkkDNVEncypyb4O1DCCAihHqQ
 CWiNgZ+McPCYm+AQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0EB3A13886;
 Thu, 10 Apr 2025 11:03:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id EE1BAmWl92f3OQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 10 Apr 2025 11:03:01 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com,
	sean@poorly.run,
	patrik.r.jakobsson@gmail.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 7/9] drm/udl: Treat vendor descriptor as u8
Date: Thu, 10 Apr 2025 12:59:04 +0200
Message-ID: <20250410105948.25463-8-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250410105948.25463-1-tzimmermann@suse.de>
References: <20250410105948.25463-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 82E062117F
X-Spam-Score: -1.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 FREEMAIL_TO(0.00)[redhat.com,poorly.run,gmail.com];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 ARC_NA(0.00)[]; TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FROM_HAS_DN(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; TAGGED_RCPT(0.00)[];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
 RCVD_COUNT_TWO(0.00)[2]; DKIM_TRACE(0.00)[suse.de:+];
 FROM_EQ_ENVFROM(0.00)[]; RCVD_TLS_ALL(0.00)[];
 RCPT_COUNT_FIVE(0.00)[5]; FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
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

The vendor descriptor is an array of unsigned bytes. It is raw data
that is not to be modified. Declare it as 'const u8'.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
---
 drivers/gpu/drm/udl/udl_main.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/udl/udl_main.c b/drivers/gpu/drm/udl/udl_main.c
index 58d6065589d3a..d3a04bcb65d25 100644
--- a/drivers/gpu/drm/udl/udl_main.c
+++ b/drivers/gpu/drm/udl/udl_main.c
@@ -28,19 +28,18 @@ static struct urb *udl_get_urb_locked(struct udl_device *udl, long timeout);
 static int udl_parse_vendor_descriptor(struct udl_device *udl)
 {
 	struct usb_device *udev = udl_to_usb_device(udl);
-	char *desc;
-	char *buf;
-	char *desc_end;
+	void *buf;
 	int ret;
 	unsigned int len;
+	const u8 *desc;
+	const u8 *desc_end;
 
 	buf = kzalloc(MAX_VENDOR_DESCRIPTOR_SIZE, GFP_KERNEL);
 	if (!buf)
 		return false;
-	desc = buf;
 
 	ret = usb_get_descriptor(udev, 0x5f, /* vendor specific */
-				 0, desc, MAX_VENDOR_DESCRIPTOR_SIZE);
+				 0, buf, MAX_VENDOR_DESCRIPTOR_SIZE);
 	if (ret < 0)
 		goto unrecognized;
 	len = ret;
@@ -48,6 +47,9 @@ static int udl_parse_vendor_descriptor(struct udl_device *udl)
 	if (len < 5)
 		goto unrecognized;
 
+	desc = buf;
+	desc_end = desc + len;
+
 	DRM_INFO("vendor descriptor length: %u data:%11ph\n", len, desc);
 
 	if ((desc[0] != len) ||    /* descriptor length */
@@ -56,9 +58,7 @@ static int udl_parse_vendor_descriptor(struct udl_device *udl)
 	    (desc[3] != 0x00) ||
 	    (desc[4] != len - 2))  /* length after type */
 		goto unrecognized;
-
-	desc_end = desc + len;
-	desc += 5; /* the fixed header we've already parsed */
+	desc += 5;
 
 	while (desc < desc_end) {
 		u8 length;
-- 
2.49.0

