Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C2715A4695
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 11:57:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DDA610F146;
	Mon, 29 Aug 2022 09:57:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B1BC10F135;
 Mon, 29 Aug 2022 09:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661767067; x=1693303067;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1/WC0STSVuD6OMeZYN8vZR6OiptU4XaBw+g+tWXqM8k=;
 b=SKRhP57bow6BQMLYJNUZmyID/x0VldYOffYxJuGepnQF4ZX6vmcuIs5e
 Rg4nRzWD7m6zRwGlnl2wzEhbFLzCaY03+qEfpcdye82ZSkCrTAFv9KioG
 pMt/6F6GNH5wY9NlFT4Qp9Z96PZ+npdhuL2cTmXrKtb5WKQ3FZK+7498j
 kdpvPlEywybxyn63lUq2kVCX/kTu+23JKxUwhTo0GFMAXw4N93twQAJs8
 lEo3C8xutlZfNekSi0Bc1Ob9XIpuzeKDQhjnQUeY8LQpwDCtKIAcfVhIJ
 l6gG/HuI79bPXdsW2cWcjuikl0ooo4Jss6AghbQ/buz1OfB3EMH1t6mu+ A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10453"; a="293601509"
X-IronPort-AV: E=Sophos;i="5.93,272,1654585200"; d="scan'208";a="293601509"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2022 02:57:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,272,1654585200"; d="scan'208";a="700527725"
Received: from unknown (HELO slisovsk-Lenovo-ideapad-720S-13IKB.fi.intel.com)
 ([10.237.72.65])
 by FMSMGA003.fm.intel.com with ESMTP; 29 Aug 2022 02:57:44 -0700
From: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 0/4] Add DP MST DSC support to i915
Date: Mon, 29 Aug 2022 12:58:28 +0300
Message-Id: <20220829095832.21770-1-stanislav.lisovskiy@intel.com>
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
 drivers/gpu/drm/i915/display/intel_dp_mst.c | 205 ++++++++++++++++++--
 include/drm/display/drm_dp.h                |  10 +-
 4 files changed, 246 insertions(+), 59 deletions(-)

-- 
2.24.1.485.gad05a3d8e5

