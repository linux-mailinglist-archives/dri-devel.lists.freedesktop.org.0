Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F5D764F9D
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 11:26:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69752888D9;
	Thu, 27 Jul 2023 09:26:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (unknown [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E38F888D9;
 Thu, 27 Jul 2023 09:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690449976; x=1721985976;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=k5hcbcwCAX9A11KkAOvokIiSFuxmCocRnqR5GyIOyKw=;
 b=SnjuncJ38Sukcyrnl04KrZ/wGd5+NtDCV3+gN7h0MRDGX9qy6QPRiVmn
 bgTFFDkBTEZx+2+qvuHAIvFRY9vSQPwSG9/1R2jjNiHC9wt7mWLXfz6nE
 BUqiAOaR8s6pXXDfphJTOVzcEH/c2RGtCRWPHi4+35v9KfJR0EmTRkdpx
 POVLeFCzUkW8Rhfjztz58KQ5abOrfhx5pHUU7y4EJ60piYHqBhFq/aW43
 ZmDmlQtZYF+Uic6YFwCBOAUTinQLzV2BwjrPclHi8kg5CGnRpVsWhsZpI
 Cep+X4DA+mVrtVWzkMVAk+mLdYLfEWcv6xEXIej/hZolHNCz5s8+N0kpu g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="358259510"
X-IronPort-AV: E=Sophos;i="6.01,234,1684825200"; d="scan'208";a="358259510"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2023 02:26:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="792299924"
X-IronPort-AV: E=Sophos;i="6.01,234,1684825200"; d="scan'208";a="792299924"
Received: from jlenehan-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.213.228.208])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2023 02:26:12 -0700
Date: Thu, 27 Jul 2023 10:26:10 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-fixes
Message-ID: <ZMI4Mtom7pDhLB7M@tursulin-desk>
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

Only two small fixes for the 6.5 RC this week - one display for display
(DPT) corruption under memory pressure, and one for selftests theoretical
edge case.

Regards,

Tvrtko

drm-intel-fixes-2023-07-27:
- Use shmem for dpt objects [dpt] (Radhakrishna Sripada)
- Fix an error handling path in igt_write_huge() (Christophe JAILLET)
The following changes since commit 6eaae198076080886b9e7d57f4ae06fa782f90ef:

  Linux 6.5-rc3 (2023-07-23 15:24:10 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2023-07-27

for you to fetch changes up to e354f67733115b4453268f61e6e072e9b1ea7a2f:

  drm/i915: Fix an error handling path in igt_write_huge() (2023-07-25 08:38:12 +0100)

----------------------------------------------------------------
- Use shmem for dpt objects [dpt] (Radhakrishna Sripada)
- Fix an error handling path in igt_write_huge() (Christophe JAILLET)

----------------------------------------------------------------
Christophe JAILLET (1):
      drm/i915: Fix an error handling path in igt_write_huge()

Radhakrishna Sripada (1):
      drm/i915/dpt: Use shmem for dpt objects

 drivers/gpu/drm/i915/display/intel_dpt.c        | 4 +++-
 drivers/gpu/drm/i915/gem/selftests/huge_pages.c | 6 ++++--
 2 files changed, 7 insertions(+), 3 deletions(-)
