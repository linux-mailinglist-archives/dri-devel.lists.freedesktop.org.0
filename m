Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF0B7BDF8EA
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 18:08:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1918E10E2C2;
	Wed, 15 Oct 2025 16:08:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="rviJWD5m";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="IGcxhY2T";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rviJWD5m";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="IGcxhY2T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C20A10E2C2
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 16:08:23 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id DCC16210BC;
 Wed, 15 Oct 2025 16:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1760544501; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I6HC34ynM7vkAu7jEV4VW5DKYsiWRFE7jXY5VSzf7m0=;
 b=rviJWD5mjmjwJOaz/8D5xuvSt/85uAin+kAd0KZk8xdmrBqcu4klm1Xuixj2x21d2Qjfdj
 BbY47t8Fu2HjH/VnYq5V3zx4qAoO+SGUfydob4rgMA01M3t301PS4VBqHGnZzw6hAvUKbj
 Dd9jH7Q1v3Vug9OnKcoV6t/KQokhZvc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1760544501;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I6HC34ynM7vkAu7jEV4VW5DKYsiWRFE7jXY5VSzf7m0=;
 b=IGcxhY2T6nh7g7ZF8TTnHtyvhg18E42Dr/MjuAiDMe5brUQpgwYfInnkUO8SjwO/YSHnUl
 lFBcZ2K/gatHbMAg==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=rviJWD5m;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=IGcxhY2T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1760544501; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I6HC34ynM7vkAu7jEV4VW5DKYsiWRFE7jXY5VSzf7m0=;
 b=rviJWD5mjmjwJOaz/8D5xuvSt/85uAin+kAd0KZk8xdmrBqcu4klm1Xuixj2x21d2Qjfdj
 BbY47t8Fu2HjH/VnYq5V3zx4qAoO+SGUfydob4rgMA01M3t301PS4VBqHGnZzw6hAvUKbj
 Dd9jH7Q1v3Vug9OnKcoV6t/KQokhZvc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1760544501;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I6HC34ynM7vkAu7jEV4VW5DKYsiWRFE7jXY5VSzf7m0=;
 b=IGcxhY2T6nh7g7ZF8TTnHtyvhg18E42Dr/MjuAiDMe5brUQpgwYfInnkUO8SjwO/YSHnUl
 lFBcZ2K/gatHbMAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A511D13AE4;
 Wed, 15 Oct 2025 16:08:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id KDHkJvXG72inaQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 15 Oct 2025 16:08:21 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: ardb@kernel.org,
	jonathan@marek.ca,
	javierm@redhat.com
Cc: linux-efi@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 1/5] efi: Fix trailing whitespace in header file
Date: Wed, 15 Oct 2025 17:56:30 +0200
Message-ID: <20251015160816.525825-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251015160816.525825-1-tzimmermann@suse.de>
References: <20251015160816.525825-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: DCC16210BC
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:email,suse.de:mid,suse.de:dkim];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FROM_HAS_DN(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; RCPT_COUNT_SEVEN(0.00)[7];
 FROM_EQ_ENVFROM(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,suse.de:dkim]
X-Rspamd-Action: no action
X-Spam-Flag: NO
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

Resolve an issue with the coding style.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 include/linux/efi.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/efi.h b/include/linux/efi.h
index a98cc39e7aaa..544498c89ced 100644
--- a/include/linux/efi.h
+++ b/include/linux/efi.h
@@ -290,7 +290,7 @@ typedef efi_status_t efi_get_variable_t (efi_char16_t *name, efi_guid_t *vendor,
 					 unsigned long *data_size, void *data);
 typedef efi_status_t efi_get_next_variable_t (unsigned long *name_size, efi_char16_t *name,
 					      efi_guid_t *vendor);
-typedef efi_status_t efi_set_variable_t (efi_char16_t *name, efi_guid_t *vendor, 
+typedef efi_status_t efi_set_variable_t (efi_char16_t *name, efi_guid_t *vendor,
 					 u32 attr, unsigned long data_size,
 					 void *data);
 typedef efi_status_t efi_get_next_high_mono_count_t (u32 *count);
-- 
2.51.0

