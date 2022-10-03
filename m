Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5345F2D70
	for <lists+dri-devel@lfdr.de>; Mon,  3 Oct 2022 11:29:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0226510E29A;
	Mon,  3 Oct 2022 09:29:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3BDB10E29A;
 Mon,  3 Oct 2022 09:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664789346; x=1696325346;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=x7GY0RYq/YKp/pKd2XjMWBm29iWvFrR5xYpv2CYMLvM=;
 b=JC8slUdUqIK7xMFUNlXUv5oyDKyUqKMuck6DbRrJRa75mCCwzidjI4OI
 RnZzAwXkImGZ09JcQUoPnxnCbrvtfucvdvbzSmiQx3qYLKVB8wNjr5VKM
 yvvy4sTh57Rw/2AkNKcOo+y6nrMkC8CTa48ghKyNkQf2fKjmFH14bmbf6
 bIetOkGME/TumF+B9gzOp/S41KLDEVRO6JBHczqkLAimTvp7ERUOGaUlL
 6hoqFIaVK34H2+VChyM03Wm6P8PkC33bj4T+8DUTk3SjJ8hGr6U83nPf3
 9qlHhykG94cov8spbi4h3Q+r6YHPDFDrRuO14n1BihH/UIvOddnezWag2 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10488"; a="303494663"
X-IronPort-AV: E=Sophos;i="5.93,365,1654585200"; d="scan'208";a="303494663"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2022 02:29:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10488"; a="712522538"
X-IronPort-AV: E=Sophos;i="5.93,365,1654585200"; d="scan'208";a="712522538"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by FMSMGA003.fm.intel.com with SMTP; 03 Oct 2022 02:29:02 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 03 Oct 2022 12:29:01 +0300
Date: Mon, 3 Oct 2022 12:29:01 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: [RFC v2] drm/kms: control display brightness through
 drm_connector properties
Message-ID: <YzqrXcdXYaJNvR2a@intel.com>
References: <878rm3zuge.fsf@intel.com> <YzQojrDOGNhm4D8l@intel.com>
 <YzQseBFa5EvDUDSw@intel.com>
 <CA+hFU4xRV74r3Wbs-TTWmtAkEwdJaEb+1QXUZSh52LVRwfddeA@mail.gmail.com>
 <20220930103956.1c3df79e@eldfell>
 <CA+hFU4yR542C3Qo_8ggkXKF+OZs=Pt9awsQ7Q4bXGoiv+7-VyQ@mail.gmail.com>
 <YzcAwVC8tm1imNOL@intel.com> <20220930182652.4ea10013@eldfell>
 <CA+hFU4zat+-0eW_6BaY0pbHzKxBjPtnyV5M=X=9Y0Rn8JJe8Wg@mail.gmail.com>
 <20221003113750.64d0417a@eldfell>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221003113750.64d0417a@eldfell>
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Christoph Grenz <christophg+lkml@grenz-bonn.de>,
 Martin Roukala <martin.roukala@mupuf.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 wayland <wayland-devel@lists.freedesktop.org>,
 Hans de Goede <hdegoede@redhat.com>, Yusuf Khan <yusisamerican@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 03, 2022 at 11:37:50AM +0300, Pekka Paalanen wrote:
> On Fri, 30 Sep 2022 18:17:39 +0200
> Sebastian Wick <sebastian.wick@redhat.com> wrote:
> 
> > On Fri, Sep 30, 2022 at 5:27 PM Pekka Paalanen <ppaalanen@gmail.com> wrote:
> > >
> > > On Fri, 30 Sep 2022 17:44:17 +0300
> > > Ville Syrjälä <ville.syrjala@linux.intel.com> wrote:
> > >  
> > > > On Fri, Sep 30, 2022 at 04:20:29PM +0200, Sebastian Wick wrote:  
> > > > > On Fri, Sep 30, 2022 at 9:40 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:  
> > > > > >
> > > > > > On Thu, 29 Sep 2022 20:06:50 +0200
> > > > > > Sebastian Wick <sebastian.wick@redhat.com> wrote:
> > > > > >  
> > > > > > > If it is supposed to be a non-linear luminance curve, which one is it?
> > > > > > > It would be much clearer if user space can control linear luminance
> > > > > > > and use whatever definition of perceived brightness it wants. The
> > > > > > > obvious downside of it is that it requires bits to encode changes that
> > > > > > > users can't perceive. What about backlights which only have a few
> > > > > > > predefined luminance levels? How would user space differentiate
> > > > > > > between the continuous and discrete backlight? What about
> > > > > > > self-emitting displays? They usually increase the dynamic range when
> > > > > > > they increase in brightness because the black level doesn't rise. They
> > > > > > > also probably employ some tonemapping to adjust for that. What about
> > > > > > > the range of the backlight? What about the absolute luminance of the
> > > > > > > backlight? I want to know about that all in user space.
> > > > > > >
> > > > > > > I understand that most of the time the kernel doesn't have answers to
> > > > > > > those questions right now but the API should account for all of that.  
> 
> ...
> 
> > > I'm saying that what looks realistic to me is somewhere *between*
> > > status quo and what Sebastian is asking for. Whatever you mean by "linear
> > > remapping" is probably a realistic goal, because you know you have some
> > > hardware/firmware delivering that information already.
> > >
> > > OTOH, designing UAPI for information that exists only in our dreams
> > > is... well.  
> > 
> > I also didn't say that we should design an UAPI for what doesn't
> > exist, just that we should design the UAPI we actually need in a way
> > that when we get more information we can properly expose that. So if
> > the UAPI exposes anything other than the luminance (e.g. "each step is
> > a perceptual step in brightness", "linear brightness", ..) we have to
> > put some human perception model into the kernel which is ridiculous
> > and it makes it impossible to expose luminance to user space if the
> > kernel has that information.
> 
> You don't need a human perception model in the kernel. You also cannot
> have one, because I would expect most or all backlight and their
> metadata to not define luminance at all. But that is just a guess.
> 
> I suppose the firmware may expose some tables that may allow mapping
> raw hardware values into something more pleasant to use. Like something
> where each step is more or less a visible change. That does not have to
> imply anything about linearity in any space, they may just be "good
> values" for e.g. keyboard-based changing of backlight levels with no
> mathematical or physical basis.
> 
> Ville, what kind of tables do you know about? What do they actually
> tell?

We just get a set of points (up to 20 originally, and I think up to
32 in later spec revisions) that map input brightness (in %) to
output duty cycle (0-0xff in old spec, 0-0xffff in new spec).
And I *think* we're supposed to just linearly inteprolate between
the entries, though the spec doesn't really state that in super
clear terms.

There is some mention in the spec about this being more or less
designed for Windows Vista, so a look through eg.
https://learn.microsoft.com/en-us/windows-hardware/drivers/display/supporting-brightness-controls-on-integrated-display-panels
might be a good idea here.

-- 
Ville Syrjälä
Intel
