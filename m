Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7E6200A05
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jun 2020 15:27:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05B616ECB7;
	Fri, 19 Jun 2020 13:27:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AA666ECB7;
 Fri, 19 Jun 2020 13:27:48 +0000 (UTC)
IronPort-SDR: UXLeuO0z059irdWWJUltL6Hfzy4zvP4QFVqjyKqUndqFAxgjDYhCsvRZu8Atoq21Sbpt6Yfudx
 S8AURLs1t7TQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9656"; a="208188886"
X-IronPort-AV: E=Sophos;i="5.75,255,1589266800"; d="scan'208";a="208188886"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2020 06:27:47 -0700
IronPort-SDR: LoRv0M4OCrAexjNOO/Yea7WCg2uu/stJTxo8PCnaqLpGaQcx7Mh1Wzeg66tjpfBKo+W/OhVUjM
 i0exZrn8+QHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,255,1589266800"; d="scan'208";a="421849359"
Received: from bhanu-nuc8i7beh.iind.intel.com ([10.145.162.210])
 by orsmga004.jf.intel.com with ESMTP; 19 Jun 2020 06:27:44 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: bhanuprakash.modem@intel.com, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [v6 0/3] VRR capable attach prop in i915, DPCD helper, VRR debugfs
Date: Sat, 20 Jun 2020 02:53:53 +0530
Message-Id: <20200619212356.19285-1-bhanuprakash.modem@intel.com>
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
1. Adding a drm dpcd helper to read ignore MSA
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
