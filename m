Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7976EC1B3CD
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 15:34:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28A4D10E7BB;
	Wed, 29 Oct 2025 14:34:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j+msEkrU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C32910E7BA;
 Wed, 29 Oct 2025 14:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761748480; x=1793284480;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wt0eYXlRY6MYhU7VbQ16BTzyfYi4rvvHwFp+kkk30DI=;
 b=j+msEkrU+aMy6HePLrdb+VwAh6MKnmQFaoaCc8qBlLYN6efiTJh/WZ5L
 pW9rx6egB4oNL4uhdG+4Ps1GTmAK9RMdG2ZB6HYHOLKcod4rWgofAEaQ3
 55PNX/I8ae7USdm1WCB4JWNQc+KDtUEPqozMgzqLj/FGP4HnFKu+k/XDe
 crGpC7gxFnVMek1pZFEU7Vii0QEDt1m7a/Ty6Bw2GuiFVEj6TaViHv5nQ
 TvZOsPzG61iauKyvZ7w02JOawVgoLjGs/j0a3XRGt7Ug9B6uG+ksILfpP
 L80+UlI8ZuChEH/e5YejW06hiavjPynZbmximENWrYVCJcyqW8E63uMTa g==;
X-CSE-ConnectionGUID: uzvH8OPRS+GhPxCX+ZrKJg==
X-CSE-MsgGUID: JuRSnTxTRTWMK+ff3j6b+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="75320217"
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; d="scan'208";a="75320217"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 07:34:40 -0700
X-CSE-ConnectionGUID: qH2rvyz3RpiIrYqmsNESqw==
X-CSE-MsgGUID: HiCxhD5eQqOfqONv+EwdKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; d="scan'208";a="185606422"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.187])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 07:34:35 -0700
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Subject: [PATCH v2] drm/buddy: Mark drm_test_buddy_fragmentation_performance
 test as slow
Date: Wed, 29 Oct 2025 15:33:14 +0100
Message-ID: <20251029143313.42630-2-krzysztof.niemiec@intel.com>
X-Mailer: git-send-email 2.45.2
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

Mark the newly introduced drm_test_buddy_fragmentation_performance test
as KUNIT_SPEED_SLOW, as it might take more than a second on some
systems.

Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15095
Signed-off-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Reviewed-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
---
 drivers/gpu/drm/tests/drm_buddy_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tests/drm_buddy_test.c b/drivers/gpu/drm/tests/drm_buddy_test.c
index 5f40b5343bd8..672423af7c17 100644
--- a/drivers/gpu/drm/tests/drm_buddy_test.c
+++ b/drivers/gpu/drm/tests/drm_buddy_test.c
@@ -876,7 +876,7 @@ static struct kunit_case drm_buddy_tests[] = {
 	KUNIT_CASE(drm_test_buddy_alloc_contiguous),
 	KUNIT_CASE(drm_test_buddy_alloc_clear),
 	KUNIT_CASE(drm_test_buddy_alloc_range_bias),
-	KUNIT_CASE(drm_test_buddy_fragmentation_performance),
+	KUNIT_CASE_SLOW(drm_test_buddy_fragmentation_performance),
 	{}
 };
 
-- 
2.45.2

