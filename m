Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3028D47124D
	for <lists+dri-devel@lfdr.de>; Sat, 11 Dec 2021 07:59:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6521810E3C4;
	Sat, 11 Dec 2021 06:59:02 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE66F10E3A3;
 Sat, 11 Dec 2021 06:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639205940; x=1670741940;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mqUEUc+k0IVqvy59u65ruNbfLrjfne0QlF/whZ1qY3w=;
 b=jqkfCO8HGj4onbGtoxLMkywyvXTndk0rKhhG9pZqTxm3hKj9e/XkCLFi
 kY4TWfzpKNCx8nVjuyWQo4j40KtO364IH8uNI4g3QXd0vCysWOWFkEgnL
 wElSCAgtlxcO2M0zR1gbwdyZAT+VzDajBK3q0XMh+1oZCHl6lFHZlt6GO
 aEr/9m3wQdgbKOkNDaN3yrPBLI0JfpSLeOcqAYauKPcvSf7jSTrNqNl7s
 JXHFizZaLeFwlwAvFX/V06ganbvTXtJDIf82h/mBe2dQ12L0suwhfNtM+
 EzLV3ZHmEhyyRp77g4Ell4JQ++UQGO53zpbP9E9FVLRgeLLTkeoIQxCnj Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10194"; a="237249045"
X-IronPort-AV: E=Sophos;i="5.88,197,1635231600"; d="scan'208";a="237249045"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2021 22:59:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,197,1635231600"; d="scan'208";a="463979848"
Received: from relo-linux-5.jf.intel.com ([10.165.21.134])
 by orsmga006.jf.intel.com with ESMTP; 10 Dec 2021 22:58:59 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 0/4] More fixes/tweaks to GuC support
Date: Fri, 10 Dec 2021 22:58:55 -0800
Message-Id: <20211211065859.2248188-1-John.C.Harrison@Intel.com>
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

Allow engine resets on RCS, report problems with engine resets,
improve GuC log usability.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>


John Harrison (4):
  drm/i915/guc: Speed up GuC log dumps
  drm/i915/guc: Increase GuC log size for CONFIG_DEBUG_GEM
  drm/i915/guc: Flag an error if an engine reset fails
  drm/i915: Improve long running OCL w/a for GuC submission

 drivers/gpu/drm/i915/gt/intel_engine_cs.c     | 42 +++++++++++++-
 drivers/gpu/drm/i915/gt/intel_gt_debugfs.h    | 21 +++++--
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.h    |  5 +-
 .../drm/i915/gt/uc/intel_guc_log_debugfs.c    | 58 ++++++++++++++++++-
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 14 ++++-
 5 files changed, 125 insertions(+), 15 deletions(-)

-- 
2.25.1

