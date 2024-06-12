Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C0709051FA
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2024 14:04:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F37510E276;
	Wed, 12 Jun 2024 12:04:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kagwmSml";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A03110E82C
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 12:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718193835; x=1749729835;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UGONY6WTQW4NQqn8nbWtQt3esky3lC/JKnfN1kUMxko=;
 b=kagwmSmlkV8hUi/4ElSZRGYgD+LmMMjuBXDOLDYzTC+lFeRnkVe/FQRI
 C2fhFk103MgwSbo2LUqGCgH+Pdy/2JAvWZXsY0lnazdsutwUM7YpjAZOF
 cYVISPpJEAEJkEdNNLg4Ps0+odIFH1tggxpj4dq2+2e58EVT+5jh4OEaj
 JvWXrPiLXB4fNOqTD6GiUxh1rTbYH0fNS1rY+FDbyNL1HzSD5DOfAmJKX
 rEdxQCJHP2l/rCcNk5NK3V6xwNtfEXRQAAeNCOA30OQ7WHPBXQNsOi9bY
 GFibMhMw95LI2B5v3rnl9rypVDt2UKXwkRmtxK9lVpab4QYORChKRoKpQ g==;
X-CSE-ConnectionGUID: ccIdHi/HTTCmcr/fEk1VKA==
X-CSE-MsgGUID: SWLjmQCmT8qElBpazn2W/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11100"; a="15077636"
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; d="scan'208";a="15077636"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 05:03:54 -0700
X-CSE-ConnectionGUID: eXJa9ziWQLamHI0MiqA6hg==
X-CSE-MsgGUID: mb3ZIxp7TvG4cGkd19Hj+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; d="scan'208";a="70574131"
Received: from fpallare-mobl3.ger.corp.intel.com (HELO
 kdrobnik-desk.toya.net.pl) ([10.245.245.214])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 05:03:52 -0700
From: Karolina Stolarek <karolina.stolarek@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Amaranath Somalapuram <asomalap@amd.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Karolina Stolarek <karolina.stolarek@intel.com>
Subject: [PATCH v14 11/12] drm/ttm/tests: Correct modules' licenses
Date: Wed, 12 Jun 2024 14:03:05 +0200
Message-Id: <54cd7289db67ec396b67ef48dbb45521d56ec03c.1718192625.git.karolina.stolarek@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1718192625.git.karolina.stolarek@intel.com>
References: <cover.1718192625.git.karolina.stolarek@intel.com>
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

The test files are GPL and MIT, so update the definitions accordingly.

Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/ttm/tests/ttm_bo_test.c       | 2 +-
 drivers/gpu/drm/ttm/tests/ttm_device_test.c   | 2 +-
 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c | 2 +-
 drivers/gpu/drm/ttm/tests/ttm_pool_test.c     | 2 +-
 drivers/gpu/drm/ttm/tests/ttm_resource_test.c | 2 +-
 drivers/gpu/drm/ttm/tests/ttm_tt_test.c       | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/ttm/tests/ttm_bo_test.c b/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
index ffcfe5e6709a..b53483ce3570 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
+++ b/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
@@ -627,4 +627,4 @@ static struct kunit_suite ttm_bo_test_suite = {
 
 kunit_test_suites(&ttm_bo_test_suite);
 
-MODULE_LICENSE("GPL");
+MODULE_LICENSE("GPL and additional rights");
diff --git a/drivers/gpu/drm/ttm/tests/ttm_device_test.c b/drivers/gpu/drm/ttm/tests/ttm_device_test.c
index 19eaff22e6ae..0f235a834ede 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_device_test.c
+++ b/drivers/gpu/drm/ttm/tests/ttm_device_test.c
@@ -209,4 +209,4 @@ static struct kunit_suite ttm_device_test_suite = {
 
 kunit_test_suites(&ttm_device_test_suite);
 
-MODULE_LICENSE("GPL");
+MODULE_LICENSE("GPL and additional rights");
diff --git a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
index 3163ba1e2ad5..9eec7e4441c3 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
+++ b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
@@ -303,4 +303,4 @@ void ttm_test_devices_fini(struct kunit *test)
 }
 EXPORT_SYMBOL_GPL(ttm_test_devices_fini);
 
-MODULE_LICENSE("GPL");
+MODULE_LICENSE("GPL and additional rights");
diff --git a/drivers/gpu/drm/ttm/tests/ttm_pool_test.c b/drivers/gpu/drm/ttm/tests/ttm_pool_test.c
index 4643f91c6bd5..9070ca43df53 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_pool_test.c
+++ b/drivers/gpu/drm/ttm/tests/ttm_pool_test.c
@@ -433,4 +433,4 @@ static struct kunit_suite ttm_pool_test_suite = {
 
 kunit_test_suites(&ttm_pool_test_suite);
 
-MODULE_LICENSE("GPL");
+MODULE_LICENSE("GPL and additional rights");
diff --git a/drivers/gpu/drm/ttm/tests/ttm_resource_test.c b/drivers/gpu/drm/ttm/tests/ttm_resource_test.c
index 67584058dadb..b90523422d24 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_resource_test.c
+++ b/drivers/gpu/drm/ttm/tests/ttm_resource_test.c
@@ -332,4 +332,4 @@ static struct kunit_suite ttm_resource_test_suite = {
 
 kunit_test_suites(&ttm_resource_test_suite);
 
-MODULE_LICENSE("GPL");
+MODULE_LICENSE("GPL and additional rights");
diff --git a/drivers/gpu/drm/ttm/tests/ttm_tt_test.c b/drivers/gpu/drm/ttm/tests/ttm_tt_test.c
index a9d75a33acaf..dd9bac7cb7b0 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_tt_test.c
+++ b/drivers/gpu/drm/ttm/tests/ttm_tt_test.c
@@ -398,4 +398,4 @@ static struct kunit_suite ttm_tt_test_suite = {
 
 kunit_test_suites(&ttm_tt_test_suite);
 
-MODULE_LICENSE("GPL");
+MODULE_LICENSE("GPL and additional rights");
-- 
2.34.1

