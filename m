Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oKnBIWj+gWmYNgMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 14:55:52 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B26DA3D5
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 14:55:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39D6210E67E;
	Tue,  3 Feb 2026 13:55:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="tAbGSvkk";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xxEgkmpn";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tAbGSvkk";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xxEgkmpn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2721110E67E
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Feb 2026 13:55:49 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id CF99F5BCCE;
 Tue,  3 Feb 2026 13:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1770126929; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Qw+rNVDeI6QXcb+Gq77DKNfmbVsdqpnDsYMcvjnwoFA=;
 b=tAbGSvkke1HRLYCwaVhb0DrlQglWX7cv54hCqZqtIJSWaS4JzUH7Gn6s1wCRCmxg6yd6Ud
 UF/nhOmg/ukbKXiIbKueC4pwMvltbJn6PZoA2i0qUpd5EvRQpTTKna9dW4wezPqbHZ+2ai
 y4sTtGbhppipSW+GnmP/uPESHgzerw8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1770126929;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Qw+rNVDeI6QXcb+Gq77DKNfmbVsdqpnDsYMcvjnwoFA=;
 b=xxEgkmpnMQp5Xg6ZD7D42De9tWvcptz488mEvFBYlAFmbC7qwRW8iJhMrSZUR2ajyWHyS6
 SczKcNyjvEOFhAAg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1770126929; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Qw+rNVDeI6QXcb+Gq77DKNfmbVsdqpnDsYMcvjnwoFA=;
 b=tAbGSvkke1HRLYCwaVhb0DrlQglWX7cv54hCqZqtIJSWaS4JzUH7Gn6s1wCRCmxg6yd6Ud
 UF/nhOmg/ukbKXiIbKueC4pwMvltbJn6PZoA2i0qUpd5EvRQpTTKna9dW4wezPqbHZ+2ai
 y4sTtGbhppipSW+GnmP/uPESHgzerw8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1770126929;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Qw+rNVDeI6QXcb+Gq77DKNfmbVsdqpnDsYMcvjnwoFA=;
 b=xxEgkmpnMQp5Xg6ZD7D42De9tWvcptz488mEvFBYlAFmbC7qwRW8iJhMrSZUR2ajyWHyS6
 SczKcNyjvEOFhAAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 77B0D3EA62;
 Tue,  3 Feb 2026 13:55:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 6DYLHFH+gWlGDwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 03 Feb 2026 13:55:29 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: tzungbi@kernel.org, briannorris@chromium.org, jwerner@chromium.org,
 javierm@redhat.com, samuel@sholland.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch
Cc: chrome-platform@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 09/12] firmware: google: Pack structures for coreboot table
 entries
Date: Tue,  3 Feb 2026 14:52:28 +0100
Message-ID: <20260203135519.417931-10-tzimmermann@suse.de>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260203135519.417931-1-tzimmermann@suse.de>
References: <20260203135519.417931-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -2.80
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
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:tzungbi@kernel.org,m:briannorris@chromium.org,m:jwerner@chromium.org,m:javierm@redhat.com,m:samuel@sholland.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:chrome-platform@lists.linux.dev,m:tzimmermann@suse.de,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,chromium.org,redhat.com,sholland.org,linux.intel.com,gmail.com,ffwll.ch];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,suse.de:email,suse.de:dkim,suse.de:mid]
X-Rspamd-Queue-Id: 20B26DA3D5
X-Rspamd-Action: no action

Pack the fields in the coreboot table entries. These entries are part of
the coreboot ABI, so they don't follow regular calling conventions. Fields
of type u64 are aligned to boundaries of 4 bytes instead of 8. [1]

So far this has not been a problem. In the future, padding bytes should
be added where explicit alignment is required.

v2:
- use aligned 64-bit type instead of __packed__ attribute (Julius)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Link: https://github.com/coreboot/coreboot/blob/main/payloads/libpayload/include/coreboot_tables.h#L96 # [1]
Suggested-by: Julius Werner <jwerner@chromium.org>
Acked-by: Julius Werner <jwerner@chromium.org>
---
 include/linux/coreboot.h | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/include/linux/coreboot.h b/include/linux/coreboot.h
index 48705b439c6e..5746b99a070d 100644
--- a/include/linux/coreboot.h
+++ b/include/linux/coreboot.h
@@ -12,8 +12,11 @@
 #ifndef _LINUX_COREBOOT_H
 #define _LINUX_COREBOOT_H
 
+#include <linux/compiler_attributes.h>
 #include <linux/types.h>
 
+typedef __aligned(4) u64 cb_u64;
+
 /* List of coreboot entry structures that is used */
 
 #define CB_TAG_FRAMEBUFFER 0x12
@@ -30,7 +33,7 @@ struct lb_cbmem_ref {
 	u32 tag;
 	u32 size;
 
-	u64 cbmem_addr;
+	cb_u64 cbmem_addr;
 };
 
 /* Corresponds to LB_TAG_CBMEM_ENTRY */
@@ -38,7 +41,7 @@ struct lb_cbmem_entry {
 	u32 tag;
 	u32 size;
 
-	u64 address;
+	cb_u64 address;
 	u32 entry_size;
 	u32 id;
 };
@@ -48,7 +51,7 @@ struct lb_framebuffer {
 	u32 tag;
 	u32 size;
 
-	u64 physical_address;
+	cb_u64 physical_address;
 	u32 x_resolution;
 	u32 y_resolution;
 	u32 bytes_per_line;
-- 
2.52.0

