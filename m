Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF9B631EA6
	for <lists+dri-devel@lfdr.de>; Mon, 21 Nov 2022 11:45:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB32210E0F3;
	Mon, 21 Nov 2022 10:45:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA0DF10E16C
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Nov 2022 10:45:37 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 75CC1220CC;
 Mon, 21 Nov 2022 10:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1669027536; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wo+ym0sWfs4A/GYo0RuKp0U7eHsmQP1pJsCuo/u2v3I=;
 b=IhcB6GVgKhlIcFcLXKyqIVtSXb0xBPMZggvp6nqOAT2quwOUnEAUMqSNmD70b9SDwAO1EK
 OssfK1ZIrbKIz4SXC4UIxoLcgENOKxT0xaL0iLLjEc6VLDdBpTzZ1cWmeeIjwa0TxKm8Hl
 jS02nprzmrOD9j9qh06RfeiiivWFO5k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1669027536;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wo+ym0sWfs4A/GYo0RuKp0U7eHsmQP1pJsCuo/u2v3I=;
 b=tiQQ31DFilI/YgChKocBgsygCTwPGWe7cmexWmwZMvYT2lo9LPEZNLtXFu7PuZny5ayYLl
 odA4QxJsBp4KNHBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2B9071376E;
 Mon, 21 Nov 2022 10:45:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id aGa+CdBWe2NaGQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 21 Nov 2022 10:45:36 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, thierry.reding@gmail.com,
 sam@ravnborg.org, emma@anholt.net, david@lechnology.com,
 kamlesh.gurudasani@gmail.com, noralf@tronnes.org, javierm@redhat.com
Subject: [PATCH 4/8] drm/mipi-dbi: Initialize default driver functions with
 macro
Date: Mon, 21 Nov 2022 11:45:28 +0100
Message-Id: <20221121104532.8301-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221121104532.8301-1-tzimmermann@suse.de>
References: <20221121104532.8301-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Introduce DRM_MIPI_DBI_SIMPLE_DISPLAY_PIPE_FUNCS to initialize MIPI-DBI
helpers to default values and convert drivers. The prepare_fb function
set by some drivers is called implicitly by simple-kms helpers, so leave
it out.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/panel/panel-ilitek-ili9341.c |  5 +----
 drivers/gpu/drm/tiny/hx8357d.c               |  5 +----
 drivers/gpu/drm/tiny/ili9163.c               |  5 +----
 drivers/gpu/drm/tiny/ili9341.c               |  5 +----
 drivers/gpu/drm/tiny/ili9486.c               |  5 +----
 drivers/gpu/drm/tiny/mi0283qt.c              |  5 +----
 drivers/gpu/drm/tiny/panel-mipi-dbi.c        |  5 +----
 drivers/gpu/drm/tiny/st7735r.c               |  5 +----
 include/drm/drm_mipi_dbi.h                   | 16 ++++++++++++++++
 9 files changed, 24 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9341.c b/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
index be088983aa7c7..3fdf884b3257f 100644
--- a/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
@@ -577,10 +577,7 @@ static void ili9341_dbi_enable(struct drm_simple_display_pipe *pipe,
 }
 
 static const struct drm_simple_display_pipe_funcs ili9341_dbi_funcs = {
-	.mode_valid = mipi_dbi_pipe_mode_valid,
-	.enable = ili9341_dbi_enable,
-	.disable = mipi_dbi_pipe_disable,
-	.update = mipi_dbi_pipe_update,
+	DRM_MIPI_DBI_SIMPLE_DISPLAY_PIPE_FUNCS(ili9341_dbi_enable),
 };
 
 static const struct drm_display_mode ili9341_dbi_mode = {
diff --git a/drivers/gpu/drm/tiny/hx8357d.c b/drivers/gpu/drm/tiny/hx8357d.c
index 9f634f720817b..cdc4486e059b5 100644
--- a/drivers/gpu/drm/tiny/hx8357d.c
+++ b/drivers/gpu/drm/tiny/hx8357d.c
@@ -181,10 +181,7 @@ static void yx240qv29_enable(struct drm_simple_display_pipe *pipe,
 }
 
 static const struct drm_simple_display_pipe_funcs hx8357d_pipe_funcs = {
-	.mode_valid = mipi_dbi_pipe_mode_valid,
-	.enable = yx240qv29_enable,
-	.disable = mipi_dbi_pipe_disable,
-	.update = mipi_dbi_pipe_update,
+	DRM_MIPI_DBI_SIMPLE_DISPLAY_PIPE_FUNCS(yx240qv29_enable),
 };
 
 static const struct drm_display_mode yx350hv15_mode = {
diff --git a/drivers/gpu/drm/tiny/ili9163.c b/drivers/gpu/drm/tiny/ili9163.c
index 835ed12792d56..bc4384d410fcc 100644
--- a/drivers/gpu/drm/tiny/ili9163.c
+++ b/drivers/gpu/drm/tiny/ili9163.c
@@ -100,10 +100,7 @@ static void yx240qv29_enable(struct drm_simple_display_pipe *pipe,
 }
 
 static const struct drm_simple_display_pipe_funcs ili9163_pipe_funcs = {
-	.mode_valid = mipi_dbi_pipe_mode_valid,
-	.enable = yx240qv29_enable,
-	.disable = mipi_dbi_pipe_disable,
-	.update = mipi_dbi_pipe_update,
+	DRM_MIPI_DBI_SIMPLE_DISPLAY_PIPE_FUNCS(yx240qv29_enable),
 };
 
 static const struct drm_display_mode yx240qv29_mode = {
diff --git a/drivers/gpu/drm/tiny/ili9341.c b/drivers/gpu/drm/tiny/ili9341.c
index 420f6005a9568..47b61c3bf1457 100644
--- a/drivers/gpu/drm/tiny/ili9341.c
+++ b/drivers/gpu/drm/tiny/ili9341.c
@@ -137,10 +137,7 @@ static void yx240qv29_enable(struct drm_simple_display_pipe *pipe,
 }
 
 static const struct drm_simple_display_pipe_funcs ili9341_pipe_funcs = {
-	.mode_valid = mipi_dbi_pipe_mode_valid,
-	.enable = yx240qv29_enable,
-	.disable = mipi_dbi_pipe_disable,
-	.update = mipi_dbi_pipe_update,
+	DRM_MIPI_DBI_SIMPLE_DISPLAY_PIPE_FUNCS(yx240qv29_enable),
 };
 
 static const struct drm_display_mode yx240qv29_mode = {
diff --git a/drivers/gpu/drm/tiny/ili9486.c b/drivers/gpu/drm/tiny/ili9486.c
index 1bb847466b107..9f735d84d85d4 100644
--- a/drivers/gpu/drm/tiny/ili9486.c
+++ b/drivers/gpu/drm/tiny/ili9486.c
@@ -150,10 +150,7 @@ static void waveshare_enable(struct drm_simple_display_pipe *pipe,
 }
 
 static const struct drm_simple_display_pipe_funcs waveshare_pipe_funcs = {
-	.mode_valid = mipi_dbi_pipe_mode_valid,
-	.enable = waveshare_enable,
-	.disable = mipi_dbi_pipe_disable,
-	.update = mipi_dbi_pipe_update,
+	DRM_MIPI_DBI_SIMPLE_DISPLAY_PIPE_FUNCS(waveshare_enable),
 };
 
 static const struct drm_display_mode waveshare_mode = {
diff --git a/drivers/gpu/drm/tiny/mi0283qt.c b/drivers/gpu/drm/tiny/mi0283qt.c
index 47df2b5a3048f..01ff43c8ac3ff 100644
--- a/drivers/gpu/drm/tiny/mi0283qt.c
+++ b/drivers/gpu/drm/tiny/mi0283qt.c
@@ -141,10 +141,7 @@ static void mi0283qt_enable(struct drm_simple_display_pipe *pipe,
 }
 
 static const struct drm_simple_display_pipe_funcs mi0283qt_pipe_funcs = {
-	.mode_valid = mipi_dbi_pipe_mode_valid,
-	.enable = mi0283qt_enable,
-	.disable = mipi_dbi_pipe_disable,
-	.update = mipi_dbi_pipe_update,
+	DRM_MIPI_DBI_SIMPLE_DISPLAY_PIPE_FUNCS(mi0283qt_enable),
 };
 
 static const struct drm_display_mode mi0283qt_mode = {
diff --git a/drivers/gpu/drm/tiny/panel-mipi-dbi.c b/drivers/gpu/drm/tiny/panel-mipi-dbi.c
index 03a7d569cd568..2ed23ded51997 100644
--- a/drivers/gpu/drm/tiny/panel-mipi-dbi.c
+++ b/drivers/gpu/drm/tiny/panel-mipi-dbi.c
@@ -212,10 +212,7 @@ static void panel_mipi_dbi_enable(struct drm_simple_display_pipe *pipe,
 }
 
 static const struct drm_simple_display_pipe_funcs panel_mipi_dbi_pipe_funcs = {
-	.mode_valid = mipi_dbi_pipe_mode_valid,
-	.enable = panel_mipi_dbi_enable,
-	.disable = mipi_dbi_pipe_disable,
-	.update = mipi_dbi_pipe_update,
+	DRM_MIPI_DBI_SIMPLE_DISPLAY_PIPE_FUNCS(panel_mipi_dbi_enable),
 };
 
 DEFINE_DRM_GEM_DMA_FOPS(panel_mipi_dbi_fops);
diff --git a/drivers/gpu/drm/tiny/st7735r.c b/drivers/gpu/drm/tiny/st7735r.c
index 15d9cf283c66a..477eb36fbb70d 100644
--- a/drivers/gpu/drm/tiny/st7735r.c
+++ b/drivers/gpu/drm/tiny/st7735r.c
@@ -133,10 +133,7 @@ static void st7735r_pipe_enable(struct drm_simple_display_pipe *pipe,
 }
 
 static const struct drm_simple_display_pipe_funcs st7735r_pipe_funcs = {
-	.mode_valid	= mipi_dbi_pipe_mode_valid,
-	.enable		= st7735r_pipe_enable,
-	.disable	= mipi_dbi_pipe_disable,
-	.update		= mipi_dbi_pipe_update,
+	DRM_MIPI_DBI_SIMPLE_DISPLAY_PIPE_FUNCS(st7735r_pipe_enable),
 };
 
 static const struct st7735r_cfg jd_t18003_t01_cfg = {
diff --git a/include/drm/drm_mipi_dbi.h b/include/drm/drm_mipi_dbi.h
index 14eaecb1825c1..8c4ea7956d61d 100644
--- a/include/drm/drm_mipi_dbi.h
+++ b/include/drm/drm_mipi_dbi.h
@@ -207,4 +207,20 @@ void mipi_dbi_debugfs_init(struct drm_minor *minor);
 static inline void mipi_dbi_debugfs_init(struct drm_minor *minor) {}
 #endif
 
+/**
+ * DRM_MIPI_DBI_SIMPLE_DISPLAY_PIPE_FUNCS - Initializes struct drm_simple_display_pipe_funcs
+ *                                          for MIPI-DBI devices
+ * @enable_: Enable-callback implementation
+ *
+ * This macro initializes struct drm_simple_display_pipe_funcs with default
+ * values for MIPI-DBI-based devices. The only callback that depends on the
+ * hardware is @enable, for which the driver has to provide an implementation.
+ * MIPI-based drivers are encouraged to use this macro for initialization.
+ */
+#define DRM_MIPI_DBI_SIMPLE_DISPLAY_PIPE_FUNCS(enable_) \
+	.mode_valid = mipi_dbi_pipe_mode_valid, \
+	.enable = (enable_), \
+	.disable = mipi_dbi_pipe_disable, \
+	.update = mipi_dbi_pipe_update
+
 #endif /* __LINUX_MIPI_DBI_H */
-- 
2.38.1

