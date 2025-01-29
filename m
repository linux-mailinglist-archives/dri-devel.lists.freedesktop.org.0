Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A29A21B90
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 12:01:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E53F10E7B5;
	Wed, 29 Jan 2025 11:01:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LgvjVGr+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4D2B10E7A9
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 11:01:16 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-43625c4a50dso44595075e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 03:01:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738148475; x=1738753275; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PWyhKU7rNdH8bD+VJvosWh8sByoTXBt/ga10H7y8Dnk=;
 b=LgvjVGr+NpzOSUEF55+00w4GuJ0tuFPMO0IOFlhfgLHARDj1+DArDwFGYa9xsYlrAZ
 9yVPUPM1Jv0JaYCuI8z8OjuGPe3cbRAvEUvIivrS2waZRwLm6lmaesGKqR0vO6Dmt6Ep
 Dfsf2Bt/JtEfxWaSkgcZc9oSxeNA0p/pbWtBcAOY8Yh+kZ0dW8OHzqpVjR1tyNKoULz1
 1QTGIPRdL1nE/uU2EUGjCUpvccKubzKkBfsK5pNE6tlWNyZID5UIpB7jgEMBod1h9jg9
 OUGZQQtnHq5er5BlYJ057nSb5L3BCwFmZsPYGuYfS/Uy8gfjbhnUUUjeObeuY6piQwNo
 lvRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738148475; x=1738753275;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PWyhKU7rNdH8bD+VJvosWh8sByoTXBt/ga10H7y8Dnk=;
 b=YUjpF0IhBMyMcA+E9Bxl+LuKQuzT5I+KrKOI1O3wgsUz3WdiQ5DYvQzk8Dp6fC4YGU
 loMaqj5lot19xW3Hu8XLsPVkzV4jE+MMX4VBBjouC/DmAW6qU+L7UzxK+97+mij+2f7o
 d6EWepNUPiXbP6bWJmDHJiehZEQ6A/WoC+XvQSE4dBpEJd5EQ+cKLE6EVzGd6wWTjKFD
 u4JchSoz4PygOFK6N8f2XoPtL3H7fy6jPx0ovTq/h07JphPrF2wXDI/eUxZWJSrt28cL
 qQi7RTbRnCLKDUR1xF4iSbZeoC6e9eYLwPpP09Nh2LQT53hxnz2Kxuxvdv/uMd7Ro1NO
 cRGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVDtYI2FFzFGFc9BKhSmtXIrf+lFK034GfbQ2V5CaZZ2rc3BJ9ytFA44a0jmjet47R8bzKgoInMPaE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwH0jwLL0HGCCTOTcjEXtrE2HK+NBMUM/aQuTqVjLAx9U+HXC+e
 /oOYPKyrhdeW5RZGM2nUDLRK4X/8kuLnJBcO67LDUcRQrcm0TcJv
X-Gm-Gg: ASbGncusDs1VyfN7Cu4t9zKHdIe+ECdqY+okaUplSm0O4h/3KRXwa6tAYfmas+weTtO
 STTyJnZc1THjickPLhG0RolEMcS0ej2JvllLWcgd+OBPleQ2cD3ZSR3Acr4P6V5QkO5PvSs6sNt
 oCbJRTSixye3niSpUo+U67WpnrsmfmNyJr3OQ0IZW9g3UjXVcGDF3bLTAP50IIs8wA3oET5csd8
 jdzpJfToeamAcWiPgOBZG1I82Zc2UNcZ24SbF+hRgLmygui49abHS9aCs0LofIUfpCi9ZGoyTJY
 QULhTR9EN0toCL9H
X-Google-Smtp-Source: AGHT+IGxI/8h+i7c/jW6fIxV1OZm8Cs90w6P/3JNhZdaD1QTZvYbrc/QvBvLcOlI+/Ue+T0wtoOzjA==
X-Received: by 2002:a05:600c:458a:b0:436:ed50:4f8a with SMTP id
 5b1f17b1804b1-438dc3c333cmr23449305e9.10.1738148474804; 
 Wed, 29 Jan 2025 03:01:14 -0800 (PST)
Received: from fedora.. ([94.73.37.161]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c2a176434sm16947113f8f.13.2025.01.29.03.01.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jan 2025 03:01:14 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH 08/13] drm/vkms: Allow to configure multiple CRTCs
Date: Wed, 29 Jan 2025 12:00:54 +0100
Message-ID: <20250129110059.12199-9-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250129110059.12199-1-jose.exposito89@gmail.com>
References: <20250129110059.12199-1-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a list of CRTCs to vkms_config and helper functions to add and
remove as many CRTCs as wanted.

For backwards compatibility, add one CRTC to the default configuration.

A future patch will allow to attach planes and CRTCs, but for the
moment there are no changes in the way the output is configured.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/gpu/drm/vkms/tests/vkms_config_test.c | 72 +++++++++++++++-
 drivers/gpu/drm/vkms/vkms_config.c            | 86 ++++++++++++++++++-
 drivers/gpu/drm/vkms/vkms_config.h            | 83 ++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_drv.c               |  3 +-
 4 files changed, 238 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/vkms/tests/vkms_config_test.c b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
index 7d9cb3956741..b5907b060a5c 100644
--- a/drivers/gpu/drm/vkms/tests/vkms_config_test.c
+++ b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
@@ -25,6 +25,7 @@ static void vkms_config_test_empty_config(struct kunit *test)
 	KUNIT_EXPECT_STREQ(test, vkms_config_get_device_name(config), "test");
 
 	KUNIT_EXPECT_TRUE(test, list_empty(&config->planes));
+	KUNIT_EXPECT_TRUE(test, list_empty(&config->crtcs));
 
 	KUNIT_EXPECT_FALSE(test, vkms_config_is_valid(config));
 
@@ -49,6 +50,7 @@ static void vkms_config_test_default_config(struct kunit *test)
 	const struct default_config_case *params = test->param_value;
 	struct vkms_config *config;
 	struct vkms_config_plane *plane_cfg;
+	struct vkms_config_crtc *crtc_cfg;
 	int n_primaries = 0;
 	int n_cursors = 0;
 	int n_overlays = 0;
@@ -58,8 +60,6 @@ static void vkms_config_test_default_config(struct kunit *test)
 					    params->enable_overlay);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
 
-	KUNIT_EXPECT_EQ(test, config->writeback, params->enable_writeback);
-
 	/* Planes */
 	list_for_each_entry(plane_cfg, &config->planes, link) {
 		switch (vkms_config_plane_get_type(plane_cfg)) {
@@ -80,6 +80,13 @@ static void vkms_config_test_default_config(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, n_cursors, params->enable_cursor ? 1 : 0);
 	KUNIT_EXPECT_EQ(test, n_overlays, params->enable_overlay ? 8 : 0);
 
+	/* CRTCs */
+	crtc_cfg = list_first_entry(&config->crtcs, typeof(*crtc_cfg), link);
+
+	KUNIT_EXPECT_EQ(test, list_count_nodes(&config->crtcs), 1);
+	KUNIT_EXPECT_EQ(test, vkms_config_crtc_get_writeback(crtc_cfg),
+			params->enable_writeback);
+
 	KUNIT_EXPECT_TRUE(test, vkms_config_is_valid(config));
 
 	vkms_config_destroy(config);
@@ -121,6 +128,42 @@ static void vkms_config_test_get_planes(struct kunit *test)
 	vkms_config_destroy(config);
 }
 
+static void vkms_config_test_get_crtcs(struct kunit *test)
+{
+	struct vkms_config *config;
+	struct vkms_config_crtc *crtc_cfg1, *crtc_cfg2;
+	struct vkms_config_crtc **array;
+	size_t length;
+
+	config = vkms_config_create("test");
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
+
+	array = vkms_config_get_crtcs(config, &length);
+	KUNIT_ASSERT_EQ(test, length, 0);
+	KUNIT_ASSERT_NULL(test, array);
+
+	crtc_cfg1 = vkms_config_add_crtc(config);
+	array = vkms_config_get_crtcs(config, &length);
+	KUNIT_ASSERT_EQ(test, length, 1);
+	KUNIT_ASSERT_PTR_EQ(test, array[0], crtc_cfg1);
+	kfree(array);
+
+	crtc_cfg2 = vkms_config_add_crtc(config);
+	array = vkms_config_get_crtcs(config, &length);
+	KUNIT_ASSERT_EQ(test, length, 2);
+	KUNIT_ASSERT_PTR_EQ(test, array[0], crtc_cfg1);
+	KUNIT_ASSERT_PTR_EQ(test, array[1], crtc_cfg2);
+	kfree(array);
+
+	vkms_config_destroy_crtc(config, crtc_cfg2);
+	array = vkms_config_get_crtcs(config, &length);
+	KUNIT_ASSERT_EQ(test, length, 1);
+	KUNIT_ASSERT_PTR_EQ(test, array[0], crtc_cfg1);
+	kfree(array);
+
+	vkms_config_destroy(config);
+}
+
 static void vkms_config_test_valid_plane_number(struct kunit *test)
 {
 	struct vkms_config *config;
@@ -185,13 +228,38 @@ static void vkms_config_test_valid_plane_type(struct kunit *test)
 	vkms_config_destroy(config);
 }
 
+static void vkms_config_test_valid_crtc_number(struct kunit *test)
+{
+	struct vkms_config *config;
+	struct vkms_config_crtc *crtc_cfg;
+	int n;
+
+	config = vkms_config_default_create(false, false, false);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
+
+	/* Invalid: No CRTCs */
+	crtc_cfg = list_first_entry(&config->crtcs, typeof(*crtc_cfg), link);
+	vkms_config_destroy_crtc(config, crtc_cfg);
+	KUNIT_EXPECT_FALSE(test, vkms_config_is_valid(config));
+
+	/* Invalid: Too many CRTCs */
+	for (n = 0; n <= 32; n++)
+		vkms_config_add_crtc(config);
+
+	KUNIT_EXPECT_FALSE(test, vkms_config_is_valid(config));
+
+	vkms_config_destroy(config);
+}
+
 static struct kunit_case vkms_config_test_cases[] = {
 	KUNIT_CASE(vkms_config_test_empty_config),
 	KUNIT_CASE_PARAM(vkms_config_test_default_config,
 			 default_config_gen_params),
 	KUNIT_CASE(vkms_config_test_get_planes),
+	KUNIT_CASE(vkms_config_test_get_crtcs),
 	KUNIT_CASE(vkms_config_test_valid_plane_number),
 	KUNIT_CASE(vkms_config_test_valid_plane_type),
+	KUNIT_CASE(vkms_config_test_valid_crtc_number),
 	{}
 };
 
diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
index a5a77612645f..4128892836d7 100644
--- a/drivers/gpu/drm/vkms/vkms_config.c
+++ b/drivers/gpu/drm/vkms/vkms_config.c
@@ -22,6 +22,7 @@ struct vkms_config *vkms_config_create(const char *dev_name)
 	}
 
 	INIT_LIST_HEAD(&config->planes);
+	INIT_LIST_HEAD(&config->crtcs);
 
 	return config;
 }
@@ -32,19 +33,23 @@ struct vkms_config *vkms_config_default_create(bool enable_cursor,
 {
 	struct vkms_config *config;
 	struct vkms_config_plane *plane_cfg;
+	struct vkms_config_crtc *crtc_cfg;
 	int n;
 
 	config = vkms_config_create(DEFAULT_DEVICE_NAME);
 	if (IS_ERR(config))
 		return config;
 
-	config->writeback = enable_writeback;
-
 	plane_cfg = vkms_config_add_plane(config);
 	if (IS_ERR(plane_cfg))
 		goto err_alloc;
 	vkms_config_plane_set_type(plane_cfg, DRM_PLANE_TYPE_PRIMARY);
 
+	crtc_cfg = vkms_config_add_crtc(config);
+	if (IS_ERR(crtc_cfg))
+		goto err_alloc;
+	vkms_config_crtc_set_writeback(crtc_cfg, enable_writeback);
+
 	if (enable_overlay) {
 		for (n = 0; n < NUM_OVERLAY_PLANES; n++) {
 			plane_cfg = vkms_config_add_plane(config);
@@ -72,10 +77,14 @@ struct vkms_config *vkms_config_default_create(bool enable_cursor,
 void vkms_config_destroy(struct vkms_config *config)
 {
 	struct vkms_config_plane *plane_cfg, *plane_tmp;
+	struct vkms_config_crtc *crtc_cfg, *crtc_tmp;
 
 	list_for_each_entry_safe(plane_cfg, plane_tmp, &config->planes, link)
 		vkms_config_destroy_plane(plane_cfg);
 
+	list_for_each_entry_safe(crtc_cfg, crtc_tmp, &config->crtcs, link)
+		vkms_config_destroy_crtc(config, crtc_cfg);
+
 	kfree_const(config->dev_name);
 	kfree(config);
 }
@@ -107,6 +116,33 @@ struct vkms_config_plane **vkms_config_get_planes(const struct vkms_config *conf
 	return array;
 }
 
+struct vkms_config_crtc **vkms_config_get_crtcs(const struct vkms_config *config,
+						size_t *out_length)
+{
+	struct vkms_config_crtc **array;
+	struct vkms_config_crtc *crtc_cfg;
+	size_t length;
+	int n = 0;
+
+	length = list_count_nodes((struct list_head *)&config->crtcs);
+	if (length == 0) {
+		*out_length = length;
+		return NULL;
+	}
+
+	array = kmalloc_array(length, sizeof(*array), GFP_KERNEL);
+	if (!array)
+		return ERR_PTR(-ENOMEM);
+
+	list_for_each_entry(crtc_cfg, &config->crtcs, link) {
+		array[n] = crtc_cfg;
+		n++;
+	}
+
+	*out_length = length;
+	return array;
+}
+
 static bool valid_plane_number(struct vkms_config *config)
 {
 	size_t n_planes;
@@ -156,11 +192,27 @@ static bool valid_plane_type(struct vkms_config *config)
 	return true;
 }
 
+static bool valid_crtc_number(struct vkms_config *config)
+{
+	size_t n_crtcs;
+
+	n_crtcs = list_count_nodes(&config->crtcs);
+	if (n_crtcs <= 0 || n_crtcs >= 32) {
+		pr_err("The number of CRTCs must be between 1 and 31\n");
+		return false;
+	}
+
+	return true;
+}
+
 bool vkms_config_is_valid(struct vkms_config *config)
 {
 	if (!valid_plane_number(config))
 		return false;
 
+	if (!valid_crtc_number(config))
+		return false;
+
 	if (!valid_plane_type(config))
 		return false;
 
@@ -174,10 +226,10 @@ static int vkms_config_show(struct seq_file *m, void *data)
 	struct vkms_device *vkmsdev = drm_device_to_vkms_device(dev);
 	const char *dev_name;
 	struct vkms_config_plane *plane_cfg;
+	struct vkms_config_crtc *crtc_cfg;
 
 	dev_name = vkms_config_get_device_name((struct vkms_config *)vkmsdev->config);
 	seq_printf(m, "dev_name=%s\n", dev_name);
-	seq_printf(m, "writeback=%d\n", vkmsdev->config->writeback);
 
 	list_for_each_entry(plane_cfg, &vkmsdev->config->planes, link) {
 		seq_puts(m, "plane:\n");
@@ -185,6 +237,12 @@ static int vkms_config_show(struct seq_file *m, void *data)
 			   vkms_config_plane_get_type(plane_cfg));
 	}
 
+	list_for_each_entry(crtc_cfg, &vkmsdev->config->crtcs, link) {
+		seq_puts(m, "crtc:\n");
+		seq_printf(m, "\twriteback=%d\n",
+			   vkms_config_crtc_get_writeback(crtc_cfg));
+	}
+
 	return 0;
 }
 
@@ -218,3 +276,25 @@ void vkms_config_destroy_plane(struct vkms_config_plane *plane_cfg)
 	list_del(&plane_cfg->link);
 	kfree(plane_cfg);
 }
+
+struct vkms_config_crtc *vkms_config_add_crtc(struct vkms_config *config)
+{
+	struct vkms_config_crtc *crtc_cfg;
+
+	crtc_cfg = kzalloc(sizeof(*crtc_cfg), GFP_KERNEL);
+	if (!crtc_cfg)
+		return ERR_PTR(-ENOMEM);
+
+	vkms_config_crtc_set_writeback(crtc_cfg, false);
+
+	list_add_tail(&crtc_cfg->link, &config->crtcs);
+
+	return crtc_cfg;
+}
+
+void vkms_config_destroy_crtc(struct vkms_config *config,
+			      struct vkms_config_crtc *crtc_cfg)
+{
+	list_del(&crtc_cfg->link);
+	kfree(crtc_cfg);
+}
diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
index d9aeba1762d1..a7828fe0c4b2 100644
--- a/drivers/gpu/drm/vkms/vkms_config.h
+++ b/drivers/gpu/drm/vkms/vkms_config.h
@@ -14,12 +14,14 @@
  * @dev_name: Name of the device
  * @writeback: If true, a writeback buffer can be attached to the CRTC
  * @planes: List of planes configured for the device
+ * @crtcs: List of CRTCs configured for the device
  * @dev: Used to store the current VKMS device. Only set when the device is instantiated.
  */
 struct vkms_config {
 	const char *dev_name;
 	bool writeback;
 	struct list_head planes;
+	struct list_head crtcs;
 	struct vkms_device *dev;
 };
 
@@ -43,6 +45,25 @@ struct vkms_config_plane {
 	struct vkms_plane *plane;
 };
 
+/**
+ * struct vkms_config_crtc
+ *
+ * @link: Link to the others CRTCs in vkms_config
+ * @writeback: If true, a writeback buffer can be attached to the CRTC
+ * @crtc: Internal usage. This pointer should never be considered as valid.
+ *        It can be used to store a temporary reference to a VKMS CRTC during
+ *        device creation. This pointer is not managed by the configuration and
+ *        must be managed by other means.
+ */
+struct vkms_config_crtc {
+	struct list_head link;
+
+	bool writeback;
+
+	/* Internal usage */
+	struct vkms_output *crtc;
+};
+
 /**
  * vkms_config_create() - Create a new VKMS configuration
  * @dev_name: Name of the device
@@ -96,6 +117,28 @@ vkms_config_get_device_name(struct vkms_config *config)
 struct vkms_config_plane **vkms_config_get_planes(const struct vkms_config *config,
 						  size_t *out_length);
 
+/**
+ * vkms_config_get_num_crtcs() - Return the number of CRTCs in the configuration
+ * @config: Configuration to get the number of CRTCs from
+ */
+static inline size_t vkms_config_get_num_crtcs(struct vkms_config *config)
+{
+	return list_count_nodes(&config->crtcs);
+}
+
+/**
+ * vkms_config_get_crtcs() - Return the array of CRTCs of the device
+ * @config: Configuration to get the CRTCs from
+ * @out_length: Length of the returned array
+ *
+ * Returns:
+ * A list of pointers to the configurations. On success, the caller is
+ * responsible to free the returned array, but not its contents. On error,
+ * it returns an error and @out_length is invalid.
+ */
+struct vkms_config_crtc **vkms_config_get_crtcs(const struct vkms_config *config,
+						size_t *out_length);
+
 /**
  * vkms_config_is_valid() - Validate a configuration
  * @config: Configuration to validate
@@ -151,4 +194,44 @@ vkms_config_plane_set_type(struct vkms_config_plane *plane_cfg,
 	plane_cfg->type = type;
 }
 
+/**
+ * vkms_config_add_crtc() - Add a new CRTC configuration
+ * @config: Configuration to add the CRTC to
+ *
+ * Returns:
+ * The new CRTC configuration or an error. Call vkms_config_destroy_crtc() to
+ * free the returned CRTC configuration.
+ */
+struct vkms_config_crtc *vkms_config_add_crtc(struct vkms_config *config);
+
+/**
+ * vkms_config_destroy_crtc() - Remove and free a CRTC configuration
+ * @config: Configuration to remove the CRTC from
+ * @crtc_cfg: CRTC configuration to destroy
+ */
+void vkms_config_destroy_crtc(struct vkms_config *config,
+			      struct vkms_config_crtc *crtc_cfg);
+
+/**
+ * vkms_config_crtc_get_writeback() - If a writeback connector will be created
+ * @crtc_cfg: CRTC with or without a writeback connector
+ */
+static inline bool
+vkms_config_crtc_get_writeback(struct vkms_config_crtc *crtc_cfg)
+{
+	return crtc_cfg->writeback;
+}
+
+/**
+ * vkms_config_crtc_set_writeback() - If a writeback connector will be created
+ * @crtc_cfg: Target CRTC
+ * @writeback: Enable or disable the writeback connector
+ */
+static inline void
+vkms_config_crtc_set_writeback(struct vkms_config_crtc *crtc_cfg,
+			       bool writeback)
+{
+	crtc_cfg->writeback = writeback;
+}
+
 #endif /* _VKMS_CONFIG_H_ */
diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index f23ee1a053e9..77f24b802849 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -181,7 +181,8 @@ static int vkms_create(struct vkms_config *config)
 		goto out_devres;
 	}
 
-	ret = drm_vblank_init(&vkms_device->drm, 1);
+	ret = drm_vblank_init(&vkms_device->drm,
+			      vkms_config_get_num_crtcs(config));
 	if (ret) {
 		DRM_ERROR("Failed to vblank\n");
 		goto out_devres;
-- 
2.48.1

