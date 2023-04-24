Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2F26ED2DF
	for <lists+dri-devel@lfdr.de>; Mon, 24 Apr 2023 18:53:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A952F10E1BF;
	Mon, 24 Apr 2023 16:53:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0967010E12B;
 Mon, 24 Apr 2023 16:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682355181; x=1713891181;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lrelvbpSPBU+yu/AZxYZ9qk6oA7YdCS3XT6jRlsixs8=;
 b=L0CWaWWqXzlC6jkyamNJXDCYkTOJ3oXE4HyIwfY8JGaaDYhGXN1BRZZR
 cfKlflI8Tr+xs+5musj5cJCavh/YDsFk6QVUaiS2QS7Mo3vA8Fn0wwabx
 2MOopB7AundBLEB2yChWlMpT0xSvZy+v5uw6E/9DW8DxSqmju/4Swl40+
 E0fKMsLeUXW2ibb5bnTodmwAP50AVIsSfINhgICsRjwrSUKOjuh8ASeCX
 ni4aGSfZ4K4oqKAN9GjMm4ULbj0ra6HekHnW2LYFfMORU7wjDHdWrdeFk
 /QOC0xemBBrifaRcX26huB+rzROfW2RMYM53NCjJu+Pe4m0vnVY84REng A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="335392396"
X-IronPort-AV: E=Sophos;i="5.99,223,1677571200"; d="scan'208";a="335392396"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2023 09:52:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="695836561"
X-IronPort-AV: E=Sophos;i="5.99,223,1677571200"; d="scan'208";a="695836561"
Received: from fyang16-desk.jf.intel.com ([10.24.96.243])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2023 09:52:58 -0700
From: fei.yang@intel.com
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 0/2] drm/i915/mtl: Add PTE encode functions
Date: Mon, 24 Apr 2023 09:54:05 -0700
Message-Id: <20230424165407.3584612-1-fei.yang@intel.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Fei Yang <fei.yang@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Fei Yang <fei.yang@intel.com>

Extract PTE patch from https://patchwork.freedesktop.org/series/116868/
to fix MTL boot issue caused by MOCS/PAT update.

Fei Yang (2):
  drm/i915/mtl: Add PTE encode function
  drm/i915/mtl: workaround coherency issue for Media

 drivers/gpu/drm/i915/display/intel_dpt.c  |  2 +-
 drivers/gpu/drm/i915/gem/i915_gem_pages.c |  5 ++-
 drivers/gpu/drm/i915/gt/gen8_ppgtt.c      | 45 +++++++++++++++++++----
 drivers/gpu/drm/i915/gt/intel_ggtt.c      | 36 ++++++++++++++++--
 drivers/gpu/drm/i915/gt/intel_gtt.h       | 13 ++++++-
 drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c | 13 +++++++
 drivers/gpu/drm/i915/gt/uc/intel_guc.c    |  7 ++++
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c |  6 +++
 8 files changed, 113 insertions(+), 14 deletions(-)

-- 
2.25.1

