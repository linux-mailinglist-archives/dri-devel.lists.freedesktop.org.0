Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2092567FA9B
	for <lists+dri-devel@lfdr.de>; Sat, 28 Jan 2023 20:59:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6035F10E078;
	Sat, 28 Jan 2023 19:59:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B903010E070;
 Sat, 28 Jan 2023 19:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674935960; x=1706471960;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GBGOcAYNHkidSthvS8N2hrSP6zC78Yyz3aBcX9zOCPQ=;
 b=RxZo9wuuwRsfnW5hHX7ZXm9bdwqRRzelUlLQq6/l4D6upOHSMMkTBjX5
 vkVE3XDX1buWv+WL9Xuq0Mi+SOyjeOxF+Lo1zsapJdBdDmPWLrYpZj9V/
 aDeyHfel+9dzj5IBj0/BPpFrfBC4ICe0ZG2zlFQQNEn5Fn7MuFu9gs1x/
 3GMRBGY2F1O0i3KqTcRgJam8fDO1dPMUJLZXb/XxU++gSnuCeyIThyCIe
 a11kr3HEt99XJwOQ8oMMt1ixyiYdr61amuZuUxAjmwlOk965uooojT96n
 RuQb+2JszvS/MQWvDuf32RoJksUaCm2smRcd2JSdTOYWP97c4CourQIhY w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="306978114"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; d="scan'208";a="306978114"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2023 11:59:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="613567921"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; d="scan'208";a="613567921"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orsmga003.jf.intel.com with ESMTP; 28 Jan 2023 11:59:18 -0800
Received: from mwajdecz-MOBL.ger.corp.intel.com
 (mwajdecz-MOBL.ger.corp.intel.com [10.249.137.106])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 07718333EC;
 Sat, 28 Jan 2023 19:59:16 +0000 (GMT)
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 0/8] GuC oriented print macros
Date: Sat, 28 Jan 2023 20:58:59 +0100
Message-Id: <20230128195907.1837-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>, dri-devel@lists.freedesktop.org,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a follow up series for existing commit 67804e48b494
("drm/i915/gt: Start adding module oriented dmesg output")
that was focusing just on the GT.

Now extend changes to uc/ folder and focus on the GuC.

v2: applying feedback from John
v3: more feedback from John

Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>	

Michal Wajdeczko (8):
  drm/i915/guc: Add GuC oriented print macros
  drm/i915/guc: Update GuC messages in intel_guc.c
  drm/i915/guc: Update GuC messages in intel_guc_ads.c
  drm/i915/guc: Update GuC messages in intel_guc_ct.c
  drm/i915/guc: Update GuC messages in intel_guc_fw.c
  drm/i915/guc: Update GuC messages in intel_guc_log.c
  drm/i915/guc: Update GuC messages in intel_guc_submission.c
  drm/i915/guc: Update GT/GuC messages in intel_uc.c

 drivers/gpu/drm/i915/gt/uc/intel_guc.c        | 31 ++++---
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c    |  8 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c     | 23 +-----
 drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c     | 17 ++--
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.c    | 38 ++++-----
 drivers/gpu/drm/i915/gt/uc/intel_guc_print.h  | 48 +++++++++++
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 61 ++++++--------
 drivers/gpu/drm/i915/gt/uc/intel_uc.c         | 80 +++++++++----------
 8 files changed, 164 insertions(+), 142 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_guc_print.h

-- 
2.25.1

