Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11142825FC0
	for <lists+dri-devel@lfdr.de>; Sat,  6 Jan 2024 15:03:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E98AF10E032;
	Sat,  6 Jan 2024 14:03:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE48D10E032
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Jan 2024 14:03:30 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 98e67ed59e1d1-28c0d8dd88bso260840a91.2
 for <dri-devel@lists.freedesktop.org>; Sat, 06 Jan 2024 06:03:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704549810; x=1705154610; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NS8AIREFz1XWmTAMUhkfxle7maAtwV7jGirdI2uRztQ=;
 b=YX1waCb6V4o82RTxAtXZPQSVpt6EdtCSqrKyYozuB22CjYkwciD+xjMEjABsYRGa10
 Hykz8Pm/+D8RgjFIpBLNNo8N3di/RrSC3SQKlQl8Vmdk9G0rAQGbLXiGCkL96+lchNR4
 Baz51sJBAv7W3dX0hBf0ACsg+oOhky0tgwRtq0efUG8HwtRF2goXtzDlJEC249qyIL9a
 R7H1vYuYpxMHCHsz4npmP4YtACwFk98dOePpiz0XMeFgP27Xam78WOY3os42jh7kY1p2
 7P7N7zfYaISeM+hKiXEL9ECtx27UDD56W4hOpUJoViiAEg3p2z70gj2X9Kmue7++27ek
 16tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704549810; x=1705154610;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NS8AIREFz1XWmTAMUhkfxle7maAtwV7jGirdI2uRztQ=;
 b=DMM4rBNHHLIb/xLBKg33ZZZy+skz1AEP9o64OY/4EYZfb4j80AUEghSOiczUZhHdo7
 bmmLslXt9IPDY9qbyJls9lajg0vjHNS/mf0R3MIgCfwGyw1fNAMRGcHa6N2lD+0edIri
 HbLDrOhgIhqA9XyJWl50B0yVtN6Bl72LktIdHy8jtqoerpyvrf5TXH2lDP7emT8cuVIF
 cXDfBB2I2/uD+a7M01D8XtRKzi6PjgTNhME9hf1dFu4RMy0g5bFswPEsVsMAgo6xONII
 sw3J7Vy6nmQLd/tF7xQolxPcEZmP9zRXQZ9hnCL1Mapm+5XVBktMuZqSwW75eBJQaa8W
 QuSg==
X-Gm-Message-State: AOJu0YybhtiRHJ3nO913uU5qkPN1elMZ+KtIWtMEq5PaxsCRxgRbwgzW
 MWLyCIzIIKqJstltDbS89qk=
X-Google-Smtp-Source: AGHT+IG4c74Zx8hbqiQVId29IZQbC6NTlq/Z51ofPKz6crwPf/GIf/VzHhswWMqbUus7RJOZFgdIpA==
X-Received: by 2002:a17:902:7004:b0:1d4:2df6:95c0 with SMTP id
 y4-20020a170902700400b001d42df695c0mr382327plk.114.1704549810223; 
 Sat, 06 Jan 2024 06:03:30 -0800 (PST)
Received: from anfanite396-Predator-PH315-51.. ([202.43.120.140])
 by smtp.gmail.com with ESMTPSA id
 bj12-20020a170902850c00b001d058ad8770sm3071576plb.306.2024.01.06.06.03.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Jan 2024 06:03:29 -0800 (PST)
From: Dipam Turkar <dipamt1729@gmail.com>
To: maarten.lankhorst@linux.intel.com
Subject: [PATCH v3 1/1] drm/tests: Add KUnit tests for
 drm_mode_create_dvi_i_properties()
Date: Sat,  6 Jan 2024 19:31:18 +0530
Message-Id: <20240106140117.9777-1-dipamt1729@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CALHmwspWRT=pj+mPDhf8YTwSpTz6LiNjq18wbUk7wCW3ijKU4A@mail.gmail.com>
References: <CALHmwspWRT=pj+mPDhf8YTwSpTz6LiNjq18wbUk7wCW3ijKU4A@mail.gmail.com>
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 mripard@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

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

