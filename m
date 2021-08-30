Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3FF13FB3DC
	for <lists+dri-devel@lfdr.de>; Mon, 30 Aug 2021 12:29:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36DC689DB8;
	Mon, 30 Aug 2021 10:29:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16C4889DB8;
 Mon, 30 Aug 2021 10:29:14 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10091"; a="281964154"
X-IronPort-AV: E=Sophos;i="5.84,363,1620716400"; d="scan'208";a="281964154"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2021 03:29:13 -0700
X-IronPort-AV: E=Sophos;i="5.84,363,1620716400"; d="scan'208";a="540302176"
Received: from anikolae-mobl1.ccr.corp.intel.com (HELO localhost)
 ([10.249.47.21])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2021 03:29:08 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH 0/5] drm/displayid: VESA vendor block and drm/i915 MSO use of
 it
Date: Mon, 30 Aug 2021 13:28:58 +0300
Message-Id: <cover.1630319138.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
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

We need the DisplayID VESA vendor block data for properly configuring
eDP MSO (Multi-SST Operation) pixel overlap.

I haven't actually tested this on a panel that requires the overlap, but
this is all pretty straightforward to prepare for that use case.

BR,
Jani.

Jani Nikula (5):
  drm/displayid: re-align data block macros
  drm/displayid: add DisplayID v2.0 data blocks and primary use cases
  drm/edid: parse the DisplayID v2.0 VESA vendor block for MSO
  drm/i915/edp: postpone MSO init until after EDID read
  drm/i915/edp: use MSO pixel overlap from DisplayID data

 drivers/gpu/drm/drm_edid.c              | 63 ++++++++++++++++
 drivers/gpu/drm/i915/display/intel_dp.c | 14 ++--
 include/drm/drm_connector.h             | 12 +++
 include/drm/drm_displayid.h             | 99 +++++++++++++++++--------
 4 files changed, 154 insertions(+), 34 deletions(-)

-- 
2.20.1

