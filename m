Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A71A6EE7E
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 12:04:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2205610E539;
	Tue, 25 Mar 2025 11:04:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="w8P2aOlo";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="oKvv0FG7";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="w8P2aOlo";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="oKvv0FG7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2765C10E532
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 11:04:32 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7391D2116F;
 Tue, 25 Mar 2025 11:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1742900656; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JsX2O1Lv4R0CJfvVL9d3d8+tDBbjg2lxIbSh3082P/M=;
 b=w8P2aOloUwSfeh7VDSrAMG9mPxKNNlYk44YHyNPYwqmNN4boKfjwUqEhmo27MmPZecjTpz
 lodc/pC3s70PI7T1Ov32WwmLZmPn404/LiUsOQf5qGvro/zecu6AnyYRvj0y9Kp2XV6xzu
 nYfB9ePNBzh2MAGQlZ07PKnClmx/yJs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1742900656;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JsX2O1Lv4R0CJfvVL9d3d8+tDBbjg2lxIbSh3082P/M=;
 b=oKvv0FG7yc3H8u5v/fpysMEgq28dTF0GbM/HcI5u5CFocWv/lGO02EkeH7rps7LvlLMSN1
 DvV3fJntJPyfXkAQ==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=w8P2aOlo;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=oKvv0FG7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1742900656; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JsX2O1Lv4R0CJfvVL9d3d8+tDBbjg2lxIbSh3082P/M=;
 b=w8P2aOloUwSfeh7VDSrAMG9mPxKNNlYk44YHyNPYwqmNN4boKfjwUqEhmo27MmPZecjTpz
 lodc/pC3s70PI7T1Ov32WwmLZmPn404/LiUsOQf5qGvro/zecu6AnyYRvj0y9Kp2XV6xzu
 nYfB9ePNBzh2MAGQlZ07PKnClmx/yJs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1742900656;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JsX2O1Lv4R0CJfvVL9d3d8+tDBbjg2lxIbSh3082P/M=;
 b=oKvv0FG7yc3H8u5v/fpysMEgq28dTF0GbM/HcI5u5CFocWv/lGO02EkeH7rps7LvlLMSN1
 DvV3fJntJPyfXkAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3D35413957;
 Tue, 25 Mar 2025 11:04:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id OJe0DbCN4meFVQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 25 Mar 2025 11:04:16 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, simona@ffwll.ch, airlied@gmail.com,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 6/8] drm/format-helper: Optimize 32-to-24-bpp conversion
Date: Tue, 25 Mar 2025 11:31:11 +0100
Message-ID: <20250325110407.81107-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250325110407.81107-1-tzimmermann@suse.de>
References: <20250325110407.81107-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 7391D2116F
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; TO_MATCH_ENVRCPT_ALL(0.00)[]; ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; MIME_TRACE(0.00)[0:+];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 TO_DN_SOME(0.00)[];
 FREEMAIL_TO(0.00)[redhat.com,ffwll.ch,gmail.com,kernel.org,linux.intel.com];
 RCVD_TLS_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RCPT_COUNT_SEVEN(0.00)[7];
 R_RATELIMIT(0.00)[to_ip_from(RLqtkr6cif1ebgurukgmwdm7xc)];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
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

For ease of implementation, existing line-conversion functions
for 24-bit formats write each byte individually. Optimize the
performance by writing 4 pixels in 3 32-bit stores.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_format_helper.c | 36 ++++++++++++++++++++++++++++-
 1 file changed, 35 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
index a926aa6671fc..b9c9c712aa9c 100644
--- a/drivers/gpu/drm/drm_format_helper.c
+++ b/drivers/gpu/drm/drm_format_helper.c
@@ -274,10 +274,44 @@ static __always_inline void drm_fb_xfrm_line_32to24(void *dbuf, const void *sbuf
 						    unsigned int pixels,
 						    u32 (*xfrm_pixel)(u32))
 {
-	u8 *dbuf8 = dbuf;
+	__le32 *dbuf32 = dbuf;
+	u8 *dbuf8;
 	const __le32 *sbuf32 = sbuf;
 	const __le32 *send32 = sbuf32 + pixels;
 
+	/* write pixels in chunks of 4 */
+	send32 -= pixels & GENMASK(1, 0);
+	while (sbuf32 < send32) {
+		u32 val24[4] = {
+			xfrm_pixel(le32_to_cpup(sbuf32++)),
+			xfrm_pixel(le32_to_cpup(sbuf32++)),
+			xfrm_pixel(le32_to_cpup(sbuf32++)),
+			xfrm_pixel(le32_to_cpup(sbuf32++)),
+		};
+		u32 out32[3] = {
+			/* write output bytes in reverse order for little endianness */
+			((val24[0] & 0x000000ff)) |
+			((val24[0] & 0x0000ff00)) |
+			((val24[0] & 0x00ff0000)) |
+			((val24[1] & 0x000000ff) << 24),
+			((val24[1] & 0x0000ff00) >> 8) |
+			((val24[1] & 0x00ff0000) >> 8) |
+			((val24[2] & 0x000000ff) << 16) |
+			((val24[2] & 0x0000ff00) << 16),
+			((val24[2] & 0x00ff0000) >> 16) |
+			((val24[3] & 0x000000ff) << 8) |
+			((val24[3] & 0x0000ff00) << 8) |
+			((val24[3] & 0x00ff0000) << 8),
+		};
+
+		*dbuf32++ = cpu_to_le32(out32[0]);
+		*dbuf32++ = cpu_to_le32(out32[1]);
+		*dbuf32++ = cpu_to_le32(out32[2]);
+	}
+	send32 += pixels & GENMASK(1, 0);
+
+	/* write trailing pixel */
+	dbuf8 = (u8 __force *)dbuf32;
 	while (sbuf32 < send32) {
 		u32 val24 = xfrm_pixel(le32_to_cpup(sbuf32++));
 		/* write output in reverse order for little endianness */
-- 
2.48.1

