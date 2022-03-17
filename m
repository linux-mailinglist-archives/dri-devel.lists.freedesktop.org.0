Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 429D44DCB7F
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 17:33:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0401910E07E;
	Thu, 17 Mar 2022 16:33:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D3E010E07E;
 Thu, 17 Mar 2022 16:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647534805; x=1679070805;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ClFxA7FG7iEfGBPNe1EsdcRNeAYoPvcPz27Rh5g+RI0=;
 b=jci9tRfTj0pHGbvg/sSkZOILSa5Kg44pfzySEl77vocBnG7UjOn3Yq4B
 N9exJTD74KEfKe2MqW1Q7kZjGEL3iNucTN/2GIRNzZMaEOEdW4zdqz3de
 2XBZp3H3YwA9fF5ryvAxhQfud7KHhNApv8JwT983lV8GmQ2jc2joHojMR
 +ADDxXiJEK388sh0isGavCYifhxFCEGVccBh92/Yiw/ObTJz6RPifmyDO
 3aotcchWmUOZikBQcvvUdOUBsdyPltQQZKsdiUWjKacH88Atov35IUt+g
 Q95MFryk0lj/fioYPctaVwEtqsCnj8J1FWsMOklA2VudW1JQk+1LjKbpW A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10289"; a="237522788"
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; d="scan'208";a="237522788"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2022 09:33:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; d="scan'208";a="558002908"
Received: from unknown (HELO slisovsk-Lenovo-ideapad-720S-13IKB.fi.intel.com)
 ([10.237.72.65])
 by orsmga008.jf.intel.com with ESMTP; 17 Mar 2022 09:33:16 -0700
From: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 0/2] Add DP MST DSC support to i915
Date: Thu, 17 Mar 2022 18:33:51 +0200
Message-Id: <20220317163353.4152-1-stanislav.lisovskiy@intel.com>
X-Mailer: git-send-email 2.24.1.485.gad05a3d8e5
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
Cc: manasi.d.navare@intel.com, Stanislav.Lisovskiy@intel.com,
 jani.saarinen@intel.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently we have only DSC support for DP SST.

Stanislav Lisovskiy (2):
  drm: Add missing DP DSC extended capability definitions.
  drm/i915: Add DSC support to MST path

 drivers/gpu/drm/dp/drm_dp.c                 |  25 ++++
 drivers/gpu/drm/i915/display/intel_dp.c     | 138 ++++++++++++++++--
 drivers/gpu/drm/i915/display/intel_dp.h     |  17 +++
 drivers/gpu/drm/i915/display/intel_dp_mst.c | 146 +++++++++++++++++++-
 include/drm/dp/drm_dp_helper.h              |  11 +-
 5 files changed, 320 insertions(+), 17 deletions(-)

-- 
2.24.1.485.gad05a3d8e5

