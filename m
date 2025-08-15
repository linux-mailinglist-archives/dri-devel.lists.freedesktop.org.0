Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18492B27E64
	for <lists+dri-devel@lfdr.de>; Fri, 15 Aug 2025 12:36:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E77F10E93D;
	Fri, 15 Aug 2025 10:36:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="xbBuNGDs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f202.google.com (mail-qt1-f202.google.com
 [209.85.160.202])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27FB810E93D
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Aug 2025 10:36:27 +0000 (UTC)
Received: by mail-qt1-f202.google.com with SMTP id
 d75a77b69052e-4b109be41a1so75377311cf.2
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Aug 2025 03:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1755254186; x=1755858986;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=z5VWtmN7wXdBM8xUp2T3Z+kcllw5mJ+rBSS+cDWhsio=;
 b=xbBuNGDsriMesdm2KVPU6fSRyHbUOSx40OG8oQ+HVgbEqqmc0RbJQuF2IYxGu+vnU6
 /+HZa9deHGyZVu//PEUU6sn01kE5lEca78eQYjcJr3lIFEhg0wN406glBC3sNjYs713C
 +7dfMe7cPx6eVQlZqm8FnC3R4P/O9sC4YvNOhecLV1Lh1YcbS1IS68dBGCiK+p1gtXmK
 RZyHs+kgDBNj+xXMAkC9u6PwIALJ3+KIfOWPlOpL37Q6bORbBl+shPQQMR/ifj+i+KJE
 avrhPa89vki9WMKMlK4r5Y7OXnu+jiE7MxILKHzLbXqLH23V4RXpQxQ1k6T4uGuew2Bv
 M+Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755254186; x=1755858986;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=z5VWtmN7wXdBM8xUp2T3Z+kcllw5mJ+rBSS+cDWhsio=;
 b=RJxggT2aMVpeWO7dOT/DO5uCjVXYwJNRMiD3Kz7v8Zmopx1blPvvIflBj6o2Yz1ipe
 5vOs6zuiqSLs5gFOf4gSMAeqDkKiFb6CuKtqld2R850N91dNUqHSH/KCHTeZu9LR2zRs
 F4adEOj3zmH7pjZQfqdt5i9UlVA1D7sGS1pbZLppG2gSRhLQWN0xmupWJ9PojktKrFJ7
 aVfPmkvfXHVvNRhm6u5a+U5L76umuZlEhnbniiO8IvAft67R8V/FV0t5sep/YotM0Kzk
 yNH5gpFRXdmuNcv1wszueCAQ4fedN92xH29jirZ+nikEPtqDHAi3lkIGFn0UgmYGAJB2
 TInA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXfL9VbpDoXqBI4wgz4N+etTGUFGHUoVAF5iTP70nF0OJhjJ3u7IBNTQ+fCKlyNfKhQnb+xvbYi8To=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxg6L0RqiFTciTqToRm9YKuJDglW7stpLnHRYfaWxyXyOPQh6hG
 nG7Uq/0p7WgtipECghSCvdwMnl5Sm/IY6meDXDnOTF/wItwgLGuIYd1gyUgTjlaigz2i+r9HDhN
 ZAdyQIeayu1PhBg==
X-Google-Smtp-Source: AGHT+IHgIvS5m7zsnvhrNu/79S0fJFF/LuP+mjcMqGvy+8kFhDJtAPX7/Z1TX1Wulq+yqxrCu+LJEZ/7E0YjeQ==
X-Received: from qtny22.prod.google.com ([2002:ac8:5256:0:b0:4b0:77f6:dd7f])
 (user=marievic job=prod-delivery.src-stubby-dispatcher) by
 2002:ac8:7dcc:0:b0:4af:1837:778e with SMTP id
 d75a77b69052e-4b11e2a24demr15608461cf.31.1755254186232; 
 Fri, 15 Aug 2025 03:36:26 -0700 (PDT)
Date: Fri, 15 Aug 2025 10:36:04 +0000
In-Reply-To: <20250815103604.3857930-1-marievic@google.com>
Mime-Version: 1.0
References: <20250815103604.3857930-1-marievic@google.com>
X-Mailer: git-send-email 2.51.0.rc1.167.g924127e9c0-goog
Message-ID: <20250815103604.3857930-8-marievic@google.com>
Subject: [PATCH v3 7/7] Documentation: kunit: Document new parameterized test
 features
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

This patch updates the KUnit docs to show how to use the new
parameterized test context to share resources between parameter runs.
It documents and show examples of different ways the test user can
pass parameter arrays to a parameterized test. Finally, it specifies the
parameterized testing terminology.

Reviewed-by: Rae Moar <rmoar@google.com>
Reviewed-by: David Gow <davidgow@google.com>
Signed-off-by: Marie Zhussupova <marievic@google.com>
---

Changes in v3:
v2: https://lore.kernel.org/all/20250811221739.2694336-8-marievic@google.com/
- Parameterized test terminology was made more concise.
- Introduction now includes more background information on the
  generate_params() function.
- Minor wording edits for conciseness.
- Code line number references were removed as they could quickly go
  out of date.

Changes in v2:
v1: https://lore.kernel.org/all/20250729193647.3410634-10-marievic@google.com/
- The documentation was updated to establish the parameterized
  testing terminology and reflect all the patch series changes.
- The references to other parts of the KUnit Documentation were
  not changed from being "Documentation/dev-tools/kunit/api/test.rst"
  to ":ref:`kunit-resource`" links as originally planned. This is
  because the existing way shows up as a link to a webpage and it
  would be hard for people reading the documentation as an .rst
  file to find the referred section without having the file path.
- The code examples were made more concise.
- Minor edits to titles and formatting.

---
 Documentation/dev-tools/kunit/usage.rst | 342 +++++++++++++++++++++++-
 1 file changed, 337 insertions(+), 5 deletions(-)

diff --git a/Documentation/dev-tools/kunit/usage.rst b/Documentation/dev-tools/kunit/usage.rst
index 066ecda1dd98..ebd06f5ea455 100644
--- a/Documentation/dev-tools/kunit/usage.rst
+++ b/Documentation/dev-tools/kunit/usage.rst
@@ -542,11 +542,31 @@ There is more boilerplate code involved, but it can:
 Parameterized Testing
 ~~~~~~~~~~~~~~~~~~~~~
 
-The table-driven testing pattern is common enough that KUnit has special
-support for it.
+To run a test case against multiple inputs, KUnit provides a parameterized
+testing framework. This feature formalizes and extends the concept of
+table-driven tests discussed previously.
 
-By reusing the same ``cases`` array from above, we can write the test as a
-"parameterized test" with the following.
+A KUnit test is determined to be parameterized if a parameter generator function
+is provided when registering the test case. A test user can either write their
+own generator function or use one that is provided by KUnit. The generator
+function is stored in  ``kunit_case->generate_params`` and can be set using the
+macros described in the section below.
+
+To establish the terminology, a "parameterized test" is a test which is run
+multiple times (once per "parameter" or "parameter run"). Each parameter run has
+both its own independent ``struct kunit`` (the "parameter run context") and
+access to a shared parent ``struct kunit`` (the "parameterized test context").
+
+Passing Parameters to a Test
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+There are three ways to provide the parameters to a test:
+
+Array Parameter Macros:
+
+   KUnit provides special support for the common table-driven testing pattern.
+   By applying either ``KUNIT_ARRAY_PARAM`` or ``KUNIT_ARRAY_PARAM_DESC`` to the
+   ``cases`` array from the previous section, we can create a parameterized test
+   as shown below:
 
 .. code-block:: c
 
@@ -555,7 +575,7 @@ By reusing the same ``cases`` array from above, we can write the test as a
 		const char *str;
 		const char *sha1;
 	};
-	const struct sha1_test_case cases[] = {
+	static const struct sha1_test_case cases[] = {
 		{
 			.str = "hello world",
 			.sha1 = "2aae6c35c94fcfb415dbe95f408b9ce91ee846ed",
@@ -590,6 +610,318 @@ By reusing the same ``cases`` array from above, we can write the test as a
 		{}
 	};
 
+Custom Parameter Generator Function:
+
+   The generator function is responsible for generating parameters one-by-one
+   and has the following signature:
+   ``const void* (*)(struct kunit *test, const void *prev, char *desc)``.
+   You can pass the generator function to the ``KUNIT_CASE_PARAM``
+   or ``KUNIT_CASE_PARAM_WITH_INIT`` macros.
+
+   The function receives the previously generated parameter as the ``prev`` argument
+   (which is ``NULL`` on the first call) and can also access the parameterized
+   test context passed as the ``test`` argument. KUnit calls this function
+   repeatedly until it returns ``NULL``, which signifies that a parameterized
+   test ended.
+
+   Below is an example of how it works:
+
+.. code-block:: c
+
+	#define MAX_TEST_BUFFER_SIZE 8
+
+	// Example generator function. It produces a sequence of buffer sizes that
+	// are powers of two, starting at 1 (e.g., 1, 2, 4, 8).
+	static const void *buffer_size_gen_params(struct kunit *test, const void *prev, char *desc)
+	{
+		long prev_buffer_size = (long)prev;
+		long next_buffer_size = 1; // Start with an initial size of 1.
+
+		// Stop generating parameters if the limit is reached or exceeded.
+		if (prev_buffer_size >= MAX_TEST_BUFFER_SIZE)
+			return NULL;
+
+		// For subsequent calls, calculate the next size by doubling the previous one.
+		if (prev)
+			next_buffer_size = prev_buffer_size << 1;
+
+		return (void *)next_buffer_size;
+	}
+
+	// Simple test to validate that kunit_kzalloc provides zeroed memory.
+	static void buffer_zero_test(struct kunit *test)
+	{
+		long buffer_size = (long)test->param_value;
+		// Use kunit_kzalloc to allocate a zero-initialized buffer. This makes the
+		// memory "parameter run managed," meaning it's automatically cleaned up at
+		// the end of each parameter run.
+		int *buf = kunit_kzalloc(test, buffer_size * sizeof(int), GFP_KERNEL);
+
+		// Ensure the allocation was successful.
+		KUNIT_ASSERT_NOT_NULL(test, buf);
+
+		// Loop through the buffer and confirm every element is zero.
+		for (int i = 0; i < buffer_size; i++)
+			KUNIT_EXPECT_EQ(test, buf[i], 0);
+	}
+
+	static struct kunit_case buffer_test_cases[] = {
+		KUNIT_CASE_PARAM(buffer_zero_test, buffer_size_gen_params),
+		{}
+	};
+
+Runtime Parameter Array Registration in the Init Function:
+
+   For scenarios where you might need to initialize a parameterized test, you
+   can directly register a parameter array to the parameterized test context.
+
+   To do this, you must pass the parameterized test context, the array itself,
+   the array size, and a ``get_description()`` function to the
+   ``kunit_register_params_array()`` macro. This macro populates
+   ``struct kunit_params`` within the parameterized test context, effectively
+   storing a parameter array object. The ``get_description()`` function will
+   be used for populating parameter descriptions and has the following signature:
+   ``void (*)(struct kunit *test, const void *param, char *desc)``. Note that it
+   also has access to the parameterized test context.
+
+      .. important::
+         When using this way to register a parameter array, you will need to
+         manually pass ``kunit_array_gen_params()`` as the generator function to
+         ``KUNIT_CASE_PARAM_WITH_INIT``. ``kunit_array_gen_params()`` is a KUnit
+         helper that will use the registered array to generate the parameters.
+
+	 If needed, instead of passing the KUnit helper, you can also pass your
+	 own custom generator function that utilizes the parameter array. To
+	 access the parameter array from within the parameter generator
+	 function use ``test->params_array.params``.
+
+   The ``kunit_register_params_array()`` macro should be called within a
+   ``param_init()`` function that initializes the parameterized test and has
+   the following signature ``int (*)(struct kunit *test)``. For a detailed
+   explanation of this mechanism please refer to the "Adding Shared Resources"
+   section that is after this one. This method supports registering both
+   dynamically built and static parameter arrays.
+
+   The code snippet below shows the ``example_param_init_dynamic_arr`` test that
+   utilizes ``make_fibonacci_params()`` to create a dynamic array, which is then
+   registered using ``kunit_register_params_array()``. To see the full code
+   please refer to lib/kunit/kunit-example-test.c.
+
+.. code-block:: c
+
+	/*
+	* Example of a parameterized test param_init() function that registers a dynamic
+	* array of parameters.
+	*/
+	static int example_param_init_dynamic_arr(struct kunit *test)
+	{
+		size_t seq_size;
+		int *fibonacci_params;
+
+		kunit_info(test, "initializing parameterized test\n");
+
+		seq_size = 6;
+		fibonacci_params = make_fibonacci_params(test, seq_size);
+		if (!fibonacci_params)
+			return -ENOMEM;
+		/*
+		* Passes the dynamic parameter array information to the parameterized test
+		* context struct kunit. The array and its metadata will be stored in
+		* test->parent->params_array. The array itself will be located in
+		* params_data.params.
+		*/
+		kunit_register_params_array(test, fibonacci_params, seq_size,
+					example_param_dynamic_arr_get_desc);
+		return 0;
+	}
+
+	static struct kunit_case example_test_cases[] = {
+		/*
+		 * Note how we pass kunit_array_gen_params() to use the array we
+		 * registered in example_param_init_dynamic_arr() to generate
+		 * parameters.
+		 */
+		KUNIT_CASE_PARAM_WITH_INIT(example_params_test_with_init_dynamic_arr,
+					   kunit_array_gen_params,
+					   example_param_init_dynamic_arr,
+					   example_param_exit_dynamic_arr),
+		{}
+	};
+
+Adding Shared Resources
+^^^^^^^^^^^^^^^^^^^^^^^
+All parameter runs in this framework hold a reference to the parameterized test
+context, which can be accessed using the parent ``struct kunit`` pointer. The
+parameterized test context is not used to execute any test logic itself; instead,
+it serves as a container for shared resources.
+
+It's possible to add resources to share between parameter runs within a
+parameterized test by using ``KUNIT_CASE_PARAM_WITH_INIT``, to which you pass
+custom ``param_init()`` and ``param_exit()`` functions. These functions run once
+before and once after the parameterized test, respectively.
+
+The ``param_init()`` function, with the signature ``int (*)(struct kunit *test)``,
+can be used for adding resources to the ``resources`` or ``priv`` fields of
+the parameterized test context, registering the parameter array, and any other
+initialization logic.
+
+The ``param_exit()`` function, with the signature ``void (*)(struct kunit *test)``,
+can be used to release any resources that were not parameterized test managed (i.e.
+not automatically cleaned up after the parameterized test ends) and for any other
+exit logic.
+
+Both ``param_init()`` and ``param_exit()`` are passed the parameterized test
+context behind the scenes. However, the test case function receives the parameter
+run context. Therefore, to manage and access shared resources from within a test
+case function, you must use ``test->parent``.
+
+For instance, finding a shared resource allocated by the Resource API requires
+passing ``test->parent`` to ``kunit_find_resource()``. This principle extends to
+all other APIs that might be used in the test case function, including
+``kunit_kzalloc()``, ``kunit_kmalloc_array()``, and others (see
+Documentation/dev-tools/kunit/api/test.rst and the
+Documentation/dev-tools/kunit/api/resource.rst).
+
+.. note::
+   The ``suite->init()`` function, which executes before each parameter run,
+   receives the parameter run context. Therefore, any resources set up in
+   ``suite->init()`` are cleaned up after each parameter run.
+
+The code below shows how you can add the shared resources. Note that this code
+utilizes the Resource API, which you can read more about here:
+Documentation/dev-tools/kunit/api/resource.rst. To see the full version of this
+code please refer to lib/kunit/kunit-example-test.c.
+
+.. code-block:: c
+
+	static int example_resource_init(struct kunit_resource *res, void *context)
+	{
+		... /* Code that allocates memory and stores context in res->data. */
+	}
+
+	/* This function deallocates memory for the kunit_resource->data field. */
+	static void example_resource_free(struct kunit_resource *res)
+	{
+		kfree(res->data);
+	}
+
+	/* This match function locates a test resource based on defined criteria. */
+	static bool example_resource_alloc_match(struct kunit *test, struct kunit_resource *res,
+						 void *match_data)
+	{
+		return res->data && res->free == example_resource_free;
+	}
+
+	/* Function to initialize the parameterized test. */
+	static int example_param_init(struct kunit *test)
+	{
+		int ctx = 3; /* Data to be stored. */
+		void *data = kunit_alloc_resource(test, example_resource_init,
+						  example_resource_free,
+						  GFP_KERNEL, &ctx);
+		if (!data)
+			return -ENOMEM;
+		kunit_register_params_array(test, example_params_array,
+					    ARRAY_SIZE(example_params_array));
+		return 0;
+	}
+
+	/* Example test that uses shared resources in test->resources. */
+	static void example_params_test_with_init(struct kunit *test)
+	{
+		int threshold;
+		const struct example_param *param = test->param_value;
+		/*  Here we pass test->parent to access the parameterized test context. */
+		struct kunit_resource *res = kunit_find_resource(test->parent,
+								 example_resource_alloc_match,
+								 NULL);
+
+		threshold = *((int *)res->data);
+		KUNIT_ASSERT_LE(test, param->value, threshold);
+		kunit_put_resource(res);
+	}
+
+	static struct kunit_case example_test_cases[] = {
+		KUNIT_CASE_PARAM_WITH_INIT(example_params_test_with_init, kunit_array_gen_params,
+					   example_param_init, NULL),
+		{}
+	};
+
+As an alternative to using the KUnit Resource API for sharing resources, you can
+place them in ``test->parent->priv``. This serves as a more lightweight method
+for resource storage, best for scenarios where complex resource management is
+not required.
+
+As stated previously ``param_init()`` and ``param_exit()`` get the parameterized
+test context. So, you can directly use ``test->priv`` within ``param_init/exit``
+to manage shared resources. However, from within the test case function, you must
+navigate up to the parent ``struct kunit`` i.e. the parameterized test context.
+Therefore, you need to use ``test->parent->priv`` to access those same
+resources.
+
+The resources placed in ``test->parent->priv`` will need to be allocated in
+memory to persist across the parameter runs. If memory is allocated using the
+KUnit memory allocation APIs (described more in the "Allocating Memory" section
+below), you won't need to worry about deallocation. The APIs will make the memory
+parameterized test 'managed', ensuring that it will automatically get cleaned up
+after the parameterized test concludes.
+
+The code below demonstrates example usage of the ``priv`` field for shared
+resources:
+
+.. code-block:: c
+
+	static const struct example_param {
+		int value;
+	} example_params_array[] = {
+		{ .value = 3, },
+		{ .value = 2, },
+		{ .value = 1, },
+		{ .value = 0, },
+	};
+
+	/* Initialize the parameterized test context. */
+	static int example_param_init_priv(struct kunit *test)
+	{
+		int ctx = 3; /* Data to be stored. */
+		int arr_size = ARRAY_SIZE(example_params_array);
+
+		/*
+		 * Allocate memory using kunit_kzalloc(). Since the `param_init`
+		 * function receives the parameterized test context, this memory
+		 * allocation will be scoped to the lifetime of the parameterized test.
+		 */
+		test->priv = kunit_kzalloc(test, sizeof(int), GFP_KERNEL);
+
+		/* Assign the context value to test->priv.*/
+		*((int *)test->priv) = ctx;
+
+		/* Register the parameter array. */
+		kunit_register_params_array(test, example_params_array, arr_size, NULL);
+		return 0;
+	}
+
+	static void example_params_test_with_init_priv(struct kunit *test)
+	{
+		int threshold;
+		const struct example_param *param = test->param_value;
+
+		/* By design, test->parent will not be NULL. */
+		KUNIT_ASSERT_NOT_NULL(test, test->parent);
+
+		/* Here we use test->parent->priv to access the shared resource. */
+		threshold = *(int *)test->parent->priv;
+
+		KUNIT_ASSERT_LE(test, param->value, threshold);
+	}
+
+	static struct kunit_case example_tests[] = {
+		KUNIT_CASE_PARAM_WITH_INIT(example_params_test_with_init_priv,
+					   kunit_array_gen_params,
+					   example_param_init_priv, NULL),
+		{}
+	};
+
 Allocating Memory
 -----------------
 
-- 
2.51.0.rc1.167.g924127e9c0-goog

