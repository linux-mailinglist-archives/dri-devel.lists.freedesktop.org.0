Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19792376657
	for <lists+dri-devel@lfdr.de>; Fri,  7 May 2021 15:43:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C7EE6E086;
	Fri,  7 May 2021 13:43:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB5F06E086
 for <dri-devel@lists.freedesktop.org>; Fri,  7 May 2021 13:43:09 +0000 (UTC)
IronPort-SDR: ZM/zYe8vpComSEOVYssr2Y/Vceu/fBlXIg9uNME0bnKafRb/ysDMK68Hif2yGDQycpeHkmXsZS
 8da0vsH3kVOw==
X-IronPort-AV: E=McAfee;i="6200,9189,9977"; a="262668895"
X-IronPort-AV: E=Sophos;i="5.82,280,1613462400"; d="scan'208";a="262668895"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2021 06:43:08 -0700
IronPort-SDR: 4Uwt2CC9SL8SLBd2cRcOnChdFDnUEZPFMRJrWf/UYQ8kg9nw+ctUtO73QusqpU3+qqguUvB0hL
 NKuUPs6TOcXQ==
X-IronPort-AV: E=Sophos;i="5.82,280,1613462400"; d="scan'208";a="622860348"
Received: from unknown (HELO Nischal-desktop.iind.intel.com) ([10.223.74.174])
 by fmsmga005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2021 06:43:07 -0700
From: Nischal Varide <nischal.varide@intel.com>
To: dri-devel@lists.freedesktop.org, nischal.varide@intel.com,
 uma.shankar@intel.com, ankit.k.nautiyal@intel.com
Subject: [RFC v2 0/1] drm/i915/display: New Property Creation for HDMI
Date: Fri,  7 May 2021 12:20:43 +0530
Message-Id: <20210507065044.23465-1-nischal.varide@intel.com>
X-Mailer: git-send-email 2.29.2
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


Right now the HDMI properties like vendor and product ids are hardcoded
in the function "intel_hdmi_compute_spd_infoframe()".

ret = hdmi_spd_infoframe_init(frame, "Intel", "Integrated gfx").

This patch enables the possibility of setting vendor and product id fields
of the Infoframe structure in the userspace instead of hardcoding in
the kernel, and this will help display manufacturers preload picture
configurations for the devices.

The changes has been Tested by an IGT testcase which got floated.
https://patchwork.freedesktop.org/series/89852/.


Nischal Varide (1):
  drm/i915/display: New Property Creation for HDMI

 drivers/gpu/drm/i915/display/intel_atomic.c   | 14 +++++++++++++
 .../gpu/drm/i915/display/intel_connector.c    | 20 +++++++++++++++++++
 .../gpu/drm/i915/display/intel_connector.h    |  1 +
 .../drm/i915/display/intel_display_types.h    |  5 +++++
 drivers/gpu/drm/i915/display/intel_hdmi.c     | 14 ++++++++++++-
 drivers/gpu/drm/i915/display/intel_hdmi.h     |  5 +++++
 drivers/gpu/drm/i915/i915_drv.h               |  1 +
 7 files changed, 59 insertions(+), 1 deletion(-)

-- 
2.29.2

