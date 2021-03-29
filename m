Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE1634D274
	for <lists+dri-devel@lfdr.de>; Mon, 29 Mar 2021 16:35:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EF9A6E417;
	Mon, 29 Mar 2021 14:35:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2C4F6E417
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Mar 2021 14:35:46 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id 15so16271771ljj.0
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Mar 2021 07:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=m1x7qkeXn/hByih9f1Ls4Wtzy4s/AO+YUDm9O2yD2co=;
 b=XNmUmT2AuJqL3daZRBsOCLd/wj1scH/Tr13kjsb4aTKAucRiyl49VXv+KxQGJg0ueF
 ZqF9RZnhle+4heONe+K9NwmDsJg4zVkB3yxqrrQ8CnPjfGMg7HMVbj9beDLh+cHTYgAd
 hCdQiT6Fn/AG3rYBkv8aXebjl3J2t+VB1jiB3BwDfN9AQJ5YUx0ZYEyPqXKe7F4XaADs
 p6DwN7ehVMMTiwonRo1XZJjUpNtLR8MVs1zoWE0Q2OK5OgDE3VT2uKMUSmBDcshIpTOn
 R84o2Wxwquy5BXjIvohdmQKhSd8CZYurjrFe608KfddsTykGDrejNUjPAxCsX0ySh5g0
 v1fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=m1x7qkeXn/hByih9f1Ls4Wtzy4s/AO+YUDm9O2yD2co=;
 b=i9veZAwE/e7Udj8PRb99PyfdTFaR/oxuHR0u8LSeiz5FxRg+cG5Li3Mp1K+QTj4d+0
 G2U1SaGY+dyLorEV55Hj/IH0B2xSS9Rf8uh8b0mSAPKsnbw3Cd/BbhhQwyl5/07D8OTF
 RKlaRwsBKLWtyXatZ63qoayubCjrCFO5tPybi1G6uBUSlXu8YRLjkUp2FWi6mBLdx+mZ
 ItW3jsHmUZv/nDyfjPczQXD5fYeldRhiWFhwkBnn2xzTXiJRbugm2WzZm7E8RSq6Bfzu
 5jz7vwWnxX6E5lOVdEiqFL3TtdwdUdhm9kKeLEp/Qj/vjlAZqFVdy5JaDs/B+kCV8N+o
 b7qA==
X-Gm-Message-State: AOAM531a7mr6Lpci78YrUxpKD4lfhVNCOlNT4Ss4u/A0JvmQt3wAk3bj
 KqnFqVVvfKfq4DL2WJqnvq0=
X-Google-Smtp-Source: ABdhPJx8UtK5Fiuw+Hy00AN6fkoVIeQJGIZDBjlQXTx1sn3856kYtBw6mZ9hf15G4oedQVGbJqwGrQ==
X-Received: by 2002:a2e:87d8:: with SMTP id v24mr17567883ljj.387.1617028545041; 
 Mon, 29 Mar 2021 07:35:45 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id b9sm1856028lfo.237.2021.03.29.07.35.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Mar 2021 07:35:44 -0700 (PDT)
Date: Mon, 29 Mar 2021 17:35:41 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH] drm: DON'T require each CRTC to have a unique primary
 plane
Message-ID: <20210329173541.00b301ea@eldfell>
In-Reply-To: <C4BQQQ.FDNJ4NAK9OAD3@crapouillou.net>
References: <20210327112214.10252-1-paul@crapouillou.net>
 <1J_tcDPSAZW23jPO8ApyzgINcVRRWcNyFP0LvrSFVIMbZB9lH6lCWvh2ByU9rNt6bj6xpgRgv8n0hBKhXAvXNfLBGfTIsvbhYuHW3IIDd7Y=@emersion.fr>
 <24LMQQ.CRNKYEI6GB2T1@crapouillou.net>
 <20210329111533.47e44f72@eldfell>
 <C4BQQQ.FDNJ4NAK9OAD3@crapouillou.net>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, od@zcrc.me, stable@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: multipart/mixed; boundary="===============1215225434=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1215225434==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/fR.=hEM3/j_hKrnsh3EjOJN"; protocol="application/pgp-signature"

--Sig_/fR.=hEM3/j_hKrnsh3EjOJN
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 29 Mar 2021 12:41:00 +0100
Paul Cercueil <paul@crapouillou.net> wrote:

> Hi,
>=20
> Le lun. 29 mars 2021 =C3=A0 11:15, Pekka Paalanen <ppaalanen@gmail.com> a=
=20
> =C3=A9crit :
> > On Sat, 27 Mar 2021 11:26:26 +0000
> > Paul Cercueil <paul@crapouillou.net> wrote:
> >  =20
> >>  It has two mutually exclusive background planes (same Z level) + one
> >>  overlay plane. =20
> >=20
> > What's the difference between the two background planes?
> >=20
> > How will generic userspace know to pick the "right" one? =20
>=20
> First primary plane cannot scale, supports RGB and C8. Second primary=20
> plane goes through the IPU, and as such can scale and convert pixel=20
> formats; it supports RGB, non-planar YUV, and multi-planar YUV.
>=20
> Right now the userspace apps we have will simply pick the first one=20
> that fits the bill.

What would be the downside of exposing just one "virtual" primary
plane, and then have the driver pick one of the two hardware planes as
appropriate per modeset?


Thanks,
pq

> >>  Le sam. 27 mars 2021 =C3=A0 11:24, Simon Ser <contact@emersion.fr> a=
=20
> >> =C3=A9crit
> >>  : =20
> >>  > On Saturday, March 27th, 2021 at 12:22 PM, Paul Cercueil
> >>  > <paul@crapouillou.net> wrote:
> >>  > =20
> >>  >>  The ingenic-drm driver has two mutually exclusive primary planes
> >>  >>  already; so the fact that a CRTC must have one and only one  =20
> >> primary =20
> >>  >>  plane is an invalid assumption. =20
> >>  >
> >>  > Why does this driver expose two primary planes, if it only has a
> >>  > single
> >>  > CRTC? =20
> >>=20
> >>=20
> >>  _______________________________________________
> >>  dri-devel mailing list
> >>  dri-devel@lists.freedesktop.org
> >>  https://lists.freedesktop.org/mailman/listinfo/dri-devel =20
> >  =20
>=20
>=20


--Sig_/fR.=hEM3/j_hKrnsh3EjOJN
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmBh5b0ACgkQI1/ltBGq
qqcpcRAAs1a0IDl6xxB5DTNPOLZyQ7AJDT7ctuzZg+ncVnmVeqbz/6t6llDJ5ncT
XYu/FBvAq7mTV3PIjzLNi6kRp615ACSlgAJ8jQ5JEflKHwaw99OVOz01exKJUK81
tzdbL+Vqeh4X6WGVb6jqWhCWiUiZhlNf0ztHfhZ20N76dmFqgOvVCfCBLH2WYpin
M2J9P8/EJUdmT9O/0dVgb08B7TGrjL4Jazoj7BSGhuloAL9DovPWi6Qw2Ir72TUM
5Vkj6XqmT14+6CBUci+tBz/v5dUUuTrsEb6a+Mosx9AEC8YHz0ua9IxhGVXsOTCv
8lTVFvYtapg4NQmc28VA8AkhvITEiJGZCHRP8H4lFHkmGjUNXXkWjkJKMZsEYL3c
Qx4TN72CIACbjirsmtm01m/uS4zqJo0lz96ZgPjzg0+GaqBccQCWygG8VKga9U5X
BWcPNuzOIFTlOOGwfyMjOIqgt+JvC+DQlkg8Ch7p/wIzRHvnJDf0RoeZsU5zzio7
/diSITyoHk7r0z40IUA5W+WVQRls8MtH0Ytq1qoEhz308+kOEft4DQa/wQ/I85Ki
/teScjJaLSvfwJHdGTVA0pewfre8AtS0/DHiD2waBYZXftQdr0Tx4ynlX7580zUU
blqEzXM/SpTJqX2pGHeppPy9BWXjB1dnU9PZCPTTRQe3zDuv9rk=
=hKzE
-----END PGP SIGNATURE-----

--Sig_/fR.=hEM3/j_hKrnsh3EjOJN--

--===============1215225434==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1215225434==--
