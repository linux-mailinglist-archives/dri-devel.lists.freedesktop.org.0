Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC294503D2
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 12:53:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D6486E043;
	Mon, 15 Nov 2021 11:53:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CC9A6E043;
 Mon, 15 Nov 2021 11:53:20 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10168"; a="230886132"
X-IronPort-AV: E=Sophos;i="5.87,236,1631602800"; d="scan'208";a="230886132"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2021 03:53:19 -0800
X-IronPort-AV: E=Sophos;i="5.87,236,1631602800"; d="scan'208";a="505891401"
Received: from csrini4x-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.251.218.37])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2021 03:53:17 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 0/3] drm/i915, agp/intel-ggt: clean up includes
Date: Mon, 15 Nov 2021 13:53:10 +0200
Message-Id: <cover.1636977089.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: jani.nikula@intel.com, Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Took Andy's patch [1] and expanded on it a bit.

BR,
Jani.


[1] https://patchwork.freedesktop.org/patch/msgid/20211110102857.59604-1-andriy.shevchenko@linux.intel.com

Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Andy Shevchenko (1):
  agp/intel-gtt: Replace kernel.h with the necessary inclusions

Jani Nikula (2):
  drm/i915: include intel-gtt.h only where needed
  agp/intel-gtt: reduce intel-gtt dependencies more

 drivers/char/agp/intel-gtt.c         | 1 +
 drivers/gpu/drm/i915/gt/intel_ggtt.c | 2 ++
 drivers/gpu/drm/i915/gt/intel_gt.c   | 2 ++
 drivers/gpu/drm/i915/i915_drv.h      | 1 -
 include/drm/intel-gtt.h              | 8 +++++---
 5 files changed, 10 insertions(+), 4 deletions(-)

-- 
2.30.2

