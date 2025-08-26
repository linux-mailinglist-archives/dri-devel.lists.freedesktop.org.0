Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DFA7B35857
	for <lists+dri-devel@lfdr.de>; Tue, 26 Aug 2025 11:13:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A50FE10E2E8;
	Tue, 26 Aug 2025 09:13:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="UVE+vW6P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com
 [209.85.214.202])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FFE510E61C
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Aug 2025 09:13:48 +0000 (UTC)
Received: by mail-pl1-f202.google.com with SMTP id
 d9443c01a7336-2464dc09769so85481915ad.0
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Aug 2025 02:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1756199628; x=1756804428;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=QTTACq/njMLngdxpMSOXC5XIjUnoWbM4E4SA6Lndzr0=;
 b=UVE+vW6PpQIbQL6ytybhqrzWYrPQgabJhniSkrhZ5rkuEaoCTxeFFbmkfLFTPUggoR
 5r54VQYZO2Ut6J3j7DhWjtn9//Nvw9wB4G/sVtmmmdJwBPy9HQ6OsKCJfhB93rC+9Ey5
 KefYAKJmiprF5Kc9z1pA+zZfwgxxK2a5i8RHebPfvTjUCcjlEA6wthJM6xTTJZDxnQ+u
 QscM6GNkHrtJkyK+HfoNIo2s2pM3G2IiYnw4MTsu7jJps701tpxpar+KiA0rtPLifKtz
 uEUoS3ofhLixGbovTpcrT1v2Xuv+5Zf2o6Ky2J++Yv86N8+ApgcWS+uKNjKC3beNkfgW
 NZcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756199628; x=1756804428;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QTTACq/njMLngdxpMSOXC5XIjUnoWbM4E4SA6Lndzr0=;
 b=pVvO5cPhO+PiMUw0fce7xKfIuo/hjqX9ppyh+U+6zjDT7K17/eTazpo255PbtuVHwd
 Upz9+ZCZJmiOroucbcEekjKEKdvCkLfQ4wi2VaZ9PMRYPpQXW0fpSjPYBBOhMQREYkmd
 QXW3PMRI4yZKjQhqo8CKi1lYjAyFs5IynFAnhmm8jpzcjXq7BCFUTfwMwDSEULxsk+LP
 1CmEK7GYK/OSFEflrQra3bCIxs/KOohaKslXkVx+i2r+pAmgxeHy+NSGMvZlOPEFpVEG
 DTVr/fY1LIbulIWlFmH3Oz2qwnFrgEndd6zvymtr1v9aNqPsNGarqvOkuX4POrlgPedB
 SXvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+GveuZ6iEG+37JO8zw1Vas3dmfw63+iDyd9a2gh5ogrUjqrzUrX/jfWps0Ts65CnggHXMf2p2b0s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzgTrwf3QcdhsAFvxUqfkYgv1hFHzvacNBKzfzRGnZMGSnDfO5D
 55oUzWIfZsBgjpmsoL6tlICjJlCaD1RoB2y3gfqDV3TjmT749VhU7cRTaKQg5heeVFczxGyzEa9
 VSO2k0Y1t+hiDSQ==
X-Google-Smtp-Source: AGHT+IE+/6MMrkJ74E5uKO4Fuz0dZBNo3Mw+DWRHhhpD3bwunApBgF7++zob2WkBdMyiTfsv7vnhKVDOwX2G5Q==
X-Received: from plpj12.prod.google.com ([2002:a17:903:3d8c:b0:246:1edd:3919])
 (user=davidgow job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:ccc4:b0:248:79d4:939e with SMTP id
 d9443c01a7336-24879d49812mr6538095ad.39.1756199627892; 
 Tue, 26 Aug 2025 02:13:47 -0700 (PDT)
Date: Tue, 26 Aug 2025 17:13:32 +0800
In-Reply-To: <20250826091341.1427123-1-davidgow@google.com>
Mime-Version: 1.0
References: <20250826091341.1427123-1-davidgow@google.com>
X-Mailer: git-send-email 2.51.0.261.g7ce5a0a67e-goog
Message-ID: <20250826091341.1427123-3-davidgow@google.com>
Subject: [PATCH v4 2/7] kunit: Introduce param_init/exit for parameterized
 test context management
From: David Gow <davidgow@google.com>
To: Marie Zhussupova <marievic@google.com>, marievictoria875@gmail.com,
 rmoar@google.com, shuah@kernel.org, brendan.higgins@linux.dev
Cc: mark.rutland@arm.com, elver@google.com, dvyukov@google.com, 
 lucas.demarchi@intel.com, thomas.hellstrom@linux.intel.com, 
 rodrigo.vivi@intel.com, linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com, kasan-dev@googlegroups.com, 
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>, 
 David Gow <davidgow@google.com>
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

From: Marie Zhussupova <marievic@google.com>

Add (*param_init) and (*param_exit) function pointers to
`struct kunit_case`. Users will be able to set them via the new
KUNIT_CASE_PARAM_WITH_INIT() macro.

param_init/exit will be invoked by kunit_run_tests() once before and once
after the parameterized test, respectively. They will receive the
`struct kunit` that holds the parameterized test context; facilitating
init and exit for shared state.

This patch also sets param_init/exit to None in rust/kernel/kunit.rs.

Reviewed-by: Rae Moar <rmoar@google.com>
Reviewed-by: David Gow <davidgow@google.com>
Signed-off-by: Marie Zhussupova <marievic@google.com>
Signed-off-by: David Gow <davidgow@google.com>
---

No changes in v4:
v3: https://lore.kernel.org/linux-kselftest/20250815103604.3857930-3-marievic@google.com/

Changes in v3:
v2: https://lore.kernel.org/all/20250811221739.2694336-3-marievic@google.com/
- kunit_init_parent_param_test() now sets both the `struct kunit_case`
  and the `struct kunit` statuses as failed if the parameterized test
  init failed. The failure message was also changed to include the failure
  code, mirroring the kunit_suite init failure message.
- A check for parameter init failure was added in kunit_run_tests(). So,
  if the init failed, the framework will skip the parameter runs and
  update the param_test statistics to count that failure.
- Commit message formatting.

Changes in v2:
v1: https://lore.kernel.org/all/20250729193647.3410634-3-marievic@google.com/
- param init/exit were set to None in rust/kernel/kunit.rs to fix the
  Rust breakage.
- The name of __kunit_init_parent_test was changed to
  kunit_init_parent_param_test and its call was changed to happen only
  if the test is parameterized.
- The param_exit call was also moved inside the check for if the test is
  parameterized.
- KUNIT_CASE_PARAM_WITH_INIT() macro logic was change to not automatically
  set generate_params() to KUnit's built-in generator function. Instead,
  the test user will be asked to provide it themselves.
- The comments and the commit message were changed to reflect the
  parameterized testing terminology. See the patch series cover letter
  change log for the definitions.


---
 include/kunit/test.h | 25 +++++++++++++++++++++++++
 lib/kunit/test.c     | 27 ++++++++++++++++++++++++++-
 rust/kernel/kunit.rs |  4 ++++
 3 files changed, 55 insertions(+), 1 deletion(-)

diff --git a/include/kunit/test.h b/include/kunit/test.h
index 9766403afd56..fc8fd55b2dfb 100644
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
index 587b5c51db58..0fe61dec5a96 100644
--- a/lib/kunit/test.c
+++ b/lib/kunit/test.c
@@ -641,6 +641,20 @@ static void kunit_accumulate_stats(struct kunit_result_stats *total,
 	total->total += add.total;
 }
 
+static void kunit_init_parent_param_test(struct kunit_case *test_case, struct kunit *test)
+{
+	if (test_case->param_init) {
+		int err = test_case->param_init(test);
+
+		if (err) {
+			kunit_err(test_case, KUNIT_SUBTEST_INDENT KUNIT_SUBTEST_INDENT
+				"# failed to initialize parent parameter test (%d)", err);
+			test->status = KUNIT_FAILURE;
+			test_case->status = KUNIT_FAILURE;
+		}
+	}
+}
+
 int kunit_run_tests(struct kunit_suite *suite)
 {
 	char param_desc[KUNIT_PARAM_DESC_SIZE];
@@ -678,6 +692,11 @@ int kunit_run_tests(struct kunit_suite *suite)
 			kunit_run_case_catch_errors(suite, test_case, &test);
 			kunit_update_stats(&param_stats, test.status);
 		} else {
+			kunit_init_parent_param_test(test_case, &test);
+			if (test_case->status == KUNIT_FAILURE) {
+				kunit_update_stats(&param_stats, test.status);
+				goto test_case_end;
+			}
 			/* Get initial param. */
 			param_desc[0] = '\0';
 			/* TODO: Make generate_params try-catch */
@@ -714,10 +733,16 @@ int kunit_run_tests(struct kunit_suite *suite)
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
-
+test_case_end:
 		kunit_print_attr((void *)test_case, true, KUNIT_LEVEL_CASE);
 
 		kunit_print_test_stats(&test, param_stats);
diff --git a/rust/kernel/kunit.rs b/rust/kernel/kunit.rs
index 41efd87595d6..b1c97f8029c7 100644
--- a/rust/kernel/kunit.rs
+++ b/rust/kernel/kunit.rs
@@ -210,6 +210,8 @@ pub const fn kunit_case(
         status: kernel::bindings::kunit_status_KUNIT_SUCCESS,
         module_name: core::ptr::null_mut(),
         log: core::ptr::null_mut(),
+        param_init: None,
+        param_exit: None,
     }
 }
 
@@ -229,6 +231,8 @@ pub const fn kunit_case_null() -> kernel::bindings::kunit_case {
         status: kernel::bindings::kunit_status_KUNIT_SUCCESS,
         module_name: core::ptr::null_mut(),
         log: core::ptr::null_mut(),
+        param_init: None,
+        param_exit: None,
     }
 }
 
-- 
2.51.0.261.g7ce5a0a67e-goog

