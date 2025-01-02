Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BEF19FF927
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jan 2025 13:09:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B13710E6E5;
	Thu,  2 Jan 2025 12:08:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h5TJ8iU0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB35110E6EE;
 Thu,  2 Jan 2025 12:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735819738; x=1767355738;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=4RXg4MEJ3xKe8lQFvw5JzBVRko1yciKpNyMKhz+kPj0=;
 b=h5TJ8iU0yEmL1X4wVga+txmkEcf47xFFPvuP9a2ZfUkDgyyjb7BCIHR0
 d/aZ1GnyRIJM2iYWS6kQIASoIKfRdZBC31Q1SmtzXsfepAVanvYizu94p
 TB8gw4P9stoTaZu5rARruUTy8NDfWzZc7UuciJBNy1RMQS07VSqL6pXoK
 sNuGgUnwqYUXnayBy4zpA+d6AP2D1hiwiuPeZJToafEWyvS3ITV3CiK6S
 5OzLAYT1Yqi2njMEvHIKA0dVa/EsHjZrMMDCW7CoZPGYXsOcgk0uGlHDx
 kYTKyMrIeMy9VZkaIasaEnbnP93xRQ598tsJFSRuNiaO0NnGJTa5DwIii w==;
X-CSE-ConnectionGUID: CK9Qi7dzS+eeUtnF7sBM6w==
X-CSE-MsgGUID: f8uUUVikS2qwUmILjwwZog==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="35298151"
X-IronPort-AV: E=Sophos;i="6.12,285,1728975600"; d="scan'208";a="35298151"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2025 04:08:57 -0800
X-CSE-ConnectionGUID: mpfLf7SLSuCeoC+uwTKOxw==
X-CSE-MsgGUID: 9eMljGGbRbix7qcSDdP3CA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="132429268"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2025 04:08:56 -0800
Date: Thu, 2 Jan 2025 14:09:44 +0200
From: Imre Deak <imre.deak@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 11/16] drm/i915/ddi: initialize 128b/132b SST DP2
 VFREQ registers
Message-ID: <Z3aCCAp028YBPw-B@ideak-desk.fi.intel.com>
References: <cover.1734643485.git.jani.nikula@intel.com>
 <38cfa6554f8249605a8af98353f64c6b53d1d106.1734643485.git.jani.nikula@intel.com>
 <Z3QhMxIylsbgAN-2@ideak-desk.fi.intel.com>
 <87frm1o8qs.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87frm1o8qs.fsf@intel.com>
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
Reply-To: imre.deak@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 02, 2025 at 11:39:07AM +0200, Jani Nikula wrote:
> On Tue, 31 Dec 2024, Imre Deak <imre.deak@intel.com> wrote:
> > On Thu, Dec 19, 2024 at 11:34:00PM +0200, Jani Nikula wrote:
> >> Write the DP2 specific VFREQ registers.
> >> 
> >> This is preparation for enabling 128b/132b SST. This path is not
> >> reachable yet.
> >> 
> >> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> >> ---
> >>  drivers/gpu/drm/i915/display/intel_ddi.c | 12 ++++++++++++
> >>  1 file changed, 12 insertions(+)
> >> 
> >> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
> >> index 64528ff8856e..91e6cd91e91f 100644
> >> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
> >> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
> >> @@ -3467,8 +3467,20 @@ static void intel_ddi_enable(struct intel_atomic_state *state,
> >>  {
> >>  	struct intel_display *display = to_intel_display(encoder);
> >>  	struct intel_crtc *pipe_crtc;
> >> +	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
> >>  	int i;
> >>  
> >> +	/* 128b/132b SST */
> >> +	if (intel_dp_is_uhbr(crtc_state)) {
> >
> > Hm, not sure how this would work on HDMI (FRL), but to be sure shouldn't
> > this check that crtc_state is for a DP (SST) mode?
> 
> DP MST does not call intel_ddi_enable().

I meant that this function (intel_ddi_enable()) can be called for HDMI
as well, in case of HDMI FRL with port clock being >= 10G. In that case
this - and the payload related bits later - shouldn't be programmed. So
would need if (!hdmi && intel_dp_is_uhbr()).

> Yes, it's all very subtle, and I hate the way all of the
> DDI/SST/MST/etc. is intertwined, but I feel like it's overall a bigger
> refactoring to clean up.
> 
> BR,
> Jani.
> 
> 
> >
> >> +		const struct drm_display_mode *adjusted_mode = &crtc_state->hw.adjusted_mode;
> >> +		u64 crtc_clock_hz = KHz(adjusted_mode->crtc_clock);
> >> +
> >> +		intel_de_write(display, TRANS_DP2_VFREQHIGH(cpu_transcoder),
> >> +			       TRANS_DP2_VFREQ_PIXEL_CLOCK(crtc_clock_hz >> 24));
> >> +		intel_de_write(display, TRANS_DP2_VFREQLOW(cpu_transcoder),
> >> +			       TRANS_DP2_VFREQ_PIXEL_CLOCK(crtc_clock_hz & 0xffffff));
> >> +	}
> >> +
> >>  	intel_ddi_enable_transcoder_func(encoder, crtc_state);
> >>  
> >>  	/* Enable/Disable DP2.0 SDP split config before transcoder */
> >> -- 
> >> 2.39.5
> >> 
> 
> -- 
> Jani Nikula, Intel
