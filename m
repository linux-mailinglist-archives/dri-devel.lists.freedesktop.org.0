Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 402FD466E46
	for <lists+dri-devel@lfdr.de>; Fri,  3 Dec 2021 01:06:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C457B6FD00;
	Fri,  3 Dec 2021 00:06:42 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B748C6FC9E;
 Fri,  3 Dec 2021 00:06:40 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10186"; a="224114166"
X-IronPort-AV: E=Sophos;i="5.87,283,1631602800"; d="scan'208";a="224114166"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2021 16:06:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,283,1631602800"; d="scan'208";a="513445209"
Received: from relo-linux-5.jf.intel.com ([10.165.21.134])
 by orsmga008.jf.intel.com with ESMTP; 02 Dec 2021 16:06:23 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 0/4] Assorted fixes/tweaks to GuC support
Date: Thu,  2 Dec 2021 16:06:19 -0800
Message-Id: <20211203000623.3086309-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.25.1
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

Fix a potential null pointer dereference, improve debug crash reports,
improve code separation, improve GuC/HuC load performance.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>



John Harrison (3):
  drm/i915/uc: Allow platforms to have GuC but not HuC
  drm/i915/guc: Increase GuC log size for CONFIG_DEBUG_GEM
  drm/i915/guc: Don't go bang in GuC log if no GuC

Vinay Belgaumkar (1):
  drm/i915/guc: Request RP0 before loading firmware

 drivers/gpu/drm/i915/gt/intel_rps.c           | 59 ++++++++++++
 drivers/gpu/drm/i915/gt/intel_rps.h           |  2 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.h    |  5 +-
 .../drm/i915/gt/uc/intel_guc_log_debugfs.c    |  4 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc.c         |  6 ++
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c      | 93 +++++++++++++------
 drivers/gpu/drm/i915/i915_reg.h               |  4 +
 7 files changed, 140 insertions(+), 33 deletions(-)

-- 
2.25.1

