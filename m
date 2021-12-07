Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 460D146C4AA
	for <lists+dri-devel@lfdr.de>; Tue,  7 Dec 2021 21:31:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 507D76E43A;
	Tue,  7 Dec 2021 20:31:49 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B483A6E43A;
 Tue,  7 Dec 2021 20:31:47 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10191"; a="237486058"
X-IronPort-AV: E=Sophos;i="5.87,295,1631602800"; d="scan'208";a="237486058"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2021 12:19:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,295,1631602800"; d="scan'208";a="657837937"
Received: from relo-linux-5.jf.intel.com ([10.165.21.134])
 by fmsmga001.fm.intel.com with ESMTP; 07 Dec 2021 12:19:32 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH v2 0/3] Assorted fixes/tweaks to GuC support
Date: Tue,  7 Dec 2021 12:19:29 -0800
Message-Id: <20211207201932.240050-1-John.C.Harrison@Intel.com>
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
improve code separation.

v2: Reposting as reduced set of patches due to CI failures.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>



John Harrison (3):
  drm/i915/uc: Allow platforms to have GuC but not HuC
  drm/i915/guc: Increase GuC log size for CONFIG_DEBUG_GEM
  drm/i915/guc: Don't go bang in GuC log if no GuC

 drivers/gpu/drm/i915/gt/uc/intel_guc_log.h    |  5 +-
 .../drm/i915/gt/uc/intel_guc_log_debugfs.c    |  4 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c      | 93 +++++++++++++------
 3 files changed, 69 insertions(+), 33 deletions(-)

-- 
2.25.1

