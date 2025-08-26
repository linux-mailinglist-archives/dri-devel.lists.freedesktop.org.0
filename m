Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6746B35858
	for <lists+dri-devel@lfdr.de>; Tue, 26 Aug 2025 11:13:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D04AC10E60E;
	Tue, 26 Aug 2025 09:13:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="KZ5d409x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com
 [209.85.210.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D75D110E619
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Aug 2025 09:13:46 +0000 (UTC)
Received: by mail-pf1-f201.google.com with SMTP id
 d2e1a72fcca58-770d7a5f812so1789685b3a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Aug 2025 02:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1756199626; x=1756804426;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=Z06H7nQAXuGVWeGBmy7rHwPZSCBDj75F7L0FEZo0y1s=;
 b=KZ5d409xGSL90nVGe/+TACgSVfBz02N7dotFj+X+rcBi/eT1nX8fRNHOJ8oHLHn6MT
 IELFlFMMyURX7/b7WmR06iE/SVarFJYc/A3Q4IzTP86xZNSBGUDQCdhE6zeKrXzJRi8T
 V7HKKnnymLzHMbwmZP1SQM0ZBfw3YcwLQNUgr1ZQPTz4ftqXRJBvE/C9duaXADP86dRS
 mnWGWZjXbmRwd/XvpifHjnooKLzkpGoulB5m70hzT64/85M1RTTKQT26+bxxvLNQdF+G
 cPWF0ZsUHS2ELAb9rVoQBNsx3+6Rrxt2DXv9mYixhVkwkXr4uCSlh1R4E82JuuGzOa/+
 2gBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756199626; x=1756804426;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Z06H7nQAXuGVWeGBmy7rHwPZSCBDj75F7L0FEZo0y1s=;
 b=MUv9lvvliVDl/SL7IAEKlPPUimENAYMsYWvGa5R8Sw77VGcRU6xdav11wCv9CVVPij
 TBEiXtgUrG3tt3Jz0qCr85hVqR16YyvxHWcYAF9XOdJg56TeCsYKHWXPUO9TrNO4ee3v
 euPNGbktqBnQxuCRYRhUROJWRuPc3x6XgKg0yF1+B9k6/A+nJimJ44Ix0hvcvY4Mjh0A
 jzl99P8yUjk7ulrKYkS91B7FUwJ/oaJ871PDI7Rx7nqO4Djrvg+nSn3uC9TzS+NCCVNg
 8FCqANex8jeLOdCjY1ZRfWbBp2PeL9kWfgUWur6knP7TQGlXa6s2bHA3eIuu5EbS3XbM
 oNVQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXOF94/LmVlB0N61t1xntcnq6wFF04HQJDJTKbZlW9sT4CU1q9/F5w8lx3DEBCf6rZalEIS52bSrE0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YycCUljxBVrDwWNS4m1doewfusEn5qT0cwVBhPj0huqnTXMgo3P
 6fW2IWXBSaqwIAycfCVnaGsWqEcvVweJvWkMT8iMc4fsjXH8qjHVC0E+7s6FFqr6COPa32iUX1b
 qZ1H0pYsjzWZALQ==
X-Google-Smtp-Source: AGHT+IFv6OGkkYcCqgD5ALA5r0X9nZMsDa3qbm/600rcJO0vkLNs5ciUkvjSFY6CyLtsEnsS+a8iY6JjNwchPA==
X-Received: from pfx51.prod.google.com ([2002:a05:6a00:a473:b0:771:e00d:cee])
 (user=davidgow job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:4b56:b0:76e:7ae9:e869 with SMTP id
 d2e1a72fcca58-7702fb00068mr18610618b3a.25.1756199626242; 
 Tue, 26 Aug 2025 02:13:46 -0700 (PDT)
Date: Tue, 26 Aug 2025 17:13:31 +0800
In-Reply-To: <20250826091341.1427123-1-davidgow@google.com>
Mime-Version: 1.0
References: <20250826091341.1427123-1-davidgow@google.com>
X-Mailer: git-send-email 2.51.0.261.g7ce5a0a67e-goog
Message-ID: <20250826091341.1427123-2-davidgow@google.com>
Subject: [PATCH v4 1/7] kunit: Add parent kunit for parameterized test context
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

Currently, KUnit parameterized tests lack a mechanism to share
resources across parameter runs because the same `struct kunit`
instance is cleaned up and reused for each run.

This patch introduces parameterized test context, enabling test
users to share resources between parameter runs. It also allows
setting up resources that need to be available for all parameter
runs only once, which is helpful in cases where setup is expensive.

To establish a parameterized test context, this patch adds a
parent pointer field to `struct kunit`. This allows resources added
to the parent `struct kunit` to be shared and accessible across all
parameter runs.

In kunit_run_tests(), the default `struct kunit` created is now
designated to act as the parameterized test context whenever a test
is parameterized.

Subsequently, a new `struct kunit` is made for each parameter run, and
its parent pointer is set to the `struct kunit` that holds the
parameterized test context.

Reviewed-by: David Gow <davidgow@google.com>
Reviewed-by: Rae Moar <rmoar@google.com>
Signed-off-by: Marie Zhussupova <marievic@google.com>
Signed-off-by: David Gow <davidgow@google.com>
---

No changes in v4:
v3: https://lore.kernel.org/linux-kselftest/20250815103604.3857930-2-marievic@google.com/

Changes in v3:
v2: https://lore.kernel.org/all/20250811221739.2694336-2-marievic@google.com/
- Commit message formatting.

Changes in v2:
v1: https://lore.kernel.org/all/20250729193647.3410634-2-marievic@google.com/
- Descriptions of the parent pointer in `struct kunit` were changed to
  be more general, as it could be used to share resources not only
  between parameter runs but also between test cases in the future.
- When printing parameter descriptions using test.param_index was changed
  to param_test.param_index.
- kunit_cleanup(&test) in kunit_run_tests() was moved inside the
  parameterized test check.
- The comments and the commit message were changed to reflect the
  parameterized testing terminology. See the patch series cover letter
  change log for the definitions.
---
 include/kunit/test.h |  8 ++++++--
 lib/kunit/test.c     | 34 ++++++++++++++++++++--------------
 2 files changed, 26 insertions(+), 16 deletions(-)

diff --git a/include/kunit/test.h b/include/kunit/test.h
index d958ee53050e..9766403afd56 100644
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
index d2bfa331a2b1..587b5c51db58 100644
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
2.51.0.261.g7ce5a0a67e-goog

