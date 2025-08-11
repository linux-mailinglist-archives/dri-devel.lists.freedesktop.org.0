Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F7AB21821
	for <lists+dri-devel@lfdr.de>; Tue, 12 Aug 2025 00:18:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 623CF10E568;
	Mon, 11 Aug 2025 22:18:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="e5TZl6U+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f201.google.com (mail-qk1-f201.google.com
 [209.85.222.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7960F10E565
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 22:18:15 +0000 (UTC)
Received: by mail-qk1-f201.google.com with SMTP id
 af79cd13be357-7e69c14e992so932269485a.3
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 15:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1754950694; x=1755555494;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=fiy0G3ZehM6qHvT1KaF1SbtcEnbY2+UsDdYSolHQCqU=;
 b=e5TZl6U+hun17WlJxwAkjk6fFR6dGVhY9S4SnVAdftEQtSogN1Th1R4ls7dfMHuyCj
 NVx07WIGLI42yaX6U1WzAeQJHD+4aFzAVYGJdV08jeZXS0uXZt4Ty1TRrU6Q4tRygvIF
 7YaKA8HKrBz3iDqiz/PBgt5XN5TUV1Sp0Jt6+p9xz3yKm0PNZoc8gUny+GOgDGrtDx8m
 qT/2LYr2TbtStarmgcwDmyoh1UzpuUahPFVUMLXPZL2lTkLCKOkKFYB8u4Vbjbs9SAIQ
 W1XjG6TttePodOQmOtkiIiTjR2h06dNJIoUmkTvrUN+ygNi6/qer0jTPZkN4WWDaDm7c
 B56A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754950694; x=1755555494;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fiy0G3ZehM6qHvT1KaF1SbtcEnbY2+UsDdYSolHQCqU=;
 b=Vhzjq8R3dA564pc01vxxMhv6W+N1eywq2864iDDXXhmGPy5FXntYeaYWctdrpT+vPe
 u2xUPhp/1k0ghUex0VPJGqZCYFifA1N1iL0if+o6pUGd+9SwD9VwyvS149A7z2fSYKeN
 H7cL30ByeGGYRLW+Fr12mA+7/nYCsE/Ry19MRKgdFztwTKxrab6teegzBROY+HHVcewl
 PawStq6a7xegP7RVEiT307RlQ40cd0ZyM0NLkT0PJo/6yBqN1gRpgwxVV4c2Kk/IZE1z
 /WPJ1V7fUDgphEGsgzpdSxtHVdJdP3Od9fN8NcWyrWcX744w9XEx0e5rin4/ynrAR8SJ
 Fvcg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4ggNGV0puVFA/eQ6RLFoA4JNpBF6BvM/TqOHSJyAmeMFzKsgHBLfxB9gKmLHRfe9wSvp+Nyb0maA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywue84DzOlSOwHLbn9GYv1UGVDDV5jxscQ/8w3sRkqwx9K2YQsa
 lOvdLxVXRmoYVWBlbFoGp5UkxTzCpWQDCkiR8peFrV5pT71RxA4dzIaNagrJfAQ/3/ISJk03CU/
 Y5c8153QHCH9sYw==
X-Google-Smtp-Source: AGHT+IHiNfk6fX5vRQ6hJy5J/5HwxIhWCyztR6zBKRqfQIjnxBt+D4xN40wqn6DYxZVe/XPYIWNPVGfdUOAjOQ==
X-Received: from qknwc5.prod.google.com ([2002:a05:620a:7205:b0:7e8:51a1:6a28])
 (user=marievic job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:620a:4843:b0:7e8:1718:daf4 with SMTP id
 af79cd13be357-7e82c65c638mr1611302285a.16.1754950694498; 
 Mon, 11 Aug 2025 15:18:14 -0700 (PDT)
Date: Mon, 11 Aug 2025 22:17:38 +0000
In-Reply-To: <20250811221739.2694336-1-marievic@google.com>
Mime-Version: 1.0
References: <20250811221739.2694336-1-marievic@google.com>
X-Mailer: git-send-email 2.51.0.rc0.205.g4a044479a3-goog
Message-ID: <20250811221739.2694336-7-marievic@google.com>
Subject: [PATCH v2 6/7] kunit: Add example parameterized test with direct
 dynamic parameter array setup
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

Introduce example_params_test_with_init_dynamic_arr(). This new
KUnit test demonstrates directly assigning a dynamic parameter
array, using the kunit_register_params_array() macro, to a
parameterized test context.

It highlights the use of param_init() and param_exit() for
initialization and exit of a parameterized test, and their
registration to the test case with KUNIT_CASE_PARAM_WITH_INIT().

Signed-off-by: Marie Zhussupova <marievic@google.com>
---

Changes in v2:

- kunit_array_gen_params() is now explicitly passed to
  KUNIT_CASE_PARAM_WITH_INIT() to be consistent with
  the parameterized test being defined by the existence
  of the generate_params() function.
- param_init() was changed to output a log at the start
  of a parameterized test.
- The parameter array was changed to be allocated
  using kunit_kmalloc_array(), a KUnit memory allocation
  API, as that would be the preferred/easier method. To
  still demonstrate a use of param_exit(), it now outputs
  a log at the end of the parameterized test.
- The comments and the commit message were changed to
  reflect the parameterized testing terminology. See
  the patch series cover letter change log for the
  definitions.

---
 lib/kunit/kunit-example-test.c | 104 +++++++++++++++++++++++++++++++++
 1 file changed, 104 insertions(+)

diff --git a/lib/kunit/kunit-example-test.c b/lib/kunit/kunit-example-test.c
index f2819ee58965..ff21511889a4 100644
--- a/lib/kunit/kunit-example-test.c
+++ b/lib/kunit/kunit-example-test.c
@@ -393,6 +393,107 @@ static void example_params_test_with_init(struct kunit *test)
 	kunit_put_resource(res);
 }
 
+/*
+ * Helper function to create a parameter array of Fibonacci numbers. This example
+ * highlights a parameter generation scenario that is:
+ * 1. Not feasible to fully pre-generate at compile time.
+ * 2. Challenging to implement with a standard generate_params() function,
+ * as it only provides the previous parameter, while Fibonacci requires
+ * access to two preceding values for calculation.
+ */
+static void *make_fibonacci_params(struct kunit *test, size_t seq_size)
+{
+	int *seq;
+
+	if (seq_size <= 0)
+		return NULL;
+	/*
+	 * Using kunit_kmalloc_array here ties the lifetime of the array to
+	 * the parameterized test i.e. it will get automatically cleaned up
+	 * by KUnit after the parameterized test finishes.
+	 */
+	seq = kunit_kmalloc_array(test, seq_size, sizeof(int), GFP_KERNEL);
+
+	if (!seq)
+		return NULL;
+	if (seq_size >= 1)
+		seq[0] = 0;
+	if (seq_size >= 2)
+		seq[1] = 1;
+	for (int i = 2; i < seq_size; i++)
+		seq[i] = seq[i - 1] + seq[i - 2];
+	return seq;
+}
+
+/*
+ * This is an example of a function that provides a description for each of the
+ * parameters.
+ */
+static void example_param_dynamic_arr_get_desc(struct kunit *test, const void *p, char *desc)
+{
+	const int *fib_num = p;
+
+	snprintf(desc, KUNIT_PARAM_DESC_SIZE, "fibonacci param: %d", *fib_num);
+}
+
+/*
+ * Example of a parameterized test param_init() function that registers a dynamic
+ * array of parameters.
+ */
+static int example_param_init_dynamic_arr(struct kunit *test)
+{
+	size_t seq_size;
+	int *fibonacci_params;
+
+	kunit_info(test, "initializing parameterized test\n");
+
+	seq_size = 6;
+	fibonacci_params = make_fibonacci_params(test, seq_size);
+
+	if (!fibonacci_params)
+		return -ENOMEM;
+
+	/*
+	 * Passes the dynamic parameter array information to the parameterized test
+	 * context struct kunit. The array and its metadata will be stored in
+	 * test->parent->params_array. The array itself will be located in
+	 * params_data.params.
+	 *
+	 * Note that you will need to pass kunit_array_gen_params() as the
+	 * generator function to KUNIT_CASE_PARAM_WITH_INIT() when registering
+	 * a parameter array this route.
+	 */
+	kunit_register_params_array(test, fibonacci_params, seq_size,
+				    example_param_dynamic_arr_get_desc);
+	return 0;
+}
+
+/*
+ * Example of a parameterized test param_exit() function that outputs a log
+ * at the end of the parameterized test. It could also be used for any other
+ * teardown logic.
+ */
+static void example_param_exit_dynamic_arr(struct kunit *test)
+{
+	kunit_info(test, "exiting parameterized test\n");
+}
+
+/*
+ * Example of test that uses the registered dynamic array to perform assertions
+ * and expectations.
+ */
+static void example_params_test_with_init_dynamic_arr(struct kunit *test)
+{
+	const int *param = test->param_value;
+	int param_val;
+
+	/* By design, param pointer will not be NULL. */
+	KUNIT_ASSERT_NOT_NULL(test, param);
+
+	param_val = *param;
+	KUNIT_EXPECT_EQ(test, param_val - param_val, 0);
+}
+
 /*
  * Here we make a list of all the test cases we want to add to the test suite
  * below.
@@ -414,6 +515,9 @@ static struct kunit_case example_test_cases[] = {
 	KUNIT_CASE_PARAM(example_params_test, example_gen_params),
 	KUNIT_CASE_PARAM_WITH_INIT(example_params_test_with_init, kunit_array_gen_params,
 				   example_param_init, NULL),
+	KUNIT_CASE_PARAM_WITH_INIT(example_params_test_with_init_dynamic_arr,
+				   kunit_array_gen_params, example_param_init_dynamic_arr,
+				   example_param_exit_dynamic_arr),
 	KUNIT_CASE_SLOW(example_slow_test),
 	{}
 };
-- 
2.51.0.rc0.205.g4a044479a3-goog

