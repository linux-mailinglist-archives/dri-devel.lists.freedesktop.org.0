Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D044BB800
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 12:25:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD1DE10EBFD;
	Fri, 18 Feb 2022 11:25:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C866710EB22;
 Fri, 18 Feb 2022 11:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645183531; x=1676719531;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QAPa0af4DwpoqnGDk55egacoHqBbkWb9NMuN0UH2KBg=;
 b=OwyWE0xJuDJtH7YM/4muJZZUwSF3haRgwQlx0Rq5ZuFWiCz8cK8Lt3hc
 i82sySKznZu25/qn6GG7ter7TZu84it2kwIxhN1bkhueqNgf61P70Sl+j
 fmw8PG3Er7f/D0K9WFItv/U9HK4f2kUJ24HKRZQOW36buZrfdKu7MxZwE
 uJqr8YpofXxwY/yjy8NFMBkUiyEIcoNVdAQEkZ8FdMxctxZlVNCkp7cy1
 ovSJZSb8kgDCyHxpbju0MN7N+2vOkOiM8kj0LZBLQ/frfbsObiD5NCJLy
 4e8P/NGk5DdHX9lEBgunCJU2y+oiUf7Fnx6jLQw1btullYlQN5WdQdDOp A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10261"; a="238512855"
X-IronPort-AV: E=Sophos;i="5.88,378,1635231600"; d="scan'208";a="238512855"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2022 03:25:31 -0800
X-IronPort-AV: E=Sophos;i="5.88,378,1635231600"; d="scan'208";a="705344771"
Received: from jawiblin-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.23.195])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2022 03:25:29 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/2] drm/doc: remove rfc section for dg1
Date: Fri, 18 Feb 2022 11:22:41 +0000
Message-Id: <20220218112242.2117968-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220218112242.2117968-1-matthew.auld@intel.com>
References: <20220218112242.2117968-1-matthew.auld@intel.com>
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Jordan Justen <jordan.l.justen@intel.com>, dri-devel@lists.freedesktop.org,
 Kenneth Graunke <kenneth@whitecape.org>,
 Jon Bloomfield <jon.bloomfield@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, mesa-dev@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We already completed the steps for this.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Jon Bloomfield <jon.bloomfield@intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Jordan Justen <jordan.l.justen@intel.com>
Cc: Kenneth Graunke <kenneth@whitecape.org>
Cc: mesa-dev@lists.freedesktop.org
---
 Documentation/gpu/rfc/i915_gem_lmem.rst | 22 ----------------------
 Documentation/gpu/rfc/index.rst         |  4 ----
 2 files changed, 26 deletions(-)
 delete mode 100644 Documentation/gpu/rfc/i915_gem_lmem.rst

diff --git a/Documentation/gpu/rfc/i915_gem_lmem.rst b/Documentation/gpu/rfc/i915_gem_lmem.rst
deleted file mode 100644
index b421a3c1806e..000000000000
--- a/Documentation/gpu/rfc/i915_gem_lmem.rst
+++ /dev/null
@@ -1,22 +0,0 @@
-=========================
-I915 DG1/LMEM RFC Section
-=========================
-
-Upstream plan
-=============
-For upstream the overall plan for landing all the DG1 stuff and turning it for
-real, with all the uAPI bits is:
-
-* Merge basic HW enabling of DG1(still without pciid)
-* Merge the uAPI bits behind special CONFIG_BROKEN(or so) flag
-        * At this point we can still make changes, but importantly this lets us
-          start running IGTs which can utilize local-memory in CI
-* Convert over to TTM, make sure it all keeps working. Some of the work items:
-        * TTM shrinker for discrete
-        * dma_resv_lockitem for full dma_resv_lock, i.e not just trylock
-        * Use TTM CPU pagefault handler
-        * Route shmem backend over to TTM SYSTEM for discrete
-        * TTM purgeable object support
-        * Move i915 buddy allocator over to TTM
-* Send RFC(with mesa-dev on cc) for final sign off on the uAPI
-* Add pciid for DG1 and turn on uAPI for real
diff --git a/Documentation/gpu/rfc/index.rst b/Documentation/gpu/rfc/index.rst
index 91e93a705230..018a8bf317a6 100644
--- a/Documentation/gpu/rfc/index.rst
+++ b/Documentation/gpu/rfc/index.rst
@@ -16,10 +16,6 @@ host such documentation:
 * Once the code has landed move all the documentation to the right places in
   the main core, helper or driver sections.
 
-.. toctree::
-
-    i915_gem_lmem.rst
-
 .. toctree::
 
     i915_scheduler.rst
-- 
2.34.1

