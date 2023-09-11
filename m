Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF0179A708
	for <lists+dri-devel@lfdr.de>; Mon, 11 Sep 2023 11:51:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E00C410E25A;
	Mon, 11 Sep 2023 09:51:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75B8B10E263
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Sep 2023 09:51:22 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id F0CF1CE11D9;
 Mon, 11 Sep 2023 09:51:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B657AC433CC;
 Mon, 11 Sep 2023 09:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1694425878;
 bh=n39qjqZdna7s4aCBSr+Q6tsGFUv34ZNjq8iqqrLVaKg=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=ZeoL1/kUHKOlVAzAFsVO97NPTxM/vmkW9yVfZFiR7o1ir8KqlTcCKnnGOvOxGMFA0
 1tcvRhd6AKrG1u0bppmbD9BDjzcPOunJoNxUTiz4Q2V7TBEjMbIUwr83faKGyMXaLP
 RWCayMzbaJakOFimPqacGJy2Ps06jwL00JapzLZv+FQp7ZVAIdAUSuby0PutrABk0F
 iIOW4oCXAx+nUV8YpDAvH4G6xX1m8EOLmU8J8gjzhwsE5dmpbaIfDgiaZhQawRObNh
 rI3rj8bGYwR/5+ICGViQHgSbv9/78FuSSPPotKUFxVpBvNa4K7L1kY2z/yFf+X1asy
 MZHABQZ8oeX+A==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 11 Sep 2023 11:51:06 +0200
Subject: [PATCH 2/2] drm/tests: Flag slow tests as such
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230911-kms-slow-tests-v1-2-d3800a69a1a1@kernel.org>
References: <20230911-kms-slow-tests-v1-0-d3800a69a1a1@kernel.org>
In-Reply-To: <20230911-kms-slow-tests-v1-0-d3800a69a1a1@kernel.org>
To: Brendan Higgins <brendan.higgins@linux.dev>, 
 David Gow <davidgow@google.com>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2575; i=mripard@kernel.org;
 h=from:subject:message-id; bh=n39qjqZdna7s4aCBSr+Q6tsGFUv34ZNjq8iqqrLVaKg=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCn/HvP+StiTeqav+O31b0s/Zr3nt3v7ospZ+nn9k8cXz
 v6TvxZ1uKOUhUGMi0FWTJElRth8SdypWa872fjmwcxhZQIZwsDFKQATcQpm+F+yMnequ1KKWpCB
 Y4tZ8Jnt2qoahce5T3wV/6Z/g/nwQ25GhoPChiud5wusvn6/eyu7H/+C9SdnvD4jsK+ielv13/s
 2T/kA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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
Cc: linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>,
 dri-devel@lists.freedesktop.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Kunit recently gained a speed attribute that allows to filter out slow
tests. A slow test is defined in the documentation as a test taking more
than a second to execute.

Let's flag the few tests that are doing so on my machine when running:

./tools/testing/kunit/kunit.py run --kunitconfig=drivers/gpu/drm/tests \
	--cross_compile aarch64-linux-gnu- --arch arm64

Suggested-by: David Gow <davidgow@google.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/tests/drm_buddy_test.c |  2 +-
 drivers/gpu/drm/tests/drm_mm_test.c    | 14 +++++++-------
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_buddy_test.c b/drivers/gpu/drm/tests/drm_buddy_test.c
index 09ee6f6af896..6f79cde2df55 100644
--- a/drivers/gpu/drm/tests/drm_buddy_test.c
+++ b/drivers/gpu/drm/tests/drm_buddy_test.c
@@ -742,7 +742,7 @@ static struct kunit_case drm_buddy_tests[] = {
 	KUNIT_CASE(drm_test_buddy_alloc_range),
 	KUNIT_CASE(drm_test_buddy_alloc_optimistic),
 	KUNIT_CASE(drm_test_buddy_alloc_pessimistic),
-	KUNIT_CASE(drm_test_buddy_alloc_smoke),
+	KUNIT_CASE_SLOW(drm_test_buddy_alloc_smoke),
 	KUNIT_CASE(drm_test_buddy_alloc_pathological),
 	{}
 };
diff --git a/drivers/gpu/drm/tests/drm_mm_test.c b/drivers/gpu/drm/tests/drm_mm_test.c
index 186b28dc7038..c1e662c2a76c 100644
--- a/drivers/gpu/drm/tests/drm_mm_test.c
+++ b/drivers/gpu/drm/tests/drm_mm_test.c
@@ -2228,23 +2228,23 @@ module_param(max_prime, uint, 0400);
 static struct kunit_case drm_mm_tests[] = {
 	KUNIT_CASE(drm_test_mm_init),
 	KUNIT_CASE(drm_test_mm_debug),
-	KUNIT_CASE(drm_test_mm_reserve),
-	KUNIT_CASE(drm_test_mm_insert),
-	KUNIT_CASE(drm_test_mm_replace),
-	KUNIT_CASE(drm_test_mm_insert_range),
+	KUNIT_CASE_SLOW(drm_test_mm_reserve),
+	KUNIT_CASE_SLOW(drm_test_mm_insert),
+	KUNIT_CASE_SLOW(drm_test_mm_replace),
+	KUNIT_CASE_SLOW(drm_test_mm_insert_range),
 	KUNIT_CASE(drm_test_mm_frag),
 	KUNIT_CASE(drm_test_mm_align),
 	KUNIT_CASE(drm_test_mm_align32),
 	KUNIT_CASE(drm_test_mm_align64),
-	KUNIT_CASE(drm_test_mm_evict),
+	KUNIT_CASE_SLOW(drm_test_mm_evict),
 	KUNIT_CASE(drm_test_mm_evict_range),
 	KUNIT_CASE(drm_test_mm_topdown),
 	KUNIT_CASE(drm_test_mm_bottomup),
 	KUNIT_CASE(drm_test_mm_lowest),
 	KUNIT_CASE(drm_test_mm_highest),
 	KUNIT_CASE(drm_test_mm_color),
-	KUNIT_CASE(drm_test_mm_color_evict),
-	KUNIT_CASE(drm_test_mm_color_evict_range),
+	KUNIT_CASE_SLOW(drm_test_mm_color_evict),
+	KUNIT_CASE_SLOW(drm_test_mm_color_evict_range),
 	{}
 };
 

-- 
2.41.0

