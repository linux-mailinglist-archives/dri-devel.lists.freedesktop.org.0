Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC5BC4888F
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 19:25:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93A8D10E08A;
	Mon, 10 Nov 2025 18:25:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hxRV++kU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A1F110E08A;
 Mon, 10 Nov 2025 18:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762799116; x=1794335116;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=IvVO9TipTVgR/EZW4BeQU+ZdCBH7bFvwzEJ1Z68wZks=;
 b=hxRV++kUup4ajID6YlP7QkroBPJ+kR/HclETuDnkax+AjgwKtwCPVSOk
 hA+G3YMwINt7nQxSH45A1axLMicCcjnT1ZdClPo7nzth4t6fSs66oESr7
 I5ANGh3WhFus8Lg3nVQw/Z1d+OUq26buHpgRpS8/ZQhknJCp87ATsZ61P
 Yw0TxlNwWC7r7ousVrcICRciJwgHQNxFIbXA0+V/hWRByIFMZLwgS+iSE
 l3ijZn4vbrSjl5htgtV6Fx35QjL3UdvstJg+Nq7lO3M3R3y1NLdaopmZW
 P2u/euujp54PMNMHpKs2Y8vbUU4gQzFLMkVqAn4V3SRFjlPVRnhu7J3hJ A==;
X-CSE-ConnectionGUID: t78Rq+gXQWuitQ92ooTZVQ==
X-CSE-MsgGUID: sBdN40piRSK1hFJhFNLEzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="76305562"
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="76305562"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 10:25:15 -0800
X-CSE-ConnectionGUID: Qq/Sf4eWSJq+JgthraY9IA==
X-CSE-MsgGUID: x5oOY3y7Qn+FCrqHrHcljA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="193120622"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.30])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 10:25:13 -0800
Date: Mon, 10 Nov 2025 20:25:10 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, nemesa.garg@intel.com
Subject: Re: [RESEND 00/10] Introduce drm sharpness property
Message-ID: <aRIuBqnYeIhsemHD@intel.com>
References: <20251028120747.3027332-1-ankit.k.nautiyal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251028120747.3027332-1-ankit.k.nautiyal@intel.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

On Tue, Oct 28, 2025 at 05:37:36PM +0530, Ankit Nautiyal wrote:
> This is a resend of the patch series [1] originally submitted by
> Nemesa Garg <nemesa.garg@intel.com> to:
> - intel-gfx@lists.freedesktop.org
> - dri-devel@lists.freedesktop.org
> - intel-xe@lists.freedesktop.org
> 
> One of the patches was missed by Patchwork, which caused the xe CI to skip
> running tests for the full series. To ensure proper CI coverage and
> results, I’ve applied the series on top of the latest tree and regenerated
> it using `git format-patch`.
> 
> [1] https://patchwork.freedesktop.org/series/138754/
> 
> 
> --- Original cover letter follows ---
> 
> Many a times images are blurred or upscaled content is also not as
> crisp as original rendered image. Traditional sharpening techniques often
> apply a uniform level of enhancement across entire image, which sometimes
> result in over-sharpening of some areas and potential loss of natural details.
> 
> Intel has come up with Display Engine based adaptive sharpening filter
> with minimal power and performance impact. From LNL onwards, the Display
> hardware can use one of the pipe scaler for adaptive sharpness filter.
> This can be used for both gaming and non-gaming use cases like photos,
> image viewing. It works on a region of pixels depending on the tap size.
> 
> This is an attempt to introduce an adaptive sharpness solution which
> helps in improving the image quality. For this new CRTC property is added.
> The user can set this property with desired sharpness strength value with
> 0-255. A value of 1 representing minimum sharpening strength and 255
> representing maximum sharpness strength. A strength value of 0 means no
> sharpening or sharpening feature disabled.
> It works on a region of pixels depending on the tap size. The coefficients
> are used to generate an alpha value which is used to blend the sharpened
> image to original image.
> 
> Middleware MR link: https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/3665
> IGT patchwork link: https://patchwork.freedesktop.org/series/130218/
> 
> Continuing discussions from:  https://patchwork.freedesktop.org/series/129888/
> 
> https://invent.kde.org/plasma/kwin/-/merge_requests/7689
> Got ack from kwin maintainer on the UAPI patch.
> 
> Nemesa Garg (10):
>   drm/drm_crtc: Introduce sharpness strength property
>   drm/i915/display: Introduce HAS_CASF for sharpness support
>   drm/i915/display: Add CASF strength and winsize
>   drm/i915/display: Add filter lut values
>   drm/i915/display: Compute the scaler coefficients
>   drm/i915/display: Add and compute scaler parameter
>   drm/i915/display: Configure the second scaler
>   drm/i915/display: Set and get the casf config
>   drm/i915/display: Enable/disable casf
>   drm/i915/display: Expose sharpness strength property

The i915 part of this needs a rewrite:
- it needs to properly integrated into skl_scaler.c
  instead of reimplementing half of it
- for some reason it's doing stuff in the pre/post
  plane update hooks instead of from the vblank evade
  critical section, which means the updates won't be
  atomic and also can't be executed via DSB
- the state computation is in the wrong place. It should
  be part of compute_config() but now it's somewhere later
  where it's screwing up the prefill stuff again (I can't
  land the final prefill fixes now because this laded in the
  meantime).

> 
>  drivers/gpu/drm/drm_atomic_uapi.c             |   4 +
>  drivers/gpu/drm/drm_crtc.c                    |  35 +++
>  drivers/gpu/drm/i915/Makefile                 |   1 +
>  drivers/gpu/drm/i915/display/intel_casf.c     | 293 ++++++++++++++++++
>  drivers/gpu/drm/i915/display/intel_casf.h     |  22 ++
>  .../gpu/drm/i915/display/intel_casf_regs.h    |  33 ++
>  drivers/gpu/drm/i915/display/intel_crtc.c     |   3 +
>  .../drm/i915/display/intel_crtc_state_dump.c  |   5 +
>  drivers/gpu/drm/i915/display/intel_display.c  |  37 ++-
>  .../drm/i915/display/intel_display_device.h   |   1 +
>  .../drm/i915/display/intel_display_types.h    |  15 +
>  drivers/gpu/drm/i915/display/skl_scaler.c     |  91 +++++-
>  drivers/gpu/drm/i915/display/skl_scaler.h     |   2 +
>  drivers/gpu/drm/xe/Makefile                   |   1 +
>  include/drm/drm_crtc.h                        |  18 ++
>  15 files changed, 548 insertions(+), 13 deletions(-)
>  create mode 100644 drivers/gpu/drm/i915/display/intel_casf.c
>  create mode 100644 drivers/gpu/drm/i915/display/intel_casf.h
>  create mode 100644 drivers/gpu/drm/i915/display/intel_casf_regs.h
> 
> -- 
> 2.45.2

-- 
Ville Syrjälä
Intel
