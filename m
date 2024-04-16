Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5878A66EA
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 11:20:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E5FE10EB41;
	Tue, 16 Apr 2024 09:20:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bl0d6EjB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AABD310EB41;
 Tue, 16 Apr 2024 09:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713259207; x=1744795207;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=SREdEemMb6mfL4sO6IthhZDMDlQLrFv+bk8OyUolvMw=;
 b=Bl0d6EjByN9CtF1mJuooMc16FRceQ+RM0lY/mRFy3bG/zj2+HlHlO/4A
 9SZyI9sUlx16hcjP1pfofCVSNcs/HoIaNgLbU77RIR57TfLBoNavZw/z4
 cRrjHVT61NQ21M2oxK9fI3qyu1skgytDGmuRwSogzN2yW+MjUsPE0y6ZM
 iM5Hs6Q3kgRsvKAeEc5mgoeD+oifA5XQar2UufGsEpMGrFzLhG//Irjk3
 f08PTSgI/dNvYsYvXksRaZIwF/eTwr04AjaALEAnV0OQ6MSN7t4eTCiLZ
 KyZF8lDaCw+qSQarkF2MNT20OB3b2DMgXtYC3N9u9hWI2v7WzvCiWQUQG Q==;
X-CSE-ConnectionGUID: O+lD2eGBQRCr0NIQK/g7Kw==
X-CSE-MsgGUID: iAnw1SLfQl2nuJQs5jjR8g==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="8605993"
X-IronPort-AV: E=Sophos;i="6.07,205,1708416000"; 
   d="scan'208";a="8605993"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 02:20:07 -0700
X-CSE-ConnectionGUID: DE7bsMF7T+W9k9QObNI2/A==
X-CSE-MsgGUID: bR0Gx7AARjCc4IA6lwF8pA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,205,1708416000"; d="scan'208";a="22199268"
Received: from martakit-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.44.100])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 02:20:05 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Jani Nikula <jani.nikula@intel.com>
Subject: [REBASE 0/7] drm/edid: cleanups, rebase
Date: Tue, 16 Apr 2024 12:19:53 +0300
Message-Id: <cover.1713259151.git.jani.nikula@intel.com>
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

Rebase.

Jani Nikula (7):
  drm/displayid: move drm_displayid.h to drm_displayd_internal.h
  drm/edid: move all internal declarations to drm_crtc_internal.h
  drm/edid: group struct drm_edid based declarations together
  drm/edid: rename drm_find_edid_extension() to
    drm_edid_find_extension()
  drm/edid: avoid drm_edid_find_extension() internally
  drm/edid: make drm_edid_are_equal() static
  drm/edid: make drm_edid_are_equal() more convenient for its single
    user

 drivers/gpu/drm/drm_crtc_internal.h           |  6 ++
 drivers/gpu/drm/drm_displayid.c               |  7 ++-
 .../gpu/drm/drm_displayid_internal.h          |  5 +-
 drivers/gpu/drm/drm_edid.c                    | 60 +++++++++----------
 drivers/gpu/drm/drm_eld.c                     |  4 +-
 drivers/gpu/drm/drm_internal.h                |  5 --
 include/drm/drm_edid.h                        | 13 ++--
 7 files changed, 50 insertions(+), 50 deletions(-)
 rename include/drm/drm_displayid.h => drivers/gpu/drm/drm_displayid_internal.h (98%)

-- 
2.39.2

