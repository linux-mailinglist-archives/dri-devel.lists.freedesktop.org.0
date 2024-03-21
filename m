Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E4518856B2
	for <lists+dri-devel@lfdr.de>; Thu, 21 Mar 2024 10:45:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 574A810E4CF;
	Thu, 21 Mar 2024 09:45:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CmB5g9J2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42EED10E4C6;
 Thu, 21 Mar 2024 09:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711014337; x=1742550337;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/y+hASDjeNXih40Bezmct1daG4a4Vx1nBZpFQzKF4bA=;
 b=CmB5g9J2mCtKJsC8wYbu0gyYUQNtkZDZhO7VcTTVWipHJislBmNU3VgV
 jqDHZMqmqF4URPWQPDKssCXysq+GGigEyT6E6U/keSQzKFfzt9p0q+3Sh
 1jiQnvQ6m1+DPTRY65Afk98Qi+FB061fOKsh4n+JAInEtSvMRTXFWcGV0
 pxrbUa/kS3QDwZxndufaGC8ZUCv4BjXkaaRkL+U5zsNfuvboVmG7yytEX
 qtc4NVhCx0eglPEvk8YrS7c1bPWhMxZM2Ap68I9jaWpfYKwaxtHxmp+8w
 Dd3WehX6iGgvAfQ9IVrSQE3xIn4g1u74DnaiCRW0bOEk7JplW7YAiDkZb Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="28462336"
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; d="scan'208";a="28462336"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 02:45:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; d="scan'208";a="14456939"
Received: from amaslenx-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.54.141])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 02:45:36 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org,
	jani.nikula@intel.com
Subject: [PATCH 0/3] drm/edid & drm/display header spring cleaning
Date: Thu, 21 Mar 2024 11:45:28 +0200
Message-Id: <cover.1711014272.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Jani Nikula (3):
  drm/displayid: move drm_displayid.h to drm_displayd_internal.h
  drm/edid: move all internal declarations to drm_crtc_internal.h
  drm/edid: group struct drm_edid based declarations together

 drivers/gpu/drm/drm_crtc_internal.h                   |  6 ++++++
 drivers/gpu/drm/drm_displayid.c                       |  4 +++-
 .../gpu/drm/drm_displayid_internal.h                  |  5 +++--
 drivers/gpu/drm/drm_edid.c                            |  2 +-
 drivers/gpu/drm/drm_eld.c                             |  4 +++-
 drivers/gpu/drm/drm_internal.h                        |  5 -----
 include/drm/drm_edid.h                                | 11 ++++-------
 7 files changed, 20 insertions(+), 17 deletions(-)
 rename include/drm/drm_displayid.h => drivers/gpu/drm/drm_displayid_internal.h (98%)

-- 
2.39.2

