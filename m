Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB8DB293F36
	for <lists+dri-devel@lfdr.de>; Tue, 20 Oct 2020 17:05:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08C5C6ECF2;
	Tue, 20 Oct 2020 15:05:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78A486ECF2
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Oct 2020 15:05:49 +0000 (UTC)
IronPort-SDR: nO+LBUbhdnh1sAq0hobfiHtuUtMNpTv1Lz0r3N9g2zSo8+opFPWIQYNPg9KCITf75JCeeaV1mw
 PurDH/Z0WZpw==
X-IronPort-AV: E=McAfee;i="6000,8403,9779"; a="167341148"
X-IronPort-AV: E=Sophos;i="5.77,397,1596524400"; d="scan'208";a="167341148"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2020 08:04:47 -0700
IronPort-SDR: E+/8Yz0Oe+4SC3X34hrVQ/He2wKvuwq7b/yAnc9OLtylGq2RD1XBOfC9575AeMZjTnLInebLZq
 Z4pGNZqkYVdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,397,1596524400"; d="scan'208";a="359200971"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga007.jf.intel.com with SMTP; 20 Oct 2020 08:04:44 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 20 Oct 2020 18:04:43 +0300
Date: Tue, 20 Oct 2020 18:04:43 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Vitaly Prosyak <vitaly.prosyak@amd.com>
Subject: Re: [PATCH] drm: document that user-space should avoid parsing EDIDs
Message-ID: <20201020150443.GZ6112@intel.com>
References: <izOAkOJk67APzk9XP_DhUGr5Nvo_KwmIXlGQhiL101xxttvMO3K1DUdEQryIFXe2EjG16XGuc_YPMlTimZjqePYR3dB0m4Xs4J8Isa3mBAI=@emersion.fr>
 <CAPj87rM3H+kNzMgw1B00iDzH94gZPoLfr17KrAAiCXuUB2VHKA@mail.gmail.com>
 <20201009131025.GS6112@intel.com> <20201009165651.31199071@eldfell>
 <20201009142018.GT6112@intel.com> <20201012101101.12c6bbb8@eldfell>
 <20201016135016.GO6112@intel.com> <20201019104948.5ae842c0@eldfell>
 <4f443474-6884-c480-6e72-60ed47ccc0de@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4f443474-6884-c480-6e72-60ed47ccc0de@amd.com>
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
Cc: Sebastian Wick <sebastian@sebastianwick.net>,
 Daniel Vetter <daniel.vetter@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 19, 2020 at 11:08:27PM -0400, Vitaly Prosyak wrote:
> =

> On 2020-10-19 3:49 a.m., Pekka Paalanen wrote:
> > On Fri, 16 Oct 2020 16:50:16 +0300
> > Ville Syrj=E4l=E4<ville.syrjala@linux.intel.com>  wrote:
> >
> >> On Mon, Oct 12, 2020 at 10:11:01AM +0300, Pekka Paalanen wrote:
> >>> On Fri, 9 Oct 2020 17:20:18 +0300
> >>> Ville Syrj=E4l=E4<ville.syrjala@linux.intel.com>  wrote:
<snip>
> >> There is a slight snag on some Intel platforms that the gamma LUT
> >> is sitting after the CSC unit, and currently we use the CSC for
> >> the range compression.
> =

> Thanks a lot for letting us to know about this!
> AMD display pipe has always at the end CSC matrix where we apply appropri=
ate range conversion if necessary.
> =

> >>
> >> On glk in particular I*think*  we currently just do the wrong
> >> thing do the range compression before gamma. The same probably
> >> applies to hsw+ when both gamma and degamma are used at the same
> >> time. But that is clearly buggy, and we should fix it to either:
> >> a) return an error, which isn't super awesome since then you
> >>     can't do gamma+limited range at the same time on glk, nor
> >>     gamma+degamma+limited range on hsw+.
> >> b) for the glk case we could use the hw degamma LUT for the
> >>     gamma, which isn't great becasue the hw gamma and degamma
> >>     LUTs are quite different beasts, and so the hw degamma LUT
> >>     might not be able to do exactly what we need.
> =

> Do you mean that hw de-gamma LUT build on ROM ( it is not programmable, j=
ust select the proper bit)?

No. The hw degamma LUT is a 1x33 linearly interpolated
non-decreasing curve. So can't do directcolor type stuff,
and each RGB channel must have the same gamma.

The hw gamma LUT on the other hand can operate in multiple
different modes, from which we currently choose the
3x1024 non-interpoated mode. Which can do all those
things the degamma LUT can't do.

> =

> >> On hsw+ we do
> >>     use this trick already to get the gamma+limited range right,
> >>     but on these platforms the hw gamma and degamma LUTs have
> >>     identical capabilities.
> >> c) do the range compression with the hw gamma LUT instead, which
> >>     of course means we have to combine the user gamma and range
> >>     compression into the same gamma LUT.
> =

> Nice w/a and in amdgpu we are using also curve concatenations into re gam=
ma LUT.
> =

> The number of concatenations could be as many as need it and we may take =
advantage of this in user mode. Does this sounds preliminarily  good?
> =

> Wouldn't the following sentence be interesting for you if the user mode g=
enerates 1D LUT points using X axis exponential distribution to avoid
> unnecessary interpolation in kernel?  It may be especially important if c=
urve concatenation is expected?

Yeah, I think we want a new uapi for gamma stuff that will allow
userspace to properly calculate things up front for different kinds
of hw implementations, without the kernel having to interpolate/decimate.
We've had some discussions/proposals on the list.

> =

> >>
> >> So I think c) is what it should be. Would just need to find the time
> >> to implement it, and figure out how to not totally mess up our
> >> driver's hw state checker. Hmm, except this won't help at all
> >> with YCbCr output since we need to apply gamma before the
> >> RGB->YCbCr conversion (which uses the same CSC again). Argh.
> >> So YCbCr output would still need option b).
> >>
> >> Thankfully icl+ fixed all this by adding a dedicated output CSC
> >> unit which sits after the gamma LUT in the pipeline. And pre-hsw
> >> is almost fine as well since the hw has a dedicated fixed function
> >> thing for the range compression. So the only snag on pre-hsw
> >> is the YCbCr+degamma+gamma case.
> =

> Where is the display engine scaler is located on Intel platforms?
> AMD old ASIC's have a display scaler after display color pipeline ,so the=
 whole color processing can be a bit mess up unless integer scaling is in u=
se.
> =

> The new ASIC's ( ~5 years already)=A0 have scaler before color pipeline.

We have a somewhat similar situation.

On older hw the scaler tap point is at the end of the pipe, so
between the gamma LUT and dithering.

On icl+ I think we have two tap points; one between degamma
LUT and the first pipe CSC, and a second one between the output
CSC and dithering. The spec calls these non-linear and linear tap
points. The scaler also gained another linear vs. non-linear
control knob which affects the precision at which it can operate
in some form. There's also some other interaction between this and
another knob ("HDR" mode) which controls the precision of blending
in the pipe. I haven't yet thought how we should configure all this
to the best effect. For the moment we leave these scaler settings
to their defaults, which means using the non-linear tap point and
non-linear precision setting. The blending precision we adjust
dynamically depending on which planes are enabled. Only a subset
of the planes (so called HDR planes) can be enabled when using the
high precision blending mode.

On icl+ plane scaling also has the two different tap points, but
this time I think it just depdends on the type of plane used;
HDR planes have a linear tap point just before blending, SDR
planes have a non-linear tap point right after the pixels enter
the plane's pipeline. Older hw again just had the non-linear
tap point.

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
