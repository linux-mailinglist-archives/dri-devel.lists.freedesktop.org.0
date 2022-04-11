Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D474FC232
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 18:24:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4240810E2DA;
	Mon, 11 Apr 2022 16:24:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8538310E2DA;
 Mon, 11 Apr 2022 16:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649694270; x=1681230270;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=U1HXBdHVV0yzhquvU+CSRpM/tMRzHqtYLlwhR81Rql8=;
 b=aon7ZfcMqmdsQAe8+jbF2f8yrz1sRGKSz3h56MPS11JXL/EjJsHctjz5
 ZK9gAhRhhl/ByP0e+hpQPkTSArwkOoJmVvW9VT2flEBXsMq7D8WeRie+u
 IIPJMBqBSdA9C3jZTarkhaPuLOz897We4DLstUjZWLqpTxKDqAamLqeBF
 YWH6TmVJ7OZlukeTU+mxL9UrvUHeDU1jejkDmuGg+pglbPj660ofR2/Ru
 Yj5w5bLUAb0PRmFVZUKLsLze3YSBnlet6C7lie5U75i/16PDIdvyvS29p
 r5fiWoOxqq/Yo4pmFW9cuPvBs3GlsfMfHaWNeS1zu++6LT62xjFdJWm26 A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10314"; a="261901393"
X-IronPort-AV: E=Sophos;i="5.90,252,1643702400"; d="scan'208";a="261901393"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 09:24:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,252,1643702400"; d="scan'208";a="801776669"
Received: from unknown (HELO slisovsk-Lenovo-ideapad-720S-13IKB.fi.intel.com)
 ([10.237.72.65])
 by fmsmga006.fm.intel.com with ESMTP; 11 Apr 2022 09:24:28 -0700
From: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 0/2] Add DP MST DSC support to i915
Date: Mon, 11 Apr 2022 19:25:16 +0300
Message-Id: <20220411162518.9352-1-stanislav.lisovskiy@intel.com>
X-Mailer: git-send-email 2.24.1.485.gad05a3d8e5
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
Cc: Stanislav.Lisovskiy@intel.com, jani.nikula@intel.com,
 dri-devel@lists.freedesktop.org, jani.saarinen@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently we have only DSC support for DP SST.

Stanislav Lisovskiy (2):
  drm: Add missing DP DSC extended capability definitions.
  drm/i915: Add DSC support to MST path

 drivers/gpu/drm/i915/display/intel_dp.c     |  75 +++++-----
 drivers/gpu/drm/i915/display/intel_dp.h     |  17 +++
 drivers/gpu/drm/i915/display/intel_dp_mst.c | 143 ++++++++++++++++++++
 include/drm/dp/drm_dp_helper.h              |  10 +-
 4 files changed, 200 insertions(+), 45 deletions(-)

-- 
2.24.1.485.gad05a3d8e5

