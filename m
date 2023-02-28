Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 378086A580D
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 12:29:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC62B10E07D;
	Tue, 28 Feb 2023 11:29:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B228010E6A1
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Feb 2023 11:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677583747; x=1709119747;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=gOxKykyF6vlKuLJET1MNy+bVWMbzJwF2eV9Lpy2mIEE=;
 b=PpL3eOJXbG6i0o+Bka/xRTtBH1vMMNFhAgCTpjyRqiZ/XfE0qADnZYNo
 ivLEAx+ldkmj0MFxomUaZvfz0m3onmdDrqzyBJd7aNXhwpSDtOUKAKVvQ
 p3lL03KJEA0/z8tTF3T9YP/GzoR+tLHwEWDIHvvkVkYTqANMjusFf7jBB
 /oF5yypofCej4SUeEJZn/GeYtxyWOAhdC/pXHKGM4oOxh4hRA2WpkEOWP
 ugxLVUAr4rzasq2k/m5PaKaW9wSnBAJdcdamoGz+CUMuuG3xQQCxakC2T
 2qQZUq33RIwigc5nHZJN9mbBuxeeyAvN2+K5yCHu2eUwsCFkFfUZf0enI w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="335598018"
X-IronPort-AV: E=Sophos;i="5.98,221,1673942400"; d="scan'208";a="335598018"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2023 03:28:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="763139657"
X-IronPort-AV: E=Sophos;i="5.98,221,1673942400"; d="scan'208";a="763139657"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.70])
 by FMSMGA003.fm.intel.com with SMTP; 28 Feb 2023 03:28:48 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 28 Feb 2023 13:28:48 +0200
Date: Tue, 28 Feb 2023 13:28:48 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: [PATCH] drm: document TV margin properties
Message-ID: <Y/3lcEq5y2SrUYyA@intel.com>
References: <20230227122108.117279-1-contact@emersion.fr>
 <20230228104642.21dae84c@eldfell>
 <UA_4dHbPqQvjG0TrP7OhP73PFlhdTNg9Mx9GW3MRGX_JskeQHTNaZyKTBj4AmJoSgutHZeQTa08RkRBuFS6xfTPpEm7MrVtJZEaq88ZYg1s=@emersion.fr>
 <20230228121222.4abf13cb@eldfell>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230228121222.4abf13cb@eldfell>
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
Cc: Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
 Maxime Ripard <maxime@cerno.tech>, dri-devel@lists.freedesktop.org,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 28, 2023 at 12:12:22PM +0200, Pekka Paalanen wrote:
> On Tue, 28 Feb 2023 09:53:47 +0000
> Simon Ser <contact@emersion.fr> wrote:
> 
> > On Tuesday, February 28th, 2023 at 09:46, Pekka Paalanen <ppaalanen@gmail.com> wrote:
> > 
> > > can these be negative as well, to achieve overscan and not just
> > > underscan? Did I get overscan and underscan right... these are related
> > > to under/overscan, aren't they?
> > > 
> > > Hmm, no, I guess that doesn't make sense, there is no room in the
> > > signal to have negative margins, it would result in clipping the
> > > framebuffer while scaling up. So this can only be used to scale
> > > framebuffer down, add borders, and the TV then scales it back up
> > > again?  
> > 
> > Correct.
> > 
> > > Looks like neither my Intel nor AMD cards support these, I don't see
> > > the properties. More things to the list of KMS properties Weston needs
> > > to explicitly control. Oh, it seems vc4 exclusive for now.  
> > 
> > i915 does support it but for TV connectors only (i915/display/intel_tv.c).

I also have some patches to add it for HDMI and DP on i915.
But those are a bit stalled due to more important stuff
taking up my time.

Some fairly old version here:
https://github.com/vsyrjala/linux.git hdmi_margins_3

> > > Is this instead not scaling anything but simply sending metadata
> > > through the connector?  
> > 
> > No metadata is sent. This is purely equivalent to setting up CRTC_*
> > properties to scale the planes.

My wip HDMI/DP patches do set the AVI inforame "bars" based on
this. I think vc4 is already doing that as well.

> 
> Oh! That would be really good to mention in the doc. Maybe even prefer
> plane props over this? Or is this for analog TV, and plane props for
> digital TV?

Plane properties would be pointless for this. CRTC properties might
make sense. But what is more accurate kinda depends on the hardware
design.

> The above are the important comments. All below is just musings you can
> ignore if you wish.
> 
> > > Or are there underlying requirements that this connector property is
> > > actually affecting the CRTC, which means that it is fundamentally
> > > impossible to use multiple connectors with different values on the same
> > > CRTC? And drivers will reject any attempt, so there is no need to
> > > define what conflicting settings will do?  
> > 
> > I don't think any driver above supports cloning CRTCs for these
> > connector types. i915 sets clonable = false for these connectors.
> > vc4 picks the first connector's TV margins, always.
> 
> Sounds like i915 does it right, and vc4 does not, assuming vc4 does not
> prevent cloning.

For i915 my plan was to reject even HDMI+HDMI/VGA cloning (which
otherwise is allowed) when these properties are set. And that's
because they are connector properties and thus could disagree
between the cloned connectors. If they were CRTC properties
that would work fine.

The main reason i915 rejects cloning with many output types
is that generating the correct clock for each output becomes
difficult/impossible. And on HSW+ cloning is no longer
supported by the hardware at all.

> 
> > 
> > > IOW, does simply the existence of these properties on a connector
> > > guarantee that the connector must be the only one on a CRTC?  
> > 
> > I suppose that there could exist some hardware capable of applying
> > margins post-CRTC? Such driver could support cloning CRTCs and still
> > applying the connector margins correctly.
> 
> Yeah, theoretically. But in the KMS object model, is there the idea
> that connectors do not do image manipulation, they can only convert the
> signal type at most and send metadata?

No such rule.

Some hardware has scalers and all kinds of fancy stuff in the 
encoder essentially. Quite common in old TV encoder chips.
That's pretty much where these properties came from I think.

And eDP/LVDS/etc. also do scaling in the connector in the
current model since that's where the 'scaling mode' property
lives.

-- 
Ville Syrjälä
Intel
