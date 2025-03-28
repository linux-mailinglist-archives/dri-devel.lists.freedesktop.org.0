Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B04A75199
	for <lists+dri-devel@lfdr.de>; Fri, 28 Mar 2025 21:45:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D47E810EAC8;
	Fri, 28 Mar 2025 20:45:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n0IadDMb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9994D10EAC2;
 Fri, 28 Mar 2025 20:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743194716; x=1774730716;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NgOeWmxcx17U+0SDrHFurWizkHgYCt5SABFrWRa3j48=;
 b=n0IadDMbfipZmKcf8IjkES/GjrEUyMMlIJ+1Y1V/IyuUYuS/khpw8ZRQ
 HkVX9u/Ha9Su8ceOvDl9wclZ15PcDNASIW9NzTP0hkGAZT8bnETwHZMnb
 K5hHuRJW0v0WBfa1VtQvWacdS1UCEXBqUlj7gwp2acc4lRQpVMHMrvC3f
 5R5hVxnlbg+kdX2K3zHWAe1stCuAAxOKKADx5g5LAuSPt5TQgDf1sc/5A
 3bQJ5h6kDvck9C3ZHFwss+p7LCd+rW5YO9Y6oeXYheae2wsuCiKzska91
 bWi/qfP5SAn87RTn2BDpN5G2JNDbtGO74gLUgfTmvqYGkic9EwmW+GReY Q==;
X-CSE-ConnectionGUID: fCEBNIYdS6Wra1IRKGBqHQ==
X-CSE-MsgGUID: Q/mJ5MuzRSm8zkr9oxs9hA==
X-IronPort-AV: E=McAfee;i="6700,10204,11387"; a="55945074"
X-IronPort-AV: E=Sophos;i="6.14,284,1736841600"; d="scan'208";a="55945074"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 13:45:16 -0700
X-CSE-ConnectionGUID: XdwVFbcrR2SJctH0ap3azg==
X-CSE-MsgGUID: EeqMQgP/Tcq45rwuyErcSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,284,1736841600"; d="scan'208";a="156463078"
Received: from dut4086lnl.fm.intel.com ([10.105.10.92])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 13:45:16 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 joonas.lahtinen@linux.intel.com, matthew.brost@intel.com,
 jianxun.zhang@intel.com, shuicheng.lin@intel.com,
 dri-devel@lists.freedesktop.org, stuart.summers@intel.com
Subject: [PATCH 0/4] tests/intel/xe_vm: Add drm_xe_vm_get_property tests
Date: Fri, 28 Mar 2025 20:45:11 +0000
Message-ID: <20250328204515.158038-1-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add tests that exercise the new drm_xe_vm_get_property uapi,
specifically for ioctl input validation and for determining that
pagefaults are correctly tracked and returned by the reporter.

Signed-off-by: Jonathan Cavitt <joanthan.cavitt@intel.com>
Suggested-by: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Suggested-by: Matthew Brost <matthew.brost@intel.com>
Suggested-by: Zhang Jianxun <jianxun.zhang@intel.com>
Suggested-by: Stuart Summers <stuart.summers@intel.com>
CC: Shuicheng Lin <shuicheng.lin@intel.com>

Jonathan Cavitt (4):
  drm-uapi/xe: Declare xe_vm_get_property_ioctl
  lib/xe/xe_ioctl: Add xe_vm_get_property helper function
  tests/intel/xe_vm: Add DRM_IOCTL_XE_VM_GET_PROPERTY validation tests
  tests/intel/xe_vm: Test DRM_IOCTL_XE_VM_GET_PROPERTY fault reporting

 include/drm-uapi/xe_drm.h |  78 +++++++++++++
 lib/xe/xe_ioctl.c         |   5 +
 lib/xe/xe_ioctl.h         |   1 +
 tests/intel/xe_vm.c       | 240 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 324 insertions(+)

-- 
2.43.0

