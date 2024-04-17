Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1F38A8256
	for <lists+dri-devel@lfdr.de>; Wed, 17 Apr 2024 13:49:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6EA310F5CE;
	Wed, 17 Apr 2024 11:49:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eA/QTbAz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A647910F5CE;
 Wed, 17 Apr 2024 11:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713354552; x=1744890552;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=MSFjM1wFm498R7+Qx9WSvsBaGc1P6ZItYlb+++8OHCM=;
 b=eA/QTbAzojpvRPKHXDBzn9L86r0sdX7bL1s11dJwPnTtjdLf7OiM0AiA
 GEB1C2RwjKhDuHDteDHeMZvnQVMaPrXKbW2RO7ifZ1OJ8G/44Uy4wkd/9
 6jok5OB3sHpuzMFVA5Bc6KpsV6TK0xKembumgVZt2z6BuQ71Mbtm7w1/B
 pDAmkZKFSFrIkq506iV4qrDI1wuwtKYgclfAAe3TnHT922JS88NeBq+sf
 L8NIM5SjUx2a8wbW8SyEgnY3RZgvgg2CyBte+zKROoBI/EkwkeIzUUQ4q
 OMO+pYhvrntN9dR012HGHqKdB1WhtS1rQ/kHic8dZ9ylFMem+vfqH/RpS g==;
X-CSE-ConnectionGUID: Ms4A2it4SI2VVINq3jOvuw==
X-CSE-MsgGUID: A8tvNTuMTAeIatVI3iLqwg==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="12680014"
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; d="scan'208";a="12680014"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 04:49:10 -0700
X-CSE-ConnectionGUID: E+GUTB39STSHZwdLoKv/cQ==
X-CSE-MsgGUID: OnJuknJeSpmevLgE/h20cA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; d="scan'208";a="23193817"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 04:49:08 -0700
Date: Wed, 17 Apr 2024 14:49:41 +0300
From: Imre Deak <imre.deak@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Manasi Navare <navaremanasi@chromium.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH v2 07/11] drm/dp: Add
 drm_dp_uhbr_channel_coding_supported()
Message-ID: <Zh+3VXaC+EJKZqAd@ideak-desk.fi.intel.com>
References: <20240416221010.376865-1-imre.deak@intel.com>
 <20240416221010.376865-8-imre.deak@intel.com>
 <871q74z6mh.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <871q74z6mh.fsf@intel.com>
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

On Wed, Apr 17, 2024 at 12:21:58PM +0300, Jani Nikula wrote:
> On Wed, 17 Apr 2024, Imre Deak <imre.deak@intel.com> wrote:
> > Factor out a function to check for UHBR channel coding support used by a
> > follow-up patch in the patchset.
> >
> > Cc: dri-devel@lists.freedesktop.org
> > Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> > Reviewed-by: Manasi Navare <navaremanasi@chromium.org>
> > Acked-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Signed-off-by: Imre Deak <imre.deak@intel.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_dp.c | 2 +-
> >  include/drm/display/drm_dp_helper.h     | 6 ++++++
> >  2 files changed, 7 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> > index 23808e9d41d5d..41127069b55e4 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dp.c
> > +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> > @@ -225,7 +225,7 @@ static void intel_dp_set_dpcd_sink_rates(struct intel_dp *intel_dp)
> >  	 * Sink rates for 128b/132b. If set, sink should support all 8b/10b
> >  	 * rates and 10 Gbps.
> >  	 */
> > -	if (intel_dp->dpcd[DP_MAIN_LINK_CHANNEL_CODING] & DP_CAP_ANSI_128B132B) {
> > +	if (drm_dp_uhbr_channel_coding_supported(intel_dp->dpcd)) {
> >  		u8 uhbr_rates = 0;
> >  
> >  		BUILD_BUG_ON(ARRAY_SIZE(intel_dp->sink_rates) < ARRAY_SIZE(dp_rates) + 3);
> > diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
> > index baf9949ff96fc..8a64fe8d97af2 100644
> > --- a/include/drm/display/drm_dp_helper.h
> > +++ b/include/drm/display/drm_dp_helper.h
> > @@ -251,6 +251,12 @@ drm_dp_channel_coding_supported(const u8 dpcd[DP_RECEIVER_CAP_SIZE])
> >  	return dpcd[DP_MAIN_LINK_CHANNEL_CODING] & DP_CAP_ANSI_8B10B;
> >  }
> >  
> > +static inline bool
> > +drm_dp_uhbr_channel_coding_supported(const u8 dpcd[DP_RECEIVER_CAP_SIZE])
> > +{
> > +	return dpcd[DP_MAIN_LINK_CHANNEL_CODING] & DP_CAP_ANSI_128B132B;
> > +}
> 
> Nitpick, "uhbr channel coding" is not pedantically correct, and it does
> rub me the wrong way.
> 
> Yes, using 128b/132b channel coding implies UHBR, and UHBR requires
> 128b/132b channel coding, but they are not the same thing. We do
> conflate the two quite a bit in the code, checking for UHBR when we
> really mean 128b/132b, but embedding this confusion in the function name
> directly is a bit much.
> 
> I've named the link training functions drm_dp_128b132b_* in the same
> file, and I think this one should be named similarly. Maybe just
> drm_dp_128b132b_supported(), and rename
> drm_dp_channel_coding_supported() to drm_dp_8b10b_supported() to unify?

Ok, makes sense, will rename it to drm_dp_128b132b_supported() and
can do the same - as a follow-up - for 8b10b.

> BR,
> Jani.
> 
> 
> 
> > +
> >  static inline bool
> >  drm_dp_alternate_scrambler_reset_cap(const u8 dpcd[DP_RECEIVER_CAP_SIZE])
> >  {
> 
> -- 
> Jani Nikula, Intel
