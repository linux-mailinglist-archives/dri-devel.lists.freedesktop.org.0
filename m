Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A79BA8592
	for <lists+dri-devel@lfdr.de>; Mon, 29 Sep 2025 10:01:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 213A810E3B1;
	Mon, 29 Sep 2025 08:01:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XDTP3X5Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35EED10E3B1
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Sep 2025 08:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759132895; x=1790668895;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=jZ2em0IxAiFaQRRiJPQfP30S+T9cI0PbXeOX+/nvU6M=;
 b=XDTP3X5YQ5fH1Kwjice1cGVc9p7LZ5S5wdtsT88Zovi35VEjx65mfdo2
 QEsUYK5YLdxA8p+kHCtNn7+4lWuEOU7YvGt3/Mgeq08m7lWdLvnWJ2MMP
 J+qncflSzOUiKw8/2n1Ydd32Yp5RqHPtl3OdjUzNOQsM87JD2ttpT/4+4
 SKVT8lRQOLhdiC5S25J/qi1Mgc0Ww7+j8yQ1vLv7OjHwDPzo5Qf645hYl
 +UImrEh2Zef9yEj78I33gahy/iNtKgq8oom9O8NrUJgsShf1lYkLS6JMm
 F2FoWh/49tym6oBYEtJbKxbe5kOXdc8kkXeFdS8T7qxcevrdZnJftcRum w==;
X-CSE-ConnectionGUID: 9ntabl1QRdKdR9nP1muwHg==
X-CSE-MsgGUID: gPzIF1CHTAqmJTTpGV+vWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11567"; a="71982204"
X-IronPort-AV: E=Sophos;i="6.18,301,1751266800"; d="scan'208";a="71982204"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 01:01:34 -0700
X-CSE-ConnectionGUID: 5j/+SfzsSDCakJT3ze/JEQ==
X-CSE-MsgGUID: NVxbNn7mQcGRnyt56P06tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,301,1751266800"; d="scan'208";a="183353600"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.198])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 01:01:30 -0700
Date: Mon, 29 Sep 2025 11:01:27 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Michel =?iso-8859-1?Q?D=E4nzer?= <michel.daenzer@mailbox.org>
Cc: "Tseng, Chuan Yu (Max)" <ChuanYu.Tseng@amd.com>,
 Derek Foreman <derek.foreman@collabora.com>,
 "Wentland, Harry" <Harry.Wentland@amd.com>,
 "Limonciello, Mario" <Mario.Limonciello@amd.com>,
 "xaver.hugl@gmail.com" <xaver.hugl@gmail.com>,
 "victoria@system76.com" <victoria@system76.com>,
 "seanpaul@google.com" <seanpaul@google.com>,
 "Li, Sun peng (Leo)" <Sunpeng.Li@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [RFC PATCH] drm/uapi: Indroduce a VRR Range Control Interface
Message-ID: <aNo81waN4Z4P1tOc@intel.com>
References: <20250912073305.209777-1-Chuanyu.Tseng@amd.com>
 <010201993e2cb26f-089ce007-9e30-4b79-b487-c16c360309fd-000000@eu-west-1.amazonses.com>
 <d8694d69-62b3-4418-9fcb-d37c1daa1f9f@mailbox.org>
 <010201994e05ce63-85ad5afd-fc09-48fc-bd6e-f3716c8ba09f-000000@eu-west-1.amazonses.com>
 <aNOtCLd9rzKuqMSb@intel.com>
 <cdb28aea-e647-4b2a-a5e3-1ec60f05a4aa@mailbox.org>
 <aNO0Snb9m5Nsf3H6@intel.com>
 <CY1PR12MB95832CDC0C7D41D10E2A3149E51CA@CY1PR12MB9583.namprd12.prod.outlook.com>
 <321dec48-eebd-42c0-8241-4fad7b9b8f2b@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <321dec48-eebd-42c0-8241-4fad7b9b8f2b@mailbox.org>
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

On Wed, Sep 24, 2025 at 01:56:30PM +0200, Michel Dänzer wrote:
> On 24.09.25 11:32, Tseng, Chuan Yu (Max) wrote:
> > [AMD Official Use Only - AMD Internal Distribution Only]
> > 
> > n Wed, Sep 24, 2025 at 10:39:16AM +0200, Michel Dänzer wrote:
> >>> On 24.09.25 10:34, Ville Syrjälä wrote:
> >>>> On Mon, Sep 15, 2025 at 03:37:07PM +0000, Derek Foreman wrote:
> >>>>> On 9/15/25 5:01 AM, Michel Dänzer wrote:
> >>>>>> On 12.09.25 15:45, Derek Foreman wrote:
> >>>>>>> On 9/12/25 2:33 AM, Chuanyu Tseng wrote:
> >>>>>>>> Introduce a DRM interface for DRM clients to further restrict
> >>>>>>>> the VRR Range within the panel supported VRR range on a
> >>>>>>>> per-commit basis.
> >>>>>>>>
> >>>>>>>> The goal is to give DRM client the ability to do frame-doubling/
> >>>>>>>> ramping themselves, or to set lower static refresh rates for
> >>>>>>>> power savings.
> >>>>>>> I'm interested in limiting the range of VRR to enable HDMI's QMS/CinemaVRR features - ie: switching to a fixed rate for media playback without incurring screen blackouts/resyncs/"bonks" during the switch.
> >>>>>>>
> >>>>>>> I could see using an interface such as this to do the frame rate limiting, by setting the lower and upper bounds both to a media file's framerate. However for that use case it's not precise enough, as video may have a rate like 23.9760239... FPS.
> >>>>>>>
> >>>>>>> Would it be better to expose the limits as a numerator/denominator pair so a rate can be something like 24000/1001fps?
> >>>>>> I was thinking the properties could allow directly specifying the minimum and maximum number of total scanlines per refresh cycle, based on the assumption the driver needs to program something along those lines.
> >>>>>
> >>>>> Surprisingly, this would also not be precise enough for exact media
> >>>>> playback, as the exact intended framerate might not result in an
> >>>>> integer number of scan lines. When that happens a QMS/CinemaVRR
> >>>>> capable HDMI source is expected to periodically post a frame with a
> >>>>> single extra scan line to minimize the error.
> >>>>
> >>>> Intel VRR hardware has a "CMRR" feature where it can automagically
> >>>> tweak the vtotal between frames to maintain a non integer average.
> >>>
> >>> Neat.
> >>>
> >>>
> >>>> As for knobs to limit the min/max refresh rates, technically you
> >>>> wouldn't need the max knob because that is ultimately defined by the
> >>>> vtotal of the supplied timings. But I guess if you have a knob to
> >>>> limit the min then a max knob might be convenient as well.
> >>>
> >>> It allows the compositor to limit the maximum refresh rate without changing the mode (which can involve visual glitches).
> > 
> >> I think the driver should be able to handle the two cases in exactly the same way (assuming nothing else in the mode changes). But I'm not opposed to having a max alongside the min.
> 
> Compositors want to avoid setting the DRM_MODE_ATOMIC_ALLOW_MODESET flag under normal circumstances, because it may result in visual glitches.

If the driver can do the vtotal adjustment without a modeset
(which it should if it can do the same thing for the max
refresh rate property) then you don't need that flag. And for
i915 we'd probably handle the property change just like a
modeset, and after all the calculation are done the driver
will just notice that a full modeset isn't required to get to
the new state.

> 
> 
> >> IMO the min and max could be straight integers, if specified as vtotals (that's what the hardware takes for us at least). And for the CMRR thing we'd need another property to indicate the target refresh rate somehow.
> > 
> >> I suppose another option would be to have non-integer min/max, and then enable CMRR if min==max==<non-integer value>. Not sure I quite like that idea though.
> 
> Do you see any issue with proposal 2 by Leo Li, specifying the limits as the total duration of a refresh cycle in nanoseconds? If the limits don't correspond to an integer number of scanlines, the driver should alternate between the nearest integer numbers of scanlines to approximate the requested duration on average.

We can't do any kind of alternation for the min and max independently.
those will always just be integer number of scanlines. With CMRR will
automagically alternate between two vtotals to maintain the average.

I suppose a time based property would work for us, we'd just have to
convert it to scanlines anyway.

> >> Also not sure what the rules for such properties should be.
> >> Should they be allowed to be specified outside the legal range and the driver just clamps them, or should that be an error?
> > 
> > It's possible that compositor set the value which is not acceptable to sink vrr range.
> > It would be better to clamp the false value.
> 
> One downside of implicit clamping is that the resulting effective limits may not be what the compositor expects.

I suppose.

Though if/when we get the DC balance stuff actually working the min/max
vtotal will be changing dynamically all the time to maintain the balance.
So in that case the compositor can't accurately know the exact vtotal
for future frames anyway. But the absolute limits will be based on what
the user specified.

-- 
Ville Syrjälä
Intel
