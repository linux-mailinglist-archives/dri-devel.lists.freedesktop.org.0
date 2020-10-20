Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66BC7293DA1
	for <lists+dri-devel@lfdr.de>; Tue, 20 Oct 2020 15:49:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53D046ECA1;
	Tue, 20 Oct 2020 13:49:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D7816ECA1;
 Tue, 20 Oct 2020 13:49:37 +0000 (UTC)
IronPort-SDR: DClain8hHX1hoH8kRywcXolrVRznGom7Zp0Xtb0awmj5bKoz5L0uEp17Nj9nfD+7aD9fZ8o9gF
 G5UiTbXjarvA==
X-IronPort-AV: E=McAfee;i="6000,8403,9779"; a="184837486"
X-IronPort-AV: E=Sophos;i="5.77,397,1596524400"; d="scan'208";a="184837486"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2020 06:49:36 -0700
IronPort-SDR: ai/70cqnfmXF/bleRMlXs6irPpCpSoGiTc9jgzT3w579hmNMctfG7NsZXsRV6HiYdu6xhDKSEB
 2R/MsvdxRfkg==
X-IronPort-AV: E=Sophos;i="5.77,397,1596524400"; d="scan'208";a="465934906"
Received: from genxfsim-desktop.iind.intel.com ([10.223.74.178])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2020 06:49:33 -0700
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 00/15] HDCP 2.2 DP MST Support 
Date: Tue, 20 Oct 2020 19:08:51 +0530
Message-Id: <20201020133906.23710-1-anshuman.gupta@intel.com>
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
Cc: jani.nikula@intel.com, seanpaul@chromium.org, juston.li@intel.com,
 Anshuman Gupta <anshuman.gupta@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

v2 version of this series has added below two patch in this series.
[PATCH v2 09/15] misc/mei/hdcp: Fix AUTH_STREAM_REQ cmd buffer len
[PATCH v2 10/15] drm/hdcp: Max MST content streams
([PATCH v2 10/15] has received an Ack from drm-misc maintainer 
in separate patch https://patchwork.freedesktop.org/series/82806/) 

This series has been tested with IGT changes to do
a single commit to enable HDCP on all DP-MST connector.

HDCP 2.2 support over DP MST actually starts
from patch [PATCH 07/13] Pass dig_port to intel_hdcp_init

Other patches of this series has already floated for
Gen12 HDCP 1.4 DP MST support
(https://patchwork.freedesktop.org/series/81289/)
and HDCP over MST misc series.
(https://patchwork.freedesktop.org/series/82605/)

Anshuman Gupta (15):
  drm/i915/hdcp: Update CP property in update_pipe
  drm/i915/hotplug: Handle CP_IRQ for DP-MST
  drm/i915/hdcp: DP MST transcoder for link and stream
  drm/i915/hdcp: Move HDCP enc status timeout to header
  drm/i915/hdcp: HDCP stream encryption support
  drm/i915/hdcp: Enable Gen12 HDCP 1.4 DP MST support
  drm/i915/hdcp: Pass dig_port to intel_hdcp_init
  drm/i915/hdcp: Encapsulate hdcp_port_data to dig_port
  misc/mei/hdcp: Fix AUTH_STREAM_REQ cmd buffer len
  drm/hdcp: Max MST content streams
  drm/i915/hdcp: mst streams support in hdcp port_data
  drm/i915/hdcp: Pass connector to check_2_2_link
  drm/i915/hdcp: Add HDCP 2.2 stream register
  drm/i915/hdcp: Support for HDCP 2.2 MST shim callbacks
  drm/i915/hdcp: Enable HDCP 2.2 MST support

 drivers/gpu/drm/i915/display/intel_ddi.c      |  12 +-
 drivers/gpu/drm/i915/display/intel_ddi.h      |   6 +-
 .../drm/i915/display/intel_display_types.h    |  20 +-
 drivers/gpu/drm/i915/display/intel_dp.c       |  14 +-
 drivers/gpu/drm/i915/display/intel_dp_hdcp.c  | 168 +++++++++--
 drivers/gpu/drm/i915/display/intel_dp_mst.c   |  12 +-
 drivers/gpu/drm/i915/display/intel_hdcp.c     | 282 ++++++++++++++----
 drivers/gpu/drm/i915/display/intel_hdcp.h     |   8 +-
 drivers/gpu/drm/i915/display/intel_hdmi.c     |  19 +-
 drivers/gpu/drm/i915/i915_reg.h               |  31 ++
 drivers/misc/mei/hdcp/mei_hdcp.c              |   3 +-
 include/drm/drm_hdcp.h                        |   8 +-
 12 files changed, 463 insertions(+), 120 deletions(-)

-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
