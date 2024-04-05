Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB4089A51C
	for <lists+dri-devel@lfdr.de>; Fri,  5 Apr 2024 21:40:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74D971127AC;
	Fri,  5 Apr 2024 19:40:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ny81nfVM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 546A3113078;
 Fri,  5 Apr 2024 19:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712346005; x=1743882005;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=/6SaPwyMz2jwJR6RD6GRRVMBjygb+c8fXj5Ye7NLX+k=;
 b=ny81nfVM9snsHq/dHeXPIMkmFFKI/hDaYVuawkL5lDJNBM5llIOfD6lU
 juYE+mFdHoJEQlOy4XuPCPX4+0kRwIPzjz1q8a/+S9RnlMvM5q6n7Hp/l
 l1DPbxf8Z6jJFPwmIdpJz/XIW73vqA1olBmskc+UrXw72uEncvebRhaMS
 m5VZeGGxvskDVrP+A6/PiGoCWIMguYZsFF/W+BBAsSIRoEVrFbZbHBgxq
 etPGpKzzt0uvLOKHBEJ0ISm5DDTBksZKWGXQlUauQCTuF7EDtfDp3pEoz
 RB+cTjUwrufyHrrdDU4oGbmwI9RqmBKH1zCiTucpv/p923p6tLfTgzQZa Q==;
X-CSE-ConnectionGUID: 2o9Qv+DBT2ugYFsEVHGopw==
X-CSE-MsgGUID: xabmM4AJRbSTJRO/O5yiTA==
X-IronPort-AV: E=McAfee;i="6600,9927,11035"; a="7550768"
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; 
   d="scan'208";a="7550768"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 12:40:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11035"; a="827791000"
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; d="scan'208";a="827791000"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 05 Apr 2024 12:40:02 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 05 Apr 2024 22:40:01 +0300
Date: Fri, 5 Apr 2024 22:40:01 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 04/12] drm/client: Add a FIXME around crtc->mode usage
Message-ID: <ZhBTkaIc3SEW7SbQ@intel.com>
References: <20240404203336.10454-1-ville.syrjala@linux.intel.com>
 <20240404203336.10454-5-ville.syrjala@linux.intel.com>
 <7ksd67gkxalnslnssqsrc75lqbxks35zsuc5lvqpqmb2nbyf3j@lgf3svop3mbx>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7ksd67gkxalnslnssqsrc75lqbxks35zsuc5lvqpqmb2nbyf3j@lgf3svop3mbx>
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

On Fri, Apr 05, 2024 at 06:32:46AM +0300, Dmitry Baryshkov wrote:
> On Thu, Apr 04, 2024 at 11:33:28PM +0300, Ville Syrjala wrote:
> > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > 
> > crtc->mode is legacy junk and shouldn't really be used with
> > atomic drivers.
> > 
> > Most (all?) atomic drivers do end up still calling
> > drm_atomic_helper_update_legacy_modeset_state() at some
> > point, so crtc->mode does still get populated, and this
> > does work for now. But eventually would be nice to eliminate
> > all the legacy stuff from atomic drivers.
> > 
> > Switching to crtc->state->mode would require some bigger
> > changes however, as we currently drop the crtc->mutex
> > before we're done using the mode. So leave the junk in
> > for now and just add a FIXME to remind us that this
> > needs fixing.
> 
> 
> What about using allocated duplicate modes to fill modes[] array? This
> requires additional allocations, but it will solve most if not all modes
> lifetime issues.

I think there are two obvious solutions:
1. drm_mode_duplicate() as you suggest
   upside: existing 'modes[i] != NULL' checks work as is
   downside: introduces more error paths due to potential kmalloc() fails
2. Make modes[] and array of structs rather than pointers
   up/downsides: the opposite of option 1

So neither is a trivial search and replace job.

> 
> > 
> > Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > ---
> >  drivers/gpu/drm/drm_client_modeset.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
> > index 2b7d0be04911..8ef03608b424 100644
> > --- a/drivers/gpu/drm/drm_client_modeset.c
> > +++ b/drivers/gpu/drm/drm_client_modeset.c
> > @@ -699,6 +699,10 @@ static bool drm_client_firmware_config(struct drm_client_dev *client,
> >  			 *
> >  			 * This is crtc->mode and not crtc->state->mode for the
> >  			 * fastboot check to work correctly.
> > +			 *
> > +			 * FIXME using legacy crtc->mode with atomic drivers
> > +			 * is dodgy. Switch to crtc->state->mode, after taking
> > +			 * care of the resulting locking/lifetime issues.
> >  			 */
> >  			DRM_DEBUG_KMS("looking for current mode on connector %s\n",
> >  				      connector->name);
> > -- 
> > 2.43.2
> > 
> 
> -- 
> With best wishes
> Dmitry

-- 
Ville Syrjälä
Intel
