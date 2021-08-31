Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30BAA3FC985
	for <lists+dri-devel@lfdr.de>; Tue, 31 Aug 2021 16:17:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3084E89AD2;
	Tue, 31 Aug 2021 14:17:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E943189AD2;
 Tue, 31 Aug 2021 14:17:42 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10093"; a="282195744"
X-IronPort-AV: E=Sophos;i="5.84,366,1620716400"; d="scan'208";a="282195744"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2021 07:17:42 -0700
X-IronPort-AV: E=Sophos;i="5.84,366,1620716400"; d="scan'208";a="541026181"
Received: from anicol1x-mobl.ger.corp.intel.com (HELO localhost)
 ([10.251.211.207])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2021 07:17:39 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, ville.syrjala@linux.intel.com,
 jani.nikula@intel.com
Subject: [PATCH v2 0/6] drm/displayid: VESA vendor block and drm/i915 MSO use
 of it
Date: Tue, 31 Aug 2021 17:17:29 +0300
Message-Id: <cover.1630419362.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
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

v2 of https://patchwork.freedesktop.org/series/94161/ with the VESA OUI
check and an OUI helper patch added.

Jani Nikula (6):
  drm/displayid: re-align data block macros
  drm/displayid: add DisplayID v2.0 data blocks and primary use cases
  drm/edid: abstract OUI conversion to 24-bit int
  drm/edid: parse the DisplayID v2.0 VESA vendor block for MSO
  drm/i915/edp: postpone MSO init until after EDID read
  drm/i915/edp: use MSO pixel overlap from DisplayID data

 drivers/gpu/drm/drm_edid.c              |  89 ++++++++++++++++++---
 drivers/gpu/drm/i915/display/intel_dp.c |  14 ++--
 include/drm/drm_connector.h             |  12 +++
 include/drm/drm_displayid.h             | 101 +++++++++++++++++-------
 4 files changed, 172 insertions(+), 44 deletions(-)

-- 
2.30.2

