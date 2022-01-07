Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 77ECA486E50
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jan 2022 01:06:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94EF310E4DA;
	Fri,  7 Jan 2022 00:06:30 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DC2510E4C8;
 Fri,  7 Jan 2022 00:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641513988; x=1673049988;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3cmYx+ZW2RJ0TeXY5Sh1cQoPCn0eaCgV9+x7Suf0yco=;
 b=F/ELU2qIGaqIKosOJeg7zhFHpmVcxmbNonwckKoTgL6c76YTNeA7BR/E
 K1bKjVo2RG53+GP2phxGI01eF+rhYR69kmMj4hNjySGut0D+d18dNBs04
 lc300xGnBmKd00R2IQV4X+3S4RVVrR8JrKzqI6Df8u45cjGLZya9CKGOI
 37ht0VpuDaaF4dhjzRWaZKPzLVNMMUhB8qOn7Tch+q3h2NuO7U1A9pCC9
 DDCz59Jm6YPExT/Kr+pf8EMtbzVufWZ2RIJp8/wMLmxBXaHLggFu71V8n
 AEyXlqi8LRehgWDpoYAKXTSlVi/0yfuC7rS9yYgoWJXqoMub2rZzIaneO Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10217"; a="306132698"
X-IronPort-AV: E=Sophos;i="5.88,268,1635231600"; d="scan'208";a="306132698"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2022 16:06:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,268,1635231600"; d="scan'208";a="489110646"
Received: from relo-linux-5.jf.intel.com ([10.165.21.134])
 by orsmga002.jf.intel.com with ESMTP; 06 Jan 2022 16:06:22 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH v2 0/3] Update to GuC version 69.0.3
Date: Thu,  6 Jan 2022 16:06:19 -0800
Message-Id: <20220107000622.292081-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.25.1
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

Update to the latest GuC version. This includes a suite of interface
changes and new features with corresponding i915 side changes.

v2: Rebased to latest tree.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>



John Harrison (3):
  drm/i915/guc: Temporarily bump the GuC load timeout
  drm/i915/guc: Update to GuC version 69.0.3
  drm/i915/guc: Improve GuC loading status check/error reports

 Documentation/gpu/i915.rst                    |   1 +
 .../gpu/drm/i915/gt/uc/abi/guc_actions_abi.h  |  80 +++++-----
 .../gpu/drm/i915/gt/uc/abi/guc_errors_abi.h   |  23 +++
 drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h |  82 ++++++++++
 drivers/gpu/drm/i915/gt/uc/intel_guc.c        | 126 +++++++++++++---
 drivers/gpu/drm/i915/gt/uc/intel_guc.h        |   4 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c    |  45 +++++-
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c     | 141 ++++++++++--------
 drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c     |  30 ++--
 drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h   |  37 ++++-
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.c    |  31 ++--
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.h    |   3 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_reg.h    |   4 -
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  18 +++
 drivers/gpu/drm/i915/gt/uc/intel_huc.c        |   1 +
 drivers/gpu/drm/i915/gt/uc/intel_uc.c         |  31 ++--
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c      |  30 ++--
 17 files changed, 493 insertions(+), 194 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h

-- 
2.25.1

