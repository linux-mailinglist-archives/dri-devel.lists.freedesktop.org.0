Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E83565A2410
	for <lists+dri-devel@lfdr.de>; Fri, 26 Aug 2022 11:19:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F69010E7B3;
	Fri, 26 Aug 2022 09:19:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E67410E7B3;
 Fri, 26 Aug 2022 09:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661505576; x=1693041576;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nLd6gjQyV3fDesUa2Odokf+rXrmseH6ILXsEjNGBei4=;
 b=JJB8QhoxpY8QlcMwVC0iLvoRBlaHCF961T7oUzIJF+iWIUxZGOpG5mMq
 GO9/sl+xIXkqTl5cSd2o/T+QM2hIcHEKnQtFqsG0xFMSMqwH4RPAa3YaD
 hzkPdSvreZG8IiWAJy/E86dxHXY+A1O6Jc0ItvSuuBo+Y2GtlpiOkWB1B
 aAHu+NhPWfW2vCumDLfVxIgaIuwVZZ83ILoyGLMVD4t3Pn7qhkb4knpBB
 6wkboqcyYDwX/a0oLDlf3Oomw54dvpebacjE2GxafEWTin0f93827qA4K
 GgQczrViV+lE802885K9ibKSACgYRqjUfoGxa0v/PHyjBCVui0aYET5qL A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10450"; a="274217122"
X-IronPort-AV: E=Sophos;i="5.93,264,1654585200"; d="scan'208";a="274217122"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2022 02:19:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,264,1654585200"; d="scan'208";a="752816366"
Received: from unknown (HELO slisovsk-Lenovo-ideapad-720S-13IKB.fi.intel.com)
 ([10.237.72.65])
 by fmsmga001.fm.intel.com with ESMTP; 26 Aug 2022 02:19:31 -0700
From: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 0/4] Add DP MST DSC support to i915
Date: Fri, 26 Aug 2022 12:20:15 +0300
Message-Id: <20220826092019.23151-1-stanislav.lisovskiy@intel.com>
X-Mailer: git-send-email 2.24.1.485.gad05a3d8e5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: manasi.d.navare@intel.com, vinod.govindapillai@intel.com,
 jani.nikula@intel.com, dri-devel@lists.freedesktop.org,
 Stanislav.Lisovskiy@intel.com, jani.saarinen@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently we have only DSC support for DP SST.

Stanislav Lisovskiy (4):
  drm: Add missing DP DSC extended capability definitions.
  drm/i915: Fix intel_dp_mst_compute_link_config
  drm/i915: Add DSC support to MST path
  drm/i915: Extract drm_dp_atomic_find_vcpi_slots cycle to separate
    function

 drivers/gpu/drm/i915/display/intel_dp.c     |  73 +++----
 drivers/gpu/drm/i915/display/intel_dp.h     |  17 ++
 drivers/gpu/drm/i915/display/intel_dp_mst.c | 202 ++++++++++++++++++--
 include/drm/display/drm_dp.h                |  10 +-
 4 files changed, 244 insertions(+), 58 deletions(-)

-- 
2.24.1.485.gad05a3d8e5

