Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF59050EB28
	for <lists+dri-devel@lfdr.de>; Mon, 25 Apr 2022 23:13:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2120210E2AC;
	Mon, 25 Apr 2022 21:13:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22F7310E2A6;
 Mon, 25 Apr 2022 21:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650921188; x=1682457188;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5ltW3da3wpjYb2XhaEkHIUNybZK6hKNLGzjN48J5yd4=;
 b=LFNaK3VR+t+4/21GgKFiS46XqALgImF43b7RS5eSuuNUK4q4sgsarWsh
 qazAI1yJMb8qPEiJzNdTlbNp0UiBlm3UYobNzu6aJQOl6L1OaY1sau6lg
 qlrYj0QUFC2rtFFRDRp0pb/5ScsJQfKDCF4G6x1X1x/jqQZPqgmc1n3hL
 NcAMIgtkRA82ES5+xNJF667w3taOBM9W9GkJOOX2SuPmXclzhATUI/ILt
 q98o6+6ZrJLtBLLXqEakcSBRg94zmyE9IMYIXiOrkkgRRxENmQjNOmhoM
 IsPb4zpVNAbhhMeEcAwasqT+MNjfXXYbzNzd6466ACC9rfPlL2zfpi4R5 g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10328"; a="265531322"
X-IronPort-AV: E=Sophos;i="5.90,289,1643702400"; d="scan'208";a="265531322"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2022 14:12:58 -0700
X-IronPort-AV: E=Sophos;i="5.90,289,1643702400"; d="scan'208";a="729916082"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2022 14:12:58 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 0/3] i915: Upstream initial DG2 PCI IDs
Date: Mon, 25 Apr 2022 14:12:48 -0700
Message-Id: <20220425211251.77154-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.35.1
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We've had all of our DG2 and ATS-M PCI IDs in the topic/core-for-CI
branch for a while, but we've now got the critical uapi changes in place
to unblock upstreaming the initial subset (which correspond to
"motherboard down" designs) through the drm-intel tree.  The remaining
IDs (which correspond to add-in card designs) will remain in the
topic/core-for-CI branch until some additional prerequisite
functionality lands.

Since the topic/core-for-CI branch is a rebasing branch, we'll just
rebase the relevant IDs out of it when the time comes, but I'm sending
them as a formal revert here so that the CI system doesn't get confused
when testing the series.

Note that a handful of new DG2-G12 IDs have also shown up recently, so
those additional IDs are also included here.

Cc: Lucas De Marchi <lucas.demarchi@intel.com>

Matt Roper (3):
  topic/core-for-CI:  Revert DG2 and ATS-M device IDs
  drm/i915: Add first set of DG2 PCI IDs
  topic/core-for-CI: Add remaining DG2 and ATS-M device IDs

 include/drm/i915_pciids.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

-- 
2.35.1

