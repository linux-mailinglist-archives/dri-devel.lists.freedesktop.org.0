Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C64B3345CF7
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 12:33:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 424046E8BF;
	Tue, 23 Mar 2021 11:33:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2F126E0F3;
 Tue, 23 Mar 2021 11:33:35 +0000 (UTC)
IronPort-SDR: XW4eU1nifL2FSINjSQW9PFL22Qbnd0p5KZ8CjzbHsCZ9HI16cBVzgL4gzRHADVlbFtHqr0qeMz
 s6FCuRKzhIfA==
X-IronPort-AV: E=McAfee;i="6000,8403,9931"; a="188140861"
X-IronPort-AV: E=Sophos;i="5.81,271,1610438400"; d="scan'208";a="188140861"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2021 04:33:34 -0700
IronPort-SDR: 3Os2/48mO0MGT7JT8yBsP7yJpizAUXa5734a44KYowrfNdLQluw6TYRjdetKatWhL59HRjzTlv
 7zrpuWbQWhiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,271,1610438400"; d="scan'208";a="408277065"
Received: from linux-akn.iind.intel.com ([10.223.34.148])
 by fmsmga008.fm.intel.com with ESMTP; 23 Mar 2021 04:33:32 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v5 0/2] HDMI2.1 PCON Misc Fixes
Date: Tue, 23 Mar 2021 16:54:20 +0530
Message-Id: <20210323112422.1211-1-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.29.2
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Patch1: Tweaks the drm_helpers for PCON configuration.
Patch2: Removes unwanted code not applicable for older platforms.
[Merged]
Patch3: Fixes condition for starting FRL link training.

rev3:  Patch-1 from rev2 [Read PCON DSC ENC caps only for DPCD
rev >= 1.4] is dropped as it mixes DPCD and DP revisions.

rev4: Rebased

Ankit Nautiyal (2):
  drm/dp_helper: Define options for FRL training for HDMI2.1 PCON
  drm/i915/display: Configure HDMI2.1 Pcon for FRL only if Src-Ctl mode
    is available

 drivers/gpu/drm/drm_dp_helper.c         | 24 ++++++++++++++----------
 drivers/gpu/drm/i915/display/intel_dp.c | 19 +++++++++++--------
 include/drm/drm_dp_helper.h             |  6 ++++--
 3 files changed, 29 insertions(+), 20 deletions(-)


base-commit: 8e469260b87ff08620181d86570f7ec4e41c0ef7
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
