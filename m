Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2BFC1E6149
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 14:48:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5E776E517;
	Thu, 28 May 2020 12:48:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84EFC6E514
 for <dri-devel@lists.freedesktop.org>; Thu, 28 May 2020 12:48:10 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id d7so5319878lfi.12
 for <dri-devel@lists.freedesktop.org>; Thu, 28 May 2020 05:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=+C0igjhGT+sYhN7GzwMHQ4aSr4cxXqb485GsRfnenxw=;
 b=HspxuV6zJNKNzYNIVKfE/bgUdotoEi+ZqAajXqNCTP80TI6X8ewueh4HiZiwPGEizl
 36pYw9EzQfRb/8hVbVpYHWJ1Sz3ZPTetbO2oLdR/FjjYA/5b9UWaN4W6yH8k9AVz0SmF
 sURpk06sRHVhKJ1K8k1mRkqxsTxbdLJSkZs7ozHdBffYnUIt0P2HbKXgV9Rhx+6PNSEW
 XLUqVfkN1vd4r2MjUflgK64Fl4NgPVmjFFoHSfQfwHUXAFCpqMy7FTsO103eXqk8AYLj
 Dplv60rSozcEUnmYZWN/WrbMYjZWPDxu/y9K1UIiQbaZUi8W2JLxll4ob6JxSynG/IEO
 tFlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=+C0igjhGT+sYhN7GzwMHQ4aSr4cxXqb485GsRfnenxw=;
 b=LF6ZIwDhEZGsJ/AaCTJAYqo2M+nzDfV6h2qFc/ZJXoGl8/maDU8IwmPlAHbaX1/R0C
 8WawIXKB7eopfl6KoqvyRA5swr+Rs6iB7nxFZxc4MPtBRH35fdtJOFFwNpJcNl6i8lzw
 Hcf7jyXmXVFYrOesrqA8L9aO//qOQPjc5GiEMRJeqaSdEfUjRs3HoU1wElAJAIJG0R73
 9tk7YSLEePL8ObBm9sHD81T0aw7MbX6+5H8F7Eb16rZQiNB5AqkVPhwKoJpKIrUW+PaL
 JDPryx1Jw1JP8wujr1JdaI0n1H4jtuEi4sWBck34vO/XPgpfvDJ+Kwk92Nt3VS1PbpMt
 d8FQ==
X-Gm-Message-State: AOAM5329EZH3aIwMnN/2vpfDvuVyVuijO2MCmdUhhmaNLdWTfXpyQ21m
 kEpvpxpt32zj/1UJOswD1i8=
X-Google-Smtp-Source: ABdhPJznEvS6tD8CmhN8F4z6oku/+JHIPfD8fwb+VRu5tshe1c1mnyFRFHWhTy1479mX5jRjmzbD6g==
X-Received: by 2002:a05:6512:62:: with SMTP id
 i2mr1598207lfo.152.1590670088666; 
 Thu, 28 May 2020 05:48:08 -0700 (PDT)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id j9sm1615551lfe.24.2020.05.28.05.48.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 May 2020 05:48:08 -0700 (PDT)
Date: Thu, 28 May 2020 15:48:04 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Yogish Kulkarni <yogishkulkarni@gmail.com>
Subject: Re: Dynamically change enumeration list of DRM enumeration property
Message-ID: <20200528154804.02fb8901@eldfell.localdomain>
In-Reply-To: <CAL3Fm-+G0MJoYLb2CJKTW5w6Qk4K=j5if+6hLDE_ustW=e933Q@mail.gmail.com>
References: <CAL3Fm-JJbjCby5_HojTf9dWKurw+CECN7LDqamtf53c9L-0jtw@mail.gmail.com>
 <20200526103921.0817ee0b@eldfell.localdomain>
 <CAKMK7uHG1P9hwT1CBqWUfL6sBwZwyS7q0scXSUuXNiJMmRz-+g@mail.gmail.com>
 <CAL3Fm-L-iwGu60Zf15aYf9Xm9201sT2vU888Fv46Tv7x37Aq6Q@mail.gmail.com>
 <20200528082445.GR206103@phenom.ffwll.local>
 <CAL3Fm-+G0MJoYLb2CJKTW5w6Qk4K=j5if+6hLDE_ustW=e933Q@mail.gmail.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0364269012=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0364269012==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/3QFChqKJ987lAIA0KYNbA0D"; protocol="application/pgp-signature"

--Sig_/3QFChqKJ987lAIA0KYNbA0D
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 28 May 2020 17:38:59 +0530
Yogish Kulkarni <yogishkulkarni@gmail.com> wrote:

> I am trying to find a way through Weston which will allow setting specific
> encoding at display output.

Hi,

why do *you* want to control that?

Why not let the driver always choose the highest possible encoding
given the video mode and hardware capability?

I can understand userspace wanting to know what it got, but why should
userspace be able to control it?

Would people want to pick the encoding first, and then go for the
highest possible video mode?

> Could you please elaborate on  why it is best
> to let DRM driver automatically configure which encoding to choose rather
> than making it selectable by DRM client ? I am not able to find reference
> to past discussion about this. I was only able to find a proposed change -
> https://lists.freedesktop.org/archives/intel-gfx/2017-April/125451.html b=
ut
> am not able to find why it got rejected.
>=20
> Alternatively, is there existing way through which DRM clients can specify
> preference for output encoding ? Or currently it's all up to the DRM driv=
er
> to choose what output encoding to use.

There must be some reason why userspace needs to be able to control it.
I'm also asking as a Weston maintainer, since I'm interested in how
this affects e.g. color reproduction or HDR support.

One thing that comes to my mind is using atomic TEST_ONLY commits to
probe all the possible video modes =C3=97 encodings for presenting a list to
the user to choose from, if you have a display configuration GUI. E.g
with some TV use cases, maybe the user wants to avoid sub-sampling, use
the native resolution, but limit refresh rate to what's actually
possible. Or any other combination of the three.


Thanks,
pq

>=20
> Thanks,
> -Yogish
>=20
> On Thu, May 28, 2020 at 1:54 PM Daniel Vetter <daniel@ffwll.ch> wrote:
>=20
> > On Thu, May 28, 2020 at 12:29:43PM +0530, Yogish Kulkarni wrote: =20
> > > For creating new source property, is it good to follow
> > > "drm_mode_create_hdmi_colorspace_property()"  as an example ? It seem=
s =20
> > that =20
> > > currently there is no standard DRM property which allows DRM client t=
o =20
> > set =20
> > > a specific output encoding (like YUV420, YUV422 etc). Also, there is =
no
> > > standard property for letting client select YUV/RGB color range. I see
> > > there are two ways to introduce new properties, 1. do something like
> > > drm_mode_create_hdmi_colorspace_property 2. create custom property =20
> > similar =20
> > > to "Broadcast RGB". Is there opinion on which is a preferable way to =
=20
> > expose =20
> > > encoding and color rage selection property ? =20
> >
> > I guess first question is "why?" Thus far we've gone with the opinion t=
hat
> > automatically configuring output stuff as much as possible is best. Wha=
t's
> > the use-case where the driver can't select this?
> > -Daniel

--Sig_/3QFChqKJ987lAIA0KYNbA0D
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl7PswQACgkQI1/ltBGq
qqdBWA//d9bID31SbUV7C6HM+6VFka6+WudaYHsXgY291zM+texe5D2CV0lo4yjP
RZYxDQoZFvS5CD2BcAjYQUzNmA8p5jk1OXOGLu/1juv9Y2/PcZOht+Z8nmDbz2qb
7aW5EVZQjDU8ZQQ8ERL94NAdh5uSq0YPhJARQQkaFPnTUfCAw57QFI7ZG1HU849I
yNaMqlVnX/YVy6b8pPvyvtOpZ116u1V93yaBBMVbhd/ikVVEoDnffNi3vnO7wALY
89Bmdn7Q4JTbs9k2VFP4A84hv3VPgMu9GJph5Co3h61bvnTa/92ISy93FPYW8O8A
IQt+0PHdyUp6PrLW5Go4mq6ct7luqpFFijOB9FAWLdDdHfh7Oodh946pevi6AMq8
QOdwuXwQFINH2mdiEAOgwti4oY5DXSVweU/V9kB297l5mkmGzghzOKqPm/H7mPtS
dl0YpxZhqDob3lshU29dBWg3BBz5lRLtFC1TLblV9HyRDVBQQx8utsFaVwIh73Fd
NPDrCd7mioCAGRRVoo4nYzaelw26HRifP1Vfwek6XdJarDu7EY3HVZXi/VfRvYf2
7dmc11NFpOF2Y5RWV4mxkeCrQNraljg+dnGQB4buDT6ZkzjycC3QO5Dza8nbBt5J
A9g9CZ0hCcfH0c81lje8VTyGMsmQ0rm4Ef/PRox2sF4aD2KX1yQ=
=+ldT
-----END PGP SIGNATURE-----

--Sig_/3QFChqKJ987lAIA0KYNbA0D--

--===============0364269012==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0364269012==--
