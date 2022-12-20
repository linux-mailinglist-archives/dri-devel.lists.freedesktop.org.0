Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A5956518E6
	for <lists+dri-devel@lfdr.de>; Tue, 20 Dec 2022 03:42:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79AB210E338;
	Tue, 20 Dec 2022 02:41:19 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 346DB10E337;
 Tue, 20 Dec 2022 02:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671504070; x=1703040070;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wH91EP8jFjF6xj+MTbXY+ce1xpQDjyik/Iv0htTI8Ck=;
 b=VgV4tJj+t4epFIf7eZYskkIUknCLffbTOe7iBJnDjo2kTznAT0UDdB6N
 GUQ3OAkPra6WnlfBmj2t5JKiAac3sq5ZNtberGJQJ9zitYUfZJ4h4LFo3
 lcC1tCgimVv0F+95MVB0JzXF1Ajii365euQTsg6ifHjAP/defVSM33A2L
 dqYpVtgv+eKI4IEbqZgV2AYi70usoNLrN5ifhg+O2loYDjLMt73+CBXIx
 ww0giW2vPfcStAnR8yOTXz/c/z9kAO+xmFBXR1cmxrs9RfrbUBLJUveGA
 NU+98XD0qLURFWBN1jb8Hw8vXP7P5HKfxcuXlFfQtuvpwenhLNHT6spkb A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10566"; a="405761786"
X-IronPort-AV: E=Sophos;i="5.96,258,1665471600"; d="scan'208";a="405761786"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2022 18:41:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10566"; a="825062141"
X-IronPort-AV: E=Sophos;i="5.96,258,1665471600"; d="scan'208";a="825062141"
Received: from relo-linux-5.jf.intel.com ([10.165.21.201])
 by orsmga005.jf.intel.com with ESMTP; 19 Dec 2022 18:41:08 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 0/3] Fixes for various UC related issues
Date: Mon, 19 Dec 2022 18:41:44 -0800
Message-Id: <20221220024147.4118685-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.39.0
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

Fix a bunch of assorted issues with firmware loading and GuC
intialisation.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>


John Harrison (3):
  drm/i915/guc: Fix missing return code checks in submission init
  drm/i915/guc: Fix a static analysis warning
  drm/i915/uc: Fix two issues with over-size firmware files

 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 75 ++++++++++++++-----
 .../gpu/drm/i915/gt/uc/intel_guc_submission.h |  2 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc.c         |  7 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c      | 42 +++++++----
 4 files changed, 91 insertions(+), 35 deletions(-)

-- 
2.39.0

