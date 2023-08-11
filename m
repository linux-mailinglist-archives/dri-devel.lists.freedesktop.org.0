Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B25DB77869B
	for <lists+dri-devel@lfdr.de>; Fri, 11 Aug 2023 06:43:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5810710E641;
	Fri, 11 Aug 2023 04:43:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 801BB10E63F;
 Fri, 11 Aug 2023 04:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691728992; x=1723264992;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=H9/TQ5GRC6QjLWAUMhNXtSAfry4cWz/j9E84je7cFSo=;
 b=T3OmE2UZF2d5uUjaSIyzpf75OHHow8Mo5G2CElub8uIEkpSH+O/srDSL
 5LFXSTgKCuluKhXlu07SDegiAI0Rhs3mErG9PU6VN5LULVmX951QJLGuG
 rNiRvElrr6U9BdL3euvY1UJOxT3pgW6Vtcb1C/9mGRppsbesARSb0qvXD
 BDL8uiEocpacWuFpWUklt55lVEkREb3BaM0cNclmgcEVni10B97rkZRBA
 e9Woun0lZ5Gu4bSyTUSJ9LL4zQB7AUY0HkjiFkXi5OZAK/4A5ZDhEyQRl
 onCGguCXajbR3e0Q69gngLT9zNOdCK4P3HMy0OPY/2bECH7TifKZc2Mo2 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="351197189"
X-IronPort-AV: E=Sophos;i="6.01,164,1684825200"; d="scan'208";a="351197189"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2023 21:43:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="802533459"
X-IronPort-AV: E=Sophos;i="6.01,164,1684825200"; d="scan'208";a="802533459"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by fmsmga004.fm.intel.com with ESMTP; 10 Aug 2023 21:43:10 -0700
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 0/3] drm/i915/pxp/mtl: Update gsc-heci cmd submission
Date: Thu, 10 Aug 2023 21:43:07 -0700
Message-Id: <20230811044310.944883-1-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.39.0
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
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 dri-devel@lists.freedesktop.org,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For MTL, update the GSC-HECI packet size and the max firmware
response timeout to match internal fw specs. Enforce setting
run-alone bit in LRC for protected contexts.

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>

Alan Previn (3):
  drm/i915/pxp/mtl: Update pxp-firmware response timeout
  drm/i915/pxp/mtl: Update pxp-firmware packet size
  drm/i915/gt/pxp: User PXP contexts requires runalone bit in lrc

 drivers/gpu/drm/i915/gt/intel_lrc.c                  | 12 ++++++++++++
 .../drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.c    |  3 +++
 .../gpu/drm/i915/pxp/intel_pxp_cmd_interface_43.h    |  2 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h           |  6 +++---
 4 files changed, 19 insertions(+), 4 deletions(-)


base-commit: 51fec314404b6a360493f225481083b2a664e3e1
-- 
2.39.0

