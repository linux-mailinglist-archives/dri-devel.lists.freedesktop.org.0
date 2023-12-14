Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F71A8132D0
	for <lists+dri-devel@lfdr.de>; Thu, 14 Dec 2023 15:18:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3970B10E84F;
	Thu, 14 Dec 2023 14:18:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F25C910E2F0
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Dec 2023 14:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702563463; x=1734099463;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lnfbHyH4fufSw/MIZ5ZPCPQI2n70RtY2FZX8aLMC3RE=;
 b=W1beUlLd+wriIBBZbECBn8+7X8JmsFfT42XPq8mF828saE7Ex3U6GT01
 0SO1fQiW5DJDgAUTn8fuxpnJG/tjE5nFgFW+DiksvA0fZraC9yHpQaos1
 e1Q3yv8oSB0QUf/zKl/SYKu/JNC/X/KHb7pG2kEZeH59M0TNPJJv1zW15
 5ui75mEjLljEGxD5x/CwP4/zOsGMZUPjtsQKSBe1VEoRdWu1JDW5nuIO9
 YmH08CWhIKtToAq7a19Hr1ZqDLKcZ/yVMwg9JJHj0fQQZ0UCeOGmXTg37
 udCE/CC5fJ5PdZSgSqTnai+u5uPA4zfObTD5ojZ2E5y9ICvxhhVTPpvE/ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="1977756"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; 
   d="scan'208";a="1977756"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2023 06:17:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="777910733"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; d="scan'208";a="777910733"
Received: from kceranow-mobl.ger.corp.intel.com (HELO kdrobnik-desk.intel.com)
 ([10.213.24.253])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2023 06:17:34 -0800
From: Karolina Stolarek <karolina.stolarek@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v9 8/8] drm/ttm/tests: Add TODO file
Date: Thu, 14 Dec 2023 15:17:20 +0100
Message-Id: <8a1972cf6e75b34e0834d3ce4e060fbc7c37c463.1702552875.git.karolina.stolarek@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1702552875.git.karolina.stolarek@intel.com>
References: <cover.1702552875.git.karolina.stolarek@intel.com>
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
Cc: Amaranath Somalapuram <Amaranath.Somalapuram@amd.com>,
 Karolina Stolarek <karolina.stolarek@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
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

