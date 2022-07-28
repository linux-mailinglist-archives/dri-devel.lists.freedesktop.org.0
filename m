Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D3C583717
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jul 2022 04:43:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29F6410EB2B;
	Thu, 28 Jul 2022 02:42:35 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E942B10E086;
 Thu, 28 Jul 2022 02:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658976147; x=1690512147;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Kim/TCnvqinL0satPqUcBFQGiKxwVdlBuxIIltjTke8=;
 b=kIb1He09+3i/rL9ZgIUozNTw4ZouGCMj0IXJ0z5K4wgpiECsXEKkKRUy
 K/wcJ7crLpmARJUleE14D7K1+pGsf6ukWDmX+nuHX1dgslGnNRVhG4BRs
 2lBEfE5kQQeqIqqxgWFITpunjzS9F4RAUlUXzglS3neJ646m6nCnJKf2H
 aYwZX3D+X4HQIXsuxzgMd3gWxrSAMPPSRPawEKEF5QSPcpJPeOkguMfeS
 e7HfzomTOPOdPwgHT3ume4zLYMgS+xjLnkdHEk+nHZdVK0cgLsTBiMDjh
 UR3hRN3eO8P7/pw2u2ENphqcg41rHIHyIIzortsuTkU3oBNZhDgP+OuLZ g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10421"; a="271443538"
X-IronPort-AV: E=Sophos;i="5.93,196,1654585200"; d="scan'208";a="271443538"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2022 19:42:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,196,1654585200"; d="scan'208";a="690096036"
Received: from relo-linux-5.jf.intel.com ([10.165.21.134])
 by FMSMGA003.fm.intel.com with ESMTP; 27 Jul 2022 19:42:25 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 0/6] Random assortment of (mostly) GuC related patches
Date: Wed, 27 Jul 2022 19:42:19 -0700
Message-Id: <20220728024225.2363663-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Pushing a bunch of patches which had gotten forgotten about.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>


John Harrison (2):
  drm/i915/selftest: Cope with not having an RCS engine
  drm/i915/guc: Don't abort on CTB_UNUSED status

Matthew Brost (2):
  drm/i915/guc: Fix issues with live_preempt_cancel
  drm/i915/guc: Support larger contexts on newer hardware

Michał Winiarski (1):
  drm/i915/guc: Route semaphores to GuC for Gen12+

Rahul Kumar Singh (1):
  drm/i915/guc: Add selftest for a hung GuC

 drivers/gpu/drm/i915/gt/selftest_execlists.c  |  16 +-
 drivers/gpu/drm/i915/gt/selftest_hangcheck.c  |  12 +-
 .../gt/uc/abi/guc_communication_ctb_abi.h     |   8 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c    |  10 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c     |  18 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_reg.h    |   4 +
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  15 ++
 .../drm/i915/gt/uc/selftest_guc_hangcheck.c   | 159 ++++++++++++++++++
 .../drm/i915/selftests/i915_live_selftests.h  |   1 +
 9 files changed, 227 insertions(+), 16 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/gt/uc/selftest_guc_hangcheck.c

-- 
2.37.1

