Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D198343E1E6
	for <lists+dri-devel@lfdr.de>; Thu, 28 Oct 2021 15:20:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 475A16E97C;
	Thu, 28 Oct 2021 13:20:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72CB86E971;
 Thu, 28 Oct 2021 13:20:37 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10150"; a="211173879"
X-IronPort-AV: E=Sophos;i="5.87,189,1631602800"; d="scan'208";a="211173879"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2021 06:20:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,189,1631602800"; d="scan'208";a="487124569"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga007.jf.intel.com with SMTP; 28 Oct 2021 06:20:31 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 28 Oct 2021 16:20:31 +0300
Date: Thu, 28 Oct 2021 16:20:31 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PULL] drm-intel-fixes
Message-ID: <YXqjnyedcljkaZE/@intel.com>
References: <8735olh27y.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8735olh27y.fsf@intel.com>
X-Patchwork-Hint: comment
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

On Thu, Oct 28, 2021 at 01:29:21PM +0300, Jani Nikula wrote:
> 
> Hi Dave & Daniel -
> 
> Certainly more than I'd like at this stage, but it's mostly Cc: stable
> material, and the tracepoint change is a last minute revert to dodge a
> potential "tracepoints are uabi" bullet before it hits the final
> release.
> 
> 
> BR,
> Jani.
> 
> 
> drm-intel-fixes-2021-10-28:
> drm/i915 fixes for v5.15 final:
> - Remove unconditional clflushes
> - Fix oops on boot due to sync state on disabled DP encoders
> - Revert backend specific data added to tracepoints
> - Remove useless and incorrect memory frequence calculation
> 
> BR,
> Jani.
> 
> The following changes since commit 519d81956ee277b4419c723adfb154603c2565ba:
> 
>   Linux 5.15-rc6 (2021-10-17 20:00:13 -1000)
> 
> are available in the Git repository at:
> 
>   git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2021-10-28
> 
> for you to fetch changes up to 9a4aa3a2f1606a03c220b21049baa4a2b6169626:
> 
>   drm/i915: Revert 'guc_id' from i915_request tracepoint (2021-10-28 11:45:11 +0300)
> 
> ----------------------------------------------------------------
> drm/i915 fixes for v5.15 final:
> - Remove unconditional clflushes
> - Fix oops on boot due to sync state on disabled DP encoders
> - Revert backend specific data added to tracepoints
> - Remove useless and incorrect memory frequence calculation
> 
> ----------------------------------------------------------------
> Imre Deak (1):
>       drm/i915/dp: Skip the HW readout of DPCD on disabled encoders
> 
> Joonas Lahtinen (1):
>       drm/i915: Revert 'guc_id' from i915_request tracepoint
> 
> José Roberto de Souza (1):
>       drm/i915: Remove memory frequency calculation
> 
> Ville Syrjälä (2):
>       drm/i915: Convert unconditional clflush to drm_clflush_virt_range()
>       drm/i915: Catch yet another unconditioal clflush

Where did the third one go?
commit ef7ec41f17cb ("drm/i915: Replace the unconditional clflush with drm_clflush_virt_range()")

> 
>  drivers/gpu/drm/i915/display/intel_dp.c  |  3 +++
>  drivers/gpu/drm/i915/gt/intel_timeline.c |  4 ++--
>  drivers/gpu/drm/i915/i915_reg.h          |  8 --------
>  drivers/gpu/drm/i915/i915_trace.h        |  7 ++-----
>  drivers/gpu/drm/i915/intel_dram.c        | 30 ++----------------------------
>  5 files changed, 9 insertions(+), 43 deletions(-)
> 
> -- 
> Jani Nikula, Intel Open Source Graphics Center

-- 
Ville Syrjälä
Intel
