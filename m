Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA7D340FDAC
	for <lists+dri-devel@lfdr.de>; Fri, 17 Sep 2021 18:14:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ABF56EE4C;
	Fri, 17 Sep 2021 16:14:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60B976EE49;
 Fri, 17 Sep 2021 16:14:27 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10110"; a="209917774"
X-IronPort-AV: E=Sophos;i="5.85,301,1624345200"; d="scan'208";a="209917774"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2021 09:14:11 -0700
X-IronPort-AV: E=Sophos;i="5.85,301,1624345200"; d="scan'208";a="530886221"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2021 09:14:10 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
	matthew.d.roper@intel.com
Subject: [PATCH 0/2] Check SFC fusing on Xe_HP
Date: Fri, 17 Sep 2021 09:14:05 -0700
Message-Id: <20210917161407.812335-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Xe_HP adds some new fuse bits to indicate whether an SFC unit is fused
off.  We should utilize these when initializing VD/VE SFC access and
also when capturing/dumping SFC_DONE for the error state.

Matt Roper (2):
  drm/i915/xehp: Check new fuse bits for SFC availability
  drm/i915: Check SFC fusing before recording/dumping SFC_DONE

 drivers/gpu/drm/i915/gt/intel_engine_cs.c | 25 ++++++++++++++++++-----
 drivers/gpu/drm/i915/gt/intel_gt_types.h  |  3 +++
 drivers/gpu/drm/i915/gt/intel_sseu.c      |  5 ++---
 drivers/gpu/drm/i915/i915_gpu_error.c     |  6 ++++--
 drivers/gpu/drm/i915/i915_reg.h           |  4 ++--
 5 files changed, 31 insertions(+), 12 deletions(-)

-- 
2.33.0

