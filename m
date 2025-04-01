Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2980FA7802E
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 18:23:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78D4D10E615;
	Tue,  1 Apr 2025 16:23:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="0heUIQPH";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wXZ/BwH7";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0heUIQPH";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wXZ/BwH7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E35C10E612
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Apr 2025 16:23:36 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8DC992118F;
 Tue,  1 Apr 2025 16:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1743524586; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X4BYspz9+3MvxwJVQE2BCJ+rAeEuclKaQiVs4KujwFs=;
 b=0heUIQPHbILEVDibO+vKkEDPxNjbIMkJxKYSXQ8hX0sGKo7/nn3RJfLRFoQNOykhtD+ZAd
 At2JXK0mU94dJsMjlzurQ3aZagD8LHLKHo8Y1hImnBzZQmWmJGuQ79zrftxBzCvj2HdOdm
 daLAJtK0lcyyzetbNxsAp5mhpfEoflU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1743524586;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X4BYspz9+3MvxwJVQE2BCJ+rAeEuclKaQiVs4KujwFs=;
 b=wXZ/BwH7c86HtV6zQr4seW9r3prRf7l5M5I00RFr1oF7t9PgbDaahgf4B9vgKJXn3Simzb
 RmfgpUA6VNeiwqDQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1743524586; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X4BYspz9+3MvxwJVQE2BCJ+rAeEuclKaQiVs4KujwFs=;
 b=0heUIQPHbILEVDibO+vKkEDPxNjbIMkJxKYSXQ8hX0sGKo7/nn3RJfLRFoQNOykhtD+ZAd
 At2JXK0mU94dJsMjlzurQ3aZagD8LHLKHo8Y1hImnBzZQmWmJGuQ79zrftxBzCvj2HdOdm
 daLAJtK0lcyyzetbNxsAp5mhpfEoflU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1743524586;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X4BYspz9+3MvxwJVQE2BCJ+rAeEuclKaQiVs4KujwFs=;
 b=wXZ/BwH7c86HtV6zQr4seW9r3prRf7l5M5I00RFr1oF7t9PgbDaahgf4B9vgKJXn3Simzb
 RmfgpUA6VNeiwqDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6625F138A5;
 Tue,  1 Apr 2025 16:23:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id ODrGF+oS7GdxDAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 01 Apr 2025 16:23:06 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com,
	sean@poorly.run,
	patrik.r.jakobsson@gmail.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 6/9] drm/udl: Return error if vendor descriptor is too short
Date: Tue,  1 Apr 2025 18:12:16 +0200
Message-ID: <20250401161929.283244-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250401161929.283244-1-tzimmermann@suse.de>
References: <20250401161929.283244-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -5.30
X-Spamd-Result: default: False [-5.30 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; SUSPICIOUS_RECIPS(1.50)[];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain];
 FREEMAIL_TO(0.00)[redhat.com,poorly.run,gmail.com];
 MIME_TRACE(0.00)[0:+]; TO_DN_SOME(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; TAGGED_RCPT(0.00)[];
 ARC_NA(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_FIVE(0.00)[5]; RCVD_TLS_ALL(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
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

There need to be least 5 bytes in the vendor descriptor. Return
an error otherwise. Also change the branching to early-out on
the error. Adjust indention of the rest of the parser function.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/udl/udl_main.c | 72 +++++++++++++++++-----------------
 1 file changed, 36 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/udl/udl_main.c b/drivers/gpu/drm/udl/udl_main.c
index 4291ddb7158c4..58d6065589d3a 100644
--- a/drivers/gpu/drm/udl/udl_main.c
+++ b/drivers/gpu/drm/udl/udl_main.c
@@ -45,43 +45,43 @@ static int udl_parse_vendor_descriptor(struct udl_device *udl)
 		goto unrecognized;
 	len = ret;
 
-	if (len > 5) {
-		DRM_INFO("vendor descriptor length: %u data:%11ph\n",
-			 len, desc);
-
-		if ((desc[0] != len) ||    /* descriptor length */
-		    (desc[1] != 0x5f) ||   /* vendor descriptor type */
-		    (desc[2] != 0x01) ||   /* version (2 bytes) */
-		    (desc[3] != 0x00) ||
-		    (desc[4] != len - 2))  /* length after type */
-			goto unrecognized;
-
-		desc_end = desc + len;
-		desc += 5; /* the fixed header we've already parsed */
-
-		while (desc < desc_end) {
-			u8 length;
-			u16 key;
-
-			key = le16_to_cpu(*((u16 *) desc));
-			desc += sizeof(u16);
-			length = *desc;
-			desc++;
-
-			switch (key) {
-			case 0x0200: { /* max_area */
-				u32 max_area;
-				max_area = le32_to_cpu(*((u32 *)desc));
-				DRM_DEBUG("DL chip limited to %d pixel modes\n",
-					max_area);
-				udl->sku_pixel_limit = max_area;
-				break;
-			}
-			default:
-				break;
-			}
-			desc += length;
+	if (len < 5)
+		goto unrecognized;
+
+	DRM_INFO("vendor descriptor length: %u data:%11ph\n", len, desc);
+
+	if ((desc[0] != len) ||    /* descriptor length */
+	    (desc[1] != 0x5f) ||   /* vendor descriptor type */
+	    (desc[2] != 0x01) ||   /* version (2 bytes) */
+	    (desc[3] != 0x00) ||
+	    (desc[4] != len - 2))  /* length after type */
+		goto unrecognized;
+
+	desc_end = desc + len;
+	desc += 5; /* the fixed header we've already parsed */
+
+	while (desc < desc_end) {
+		u8 length;
+		u16 key;
+
+		key = le16_to_cpu(*((u16 *)desc));
+		desc += sizeof(u16);
+		length = *desc;
+		desc++;
+
+		switch (key) {
+		case 0x0200: { /* max_area */
+			u32 max_area = le32_to_cpu(*((u32 *)desc));
+
+			DRM_DEBUG("DL chip limited to %d pixel modes\n",
+				  max_area);
+			udl->sku_pixel_limit = max_area;
+			break;
+		}
+		default:
+			break;
 		}
+		desc += length;
 	}
 
 	goto success;
-- 
2.49.0

