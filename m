Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9907C6E6BEB
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 20:17:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C77DA10E83D;
	Tue, 18 Apr 2023 18:17:55 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62ABE10E834;
 Tue, 18 Apr 2023 18:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681841873; x=1713377873;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=a5Z7gln85pX4C02Pfg5AI+fVLMW0c92ckdYG0XBEHAo=;
 b=NPcUZXtfCZamPOfcMvpqICJDVQ8nJCJ5jSSoJJhuxsm3+ZDs0Sl3e6AX
 sJ2UAU/vfA3vKtxVEFQnE/+hTvo+kOLX0a4TjCj5IiOShFwXTfMDJv0TQ
 vnYhIzR1yC4zO4Azr+znb6pbFji580iufgQfegyn6jKBqU+Kx5S8jW4Yo
 9DXfUpw+CagpR+wB+uKYUG+vGBrtTLrroZ8edD83wonx93qY6Po/NQLg7
 6xG2ia4nj/XNxe2C2woAoZ4aNOqw5eUYAeRA8SRBQ1eHcTt8EnK3Up38P
 KOkbPOAqwTjzH75gwowD00CcEF8zkISLhH7hGvvJyM/fx95qOCk3OXA8q w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="348008876"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; d="scan'208";a="348008876"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2023 11:17:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="815307848"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; d="scan'208";a="815307848"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orsmga004.jf.intel.com with ESMTP; 18 Apr 2023 11:17:52 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH v2 0/2] Add support for dumping error captures via kernel
 logging
Date: Tue, 18 Apr 2023 11:17:42 -0700
Message-Id: <20230418181744.3251240-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.39.1
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

Sometimes, the only effective way to debug an issue is to dump all the
interesting information at the point of failure. So add support for
doing that.

v2: Extra CONFIG wrapping (review feedback from Rodrigo)

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>


John Harrison (2):
  drm/i915: Dump error capture to kernel log
  drm/i915/guc: Dump error capture to dmesg on CTB error

 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c |  53 +++++++++
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h |   6 +
 drivers/gpu/drm/i915/i915_gpu_error.c     | 132 ++++++++++++++++++++++
 drivers/gpu/drm/i915/i915_gpu_error.h     |  10 ++
 4 files changed, 201 insertions(+)

-- 
2.39.1

