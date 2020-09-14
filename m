Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D3DD268C3F
	for <lists+dri-devel@lfdr.de>; Mon, 14 Sep 2020 15:32:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2800589C8D;
	Mon, 14 Sep 2020 13:32:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A989C89C8D
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Sep 2020 13:32:51 +0000 (UTC)
IronPort-SDR: vQs7J5hOxKzu/MFck9HO5X3tMwTeKR2dAdTOHqszJ33cg9Nk1V7mJw77ORkBtbVoMSYv9ZKh4o
 i1Sza/EbZBew==
X-IronPort-AV: E=McAfee;i="6000,8403,9743"; a="156516841"
X-IronPort-AV: E=Sophos;i="5.76,426,1592895600"; d="scan'208";a="156516841"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2020 06:32:39 -0700
IronPort-SDR: Tc3+r37gBHgzU8BL3uKyzBUktd9GeHjkIZ7kELdtNhn970/0YcBgDKCUAl3kGP8bTc2LEfXXNe
 qS895iExJWJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,426,1592895600"; d="scan'208";a="306166687"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga006.jf.intel.com with SMTP; 14 Sep 2020 06:32:35 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 14 Sep 2020 16:32:35 +0300
Date: Mon, 14 Sep 2020 16:32:35 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: per-plane LUTs and CSCs?
Message-ID: <20200914133235.GK6112@intel.com>
References: <20200909105727.f5n5c6zudx2qyz2f@fsr-ub1864-141>
 <n5uMyyDW2WrhtODRwgsqla2mU-pP-gLV4vHHoIZzjvmzG17epyoBjSh8HxIcnaPAwIlRQZ7Aj7cuUz_iby97UlRMw-WAOss7k0oPQD8YPaQ=@emersion.fr>
 <20200910081836.GG438822@phenom.ffwll.local>
 <4ggVpoPfSS2JmnPLixWtD-1pcm-aPl0DBELYyqKh6boZxra-xibFZpLbxrykyvxFpW6xs5-R89O2iqdAgnoRaoMAs-DNOFRLKYWR-cZas2I=@emersion.fr>
 <CADnq5_PU71BTTEXFPLToySyub=5deOOpqBZkYZWO=7+Ht81HUw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADnq5_PU71BTTEXFPLToySyub=5deOOpqBZkYZWO=7+Ht81HUw@mail.gmail.com>
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

On Mon, Sep 14, 2020 at 02:13:09AM -0400, Alex Deucher wrote:
> On Thu, Sep 10, 2020 at 4:29 AM Simon Ser <contact@emersion.fr> wrote:
> >
> > On Thursday, September 10, 2020 10:18 AM, Daniel Vetter <daniel@ffwll.c=
h> wrote:
> >
> > > On Thu, Sep 10, 2020 at 07:50:59AM +0000, Simon Ser wrote:
> > >
> > > > On Wednesday, September 9, 2020 12:57 PM, Laurentiu Palcu laurentiu=
.palcu@oss.nxp.com wrote:
> > > >
> > > > > Hi all,
> > > > > I was wondering whether you could give me an advise on how to pro=
ceed further
> > > > > with the following issue as I'm preparing to upstream the next se=
t of patches
> > > > > for the iMX8MQ display controller(DCSS). The display controller h=
as 3 planes,
> > > > > each with 2 CSCs and one degamma LUT. The CSCs are in front and a=
fter the LUT
> > > > > respectively. Then the output from those 3 pipes is blended toget=
her and then
> > > > > gamma correction is applied using a linear-to-nonlinear LUT and a=
nother CSC, if
> > > > > needed.
> > > > > Currently, downstream, we have all those CSCs and LUTs hard-coded=
 into a header
> > > > > file. Based on the colorspace, range, gamut selected for the outp=
ut and/or
> > > > > plane input, we pick up the right CSCs and LUTs from that header =
file to
> > > > > configure our pipes... I guess this solution does the job, usersp=
ace doesn't
> > > > > need to care much about how to generate those tables. But, it's a=
lso not very
> > > > > flexible in case there is an app smart enough to know and actuall=
y generate
> > > > > their own custom tables. :/
> > > > > Looking through the dri-devel archives, I've seen that there was =
a tentative to
> > > > > implement a more or less generic per-plane LUT/CSC solution but i=
t didn't make
> > > > > it in due to lack of userspace consumers...
> > > >
> > > > Apart from full color management mentioned by Pekka, are there other
> > > > use-cases for these per-plane props?
> > > > One thing I can think of is that some drivers annoyingly only apply=
 the
> > > > per-CRTC gamma LUT to the primary plane. I think it would make more
> > > > sense to not attach a gamma prop to the CRTC and instead only attac=
h it
> > > > to the primary plane to make that clear. But I guess that would also
> > > > break existing user-space?
> > >
> > > Uh, which drivers? This would be a driver bug (and there's been plent=
y of
> > > those where the cursor has the wrong color temp and fun stuff like th=
at).
> > > We need to fix these driver issues instead of lamenting in userspace =
that
> > > it's all kinda broken :-)
> >
> > Apparently this is bug with the old radeon driver [1]. It works fine on
> > all i915 setups I've tried, and also works fine on amdgpu (with DC).
> >
> > I've opened a radeon bug.
> >
> > [1]: https://github.com/swaywm/wlroots/issues/968
> =

> This is a hardware limitation.  I suspend all hardware of a certain
> age had this same limitation.  Old stuff didn't have multiple planes.

That doesn't sound right to me. mach64 vt/gt and rage128 had an
overlay plane already. I even vaguely remeber staring at some
radeon overlay code at some point thinking "that stuff looks
identical to the rage128 stuff, wonder why it's not shared code?".

> It had a primary plane and a cursor and gamma didn't apply to the
> cursor.

That last part I can believe.

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
