Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75547D23132
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 09:22:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D264610E6FE;
	Thu, 15 Jan 2026 08:22:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="jQQ2KDjz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="q/M8loT5";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jQQ2KDjz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="q/M8loT5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1977810E6D9
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 08:22:01 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2B19D3374E;
 Thu, 15 Jan 2026 08:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1768465295; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hMmFojOK8/+cMMEZudbk+BTABlKkeY7vlWKH1Ezvf0k=;
 b=jQQ2KDjzSpBqormoeB/se9D2+u0PWKXvlYBXmvRFm2A7VvBAZ0d2DMs37vgMkdhqoZ4viH
 2IYuv6YLwdGkMvx+tMETgXjb9h/CCpUt/TnhPt3UFa2gBfnWBYY7Y5VcEWsnLqe42z+Udu
 8NYo5y6VGivpz1y6W9bDY8SF2se2vJU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1768465295;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hMmFojOK8/+cMMEZudbk+BTABlKkeY7vlWKH1Ezvf0k=;
 b=q/M8loT5RxOe82PWK7Sbh8630CwBPzqaWxbXxZAhkkJ5r8OCZIrHqdkpjSLuDl09jjWerG
 PofmvGdb/jKF/5BQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1768465295; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hMmFojOK8/+cMMEZudbk+BTABlKkeY7vlWKH1Ezvf0k=;
 b=jQQ2KDjzSpBqormoeB/se9D2+u0PWKXvlYBXmvRFm2A7VvBAZ0d2DMs37vgMkdhqoZ4viH
 2IYuv6YLwdGkMvx+tMETgXjb9h/CCpUt/TnhPt3UFa2gBfnWBYY7Y5VcEWsnLqe42z+Udu
 8NYo5y6VGivpz1y6W9bDY8SF2se2vJU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1768465295;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hMmFojOK8/+cMMEZudbk+BTABlKkeY7vlWKH1Ezvf0k=;
 b=q/M8loT5RxOe82PWK7Sbh8630CwBPzqaWxbXxZAhkkJ5r8OCZIrHqdkpjSLuDl09jjWerG
 PofmvGdb/jKF/5BQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D3C553EA65;
 Thu, 15 Jan 2026 08:21:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id AD9/Mo6jaGkjBQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 15 Jan 2026 08:21:34 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: tzungbi@kernel.org, briannorris@chromium.org, jwerner@chromium.org,
 javierm@redhat.com, samuel@sholland.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch
Cc: chrome-platform@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 09/12] firmware: google: Pack structures for coreboot table
 entries
Date: Thu, 15 Jan 2026 08:57:19 +0100
Message-ID: <20260115082128.12460-10-tzimmermann@suse.de>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260115082128.12460-1-tzimmermann@suse.de>
References: <20260115082128.12460-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FROM_HAS_DN(0.00)[]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MIME_TRACE(0.00)[0:+];
 TO_DN_SOME(0.00)[]; RCPT_COUNT_TWELVE(0.00)[12];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 RCVD_COUNT_TWO(0.00)[2];
 FREEMAIL_TO(0.00)[kernel.org,chromium.org,redhat.com,sholland.org,linux.intel.com,gmail.com,ffwll.ch];
 RCVD_TLS_ALL(0.00)[];
 R_RATELIMIT(0.00)[to_ip_from(RLf8s8spogujn9h9roxabhn3pd)];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
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

Pack the fields in the coreboot table entries. These entries are part of
the coreboot ABI, so they don't follow regular calling conventions. For
example, fields of type u64 are aligned to boundaries of 4 byte instead
of 8. [1]

So far this has not been a problem. In the future, padding bytes should
be added where explicit alignment is required.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Link: https://github.com/coreboot/coreboot/blob/main/payloads/libpayload/include/coreboot_tables.h#L96 # [1]
---
 drivers/firmware/google/coreboot_table.c | 2 +-
 include/linux/coreboot.h                 | 9 +++++----
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/firmware/google/coreboot_table.c b/drivers/firmware/google/coreboot_table.c
index c769631ea15d..e21b013b19e7 100644
--- a/drivers/firmware/google/coreboot_table.c
+++ b/drivers/firmware/google/coreboot_table.c
@@ -30,7 +30,7 @@ struct coreboot_table_header {
 	u32 table_bytes;
 	u32 table_checksum;
 	u32 table_entries;
-};
+} __packed;
 
 #define CB_DEV(d) container_of(d, struct coreboot_device, dev)
 #define CB_DRV(d) container_of_const(d, struct coreboot_driver, drv)
diff --git a/include/linux/coreboot.h b/include/linux/coreboot.h
index 48705b439c6e..514c95f9d0e3 100644
--- a/include/linux/coreboot.h
+++ b/include/linux/coreboot.h
@@ -12,6 +12,7 @@
 #ifndef _LINUX_COREBOOT_H
 #define _LINUX_COREBOOT_H
 
+#include <linux/compiler_attributes.h>
 #include <linux/types.h>
 
 /* List of coreboot entry structures that is used */
@@ -23,7 +24,7 @@
 struct coreboot_table_entry {
 	u32 tag;
 	u32 size;
-};
+} __packed;
 
 /* Points to a CBMEM entry */
 struct lb_cbmem_ref {
@@ -31,7 +32,7 @@ struct lb_cbmem_ref {
 	u32 size;
 
 	u64 cbmem_addr;
-};
+} __packed;
 
 /* Corresponds to LB_TAG_CBMEM_ENTRY */
 struct lb_cbmem_entry {
@@ -41,7 +42,7 @@ struct lb_cbmem_entry {
 	u64 address;
 	u32 entry_size;
 	u32 id;
-};
+} __packed;
 
 /* Describes framebuffer setup by coreboot */
 struct lb_framebuffer {
@@ -61,6 +62,6 @@ struct lb_framebuffer {
 	u8  blue_mask_size;
 	u8  reserved_mask_pos;
 	u8  reserved_mask_size;
-};
+} __packed;
 
 #endif /* _LINUX_COREBOOT_H */
-- 
2.52.0

