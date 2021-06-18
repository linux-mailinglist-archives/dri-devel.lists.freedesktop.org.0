Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2B13ACC3D
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jun 2021 15:32:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 961746EA08;
	Fri, 18 Jun 2021 13:32:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C85FF6EA08;
 Fri, 18 Jun 2021 13:32:01 +0000 (UTC)
IronPort-SDR: RCKIPr9U6S13nZ9cZpfyn5aSFdzJyvLptn6o1jEogO/PmZ9/1HIArJZAvyjb7syNm6fydBMe88
 Ohq0EXBisMXg==
X-IronPort-AV: E=McAfee;i="6200,9189,10018"; a="186931270"
X-IronPort-AV: E=Sophos;i="5.83,283,1616482800"; d="scan'208";a="186931270"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2021 06:32:01 -0700
IronPort-SDR: O/5Fab7CjsDFfJnGlkGmPVk4IQo016eePsD/2Gx91rr2BnVcWAcp2Gmu+wzHY6Lqc1sA4FwYaF
 VtN4STypUtDw==
X-IronPort-AV: E=Sophos;i="5.83,283,1616482800"; d="scan'208";a="479821220"
Received: from murphyke-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.213.237.184])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2021 06:31:59 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/2] drm/i915/selftests: add back the selftest() hook for the
 buddy
Date: Fri, 18 Jun 2021 14:31:49 +0100
Message-Id: <20210618133150.700375-1-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.3
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
 kernel test robot <lkp@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When we resurrected the selftest we forgot to add back the selftest()
hook, meaning the test is not currently run.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/selftests/i915_mock_selftests.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/selftests/i915_mock_selftests.h b/drivers/gpu/drm/i915/selftests/i915_mock_selftests.h
index 34e5caf38093..6759b56086fb 100644
--- a/drivers/gpu/drm/i915/selftests/i915_mock_selftests.h
+++ b/drivers/gpu/drm/i915/selftests/i915_mock_selftests.h
@@ -34,3 +34,4 @@ selftest(gtt, i915_gem_gtt_mock_selftests)
 selftest(hugepages, i915_gem_huge_page_mock_selftests)
 selftest(contexts, i915_gem_context_mock_selftests)
 selftest(memory_region, intel_memory_region_mock_selftests)
+selftest(buddy, i915_buddy_mock_selftests)
-- 
2.26.3

