Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E24B1538C
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jul 2025 21:37:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2469910E08E;
	Tue, 29 Jul 2025 19:37:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="WHZS281J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f202.google.com (mail-qt1-f202.google.com
 [209.85.160.202])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C43A710E08E
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 19:37:20 +0000 (UTC)
Received: by mail-qt1-f202.google.com with SMTP id
 d75a77b69052e-4ab81d016c1so93371941cf.3
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 12:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1753817840; x=1754422640;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=tISY+xBUYYz9JGsqhSxSDiuo5pXcWFPbk33bCR9svy4=;
 b=WHZS281JCbto8JJFmVM2IG1TbIo9oF90YckLKVqpBbWhH7soG47+T6qePz3Fe5g88z
 SMukr+nNQY8Kxu9lXR4pmK5W722mhRZV63ThsCyS0pafkZ22e8HZNFC86FUr7OcYXCOR
 UJGJUc3sCspA+TLO1XIQn+Uing9VKIUHEMgOEg3/T7lEPf2fUS1dghrTovMgZHm5+lEG
 YIhSNsMu2GyyMkVgNXlmzuT9V9zxYecp4UYxLNTa78v5FtqD1I1Z8267cLfv7asO/aQV
 0P3i1/dAkBbrOMDcyxDxRXqfw9hW5wkkbSEXlNwRMixHRAh/elodURb6uCEh4K46Mjiu
 OdFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753817840; x=1754422640;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tISY+xBUYYz9JGsqhSxSDiuo5pXcWFPbk33bCR9svy4=;
 b=CvKWHLzumxyTfKn6ZBV1OQsIGtfArqPT62WBUOY5Yu73UivPWnO6APjUHUx62tZDu2
 gjyuOm2UsMExIWIScLWJO1pxf6P9FF17Id3drEwv1T5GyWa6vT2Cmv2bUTnEx2b3RtZ/
 H+eREcnPiW7Qa4laGsmlID1zjBftB8045MFVAIBx35kp2Aa5O891FzYyzjhGbrikTH3X
 hhYdPAjDaqMC4u3W/rVJLgr2S+PkonjlO8gNAHdFdIgkVhWo9SnuhHt95p4WqOm5YK66
 kOz/+X+pzHpuo5rsnQ0FOheYAxP7542bOwxSgkcTH8PUFOZZX6/Q6/iK5wjOHudR4ryn
 yDTg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5p7svYB60CLumybC2+rWsNpOq4YTDd+X8qjFcPje3kOd8SshSHKHnaBrHLOaEitOOV3lPLCJSPrU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzUTz+1+TZkUgmktEDnGOGoxmz95qxbCnnBQ/U2jJcNB0wVFPyF
 hcxDdCx+skfIwSzqks+KiWupFcGyNPlYWMAJ7J1Yd/YwiRzN3iVVSiXFbe03waLLQO5myBEjVlC
 STBm4PsIIHnur9g==
X-Google-Smtp-Source: AGHT+IHO3w/OWxc0bh2stWMFfWMHfCNuwQ8ImCAJ/qrdu5G1dagcPV42fbu2D6wVRt/h4M0z28H1fFDxXyPbjg==
X-Received: from qtbcf19.prod.google.com
 ([2002:a05:622a:4013:b0:4ab:9556:af14])
 (user=marievic job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:622a:ca:b0:4a8:19d5:f8a5 with SMTP id
 d75a77b69052e-4aedbc45df3mr13576391cf.35.1753817839732; 
 Tue, 29 Jul 2025 12:37:19 -0700 (PDT)
Date: Tue, 29 Jul 2025 19:36:40 +0000
In-Reply-To: <20250729193647.3410634-1-marievic@google.com>
Mime-Version: 1.0
References: <20250729193647.3410634-1-marievic@google.com>
X-Mailer: git-send-email 2.50.1.552.g942d659e1b-goog
Message-ID: <20250729193647.3410634-3-marievic@google.com>
Subject: [PATCH 2/9] kunit: Introduce param_init/exit for parameterized test
 shared context management
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

Add `param_init` and `param_exit` function pointers to
`struct kunit_case`. Users will be able to set them
via the new `KUNIT_CASE_PARAM_WITH_INIT` macro.

These functions are invoked by kunit_run_tests() once before
and once after the entire parameterized test series, respectively.
They will receive the parent kunit test instance, allowing users
to register and manage shared resources. Resources added to this
parent kunit test will be accessible to all individual parameterized
tests, facilitating init and exit for shared state.

Signed-off-by: Marie Zhussupova <marievic@google.com>
---
 include/kunit/test.h | 33 ++++++++++++++++++++++++++++++++-
 lib/kunit/test.c     | 23 ++++++++++++++++++++++-
 2 files changed, 54 insertions(+), 2 deletions(-)

diff --git a/include/kunit/test.h b/include/kunit/test.h
index a42d0c8cb985..d8dac7efd745 100644
--- a/include/kunit/test.h
+++ b/include/kunit/test.h
@@ -92,6 +92,8 @@ struct kunit_attributes {
  * @name:     the name of the test case.
  * @generate_params: the generator function for parameterized tests.
  * @attr:     the attributes associated with the test
+ * @param_init: The init function to run before parameterized tests.
+ * @param_exit: The exit function to run after parameterized tests.
  *
  * A test case is a function with the signature,
  * ``void (*)(struct kunit *)``
@@ -129,6 +131,13 @@ struct kunit_case {
 	const void* (*generate_params)(const void *prev, char *desc);
 	struct kunit_attributes attr;
 
+	/*
+	 * Optional user-defined functions: one to register shared resources once
+	 * before the parameterized test series, and another to release them after.
+	 */
+	int (*param_init)(struct kunit *test);
+	void (*param_exit)(struct kunit *test);
+
 	/* private: internal use only. */
 	enum kunit_status status;
 	char *module_name;
@@ -218,6 +227,27 @@ static inline char *kunit_status_to_ok_not_ok(enum kunit_status status)
 		  .generate_params = gen_params,				\
 		  .attr = attributes, .module_name = KBUILD_MODNAME}
 
+/**
+ * KUNIT_CASE_PARAM_WITH_INIT() - Define a parameterized KUnit test case with custom
+ * init and exit functions.
+ * @test_name: The function implementing the test case.
+ * @gen_params: The function to generate parameters for the test case.
+ * @init: The init function to run before parameterized tests.
+ * @exit: The exit function to run after parameterized tests.
+ *
+ * Provides the option to register init and exit functions that take in the
+ * parent of the parameterized tests and run once before and once after the
+ * parameterized test series. The init function can be used to add any resources
+ * to share between the parameterized tests or to pass parameter arrays. The
+ * exit function can be used to clean up any resources that are not managed by
+ * the test.
+ */
+#define KUNIT_CASE_PARAM_WITH_INIT(test_name, gen_params, init, exit)		\
+		{ .run_case = test_name, .name = #test_name,			\
+		  .generate_params = gen_params,				\
+		  .param_init = init, .param_exit = exit,			\
+		  .module_name = KBUILD_MODNAME}
+
 /**
  * struct kunit_suite - describes a related collection of &struct kunit_case
  *
@@ -269,7 +299,8 @@ struct kunit_suite_set {
  * @priv: for user to store arbitrary data. Commonly used to pass data
  *	  created in the init function (see &struct kunit_suite).
  * @parent: for user to store data that they want to shared across
- *	    parameterized tests.
+ *	    parameterized tests. Typically, the data is provided in
+ *	    the param_init function (see &struct kunit_case).
  *
  * Used to store information about the current context under which the test
  * is running. Most of this data is private and should only be accessed
diff --git a/lib/kunit/test.c b/lib/kunit/test.c
index 4d6a39eb2c80..d80b5990d85d 100644
--- a/lib/kunit/test.c
+++ b/lib/kunit/test.c
@@ -641,6 +641,19 @@ static void kunit_accumulate_stats(struct kunit_result_stats *total,
 	total->total += add.total;
 }
 
+static void __kunit_init_parent_test(struct kunit_case *test_case, struct kunit *test)
+{
+	if (test_case->param_init) {
+		int err = test_case->param_init(test);
+
+		if (err) {
+			kunit_err(test_case, KUNIT_SUBTEST_INDENT KUNIT_SUBTEST_INDENT
+				"# failed to initialize parent parameter test.");
+			test_case->status = KUNIT_FAILURE;
+		}
+	}
+}
+
 int kunit_run_tests(struct kunit_suite *suite)
 {
 	char param_desc[KUNIT_PARAM_DESC_SIZE];
@@ -668,6 +681,8 @@ int kunit_run_tests(struct kunit_suite *suite)
 		struct kunit_result_stats param_stats = { 0 };
 
 		kunit_init_test(&test, test_case->name, test_case->log);
+		__kunit_init_parent_test(test_case, &test);
+
 		if (test_case->status == KUNIT_SKIPPED) {
 			/* Test marked as skip */
 			test.status = KUNIT_SKIPPED;
@@ -677,7 +692,7 @@ int kunit_run_tests(struct kunit_suite *suite)
 			test_case->status = KUNIT_SKIPPED;
 			kunit_run_case_catch_errors(suite, test_case, &test);
 			kunit_update_stats(&param_stats, test.status);
-		} else {
+		} else if (test_case->status != KUNIT_FAILURE) {
 			/* Get initial param. */
 			param_desc[0] = '\0';
 			/* TODO: Make generate_params try-catch */
@@ -727,6 +742,12 @@ int kunit_run_tests(struct kunit_suite *suite)
 
 		kunit_update_stats(&suite_stats, test_case->status);
 		kunit_accumulate_stats(&total_stats, param_stats);
+		/*
+		 * TODO: Put into a try catch. Since we don't need suite->exit
+		 * for it we can't reuse kunit_try_run_cleanup for this yet.
+		 */
+		if (test_case->param_exit)
+			test_case->param_exit(&test);
 		/* TODO: Put this kunit_cleanup into a try-catch. */
 		kunit_cleanup(&test);
 	}
-- 
2.50.1.552.g942d659e1b-goog

