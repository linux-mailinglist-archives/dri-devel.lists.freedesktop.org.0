Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A09D26E00EB
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 23:31:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DD4610E9A0;
	Wed, 12 Apr 2023 21:31:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 096B810E997;
 Wed, 12 Apr 2023 21:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681335090; x=1712871090;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=34+XZlzmTgMGvPZpXUsLC3CMSnVjLLIA+EG/jjzhp0M=;
 b=l1em93w5wMh5zoGwE+TwVnhjNjBYAcqK5LjelVD0N5kyfH8Fzb+Kwxhk
 R81DTX7z20g8cocHpN2BlGfc5SsjVMMsrwEINBGLq81lbJI0yWmogd8LA
 kMtSKY2hqcOGG69FHFFC5Dyx+8SU1/8wFqqUxSwwFadlBMt0oiYBk1hOp
 xL/mwk845L7iBdVZOoXokOz35BI6jqiMefB82UbMDl0GehOxFJeHimldv
 zcO5F9ee9Yv/21OABtok2erpbA2XKFeJzA/jMKPBLyaT5MKOB9JKxUtIq
 ZERedBBKRBy1msbo1PhhI0aOfwiNGNWAVWg+vZbwpuM8+wpxrR90PFKmI A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="328142037"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="328142037"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 14:31:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="639389216"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="639389216"
Received: from zbiro-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.251.212.144])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 14:30:41 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: [PATCH v6 0/2] Hugepage manager and test for MTL
Date: Wed, 12 Apr 2023 23:30:06 +0200
Message-Id: <20230412213008.919630-1-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.39.2
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
Cc: Matthew Auld <matthew.auld@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, Andi Shyti <andi.shyti@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

just taking these patches over and respinning them, almost as
they were the last time, just did some trivial cosmetic.

Andi

Changelog
=========
v5 -> v6
 - Trivial variable declaration reordering

v4 -> v5
 - Reorder

v3 -> v4
 - Break mock subtest changes into separate patch.

v2 -> v3
 - Update igt_mock_ppgtt_64K with current behavior expectations.

v1 -> v2
 - Update igt_mock_ppgtt_huge_fill with current behavior expectations.

Jonathan Cavitt (2):
  drm/i915: Migrate platform-dependent mock hugepage selftests to live
  drm/i915: Use correct huge page manager for MTL

 .../gpu/drm/i915/gem/selftests/huge_pages.c   | 88 +++++++++++++++----
 drivers/gpu/drm/i915/gt/gen8_ppgtt.c          |  3 +-
 2 files changed, 71 insertions(+), 20 deletions(-)

-- 
2.39.2

