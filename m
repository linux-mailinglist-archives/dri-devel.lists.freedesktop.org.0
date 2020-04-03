Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2297B19D48D
	for <lists+dri-devel@lfdr.de>; Fri,  3 Apr 2020 12:03:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 003D36EB4E;
	Fri,  3 Apr 2020 10:03:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 604166EB4E;
 Fri,  3 Apr 2020 10:03:17 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id w145so5292172lff.3;
 Fri, 03 Apr 2020 03:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=6E1f09MlQmFP1KgDfhM5sxw8Sb4qNksVEKKce58a3xo=;
 b=Emw1QG6qSnEdpAXxUVXk8S09KzUsBhcn/GDNf86LuZNNe8O7u+71BXWzG3/eOXCsET
 Ii2/y3iqfEk7hB+vRksb1tzZ1p1qhgFmzTvGHBE0BmtrXlAVuCNMbQFCImcchJhe3Fv2
 cO2sxv7BkWGWFe2NN7xSvOKl4MPETJwuo8uvpi5yzEIyaO32sil1aWCETy7quniWq1rL
 UwuI8LZlXuBy8Bkg65r6HwC9BhF4q47ko/SO7+0WHvbEFIP78OR1lWwYJIEMd3GlR1xr
 Stigi9vCqbXdOV06nGdfmlywtf3US5Y1684H9ZUdvchQCa3Hf71wKf2oTDFXlCZDM9sC
 7ctA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=6E1f09MlQmFP1KgDfhM5sxw8Sb4qNksVEKKce58a3xo=;
 b=cIesBKBDg88xW5QhheOOCVRJo+4nmaHpbKRhJryiGIG7Q1dSnLcrVtGAkfX+afhZ+L
 O93ROWUvuEM0b5rbEXQk/LkgYEi3wqEZGWjCOkYo2CgULtq+gngvTobtVJFH6zpq9rJR
 1f2U2I7prEjj96uIXTS0swNmA+YDVsOmYCg0nJnmY0DVZ0ev2x+UXDh0DCdXZfYhZVjE
 oQrVlO3T6T439FSl2yiUQPChSQLNvI2GDIzsibEhqUGy9fN7WqILV6oICyhY7nzLt2fL
 a9Q34ZkczFYY4uujBopOhw8/9cdISgsPhJXwRRhCudGy5YWCmBwFq350EuwIq2Y1fQjB
 cJIA==
X-Gm-Message-State: AGi0PuYZRtdY2bNh+rgnu5tvH/iQctqoaBjELbUuVLBW0kpGVFjorvuA
 7VabqCeMQWFrcVFZ9npXw2A=
X-Google-Smtp-Source: APiQypKrPpz1QzRqnp/jj7LkTmBAyQSSe7ZgZEUneIf4POFAiZGiBnLMczhi9ShqLy45E3DK4IHVIw==
X-Received: by 2002:ac2:4c88:: with SMTP id d8mr4967420lfl.100.1585908195600; 
 Fri, 03 Apr 2020 03:03:15 -0700 (PDT)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id j2sm5613638lfh.70.2020.04.03.03.03.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Apr 2020 03:03:15 -0700 (PDT)
Date: Fri, 3 Apr 2020 13:03:06 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Guillermo Rodriguez <guillerodriguez.dev@gmail.com>
Subject: Re: Aliases for DRI connectors?
Message-ID: <20200403130306.1b4a171c@eldfell.localdomain>
In-Reply-To: <CABDcavY_00eeD-zR-CZNCwFdBL56DcFh4yAO_W4t+xC3j_qsow@mail.gmail.com>
References: <CAJgxT3-11eZqvysgCQMCYtKEUVsNWWHd+7au91uNC7SWK1Fyug@mail.gmail.com>
 <20200403111411.5e4e6bfe@eldfell.localdomain>
 <CABDcavY_00eeD-zR-CZNCwFdBL56DcFh4yAO_W4t+xC3j_qsow@mail.gmail.com>
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
Cc: Matt Hoosier <matt.hoosier@gmail.com>, dri-devel@lists.freedesktop.org,
 wayland mailing list <wayland-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0245623150=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0245623150==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/uHBHQHBV384IC41Ran/C.fW"; protocol="application/pgp-signature"

--Sig_/uHBHQHBV384IC41Ran/C.fW
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 3 Apr 2020 10:28:52 +0200
Guillermo Rodriguez <guillerodriguez.dev@gmail.com> wrote:

> Hi Pekka,
>=20
> El vie., 3 abr. 2020 a las 10:14, Pekka Paalanen
> (<ppaalanen@gmail.com>) escribi=C3=B3:
> >
> > On Wed, 1 Apr 2020 14:38:37 -0500
> > Matt Hoosier <matt.hoosier@gmail.com> wrote:
> > =20
> > > I'm searching for some sort of scheme that will let my DRI master que=
ry the
> > > set of available connectors and select the one carrying a prearranged
> > > designation. The problem I'm trying to solve is to allow deploying one
> > > standardized userspace component across a fleet of devices that have
> > > varying numbers of displays, with the use cases not always driven on =
the
> > > same connector topologically.
> > >
> > > I had a look around the properties available on my system's DRI conne=
ctors,
> > > and nothing immediate jumped out at me. Is there a standard connector
> > > property that (assuming I can find the right place in DeviceTree or s=
imilar
> > > to) that would be a good fit for this? =20
> >
> > Hi,
> >
> > I've never heard of a thing that could accomplish that. DRM connector
> > names are not even actually communicated to userspace. What userspace
> > sees is connector type (enum) and some counter numbers (which are not
> > persistent, so not reliable if you have e.g. multiple DRM drivers
> > racing to initialize), =20
>=20
> I may be misreading you, but does this mean that the connector names
> used in the [output] section of the weston.ini configuration file are
> not reliable?

Yes, they are not generally reliable. They are reliable enough in most
cases, particularly if you have only one DRM device with connectors.
DRM drivers themselves often manage to not race internally, so they are
fairly consistent in what order they create their connectors per device.

Xorg has the exact same problem IIRC, as has probably any display
server on Linux. This means that to find a case where the reliability
actually breaks down you have to try quite hard or be very unlucky,
since it has gone unfixed for so long.

Likewise you cannot rely that /dev/dri/card0 is always the same device
if you have multiple. That issue is showing up a little more than the
connector naming issue. Hence /dev/dri/by-path/ aliases exist. Network
devices have hit the same naming problem a long time ago already, hence
we nowadays have "Predictable Network Interface Names".

> Then what is the proper way to configure one specific (physical)
> output in Weston?

There is no better way yet. I've had some ideas, but no time to look
into them.

MST connectors have a KMS property for the hardware path, but Weston
does not look at that, and the other connectors don't even have it.


Thanks,
pq

--Sig_/uHBHQHBV384IC41Ran/C.fW
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl6HCdoACgkQI1/ltBGq
qqfLsA/+IvQwvibH9oe6BdUjrcjW59KX86D1EPg7mavO33++nGxOTyQGXpJWRHZc
8K+eel1uYMKs1It2y96dnwBF+v6Z1oUZRZwYQ+uAoGabmul5SRxOHuaHaEJdpjpJ
8+dJpYcEKDxdY+29RcKa4Qh8yHCos2AqL5jjgqeAXFD4al4GAO8dRudbO0+PO4/8
RXvHRXaFFlfWt8RpA4A6CyQarDZ68WorRp1FoDmWmmKGjT+sy1Aqdry3oqDF1xKP
Z5NR14Y37RXuezD/btuGb+xeX/rLnedZi6InBjkZJ0Q4sneazoBldrc6aQki01yC
Mh1y1J2RxZdqPZqRFCbkcpGFddjTcLOCL6j3wxfjcG1Ba7ZxyWA7LQu2T0wtCLzv
+xvTFBJumZ4JDpA/UMZmv2ca9M4YfjZ9BoOxyJccadKbj/OfXMl+KlkaSoM6imiE
XaBT9nHAMb2gQmMUpYLrPeN44YgVnem98abnmQpt6l4nD18CUcJNGEM13By9ZBqH
wi8zhXjPcn8t1mZGVnqLYqTWqXhuAtSsZVDJ7Kvmwkc8V/TWFZx5V+yjxnU+uk2s
sU82pDVfwMH30q9/MOfWuk5NvC/TrkHE2wOtZ53R48Wh6sAe3z68KriQaSjjOkvX
N3uj5wLyIGd2TAWsCUQ6huceRd6nDLXQL1pmquGV5VSs83olfXM=
=1ggN
-----END PGP SIGNATURE-----

--Sig_/uHBHQHBV384IC41Ran/C.fW--

--===============0245623150==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0245623150==--
