Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B36FF76E2F8
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 10:26:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 998B710E5BD;
	Thu,  3 Aug 2023 08:26:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (unknown [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3ABD10E5BD;
 Thu,  3 Aug 2023 08:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691051210; x=1722587210;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=lbgkTbCBfKqYrdRuUUms1gorQhV005tZYOfm4w0WcHY=;
 b=Liwnh0WCqIUjuCAuXPg+hcoKzOYesLKHAF4T+KqNx7EsJRNhCUMcnlKE
 SjziuxcJ2YK5cQSlxoA1YExe+TxZGZooYjpkgSTQyKpHXj72JKzVfnGdJ
 0nzGjjP2Spa1vrJ6x9ORfEkYFb8LdLVSi5aWGhBGdFTACt2Y37XLhGdsF
 gb72HHSAtTuOmxAIhWQtY7ZCveBt8KIbP/N3kMvFZmfmaKbe05GgAdQ9Y
 TWN31VbQPIawFRK0lelNpo2jnLPMMPrllS1aNHzYGZw7mYf3RC8KfQ0aK
 zZmsELWkqXTTT2GXPdsK2b9cRX2i7We2fIua1O4QdrKYMV7FIVmTOU6kC Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="436119111"
X-IronPort-AV: E=Sophos;i="6.01,251,1684825200"; d="scan'208";a="436119111"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2023 01:26:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="794897400"
X-IronPort-AV: E=Sophos;i="6.01,251,1684825200"; d="scan'208";a="794897400"
Received: from rrybakov-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.213.197.207])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2023 01:26:47 -0700
Date: Thu, 3 Aug 2023 09:26:45 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-fixes
Message-ID: <ZMtkxWGuUKpaRMmo@tursulin-desk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave, Daniel,

Some fixes for the 6.5 RC this week: one for GVT display I2C handling,
which came via gvt-fixes merge, one for premature freeing of request
memory, and finally one fix for Gen12 AUX invalidatation flow to correctly
align it with the documented sequence.

Regards,

Tvrtko

drm-intel-fixes-2023-08-03:
- Fix bug in getting msg length in AUX CH registers handler [gvt] (Yan Zhao)
- Gen12 AUX invalidation fixes [gt] (Andi Shyti, Jonathan Cavitt)
- Fix premature release of request's reusable memory (Janusz Krzysztofik)

- Merge tag 'gvt-fixes-2023-08-02' of https://github.com/intel/gvt-linux into drm-intel-fixes (Tvrtko Ursulin)
The following changes since commit 5d0c230f1de8c7515b6567d9afba1f196fb4e2f4:

  Linux 6.5-rc4 (2023-07-30 13:23:47 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2023-08-03

for you to fetch changes up to 0bc057eae2610c275361766a064a23cc2758f3ff:

  Merge tag 'gvt-fixes-2023-08-02' of https://github.com/intel/gvt-linux into drm-intel-fixes (2023-08-02 08:14:57 +0100)

----------------------------------------------------------------
- Fix bug in getting msg length in AUX CH registers handler [gvt] (Yan Zhao)
- Gen12 AUX invalidation fixes [gt] (Andi Shyti, Jonathan Cavitt)
- Fix premature release of request's reusable memory (Janusz Krzysztofik)

- Merge tag 'gvt-fixes-2023-08-02' of https://github.com/intel/gvt-linux into drm-intel-fixes (Tvrtko Ursulin)

----------------------------------------------------------------
Andi Shyti (5):
      drm/i915/gt: Cleanup aux invalidation registers
      drm/i915: Add the gen12_needs_ccs_aux_inv helper
      drm/i915/gt: Rename flags with bit_group_X according to the datasheet
      drm/i915/gt: Enable the CCS_FLUSH bit in the pipe control and in the CS
      drm/i915/gt: Support aux invalidation on all engines

Janusz Krzysztofik (1):
      drm/i915: Fix premature release of request's reusable memory

Jonathan Cavitt (2):
      drm/i915/gt: Ensure memory quiesced before invalidation
      drm/i915/gt: Poll aux invalidation register bit on invalidation

Tvrtko Ursulin (1):
      Merge tag 'gvt-fixes-2023-08-02' of https://github.com/intel/gvt-linux into drm-intel-fixes

Yan Zhao (1):
      drm/i915/gvt: Fix bug in getting msg length in AUX CH registers handler

 drivers/gpu/drm/i915/gt/gen8_engine_cs.c     | 140 ++++++++++++++++++---------
 drivers/gpu/drm/i915/gt/gen8_engine_cs.h     |  21 ++--
 drivers/gpu/drm/i915/gt/intel_gpu_commands.h |   2 +
 drivers/gpu/drm/i915/gt/intel_gt_regs.h      |  16 +--
 drivers/gpu/drm/i915/gt/intel_lrc.c          |  17 +---
 drivers/gpu/drm/i915/gvt/edid.c              |   2 +-
 drivers/gpu/drm/i915/i915_active.c           |  99 +++++++++++++------
 drivers/gpu/drm/i915/i915_request.c          |  11 +++
 8 files changed, 199 insertions(+), 109 deletions(-)
