Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0306FC550
	for <lists+dri-devel@lfdr.de>; Tue,  9 May 2023 13:47:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E06F310E395;
	Tue,  9 May 2023 11:47:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B76210E069;
 Tue,  9 May 2023 11:47:30 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-4f13c577e36so6374233e87.1; 
 Tue, 09 May 2023 04:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683632848; x=1686224848;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=cbEYrmDNhnoYCgCJikTIU7++G7lIBsO5cxggRDG8z7s=;
 b=ssx7tXrcBedTfZPAVQL3/t6gzpQxUJhybzgFSV4CEjaShkfN9p8fN+fR2O8aSkISNW
 hJIbM4/ymk9g/9zRQ9PVa1T2XTYEngGcy1D5J/8Pzvdh2srybHjABsMjdIeFy1VvDzAK
 iTZhy21AoNigmMXGuoA8v/r+o/2glhRtp4urqIOIk3pSjLijwt6gdBV2lOMuNKqyV/Ph
 azdVOYp4CuHJHr2gKmFG1+5e64uZa9EAACsSLl6UZaX/2/ZLJfAoaxJCt7Cjxyk6SmzR
 mAvjxNEeQAJUHP1oG1RBEDQNTh9/z1jvfIm+tY1Jl41v5fEEcbg/wv8uF0WX1cBFSrIQ
 pMGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683632848; x=1686224848;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cbEYrmDNhnoYCgCJikTIU7++G7lIBsO5cxggRDG8z7s=;
 b=lnuHh76GFIP3L/vPEIWgXm9CbPRvp7fKmKQ18KTZQdQvi8wo83QqhB1UWvlILzoaTu
 BhOwa18i/OuXKBAw3hOpcteMWf4EPHnKLhaN1hpqNdZqxLHqvre/0GcpSqJARcLMwKbM
 0Ok9mvGRyEUHEA7B14/Xdnk9x985tjRyRIz+u5TfLO8pI9KhZDysU4tNDEpvc7osxMjm
 hKuhjXIeoMDKbK+2UqweH80mTlwO6dXF6UsXHxip2kcdRVHNCVFnPx8wImQzPa1H0gSr
 8uatJm+OkwcP1C+vg8SCcdq8/Ne3hQdj0vSPUh3IUhYV0Fl+Ngw4j9CMaFfgGxQuzhAF
 jlUg==
X-Gm-Message-State: AC+VfDwjXJoPDMgshHutXr5iFxpLa24xVwjJuzJGs+rNSkWbHqQEZT9q
 CBn+u4IfsKkWVPkWKG55lVI=
X-Google-Smtp-Source: ACHHUZ4sqvwtARmfcrXlLstM1RAXIXHicfEaoOsyVoa7Dh7x3R52uW9ECxkQmuFrXVxaGdeohtATBg==
X-Received: by 2002:ac2:5e81:0:b0:4f1:4eda:f1e9 with SMTP id
 b1-20020ac25e81000000b004f14edaf1e9mr639014lfq.59.1683632848376; 
 Tue, 09 May 2023 04:47:28 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 a15-20020a056512020f00b004ecad67a925sm327206lfo.66.2023.05.09.04.47.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 May 2023 04:47:27 -0700 (PDT)
Date: Tue, 9 May 2023 14:47:17 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Melissa Wen <mwen@igalia.com>
Subject: Re: [RFC] Plane color pipeline KMS uAPI
Message-ID: <20230509144717.7c85443d@eldfell>
In-Reply-To: <20230509112349.ognmkrjkjuorl25x@mail.igalia.com>
References: <QMers3awXvNCQlyhWdTtsPwkp5ie9bze_hD5nAccFW7a_RXlWjYB7MoUW_8CKLT2bSQwIXVi5H6VULYIxCdgvryZoAoJnC5lZgyK1QWn488=@emersion.fr>
 <20230505144150.741a90e1@eldfell>
 <CAEZNXZDnCeZKTJvTwFYnrECzjLc+WEhUG5y-GBDmOeoMBCdJ+A@mail.gmail.com>
 <20230509112349.ognmkrjkjuorl25x@mail.igalia.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.24; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Gldn9lmtnN+N8hIkG.F7WK.";
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
 Victoria Brekenfeld <victoria@system76.com>,
 Jonas =?UTF-8?B?w4VkYWhs?= <jadahl@redhat.com>,
 Uma Shankar <uma.shankar@intel.com>, Joshua Ashton <joshua@froggi.es>,
 Michel =?UTF-8?B?RMOkbnplcg==?= <mdaenzer@redhat.com>,
 Aleix Pol <aleixpol@kde.org>, Sebastian Wick <sebastian.wick@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/Gldn9lmtnN+N8hIkG.F7WK.
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 9 May 2023 10:23:49 -0100
Melissa Wen <mwen@igalia.com> wrote:

> On 05/05, Joshua Ashton wrote:
> > Some corrections and replies inline.
> >=20
> > On Fri, 5 May 2023 at 12:42, Pekka Paalanen <ppaalanen@gmail.com> wrote=
: =20
> > >
> > > On Thu, 04 May 2023 15:22:59 +0000
> > > Simon Ser <contact@emersion.fr> wrote:
> > > =20

...

> > > >     Color operation 47 (3D LUT RAM)
> > > >     =E2=94=94=E2=94=80 "lut_data" =3D Gamut mapping + tone mapping =
+ night mode
> > > >     Color operation 48 (blend gamma)
> > > >     =E2=94=94=E2=94=80 "1d_curve_type" =3D PQ =20
> >=20
> > ^
> > This is wrong, this should be Display Native -> Linearized Display Refe=
rred =20
>=20
> This is a good point to discuss. I understand for the HDR10 case that we
> are just setting an enumerated TF (that is PQ for this case - correct me
> if I got it wrong) but, unlike when we use a user-LUT, we don't know
> from the API that this enumerated TF value with an empty LUT is used for
> linearizing/degamma. Perhaps this could come as a pair? Any idea?

PQ curve is an EOTF, so it's always from electrical to optical.

Are you asking for something like

"1d_curve_type" =3D "PQ EOTF"

vs.

"1d_curve_type" =3D "inverse PQ EOTF"?

I think that's how it should work. It's not a given that if a
hardware block can do a curve, it can also do its inverse. They need to
be advertised explicitly.


Thanks,
pq

ps. I picked my nick in the 90s. Any resemblance to Perceptual
Quantizer is unintended. ;-)


> > >
> > > You cannot do a TF with a matrix, and a gamut remap with a matrix on
> > > electrical values is certainly surprising, so the example here is a
> > > bit odd, but I don't think that hurts the intention of demonstration.=
 =20
> >=20
> > I have done some corrections inline.
> >=20
> > You can see our fully correct color pipeline here:
> > https://raw.githubusercontent.com/ValveSoftware/gamescope/master/src/do=
cs/Steam%20Deck%20Display%20Pipeline.png
> >=20
> > Please let me know if you have any more questions about our color pipel=
ine.

--Sig_/Gldn9lmtnN+N8hIkG.F7WK.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmRaMsUACgkQI1/ltBGq
qqe2Qw//XAVkHvvW4QkuL7XPeAv/CfZYzXMU6g6L/j7It31djaxmBfFcbFR3j8he
mRvFQrhWwZ540cjZunndcNk/QjdQ8fsquzRgjkZH/ME26usNW+si9F5+Hmyaoj/x
6EivJxn4AqeaW6UrJW8s06aV/SVyYLzOTBbdkwYHQJeW1V8Rg+jzrXw3cDIRgFEu
W3YwR/AdTW6/BxmzeDYmlrqgLgFWqmoXdNFAzIz6IqjqgadQcE88AncmOx5/lX2U
0TipAwElkaWaX40ZF3qP7PyhHQJ43xGYm3wTGIbNfeo/Bb/GwDNdSw/8MeLgEjGF
fHqYeJg0mp8pLnMCyN62Vepit3yWrLcJPF9tl7OAIx6K9KPTIgtEGhlRtvFZSdCN
pLpQ+wZXZlxFDs06iDta+NYJBiStSbWyeaxADZeUqbfN2VP3BHZQxToo+vUw7DYw
emaH/Krr2fCNVIfc2JKWP4Awch68/qK4sCDYRVzKPm9lam/WRI5GkeKC2fyfbDA0
wMT1u3b8tLhuZ8f3W7koJI2CwH0JJsp3QujYL5DtNYyBezp+wzaoVo7X9fg/Jd3p
pdM8uiKjhdBBgyjpqBkzCMVuEL7+iXmSgK1/cVM4/heOCvdbT+Dnw4yY6vQsLf7f
2aaZ/ni4uybmXAPzs7xYsrHMZo4ph49mAWWIg5Zvg/44mhd7GW8=
=Upvc
-----END PGP SIGNATURE-----

--Sig_/Gldn9lmtnN+N8hIkG.F7WK.--
