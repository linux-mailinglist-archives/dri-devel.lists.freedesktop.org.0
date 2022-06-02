Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 82AE253BD35
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jun 2022 19:20:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C302110F2D6;
	Thu,  2 Jun 2022 17:20:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B57EA10F2D6
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jun 2022 17:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654190418; x=1685726418;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=2wDpjfgZxMj+z+N0gXrtkY4ixpNK0Su1vrSZLd438B8=;
 b=YK2bkkLR7uMjbJn53c986sEIC3bj5OkQK0+RhZ7kAGZQl5izhPfTN/ly
 QKbHPbl8SN1aSgghDqMbBiF1s0Uo+ZQ947+8oQmD9x4CSF9vaXuBFVAky
 xgg6PJpZ9rGr2u+DXJh6xrLk3Vlc1+9iDOWXBi3HBoWQw42t1uL1oASlS
 FXLfSgdg2NCavCy2BaGzxjO7EagYwRdzVw8Bbp0yeApKSHJdPHaA3KB5P
 IY6kTvIumTgNSgUXQaO+iSbJugRZNDi/1+PX3ICuf3o1G4zT6MD2zZD2K
 2VnrOvaCufnH0cnwX2tZi/u/2A6e4jQG6nxk48Iaga2S+AcfsPgZPvBpB A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10366"; a="258089656"
X-IronPort-AV: E=Sophos;i="5.91,271,1647327600"; d="scan'208";a="258089656"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2022 10:20:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,271,1647327600"; d="scan'208";a="612915253"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.163])
 by orsmga001.jf.intel.com with SMTP; 02 Jun 2022 10:20:14 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 02 Jun 2022 20:20:13 +0300
Date: Thu, 2 Jun 2022 20:20:13 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Sebastian Wick <sebastian.wick@redhat.com>
Subject: Re: How should "max bpc" and "Colorspace" KMS property work?
Message-ID: <YpjxTddF5SS+6PUz@intel.com>
References: <20220525102850.5a70e58f@eldfell>
 <80798931-dbe7-54d7-8e1a-aaebfc39780c@mailbox.org>
 <U2A3FifHdFH9yDVrigaioxCTNx60MgkND7jcyIeKP2S4Ghu-BmmRaODqBDp6K0Q-aPBjPcqa2zUGuJNkGmRWZyQx2FjRJe9dVtJhQG9ZNCk=@emersion.fr>
 <20220525133647.052d09da@eldfell> <YpZSWwVkhJOalM4M@intel.com>
 <20220601102126.4f3602fd@eldfell> <YpdyYbRZP2fdG9Fz@intel.com>
 <20220602104759.60f5a68f@eldfell> <Ypjn4YZWUY5Vi0Xj@intel.com>
 <CA+hFU4zbHabsffqV7-3D+N820SzZnHR5C14pupmW7uKSewU_UQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+hFU4zbHabsffqV7-3D+N820SzZnHR5C14pupmW7uKSewU_UQ@mail.gmail.com>
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
Cc: Michel =?iso-8859-1?Q?D=E4nzer?= <michel.daenzer@mailbox.org>,
 Jonas =?iso-8859-1?Q?=C5dahl?= <jadahl@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Hans de Goede <hdegoede@redhat.com>, Pekka Paalanen <ppaalanen@gmail.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 02, 2022 at 07:08:33PM +0200, Sebastian Wick wrote:
> On Thu, Jun 2, 2022 at 6:40 PM Ville Syrjälä
> <ville.syrjala@linux.intel.com> wrote:
> >
> > On Thu, Jun 02, 2022 at 10:47:59AM +0300, Pekka Paalanen wrote:
> > > On Wed, 1 Jun 2022 17:06:25 +0300
> > > Ville Syrjälä <ville.syrjala@linux.intel.com> wrote:
> > >
> > > > On Wed, Jun 01, 2022 at 10:21:26AM +0300, Pekka Paalanen wrote:
> > > > > On Tue, 31 May 2022 20:37:31 +0300
> > > > > Ville Syrjälä <ville.syrjala@linux.intel.com> wrote:
> > > > >
> > > > > > On Wed, May 25, 2022 at 01:36:47PM +0300, Pekka Paalanen wrote:
> > > > > > > On Wed, 25 May 2022 09:23:51 +0000
> > > > > > > Simon Ser <contact@emersion.fr> wrote:
> > > > > > >
> > > > > > > > On Wednesday, May 25th, 2022 at 10:35, Michel Dänzer <michel.daenzer@mailbox.org> wrote:
> > > > > > > >
> > > > > > > > > > Mind that "max bpc" is always in auto. It's only an upper limit, with
> > > > > > > > > > the assumption that the driver can choose less.
> > > > > > > > >
> > > > > > > > > It seems to me like the "max bpc" property is just kind of bad API,
> > > > > > > > > and trying to tweak it to cater to more use cases as we discover them
> > > > > > > > > will take us down a rabbit hole. It seems better to replace it with
> > > > > > > > > new properties which allow user space to determine the current
> > > > > > > > > effective bpc and to explicitly control it.
> > > > > > > >
> > > > > > > > +1, this sounds much more robust, and allows better control by user-space.
> > > > > > > > User-space needs to have fallback logic for other state as well anyways.
> > > > > > > > If the combinatorial explosion is too much, we should think about optimizing
> > > > > > > > the KMS implementation, or improve the uAPI.
> > > > > > >
> > > > > > > +1 as well, with some recommendations added and the running off to the
> > > > > > > sunset:
> > > > > > >
> > > > > > > Use two separate KMS properties for reporting current vs.
> > > > > > > programming desired. The KMS property reporting the current value
> > > > > > > must be read-only (immutable). This preserves the difference between
> > > > > > > what userspace wanted and what it got, making it possible to read
> > > > > > > back both without confusing them. It also allows preserving driver behaviour
> > > > > >
> > > > > > I don't see much real point in a property to report the current bpc.
> > > > > > That can't be used to do anything atomically. So I suppose plymouth
> > > > > > would be the only user.
> > > > >
> > > > > Hi Ville,
> > > > >
> > > > > I think also professional color managed display servers would need it.
> > > > >
> > > > > If they detect that the link bpc is no longer the same as it was when
> > > > > the monitor was profiled, the profile will need to be re-verified by
> > > > > measuring the monitor again.
> > > > >
> > > > > See "Color calibration auditing system" notes in
> > > > > https://gitlab.freedesktop.org/wayland/weston/-/issues/467 description.
> > > > >
> > > > > > So IMO if someone really need explicit control over this then we
> > > > > > should just expose properties to set things explicitly. So we'd
> > > > > > need at least props for the actual bpc and some kind of color
> > > > > > encoding property (RGB/YCbCr 4:4:4/4:2:2:/4:2:0, etc.). And someone
> > > > > > would really need to figure out how DSC would interact with those.
> > > > >
> > > > > I believe there still must be "auto" setting for bpc, and a separate
> > > > > feedback property, so that userspace can use "auto" to see what it can
> > > > > get without doing thousands of TEST_ONLY commits plus a few "link
> > > > > status" failure handlings in order to find a working configuration (I'm
> > > > > assuming we have many more properties than just "max bpc" to figure
> > > > > out). After "auto" has told userspace what actually works without blind
> > > > > trial and error, then userspace can program than value explicitly to
> > > > > make sure it doesn't change accidentally in the future.
> > > >
> > > > Yeah we need "auto", but IMO mainly just to keep the current userspace
> > > > working. Using that to probe what's possible doesn't sound particularly
> > > > workable since you can't use it with TEST_ONLY commits. Also change to
> > > > some other property could still cause the whole thing to fail after the
> > > > max bpc has been probed so not sure it really buys you anything.
> > >
> > > Hi Ville,
> > >
> > > earlier in this thread I drafted how the property-pair with "auto"
> > > could be made useful also with TEST_ONLY commits:
> > >
> > > > Thinking even further, about the problem of TEST_ONLY commits not
> > > > telling you what "auto" settings would actually give you; there could
> > > > be a new/extended KMS ioctl that would be the same as commit now, but
> > > > allow the kernel to return another set of KMS state back with
> > > > TEST_ONLY. Like reading back all KMS state after commit was done for
> > > > real. The "current" KMS properties would be part of that set, and tell
> > > > userspace what would happen in a real commit.
> > >
> > > I do believe the combinatorial explosion of the KMS state search space
> > > to find a working configuration is going to be a very real problem
> > > sooner or later.
> >
> > That's seems like an orthogonal issue that would need some kind of
> > new uapi approach that let's you get some state back out from
> > TEST_ONLY commits.
> >
> > > > > Now that you mentioned some kind of color encoding property (I assume
> > > > > you referred mostly to the sub-sampling aspect), how does the connector
> > > > > property "Colorspace" factor in?
> > > >
> > > > The "Colorspace" property just changes what we report to the display
> > > > via infoframes/MSA/SDP. It does not cause the display hardware to do
> > > > any colorspace conversion/etc.
> > >
> > > Good.
> > >
> > > > To actually force the display hardware to do the desired conversion
> > > > we need some new properties. ATM the only automagic conversion that
> > > > can happen (at least with i915) is the RGB 4:4:4->YCbCr 4:2:0 fallback,
> > > > which is needed on some displays to get 4k+ modes to work at all.
> > >
> > > When "Colorspace" says RGB, and the automatic fallback would kick in to
> > > create a conflict, what happens?
> >
> > I would put that in the "Doctor, it hurts when I..." category.
> 
> So what are we supposed to do with the Colorspace property other than
> setting it to default?

You set it to the correct value based on what you have in the
framebuffers(s). Granted the automagic YCbCr 4:2:0 fallback can screw
you over right now, and that is why we'll need explicit properties to
control the output encoding/etc.

> 
> >
> > >
> > > > >
> > > > > The enum values (which are not documented in KMS docs, btw.) are tuples
> > > > > of color space + color model, e.g. on Intel:
> > > > >
> > > > > "Colorspace": enum {Default, SMPTE_170M_YCC, BT709_YCC, XVYCC_601,
> > > > > XVYCC_709, SYCC_601, opYCC_601, opRGB, BT2020_CYCC, BT2020_RGB,
> > > > > BT2020_YCC, DCI-P3_RGB_D65, DCI-P3_RGB_Theater}
> > > >
> > > > The accepted values are just what the CTA-861/DP specs
> > > > allow us to transmit in he infoframe/SDP/MSA.
> > >
> > > Sure, but I mean the KMS doc a) does not refer to any standard, and b)
> > > does not even list what the possible values could be.
> >
> > Seems like something that can be remedied with a patch.
> >
> > >
> > >
> > > > >
> > > > > Reading the KMS docs from
> > > > > https://www.kernel.org/doc/html/latest/gpu/drm-kms.html#standard-connector-properties
> > > > > they say:
> > > > >
> > > > > > Basically the expectation from userspace is:
> > > > > >
> > > > > >         Set up CRTC DEGAMMA/CTM/GAMMA to convert to some sink
> > > > > > colorspace
> > > > > >
> > > > > >         Set this new property to let the sink know what it converted
> > > > > > the CRTC output to.
> > > > > >
> > > > > >         This property is just to inform sink what colorspace source
> > > > > > is trying to drive.
> > > > >
> > > > > However, where does userspace program the actual conversion from RGB to
> > > > > NNN? Is it expected to be embedded in CTM?
> > > > >
> > > > > Or does setting "Colorspace" imply some additional automatic
> > > > > conversion? If so, where does it happen and how is it chosen?
> > > > >
> > > > > > For just the plymouth case I guess the easiest thing would be to
> > > > > > just clamp "max bpc" to the current value. The problem with that
> > > > > > is that we'd potentially break existing userspace. Eg. I don't think
> > > > > > the modesetting ddx or perhaps even most of the wayland compositors
> > > > > > set "max bpc" at all. So we'd need to roll out a bunch of userspace
> > > > > > updates first. And the "current bpc" prop idea would also have this
> > > > > > same problem since plymouth would just clamp "max bpc" based on the
> > > > > > current bpc before the real userspace starts.
> > > > >
> > > > > True, but I believe once color management spreads through Wayland, so
> > > > > will KMS clients also learn to set it.
> > > >
> > > > Sure. But my point is that if we want to change how the "max bpc"
> > > > works I think we need to roll out the userspace stuff first so that
> > > > we at least can tell the user "please update you userspace to release x"
> > > > when they hit the regression.
> > >
> > > Sorry, I lost track on who is suggesting to change what.
> > >
> > > I thought we agreed that "max bpc" means limiting link bpc to at most
> > > that value, but the driver will automatically pick a lower value if
> > > that makes the requested video mode work (and in lack of new KMS
> > > properties).
> > >
> > > I have no desire that change that. I also think the Plymouth issue is
> > > not fully fixable without some new KMS property, and until then the
> > > only thing Plymouth could do is to smash "max bpc" always to 8 - which
> > > mostly stops being a problem once display servers learn to handle "max
> > > bpc".
> >
> > There's no real differene between the kernel automagically clamping
> > "max bpc" to the current BIOS programmed value vs. plymouth doing it.
> > Either approach will break deep color support for current userspace
> > which doesn't reset "max bpc" back to the max.
> >
> > >
> > > However, when new KMS properties are introduced, I very much like to
> > > promote the two property setup for anything that could be a) set to
> > > "auto", or b) be changed by the kernel *and* userspace.
> > >
> > >
> > > Thanks,
> > > pq
> >
> >
> >
> > --
> > Ville Syrjälä
> > Intel
> >

-- 
Ville Syrjälä
Intel
