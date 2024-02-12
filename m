Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7EF851839
	for <lists+dri-devel@lfdr.de>; Mon, 12 Feb 2024 16:37:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF3F010EAE4;
	Mon, 12 Feb 2024 15:37:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h0DHGTQo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF8B910ED84;
 Mon, 12 Feb 2024 15:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707752222; x=1739288222;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ZgOdtc427Ga0C+WXdKwBNS7MMH6tfehMxuR+sxZc5B4=;
 b=h0DHGTQo121ReEiJ3kMDFBjpOgF/B+B94GvfhYx4gekNeQ1VQt3gHIOJ
 TCOFF9nTkiU3YG08QOtNNyFmSEr4FZHm/o26Z/l6Hz9pHm4o9ZBdKOYlS
 3WgvBSdO+Zs0OHwvMRnpwKv7f/G4lOUQ3ioLCYn1P/+Gr5dJIdSmCeWP2
 vJM4oxhrzo9ikB5xrev2X/cOXUck6dcR0+8cl3Rs95jMD6ve/PsJxM/hV
 H6ZXl4xH6mEnBj3dyk+wX1XGECKTZ83gNh+SaG4NTbmDdDBbv2x9cKGDN
 XdDXtzW25ZaWMlmZ2NIhpYKkc4LOPLaCY2SKTYZb9b1oogW0ps6evXOGC A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="24201646"
X-IronPort-AV: E=Sophos;i="6.06,264,1705392000"; d="scan'208";a="24201646"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2024 07:37:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="825837796"
X-IronPort-AV: E=Sophos;i="6.06,264,1705392000"; d="scan'208";a="825837796"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 12 Feb 2024 07:36:58 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 12 Feb 2024 17:36:57 +0200
Date: Mon, 12 Feb 2024 17:36:57 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Arun R Murthy <arun.r.murthy@intel.com>
Subject: Re: [RFC 4/4] drm/i915/mst: enable MST mode for 128b/132b
 single-stream sideband
Message-ID: <Zco7GTd-UpeYxPww@intel.com>
References: <cover.1706882590.git.jani.nikula@intel.com>
 <a2c9faf86b5d93013fdd0be9bf3d6ba6228f0a8f.1706882591.git.jani.nikula@intel.com>
 <Zb0QJGZ0RE-5KBQb@intel.com> <87sf1x8ztr.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87sf1x8ztr.fsf@intel.com>
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

On Mon, Feb 12, 2024 at 05:30:40PM +0200, Jani Nikula wrote:
> On Fri, 02 Feb 2024, Ville Syrjälä <ville.syrjala@linux.intel.com> wrote:
> > On Fri, Feb 02, 2024 at 04:05:34PM +0200, Jani Nikula wrote:
> >> If the sink supports 128b/132b and single-stream sideband messaging,
> >> enable MST mode.
> >> 
> >> With this, the topology manager will still write DP_MSTM_CTRL, which
> >> should be ignored by the sink. In the future,
> >> drm_dp_mst_topology_mgr_set_mst() bool mst_state parameter should
> >> probably be turned into an enum drm_dp_mst_mode mst_mode parameter.
> >
> > Rather I'd say the topology manager should stop concerning itself
> > with the MST enable bit and just frob the sideband enable bit.
> > The MST enable bit should be configured at modeset time to
> > reflect whether we're about to transmit in MST or SST mode.
> 
> Are you suggesting the driver should write the MST vs. SST mode in
> DP_MSTM_CTRL?

Either that or there needs to be a function provided by the
topology manager that gets called at modeset time to configure it.
I don't recall when exactly it should be configured according the
DP spec.

> 
> I worry a bit about the rmw on DPCD regs. The topology manager only does
> writes.
> 
> BR,
> Jani.
> 
> 
> 
> 
> 
> >
> >> 
> >> Cc: Arun R Murthy <arun.r.murthy@intel.com>
> >> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> >> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> >> ---
> >>  drivers/gpu/drm/i915/display/intel_dp.c | 4 +++-
> >>  1 file changed, 3 insertions(+), 1 deletion(-)
> >> 
> >> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> >> index 4dd9c50226d1..16130e87dc23 100644
> >> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> >> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> >> @@ -4020,7 +4020,9 @@ static bool intel_dp_mst_detect(struct intel_dp *intel_dp)
> >>  
> >>  	intel_dp->is_mst = i915->display.params.enable_dp_mst &&
> >>  		intel_dp_mst_source_support(intel_dp) &&
> >> -		sink_mst_mode == DP_MST_CAPABLE;
> >> +		(sink_mst_mode == DP_MST_CAPABLE ||
> >> +		 (sink_mst_mode == DP_MST_SIDEBAND_MSG &&
> >> +		  intel_dp->dpcd[DP_MAIN_LINK_CHANNEL_CODING] & DP_CAP_ANSI_128B132B));
> >>  
> >>  	drm_dbg_kms(&i915->drm,
> >>  		    "[ENCODER:%d:%s] MST support: port: %s, sink: %s, modparam: %s -> enable: %s\n",
> >> -- 
> >> 2.39.2
> 
> -- 
> Jani Nikula, Intel

-- 
Ville Syrjälä
Intel
