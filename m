Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B23FB6F84AE
	for <lists+dri-devel@lfdr.de>; Fri,  5 May 2023 16:16:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C37E10E60E;
	Fri,  5 May 2023 14:16:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36E1F10E60A;
 Fri,  5 May 2023 14:16:38 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-4f004943558so2092071e87.3; 
 Fri, 05 May 2023 07:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683296194; x=1685888194;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=4EMfpyjyuYWwh54Xy0CzDngANXUM1xuayPdPea7Ljg8=;
 b=T94aqZ9A4CjGsIkHnW6NKtXUQYN2RrrnTq3sUbJhLi0mmGg+//k3XFxYNb/NR4mvL6
 5UBkii+8JKK0WIS93c4TLx0cLuq4rfyqf76ldcduU3X/6do59x8IHQZITwYOgwV9P75d
 TrhWD0iZ8CPo55njA/0vxXokhektQMp9jnY0flJOwP6LpjnZkDO/fS2c2EPg8lDJtmY3
 J2uKU1ISKUHmD45Lo/dWtfC217fasKPOG+sgfxH/p5zrloFs44nF3w1R9byS+h8X0hKu
 NG8C6jODstRM8KdEZE9RuEUHtzyTnVh/2MHalp7d85rEAYxuOffHS0phx10RFXksVqNQ
 sR0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683296194; x=1685888194;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4EMfpyjyuYWwh54Xy0CzDngANXUM1xuayPdPea7Ljg8=;
 b=KuQX+dA4PxOjU7nD/XwdoAiYt0YgKTQrjxobltatUrQFv2t9znG6yQ0QEFX/ZtO9eE
 m1NztvSMOd0KL+8ynnIpq3+Iysboht30Nz2doAQCA63nZAfH+q//AahuPqtY9zEiA7rK
 gqw8ZBjSnelNv9e0LaiOUHzgdMrHK0uDDnFZht/KApThAD/+6t03pT5t5TlF+jzfyice
 EkXHhtsPSVe7EUndB3sukUD0fuhY1Csbdy5Ib+i61YLmyrjsdaXcgR9w9PRlZZJ7BR56
 5FJ4/JRkyEDCF0pWha3XBHg8DVSS7Ya5m15xbDuAueiktBkSUNMjPcXt5HCJikeopLcX
 vwxA==
X-Gm-Message-State: AC+VfDwQX24QroS5ozPz91Ezy1mbfTO5LaOYfhiC+omGjcdhI1EFgT1W
 tDTMi4IqLMA4s+OqaLXCzlE=
X-Google-Smtp-Source: ACHHUZ7sIIXTZgKwbnxTGPILHxWIex+HAc4/x6v1XjizUETAL8XcApqNHtkPdiDeynd2abCF0c6k6g==
X-Received: by 2002:ac2:5549:0:b0:4ef:f630:5c1e with SMTP id
 l9-20020ac25549000000b004eff6305c1emr537148lfk.51.1683296194252; 
 Fri, 05 May 2023 07:16:34 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 2-20020ac24822000000b004f134f7cff3sm302456lft.167.2023.05.05.07.16.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 May 2023 07:16:33 -0700 (PDT)
Date: Fri, 5 May 2023 17:16:22 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Joshua Ashton <joshua@froggi.es>
Subject: Re: [RFC] Plane color pipeline KMS uAPI
Message-ID: <20230505171622.1c83ff1e@eldfell>
In-Reply-To: <CAEZNXZDnCeZKTJvTwFYnrECzjLc+WEhUG5y-GBDmOeoMBCdJ+A@mail.gmail.com>
References: <QMers3awXvNCQlyhWdTtsPwkp5ie9bze_hD5nAccFW7a_RXlWjYB7MoUW_8CKLT2bSQwIXVi5H6VULYIxCdgvryZoAoJnC5lZgyK1QWn488=@emersion.fr>
 <20230505144150.741a90e1@eldfell>
 <CAEZNXZDnCeZKTJvTwFYnrECzjLc+WEhUG5y-GBDmOeoMBCdJ+A@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.24; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/fggQZ1wvxP5JxNkeAcpkK1x";
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
Cc: "xaver.hugl@gmail.com" <xaver.hugl@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 wayland-devel <wayland-devel@lists.freedesktop.org>,
 Melissa Wen <mwen@igalia.com>, Jonas =?UTF-8?B?w4VkYWhs?= <jadahl@redhat.com>,
 Uma Shankar <uma.shankar@intel.com>,
 Victoria Brekenfeld <victoria@system76.com>,
 Michel =?UTF-8?B?RMOkbnplcg==?= <mdaenzer@redhat.com>,
 Aleix Pol <aleixpol@kde.org>, Sebastian Wick <sebastian.wick@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/fggQZ1wvxP5JxNkeAcpkK1x
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 5 May 2023 14:30:11 +0100
Joshua Ashton <joshua@froggi.es> wrote:

> Some corrections and replies inline.
>=20
> On Fri, 5 May 2023 at 12:42, Pekka Paalanen <ppaalanen@gmail.com> wrote:
> >
> > On Thu, 04 May 2023 15:22:59 +0000
> > Simon Ser <contact@emersion.fr> wrote:

...

> > > To wrap things up, let's take a real-world example: how would gamesco=
pe [2]
> > > configure the AMD DCN 3.0 hardware for its color pipeline? The gamesc=
ope color
> > > pipeline is described in [3]. The AMD DCN 3.0 hardware is described i=
n [4].
> > >
> > > AMD would expose the following objects and properties:
> > >
> > >     Plane 10
> > >     =E2=94=9C=E2=94=80 "type": immutable enum {Overlay, Primary, Curs=
or} =3D Primary
> > >     =E2=94=94=E2=94=80 "color_pipeline": enum {0, 42} =3D 0
> > >     Color operation 42 (input CSC)
> > >     =E2=94=9C=E2=94=80 "type": enum {Bypass, Matrix} =3D Matrix
> > >     =E2=94=9C=E2=94=80 "matrix_data": blob
> > >     =E2=94=94=E2=94=80 "next": immutable color operation ID =3D 43
> > >     Color operation 43
> > >     =E2=94=9C=E2=94=80 "type": enum {Scaling} =3D Scaling
> > >     =E2=94=94=E2=94=80 "next": immutable color operation ID =3D 44
> > >     Color operation 44 (DeGamma)
> > >     =E2=94=9C=E2=94=80 "type": enum {Bypass, 1D curve} =3D 1D curve
> > >     =E2=94=9C=E2=94=80 "1d_curve_type": enum {sRGB, PQ, =E2=80=A6} =
=3D sRGB
> > >     =E2=94=94=E2=94=80 "next": immutable color operation ID =3D 45 =20
>=20
> Some vendors have per-tap degamma and some have a degamma after the sampl=
e.
> How do we distinguish that behaviour?
> It is important to know.

...

> > Btw. ISTR that if you want to do scaling properly with alpha channel,
> > you need optical values multiplied by alpha. Alpha vs. scaling is just
> > yet another thing to look into, and TF operations do not work with
> > pre-mult. =20
>=20
> What are your concerns here?

I believe this is exactly the same question as yours about sampling, at
least for up-scaling where sampling the framebuffer interpolates in
some way.

Oh, interpolation mode would fit in the scaling COLOROP...

> Having pre-multiplied alpha is fine with a TF: the alpha was
> premultiplied in linear, then encoded with the TF by the client.

There are two different ways to pre-multiply: into optical values
(okay), and into electrical values (what everyone actually does, and
what Wayland assumes by default).

What you described is the thing mostly no-one does in GUI graphics.
Even in the web.

> If you think of a TF as something something relative to a bunch of
> reference state or whatever then you might think "oh you can't do
> that!", but you really can.
> It's really best to just think of it as a mathematical encoding of a
> value in all instances that we touch.

True, except when it's false. If you assume that decoding is the exact
mathematical inverse of encoding, then your conclusion follows.

Unfortunately many video standards do not have it so. BT.601, BT.709,
and I forget if BT.2020 (SDR) as well encode with one function and
decode with something that is not the inverse, and it is totally
intentional and necessary mangling of the values to get the expected
result on screen. Someone has called this "implicit color management".

So one needs to be very careful here what the actual characteristics
are.

> The only issue is that you lose precision from having pre-multiplied
> alpha as it's quantized to fit into the DRM format rather than using
> the full range then getting divided by the alpha at blend time.
> It doesn't end up being a visible issue ever however in my experience, at=
 8bpc.

That's true. Wait, why would you divide by alpha for blending?
Blending/interpolation is the only operation where pre-mult is useful.


Thanks,
pq

>=20
> Thanks
>  - Joshie =F0=9F=90=B8=E2=9C=A8
>=20
> >
> >
> > Thanks,
> > pq
> > =20
> > >
> > > I hope comparing these properties to the diagrams linked above can he=
lp
> > > understand how the uAPI would be used and give an idea of its viabili=
ty.
> > >
> > > Please feel free to provide feedback! It would be especially useful t=
o have
> > > someone familiar with Arm SoCs look at this, to confirm that this pro=
posal
> > > would work there.
> > >
> > > Unless there is a show-stopper, we plan to follow up this RFC with
> > > implementations for AMD, Intel, NVIDIA, gamescope, and IGT.
> > >
> > > Many thanks to everybody who contributed to the hackfest, on-site or =
remotely!
> > > Let's work together to make this happen!
> > >
> > > Simon, on behalf of the hackfest participants
> > >
> > > [1]: https://wiki.gnome.org/Hackfests/ShellDisplayNext2023
> > > [2]: https://github.com/ValveSoftware/gamescope
> > > [3]: https://github.com/ValveSoftware/gamescope/blob/5af321724c8b8a29=
cef5ae9e31293fd5d560c4ec/src/docs/Steam%20Deck%20Display%20Pipeline.png
> > > [4]: https://kernel.org/doc/html/latest/_images/dcn3_cm_drm_current.s=
vg =20
> > =20


--Sig_/fggQZ1wvxP5JxNkeAcpkK1x
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmRVD7YACgkQI1/ltBGq
qqe1Tw/7BSVCS5dzrH7+It5ia1NZ5M7RSwCpL5Z1x8hZCu8CV8n59Jh/bKPwyqn5
6tHEJOXUGDYDrJASmzSNpSQa5CgF0oOxWbt+fuaY6Chf/aDrJdam/uZYF4rFAKOW
Nj2OlavaKPxi9WQ3pJPVbMhfMqS2OaYDLuvbEa+ObwWz4g/KREYLAWIO1tlJcpB4
YP39iu7PeE8Rc05wze9syhR04kdM8chPrDqX67Y0DN2RPEaAoybz5pJMxGQnp6w7
deULI1JXnBHLXX6pfrEMvc7pievcUOswSD0s6IHofMHDImwa6V2r+q+QDO01vh0j
5uvoQGH2VsnPjVjJQe6fnKHvtcSXH1nf92PaEYThO14Ks78u007jDuM97Jd/ISeU
nj+BWq/Fb1IJ0DkSaMmTvT5ACzN2kuY0mHEKy1OH/IbGve65vQT9CwzNImF6+dzK
K4E3ALrbFgmbi243lD/ctunhupL0jsPTIlNflNQjscYgN1miHUeb6Y2l53MPmQAn
GzJN8h07hkY6iBLQTz/HXLUZ1FmZ4Xk2Icw4lhURd6i+eJxbjp5KYAwcSdkKOCXX
5dMLlvNZR1wvY4JEKApU9FozFwru87YPF3bkrgm23ro1EHygNAteyiqwNFC74/8r
/vRVsYXh/tJg+kpoBwV2J3W0ne/FToOaJd07/3jDN+TZfzQZIPw=
=7GeX
-----END PGP SIGNATURE-----

--Sig_/fggQZ1wvxP5JxNkeAcpkK1x--
