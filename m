Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 280045EC172
	for <lists+dri-devel@lfdr.de>; Tue, 27 Sep 2022 13:33:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C9AF10E8E1;
	Tue, 27 Sep 2022 11:32:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1335210E8E1;
 Tue, 27 Sep 2022 11:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664278365; x=1695814365;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=UdxkMSfW7Vk+CxTA13dK1oBG83PcXRzEqhFBPTfBi6I=;
 b=NplV31hifq2bPQlxQx7KWRowAVjeuscSZh6nHOdTUAbXCmndw7E5sH3Z
 grcn3FoOcQ04OH+mrVWOfFmC2w5j29/q7J8Z5PfgjX9/eG37DcnvOSDEO
 J210qROlQiazBPa4e7ynBZzs2QLIDx+3/Y7DFEjpamMAcERWjs64IuDFK
 rXwV93Td0ug/VAnNcgiXw3Y8mXQF6HUXZgu0zmk4HycSnLyMthb++SE7/
 3w5JskDK85mPrpdZDEjQHNP9JO8KEmw4PuUU4sATG3xWjt/9L18MfJwFl
 RZahGKRg4UDyr6XboyRy4dGgBJ7XX2gfvN/VGJxtNaxOtwyyLp/6ayoc2 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="301269837"
X-IronPort-AV: E=Sophos;i="5.93,349,1654585200"; d="scan'208";a="301269837"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2022 04:32:44 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="683955582"
X-IronPort-AV: E=Sophos;i="5.93,349,1654585200"; d="scan'208";a="683955582"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.158])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2022 04:32:41 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 0/1] drm/i915: Add GEN12 RPSTAT reg to get CAGF
Date: Tue, 27 Sep 2022 17:05:28 +0530
Message-Id: <20220927113529.3646989-1-badal.nilawar@intel.com>
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
Cc: andi.shyti@intel.com, donhiatt@gmail.com, tvrtko.ursulin@intel.com,
 anshuman.gupta@intel.com, dri-devel@lists.freedesktop.org,
 ashutosh.dixit@intel.com, jon.ewins@intel.com, vinay.belgaumkar@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In this series added GEN12 RPSTAT (0x1381b4) to get Current Actual
Graphics frequency of GT

To review saperately the patch in this series split from 
https://patchwork.freedesktop.org/series/108156/#rev3 

Test-with: 20220927062839.2718582-1-ashutosh.dixit@intel.com

v2: Fix review comments (Ashutosh, Tvrtko)

Don Hiatt (1):
  drm/i915: Use GEN12 RPSTAT register

 drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c |  2 +-
 drivers/gpu/drm/i915/gt/intel_gt_regs.h       |  4 +++
 drivers/gpu/drm/i915/gt/intel_rps.c           | 32 +++++++++++++++++--
 drivers/gpu/drm/i915/gt/intel_rps.h           |  2 ++
 drivers/gpu/drm/i915/i915_pmu.c               |  3 +-
 5 files changed, 38 insertions(+), 5 deletions(-)

-- 
2.25.1

