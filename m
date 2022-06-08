Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 168ED542099
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 03:09:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62CBE10E66C;
	Wed,  8 Jun 2022 01:09:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CDEC10E4ED
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 01:09:00 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id i66so26165363oia.11
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jun 2022 18:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=usp.br; s=usp-google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Rjjg1a3nWCUoP0yEvGEXGikIUB9NR8vRANik7NG4UXI=;
 b=M/5hSOXxs30Bh27FoPJftTlLbh0zsD2U4j9E0JkOZaWL68YlZjHZAlOmgDN8bmY9H0
 l+0tBHR2RCNjLc85FvowWeunqAhN6ingu5slKNpIyY6fUQ57Y3HQRKcBQOE239xyQFzO
 jEJbF62TATxUeDJFxo5Zs+vXa58fB3SxdCaIuGEJmCxMFr1moSC7y+5v3cL1Wkm8seBQ
 fzeiEZtouveHyoSZN/SBq405rpSfggY0amcDFNfI6WjckGFbM3Rk1I4tkckGDMMYT1gx
 +cSwwMjG+rSwWBo0hIWekFv78YYAih7iOKYsJDapLnBstWeSpViekMTdBGSyGcYKBWJ9
 UYmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Rjjg1a3nWCUoP0yEvGEXGikIUB9NR8vRANik7NG4UXI=;
 b=EHcLymsDXiEUR6phabCdQF3bjN9Cb/QruWDuaJqffou0SNob1zw71goWnzBJvi9dUm
 EN2YhR4BNIaEbE3vUVoilU4CMjf5siprFVj1ak8HbC9b7Z2HnT6LF3XcLJia6alfNYEi
 sp6wjBnNEvCgQM7SRNfdJqNDon0rViCaOYOPQ85wLp+m2tlaw97ycEhF5kTFo/ioNT20
 5MAoNpG4GZTqTh7qllNj2ombvfn/eBlmjVdG3aMex/Huu3inVslwY/e6ULnEULoRq6fJ
 Iebw5UTLQK1EzjnKlesqfYXMs+jx4aVX5QxvZscJziTKwnHYQC/y5QInducBn3jDtJXy
 MqHA==
X-Gm-Message-State: AOAM533FtsGrXC/YZqEHVvYhrcPtaurPyc6H+VHvnkJwnVyMFsyunHVS
 e5OScAuMoGSnyYMS04WXlWsmBw==
X-Google-Smtp-Source: ABdhPJz7MM4T3UHdHhZ8nXaORar5QOfh6c85WGMix2iX+xg4uj7QGHtyCtuOK4vUQnlV0KPqklOlRg==
X-Received: by 2002:a05:6808:1189:b0:32b:7fb5:f443 with SMTP id
 j9-20020a056808118900b0032b7fb5f443mr1044217oil.269.1654650539203; 
 Tue, 07 Jun 2022 18:08:59 -0700 (PDT)
Received: from fedora.. ([2804:14d:8084:84c6:fe26:c42d:aab9:fa8a])
 by smtp.gmail.com with ESMTPSA id
 c16-20020a544e90000000b0032b1b84f4e3sm10343057oiy.22.2022.06.07.18.08.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 18:08:58 -0700 (PDT)
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <maira.canal@usp.br>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>, Jun Lei <jun.lei@amd.com>,
 Nicholas Choi <Nicholas.Choi@amd.com>,
 Harrison Chiu <harrison.chiu@amd.com>,
 Mark Yacoub <markyacoub@chromium.org>, Sean Paul <seanpaul@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Isabella Basso <isabbasso@riseup.net>, magalilemes00@gmail.com,
 tales.aparecida@gmail.com, mwen@igalia.com, andrealmeid@riseup.net,
 David Gow <davidgow@google.com>, Daniel Latypov <dlatypov@google.com>,
 brendanhiggins@google.com
Subject: [RFC 1/3] drm/amd/display: Introduce KUnit to DML
Date: Tue,  7 Jun 2022 22:07:08 -0300
Message-Id: <20220608010709.272962-2-maira.canal@usp.br>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220608010709.272962-1-maira.canal@usp.br>
References: <20220608010709.272962-1-maira.canal@usp.br>
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
 kunit-dev@googlegroups.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

KUnit unifies the test structure and provides helper tools that simplify
the development. Basic use case allows running tests as regular
processes, which makes easier to run unit tests on a development machine
and to integrate the tests in a CI system.

This commit introduce a basic unit test to one part of the Display Mode
Library: display_mode_lib, in order to introduce the basic structure of the
tests on the DML.

Signed-off-by: Maíra Canal <maira.canal@usp.br>
---
 drivers/gpu/drm/amd/display/Kconfig           |  1 +
 .../gpu/drm/amd/display/amdgpu_dm/Makefile    |  5 ++
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  3 +
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  3 +
 .../drm/amd/display/amdgpu_dm/tests/Kconfig   | 29 +++++++
 .../drm/amd/display/amdgpu_dm/tests/Makefile  | 14 ++++
 .../amdgpu_dm/tests/display_mode_lib_test.c   | 83 +++++++++++++++++++
 .../amd/display/amdgpu_dm/tests/dml_test.c    | 23 +++++
 .../amd/display/amdgpu_dm/tests/dml_test.h    | 13 +++
 9 files changed, 174 insertions(+)
 create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/tests/Kconfig
 create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/tests/Makefile
 create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/tests/display_mode_lib_test.c
 create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/tests/dml_test.c
 create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/tests/dml_test.h

diff --git a/drivers/gpu/drm/amd/display/Kconfig b/drivers/gpu/drm/amd/display/Kconfig
index 127667e549c1..83042e2e4d22 100644
--- a/drivers/gpu/drm/amd/display/Kconfig
+++ b/drivers/gpu/drm/amd/display/Kconfig
@@ -53,5 +53,6 @@ config DRM_AMD_SECURE_DISPLAY
             of crc of specific region via debugfs.
             Cooperate with specific DMCU FW.
 
+source "drivers/gpu/drm/amd/display/amdgpu_dm/tests/Kconfig"
 
 endmenu
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/Makefile b/drivers/gpu/drm/amd/display/amdgpu_dm/Makefile
index 718e123a3230..d25b63566640 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/Makefile
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/Makefile
@@ -24,6 +24,11 @@
 # It provides the control and status of dm blocks.
 
 
+AMDGPU_DM_LIBS = tests
+
+AMD_DM = $(addsuffix /Makefile, $(addprefix $(FULL_AMD_DISPLAY_PATH)/amdgpu_dm/,$(AMDGPU_DM_LIBS)))
+
+include $(AMD_DM)
 
 AMDGPUDM = amdgpu_dm.o amdgpu_dm_irq.o amdgpu_dm_mst_types.o amdgpu_dm_color.o
 
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index cb1e9bb60db2..f73da1e0088f 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -1655,6 +1655,7 @@ static int amdgpu_dm_init(struct amdgpu_device *adev)
 		goto error;
 	}
 
+	amdgpu_dml_test_init();
 
 	DRM_DEBUG_DRIVER("KMS initialized.\n");
 
@@ -1678,6 +1679,8 @@ static void amdgpu_dm_fini(struct amdgpu_device *adev)
 {
 	int i;
 
+	amdgpu_dml_test_exit();
+
 	if (adev->dm.vblank_control_workqueue) {
 		destroy_workqueue(adev->dm.vblank_control_workqueue);
 		adev->dm.vblank_control_workqueue = NULL;
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
index 3cc5c15303e6..e586d3a3d2f0 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
@@ -749,4 +749,7 @@ int dm_atomic_get_state(struct drm_atomic_state *state,
 struct amdgpu_dm_connector *
 amdgpu_dm_find_first_crtc_matching_connector(struct drm_atomic_state *state,
 					     struct drm_crtc *crtc);
+
+int amdgpu_dml_test_init(void);
+void amdgpu_dml_test_exit(void);
 #endif /* __AMDGPU_DM_H__ */
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/tests/Kconfig b/drivers/gpu/drm/amd/display/amdgpu_dm/tests/Kconfig
new file mode 100644
index 000000000000..bd1d971d4452
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/tests/Kconfig
@@ -0,0 +1,29 @@
+# SPDX-License-Identifier: MIT
+menu "DML Unit Tests"
+	depends on DRM_AMD_DC && KUNIT=m
+
+config DISPLAY_MODE_LIB_KUNIT_TEST
+	bool "Enable unit tests for dml/display_mode_lib" if !DML_KUNIT_TEST
+	default y if DML_KUNIT_TEST
+	help
+		Enables unit tests for the dml/display_mode_lib. Only useful for kernel
+		devs running KUnit.
+
+		For more information on KUnit and unit tests in general please refer to
+		the KUnit documentation in Documentation/dev-tools/kunit/.
+
+		If unsure, say N.
+
+config DML_KUNIT_TEST
+	bool "Run all unit tests for DML" if !KUNIT_ALL_TESTS
+	default KUNIT_ALL_TESTS
+	help
+		Enables unit tests for the Display Mode Library. Only useful for kernel
+		devs running KUnit.
+
+		For more information on KUnit and unit tests in general please refer to
+		the KUnit documentation in Documentation/dev-tools/kunit/.
+
+		If unsure, say N.
+
+endmenu
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/tests/Makefile b/drivers/gpu/drm/amd/display/amdgpu_dm/tests/Makefile
new file mode 100644
index 000000000000..53b38e340564
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/tests/Makefile
@@ -0,0 +1,14 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Makefile for the KUnit Tests for DML
+#
+
+DML_TESTS = dml_test.o
+
+ifdef CONFIG_DISPLAY_MODE_LIB_KUNIT_TEST
+DML_TESTS += display_mode_lib_test.o
+endif
+
+AMD_DAL_DML_TESTS = $(addprefix $(AMDDALPATH)/amdgpu_dm/tests/,$(DML_TESTS))
+
+AMD_DISPLAY_FILES += $(AMD_DAL_DML_TESTS)
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/tests/display_mode_lib_test.c b/drivers/gpu/drm/amd/display/amdgpu_dm/tests/display_mode_lib_test.c
new file mode 100644
index 000000000000..3ea0e7fb13e3
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/tests/display_mode_lib_test.c
@@ -0,0 +1,83 @@
+// SPDX-License-Identifier: MIT
+/*
+ * KUnit tests for dml/display_mode_lib.h
+ *
+ * Copyright (C) 2022, Maíra Canal <mairacanal@riseup.net>
+ */
+
+#include <kunit/test.h>
+#include "../../dc/dml/display_mode_lib.h"
+#include "../../dc/dml/display_mode_enums.h"
+#include "dml_test.h"
+
+/**
+ * DOC: Unit tests for AMDGPU DML display_mode_lib.h
+ *
+ * The display_mode_lib.h holds the functions responsible for the instantiation
+ * and logging of the Display Mode Library (DML).
+ *
+ * These KUnit tests were implemented with the intention of assuring the proper
+ * logging of the DML.
+ *
+ */
+
+static void dml_get_status_message_test(struct kunit *test)
+{
+	KUNIT_EXPECT_STREQ(test, dml_get_status_message(DML_VALIDATION_OK), "Validation OK");
+	KUNIT_EXPECT_STREQ(test, dml_get_status_message(DML_FAIL_SCALE_RATIO_TAP), "Scale ratio/tap");
+	KUNIT_EXPECT_STREQ(test, dml_get_status_message(DML_FAIL_SOURCE_PIXEL_FORMAT), "Source pixel format");
+	KUNIT_EXPECT_STREQ(test, dml_get_status_message(DML_FAIL_VIEWPORT_SIZE), "Viewport size");
+	KUNIT_EXPECT_STREQ(test, dml_get_status_message(DML_FAIL_TOTAL_V_ACTIVE_BW), "Total vertical active bandwidth");
+	KUNIT_EXPECT_STREQ(test, dml_get_status_message(DML_FAIL_DIO_SUPPORT), "DIO support");
+	KUNIT_EXPECT_STREQ(test, dml_get_status_message(DML_FAIL_NOT_ENOUGH_DSC), "Not enough DSC Units");
+	KUNIT_EXPECT_STREQ(test, dml_get_status_message(DML_FAIL_DSC_CLK_REQUIRED), "DSC clock required");
+	KUNIT_EXPECT_STREQ(test, dml_get_status_message(DML_FAIL_URGENT_LATENCY), "Urgent latency");
+	KUNIT_EXPECT_STREQ(test, dml_get_status_message(DML_FAIL_REORDERING_BUFFER), "Re-ordering buffer");
+	KUNIT_EXPECT_STREQ(test, dml_get_status_message(DML_FAIL_DISPCLK_DPPCLK), "Dispclk and Dppclk");
+	KUNIT_EXPECT_STREQ(test, dml_get_status_message(DML_FAIL_TOTAL_AVAILABLE_PIPES), "Total available pipes");
+	KUNIT_EXPECT_STREQ(test, dml_get_status_message(DML_FAIL_NUM_OTG), "Number of OTG");
+	KUNIT_EXPECT_STREQ(test, dml_get_status_message(DML_FAIL_WRITEBACK_MODE), "Writeback mode");
+	KUNIT_EXPECT_STREQ(test, dml_get_status_message(DML_FAIL_WRITEBACK_LATENCY), "Writeback latency");
+	KUNIT_EXPECT_STREQ(test, dml_get_status_message(DML_FAIL_WRITEBACK_SCALE_RATIO_TAP), "Writeback scale ratio/tap");
+	KUNIT_EXPECT_STREQ(test, dml_get_status_message(DML_FAIL_CURSOR_SUPPORT), "Cursor support");
+	KUNIT_EXPECT_STREQ(test, dml_get_status_message(DML_FAIL_PITCH_SUPPORT), "Pitch support");
+	KUNIT_EXPECT_STREQ(test, dml_get_status_message(DML_FAIL_PTE_BUFFER_SIZE), "PTE buffer size");
+	KUNIT_EXPECT_STREQ(test, dml_get_status_message(DML_FAIL_DSC_INPUT_BPC), "DSC input bpc");
+	KUNIT_EXPECT_STREQ(test, dml_get_status_message(DML_FAIL_PREFETCH_SUPPORT), "Prefetch support");
+	KUNIT_EXPECT_STREQ(test, dml_get_status_message(DML_FAIL_V_RATIO_PREFETCH), "Vertical ratio prefetch");
+}
+
+static struct kunit_case display_mode_library_test_cases[] = {
+	KUNIT_CASE(dml_get_status_message_test),
+	{  }
+};
+
+static struct kunit_suite display_mode_lib_test_suite = {
+	.name = "dml-display-mode-lib",
+	.test_cases = display_mode_library_test_cases,
+};
+
+static struct kunit_suite *display_mode_lib_test_suites[] = { &display_mode_lib_test_suite, NULL };
+
+int display_mode_lib_test_init(void)
+{
+	pr_info("===> Running display_mode_lib KUnit Tests");
+	pr_info("**********************************************************");
+	pr_info("**   NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE   **");
+	pr_info("**                                                      **");
+	pr_info("** display_mode_lib KUnit Tests are being run. This     **");
+	pr_info("** means that this is a TEST kernel and should not be   **");
+	pr_info("** used for production.                                 **");
+	pr_info("**                                                      **");
+	pr_info("** If you see this message and you are not debugging    **");
+	pr_info("** the kernel, report this immediately to your vendor!  **");
+	pr_info("**                                                      **");
+	pr_info("**********************************************************");
+
+	return __kunit_test_suites_init(display_mode_lib_test_suites);
+}
+
+void display_mode_lib_test_exit(void)
+{
+	return __kunit_test_suites_exit(display_mode_lib_test_suites);
+}
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/tests/dml_test.c b/drivers/gpu/drm/amd/display/amdgpu_dm/tests/dml_test.c
new file mode 100644
index 000000000000..9a5d47597c10
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/tests/dml_test.c
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include "dml_test.h"
+
+/**
+ * amdgpu_dml_test_init() - Initialise KUnit Tests for DML
+ *
+ * It aggregates all KUnit Tests related to the Display Mode Library (DML).
+ * The DML contains multiple modules, and to assure the modularity of the
+ * tests, the KUnit Tests for a DML module are also gathered in a separated
+ * module. Each KUnit Tests module is initiated in this function.
+ *
+ */
+int amdgpu_dml_test_init(void)
+{
+	display_mode_lib_test_init();
+	return 0;
+}
+
+void amdgpu_dml_test_exit(void)
+{
+	display_mode_lib_test_exit();
+}
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/tests/dml_test.h b/drivers/gpu/drm/amd/display/amdgpu_dm/tests/dml_test.h
new file mode 100644
index 000000000000..2786db9d0e87
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/tests/dml_test.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef DML_TEST_H_
+#define DML_TEST_H_
+
+#if defined (CONFIG_DISPLAY_MODE_LIB_KUNIT_TEST)
+int display_mode_lib_test_init(void);
+void display_mode_lib_test_exit(void);
+#else
+static inline int display_mode_lib_test_init(void) { return 0; }
+static inline void display_mode_lib_test_exit(void) { }
+#endif
+
+#endif
-- 
2.36.1

