Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC9D37E31BF
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 00:59:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ACCA10E467;
	Mon,  6 Nov 2023 23:59:10 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BF1910E467;
 Mon,  6 Nov 2023 23:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699315147; x=1730851147;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MkGJuJFzqp9cn+Qvq7QjbV+10djutu3OuaiUQJDq68E=;
 b=kx6xVhsE5Ztjy0OCSR0M5ubGGk9okaHYFJh1aC3TYRPnnBQBXfi/823N
 Hgj03+/rud0gJNHmCLdKuVrckfZeqWlPwMNnm/B6TuHDXA87KOucpPbhS
 RTTZMvGRcpsR+UG1QNk/Zhs9NcJ7sOmOHrSOuqpeZcSg/Kdoia8zZ3PZ4
 2bHh9+Fexml/Wg0KEfL7K7yEP+zurQKKWFAE1LZVXYTgq/mx3MfIwk8PG
 kDIQwJ8rmh1qDJkNeVY/D2W0SP8+vovspfjxN1kbAzls2BrnLBilmUNjY
 r2hhvOtGYqMPpLv9tKyoO5nNJsLnCsG3bCFmeEEUeGSsBJiUgq0PetfOl A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="455871436"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; d="scan'208";a="455871436"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 15:59:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; 
   d="scan'208";a="3789317"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmviesa002.fm.intel.com with ESMTP; 06 Nov 2023 15:59:06 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 0/2] Selftest for FAST_REQUEST feature
Date: Mon,  6 Nov 2023 15:59:26 -0800
Message-ID: <20231106235929.454983-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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
Cc: John Harrison <John.C.Harrison@Intel.com>, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

Add a selftest to verify that the FAST_REQUEST mechanism (getting
errors back from fire-and-forget H2G commands) is functional.

Also fix up a potential false positive in the GuC hang selftest.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>


John Harrison (2):
  drm/i915/guc: Fix for potential false positives in GuC hang selftest
  drm/i915/guc: Add a selftest for FAST_REQUEST errors

 drivers/gpu/drm/i915/gt/uc/intel_guc.h        |   4 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c     |   9 ++
 drivers/gpu/drm/i915/gt/uc/selftest_guc.c     | 122 ++++++++++++++++++
 .../drm/i915/gt/uc/selftest_guc_hangcheck.c   |   2 +-
 4 files changed, 136 insertions(+), 1 deletion(-)

-- 
2.41.0

