Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E907A29D7
	for <lists+dri-devel@lfdr.de>; Fri, 15 Sep 2023 23:56:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A428010E69A;
	Fri, 15 Sep 2023 21:56:49 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E946110E69A;
 Fri, 15 Sep 2023 21:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694815007; x=1726351007;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+mTI0vv/DmTxAPIORvNe4wZEQACMBHfi4MXgVqy91Ik=;
 b=KdbA+ObjOcqTKwHB/ZitdpltxLUlrtQteUIoEQg16HAgRvHQKSsXRgPD
 h1x/UjltAMBWPo1h0/9fSUGUV1TqwALPx5leZrkryVegKGsXY0cLNVFCT
 a9TGGWC81ImkqlFD52heR6SZ3sbmixQzMyQ3nkdYrb/ObsnzpvUWr30rr
 77stVu6a1K3BEPpANeTmoim+I8F7ag1xivd7OgHlOJtHdROPgqm43PBGN
 GqFQTwkovPkDN0xfZPaz3Y6H70sO0WR8QtqiFt/hcXo8Ojr8hSxY8r+hX
 7cLAzJQyZU/S8ZYRUJSNf+0sIpPHGudXhn3jUX8ZIyVOzydUoQMZLxGRf g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="410297706"
X-IronPort-AV: E=Sophos;i="6.02,150,1688454000"; d="scan'208";a="410297706"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 14:56:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="918792862"
X-IronPort-AV: E=Sophos;i="6.02,150,1688454000"; d="scan'208";a="918792862"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orsmga005.jf.intel.com with ESMTP; 15 Sep 2023 14:56:34 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 0/4] Enable Wa_14019159160 and  Wa_16019325821 for MTL
Date: Fri, 15 Sep 2023 14:55:33 -0700
Message-ID: <20230915215537.220331-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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
Cc: John Harrison <John.C.Harrison@Intel.com>, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

Enable Wa_14019159160 and  Wa_16019325821 for MTL

RCS/CCS workarounds for MTL.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>


John Harrison (4):
  drm/i915/guc: Update 'recommended' version to 70.11.0 for
    DG2/ADL-P/MTL
  drm/i915: Enable Wa_16019325821
  drm/i915/guc: Add support for w/a KLVs
  drm/i915/guc: Enable Wa_14019159160

 drivers/gpu/drm/i915/gt/gen8_engine_cs.c      | 22 +++--
 drivers/gpu/drm/i915/gt/intel_engine_types.h  |  8 +-
 .../gpu/drm/i915/gt/uc/abi/guc_errors_abi.h   |  1 +
 drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h |  7 ++
 drivers/gpu/drm/i915/gt/uc/intel_guc.c        |  5 ++
 drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  3 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c    | 88 ++++++++++++++++++-
 drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c     |  6 ++
 drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h   |  8 +-
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  9 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c      |  6 +-
 11 files changed, 145 insertions(+), 18 deletions(-)

-- 
2.41.0

