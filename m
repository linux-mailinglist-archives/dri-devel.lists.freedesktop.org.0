Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 291207DA848
	for <lists+dri-devel@lfdr.de>; Sat, 28 Oct 2023 19:47:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BCA410E0BF;
	Sat, 28 Oct 2023 17:47:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6810610E0BF
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Oct 2023 17:47:48 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-1cc131e52f1so17898985ad.0
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Oct 2023 10:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698515268; x=1699120068; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=AKw4O8MZEMOutKTAoJPOv7w9iVpbVz72yRMuKDaXQPE=;
 b=ch0P/2ABINIgoVy7GOnGR5X65KksgxoqiEsCeDstMkASsfict0I6ei1RfD10FBZ43E
 jY0qY7DmXdGmY9BWdZusVQO8U+39ugw31E5OeAhfIN0Mcyui4E+zrOrCjS7WeEd/dDYY
 PjzZdRrI5+Mz4JF6mbgPFfr6JooGI5nnma9MTOV2miUeXSm/u0zzdWsxuK+DYZssb4Da
 vBZNlofuHv9LhTxY6FXq+IPk5VkF6aLgEXnCTOks1F/hRv+Isjc/Fw0EC0KxXOV6H3IX
 IsWYzoDNv8scE3qhyr7R2vkMFvocB52o3WHLiTfQX2bPm7jWs2xhyKd1xay6hDrkycDo
 2NRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698515268; x=1699120068;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AKw4O8MZEMOutKTAoJPOv7w9iVpbVz72yRMuKDaXQPE=;
 b=uOK0d7UY6hVkyfZsQH0med/Iut16WnJFmd2D1kS37UaDH4g7ijlD/VCUj6mauGhT+w
 ChuZa6IKDZLiR5aioVYlM/xzL93nGiD7yz9ih4nFQ6/zR6alKE+bYFFZNC5k0hnxZagB
 gwqPVXGFOiDCh1PpdavOJ821E+fOR+0GFl4JQuaxPUcvKb5A67hI+sS9ecaNXz+4109Q
 OA6nWEQ2R61qCdxAZ5CcRQ65PSHrT+ZThXjyAO9ZqSPqxIOVWoGG/d9Zktz7sVLttFYl
 cRqABA3pvDZNs95t2oN9yOmDxmOQK7KE0xZqg0JDbZWeXCl22VqebCx7+svM2tlrHa2x
 6uMw==
X-Gm-Message-State: AOJu0YzS5046XROUZhwhqpsrjrkth1+/rztl1nPI7Gg/DGBj6I9eX9KW
 6Z9mrxh/cU6E3xTnnsoocP8=
X-Google-Smtp-Source: AGHT+IGiOTUqWNYyYBxbqFj8arOe+ggx6I2nYxCHODlZuAVJqp0i9N70/iMDOBzls6nr8odnq9VuLg==
X-Received: by 2002:a17:903:2345:b0:1cc:38e6:f097 with SMTP id
 c5-20020a170903234500b001cc38e6f097mr1343971plh.7.1698515267760; 
 Sat, 28 Oct 2023 10:47:47 -0700 (PDT)
Received: from anfanite396-Predator-PH315-51.gateway.iitmandi.ac.in
 ([14.139.34.151]) by smtp.gmail.com with ESMTPSA id
 iz7-20020a170902ef8700b001c771740da4sm3474947plb.195.2023.10.28.10.47.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Oct 2023 10:47:47 -0700 (PDT)
From: Dipam Turkar <dipamt1729@gmail.com>
To: javierm@redhat.com
Subject: [PATCH] drm/tests: Add KUnit tests for
 drm_mode_create_dvi_i_properties()
Date: Sat, 28 Oct 2023 23:17:16 +0530
Message-Id: <20231028174716.60108-1-dipamt1729@gmail.com>
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
Cc: Dipam Turkar <dipamt1729@gmail.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Introduce unit tests for the drm_mode_create_dvi_i_properties() function to ensure
the proper creation of DVI-I specific connector properties.

Signed-off-by: Dipam Turkar <dipamt1729@gmail.com>
---
 drivers/gpu/drm/tests/drm_connector_test.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_connector_test.c b/drivers/gpu/drm/tests/drm_connector_test.c
index c66aa2dc8d9d..aad63839b5e5 100644
--- a/drivers/gpu/drm/tests/drm_connector_test.c
+++ b/drivers/gpu/drm/tests/drm_connector_test.c
@@ -4,6 +4,9 @@
  */
 
 #include <drm/drm_connector.h>
+#include <drm/drm_device.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_kunit_helpers.h>
 
 #include <kunit/test.h>
 
@@ -58,10 +61,27 @@ static void drm_test_get_tv_mode_from_name_truncated(struct kunit *test)
 	KUNIT_EXPECT_LT(test, ret, 0);
 };
 
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
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, drm->mode_config.dvi_i_select_subconnector_property);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, drm->mode_config.dvi_i_subconnector_property);
+}
+
 static struct kunit_case drm_get_tv_mode_from_name_tests[] = {
 	KUNIT_CASE_PARAM(drm_test_get_tv_mode_from_name_valid,
 			 drm_get_tv_mode_from_name_valid_gen_params),
 	KUNIT_CASE(drm_test_get_tv_mode_from_name_truncated),
+	KUNIT_CASE(drm_test_mode_create_dvi_i_properties),
 	{ }
 };
 
-- 
2.34.1

