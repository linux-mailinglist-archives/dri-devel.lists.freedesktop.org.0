Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2862D2B15
	for <lists+dri-devel@lfdr.de>; Tue,  8 Dec 2020 13:34:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A6786E967;
	Tue,  8 Dec 2020 12:34:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD6956E967;
 Tue,  8 Dec 2020 12:34:03 +0000 (UTC)
IronPort-SDR: qxdSHG0kdAwCYrH+vSY/0LUv2ZllPdEaym9MP2g56+cgHt07EDSqpaPZJTeZH6MYD+OZAMkrlk
 t94nvgGvf3uQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9828"; a="174026407"
X-IronPort-AV: E=Sophos;i="5.78,402,1599548400"; d="scan'208";a="174026407"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2020 04:34:02 -0800
IronPort-SDR: QXqUIiSlI3gFSW/qN7J64hmgZWOgE1ASVIXs5omZ4CAKMlRDNdfw9X3pC6wPIn/En+FZ9kLxHj
 PPFMXEX8nqnQ==
X-IronPort-AV: E=Sophos;i="5.78,402,1599548400"; d="scan'208";a="317774247"
Received: from mjgleeso-mobl.ger.corp.intel.com (HELO localhost)
 ([10.213.246.199])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2020 04:34:00 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 0/6] drm/dsc, drm/dp, and /drm/i915: rc model size updates
Date: Tue,  8 Dec 2020 14:33:49 +0200
Message-Id: <cover.1607429866.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
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
Cc: jani.nikula@intel.com, manasi.d.navare@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For whatever reason this old series was never merged. Please let's get
this done.

For i915 DP this still needs a patch to start using the model size from
DPCD.

BR,
Jani.

Jani Nikula (6):
  drm/dsc: use rc_model_size from DSC config for PPS
  drm/i915/dsc: configure hardware using specified rc_model_size
  drm/i915/dsc: make rc_model_size an encoder defined value
  drm/dsc: add helper for calculating rc buffer size from DPCD
  drm/i915/bios: fill in DSC rc_model_size from VBT
  drm/i915/dsi: use VBT data for rc_model_size

 drivers/gpu/drm/drm_dsc.c                 | 30 +++++++++++++++++++++--
 drivers/gpu/drm/i915/display/intel_bios.c | 11 +++------
 drivers/gpu/drm/i915/display/intel_dp.c   |  8 ++++++
 drivers/gpu/drm/i915/display/intel_vdsc.c |  4 +--
 include/drm/drm_dsc.h                     |  1 +
 5 files changed, 41 insertions(+), 13 deletions(-)

-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
