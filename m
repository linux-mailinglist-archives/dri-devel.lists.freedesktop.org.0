Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0PEAOHH+gWmYNgMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 14:56:01 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D69DA3FB
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 14:56:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1F6810E67C;
	Tue,  3 Feb 2026 13:55:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="mtUib12A";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="tbpCO+s/";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mtUib12A";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="tbpCO+s/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D67810E67C
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Feb 2026 13:55:58 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D598A5BCD1;
 Tue,  3 Feb 2026 13:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1770126930; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JvSlecGw1g6arIANSsIRSRrSzxuSgdqZjf1K88KFbt4=;
 b=mtUib12A43mkajv5rTDchFPcEQvp9109SoKs8w8aIxpDMZXztmCfOZg+YeCmfkB07n3qgA
 Evt8OON6BhiPrKIonPXNssIBOo2PU2NutOS5AYaNk7vbBnKnPgoBnosclrSBmvur8aUsOG
 0JJmy2XTszfUd5m6poHrT3hVszck09k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1770126930;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JvSlecGw1g6arIANSsIRSRrSzxuSgdqZjf1K88KFbt4=;
 b=tbpCO+s//oelNpZ5RgCxZNfor3JgK4Bi3QoM8W3HJ9s98kFqremGl27awCqGLjK8PyIucq
 HGnntH3buP4834BA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1770126930; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JvSlecGw1g6arIANSsIRSRrSzxuSgdqZjf1K88KFbt4=;
 b=mtUib12A43mkajv5rTDchFPcEQvp9109SoKs8w8aIxpDMZXztmCfOZg+YeCmfkB07n3qgA
 Evt8OON6BhiPrKIonPXNssIBOo2PU2NutOS5AYaNk7vbBnKnPgoBnosclrSBmvur8aUsOG
 0JJmy2XTszfUd5m6poHrT3hVszck09k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1770126930;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JvSlecGw1g6arIANSsIRSRrSzxuSgdqZjf1K88KFbt4=;
 b=tbpCO+s//oelNpZ5RgCxZNfor3JgK4Bi3QoM8W3HJ9s98kFqremGl27awCqGLjK8PyIucq
 HGnntH3buP4834BA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7E84B3EA63;
 Tue,  3 Feb 2026 13:55:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id GAOzHVL+gWlGDwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 03 Feb 2026 13:55:30 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: tzungbi@kernel.org, briannorris@chromium.org, jwerner@chromium.org,
 javierm@redhat.com, samuel@sholland.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch
Cc: chrome-platform@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 12/12] drm/sysfb: corebootdrm: Support panel orientation
Date: Tue,  3 Feb 2026 14:52:31 +0100
Message-ID: <20260203135519.417931-13-tzimmermann@suse.de>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,suse.de:email,suse.de:dkim,suse.de:mid]
X-Rspamd-Queue-Id: 82D69DA3FB
X-Rspamd-Action: no action

Add fields and constants for coreboot framebuffer orientation. Set
corebootdrm's DRM connector state from the values. Not all firmware
provides orientation, so make it optional. Systems without, continue
to use unknown orientation.

v3:
- comment on _HAS_ORIENTATION semantics (Tzung-Bi)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Julius Werner <jwerner@chromium.org>
---
 drivers/gpu/drm/sysfb/corebootdrm.c | 30 +++++++++++++++++++++++++----
 include/linux/coreboot.h            | 13 +++++++++++++
 2 files changed, 39 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/sysfb/corebootdrm.c b/drivers/gpu/drm/sysfb/corebootdrm.c
index 745318580a5d..5dc6f3c76f7b 100644
--- a/drivers/gpu/drm/sysfb/corebootdrm.c
+++ b/drivers/gpu/drm/sysfb/corebootdrm.c
@@ -110,6 +110,26 @@ static phys_addr_t corebootdrm_get_address_fb(struct drm_device *dev, resource_s
 	return fb->physical_address;
 }
 
+static enum drm_panel_orientation corebootdrm_get_orientation_fb(struct drm_device *dev,
+								 const struct lb_framebuffer *fb)
+{
+	if (!LB_FRAMEBUFFER_HAS_ORIENTATION(fb))
+		return DRM_MODE_PANEL_ORIENTATION_UNKNOWN;
+
+	switch (fb->orientation) {
+	case LB_FRAMEBUFFER_ORIENTATION_NORMAL:
+		return DRM_MODE_PANEL_ORIENTATION_NORMAL;
+	case LB_FRAMEBUFFER_ORIENTATION_BOTTOM_UP:
+		return DRM_MODE_PANEL_ORIENTATION_BOTTOM_UP;
+	case LB_FRAMEBUFFER_ORIENTATION_LEFT_UP:
+		return DRM_MODE_PANEL_ORIENTATION_LEFT_UP;
+	case LB_FRAMEBUFFER_ORIENTATION_RIGHT_UP:
+		return DRM_MODE_PANEL_ORIENTATION_RIGHT_UP;
+	}
+
+	return DRM_MODE_PANEL_ORIENTATION_UNKNOWN;
+}
+
 /*
  * Simple Framebuffer device
  */
@@ -168,7 +188,8 @@ static const struct drm_mode_config_funcs corebootdrm_mode_config_funcs = {
 	DRM_SYSFB_MODE_CONFIG_FUNCS,
 };
 
-static int corebootdrm_mode_config_init(struct corebootdrm_device *cdev)
+static int corebootdrm_mode_config_init(struct corebootdrm_device *cdev,
+					enum drm_panel_orientation orientation)
 {
 	struct drm_sysfb_device *sysfb = &cdev->sysfb;
 	struct drm_device *dev = &sysfb->dev;
@@ -234,8 +255,7 @@ static int corebootdrm_mode_config_init(struct corebootdrm_device *cdev)
 	if (ret)
 		return ret;
 	drm_connector_helper_add(connector, &corebootdrm_connector_helper_funcs);
-	drm_connector_set_panel_orientation_with_quirk(connector,
-						       DRM_MODE_PANEL_ORIENTATION_UNKNOWN,
+	drm_connector_set_panel_orientation_with_quirk(connector, orientation,
 						       width, height);
 
 	ret = drm_connector_attach_encoder(connector, encoder);
@@ -276,6 +296,7 @@ static int corebootdrm_probe(struct platform_device *pdev)
 	int width, height, pitch;
 	resource_size_t size;
 	phys_addr_t address;
+	enum drm_panel_orientation orientation;
 	struct resource *res, *mem = NULL;
 	struct resource aperture;
 	void __iomem *screen_base;
@@ -320,6 +341,7 @@ static int corebootdrm_probe(struct platform_device *pdev)
 	address = corebootdrm_get_address_fb(dev, size, fb);
 	if (!address)
 		return -EINVAL;
+	orientation = corebootdrm_get_orientation_fb(dev, fb);
 
 	sysfb->fb_mode = drm_sysfb_mode(width, height, 0, 0);
 	sysfb->fb_format = format;
@@ -375,7 +397,7 @@ static int corebootdrm_probe(struct platform_device *pdev)
 	 * DRM mode setting and registration
 	 */
 
-	ret = corebootdrm_mode_config_init(cdev);
+	ret = corebootdrm_mode_config_init(cdev, orientation);
 	if (ret)
 		return ret;
 
diff --git a/include/linux/coreboot.h b/include/linux/coreboot.h
index b51665165f9f..de9652e1a53f 100644
--- a/include/linux/coreboot.h
+++ b/include/linux/coreboot.h
@@ -47,6 +47,11 @@ struct lb_cbmem_entry {
 	u32 id;
 };
 
+#define LB_FRAMEBUFFER_ORIENTATION_NORMAL	0
+#define LB_FRAMEBUFFER_ORIENTATION_BOTTOM_UP	1
+#define LB_FRAMEBUFFER_ORIENTATION_LEFT_UP	2
+#define LB_FRAMEBUFFER_ORIENTATION_RIGHT_UP	3
+
 /* Describes framebuffer setup by coreboot */
 struct lb_framebuffer {
 	u32 tag;
@@ -65,6 +70,7 @@ struct lb_framebuffer {
 	u8  blue_mask_size;
 	u8  reserved_mask_pos;
 	u8  reserved_mask_size;
+	u8  orientation;
 };
 
 /*
@@ -74,4 +80,11 @@ struct lb_framebuffer {
 #define LB_FRAMEBUFFER_HAS_LFB(__fb) \
 	((__fb)->size >= offsetofend(struct lb_framebuffer, reserved_mask_size))
 
+/*
+ * True if the coreboot-provided data is large enough to hold information
+ * on the display orientation. False otherwise.
+ */
+#define LB_FRAMEBUFFER_HAS_ORIENTATION(__fb) \
+	((__fb)->size >= offsetofend(struct lb_framebuffer, orientation))
+
 #endif /* _LINUX_COREBOOT_H */
-- 
2.52.0

