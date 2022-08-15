Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0EC6592B12
	for <lists+dri-devel@lfdr.de>; Mon, 15 Aug 2022 10:59:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5594C18AAA0;
	Mon, 15 Aug 2022 08:59:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70CA110F0EF;
 Mon, 15 Aug 2022 08:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660553922; x=1692089922;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FDpzsd8qj8sF368RGiA05Q+UhVmX8KeR7Xyc8oVjmQs=;
 b=DSMAkjtI7h4nnLQs7cPMSURYfae/MdxqTfBM40zH19z/LJ3OIEiEgx5s
 wyv9ZyqcFSDDN/wjkLXKJOXT8g5v0p6wsrAW0hNg8UboK/MY0hK8pFeny
 B4SuU1yIf63czE4dJDVLZ9Ygprsglp+q0FnRZHtW65MykOwgPrgqkwVV3
 CwQz8OPu2njSzku5tAgekZ6P3O4Cp93KUSOmuRWwtMvQd0zQ7XA0dNIW/
 OnWqcrjJwzZFjNQp4gTYGhyxTbRYPhw3FNAoUY2AQMZudODru7GFOw5Ep
 cJ3QqimNxOkTxmkoEPwE1/YspGlY8i2UcFYrwUMcqqDwDbKkDnSgFVlYG w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10439"; a="353663509"
X-IronPort-AV: E=Sophos;i="5.93,238,1654585200"; d="scan'208";a="353663509"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2022 01:58:40 -0700
X-IronPort-AV: E=Sophos;i="5.93,238,1654585200"; d="scan'208";a="666595968"
Received: from abelova-mobl2.ccr.corp.intel.com (HELO localhost)
 ([10.252.50.172])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2022 01:58:38 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/2] drm/dp: add drm_dp_phy_name() and use it in i915
Date: Mon, 15 Aug 2022 11:58:33 +0300
Message-Id: <cover.1660553850.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.34.1
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

v2 of https://patchwork.freedesktop.org/series/96017/

Jani Nikula (2):
  drm/dp: add drm_dp_phy_name() for getting DP PHY name
  drm/i915/dp: use drm_dp_phy_name() for logging

 drivers/gpu/drm/display/drm_dp_helper.c       | 32 +++++++
 .../drm/i915/display/intel_dp_link_training.c | 83 ++++++++-----------
 include/drm/display/drm_dp_helper.h           |  2 +
 3 files changed, 70 insertions(+), 47 deletions(-)

-- 
2.34.1

