Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F12F46F9EF
	for <lists+dri-devel@lfdr.de>; Fri, 10 Dec 2021 05:40:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 864AD10E21C;
	Fri, 10 Dec 2021 04:40:25 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E0D610E1FE;
 Fri, 10 Dec 2021 04:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639111224; x=1670647224;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3oI8FVXy4eG0he4ZTDfIlPUF6fndqBSI4TFJYM+MaaY=;
 b=EKVmKHsxSIJZob6wPOjNyP1G1VGp3meQ5Vrn0Cw2LPRptqiJ9s0Jh93w
 t10emfqLB2TqmPCXb1yy29sDc3zWkIlGEitYTcL9Sn45MMKORTf7BxGfE
 6i4MoQGVgKovOwL2OzRROr8NCra/bwmSO2UK9BTGN4DeuyipadWnaNxik
 ochuS7Y0V6QdjXarGe+/4qtQ5M/XUFAix40PkTdmPYl58T4IQ/zk0Bwh/
 u5vKJeKk7inZXX8C+jc7I4cuNByQdJ7uaei7wbL/McYjpo6HZq9QTbR7I
 n+gjb0dCt6rQsrT1MBHTTsm0OH5x5nlwrX3p8pVwSEdEniI2d7eMrI9A+ g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10193"; a="218294566"
X-IronPort-AV: E=Sophos;i="5.88,194,1635231600"; d="scan'208";a="218294566"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2021 20:40:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,194,1635231600"; d="scan'208";a="480606796"
Received: from relo-linux-5.jf.intel.com ([10.165.21.134])
 by orsmga002.jf.intel.com with ESMTP; 09 Dec 2021 20:40:22 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 0/4] Assorted fixes/tweaks to GuC support
Date: Thu,  9 Dec 2021 20:40:18 -0800
Message-Id: <20211210044022.1842938-1-John.C.Harrison@Intel.com>
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

Fix a potential null pointer dereference, improve debug crash reports,
improve code separation, improve GuC log read speed.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>



John Harrison (4):
  drm/i915/uc: Allow platforms to have GuC but not HuC
  drm/i915/guc: Speed up GuC log dumps
  drm/i915/guc: Increase GuC log size for CONFIG_DEBUG_GEM
  drm/i915/guc: Don't go bang in GuC log if no GuC

 drivers/gpu/drm/i915/gt/intel_gt_debugfs.h    | 21 ++++-
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.h    |  5 +-
 .../drm/i915/gt/uc/intel_guc_log_debugfs.c    | 58 +++++++++++-
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c      | 93 +++++++++++++------
 4 files changed, 136 insertions(+), 41 deletions(-)

-- 
2.25.1

