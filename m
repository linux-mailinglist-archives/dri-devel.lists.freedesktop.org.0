Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3BE3A84162
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 13:03:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 090A010E95A;
	Thu, 10 Apr 2025 11:03:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="tJIkx7d6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ExFJW6AW";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tJIkx7d6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ExFJW6AW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64CC110E95A
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 11:03:27 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C061A21180;
 Thu, 10 Apr 2025 11:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1744282982; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XcLBq8/lT/Syc1IJ/XQ6hfwfl13NwV1Me+dX5ZXP1Uk=;
 b=tJIkx7d6EG+ol9p92AggpLWmcuUKgKVJP9LCQTjESg8iLCQZx3gtC/0niVPnGJX77PNEz+
 NQrg7YPMJswSA5oF0cnEHpnjPV/rhdaoUsCV7eZBLLRRywln8LF1/ZbgvWhjtaddLfHgG3
 r05m5b+dbAzRVCj1VWAkt5sOgxKyEdI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1744282982;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XcLBq8/lT/Syc1IJ/XQ6hfwfl13NwV1Me+dX5ZXP1Uk=;
 b=ExFJW6AWQB9Zxhaqmk9+IinFNpfFg/a4ia3RXuCInvhlk+VjPdCZrUppXCipoG4iqoPG4o
 O9mZgfCMG/Veq4AQ==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=tJIkx7d6;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=ExFJW6AW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1744282982; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XcLBq8/lT/Syc1IJ/XQ6hfwfl13NwV1Me+dX5ZXP1Uk=;
 b=tJIkx7d6EG+ol9p92AggpLWmcuUKgKVJP9LCQTjESg8iLCQZx3gtC/0niVPnGJX77PNEz+
 NQrg7YPMJswSA5oF0cnEHpnjPV/rhdaoUsCV7eZBLLRRywln8LF1/ZbgvWhjtaddLfHgG3
 r05m5b+dbAzRVCj1VWAkt5sOgxKyEdI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1744282982;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XcLBq8/lT/Syc1IJ/XQ6hfwfl13NwV1Me+dX5ZXP1Uk=;
 b=ExFJW6AWQB9Zxhaqmk9+IinFNpfFg/a4ia3RXuCInvhlk+VjPdCZrUppXCipoG4iqoPG4o
 O9mZgfCMG/Veq4AQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5EBEF13A4B;
 Thu, 10 Apr 2025 11:03:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id OAnvFWal92f3OQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 10 Apr 2025 11:03:02 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com,
	sean@poorly.run,
	patrik.r.jakobsson@gmail.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 9/9] drm/udl: Support adapters without firmware descriptor
Date: Thu, 10 Apr 2025 12:59:06 +0200
Message-ID: <20250410105948.25463-10-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250410105948.25463-1-tzimmermann@suse.de>
References: <20250410105948.25463-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: C061A21180
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
 RCVD_COUNT_TWO(0.00)[2];
 R_RATELIMIT(0.00)[to_ip_from(RLpanf5kzz96b3rhiat384a1za)];
 RCVD_TLS_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 FROM_EQ_ENVFROM(0.00)[]; RCPT_COUNT_FIVE(0.00)[5];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
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

Set default limit on the number of pixels for adapters without
vendor firmware descriptor. The devices work as expected, they
just don't provide any description.

If parsing the vendor firmware descriptor fails, the device falls
back to the given default limits. Failing to allocate memory is
still an error.

v2:
- fix typo in constant (Patrik)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
---
 drivers/gpu/drm/udl/udl_main.c | 37 +++++++++++++++++++---------------
 1 file changed, 21 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/udl/udl_main.c b/drivers/gpu/drm/udl/udl_main.c
index b5a6b254a2028..3dfeb88cf9187 100644
--- a/drivers/gpu/drm/udl/udl_main.c
+++ b/drivers/gpu/drm/udl/udl_main.c
@@ -76,6 +76,7 @@ static int udl_parse_vendor_descriptor(struct udl_device *udl)
 {
 	struct drm_device *dev = &udl->drm;
 	struct usb_device *udev = udl_to_usb_device(udl);
+	bool detected = false;
 	void *buf;
 	int ret;
 	unsigned int len;
@@ -84,16 +85,16 @@ static int udl_parse_vendor_descriptor(struct udl_device *udl)
 
 	buf = kzalloc(MAX_VENDOR_DESCRIPTOR_SIZE, GFP_KERNEL);
 	if (!buf)
-		return false;
+		return -ENOMEM;
 
 	ret = usb_get_descriptor(udev, 0x5f, /* vendor specific */
 				 0, buf, MAX_VENDOR_DESCRIPTOR_SIZE);
 	if (ret < 0)
-		goto unrecognized;
+		goto out;
 	len = ret;
 
 	if (len < 5)
-		goto unrecognized;
+		goto out;
 
 	desc = buf;
 	desc_end = desc + len;
@@ -103,21 +104,20 @@ static int udl_parse_vendor_descriptor(struct udl_device *udl)
 	    (desc[2] != 0x01) ||   /* version (2 bytes) */
 	    (desc[3] != 0x00) ||
 	    (desc[4] != len - 2))  /* length after type */
-		goto unrecognized;
+		goto out;
 	desc += 5;
 
+	detected = true;
+
 	while (desc < desc_end)
 		desc = udl_parse_key_value_pair(udl, desc, desc_end);
 
-	goto success;
-
-unrecognized:
-	/* allow udlfb to load for now even if firmware unrecognized */
-	drm_warn(dev, "Unrecognized vendor firmware descriptor\n");
-
-success:
+out:
+	if (!detected)
+		drm_warn(dev, "Unrecognized vendor firmware descriptor\n");
 	kfree(buf);
-	return true;
+
+	return 0;
 }
 
 /*
@@ -345,11 +345,16 @@ int udl_init(struct udl_device *udl)
 		drm_warn(dev, "buffer sharing not supported"); /* not an error */
 	}
 
-	if (!udl_parse_vendor_descriptor(udl)) {
-		ret = -ENODEV;
-		DRM_ERROR("firmware not recognized. Assume incompatible device\n");
+	/*
+	 * Not all devices provide vendor descriptors with device
+	 * information. Initialize to default values of real-world
+	 * devices. It is just enough memory for FullHD.
+	 */
+	udl->sku_pixel_limit = UDL_SKU_PIXEL_LIMIT_DEFAULT;
+
+	ret = udl_parse_vendor_descriptor(udl);
+	if (ret)
 		goto err;
-	}
 
 	if (udl_select_std_channel(udl))
 		DRM_ERROR("Selecting channel failed\n");
-- 
2.49.0

