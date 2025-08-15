Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89018B27E5A
	for <lists+dri-devel@lfdr.de>; Fri, 15 Aug 2025 12:36:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D6A910E92E;
	Fri, 15 Aug 2025 10:36:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="BzNChJA8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f202.google.com (mail-qt1-f202.google.com
 [209.85.160.202])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0A6B10E92B
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Aug 2025 10:36:16 +0000 (UTC)
Received: by mail-qt1-f202.google.com with SMTP id
 d75a77b69052e-4b109be41a1so75372531cf.2
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Aug 2025 03:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1755254176; x=1755858976;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=BONUnu1NKFOsWRPuaKEG6QiZAgg+IitETz5ddIXNoOc=;
 b=BzNChJA821XPhUcXH3G5kjoM4JdqqIyb6/lRlZWj63XSrfcstLwbNTZ9KD4a4eNaPK
 eYtYx+TW3HaA8RxaBulNeTUbAFrO0taQZS5g1AdIn7qTcVqoQm6/E6xYPEBGR2jfV1ri
 TpBBoCLp62rkz56M2QkoGl+xD3RdZiyvza5RzJ0ER2m4NUVDVRZKeHg7QEguaThWHX2v
 61R9r3SOmNZxWKSKQDSegZtmgZlXMhc9TRyfYeRtcwSzE3U9KQwhUM1PL8VtARftdiBm
 fJL4Rrk23fRbvD5CWsM2nKunRH2SLQTGNRV91C0/iAoBfXvG7jJypb8UeBTZTGdwGraQ
 lpsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755254176; x=1755858976;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BONUnu1NKFOsWRPuaKEG6QiZAgg+IitETz5ddIXNoOc=;
 b=MVYN2xWWqu7A5MYD8HSZoh/Ec0ZvU3TThgMjfLxilDW1RgcRBQv7zzLBvUKUy+YUtI
 zfG8n1AJCMmuT9qqlpVISPE0YMaodDy6PVYObuofe3077TDxqkGuXDRo/y1qqiINiUo7
 27vSMuPVH+IYolHWyX7vejb+mRWyf4UieCfXML3BRWvxoznep/bZT815vLtPwhT9u7Qq
 SJuzp/34ynHTGU/J1LhsTkTPy2ve++HC8gGUwMXJetSGM9Fl5K6RVoN2tCErOvOVc+8D
 nadWPSna3tOHJOm5K97hUjpqx1i4WU2rg7M7RDyAHyjIb563Dqc5eon3wNmu1vsBzN4h
 8/qg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVw/wy91QNF0lnuY2FFKenr0SFCSTY6aaiyde+Dy6jQBMQut2q+YXbHmxZ5QlSEjzMfzrdGtUcMeeY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YybrsjdmPUDDr64gf5X2v5NM3hHYvDaF/AS0gJJHBHFeNHtXGf7
 aq4/eXJc7red/WlSA51S+u+GvIMJg9AHc6zLaI58073tQ/IC7zWQFIE82t3+AaZtx8/Fyw0g/ph
 Q3ju+CS3jW3Ppvw==
X-Google-Smtp-Source: AGHT+IEcA9mV3vSJ0s1QyQh2RxJ/dCmFXZLqK+CHWderFPKfVsCVEdy6IgdXgjKdrlUhFX5Rm47QMzQ9n3WdHQ==
X-Received: from qtbih3.prod.google.com ([2002:a05:622a:6a83:b0:4ae:75d2:c21])
 (user=marievic job=prod-delivery.src-stubby-dispatcher) by
 2002:ac8:590a:0:b0:4b0:8057:1de9 with SMTP id
 d75a77b69052e-4b11e125b21mr15990631cf.3.1755254175914; 
 Fri, 15 Aug 2025 03:36:15 -0700 (PDT)
Date: Fri, 15 Aug 2025 10:36:00 +0000
In-Reply-To: <20250815103604.3857930-1-marievic@google.com>
Mime-Version: 1.0
References: <20250815103604.3857930-1-marievic@google.com>
X-Mailer: git-send-email 2.51.0.rc1.167.g924127e9c0-goog
Message-ID: <20250815103604.3857930-4-marievic@google.com>
Subject: [PATCH v3 3/7] kunit: Pass parameterized test context to
 generate_params()
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

To enable more complex parameterized testing scenarios, the
generate_params() function needs additional context beyond just
the previously generated parameter. This patch modifies the
generate_params() function signature to include an extra
`struct kunit *test` argument, giving test users access to the
parameterized test context when generating parameters.

The `struct kunit *test` argument was added as the first parameter
to the function signature as it aligns with the convention of other
KUnit functions that accept `struct kunit *test` first. This also
mirrors the "this" or "self" reference found in object-oriented
programming languages.

This patch also modifies xe_pci_live_device_gen_param() in xe_pci.c
and nthreads_gen_params() in kcsan_test.c to reflect this signature
change.

Reviewed-by: David Gow <davidgow@google.com>
Reviewed-by: Rae Moar <rmoar@google.com>
Acked-by: Marco Elver <elver@google.com>
Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Marie Zhussupova <marievic@google.com>
---

Changes in v3:
v2: https://lore.kernel.org/all/20250811221739.2694336-4-marievic@google.com/
- Commit message formatting.

Changes in v2:
v1: https://lore.kernel.org/all/20250729193647.3410634-4-marievic@google.com/
    https://lore.kernel.org/all/20250729193647.3410634-5-marievic@google.com/
    https://lore.kernel.org/all/20250729193647.3410634-6-marievic@google.com/
- generate_params signature changes in xe_pci.c and kcsan_test.c were
  squashed into a single patch to avoid in-between breakages in the series.
- The comments and the commit message were changed to reflect the
  parameterized testing terminology. See the patch series cover letter
  change log for the definitions.

---
 drivers/gpu/drm/xe/tests/xe_pci.c | 2 +-
 include/kunit/test.h              | 9 ++++++---
 kernel/kcsan/kcsan_test.c         | 2 +-
 lib/kunit/test.c                  | 5 +++--
 4 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
index 1d3e2e50c355..62c016e84227 100644
--- a/drivers/gpu/drm/xe/tests/xe_pci.c
+++ b/drivers/gpu/drm/xe/tests/xe_pci.c
@@ -129,7 +129,7 @@ EXPORT_SYMBOL_IF_KUNIT(xe_pci_fake_device_init);
  * Return: pointer to the next &struct xe_device ready to be used as a parameter
  *         or NULL if there are no more Xe devices on the system.
  */
-const void *xe_pci_live_device_gen_param(const void *prev, char *desc)
+const void *xe_pci_live_device_gen_param(struct kunit *test, const void *prev, char *desc)
 {
 	const struct xe_device *xe = prev;
 	struct device *dev = xe ? xe->drm.dev : NULL;
diff --git a/include/kunit/test.h b/include/kunit/test.h
index d2e1b986b161..b527189d2d1c 100644
--- a/include/kunit/test.h
+++ b/include/kunit/test.h
@@ -128,7 +128,8 @@ struct kunit_attributes {
 struct kunit_case {
 	void (*run_case)(struct kunit *test);
 	const char *name;
-	const void* (*generate_params)(const void *prev, char *desc);
+	const void* (*generate_params)(struct kunit *test,
+				       const void *prev, char *desc);
 	struct kunit_attributes attr;
 	int (*param_init)(struct kunit *test);
 	void (*param_exit)(struct kunit *test);
@@ -1691,7 +1692,8 @@ do {									       \
  * Define function @name_gen_params which uses @array to generate parameters.
  */
 #define KUNIT_ARRAY_PARAM(name, array, get_desc)						\
-	static const void *name##_gen_params(const void *prev, char *desc)			\
+	static const void *name##_gen_params(struct kunit *test,				\
+					     const void *prev, char *desc)			\
 	{											\
 		typeof((array)[0]) *__next = prev ? ((typeof(__next)) prev) + 1 : (array);	\
 		if (__next - (array) < ARRAY_SIZE((array))) {					\
@@ -1712,7 +1714,8 @@ do {									       \
  * Define function @name_gen_params which uses @array to generate parameters.
  */
 #define KUNIT_ARRAY_PARAM_DESC(name, array, desc_member)					\
-	static const void *name##_gen_params(const void *prev, char *desc)			\
+	static const void *name##_gen_params(struct kunit *test,				\
+					     const void *prev, char *desc)			\
 	{											\
 		typeof((array)[0]) *__next = prev ? ((typeof(__next)) prev) + 1 : (array);	\
 		if (__next - (array) < ARRAY_SIZE((array))) {					\
diff --git a/kernel/kcsan/kcsan_test.c b/kernel/kcsan/kcsan_test.c
index c2871180edcc..fc76648525ac 100644
--- a/kernel/kcsan/kcsan_test.c
+++ b/kernel/kcsan/kcsan_test.c
@@ -1383,7 +1383,7 @@ static void test_atomic_builtins_missing_barrier(struct kunit *test)
  * The thread counts are chosen to cover potentially interesting boundaries and
  * corner cases (2 to 5), and then stress the system with larger counts.
  */
-static const void *nthreads_gen_params(const void *prev, char *desc)
+static const void *nthreads_gen_params(struct kunit *test, const void *prev, char *desc)
 {
 	long nthreads = (long)prev;
 
diff --git a/lib/kunit/test.c b/lib/kunit/test.c
index 917df2e1688d..ac8fa8941a6a 100644
--- a/lib/kunit/test.c
+++ b/lib/kunit/test.c
@@ -700,7 +700,7 @@ int kunit_run_tests(struct kunit_suite *suite)
 			/* Get initial param. */
 			param_desc[0] = '\0';
 			/* TODO: Make generate_params try-catch */
-			curr_param = test_case->generate_params(NULL, param_desc);
+			curr_param = test_case->generate_params(&test, NULL, param_desc);
 			test_case->status = KUNIT_SKIPPED;
 			kunit_log(KERN_INFO, &test, KUNIT_SUBTEST_INDENT KUNIT_SUBTEST_INDENT
 				  "KTAP version 1\n");
@@ -731,7 +731,8 @@ int kunit_run_tests(struct kunit_suite *suite)
 
 				/* Get next param. */
 				param_desc[0] = '\0';
-				curr_param = test_case->generate_params(curr_param, param_desc);
+				curr_param = test_case->generate_params(&test, curr_param,
+									param_desc);
 			}
 			/*
 			 * TODO: Put into a try catch. Since we don't need suite->exit
-- 
2.51.0.rc1.167.g924127e9c0-goog

