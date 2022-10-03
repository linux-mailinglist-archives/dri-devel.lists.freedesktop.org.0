Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE1E5F2C07
	for <lists+dri-devel@lfdr.de>; Mon,  3 Oct 2022 10:38:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13B8010E275;
	Mon,  3 Oct 2022 08:38:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED07D10E27A;
 Mon,  3 Oct 2022 08:37:56 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id b6so10939983ljr.10;
 Mon, 03 Oct 2022 01:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date;
 bh=c1RTDhUptXubmqIOjpWFCwnR4r/J+8GY3N7lqKxbdmM=;
 b=b1NN/hwm5NmZH121SW3EqtZHoyHLILnWha5gNCSC9jPLVvLrR6JsUfbwX1zEaUVN92
 SPc9VLPW0PgCuvW3vW1tE2DwEePGe+Xr9UM8rotrRPy7ICRjfm8+ayE1gZuJEq31W0bw
 7R/uiWMM4A0h3ZHt/XoK4ijJjOghnUsooeN2rG/JjKmQkD1z07OYwCg8mD/vodsSYv2W
 oXFc+Xw9iUppRjCxwgH+wkI9lxPGiZ+rLkA9ZNx09n4CnDJn5wCsBiV2EFxEwgqOxsi3
 MXCDpJBcoqaPCfsjTveiouEsgnbTGo6HzxoEShQKgwfU4+VLaKev9T30RUVCCl4a466X
 p+OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date;
 bh=c1RTDhUptXubmqIOjpWFCwnR4r/J+8GY3N7lqKxbdmM=;
 b=5TrdUDQYR0qEV1lMm/7XRRz8/ItXr1VNudc2aKnQeFtcz3ntoZ/R+l95+d81TBgy0q
 opRNZSmjBt6B07T23QCkYKqNI8WzAN/NpbmDyW32/IST5mY1s9aMK+cnfnLT3X47RAuH
 4cLlaqalCQa10dWrlfl0upLMWW302vKy4QmobiAyugVF2h3djfyH4JokgXMwPJNwGRBG
 2DL0L3IjIvElwJLo09b6gcn665PTBdwys2TRHIDExgjdx/2sCMglvcjSvqr9Kiaaz5QL
 Mzht3SA8okMX/PvCo0H88e7AkvDdbQnkoexzrwUg/1V96jU/MenPAHifoYj6qK2oqcm2
 wqFQ==
X-Gm-Message-State: ACrzQf2a3gI5BPi8j8Pd5x7KZIFHX6SailSB0kiOLmv8HYeCgeSDUa1P
 rB88lvOw2ttunWaEByBx+K8=
X-Google-Smtp-Source: AMsMyM6pQeUmbSYUece/ulrOZoIXtZaQgdV2OzQLUNKRso8lOiXUq+HhkKh6glULeFsXi0xNtlSNfw==
X-Received: by 2002:a2e:8756:0:b0:26d:e096:a0d8 with SMTP id
 q22-20020a2e8756000000b0026de096a0d8mr864535ljj.500.1664786275165; 
 Mon, 03 Oct 2022 01:37:55 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 u12-20020a05651c130c00b0025e00e0116esm822350lja.128.2022.10.03.01.37.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Oct 2022 01:37:54 -0700 (PDT)
Date: Mon, 3 Oct 2022 11:37:50 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Sebastian Wick <sebastian.wick@redhat.com>, Ville =?UTF-8?B?U3lyasOk?=
 =?UTF-8?B?bMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [RFC v2] drm/kms: control display brightness through
 drm_connector properties
Message-ID: <20221003113750.64d0417a@eldfell>
In-Reply-To: <CA+hFU4zat+-0eW_6BaY0pbHzKxBjPtnyV5M=X=9Y0Rn8JJe8Wg@mail.gmail.com>
References: <b61d3eeb-6213-afac-2e70-7b9791c86d2e@redhat.com>
 <878rm3zuge.fsf@intel.com> <YzQojrDOGNhm4D8l@intel.com>
 <YzQseBFa5EvDUDSw@intel.com>
 <CA+hFU4xRV74r3Wbs-TTWmtAkEwdJaEb+1QXUZSh52LVRwfddeA@mail.gmail.com>
 <20220930103956.1c3df79e@eldfell>
 <CA+hFU4yR542C3Qo_8ggkXKF+OZs=Pt9awsQ7Q4bXGoiv+7-VyQ@mail.gmail.com>
 <YzcAwVC8tm1imNOL@intel.com> <20220930182652.4ea10013@eldfell>
 <CA+hFU4zat+-0eW_6BaY0pbHzKxBjPtnyV5M=X=9Y0Rn8JJe8Wg@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/P3pTp+YAHVyilJq1=3mjf0h";
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
Cc: Martin Roukala <martin.roukala@mupuf.org>,
 Christoph Grenz <christophg+lkml@grenz-bonn.de>,
 wayland <wayland-devel@lists.freedesktop.org>,
 Hans de Goede <hdegoede@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Yusuf Khan <yusisamerican@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/P3pTp+YAHVyilJq1=3mjf0h
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 30 Sep 2022 18:17:39 +0200
Sebastian Wick <sebastian.wick@redhat.com> wrote:

> On Fri, Sep 30, 2022 at 5:27 PM Pekka Paalanen <ppaalanen@gmail.com> wrot=
e:
> >
> > On Fri, 30 Sep 2022 17:44:17 +0300
> > Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com> wrote:
> > =20
> > > On Fri, Sep 30, 2022 at 04:20:29PM +0200, Sebastian Wick wrote: =20
> > > > On Fri, Sep 30, 2022 at 9:40 AM Pekka Paalanen <ppaalanen@gmail.com=
> wrote: =20
> > > > >
> > > > > On Thu, 29 Sep 2022 20:06:50 +0200
> > > > > Sebastian Wick <sebastian.wick@redhat.com> wrote:
> > > > > =20
> > > > > > If it is supposed to be a non-linear luminance curve, which one=
 is it?
> > > > > > It would be much clearer if user space can control linear lumin=
ance
> > > > > > and use whatever definition of perceived brightness it wants. T=
he
> > > > > > obvious downside of it is that it requires bits to encode chang=
es that
> > > > > > users can't perceive. What about backlights which only have a f=
ew
> > > > > > predefined luminance levels? How would user space differentiate
> > > > > > between the continuous and discrete backlight? What about
> > > > > > self-emitting displays? They usually increase the dynamic range=
 when
> > > > > > they increase in brightness because the black level doesn't ris=
e. They
> > > > > > also probably employ some tonemapping to adjust for that. What =
about
> > > > > > the range of the backlight? What about the absolute luminance o=
f the
> > > > > > backlight? I want to know about that all in user space.
> > > > > >
> > > > > > I understand that most of the time the kernel doesn't have answ=
ers to
> > > > > > those questions right now but the API should account for all of=
 that. =20

...

> > I'm saying that what looks realistic to me is somewhere *between*
> > status quo and what Sebastian is asking for. Whatever you mean by "line=
ar
> > remapping" is probably a realistic goal, because you know you have some
> > hardware/firmware delivering that information already.
> >
> > OTOH, designing UAPI for information that exists only in our dreams
> > is... well. =20
>=20
> I also didn't say that we should design an UAPI for what doesn't
> exist, just that we should design the UAPI we actually need in a way
> that when we get more information we can properly expose that. So if
> the UAPI exposes anything other than the luminance (e.g. "each step is
> a perceptual step in brightness", "linear brightness", ..) we have to
> put some human perception model into the kernel which is ridiculous
> and it makes it impossible to expose luminance to user space if the
> kernel has that information.

You don't need a human perception model in the kernel. You also cannot
have one, because I would expect most or all backlight and their
metadata to not define luminance at all. But that is just a guess.

I suppose the firmware may expose some tables that may allow mapping
raw hardware values into something more pleasant to use. Like something
where each step is more or less a visible change. That does not have to
imply anything about linearity in any space, they may just be "good
values" for e.g. keyboard-based changing of backlight levels with no
mathematical or physical basis.

Ville, what kind of tables do you know about? What do they actually
tell?

Let's say we have these first properties defined as "reasonable steps
for manual backlight control": one integer for the value, another
integer for the max. If we later see that we can actually get more
precise or high-level information, we can add new optional properties,
e.g. a blob with table that maps the integers into some better defined
quantity.

Then we know what the values mean, but the steps may be quite
coarse, much coarser than what the raw control value allows. That's the
next problem: if we want as fine control as hardware is capable, how do
you expose that?

Should the answer be, that the exposed integer is actually a raw value
for hardware, merely offsetted so that zero maps to minimum but visible
backlight level, and then add another property from the start with a
table for the "good values" for keyboard control?

And the "good values" would be literally just that, no implication of
linearity of anything.


Thanks,
pq

--Sig_/P3pTp+YAHVyilJq1=3mjf0h
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmM6n14ACgkQI1/ltBGq
qqcWCA//enubbdApd9bvVrtji/5td9VgtLsWNzUU9aL7/gSJMb5j9h+qk/P/bxDv
jCOqb3bT4Na68y1xTz8iPwyrJR5tw9zc09j6E6HPsdIKvGgpl5nVPak9F1WDwBUW
Xrlf30/ppa32SLXTyQi0OLDGhJ/SYr1XCWxIWmKd40ASLV5cauSRMNGxyX/YbpxS
DNd7Q6ocsiEiz7bg5MP+7+7FVLzyFcPkVMbLHXB/dhyoipAIxqVrp7h3SIsl4mG7
bkFA6F0q6m5IFPutoBQr7Os1QRXepwSQUkMdNdEHssiqXwDUdEFb0p764onE9LrP
MXg1qw/6/Zc2y800nL5y2yaktKQxskyR7QSUSE4yN/zoLUmeDwhls3BN3zg2XrFa
5Vg8WYHZzxVZc2EIg9WpMHY77VHhe4vluH95rSLTEx0todjkdo6s7QWgusxiUUBV
CMfDWhvAJX7gJJApE+pAWjRD2c9VNe6YpDlqXwXMYZPix8c1VIpQrFamy82mCoKv
GOnAlmV2RCsbInSplFrMVK8pStiKqbij+4eBE+9YuUg+wxse8MfzKvELzRVHYBlj
l0N/6edvj1uMo5M8P1dEC4ynVdjQO14cFNRyjCojtL6wS++EwCLVrJV01ZQRSX01
BgfJXnvZjLarE+tjO86BKNdxfum5lm37PS/HjMYxWaTzRjKfEqM=
=X50s
-----END PGP SIGNATURE-----

--Sig_/P3pTp+YAHVyilJq1=3mjf0h--
