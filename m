Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F52B15394
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jul 2025 21:37:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 758AC10E2A0;
	Tue, 29 Jul 2025 19:37:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="LC1IKzs6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f201.google.com (mail-qk1-f201.google.com
 [209.85.222.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E80110E2A1
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 19:37:31 +0000 (UTC)
Received: by mail-qk1-f201.google.com with SMTP id
 af79cd13be357-7e1b84c9a3dso901462585a.2
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 12:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1753817850; x=1754422650;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=78rzCs5wryrNYhO305P66/dWltNV0BBuUlP5VrjuElY=;
 b=LC1IKzs61alIHajH87ULUMdaOAwFsYZQPj/NSIHakm8PLENi7sbps/H6UT7aIkkfzn
 kuVZ+sTmX1RoWW4iKuj7ZTe6Q0B/CT8v+TUTYNB6GTXTk3k1/TZAxEbtkWTXsJIHiPKI
 0TxedCpQHeOWDpZePqsikLdGpvGxbx42IEx/5PP0+QtfV+R6XHOEPOBv8CLMQRFpQIma
 MC3Vx5QO7oyKJtBzsZgcBZR/TqTlDoEpAHSutt0IZpS6sWFvzBzeoN7OzZoIcmFzQWFr
 0yX3izHa42p7DtjF1OnSU29VQU/iHXnoV3/aTNQyFN0KJiGZtxj1k1UIHEBvPclTAy2J
 q/CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753817850; x=1754422650;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=78rzCs5wryrNYhO305P66/dWltNV0BBuUlP5VrjuElY=;
 b=qcatPC02vsAlySDnxvzofy+khfdPViBDjkn/BtpuZn54xPqSdKkejxfktOZcsb2gGe
 rVjvTfs7Gcf0jvqgaF9gb8vO1NheurFbr9VNO2FKLa0C1EvmEVLOqzldEbzsI7S7y8jW
 d7VQx+wV3amFQOq1YzOxVd50sK/RdKJ9QA2foGTPA3enSxl7B77gH3939q7XKe+/3PTI
 Bb4DWWcX34a1kPVwIURGBKiYEdU9+184zGZCmcICqd5WFGh6igly0XiuLAiMyU+13/Le
 B99XJtNYLvQyfmyRGmtdhkabACCBazNdcAMwBfxN6Me3N6+npyUDGnTAk0FvZLu+SZ6t
 /W7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPG4wlvtJ7DB/401H0MpbnI/dxYyki+hFG2Kfg9HYt/ryDgDPLRGgc8iAR18zTACqscWTkiLebAZk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzhxrBlaEZubiAk8F9CSDqIw0CUibmqCh2JDL/BZiRzeW8/zBd8
 leV/2zPPr4o8qXt1hQ4vw18xHxRYUgoynrD6zLJ6x/xSjwi/umJLXzcmdfYtYLadk8UhKHuHEVU
 u7sQW40ZW90GdgQ==
X-Google-Smtp-Source: AGHT+IEAbGfdfL/JeSj/QNivDbSUc7jd/zlcu+jeV8MtBFHncgWZqjaDWY9/m/krqd0ZJcolenCYgMNZ2HGpMQ==
X-Received: from qtbbc7.prod.google.com ([2002:a05:622a:1cc7:b0:4ab:a3a0:c3dc])
 (user=marievic job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:620a:8b15:b0:7d4:4c48:d5b4 with SMTP id
 af79cd13be357-7e66f3b9ea4mr75650485a.56.1753817850191; 
 Tue, 29 Jul 2025 12:37:30 -0700 (PDT)
Date: Tue, 29 Jul 2025 19:36:44 +0000
In-Reply-To: <20250729193647.3410634-1-marievic@google.com>
Mime-Version: 1.0
References: <20250729193647.3410634-1-marievic@google.com>
X-Mailer: git-send-email 2.50.1.552.g942d659e1b-goog
Message-ID: <20250729193647.3410634-7-marievic@google.com>
Subject: [PATCH 6/9] kunit: Enable direct registration of parameter arrays to
 a KUnit test
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

KUnit parameterized tests currently support two
primary methods for getting parameters:
1.  Defining custom logic within a `generate_params`
    function.
2.  Using the KUNIT_ARRAY_PARAM and KUNIT_ARRAY_PARAM_DESC
    macros with pre-defined static arrays.

These methods present limitations when dealing with
dynamically generated parameter arrays, or in scenarios
where populating parameters sequentially via
`generate_params` is inefficient or overly complex.

This patch addresses these limitations by adding a new
`params_data` field to `struct kunit`, of the type
`kunit_params`. The struct `kunit_params` is designed to
store the parameter array itself, along with essential metadata
including the parameter count, parameter size, and a
`get_description` function for providing custom descriptions
for individual parameters.

The `params_data` field can be populated by calling the new
`kunit_register_params_array` macro from within a
`param_init` function. By attaching the parameter array
directly to the parent kunit test instance, these parameters
can be iterated over in kunit_run_tests() behind the scenes.

This modification provides greater flexibility to the
KUnit framework, allowing testers to easily register and
utilize both dynamic and static parameter arrays.

Signed-off-by: Marie Zhussupova <marievic@google.com>
---
 include/kunit/test.h | 54 ++++++++++++++++++++++++++++++++++++++++----
 lib/kunit/test.c     | 26 ++++++++++++++++++++-
 2 files changed, 75 insertions(+), 5 deletions(-)

diff --git a/include/kunit/test.h b/include/kunit/test.h
index 4ba65dc35710..9143f0e22323 100644
--- a/include/kunit/test.h
+++ b/include/kunit/test.h
@@ -245,7 +245,8 @@ static inline char *kunit_status_to_ok_not_ok(enum kunit_status status)
  */
 #define KUNIT_CASE_PARAM_WITH_INIT(test_name, gen_params, init, exit)		\
 		{ .run_case = test_name, .name = #test_name,			\
-		  .generate_params = gen_params,				\
+		  .generate_params = (gen_params)				\
+		   ?: kunit_get_next_param_and_desc,				\
 		  .param_init = init, .param_exit = exit,			\
 		  .module_name = KBUILD_MODNAME}
 
@@ -294,6 +295,21 @@ struct kunit_suite_set {
 	struct kunit_suite * const *end;
 };
 
+/* Stores the pointer to the parameter array and its metadata. */
+struct kunit_params {
+	/*
+	 * Reference to the parameter array for the parameterized tests. This
+	 * is NULL if a parameter array wasn't directly passed to the
+	 * parent kunit struct via the kunit_register_params_array macro.
+	 */
+	const void *params;
+	/* Reference to a function that gets the description of a parameter. */
+	void (*get_description)(const void *param, char *desc);
+
+	int num_params;
+	size_t elem_size;
+};
+
 /**
  * struct kunit - represents a running instance of a test.
  *
@@ -302,12 +318,14 @@ struct kunit_suite_set {
  * @parent: for user to store data that they want to shared across
  *	    parameterized tests. Typically, the data is provided in
  *	    the param_init function (see &struct kunit_case).
+ * @params_data: for users to directly store the parameter array.
  *
  * Used to store information about the current context under which the test
  * is running. Most of this data is private and should only be accessed
- * indirectly via public functions; the two exceptions are @priv and @parent
- * which can be used by the test writer to store arbitrary data or data that is
- * available to all parameter test executions, respectively.
+ * indirectly via public functions. There are three exceptions to this: @priv,
+ * @parent, and @params_data. These members can be used by the test writer to
+ * store arbitrary data, data available to all parameter test executions, and
+ * the parameter array, respectively.
  */
 struct kunit {
 	void *priv;
@@ -316,6 +334,8 @@ struct kunit {
 	 * during parameterized testing.
 	 */
 	struct kunit *parent;
+	/* Stores the params array and all data related to it. */
+	struct kunit_params params_data;
 
 	/* private: internal use only. */
 	const char *name; /* Read only after initialization! */
@@ -386,6 +406,8 @@ void kunit_exec_list_tests(struct kunit_suite_set *suite_set, bool include_attr)
 struct kunit_suite_set kunit_merge_suite_sets(struct kunit_suite_set init_suite_set,
 		struct kunit_suite_set suite_set);
 
+const void *kunit_get_next_param_and_desc(struct kunit *test, const void *prev, char *desc);
+
 #if IS_BUILTIN(CONFIG_KUNIT)
 int kunit_run_all_tests(void);
 #else
@@ -1735,6 +1757,30 @@ do {									       \
 		return NULL;									\
 	}
 
+/**
+ * kunit_register_params_array() - Register parameters for a KUnit test.
+ * @test: The KUnit test structure to which parameters will be added.
+ * @params_arr: An array of test parameters.
+ * @param_cnt: Number of parameters.
+ * @get_desc: A pointer to a function that generates a string description for
+ * a given parameter element.
+ *
+ * This macro initializes the @test's parameter array data, storing information
+ * including the parameter array, its count, the element size, and the parameter
+ * description function within `test->params_data`. KUnit's built-in
+ * `kunit_get_next_param_and_desc` function will automatically read this
+ * data when a custom `generate_params` function isn't provided.
+ */
+#define kunit_register_params_array(test, params_arr, param_cnt, get_desc)			\
+	do {											\
+		struct kunit *_test = (test);						\
+		const typeof((params_arr)[0]) * _params_ptr = &(params_arr)[0];			\
+		_test->params_data.params = _params_ptr;					\
+		_test->params_data.num_params = (param_cnt);					\
+		_test->params_data.elem_size = sizeof(*_params_ptr);				\
+		_test->params_data.get_description = (get_desc);				\
+	} while (0)
+
 // TODO(dlatypov@google.com): consider eventually migrating users to explicitly
 // include resource.h themselves if they need it.
 #include <kunit/resource.h>
diff --git a/lib/kunit/test.c b/lib/kunit/test.c
index f50ef82179c4..2f4b7087db3f 100644
--- a/lib/kunit/test.c
+++ b/lib/kunit/test.c
@@ -337,6 +337,13 @@ void __kunit_do_failed_assertion(struct kunit *test,
 }
 EXPORT_SYMBOL_GPL(__kunit_do_failed_assertion);
 
+static void __kunit_init_params(struct kunit *test)
+{
+	test->params_data.params = NULL;
+	test->params_data.num_params = 0;
+	test->params_data.elem_size = 0;
+}
+
 void kunit_init_test(struct kunit *test, const char *name, struct string_stream *log)
 {
 	spin_lock_init(&test->lock);
@@ -347,6 +354,7 @@ void kunit_init_test(struct kunit *test, const char *name, struct string_stream
 		string_stream_clear(log);
 	test->status = KUNIT_SUCCESS;
 	test->status_comment[0] = '\0';
+	__kunit_init_params(test);
 }
 EXPORT_SYMBOL_GPL(kunit_init_test);
 
@@ -641,6 +649,22 @@ static void kunit_accumulate_stats(struct kunit_result_stats *total,
 	total->total += add.total;
 }
 
+const void *kunit_get_next_param_and_desc(struct kunit *test, const void *prev, char *desc)
+{
+	struct kunit_params *params_arr = &test->params_data;
+	const void *param;
+
+	if (test->param_index < params_arr->num_params) {
+		param = (char *)params_arr->params
+			+ test->param_index * params_arr->elem_size;
+
+		if (params_arr->get_description)
+			params_arr->get_description(param, desc);
+		return param;
+	}
+	return NULL;
+}
+
 static void __kunit_init_parent_test(struct kunit_case *test_case, struct kunit *test)
 {
 	if (test_case->param_init) {
@@ -687,7 +711,7 @@ int kunit_run_tests(struct kunit_suite *suite)
 			/* Test marked as skip */
 			test.status = KUNIT_SKIPPED;
 			kunit_update_stats(&param_stats, test.status);
-		} else if (!test_case->generate_params) {
+		} else if (!test_case->generate_params && !test.params_data.params) {
 			/* Non-parameterised test. */
 			test_case->status = KUNIT_SKIPPED;
 			kunit_run_case_catch_errors(suite, test_case, &test);
-- 
2.50.1.552.g942d659e1b-goog

