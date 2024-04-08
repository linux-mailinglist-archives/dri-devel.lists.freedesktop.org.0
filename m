Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9535A89BAF7
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 10:56:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 375811122ED;
	Mon,  8 Apr 2024 08:56:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qaf5IX9r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8DC91122EC;
 Mon,  8 Apr 2024 08:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712566576; x=1744102576;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mMXlBr3fwxSXtK++lAqLr71hg/Wb8m6Y/ViAeMTchB0=;
 b=Qaf5IX9r1S57F8loHtub8DfXEQR1tO7pg5edvA4UZUm7fNqZhpsJw8wn
 3+sfo/XAEhqaHLCcmUjjhZzZpK81QP+0LVJHHLDLMhELeXHoGoO+gRDD8
 fTTXcc4nSU3U7k13Sy8a1gBssC7zeVLnEl6anFR7q1aaeIxJQigEzSdra
 tri5HiUxNqhPIODAWp0yIgCTudoqpYTGXaO0UEe+fYhodPEe45iE00ALq
 j0STkZ/p2N5zfKvPjBqfGt/ZewAbMMDwZwrsy8c4r0RnkA34G7/n6QSgT
 zwOYifiHSuGP0idyflWGJLMNZw33Ui21HUXJfiA+MViJoD8KPs0KLp+lY g==;
X-CSE-ConnectionGUID: OCe8VaL0TIOLrFdkyQfsAQ==
X-CSE-MsgGUID: Gghd80ZyQwSxfXdCCQSDMg==
X-IronPort-AV: E=McAfee;i="6600,9927,11037"; a="7997449"
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; 
   d="scan'208";a="7997449"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 01:56:15 -0700
X-CSE-ConnectionGUID: 4SfsvSLHT8OyiFXefk64+g==
X-CSE-MsgGUID: wLiWZB1FRnG4rhhQ7LzRTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; d="scan'208";a="24294316"
Received: from bauinger-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.42.71])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 01:56:12 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@intel.com
Subject: [PATCH 0/7] drm/edid: cleanups, resend
Date: Mon,  8 Apr 2024 11:56:01 +0300
Message-Id: <cover.1712565984.git.jani.nikula@intel.com>
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

Combine [1] and [2] as a resend, and add a few patches on top.

BR,
Jani.

[1] https://patchwork.freedesktop.org/series/131133/
[2] https://patchwork.freedesktop.org/series/131412/

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

