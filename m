Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 11715268F0E
	for <lists+dri-devel@lfdr.de>; Mon, 14 Sep 2020 17:07:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 452A26E4C7;
	Mon, 14 Sep 2020 15:07:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 001E16E4C7
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Sep 2020 15:07:18 +0000 (UTC)
IronPort-SDR: uGoxQ9kHAQDnJCGt5D9jt3gCl6XKOlcNtwxmqEmw8zKSiCGvFqu8xbAeWTr33bu5KNfItG5iiM
 MZ0ccXOW+b0w==
X-IronPort-AV: E=McAfee;i="6000,8403,9744"; a="223274570"
X-IronPort-AV: E=Sophos;i="5.76,426,1592895600"; d="scan'208";a="223274570"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2020 08:07:12 -0700
IronPort-SDR: mxs+imdCvQpJQ0/bs7ZrSQ/wQbFhc7YWaaRk/7PQXVKLPFCs11j3GM5QPTnEpp1IJnKEKTJI/1
 ud40DFvZ2kPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,426,1592895600"; d="scan'208";a="306196595"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga006.jf.intel.com with SMTP; 14 Sep 2020 08:07:08 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 14 Sep 2020 18:07:08 +0300
Date: Mon, 14 Sep 2020 18:07:08 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: per-plane LUTs and CSCs?
Message-ID: <20200914150708.GQ6112@intel.com>
References: <20200909105727.f5n5c6zudx2qyz2f@fsr-ub1864-141>
 <n5uMyyDW2WrhtODRwgsqla2mU-pP-gLV4vHHoIZzjvmzG17epyoBjSh8HxIcnaPAwIlRQZ7Aj7cuUz_iby97UlRMw-WAOss7k0oPQD8YPaQ=@emersion.fr>
 <20200910081836.GG438822@phenom.ffwll.local>
 <4ggVpoPfSS2JmnPLixWtD-1pcm-aPl0DBELYyqKh6boZxra-xibFZpLbxrykyvxFpW6xs5-R89O2iqdAgnoRaoMAs-DNOFRLKYWR-cZas2I=@emersion.fr>
 <CADnq5_PU71BTTEXFPLToySyub=5deOOpqBZkYZWO=7+Ht81HUw@mail.gmail.com>
 <20200914133235.GK6112@intel.com>
 <CADnq5_NLP9jLj3ce9gxrbHnW=GUBrgwgm+HyCjMvdumgq3W2ww@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADnq5_NLP9jLj3ce9gxrbHnW=GUBrgwgm+HyCjMvdumgq3W2ww@mail.gmail.com>
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
Cc: Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 14, 2020 at 10:38:24AM -0400, Alex Deucher wrote:
> On Mon, Sep 14, 2020 at 9:32 AM Ville Syrj=E4l=E4
> <ville.syrjala@linux.intel.com> wrote:
> >
> > On Mon, Sep 14, 2020 at 02:13:09AM -0400, Alex Deucher wrote:
> > > On Thu, Sep 10, 2020 at 4:29 AM Simon Ser <contact@emersion.fr> wrote:
> > > >
> > > > On Thursday, September 10, 2020 10:18 AM, Daniel Vetter <daniel@ffw=
ll.ch> wrote:
> > > >
> > > > > On Thu, Sep 10, 2020 at 07:50:59AM +0000, Simon Ser wrote:
> > > > >
> > > > > > On Wednesday, September 9, 2020 12:57 PM, Laurentiu Palcu laure=
ntiu.palcu@oss.nxp.com wrote:
> > > > > >
> > > > > > > Hi all,
> > > > > > > I was wondering whether you could give me an advise on how to=
 proceed further
> > > > > > > with the following issue as I'm preparing to upstream the nex=
t set of patches
> > > > > > > for the iMX8MQ display controller(DCSS). The display controll=
er has 3 planes,
> > > > > > > each with 2 CSCs and one degamma LUT. The CSCs are in front a=
nd after the LUT
> > > > > > > respectively. Then the output from those 3 pipes is blended t=
ogether and then
> > > > > > > gamma correction is applied using a linear-to-nonlinear LUT a=
nd another CSC, if
> > > > > > > needed.
> > > > > > > Currently, downstream, we have all those CSCs and LUTs hard-c=
oded into a header
> > > > > > > file. Based on the colorspace, range, gamut selected for the =
output and/or
> > > > > > > plane input, we pick up the right CSCs and LUTs from that hea=
der file to
> > > > > > > configure our pipes... I guess this solution does the job, us=
erspace doesn't
> > > > > > > need to care much about how to generate those tables. But, it=
's also not very
> > > > > > > flexible in case there is an app smart enough to know and act=
ually generate
> > > > > > > their own custom tables. :/
> > > > > > > Looking through the dri-devel archives, I've seen that there =
was a tentative to
> > > > > > > implement a more or less generic per-plane LUT/CSC solution b=
ut it didn't make
> > > > > > > it in due to lack of userspace consumers...
> > > > > >
> > > > > > Apart from full color management mentioned by Pekka, are there =
other
> > > > > > use-cases for these per-plane props?
> > > > > > One thing I can think of is that some drivers annoyingly only a=
pply the
> > > > > > per-CRTC gamma LUT to the primary plane. I think it would make =
more
> > > > > > sense to not attach a gamma prop to the CRTC and instead only a=
ttach it
> > > > > > to the primary plane to make that clear. But I guess that would=
 also
> > > > > > break existing user-space?
> > > > >
> > > > > Uh, which drivers? This would be a driver bug (and there's been p=
lenty of
> > > > > those where the cursor has the wrong color temp and fun stuff lik=
e that).
> > > > > We need to fix these driver issues instead of lamenting in usersp=
ace that
> > > > > it's all kinda broken :-)
> > > >
> > > > Apparently this is bug with the old radeon driver [1]. It works fin=
e on
> > > > all i915 setups I've tried, and also works fine on amdgpu (with DC).
> > > >
> > > > I've opened a radeon bug.
> > > >
> > > > [1]: https://github.com/swaywm/wlroots/issues/968
> > >
> > > This is a hardware limitation.  I suspend all hardware of a certain
> > > age had this same limitation.  Old stuff didn't have multiple planes.
> >
> > That doesn't sound right to me. mach64 vt/gt and rage128 had an
> > overlay plane already. I even vaguely remeber staring at some
> > radeon overlay code at some point thinking "that stuff looks
> > identical to the rage128 stuff, wonder why it's not shared code?".
> >
> =

> Ah, yeah, sorry, I forgot about that.  We don't expose that via KMS.
> Actually r128 is almost identical to some of the early radeons.  I
> actually had a ddx branch years ago which added r128 support to
> xf86-video-ati:
> https://cgit.freedesktop.org/~agd5f/xf86-video-ati/log/?h=3Dr128-support
> That overlay plane went away in the r300 time frame IIRC as everyone
> moved to using the 3D engine for CSC and scaling.

Right. Windows didn't have use for overlay planes so a lot of hw
lost them around that time I guess. Intel hw didn't quite lose them,
but they did lose a bunch of features such as scaling and planar
YCbCr formats. And at least in our case most of the lost stuff has
been reintroduced in recent years after Android/Windows started to
use them again. Which is fine by me since I can often use ancient
hw to bring up some of the "new" features in the latest hw ;)

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
