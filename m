Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D61C7EA7FF
	for <lists+dri-devel@lfdr.de>; Tue, 14 Nov 2023 01:59:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 577BD10E436;
	Tue, 14 Nov 2023 00:59:44 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78FB410E436;
 Tue, 14 Nov 2023 00:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699923583; x=1731459583;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=M8SfbTnpEl8NP1TBXXgwN9fGIAg4u7Hb0ARylFq4J4c=;
 b=ijwWr4cFJ1zOAaw8RqpSD9pWmyilctw0c7Gx/UhTexKu0agpccZpkv0O
 z0YoZzbCe4S7I3+EEUEFKy9ivUR15iNiiTRg6/y+dNQrv+6lGTxXseyY/
 dvkarVVzen/Dl5VmBTas9ZyrbkXfKfQzrmTUvIXPm9wOZmtA0jDcVYVXY
 uHdAtVLtlzWQBfsGVMYE19tgZna4HfT99S5dbB2rkmAFx+M9EvMWzMVo3
 qsFZ+/wNudtK2ozx24JnAMmCOOXghd+DzsG3CayKKKJ5ViSmPSkXK9TLJ
 8QJBdNg1d1+LN9BakkZOine34wzYKmoY22+JAKlODkTXwICDFWvZe4A6A g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="476758177"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; d="scan'208";a="476758177"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2023 16:59:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="714392475"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; d="scan'208";a="714392475"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orsmga003.jf.intel.com with ESMTP; 13 Nov 2023 16:59:42 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH v2 0/2] Selftest for FAST_REQUEST feature
Date: Mon, 13 Nov 2023 17:00:14 -0800
Message-ID: <20231114010016.234570-1-John.C.Harrison@Intel.com>
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

Add a selftest to verify that the FAST_REQUEST mechanism (getting
errors back from fire-and-forget H2G commands) is functional.

Also fix up a potential false positive in the GuC hang selftest.

v2: Fix some dumb over-complications and typos - review feedback from
Daniele.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>


John Harrison (2):
  drm/i915/guc: Fix for potential false positives in GuC hang selftest
  drm/i915/guc: Add a selftest for FAST_REQUEST errors

 drivers/gpu/drm/i915/gt/uc/intel_guc.h        |   4 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c     |   9 ++
 drivers/gpu/drm/i915/gt/uc/selftest_guc.c     | 115 ++++++++++++++++++
 .../drm/i915/gt/uc/selftest_guc_hangcheck.c   |   2 +-
 4 files changed, 129 insertions(+), 1 deletion(-)

-- 
2.41.0

