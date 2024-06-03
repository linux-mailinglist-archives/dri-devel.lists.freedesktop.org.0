Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 408618D841C
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2024 15:37:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4647010E3C6;
	Mon,  3 Jun 2024 13:37:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RklOp+hj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7635410E3C8
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2024 13:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717421817; x=1748957817;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bzBWx7PF6e24gi9jQzZ1aVEazA9aULLVCr0z6J1RS24=;
 b=RklOp+hjjNPX+bX1K5solSP+OdET8v3yfUSkmV/wnQTtVuQdwMUgChzn
 W1tWXS6tR66F9DUyRbEqcxK/5bJ1IsB0+EVILizGi68glrNfMXMlVbeo7
 Gf+hbwsJFtyDmuK1+JBsyZj1lTW3Gm9kJupzRN9wTqaH9lNy1F7MUaDRb
 xhXGRQp33piPdUDSo1aPWyY7gnmh39AJ9S81KfJDkAM/UcAVa1GKm+Htt
 i69wqDO7BnZHQppoM8vOb4If7DO7k0hSDlPz5j/Fh7aGIaLnjOZMiiatb
 8DFBgwTkqYDdie2vLlVPrkO0I24xZIf0JEYVlaa4JdOyebjz/aZyz9p1m w==;
X-CSE-ConnectionGUID: kfsuYNo8Tnyzta/c5FOtvQ==
X-CSE-MsgGUID: A3QaLgbVTj61uassf673kA==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="17752554"
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; d="scan'208";a="17752554"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2024 06:36:56 -0700
X-CSE-ConnectionGUID: gmIVzQD0SX2v+xdCU0W11Q==
X-CSE-MsgGUID: dVK63TncQpSw8RfCLFWyFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; d="scan'208";a="36960111"
Received: from fpallare-mobl3.ger.corp.intel.com (HELO
 kdrobnik-desk.toya.net.pl) ([10.245.245.157])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2024 06:36:54 -0700
From: Karolina Stolarek <karolina.stolarek@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Amaranath Somalapuram <asomalap@amd.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Karolina Stolarek <karolina.stolarek@intel.com>
Subject: [PATCH v13 10/12] drm/ttm/tests: Add TODO file
Date: Mon,  3 Jun 2024 15:36:13 +0200
Message-Id: <a27374b5da0d31f2b1cc3f7a4be6dd456a08624b.1717420597.git.karolina.stolarek@intel.com>
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

List improvements for the test suite with some notes.

Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/ttm/tests/TODO | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 drivers/gpu/drm/ttm/tests/TODO

diff --git a/drivers/gpu/drm/ttm/tests/TODO b/drivers/gpu/drm/ttm/tests/TODO
new file mode 100644
index 000000000000..45b03d184ccf
--- /dev/null
+++ b/drivers/gpu/drm/ttm/tests/TODO
@@ -0,0 +1,27 @@
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
+- Rewrite the mock manager: drop use_tt and manage mock memory using
+  drm_mm manager
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

