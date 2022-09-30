Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 281F55F0EC7
	for <lists+dri-devel@lfdr.de>; Fri, 30 Sep 2022 17:27:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1506910ED55;
	Fri, 30 Sep 2022 15:27:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B682A10ED55;
 Fri, 30 Sep 2022 15:27:07 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id l12so5155355ljg.9;
 Fri, 30 Sep 2022 08:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date;
 bh=sh4WpFH4VRgbZqu2TCFsx29IE7XfQXI/T25VeVqE+RQ=;
 b=D2NUYdhi+n16SepJfBd1vPj8ATXcYNPZh+bxCbA85o7PJuqrHKDbRmkLaJoG7IdCkx
 T3ZrQerNpLnyP1N/ya2lpKpGk12Ma09tVogCQTsJfqkM+g5FI4gAcfDWjTRn+6t3qhYK
 7DnPWuSR9PGydI/gIea+bt9Vi0hgRWgDuuJ2dQJPa+FuiQR1TDe5S29o7i6Lsdp6waN9
 V8aYEIZL5qpxl22zN7U16hU9Duj/UjSvKhbCYJpWklkUCZKcciO1POxrUKn68lXSA4QF
 X0PomCG0XKW/XWCjRRptGtkGn+UE1cIiovdrp7YulVJYJxkc35P/3VbtS+5um4Y4CebC
 4u0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date;
 bh=sh4WpFH4VRgbZqu2TCFsx29IE7XfQXI/T25VeVqE+RQ=;
 b=kmIL8iE+xIlQyFD/AOFI0nuT6qJ5gia9riGv9tBJ04aWcEnyGd8eTr/UxDOKvsNZsP
 5Z1GslWF1jVkouIImvp/SW6jhw+FGRLo6ly4sBxg/7u2TLAYNpjq9zFsw07CFR79kvul
 fPYH2B+VOaqYF3kz8huBEs8g0/N0DrP4iJkXvrY/LO8gKpaVvEqVh0oDVc0Vi2Eimd1A
 9nygj0LNy6Rd6ZphJfhZhqtFnGutQtM5RIwly2i8gbHJ2/HPtTHYJUHc3N8YloHTy9j7
 escBbT1WBe5ndh65En6kbP9rHSSNOMiVNUmvz/mCY9tdznp7Ri1JtTS/EVJK6C0ESCcn
 xRDA==
X-Gm-Message-State: ACrzQf0Nt3cbH20oO48QI7+7yVL6N6SlPMcjz6zESJ3DDG2OrsDi5DOb
 gX4Kblw5k6MYPEjZG2K3aYE=
X-Google-Smtp-Source: AMsMyM6qB0AykGQyaIOLWj08o3iWE+EZSYUEQusKNw3bNmxRIom0arP83L4JD4jEgBH05cHBuNd90g==
X-Received: by 2002:a05:651c:104e:b0:26b:fceb:a526 with SMTP id
 x14-20020a05651c104e00b0026bfceba526mr2873604ljm.109.1664551625659; 
 Fri, 30 Sep 2022 08:27:05 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 t8-20020a2e8e68000000b0026bddcf75d1sm177536ljk.44.2022.09.30.08.27.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Sep 2022 08:27:05 -0700 (PDT)
Date: Fri, 30 Sep 2022 18:26:52 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Ville =?UTF-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [RFC v2] drm/kms: control display brightness through
 drm_connector properties
Message-ID: <20220930182652.4ea10013@eldfell>
In-Reply-To: <YzcAwVC8tm1imNOL@intel.com>
References: <b61d3eeb-6213-afac-2e70-7b9791c86d2e@redhat.com>
 <878rm3zuge.fsf@intel.com> <YzQojrDOGNhm4D8l@intel.com>
 <YzQseBFa5EvDUDSw@intel.com>
 <CA+hFU4xRV74r3Wbs-TTWmtAkEwdJaEb+1QXUZSh52LVRwfddeA@mail.gmail.com>
 <20220930103956.1c3df79e@eldfell>
 <CA+hFU4yR542C3Qo_8ggkXKF+OZs=Pt9awsQ7Q4bXGoiv+7-VyQ@mail.gmail.com>
 <YzcAwVC8tm1imNOL@intel.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/pgb3QEFiEKsQWKs9bkTqgT7";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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

--Sig_/pgb3QEFiEKsQWKs9bkTqgT7
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 30 Sep 2022 17:44:17 +0300
Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com> wrote:

> On Fri, Sep 30, 2022 at 04:20:29PM +0200, Sebastian Wick wrote:
> > On Fri, Sep 30, 2022 at 9:40 AM Pekka Paalanen <ppaalanen@gmail.com> wr=
ote: =20
> > >
> > > On Thu, 29 Sep 2022 20:06:50 +0200
> > > Sebastian Wick <sebastian.wick@redhat.com> wrote:
> > > =20
> > > > If it is supposed to be a non-linear luminance curve, which one is =
it?
> > > > It would be much clearer if user space can control linear luminance
> > > > and use whatever definition of perceived brightness it wants. The
> > > > obvious downside of it is that it requires bits to encode changes t=
hat
> > > > users can't perceive. What about backlights which only have a few
> > > > predefined luminance levels? How would user space differentiate
> > > > between the continuous and discrete backlight? What about
> > > > self-emitting displays? They usually increase the dynamic range when
> > > > they increase in brightness because the black level doesn't rise. T=
hey
> > > > also probably employ some tonemapping to adjust for that. What about
> > > > the range of the backlight? What about the absolute luminance of the
> > > > backlight? I want to know about that all in user space.
> > > >
> > > > I understand that most of the time the kernel doesn't have answers =
to
> > > > those questions right now but the API should account for all of tha=
t. =20
> > >
> > > Hi,
> > >
> > > if the API accounts for all that, and the kernel doesn't know, then h=
ow
> > > can the API not lie? If the API sometimes lies, how could we ever tru=
st
> > > it at all? =20
> >=20
> > Make it possible for the API to say "I don't know". I'd much rather
> > have an API tell me explicitly what it does and doesn't know instead
> > of having to guess what data I can actually rely on.
> >=20
> > For example if the kernel knows the luminance is linear on one display
> > and doesn't know anything about the other display and it exposes them
> > both in the same way I can not possibly write any code which relies on
> > exact control over the luminance for either display.
> >  =20
> > >
> > > Personally I have the feeling that if we can even get to the level of
> > > "each step in the value is a more or less perceivable change", that
> > > would be good enough. Think of UI, e.g. hotkeys to change brightness.
> > > You'd expect almost every press to change it a bit. =20
> >=20
> > The nice thing is that you can have that even if you have no further
> > information about the brightness control and it might be good enough
> > for some use cases but it isn't for others.
> >  =20
> > > If an end user wants defined and controlled luminance, I'd suggest th=
ey
> > > need to profile (physically measure) the response of the display at
> > > hand. This is no different from color profiling displays, but you need
> > > a measurement device that produces absolute measurements if absolute
> > > control is what they want. =20
> >=20
> > If that's the kind of user experience you're after, good for you. I
> > certainly want things to work out of the box which makes this just a
> > big no-go. =20
>=20
> I think if we have the information to make the default behaviour
> better then we should do that. Ie. if the firmaware gives us a
> table to remap the values for a more linear response we should
> make use of that by default.

But that's only like 20% of what Sebastian is asking for.

What's "linear"? Radiometric or perceptual?

Radiometric linear control would make a terrible UX, so if the control
is radiometric, userspace needs to remap it. That might be a good
thing, but it's also complicated, because the relationship between
brightness and luminance is somewhere between a power curve and
exponential curve. You need to make sure that the userspace remapping
works for different backlights with different luminance ranges. That's
not obvious to me.

> We can of course provide a way for the user to plug in their own
> actually measured data later. But IMO that doesn't even have to
> happen in the initial implementation. Just need to avoid painting
> ourselves totally in the corner in a way that would prevent later
> additions like that.

For userspace delivering its own curve, you need to define the units.
Absolute or relative? Radiometric or perceptual? Otherwise the
resulting control is not portable between window systems.

> I just hate the current limbo where we're somehow too afraid to
> change the current behaviour to do the remapping by default.
> I see no upsides in the current behaviour of just blindly
> exposing the raw hardware register values more or less. They
> mean absolutely nothing to any user.

I never argued like that.

I'm saying that what looks realistic to me is somewhere *between*
status quo and what Sebastian is asking for. Whatever you mean by "linear
remapping" is probably a realistic goal, because you know you have some
hardware/firmware delivering that information already.

OTOH, designing UAPI for information that exists only in our dreams
is... well.


Thanks,
pq

--Sig_/pgb3QEFiEKsQWKs9bkTqgT7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmM3CrwACgkQI1/ltBGq
qqe00Q//Z2bNmrd/e9GxRcVnlSAvi5qV8ovhJRpVxXHVdiLOymCeurzoLoKE0jDy
nYIlyIxjBoxnFV+6gE1/tGAcbaSemXbXDINILt0w4/e2Ez0HByWzTHV9hegI8kx8
0TUo/++i6cUxF8NLsw/BcZ7v53YcNmuTYXTfHZUv2MZehv24RPFk1Li47VuG52IT
19AlAQrRziKu0gSBSsg+UESLIHUCiv9yzCRei+Mf8YUGQLQCyDnMSDzqodNwpyAv
nookIytfTXQECOh51Gwk11Y8NSL0Qr/L0xAWIFQ1+N6L0kdIY9KLJ0dv9oW71swe
vblB0Y0W4qBJoK5k4njbxznxHcCKl/7blDC78pvLG6cyT6TRdqtN+TwqdS2coOjt
b5z6zh6n1JibPZeYwaTuQVlkvoPBw0WhyYSy6HzMUD8AjBprId69JCq2GN/VlO+m
73moPBNJiS9onWZRvIpYLxkTTw1DyUhI/G6e755uB/VRmiiXuvobptNrLmZvoN+1
TuPaQKlBcP7wTJizKyJBw2yMvgke5p4L67m4PHvVRPydmpnptL49/j090C/z8ous
9+3zm0706Ev/Ne+M83MzGqexbak1ZfOudk9ezAeLflI7XD59LiUlp6StPaneE9P9
WGxJexgra3tmdssFQKEce7cBo/vbqRnkJAi1eLaAtxMzP5UprNM=
=Gx2D
-----END PGP SIGNATURE-----

--Sig_/pgb3QEFiEKsQWKs9bkTqgT7--
