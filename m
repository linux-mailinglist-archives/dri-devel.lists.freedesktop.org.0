Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CAD4807468
	for <lists+dri-devel@lfdr.de>; Wed,  6 Dec 2023 17:03:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D278B10E74D;
	Wed,  6 Dec 2023 16:02:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6901E10E72F
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Dec 2023 16:02:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BCCA661D00;
 Wed,  6 Dec 2023 16:02:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14B9BC433C8;
 Wed,  6 Dec 2023 16:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701878577;
 bh=JU9PgWyG6P5TU/V8w4KUIz6ICZnLH6l4LvTaLDQSl1U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bZkoI8qBBHKd85zeiEEzJEZJnRlZzI51unIwZe9eJpUiyy4R79bpjeSTEnRUTaYPu
 yVTN1HZ1S/2sEfF696OJcyaNIJ1it3eQfs2OiO6x9E7haegKbxuf94apfj0y3FKwhr
 96PbK/sld3MjyUsdO13TjpZNMF06GmfjUYab0iITChGNKstVsNK2p5kslbgojZl5a2
 BCWsYnYlatsN09dvTvMkNGbzHZNlGH89jfUDb2wNL7Ht+LrdlBVpVoIqWhNwPnP45v
 ZYtBI3ZGXyT566Qi+Lod683RFEGl4rxZs6Xf6t/djQSY7bp90DzN5oNdUB5afcZ0K5
 RTXHhsxR/yE0g==
Date: Wed, 6 Dec 2023 16:02:49 +0000
From: Conor Dooley <conor@kernel.org>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH RFC 01/10] dt-bindings: gpu: Add PowerVR Series5 SGX GPUs
Message-ID: <20231206-wolverine-paprika-0674ca01e1f2@spud>
References: <20231204182245.33683-1-afd@ti.com>
 <20231204182245.33683-2-afd@ti.com>
 <CFF198DA-5C42-425E-86F4-759629489ECB@goldelico.com>
 <cb590a13-e0ff-49d9-8583-be613ad50dc5@ti.com>
 <FE0DBA5E-95A5-4C27-9F69-D1D8BDF56EC3@goldelico.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="1GzC+imUbKhZhoBm"
Content-Disposition: inline
In-Reply-To: <FE0DBA5E-95A5-4C27-9F69-D1D8BDF56EC3@goldelico.com>
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
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tony Lindgren <tony@atomide.com>, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Donald Robson <donald.robson@imgtec.com>, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 =?iso-8859-1?Q?Beno=EEt?= Cousson <bcousson@baylibre.com>,
 Maxime Ripard <mripard@kernel.org>, Matt Coster <matt.coster@imgtec.com>,
 Rob Herring <robh+dt@kernel.org>, linux-omap@vger.kernel.org,
 Adam Ford <aford173@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Tero Kristo <kristo@kernel.org>, linux-kernel@vger.kernel.org,
 Andrew Davis <afd@ti.com>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--1GzC+imUbKhZhoBm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 05, 2023 at 07:04:05PM +0100, H. Nikolaus Schaller wrote:
> > Am 05.12.2023 um 18:33 schrieb Andrew Davis <afd@ti.com>:
> >=20
> > On 12/5/23 2:17 AM, H. Nikolaus Schaller wrote:
> >>> +          - enum:
> >>> +              - ti,omap3430-gpu # Rev 121
> >>> +              - ti,omap3630-gpu # Rev 125
> >> Is the "Rev 121" and "Rev 125" a property of the SoC integration (cloc=
k/reset/power
> >> hookup etc.) or of the integrated SGX core?
> >=20
> > The Rev is a property of the SGX core, not the SoC integration.
>=20
> Then, it should belong there and not be a comment of the ti,omap*-gpu rec=
ord.
> In this way it does not seem to be a proper hardware description.
>=20
> BTW: there are examples where the revision is part of the compatible stri=
ng, even
> if the (Linux) driver makes no use of it:
>=20
> drivers/net/ethernet/xilinx/xilinx_emaclite.c

AFAICT these Xilinx devices that put the revisions in the compatible are
a different case - they're "soft" IP intended for use in the fabric of
an FPGA, and assigning a device specific compatible there does not make
sense.

In this case it appears that the revision is completely known once you
see "ti,omap3630-gpu", so encoding the extra "121" into the compatible
string is not required.

>=20
> > But it seems that
> > compatible string is being used to define both (as we see being debated=
 in the other
> > thread on this series).
> >=20
> >> In my understanding the Revs are different variants of the SGX core (e=
rrata
> >> fixes, instruction set, pipeline size etc.). And therefore the current=
 driver code
> >> has to be configured by some macros to handle such cases.
> >> So the Rev should IMHO be part of the next line:
> >>> +          - const: img,powervr-sgx530
> >> +          - enum:
> >> +              - img,powervr-sgx530-121
> >> +              - img,powervr-sgx530-125
> >> We have a similar definition in the openpvrsgx code.
> >> Example: compatible =3D "ti,omap3-sgx530-121", "img,sgx530-121", "img,=
sgx530";
> >> (I don't mind about the powervr- prefix).
> >> This would allow a generic and universal sgx driver (loaded through ju=
st matching
> >> "img,sgx530") to handle the errata and revision specifics at runtime b=
ased on the
> >> compatible entry ("img,sgx530-121") and know about SoC integration ("t=
i,omap3-sgx530-121").

The "raw" sgx530 compatible does not seem helpful if the sgx530-121 or
sgx530-125 compatibles are also required to be present for the driver to
actually function. The revision specific compatibles I would not object
to, but everything in here has different revisions anyway - does the
same revision actually appear in multiple devices? If it doesn't then I
don't see any value in the suffixed compatibles either.

> >> And user-space can be made to load the right firmware variant based on=
 "img,sgx530-121"
> >> I don't know if there is some register which allows to discover the re=
vision long
> >> before the SGX subsystem is initialized and the firmware is up and run=
ning.
> >> What I know is that it is possible to read out the revision after star=
ting the firmware
> >> but it may just echo the version number of the firmware binary provide=
d from user-space.
> >=20
> > We should be able to read out the revision (register EUR_CR_CORE_REVISI=
ON), the problem is
> > today the driver is built for a given revision at compile time.
>=20
> Yes, that is something we had planned to get rid of for a long time by us=
ing different compatible
> strings and some variant specific struct like many others drivers are doi=
ng it.
> But it was a to big task so nobody did start with it.
>=20
> > That is a software issue,
> > not something that we need to encode in DT. While the core ID (SGX5xx) =
can be also detected
> > (EUR_CR_CORE_ID), the location of that register changes, and so it does=
 need encoded in
> > DT compatible.
>=20
> Ok, I didn't know about such registers as there is not much public inform=
ation available.
> Fair enough, there are some error reports about in different forums.
>=20
> On the other hand we then must read out this register in more or less ear=
ly initialization
> stages. Even if we know this information to be static and it could be as =
simple as a list
> of compatible strings in the driver.
>=20
> > The string "ti,omap3430-gpu" tells us the revision if we cannot detect =
it (as in the current
> > driver), and the SoC integration is generic anyway (just a reg and inte=
rrupt).
>=20
> It of course tells, but may need a translation table that needs to be mai=
ntained in a
> different format. Basically the same what the comments show in a non-mach=
ine readable
> format.
>=20
> I just wonder why the specific version can or should not become simply pa=
rt of the DTS
> and needs this indirection.
>=20
> Basically it is a matter of openness for future (driver) development and =
why it needs
> careful decisions.
>=20
> So in other words: I would prefer to see the comments about versions enco=
ded in the device
> tree binary to make it machine readable.

It's already machine readable if it is invariant on an SoC given the
patch had SoC-specific compatibles.


--1GzC+imUbKhZhoBm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZXCbKQAKCRB4tDGHoIJi
0gUSAP4pLX8rcwBHj8VW2mgEVDmi72inSYgECU11LQ5z/rfShQEApbEr4eSsSD9+
DLM236mZLlPAWEhYnu9sfA7Bx1CNzgs=
=16z1
-----END PGP SIGNATURE-----

--1GzC+imUbKhZhoBm--
