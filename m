Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BEF85F0DFC
	for <lists+dri-devel@lfdr.de>; Fri, 30 Sep 2022 16:50:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FA9410ED3B;
	Fri, 30 Sep 2022 14:50:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 117D810ED39;
 Fri, 30 Sep 2022 14:49:57 +0000 (UTC)
Date: Fri, 30 Sep 2022 14:49:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1664549394; x=1664808594;
 bh=3Y77kWUMn0dleCRf/aT7qCHAn3Cs1mcNa11/OMwxyJY=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID;
 b=OzeOigB3mw+i54cU8XcxVrzSc70C5DuXTcuYtd3K6St3XdsATyzqa0ORIIxYJtKPv
 pUmU2zNoKW0+pchVwL0okj9kHWxTRKJXXmY0C5ac/nJDfhuJVsq5Ry/XZTUi0+bdR/
 caVCS8FYoGY2ITalqaIWYG9onHOSUyxvAyWL4Whslasz4tPIyxPy1VM+tsf31M3VeQ
 AJphhKEs8MlbjRETsSeIX484q2rX3IS6EnVNolr2g3uu93PS4KH8sfNNffhRY+HvL4
 VNcPSv0t/EQa/hgIYTN1QTQW1dW0Zl2eJuj6hhO5BmTqcBL6wPMPqrjO9fNIrVMxl7
 PQiHESzS6oA+g==
To: =?utf-8?Q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [RFC v2] drm/kms: control display brightness through
 drm_connector properties
Message-ID: <MBuFZe-hNQouXedLGdfmLVmW5yMwatT2BmSWjl2XVAhC71_pt7_E4r8HVYFyjCY7ipza-zlg2j1QkIP8xkcTD3H_sLwzkoimADM5hmy-nN4=@emersion.fr>
In-Reply-To: <YzcAwVC8tm1imNOL@intel.com>
References: <b61d3eeb-6213-afac-2e70-7b9791c86d2e@redhat.com>
 <878rm3zuge.fsf@intel.com> <YzQojrDOGNhm4D8l@intel.com>
 <YzQseBFa5EvDUDSw@intel.com>
 <CA+hFU4xRV74r3Wbs-TTWmtAkEwdJaEb+1QXUZSh52LVRwfddeA@mail.gmail.com>
 <20220930103956.1c3df79e@eldfell>
 <CA+hFU4yR542C3Qo_8ggkXKF+OZs=Pt9awsQ7Q4bXGoiv+7-VyQ@mail.gmail.com>
 <YzcAwVC8tm1imNOL@intel.com>
Feedback-ID: 1358184:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
 Martin Roukala <martin.roukala@mupuf.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 wayland <wayland-devel@lists.freedesktop.org>,
 Hans de Goede <hdegoede@redhat.com>, Pekka Paalanen <ppaalanen@gmail.com>,
 Christoph Grenz <christophg+lkml@grenz-bonn.de>,
 Yusuf Khan <yusisamerican@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Friday, September 30th, 2022 at 16:44, Ville Syrj=C3=A4l=C3=A4 <ville.sy=
rjala@linux.intel.com> wrote:

> On Fri, Sep 30, 2022 at 04:20:29PM +0200, Sebastian Wick wrote:
>=20
> > On Fri, Sep 30, 2022 at 9:40 AM Pekka Paalanen ppaalanen@gmail.com wrot=
e:
> >=20
> > > On Thu, 29 Sep 2022 20:06:50 +0200
> > > Sebastian Wick sebastian.wick@redhat.com wrote:
> > >=20
> > > > If it is supposed to be a non-linear luminance curve, which one is =
it?
> > > > It would be much clearer if user space can control linear luminance
> > > > and use whatever definition of perceived brightness it wants. The
> > > > obvious downside of it is that it requires bits to encode changes t=
hat
> > > > users can't perceive. What about backlights which only have a few
> > > > predefined luminance levels? How would user space differentiate
> > > > between the continuous and discrete backlight? What about
> > > > self-emitting displays? They usually increase the dynamic range whe=
n
> > > > they increase in brightness because the black level doesn't rise. T=
hey
> > > > also probably employ some tonemapping to adjust for that. What abou=
t
> > > > the range of the backlight? What about the absolute luminance of th=
e
> > > > backlight? I want to know about that all in user space.
> > > >=20
> > > > I understand that most of the time the kernel doesn't have answers =
to
> > > > those questions right now but the API should account for all of tha=
t.
> > >=20
> > > Hi,
> > >=20
> > > if the API accounts for all that, and the kernel doesn't know, then h=
ow
> > > can the API not lie? If the API sometimes lies, how could we ever tru=
st
> > > it at all?
> >=20
> > Make it possible for the API to say "I don't know". I'd much rather
> > have an API tell me explicitly what it does and doesn't know instead
> > of having to guess what data I can actually rely on.
> >=20
> > For example if the kernel knows the luminance is linear on one display
> > and doesn't know anything about the other display and it exposes them
> > both in the same way I can not possibly write any code which relies on
> > exact control over the luminance for either display.
> >=20
> > > Personally I have the feeling that if we can even get to the level of
> > > "each step in the value is a more or less perceivable change", that
> > > would be good enough. Think of UI, e.g. hotkeys to change brightness.
> > > You'd expect almost every press to change it a bit.
> >=20
> > The nice thing is that you can have that even if you have no further
> > information about the brightness control and it might be good enough
> > for some use cases but it isn't for others.
> >=20
> > > If an end user wants defined and controlled luminance, I'd suggest th=
ey
> > > need to profile (physically measure) the response of the display at
> > > hand. This is no different from color profiling displays, but you nee=
d
> > > a measurement device that produces absolute measurements if absolute
> > > control is what they want.
> >=20
> > If that's the kind of user experience you're after, good for you. I
> > certainly want things to work out of the box which makes this just a
> > big no-go.
>=20
>=20
> I think if we have the information to make the default behaviour
> better then we should do that. Ie. if the firmaware gives us a
> table to remap the values for a more linear response we should
> make use of that by default.
>=20
> We can of course provide a way for the user to plug in their own
> actually measured data later. But IMO that doesn't even have to
> happen in the initial implementation. Just need to avoid painting
> ourselves totally in the corner in a way that would prevent later
> additions like that.

Yes. Please don't try to solve all of the problems at once. There have
been many tries to add brightness to KMS, and having *something* would
be a lot better than having nothing. If we try to have the perfect
complete API from the start then we'll never get anything done.
