Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F26DC8258BC
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jan 2024 17:57:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2800C10E671;
	Fri,  5 Jan 2024 16:57:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C87E510E65B
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jan 2024 16:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704473876; x=1736009876;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=h6HvZG47HI1p7Fjydy/1sDee/An1eRbch/zEHUQfiqw=;
 b=OzhqpUeazFeO7kpIAiLpUkY5KKyJmYQIZB1vvO8lw6Ljcj3WVBHihnS1
 YI5F7lIrP3uIKUsHDCzS7MdVDbnm34l7g86aZp66PLbPgpKV0UzKGUyED
 pMxCDf6zFgEksgN+pAeKscuAsCK8rHKD7b6QO0b6e/87ATW7v5R8+NtJr
 p4GJjhZJ9q53CsePYc4yiPXuUJHuLGUyhAGkJOj2m6BBDnP6cFkSHcsJ2
 VMKaMR18ywHCkIQzql6oUZYq2OHaUJQNKfpahXkkbvUqdDmCCKvmgi1mN
 8bb7fb8gWRS/M6CYrWBAdrqI48N3eL8tWVE4iAZpGg3C6StSg0dLcYmC2 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10944"; a="11023531"
X-IronPort-AV: E=Sophos;i="6.04,334,1695711600"; d="scan'208";a="11023531"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2024 08:57:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10944"; a="780818060"
X-IronPort-AV: E=Sophos;i="6.04,334,1695711600"; d="scan'208";a="780818060"
Received: from amaslenx-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.36.106])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2024 08:57:52 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/2] drm: remove drm_connector_helper_get_modes_from_ddc()
Date: Fri,  5 Jan 2024 18:57:47 +0200
Message-Id: <cover.1704473654.git.jani.nikula@intel.com>
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
Cc: Jani Nikula <jani.nikula@intel.com>, Dave Airlie <airlied@redhat.com>,
 Jocelyn Falempe <jfalempe@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert mgag200 to use struct drm_edid directly, and drop
drm_connector_helper_get_modes_from_ddc(), as suggested by Thomas.

This supersedes [1].

BR,
Jani.


[1] https://lore.kernel.org/all/20231114105815.4188901-1-jani.nikula@intel.com/

Jani Nikula (2):
  drm/mgag200: convert get modes to struct drm_edid
  drm/probe-helper: remove unused
    drm_connector_helper_get_modes_from_ddc()

 drivers/gpu/drm/drm_probe_helper.c     | 36 --------------------------
 drivers/gpu/drm/mgag200/mgag200_mode.c | 14 +++++++---
 include/drm/drm_probe_helper.h         |  1 -
 3 files changed, 10 insertions(+), 41 deletions(-)

-- 
2.39.2

