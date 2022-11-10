Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 963B9623E7B
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 10:22:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CE9610E6A9;
	Thu, 10 Nov 2022 09:22:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4623810E6A3;
 Thu, 10 Nov 2022 09:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668072145; x=1699608145;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=kcyRbitbZ9i0MkKWWbb6JX3BslDY8jU6Hv1qtAQ4jRU=;
 b=AYS/TvkFWEnDIvAdk4RwcqgHu7ZaisykhFhEcLR0UCBsTFm8t2TydXxj
 hHk6+M+JGDkppwQ6V94Ir9eFLNwlwaG1W13gVZ4ksAGifqpjCRGt2UFT4
 X+0gxClHfGa0oMhyriG5yqEMucttrb9YXkMP024Xm4Uzb6IyiwlqDKWdN
 91WzcpsqHwmHZL9O9ReEmiUJfHUlkts94pYJn+po/MeqeTfiogyGSv2L+
 I2xTP5O7zv58V9GnJmcqb5qBLdyUlFqYuzPTeGY1UG/wsiY5xEmhPzGMG
 Ge4vWP8RNvfg0LkLVFjM05+AF+sL9DBDz6rNuSyxufxhxEm+z/tU9+RUr A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10526"; a="375509390"
X-IronPort-AV: E=Sophos;i="5.96,153,1665471600"; d="scan'208";a="375509390"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2022 01:22:24 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10526"; a="700728371"
X-IronPort-AV: E=Sophos;i="5.96,153,1665471600"; d="scan'208";a="700728371"
Received: from salmasha-mobl.ger.corp.intel.com (HELO localhost)
 ([10.213.230.214])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2022 01:22:21 -0800
Date: Thu, 10 Nov 2022 09:22:19 +0000
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-fixes
Message-ID: <Y2zCy5q85qE9W0J8@tursulin-desk>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave, Daniel,

Some more fixes for the release candidate window.

Most important are the SG table handling fix for map_dma_buf import, the
userptr probe fixup after VMA iterator conversion and then a display/mouse
stuttering fix for PSR2. Last one only relates to discrete platforms, so
still behind force probe.

Regards,

Tvrtko

drm-intel-fixes-2022-11-10:
- Fix sg_table handling in map_dma_buf (Matthew Auld)
- Send PSR update also on invalidate (Jouni Högander)
- Do not set cache_dirty for DGFX (Niranjana Vishwanathapura)
- Restore userptr probe_range behaviour (Matthew Auld)
The following changes since commit f0c4d9fc9cc9462659728d168387191387e903cc:

  Linux 6.1-rc4 (2022-11-06 15:07:11 -0800)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2022-11-10

for you to fetch changes up to 178e31ce82d0308a9e5f2f15bfb4493160136729:

  drm/i915/userptr: restore probe_range behaviour (2022-11-07 13:13:09 +0000)

----------------------------------------------------------------
- Fix sg_table handling in map_dma_buf (Matthew Auld)
- Send PSR update also on invalidate (Jouni Högander)
- Do not set cache_dirty for DGFX (Niranjana Vishwanathapura)
- Restore userptr probe_range behaviour (Matthew Auld)

----------------------------------------------------------------
Jouni Högander (1):
      drm/i915/psr: Send update also on invalidate

Matthew Auld (2):
      drm/i915/dmabuf: fix sg_table handling in map_dma_buf
      drm/i915/userptr: restore probe_range behaviour

Niranjana Vishwanathapura (1):
      drm/i915: Do not set cache_dirty for DGFX

 drivers/gpu/drm/i915/display/intel_psr.c    | 5 ++++-
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c  | 4 ++--
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c   | 4 ++--
 drivers/gpu/drm/i915/gem/i915_gem_userptr.c | 5 +++--
 4 files changed, 11 insertions(+), 7 deletions(-)
