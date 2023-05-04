Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 927306F6A71
	for <lists+dri-devel@lfdr.de>; Thu,  4 May 2023 13:52:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A23510E154;
	Thu,  4 May 2023 11:52:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7989A10E0E2;
 Thu,  4 May 2023 11:52:07 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-959a3e2dc72so64398466b.2; 
 Thu, 04 May 2023 04:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683201125; x=1685793125;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=fTUpyHZB9GLXr0QY2kQTvoVUL9eRAsPP7sKVznBCni4=;
 b=a8nvI5zODySrSyq+t15hFkd0I/4hzLamlegtGRsrsAjwuWXrdQrZ+xaw4kAkZcRsIv
 NM82BKymsPcW0wP9CTeP+1mwym0ZKHoKP00hRxuU9FhLqPuhJfnSVsZ4a80B/DRXrjoG
 8SBSMCXz+tbl6WRggAuvqhmfoQyMNEEJfdSDlqKPsrzHJf/pMTcHybRYjofrKVe7QJkv
 OfWgzjGAO7zZq+WZjsxMgiw4igdFNqdNZroSE52z7x+muDl7KLTSzGzdSAkTrE6MgNmh
 HvKEPvCh6ji5E5XUsrXKsnjBmp22zBCb7cs9Abgm6pl6pdOUMLiK0gca6LFLyX4+rSY6
 Gy0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683201125; x=1685793125;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fTUpyHZB9GLXr0QY2kQTvoVUL9eRAsPP7sKVznBCni4=;
 b=e2WLYFcNuYXQlY1Xsp01F9lRMMPwRMWNbZ97UOrOP4WRu9fQHdaBf4cCysCHE4LsxL
 i+iwI1cVR5v1XbP6mQN6gbDMeGDKR3RS5V70mzzjtGKfVqIrkG9aHKkNBh3TIa7oKT0h
 COn/dazwE5/CHc8O2FlTvYsWpQ+39GZMeBcspxqcWtqJiCwvbNZfhhYgk7+ta0Z/k/YW
 BQWRJzr1e6gi+eFuiqC5qBzc/WUNuws7XaMlA9FKqJvmd+4PGVqu0Z2MVEbQYXRiNU8Z
 eaq55x7STx0mIV2tstRpW6t7GemJ10NhU02eUUHGlEDY1jl7ZqSfpQSmzZyvfokDFUR7
 CX+A==
X-Gm-Message-State: AC+VfDxXOWHidsqRcXX3MI3KUdhjgtPEIuvs/lK0W45hbXW8VfW1ZL3e
 6KG5yzYsKoDC4zT1ko68hMk=
X-Google-Smtp-Source: ACHHUZ6xlZxmoQoq76UqZchcJIhvg+vCQDbfxmGrcnoxTlvWDTo7ASO/g4vkZKaAVMjAvg4nbxkSfQ==
X-Received: by 2002:a17:906:ef0a:b0:958:5c21:3fa7 with SMTP id
 f10-20020a170906ef0a00b009585c213fa7mr7118261ejs.25.1683201125656; 
 Thu, 04 May 2023 04:52:05 -0700 (PDT)
Received: from able.fritz.box (p4fc2092b.dip0.t-ipconnect.de. [79.194.9.43])
 by smtp.gmail.com with ESMTPSA id
 hx27-20020a170906847b00b009659ecdf29fsm1061741ejc.1.2023.05.04.04.52.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 04:52:05 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: francois.dugast@intel.com, felix.kuehling@amd.com,
 arunpravin.paneerselvam@amd.com, thomas_os@shipmail.org, dakr@redhat.com,
 luben.tuikov@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 02/13] drm: add drm_exec selftests v2
Date: Thu,  4 May 2023 13:51:48 +0200
Message-Id: <20230504115159.2245-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230504115159.2245-1-christian.koenig@amd.com>
References: <20230504115159.2245-1-christian.koenig@amd.com>
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

Largely just the initial skeleton.

v2: add array test as well

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/Kconfig               |  1 +
 drivers/gpu/drm/tests/Makefile        |  3 +-
 drivers/gpu/drm/tests/drm_exec_test.c | 96 +++++++++++++++++++++++++++
 3 files changed, 99 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/tests/drm_exec_test.c

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 2dc81eb062eb..068e574e234e 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -80,6 +80,7 @@ config DRM_KUNIT_TEST
 	select DRM_BUDDY
 	select DRM_EXPORT_FOR_TESTS if m
 	select DRM_KUNIT_TEST_HELPERS
+	select DRM_EXEC
 	default KUNIT_ALL_TESTS
 	help
 	  This builds unit tests for DRM. This option is not useful for
diff --git a/drivers/gpu/drm/tests/Makefile b/drivers/gpu/drm/tests/Makefile
index bca726a8f483..ba7baa622675 100644
--- a/drivers/gpu/drm/tests/Makefile
+++ b/drivers/gpu/drm/tests/Makefile
@@ -17,6 +17,7 @@ obj-$(CONFIG_DRM_KUNIT_TEST) += \
 	drm_modes_test.o \
 	drm_plane_helper_test.o \
 	drm_probe_helper_test.o \
-	drm_rect_test.o
+	drm_rect_test.o	\
+	drm_exec_test.o
 
 CFLAGS_drm_mm_test.o := $(DISABLE_STRUCTLEAK_PLUGIN)
diff --git a/drivers/gpu/drm/tests/drm_exec_test.c b/drivers/gpu/drm/tests/drm_exec_test.c
new file mode 100644
index 000000000000..26aa13e62d22
--- /dev/null
+++ b/drivers/gpu/drm/tests/drm_exec_test.c
@@ -0,0 +1,96 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2019 Intel Corporation
+ */
+
+#define pr_fmt(fmt) "drm_exec: " fmt
+
+#include <kunit/test.h>
+
+#include <linux/module.h>
+#include <linux/prime_numbers.h>
+
+#include <drm/drm_exec.h>
+#include <drm/drm_device.h>
+#include <drm/drm_gem.h>
+
+#include "../lib/drm_random.h"
+
+static struct drm_device dev;
+
+static void drm_exec_sanitycheck(struct kunit *test)
+{
+	struct drm_exec exec;
+
+	drm_exec_init(&exec, true);
+	drm_exec_fini(&exec);
+	pr_info("%s - ok!\n", __func__);
+}
+
+static void drm_exec_lock1(struct kunit *test)
+{
+	struct drm_gem_object gobj = { };
+	struct drm_exec exec;
+	int ret;
+
+	drm_gem_private_object_init(&dev, &gobj, PAGE_SIZE);
+
+	drm_exec_init(&exec, true);
+	drm_exec_while_not_all_locked(&exec) {
+		ret = drm_exec_prepare_obj(&exec, &gobj, 1);
+		drm_exec_continue_on_contention(&exec);
+		if (ret) {
+			drm_exec_fini(&exec);
+			pr_err("%s - err %d!\n", __func__, ret);
+			return;
+		}
+	}
+	drm_exec_fini(&exec);
+	pr_info("%s - ok!\n", __func__);
+}
+
+static void drm_exec_lock_array(struct kunit *test)
+{
+	struct drm_gem_object gobj1 = { };
+	struct drm_gem_object gobj2 = { };
+	struct drm_gem_object *array[] = { &gobj1, &gobj2 };
+	struct drm_exec exec;
+	int ret;
+
+	drm_gem_private_object_init(&dev, &gobj1, PAGE_SIZE);
+	drm_gem_private_object_init(&dev, &gobj2, PAGE_SIZE);
+
+	drm_exec_init(&exec, true);
+	ret = drm_exec_prepare_array(&exec, array, ARRAY_SIZE(array), 0);
+	if (ret) {
+		drm_exec_fini(&exec);
+		pr_err("%s - err %d!\n", __func__, ret);
+		return;
+	}
+	drm_exec_fini(&exec);
+	pr_info("%s - ok!\n", __func__);
+}
+
+static int drm_exec_suite_init(struct kunit_suite *suite)
+{
+	kunit_info(suite, "Testing DRM exec manager\n");
+	return 0;
+}
+
+static struct kunit_case drm_exec_tests[] = {
+	KUNIT_CASE(drm_exec_sanitycheck),
+	KUNIT_CASE(drm_exec_lock1),
+	KUNIT_CASE(drm_exec_lock_array),
+	{}
+};
+
+static struct kunit_suite drm_exec_test_suite = {
+	.name = "drm_exec",
+	.suite_init = drm_exec_suite_init,
+	.test_cases = drm_exec_tests,
+};
+
+kunit_test_suite(drm_exec_test_suite);
+
+MODULE_AUTHOR("AMD");
+MODULE_LICENSE("GPL and additional rights");
-- 
2.34.1

