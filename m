Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD375F0DD1
	for <lists+dri-devel@lfdr.de>; Fri, 30 Sep 2022 16:44:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58F0810ED33;
	Fri, 30 Sep 2022 14:44:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFE0410E1D4;
 Fri, 30 Sep 2022 14:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664549062; x=1696085062;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=YsZnePun6MVZZBFh8GTCLEGFD/oFPQLVAN8Q7WFoLu8=;
 b=C4CNDMLGtIYcpor0TTWLUiBYYhciGWAc//srXwqa1+HkJ25GxQJqvLv+
 XS0VkQP3hNXcdUygVOB92Tce4NLhIiUEE5jfwr2sbbwzikzM/FF2CJu8N
 x81xKUDSHLdMpsxpbhOCuvDmC55+WUXJqt6bbaCXO+8kXfsLlpO+cf4rR
 F3WVPoMEJj8OprOMNl3mmXkWqkQYw9fr59ZT4vyYcooE96yWQyHOI5KQJ
 DPr1BQ4DvxoQPuTnDxFAZnKEQGpAJpEz0I0Hh2b57ypLjOfI+OAkB4iGa
 g9lK/dNPuPwPz921Ip/07iNLKORn/KIYZRNstRKNZjKGbmavXZG5pmVJg Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10486"; a="281917684"
X-IronPort-AV: E=Sophos;i="5.93,358,1654585200"; d="scan'208";a="281917684"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2022 07:44:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10486"; a="765148210"
X-IronPort-AV: E=Sophos;i="5.93,358,1654585200"; d="scan'208";a="765148210"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by fmsmga001.fm.intel.com with SMTP; 30 Sep 2022 07:44:18 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 30 Sep 2022 17:44:17 +0300
Date: Fri, 30 Sep 2022 17:44:17 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Sebastian Wick <sebastian.wick@redhat.com>
Subject: Re: [RFC v2] drm/kms: control display brightness through
 drm_connector properties
Message-ID: <YzcAwVC8tm1imNOL@intel.com>
References: <b61d3eeb-6213-afac-2e70-7b9791c86d2e@redhat.com>
 <878rm3zuge.fsf@intel.com> <YzQojrDOGNhm4D8l@intel.com>
 <YzQseBFa5EvDUDSw@intel.com>
 <CA+hFU4xRV74r3Wbs-TTWmtAkEwdJaEb+1QXUZSh52LVRwfddeA@mail.gmail.com>
 <20220930103956.1c3df79e@eldfell>
 <CA+hFU4yR542C3Qo_8ggkXKF+OZs=Pt9awsQ7Q4bXGoiv+7-VyQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+hFU4yR542C3Qo_8ggkXKF+OZs=Pt9awsQ7Q4bXGoiv+7-VyQ@mail.gmail.com>
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
Cc: Christoph Grenz <christophg+lkml@grenz-bonn.de>,
 Martin Roukala <martin.roukala@mupuf.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 wayland <wayland-devel@lists.freedesktop.org>,
 Hans de Goede <hdegoede@redhat.com>, Pekka Paalanen <ppaalanen@gmail.com>,
 Yusuf Khan <yusisamerican@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 30, 2022 at 04:20:29PM +0200, Sebastian Wick wrote:
> On Fri, Sep 30, 2022 at 9:40 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:
> >
> > On Thu, 29 Sep 2022 20:06:50 +0200
> > Sebastian Wick <sebastian.wick@redhat.com> wrote:
> >
> > > If it is supposed to be a non-linear luminance curve, which one is it?
> > > It would be much clearer if user space can control linear luminance
> > > and use whatever definition of perceived brightness it wants. The
> > > obvious downside of it is that it requires bits to encode changes that
> > > users can't perceive. What about backlights which only have a few
> > > predefined luminance levels? How would user space differentiate
> > > between the continuous and discrete backlight? What about
> > > self-emitting displays? They usually increase the dynamic range when
> > > they increase in brightness because the black level doesn't rise. They
> > > also probably employ some tonemapping to adjust for that. What about
> > > the range of the backlight? What about the absolute luminance of the
> > > backlight? I want to know about that all in user space.
> > >
> > > I understand that most of the time the kernel doesn't have answers to
> > > those questions right now but the API should account for all of that.
> >
> > Hi,
> >
> > if the API accounts for all that, and the kernel doesn't know, then how
> > can the API not lie? If the API sometimes lies, how could we ever trust
> > it at all?
> 
> Make it possible for the API to say "I don't know". I'd much rather
> have an API tell me explicitly what it does and doesn't know instead
> of having to guess what data I can actually rely on.
> 
> For example if the kernel knows the luminance is linear on one display
> and doesn't know anything about the other display and it exposes them
> both in the same way I can not possibly write any code which relies on
> exact control over the luminance for either display.
> 
> >
> > Personally I have the feeling that if we can even get to the level of
> > "each step in the value is a more or less perceivable change", that
> > would be good enough. Think of UI, e.g. hotkeys to change brightness.
> > You'd expect almost every press to change it a bit.
> 
> The nice thing is that you can have that even if you have no further
> information about the brightness control and it might be good enough
> for some use cases but it isn't for others.
> 
> > If an end user wants defined and controlled luminance, I'd suggest they
> > need to profile (physically measure) the response of the display at
> > hand. This is no different from color profiling displays, but you need
> > a measurement device that produces absolute measurements if absolute
> > control is what they want.
> 
> If that's the kind of user experience you're after, good for you. I
> certainly want things to work out of the box which makes this just a
> big no-go.

I think if we have the information to make the default behaviour
better then we should do that. Ie. if the firmaware gives us a
table to remap the values for a more linear response we should
make use of that by default.

We can of course provide a way for the user to plug in their own
actually measured data later. But IMO that doesn't even have to
happen in the initial implementation. Just need to avoid painting
ourselves totally in the corner in a way that would prevent later
additions like that.

I just hate the current limbo where we're somehow too afraid to
change the current behaviour to do the remapping by default.
I see no upsides in the current behaviour of just blindly
exposing the raw hardware register values more or less. They
mean absolutely nothing to any user.

-- 
Ville Syrjälä
Intel
