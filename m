Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5DBFA21B87
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 12:01:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AA8510E7A9;
	Wed, 29 Jan 2025 11:01:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="l1IUm0nD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78A0510E7A1
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 11:01:11 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-3863703258fso342238f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 03:01:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738148470; x=1738753270; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FjL+ZAAo0YHDYt7gQTJ/b5ubGw71F7Pu1taWojvFhk4=;
 b=l1IUm0nDJJ7T0/11phDNkb7nmow0ljcGuW9ynaIKZaijQEzonIWtuOxxU9DdcRa6N0
 6+F6acP1r3MlEVkHEw3YpFXX5pKZlitG86XWcmNdGS0U3QEqA7AMeok5myR8tEuKtPjr
 ivuAxV6/sqpwtUSE0Xt8Il4P+Zy/bMLeeRIoBRMF7mUQaL6Egl5AgXAmTW02e2k6bCdI
 kc/YzbQFRF+z6HgRBtzzdLA7Z2U0+q1iVx6qtMVoYrbo4d1Q39Y5OUjwJ+2USJYxiDd2
 FbVWxOQqV2p5gsoJwjBPyQA1HyQBVoqk/T3Gou1jlMWULrsgAJfdjlSf3XxKtAO8We26
 PRAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738148470; x=1738753270;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FjL+ZAAo0YHDYt7gQTJ/b5ubGw71F7Pu1taWojvFhk4=;
 b=RagGlU8972Sz3Bz0zqXl65MLeEU2+omT+xKhkUDSFBtayc1DOp/O3CO8bWOh3KQ7by
 lla/jo/njm1rR7oydhYewCcZhhImhYD3MDp9D3mbrYBZCSjeW0gPK3hTvMa5zACbxj9s
 t41ls6En4/BP/I+yWaSkCt4SlI6iWjx3z0xPikbDMGibDwd8zhRNzD80HWCQPdwrXEMv
 ou1yobZv+zq1VNg0zk/D5R9bLffG4qagjPyKoT+zz7C/b3B3S0lz1q/WfEHA/2M3h/az
 p2nuP2N5VaCJ3J9tCqSYIwDiKuO4xgDAicLto/0UIjPYh8N4OSWyVp01AvM///wkW3pi
 yWog==
X-Forwarded-Encrypted: i=1;
 AJvYcCVaVQ2iDcdyFFsmSlHrZDL6SaCatKf5cLCrMHip/XBNeor43DPl7/wF4VpU2p8AigHoHF1DPS4wqDw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxZyxfNs1KctLJDrwk/Dy6utD3JQesnFDOP50z1Wuw0HMTYDBlA
 eAy8JrM6q0c5LNeuhd6YXek6E4UgY3Py28f5W2aRUe/hy4gtMyLR
X-Gm-Gg: ASbGncuyi1BXmHCU1Vt+56sl2F2V6hn94Kk9TzChQ/Zi6ZZYdJ6mhS99k4eVXj0xlzq
 ZmEdsALmUuovNPJWXHYhCsmYoXaM3/gOmpK/ex7O4txyYyVxXnFjK0IhFaBBwYXaSz2FEKEtlu0
 osq8soomlBP2OTWqk8+dzlYRw4BQFwfSUOl7f1+39/3cAADH7fhfbQTx/WFLGfwZ7EHfKmSo1wW
 J0VNJ5xyKLUwvNYOa4IT+FyqUpOigYbRofZSjFIlusiUPILmMW+jMXbTpbWrrDSK2mA+AXu/MvQ
 I4ubxVlgntHpqYc3
X-Google-Smtp-Source: AGHT+IGM65LZ6HAHnzroF2O3ycdsns+/7UUPzidfbU/yRI5s3eUChQJUUJRV3aYPtOLqqIewACxIzg==
X-Received: by 2002:a05:6000:4011:b0:38b:ee9f:52d5 with SMTP id
 ffacd0b85a97d-38c50ff1713mr2361965f8f.16.1738148469669; 
 Wed, 29 Jan 2025 03:01:09 -0800 (PST)
Received: from fedora.. ([94.73.37.161]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c2a176434sm16947113f8f.13.2025.01.29.03.01.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jan 2025 03:01:09 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH 04/13] drm/vkms: Move default_config creation to its own
 function
Date: Wed, 29 Jan 2025 12:00:50 +0100
Message-ID: <20250129110059.12199-5-jose.exposito89@gmail.com>
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

Extract the initialization of the default configuration to a function.
Refactor, no functional changes.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/gpu/drm/vkms/tests/vkms_config_test.c | 38 +++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_config.c            | 17 +++++++++
 drivers/gpu/drm/vkms/vkms_config.h            | 14 +++++++
 drivers/gpu/drm/vkms/vkms_drv.c               |  6 +--
 4 files changed, 70 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/vkms/tests/vkms_config_test.c b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
index a7060504f3dc..d8644a1e3e18 100644
--- a/drivers/gpu/drm/vkms/tests/vkms_config_test.c
+++ b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
@@ -6,6 +6,12 @@
 
 MODULE_IMPORT_NS("EXPORTED_FOR_KUNIT_TESTING");
 
+struct default_config_case {
+	bool enable_cursor;
+	bool enable_writeback;
+	bool enable_overlay;
+};
+
 static void vkms_config_test_empty_config(struct kunit *test)
 {
 	struct vkms_config *config;
@@ -16,8 +22,40 @@ static void vkms_config_test_empty_config(struct kunit *test)
 	vkms_config_destroy(config);
 }
 
+static struct default_config_case default_config_cases[] = {
+	{ false, false, false },
+	{ true, false, false },
+	{ true, true, false },
+	{ true, false, true },
+	{ false, true, false },
+	{ false, true, true },
+	{ false, false, true },
+	{ true, true, true },
+};
+
+KUNIT_ARRAY_PARAM(default_config, default_config_cases, NULL);
+
+static void vkms_config_test_default_config(struct kunit *test)
+{
+	const struct default_config_case *params = test->param_value;
+	struct vkms_config *config;
+
+	config = vkms_config_default_create(params->enable_cursor,
+					    params->enable_writeback,
+					    params->enable_overlay);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
+
+	KUNIT_EXPECT_EQ(test, config->cursor, params->enable_cursor);
+	KUNIT_EXPECT_EQ(test, config->writeback, params->enable_writeback);
+	KUNIT_EXPECT_EQ(test, config->overlay, params->enable_overlay);
+
+	vkms_config_destroy(config);
+}
+
 static struct kunit_case vkms_config_test_cases[] = {
 	KUNIT_CASE(vkms_config_test_empty_config),
+	KUNIT_CASE_PARAM(vkms_config_test_default_config,
+			 default_config_gen_params),
 	{}
 };
 
diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
index 152b2ecd6aef..30ce4b23553f 100644
--- a/drivers/gpu/drm/vkms/vkms_config.c
+++ b/drivers/gpu/drm/vkms/vkms_config.c
@@ -18,6 +18,23 @@ struct vkms_config *vkms_config_create(void)
 	return config;
 }
 
+struct vkms_config *vkms_config_default_create(bool enable_cursor,
+					       bool enable_writeback,
+					       bool enable_overlay)
+{
+	struct vkms_config *config;
+
+	config = vkms_config_create();
+	if (IS_ERR(config))
+		return config;
+
+	config->cursor = enable_cursor;
+	config->writeback = enable_writeback;
+	config->overlay = enable_overlay;
+
+	return config;
+}
+
 void vkms_config_destroy(struct vkms_config *config)
 {
 	kfree(config);
diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
index ced10f56a812..d0868750826a 100644
--- a/drivers/gpu/drm/vkms/vkms_config.h
+++ b/drivers/gpu/drm/vkms/vkms_config.h
@@ -31,6 +31,20 @@ struct vkms_config {
  */
 struct vkms_config *vkms_config_create(void);
 
+/**
+ * vkms_config_default_create() - Create the configuration for the default device
+ * @enable_cursor: Create or not a cursor plane
+ * @enable_writeback: Create or not a writeback connector
+ * @enable_overlay: Create or not overlay planes
+ *
+ * Returns:
+ * The default vkms_config or an error. Call vkms_config_destroy() to free the
+ * returned configuration.
+ */
+struct vkms_config *vkms_config_default_create(bool enable_cursor,
+					       bool enable_writeback,
+					       bool enable_overlay);
+
 /**
  * vkms_config_destroy() - Free a VKMS configuration
  * @config: vkms_config to free
diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index b19f76f902b3..700cf43389b7 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -211,16 +211,12 @@ static int __init vkms_init(void)
 	int ret;
 	struct vkms_config *config;
 
-	config = vkms_config_create();
+	config = vkms_config_default_create(enable_cursor, enable_writeback, enable_overlay);
 	if (IS_ERR(config))
 		return PTR_ERR(config);
 
 	default_config = config;
 
-	config->cursor = enable_cursor;
-	config->writeback = enable_writeback;
-	config->overlay = enable_overlay;
-
 	ret = vkms_create(config);
 	if (ret)
 		vkms_config_destroy(config);
-- 
2.48.1

