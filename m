Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A466B21816
	for <lists+dri-devel@lfdr.de>; Tue, 12 Aug 2025 00:17:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14C6210E56B;
	Mon, 11 Aug 2025 22:17:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="nMHT8W5P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f202.google.com (mail-qk1-f202.google.com
 [209.85.222.202])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 051F910E56A
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 22:17:51 +0000 (UTC)
Received: by mail-qk1-f202.google.com with SMTP id
 af79cd13be357-7e69b0ec62cso981007585a.3
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 15:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1754950670; x=1755555470;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=tOKMohtGJshnbgrwq7yuoLuH6EcijO5VHFU8Cl1yLsQ=;
 b=nMHT8W5PnmxsM23iqq7PoFtUO0xHzqpOUKEtdrx9k0qQ4JI/csi9MJn1Yqp/lTvSnc
 ern5f0fKgzBsza/0N5bW2+nhoRPXL/6f1bQFLMm4Qsi4mz2dmL1Q6dlUZOIiUDdK2Gc6
 WEcNbqZ/OsK6YIOxIqbrcBGTi4BHJ8J42Z4UBHYINN8fZOuaq+/1ryPGePRu1YMDDUOm
 G1YNo87S86gjVAohJEJMV1OBhzDZjLQiwzQb8mH1OmDPJCaqZ53o05Ul7+E6zxTYgk1G
 rJJs4nqWI52aC/3866PReuRXRFzo4xHYHE2aVotIStLQa1tFcLUoH6eLat1/umacE5np
 Ykdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754950670; x=1755555470;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tOKMohtGJshnbgrwq7yuoLuH6EcijO5VHFU8Cl1yLsQ=;
 b=OGCU4/NykYD/Ciny9jMgQ1uI1qY7kJovCMhpJyxA1TIShmzsd2F+kFH7wdJMzLRIgP
 BMrVDFX39EuuY99BoSUhRrrrP/Ac6KetgVbkZknNzU44kKrK+9Y6kxwG8pZ1NpY9QsQi
 iu+N2HMyVTDVfj5eJ5e+QrKhvcid+Wfm2U6u/NjIpVwtyz89eTwu+50noRRhbHemsLHz
 20dBGkhyxDXLVE6MfYGQ50pb/VGCT/Kq3mCXHs5O6SrAIBMNLt/UMtK6AfUDPaiv61w4
 jJHwmXZ6aB9GQQXVHPcrjAagPxhcMgXxjVay35JAys0hPEtPHj2qg8RGpc5ZLwnVPIhf
 MByA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWVyaZKoXVNGg/dyYsg1RHube/T6JHzxRebl0VycwWbe6Ma9/If3ssmQQv587t2Bwu+Abm5OuEWeQ0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxKkJVCQ9HNysetSo3wyHrnvXIG96a3ijTG6HWGOUCXUTECPLBE
 rJagSWXPNsqtNk4lTb1T2eaUqSe5qlKcCiNqPctM2bphSCSok3OHgOLlJIwjAwZp1XgBE2nMES0
 tJIh/lYe/ENu2Dw==
X-Google-Smtp-Source: AGHT+IFxrwl69sKXEkrueVCJAaVXqlAaXH6QFL249asiEL3cJVngjB06qwggD3EuOvpxoU8cfCz5OE0U4k7+ow==
X-Received: from qkfw14.prod.google.com ([2002:ae9:e50e:0:b0:7e8:1e34:1791])
 (user=marievic job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:620a:414f:b0:7e6:8751:96ae with SMTP id
 af79cd13be357-7e8588965a6mr233742085a.31.1754950669987; 
 Mon, 11 Aug 2025 15:17:49 -0700 (PDT)
Date: Mon, 11 Aug 2025 22:17:34 +0000
In-Reply-To: <20250811221739.2694336-1-marievic@google.com>
Mime-Version: 1.0
References: <20250811221739.2694336-1-marievic@google.com>
X-Mailer: git-send-email 2.51.0.rc0.205.g4a044479a3-goog
Message-ID: <20250811221739.2694336-3-marievic@google.com>
Subject: [PATCH v2 2/7] kunit: Introduce param_init/exit for parameterized
 test context management
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

Add (*param_init) and (*param_exit) function pointers to
`struct kunit_case`. Users will be able to set them
via the new KUNIT_CASE_PARAM_WITH_INIT() macro.

param_init/exit will be invoked by kunit_run_tests() once before
and once after the parameterized test, respectively.
They will receive the `struct kunit` that holds the parameterized
test context; facilitating init and exit for shared state.

This patch also sets param_init/exit to None in
rust/kernel/kunit.rs.

Signed-off-by: Marie Zhussupova <marievic@google.com>
---

Changes in v2:

- param init/exit were set to None
  in rust/kernel/kunit.rs to fix the Rust breakage.
- The name of __kunit_init_parent_test was
  changed to kunit_init_parent_param_test and
  its call was changed to happen only if the
  test is parameterized.
- The param_exit call was also moved inside
  the check for if the test is parameterized.
- KUNIT_CASE_PARAM_WITH_INIT() macro logic was changed
  to not automatically set generate_params() to KUnit's
  built-in generator function. Instead, the test user
  will be asked to provide it themselves.
- The comments and the commit message were changed to
  reflect the parameterized testing terminology. See
  the patch series cover letter change log for the
  definitions.

---
 include/kunit/test.h | 25 +++++++++++++++++++++++++
 lib/kunit/test.c     | 20 ++++++++++++++++++++
 rust/kernel/kunit.rs |  4 ++++
 3 files changed, 49 insertions(+)

diff --git a/include/kunit/test.h b/include/kunit/test.h
index b47b9a3102f3..d2e1b986b161 100644
--- a/include/kunit/test.h
+++ b/include/kunit/test.h
@@ -92,6 +92,8 @@ struct kunit_attributes {
  * @name:     the name of the test case.
  * @generate_params: the generator function for parameterized tests.
  * @attr:     the attributes associated with the test
+ * @param_init: The init function to run before a parameterized test.
+ * @param_exit: The exit function to run after a parameterized test.
  *
  * A test case is a function with the signature,
  * ``void (*)(struct kunit *)``
@@ -128,6 +130,8 @@ struct kunit_case {
 	const char *name;
 	const void* (*generate_params)(const void *prev, char *desc);
 	struct kunit_attributes attr;
+	int (*param_init)(struct kunit *test);
+	void (*param_exit)(struct kunit *test);
 
 	/* private: internal use only. */
 	enum kunit_status status;
@@ -218,6 +222,27 @@ static inline char *kunit_status_to_ok_not_ok(enum kunit_status status)
 		  .generate_params = gen_params,				\
 		  .attr = attributes, .module_name = KBUILD_MODNAME}
 
+/**
+ * KUNIT_CASE_PARAM_WITH_INIT - Define a parameterized KUnit test case with custom
+ * param_init() and param_exit() functions.
+ * @test_name: The function implementing the test case.
+ * @gen_params: The function to generate parameters for the test case.
+ * @init: A reference to the param_init() function to run before a parameterized test.
+ * @exit: A reference to the param_exit() function to run after a parameterized test.
+ *
+ * Provides the option to register param_init() and param_exit() functions.
+ * param_init/exit will be passed the parameterized test context and run once
+ * before and once after the parameterized test. The init function can be used
+ * to add resources to share between parameter runs, and any other setup logic.
+ * The exit function can be used to clean up resources that were not managed by
+ * the parameterized test, and any other teardown logic.
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
diff --git a/lib/kunit/test.c b/lib/kunit/test.c
index 14a8bd846939..49a5e6c30c86 100644
--- a/lib/kunit/test.c
+++ b/lib/kunit/test.c
@@ -641,6 +641,19 @@ static void kunit_accumulate_stats(struct kunit_result_stats *total,
 	total->total += add.total;
 }
 
+static void kunit_init_parent_param_test(struct kunit_case *test_case, struct kunit *test)
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
@@ -678,6 +691,7 @@ int kunit_run_tests(struct kunit_suite *suite)
 			kunit_run_case_catch_errors(suite, test_case, &test);
 			kunit_update_stats(&param_stats, test.status);
 		} else {
+			kunit_init_parent_param_test(test_case, &test);
 			/* Get initial param. */
 			param_desc[0] = '\0';
 			/* TODO: Make generate_params try-catch */
@@ -714,6 +728,12 @@ int kunit_run_tests(struct kunit_suite *suite)
 				param_desc[0] = '\0';
 				curr_param = test_case->generate_params(curr_param, param_desc);
 			}
+			/*
+			 * TODO: Put into a try catch. Since we don't need suite->exit
+			 * for it we can't reuse kunit_try_run_cleanup for this yet.
+			 */
+			if (test_case->param_exit)
+				test_case->param_exit(&test);
 			/* TODO: Put this kunit_cleanup into a try-catch. */
 			kunit_cleanup(&test);
 		}
diff --git a/rust/kernel/kunit.rs b/rust/kernel/kunit.rs
index 4b8cdcb21e77..cda64574b44d 100644
--- a/rust/kernel/kunit.rs
+++ b/rust/kernel/kunit.rs
@@ -207,6 +207,8 @@ pub const fn kunit_case(
         status: kernel::bindings::kunit_status_KUNIT_SUCCESS,
         module_name: core::ptr::null_mut(),
         log: core::ptr::null_mut(),
+        param_init: None,
+        param_exit: None,
     }
 }
 
@@ -226,6 +228,8 @@ pub const fn kunit_case_null() -> kernel::bindings::kunit_case {
         status: kernel::bindings::kunit_status_KUNIT_SUCCESS,
         module_name: core::ptr::null_mut(),
         log: core::ptr::null_mut(),
+        param_init: None,
+        param_exit: None,
     }
 }
 
-- 
2.51.0.rc0.205.g4a044479a3-goog

