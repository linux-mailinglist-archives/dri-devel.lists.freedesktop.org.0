Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iCjDE6bFnWnsRwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 16:37:10 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC6511891B6
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 16:37:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5360510E5B1;
	Tue, 24 Feb 2026 15:37:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="uuLfyH9B";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wJ9og0cQ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="uuLfyH9B";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wJ9og0cQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7626110E32C
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 15:37:03 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3FBD45BCE2;
 Tue, 24 Feb 2026 15:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1771947422; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FK/8vaZYqKh/zUnAyglgrR1UTxbY/eRDMVsbaDS/2qA=;
 b=uuLfyH9Bg8WAl2J/z6Wwa3fTnVVQGMGw6spAlS6ojLrJ1rmJoJ39GzzPCXGfpa7DHgF34F
 97M6RaPXkcer3fZzBgX+ndn4IE3Bjc9OAbAa/vghh/F9hVo8dGP3XIb2p4N6AbEb0hchuK
 QOt23BkYT0lciiPP71PKaZkMjdgDh5c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1771947422;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FK/8vaZYqKh/zUnAyglgrR1UTxbY/eRDMVsbaDS/2qA=;
 b=wJ9og0cQoj2snn/hQcZock/HcdZCGqylXZY09fvIDMwxNVGA17ZoiV3R2kpH8BWjBV3hhx
 nxo/LmVVyKXrRyBg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1771947422; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FK/8vaZYqKh/zUnAyglgrR1UTxbY/eRDMVsbaDS/2qA=;
 b=uuLfyH9Bg8WAl2J/z6Wwa3fTnVVQGMGw6spAlS6ojLrJ1rmJoJ39GzzPCXGfpa7DHgF34F
 97M6RaPXkcer3fZzBgX+ndn4IE3Bjc9OAbAa/vghh/F9hVo8dGP3XIb2p4N6AbEb0hchuK
 QOt23BkYT0lciiPP71PKaZkMjdgDh5c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1771947422;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FK/8vaZYqKh/zUnAyglgrR1UTxbY/eRDMVsbaDS/2qA=;
 b=wJ9og0cQoj2snn/hQcZock/HcdZCGqylXZY09fvIDMwxNVGA17ZoiV3R2kpH8BWjBV3hhx
 nxo/LmVVyKXrRyBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D330E3EA68;
 Tue, 24 Feb 2026 15:37:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 6AUhMp3FnWm0FgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 24 Feb 2026 15:37:01 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, lanzano.alex@gmail.com, kamlesh.gurudasani@gmail.com,
 david@lechnology.com, architanant5@gmail.com, wens@kernel.org,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com, simona@ffwll.ch,
 airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 02/16] drm/mipi-dbi: Support custom pipelines with
 drm_mipi_dbi_dev_init()
Date: Tue, 24 Feb 2026 16:24:39 +0100
Message-ID: <20260224153656.261351-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260224153656.261351-1-tzimmermann@suse.de>
References: <20260224153656.261351-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -1.30
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
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[redhat.com,gmail.com,lechnology.com,kernel.org,linux.intel.com,ffwll.ch];
	FORGED_RECIPIENTS(0.00)[m:javierm@redhat.com,m:lanzano.alex@gmail.com,m:kamlesh.gurudasani@gmail.com,m:david@lechnology.com,m:architanant5@gmail.com,m:wens@kernel.org,m:mripard@kernel.org,m:maarten.lankhorst@linux.intel.com,m:simona@ffwll.ch,m:airlied@gmail.com,m:tzimmermann@suse.de,m:lanzanoalex@gmail.com,m:kamleshgurudasani@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[suse.de:+];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,suse.de:mid,suse.de:dkim,suse.de:email]
X-Rspamd-Queue-Id: DC6511891B6
X-Rspamd-Action: no action

Initialize the mipi-dbi device with drm_mipi_dbi_dev_init() without
creating a modesetting pipeline. Will allow for mipi-dbi drivers
without simple-display helpers.

As the new helper is a DRM function, add the drm_ prefix. Mipi-dbi
interfaces currently lack this.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_mipi_dbi.c | 76 ++++++++++++++++++++++++----------
 include/drm/drm_mipi_dbi.h     |  4 ++
 2 files changed, 57 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.c
index bb6cebc583be..86f38d59c6e9 100644
--- a/drivers/gpu/drm/drm_mipi_dbi.c
+++ b/drivers/gpu/drm/drm_mipi_dbi.c
@@ -554,6 +554,55 @@ static const uint32_t mipi_dbi_formats[] = {
 	DRM_FORMAT_XRGB8888,
 };
 
+/**
+ * drm_mipi_dbi_dev_init - MIPI DBI device initialization
+ * @dbidev: MIPI DBI device structure to initialize
+ * @mode: Hardware display mode
+ * @format: Hardware color format (DRM_FORMAT\_\*).
+ * @rotation: Initial rotation in degrees Counter Clock Wise
+ * @tx_buf_size: Allocate a transmit buffer of this size.
+ *
+ * Returns:
+ * Zero on success, negative error code on failure.
+ */
+int drm_mipi_dbi_dev_init(struct mipi_dbi_dev *dbidev, const struct drm_display_mode *mode,
+			  u32 format, unsigned int rotation, size_t tx_buf_size)
+{
+	struct drm_device *drm = &dbidev->drm;
+	int ret;
+
+	if (!dbidev->dbi.command)
+		return -EINVAL;
+
+	if (!tx_buf_size) {
+		const struct drm_format_info *info = drm_format_info(format);
+
+		tx_buf_size = drm_format_info_min_pitch(info, 0, mode->hdisplay) *
+			      mode->vdisplay;
+	}
+
+	dbidev->tx_buf = devm_kmalloc(drm->dev, tx_buf_size, GFP_KERNEL);
+	if (!dbidev->tx_buf)
+		return -ENOMEM;
+
+	drm_mode_copy(&dbidev->mode, mode);
+	ret = mipi_dbi_rotate_mode(&dbidev->mode, rotation);
+	if (ret) {
+		drm_err(drm, "Illegal rotation value %u\n", rotation);
+		return -EINVAL;
+	}
+
+	dbidev->rotation = rotation;
+	drm_dbg(drm, "rotation = %u\n", rotation);
+
+	dbidev->pixel_format = format;
+	if (dbidev->pixel_format == DRM_FORMAT_RGB888)
+		dbidev->dbi.write_memory_bpw = 8;
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_mipi_dbi_dev_init);
+
 /**
  * mipi_dbi_dev_init_with_formats - MIPI DBI device initialization with custom formats
  * @dbidev: MIPI DBI device structure to initialize
@@ -590,24 +639,14 @@ int mipi_dbi_dev_init_with_formats(struct mipi_dbi_dev *dbidev,
 	struct drm_device *drm = &dbidev->drm;
 	int ret;
 
-	if (!dbidev->dbi.command)
-		return -EINVAL;
+	ret = drm_mipi_dbi_dev_init(dbidev, mode, formats[0], rotation, tx_buf_size);
+	if (ret)
+		return ret;
 
 	ret = drmm_mode_config_init(drm);
 	if (ret)
 		return ret;
 
-	dbidev->tx_buf = devm_kmalloc(drm->dev, tx_buf_size, GFP_KERNEL);
-	if (!dbidev->tx_buf)
-		return -ENOMEM;
-
-	drm_mode_copy(&dbidev->mode, mode);
-	ret = mipi_dbi_rotate_mode(&dbidev->mode, rotation);
-	if (ret) {
-		DRM_ERROR("Illegal rotation value %u\n", rotation);
-		return -EINVAL;
-	}
-
 	drm_connector_helper_add(&dbidev->connector, &mipi_dbi_connector_hfuncs);
 	ret = drm_connector_init(drm, &dbidev->connector, &mipi_dbi_connector_funcs,
 				 DRM_MODE_CONNECTOR_SPI);
@@ -628,13 +667,6 @@ int mipi_dbi_dev_init_with_formats(struct mipi_dbi_dev *dbidev,
 	drm->mode_config.max_height = dbidev->mode.vdisplay;
 	drm->mode_config.helper_private = &mipi_dbi_mode_config_helper_funcs;
 
-	dbidev->rotation = rotation;
-	dbidev->pixel_format = formats[0];
-	if (formats[0] == DRM_FORMAT_RGB888)
-		dbidev->dbi.write_memory_bpw = 8;
-
-	DRM_DEBUG_KMS("rotation = %u\n", rotation);
-
 	return 0;
 }
 EXPORT_SYMBOL(mipi_dbi_dev_init_with_formats);
@@ -660,13 +692,11 @@ int mipi_dbi_dev_init(struct mipi_dbi_dev *dbidev,
 		      const struct drm_simple_display_pipe_funcs *funcs,
 		      const struct drm_display_mode *mode, unsigned int rotation)
 {
-	size_t bufsize = (u32)mode->vdisplay * mode->hdisplay * sizeof(u16);
-
 	dbidev->drm.mode_config.preferred_depth = 16;
 
 	return mipi_dbi_dev_init_with_formats(dbidev, funcs, mipi_dbi_formats,
 					      ARRAY_SIZE(mipi_dbi_formats), mode,
-					      rotation, bufsize);
+					      rotation, 0);
 }
 EXPORT_SYMBOL(mipi_dbi_dev_init);
 
diff --git a/include/drm/drm_mipi_dbi.h b/include/drm/drm_mipi_dbi.h
index 637be84d3d5a..9c0e015dd929 100644
--- a/include/drm/drm_mipi_dbi.h
+++ b/include/drm/drm_mipi_dbi.h
@@ -164,6 +164,10 @@ static inline struct mipi_dbi_dev *drm_to_mipi_dbi_dev(struct drm_device *drm)
 
 int mipi_dbi_spi_init(struct spi_device *spi, struct mipi_dbi *dbi,
 		      struct gpio_desc *dc);
+
+int drm_mipi_dbi_dev_init(struct mipi_dbi_dev *dbidev, const struct drm_display_mode *mode,
+			  u32 format, unsigned int rotation, size_t tx_buf_size);
+
 int mipi_dbi_dev_init_with_formats(struct mipi_dbi_dev *dbidev,
 				   const struct drm_simple_display_pipe_funcs *funcs,
 				   const uint32_t *formats, unsigned int format_count,
-- 
2.52.0

