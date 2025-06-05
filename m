Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF6B8ACEC10
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jun 2025 10:35:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4201C10E891;
	Thu,  5 Jun 2025 08:35:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VfbmwSP8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE92C10E7F6;
 Thu,  5 Jun 2025 08:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749112545; x=1780648545;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=uNLs9uZ+gMnvyD3C9QJZaD+YbfDky0m1IAgrw7SEAoI=;
 b=VfbmwSP8/6GVdTLLfpnD9LufR+MAOLEtjbqftLn305nk0uYdGBnGZ4AF
 xR4aYZdBNe0Kb/u1CO16sUlrsSAbxpWJBwDLwkLrm+pNKzb/BpoXnb35C
 0ZcrSQ67rj2e+eLGajXoiJdzDQwoxp8ALkSZOqTXO0u7N7EgloYWt0G8E
 CkdU/kL50v8X2xSBkK9BhkmEPkRh7LM70QAAxcZ49/3rQB4ZB3g5FrSmL
 eMurjdQ2HpysGUiwmD5+W6KWC8IEwo0TFI++/r8BE8D+D2bqKqrqFJI3Y
 z6FmAe4J3Pj8SAfTYrG2UobHHUqoCaM4V2cptaZObOILCeE2FgQUF35SU Q==;
X-CSE-ConnectionGUID: XRXpm4DnQU6bOTm+I1MvGA==
X-CSE-MsgGUID: mJwPfPpiQUa0wef+Gu8z+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="61888116"
X-IronPort-AV: E=Sophos;i="6.16,211,1744095600"; d="scan'208";a="61888116"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 01:35:43 -0700
X-CSE-ConnectionGUID: hhcmw9EDSwyHpG1AFCfvgQ==
X-CSE-MsgGUID: Pp9oXDMcQW6ab1q5L65QAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,211,1744095600"; d="scan'208";a="145407823"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost)
 ([10.245.244.19])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 01:35:39 -0700
Date: Thu, 5 Jun 2025 11:35:35 +0300
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
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
Subject: [PULL] drm-intel-next-fixes
Message-ID: <aEFW1wGnt1kTVNGF@jlahtine-mobl>
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

Hi Dave & Sima,

Here goes the final drm-intel-next-fixes PR towards 6.16-rc1.

One fix for PSR ALPM reg definitions and three integer under/overflow fixes.

Regards, Joonas

***

drm-intel-next-fixes-2025-06-05:

- Fix PSR register definitions for ALPM
- Fix u32 overflow in SNPS PHY HDMI PLL setup
- Fix GuC pending message underflow when submit fails
- Fix GuC wakeref underflow race during reset

The following changes since commit ed5915cfce2abb9a553c3737badebd4a11d6c9c7:

  Revert "drm/i915/gem: Allow EXEC_CAPTURE on recoverable contexts on DG1" (2025-05-27 16:40:55 +0300)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-next-fixes-2025-06-05

for you to fetch changes up to 791d76005de0ab556b590473eb4cbfede727fce0:

  drm/i915/display: Fix u32 overflow in SNPS PHY HDMI PLL setup (2025-06-04 17:30:53 +0300)

----------------------------------------------------------------
- Fix PSR register definitions for ALPM
- Fix u32 overflow in SNPS PHY HDMI PLL setup
- Fix GuC pending message underflow when submit fails
- Fix GuC wakeref underflow race during reset

----------------------------------------------------------------
Dibin Moolakadan Subrahmanian (1):
      drm/i915/display: Fix u32 overflow in SNPS PHY HDMI PLL setup

Jesus Narvaez (2):
      drm/i915/guc: Check if expecting reply before decrementing outstanding_submission_g2h
      drm/i915/guc: Handle race condition where wakeref count drops below 0

Jouni Högander (1):
      drm/i915/psr: Fix using wrong mask in REG_FIELD_PREP

 drivers/gpu/drm/i915/display/intel_psr_regs.h      |  4 ++--
 drivers/gpu/drm/i915/display/intel_snps_hdmi_pll.c | 16 ++++++++--------
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c  | 19 +++++++++++++++----
 3 files changed, 25 insertions(+), 14 deletions(-)
