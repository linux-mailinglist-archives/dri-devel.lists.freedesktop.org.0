Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D44A30ECBE
	for <lists+dri-devel@lfdr.de>; Thu,  4 Feb 2021 07:58:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 280CA6EC81;
	Thu,  4 Feb 2021 06:58:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3346F6EC81;
 Thu,  4 Feb 2021 06:58:37 +0000 (UTC)
IronPort-SDR: 0bnLp+btD1pLqsiXbkgB23f+4LmZC5O5joBIJLmxiZRHAGrmri2l0xVNkOpJE+V0XoejmkG7kl
 E00H+zH9hmcQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9884"; a="160942386"
X-IronPort-AV: E=Sophos;i="5.79,400,1602572400"; d="scan'208";a="160942386"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2021 22:58:36 -0800
IronPort-SDR: lebgHKAJVfvwAkPn2sZjB8AO1x7A8pyHy0pOb/smo3V9W+8p7tZ8dfqQhcXHyxyz9Z83fu6986
 fSFJ6+P8oPRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,400,1602572400"; d="scan'208";a="483086840"
Received: from linux-akn.iind.intel.com ([10.223.34.148])
 by fmsmga001.fm.intel.com with ESMTP; 03 Feb 2021 22:58:34 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 0/3] HDMI2.1 PCON Misc Fixes
Date: Thu,  4 Feb 2021 12:18:39 +0530
Message-Id: <20210204064842.11595-1-ankit.k.nautiyal@intel.com>
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
Cc: uma.shankar@intel.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Patch1: fixes gitlab issue:
https://gitlab.freedesktop.org/drm/intel/-/issues/2868
Patch2: Tweaks the drm_helpers for PCON configuration
Patch3: Removes unwanted code not applicable for older platforms.

Ankit Nautiyal (3):
  i915/display/intel_dp: Read PCON DSC ENC caps only for DPCD rev >= 1.4
  drm/dp_helper: Define options for FRL training for HDMI2.1 PCON
  i915/display: Remove FRL related code from disable DP sequence for
    older platforms

 drivers/gpu/drm/drm_dp_helper.c         | 18 +++++-----
 drivers/gpu/drm/i915/display/intel_dp.c | 16 ++++-----
 include/drm/drm_dp_helper.h             | 46 +++++++++++++++++++++++--
 3 files changed, 59 insertions(+), 21 deletions(-)

-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
