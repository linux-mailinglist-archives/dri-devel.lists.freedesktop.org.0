Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3A2163EC8
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 09:20:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1D7E6E519;
	Wed, 19 Feb 2020 08:20:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CF2C6EA52
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2020 17:29:12 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id z7so24921994wrl.13
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2020 09:29:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wwL9O44eOnrF5PjPfAyWlT4w7nkYP4UBXVJh3n9vMfc=;
 b=am2O2pZyBLylTFqGX2JTuFZunpkj/ZxkeIQyVyR88aZLZUhF8aAkn6PdUMj4HZ5oaF
 mDaJvPw7+fcZe5g/3iLC8oZRbjQ+ZbR5WCGFdG9hDKq3H19zjWjUPEdUucax8TiWFk/2
 1WYwjpKlWVU8pqiWJgaFhNjMX/YY31lGHlWz/lu4rw0UnyyAKjiD3PYpg8lb8z3URbsY
 nkYpdr2yQA9y9KwYQmrXRhCk2v4G725jRuAFdC866bGDkmiK6kIwj6LClgLYMKfdj5UQ
 wJj6YYuVyB03LnXt4wybeebFC0yu1g72f8+AzR8x+79uMwwqj6Ii4wrR3ScQAjVAsFw9
 82tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wwL9O44eOnrF5PjPfAyWlT4w7nkYP4UBXVJh3n9vMfc=;
 b=PXHeNoPBAXlUzto8ecE/iyU0jDtnEFERoWgW6m4ssGJfrCaXUhiluX4P5fN6bE4Y3T
 UPqUBr7J9+EjDY2XwOQI//gbfCfRc9G8gkA4WUAqLQANOJsiYfNIEp5+MB2ArsDgxfsn
 K58t/cEZX6MhtWoBdVjsQqfPYKbRRI8E8udjkc7S1Dr8nyIdtIQyu1uVUN+f3Nd5RnQL
 oFVTlQZLQaTSSEuAiOT4jB7DxTI9xD6edjaSjU+N6O7aZEQGBFJ7+/Urae0Sz9NgCh2r
 XkYowfeV3FnT52TM6QVhvvagd99UlPJBf0DmMQxwTaF7hC8Z9Uj9F6b73TYdKEw4wDzg
 u6Mg==
X-Gm-Message-State: APjAAAX6Yx+O7v3MdaFCnCfEjk1QSkIx1RD7+AH/4WVgE1qzw6jrSasm
 r8gdrhHbIjT90FMG0I/Y8lk=
X-Google-Smtp-Source: APXvYqysw2Xo8W/uznC3FSGp7tRdym0XWOg8tWWpis3qb2fqBekELqZhMKwVAgpD8Gr0608ynOlLsg==
X-Received: by 2002:adf:d4ca:: with SMTP id w10mr31698035wrk.53.1582046951125; 
 Tue, 18 Feb 2020 09:29:11 -0800 (PST)
Received: from wambui.zuku.co.ke ([197.237.61.225])
 by smtp.googlemail.com with ESMTPSA id t13sm6998757wrw.19.2020.02.18.09.29.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2020 09:29:10 -0800 (PST)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH 2/2] drm: convert drm_debugfs functions to return void
Date: Tue, 18 Feb 2020 20:28:21 +0300
Message-Id: <20200218172821.18378-10-wambui.karugax@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200218172821.18378-1-wambui.karugax@gmail.com>
References: <20200218172821.18378-1-wambui.karugax@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 19 Feb 2020 08:19:59 +0000
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
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As drm_debug_create_files will be converted to return void,
drop return value from various drm_debugfs functions that return
drm_debug_create_files and convert the functions to return void.

Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
---
 drivers/gpu/drm/drm_atomic.c        | 8 ++++----
 drivers/gpu/drm/drm_client.c        | 8 ++++----
 drivers/gpu/drm/drm_crtc_internal.h | 2 +-
 drivers/gpu/drm/drm_framebuffer.c   | 8 ++++----
 drivers/gpu/drm/drm_internal.h      | 2 +-
 include/drm/drm_client.h            | 2 +-
 6 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 65c46ed049c5..d619f3340084 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -1640,10 +1640,10 @@ static const struct drm_info_list drm_atomic_debugfs_list[] = {
 	{"state", drm_state_info, 0},
 };
 
-int drm_atomic_debugfs_init(struct drm_minor *minor)
+void drm_atomic_debugfs_init(struct drm_minor *minor)
 {
-	return drm_debugfs_create_files(drm_atomic_debugfs_list,
-			ARRAY_SIZE(drm_atomic_debugfs_list),
-			minor->debugfs_root, minor);
+	drm_debugfs_create_files(drm_atomic_debugfs_list,
+				 ARRAY_SIZE(drm_atomic_debugfs_list),
+				 minor->debugfs_root, minor);
 }
 #endif
diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client.c
index b031b45aa8ef..2a147d1c3a13 100644
--- a/drivers/gpu/drm/drm_client.c
+++ b/drivers/gpu/drm/drm_client.c
@@ -457,10 +457,10 @@ static const struct drm_info_list drm_client_debugfs_list[] = {
 	{ "internal_clients", drm_client_debugfs_internal_clients, 0 },
 };
 
-int drm_client_debugfs_init(struct drm_minor *minor)
+void drm_client_debugfs_init(struct drm_minor *minor)
 {
-	return drm_debugfs_create_files(drm_client_debugfs_list,
-					ARRAY_SIZE(drm_client_debugfs_list),
-					minor->debugfs_root, minor);
+	drm_debugfs_create_files(drm_client_debugfs_list,
+				 ARRAY_SIZE(drm_client_debugfs_list),
+				 minor->debugfs_root, minor);
 }
 #endif
diff --git a/drivers/gpu/drm/drm_crtc_internal.h b/drivers/gpu/drm/drm_crtc_internal.h
index 16f2413403aa..1b620ba9244b 100644
--- a/drivers/gpu/drm/drm_crtc_internal.h
+++ b/drivers/gpu/drm/drm_crtc_internal.h
@@ -224,7 +224,7 @@ int drm_mode_dirtyfb_ioctl(struct drm_device *dev,
 /* drm_atomic.c */
 #ifdef CONFIG_DEBUG_FS
 struct drm_minor;
-int drm_atomic_debugfs_init(struct drm_minor *minor);
+void drm_atomic_debugfs_init(struct drm_minor *minor);
 #endif
 
 int __drm_atomic_helper_disable_plane(struct drm_plane *plane,
diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_framebuffer.c
index 57ac94ce9b9e..0375b3d7f8d0 100644
--- a/drivers/gpu/drm/drm_framebuffer.c
+++ b/drivers/gpu/drm/drm_framebuffer.c
@@ -1207,10 +1207,10 @@ static const struct drm_info_list drm_framebuffer_debugfs_list[] = {
 	{ "framebuffer", drm_framebuffer_info, 0 },
 };
 
-int drm_framebuffer_debugfs_init(struct drm_minor *minor)
+void drm_framebuffer_debugfs_init(struct drm_minor *minor)
 {
-	return drm_debugfs_create_files(drm_framebuffer_debugfs_list,
-				ARRAY_SIZE(drm_framebuffer_debugfs_list),
-				minor->debugfs_root, minor);
+	drm_debugfs_create_files(drm_framebuffer_debugfs_list,
+				 ARRAY_SIZE(drm_framebuffer_debugfs_list),
+				 minor->debugfs_root, minor);
 }
 #endif
diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
index aeec2e68d772..f0c99d00b201 100644
--- a/drivers/gpu/drm/drm_internal.h
+++ b/drivers/gpu/drm/drm_internal.h
@@ -235,7 +235,7 @@ int drm_syncobj_query_ioctl(struct drm_device *dev, void *data,
 /* drm_framebuffer.c */
 void drm_framebuffer_print_info(struct drm_printer *p, unsigned int indent,
 				const struct drm_framebuffer *fb);
-int drm_framebuffer_debugfs_init(struct drm_minor *minor);
+void drm_framebuffer_debugfs_init(struct drm_minor *minor);
 
 /* drm_hdcp.c */
 int drm_setup_hdcp_srm(struct class *drm_class);
diff --git a/include/drm/drm_client.h b/include/drm/drm_client.h
index 3ed5dee899fd..7402f852d3c4 100644
--- a/include/drm/drm_client.h
+++ b/include/drm/drm_client.h
@@ -188,6 +188,6 @@ int drm_client_modeset_dpms(struct drm_client_dev *client, int mode);
 	drm_for_each_connector_iter(connector, iter) \
 		if (connector->connector_type != DRM_MODE_CONNECTOR_WRITEBACK)
 
-int drm_client_debugfs_init(struct drm_minor *minor);
+void drm_client_debugfs_init(struct drm_minor *minor);
 
 #endif
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
