Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6683F81B0D9
	for <lists+dri-devel@lfdr.de>; Thu, 21 Dec 2023 09:59:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA6A910E32C;
	Thu, 21 Dec 2023 08:59:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55B7E10E32C
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Dec 2023 08:59:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 1BE2FCE1D5C;
 Thu, 21 Dec 2023 08:58:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1671C433C8;
 Thu, 21 Dec 2023 08:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1703149136;
 bh=wm1PdQNBEorVmceg+YsKLt+qojEwDpCAuzfzZgHVPgE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VigeQnGAvfmjN1u9Rrte0ikdLP8ceGGjw8Is02oIVlhEtVlzAbWrmwsKtby8x308u
 2krFnQHVp1O4cm1aa1JE4uAPUuE8+hf6EFP/zrmSy3o/vcqKbAoov58W4fWhkF0f0f
 bGCT5uDgSpcu2gOyddd1xZELcbRHGsWRqhkOpHh/cMGZWOcX69DHMaqT8MTv4PF9FS
 w9UBSRNz6CRuSLrhl8L5FdtjxrZCnyY74iMVcleiK0Zsp4IKYSuH6fzbAl6dbD3TgX
 U2u0z0H8KtqM7UHaXfLjnf+73p5B3856lJiwZA7GBJNtdvEbXtxycchxCdcBdLaXfV
 aHRQ406P7hitw==
Date: Thu, 21 Dec 2023 09:58:53 +0100
From: Maxime Ripard <mripard@kernel.org>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH RFC 01/10] dt-bindings: gpu: Add PowerVR Series5 SGX GPUs
Message-ID: <nzqeqwof44e3nxjz6lsxmxcfh235unbu343br45esxh6vinskp@xvjydpxhvsuk>
References: <23livt5mcc64bb6lkeec2uxp5cyn4wfekwaj6wzrjnrkndvwgj@6tveqglqpr4v>
 <B3A1B8A7-0363-4ECB-AFBF-576FECA569FA@goldelico.com>
 <vawv2mwhonuyvgmp7uox4rfgdcjwg5fa7hmbcfgl3wiase6e4p@tyavpclppfvu>
 <6BC60156-89E2-4734-BD00-B49A9A6C1D7A@goldelico.com>
 <6gpehpoz54f5lxhmvirqbfwmq7dpgiroy27cljpvu66wtn7aqy@lgrh7wysyxnp>
 <D8AB6CC4-DCA5-40DD-A311-94A16FF59254@goldelico.com>
 <oobcl2kfsuph27er7rflfqvt3lu6athufomxv5chf3uctx4emh@x6rzjtlskhbf>
 <F58855EC-D87D-4747-A363-0E7AA5DB1AEC@goldelico.com>
 <22cny5aumc5wafsrjd3j55zcjbjf2viip64kfbjiqis2grtd6t@wg5dxeuzil6l>
 <3E03E913-48E1-49EC-A6C9-EAC1612E65E7@goldelico.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="cuiar5zluuku2kr2"
Content-Disposition: inline
In-Reply-To: <3E03E913-48E1-49EC-A6C9-EAC1612E65E7@goldelico.com>
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
 =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
 Matt Coster <matt.coster@imgtec.com>, Rob Herring <robh+dt@kernel.org>,
 linux-omap@vger.kernel.org, Adam Ford <aford173@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Tero Kristo <kristo@kernel.org>,
 linux-kernel@vger.kernel.org, Andrew Davis <afd@ti.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--cuiar5zluuku2kr2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 18, 2023 at 11:54:47AM +0100, H. Nikolaus Schaller wrote:
>=20
>=20
> > Am 18.12.2023 um 11:14 schrieb Maxime Ripard <mripard@kernel.org>:
> >=20
> > On Mon, Dec 18, 2023 at 10:28:09AM +0100, H. Nikolaus Schaller wrote:
> >> Hi Maxime,
> >>=20
> >>> Am 15.12.2023 um 14:33 schrieb Maxime Ripard <mripard@kernel.org>:
> >>>=20
> >>>>>=20
> >>>>> It's for a separate architecture, with a separate driver, maintaine=
d out
> >>>>> of tree by a separate community, with a separate set of requirement=
s as
> >>>>> evidenced by the other thread. And that's all fine in itself, but
> >>>>> there's very little reason to put these two bindings in the same fi=
le.
> >>>>>=20
> >>>>> We could also turn this around, why is it important that it's in the
> >>>>> same file?
> >>>>=20
> >>>> Same vendor. And enough similarity in architectures, even a logical =
sequence
> >>>> of development of versions (SGX =3D Version 5, Rogue =3D Version 6+)=
 behind.
> >>>> (SGX and Rogue seem to be just trade names for their architecture de=
velopment).
> >>>=20
> >>> Again, none of that matters for *where* the binding is stored.
> >>=20
> >> So what then speaks against extending the existing bindings file as pr=
oposed
> >> here?
> >=20
> > I mean, apart from everything you quoted, then sure, nothing speaks
> > against it.
> >=20
> >>>> AFAIK bindings should describe hardware and not communities or drive=
rs
> >>>> or who is currently maintaining it. The latter can change, the first=
 not.
> >>>=20
> >>> Bindings are supposed to describe hardware indeed. Nothing was ever s=
aid
> >>> about where those bindings are supposed to be located.
> >>>=20
> >>> There's hundreds of other YAML bindings describing devices of the same
> >>> vendors and different devices from the same generation.
> >>=20
> >> Usually SoC seem to be split over multiple files by subsystem. Not by =
versions
> >> or generations. If the subsystems are similar enough they share the sa=
me bindings
> >> doc instead of having one for each generation duplicating a lot of cod=
e.
> >>=20
> >> Here is a comparable example that combines multiple vendors and genera=
tions:
> >>=20
> >> Documentation/devicetree/bindings/usb/generic-ehci.yaml
> >=20
> > EHCI is a single interface for USB2.0 controllers. It's a standard API,
> > and is made of a single driver that requires minor modifications to deal
> > with multiple devices.
> >=20
> > We're very far from the same situation here.
>=20
> How far are we really?

There's one binding for one driver. You suggest one binding for two drivers.

> And, it is the purpose of the driver to handle different cases.
>=20
> That there are currently two drivers is just a matter of history and
> not a necessity.

Cool, so what you're saying is that your plan is to support those GPUs
upstream in the imagination driver?

I guess we should delay this patch until we see that series then.

> >>> If anything it'll make it easier for you. I'm really not sure why it =
is
> >>> controversial and you're fighting this so hard.
> >>=20
> >> Well, you made it controversial by proposing to split what IMHO belong=
s together.
> >=20
> > No, reviews aren't controversial.
> > The controversy started when you chose
> > to oppose it while you could have just rolled with it.
>=20
> Well, you asked
>=20
> "I think it would be best to have a separate file for this, img,sgx.yaml
> maybe?"
>=20
> and
>=20
> "Because it's more convenient?"
>=20
> I understood that as an invitation for discussing the pros and cons
> and working out the most convenient solution. And that involves
> playing the devil's advocate which of course is controversial by
> principle.
>=20
> Now, IMHO all the pros and cons are on the table and the question is
> who makes a decision how to go.

You haven't listed any pro so far, you're claiming that the one I raise
are irrelevant.

> >> I feel that the original patch is good enough for its purpose and foll=
ows
> >> some design pattern that can be deduced from other binding docs.
> >=20
> > [citation needed]
>=20
> Joke: Documentation/devicetree/bindings/* - I am not aware of a formal an=
alysis of course.
>=20
> But see my example for ehci. It follows the pattern I mean. If clocks, re=
gs, interrupts,
> resets, and more properties are (almost) the same, then group them and ju=
st differentiate
> by different compatible strings.

Again, EHCI is not something you can compare to. It's a binding to
support a standard interface. You don't have the same interface and your
driver will need to be different.

And more importantly: bindings are meant to describe the hardware
itself. How it's supported in Linux is irrelevant to the discussion.

So, we could have: 10 drivers for the same binding, or 1 driver for 10
bindings. The two notions are orthogonal.

> If necessary use some - if: clauses.
>=20
> It is the task of drivers to handle the details.
>
> As my other (maybe more important) comment to this patch did indicate we =
IMHO can easily
> live with something like
>=20
> +      - items:
> +          - enum:
> +              - ti,am62-gpu # IMG AXE GPU model/revision is fully discov=
erable
> +              - ti,omap3430-gpu # sgx530 Rev 121
> +              - ti,omap3630-gpu # sgx530 Rev 125
> +              - ingenic,jz4780-gpu # sgx540 Rev 130
> +              - ti,omap4430-gpu # sgx540 Rev 120
> +              - allwinner,sun6i-a31-gpu # sgx544 MP2 Rev 115
> +              - ti,omap4470-gpu # sgx544 MP1 Rev 112
> +              - ti,omap5432-gpu # sgx544 MP2 Rev 105
> +              - ti,am5728-gpu # sgx544 MP2 Rev 116
> +              - ti,am6548-gpu # sgx544 MP1 Rev 117
>=20
> And leave it to drivers using a table to deduce the generation and
> revision or read it out from the chip. And there can even be different
> drivers handling only a subset of the potential compatibles.
>=20
> Then the currently-out-of-tree driver for the sgx5 can be reworked in
> less than half an hour without loosing functionality.

Again, you're making it harder than it needs to be for no particular
reason other than the potential file name clash that can be addressed.

Maxime

--cuiar5zluuku2kr2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZYP+RAAKCRDj7w1vZxhR
xXV6AQDDDrZBXTND+ZA5tJYZObZh1JN/uWCGtddmC+cdKRRazAD/TBl0erAktvMo
xAQxFlpjvE94vKEMqz+0P/uaY9m2fQQ=
=z99/
-----END PGP SIGNATURE-----

--cuiar5zluuku2kr2--
