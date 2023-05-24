Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA84B71003A
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 23:56:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44F0810E61C;
	Wed, 24 May 2023 21:56:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AB8C10E619;
 Wed, 24 May 2023 21:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684965394; x=1716501394;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9pDWKhmIGW71pXhO6wwCf8iT2oJlIe8HinkMv3t7NH4=;
 b=VALUPsHYvjCxr0ykSacFvK2/RDAcezGAGSsJm7qxpMjMO88fituUtkgp
 XgfefNcQudbwXo/ff7FgJVnesxOrohwEug4IcCrwInnAlEJWCHIEbaoJ8
 b48xeBbWJEgTtqNHbNk7gXqoa3rP3ZzVZ4Scq0KSBsygZBd7/AdtywdIb
 LsWTZb+9JOXHteTVbrpAgSwh5A5+jIA+PdCRw5/DbUHjE91TrtKpGj+0b
 4cpOIl4r9teJeAppKiJizV/AXqTJ2jJP87zfJeYIpw4EK1kVn1nedWEza
 /DFDKJfWqym7AvWnhqmUYMd2S1vCVOkL2G41J0x8MKleycjtRQ1W7lJHi A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="343165155"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; d="scan'208";a="343165155"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2023 14:56:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="848929672"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; d="scan'208";a="848929672"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2023 14:56:33 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 0/2] drm/i915/pmu: couple of cleanups
Date: Wed, 24 May 2023 14:56:27 -0700
Message-Id: <20230524215629.97920-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.38.0
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, andrzej.hajda@intel.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

Ashutosh Dixit (2):
  drm/i915/pmu: Turn off the timer to sample frequencies when GT is
    parked
  drm/i915/pmu: Make PMU sample array two-dimensional

 drivers/gpu/drm/i915/i915_pmu.c | 32 ++++++++------------------------
 drivers/gpu/drm/i915/i915_pmu.h |  2 +-
 2 files changed, 9 insertions(+), 25 deletions(-)

-- 
2.38.0

