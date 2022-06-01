Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C517953A7F9
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 16:06:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3568E10ED8B;
	Wed,  1 Jun 2022 14:06:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1706210ED8B
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 14:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654092390; x=1685628390;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=oI61Nx7fXbUConX0+OxN9xWZtAhCttw4t3oVfPlFh+g=;
 b=X7tZ/VMVyQIikzmm8WoKd1W5bdRmDCi7RZFGzsNXkz419sd2oR20dA5P
 pf5M0lemJTVafWWXXheNyaNFwquOZhqO3ztlsb4GkXEw9ULZt8xOw2pAg
 5obF2xbfEhNQr5s0Xzlp8RbeI9NIUKwziuxNYhGDIIlZSqBziXDln4XMN
 7HwbzqpsrEjCTKSokJ+EJNNERhHxpgmwQ6iW1YyvwqtJivQeZ3E4IXGGA
 /Nf6FXyLtIbbu13wVAXmyPtYC+DNToShQr3PSqNRPu7mCBBHDELcr7Cmh
 VsKjmp5+MTLNq77L+3ViU7LCQrzUyiGWtsgIm57YT3vaX4X/kemvZiS/C w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10365"; a="336254459"
X-IronPort-AV: E=Sophos;i="5.91,268,1647327600"; d="scan'208";a="336254459"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2022 07:06:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,268,1647327600"; d="scan'208";a="581597086"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.163])
 by fmsmga007.fm.intel.com with SMTP; 01 Jun 2022 07:06:25 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 01 Jun 2022 17:06:25 +0300
Date: Wed, 1 Jun 2022 17:06:25 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: How should "max bpc" and "Colorspace" KMS property work?
Message-ID: <YpdyYbRZP2fdG9Fz@intel.com>
References: <YmgyArRaJCh6JkQh@intel.com>
 <57d16ed5-8bfc-ce29-9250-14e2de18710a@redhat.com>
 <20220523112246.056ddc99@eldfell>
 <CA+hFU4wTHR9kLrFY3XkbeROZgxWamiZ6yGYL4jH+wpe8MzLvMw@mail.gmail.com>
 <20220525102850.5a70e58f@eldfell>
 <80798931-dbe7-54d7-8e1a-aaebfc39780c@mailbox.org>
 <U2A3FifHdFH9yDVrigaioxCTNx60MgkND7jcyIeKP2S4Ghu-BmmRaODqBDp6K0Q-aPBjPcqa2zUGuJNkGmRWZyQx2FjRJe9dVtJhQG9ZNCk=@emersion.fr>
 <20220525133647.052d09da@eldfell> <YpZSWwVkhJOalM4M@intel.com>
 <20220601102126.4f3602fd@eldfell>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220601102126.4f3602fd@eldfell>
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
 Michel =?iso-8859-1?Q?D=E4nzer?= <michel.daenzer@mailbox.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Hans de Goede <hdegoede@redhat.com>,
 Jonas =?iso-8859-1?Q?=C5dahl?= <jadahl@redhat.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 01, 2022 at 10:21:26AM +0300, Pekka Paalanen wrote:
> On Tue, 31 May 2022 20:37:31 +0300
> Ville Syrjälä <ville.syrjala@linux.intel.com> wrote:
> 
> > On Wed, May 25, 2022 at 01:36:47PM +0300, Pekka Paalanen wrote:
> > > On Wed, 25 May 2022 09:23:51 +0000
> > > Simon Ser <contact@emersion.fr> wrote:
> > >   
> > > > On Wednesday, May 25th, 2022 at 10:35, Michel Dänzer <michel.daenzer@mailbox.org> wrote:
> > > >   
> > > > > > Mind that "max bpc" is always in auto. It's only an upper limit, with
> > > > > > the assumption that the driver can choose less.    
> > > > >
> > > > > It seems to me like the "max bpc" property is just kind of bad API,
> > > > > and trying to tweak it to cater to more use cases as we discover them
> > > > > will take us down a rabbit hole. It seems better to replace it with
> > > > > new properties which allow user space to determine the current
> > > > > effective bpc and to explicitly control it.    
> > > > 
> > > > +1, this sounds much more robust, and allows better control by user-space.
> > > > User-space needs to have fallback logic for other state as well anyways.
> > > > If the combinatorial explosion is too much, we should think about optimizing
> > > > the KMS implementation, or improve the uAPI.  
> > > 
> > > +1 as well, with some recommendations added and the running off to the
> > > sunset:
> > > 
> > > Use two separate KMS properties for reporting current vs.
> > > programming desired. The KMS property reporting the current value
> > > must be read-only (immutable). This preserves the difference between
> > > what userspace wanted and what it got, making it possible to read
> > > back both without confusing them. It also allows preserving driver behaviour  
> > 
> > I don't see much real point in a property to report the current bpc.
> > That can't be used to do anything atomically. So I suppose plymouth
> > would be the only user.
> 
> Hi Ville,
> 
> I think also professional color managed display servers would need it.
> 
> If they detect that the link bpc is no longer the same as it was when
> the monitor was profiled, the profile will need to be re-verified by
> measuring the monitor again.
> 
> See "Color calibration auditing system" notes in
> https://gitlab.freedesktop.org/wayland/weston/-/issues/467 description.
> 
> > So IMO if someone really need explicit control over this then we 
> > should just expose properties to set things explicitly. So we'd
> > need at least props for the actual bpc and some kind of color 
> > encoding property (RGB/YCbCr 4:4:4/4:2:2:/4:2:0, etc.). And someone
> > would really need to figure out how DSC would interact with those.
> 
> I believe there still must be "auto" setting for bpc, and a separate
> feedback property, so that userspace can use "auto" to see what it can
> get without doing thousands of TEST_ONLY commits plus a few "link
> status" failure handlings in order to find a working configuration (I'm
> assuming we have many more properties than just "max bpc" to figure
> out). After "auto" has told userspace what actually works without blind
> trial and error, then userspace can program than value explicitly to
> make sure it doesn't change accidentally in the future.

Yeah we need "auto", but IMO mainly just to keep the current userspace
working. Using that to probe what's possible doesn't sound particularly
workable since you can't use it with TEST_ONLY commits. Also change to
some other property could still cause the whole thing to fail after the
max bpc has been probed so not sure it really buys you anything.

> 
> What's DSC?

Compression.

> 
> Now that you mentioned some kind of color encoding property (I assume
> you referred mostly to the sub-sampling aspect), how does the connector
> property "Colorspace" factor in?

The "Colorspace" property just changes what we report to the display
via infoframes/MSA/SDP. It does not cause the display hardware to do
any colorspace conversion/etc.

To actually force the display hardware to do the desired conversion
we need some new properties. ATM the only automagic conversion that
can happen (at least with i915) is the RGB 4:4:4->YCbCr 4:2:0 fallback,
which is needed on some displays to get 4k+ modes to work at all.

> 
> The enum values (which are not documented in KMS docs, btw.) are tuples
> of color space + color model, e.g. on Intel:
> 
> "Colorspace": enum {Default, SMPTE_170M_YCC, BT709_YCC, XVYCC_601,
> XVYCC_709, SYCC_601, opYCC_601, opRGB, BT2020_CYCC, BT2020_RGB,
> BT2020_YCC, DCI-P3_RGB_D65, DCI-P3_RGB_Theater}

The accepted values are just what the CTA-861/DP specs
allow us to transmit in he infoframe/SDP/MSA.

> 
> Reading the KMS docs from
> https://www.kernel.org/doc/html/latest/gpu/drm-kms.html#standard-connector-properties
> they say:
> 
> > Basically the expectation from userspace is:
> > 
> >         Set up CRTC DEGAMMA/CTM/GAMMA to convert to some sink
> > colorspace
> > 
> >         Set this new property to let the sink know what it converted
> > the CRTC output to.
> > 
> >         This property is just to inform sink what colorspace source
> > is trying to drive. 
> 
> However, where does userspace program the actual conversion from RGB to
> NNN? Is it expected to be embedded in CTM?
> 
> Or does setting "Colorspace" imply some additional automatic
> conversion? If so, where does it happen and how is it chosen?
> 
> > For just the plymouth case I guess the easiest thing would be to
> > just clamp "max bpc" to the current value. The problem with that
> > is that we'd potentially break existing userspace. Eg. I don't think
> > the modesetting ddx or perhaps even most of the wayland compositors
> > set "max bpc" at all. So we'd need to roll out a bunch of userspace
> > updates first. And the "current bpc" prop idea would also have this
> > same problem since plymouth would just clamp "max bpc" based on the
> > current bpc before the real userspace starts.
> 
> True, but I believe once color management spreads through Wayland, so
> will KMS clients also learn to set it.

Sure. But my point is that if we want to change how the "max bpc"
works I think we need to roll out the userspace stuff first so that
we at least can tell the user "please update you userspace to release x"
when they hit the regression.

-- 
Ville Syrjälä
Intel
