Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB3842813B
	for <lists+dri-devel@lfdr.de>; Sun, 10 Oct 2021 14:34:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB05C6E2DF;
	Sun, 10 Oct 2021 12:33:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93DD06E2DF;
 Sun, 10 Oct 2021 12:33:58 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10132"; a="224140856"
X-IronPort-AV: E=Sophos;i="5.85,362,1624345200"; d="scan'208";a="224140856"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2021 05:33:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,362,1624345200"; d="scan'208";a="658297854"
Received: from amanna.iind.intel.com ([10.223.74.76])
 by orsmga005.jf.intel.com with ESMTP; 10 Oct 2021 05:33:55 -0700
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: gwan-gyeong.mun@intel.com, mika.kahola@intel.com, jani.nikula@intel.com,
 manasi.d.navare@intel.com, jose.souza@intel.com,
 Animesh Manna <animesh.manna@intel.com>
Subject: [PATCH v3 0/5] Panel replay phase1 implementation
Date: Sun, 10 Oct 2021 17:40:34 +0530
Message-Id: <20211010121039.14725-1-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Panel Replay is a power saving feature for DP 2.0 monitor and similar
to PSR on EDP.

These patches are basic enablement patches and reused psr
framework to add panel replay related new changes which
may need further fine tuning to fill the gap if there is any.

Note: The patches are not tested due to unavailability of monitor

Animesh Manna (5):
  drm/i915/panelreplay: dpcd register definition for panelreplay
  drm/i915/panelreplay: HAS_PR() macro added for panel replay
  drm/i915/panelreplay: Initializaton and compute config for panel
    replay
  drm/i915/panelreplay: enable/disable panel replay
  drm/i915/panelreplay: Added state checker for panel replay state

 drivers/gpu/drm/i915/display/intel_display.c  |  1 +
 .../drm/i915/display/intel_display_types.h    |  2 +
 drivers/gpu/drm/i915/display/intel_dp.c       | 43 ++++++++--
 drivers/gpu/drm/i915/display/intel_psr.c      | 84 ++++++++++++++++++-
 drivers/gpu/drm/i915/display/intel_psr.h      |  3 +
 drivers/gpu/drm/i915/i915_drv.h               |  1 +
 drivers/gpu/drm/i915/i915_reg.h               |  1 +
 include/drm/drm_dp_helper.h                   |  6 ++
 8 files changed, 128 insertions(+), 13 deletions(-)

-- 
2.29.0

