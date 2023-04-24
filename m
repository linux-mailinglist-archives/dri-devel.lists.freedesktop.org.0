Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F7046ED234
	for <lists+dri-devel@lfdr.de>; Mon, 24 Apr 2023 18:11:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B911910E1A6;
	Mon, 24 Apr 2023 16:11:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1DEE10E1A6;
 Mon, 24 Apr 2023 16:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682352703; x=1713888703;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jABK15YiphsYfiscTtHzZO8ulLqkFThb+aET7bDonzk=;
 b=eeX573qxHeI39Zy2gRcntBywohfIZoY0jfZJs7hnYrgln8ui04CXkop6
 /MmU+/a6pBBqhdopyHjlypWaculqKzT2ns6G081ZdFObqU0dASzMQZMcH
 VDC5x4fZQE6SR0RPkWe3pDXS1pRou2zMtQl+WWQ9yP6JhR5mVhiJhJe+f
 7drCzK2qFd+GBlC83n1jMN36d+iSBp2ji7VX/H2mvi3i/ccn05nCgs5Ug
 6Kyi6xtSfv6L2hW7wuUYoWK2T+GLaptD7BfTNnM9na5GsIZ4kdqvcsVmw
 lR1p/9bx+GDnTfwUTSKvkcwD0myBgbyIQxF9ZzW5suo12PPQPsDYYcqoo g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="349293201"
X-IronPort-AV: E=Sophos;i="5.99,223,1677571200"; d="scan'208";a="349293201"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2023 09:09:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="867533873"
X-IronPort-AV: E=Sophos;i="5.99,223,1677571200"; d="scan'208";a="867533873"
Received: from apalfi-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.252.34.175])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2023 09:09:23 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Intel GFX <intel-gfx@lists.freedesktop.org>,
 DRI Devel <dri-devel@lists.freedesktop.org>, Fei Yang <fei.yang@intel.com>
Subject: [PATCH 0/2] Restore MTL boot
Date: Mon, 24 Apr 2023 18:09:11 +0200
Message-Id: <20230424160913.19886-1-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.40.0
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
Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Lucas Martins De Marchi <lucas.demarchi@intel.com>,
 Andi Shyti <andi.shyti@kernel.org>, Andi Shyti <andi.shyti@linux.intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

The two patches reverted in this series are, together, preventing
MTL from booting.

Revert them until the fix is deployed.

Andi

Andi Shyti (2):
  Revert "drm/i915/mtl: fix mocs selftest"
  Revert "drm/i915/mtl: Define MOCS and PAT tables for MTL"

 drivers/gpu/drm/i915/gt/intel_gt_regs.h |  6 +--
 drivers/gpu/drm/i915/gt/intel_gtt.c     | 47 +----------------
 drivers/gpu/drm/i915/gt/intel_gtt.h     |  8 ---
 drivers/gpu/drm/i915/gt/intel_mocs.c    | 70 +------------------------
 drivers/gpu/drm/i915/gt/selftest_mocs.c |  3 +-
 5 files changed, 4 insertions(+), 130 deletions(-)

-- 
2.40.0

