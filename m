Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB7044D2821
	for <lists+dri-devel@lfdr.de>; Wed,  9 Mar 2022 06:16:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0A8010E2E4;
	Wed,  9 Mar 2022 05:16:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B508D10E436;
 Wed,  9 Mar 2022 05:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646803002; x=1678339002;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=L9+HrKqsDsXeESnjwFpyyxMqnPAT/rdxU4h8ItlJDbM=;
 b=XB5dxAh0ONgGFa45WOyW5EU77UZo+mcjHLbJ+6WP9VNoc7dRg30DVN7D
 VstNMGKyHv4a6ORhniKZ8g1TlLg9DQ6IJxeaHlmfnKbbhEdS8jgFkjLjN
 c8y0AkwGB5KBzcJd+R3NzUKhq9tQTieemxlpc7fOKZMbw1GTQlkM9sdIX
 6pzS7XbNGMkqHRCzQt28+/x8Q83clHrfHRmNtv7D6hbesV/h2DNRcDTQh
 tcdGabWbGQwrEOBWuWoFxaRCyldY+N9rgY6+tPwQ3UwuoSOwMWsyivHUw
 eAAVnwT6ipp5R1H0XLyhrQ8iAnOj2NMeRe6b8btvfPCnImg3f+/aN5GJL g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10280"; a="234842522"
X-IronPort-AV: E=Sophos;i="5.90,166,1643702400"; d="scan'208";a="234842522"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 21:16:42 -0800
X-IronPort-AV: E=Sophos;i="5.90,166,1643702400"; d="scan'208";a="711807491"
Received: from ramaling-i9x.iind.intel.com ([10.203.144.108])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 21:16:40 -0800
From: Ramalingam C <ramalingam.c@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH 0/8] Patches for selftest_lrc
Date: Wed,  9 Mar 2022 10:47:00 +0530
Message-Id: <20220309051708.22644-1-ramalingam.c@intel.com>
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
Cc: daniele.ceraolospurio@intel.com, lucas.demarchi@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Patches that fix and enhance the selftest_lrc

Akeem G Abodunrin (1):
  drm/i915/xehpsdv/dg1/tgl: Fix issue with LRI relative addressing

Chris Wilson (7):
  drm/i915/selftests: Exercise relative mmio paths to non-privileged
    registers
  drm/i915/selftests: Exercise cross-process context isolation
  drm/i915/selftests: Flush the submission for lrc_isolation
  drm/i915/gt: Explicitly clear BB_OFFSET for new contexts
  drm/i915/selftests: Check for incomplete LRI from the context image
  drm/i915/selftest: Clear the output buffers before GPU writes
  drm/i915/selftest: Always cancel semaphore on error

 drivers/gpu/drm/i915/gt/intel_engine_regs.h |   1 +
 drivers/gpu/drm/i915/gt/intel_lrc.c         |  17 +
 drivers/gpu/drm/i915/gt/selftest_lrc.c      | 499 +++++++++++++++++---
 3 files changed, 452 insertions(+), 65 deletions(-)

-- 
2.20.1

