Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC2551524C
	for <lists+dri-devel@lfdr.de>; Fri, 29 Apr 2022 19:32:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B38010EEF0;
	Fri, 29 Apr 2022 17:32:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37E5410EEF0;
 Fri, 29 Apr 2022 17:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651253564; x=1682789564;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=oEBXYP9vbBqH7eIQaWII2rMukoVV/BS/6hLzq0k6zLw=;
 b=HQJYc1dqGjMoShZwT9HWA0nWGCIN0o/lmMBHfp7xo+vcQhNJISmrhVvy
 jmqLQZlKytJiQfsg/qr4K+UdN5agZcXcc2CodW7ydVXKmnDfscitE2t0r
 JKXwWx29ehaEnYk29LBFyRhvK5twWf+mZ/Brcqi1WJeVckhVrSQO4t1tN
 Edr4YHklRm7JuMvdIpwxrkUxnIq7eA6qxfjq8RoSe+b2l4Lx6iYDG/ooz
 a1DFzjIBEb8Cwd+jDloTc3eEpe6bL5ESIONObl7opoE4RyaASO7m0nqK+
 VZYa3sub5lveTsjbYrdWlbg3GQxYtf4Ps7ZDwVwUvMlRdjQb8XDgv7IQo g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10332"; a="329657058"
X-IronPort-AV: E=Sophos;i="5.91,185,1647327600"; d="scan'208";a="329657058"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2022 10:31:02 -0700
X-IronPort-AV: E=Sophos;i="5.91,185,1647327600"; d="scan'208";a="534590196"
Received: from ramaling-i9x.iind.intel.com ([10.203.144.108])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2022 10:31:00 -0700
From: Ramalingam C <ramalingam.c@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 0/4] lrc selftest fixes
Date: Fri, 29 Apr 2022 23:01:57 +0530
Message-Id: <20220429173201.20499-1-ramalingam.c@intel.com>
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
Cc: Hellstrom Thomas <thomas.hellstrom@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Few bug fixes for lrc selftest.

v3:
  Extending the first patch for gen8

Chris Wilson (4):
  drm/i915/gt: Explicitly clear BB_OFFSET for new contexts
  drm/i915/selftests: Check for incomplete LRI from the context image
  drm/i915/selftest: Always cancel semaphore on error
  drm/i915/selftest: Clear the output buffers before GPU writes

 drivers/gpu/drm/i915/gt/intel_engine_regs.h |   1 +
 drivers/gpu/drm/i915/gt/intel_lrc.c         |  19 ++++
 drivers/gpu/drm/i915/gt/selftest_lrc.c      | 115 ++++++++++++++++----
 3 files changed, 115 insertions(+), 20 deletions(-)

-- 
2.20.1

