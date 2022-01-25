Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E75149AF70
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jan 2022 10:12:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD96F10E93E;
	Tue, 25 Jan 2022 09:12:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE28310E93E;
 Tue, 25 Jan 2022 09:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643101935; x=1674637935;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QsEJ9iv1VADz/s5EfrMZIVel7h92de86dHSNLIemKxc=;
 b=fLoNymrIwgQCR1OMpvXa6aQNVC2xUQNVBCtANtVvupmiDRNnT+Vs4eMK
 CQfqrEPbPxnY5uXxDIdqOPqhKwjWayqYoT1eiYuTW1vaFswwp0X6PP+T9
 RazNvO+W3WmUDxbCKR07LWWdnbNRCpsdQX9iLGnC44AQ3rkWMXHFoZ58h
 WPfPZ2Gd6vdmtjEXgG71SsZj2PI8sHUd6b6WjCXvbCOgAlFjvTOZzIX+2
 4/LA1bFVS3Tn/Qb9Vk0+FkGZePhxHxafXc80fuWCqqfOQI3mdOWBfVsrm
 z8ILzH3q+XSM9gsjogtQWBAJA2sfTGpVNxdadGuVgNceeln1Z6oxXXYW4 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10237"; a="246042315"
X-IronPort-AV: E=Sophos;i="5.88,314,1635231600"; d="scan'208";a="246042315"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2022 01:12:15 -0800
X-IronPort-AV: E=Sophos;i="5.88,314,1635231600"; d="scan'208";a="695768070"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2022 01:12:12 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 0/3] Minor Fixes and Refactoring for HDMI PCON stuff
Date: Tue, 25 Jan 2022 14:27:58 +0530
Message-Id: <20220125085801.1025521-1-ankit.k.nautiyal@intel.com>
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

Ankit Nautiyal (3):
  drm/i915_hdmi: Fix the definition of intel_hdmi_dsc_get_bpp
  drm/drm_edid: Add helper to get max FRL rate for an HDMI sink
  drm/i915/display: Simplify helpers for getting DSC slices and bpp

 drivers/gpu/drm/drm_edid.c                | 38 +++++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_dp.c   | 26 ++++++----------
 drivers/gpu/drm/i915/display/intel_hdmi.c | 26 +++++++++-------
 drivers/gpu/drm/i915/display/intel_hdmi.h |  8 +++--
 include/drm/drm_edid.h                    |  2 ++
 5 files changed, 69 insertions(+), 31 deletions(-)

-- 
2.25.1

