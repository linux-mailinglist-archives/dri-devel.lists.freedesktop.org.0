Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF891D4643
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 08:53:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15EDE6EBDF;
	Fri, 15 May 2020 06:53:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 283DB6E155
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 11:42:50 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id g12so28104201wmh.3
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 04:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jxE409dH/4Upz04x81rZgDRqIGYrdN0NQ92McvYwahc=;
 b=G26NjolYY71SSgYOvfQ9hFGOJjAVarSFQ5F+YvV+fDnbit1ULIMKeFVluFKNr1RFha
 MDkl0esxdkvTkoMhf+sblaFcd3hyxXgsSrUnaOu7xjqRU3IcwHuzcOr8SxCtnx0JaA02
 bL2GvGPHtY9UywWis73WzRirPpk5G45Q3bXxpJmxjeAPSFMXxW/6pDZ+HG90L5O/41wY
 j9JAIirRI8CLT7dGWEcUcf2KqxnK/jpyop0dV0o2xeJGnYVqp/vysGEVQ/Sy+96jQL4o
 6xX7SvYi4gMRveypIMyvXIww2/YDUuy7edI5e/N6ixClHgra4ctF4Sb3M9LMuniN9UzX
 Yj2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jxE409dH/4Upz04x81rZgDRqIGYrdN0NQ92McvYwahc=;
 b=RZu6QxoN5kH7RUCXw9lnTh6ymzZfbJFY1sp5rrc033RgdaxSMDYAtf4UIJqri6fKOw
 1s8WuUo/UzffgoES+NSBhyzqwQBj3cAKTMvdTn4AH+kZM98XfsnKNs1rUju+uTu3zHRO
 EQFcVAONMdjlTC3Xj72CyF110f6l0TQzyqxafpX7OlbQtsyU2embqbruORrAEhlUHdGa
 Dar+sj6RQskAqCowwkujFc6w08Nsc46r8yMKdJYUYhDUVP/wsS05xrZCh4rT3jLhQgfR
 SMo0+dOgbNotti3qxtRW6QpkPadCAKT/O8NVaMuYB8SrVusBEjaewuo0ym91oh+1QPS1
 gAAA==
X-Gm-Message-State: AOAM531rP9SdhnNrhFMsaBeD5GheJHZ5Fxu03/zxPajqCzmyi0frKnR5
 Nm/n9Gdam29zzkqk8yf5alk=
X-Google-Smtp-Source: ABdhPJy85//sZjpctOGBtlCkbXzipuZquXuYRBdMj4Fzb0yFmyb512H4LYYbhxROEgcGPJdTvWvf4w==
X-Received: by 2002:a7b:cc92:: with SMTP id p18mr2082671wma.174.1589370168708; 
 Wed, 13 May 2020 04:42:48 -0700 (PDT)
Received: from wambui.zuku.co.ke ([197.237.182.195])
 by smtp.googlemail.com with ESMTPSA id j2sm27484540wrp.47.2020.05.13.04.42.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 May 2020 04:42:48 -0700 (PDT)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [RFC PATCH 3/3] drm: use new debugfs functions for various files.
Date: Wed, 13 May 2020 14:41:29 +0300
Message-Id: <20200513114130.28641-4-wambui.karugax@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200513114130.28641-1-wambui.karugax@gmail.com>
References: <20200513114130.28641-1-wambui.karugax@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 15 May 2020 06:52:55 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace the use of drm_debugfs_create_files with the new
drm_debugfs_add_files() to create various drm core debugfs files.

DRM debugfs files are also represented using the new drm_simple_info
struct for use with the new functions.

Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
---
 drivers/gpu/drm/drm_atomic.c      | 11 +++++------
 drivers/gpu/drm/drm_client.c      | 11 +++++------
 drivers/gpu/drm/drm_framebuffer.c | 11 +++++------
 3 files changed, 15 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 965173fd0ac2..1ec8d74955fd 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -1627,8 +1627,8 @@ EXPORT_SYMBOL(drm_state_dump);
 #ifdef CONFIG_DEBUG_FS
 static int drm_state_info(struct seq_file *m, void *data)
 {
-	struct drm_info_node *node = (struct drm_info_node *) m->private;
-	struct drm_device *dev = node->minor->dev;
+	struct drm_simple_info_entry *entry = m->private;
+	struct drm_device *dev = entry->dev;
 	struct drm_printer p = drm_seq_file_printer(m);
 
 	__drm_state_dump(dev, &p, true);
@@ -1637,14 +1637,13 @@ static int drm_state_info(struct seq_file *m, void *data)
 }
 
 /* any use in debugfs files to dump individual planes/crtc/etc? */
-static const struct drm_info_list drm_atomic_debugfs_list[] = {
+static const struct drm_simple_info drm_atomic_debugfs_list[] = {
 	{"state", drm_state_info, 0},
 };
 
 void drm_atomic_debugfs_init(struct drm_minor *minor)
 {
-	drm_debugfs_create_files(drm_atomic_debugfs_list,
-				 ARRAY_SIZE(drm_atomic_debugfs_list),
-				 minor->debugfs_root, minor);
+	drm_debugfs_add_files(minor->dev, drm_atomic_debugfs_list,
+			      ARRAY_SIZE(drm_atomic_debugfs_list));
 }
 #endif
diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client.c
index 8cb93f5209a4..e899683f752d 100644
--- a/drivers/gpu/drm/drm_client.c
+++ b/drivers/gpu/drm/drm_client.c
@@ -440,8 +440,8 @@ EXPORT_SYMBOL(drm_client_framebuffer_delete);
 #ifdef CONFIG_DEBUG_FS
 static int drm_client_debugfs_internal_clients(struct seq_file *m, void *data)
 {
-	struct drm_info_node *node = m->private;
-	struct drm_device *dev = node->minor->dev;
+	struct drm_simple_info_entry *entry = m->private;
+	struct drm_device *dev = entry->dev;
 	struct drm_printer p = drm_seq_file_printer(m);
 	struct drm_client_dev *client;
 
@@ -453,14 +453,13 @@ static int drm_client_debugfs_internal_clients(struct seq_file *m, void *data)
 	return 0;
 }
 
-static const struct drm_info_list drm_client_debugfs_list[] = {
+static const struct drm_simple_info drm_client_debugfs_list[] = {
 	{ "internal_clients", drm_client_debugfs_internal_clients, 0 },
 };
 
 void drm_client_debugfs_init(struct drm_minor *minor)
 {
-	drm_debugfs_create_files(drm_client_debugfs_list,
-				 ARRAY_SIZE(drm_client_debugfs_list),
-				 minor->debugfs_root, minor);
+	drm_debugfs_add_files(minor->dev, drm_client_debugfs_list,
+			      ARRAY_SIZE(drm_client_debugfs_list));
 }
 #endif
diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_framebuffer.c
index 0375b3d7f8d0..8fd346279c01 100644
--- a/drivers/gpu/drm/drm_framebuffer.c
+++ b/drivers/gpu/drm/drm_framebuffer.c
@@ -1188,8 +1188,8 @@ void drm_framebuffer_print_info(struct drm_printer *p, unsigned int indent,
 #ifdef CONFIG_DEBUG_FS
 static int drm_framebuffer_info(struct seq_file *m, void *data)
 {
-	struct drm_info_node *node = m->private;
-	struct drm_device *dev = node->minor->dev;
+	struct drm_simple_info_entry *entry = m->private;
+	struct drm_device *dev = entry->dev;
 	struct drm_printer p = drm_seq_file_printer(m);
 	struct drm_framebuffer *fb;
 
@@ -1203,14 +1203,13 @@ static int drm_framebuffer_info(struct seq_file *m, void *data)
 	return 0;
 }
 
-static const struct drm_info_list drm_framebuffer_debugfs_list[] = {
+static const struct drm_simple_info drm_framebuffer_debugfs_list[] = {
 	{ "framebuffer", drm_framebuffer_info, 0 },
 };
 
 void drm_framebuffer_debugfs_init(struct drm_minor *minor)
 {
-	drm_debugfs_create_files(drm_framebuffer_debugfs_list,
-				 ARRAY_SIZE(drm_framebuffer_debugfs_list),
-				 minor->debugfs_root, minor);
+	drm_debugfs_add_files(minor->dev, drm_framebuffer_debugfs_list,
+			      ARRAY_SIZE(drm_framebuffer_debugfs_list));
 }
 #endif
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
