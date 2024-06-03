Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA478D841B
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2024 15:37:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F176010E3C3;
	Mon,  3 Jun 2024 13:37:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j9DeJ/kf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FFA910E3C3
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2024 13:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717421820; x=1748957820;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xLMwSn6XK+aB9rVtPTxAoFEK6qJnRJwyshTGx/nUdcU=;
 b=j9DeJ/kf/dTT4v/PVGUcK4LuUrDaqwlstO031sucZ+GXDBojJsZelAFA
 BuakFLXhMa/aF9bJQdp1a9RUz3Ki621cHu3zqJuoi5E8bCRig2gGB1rSw
 hx04ou6lTkuEBNtRrOGM/cEL+GOe2dow1UV4xiLMJr+fZycFy0sW8Lq7A
 nehfBqZXKficZTrJ9EaMqcl3ZkLMX6HgeNf14I+FjrPn7PDVEangyrV4P
 lsO1IpZVAh8UssnH+LeB6mTnXZuFONniLwOlZVNySp7H+1iBwfwGkirxu
 nKM/bWtKXJ170/7kDDPjlfvB8HjZ13iDkA7E6jMwn3r0Tw2qFE1qP65BN Q==;
X-CSE-ConnectionGUID: 8D2gxUNMQRalDkSDbyE0xQ==
X-CSE-MsgGUID: KxD48UYQS/y38JIR86qY3g==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="17752560"
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; d="scan'208";a="17752560"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2024 06:37:00 -0700
X-CSE-ConnectionGUID: A2qwOvHwTIGMVwpMZsMR1g==
X-CSE-MsgGUID: /W9Ny+wrQOO9AHP+2nHR2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; d="scan'208";a="36960136"
Received: from fpallare-mobl3.ger.corp.intel.com (HELO
 kdrobnik-desk.toya.net.pl) ([10.245.245.157])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2024 06:36:57 -0700
From: Karolina Stolarek <karolina.stolarek@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Amaranath Somalapuram <asomalap@amd.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Karolina Stolarek <karolina.stolarek@intel.com>
Subject: [PATCH v13 11/12] drm/ttm/tests: Correct modules' licenses
Date: Mon,  3 Jun 2024 15:36:14 +0200
Message-Id: <8b17b6bbbf298e692fd99906b3a01da27cb90b44.1717420597.git.karolina.stolarek@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1717420597.git.karolina.stolarek@intel.com>
References: <cover.1717420597.git.karolina.stolarek@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The test files are GPL and MIT, so update the definitions accordingly.

Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
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
index b6ea64488c77..48ab541f821f 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
+++ b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
@@ -308,4 +308,4 @@ void ttm_test_devices_fini(struct kunit *test)
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

