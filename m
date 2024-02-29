Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D1EB86C611
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 10:52:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51BF110E36C;
	Thu, 29 Feb 2024 09:52:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZV8w2Az4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EF8310E3CB
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 09:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709200374; x=1740736374;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=++RtXCv0QahvrnTP1wzbX9AM2P6d3AyhvaAle/cL5NM=;
 b=ZV8w2Az4jVQaoi1eZqqrQUiH2tNir0Ok7XiGKl/JkMr0Yy3/i1MfHJ24
 kIwoqzYgpa5SnzRkvkuRgUdS18XwdyHctrlZEAZcgR8/+/juSb+uvPqMy
 tUPJVsySXoYJv2pnvdUdFUNDb/afow6TVuDEUDAGoKAuoP+sLH+JxeLhP
 pnttThBF/AIvTr7IqG9mYc6gQDiLEVpctgkuY3GuuXK9MPhL9XB8EejTP
 /Qvp5JATlNVBs30e/2grolcshT2FDEg1MmT1jwK1CDvZLCfui08P22B50
 zJJdgKA94tP4GaaObVkWfFPj6S0/zYQp9U+vPhRfeK/C5s5eU1x7jCCXx g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="3539066"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="3539066"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 01:52:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; d="scan'208";a="12332235"
Received: from mhaehnex-mobl1.ger.corp.intel.com (HELO mwauld-mobl1.intel.com)
 ([10.252.3.131])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 01:52:51 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH] drm/tests/buddy: fix print format
Date: Thu, 29 Feb 2024 09:52:26 +0000
Message-ID: <20240229095225.242795-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.43.2
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

This will report a build warning once we have: 806cb2270237 ("kunit:
Annotate _MSG assertion variants with gnu printf specifiers").

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Fixes: c70703320e55 ("drm/tests/drm_buddy: add alloc_range_bias test")
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Cc: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/tests/drm_buddy_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tests/drm_buddy_test.c b/drivers/gpu/drm/tests/drm_buddy_test.c
index be2d9d7764be..484360c7e1f6 100644
--- a/drivers/gpu/drm/tests/drm_buddy_test.c
+++ b/drivers/gpu/drm/tests/drm_buddy_test.c
@@ -189,7 +189,7 @@ static void drm_test_buddy_alloc_range_bias(struct kunit *test)
 							      &allocated,
 							      DRM_BUDDY_RANGE_ALLOCATION),
 				       "buddy_alloc failed with bias(%x-%x), size=%u, ps=%u\n",
-				       bias_start, bias_end, size);
+				       bias_start, bias_end, size, ps);
 		bias_rem -= size;
 
 		/*
-- 
2.43.2

