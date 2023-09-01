Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1694378F8BB
	for <lists+dri-devel@lfdr.de>; Fri,  1 Sep 2023 08:51:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 587C810E71D;
	Fri,  1 Sep 2023 06:51:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9B1F10E722
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Sep 2023 06:51:21 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1FEFC615FC;
 Fri,  1 Sep 2023 06:51:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80E76C433CB;
 Fri,  1 Sep 2023 06:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1693551080;
 bh=H4sFSXj77zJBbwgHv3uvGQNL4INzIL1GKSeiGgtyJZE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=O/foAS1iHLc7NlpoyULYIj8DhwN73TLQM0l/1fdvvxYSqkjxgdj1YdKsZhELBtVz2
 V7oe7FYnICAmNqlr/QKT3lhY5BBgiliI5XAhtiFvzX3tAszWCA2RTInqW0+/FKK07M
 cNW0GM4FMIAPGX/0Ri+sPLqehshti00hLbZSE3EokLarTyLREKV0cqyJCfB1vVgliR
 630QIbRtVSr4/23XwGvhoItXm7Apv6eV48oSGVUOqKMHvBqU9Os49/aDCigMYEXhoa
 5qfQa5hytp0Z3g9oUlPY5TromiV4u4zlpEwmEetqMWHFsglw+7P7SsEzsUOT+fUl0I
 rx3d0h8oAHEqA==
Received: from mchehab by mail.kernel.org with local (Exim 4.96)
 (envelope-from <mchehab@kernel.org>) id 1qbxzw-0012VE-23;
 Fri, 01 Sep 2023 08:51:16 +0200
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Subject: [PATCH 2/2] drm: add documentation for drm_buddy_test kUnit test
Date: Fri,  1 Sep 2023 08:51:06 +0200
Message-ID: <da7e150c65b85b414f2f9790e04442408678877d.1693550658.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1693550658.git.mchehab@kernel.org>
References: <cover.1693550658.git.mchehab@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, David Gow <davidgow@google.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koening@amd.com>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Arthur Grillo <arthurgrillo@riseup.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As an example for the new documentation tool, add a documentation
for drm_buddy_test.

I opted to place this on a completely different directory, in order
to make easier to test the feature with:

	$ make SPHINXDIRS="tests" htmldocs

Acked-by: Christian König <christian.koening@amd.com>
Reviewed-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 Documentation/index.rst                |  2 +-
 Documentation/tests/index.rst          |  6 ++++++
 Documentation/tests/kunit.rst          |  5 +++++
 drivers/gpu/drm/tests/drm_buddy_test.c | 12 ++++++++++++
 4 files changed, 24 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/tests/index.rst
 create mode 100644 Documentation/tests/kunit.rst

diff --git a/Documentation/index.rst b/Documentation/index.rst
index 9dfdc826618c..80a6ce14a61a 100644
--- a/Documentation/index.rst
+++ b/Documentation/index.rst
@@ -60,7 +60,7 @@ Various other manuals with useful information for all kernel developers.
    fault-injection/index
    livepatch/index
    rust/index
-
+   test/index
 
 User-oriented documentation
 ===========================
diff --git a/Documentation/tests/index.rst b/Documentation/tests/index.rst
new file mode 100644
index 000000000000..bfc39eb5c0aa
--- /dev/null
+++ b/Documentation/tests/index.rst
@@ -0,0 +1,6 @@
+========================
+Kunit documentation test
+========================
+
+.. toctree::
+   kunit
diff --git a/Documentation/tests/kunit.rst b/Documentation/tests/kunit.rst
new file mode 100644
index 000000000000..6ffc151988a0
--- /dev/null
+++ b/Documentation/tests/kunit.rst
@@ -0,0 +1,5 @@
+Kunit tests
+-----------
+
+.. include-test:: drivers/gpu/drm/tests/drm_buddy_test.c
+
diff --git a/drivers/gpu/drm/tests/drm_buddy_test.c b/drivers/gpu/drm/tests/drm_buddy_test.c
index 09ee6f6af896..dd6c5afd6cd6 100644
--- a/drivers/gpu/drm/tests/drm_buddy_test.c
+++ b/drivers/gpu/drm/tests/drm_buddy_test.c
@@ -737,6 +737,18 @@ static int drm_buddy_suite_init(struct kunit_suite *suite)
 	return 0;
 }
 
+/**
+ * KTEST_SUITE: set of tests for drm buddy alloc
+ * Scope: drm subsystem
+ * Mega feature: drm
+ * Feature: buddy_alloc
+ *
+ * KTEST_TEST: drm_test_buddy_alloc_%s
+ * Description: Run DRM buddy allocation %arg[1] test
+ *
+ * arg[1].values: limit, range, optimistic, smoke, pathological
+ */
+
 static struct kunit_case drm_buddy_tests[] = {
 	KUNIT_CASE(drm_test_buddy_alloc_limit),
 	KUNIT_CASE(drm_test_buddy_alloc_range),
-- 
2.41.0

