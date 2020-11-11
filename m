Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B06F12AE8FF
	for <lists+dri-devel@lfdr.de>; Wed, 11 Nov 2020 07:35:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7242789DA3;
	Wed, 11 Nov 2020 06:35:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18DCE89A62;
 Wed, 11 Nov 2020 06:35:07 +0000 (UTC)
IronPort-SDR: zTm46g1gn+VKXIo6zCAv67cWV6MkTxWv7VBQ+uuXRd8DhQE7vy+a9RLzKGQ6hHpAluXMwZ8b/2
 J2Zl1LSgfImA==
X-IronPort-AV: E=McAfee;i="6000,8403,9801"; a="166593667"
X-IronPort-AV: E=Sophos;i="5.77,468,1596524400"; d="scan'208";a="166593667"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2020 22:35:06 -0800
IronPort-SDR: SWDW0LgUDzqk9p69MwKscYk0+Cd9rnNcfpy9tTQKHvKgUNGjNLW4kzRwT4r4l31DmsEZWypFW/
 EGUjCbdm4dBw==
X-IronPort-AV: E=Sophos;i="5.77,468,1596524400"; d="scan'208";a="366139207"
Received: from genxfsim-desktop.iind.intel.com ([10.223.74.178])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2020 22:35:03 -0800
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v5 00/17] HDCP 2.2 and HDCP 1.4 Gen12 DP MST support
Date: Wed, 11 Nov 2020 11:50:34 +0530
Message-Id: <20201111062051.11529-1-anshuman.gupta@intel.com>
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

This is v5 version to test with IGT https://patchwork.freedesktop.org/series/82987/
This has addressed the review comments from Ram.
It has been also tested manually with above IGT series.

[PATCH v5 11/17] misc/mei/hdcp: Fix AUTH_STREAM_REQ cmd buffer len
has an Ack from Tomas to merge it via drm-intel.

[PATCH v5 12/17] drm/hdcp: Max MST content streams
has an Ack from drm-misc maintainer to merge it via drm-intel.

Test-with: 20201103082628.9287-2-karthik.b.s@intel.com

Anshuman Gupta (17):
  drm/i915/hdcp: Update CP property in update_pipe
  drm/i915/hdcp: Get conn while content_type changed
  drm/i915/hotplug: Handle CP_IRQ for DP-MST
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
 drivers/gpu/drm/i915/display/intel_dp_hdcp.c  | 182 +++++++++--
 drivers/gpu/drm/i915/display/intel_dp_mst.c   |  12 +-
 drivers/gpu/drm/i915/display/intel_hdcp.c     | 294 ++++++++++++++----
 drivers/gpu/drm/i915/display/intel_hdcp.h     |   8 +-
 drivers/gpu/drm/i915/display/intel_hdmi.c     |  19 +-
 drivers/gpu/drm/i915/i915_reg.h               |  31 ++
 drivers/misc/mei/hdcp/mei_hdcp.c              |   3 +-
 include/drm/drm_hdcp.h                        |   8 +-
 12 files changed, 489 insertions(+), 122 deletions(-)

-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
