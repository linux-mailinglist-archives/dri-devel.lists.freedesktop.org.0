Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 803BBB27E55
	for <lists+dri-devel@lfdr.de>; Fri, 15 Aug 2025 12:36:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77DD110E91C;
	Fri, 15 Aug 2025 10:36:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="pwTuRg/G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f201.google.com (mail-qt1-f201.google.com
 [209.85.160.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35F7610E91B
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Aug 2025 10:36:12 +0000 (UTC)
Received: by mail-qt1-f201.google.com with SMTP id
 d75a77b69052e-4b10990a1f0so38156921cf.0
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Aug 2025 03:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1755254171; x=1755858971;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=9cK185h9gxNmOTBKXZc10qbmIH62I7BV6bECtC8O9ek=;
 b=pwTuRg/Gb9zEAk7PMcb9L48AgNTKnGfXrHNd6gMUGcmE2T26AeHhgsG4fx1vH46seO
 +5m5PUGd8+SVpRGuSVPj/ygD6BULK4u6DezCoSHJq099xC8CftmdWjFIUMcxhP9dHfbd
 TJ+E2SZAhvYH8vKjAuohRfHrIRFMtgZkExgnjvZ7Xj69wiwowxSLhJv6U3bfG9ZVt49I
 cc4R92NWwQsa7hQVO4bvy6C0qUhuU9CZVGEOWN+cISp5A+TGXNLz4XtHaeKmhI1xIIyU
 B2F1otJW8+76/c/IzCYAx3oz4DXK6L58mTigdx6gJBJ7YnoaA3cr0ldoP8NkCoCOPV9b
 ZfLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755254171; x=1755858971;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9cK185h9gxNmOTBKXZc10qbmIH62I7BV6bECtC8O9ek=;
 b=krNwsbxMq1abxlTliQhcHD8wL3FN/zR6bouW/yrqMc2aIqEBmxamEC/V74UZn54p/e
 IppdeQagItWimyJCWE1h72AtbG+UovyKmS/M+Nhzfrt2K5cI2iKos0t9aAAn3GNuDA0n
 FGzWD9Im8ex8rDkGtF8V0XTs0e973zoKh7w84w3DqKdb0n8BNi6bcE7R22O/pBGRKAr3
 4jTm2XZzmd1M2qEaLOSfumdn6ecN9BnsK7LEadeuED7d28YI6tan5jQyA/C8Np5PrinB
 OW5khHh+WhMnsVgPDx+SqRrgsVT5ufbfRq0nZxATlCOywlYTJGonRhWrXaXlCkdWOozI
 kmKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWvhUy4nTZ1eyWQ6nY1Y9g1sxvojgUDUoF4zBjPiJxgKhtkSo7ztzNS8z0ZdkCDhnWv5KhkYxZUA0A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw/BWNv5B9h9zZogGtEEXkwT3+Al1Mqx3BoPAbLT5ylv5s5C9nn
 N76pxDor5+CN+jN8L0JUWzWFzDNoE5ZptgKHWzL2ui7v5QTXAB0ZWheyVMQdDV5N5qJ0Z8gDVKr
 SPtb3P8edoT0wiA==
X-Google-Smtp-Source: AGHT+IEaT0Jnn5or3jfzn5ggHOZAVAIlHTvGeOhQZuo5gK5kIbPKro1ACE25ujkZ3EehfX1NVXCYKKGDM6Qxbg==
X-Received: from qtbih9.prod.google.com ([2002:a05:622a:6a89:b0:4b0:9663:7cc6])
 (user=marievic job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:622a:1b12:b0:4b0:616f:919b with SMTP id
 d75a77b69052e-4b11e21e941mr15083281cf.39.1755254171112; 
 Fri, 15 Aug 2025 03:36:11 -0700 (PDT)
Date: Fri, 15 Aug 2025 10:35:58 +0000
In-Reply-To: <20250815103604.3857930-1-marievic@google.com>
Mime-Version: 1.0
References: <20250815103604.3857930-1-marievic@google.com>
X-Mailer: git-send-email 2.51.0.rc1.167.g924127e9c0-goog
Message-ID: <20250815103604.3857930-2-marievic@google.com>
Subject: [PATCH v3 1/7] kunit: Add parent kunit for parameterized test context
From: Marie Zhussupova <marievic@google.com>
To: rmoar@google.com, davidgow@google.com, shuah@kernel.org, 
 brendan.higgins@linux.dev
Cc: mark.rutland@arm.com, elver@google.com, dvyukov@google.com, 
 lucas.demarchi@intel.com, thomas.hellstrom@linux.intel.com, 
 rodrigo.vivi@intel.com, linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com, kasan-dev@googlegroups.com, 
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Marie Zhussupova <marievic@google.com>
Content-Type: text/plain; charset="UTF-8"
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

Currently, KUnit parameterized tests lack a mechanism to share
resources across parameter runs because the same `struct kunit`
instance is cleaned up and reused for each run.

This patch introduces parameterized test context, enabling test
users to share resources between parameter runs. It also allows
setting up resources that need to be available for all parameter
runs only once, which is helpful in cases where setup is expensive.

To establish a parameterized test context, this patch adds a
parent pointer field to `struct kunit`. This allows resources added
to the parent `struct kunit` to be shared and accessible across all
parameter runs.

In kunit_run_tests(), the default `struct kunit` created is now
designated to act as the parameterized test context whenever a test
is parameterized.

Subsequently, a new `struct kunit` is made for each parameter run, and
its parent pointer is set to the `struct kunit` that holds the
parameterized test context.

Reviewed-by: David Gow <davidgow@google.com>
Reviewed-by: Rae Moar <rmoar@google.com>
Signed-off-by: Marie Zhussupova <marievic@google.com>
---

Changes in v3:
v2: https://lore.kernel.org/all/20250811221739.2694336-2-marievic@google.com/
- Commit message formatting.

Changes in v2:
v1: https://lore.kernel.org/all/20250729193647.3410634-2-marievic@google.com/
- Descriptions of the parent pointer in `struct kunit` were changed to
  be more general, as it could be used to share resources not only
  between parameter runs but also between test cases in the future.
- When printing parameter descriptions using test.param_index was changed
  to param_test.param_index.
- kunit_cleanup(&test) in kunit_run_tests() was moved inside the
  parameterized test check.
- The comments and the commit message were changed to reflect the
  parameterized testing terminology. See the patch series cover letter
  change log for the definitions.

---
 include/kunit/test.h |  8 ++++++--
 lib/kunit/test.c     | 34 ++++++++++++++++++++--------------
 2 files changed, 26 insertions(+), 16 deletions(-)

diff --git a/include/kunit/test.h b/include/kunit/test.h
index 39c768f87dc9..b47b9a3102f3 100644
--- a/include/kunit/test.h
+++ b/include/kunit/test.h
@@ -268,14 +268,18 @@ struct kunit_suite_set {
  *
  * @priv: for user to store arbitrary data. Commonly used to pass data
  *	  created in the init function (see &struct kunit_suite).
+ * @parent: reference to the parent context of type struct kunit that can
+ *	    be used for storing shared resources.
  *
  * Used to store information about the current context under which the test
  * is running. Most of this data is private and should only be accessed
- * indirectly via public functions; the one exception is @priv which can be
- * used by the test writer to store arbitrary data.
+ * indirectly via public functions; the two exceptions are @priv and @parent
+ * which can be used by the test writer to store arbitrary data and access the
+ * parent context, respectively.
  */
 struct kunit {
 	void *priv;
+	struct kunit *parent;
 
 	/* private: internal use only. */
 	const char *name; /* Read only after initialization! */
diff --git a/lib/kunit/test.c b/lib/kunit/test.c
index f3c6b11f12b8..14a8bd846939 100644
--- a/lib/kunit/test.c
+++ b/lib/kunit/test.c
@@ -647,6 +647,7 @@ int kunit_run_tests(struct kunit_suite *suite)
 	struct kunit_case *test_case;
 	struct kunit_result_stats suite_stats = { 0 };
 	struct kunit_result_stats total_stats = { 0 };
+	const void *curr_param;
 
 	/* Taint the kernel so we know we've run tests. */
 	add_taint(TAINT_TEST, LOCKDEP_STILL_OK);
@@ -679,37 +680,42 @@ int kunit_run_tests(struct kunit_suite *suite)
 		} else {
 			/* Get initial param. */
 			param_desc[0] = '\0';
-			test.param_value = test_case->generate_params(NULL, param_desc);
+			/* TODO: Make generate_params try-catch */
+			curr_param = test_case->generate_params(NULL, param_desc);
 			test_case->status = KUNIT_SKIPPED;
 			kunit_log(KERN_INFO, &test, KUNIT_SUBTEST_INDENT KUNIT_SUBTEST_INDENT
 				  "KTAP version 1\n");
 			kunit_log(KERN_INFO, &test, KUNIT_SUBTEST_INDENT KUNIT_SUBTEST_INDENT
 				  "# Subtest: %s", test_case->name);
 
-			while (test.param_value) {
-				kunit_run_case_catch_errors(suite, test_case, &test);
+			while (curr_param) {
+				struct kunit param_test = {
+					.param_value = curr_param,
+					.param_index = ++test.param_index,
+					.parent = &test,
+				};
+				kunit_init_test(&param_test, test_case->name, test_case->log);
+				kunit_run_case_catch_errors(suite, test_case, &param_test);
 
 				if (param_desc[0] == '\0') {
 					snprintf(param_desc, sizeof(param_desc),
-						 "param-%d", test.param_index);
+						 "param-%d", param_test.param_index);
 				}
 
-				kunit_print_ok_not_ok(&test, KUNIT_LEVEL_CASE_PARAM,
-						      test.status,
-						      test.param_index + 1,
+				kunit_print_ok_not_ok(&param_test, KUNIT_LEVEL_CASE_PARAM,
+						      param_test.status,
+						      param_test.param_index,
 						      param_desc,
-						      test.status_comment);
+						      param_test.status_comment);
 
-				kunit_update_stats(&param_stats, test.status);
+				kunit_update_stats(&param_stats, param_test.status);
 
 				/* Get next param. */
 				param_desc[0] = '\0';
-				test.param_value = test_case->generate_params(test.param_value, param_desc);
-				test.param_index++;
-				test.status = KUNIT_SUCCESS;
-				test.status_comment[0] = '\0';
-				test.priv = NULL;
+				curr_param = test_case->generate_params(curr_param, param_desc);
 			}
+			/* TODO: Put this kunit_cleanup into a try-catch. */
+			kunit_cleanup(&test);
 		}
 
 		kunit_print_attr((void *)test_case, true, KUNIT_LEVEL_CASE);
-- 
2.51.0.rc1.167.g924127e9c0-goog

