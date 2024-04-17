Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB9128A83B9
	for <lists+dri-devel@lfdr.de>; Wed, 17 Apr 2024 15:04:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D17141134D5;
	Wed, 17 Apr 2024 13:04:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CNuZz+Bi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 282A71134D2
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Apr 2024 13:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713359044; x=1744895044;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ncbtIHEUz6aymlfdeadHfkT8zgrpyE/0U+iOL05SdCU=;
 b=CNuZz+BiqQCLGAfIJH1QcmfGG6Dflb0iQGgBfKsULyYttb8HxuU1mvnQ
 Ac0B86yaEq0TlPiT9rlMAuWbfn6I1enZBE7L6ZctSJpsA+F0cKDuCc8+u
 jNq84adkfejcHLYlzQ9EIGguQ5ZLSf5nrWU+RGKT2rhaEDf7fz4mqueFm
 MKaW09ZQfKHCVEFGNCfdzrQFGyI8k7XgQm2ZxUFHz8nky8bXV9Hd+pEv+
 RCdhPwED4dWqEKo1X2JJjolneZvDRKmnYeaFTcEPGJnc/MquYzUjtNWoE
 H3ttBIH384w79yfjZWMqeQwCOWRgQWx69QSErWiHp/4qJAAGNq9xlTh2Y g==;
X-CSE-ConnectionGUID: ibHboLd+SyaH+YsuyosC9Q==
X-CSE-MsgGUID: lxCl8y5mTICHHGYXvfwX3g==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="20268337"
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; d="scan'208";a="20268337"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 06:04:04 -0700
X-CSE-ConnectionGUID: D0sPPiRLTSyBG1xARn6/Ww==
X-CSE-MsgGUID: GXcbh6prRpyLqR4feudl6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; d="scan'208";a="53569034"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO
 kdrobnik-desk.toya.net.pl) ([10.245.244.75])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 06:04:02 -0700
From: Karolina Stolarek <karolina.stolarek@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Amaranath Somalapuram <asomalap@amd.com>,
 Karolina Stolarek <karolina.stolarek@intel.com>
Subject: [PATCH v11 10/10] drm/ttm/tests: Add TODO file
Date: Wed, 17 Apr 2024 15:03:23 +0200
Message-Id: <af96920897379fa0cb10619bb35c22917b884ce4.1713357042.git.karolina.stolarek@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1713357042.git.karolina.stolarek@intel.com>
References: <cover.1713357042.git.karolina.stolarek@intel.com>
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
index 000000000000..b29d55167d56
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

