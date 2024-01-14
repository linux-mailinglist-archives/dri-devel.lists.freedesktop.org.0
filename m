Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E5682D060
	for <lists+dri-devel@lfdr.de>; Sun, 14 Jan 2024 11:55:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DFDA10E16B;
	Sun, 14 Jan 2024 10:55:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 549F710E16B
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Jan 2024 10:55:48 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id
 5614622812f47-3bd7c15a745so3542b6e.2
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Jan 2024 02:55:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705229747; x=1705834547; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5su21lrElvoMrT51RPv9OkcSkDVz35FwFqaxlZOVWbQ=;
 b=eUr83/nsy2CGCNDt/HlxKQvWpgoXONBhIOYgHX4OulPMUCl9PDzM2+aN+B6TVcH44T
 ZCF+0YshmE34Fv7VSiODfzAx97GDKU2GSEZhR3rioUlp1fiEnZFSOPnIE9sa/Lvp2aCu
 QFtoArtUE/z5aThMKTVyIndsgaAYiBRgBcPotMgFlpiK8uxrJqx5juzul42Z2Nfd1utL
 v4yoAdSGOfxmA14Hf/nfAgbvA5fswwYFBgg3Rm32jTPxmoI+Su5uvh2q1ShUpihVHWGo
 jfiYzN9YEjT59DKLAcSZzj/ucOe8+0rmx5RQfBgtKmkTJO0j+30TV2rDJsraho7/qEUg
 rmgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705229747; x=1705834547;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5su21lrElvoMrT51RPv9OkcSkDVz35FwFqaxlZOVWbQ=;
 b=MesJrtzQyDjLtIJgPgGemSwnONu8iCWv88uIx2qNVnMK6t8F7UBWCiJuMYZuF9rEr2
 DWIhpcVyHnCsP1+speUGKFFWjHhSrHlJkAtfwVafLh01/yJmAEUk7ji8DiNyw9BmG6/d
 ov3+BwagRK8ud6UohGhvClLv0SjHpVh/UeuKp4RD9X4GQqlgyoq7ukntzcD8RDvHhwJx
 I3nIL9fvqwuQEBHr406czT6Sr9elN0LPpufNz88Du14XftD5eKt9EOU3K+LuxGelFxDA
 kMwDQQmKU4QtPyrZDx6Nix1f1wkcthnEIcXMq9u2tqAaCWFkde1fG8ljgR3cBPiALXw0
 zDRg==
X-Gm-Message-State: AOJu0YwjFhuHF2HQv5fcs8efyeCVjFz8Fh801Cr4TQZ0wHnoUVLpDpSy
 GQ76kPV99KwktKtCgB4kuL8=
X-Google-Smtp-Source: AGHT+IFs9diLCTJ1nBrxwBQXGsP8bvdXH3LQIBAmfSAPjpj7ka1Atnu/olzG2jnoWxV9ed533jKCkA==
X-Received: by 2002:a05:6808:2f0d:b0:3bd:5f35:58f6 with SMTP id
 gu13-20020a0568082f0d00b003bd5f3558f6mr6080166oib.37.1705229747410; 
 Sun, 14 Jan 2024 02:55:47 -0800 (PST)
Received: from anfanite396-Predator-PH315-51.. ([202.43.120.125])
 by smtp.gmail.com with ESMTPSA id
 t3-20020a6564c3000000b005ce033f3b54sm5469576pgv.27.2024.01.14.02.55.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Jan 2024 02:55:46 -0800 (PST)
From: Dipam Turkar <dipamt1729@gmail.com>
To: mripard@kernel.org
Subject: [PATCH v4 1/1] drm/tests: Add KUnit tests for
 drm_mode_create_dvi_i_properties()
Date: Sun, 14 Jan 2024 16:23:38 +0530
Message-Id: <20240114105337.480807-1-dipamt1729@gmail.com>
X-Mailer: git-send-email 2.34.1
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
Cc: Dipam Turkar <dipamt1729@gmail.com>, tzimmermann@suse.de,
 javierm@redhat.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, mairacanal@riseup.net, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Introduce unit tests for the drm_mode_create_dvi_i_properties() function to ensure
the proper creation of DVI-I specific connector properties and success if called 
multiple times.

Signed-off-by: Dipam Turkar <dipamt1729@gmail.com>
---
 drivers/gpu/drm/tests/drm_connector_test.c | 58 ++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_connector_test.c b/drivers/gpu/drm/tests/drm_connector_test.c
index c66aa2dc8d9d..217c0988171e 100644
--- a/drivers/gpu/drm/tests/drm_connector_test.c
+++ b/drivers/gpu/drm/tests/drm_connector_test.c
@@ -4,6 +4,9 @@
  */
 
 #include <drm/drm_connector.h>
+#include <drm/drm_device.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_kunit_helpers.h>
 
 #include <kunit/test.h>
 
@@ -70,7 +73,62 @@ static struct kunit_suite drm_get_tv_mode_from_name_test_suite = {
 	.test_cases = drm_get_tv_mode_from_name_tests,
 };
 
+/*
+ * Test that drm_mode_create_dvi_i_properties() succeeds and
+ * DVI-I subconnector and select subconectors properties have
+ * been created.
+ */
+static void drm_test_mode_create_dvi_i_properties(struct kunit *test)
+{
+	struct drm_device *drm;
+	struct device *dev;
+
+	dev = drm_kunit_helper_alloc_device(test);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev);
+
+	drm = __drm_kunit_helper_alloc_drm_device(test, dev, sizeof(*drm), 0, DRIVER_MODESET);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, drm);
+
+	KUNIT_EXPECT_EQ(test, drm_mode_create_dvi_i_properties(drm), 0);
+	KUNIT_EXPECT_NOT_ERR_OR_NULL(test, drm->mode_config.dvi_i_select_subconnector_property);
+	KUNIT_EXPECT_NOT_ERR_OR_NULL(test, drm->mode_config.dvi_i_subconnector_property);
+}
+
+/*
+ * Test that drm_mode_create_dvi_i_properties() doesn't fail if called twice.
+ */
+static void drm_test_mode_create_dvi_i_properties_repeated(struct kunit *test)
+{
+	struct drm_device *drm;
+	struct device *dev;
+
+	dev = drm_kunit_helper_alloc_device(test);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev);
+
+	drm = __drm_kunit_helper_alloc_drm_device(test, dev, sizeof(*drm), 0, DRIVER_MODESET);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, drm);
+
+	KUNIT_EXPECT_EQ(test, drm_mode_create_dvi_i_properties(drm), 0);
+	KUNIT_EXPECT_NOT_ERR_OR_NULL(test, drm->mode_config.dvi_i_select_subconnector_property);
+	KUNIT_EXPECT_NOT_ERR_OR_NULL(test, drm->mode_config.dvi_i_subconnector_property);
+
+	/* Expect the function to return 0 if called twice. */
+	KUNIT_EXPECT_EQ(test, drm_mode_create_dvi_i_properties(drm), 0);
+}
+
+static struct kunit_case drm_mode_create_dvi_i_properties_tests[] = {
+	KUNIT_CASE(drm_test_mode_create_dvi_i_properties),
+	KUNIT_CASE(drm_test_mode_create_dvi_i_properties_repeated),
+	{ }
+};
+
+static struct kunit_suite drm_mode_create_dvi_i_properties_test_suite = {
+	.name = "drm_mode_create_dvi_i_properties",
+	.test_cases = drm_mode_create_dvi_i_properties_tests,
+};
+
 kunit_test_suite(drm_get_tv_mode_from_name_test_suite);
+kunit_test_suite(drm_mode_create_dvi_i_properties_test_suite);
 
 MODULE_AUTHOR("Maxime Ripard <maxime@cerno.tech>");
 MODULE_LICENSE("GPL");
-- 
2.34.1

