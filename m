Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 883AF57D36
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2019 09:36:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F03C56E818;
	Thu, 27 Jun 2019 07:35:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BFFC6E816;
 Thu, 27 Jun 2019 07:35:58 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id r15so827338lfm.11;
 Thu, 27 Jun 2019 00:35:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=7LaMgU7lYlTTq4vX0F62OnAdP2BPs36Q4zFTrM+xfWM=;
 b=GABMX3pJ1rAD5kmO+2HuHWVH8E5r/JAwu4OlU5Lh5F0P/XlwpTJUx0Cma9SX74K4lb
 hOCBZRotAlyUOCo1dwxXuECI4TDj57umaA3AU4NaA+BOoh1syzgfrTXnD6UDJEtacEoz
 8NseyxTvg5bJwX/BqDe6B+UNxLue5LB5EuJhY3IjuY6dUnLoJGtK4acTcLZtlcK7r94b
 BOJOhe9XaH0j2h8ZBA0lEP9tVGkT1iV/AFN0xEacaGdPThHLnAYv8d+b13Pg8sapYAVI
 7zeY4YEU6hQ7o7hT6maC/EFw1X+uYWJUIrORmzhfJvEk6LDYHZZFxy3t8iTMliWoKHgp
 uLUQ==
X-Gm-Message-State: APjAAAVHt6RGpNfWr0eGy+NnKnJ8jX/aK2XFj7NUDcCbrIIM2noCE8Ck
 55zDe4diBM2M6LvmRdOZxaKjMdqx
X-Google-Smtp-Source: APXvYqwimau8EroDWhePxAfL9GMh87MNDgMiEbn3T6yy7V8vWusOin2c7ApygArs0ZzigHrzNEY3Kg==
X-Received: by 2002:ac2:5922:: with SMTP id v2mr261503lfi.180.1561620956752;
 Thu, 27 Jun 2019 00:35:56 -0700 (PDT)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id v2sm190292lfi.52.2019.06.27.00.35.56
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 27 Jun 2019 00:35:56 -0700 (PDT)
Date: Thu, 27 Jun 2019 10:35:47 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [RFC][PATCH 0/2] drm: PATH prop for all connectors?
Message-ID: <20190627103547.67cd8868@eldfell.localdomain>
In-Reply-To: <20190613204208.GR23020@phenom.ffwll.local>
References: <20190613184335.7970-1-ville.syrjala@linux.intel.com>
 <20190613204208.GR23020@phenom.ffwll.local>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version;
 bh=7LaMgU7lYlTTq4vX0F62OnAdP2BPs36Q4zFTrM+xfWM=;
 b=RICox4np91ERiK98nqkCdlp4Xg7k+l0a0C6GseCgKDxxiCi2gHgqvMl0Uw3t+JjElu
 eylZHxxZzXq5JA8zi2aAqWMIjEAZDJtyZoWQMDHXcuob1t+IcSJ1hnFcNCIItThEuXNl
 TBjNDyUEUVyimbRc/UgaoECLorOIKYON3drsivOJYFgh2B2KomJ+h9r9FaUq+6sO6LHq
 zE7djqyK2r9zVIDmyGhQMT7xCHQhZtw6v4EuAHSgARgd/kFuaH9X+lxjlykxECKAznC5
 YJzvRLcDvMLp8wmkT8QyXtpmsFJXOBTMrAKyjsCG71p1ksSBUbywZERQwX9ms31kxGwU
 wjjQ==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1264152971=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1264152971==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/wGF4miNzbv/L0CFmuwxXMfZ"; protocol="application/pgp-signature"

--Sig_/wGF4miNzbv/L0CFmuwxXMfZ
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 13 Jun 2019 22:42:08 +0200
Daniel Vetter <daniel@ffwll.ch> wrote:

> On Thu, Jun 13, 2019 at 09:43:33PM +0300, Ville Syrjala wrote:
> > From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> >=20
> > Here's a possible apporoach for providing userspace with
> > some stable connector identifiers. Combine with the bus
> > name of the GPU and you should have some kind of real
> > physical path description. Unfortunately the ship has
> > sailed for MST connectors because userspace is already
> > parsing the property and expects to find certain things
> > there. So if we want stable names for those we'd probably
> > have introduce another PATH prop (PHYS_PATH?).
> >=20
> > I suppose one alternative would to make the connector=20
> > type_id stable. Currently that is being populated by drm=20
> > core and it's just a global counter. Not sure how badly
> > things would turn out if we'd allow each driver to set
> > that. It could result in conflicting xrandr connector
> > names between different GPUs which I suppose would
> > confuse existing userspace? =20
>=20
> I think the only reason this global id stuff exists is because with
> original xrandr, that stuff was global. And then it got copypasted
> forever.
>=20
> Would need to do a bunch of reviewing, but I'd expect we'll get away with
> just making all these allocators per-device.

Hi,

I'm not sure I'm that optimistic... I assume most userspace uses type_id
for naming already and might rely on uniqueness. Weston uses type_id,
but does not rely on uniqueness yet, since it only handles one device
so far.

The bigger problem to me however is changing the meaning of type_id,
causing old kernels do one thing and new kernels do another thing. When
userspace uses type_id for connector naming, it may use that name in
configuration files. Weston does, but again is not affected because it
doesn't support using multiple devices yet. If someone has two gfx
cards in his machine, making type_id per-device changes the numbering,
meaning the user's configuration does not apply anymore or applies
wrong. I suppose it doesn't matter if the naming was already
unreliable, since it is reliable if the drivers/devices happened to
probe in the same order every boot.

Are connector names in xrandr still using type_id in their names? That
would be a sure blocker, I think.


Thanks,
pq

--Sig_/wGF4miNzbv/L0CFmuwxXMfZ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl0UcdMACgkQI1/ltBGq
qqd0/Q//RlTC3ZUhYvLszKWH+MxGXbG1y917+H4YacqZBa1Dt+v4n5l87A0atOjD
UnFqzvWJ3X/94NviRSOj1pQ4c82sCf8jXV49vaKlDLpU64PzRr6B/YJnTmcbL74T
UdG97nYXU79Himl44OJdEjbHiaiGdbvA0+l45LIKZ6h8brTmkUNnMcpO3o6WQ+Yk
Lsf9jvvz4wLfEotqbGdc5pbyHJz+vgRZfWIKuHHCCHgx2zjhdG+X1FK81gxXaA29
otDUD6/yY39zsW+ZESo3ZBFSlH9QNXq7eCNH36YlYqjXtXY0QJ7mZ56/FP0RgAap
kHs/X8BBaEGL3dWY8YLKgIZKSSqU77SHWYhTbAhcaPSz07xSgXrWvfYyYev1EIbe
K8BlP7Hf6K9G4rI6drOuwe5Ue9gD7ImCC0NGKiJPCAml1/nEDuJF5uIF+FyIXZeS
+isIdPUjGzqGtM1TlqUr938odITyL2YrMITQjHBjy+LhFN2mamyA3aUX5ilYQXUB
x8DRzvp1yrinakJgC3y8ya76+px2/qSoDDORkhrvzODod7gGWIlyDiePaCwxMY8M
Ln8NFsUmuc+/MV8AbtHDSRVzwKTMQJCFc0vZNu6CdW70u1VXbi6bvDklZ7fErIhd
u1IKHI3ghQooT1Nu3PJyKNdbzMwi3UU5zHD/insp4Cq6VWzOGAM=
=QjzZ
-----END PGP SIGNATURE-----

--Sig_/wGF4miNzbv/L0CFmuwxXMfZ--

--===============1264152971==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1264152971==--
