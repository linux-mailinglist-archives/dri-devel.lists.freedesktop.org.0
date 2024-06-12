Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E819051F8
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2024 14:04:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B45A710E82C;
	Wed, 12 Jun 2024 12:03:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VtMzBTC5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C6FA10E276
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 12:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718193832; x=1749729832;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bzBWx7PF6e24gi9jQzZ1aVEazA9aULLVCr0z6J1RS24=;
 b=VtMzBTC5Vyift2K1HvTvaiHK27RnXHQuDK07WyySahVZGNBT21o2B0Vf
 0kiMQ4A92AOfIrSqW0sVInaRabJs1VVogr4oURdjcy/AFaFqrZw/WA6aW
 Hd89CQyYrN+H6vCe54PoOfB2qx82GnGNoV3p3bG9N3Os+mD3D+PyX8Rku
 qIx4q4vZi42dLHjlAvkVFKldJ0dkrAwmGGwDFbvqwbpg0o+oGT8j0wVG3
 OWOe2JGaH3PJNnBHTnp7jDcCMun7ta9IVTTrIanNZDYarFNaVxLcr1rBa
 O73326B8Cg+xRMjb93ZEdY9CAacHy+/quhOnn6w/l2aAa+ong4ONpIjRC g==;
X-CSE-ConnectionGUID: zXfZMX1XSBaec5zxTxR3TA==
X-CSE-MsgGUID: LGSYhNinRoWQhGffoaVfUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11100"; a="15077632"
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; d="scan'208";a="15077632"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 05:03:52 -0700
X-CSE-ConnectionGUID: q/Ffuy8jQBWchm5SmdibTg==
X-CSE-MsgGUID: rMop5fv5Q8qPWdcs2im0Gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; d="scan'208";a="70574121"
Received: from fpallare-mobl3.ger.corp.intel.com (HELO
 kdrobnik-desk.toya.net.pl) ([10.245.245.214])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 05:03:49 -0700
From: Karolina Stolarek <karolina.stolarek@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Amaranath Somalapuram <asomalap@amd.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Karolina Stolarek <karolina.stolarek@intel.com>
Subject: [PATCH v14 10/12] drm/ttm/tests: Add TODO file
Date: Wed, 12 Jun 2024 14:03:04 +0200
Message-Id: <3856fbbeaf40078d59b45971002b8f9d0d85f8f0.1718192625.git.karolina.stolarek@intel.com>
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

