Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D1BB99073
	for <lists+dri-devel@lfdr.de>; Wed, 24 Sep 2025 11:05:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A99F10E151;
	Wed, 24 Sep 2025 09:05:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kDHdVh8l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D34F10E151
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 09:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758704720; x=1790240720;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=z/FnGmAGnSC4vHTf14kfWyo9OiuD3xODz0tDT0c4SgA=;
 b=kDHdVh8leJkvWr8tWcGW0rQHCDcuNC4Ri5yx6oqHY7RXpi5/GkJEBYXy
 88/C0d+cFMQ3fwc8ySZQRvVOhfZS85Qf3jGsFKoCXrP9rCsJaZxd4CvrP
 2F7LsAQ5Rdnq2mZHXacLQcy+uW1YoOqdUpkjT4Sc7M5bHU+2oCo1RmgYJ
 zNmSBbq1NgOigYUca2d+o7x4Tdo97/VbjFF4emrMUbXfO2aYl9BXPwrP1
 2wMtGzWnrrnrzntbf6/HukdsFgRe1SPM4kePBAsfvi/5sTmBIYh2tzSEe
 ntkALOLEu+LaTGnWR/zdpIRirfNYADLm8QhzGGzMd5ApbCsbJq5T2NZ9U g==;
X-CSE-ConnectionGUID: XEguT0qETqKENWOKLa2yUg==
X-CSE-MsgGUID: 3QAbXu9CRtC0r5C7mQdCOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="60700663"
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="60700663"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 02:05:20 -0700
X-CSE-ConnectionGUID: vdGwi/UZSmKEcqhcqKh8LA==
X-CSE-MsgGUID: r6DkyVpMTqe51u8jGhS65A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="182155001"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.245.144])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 02:05:17 -0700
Date: Wed, 24 Sep 2025 12:05:14 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Michel =?iso-8859-1?Q?D=E4nzer?= <michel.daenzer@mailbox.org>
Cc: Derek Foreman <derek.foreman@collabora.com>,
 Chuanyu Tseng <Chuanyu.Tseng@amd.com>, harry.wentland@amd.com,
 Mario.Limonciello@amd.com, xaver.hugl@gmail.com,
 victoria@system76.com, seanpaul@google.com, Sunpeng.Li@amd.com,
 dri-devel@lists.freedesktop.org
Subject: Re: [RFC PATCH] drm/uapi: Indroduce a VRR Range Control Interface
Message-ID: <aNO0Snb9m5Nsf3H6@intel.com>
References: <20250912073305.209777-1-Chuanyu.Tseng@amd.com>
 <010201993e2cb26f-089ce007-9e30-4b79-b487-c16c360309fd-000000@eu-west-1.amazonses.com>
 <d8694d69-62b3-4418-9fcb-d37c1daa1f9f@mailbox.org>
 <010201994e05ce63-85ad5afd-fc09-48fc-bd6e-f3716c8ba09f-000000@eu-west-1.amazonses.com>
 <aNOtCLd9rzKuqMSb@intel.com>
 <cdb28aea-e647-4b2a-a5e3-1ec60f05a4aa@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cdb28aea-e647-4b2a-a5e3-1ec60f05a4aa@mailbox.org>
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

On Wed, Sep 24, 2025 at 10:39:16AM +0200, Michel Dänzer wrote:
> On 24.09.25 10:34, Ville Syrjälä wrote:
> > On Mon, Sep 15, 2025 at 03:37:07PM +0000, Derek Foreman wrote:
> >> On 9/15/25 5:01 AM, Michel Dänzer wrote:
> >>> On 12.09.25 15:45, Derek Foreman wrote:
> >>>> On 9/12/25 2:33 AM, Chuanyu Tseng wrote:
> >>>>> Introduce a DRM interface for DRM clients to further restrict the
> >>>>> VRR Range within the panel supported VRR range on a per-commit
> >>>>> basis.
> >>>>>
> >>>>> The goal is to give DRM client the ability to do frame-doubling/
> >>>>> ramping themselves, or to set lower static refresh rates for power
> >>>>> savings.
> >>>> I'm interested in limiting the range of VRR to enable HDMI's QMS/CinemaVRR features - ie: switching to a fixed rate for media playback without incurring screen blackouts/resyncs/"bonks" during the switch.
> >>>>
> >>>> I could see using an interface such as this to do the frame rate limiting, by setting the lower and upper bounds both to a media file's framerate. However for that use case it's not precise enough, as video may have a rate like 23.9760239... FPS.
> >>>>
> >>>> Would it be better to expose the limits as a numerator/denominator pair so a rate can be something like 24000/1001fps?
> >>> I was thinking the properties could allow directly specifying the minimum and maximum number of total scanlines per refresh cycle, based on the assumption the driver needs to program something along those lines.
> >>
> >> Surprisingly, this would also not be precise enough for exact media 
> >> playback, as the exact intended framerate might not result in an integer 
> >> number of scan lines. When that happens a QMS/CinemaVRR capable HDMI 
> >> source is expected to periodically post a frame with a single extra scan 
> >> line to minimize the error.
> > 
> > Intel VRR hardware has a "CMRR" feature where it can automagically
> > tweak the vtotal between frames to maintain a non integer average.
> 
> Neat.
> 
> 
> > As for knobs to limit the min/max refresh rates, technically you
> > wouldn't need the max knob because that is ultimately defined by
> > the vtotal of the supplied timings. But I guess if you have a
> > knob to limit the min then a max knob might be convenient as well.
> 
> It allows the compositor to limit the maximum refresh rate without changing the mode (which can involve visual glitches).

I think the driver should be able to handle the two cases in exactly
the same way (assuming nothing else in the mode changes). But I'm not
opposed to having a max alongside the min.

IMO the min and max could be straight integers, if specified as
vtotals (that's what the hardware takes for us at least). And
for the CMRR thing we'd need another property to indicate the
target refresh rate somehow.

I suppose another option would be to have non-integer min/max,
and then enable CMRR if min==max==<non-integer value>. Not sure
I quite like that idea though.

Also not sure what the rules for such properties should be.
Should they be allowed to be specified outside the legal range
and the driver just clamps them, or should that be an error?

-- 
Ville Syrjälä
Intel
