Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7330A39857
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2025 11:12:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F033310E656;
	Tue, 18 Feb 2025 10:12:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WD8SCLfM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A51B10E655
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 10:12:28 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-38f2cb1ba55so3021928f8f.3
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 02:12:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739873547; x=1740478347; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=an4ZlObHhfs530zfnSQ9jtNvfBOIXbJcmgdk2xLIJkM=;
 b=WD8SCLfMmmfPoBeIOiy/cy3wnReCEelmNPZybRutYb6p8ztLJc7MEGXh+uf7soDltE
 uwrM1HPRiFgm6PjE7Tji3/TIk/+lOtQ31pJfQtcJYSPI2aDBWFI59plCzFvPwb/4jsgk
 uBk4igrDY1UcgCbjdEt2Q1VQ7KXTzgMrira8i7hkpMW3lAR5TibfUUaXpfM1C16CnsU4
 E+Uw0tEknB9jPEs5O+cJazM9vPoBdnhSKqzSQuWxyZN59drmgipmCWfVDrrX5RHG0cES
 kpd4Li+c4j5NUxjVEu9uI3/895rNb9IAQckRXrqlo2RlZM0RMFrYFYJIa+sggYk+OwGz
 C2GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739873547; x=1740478347;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=an4ZlObHhfs530zfnSQ9jtNvfBOIXbJcmgdk2xLIJkM=;
 b=a9x4zopTQ9F7+LCfdvL3JA/7ka8yqsAkp91UbmkVf99+iWHTYE77p75tEiASzwUYth
 yA7qV8ZA2zFDuhDpuAY1M3qiq0XYODFDrvEdQrySHoiuuNEwbcMFWchL2ymw9V/ZZw9Y
 pf6YwsMZ+kZ1xtHwski0nkujm3+N2bgz6BHUX6oAql0kITBQSfgTJUtOq/ScSc9wUw1/
 mOKuBhmCQiDW4hhUaNwWSvfwjHkMug31zV9H+YCQQBGWDNWauhDFTul7QL9uJh3qxyi1
 35vRxYQx2T+rItf7PB9c6CXmCDFQcnuuN/Bn9XTd1NMEo2M7QjCdpl9h2G6rgc3PuTrZ
 MfOg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVH9LomjVzzexrQzGUyz8Am7/okWlZo6i0IKs8pV9vI+crdMjEOHtTE0esUdDqLNEAfFYCexj03/00=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw67+wA/jHG82Ke5lNal5hNgw6PRMV/JoG1H0MOH5SSssINLFeR
 e+VYS2ubIOOlUAOGkgd1Shim70XObKOR2Dqz4cmtHkx9ZPvpCQCW
X-Gm-Gg: ASbGncs7/r3VVNnhJepc8ReFcJtAb/B9Htl7L1FG7K+urow7gm9MqkyPaW7bfSK7FBM
 hjsxzgPZ+LCzrfP8fqWAYSyLURxwIeRCIB4pWXkcBlPLr+Aua2ZTeYkWFIV9w8bT/TkPImkVk2Y
 G1e+1JlNyYP6JcfA1NZFcFt3oBCYBJaywn/kdkwkwxG9blUVgeuWtpoc+YcSeLerLBa9ddoMr5i
 iJMtLao3yG82CU7ruVf+jCiJx0eqDgd8VHlfuETunz1z5ar/nZyYS1sZxgBf475/VIO2a/upnRP
 bpSXKD8OANCdTOUh8A==
X-Google-Smtp-Source: AGHT+IGJxHESmAAuUrG/TzfS69sJTg+tzboHhcOfguDL/BJgytBJbYzlmkjBEB91eQfNa8ZNIOKnVA==
X-Received: by 2002:a5d:64c2:0:b0:38f:470c:932e with SMTP id
 ffacd0b85a97d-38f470c9576mr5637822f8f.29.1739873546478; 
 Tue, 18 Feb 2025 02:12:26 -0800 (PST)
Received: from fedora.. ([213.94.27.232]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f259d5e92sm14749720f8f.66.2025.02.18.02.12.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2025 02:12:25 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v4 05/14] drm/vkms: Move default_config creation to its own
 function
Date: Tue, 18 Feb 2025 11:12:05 +0100
Message-ID: <20250218101214.5790-6-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250218101214.5790-1-jose.exposito89@gmail.com>
References: <20250218101214.5790-1-jose.exposito89@gmail.com>
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

