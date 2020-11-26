Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9942C4FB2
	for <lists+dri-devel@lfdr.de>; Thu, 26 Nov 2020 08:51:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECDCC6E5A3;
	Thu, 26 Nov 2020 07:51:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4B606E5A3;
 Thu, 26 Nov 2020 07:51:17 +0000 (UTC)
IronPort-SDR: nN+V+jnyQm6cWvgEA9X6bajFnHm7joBaduUyC4EIw2VtjW4Ch0j5rEkinfoZHfuQ3zqONKkWEL
 c7cjcJu6Q/mg==
X-IronPort-AV: E=McAfee;i="6000,8403,9816"; a="152084906"
X-IronPort-AV: E=Sophos;i="5.78,371,1599548400"; d="scan'208";a="152084906"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2020 23:51:17 -0800
IronPort-SDR: cYwNuz85mOelSJdinQt9k2AexzCxcJjdgmNR5WafQu8Cl5LGKF2DPqSRbRCcbdGkwKdW5ZGDuk
 6JhviFHL/1IA==
X-IronPort-AV: E=Sophos;i="5.78,371,1599548400"; d="scan'208";a="535652412"
Received: from genxfsim-desktop.iind.intel.com ([10.223.74.178])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2020 23:51:14 -0800
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v6 00/18] HDCP 2.2 and HDCP 1.4 Gen12 DP MST support
Date: Thu, 26 Nov 2020 13:07:04 +0530
Message-Id: <20201126073722.19107-1-anshuman.gupta@intel.com>
X-Mailer: git-send-email 2.26.2
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
Cc: jani.nikula@intel.com, uma.shankar@intel.com, seanpaul@chromium.org,
 Anshuman Gupta <anshuman.gupta@intel.com>, juston.li@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is v6 version to test with IGT https://patchwork.freedesktop.org/series/82987/
This v6 has added a new patch to series to avoid a crash reported on Chrome-OS
and has addressed the few cosmetics review comments from Ram.
It has been also tested manually with above IGT series.

[PATCH v6 12/18] misc/mei/hdcp: Fix AUTH_STREAM_REQ cmd buffer len
has an Ack from Tomas to merge it via drm-intel.

[PATCH v6 13/18] drm/hdcp: Max MST content streams
has an Ack from drm-misc maintainer to merge it via drm-intel.

Test-with: 20201126050320.2434-2-karthik.b.s@intel.com

Anshuman Gupta (18):
  drm/i915/hdcp: Update CP property in update_pipe
  drm/i915/hdcp: Get conn while content_type changed
  drm/i915/hotplug: Handle CP_IRQ for DP-MST
  drm/i915/hdcp: No HDCP when encoder is't initialized
  drm/i915/hdcp: DP MST transcoder for link and stream
  drm/i915/hdcp: Move HDCP enc status timeout to header
  drm/i915/hdcp: HDCP stream encryption support
  drm/i915/hdcp: Enable HDCP 1.4 stream encryption
  drm/i915/hdcp: Enable Gen12 HDCP 1.4 DP MST support
  drm/i915/hdcp: Pass dig_port to intel_hdcp_init
  drm/i915/hdcp: Encapsulate hdcp_port_data to dig_port
  misc/mei/hdcp: Fix AUTH_STREAM_REQ cmd buffer len
  drm/hdcp: Max MST content streams
  drm/i915/hdcp: MST streams support in hdcp port_data
  drm/i915/hdcp: Pass connector to check_2_2_link
  drm/i915/hdcp: Add HDCP 2.2 stream register
  drm/i915/hdcp: Support for HDCP 2.2 MST shim callbacks
  drm/i915/hdcp: Enable HDCP 2.2 MST support

 drivers/gpu/drm/i915/display/intel_ddi.c      |  14 +-
 drivers/gpu/drm/i915/display/intel_ddi.h      |   6 +-
 .../drm/i915/display/intel_display_types.h    |  20 +-
 drivers/gpu/drm/i915/display/intel_dp.c       |  14 +-
 drivers/gpu/drm/i915/display/intel_dp_hdcp.c  | 186 +++++++++--
 drivers/gpu/drm/i915/display/intel_dp_mst.c   |   8 +-
 drivers/gpu/drm/i915/display/intel_hdcp.c     | 303 ++++++++++++++----
 drivers/gpu/drm/i915/display/intel_hdcp.h     |   8 +-
 drivers/gpu/drm/i915/display/intel_hdmi.c     |  19 +-
 drivers/gpu/drm/i915/i915_reg.h               |  31 ++
 drivers/misc/mei/hdcp/mei_hdcp.c              |   3 +-
 include/drm/drm_hdcp.h                        |   8 +-
 12 files changed, 500 insertions(+), 120 deletions(-)

-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
