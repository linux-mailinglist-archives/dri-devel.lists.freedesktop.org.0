Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 938944A57D4
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 08:34:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1092610E5D7;
	Tue,  1 Feb 2022 07:34:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2760810E5AD;
 Tue,  1 Feb 2022 07:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643700875; x=1675236875;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nCKdOQVVEiXMPCYkfif071Y/cq2Z05NxYTaqKiHTtmg=;
 b=StgFNm7k9Rf0GMHXLs6Kglq4Py9yyhOrzsZRxHUlxp18tlMoDFGC9zuc
 ro4zLXrSc3kZfQ7N6HsT8HdteRL3D1MFNnxuHnPTpCosIcqWv4lgXVsgE
 k/yKtX7ePUpiJ7pjZa4CC0fj7MWXHLAY60mJKx2seX7iNEmKI1UEt6+2H
 DZqbIAqZD9JKtdxFppYLr3jUX2zxsweF+Do5moBv059zXaTUt19Duo9vg
 A4SNxr6uWGvVZAt5fb0aY+R+LZKELwVeTPedj2H8Sk4Gd0hA2vdtpO+R7
 L9MZIR2zjYS0mYqj63RX/hHiFLFrrEAHDSeC85q5Ga+corbuiHBweXJCV w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10244"; a="245227827"
X-IronPort-AV: E=Sophos;i="5.88,333,1635231600"; d="scan'208";a="245227827"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2022 23:34:34 -0800
X-IronPort-AV: E=Sophos;i="5.88,333,1635231600"; d="scan'208";a="698315959"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2022 23:34:25 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/4] Minor Fixes and Refactoring for HDMI PCON stuff
Date: Tue,  1 Feb 2022 12:50:26 +0530
Message-Id: <20220201072030.1466446-1-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.25.1
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
Cc: vandita.kulkarni@intel.com, uma.shankar@intel.com, swati2.sharma@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Misc fixes and refactoring in HDMI2.1 PCON helper functions.
V2:
Addressed review comments from Jani.
Splitted the drm_helper addition and usage in separate patches.

Ankit Nautiyal (4):
  drm/i915/hdmi: Fix the definition of intel_hdmi_dsc_get_bpp
  drm/edid: Add helper to get max FRL rate for an HDMI sink
  drm/i915/dp: Use the drm helpers for getting max FRL rate
  drm/i915/display: Simplify helpers for getting DSC slices and bpp

 drivers/gpu/drm/drm_edid.c                | 38 +++++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_dp.c   | 26 ++++++----------
 drivers/gpu/drm/i915/display/intel_hdmi.c | 26 +++++++++-------
 drivers/gpu/drm/i915/display/intel_hdmi.h |  9 ++++--
 include/drm/drm_edid.h                    |  2 ++
 5 files changed, 70 insertions(+), 31 deletions(-)

-- 
2.25.1

