Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F288C65A6
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2024 13:25:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3375B10E77C;
	Wed, 15 May 2024 11:25:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UUu/ybnI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0944810E77C
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 11:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715772312; x=1747308312;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gPrHO2rRiY9nEAm+psoIvKZsFaipz8sRuJN/V/38bf4=;
 b=UUu/ybnIIYcWjMPY9f9vwRCGfclGAv22G9zDKIrtcZFXWARL+t0C7EsI
 Ulbt1teuzAcdo0u76MqG8bHWDssTHi5lvPGzxutq2nRPJlgnC5Ze1Ea+Q
 j25bP8Hfp+VjHv9uTv//fAu8Rqfu3nIKFpPNYf0NuYQlIOq9Qhsw2GobT
 eAw7rZLaXNXXI2tbuFwOeJZ7rhE0zoWGp0HUbTckOCD5t4DlUAau9j9l2
 zxmnswTl6KqbJNXAXduwW9QiUYO/eV/+d5Qp8Qevta55yz6a+pC4ltxfI
 z5Jcd1WGqrrQx3Oj527m4ai0yjkg5Hd0I/Hcu7cskQfYZXc8XJjPZ0XCc A==;
X-CSE-ConnectionGUID: qe/APwYESYebW6KD01zAOw==
X-CSE-MsgGUID: /Yv+5oy6R7i3gCFeY3jLFg==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="22955401"
X-IronPort-AV: E=Sophos;i="6.08,161,1712646000"; d="scan'208";a="22955401"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2024 04:25:12 -0700
X-CSE-ConnectionGUID: sCvTdJ/sSM2lRxZzF+XqfQ==
X-CSE-MsgGUID: S0RT5ZKzTfmSBnEA92xJHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,161,1712646000"; d="scan'208";a="30955320"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO
 kdrobnik-desk.toya.net.pl) ([10.245.245.149])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2024 04:25:10 -0700
From: Karolina Stolarek <karolina.stolarek@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Amaranath Somalapuram <asomalap@amd.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Karolina Stolarek <karolina.stolarek@intel.com>
Subject: [PATCH v12 10/10] drm/ttm/tests: Add TODO file
Date: Wed, 15 May 2024 13:24:33 +0200
Message-Id: <251d347fa39ec123d4985481df8a4f7613ea8e02.1715767062.git.karolina.stolarek@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1715767062.git.karolina.stolarek@intel.com>
References: <cover.1715767062.git.karolina.stolarek@intel.com>
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

List improvements for the test suite with some notes.

Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
---
 drivers/gpu/drm/ttm/tests/TODO | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 drivers/gpu/drm/ttm/tests/TODO

diff --git a/drivers/gpu/drm/ttm/tests/TODO b/drivers/gpu/drm/ttm/tests/TODO
new file mode 100644
index 000000000000..b48d83b6166e
--- /dev/null
+++ b/drivers/gpu/drm/ttm/tests/TODO
@@ -0,0 +1,25 @@
+TODO
+=====
+
+- Add a test case where the only evictable BO is busy
+- Update eviction tests so they use parametrized "from" memory type
+- Improve mock manager's implementation, e.g. allocate a block of
+  dummy memory that can be used when testing page mapping functions
+- Suggestion: Add test cases with external BOs
+- Suggestion: randomize the number and size of tested buffers in
+  ttm_bo_validate()
+- Agree on the naming convention
+
+Notes and gotchas
+=================
+
+- These tests are built and run with a UML kernel, because
+  1) We are interested in hardware-independent testing
+  2) We don't want to have actual DRM devices interacting with TTM
+     at the same time as the test one. Getting these to work in
+     parallel would require some time (...and that's a "todo" in itself!)
+- Triggering ttm_bo_vm_ops callbacks from KUnit (i.e. kernel) might be
+  a challenge, but is worth trying. Look at selftests like
+  i915/gem/selftests/i915_gem_mman.c for inspiration
+- The test suite uses UML where ioremap() call returns NULL, meaning that
+  ttm_bo_ioremap() can't be tested, unless we find a way to stub it
-- 
2.34.1

