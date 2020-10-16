Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF932906A0
	for <lists+dri-devel@lfdr.de>; Fri, 16 Oct 2020 15:50:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA26D6EE08;
	Fri, 16 Oct 2020 13:50:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2D796EE08
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Oct 2020 13:50:20 +0000 (UTC)
IronPort-SDR: H9+dhwK29JyZGvhtorB+QftZ2UOjwRtaWMLNzdjiiSpd/N8BHvmmI1kWiPPyXl0Ha4qzjxXosI
 9hohFbWzhrfQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9775"; a="163136972"
X-IronPort-AV: E=Sophos;i="5.77,383,1596524400"; d="scan'208";a="163136972"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2020 06:50:20 -0700
IronPort-SDR: GWmUj63rUWzt2LO9Vqx60VE5xQHeBc60prECus/VlY2SVQkMFBshSDuR3jwts7Vz5tbF1wjtCl
 4dm2EcmbrWKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,383,1596524400"; d="scan'208";a="347203772"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga008.jf.intel.com with SMTP; 16 Oct 2020 06:50:17 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 16 Oct 2020 16:50:16 +0300
Date: Fri, 16 Oct 2020 16:50:16 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: [PATCH] drm: document that user-space should avoid parsing EDIDs
Message-ID: <20201016135016.GO6112@intel.com>
References: <izOAkOJk67APzk9XP_DhUGr5Nvo_KwmIXlGQhiL101xxttvMO3K1DUdEQryIFXe2EjG16XGuc_YPMlTimZjqePYR3dB0m4Xs4J8Isa3mBAI=@emersion.fr>
 <CAPj87rM3H+kNzMgw1B00iDzH94gZPoLfr17KrAAiCXuUB2VHKA@mail.gmail.com>
 <20201009131025.GS6112@intel.com> <20201009165651.31199071@eldfell>
 <20201009142018.GT6112@intel.com> <20201012101101.12c6bbb8@eldfell>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201012101101.12c6bbb8@eldfell>
X-Patchwork-Hint: comment
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 12, 2020 at 10:11:01AM +0300, Pekka Paalanen wrote:
> On Fri, 9 Oct 2020 17:20:18 +0300
> Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com> wrote:
> =

> > On Fri, Oct 09, 2020 at 04:56:51PM +0300, Pekka Paalanen wrote:
> > > On Fri, 9 Oct 2020 16:10:25 +0300
> > > Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com> wrote:
> > >   =

> > > > On Fri, Oct 09, 2020 at 01:07:20PM +0100, Daniel Stone wrote:  =

> > > > > Hi,
> > > > > =

> > > > > On Fri, 9 Oct 2020 at 10:24, Simon Ser <contact@emersion.fr> wrot=
e:    =

> > > > > > User-space should avoid parsing EDIDs for metadata already expo=
sed via
> > > > > > other KMS interfaces and properties. For instance, user-space s=
hould not
> > > > > > try to extract a list of modes from the EDID: the kernel might =
mutate
> > > > > > the mode list (because of link capabilities or quirks for insta=
nce).
> > > > > >
> > > > > > Other metadata not exposed by KMS can be parsed by user-space. =
This
> > > > > > includes for instance monitor identification (make/model/serial=
) and
> > > > > > supported color-spaces.    =

> > > > > =

> > > > > So I take it the only way to get modes is through the connector's=
 list
> > > > > of modes. That sounds reasonable enough to me, but I think to pro=
perly
> > > > > handle colour (e.g. CEA modes have different behaviour for
> > > > > limited/full range depending on which VIC they correspond to IIRC=
)    =

> > > > =

> > > > If the mode has a VIC and that VIC is not 1, then it's limited rang=
e,
> > > > otherwise full range. There are fortunately no cases where you would
> > > > have the same exact timings corresponding to different quantization
> > > > range depending on the VIC.
> > > > =

> > > > And the only reason the same timings could correspond to multiple V=
ICs
> > > > is aspect ratio. Which is already exposed via the mode flags, assum=
ing
> > > > the appropriate client cap is enabled.
> > > > =

> > > > So I think the only reason to expose the VIC would be if userspace =
is
> > > > non-lazy and wants to manage its colors presicely, but is otherwise=
 lazy
> > > > and doesn't want to figure out what the VIC of the mode is on its o=
wn.  =

> > > =

> > > What would "figure out what the VIC of the mode is" require in usersp=
ace?
> > > =

> > > A database of all VIC modes and then compare if the detailed timings =
match?
> > > =

> > > Is that also how the kernel recognises that userspace wants to set a
> > > certain VIC mode instead of some arbitrary mode?  =

> > =

> > Yes and yes.
> > =

> > Note that atm we also don't have a way for userspace to say that it
> > wants to signal limited range to the sink but wants the kernel
> > to not do the full->limited range conversion. Ie. no way for userspace
> > to pass in pixels that are already in limited range. There was a patch
> > for that posted quite long ago, but it didn't go in.
> =

> Thanks for the heads-up.
> =

> If userspace uses all available KMS color management properties
> (CTM, LUTs, etc.) *and* the video mode implies limited range on the
> cable, at what point in the pixel pipeline does that conversion from
> full to limited range occur?

It should be the last step.

<stop reading now if you don't care about Intel hw details>

There is a slight snag on some Intel platforms that the gamma LUT
is sitting after the CSC unit, and currently we use the CSC for
the range compression.

On glk in particular I *think* we currently just do the wrong
thing do the range compression before gamma. The same probably
applies to hsw+ when both gamma and degamma are used at the same
time. But that is clearly buggy, and we should fix it to either:
a) return an error, which isn't super awesome since then you
   can't do gamma+limited range at the same time on glk, nor
   gamma+degamma+limited range on hsw+.
b) for the glk case we could use the hw degamma LUT for the
   gamma, which isn't great becasue the hw gamma and degamma
   LUTs are quite different beasts, and so the hw degamma LUT
   might not be able to do exactly what we need. On hsw+ we do
   use this trick already to get the gamma+limited range right,
   but on these platforms the hw gamma and degamma LUTs have
   identical capabilities.
c) do the range compression with the hw gamma LUT instead, which
   of course means we have to combine the user gamma and range
   compression into the same gamma LUT.

So I think c) is what it should be. Would just need to find the time
to implement it, and figure out how to not totally mess up our
driver's hw state checker. Hmm, except this won't help at all
with YCbCr output since we need to apply gamma before the
RGB->YCbCr conversion (which uses the same CSC again). Argh.
So YCbCr output would still need option b).

Thankfully icl+ fixed all this by adding a dedicated output CSC
unit which sits after the gamma LUT in the pipeline. And pre-hsw
is almost fine as well since the hw has a dedicated fixed function
thing for the range compression. So the only snag on pre-hsw
is the YCbCr+degamma+gamma case.

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
