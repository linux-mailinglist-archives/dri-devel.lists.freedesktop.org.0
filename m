Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KFf9BWH+gWmYNgMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 14:55:45 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD4ADA3B8
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 14:55:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 712E510E66D;
	Tue,  3 Feb 2026 13:55:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="LAR2p81I";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="QllUPBcJ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LAR2p81I";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="QllUPBcJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B364510E676
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Feb 2026 13:55:41 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7BA903E6D5;
 Tue,  3 Feb 2026 13:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1770126929; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m+pDbjxVqJIFwnaAB3M0jgbm3ql3GEtdjLFQ79q0pWw=;
 b=LAR2p81II6uz5XH/lHruVaHwX3wZ1kX3WtmujLwDYM8xxN38bGlsYnj11YKs0QQ5g3CB4o
 ZfTeKXMCxh5B50PdUFm6Ef7O9fUs4WZFJbbDAQs72/b4316xeBspbVbbfuWqIuZ6Msps+w
 S6qETImMBjP+lHIk0YDG5765bb818ko=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1770126929;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m+pDbjxVqJIFwnaAB3M0jgbm3ql3GEtdjLFQ79q0pWw=;
 b=QllUPBcJELlxYGwWkw6HPK7VreSSVHvdm8zeTb4hkmJr5rhMeySz78SMLZZzzcR0t8P7az
 J6etTeNFWffuGiDA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1770126929; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m+pDbjxVqJIFwnaAB3M0jgbm3ql3GEtdjLFQ79q0pWw=;
 b=LAR2p81II6uz5XH/lHruVaHwX3wZ1kX3WtmujLwDYM8xxN38bGlsYnj11YKs0QQ5g3CB4o
 ZfTeKXMCxh5B50PdUFm6Ef7O9fUs4WZFJbbDAQs72/b4316xeBspbVbbfuWqIuZ6Msps+w
 S6qETImMBjP+lHIk0YDG5765bb818ko=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1770126929;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m+pDbjxVqJIFwnaAB3M0jgbm3ql3GEtdjLFQ79q0pWw=;
 b=QllUPBcJELlxYGwWkw6HPK7VreSSVHvdm8zeTb4hkmJr5rhMeySz78SMLZZzzcR0t8P7az
 J6etTeNFWffuGiDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 23BA83EA63;
 Tue,  3 Feb 2026 13:55:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id KMpMB1H+gWlGDwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 03 Feb 2026 13:55:29 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: tzungbi@kernel.org, briannorris@chromium.org, jwerner@chromium.org,
 javierm@redhat.com, samuel@sholland.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch
Cc: chrome-platform@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 08/12] firmware: google: Export coreboot table entries
Date: Tue,  3 Feb 2026 14:52:27 +0100
Message-ID: <20260203135519.417931-9-tzimmermann@suse.de>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260203135519.417931-1-tzimmermann@suse.de>
References: <20260203135519.417931-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,sholland.org:email,suse.de:email,suse.de:dkim,suse.de:mid,linaro.org:email]
X-Rspamd-Queue-Id: 5DD4ADA3B8
X-Rspamd-Action: no action

Move types for coreboot table entries to <linux/coreboot.h>. Allows
drivers in other subsystems to use these structures.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Tzung-Bi Shih <tzungbi@kernel.org>
Acked-by: Julius Werner <jwerner@chromium.org>
---
 MAINTAINERS                                   |  1 +
 drivers/firmware/google/coreboot_table.c      | 10 +++
 drivers/firmware/google/coreboot_table.h      | 60 +----------------
 .../firmware/google/framebuffer-coreboot.c    |  2 -
 include/linux/coreboot.h                      | 66 +++++++++++++++++++
 5 files changed, 78 insertions(+), 61 deletions(-)
 create mode 100644 include/linux/coreboot.h

diff --git a/MAINTAINERS b/MAINTAINERS
index cd371029629e..c0a8de9fb58d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10742,6 +10742,7 @@ L:	chrome-platform@lists.linux.dev
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git
 F:	drivers/firmware/google/
+F:	include/linux/coreboot.h
 
 GOOGLE TENSOR SoC SUPPORT
 M:	Peter Griffin <peter.griffin@linaro.org>
diff --git a/drivers/firmware/google/coreboot_table.c b/drivers/firmware/google/coreboot_table.c
index a031d6fe6bc5..c769631ea15d 100644
--- a/drivers/firmware/google/coreboot_table.c
+++ b/drivers/firmware/google/coreboot_table.c
@@ -22,6 +22,16 @@
 
 #include "coreboot_table.h"
 
+/* Coreboot table header structure */
+struct coreboot_table_header {
+	char signature[4];
+	u32 header_bytes;
+	u32 header_checksum;
+	u32 table_bytes;
+	u32 table_checksum;
+	u32 table_entries;
+};
+
 #define CB_DEV(d) container_of(d, struct coreboot_device, dev)
 #define CB_DRV(d) container_of_const(d, struct coreboot_driver, drv)
 
diff --git a/drivers/firmware/google/coreboot_table.h b/drivers/firmware/google/coreboot_table.h
index 17e9e5c3f6e1..616ca3903e5c 100644
--- a/drivers/firmware/google/coreboot_table.h
+++ b/drivers/firmware/google/coreboot_table.h
@@ -12,67 +12,9 @@
 #ifndef __COREBOOT_TABLE_H
 #define __COREBOOT_TABLE_H
 
+#include <linux/coreboot.h>
 #include <linux/device.h>
 
-struct coreboot_device_id;
-
-/* Coreboot table header structure */
-struct coreboot_table_header {
-	char signature[4];
-	u32 header_bytes;
-	u32 header_checksum;
-	u32 table_bytes;
-	u32 table_checksum;
-	u32 table_entries;
-};
-
-/* List of coreboot entry structures that is used */
-/* Generic */
-struct coreboot_table_entry {
-	u32 tag;
-	u32 size;
-};
-
-/* Points to a CBMEM entry */
-struct lb_cbmem_ref {
-	u32 tag;
-	u32 size;
-
-	u64 cbmem_addr;
-};
-
-#define LB_TAG_CBMEM_ENTRY 0x31
-
-/* Corresponds to LB_TAG_CBMEM_ENTRY */
-struct lb_cbmem_entry {
-	u32 tag;
-	u32 size;
-
-	u64 address;
-	u32 entry_size;
-	u32 id;
-};
-
-/* Describes framebuffer setup by coreboot */
-struct lb_framebuffer {
-	u32 tag;
-	u32 size;
-
-	u64 physical_address;
-	u32 x_resolution;
-	u32 y_resolution;
-	u32 bytes_per_line;
-	u8  bits_per_pixel;
-	u8  red_mask_pos;
-	u8  red_mask_size;
-	u8  green_mask_pos;
-	u8  green_mask_size;
-	u8  blue_mask_pos;
-	u8  blue_mask_size;
-	u8  reserved_mask_pos;
-	u8  reserved_mask_size;
-};
-
 /* A device, additionally with information from coreboot. */
 struct coreboot_device {
 	struct device dev;
diff --git a/drivers/firmware/google/framebuffer-coreboot.c b/drivers/firmware/google/framebuffer-coreboot.c
index 81aa522edb1e..fab3f28655d3 100644
--- a/drivers/firmware/google/framebuffer-coreboot.c
+++ b/drivers/firmware/google/framebuffer-coreboot.c
@@ -21,8 +21,6 @@
 
 #include "coreboot_table.h"
 
-#define CB_TAG_FRAMEBUFFER 0x12
-
 #if defined(CONFIG_PCI)
 static bool framebuffer_pci_dev_is_enabled(struct pci_dev *pdev)
 {
diff --git a/include/linux/coreboot.h b/include/linux/coreboot.h
new file mode 100644
index 000000000000..48705b439c6e
--- /dev/null
+++ b/include/linux/coreboot.h
@@ -0,0 +1,66 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * coreboot.h
+ *
+ * Coreboot device and driver interfaces.
+ *
+ * Copyright 2014 Gerd Hoffmann <kraxel@redhat.com>
+ * Copyright 2017 Google Inc.
+ * Copyright 2017 Samuel Holland <samuel@sholland.org>
+ */
+
+#ifndef _LINUX_COREBOOT_H
+#define _LINUX_COREBOOT_H
+
+#include <linux/types.h>
+
+/* List of coreboot entry structures that is used */
+
+#define CB_TAG_FRAMEBUFFER 0x12
+#define LB_TAG_CBMEM_ENTRY 0x31
+
+/* Generic */
+struct coreboot_table_entry {
+	u32 tag;
+	u32 size;
+};
+
+/* Points to a CBMEM entry */
+struct lb_cbmem_ref {
+	u32 tag;
+	u32 size;
+
+	u64 cbmem_addr;
+};
+
+/* Corresponds to LB_TAG_CBMEM_ENTRY */
+struct lb_cbmem_entry {
+	u32 tag;
+	u32 size;
+
+	u64 address;
+	u32 entry_size;
+	u32 id;
+};
+
+/* Describes framebuffer setup by coreboot */
+struct lb_framebuffer {
+	u32 tag;
+	u32 size;
+
+	u64 physical_address;
+	u32 x_resolution;
+	u32 y_resolution;
+	u32 bytes_per_line;
+	u8  bits_per_pixel;
+	u8  red_mask_pos;
+	u8  red_mask_size;
+	u8  green_mask_pos;
+	u8  green_mask_size;
+	u8  blue_mask_pos;
+	u8  blue_mask_size;
+	u8  reserved_mask_pos;
+	u8  reserved_mask_size;
+};
+
+#endif /* _LINUX_COREBOOT_H */
-- 
2.52.0

