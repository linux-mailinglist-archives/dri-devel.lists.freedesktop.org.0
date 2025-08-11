Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD46B21814
	for <lists+dri-devel@lfdr.de>; Tue, 12 Aug 2025 00:17:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E7FD10E569;
	Mon, 11 Aug 2025 22:17:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="FObbkiMk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f73.google.com (mail-qv1-f73.google.com
 [209.85.219.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C224010E569
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 22:17:48 +0000 (UTC)
Received: by mail-qv1-f73.google.com with SMTP id
 6a1803df08f44-70707168c59so51366556d6.2
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 15:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1754950668; x=1755555468;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=ai73eVBeTV1L+LH/Eg2uYJxn5nX9nX6extQG0PIgIeU=;
 b=FObbkiMklQdgjl6XxLuEjNdHJ4qp0jwgy7K7+B3SZ3UQyXW1Zb0vsgtSiUsOT76IeU
 ZLchvDLugppWVVwfRsyL2E4fLV3TPhMTNu2juRG4huK9Fh8fwji0jjO+LZg24vx3hQuh
 Eq7f/SiXXmrNwtgGey+GormWb+ECMR0X3QapVJdYIhQJ8KBGB6HOwm6S9RHglEkVk7iY
 Yj457MuHsXgm66Eu81Tk4I0w947df/a0ndswE6aZJc5JEWLAIhC9b4JyXxF3b3A22n3z
 QBdJoZGcDEN558SwiZbxwD7aH4vCmJQROdoG6DHwt5XapdfXuuvkoHyUU+rLY3NNiwcj
 Qvow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754950668; x=1755555468;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ai73eVBeTV1L+LH/Eg2uYJxn5nX9nX6extQG0PIgIeU=;
 b=vJQgI8L2SBgwkTkByjowY/zlvPMM5E02qIuRc3tIaT5cFMoSM9QAyt+vWH6kLtgxgV
 TanQkYhK7jBNQsSZC18Tw3rd+9Dx/D38WJDRmBhh+Y2JbiXg7zoPFSb8CWGGA2kNYdFr
 WLHN3FPLWE78s7aniv1tzZJBvCJTnics6DAMvkkKtHMDY39PilsaciTVFtRVE+cX2Z7G
 fR8SrpiY1cYJFt5HvWx3duCoSGGeo+B7YoIMxpezHpAKZU8fnmal1rX9QLie9V0abw1t
 3/7A9RL2PjyfXmZHYuzaZrnROrieqJdVN8dYggSUyn+KAUZRdN+d0C1dhQuRzow8R9Bg
 Jd5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBoM0hggEIiUV1H4JjVJpEwDogBKmz41ExIxDOy3reVZBeDmMhNFg8hTRfYMGBtQKhmQ3pU4aI/+4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxbCDpDsj3OsthkaR74oOg4lSyxKu7+osJNDR1HVBHPqD/NyUse
 NuXYAaqX2a/5xjSLOKUTNSt/orzbXddV/ulzJeOsvTcDXS4xxqBg3MujRXWDWlI5WhDUQUxTzQ3
 jifb8MB+MVmMrdg==
X-Google-Smtp-Source: AGHT+IFh2sPMTRJoRpdZUZIa9gzWqo7Kt+lC8xl+JpuQTbbjZIqwk00Utr+ssMOiXHKMxm002rqOwOTj1ryw8A==
X-Received: from qvad7.prod.google.com ([2002:a0c:f107:0:b0:707:34cf:dea8])
 (user=marievic job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6214:2522:b0:707:3c17:8e8b with SMTP id
 6a1803df08f44-7099a5022e3mr203449086d6.50.1754950667602; 
 Mon, 11 Aug 2025 15:17:47 -0700 (PDT)
Date: Mon, 11 Aug 2025 22:17:33 +0000
In-Reply-To: <20250811221739.2694336-1-marievic@google.com>
Mime-Version: 1.0
References: <20250811221739.2694336-1-marievic@google.com>
X-Mailer: git-send-email 2.51.0.rc0.205.g4a044479a3-goog
Message-ID: <20250811221739.2694336-2-marievic@google.com>
Subject: [PATCH v2 1/7] kunit: Add parent kunit for parameterized test context
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

Currently, KUnit parameterized tests lack a mechanism
to share resources across parameter runs because the
same `struct kunit` instance is cleaned up and
reused for each run.

This patch introduces parameterized test context,
enabling test users to share resources between
parameter runs. It also allows setting up resources
that need to be available for all parameter runs only once,
which is helpful in cases where setup is expensive.

To establish a parameterized test context, this
patch adds a parent pointer field to `struct kunit`.
This allows resources added to the parent `struct kunit`
to be shared and accessible across all parameter runs.

In kunit_run_tests(), the default `struct kunit`
created is now designated to act as the parameterized
test context whenever a test is parameterized.

Subsequently, a new `struct kunit` is made
for each parameter run, and its parent pointer is
set to the `struct kunit` that holds the
parameterized test context.

Signed-off-by: Marie Zhussupova <marievic@google.com>
---

Changes in v2:

- Descriptions of the parent pointer in `struct kunit`
  were changed to be more general, as it could be
  used to share resources not only between parameter
  runs but also between test cases in the future.
- When printing parameter descriptions using
  test.param_index was changed to param_test.param_index.
- kunit_cleanup(&test) in kunit_run_tests() was moved
  inside the parameterized test check.
- The comments and the commit message were changed to
  reflect the parameterized testing terminology. See
  the patch series cover letter change log for the
  definitions.

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
2.51.0.rc0.205.g4a044479a3-goog

