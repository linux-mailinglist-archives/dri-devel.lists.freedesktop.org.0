Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C61611D58
	for <lists+dri-devel@lfdr.de>; Sat, 29 Oct 2022 00:18:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 884F110E1F2;
	Fri, 28 Oct 2022 22:18:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD91D10E1F2
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Oct 2022 22:18:06 +0000 (UTC)
Received: from fews2.riseup.net (fews2-pn.riseup.net [10.0.1.84])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx1.riseup.net (Postfix) with ESMTPS id 4MzcPV0cgMzDqFC;
 Fri, 28 Oct 2022 22:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1666995486; bh=o+QznyhV3hIjjr8HLNlww/g7V5QGQpu6+kYN6wHY96s=;
 h=From:To:Cc:Subject:Date:From;
 b=mcMgNT5eZO9EjynIMSq4ViVA44gocxY8FJQDv1k6zofCNXOqWwXN7puzTam+FAfv8
 NUEEGkWt7TiMRBPZTgPotOD8jW/1D6sA7bpdSmIBazi4+cFA0u7Sn/uq6K4lcTXjDo
 hnG0eGof4NbG1ugrsqjGth9gKep6D/wufIZoK3Kk=
X-Riseup-User-ID: 84B3480913F1F914D1A1C52E14951CFE0F8957CA37B981EE12A82DD8D2519D67
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews2.riseup.net (Postfix) with ESMTPSA id 4MzcPQ0pflz1yZp;
 Fri, 28 Oct 2022 22:18:01 +0000 (UTC)
From: Arthur Grillo <arthurgrillo@riseup.net>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>,
 =?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [PATCH v5] drm/tests: Add back seed value information
Date: Fri, 28 Oct 2022 19:17:54 -0300
Message-Id: <20221028221755.340487-1-arthurgrillo@riseup.net>
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
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Daniel Latypov <dlatypov@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, melissa.srw@gmail.com,
 David Gow <davidgow@google.com>, andrealmeid@riseup.net,
 Arthur Grillo <arthurgrillo@riseup.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As reported by Michał the drm_mm and drm_buddy unit tests lost the
printk with seed value after they were refactored into KUnit.

Add kunit_info with seed value information to assure reproducibility.

Reported-by: Michał Winiarski <michal.winiarski@intel.com>
Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
---
v1->v2: https://lore.kernel.org/all/20221026211458.68432-1-arthurgrillo@riseup.net/
- Correct compilation issues
- Change tags order
- Remove useless line change
- Write commit message in imperative form
- Remove redundant message part
- Correct some grammars nits
- Correct checkpatch issues

v2->v3: https://lore.kernel.org/all/20221027142903.200169-1-arthurgrillo@riseup.net/
- Change .init to .suite_init
- Correct some grammars nits

v3->v4: https://lore.kernel.org/all/20221028141246.280079-1-arthurgrillo@riseup.net/
- Correct compilation issues

v4->v5: https://lore.kernel.org/all/20221028141715.290903-1-arthurgrillo@riseup.net/
- Change functions names from init_suite to suite_init
---
 drivers/gpu/drm/tests/drm_buddy_test.c | 6 ++++--
 drivers/gpu/drm/tests/drm_mm_test.c    | 8 ++++++--
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_buddy_test.c b/drivers/gpu/drm/tests/drm_buddy_test.c
index 62f69589a72d..f8ee714df396 100644
--- a/drivers/gpu/drm/tests/drm_buddy_test.c
+++ b/drivers/gpu/drm/tests/drm_buddy_test.c
@@ -726,11 +726,13 @@ static void drm_test_buddy_alloc_limit(struct kunit *test)
 	drm_buddy_fini(&mm);
 }
 
-static int drm_buddy_init_test(struct kunit *test)
+static int drm_buddy_suite_init(struct kunit_suite *suite)
 {
 	while (!random_seed)
 		random_seed = get_random_u32();
 
+	kunit_info(suite, "Testing DRM buddy manager, with random_seed=0x%x\n", random_seed);
+
 	return 0;
 }
 
@@ -746,7 +748,7 @@ static struct kunit_case drm_buddy_tests[] = {
 
 static struct kunit_suite drm_buddy_test_suite = {
 	.name = "drm_buddy",
-	.init = drm_buddy_init_test,
+	.suite_init = drm_buddy_suite_init,
 	.test_cases = drm_buddy_tests,
 };
 
diff --git a/drivers/gpu/drm/tests/drm_mm_test.c b/drivers/gpu/drm/tests/drm_mm_test.c
index c4b66eeae203..89f12d3b4a21 100644
--- a/drivers/gpu/drm/tests/drm_mm_test.c
+++ b/drivers/gpu/drm/tests/drm_mm_test.c
@@ -2209,11 +2209,15 @@ static void drm_test_mm_color_evict_range(struct kunit *test)
 	vfree(nodes);
 }
 
-static int drm_mm_init_test(struct kunit *test)
+static int drm_mm_suite_init(struct kunit_suite *suite)
 {
 	while (!random_seed)
 		random_seed = get_random_u32();
 
+	kunit_info(suite,
+		   "Testing DRM range manager, with random_seed=0x%x max_iterations=%u max_prime=%u\n",
+		   random_seed, max_iterations, max_prime);
+
 	return 0;
 }
 
@@ -2246,7 +2250,7 @@ static struct kunit_case drm_mm_tests[] = {
 
 static struct kunit_suite drm_mm_test_suite = {
 	.name = "drm_mm",
-	.init = drm_mm_init_test,
+	.suite_init = drm_mm_suite_init,
 	.test_cases = drm_mm_tests,
 };
 
-- 
2.37.3

