Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 513825F2EB1
	for <lists+dri-devel@lfdr.de>; Mon,  3 Oct 2022 12:17:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEA3D10E2BB;
	Mon,  3 Oct 2022 10:16:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C074E10E2A1;
 Mon,  3 Oct 2022 10:16:44 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id s17so902221ljs.12;
 Mon, 03 Oct 2022 03:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date;
 bh=6+f6jv31vcyVB6BZVbg1d7M5dCNyqb0zpIdxzfOg9Tk=;
 b=b/y3b40mCBa5rkNDFTTMDr6AtsnbdA8GEPO7PJFGQ+UC9zVzsk7zXCtWgPcpdWoFFZ
 CYdB8MIzFvoG+xdIpq7foRDtjhYHuV97Gsv3ouZEQu0XV9M9J3NijFdIWlVd0VHGwLqX
 BPHo84ovh/xNieGaOqlkZvjBN8AQkuzcH0Tyyznq5RfeFOEajBpzplnXEnIsFbEfRygz
 SJNkCk8iNWhDUg79V3JU3dfe1qMskNrMKePh1Q23bM3wRc+8pn8pgYy8y7JpXsLdQFlN
 DtVjbFEgiqyUxcXuX7pLe2alpT9GgYejBPw3k82jBSm8j2IyV5AtWTRJl2O+PEfODP4n
 d/7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date;
 bh=6+f6jv31vcyVB6BZVbg1d7M5dCNyqb0zpIdxzfOg9Tk=;
 b=G+6ICUXxonWpB6WBkVTU/gul51IZItLq4OFEAWDrrs6UkbpUCLmz1T0Pp38FJMz7xr
 D+38ZNP8ysWHPJzrW550pu39c19ils0Bp9xRat0Xj4ts7SMTEdgZaTCIZO+hk8nxbEEi
 MNMS5fLHCf2++mWwQnVTwI+2l0H97HGCTHCGn0uxf582Hk9HBYcZZwbSt0oPbOQtXsSh
 2jPjNYEfIy+riVqOdoJrAN4vQGYnFja62n0dSEPkgbcc8s9BZSK2llw9Ew0hnUvyG0V2
 9kcDsCKb21UnCK6PaBR8H3FjClvxGmDeBafzb5nfvdFXwwCogIN1g3o4B+tnVHfz9yge
 eEOg==
X-Gm-Message-State: ACrzQf1c+oP72CDLIYMQjniG++L+oTG+obZPXmAeRFwO41DHdh0WGDQA
 U4Ej3TNOfZzDwfI3S0Z7gLk=
X-Google-Smtp-Source: AMsMyM5YjH4sIDKUmHRH+6p13U76xYcllaydBumdeWcwK9cgJLHR74s48cDJU7+/hvdwH+j0rO8Wbg==
X-Received: by 2002:a05:651c:2117:b0:26d:e257:e454 with SMTP id
 a23-20020a05651c211700b0026de257e454mr711698ljq.62.1664792202493; 
 Mon, 03 Oct 2022 03:16:42 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 a18-20020a194f52000000b0048a757d1303sm1400616lfk.217.2022.10.03.03.16.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Oct 2022 03:16:42 -0700 (PDT)
Date: Mon, 3 Oct 2022 13:16:30 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Ville =?UTF-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [RFC v2] drm/kms: control display brightness through
 drm_connector properties
Message-ID: <20221003131630.48f9580c@eldfell>
In-Reply-To: <YzqrXcdXYaJNvR2a@intel.com>
References: <878rm3zuge.fsf@intel.com> <YzQojrDOGNhm4D8l@intel.com>
 <YzQseBFa5EvDUDSw@intel.com>
 <CA+hFU4xRV74r3Wbs-TTWmtAkEwdJaEb+1QXUZSh52LVRwfddeA@mail.gmail.com>
 <20220930103956.1c3df79e@eldfell>
 <CA+hFU4yR542C3Qo_8ggkXKF+OZs=Pt9awsQ7Q4bXGoiv+7-VyQ@mail.gmail.com>
 <YzcAwVC8tm1imNOL@intel.com> <20220930182652.4ea10013@eldfell>
 <CA+hFU4zat+-0eW_6BaY0pbHzKxBjPtnyV5M=X=9Y0Rn8JJe8Wg@mail.gmail.com>
 <20221003113750.64d0417a@eldfell> <YzqrXcdXYaJNvR2a@intel.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ChTfleO_tTuDUfYjEeF50tb";
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

--Sig_/ChTfleO_tTuDUfYjEeF50tb
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 3 Oct 2022 12:29:01 +0300
Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com> wrote:

> On Mon, Oct 03, 2022 at 11:37:50AM +0300, Pekka Paalanen wrote:
> > On Fri, 30 Sep 2022 18:17:39 +0200
> > Sebastian Wick <sebastian.wick@redhat.com> wrote:
> >  =20
> > > On Fri, Sep 30, 2022 at 5:27 PM Pekka Paalanen <ppaalanen@gmail.com> =
wrote: =20
> > > >
> > > > On Fri, 30 Sep 2022 17:44:17 +0300
> > > > Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com> wrote:
> > > >   =20
> > > > > On Fri, Sep 30, 2022 at 04:20:29PM +0200, Sebastian Wick wrote:  =
 =20
> > > > > > On Fri, Sep 30, 2022 at 9:40 AM Pekka Paalanen <ppaalanen@gmail=
.com> wrote:   =20
> > > > > > >
> > > > > > > On Thu, 29 Sep 2022 20:06:50 +0200
> > > > > > > Sebastian Wick <sebastian.wick@redhat.com> wrote:
> > > > > > >   =20
> > > > > > > > If it is supposed to be a non-linear luminance curve, which=
 one is it?
> > > > > > > > It would be much clearer if user space can control linear l=
uminance
> > > > > > > > and use whatever definition of perceived brightness it want=
s. The
> > > > > > > > obvious downside of it is that it requires bits to encode c=
hanges that
> > > > > > > > users can't perceive. What about backlights which only have=
 a few
> > > > > > > > predefined luminance levels? How would user space different=
iate
> > > > > > > > between the continuous and discrete backlight? What about
> > > > > > > > self-emitting displays? They usually increase the dynamic r=
ange when
> > > > > > > > they increase in brightness because the black level doesn't=
 rise. They
> > > > > > > > also probably employ some tonemapping to adjust for that. W=
hat about
> > > > > > > > the range of the backlight? What about the absolute luminan=
ce of the
> > > > > > > > backlight? I want to know about that all in user space.
> > > > > > > >
> > > > > > > > I understand that most of the time the kernel doesn't have =
answers to
> > > > > > > > those questions right now but the API should account for al=
l of that.   =20

...

> > I suppose the firmware may expose some tables that may allow mapping
> > raw hardware values into something more pleasant to use. Like something
> > where each step is more or less a visible change. That does not have to
> > imply anything about linearity in any space, they may just be "good
> > values" for e.g. keyboard-based changing of backlight levels with no
> > mathematical or physical basis.
> >=20
> > Ville, what kind of tables do you know about? What do they actually
> > tell? =20
>=20
> We just get a set of points (up to 20 originally, and I think up to
> 32 in later spec revisions) that map input brightness (in %) to
> output duty cycle (0-0xff in old spec, 0-0xffff in new spec).
> And I *think* we're supposed to just linearly inteprolate between
> the entries, though the spec doesn't really state that in super
> clear terms.
>=20
> There is some mention in the spec about this being more or less
> designed for Windows Vista, so a look through eg.
> https://learn.microsoft.com/en-us/windows-hardware/drivers/display/suppor=
ting-brightness-controls-on-integrated-display-panels
> might be a good idea here.

That's a nice link. Quote:

"Brightness levels are represented as single-byte values in the range
from zero to 100 where zero is off and 100 is the maximum brightness
that a laptop computer supports. Every laptop computer must report a
maximum brightness level of 100; however, a laptop computer is not
required to support a level of zero. The only requirement for values
from zero to 100 is that larger values must represent higher brightness
levels. The increment between levels is not required to be uniform, and
a laptop computer can support any number of distinct values up to the
maximum of 101 levels. You must decide how to map hardware levels to
the range of brightness level values. However, a call to the display
miniport driver's DxgkDdiGetPossibleBrightness function should not
report more brightness level values than the hardware supports."

Sounds like "good values" to me, and that each value must be
distinguishable from any another (at least electrically).


Thanks,
pq

--Sig_/ChTfleO_tTuDUfYjEeF50tb
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmM6tn4ACgkQI1/ltBGq
qqeR8A/9EZPBC3PwCZ0QNlVdq9HAgeHPT3erS4LD4qUotFYCZo7GI4UQjLLSM3GC
AowC9jhiEpwMtDepDFmklWUrJlF4ygNj4Gcq5JCSt9+ptCoFvP+a+QkMYtT3HfcQ
DpFFi9GbAClHZNXwgyDb5AN+64kblUlvI3iAW6P36WRsxnPOvOs5Y+PHkrEsW0L2
eo7YvaRE3z8oy4pJAhapuJOn66E1ey18D8pvXuszNyPMHvP7vDLXCIWkQ3/uYBdN
5wxokWXwCiW9UyRT7kESUAHrvSAXzsO/PRk2OH1NT4++UdsvC+bS2yHhP21iblZF
aKVkQUt0a3B5ELiufFPTD41/4uE0+19bmef8hrq/bXYnbqcXDE9Hx0w+EQkMLy79
2RA7HKzkAonF2fLuRXMXCpKWApkjG6BWxGdHz4eKNqQOGYj0jy9JW41Cp60h4b4G
aohmeEglxVMQPUMulhzDBDokriNq2vyUx3SKjLlxbMGtN1Y+S2GqTINIgVqB2Ml9
/nd6xsMx3ydcGFoHV+kRXyTc46pTUPynhgPAKHEmfi5cX6MKLQVhdZhM3bJPIhbw
hqgtdB+czOO8fRPQtI7JkQOUYdXbCXtWYoyZC5UkJBKOuKS2KfMYtTUAPTquuxRt
9xDzA35sYYQjzQYuC6igrzxITd3a9mba3GOfCQdJBjMj7E8dABQ=
=I9+q
-----END PGP SIGNATURE-----

--Sig_/ChTfleO_tTuDUfYjEeF50tb--
