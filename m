Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D270B886E93
	for <lists+dri-devel@lfdr.de>; Fri, 22 Mar 2024 15:30:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6EC91124FA;
	Fri, 22 Mar 2024 14:30:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GHniKLSL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D59561124F6
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Mar 2024 14:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711117815; x=1742653815;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lnfbHyH4fufSw/MIZ5ZPCPQI2n70RtY2FZX8aLMC3RE=;
 b=GHniKLSLaOtLkP7QMcNyydxa/tYi7eS4HzWkRRKlfL9ALKKX6esN2u5X
 e1Xpd3Xk+BS0HtbixounPOYnBWgUEb8tJqmrIagNjihb6Bcp1Uyg2TdBz
 OMLHmcszmX0ZKY/mgwX5XzBNTWT4dYBvRbvAKa5XgewE03pWs8GloPnNI
 6Zq37pXn1BQCE4v4qTUycrxADzSMFxR79oVa0pKYcYGrsmaGRSJsGrf2O
 otUbExAOLlgp34R+sDz+dz8BtfvK8l5Hu/oR8Z9ZZQksYYpMFXVWScLSW
 mDG3BVNTguoOo+K63U/TmaROi/82dhRAJEuCTM7+M8ZlWko17k9RbBBCL Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="6022824"
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; 
   d="scan'208";a="6022824"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 07:30:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; d="scan'208";a="19398551"
Received: from unknown (HELO kdrobnik-desk.toya.net.pl) ([10.245.245.72])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 07:30:13 -0700
From: Karolina Stolarek <karolina.stolarek@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Amaranath Somalapuram <Amaranath.Somalapuram@amd.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Karolina Stolarek <karolina.stolarek@intel.com>
Subject: [PATCH v10 8/9] drm/ttm/tests: Add TODO file
Date: Fri, 22 Mar 2024 15:29:57 +0100
Message-Id: <a2316277e89534a3582c202921bf342f54aba070.1711117249.git.karolina.stolarek@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1711117249.git.karolina.stolarek@intel.com>
References: <cover.1711117249.git.karolina.stolarek@intel.com>
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
 drivers/gpu/drm/ttm/tests/TODO | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 drivers/gpu/drm/ttm/tests/TODO

diff --git a/drivers/gpu/drm/ttm/tests/TODO b/drivers/gpu/drm/ttm/tests/TODO
new file mode 100644
index 000000000000..3095c3225cec
--- /dev/null
+++ b/drivers/gpu/drm/ttm/tests/TODO
@@ -0,0 +1,24 @@
+TODO
+=====
+
+- Add a test case where the only evictable BO is busy
+- Add tests for ttm_bo_vm_ops (that includes ttm_bo_kmap() testing)
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
+- We want to stick to running UML to provide hardware-independent testing
+- Triggering ttm_bo_vm_ops callbacks from KUnit (i.e. kernel) might be
+  a challenge, but it seems doable. Use selftests like
+  i915/gem/selftests/i915_gem_mman.c for inspiration
+- The test suite uses UML, so ioremap() returns NULL. Simply switching
+  to x86 won't solve the issue, because we also get NULL when trying to
+  remap RAM. This means that we can only test a part of ttm_bo_ioremap()
+  (helper called in ttm_bo_kmap() function)
-- 
2.34.1

