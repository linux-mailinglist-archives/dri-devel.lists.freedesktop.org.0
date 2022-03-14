Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E788E4D8B93
	for <lists+dri-devel@lfdr.de>; Mon, 14 Mar 2022 19:19:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5908810E2E4;
	Mon, 14 Mar 2022 18:19:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F83410E284;
 Mon, 14 Mar 2022 18:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647281976; x=1678817976;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yh8+7acVKRtWHd+4Hmsm7A+zWA9RuNdUb2dE1LADBeQ=;
 b=GYPWnBU2shUm7Vz9oC/m/yuF00nesTT74wsINOVpklbwTd/sjvxnqTO9
 cbJ7S8zoBHRgVL0SmcDnO8weUGmh8KTLyI4Zk1yySIfw2HS2hk4/Iz/hr
 Hv/NN+ZbyW0iz79q/8OMadLvG441BWMj0nrjukcBoSt3bpWikGewPqMMh
 WZlO+6chAh+Y1X/1QCsiapA8wCl0ZqsZvTtpLYoi5pSbGJj1O2WlSlL3Q
 /cOSZBjpJ2EWPplF0ifGhbpHQoIhLXv+tJXYjHQ0n3VeHCmFwILXnvR+D
 0IhwIuI4aaWA+nPlWyd75ofX5k/s9kJVKRgo1SdQFh0v473/LtDfrQ7wA Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10286"; a="238279093"
X-IronPort-AV: E=Sophos;i="5.90,181,1643702400"; d="scan'208";a="238279093"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2022 11:19:35 -0700
X-IronPort-AV: E=Sophos;i="5.90,181,1643702400"; d="scan'208";a="515549263"
Received: from ramaling-i9x.iind.intel.com ([10.203.144.108])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2022 11:19:33 -0700
From: Ramalingam C <ramalingam.c@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH 0/4] lrc selftest fixes
Date: Mon, 14 Mar 2022 23:50:01 +0530
Message-Id: <20220314182005.17071-1-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
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
Cc: Hellstrom Thomas <thomas.hellstrom@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Few bug fixes for lrc selftest.

Chris Wilson (4):
  drm/i915/gt: Explicitly clear BB_OFFSET for new contexts
  drm/i915/selftests: Check for incomplete LRI from the context image
  drm/i915/selftest: Clear the output buffers before GPU writes
  drm/i915/selftest: Always cancel semaphore on error

 drivers/gpu/drm/i915/gt/intel_engine_regs.h |   1 +
 drivers/gpu/drm/i915/gt/intel_lrc.c         |  17 +++
 drivers/gpu/drm/i915/gt/selftest_lrc.c      | 115 ++++++++++++++++----
 3 files changed, 113 insertions(+), 20 deletions(-)

-- 
2.20.1

