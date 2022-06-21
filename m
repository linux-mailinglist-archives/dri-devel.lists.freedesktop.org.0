Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC10E553B34
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 22:11:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F8A6112011;
	Tue, 21 Jun 2022 20:11:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8B7A112011
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 20:11:13 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 l9-20020a056830268900b006054381dd35so11460955otu.4
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 13:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=usp.br; s=usp-google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FaElbDldtp91SSwLGIH1v7PEo5QUck2EOfzHV2R9FTE=;
 b=ICJ5ccrrRUTUHy2WI34UClumYLIML5NOayrU3tBgrMXvhgZ/xHq5MuaCtIGdfryQ1X
 /UUTWVLDMH5Vid5eIqD3VEnalzx+u8MfmSZGsR1fluKl0vaKlYNIhA8YRORpy2J4scYX
 9Wy8zAdIsvH3wXQIef8eM+bc6oy2QR7HeNOmYQEe3cMWqdJNcUBInFGrKE4MwTx3X/WM
 N48ilkwWiGCq7KyNBipQp+mOE00LjnkwSruYWPc8pXSqBTv0+hLyuIRN83D5CrMs7xNM
 SWewrQhsYANSoWs9Bu3ccwGhDXwdpZKKgGS65xrABIdYnAGsnQltHpTN4/mp0Yf4m7cU
 35Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FaElbDldtp91SSwLGIH1v7PEo5QUck2EOfzHV2R9FTE=;
 b=wF6o9JQDu4Fpr+ZejuduP4gqNjZWdvV1XB3nSBnXWI1yFOG6KyX0BhpDcNVK8nmcD8
 0xpYxk67KvAToUmmY2RgPs4hCNBmsyKimuSnuBvLijghE4Oh5GKVmoN7YedmbKlZAKZN
 PUffJGmp/LrxbsYXq0yHPgvd4+2u58Y3ZjjSGw7eSq3hd4VDuFWX7tdT6RJ8uulmL5m4
 4bH7mgc0ya8vUnKQhWfIpqktNMysGZ/M3S/TkEbBXis6vVjD9965bldOvIXaxxnKaVeU
 olAJ3YQG5yFkiRbTRDh7UJkE5R7UsnWJ7inqhC8VavZIvWstfcrEtl7adQqoV/XuDjTG
 +e2w==
X-Gm-Message-State: AJIora8ko34lddwK+4zDZ6X8tyIWDIXOf1sEkdBqeeOGnxJh3EPITIDc
 ex/Rrk07Q7BaTAdZzlsB/A/Weg==
X-Google-Smtp-Source: AGRyM1uJeqWbsd0iiTG3U2QqWwyJWDN+LpmuX07JWQuy7wzLo7maUicyDktTl2rgG975+Id3JC9a4g==
X-Received: by 2002:a05:6830:1c74:b0:60c:48dd:f534 with SMTP id
 s20-20020a0568301c7400b0060c48ddf534mr11858045otg.350.1655842272999; 
 Tue, 21 Jun 2022 13:11:12 -0700 (PDT)
Received: from fedora.. ([2804:14d:8084:84c6:fe26:c42d:aab9:fa8a])
 by smtp.gmail.com with ESMTPSA id
 o206-20020acad7d7000000b0032b7a0c5da1sm9759771oig.27.2022.06.21.13.11.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jun 2022 13:11:12 -0700 (PDT)
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <maira.canal@usp.br>
To: Isabella Basso <isabbasso@riseup.net>, magalilemes00@gmail.com,
 tales.aparecida@gmail.com, mwen@igalia.com, andrealmeid@riseup.net,
 siqueirajordao@riseup.net, Trevor Woerner <twoerner@gmail.com>,
 leandro.ribeiro@collabora.com, n@nfraprado.net,
 Daniel Vetter <daniel@ffwll.ch>, Shuah Khan <skhan@linuxfoundation.org>,
 David Airlie <airlied@linux.ie>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, michal.winiarski@intel.com,
 Javier Martinez Canillas <javierm@redhat.com>,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 David Gow <davidgow@google.com>, Daniel Latypov <dlatypov@google.com>,
 brendanhiggins@google.com
Subject: [PATCH v2 7/9] drm: selftest: convert drm_framebuffer selftest to
 KUnit
Date: Tue, 21 Jun 2022 17:09:24 -0300
Message-Id: <20220621200926.257002-8-maira.canal@usp.br>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220621200926.257002-1-maira.canal@usp.br>
References: <20220621200926.257002-1-maira.canal@usp.br>
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
Cc: linux-kernel@vger.kernel.org,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <maira.canal@usp.br>,
 dri-devel@lists.freedesktop.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Considering the current adoption of the KUnit framework, convert the
DRM framebuffer selftest to the KUnit API.

Tested-by: David Gow <davidgow@google.com>
Signed-off-by: Maíra Canal <maira.canal@usp.br>
---
 drivers/gpu/drm/selftests/Makefile            |  5 +--
 .../gpu/drm/selftests/drm_modeset_selftests.h |  9 ------
 .../drm/selftests/test-drm_modeset_common.c   | 32 -------------------
 .../drm/selftests/test-drm_modeset_common.h   | 21 ------------
 drivers/gpu/drm/tests/Makefile                |  2 +-
 .../drm_framebuffer_test.c}                   | 25 ++++++++++-----
 6 files changed, 19 insertions(+), 75 deletions(-)
 delete mode 100644 drivers/gpu/drm/selftests/drm_modeset_selftests.h
 delete mode 100644 drivers/gpu/drm/selftests/test-drm_modeset_common.c
 delete mode 100644 drivers/gpu/drm/selftests/test-drm_modeset_common.h
 rename drivers/gpu/drm/{selftests/test-drm_framebuffer.c => tests/drm_framebuffer_test.c} (96%)

diff --git a/drivers/gpu/drm/selftests/Makefile b/drivers/gpu/drm/selftests/Makefile
index 1539f55db9a7..f7db628b60cb 100644
--- a/drivers/gpu/drm/selftests/Makefile
+++ b/drivers/gpu/drm/selftests/Makefile
@@ -1,5 +1,2 @@
 # SPDX-License-Identifier: GPL-2.0-only
-test-drm_modeset-y := test-drm_modeset_common.o test-drm_framebuffer.o
-
-obj-$(CONFIG_DRM_DEBUG_SELFTEST) += test-drm_mm.o test-drm_modeset.o \
-				    test-drm_buddy.o
+obj-$(CONFIG_DRM_DEBUG_SELFTEST) += test-drm_mm.o test-drm_buddy.o
diff --git a/drivers/gpu/drm/selftests/drm_modeset_selftests.h b/drivers/gpu/drm/selftests/drm_modeset_selftests.h
deleted file mode 100644
index 40a29b8cf386..000000000000
--- a/drivers/gpu/drm/selftests/drm_modeset_selftests.h
+++ /dev/null
@@ -1,9 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/* List each unit test as selftest(name, function)
- *
- * The name is used as both an enum and expanded as igt__name to create
- * a module parameter. It must be unique and legal for a C identifier.
- *
- * Tests are executed in order by igt/drm_selftests_helper
- */
-selftest(check_drm_framebuffer_create, igt_check_drm_framebuffer_create)
diff --git a/drivers/gpu/drm/selftests/test-drm_modeset_common.c b/drivers/gpu/drm/selftests/test-drm_modeset_common.c
deleted file mode 100644
index 2a7f93774006..000000000000
--- a/drivers/gpu/drm/selftests/test-drm_modeset_common.c
+++ /dev/null
@@ -1,32 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * Common file for modeset selftests.
- */
-
-#include <linux/module.h>
-
-#include "test-drm_modeset_common.h"
-
-#define TESTS "drm_modeset_selftests.h"
-#include "drm_selftest.h"
-
-#include "drm_selftest.c"
-
-static int __init test_drm_modeset_init(void)
-{
-	int err;
-
-	err = run_selftests(selftests, ARRAY_SIZE(selftests), NULL);
-
-	return err > 0 ? 0 : err;
-}
-
-static void __exit test_drm_modeset_exit(void)
-{
-}
-
-module_init(test_drm_modeset_init);
-module_exit(test_drm_modeset_exit);
-
-MODULE_AUTHOR("Intel Corporation");
-MODULE_LICENSE("GPL");
diff --git a/drivers/gpu/drm/selftests/test-drm_modeset_common.h b/drivers/gpu/drm/selftests/test-drm_modeset_common.h
deleted file mode 100644
index 3feb2fea1a6b..000000000000
--- a/drivers/gpu/drm/selftests/test-drm_modeset_common.h
+++ /dev/null
@@ -1,21 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-
-#ifndef __TEST_DRM_MODESET_COMMON_H__
-#define __TEST_DRM_MODESET_COMMON_H__
-
-#include <linux/errno.h>
-#include <linux/printk.h>
-
-#define FAIL(test, msg, ...) \
-	do { \
-		if (test) { \
-			pr_err("%s/%u: " msg, __FUNCTION__, __LINE__, ##__VA_ARGS__); \
-			return -EINVAL; \
-		} \
-	} while (0)
-
-#define FAIL_ON(x) FAIL((x), "%s", "FAIL_ON(" __stringify(x) ")\n")
-
-int igt_check_drm_framebuffer_create(void *ignored);
-
-#endif
diff --git a/drivers/gpu/drm/tests/Makefile b/drivers/gpu/drm/tests/Makefile
index 40c003df2625..d181da7e3e6b 100644
--- a/drivers/gpu/drm/tests/Makefile
+++ b/drivers/gpu/drm/tests/Makefile
@@ -2,4 +2,4 @@
 
 obj-$(CONFIG_DRM_KUNIT_TEST) += drm_damage_helper_test.o drm_cmdline_parser_test.o \
 	drm_rect_test.o drm_format_test.o drm_plane_helper_test.o \
-	drm_dp_mst_helper_test.o
+	drm_dp_mst_helper_test.o drm_framebuffer_test.o
diff --git a/drivers/gpu/drm/selftests/test-drm_framebuffer.c b/drivers/gpu/drm/tests/drm_framebuffer_test.c
similarity index 96%
rename from drivers/gpu/drm/selftests/test-drm_framebuffer.c
rename to drivers/gpu/drm/tests/drm_framebuffer_test.c
index f6d66285c5fc..a1b57703cd5a 100644
--- a/drivers/gpu/drm/selftests/test-drm_framebuffer.c
+++ b/drivers/gpu/drm/tests/drm_framebuffer_test.c
@@ -3,8 +3,7 @@
  * Test cases for the drm_framebuffer functions
  */
 
-#include <linux/kernel.h>
-
+#include <kunit/test.h>
 #include <drm/drm_device.h>
 #include <drm/drm_mode.h>
 #include <drm/drm_fourcc.h>
@@ -12,8 +11,6 @@
 
 #include "../drm_crtc_internal.h"
 
-#include "test-drm_modeset_common.h"
-
 #define MIN_WIDTH 4
 #define MAX_WIDTH 4096
 #define MIN_HEIGHT 4
@@ -336,15 +333,27 @@ static int execute_drm_mode_fb_cmd2(struct drm_mode_fb_cmd2 *r)
 	return buffer_created;
 }
 
-int igt_check_drm_framebuffer_create(void *ignored)
+static void igt_check_drm_framebuffer_create(struct kunit *test)
 {
 	int i = 0;
 
 	for (i = 0; i < ARRAY_SIZE(createbuffer_tests); i++) {
-		FAIL(createbuffer_tests[i].buffer_created !=
+		KUNIT_EXPECT_EQ_MSG(test, createbuffer_tests[i].buffer_created,
 				execute_drm_mode_fb_cmd2(&createbuffer_tests[i].cmd),
 		     "Test %d: \"%s\" failed\n", i, createbuffer_tests[i].name);
 	}
-
-	return 0;
 }
+
+static struct kunit_case drm_framebuffer_tests[] = {
+	KUNIT_CASE(igt_check_drm_framebuffer_create),
+	{ }
+};
+
+static struct kunit_suite drm_framebuffer_test_suite = {
+	.name = "drm_framebuffer",
+	.test_cases = drm_framebuffer_tests,
+};
+
+kunit_test_suite(drm_framebuffer_test_suite);
+
+MODULE_LICENSE("GPL");
-- 
2.36.1

