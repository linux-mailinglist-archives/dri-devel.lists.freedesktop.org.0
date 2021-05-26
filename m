Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE40391FB9
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 20:53:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9867D6E1F4;
	Wed, 26 May 2021 18:53:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F9A06E1F4;
 Wed, 26 May 2021 18:53:26 +0000 (UTC)
IronPort-SDR: dEFKQdl0trO7l1oTq+5bB3t6/xrepZPSXMyvkBw2fs10uwJ0xW8VpDrfPAnfeui3imHqnL0Lgi
 /klfFhbSJowQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9996"; a="202579544"
X-IronPort-AV: E=Sophos;i="5.82,331,1613462400"; d="scan'208";a="202579544"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2021 11:53:25 -0700
IronPort-SDR: 57w6IyrhmgQTDT9XZf3m0gpXBa7GxLhPJTjC3NC8nIEd49zULFOCoUmmnoBpmEdnyDLk42Sx91
 g/hNuPKRWf/A==
X-IronPort-AV: E=Sophos;i="5.82,331,1613462400"; d="scan'208";a="477078154"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2021 11:53:25 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 0/1] Engine relative MMIO
Date: Wed, 26 May 2021 12:11:15 -0700
Message-Id: <20210526191116.44017-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
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
Cc: john.c.harrison@intel.com, tvrtko.ursulin@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As discussed in [1] we are breaking that large series into a several
smaller ones. This series is stand alone patch part of step #4 which has
no other dependencies or patches relevant to it.

Taking ownership of the patch in this series from John Harrison per his
request.

Trybot CI [2] looks good, let's try to get this reviewed a merged
quickly.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>

[1] https://patchwork.freedesktop.org/series/89844/
[2] https://patchwork.freedesktop.org/series/90573/

Matthew Brost (1):
  drm/i915: Engine relative MMIO

 drivers/gpu/drm/i915/gem/i915_gem_context.c  |  7 ++++---
 drivers/gpu/drm/i915/gt/intel_engine_cs.c    | 22 ++++++++++++++++++++
 drivers/gpu/drm/i915/gt/intel_engine_types.h |  3 +++
 drivers/gpu/drm/i915/gt/intel_gpu_commands.h |  6 ++++++
 drivers/gpu/drm/i915/gt/intel_lrc.c          |  4 +---
 5 files changed, 36 insertions(+), 6 deletions(-)

-- 
2.28.0

