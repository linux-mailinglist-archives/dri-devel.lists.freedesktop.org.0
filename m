Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ILIuO0SQlGlXFgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 16:59:00 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 936EB14DC7B
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 16:59:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 998F810E4FD;
	Tue, 17 Feb 2026 15:58:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="RvdX61ui";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xmAFUrHt";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RvdX61ui";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xmAFUrHt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8203E10E4F9
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 15:58:56 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E3C895BD54;
 Tue, 17 Feb 2026 15:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1771343924; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZOaZGBgJ1mZ+urHLrOyGEWCExurs4lE0vtogqzscPP4=;
 b=RvdX61uiC/TVxbWemEGJQ/A4hyWsnLs2EMpDZWuSMdFaQiQryK3wNuOcvHCitE0e3eeo8n
 pyn0cGtKhS9XrRYpZJ3Fc5wBp047E+baTa6y+FlnzuCc5R6ILhT84BsYpVy0kJmDHEnKC2
 TdfwYYTPE+zMfYnbJq6NFX3q0yNp3jo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1771343924;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZOaZGBgJ1mZ+urHLrOyGEWCExurs4lE0vtogqzscPP4=;
 b=xmAFUrHtoKJgry646WowKdASn2mevm6inm4qheG+3QYUK1de2Rrsfcaf0qOIGUuxf0TK1d
 L0jzEKHgwbFjJKDw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1771343924; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZOaZGBgJ1mZ+urHLrOyGEWCExurs4lE0vtogqzscPP4=;
 b=RvdX61uiC/TVxbWemEGJQ/A4hyWsnLs2EMpDZWuSMdFaQiQryK3wNuOcvHCitE0e3eeo8n
 pyn0cGtKhS9XrRYpZJ3Fc5wBp047E+baTa6y+FlnzuCc5R6ILhT84BsYpVy0kJmDHEnKC2
 TdfwYYTPE+zMfYnbJq6NFX3q0yNp3jo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1771343924;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZOaZGBgJ1mZ+urHLrOyGEWCExurs4lE0vtogqzscPP4=;
 b=xmAFUrHtoKJgry646WowKdASn2mevm6inm4qheG+3QYUK1de2Rrsfcaf0qOIGUuxf0TK1d
 L0jzEKHgwbFjJKDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8405B3EA66;
 Tue, 17 Feb 2026 15:58:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id OLXGHjSQlGk9PgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 17 Feb 2026 15:58:44 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: tzungbi@kernel.org, briannorris@chromium.org, jwerner@chromium.org,
 javierm@redhat.com, samuel@sholland.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch
Cc: chrome-platform@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v4 10/12] drm/sysfb: Generalize pixel-format matching
Date: Tue, 17 Feb 2026 16:56:20 +0100
Message-ID: <20260217155836.96267-11-tzimmermann@suse.de>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260217155836.96267-1-tzimmermann@suse.de>
References: <20260217155836.96267-1-tzimmermann@suse.de>
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
X-Rspamd-Queue-Id: 936EB14DC7B
X-Rspamd-Action: no action

Provide drm_sysfb_get_format(), a helper that finds a specific DRM
format from a list of pixel formats. The new function builds upon
drm_sysfb_get_format_si(), which finds the DRM format from a given
instance of struct screen_info. Now get the screen_info's pixel format
in the caller. Allows for matching pixel formats in drivers without
screen_info.

Convert the callers in efidrm and vesadrm to the new interface.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Acked-by: Julius Werner <jwerner@chromium.org>
---
 drivers/gpu/drm/sysfb/drm_sysfb.c             | 24 +++++++++++++++
 drivers/gpu/drm/sysfb/drm_sysfb_helper.h      |  8 ++---
 drivers/gpu/drm/sysfb/drm_sysfb_screen_info.c | 30 -------------------
 drivers/gpu/drm/sysfb/efidrm.c                |  8 ++++-
 drivers/gpu/drm/sysfb/vesadrm.c               |  8 ++++-
 5 files changed, 42 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/sysfb/drm_sysfb.c b/drivers/gpu/drm/sysfb/drm_sysfb.c
index 308f82153b15..fbfb37d0fae1 100644
--- a/drivers/gpu/drm/sysfb/drm_sysfb.c
+++ b/drivers/gpu/drm/sysfb/drm_sysfb.c
@@ -31,5 +31,29 @@ int drm_sysfb_get_validated_int0(struct drm_device *dev, const char *name,
 }
 EXPORT_SYMBOL(drm_sysfb_get_validated_int0);
 
+const struct drm_format_info *drm_sysfb_get_format(struct drm_device *dev,
+						   const struct drm_sysfb_format *formats,
+						   size_t nformats,
+						   const struct pixel_format *pixel)
+{
+	const struct drm_format_info *format = NULL;
+	size_t i;
+
+	for (i = 0; i < nformats; ++i) {
+		const struct drm_sysfb_format *f = &formats[i];
+
+		if (pixel_format_equal(pixel, &f->pixel)) {
+			format = drm_format_info(f->fourcc);
+			break;
+		}
+	}
+
+	if (!format)
+		drm_warn(dev, "No compatible color format found\n");
+
+	return format;
+}
+EXPORT_SYMBOL(drm_sysfb_get_format);
+
 MODULE_DESCRIPTION("Helpers for DRM sysfb drivers");
 MODULE_LICENSE("GPL");
diff --git a/drivers/gpu/drm/sysfb/drm_sysfb_helper.h b/drivers/gpu/drm/sysfb/drm_sysfb_helper.h
index de96bfe7562c..b14df5b54bc9 100644
--- a/drivers/gpu/drm/sysfb/drm_sysfb_helper.h
+++ b/drivers/gpu/drm/sysfb/drm_sysfb_helper.h
@@ -36,6 +36,10 @@ int drm_sysfb_get_validated_int(struct drm_device *dev, const char *name,
 				u64 value, u32 max);
 int drm_sysfb_get_validated_int0(struct drm_device *dev, const char *name,
 				 u64 value, u32 max);
+const struct drm_format_info *drm_sysfb_get_format(struct drm_device *dev,
+						   const struct drm_sysfb_format *formats,
+						   size_t nformats,
+						   const struct pixel_format *pixel);
 
 #if defined(CONFIG_SCREEN_INFO)
 int drm_sysfb_get_width_si(struct drm_device *dev, const struct screen_info *si);
@@ -48,10 +52,6 @@ int drm_sysfb_get_stride_si(struct drm_device *dev, const struct screen_info *si
 			    unsigned int width, unsigned int height, u64 size);
 u64 drm_sysfb_get_visible_size_si(struct drm_device *dev, const struct screen_info *si,
 				  unsigned int height, unsigned int stride, u64 size);
-const struct drm_format_info *drm_sysfb_get_format_si(struct drm_device *dev,
-						      const struct drm_sysfb_format *formats,
-						      size_t nformats,
-						      const struct screen_info *si);
 #endif
 
 /*
diff --git a/drivers/gpu/drm/sysfb/drm_sysfb_screen_info.c b/drivers/gpu/drm/sysfb/drm_sysfb_screen_info.c
index 885864168c54..749290196c6a 100644
--- a/drivers/gpu/drm/sysfb/drm_sysfb_screen_info.c
+++ b/drivers/gpu/drm/sysfb/drm_sysfb_screen_info.c
@@ -72,33 +72,3 @@ u64 drm_sysfb_get_visible_size_si(struct drm_device *dev, const struct screen_in
 	return drm_sysfb_get_validated_size0(dev, "visible size", vsize, size);
 }
 EXPORT_SYMBOL(drm_sysfb_get_visible_size_si);
-
-const struct drm_format_info *drm_sysfb_get_format_si(struct drm_device *dev,
-						      const struct drm_sysfb_format *formats,
-						      size_t nformats,
-						      const struct screen_info *si)
-{
-	const struct drm_format_info *format = NULL;
-	struct pixel_format pixel;
-	size_t i;
-	int ret;
-
-	ret = screen_info_pixel_format(si, &pixel);
-	if (ret)
-		return NULL;
-
-	for (i = 0; i < nformats; ++i) {
-		const struct drm_sysfb_format *f = &formats[i];
-
-		if (pixel_format_equal(&pixel, &f->pixel)) {
-			format = drm_format_info(f->fourcc);
-			break;
-		}
-	}
-
-	if (!format)
-		drm_warn(dev, "No compatible color format found\n");
-
-	return format;
-}
-EXPORT_SYMBOL(drm_sysfb_get_format_si);
diff --git a/drivers/gpu/drm/sysfb/efidrm.c b/drivers/gpu/drm/sysfb/efidrm.c
index 1b683d55d6ea..ee525f330441 100644
--- a/drivers/gpu/drm/sysfb/efidrm.c
+++ b/drivers/gpu/drm/sysfb/efidrm.c
@@ -45,8 +45,14 @@ static const struct drm_format_info *efidrm_get_format_si(struct drm_device *dev
 		{ PIXEL_FORMAT_XBGR8888, DRM_FORMAT_XBGR8888, },
 		{ PIXEL_FORMAT_XRGB2101010, DRM_FORMAT_XRGB2101010, },
 	};
+	struct pixel_format pixel;
+	int ret;
+
+	ret = screen_info_pixel_format(si, &pixel);
+	if (ret)
+		return NULL;
 
-	return drm_sysfb_get_format_si(dev, formats, ARRAY_SIZE(formats), si);
+	return drm_sysfb_get_format(dev, formats, ARRAY_SIZE(formats), &pixel);
 }
 
 static u64 efidrm_get_mem_flags(struct drm_device *dev, resource_size_t start,
diff --git a/drivers/gpu/drm/sysfb/vesadrm.c b/drivers/gpu/drm/sysfb/vesadrm.c
index 7b7b5ba26317..b8c16ae3faad 100644
--- a/drivers/gpu/drm/sysfb/vesadrm.c
+++ b/drivers/gpu/drm/sysfb/vesadrm.c
@@ -49,8 +49,14 @@ static const struct drm_format_info *vesadrm_get_format_si(struct drm_device *de
 		{ PIXEL_FORMAT_XBGR8888, DRM_FORMAT_XBGR8888, },
 		{ PIXEL_FORMAT_C8, DRM_FORMAT_C8, },
 	};
+	struct pixel_format pixel;
+	int ret;
+
+	ret = screen_info_pixel_format(si, &pixel);
+	if (ret)
+		return NULL;
 
-	return drm_sysfb_get_format_si(dev, formats, ARRAY_SIZE(formats), si);
+	return drm_sysfb_get_format(dev, formats, ARRAY_SIZE(formats), &pixel);
 }
 
 /*
-- 
2.52.0

