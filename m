Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1141A37F2E
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 11:01:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EE5E10E3E3;
	Mon, 17 Feb 2025 10:01:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XQTEPKY3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3C8B10E3C2
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 10:01:31 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-38f24fc466aso2962212f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 02:01:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739786490; x=1740391290; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=an4ZlObHhfs530zfnSQ9jtNvfBOIXbJcmgdk2xLIJkM=;
 b=XQTEPKY3jvscGyvsI6wmog46FHPzOfj7VM/CxucV/kxgTP9bZp0B/wGL2rtdN1676Y
 H1mosfuY1vjrP/uVUNI3yF+Tb2+TOgclWdpz7kl5zyZDx+rWThqnj5TWTqLSHT6lj3KL
 iP2ySc2cdsbmnj525WhA8n0DE1XRtBAu7Kq2EagxlsXhs9xRqat5hvuCmDy6P1YI84uG
 bBRUoci83nxYnN18QtAX0ahaeVJb8whhhrtKBGXX271sua6NkBM5V4kvqH0vSeWlR8Tr
 kci9jkGMBpOm29SU+2IQ3eNojXoT547sNhP868aFCHQ12Hnd6oeCHAYsL5Y+eRt5cKvT
 kUPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739786490; x=1740391290;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=an4ZlObHhfs530zfnSQ9jtNvfBOIXbJcmgdk2xLIJkM=;
 b=j19AOTYQXiK74GLxbI8cAHdmD4Tr9peV1yjqI93dnuYTZPqEFvAfAu0qS+Tgr5PjUa
 W9d9c+05lQhUVH9W0ec8QzXAirW0qEbhVnf0g0dlAMwU5MKnLB2Pj686I4MAw27ApA6p
 w0lQd3IL1ClsPmEc0R0uLFJhTzL00T71TjovfmKt2iWnPkCswJbNBVhUQU0L1UZV9wql
 1EirhpyQhPsfLRRxHv528vLip7XtBmh/oZf+bZP/BnSAw8KY2XlEqeFKxDAANj0e9EB3
 hXC1sXvmu/5j3XYLUw6HCqYEzxjfYs/IKXR+dUvX3H+WAGaPC8DeEHf679uWhiagrAhM
 N/BQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVyQeJe5B8AVwUfKt5kHen+xCgQJUKIRGAT2eVsUAsYiHyPz737TivR8gmAjOJ/4BjU7OPlV0eiU3k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy0zcdKj2k4LL7Oo2snRQbBDViX5ycj2E/6O3Fi8O8Po84m8pi9
 PmCQtaJFO1/csAoSArwHxUSc9IKnl6Evhj7eWZt13Gts8NaBj4vw
X-Gm-Gg: ASbGncvyCna7NS8lnfGrXCTW4sUz4OPljMRpKH42jj/nWh12FtxRE74qposCxlbzNSj
 hnIfA6wYzgtcwZN7i/wVjd8+i3+aevI5bMhPibzilst09PYrmvx2J5GrzHhGHVcsc5PR9pqPJlT
 +iunAOLVK6jJ0bk/XTLv47WFM7jdauXvl4h3TOjwL4WWWq06JTR4q0VdiHHTVLsKQlCdLQRvOZf
 K4SbzEwEzm7r5wP4UKhvRwU2lC5tr/Cs1aHRQe0gAMmh+XAfG71SB5X2vZiG+MrLCGZP17wMOHf
 dyPmQ+b2q7TMepI/Tg==
X-Google-Smtp-Source: AGHT+IH4CwihIwVZG7tSArR4NUMsOT3lALCUrNrAZruadVHeYFhmux5YvQbpgfyRoPVEoAAf3qpcFg==
X-Received: by 2002:a5d:5f4e:0:b0:38f:329a:270f with SMTP id
 ffacd0b85a97d-38f3406787cmr9234492f8f.39.1739786489831; 
 Mon, 17 Feb 2025 02:01:29 -0800 (PST)
Received: from fedora.. ([213.94.27.232]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f259f7fe6sm11591901f8f.86.2025.02.17.02.01.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 02:01:29 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v3 05/14] drm/vkms: Move default_config creation to its own
 function
Date: Mon, 17 Feb 2025 11:01:11 +0100
Message-ID: <20250217100120.7620-6-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250217100120.7620-1-jose.exposito89@gmail.com>
References: <20250217100120.7620-1-jose.exposito89@gmail.com>
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

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Co-developed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/gpu/drm/vkms/tests/vkms_config_test.c | 38 +++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_config.c            | 18 +++++++++
 drivers/gpu/drm/vkms/vkms_config.h            | 14 +++++++
 drivers/gpu/drm/vkms/vkms_drv.c               |  6 +--
 4 files changed, 71 insertions(+), 5 deletions(-)

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
index 42caa421876e..0af8e6dc0a01 100644
--- a/drivers/gpu/drm/vkms/vkms_config.c
+++ b/drivers/gpu/drm/vkms/vkms_config.c
@@ -20,6 +20,24 @@ struct vkms_config *vkms_config_create(void)
 }
 EXPORT_SYMBOL_IF_KUNIT(vkms_config_create);
 
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
+EXPORT_SYMBOL_IF_KUNIT(vkms_config_default_create);
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
index 37de0658e6ee..582d5825f42b 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -211,14 +211,10 @@ static int __init vkms_init(void)
 	int ret;
 	struct vkms_config *config;
 
-	config = vkms_config_create();
+	config = vkms_config_default_create(enable_cursor, enable_writeback, enable_overlay);
 	if (IS_ERR(config))
 		return PTR_ERR(config);
 
-	config->cursor = enable_cursor;
-	config->writeback = enable_writeback;
-	config->overlay = enable_overlay;
-
 	ret = vkms_create(config);
 	if (ret) {
 		vkms_config_destroy(config);
-- 
2.48.1

