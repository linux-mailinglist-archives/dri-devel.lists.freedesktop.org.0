Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0788CB3585C
	for <lists+dri-devel@lfdr.de>; Tue, 26 Aug 2025 11:13:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C90F610E61E;
	Tue, 26 Aug 2025 09:13:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="BkZ8s8Gs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com
 [209.85.210.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6A0010E61E
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Aug 2025 09:13:51 +0000 (UTC)
Received: by mail-pf1-f201.google.com with SMTP id
 d2e1a72fcca58-771e43782aaso1868848b3a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Aug 2025 02:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1756199631; x=1756804431;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=SS4RWWsYR8rt67WX12qateLzVdeeE0BdCVVhb7GW4rE=;
 b=BkZ8s8Gs0cbR2IKbqw87UIl2/uHIhkm9VEGkudoxRnDMOkVd2p0vH61pOSs7oDeevk
 EePdoer50IwVsQOKJNhYvvvCGRqd1VFK/1E4CKZaVDfnwDGQHkRYsUt+5ZmGx3aBkEy9
 DvZCVscwAL3aIRgsGoNnW6Qn4ORckz12FvlvkYN4cNLFea5EuN617Pcnq9zVWLXrc5y3
 8ws8c5KjbkHT8tuz+9RYOiGBu9/ia4IsV+BR5WJ6KXYObl+m1iIeKGKqniOY6QATh0FH
 LqqM6gmc1VUjeqnX4yGF0M8d6jVCfxcSONyIL1P7PzZBagGqznaWRU7js0I2ehdaoL13
 uTYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756199631; x=1756804431;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SS4RWWsYR8rt67WX12qateLzVdeeE0BdCVVhb7GW4rE=;
 b=cn4002dp3rTeSLEGpZoBR5mm9bdnfYFl5SM+8Mn5WNfVxe52dTQ/IoUEce3j+nfQDT
 eIELZdh2OMDeR8q7WFoNs25rMRkJB7ca9VR8YWI0+8QGgIWt8IjMknrRXVMo9KtUuT4u
 BRDb7CRAYQWSVwiKPgV6hH7f/zQSuvVHr9CDy9tfAfpmwF30/U6V63AM8VNFblGvnkrH
 krhz3YomrI9SxZI76V/hZTR1P3Qs77+XMVZsPiKYf7KmgnrP3zGamffJc+1Qtutao4u6
 XXHISFNFo1jHUfhLKgDPdh/yH0VAA4ykg9q3/38p6jv6c50UsqUCLbIZD9OQ2KDuS+oT
 uMzw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOp6qMmEvdGxLqtY01czdlIObfLbENm67TyexvIKq1V4UTyCB9k7l0JGrgYdFZZ4iXkylL92lcfqw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwvSQb5YdB8qUbs/nFBvneJi84enE5U/bCaa/5SV461ftYCdWJ0
 QSjU1YBdgydifglduYYEV+ICAcVq40zmo69DWAuWcAoqN96s+sj0iyAqIrureuTYmHZgOqCThUl
 iOo1LWCItrZKc1Q==
X-Google-Smtp-Source: AGHT+IEJ8SqLbXF/ST99SjsSnhPT3Oom4CqszB9KFVxbzLAYGGTQUnByacCzje67CXDYtFH0Xt8e2NrGNQS4lA==
X-Received: from pfz14.prod.google.com ([2002:a05:6a00:bb8e:b0:748:e22c:600c])
 (user=davidgow job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:3c91:b0:771:ebf1:5e4b with SMTP id
 d2e1a72fcca58-771ebf16677mr4678781b3a.26.1756199630989; 
 Tue, 26 Aug 2025 02:13:50 -0700 (PDT)
Date: Tue, 26 Aug 2025 17:13:34 +0800
In-Reply-To: <20250826091341.1427123-1-davidgow@google.com>
Mime-Version: 1.0
References: <20250826091341.1427123-1-davidgow@google.com>
X-Mailer: git-send-email 2.51.0.261.g7ce5a0a67e-goog
Message-ID: <20250826091341.1427123-5-davidgow@google.com>
Subject: [PATCH v4 4/7] kunit: Enable direct registration of parameter arrays
 to a KUnit test
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

KUnit parameterized tests currently support two primary methods f
or getting parameters:
1.  Defining custom logic within a generate_params() function.
2.  Using the KUNIT_ARRAY_PARAM() and KUNIT_ARRAY_PARAM_DESC()
    macros with a pre-defined static array and passing
    the created *_gen_params() to KUNIT_CASE_PARAM().

These methods present limitations when dealing with dynamically
generated parameter arrays, or in scenarios where populating parameters
sequentially via generate_params() is inefficient or overly complex.

This patch addresses these limitations by adding a new `params_array`
field to `struct kunit`, of the type `kunit_params`. The
`struct kunit_params` is designed to store the parameter array itself,
along with essential metadata including the parameter count, parameter
size, and a get_description() function for providing custom descriptions
for individual parameters.

The `params_array` field can be populated by calling the new
kunit_register_params_array() macro from within a param_init() function.
This will register the array as part of the parameterized test context.
The user will then need to pass kunit_array_gen_params() to the
KUNIT_CASE_PARAM_WITH_INIT() macro as the generator function, if not
providing their own. kunit_array_gen_params() is a KUnit helper that will
use the registered array to generate parameters.

The arrays passed to KUNIT_ARRAY_PARAM(,DESC) will also be registered to
the parameterized test context for consistency as well as for higher
availability of the parameter count that will be used for outputting a KTAP
test plan for a parameterized test.

This modification provides greater flexibility to the KUnit framework,
allowing  testers to easily register and utilize both dynamic and static
parameter arrays.

Reviewed-by: David Gow <davidgow@google.com>
Reviewed-by: Rae Moar <rmoar@google.com>
Signed-off-by: Marie Zhussupova <marievic@google.com>
[Only output the test plan if using kunit_array_gen_params --David]
Signed-off-by: David Gow <davidgow@google.com>
---

Changes in v4:
v3: https://lore.kernel.org/linux-kselftest/20250815103604.3857930-5-marievic@google.com/
- Only output a KTAP test plan if the generate_params function is
  kunit_array_gen_params.
- This fixes an issue with generate_params functions which use an array,
  but skip some elements.
- This change is also available as a separate patch here:
  https://lore.kernel.org/linux-kselftest/20250821135447.1618942-2-davidgow@google.com/

Changes in v3:
v2: https://lore.kernel.org/all/20250811221739.2694336-5-marievic@google.com/
- Commit message formatting.

Changes in v2:
v1: https://lore.kernel.org/all/20250729193647.3410634-7-marievic@google.com/
- If the parameter count is available for a parameterized test, the
  kunit_run_tests() function will now output the KTAP test plan for it.
- The name of the struct kunit_params field in struct kunit was changed
  from params_data to params_array. This name change better reflects its
  purpose, which is to encapsulate both the parameter array and its
  associated metadata.
- The name of `kunit_get_next_param_and_desc` was changed to
  `kunit_array_gen_params` to make it simpler and to better fit its purpose
  of being KUnit's built-in generator function that uses arrays to generate
  parameters.
- The signature of get_description() in `struct params_array` was changed to
  accept the parameterized test context, as well. This way test users can
  potentially use information available in the parameterized test context,
  such as the parameterized test name for setting the parameter descriptions.
- The type of `num_params` in `struct params_array` was changed from int to
  size_t for better handling of the array size.
- The name of __kunit_init_params() was changed to be kunit_init_params().
  Logic that sets the get_description() function pointer to NULL was also
  added in there.
- `kunit_array_gen_params` is now exported to make it available to use
  with modules.
- Instead of allowing NULL to be passed in as the parameter generator
  function in the KUNIT_CASE_PARAM_WITH_INIT macro, users will now be asked
  to provide `kunit_array_gen_params` as the generator function. This will
  ensure that a parameterized test remains defined by the existence of a
  parameter generation function.
- KUNIT_ARRAY_PARAM(,DESC) will now additionally register the passed in array
  in struct kunit_params. This will make things more consistent i.e. if a
  parameter array is available then the struct kunit_params field in parent
  struct kunit is populated. Additionally, this will increase the
  availability of the KTAP test plan.
- The comments and the commit message were changed to reflect the
  parameterized testing terminology. See the patch series cover letter
  change log for the definitions.

---
 include/kunit/test.h | 65 ++++++++++++++++++++++++++++++++++++++++----
 lib/kunit/test.c     | 32 ++++++++++++++++++++++
 2 files changed, 91 insertions(+), 6 deletions(-)

diff --git a/include/kunit/test.h b/include/kunit/test.h
index 8eba1b03c3e3..5ec5182b5e57 100644
--- a/include/kunit/test.h
+++ b/include/kunit/test.h
@@ -234,9 +234,13 @@ static inline char *kunit_status_to_ok_not_ok(enum kunit_status status)
  * Provides the option to register param_init() and param_exit() functions.
  * param_init/exit will be passed the parameterized test context and run once
  * before and once after the parameterized test. The init function can be used
- * to add resources to share between parameter runs, and any other setup logic.
- * The exit function can be used to clean up resources that were not managed by
- * the parameterized test, and any other teardown logic.
+ * to add resources to share between parameter runs, pass parameter arrays,
+ * and any other setup logic. The exit function can be used to clean up resources
+ * that were not managed by the parameterized test, and any other teardown logic.
+ *
+ * Note: If you are registering a parameter array in param_init() with
+ * kunit_register_param_array() then you need to pass kunit_array_gen_params()
+ * to this as the generator function.
  */
 #define KUNIT_CASE_PARAM_WITH_INIT(test_name, gen_params, init, exit)		\
 		{ .run_case = test_name, .name = #test_name,			\
@@ -289,6 +293,20 @@ struct kunit_suite_set {
 	struct kunit_suite * const *end;
 };
 
+/* Stores the pointer to the parameter array and its metadata. */
+struct kunit_params {
+	/*
+	 * Reference to the parameter array for a parameterized test. This
+	 * is NULL if a parameter array wasn't directly passed to the
+	 * parameterized test context struct kunit via kunit_register_params_array().
+	 */
+	const void *params;
+	/* Reference to a function that gets the description of a parameter. */
+	void (*get_description)(struct kunit *test, const void *param, char *desc);
+	size_t num_params;
+	size_t elem_size;
+};
+
 /**
  * struct kunit - represents a running instance of a test.
  *
@@ -296,16 +314,18 @@ struct kunit_suite_set {
  *	  created in the init function (see &struct kunit_suite).
  * @parent: reference to the parent context of type struct kunit that can
  *	    be used for storing shared resources.
+ * @params_array: for storing the parameter array.
  *
  * Used to store information about the current context under which the test
  * is running. Most of this data is private and should only be accessed
- * indirectly via public functions; the two exceptions are @priv and @parent
- * which can be used by the test writer to store arbitrary data and access the
- * parent context, respectively.
+ * indirectly via public functions; the exceptions are @priv, @parent and
+ * @params_array which can be used by the test writer to store arbitrary data,
+ * access the parent context, and to store the parameter array, respectively.
  */
 struct kunit {
 	void *priv;
 	struct kunit *parent;
+	struct kunit_params params_array;
 
 	/* private: internal use only. */
 	const char *name; /* Read only after initialization! */
@@ -376,6 +396,8 @@ void kunit_exec_list_tests(struct kunit_suite_set *suite_set, bool include_attr)
 struct kunit_suite_set kunit_merge_suite_sets(struct kunit_suite_set init_suite_set,
 		struct kunit_suite_set suite_set);
 
+const void *kunit_array_gen_params(struct kunit *test, const void *prev, char *desc);
+
 #if IS_BUILTIN(CONFIG_KUNIT)
 int kunit_run_all_tests(void);
 #else
@@ -1708,6 +1730,8 @@ do {									       \
 					     const void *prev, char *desc)			\
 	{											\
 		typeof((array)[0]) *__next = prev ? ((typeof(__next)) prev) + 1 : (array);	\
+		if (!prev)									\
+			kunit_register_params_array(test, array, ARRAY_SIZE(array), NULL);	\
 		if (__next - (array) < ARRAY_SIZE((array))) {					\
 			void (*__get_desc)(typeof(__next), char *) = get_desc;			\
 			if (__get_desc)								\
@@ -1730,6 +1754,8 @@ do {									       \
 					     const void *prev, char *desc)			\
 	{											\
 		typeof((array)[0]) *__next = prev ? ((typeof(__next)) prev) + 1 : (array);	\
+		if (!prev)									\
+			kunit_register_params_array(test, array, ARRAY_SIZE(array), NULL);	\
 		if (__next - (array) < ARRAY_SIZE((array))) {					\
 			strscpy(desc, __next->desc_member, KUNIT_PARAM_DESC_SIZE);		\
 			return __next;								\
@@ -1737,6 +1763,33 @@ do {									       \
 		return NULL;									\
 	}
 
+/**
+ * kunit_register_params_array() - Register parameter array for a KUnit test.
+ * @test: The KUnit test structure to which parameters will be added.
+ * @array: An array of test parameters.
+ * @param_count: Number of parameters.
+ * @get_desc: Function that generates a string description for a given parameter
+ * element.
+ *
+ * This macro initializes the @test's parameter array data, storing information
+ * including the parameter array, its count, the element size, and the parameter
+ * description function within `test->params_array`.
+ *
+ * Note: If using this macro in param_init(), kunit_array_gen_params()
+ * will then need to be manually provided as the parameter generator function to
+ * KUNIT_CASE_PARAM_WITH_INIT(). kunit_array_gen_params() is a KUnit
+ * function that uses the registered array to generate parameters
+ */
+#define kunit_register_params_array(test, array, param_count, get_desc)				\
+	do {											\
+		struct kunit *_test = (test);							\
+		const typeof((array)[0]) * _params_ptr = &(array)[0];				\
+		_test->params_array.params = _params_ptr;					\
+		_test->params_array.num_params = (param_count);					\
+		_test->params_array.elem_size = sizeof(*_params_ptr);				\
+		_test->params_array.get_description = (get_desc);				\
+	} while (0)
+
 // TODO(dlatypov@google.com): consider eventually migrating users to explicitly
 // include resource.h themselves if they need it.
 #include <kunit/resource.h>
diff --git a/lib/kunit/test.c b/lib/kunit/test.c
index 50705248abad..bb66ea1a3eac 100644
--- a/lib/kunit/test.c
+++ b/lib/kunit/test.c
@@ -337,6 +337,14 @@ void __kunit_do_failed_assertion(struct kunit *test,
 }
 EXPORT_SYMBOL_GPL(__kunit_do_failed_assertion);
 
+static void kunit_init_params(struct kunit *test)
+{
+	test->params_array.params = NULL;
+	test->params_array.get_description = NULL;
+	test->params_array.num_params = 0;
+	test->params_array.elem_size = 0;
+}
+
 void kunit_init_test(struct kunit *test, const char *name, struct string_stream *log)
 {
 	spin_lock_init(&test->lock);
@@ -347,6 +355,7 @@ void kunit_init_test(struct kunit *test, const char *name, struct string_stream
 		string_stream_clear(log);
 	test->status = KUNIT_SUCCESS;
 	test->status_comment[0] = '\0';
+	kunit_init_params(test);
 }
 EXPORT_SYMBOL_GPL(kunit_init_test);
 
@@ -641,6 +650,23 @@ static void kunit_accumulate_stats(struct kunit_result_stats *total,
 	total->total += add.total;
 }
 
+const void *kunit_array_gen_params(struct kunit *test, const void *prev, char *desc)
+{
+	struct kunit_params *params_arr = &test->params_array;
+	const void *param;
+
+	if (test->param_index < params_arr->num_params) {
+		param = (char *)params_arr->params
+			+ test->param_index * params_arr->elem_size;
+
+		if (params_arr->get_description)
+			params_arr->get_description(test, param, desc);
+		return param;
+	}
+	return NULL;
+}
+EXPORT_SYMBOL_GPL(kunit_array_gen_params);
+
 static void kunit_init_parent_param_test(struct kunit_case *test_case, struct kunit *test)
 {
 	if (test_case->param_init) {
@@ -706,6 +732,12 @@ int kunit_run_tests(struct kunit_suite *suite)
 				  "KTAP version 1\n");
 			kunit_log(KERN_INFO, &test, KUNIT_SUBTEST_INDENT KUNIT_SUBTEST_INDENT
 				  "# Subtest: %s", test_case->name);
+			if (test.params_array.params &&
+			    test_case->generate_params == kunit_array_gen_params) {
+				kunit_log(KERN_INFO, &test, KUNIT_SUBTEST_INDENT
+					  KUNIT_SUBTEST_INDENT "1..%zd\n",
+					  test.params_array.num_params);
+			}
 
 			while (curr_param) {
 				struct kunit param_test = {
-- 
2.51.0.261.g7ce5a0a67e-goog

