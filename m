Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E505252CEF2
	for <lists+dri-devel@lfdr.de>; Thu, 19 May 2022 11:08:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A0F211B10C;
	Thu, 19 May 2022 09:08:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3139311B10A;
 Thu, 19 May 2022 09:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652951290; x=1684487290;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0xMDQtQGJ+FfAUAs2u09CRxw3TSIFBE6975ph2A1Oz8=;
 b=EEJqiqRv5Hg9YVtBkwwJWFyC1/2IR5L6GK/gcVLQ5Dn/RoZhxFanKsZl
 qaY7UowAc+WLFwOpMTybgyCGZ44AWgmuSqIaY3yH54a2UA9/9pgGqmnEC
 Wkk5Ji1j73vBXAhu0vV0q1XcjXa4uI4JTLAypiHqtYLR630y5ncRekHW+
 x4WeGOcdbaLS8FJtp5xS12wIe0M0oQjCcMgakKhtVj/s+1TYsaJ79tLt4
 nRGqzANK64AsE46bVyoXL2KAQPsS8l4reGn1abLWT3eUyEk/egJzX1g3W
 bz2JuCdXortFft1gZ62eHZFJ+4wrbxHuMwJ8VMfhkFiLMazZ+4BEPWyLX Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10351"; a="358511879"
X-IronPort-AV: E=Sophos;i="5.91,237,1647327600"; d="scan'208";a="358511879"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2022 02:08:08 -0700
X-IronPort-AV: E=Sophos;i="5.91,237,1647327600"; d="scan'208";a="639699249"
Received: from wangyaqi-mobl.ger.corp.intel.com (HELO tursulin-mobl2.home)
 ([10.213.199.90])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2022 02:08:07 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Subject: [PATCH 0/7] Revert some refactoring patches
Date: Thu, 19 May 2022 10:07:55 +0100
Message-Id: <20220519090802.1294691-1-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.32.0
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
Cc: dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

As agreed on the mailing list and between the maintainers more consensus is
needed on the topic.

Tvrtko Ursulin (7):
  Revert "drm/i915: Drop has_psr from device info"
  Revert "drm/i915: Drop has_dp_mst from device info"
  Revert "drm/i915: Drop has_ddi from device info"
  Revert "drm/i915: Drop has_logical_ring_elsq from device info"
  Revert "drm/i915: Drop has_reset_engine from device info"
  Revert "drm/i915: Drop has_rc6 from device info"
  Revert "drm/i915: Drop has_gt_uc from device info"

 drivers/gpu/drm/i915/gt/intel_reset.c    |  2 +-
 drivers/gpu/drm/i915/i915_drv.h          | 16 ++++++-------
 drivers/gpu/drm/i915/i915_gpu_error.c    |  2 +-
 drivers/gpu/drm/i915/i915_pci.c          | 29 +++++++++++++++++++++++-
 drivers/gpu/drm/i915/intel_device_info.h |  7 ++++++
 5 files changed, 44 insertions(+), 12 deletions(-)

-- 
2.32.0

