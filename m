Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32BB6B2181A
	for <lists+dri-devel@lfdr.de>; Tue, 12 Aug 2025 00:17:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94A3510E56F;
	Mon, 11 Aug 2025 22:17:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="NAJuhIlw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f202.google.com (mail-qt1-f202.google.com
 [209.85.160.202])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9E6110E56E
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 22:17:55 +0000 (UTC)
Received: by mail-qt1-f202.google.com with SMTP id
 d75a77b69052e-4b08d73cc8cso134882151cf.0
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 15:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1754950674; x=1755555474;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=c1k/A69TckTlEbMn2yQThZDMwfxta59hKgkCx2fsjOU=;
 b=NAJuhIlwQrLnZad0uMcRymOVGR57pQVp5JpmtLnzPJ3vfrn1y9WwQZ+mG6XmPSDl82
 KavkG/XU6NuO54MwAiZKsUvlgzu81esCvUtwyD8Y5XmX6iqoI7ZkDwpMZnINoy2qFH8o
 tKLKS2BZBhrBlRCUUTqsSWphACfxuUnBnJqzYql+2KY9bfzTA7haGz54Xl3tqO5DUoLK
 8bEEoOk/LBndlpefXiPywhtcR9pVtv/3jexdZzapMJD3H6vipI7ASFxseoKNRctYQ2/F
 fHgAqIhx3umxUS2jdv+9KvgcsAYZRLBG+AqXjSV2j+ooODusnv4Yg5/OIVLvn/c0++my
 +vvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754950674; x=1755555474;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=c1k/A69TckTlEbMn2yQThZDMwfxta59hKgkCx2fsjOU=;
 b=Xy1LQrBhDVRt3NOcc9qhicyEiS7EJWrEqCutnCuFFsdsZTxnrMSO0U4fM+YsVjTFS2
 HDc6Wels+7rHVz+GNqNQNKbTbPVpxWNRLXiTlpZcKNA6jzvL1et+zy5RlR4kcdSLZtnY
 ZZCU1GPsGDY7i6B7B+M8GRbnQMMRit48kWa1d9u8OgzEn7aeEUXNRPD6suOCY42N/BPi
 aFt5CkDOLryFez0gHjmrT5iv04G0JXRtWsYsERkJVBDc0fo0IqXYbPq6x4KEs7qizt4N
 VS7sggv8bgRzWrQiPp8CQfN0VP+btZkWqJYO4k7LdhpIrkL0iPH0zh8W66QFUSKvZZfm
 FUJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXchacP/+ITjPLI7xeTSd2uovi6Ll+lH7s5ctUxiWD3OXm6RjTAYicM6oT6arcmK7V5VaKVIXZyK6c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzDgrIhNeVuyCLNTDcUcf7DkfARyAtT/AuErw4U9DVaMKW5dOO+
 eOhik3b3991U3zTgqYA5XcbtIwnkxPAnW/i62LGd0r2BAJIeWKm8cGCF5j6eUp2DI2tooZpS0/y
 UR98p6a6bRIDThA==
X-Google-Smtp-Source: AGHT+IG/qveeEReHM0gDJd2Ok+O/CFZMWEx9/kt8KnHeEQT3ZmM6/JD4IgQ+YGLJNJOK2u1VlEc+7OxU54BkFw==
X-Received: from qtbfd13.prod.google.com
 ([2002:a05:622a:4d0d:b0:4ab:b3a4:9650])
 (user=marievic job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:622a:18a6:b0:4ab:66c5:b265 with SMTP id
 d75a77b69052e-4b0ecaeac57mr23998721cf.0.1754950674545; 
 Mon, 11 Aug 2025 15:17:54 -0700 (PDT)
Date: Mon, 11 Aug 2025 22:17:35 +0000
In-Reply-To: <20250811221739.2694336-1-marievic@google.com>
Mime-Version: 1.0
References: <20250811221739.2694336-1-marievic@google.com>
X-Mailer: git-send-email 2.51.0.rc0.205.g4a044479a3-goog
Message-ID: <20250811221739.2694336-4-marievic@google.com>
Subject: [PATCH v2 3/7] kunit: Pass parameterized test context to
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

To enable more complex parameterized testing scenarios,
the generate_params() function needs additional context
beyond just the previously generated parameter. This patch
modifies the generate_params() function signature to
include an extra `struct kunit *test` argument, giving
test users access to the parameterized test context when
generating parameters.

The `struct kunit *test` argument was added as the first parameter
to the function signature as it aligns with the convention
of other KUnit functions that accept `struct kunit *test` first.
This also mirrors the "this" or "self" reference found
in object-oriented programming languages.

This patch also modifies xe_pci_live_device_gen_param()
in xe_pci.c and nthreads_gen_params() in kcsan_test.c
to reflect this signature change.

Signed-off-by: Marie Zhussupova <marievic@google.com>
---

Changes in v2:

- generate_params signature changes in
  xe_pci.c and kcsan_test.c were squashed
  into a single patch to avoid in-between
  breakages in the series.
- The comments and the commit message were changed to
  reflect the parameterized testing terminology. See
  the patch series cover letter change log for the
  definitions.

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
index 49a5e6c30c86..01b20702a5a2 100644
--- a/lib/kunit/test.c
+++ b/lib/kunit/test.c
@@ -695,7 +695,7 @@ int kunit_run_tests(struct kunit_suite *suite)
 			/* Get initial param. */
 			param_desc[0] = '\0';
 			/* TODO: Make generate_params try-catch */
-			curr_param = test_case->generate_params(NULL, param_desc);
+			curr_param = test_case->generate_params(&test, NULL, param_desc);
 			test_case->status = KUNIT_SKIPPED;
 			kunit_log(KERN_INFO, &test, KUNIT_SUBTEST_INDENT KUNIT_SUBTEST_INDENT
 				  "KTAP version 1\n");
@@ -726,7 +726,8 @@ int kunit_run_tests(struct kunit_suite *suite)
 
 				/* Get next param. */
 				param_desc[0] = '\0';
-				curr_param = test_case->generate_params(curr_param, param_desc);
+				curr_param = test_case->generate_params(&test, curr_param,
+									param_desc);
 			}
 			/*
 			 * TODO: Put into a try catch. Since we don't need suite->exit
-- 
2.51.0.rc0.205.g4a044479a3-goog

