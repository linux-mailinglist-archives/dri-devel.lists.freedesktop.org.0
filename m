Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8NUYMEWQlGk9FgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 16:59:01 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 595C914DC82
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 16:59:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC50B10E500;
	Tue, 17 Feb 2026 15:58:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="OCuSTqdW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ysA4CXel";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OCuSTqdW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ysA4CXel";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 840D410E4F9
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 15:58:55 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A52823E76F;
 Tue, 17 Feb 2026 15:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1771343922; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ndoyu6K/XcpM1integHhMZJM85WuaRnQJ8LFyisgsNk=;
 b=OCuSTqdW+EgLuD9WKZqBf8Q0mWkrtJhU5UeFMkF+QtwjFmvt8jlWi8cdGE2t6QsUwko09T
 kYYj+CGqi8uARDxxWJ1PY/heTZvpBBLfvIdbtawU03KrE12FJQL6UJ+HblCRUB29PWL3YA
 9IVNd2xzKgTxB9Uo0vE9XqwgeultZxc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1771343922;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ndoyu6K/XcpM1integHhMZJM85WuaRnQJ8LFyisgsNk=;
 b=ysA4CXel2AvJTXadrBykNI7hwF2N0R/cbnow3353nDLgGHuDInd3qZSmerHBcnXngsp+2b
 Rk9JYbKupZAc3EDw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1771343922; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ndoyu6K/XcpM1integHhMZJM85WuaRnQJ8LFyisgsNk=;
 b=OCuSTqdW+EgLuD9WKZqBf8Q0mWkrtJhU5UeFMkF+QtwjFmvt8jlWi8cdGE2t6QsUwko09T
 kYYj+CGqi8uARDxxWJ1PY/heTZvpBBLfvIdbtawU03KrE12FJQL6UJ+HblCRUB29PWL3YA
 9IVNd2xzKgTxB9Uo0vE9XqwgeultZxc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1771343922;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ndoyu6K/XcpM1integHhMZJM85WuaRnQJ8LFyisgsNk=;
 b=ysA4CXel2AvJTXadrBykNI7hwF2N0R/cbnow3353nDLgGHuDInd3qZSmerHBcnXngsp+2b
 Rk9JYbKupZAc3EDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 419803EA66;
 Tue, 17 Feb 2026 15:58:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id eO2QDjKQlGk9PgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 17 Feb 2026 15:58:42 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: tzungbi@kernel.org, briannorris@chromium.org, jwerner@chromium.org,
 javierm@redhat.com, samuel@sholland.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch
Cc: chrome-platform@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v4 04/12] firmware: google: framebuffer: Tie platform device
 to PCI hardware
Date: Tue, 17 Feb 2026 16:56:14 +0100
Message-ID: <20260217155836.96267-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260217155836.96267-1-tzimmermann@suse.de>
References: <20260217155836.96267-1-tzimmermann@suse.de>
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tzungbi@kernel.org,m:briannorris@chromium.org,m:jwerner@chromium.org,m:javierm@redhat.com,m:samuel@sholland.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:chrome-platform@lists.linux.dev,m:tzimmermann@suse.de,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,chromium.org,redhat.com,sholland.org,linux.intel.com,gmail.com,ffwll.ch];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:email,suse.de:mid,suse.de:dkim,suse.de:email]
X-Rspamd-Queue-Id: 595C914DC82
X-Rspamd-Action: no action

Use the PCI device as parent of the system-framebuffer device instead
of the coreboot device. Prevents SIGBUS or SIGSEG after hot-unplug of
the PCI device while the framebuffer is active.

The simple-framebuffer device depends on the PCI hardware, so this
device needs to be its parent. The current coreboot parent is no
longer needed after the system-framebuffer device has been created.

On systems without PCI or if no PCI parent device could be found,
the platform device hangs on the platform bus directly.

The fix here is similar to code in sysfb, which contained that same
bug.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Tzung-Bi Shih <tzungbi@kernel.org>
Acked-by: Julius Werner <jwerner@chromium.org>
---
 .../firmware/google/framebuffer-coreboot.c    | 82 +++++++++++++++++--
 1 file changed, 77 insertions(+), 5 deletions(-)

diff --git a/drivers/firmware/google/framebuffer-coreboot.c b/drivers/firmware/google/framebuffer-coreboot.c
index 767515a30a52..07e9c7be94fa 100644
--- a/drivers/firmware/google/framebuffer-coreboot.c
+++ b/drivers/firmware/google/framebuffer-coreboot.c
@@ -13,6 +13,7 @@
 #include <linux/kernel.h>
 #include <linux/mm.h>
 #include <linux/module.h>
+#include <linux/pci.h>
 #include <linux/platform_data/simplefb.h>
 #include <linux/platform_device.h>
 #include <linux/sysfb.h>
@@ -21,14 +22,71 @@
 
 #define CB_TAG_FRAMEBUFFER 0x12
 
+#if defined(CONFIG_PCI)
+static bool framebuffer_pci_dev_is_enabled(struct pci_dev *pdev)
+{
+	/*
+	 * TODO: Try to integrate this code into the PCI subsystem
+	 */
+	int ret;
+	u16 command;
+
+	ret = pci_read_config_word(pdev, PCI_COMMAND, &command);
+	if (ret != PCIBIOS_SUCCESSFUL)
+		return false;
+	if (!(command & PCI_COMMAND_MEMORY))
+		return false;
+	return true;
+}
+
+static struct pci_dev *framebuffer_parent_pci_dev(struct resource *res)
+{
+	struct pci_dev *pdev = NULL;
+	const struct resource *r = NULL;
+
+	while (!r && (pdev = pci_get_base_class(PCI_BASE_CLASS_DISPLAY, pdev)))
+		r = pci_find_resource(pdev, res);
+
+	if (!r || !pdev)
+		return NULL; /* not found; not an error */
+
+	if (!framebuffer_pci_dev_is_enabled(pdev)) {
+		pci_dev_put(pdev);
+		return ERR_PTR(-ENODEV);
+	}
+
+	return pdev;
+}
+#else
+static struct pci_dev *framebuffer_parent_pci_dev(struct resource *res)
+{
+	return NULL;
+}
+#endif
+
+static struct device *framebuffer_parent_dev(struct resource *res)
+{
+	struct pci_dev *pdev;
+
+	pdev = framebuffer_parent_pci_dev(res);
+	if (IS_ERR(pdev))
+		return ERR_CAST(pdev);
+	else if (pdev)
+		return &pdev->dev;
+
+	return NULL;
+}
+
 static const struct simplefb_format formats[] = SIMPLEFB_FORMATS;
 
 static int framebuffer_probe(struct coreboot_device *dev)
 {
 	int i;
 	struct lb_framebuffer *fb = &dev->framebuffer;
+	struct device *parent;
 	struct platform_device *pdev;
 	struct resource res;
+	int ret;
 	struct simplefb_platform_data pdata = {
 		.width = fb->x_resolution,
 		.height = fb->y_resolution,
@@ -57,6 +115,10 @@ static int framebuffer_probe(struct coreboot_device *dev)
 	if (res.end <= res.start)
 		return -EINVAL;
 
+	parent = framebuffer_parent_dev(&res);
+	if (IS_ERR(parent))
+		return PTR_ERR(parent);
+
 	for (i = 0; i < ARRAY_SIZE(formats); ++i) {
 		if (fb->bits_per_pixel     == formats[i].bits_per_pixel &&
 		    fb->red_mask_pos       == formats[i].red.offset &&
@@ -67,17 +129,27 @@ static int framebuffer_probe(struct coreboot_device *dev)
 		    fb->blue_mask_size     == formats[i].blue.length)
 			pdata.format = formats[i].name;
 	}
-	if (!pdata.format)
-		return -ENODEV;
+	if (!pdata.format) {
+		ret = -ENODEV;
+		goto out_put_device_parent;
+	}
 
-	pdev = platform_device_register_resndata(&dev->dev,
+	pdev = platform_device_register_resndata(parent,
 						 "simple-framebuffer", 0,
 						 &res, 1, &pdata,
 						 sizeof(pdata));
-	if (IS_ERR(pdev))
+	if (IS_ERR(pdev)) {
+		ret = PTR_ERR(pdev);
 		pr_warn("coreboot: could not register framebuffer\n");
+		goto out_put_device_parent;
+	}
+
+	ret = 0;
 
-	return PTR_ERR_OR_ZERO(pdev);
+out_put_device_parent:
+	if (parent)
+		put_device(parent);
+	return ret;
 }
 
 static const struct coreboot_device_id framebuffer_ids[] = {
-- 
2.52.0

