Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A8A56DCB81
	for <lists+dri-devel@lfdr.de>; Mon, 10 Apr 2023 21:25:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D12B110E0C5;
	Mon, 10 Apr 2023 19:25:49 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AE2110E0C5;
 Mon, 10 Apr 2023 19:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681154748; x=1712690748;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=v1bE4KrSONyhEiQO+BzQePccr9+MJLmzEu4za0y099U=;
 b=cX3mr8cohBtPzufZuoUWvvZ8JNoQgJ63es84dAH4noqxd3yty1dTSIfq
 p2kom8Y8EmUVp989Ft5cT5bxIW9Fm6u6MfV6nnPXlYI7OF6hcG7MYbrN3
 UFxEoaFGip5rlN139QcMR9++o7h4ggLOwQtkMUlMduQHJ4UhmbYPboZEe
 g5i7L4LuU7ThDPyQUCaWw2EGIMon19D/sYHpku3HmMJ82mlvHKIy4y+6g
 CSCmFxQGTlL5UHRhSJ05zKLwetiW7UYDavPvPWvDOJlaZkDsTmduVjKwj
 egtXvJi+88pueu7LiLfB2ti9RO6X4C5z+7Zn6lHEs3IuF/v9RTZaLpAsS Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="323797868"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; d="scan'208";a="323797868"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2023 12:25:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="638554241"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; d="scan'208";a="638554241"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orsmga003.jf.intel.com with ESMTP; 10 Apr 2023 12:25:43 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 0/2] Add support for dumping error captures via kernel logging
Date: Mon, 10 Apr 2023 12:25:21 -0700
Message-Id: <20230410192523.2020049-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.39.1
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

Sometimes, the only effective way to debug an issue is to dump all the
interesting information at the point of failure. So add support for
doing that.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>


John Harrison (2):
  drm/i915: Dump error capture to kernel log
  drm/i915/guc: Dump error capture to dmesg on CTB error

 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c |  53 +++++++++
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h |   6 +
 drivers/gpu/drm/i915/i915_gpu_error.c     | 130 ++++++++++++++++++++++
 drivers/gpu/drm/i915/i915_gpu_error.h     |   8 ++
 4 files changed, 197 insertions(+)

-- 
2.39.1

