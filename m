Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5744B9AC349
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2024 11:16:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4944710E7A3;
	Wed, 23 Oct 2024 09:16:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="IpT5ayGc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CECFD10E375;
 Wed, 23 Oct 2024 09:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2JGW/uDgq/+QFMvMCjmmFYjOZSDMvbEDxKhKwJbwj3g=; b=IpT5ayGceBbkF65INElCc0Oawh
 a+FdjjSFEuM5Y2TYugCfQIjCRdi9HkaNs2tiCtxnkMWdskUNOEFQsEGQScTRsAM59wPZ8HVsoh1Yh
 jc2ENu6qvG9Qy2QSj7i/PtFmu5pkOh4O7INwAMwvAjElsOzWEanN450igNiB1Q48bqSn9u2Fs7kW1
 PrAqFNzB8qZIuMxTbaxhVFx8gPDXhETPuRG5kXfELMDUv1lGY+nCSRQdjGETWU0UmUMzW0uiKk1NA
 4NOscFeDY+/fJEFDPbyCP1b4+jMumJg56bUX8IDmNnF8sizj3EzE8pfej5J5HruVNYStdtKocq0D8
 tS2sOyGw==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1t3XTp-00Dxvc-4I; Wed, 23 Oct 2024 11:16:37 +0200
Date: Wed, 23 Oct 2024 10:16:36 +0100
From: Tvrtko Ursulin <tursulin@igalia.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Subject: [PULL] drm-intel-gt-next
Message-ID: <Zxi-3wkIwI-Y1Qvj@linux>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Hi Dave, Sima,

This is the main pull request for 6.13 merge window.

PXP GuC auto-teardown feature got enabled, GPU reset robustness improvement
for Haswell and basic PMU functionality was enabled for Gen2 platforms.

The rest is a handful of small cleanups.

Regards,

Tvrtko

drm-intel-gt-next-2024-10-23:
Driver Changes:

Fixes/improvements/new stuff:

- Enable PXP GuC autoteardown flow [guc] (Juston Li)
- Retry RING_HEAD reset until it sticks [gt] (Nitin Gote)
- Add basic PMU support for gen2 [pmu] (Ville Syrjälä)

Miscellaneous:

- Prevent a possible int overflow in wq offsets [guc] (Nikita Zhandarovich)
- PMU code cleanups (Lucas De Marchi)
- Fixed "CPU" -> "GPU" typo [gt] (Zhang He)
- Gen2/3 interrupt handling cleanup (Ville Syrjälä)
The following changes since commit 596a7f1084e49cc65072c458c348861e9b9ceab9:

  drm/i915: Remove extra unlikely helper (2024-09-05 15:44:37 -0400)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-gt-next-2024-10-23

for you to fetch changes up to 6ef0e3ef2662db71d363af77ce31fa940bb7d525:

  drm/i915/gt: Retry RING_HEAD reset until it get sticks (2024-10-22 11:35:07 +0200)

----------------------------------------------------------------
Driver Changes:

Fixes/improvements/new stuff:

- Enable PXP GuC autoteardown flow [guc] (Juston Li)
- Retry RING_HEAD reset until it get sticks [gt] (Nitin Gote)
- Add basic PMU support for gen2 [pmu] (Ville Syrjälä)

Miscellaneous:

- Prevent a possible int overflow in wq offsets [guc] (Nikita Zhandarovich)
- PMU code cleanups (Lucas De Marchi)
- Fixed "CPU" -> "GPU" typo [gt] (Zhang He)
- Gen2/3 interrupt handling cleanup (Ville Syrjälä)

----------------------------------------------------------------
Juston Li (1):
      drm/i915/guc: Enable PXP GuC autoteardown flow

Lucas De Marchi (2):
      drm/i915/pmu: Drop is_igp()
      drm/i915/pmu: Use event_to_pmu()

Nikita Zhandarovich (1):
      drm/i915/guc: prevent a possible int overflow in wq offsets

Nitin Gote (1):
      drm/i915/gt: Retry RING_HEAD reset until it get sticks

Ville Syrjälä (3):
      drm/i915/gt: Nuke gen2_irq_{enable,disable}()
      drm/i915/gt: s/gen3/gen2/
      drm/i915/pmu: Add support for gen2

Zhang He (1):
      drm/i915/gt: Fixed "CPU" -> "GPU" typo

 drivers/gpu/drm/i915/gt/gen2_engine_cs.c          | 23 ++--------
 drivers/gpu/drm/i915/gt/gen2_engine_cs.h          |  6 +--
 drivers/gpu/drm/i915/gt/intel_engine_regs.h       |  2 +-
 drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c     |  2 +-
 drivers/gpu/drm/i915/gt/intel_ring_submission.c   | 38 ++++++++++++----
 drivers/gpu/drm/i915/gt/uc/intel_guc.c            |  8 ++++
 drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h       |  1 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c |  4 +-
 drivers/gpu/drm/i915/i915_drv.h                   |  3 ++
 drivers/gpu/drm/i915/i915_pmu.c                   | 54 +++++++++++++----------
 drivers/gpu/drm/i915/pxp/intel_pxp.c              |  2 +-
 11 files changed, 82 insertions(+), 61 deletions(-)
