Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 426B3B1539D
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jul 2025 21:37:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9390210E3FA;
	Tue, 29 Jul 2025 19:37:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="UwuCrWk/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f201.google.com (mail-qt1-f201.google.com
 [209.85.160.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CC3210E2A1
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 19:37:33 +0000 (UTC)
Received: by mail-qt1-f201.google.com with SMTP id
 d75a77b69052e-4ab3c757b2bso118371971cf.0
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 12:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1753817852; x=1754422652;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=lH0YiEtTpPisQaiDPehvjIr4QLjg99NBvWegBL35AWY=;
 b=UwuCrWk/Dep4hWSHcJPBdclbUjQVFgXLLEZxOK/x/zgUsDHaZ2f+ddXhshex4D7NdB
 xykUjObANVDGVG1zeIQMZDvfLDsSNJKHaorz/gYikLtwaphFyIzaNfT5b2Zow1OPhfGo
 h8gT86lTNE48FCewee6X+OVYv6Gi+SIGEIovv3wyGvQUefdhv2afBFKiA53FghIYxbsf
 KKmpPlO3tml8Dh1qOoDJikY2mvQS93PSfbAQ06pTQ5w/ENUWg33QyN/deGr/0Pe/gcri
 UWqq0kEBwqpcR9OF35KTOOrdTv0/DQiV30wd4AhpgsSKKUmObmWSWwOT0clmUW2b4TtG
 b7xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753817852; x=1754422652;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lH0YiEtTpPisQaiDPehvjIr4QLjg99NBvWegBL35AWY=;
 b=lGgCjsvww6GRFqNkG1laWMUfJXvXE04CcOQSHtfWes26qC8co2LHS+9ZzrGsecummt
 /ru9ClyimlEuY0Sme+ICmCF8PP/zsPU8A+IV7OXEK1ppkhFRELSxjlvOFLEwXZsCp9jW
 xd+99qBo/00T617JFVitts03p9HWnyvBIHhKOUp3uuRA5vOwQsduDj4bKkva/fKjLhFo
 2utu0ybnjlHiJoFbrTfjcZ3oOl5CUSOGiXc66sZWBtvdwyH4sITVQ/0smpUNLMgc11vF
 JqQ/wxFBtFfp2F4eYLnkHlB3Y7MAKK0Il6Os8sll2a3iPn9O2hq5qmygzTBuQW9MeDPF
 3M0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/GbT5dyuTxdIxSai8vmVE9yT4srtl+kGEbN++QmJvLsKJTDNJoC63X6F/mMljsBxCtvglDzxBkBI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyqESncgXmxVWX18lqEKWxER4MiDC2Db6XdZ0dxEnQaJUTknhCB
 yZroWWXwCQGQeRoYs2qV73qtSkFjUNQFYpQsps203FcY8sRADJAAl34EsgVDp8geRBLQDp+xoiP
 hyLKO+FiuxcRviw==
X-Google-Smtp-Source: AGHT+IF4rZx5R4hothbrtSYCg1oepGJR2HnKEYC/ASTsC2vpdZgeCHzZM3+vnOquEKeKMB2hzjmZc5YXv+XUvg==
X-Received: from qtbbr10.prod.google.com
 ([2002:a05:622a:1e0a:b0:4ae:713e:cb10])
 (user=marievic job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:622a:302:b0:4ab:5813:e8d with SMTP id
 d75a77b69052e-4aedbc739acmr14482571cf.32.1753817852434; 
 Tue, 29 Jul 2025 12:37:32 -0700 (PDT)
Date: Tue, 29 Jul 2025 19:36:45 +0000
In-Reply-To: <20250729193647.3410634-1-marievic@google.com>
Mime-Version: 1.0
References: <20250729193647.3410634-1-marievic@google.com>
X-Mailer: git-send-email 2.50.1.552.g942d659e1b-goog
Message-ID: <20250729193647.3410634-8-marievic@google.com>
Subject: [PATCH 7/9] kunit: Add example parameterized test with shared
 resources and direct static parameter array setup
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

Add `example_params_test_with_init` to illustrate how to manage
shared resources across parameterized KUnit tests. This example
showcases the use of the new `param_init` function and its registration
to a test using the `KUNIT_CASE_PARAM_WITH_INIT` macro.

Additionally, the test demonstrates:
- How to directly assign a static parameter array to a test via
  `kunit_register_params_array`.
- Leveraging the Resource API for test resource management.

Signed-off-by: Marie Zhussupova <marievic@google.com>
---
 lib/kunit/kunit-example-test.c | 112 +++++++++++++++++++++++++++++++++
 1 file changed, 112 insertions(+)

diff --git a/lib/kunit/kunit-example-test.c b/lib/kunit/kunit-example-test.c
index 3056d6bc705d..5bf559e243f6 100644
--- a/lib/kunit/kunit-example-test.c
+++ b/lib/kunit/kunit-example-test.c
@@ -277,6 +277,116 @@ static void example_slow_test(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, 1 + 1, 2);
 }
 
+/*
+ * This custom function allocates memory for the kunit_resource data field.
+ * The function is passed to kunit_alloc_resource() and executed once
+ * by the internal helper __kunit_add_resource().
+ */
+static int example_resource_init(struct kunit_resource *res, void *context)
+{
+	int *info = kmalloc(sizeof(*info), GFP_KERNEL);
+
+	if (!info)
+		return -ENOMEM;
+	*info = *(int *)context;
+	res->data = info;
+	return 0;
+}
+
+/*
+ * This function deallocates memory for the 'kunit_resource' data field.
+ * The function is passed to kunit_alloc_resource() and automatically
+ * executes within kunit_release_resource() when the resource's reference
+ * count, via kunit_put_resource(), drops to zero. KUnit uses reference
+ * counting to ensure that resources are not freed prematurely.
+ */
+static void example_resource_free(struct kunit_resource *res)
+{
+	kfree(res->data);
+}
+
+/*
+ * This match function is invoked by kunit_find_resource() to locate
+ * a test resource based on defined criteria. The current example
+ * uniquely identifies the resource by its free function; however,
+ * alternative custom criteria can be implemented. Refer to
+ * lib/kunit/platform.c and lib/kunit/static_stub.c for further examples.
+ */
+static bool example_resource_alloc_match(struct kunit *test,
+					 struct kunit_resource *res,
+					 void *match_data)
+{
+	return res->data && res->free == example_resource_free;
+}
+
+/*
+ * This is an example of a function that provides a description for each of the
+ * parameters.
+ */
+static void example_param_array_get_desc(const void *p, char *desc)
+{
+	const struct example_param *param = p;
+
+	snprintf(desc, KUNIT_PARAM_DESC_SIZE,
+		 "example check if %d is less than or equal to 3", param->value);
+}
+
+/*
+ * Initializes the parent kunit struct for parameterized KUnit tests.
+ * This function enables sharing resources across all parameterized
+ * tests by adding them to the `parent` kunit test struct. It also supports
+ * registering either static or dynamic arrays of test parameters.
+ */
+static int example_param_init(struct kunit *test)
+{
+	int ctx = 3; /* Data to be stored. */
+	int arr_size = ARRAY_SIZE(example_params_array);
+
+	/*
+	 * This allocates a struct kunit_resource, sets its data field to
+	 * ctx, and adds it to the kunit struct's resources list. Note that
+	 * this is test managed so we don't need to have a custom exit function
+	 * to free it.
+	 */
+	void *data = kunit_alloc_resource(test, example_resource_init, example_resource_free,
+					  GFP_KERNEL, &ctx);
+
+	if (!data)
+		return -ENOMEM;
+	/* Pass the static param array information to the parent struct kunit. */
+	kunit_register_params_array(test, example_params_array, arr_size,
+				    example_param_array_get_desc);
+	return 0;
+}
+
+/*
+ * This is an example of a parameterized test that uses shared resources
+ * available from the struct kunit parent field of the kunit struct.
+ */
+static void example_params_test_with_init(struct kunit *test)
+{
+	int threshold;
+	struct kunit_resource *res;
+	const struct example_param *param = test->param_value;
+
+	/* By design, param pointer will not be NULL. */
+	KUNIT_ASSERT_NOT_NULL(test, param);
+
+	/* Here we access the parent pointer of the test to find the shared resource. */
+	res = kunit_find_resource(test->parent, example_resource_alloc_match, NULL);
+
+	KUNIT_ASSERT_NOT_NULL(test, res);
+
+	/* Since the data field in kunit_resource is a void pointer we need to typecast it. */
+	threshold = *((int *)res->data);
+
+	/* Assert that the parameter is less than or equal to a certain threshold. */
+	KUNIT_ASSERT_LE(test, param->value, threshold);
+
+	/* This decreases the reference count after calling kunit_find_resource(). */
+	kunit_put_resource(res);
+}
+
 /*
  * Here we make a list of all the test cases we want to add to the test suite
  * below.
@@ -296,6 +406,8 @@ static struct kunit_case example_test_cases[] = {
 	KUNIT_CASE(example_static_stub_using_fn_ptr_test),
 	KUNIT_CASE(example_priv_test),
 	KUNIT_CASE_PARAM(example_params_test, example_gen_params),
+	KUNIT_CASE_PARAM_WITH_INIT(example_params_test_with_init, NULL,
+				   example_param_init, NULL),
 	KUNIT_CASE_SLOW(example_slow_test),
 	{}
 };
-- 
2.50.1.552.g942d659e1b-goog

