Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C05054CA98
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jun 2022 16:00:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D375710F53F;
	Wed, 15 Jun 2022 14:00:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com
 [IPv6:2001:4860:4864:20::2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 861C410F53F
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 13:59:59 +0000 (UTC)
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-1014b2752c1so9589907fac.11
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 06:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=usp.br; s=usp-google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hM+JY40z0Sp//jmnsAggmvbu6S59VsvwNNKMeBMBEXU=;
 b=E/dfccgC/8TdlYB8aK4U8u1Mi3ftEqE5XWxpm/4CSt/+yIVvyW2xoa6NYjw8+wWmA/
 /CJ9BRlOZGaQ4trK+zo+XL4JtjmtP7sWYi6xQFXQgTQvQmK03vkDgrGcF7xKpl45I/Hd
 ei36k2v8u8wpW2VqmJnwnHjOkcJP74EQhQy4zYuuPubNDPGt83zH7fxRB/meZdJdJ65i
 jcyuPd4GUxOlJqyyfDkweFR7v0xW5Z0x87EmcGGcCv5K0/4Bq/snevbGqoicFxvLjz2A
 ADjkmGNffPv3kvO/TnD4JNSFr2Dou2eKejiNTMTgtR135MPRpxRFwv194HSxLlXG2iSu
 UeIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hM+JY40z0Sp//jmnsAggmvbu6S59VsvwNNKMeBMBEXU=;
 b=wPwSmFXFK8V0PQgaJJtUcLDDN/6fF1R8kPTZ7nS3A6ssPsedkdVkuTY1INBjuaZ85d
 EclbUyFIgAKu+7IMneKqffifPBqCuczsNlUtDnU7Pz0IeJQeIyMbpPidDeRV/089sXlF
 o1ACXmVzzw5SeoDnpadlhqqe/HseGpDxmZ8l/vZ0n7lm6g7IfTr24sHjeSMPmpHkFdM8
 OU7BncYZtlGnWSCVX28z9+PM1MDwKpLOFsyjCzdzQrD2c9Gp1l/4/pORMcPXvBKXdafJ
 F/2ufRiKFQTJeczCYPxWNYdJw4CDDi5y3HC+I/nkrVDESyyaV8WGTcoBuXeN4/uCLe+9
 0Ruw==
X-Gm-Message-State: AJIora87rwyzqBl6RKWQCJoSHBMgb4TYlIRnz/7+XUr66nKuzldrEWIv
 UKqMC1jts28sihy20YbPmh+nZA==
X-Google-Smtp-Source: AGRyM1vyf7Ta5X4sQIFo//kPj8q+JxWhC4AY9zTPh0zpG5Z+plq8k2bUmx9cnguDqySbpnG2Qzilsg==
X-Received: by 2002:a05:6870:c698:b0:de:8a16:c37 with SMTP id
 cv24-20020a056870c69800b000de8a160c37mr5604647oab.191.1655301598709; 
 Wed, 15 Jun 2022 06:59:58 -0700 (PDT)
Received: from fedora.. ([2804:14d:8084:84c6:fe26:c42d:aab9:fa8a])
 by smtp.gmail.com with ESMTPSA id
 u7-20020a056830248700b0060bfebb96e5sm6056928ots.35.2022.06.15.06.59.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jun 2022 06:59:58 -0700 (PDT)
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <maira.canal@usp.br>
To: Isabella Basso <isabbasso@riseup.net>, magalilemes00@gmail.com,
 tales.aparecida@gmail.com, mwen@igalia.com, andrealmeid@riseup.net,
 Trevor Woerner <twoerner@gmail.com>, leandro.ribeiro@collabora.com,
 n@nfraprado.net, Daniel Vetter <daniel@ffwll.ch>,
 Shuah Khan <skhan@linuxfoundation.org>, David Airlie <airlied@linux.ie>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, michal.winiarski@intel.com,
 Javier Martinez Canillas <javierm@redhat.com>,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 David Gow <davidgow@google.com>, Daniel Latypov <dlatypov@google.com>,
 brendanhiggins@google.com
Subject: [PATCH 08/10] drm: selftest: convert drm_framebuffer selftest to KUnit
Date: Wed, 15 Jun 2022 10:58:22 -0300
Message-Id: <20220615135824.15522-9-maira.canal@usp.br>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220615135824.15522-1-maira.canal@usp.br>
References: <20220615135824.15522-1-maira.canal@usp.br>
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
Cc: =?UTF-8?q?Ma=C3=ADra=20Canal?= <maira.canal@usp.br>,
 kunit-dev@googlegroups.com, linux-kselftest@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Considering the current adoption of the KUnit framework, convert the
DRM framebuffer selftest to the KUnit API.

Signed-off-by: Maíra Canal <maira.canal@usp.br>
---
 drivers/gpu/drm/selftests/Makefile            |  5 +--
 .../gpu/drm/selftests/drm_modeset_selftests.h |  9 ------
 .../drm/selftests/test-drm_modeset_common.c   | 32 -------------------
 .../drm/selftests/test-drm_modeset_common.h   | 21 ------------
 drivers/gpu/drm/tests/Kconfig                 | 12 +++++++
 drivers/gpu/drm/tests/Makefile                |  1 +
 .../test-drm_framebuffer.c                    | 25 ++++++++++-----
 7 files changed, 31 insertions(+), 74 deletions(-)
 delete mode 100644 drivers/gpu/drm/selftests/drm_modeset_selftests.h
 delete mode 100644 drivers/gpu/drm/selftests/test-drm_modeset_common.c
 delete mode 100644 drivers/gpu/drm/selftests/test-drm_modeset_common.h
 rename drivers/gpu/drm/{selftests => tests}/test-drm_framebuffer.c (96%)

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
diff --git a/drivers/gpu/drm/tests/Kconfig b/drivers/gpu/drm/tests/Kconfig
index eea0783f981d..de44385f217e 100644
--- a/drivers/gpu/drm/tests/Kconfig
+++ b/drivers/gpu/drm/tests/Kconfig
@@ -86,4 +86,16 @@ config DRM_DP_MST_HELPER_KUNIT_TEST
 
 		If in doubt, say "N".
 
+config DRM_FRAMEBUFFER_KUNIT_TEST
+	tristate "KUnit tests for DRM framebuffer" if !DRM_KUNIT_TEST
+	select DRM_KMS_HELPER
+	default y if DRM_KUNIT_TEST
+	help
+		This option provides KUnit modules that can be used to run
+		various selftests on parts of the DRM framebuffer API.  This
+		option is not useful for distributions or general kernels, but only
+		for kernel developers working on DRM and associated drivers.
+
+		If in doubt, say "N".
+
 endmenu
diff --git a/drivers/gpu/drm/tests/Makefile b/drivers/gpu/drm/tests/Makefile
index 735ca8e4c446..d802ca0f1544 100644
--- a/drivers/gpu/drm/tests/Makefile
+++ b/drivers/gpu/drm/tests/Makefile
@@ -5,3 +5,4 @@ obj-$(CONFIG_DRM_RECT_KUNIT_TEST) += test-drm_rect.o
 obj-$(CONFIG_DRM_FORMAT_KUNIT_TEST) += test-drm_format.o
 obj-$(CONFIG_DRM_PLANE_HELPER_KUNIT_TEST) += test-drm_plane_helper.o
 obj-$(CONFIG_DRM_DP_MST_HELPER_KUNIT_TEST) += test-drm_dp_mst_helper.o
+obj-$(CONFIG_DRM_FRAMEBUFFER_KUNIT_TEST) += test-drm_framebuffer.o
diff --git a/drivers/gpu/drm/selftests/test-drm_framebuffer.c b/drivers/gpu/drm/tests/test-drm_framebuffer.c
similarity index 96%
rename from drivers/gpu/drm/selftests/test-drm_framebuffer.c
rename to drivers/gpu/drm/tests/test-drm_framebuffer.c
index f6d66285c5fc..753e161ad57f 100644
--- a/drivers/gpu/drm/selftests/test-drm_framebuffer.c
+++ b/drivers/gpu/drm/tests/test-drm_framebuffer.c
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
+	.name = "drm_framebuffer_tests",
+	.test_cases = drm_framebuffer_tests,
+};
+
+kunit_test_suite(drm_framebuffer_test_suite);
+
+MODULE_LICENSE("GPL");
-- 
2.36.1

