Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9740B46C0FC
	for <lists+dri-devel@lfdr.de>; Tue,  7 Dec 2021 17:52:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87DFFEBE9E;
	Tue,  7 Dec 2021 16:52:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 505CDEBE9C;
 Tue,  7 Dec 2021 16:52:17 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10190"; a="224882406"
X-IronPort-AV: E=Sophos;i="5.87,293,1631602800"; d="scan'208";a="224882406"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2021 08:52:16 -0800
X-IronPort-AV: E=Sophos;i="5.87,293,1631602800"; d="scan'208";a="611740112"
Received: from ramaling-i9x.iind.intel.com ([10.99.66.205])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2021 08:52:14 -0800
From: Ramalingam C <ramalingam.c@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH 0/4] Basic enabling of 64k page support
Date: Tue,  7 Dec 2021 22:21:52 +0530
Message-Id: <20211207165156.31244-1-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
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
Cc: Hellstrom Thomas <thomas.hellstrom@intel.com>, Andi <andi.shyti@intel.com>,
 Chris_intel_ID <chris.p.wilson@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Preparational patches for 64k page support.

Matthew Auld (3):
  drm/i915/xehpsdv: set min page-size to 64K
  drm/i915/gtt/xehpsdv: move scratch page to system memory
  drm/i915: enforce min page size for scratch

Stuart Summers (1):
  drm/i915: Add has_64k_pages flag

 drivers/gpu/drm/i915/gem/i915_gem_stolen.c  |  6 +++++-
 drivers/gpu/drm/i915/gt/gen6_ppgtt.c        |  1 +
 drivers/gpu/drm/i915/gt/gen8_ppgtt.c        | 23 +++++++++++++++++++--
 drivers/gpu/drm/i915/gt/intel_ggtt.c        |  3 +++
 drivers/gpu/drm/i915/gt/intel_gtt.c         | 14 ++++++++++++-
 drivers/gpu/drm/i915/gt/intel_gtt.h         |  2 ++
 drivers/gpu/drm/i915/gt/intel_region_lmem.c |  5 ++++-
 drivers/gpu/drm/i915/i915_drv.h             |  2 ++
 drivers/gpu/drm/i915/i915_pci.c             |  2 ++
 drivers/gpu/drm/i915/intel_device_info.h    |  1 +
 drivers/gpu/drm/i915/selftests/mock_gtt.c   |  2 ++
 11 files changed, 56 insertions(+), 5 deletions(-)

-- 
2.20.1

