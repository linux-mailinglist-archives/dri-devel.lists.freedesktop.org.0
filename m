Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D661A30976
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2025 12:09:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A41AA10E66A;
	Tue, 11 Feb 2025 11:09:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nO+jl7lE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B56D10E669
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 11:09:27 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-38ddc36b81dso1498433f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 03:09:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739272165; x=1739876965; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PTakTkNWy+x7X249WP5VsfWpMi4Zx2g8PssxIcRL7RU=;
 b=nO+jl7lEIjbN5aqQ+Ccxik2sQNlprUj5rSeHzHykdpaZE3trpDIMFY7B2bLks7byJZ
 TiTDhE0N3Q9RI9mI6I2+0qcNRyVysKLEmqejKWJ0tYoQirVHKQXMNwm1bF11WHi8mFF1
 h6OvCqIR2h3EEReP4OdORkOQvcm68lLRNbp9YVy+08JXrdpxzEqvUIDV/QLcMAZn2E5D
 CIcxZlu6pKiXKVUWjzaPrICr7BpjvPy87AaUQaXnsgczRbilP2CJjlwQVg4+uXCBLTlm
 BpXiR4X8fhswnteofSQHZt91TZ8rVMxhGdY5cLSpLJF6W91BP+mwX/2v2o3XavLk7AZA
 epDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739272165; x=1739876965;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PTakTkNWy+x7X249WP5VsfWpMi4Zx2g8PssxIcRL7RU=;
 b=eFcRcRSi6pDpE8wP8qJZFlOcWYavXRHNfg1jwuOIy4JwL2hvZti70xQR4BVnKSDBcR
 JpK0qLTziZYH42zCoiA7Fzl1F6ptUH180KhycBP5f4xP9lFQUjq8ijmtdykqehE28irI
 wR+qHPZcwTDYME+q/AlShrKD5wnGx9WZrSx3CossmltxUd6ox9rQCD9+b3qCXjJME//o
 BW7H+r4aHqNLRm53wlnLnu1VihkjW2Eb3DThDMxMJ2Cj2y+FmZNmVUXPt+XM59rx4io/
 0IBm5KQWr/cH+p2OUuy8BKqCdqtVqxu6hPEYFUKQIuxHffwYHFoPlOvwnUQC+kyXKSPc
 w14Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWCcBIPGOqX8UvHrwlTVZZ2Sl40RnrHjvlLT2YaxxXj8G8h+In9Byg0i0hiu9ypolBleMvwNF/h1wU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzl2XSXwgm1xlQGfEij6ZRowofioh44DFGsWl9tavQHagvHuaQ/
 yweUc0BHtuAnosncW6hqtx9GUQgif/qUIVLtuumI4Haz7F03zHCi
X-Gm-Gg: ASbGncvgOC5c6Mu0kzUe84cGuDyv7jjSHtNlNYQzMrPBorG07FRFmrjagagnaHSSrbp
 s/G4Aue5egQw+MEYjwKIm8M5c6ZGU/PN9NnhL4SPQHAUyTsGYD8jEAGhp7LbWmApm04PYYO43jR
 7cl/ZIWMAJWUCPPMDcvHn0Cwwt5DaQxogOc2bJaILSgJIt4Vc6Plba0zBsI2I4z88d/2ckEHtH2
 fe3FE9CGOdusJqrrp8zA37hF5Vwl3a83Q/UA68Dysb74v56sspLUSXsjK3u4JOIK4JvzLS6k3nw
 eiLSvivJ8hun/t9F
X-Google-Smtp-Source: AGHT+IHlC7FDVWjBn6Dv8KwLai/qeOgcEPNdtOkXbQRg/3SaHr3uTj6JQsw/jPyUom8IHnBsEk0IeA==
X-Received: by 2002:a05:6000:4011:b0:38d:c73d:e52c with SMTP id
 ffacd0b85a97d-38de43aa6a7mr2385287f8f.14.1739272165253; 
 Tue, 11 Feb 2025 03:09:25 -0800 (PST)
Received: from fedora.. ([94.73.37.161]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dcb55b7a5sm11814417f8f.14.2025.02.11.03.09.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2025 03:09:24 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v2 06/15] drm/vkms: Move default_config creation to its own
 function
Date: Tue, 11 Feb 2025 12:09:03 +0100
Message-ID: <20250211110912.15409-7-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250211110912.15409-1-jose.exposito89@gmail.com>
References: <20250211110912.15409-1-jose.exposito89@gmail.com>
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

