Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC75646D56B
	for <lists+dri-devel@lfdr.de>; Wed,  8 Dec 2021 15:16:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 732816FEAA;
	Wed,  8 Dec 2021 14:16:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0061F6FEA6;
 Wed,  8 Dec 2021 14:16:32 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10191"; a="217861165"
X-IronPort-AV: E=Sophos;i="5.88,189,1635231600"; d="scan'208";a="217861165"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2021 06:16:32 -0800
X-IronPort-AV: E=Sophos;i="5.88,189,1635231600"; d="scan'208";a="516252122"
Received: from ramaling-i9x.iind.intel.com ([10.99.66.205])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2021 06:16:31 -0800
From: Ramalingam C <ramalingam.c@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH 0/4] drm/i915: Basic enabling of 64k page support
Date: Wed,  8 Dec 2021 19:46:09 +0530
Message-Id: <20211208141613.7251-1-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
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
Cc: Hellstrom Thomas <thomas.hellstrom@intel.com>
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
 drivers/gpu/drm/i915/i915_drv.h             |  8 +++++++
 drivers/gpu/drm/i915/i915_pci.c             |  2 ++
 drivers/gpu/drm/i915/intel_device_info.h    |  1 +
 drivers/gpu/drm/i915/selftests/mock_gtt.c   |  2 ++
 11 files changed, 62 insertions(+), 5 deletions(-)

-- 
2.20.1

