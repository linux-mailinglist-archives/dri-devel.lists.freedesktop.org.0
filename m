Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9C6A21B94
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 12:01:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BF6910E7A7;
	Wed, 29 Jan 2025 11:01:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dEu6WZqz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C89F10E7AB
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 11:01:20 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-438a3216fc2so68179135e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 03:01:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738148479; x=1738753279; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XUpkYP/tGsoAbjn0vsUGNcgy0Vg9vALDj5dfocC1jjo=;
 b=dEu6WZqzFWbR8Wf7cYlZjuL6Y3A2xbpiGrvQHms+ftQ8T5lnH6nXs/BY+rIffx+DzA
 SHlUM3y4ZaW3I053cDJRJI4YV9rW77+ua5Do15kNBGj1pCD5CjMg4jczQmRcsqE2GAUU
 xRfEATgrpp56tFqtytDFAWxlt2nhENd5CB058bqGQBOcfhyPCZ78yJM4jcIfRdiwtDLZ
 V6iZGPqvIinHYKJeI5hu4uIw9MoYrvi2fQpaytA0jUSVRSeYBhO0ANDJRYiNTQaSbld7
 CswB19tkozyfdmLIY8s+pKRPpvmnYF5+zcpRSqPwzRD8hpA+bD40Yr52sgyQyx354OiE
 Gbmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738148479; x=1738753279;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XUpkYP/tGsoAbjn0vsUGNcgy0Vg9vALDj5dfocC1jjo=;
 b=QrqNSoXwMuPY4ld3hKJ7ZcTA5VmvzxYoa7x+muIEtjeVQuFlUoeOOfpQE4bj9/sgbW
 cNnIwUtTmO+sCkIsLDxkEW2E6QChXsEJYbnV8zxg4dmLWTpjuTrBQTEsoMehOZfsORyT
 6FhbYdUkMZbCBu9hZ92GEV+pVYGBULWOEPht8mFOQW7ZdGGNb7Ocp9V7fQNWTxtK49rZ
 XRbNLLHZIrIdF+ni4z/V9+3hHzE+LiFKJvTBVSvixQ0pNfTWlgPIvALdrhzNfvfqZwrV
 0dxcVS1BluwBo3oME+7Vs5whFBdDrYcxICnMhrP3xkryxXjkHRblQKWbf7431cgalWw2
 AQpg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXC+zp/HtyzN6/R/sAaL9/GHIaNAp3XxSq8SLrWBTPUMZX8KGpqx9AEUmlo9QLsnYuNvfeD3k9r51c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw0af6bvRuMqmsGldUKqHn3UUdVORA7fjC61kFD3ZBSxCWoVhky
 AbmpMUV2tKI/v2mErrRVFvxD/sPsN7X2FpKQ8NI9Iy3dfccxLtvg9VyYX8Kn
X-Gm-Gg: ASbGncsPlMxqjWRhAv2G/NvCLlB2JkbLgP6Lml1v8a5w59JdfVXXq+euNfp9I7FcWQh
 MdvQbwpffet/BYPOzrtCkkpmX9060rMUeFDUDDDagoOx6jFDLb9jmNjFuqaiHluM5HwMWMForDu
 R/ipiqE/+hFdP7k3BJBb+xHWo2mcTHOSMQtm117GPaL4s81G/3XO9xH3V3SzZYf8axgsDs6Php2
 7kxaWlCdcRYS+m20YcItRSeApa/wn7ovtWnkYy7ZvQZq+BAiKOH+1uinRD1hJGM1/wBByzVZv+L
 Tb8+YqrSlqcR5S66eQLsPKu9Unk=
X-Google-Smtp-Source: AGHT+IEt/RU5BgHN4IuQXOAUZYIJmz+x4OCgxOMAFdg/eovjklOwz0AsxWcDE4GbtSVBFa+HrggMRA==
X-Received: by 2002:a5d:5988:0:b0:385:fd07:8616 with SMTP id
 ffacd0b85a97d-38c5167d80bmr2164396f8f.0.1738148478451; 
 Wed, 29 Jan 2025 03:01:18 -0800 (PST)
Received: from fedora.. ([94.73.37.161]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c2a176434sm16947113f8f.13.2025.01.29.03.01.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jan 2025 03:01:17 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH 12/13] drm/vkms: Allow to configure multiple connectors
Date: Wed, 29 Jan 2025 12:00:58 +0100
Message-ID: <20250129110059.12199-13-jose.exposito89@gmail.com>
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

Add a list of connectors to vkms_config and helper functions to add and
remove as many connectors as wanted.

Unlike planes, CRTCs and encoders, connectors can be added and removed
once the device is created. To reflect it, add an "enabled" flag in the
configuration and filter disabled connectors in the
vkms_config_get_connectors() function.

For the moment, changing the enabled status of the connector has no
effect after the device is created, but a future patch will add this
capability.

For backwards compatibility, add one enabled connector to the default
configuration.

A future patch will allow to attach connectors and encoders, but for the
moment there are no changes in the way the output is configured.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/gpu/drm/vkms/tests/vkms_config_test.c | 84 +++++++++++++++++
 drivers/gpu/drm/vkms/vkms_config.c            | 93 +++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_config.h            | 76 +++++++++++++++
 drivers/gpu/drm/vkms/vkms_connector.c         | 11 +++
 4 files changed, 264 insertions(+)

diff --git a/drivers/gpu/drm/vkms/tests/vkms_config_test.c b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
index 27d44315c2de..40c385eedc1d 100644
--- a/drivers/gpu/drm/vkms/tests/vkms_config_test.c
+++ b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
@@ -27,6 +27,7 @@ static void vkms_config_test_empty_config(struct kunit *test)
 	KUNIT_EXPECT_TRUE(test, list_empty(&config->planes));
 	KUNIT_EXPECT_TRUE(test, list_empty(&config->crtcs));
 	KUNIT_EXPECT_TRUE(test, list_empty(&config->encoders));
+	KUNIT_EXPECT_TRUE(test, list_empty(&config->connectors));
 
 	KUNIT_EXPECT_FALSE(test, vkms_config_is_valid(config));
 
@@ -52,6 +53,7 @@ static void vkms_config_test_default_config(struct kunit *test)
 	struct vkms_config *config;
 	struct vkms_config_plane *plane_cfg;
 	struct vkms_config_crtc *crtc_cfg;
+	struct vkms_config_connector *connector_cfg;
 	int n_primaries = 0;
 	int n_cursors = 0;
 	int n_overlays = 0;
@@ -103,6 +105,12 @@ static void vkms_config_test_default_config(struct kunit *test)
 	/* Encoders */
 	KUNIT_EXPECT_EQ(test, list_count_nodes(&config->encoders), 1);
 
+	/* Connectors */
+	KUNIT_EXPECT_EQ(test, list_count_nodes(&config->connectors), 1);
+	connector_cfg = list_first_entry(&config->connectors,
+					 typeof(*connector_cfg), link);
+	KUNIT_EXPECT_TRUE(test, vkms_config_connector_is_enabled(connector_cfg));
+
 	KUNIT_EXPECT_TRUE(test, vkms_config_is_valid(config));
 
 	vkms_config_destroy(config);
@@ -216,6 +224,47 @@ static void vkms_config_test_get_encoders(struct kunit *test)
 	vkms_config_destroy(config);
 }
 
+static void vkms_config_test_get_connectors(struct kunit *test)
+{
+	struct vkms_config *config;
+	struct vkms_config_connector *connector_cfg1, *connector_cfg2;
+	struct vkms_config_connector **array;
+	size_t length;
+
+	config = vkms_config_create("test");
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
+
+	array = vkms_config_get_connectors(config, &length);
+	KUNIT_ASSERT_EQ(test, length, 0);
+	KUNIT_ASSERT_NULL(test, array);
+
+	connector_cfg1 = vkms_config_add_connector(config);
+	array = vkms_config_get_connectors(config, &length);
+	KUNIT_ASSERT_EQ(test, length, 0);
+	KUNIT_ASSERT_NULL(test, array);
+
+	vkms_config_connector_set_enabled(connector_cfg1, true);
+	array = vkms_config_get_connectors(config, &length);
+	KUNIT_ASSERT_EQ(test, length, 1);
+	KUNIT_ASSERT_PTR_EQ(test, array[0], connector_cfg1);
+	kfree(array);
+
+	connector_cfg2 = vkms_config_add_connector(config);
+	vkms_config_connector_set_enabled(connector_cfg2, true);
+	array = vkms_config_get_connectors(config, &length);
+	KUNIT_ASSERT_EQ(test, length, 2);
+	KUNIT_ASSERT_PTR_EQ(test, array[0], connector_cfg1);
+	KUNIT_ASSERT_PTR_EQ(test, array[1], connector_cfg2);
+	kfree(array);
+
+	vkms_config_connector_set_enabled(connector_cfg1, false);
+	vkms_config_destroy_connector(connector_cfg2);
+	array = vkms_config_get_connectors(config, &length);
+	KUNIT_ASSERT_NULL(test, array);
+
+	vkms_config_destroy(config);
+}
+
 static void vkms_config_test_valid_plane_number(struct kunit *test)
 {
 	struct vkms_config *config;
@@ -423,6 +472,39 @@ static void vkms_config_test_valid_encoder_possible_crtcs(struct kunit *test)
 	vkms_config_destroy(config);
 }
 
+static void vkms_config_test_valid_connector_number(struct kunit *test)
+{
+	struct vkms_config *config;
+	struct vkms_config_connector *connector_cfg;
+	int n;
+
+	config = vkms_config_default_create(false, false, false);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
+
+	/* Valid: No connectors */
+	connector_cfg = list_first_entry(&config->connectors, typeof(*connector_cfg), link);
+	vkms_config_destroy_connector(connector_cfg);
+	KUNIT_EXPECT_TRUE(test, vkms_config_is_valid(config));
+
+	/* Valid: Only a disabled connector */
+	connector_cfg = vkms_config_add_connector(config);
+	KUNIT_EXPECT_TRUE(test, vkms_config_is_valid(config));
+
+	/* Valid: The connector is enabled */
+	vkms_config_connector_set_enabled(connector_cfg, true);
+	KUNIT_EXPECT_TRUE(test, vkms_config_is_valid(config));
+
+	/* Invalid: Too many connectors */
+	for (n = 0; n <= 32; n++) {
+		connector_cfg = vkms_config_add_connector(config);
+		vkms_config_connector_set_enabled(connector_cfg, true);
+	}
+
+	KUNIT_EXPECT_FALSE(test, vkms_config_is_valid(config));
+
+	vkms_config_destroy(config);
+}
+
 static void vkms_config_test_plane_attach_crtc(struct kunit *test)
 {
 	struct vkms_config *config;
@@ -613,12 +695,14 @@ static struct kunit_case vkms_config_test_cases[] = {
 	KUNIT_CASE(vkms_config_test_get_planes),
 	KUNIT_CASE(vkms_config_test_get_crtcs),
 	KUNIT_CASE(vkms_config_test_get_encoders),
+	KUNIT_CASE(vkms_config_test_get_connectors),
 	KUNIT_CASE(vkms_config_test_valid_plane_number),
 	KUNIT_CASE(vkms_config_test_valid_plane_type),
 	KUNIT_CASE(vkms_config_test_valid_plane_possible_crtcs),
 	KUNIT_CASE(vkms_config_test_valid_crtc_number),
 	KUNIT_CASE(vkms_config_test_valid_encoder_number),
 	KUNIT_CASE(vkms_config_test_valid_encoder_possible_crtcs),
+	KUNIT_CASE(vkms_config_test_valid_connector_number),
 	KUNIT_CASE(vkms_config_test_plane_attach_crtc),
 	KUNIT_CASE(vkms_config_test_plane_get_possible_crtcs),
 	KUNIT_CASE(vkms_config_test_encoder_get_possible_crtcs),
diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
index 437a9980e9a8..e94e48fe3ad9 100644
--- a/drivers/gpu/drm/vkms/vkms_config.c
+++ b/drivers/gpu/drm/vkms/vkms_config.c
@@ -24,6 +24,7 @@ struct vkms_config *vkms_config_create(const char *dev_name)
 	INIT_LIST_HEAD(&config->planes);
 	INIT_LIST_HEAD(&config->crtcs);
 	INIT_LIST_HEAD(&config->encoders);
+	INIT_LIST_HEAD(&config->connectors);
 
 	return config;
 }
@@ -36,6 +37,7 @@ struct vkms_config *vkms_config_default_create(bool enable_cursor,
 	struct vkms_config_plane *plane_cfg;
 	struct vkms_config_crtc *crtc_cfg;
 	struct vkms_config_encoder *encoder_cfg;
+	struct vkms_config_connector *connector_cfg;
 	int n;
 
 	config = vkms_config_create(DEFAULT_DEVICE_NAME);
@@ -87,6 +89,11 @@ struct vkms_config *vkms_config_default_create(bool enable_cursor,
 	if (vkms_config_encoder_attach_crtc(encoder_cfg, crtc_cfg))
 		goto err_alloc;
 
+	connector_cfg = vkms_config_add_connector(config);
+	if (IS_ERR(connector_cfg))
+		goto err_alloc;
+	vkms_config_connector_set_enabled(connector_cfg, true);
+
 	return config;
 
 err_alloc:
@@ -99,6 +106,7 @@ void vkms_config_destroy(struct vkms_config *config)
 	struct vkms_config_plane *plane_cfg, *plane_tmp;
 	struct vkms_config_crtc *crtc_cfg, *crtc_tmp;
 	struct vkms_config_encoder *encoder_cfg, *encoder_tmp;
+	struct vkms_config_connector *connector_cfg, *connector_tmp;
 
 	list_for_each_entry_safe(plane_cfg, plane_tmp, &config->planes, link)
 		vkms_config_destroy_plane(plane_cfg);
@@ -109,6 +117,9 @@ void vkms_config_destroy(struct vkms_config *config)
 	list_for_each_entry_safe(encoder_cfg, encoder_tmp, &config->encoders, link)
 		vkms_config_destroy_encoder(config, encoder_cfg);
 
+	list_for_each_entry_safe(connector_cfg, connector_tmp, &config->connectors, link)
+		vkms_config_destroy_connector(connector_cfg);
+
 	kfree_const(config->dev_name);
 	kfree(config);
 }
@@ -194,6 +205,39 @@ struct vkms_config_encoder **vkms_config_get_encoders(const struct vkms_config *
 	return array;
 }
 
+struct vkms_config_connector **vkms_config_get_connectors(const struct vkms_config *config,
+							  size_t *out_length)
+{
+	struct vkms_config_connector **array;
+	struct vkms_config_connector *connector_cfg;
+	size_t length = 0;
+	int n = 0;
+
+	list_for_each_entry(connector_cfg, &config->connectors, link) {
+		if (vkms_config_connector_is_enabled(connector_cfg))
+			length++;
+	}
+
+	if (length == 0) {
+		*out_length = length;
+		return NULL;
+	}
+
+	array = kmalloc_array(length, sizeof(*array), GFP_KERNEL);
+	if (!array)
+		return ERR_PTR(-ENOMEM);
+
+	list_for_each_entry(connector_cfg, &config->connectors, link) {
+		if (vkms_config_connector_is_enabled(connector_cfg)) {
+			array[n] = connector_cfg;
+			n++;
+		}
+	}
+
+	*out_length = length;
+	return array;
+}
+
 static bool valid_plane_number(struct vkms_config *config)
 {
 	size_t n_planes;
@@ -325,6 +369,24 @@ static bool valid_encoder_possible_crtcs(struct vkms_config *config)
 	return true;
 }
 
+static bool valid_connector_number(struct vkms_config *config)
+{
+	struct vkms_config_connector *connector_cfg;
+	size_t n_connectors = 0;
+
+	list_for_each_entry(connector_cfg, &config->connectors, link) {
+		if (vkms_config_connector_is_enabled(connector_cfg))
+			n_connectors++;
+	}
+
+	if (n_connectors >= 32) {
+		pr_err("The number of connectors must be between 0 and 31\n");
+		return false;
+	}
+
+	return true;
+}
+
 bool vkms_config_is_valid(struct vkms_config *config)
 {
 	struct vkms_config_crtc *crtc_cfg;
@@ -338,6 +400,9 @@ bool vkms_config_is_valid(struct vkms_config *config)
 	if (!valid_encoder_number(config))
 		return false;
 
+	if (!valid_connector_number(config))
+		return false;
+
 	if (!valid_plane_possible_crtcs(config))
 		return false;
 
@@ -361,6 +426,7 @@ static int vkms_config_show(struct seq_file *m, void *data)
 	struct vkms_config_plane *plane_cfg;
 	struct vkms_config_crtc *crtc_cfg;
 	struct vkms_config_encoder *encoder_cfg;
+	struct vkms_config_connector *connector_cfg;
 
 	dev_name = vkms_config_get_device_name((struct vkms_config *)vkmsdev->config);
 	seq_printf(m, "dev_name=%s\n", dev_name);
@@ -381,6 +447,12 @@ static int vkms_config_show(struct seq_file *m, void *data)
 		seq_puts(m, "encoder\n");
 	}
 
+	list_for_each_entry(connector_cfg, &vkmsdev->config->connectors, link) {
+		seq_puts(m, "connector:\n");
+		seq_printf(m, "\tenabled=%d\n",
+			   vkms_config_connector_is_enabled(connector_cfg));
+	}
+
 	return 0;
 }
 
@@ -620,3 +692,24 @@ vkms_config_encoder_get_possible_crtcs(struct vkms_config_encoder *encoder_cfg,
 	*out_length = length;
 	return array;
 }
+
+struct vkms_config_connector *vkms_config_add_connector(struct vkms_config *config)
+{
+	struct vkms_config_connector *connector_cfg;
+
+	connector_cfg = kzalloc(sizeof(*connector_cfg), GFP_KERNEL);
+	if (!connector_cfg)
+		return ERR_PTR(-ENOMEM);
+
+	vkms_config_connector_set_enabled(connector_cfg, false);
+
+	list_add_tail(&connector_cfg->link, &config->connectors);
+
+	return connector_cfg;
+}
+
+void vkms_config_destroy_connector(struct vkms_config_connector *connector_cfg)
+{
+	list_del(&connector_cfg->link);
+	kfree(connector_cfg);
+}
diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
index 5f4a33e113bf..cc32aadfda8d 100644
--- a/drivers/gpu/drm/vkms/vkms_config.h
+++ b/drivers/gpu/drm/vkms/vkms_config.h
@@ -15,6 +15,7 @@
  * @planes: List of planes configured for the device
  * @crtcs: List of CRTCs configured for the device
  * @encoders: List of encoders configured for the device
+ * @connectors: List of connectors configured for the device
  * @dev: Used to store the current VKMS device. Only set when the device is instantiated.
  */
 struct vkms_config {
@@ -22,6 +23,7 @@ struct vkms_config {
 	struct list_head planes;
 	struct list_head crtcs;
 	struct list_head encoders;
+	struct list_head connectors;
 	struct vkms_device *dev;
 };
 
@@ -85,6 +87,27 @@ struct vkms_config_encoder {
 	struct drm_encoder *encoder;
 };
 
+/**
+ * struct vkms_config_connector
+ *
+ * @link: Link to the others connector in vkms_config
+ * @enabled: Connector are a different from planes, CRTCs and encoders because
+ *           they can be added and removed once the device is created.
+ *           This flag represents if they are part of the device or not.
+ * @connector: Internal usage. This pointer should never be considered as valid.
+ *             It can be used to store a temporary reference to a VKMS connector
+ *             during device creation. This pointer is not managed by the
+ *             configuration and must be managed by other means.
+ */
+struct vkms_config_connector {
+	struct list_head link;
+
+	bool enabled;
+
+	/* Internal usage */
+	struct vkms_connector *connector;
+};
+
 /**
  * vkms_config_create() - Create a new VKMS configuration
  * @dev_name: Name of the device
@@ -173,6 +196,21 @@ struct vkms_config_crtc **vkms_config_get_crtcs(const struct vkms_config *config
 struct vkms_config_encoder **vkms_config_get_encoders(const struct vkms_config *config,
 						      size_t *out_length);
 
+/**
+ * vkms_config_get_connectors() - Return the array of connectors of the device
+ * @config: Configuration to get the connectors from
+ * @out_length: Length of the returned array
+ *
+ * Note that only enabled connectors are returned.
+ *
+ * Returns:
+ * A list of pointers to the configurations. On success, the caller is
+ * responsible to free the returned array, but not its contents. On error,
+ * it returns an error and @out_length is invalid.
+ */
+struct vkms_config_connector **vkms_config_get_connectors(const struct vkms_config *config,
+							  size_t *out_length);
+
 /**
  * vkms_config_is_valid() - Validate a configuration
  * @config: Configuration to validate
@@ -367,4 +405,42 @@ struct vkms_config_crtc **
 vkms_config_encoder_get_possible_crtcs(struct vkms_config_encoder *encoder_cfg,
 				       size_t *out_length);
 
+/**
+ * vkms_config_add_connector() - Add a new connector configuration
+ * @config: Configuration to add the connector to
+ *
+ * Returns:
+ * The new connector configuration or an error. Call
+ * vkms_config_destroy_connector() to free the returned connector configuration.
+ */
+struct vkms_config_connector *vkms_config_add_connector(struct vkms_config *config);
+
+/**
+ * vkms_config_destroy_connector() - Remove and free a connector configuration
+ * @connector_cfg: Connector configuration to destroy
+ */
+void vkms_config_destroy_connector(struct vkms_config_connector *connector_cfg);
+
+/**
+ * vkms_config_connector_is_enabled() - If the connector is part of the device
+ * @connector_cfg: The connector
+ */
+static inline bool
+vkms_config_connector_is_enabled(struct vkms_config_connector *connector_cfg)
+{
+	return connector_cfg->enabled;
+}
+
+/**
+ * vkms_config_connector_set_enabled() - If the connector is part of the device
+ * @crtc_cfg: Target connector
+ * @enabled: Add or remove the connector
+ */
+static inline void
+vkms_config_connector_set_enabled(struct vkms_config_connector *connector_cfg,
+				  bool enabled)
+{
+	connector_cfg->enabled = enabled;
+}
+
 #endif /* _VKMS_CONFIG_H_ */
diff --git a/drivers/gpu/drm/vkms/vkms_connector.c b/drivers/gpu/drm/vkms/vkms_connector.c
index ab8b52a84151..48b10cba322a 100644
--- a/drivers/gpu/drm/vkms/vkms_connector.c
+++ b/drivers/gpu/drm/vkms/vkms_connector.c
@@ -25,8 +25,19 @@ static int vkms_conn_get_modes(struct drm_connector *connector)
 	return count;
 }
 
+static struct drm_encoder *vkms_conn_best_encoder(struct drm_connector *connector)
+{
+	struct drm_encoder *encoder;
+
+	drm_connector_for_each_possible_encoder(connector, encoder)
+		return encoder;
+
+	return NULL;
+}
+
 static const struct drm_connector_helper_funcs vkms_conn_helper_funcs = {
 	.get_modes    = vkms_conn_get_modes,
+	.best_encoder = vkms_conn_best_encoder,
 };
 
 struct vkms_connector *vkms_connector_init(struct vkms_device *vkmsdev)
-- 
2.48.1

