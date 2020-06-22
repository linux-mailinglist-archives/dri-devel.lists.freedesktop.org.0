Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1DF2202FB6
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jun 2020 08:29:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 850BD89D84;
	Mon, 22 Jun 2020 06:29:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 695B689D7B;
 Mon, 22 Jun 2020 06:29:16 +0000 (UTC)
IronPort-SDR: okSC4xo6yw+aLxqRFWsR52qBl/+mWuT+vH9TJ8JT8WMYkzM0MJM4j4EXYFu/dJc00X2u2RPDqs
 cAajR/M4ecBg==
X-IronPort-AV: E=McAfee;i="6000,8403,9659"; a="205153028"
X-IronPort-AV: E=Sophos;i="5.75,266,1589266800"; d="scan'208";a="205153028"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2020 23:29:15 -0700
IronPort-SDR: rv//OzknsaJ1OEr7AtpA6+UHrHqhhEr+ZY0y4B2G6Khsa+hfET5Evh8l30MUJbDfX6wZWK4V5Y
 Ue7640FkVEfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,266,1589266800"; d="scan'208";a="300735611"
Received: from bhanu-nuc8i7beh.iind.intel.com ([10.145.162.210])
 by fmsmga004.fm.intel.com with ESMTP; 21 Jun 2020 23:29:13 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: bhanuprakash.modem@intel.com, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [v6 0/3] VRR capable attach prop in i915, VRR debugfs
Date: Mon, 22 Jun 2020 19:55:16 +0530
Message-Id: <20200622142519.16214-1-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an initial set of patches for enabling VRR support in i915.
This series has patches for:
1. Attach and set VRR capable connector prop for Intel DP conn
2. Expose VRR min and max through debugfs
3. Remove AMD specific logic to create debugfs

Aditya Swarup (1):
  drm/i915/dp: Attach and set drm connector VRR property

Bhanuprakash Modem (2):
  drm/debug: Expose connector VRR monitor range via debugfs
  Revert "drm/amd/display: Expose connector VRR range via debugfs"

 .../amd/display/amdgpu_dm/amdgpu_dm_debugfs.c | 20 --------------
 drivers/gpu/drm/drm_debugfs.c                 | 22 +++++++++++++++
 drivers/gpu/drm/i915/display/intel_dp.c       | 27 +++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_dp.h       |  2 ++
 4 files changed, 51 insertions(+), 20 deletions(-)

-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
