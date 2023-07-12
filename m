Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 795BA750AFF
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 16:29:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A87510E54E;
	Wed, 12 Jul 2023 14:29:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1070B10E54D
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 14:29:02 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 63BCF617FB;
 Wed, 12 Jul 2023 14:29:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C456FC433C8;
 Wed, 12 Jul 2023 14:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689172140;
 bh=ymDSmyQE+1VjD+F72bagnnqt4nfj752WMEBt5dK+Lf8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=S0R/RaIUJMVH5qRd3pz5jBpfJ9HajmRwajHprZjx4FJo8VuMyk11Gzoauc+8Oi1r5
 RQ2UbSV+xn9cGThw1Vao2W57lLkhyQA5D+CQOCbVK84AW8FxOjF2XPMX6RQ0DgjwZ/
 jKV5Jm9v78U1GUyTpweDIgXj88SVHlVaARwtMzRBsVrVADMtIDU84GljlX7E+QlKD/
 M8WW1BFb9+TmxctYDtMpsQodux4nSlCGfhhv0AErc+zZALvp5htxNuE03oT0aU6OeS
 PVEQdEhyiFBTAhYwcqHTsaMtAwz1NTuh8Jq+BpovEjAZnyOVOFAeo/LbbU5M+QGL+p
 e1LeC3DzwOAhA==
Received: from mchehab by mail.kernel.org with local (Exim 4.96)
 (envelope-from <mchehab@kernel.org>) id 1qJapt-003beq-1r;
 Wed, 12 Jul 2023 16:28:57 +0200
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: 
Subject: [PATCH RFC 2/2] drm: add documentation for drm_buddy_test kUnit test
Date: Wed, 12 Jul 2023 16:28:55 +0200
Message-Id: <0e5f68ab045965292fee1748254bf9b91db9039a.1689171160.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <cover.1689171160.git.mchehab@kernel.org>
References: <cover.1689171160.git.mchehab@kernel.org>
MIME-Version: 1.0
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
Cc: linux-kselftest@vger.kernel.org, "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Kees Cook <keescook@chromium.org>, Nikolai Kondrashov <spbnick@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>, "Darrick J. Wong" <djwong@kernel.org>,
 linux-doc@vger.kernel.org, Brendan Higgins <brendanhiggins@google.com>,
 Rae Moar <rmoar@google.com>, dri-devel@lists.freedesktop.org,
 Arthur Grillo <arthurgrillo@riseup.net>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>, mauro.chehab@intel.com,
 David Gow <davidgow@google.com>, Shuah Khan <skhan@linuxfoundation.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-kernel@vger.kernel.org, kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As an example for the new documentation tool, add a documentation
for drm_buddy_test.

I opted to place this on a completely different directory, in order
to make easier to test the feature with:

	$ make SPHINXDIRS="tests" htmldocs

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH RFC 0/2] at: https://lore.kernel.org/all/cover.1689171160.git.mchehab@kernel.org/

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
2.40.1

