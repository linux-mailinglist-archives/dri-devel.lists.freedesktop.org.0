Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72FAD8D841D
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2024 15:37:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FFBC10E3CB;
	Mon,  3 Jun 2024 13:37:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LCn7GyUk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6E6710E3C3
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2024 13:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717421822; x=1748957822;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MuVse60a9pZ5ncm+yxHoq18+PbuzJHWbKXoE50naDS0=;
 b=LCn7GyUkfzBV9UAck5sdNhek2dz9nT7Bkb96Z2TwZnbGbQYfC3ds81Od
 DeG3iFuaaksR3bTYYfpDSyawbQue/uvmusbaBe/ai3cqIiajp9fIiOp2J
 jXOyrdZSVLvWhMZZuIOXsA2wxtnqtwgwLJF0eGMmx+PiMJsGXaTxA7J1l
 BCHUGX1QQCnb5scyXkhhCRe4STHfIqZzRCnnNedL7xjxS99Pji0iLeBUZ
 iSIHj14Vk5XyK+301pAetllXOp0BtGpjveFC2/Q4QLN6pWqVm5023ysYH
 w61y7WfJUjOF+8UNHHxvTlLEF1fztQQfhx9tYn7VLzfZvpPMCH3R3plH8 A==;
X-CSE-ConnectionGUID: 8efzQFjQTsCqiUi2E8qq6A==
X-CSE-MsgGUID: 2y7aWCsETO2SFUtkYQeatw==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="17752564"
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; d="scan'208";a="17752564"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2024 06:37:02 -0700
X-CSE-ConnectionGUID: AixOxbFTTi6ppOtlblcLQA==
X-CSE-MsgGUID: uSw6RP7HRA202ACvk6QiWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; d="scan'208";a="36960157"
Received: from fpallare-mobl3.ger.corp.intel.com (HELO
 kdrobnik-desk.toya.net.pl) ([10.245.245.157])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2024 06:37:00 -0700
From: Karolina Stolarek <karolina.stolarek@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Amaranath Somalapuram <asomalap@amd.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Karolina Stolarek <karolina.stolarek@intel.com>
Subject: [PATCH v13 12/12] drm/ttm/tests: Use u32 and u64 over uint*_t types
Date: Mon,  3 Jun 2024 15:36:15 +0200
Message-Id: <8fb9a48d16fc1790af99b47cf6cef67a26b904fd.1717420597.git.karolina.stolarek@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1717420597.git.karolina.stolarek@intel.com>
References: <cover.1717420597.git.karolina.stolarek@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Update the tests and helpers to use unsigned kernel types.

Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/ttm/tests/ttm_bo_test.c       | 12 ++++++------
 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c |  6 ++----
 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h |  4 ++--
 drivers/gpu/drm/ttm/tests/ttm_pool_test.c     |  2 +-
 drivers/gpu/drm/ttm/tests/ttm_resource_test.c | 16 ++++++++--------
 drivers/gpu/drm/ttm/tests/ttm_tt_test.c       | 12 ++++++------
 6 files changed, 25 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/ttm/tests/ttm_bo_test.c b/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
index b53483ce3570..aafc22664c5e 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
+++ b/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
@@ -237,7 +237,7 @@ static void ttm_bo_unreserve_basic(struct kunit *test)
 	struct ttm_place *place;
 	struct ttm_resource_manager *man;
 	unsigned int bo_prio = TTM_MAX_BO_PRIORITY - 1;
-	uint32_t mem_type = TTM_PL_SYSTEM;
+	u32 mem_type = TTM_PL_SYSTEM;
 	int err;
 
 	place = ttm_place_kunit_init(test, mem_type, 0);
@@ -278,7 +278,7 @@ static void ttm_bo_unreserve_pinned(struct kunit *test)
 	struct ttm_device *ttm_dev;
 	struct ttm_resource *res1, *res2;
 	struct ttm_place *place;
-	uint32_t mem_type = TTM_PL_SYSTEM;
+	u32 mem_type = TTM_PL_SYSTEM;
 	int err;
 
 	ttm_dev = kunit_kzalloc(test, sizeof(*ttm_dev), GFP_KERNEL);
@@ -322,7 +322,7 @@ static void ttm_bo_unreserve_bulk(struct kunit *test)
 	struct ttm_device *ttm_dev;
 	struct ttm_place *place;
 	struct dma_resv *resv;
-	uint32_t mem_type = TTM_PL_SYSTEM;
+	u32 mem_type = TTM_PL_SYSTEM;
 	unsigned int bo_priority = 0;
 	int err;
 
@@ -380,7 +380,7 @@ static void ttm_bo_put_basic(struct kunit *test)
 	struct ttm_resource *res;
 	struct ttm_device *ttm_dev;
 	struct ttm_place *place;
-	uint32_t mem_type = TTM_PL_SYSTEM;
+	u32 mem_type = TTM_PL_SYSTEM;
 	int err;
 
 	place = ttm_place_kunit_init(test, mem_type, 0);
@@ -495,7 +495,7 @@ static void ttm_bo_pin_unpin_resource(struct kunit *test)
 	struct ttm_resource *res;
 	struct ttm_device *ttm_dev;
 	struct ttm_place *place;
-	uint32_t mem_type = TTM_PL_SYSTEM;
+	u32 mem_type = TTM_PL_SYSTEM;
 	unsigned int bo_priority = 0;
 	int err;
 
@@ -546,7 +546,7 @@ static void ttm_bo_multiple_pin_one_unpin(struct kunit *test)
 	struct ttm_resource *res;
 	struct ttm_device *ttm_dev;
 	struct ttm_place *place;
-	uint32_t mem_type = TTM_PL_SYSTEM;
+	u32 mem_type = TTM_PL_SYSTEM;
 	unsigned int bo_priority = 0;
 	int err;
 
diff --git a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
index 48ab541f821f..c14cb2b48e68 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
+++ b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
@@ -42,8 +42,7 @@ static struct ttm_placement mock_placement = {
 	.placement = &mock2_place,
 };
 
-static struct ttm_tt *ttm_tt_simple_create(struct ttm_buffer_object *bo,
-					   uint32_t page_flags)
+static struct ttm_tt *ttm_tt_simple_create(struct ttm_buffer_object *bo, u32 page_flags)
 {
 	struct ttm_tt *tt;
 
@@ -202,8 +201,7 @@ struct ttm_buffer_object *ttm_bo_kunit_init(struct kunit *test,
 }
 EXPORT_SYMBOL_GPL(ttm_bo_kunit_init);
 
-struct ttm_place *ttm_place_kunit_init(struct kunit *test,
-				       uint32_t mem_type, uint32_t flags)
+struct ttm_place *ttm_place_kunit_init(struct kunit *test, u32 mem_type, u32 flags)
 {
 	struct ttm_place *place;
 
diff --git a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
index aa70b50e7640..c7da23232ffa 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
+++ b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
@@ -38,8 +38,8 @@ struct ttm_buffer_object *ttm_bo_kunit_init(struct kunit *test,
 					    struct ttm_test_devices *devs,
 					    size_t size,
 					    struct dma_resv *obj);
-struct ttm_place *ttm_place_kunit_init(struct kunit *test,
-				       uint32_t mem_type, uint32_t flags);
+struct ttm_place *ttm_place_kunit_init(struct kunit *test, u32 mem_type,
+				       u32 flags);
 void dummy_ttm_bo_destroy(struct ttm_buffer_object *bo);
 
 struct ttm_test_devices *ttm_test_devices_basic(struct kunit *test);
diff --git a/drivers/gpu/drm/ttm/tests/ttm_pool_test.c b/drivers/gpu/drm/ttm/tests/ttm_pool_test.c
index 9070ca43df53..5d4dc5b1c6d7 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_pool_test.c
+++ b/drivers/gpu/drm/ttm/tests/ttm_pool_test.c
@@ -48,7 +48,7 @@ static void ttm_pool_test_fini(struct kunit *test)
 }
 
 static struct ttm_tt *ttm_tt_kunit_init(struct kunit *test,
-					uint32_t page_flags,
+					u32 page_flags,
 					enum ttm_caching caching,
 					size_t size)
 {
diff --git a/drivers/gpu/drm/ttm/tests/ttm_resource_test.c b/drivers/gpu/drm/ttm/tests/ttm_resource_test.c
index b90523422d24..77be0942ab62 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_resource_test.c
+++ b/drivers/gpu/drm/ttm/tests/ttm_resource_test.c
@@ -11,8 +11,8 @@
 
 struct ttm_resource_test_case {
 	const char *description;
-	uint32_t mem_type;
-	uint32_t flags;
+	u32 mem_type;
+	u32 flags;
 };
 
 struct ttm_resource_test_priv {
@@ -47,7 +47,7 @@ static void ttm_resource_test_fini(struct kunit *test)
 
 static void ttm_init_test_mocks(struct kunit *test,
 				struct ttm_resource_test_priv *priv,
-				uint32_t mem_type, uint32_t flags)
+				u32 mem_type, u32 flags)
 {
 	size_t size = RES_SIZE;
 
@@ -60,7 +60,7 @@ static void ttm_init_test_mocks(struct kunit *test,
 
 static void ttm_init_test_manager(struct kunit *test,
 				  struct ttm_resource_test_priv *priv,
-				  uint32_t mem_type)
+				  u32 mem_type)
 {
 	struct ttm_device *ttm_dev = priv->devs->ttm_dev;
 	struct ttm_resource_manager *man;
@@ -112,7 +112,7 @@ static void ttm_resource_init_basic(struct kunit *test)
 	struct ttm_buffer_object *bo;
 	struct ttm_place *place;
 	struct ttm_resource_manager *man;
-	uint64_t expected_usage;
+	u64 expected_usage;
 
 	ttm_init_test_mocks(test, priv, params->mem_type, params->flags);
 	bo = priv->bo;
@@ -230,7 +230,7 @@ static void ttm_resource_manager_usage_basic(struct kunit *test)
 	struct ttm_buffer_object *bo;
 	struct ttm_place *place;
 	struct ttm_resource_manager *man;
-	uint64_t actual_usage;
+	u64 actual_usage;
 
 	ttm_init_test_mocks(test, priv, TTM_PL_SYSTEM, TTM_PL_FLAG_TOPDOWN);
 	bo = priv->bo;
@@ -268,7 +268,7 @@ static void ttm_sys_man_alloc_basic(struct kunit *test)
 	struct ttm_buffer_object *bo;
 	struct ttm_place *place;
 	struct ttm_resource *res;
-	uint32_t mem_type = TTM_PL_SYSTEM;
+	u32 mem_type = TTM_PL_SYSTEM;
 	int ret;
 
 	ttm_init_test_mocks(test, priv, mem_type, 0);
@@ -293,7 +293,7 @@ static void ttm_sys_man_free_basic(struct kunit *test)
 	struct ttm_buffer_object *bo;
 	struct ttm_place *place;
 	struct ttm_resource *res;
-	uint32_t mem_type = TTM_PL_SYSTEM;
+	u32 mem_type = TTM_PL_SYSTEM;
 
 	ttm_init_test_mocks(test, priv, mem_type, 0);
 	bo = priv->bo;
diff --git a/drivers/gpu/drm/ttm/tests/ttm_tt_test.c b/drivers/gpu/drm/ttm/tests/ttm_tt_test.c
index dd9bac7cb7b0..a8c76dbd6913 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_tt_test.c
+++ b/drivers/gpu/drm/ttm/tests/ttm_tt_test.c
@@ -11,8 +11,8 @@
 
 struct ttm_tt_test_case {
 	const char *description;
-	uint32_t size;
-	uint32_t extra_pages_num;
+	u32 size;
+	u32 extra_pages_num;
 };
 
 static const struct ttm_tt_test_case ttm_tt_init_basic_cases[] = {
@@ -41,9 +41,9 @@ static void ttm_tt_init_basic(struct kunit *test)
 	const struct ttm_tt_test_case *params = test->param_value;
 	struct ttm_buffer_object *bo;
 	struct ttm_tt *tt;
-	uint32_t page_flags = TTM_TT_FLAG_ZERO_ALLOC;
+	u32 page_flags = TTM_TT_FLAG_ZERO_ALLOC;
 	enum ttm_caching caching = ttm_cached;
-	uint32_t extra_pages = params->extra_pages_num;
+	u32 extra_pages = params->extra_pages_num;
 	int num_pages = params->size >> PAGE_SHIFT;
 	int err;
 
@@ -69,7 +69,7 @@ static void ttm_tt_init_misaligned(struct kunit *test)
 	struct ttm_buffer_object *bo;
 	struct ttm_tt *tt;
 	enum ttm_caching caching = ttm_cached;
-	uint32_t size = SZ_8K;
+	u32 size = SZ_8K;
 	int num_pages = (size + SZ_4K) >> PAGE_SHIFT;
 	int err;
 
@@ -211,7 +211,7 @@ static void ttm_tt_create_ttm_exists(struct kunit *test)
 }
 
 static struct ttm_tt *ttm_tt_null_create(struct ttm_buffer_object *bo,
-					 uint32_t page_flags)
+					 u32 page_flags)
 {
 	return NULL;
 }
-- 
2.34.1

