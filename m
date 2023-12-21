Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDEE981B140
	for <lists+dri-devel@lfdr.de>; Thu, 21 Dec 2023 10:03:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C940310E06B;
	Thu, 21 Dec 2023 09:03:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B051E10E06B
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Dec 2023 09:02:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id C0487B81F9B;
 Thu, 21 Dec 2023 09:02:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E7F4C433C8;
 Thu, 21 Dec 2023 09:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1703149377;
 bh=p5dHoof6CpVRm8H51oSiaRXPqfim6y17RnxB7xY56tk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=e1Q8ENqaz4vYwDVkG3agH8Y4nWY+t+vf+dRK4CWAox6pMkmw0lE5CiewwHUcSFbp4
 RkWIsVyItgSe8hLDbVe7XR+8+z2jsXtz39K9l++LNfCrEsMCoGDX4J/MON0Esni2Wq
 iqrEvVOXEmgR6BzB7qFtyB6TBQUBqZsN45F0aj+iNwKZJOMYPXJ+ALJKqxfvUPDBQl
 rhlhXxneBAsPHxzhYuLmXAXUstbegLTSelvwcYG7NV5MOIsYEKj9nW+wOHWTOrkTWg
 ptmFIbWZj+VriBf6p9Woko7ugLT2AK5cwSkli+QHtfdeHxaYVqcZc5AQiBUtk0h6/e
 /8F23EhrD4POQ==
Date: Thu, 21 Dec 2023 10:02:54 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Andrew Davis <afd@ti.com>
Subject: Re: [PATCH RFC 01/10] dt-bindings: gpu: Add PowerVR Series5 SGX GPUs
Message-ID: <3dggaesvunebogkqvclz4imruhynrftkhsvmndm75vfccqwpa6@3zp3dgzpzta6>
References: <B3A1B8A7-0363-4ECB-AFBF-576FECA569FA@goldelico.com>
 <vawv2mwhonuyvgmp7uox4rfgdcjwg5fa7hmbcfgl3wiase6e4p@tyavpclppfvu>
 <6BC60156-89E2-4734-BD00-B49A9A6C1D7A@goldelico.com>
 <6gpehpoz54f5lxhmvirqbfwmq7dpgiroy27cljpvu66wtn7aqy@lgrh7wysyxnp>
 <D8AB6CC4-DCA5-40DD-A311-94A16FF59254@goldelico.com>
 <oobcl2kfsuph27er7rflfqvt3lu6athufomxv5chf3uctx4emh@x6rzjtlskhbf>
 <F58855EC-D87D-4747-A363-0E7AA5DB1AEC@goldelico.com>
 <22cny5aumc5wafsrjd3j55zcjbjf2viip64kfbjiqis2grtd6t@wg5dxeuzil6l>
 <3E03E913-48E1-49EC-A6C9-EAC1612E65E7@goldelico.com>
 <a3feaf42-17fb-46e5-bbb0-3ffc4ad40bfd@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="xdjqplvcfzg6bqbd"
Content-Disposition: inline
In-Reply-To: <a3feaf42-17fb-46e5-bbb0-3ffc4ad40bfd@ti.com>
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
 Tony Lindgren <tony@atomide.com>, "H. Nikolaus Schaller" <hns@goldelico.com>,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 Paul Cercueil <paul@crapouillou.net>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Donald Robson <donald.robson@imgtec.com>, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
 Matt Coster <matt.coster@imgtec.com>, Rob Herring <robh+dt@kernel.org>,
 linux-omap@vger.kernel.org, Adam Ford <aford173@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Tero Kristo <kristo@kernel.org>,
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--xdjqplvcfzg6bqbd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 19, 2023 at 11:19:49AM -0600, Andrew Davis wrote:
> On 12/18/23 4:54 AM, H. Nikolaus Schaller wrote:
> >=20
> >=20
> > > Am 18.12.2023 um 11:14 schrieb Maxime Ripard <mripard@kernel.org>:
> > >=20
> > > On Mon, Dec 18, 2023 at 10:28:09AM +0100, H. Nikolaus Schaller wrote:
> > > > Hi Maxime,
> > > >=20
> > > > > Am 15.12.2023 um 14:33 schrieb Maxime Ripard <mripard@kernel.org>:
> > > > >=20
> > > > > > >=20
> > > > > > > It's for a separate architecture, with a separate driver, mai=
ntained out
> > > > > > > of tree by a separate community, with a separate set of requi=
rements as
> > > > > > > evidenced by the other thread. And that's all fine in itself,=
 but
> > > > > > > there's very little reason to put these two bindings in the s=
ame file.
> > > > > > >=20
> > > > > > > We could also turn this around, why is it important that it's=
 in the
> > > > > > > same file?
> > > > > >=20
> > > > > > Same vendor. And enough similarity in architectures, even a log=
ical sequence
> > > > > > of development of versions (SGX =3D Version 5, Rogue =3D Versio=
n 6+) behind.
> > > > > > (SGX and Rogue seem to be just trade names for their architectu=
re development).
> > > > >=20
> > > > > Again, none of that matters for *where* the binding is stored.
> > > >=20
> > > > So what then speaks against extending the existing bindings file as=
 proposed
> > > > here?
> > >=20
> > > I mean, apart from everything you quoted, then sure, nothing speaks
> > > against it.
> > >=20
> > > > > > AFAIK bindings should describe hardware and not communities or =
drivers
> > > > > > or who is currently maintaining it. The latter can change, the =
first not.
> > > > >=20
> > > > > Bindings are supposed to describe hardware indeed. Nothing was ev=
er said
> > > > > about where those bindings are supposed to be located.
> > > > >=20
> > > > > There's hundreds of other YAML bindings describing devices of the=
 same
> > > > > vendors and different devices from the same generation.
> > > >=20
> > > > Usually SoC seem to be split over multiple files by subsystem. Not =
by versions
> > > > or generations. If the subsystems are similar enough they share the=
 same bindings
> > > > doc instead of having one for each generation duplicating a lot of =
code.
> > > >=20
> > > > Here is a comparable example that combines multiple vendors and gen=
erations:
> > > >=20
> > > > Documentation/devicetree/bindings/usb/generic-ehci.yaml
> > >=20
> > > EHCI is a single interface for USB2.0 controllers. It's a standard AP=
I,
> > > and is made of a single driver that requires minor modifications to d=
eal
> > > with multiple devices.
> > >=20
> > > We're very far from the same situation here.
> >=20
> > How far are we really? And, it is the purpose of the driver to handle d=
ifferent cases.
> >=20
> > That there are currently two drivers is just a matter of history and no=
t a necessity.
> >=20
> > >=20
> > > > > If anything it'll make it easier for you. I'm really not sure why=
 it is
> > > > > controversial and you're fighting this so hard.
> > > >=20
> > > > Well, you made it controversial by proposing to split what IMHO bel=
ongs together.
> > >=20
> > > No, reviews aren't controversial.
> > > The controversy started when you chose
> > > to oppose it while you could have just rolled with it.
> >=20
> > Well, you asked
> >=20
> > "I think it would be best to have a separate file for this, img,sgx.yaml
> > maybe?"
> >=20
> > and
> >=20
> > "Because it's more convenient?"
> >=20
> > I understood that as an invitation for discussing the pros and cons and=
 working out the
> > most convenient solution. And that involves playing the devil's advocat=
e which of course
> > is controversial by principle.
> >=20
> > Now, IMHO all the pros and cons are on the table and the question is wh=
o makes a decision
> > how to go.
> >=20
>=20
> As much as I would land on the side of same file for both, the answer to =
this question
> is simple: the maintainer makes the decision :) So I'll respin with separ=
ate binding files.
>
> The hidden unaddressed issue here is that by making these bindings separa=
te it implies
> they are not on equal footing (i.e. pre-series6 GPUs are not true "powerv=
r" and so do not
> belong in img,powervr.yaml).

No, not really. As far as I'm concerned, the only unequal footing here
is that one driver is in-tree and the other isn't, but this situation
was handled nicely for Mali GPUs and lima that used to be in the same
situation for example.

The situation is simple, really: bindings are supposed to be backward
compatible, period. If we ever make a change to that binding that isn't,
you will be well within your right to complain because your driver is
now broken.

> So if no one objects I'd also like to do the rename of that
> file as suggested before and have:
>=20
> img,powervr-sgx.yaml
> img,powervr-rogue.yaml

Sounds good to me.

Maxime

--xdjqplvcfzg6bqbd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZYP/PgAKCRDj7w1vZxhR
xecAAQCmVXhaAl7fZ7g76z9w82Bf0j4pTMmQspV3lIhk356FHgEA/xGS5jxCtd+G
824sqakZ7+v2m4QT6HsRgxUigbfQcQ8=
=eukR
-----END PGP SIGNATURE-----

--xdjqplvcfzg6bqbd--
