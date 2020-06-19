Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E29B2009B1
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jun 2020 15:14:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21E686E2E9;
	Fri, 19 Jun 2020 13:14:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 155E46E2E9;
 Fri, 19 Jun 2020 13:14:56 +0000 (UTC)
IronPort-SDR: JJa5Dqk23TEXBrUqBjhN8b/mIuFeRgkkDV1aY79uDyi3x0Go52rSYWI4pVscl7uwuAhhZg2TbH
 qjece0nwzMow==
X-IronPort-AV: E=McAfee;i="6000,8403,9656"; a="130318718"
X-IronPort-AV: E=Sophos;i="5.75,255,1589266800"; d="scan'208";a="130318718"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2020 06:14:55 -0700
IronPort-SDR: 9GMsjKeRur9GdpR280dOGTJuUBpDCZEORRg0ZWAPsy/PuduelPpNfkmDg0yQ6lsNy1MAVEXIn9
 6R0UdHK/A/zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,255,1589266800"; d="scan'208";a="277995701"
Received: from bhanu-nuc8i7beh.iind.intel.com ([10.145.162.210])
 by orsmga006.jf.intel.com with ESMTP; 19 Jun 2020 06:14:53 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: bhanuprakash.modem@intel.com, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [v6 0/3] VRR capable attach prop in i915, DPCD helper, VRR debugfs
Date: Sat, 20 Jun 2020 02:41:03 +0530
Message-Id: <20200619211106.19207-1-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200612230444.10121-1-manasi.d.navare@intel.com>
References: <20200612230444.10121-1-manasi.d.navare@intel.com>
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
1. adding a drm dpcd helper to read ignore MSA
   bit in sink's DPCD indicating sink support for VRR
2. Attach and set VRR capable connector prop for Intel DP conn
3. Expose VRR min and max through debugfs

Aditya Swarup (1):
  drm/i915/dp: Attach and set drm connector VRR property

Bhanuprakash Modem (1):
  drm/debug: Expose connector VRR monitor range via debugfs

Manasi Navare (1):
  drm/dp: DRM DP helper for reading Ignore MSA from DPCD

 .../amd/display/amdgpu_dm/amdgpu_dm_debugfs.c | 20 --------------
 drivers/gpu/drm/drm_debugfs.c                 | 22 +++++++++++++++
 drivers/gpu/drm/i915/display/intel_dp.c       | 27 +++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_dp.h       |  2 ++
 include/drm/drm_dp_helper.h                   |  8 ++++++
 5 files changed, 59 insertions(+), 20 deletions(-)

-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
