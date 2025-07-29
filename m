Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC88B15388
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jul 2025 21:37:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9833C10E02F;
	Tue, 29 Jul 2025 19:37:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="jhiqECnm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f201.google.com (mail-qk1-f201.google.com
 [209.85.222.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C189810E02F
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 19:37:17 +0000 (UTC)
Received: by mail-qk1-f201.google.com with SMTP id
 af79cd13be357-7e623cb763bso1037793085a.3
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 12:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1753817837; x=1754422637;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=7t36RxdzKGiVmpStJKp3ep3ZJUIKeCeGyRBEDxUk+R0=;
 b=jhiqECnmgLn88QIfCh/sh1tnrs11zh2MITzmP0XR7jj5eavXgUEpJr9JPMs9+0N/WI
 l7AHdTmjT+PbYMW19FRu6CTqdwId3+7fitONNKj+RGX1pCfkGP/ozp8rOvZUio8jqqhH
 Ma07pcqTQEL5PexL7kFGzioOGOmU011JjLyfiHL9LyqjITsQ92hU5hwR2qULBo3bzUlX
 A4SRkzaJcoa5d/DvsYM8uwQQmxhDNEcm5z3Zw8hjkJWDRaQC3QCSIih/Dcn/LyOIYDRH
 5WKpQ/EpjoBJHESJ8PT6Kd1pcp1wmxk4xuQt4BFlgaxwI7Dhz4UEqpKhlMuUFPLzqeLn
 O9JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753817837; x=1754422637;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7t36RxdzKGiVmpStJKp3ep3ZJUIKeCeGyRBEDxUk+R0=;
 b=IpOH5tGb2s0q+6uw284dqrjMnFeZyPEXTyGDvBNUCfIViUDskC1uZAtS+XiYR3lRod
 zpEbH96DLg8LJYxiieMdHNHwpkNDVOXu2NBo3yKj8ZXKWUtjfS0MGrqwxcTb6MJfXyTY
 1UzYnvLLLFv8/ELqJ5rey61uAJPGyOqD0jigGqDT7z0iDgaJeKzg1qLLkfOg7mmh9q7r
 zgUoggmf/dvUGejGxzsGkO92JLYBW9glEYIDut2jzck2c9dS9Ke7HPKuia1RwztLiQN+
 8zNrsrznMcrkc92Dtiy2bRtTHDMwKKr3URqo2LcOeg57vhRCNvQ2zW5TnnBC/+PTiGKt
 Bh+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWm8GOE+/OSMhXiTGoXX2m+q1jLkD3fgL5Zi7rQCdD0pSzXGnUAOcqMXTegXez8ZDn8s6hlzMxOE64=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YweZ8WujXxtZ0lKXQ//ZSmBFunDm9mSlxK3Wd2y4/M68iQMYfYW
 tAxkO/CwNO3dwu043Ggng4ilbvuN0z7Klbgh0pjMIcfyQBxOT5fewUHyJBJRY+t/z2FIhh4vubu
 CGuAmZ3E4AytDkQ==
X-Google-Smtp-Source: AGHT+IG4U64kfYbeq2Gjgi7BkIe6ZzOTwFopE8vYX8XJ1HzdrnGiupy82m0rQuOpDRcjZn9ir5jLUg520yac1A==
X-Received: from qtbfh7.prod.google.com ([2002:a05:622a:5887:b0:4ab:d41d:ce0c])
 (user=marievic job=prod-delivery.src-stubby-dispatcher) by
 2002:ae9:e008:0:b0:7e1:9c2d:a862 with SMTP id
 af79cd13be357-7e66f3534ffmr75742185a.39.1753817836908; 
 Tue, 29 Jul 2025 12:37:16 -0700 (PDT)
Date: Tue, 29 Jul 2025 19:36:39 +0000
In-Reply-To: <20250729193647.3410634-1-marievic@google.com>
Mime-Version: 1.0
References: <20250729193647.3410634-1-marievic@google.com>
X-Mailer: git-send-email 2.50.1.552.g942d659e1b-goog
Message-ID: <20250729193647.3410634-2-marievic@google.com>
Subject: [PATCH 1/9] kunit: Add parent kunit for parameterized test context
From: Marie Zhussupova <marievic@google.com>
To: rmoar@google.com, davidgow@google.com, shuah@kernel.org, 
 brendan.higgins@linux.dev
Cc: elver@google.com, dvyukov@google.com, lucas.demarchi@intel.com, 
 thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 kasan-dev@googlegroups.com, intel-xe@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Marie Zhussupova <marievic@google.com>
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
to share resources across individual test invocations
because the same `struct kunit` instance is reused for
each test.

This patch refactors kunit_run_tests() to provide each
parameterized test with its own `struct kunit` instance.
A new parent pointer is added to `struct kunit`, allowing
individual parameterized tests to reference a shared
parent kunit instance. Resources added to this parent
will then be accessible to all individual parameter
test executions.

Signed-off-by: Marie Zhussupova <marievic@google.com>
---
 include/kunit/test.h | 12 ++++++++++--
 lib/kunit/test.c     | 32 +++++++++++++++++++-------------
 2 files changed, 29 insertions(+), 15 deletions(-)

diff --git a/include/kunit/test.h b/include/kunit/test.h
index 39c768f87dc9..a42d0c8cb985 100644
--- a/include/kunit/test.h
+++ b/include/kunit/test.h
@@ -268,14 +268,22 @@ struct kunit_suite_set {
  *
  * @priv: for user to store arbitrary data. Commonly used to pass data
  *	  created in the init function (see &struct kunit_suite).
+ * @parent: for user to store data that they want to shared across
+ *	    parameterized tests.
  *
  * Used to store information about the current context under which the test
  * is running. Most of this data is private and should only be accessed
- * indirectly via public functions; the one exception is @priv which can be
- * used by the test writer to store arbitrary data.
+ * indirectly via public functions; the two exceptions are @priv and @parent
+ * which can be used by the test writer to store arbitrary data or data that is
+ * available to all parameter test executions, respectively.
  */
 struct kunit {
 	void *priv;
+	/*
+	 * Reference to the parent struct kunit for storing shared resources
+	 * during parameterized testing.
+	 */
+	struct kunit *parent;
 
 	/* private: internal use only. */
 	const char *name; /* Read only after initialization! */
diff --git a/lib/kunit/test.c b/lib/kunit/test.c
index f3c6b11f12b8..4d6a39eb2c80 100644
--- a/lib/kunit/test.c
+++ b/lib/kunit/test.c
@@ -647,6 +647,7 @@ int kunit_run_tests(struct kunit_suite *suite)
 	struct kunit_case *test_case;
 	struct kunit_result_stats suite_stats = { 0 };
 	struct kunit_result_stats total_stats = { 0 };
+	const void *curr_param;
 
 	/* Taint the kernel so we know we've run tests. */
 	add_taint(TAINT_TEST, LOCKDEP_STILL_OK);
@@ -679,36 +680,39 @@ int kunit_run_tests(struct kunit_suite *suite)
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
 						 "param-%d", test.param_index);
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
 		}
 
@@ -723,6 +727,8 @@ int kunit_run_tests(struct kunit_suite *suite)
 
 		kunit_update_stats(&suite_stats, test_case->status);
 		kunit_accumulate_stats(&total_stats, param_stats);
+		/* TODO: Put this kunit_cleanup into a try-catch. */
+		kunit_cleanup(&test);
 	}
 
 	if (suite->suite_exit)
-- 
2.50.1.552.g942d659e1b-goog

