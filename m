Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B2554285C
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 09:50:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28F3D10ED22;
	Wed,  8 Jun 2022 07:50:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED1B210E738;
 Wed,  8 Jun 2022 07:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654674650; x=1686210650;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fz/8ASWKVrmmWK4jMJXoaUGQbcKyBP3/Xu52wX7LN+8=;
 b=hg+ilUaPNakGyhyVnCnU749xeZysFMZDx4HBw/bXw16gVx0XQscFJ6XL
 KfTYjYSi7OEXG0PmW6UIX7rA+KYeqFgD1g/8l9AcyPS3PEG3VgqOt70KZ
 CMw0XKpmwKV3MldlVKAuNjM0Y12FynjU4TEmQLXJm9jk8SshIyvndvwTA
 yk3iBelY8psdp7hV4Cu9lVIGOgt6KNqBb50tBA4T4+6WqH2J+LYZ/bgF8
 /0MQMgRIix88GRW0yM5ich4BgGL+yAmXK2MX+xhcDPcR5MdNbmOl9B9vQ
 O1GL9PXfPJz3WuEjriSQbuEPr4Tv0menngyl6/hcd8zf2oLBje2aD/60A Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10371"; a="363142719"
X-IronPort-AV: E=Sophos;i="5.91,285,1647327600"; d="scan'208";a="363142719"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2022 00:50:50 -0700
X-IronPort-AV: E=Sophos;i="5.91,285,1647327600"; d="scan'208";a="636656820"
Received: from jkosticx-mobl.amr.corp.intel.com (HELO localhost)
 ([10.252.58.130])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2022 00:50:49 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 00/15] drm/edid: expand on struct drm_edid usage
Date: Wed,  8 Jun 2022 10:50:30 +0300
Message-Id: <cover.1654674560.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

v2 of [1], addressing review comments.

BR,
Jani.


[1] https://patchwork.freedesktop.org/series/104309/

Jani Nikula (15):
  drm/edid: fix CTA data block collection size for CTA version 3
  drm/edid: abstract cea data block collection size
  drm/edid: add block count and data helper functions for drm_edid
  drm/edid: keep track of alloc size in drm_do_get_edid()
  drm/edid: add new interfaces around struct drm_edid
  drm/edid: add drm_edid_connector_update()
  drm/probe-helper: abstract .get_modes() connector helper call
  drm/probe-helper: add drm_connector_helper_get_modes()
  drm/edid: add drm_edid_raw() to access the raw EDID data
  drm/i915/edid: convert DP, HDMI and LVDS to drm_edid
  drm/i915/bios: convert intel_bios_init_panel() to drm_edid
  drm/edid: do invalid block filtering in-place
  drm/edid: add HF-EEODB support to EDID read and allocation
  drm/edid: take HF-EEODB extension count into account
  drm/todo: add entry for converting the subsystem to struct drm_edid

 Documentation/gpu/todo.rst                    |  25 +
 drivers/gpu/drm/drm_connector.c               |   2 +
 drivers/gpu/drm/drm_edid.c                    | 572 ++++++++++++++++--
 drivers/gpu/drm/drm_probe_helper.c            |  63 +-
 drivers/gpu/drm/i915/display/intel_bios.c     |  23 +-
 drivers/gpu/drm/i915/display/intel_bios.h     |   4 +-
 .../gpu/drm/i915/display/intel_connector.c    |   4 +-
 .../drm/i915/display/intel_display_types.h    |   4 +-
 drivers/gpu/drm/i915/display/intel_dp.c       |  74 ++-
 drivers/gpu/drm/i915/display/intel_hdmi.c     |  26 +-
 drivers/gpu/drm/i915/display/intel_lvds.c     |  37 +-
 include/drm/drm_edid.h                        |  12 +
 include/drm/drm_probe_helper.h                |   1 +
 13 files changed, 692 insertions(+), 155 deletions(-)

-- 
2.30.2

