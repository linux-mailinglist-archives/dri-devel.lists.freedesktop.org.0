Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F88159341A
	for <lists+dri-devel@lfdr.de>; Mon, 15 Aug 2022 19:36:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBBCCCEFAC;
	Mon, 15 Aug 2022 17:36:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 857AB9526A;
 Mon, 15 Aug 2022 17:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660584906; x=1692120906;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=SYeZOvmFEK+unYWtvZ38DXSriLUm+nteXW9zgVlLf1c=;
 b=TeUOwRQD2Gw3uOiWXbh5bEGD8IgDZTc7acKWR+GkKuHs2rqn/hCA6hp6
 ThLkjlZTJ1l4NRwqEtUMCUIlVJD0FK4zuNQsebV5LgpUBA8VPEo5TjQvu
 QIBhEnVHCRO3hbS8tWVcKWLNEP6IcPWP8541Q69WPHqAGsxwGlk7vqEVS
 VEh4Ki7ItFRHZguJQSOHG2T07PkW+ltg7hGmDsWQMcw9VZXazjbl+DSJj
 UmL2MdO7hbiuIv243VMlVvkEQLCk9r2HmfysjV4ZprAGqB4xrctqdMh03
 x41T2Bw5DAbJ/kl3HB9n/RA/JcGHcii3tlUe4CpdCxn5yex1rBvD2OEAN Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10440"; a="292816823"
X-IronPort-AV: E=Sophos;i="5.93,238,1654585200"; d="scan'208";a="292816823"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2022 10:35:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,238,1654585200"; d="scan'208";a="582968273"
Received: from unknown (HELO slisovsk-Lenovo-ideapad-720S-13IKB.fi.intel.com)
 ([10.237.72.65])
 by orsmga006.jf.intel.com with ESMTP; 15 Aug 2022 10:35:02 -0700
From: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 0/2] Add DP MST DSC support to i915
Date: Mon, 15 Aug 2022 20:35:44 +0300
Message-Id: <20220815173546.8607-1-stanislav.lisovskiy@intel.com>
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
Cc: Stanislav.Lisovskiy@intel.com, jani.nikula@intel.com,
 manasi.d.navare@intel.com, jani.saarinen@intel.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently we have only DSC support for DP SST.

Stanislav Lisovskiy (2):
  drm: Add missing DP DSC extended capability definitions.
  drm/i915: Add DSC support to MST path

 drivers/gpu/drm/i915/display/intel_dp.c     |  76 ++++------
 drivers/gpu/drm/i915/display/intel_dp.h     |  17 +++
 drivers/gpu/drm/i915/display/intel_dp_mst.c | 157 ++++++++++++++++++++
 include/drm/display/drm_dp.h                |  10 +-
 4 files changed, 215 insertions(+), 45 deletions(-)

-- 
2.24.1.485.gad05a3d8e5

