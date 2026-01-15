Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88620D23C68
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 11:01:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A779E10E730;
	Thu, 15 Jan 2026 10:01:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PWlpEUc0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F5F710E730;
 Thu, 15 Jan 2026 10:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768471308; x=1800007308;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=Sc8pLP4CA6AZPyWVB1USBHAm6eA+v+pB5HrbR192ciY=;
 b=PWlpEUc0sfNOQ/1SebGCaTA4yQP/JfpKcI6ABCXAGAL+aJs6N86ySwHk
 Uop0vpi3T++M/kUS4j5po9H/ypzj2R5y/eXmg8wAIzWtWX7KrNTtLsiz3
 Xt3mLxZXz3LrHR9KKwtjp1p7hAKFsU7/mpb/aXnFw2dwgUwa+H3OHmmqm
 BrSdYm4mrNMooDVsAJenSyRb82V3hcFuG3nT5FI+5ZhoCslf1Wvmb/61E
 i+JAC5v/uVo1eqVTPdxaxBNuUovET5QR1ZoemHLA8eSyJgP6cebBYj7Vl
 7qdfFwrR8/V6drt2J3DOMOocItYu/3LWQz4Ce41lGJYXggpQnTy2sJhyG w==;
X-CSE-ConnectionGUID: IKUb4KcOT4WFEdOGWr0IVg==
X-CSE-MsgGUID: M4yXJ2rlTkuGI0aY8oH0fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="80077369"
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; d="scan'208";a="80077369"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 02:01:47 -0800
X-CSE-ConnectionGUID: LV4iw8kjS9yLZo1Aesmc0Q==
X-CSE-MsgGUID: b8e73BQfRi2gmN1CUyuFTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; d="scan'208";a="205198405"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.150])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 02:01:42 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Oded Gabbay <ogabbay@kernel.org>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Subject: [PULL] drm-intel-fixes
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
Date: Thu, 15 Jan 2026 12:01:39 +0200
Message-ID: <65bb05f7c8cbd3faf2350f979d4d47a395e5d372@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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


Hi Dave & Sima -

Keeps being fairly quiet, here's just one linkage change to internal.

drm-intel-fixes-2026-01-15:
drm/i915 fixes for v6.19-rc6:
- make 'guc_hw_reg_state' static

BR,
Jani.

The following changes since commit 0f61b1860cc3f52aef9036d7235ed1f017632193:

  Linux 6.19-rc5 (2026-01-11 17:03:14 -1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-fixes-2026-01-15

for you to fetch changes up to 81d0223832f99c0833e46be114a8310888015f8b:

  drm/i915/guc: make 'guc_hw_reg_state' static as it isn't exported (2026-01-12 13:10:36 +0200)

----------------------------------------------------------------
drm/i915 fixes for v6.19-rc6:
- make 'guc_hw_reg_state' static

----------------------------------------------------------------
Ben Dooks (1):
      drm/i915/guc: make 'guc_hw_reg_state' static as it isn't exported

 drivers/gpu/drm/i915/i915_gpu_error.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
Jani Nikula, Intel
