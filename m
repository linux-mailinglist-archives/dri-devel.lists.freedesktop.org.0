Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 721D37E826A
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 20:25:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A7CC10E1A8;
	Fri, 10 Nov 2023 19:25:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5082210E1A8
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 19:25:33 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id
 46e09a7af769-6ce2fc858feso1300631a34.3
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 11:25:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699644332; x=1700249132; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9WuF0Pi5V569GCKj27JB/b2x9SROneMhMi2aagE8fG0=;
 b=BDc6P7yraF7asc+xq7+A/PnW/9Z6VmzpIc9EA7b75PeeRk/px5u+H7StqvLrZ5qkUz
 8VwqKbHH97Z4YcgkASh1GH5bOBrm84BOYp7F/D/bQd/nf9MegGsIcv5jPbiXx3IU8Exu
 rfgW4jdEf9newRROpo/27RAz0dXvfGMiNTq6UUMpQ4+tWkzyZG9+7puBxQrNHyYGz97D
 gmMlSxj/xXmYkP8dOrqQDsn5rTqNxRxn8dNLVgllM081NrXbTSA4TMziIBBXHxDiRSDF
 x47K6Q0cfimGQkmU3Ne2fteUZdEIotACq3Nyw624deRW4zNggCUUrRgokJJW1w64RPAp
 CgKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699644332; x=1700249132;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9WuF0Pi5V569GCKj27JB/b2x9SROneMhMi2aagE8fG0=;
 b=efkclyll/4rXRi6/lS6iuinsk7nw9X/IlEAQ2xfUqCGzyEQj9erUY8Hq8l7xqQpoND
 bmLKdKfc4UwEC5Rf5tjVNlVKmZqncjE9oCfqs2Ovs5WBsMY9PissLLvNC2jRGqJZI9Ks
 tVQVNoHXSBVteFBMyxnfi6suD6p2I6EPMCIcctyW3KMpg/ynbFuZzFi8QdFIB1CkRGdn
 pylBRNGVhefFUih56fCYfPJZqd6tuXUryGnNsAWVJL34/X2erN5kda1BgVMOzPXmex4u
 fIPy5Ye/f4tlfDaIMW2XcyEEshTsGQ3Z9KYG+FIAoJ+wWOoxkWrMXJasi6uBy60JbBnk
 KOug==
X-Gm-Message-State: AOJu0YykGFSSXFYsDcG2iPujF7SsCv+xU8Rtp7phqHXWJNM2feZyCvEo
 xqT0vu04mQRuDXWZgQmREz0=
X-Google-Smtp-Source: AGHT+IEo1//wDVWt/tm1wE749UqnbecpRb3xBJK4fg+h8xqM6wjIx3xSoS40xzkNWv62fUOim9iKYQ==
X-Received: by 2002:a05:6830:3492:b0:6b8:dc53:9efd with SMTP id
 c18-20020a056830349200b006b8dc539efdmr83527otu.3.1699644332401; 
 Fri, 10 Nov 2023 11:25:32 -0800 (PST)
Received: from anfanite396-Predator-PH315-51.gateway.iitmandi.ac.in
 ([14.139.34.101]) by smtp.gmail.com with ESMTPSA id
 71-20020a63004a000000b0057412d84d25sm32493pga.4.2023.11.10.11.25.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Nov 2023 11:25:32 -0800 (PST)
From: Dipam Turkar <dipamt1729@gmail.com>
To: maarten.lankhorst@linux.intel.com
Subject: [PATCH v2] drm/tests: Add KUnit tests for
 drm_mode_create_dvi_i_properties()
Date: Sat, 11 Nov 2023 00:54:53 +0530
Message-Id: <20231110192452.734925-1-dipamt1729@gmail.com>
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
 javierm@redhat.com, mripard@kernel.org, linux-kernel@vger.kernel.org,
 mairacanal@riseup.net, dri-devel@lists.freedesktop.org,
 arthurgrillo@riseup.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Introduce unit tests for the drm_mode_create_dvi_i_properties() function to ensure
the proper creation of DVI-I specific connector properties.

Signed-off-by: Dipam Turkar <dipamt1729@gmail.com>
---
 drivers/gpu/drm/tests/drm_connector_test.c | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_connector_test.c b/drivers/gpu/drm/tests/drm_connector_test.c
index c66aa2dc8d9d..9ac1fd32c579 100644
--- a/drivers/gpu/drm/tests/drm_connector_test.c
+++ b/drivers/gpu/drm/tests/drm_connector_test.c
@@ -4,6 +4,9 @@
  */
 
 #include <drm/drm_connector.h>
+#include <drm/drm_device.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_kunit_helpers.h>
 
 #include <kunit/test.h>
 
@@ -58,6 +61,30 @@ static void drm_test_get_tv_mode_from_name_truncated(struct kunit *test)
 	KUNIT_EXPECT_LT(test, ret, 0);
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
+
+	// Expect the function to return 0 if called twice.
+	KUNIT_EXPECT_EQ(test, drm_mode_create_dvi_i_properties(drm), 0);
+}
+
 static struct kunit_case drm_get_tv_mode_from_name_tests[] = {
 	KUNIT_CASE_PARAM(drm_test_get_tv_mode_from_name_valid,
 			 drm_get_tv_mode_from_name_valid_gen_params),
@@ -70,7 +97,18 @@ static struct kunit_suite drm_get_tv_mode_from_name_test_suite = {
 	.test_cases = drm_get_tv_mode_from_name_tests,
 };
 
+static struct kunit_case drm_connector_tests[] = {
+	KUNIT_CASE(drm_test_mode_create_dvi_i_properties),
+	{ }
+};
+
+static struct kunit_suite drm_connector_test_suite = {
+	.name = "drm_connector",
+	.test_cases = drm_connector_tests,
+};
+
 kunit_test_suite(drm_get_tv_mode_from_name_test_suite);
+kunit_test_suite(drm_connector_test_suite);
 
 MODULE_AUTHOR("Maxime Ripard <maxime@cerno.tech>");
 MODULE_LICENSE("GPL");
-- 
2.34.1

