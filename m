Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66E261B1F01
	for <lists+dri-devel@lfdr.de>; Tue, 21 Apr 2020 08:48:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D4FF6E88B;
	Tue, 21 Apr 2020 06:48:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE3EF6E416
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Apr 2020 08:04:24 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 108DD5801A8;
 Mon, 20 Apr 2020 04:04:24 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 20 Apr 2020 04:04:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=0Kri24qKAtWKY81qyS0zWGtZ64i
 rmvGC+WYSK93rMfU=; b=uALPsmZOaL0+f9UGIFeDjKt7qZmxxJR6GHwe/TvucIz
 EBWImZ6U5oR2N0RoVF/3lDypQCEMP2rU85cvncJvwDasOPRQvFz+4eU12vj95Nw3
 FrvOSz7Bl5VEmz6HlLrVrfLVT5woporD6IP7KTaqtYxeoZw84tckDvAK0QfJPUHu
 aGmAdku18KmmavhMaxhLw6Z0DhpmWDe8WwcTHAdXfyDUQ2UhhaRtgGl2Kp87ep9g
 ki3u1KeoDvY/fiinb5plU7vIY1BHy5K/cVg0VSwM84qnuTo+ogwABrHoLgg089zT
 KRmM2n7BRq5wVSwZkDZ4b6r7oq/6wQuZZX+bY2pAb+A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=0Kri24
 qKAtWKY81qyS0zWGtZ64irmvGC+WYSK93rMfU=; b=UKlU/dT4kJV1PCUHF4y69K
 MWQMUQ3zJZjqsJ0cTi6Wmm7/E1Y4/l7ltphvIfLATz+M7mc46M+XihWWSDhnuAih
 2R0U5JTW65FTDhWbHOjv1Qeov1SSUKiRCRINA29obUgEBNvm5/N42nKpK14qVett
 4GMCqrHGfFa4r4FPqZGkg8xz7mn5KWeARoa2FmzlCpGdrVWSDt/vLmnp8D5IZIRt
 oBVzvPOVN8mue/BLiDqcoziYCrWoz+YQ6CJ2tWWnb9GCTcTzR8NGKr6iaAA5Pt0b
 IEmQZCxBkCWEh9f6zyI/+cdaoG0tPxN6PSDVL32BINxFMj6082FwODKPkpkAgI4A
 ==
X-ME-Sender: <xms:hVedXqMbFkvO3ic8WAiafn6japGnvzEIWJWReMNVoK3MaH6yU8uFgA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrgedvgdduvdejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecukfhppeeltd
 drkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
 lhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:hVedXtMrp0rp5d0lgGi9cHC9PcZoa524HbdAb-JoxdXd9kgfnWeppA>
 <xmx:hVedXsQnvBzNAoYSMtPG8GgZ347HXehCqQ9LK-dbP3tRW-wXls8b-w>
 <xmx:hVedXvAPhveWFxl6rMOWBiAviDwqYPO4iQtKeT3suORemteqWt6u7Q>
 <xmx:iFedXmEMIYxgUKcD1L7itKa2KN6E-Ix-reU6GeCwaMRn_E9s9aedNQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id C1214328006A;
 Mon, 20 Apr 2020 04:04:20 -0400 (EDT)
Date: Mon, 20 Apr 2020 10:04:19 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH v6 01/12] dt-bindings: add img, pvrsgx.yaml for
 Imagination GPUs
Message-ID: <20200420080419.yrucgndz6pblgedm@gilmour.lan>
References: <20200415101251.o3wi5t6xvf56xmhq@gilmour.lan>
 <72919514-0657-4B71-902F-3E775E528F64@goldelico.com>
 <f4fdca8a-d18c-a8d2-7f51-d1ebbbab3647@baylibre.com>
 <535CAEBE-F43E-4BFC-B989-612C81F0D7EF@goldelico.com>
 <20200415142124.yzfh6mtqq7cdq22e@gilmour.lan>
 <DC0A2DE2-3D77-46F8-8DE1-55050FDACC9B@goldelico.com>
 <20200415162151.rwym4ioqz27migfn@gilmour.lan>
 <45F411C0-150B-4FBA-A0E1-B863B3F36DF6@goldelico.com>
 <20200417102500.erayf6quenp3cvn3@gilmour.lan>
 <C8816F10-8773-4ECD-B42D-6EEF642476EB@goldelico.com>
MIME-Version: 1.0
In-Reply-To: <C8816F10-8773-4ECD-B42D-6EEF642476EB@goldelico.com>
X-Mailman-Approved-At: Tue, 21 Apr 2020 06:48:39 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 James Hogan <jhogan@kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
 linux-samsung-soc@vger.kernel.org, Paul Burton <paulburton@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Tony Lindgren <tony@atomide.com>,
 Chen-Yu Tsai <wens@csie.org>, Kukjin Kim <kgene@kernel.org>,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Philipp Rossak <embed3d@gmail.com>, openpvrsgx-devgroup@letux.org,
 linux-mips@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>,
 =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
 kernel@pyra-handheld.com,
 Discussions about the Letux Kernel <letux-kernel@openphoenux.org>
Content-Type: multipart/mixed; boundary="===============2050655022=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2050655022==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="n2wbqupykynsjuri"
Content-Disposition: inline


--n2wbqupykynsjuri
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 17, 2020 at 02:15:44PM +0200, H. Nikolaus Schaller wrote:
> > Am 17.04.2020 um 12:25 schrieb Maxime Ripard <maxime@cerno.tech>:
> > On Wed, Apr 15, 2020 at 06:42:18PM +0200, H. Nikolaus Schaller wrote:
> >>> Am 15.04.2020 um 18:21 schrieb Maxime Ripard <maxime@cerno.tech>:
> >>>=20
> >>> On Wed, Apr 15, 2020 at 05:09:45PM +0200, H. Nikolaus Schaller wrote:
> >>>> Hi Maxime,
> >>>>=20
> >>>> Hm. Yes. We know that there likely are clocks and maybe reset
> >>>> but for some SoC this seems to be undocumented and the reset
> >>>> line the VHDL of the sgx gpu provides may be permanently tied
> >>>> to "inactive".
> >>>>=20
> >>>> So if clocks are optional and not provided, a driver simply can assu=
me
> >>>> they are enabled somewhere else and does not have to care about. If
> >>>> they are specified, the driver can enable/disable them.
> >>>=20
> >>> Except that at the hardware level, the clock is always going to be
> >>> there. You can't control it, but it's there.
> >>=20
> >> Sure, we can deduce that from general hardware design knowledge.
> >> But not every detail must be described in DT. Only the important
> >> ones.
> >>=20
> >>>>> If OMAP is too much of a pain, you can also make
> >>>>> a separate binding for it, and a generic one for the rest of us.
> >>>>=20
> >>>> No, omap isn't any pain at all.
> >>>>=20
> >>>> The pain is that some other SoC are most easily defined by clocks in
> >>>> the gpu node which the omap doesn't need to explicitly specify.
> >>>>=20
> >>>> I would expect a much bigger nightmare if we split this into two
> >>>> bindings variants.
> >>>>=20
> >>>>> I'd say that it's pretty unlikely that the clocks, interrupts (and
> >>>>> even regulators) are optional. It might be fixed on some SoCs, but
> >>>>> that's up to the DT to express that using fixed clocks / regulators,
> >>>>> not the GPU binding itself.
> >>>>=20
> >>>> omap already has these defined them not to be part of the GPU bindin=
g.
> >>>> The reason seems to be that this needs special clock gating control
> >>>> especially for idle states which is beyond simple clock-enable.
> >>>>=20
> >>>> This sysc target-module@56000000 node is already merged and therefore
> >>>> we are only adding the gpu child node. Without defining clocks.
> >>>>=20
> >>>> For example:
> >>>>=20
> >>>> 		sgx_module: target-module@56000000 {
> >>>> 			compatible =3D "ti,sysc-omap4", "ti,sysc";
> >>>> 			reg =3D <0x5600fe00 0x4>,
> >>>> 			      <0x5600fe10 0x4>;
> >>>> 			reg-names =3D "rev", "sysc";
> >>>> 			ti,sysc-midle =3D <SYSC_IDLE_FORCE>,
> >>>> 					<SYSC_IDLE_NO>,
> >>>> 					<SYSC_IDLE_SMART>;
> >>>> 			ti,sysc-sidle =3D <SYSC_IDLE_FORCE>,
> >>>> 					<SYSC_IDLE_NO>,
> >>>> 					<SYSC_IDLE_SMART>;
> >>>> 			clocks =3D <&gpu_clkctrl OMAP5_GPU_CLKCTRL 0>;
> >>>> 			clock-names =3D "fck";
> >>>> 			#address-cells =3D <1>;
> >>>> 			#size-cells =3D <1>;
> >>>> 			ranges =3D <0 0x56000000 0x2000000>;
> >>>>=20
> >>>> 			gpu: gpu@0 {
> >>>> 				compatible =3D "ti,omap5-sgx544-116", "img,sgx544-116", "img,sgx=
544";
> >>>> 				reg =3D <0x0 0x10000>;
> >>>> 				interrupts =3D <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
> >>>> 			};
> >>>> 		};
> >>>>=20
> >>>> The jz4780 example will like this:
> >>>>=20
> >>>> 	gpu: gpu@13040000 {
> >>>> 		compatible =3D "ingenic,jz4780-sgx540-130", "img,sgx540-130", "img=
,sgx540";
> >>>> 		reg =3D <0x13040000 0x4000>;
> >>>>=20
> >>>> 		clocks =3D <&cgu JZ4780_CLK_GPU>;
> >>>> 		clock-names =3D "gpu";
> >>>>=20
> >>>> 		interrupt-parent =3D <&intc>;
> >>>> 		interrupts =3D <63>;
> >>>> 	};
> >>>>=20
> >>>> So the question is which one is "generic for the rest of us"?
> >>>=20
> >>> I'd say the latter.
> >>=20
> >> Why?
> >>=20
> >> TI SoC seem to be the broadest number of available users
> >> of sgx5xx in the past and nowadays. Others are more the exception.
> >=20
> > And maybe TI has some complicated stuff around the GPU that others don'=
t have?
>=20
> Looks so.
>=20
> > If I look quickly at the Allwinner stuff, I see nothing looking alike i=
n the
> > SoC, so making the binding like that for everyone just because TI did s=
omething
> > doesn't really make much sense.
>=20
> That is why I propose to make the clocks optional. This solves both
> cases in a simple and neat way.
>=20
> >=20
> >>> If your clock is optional, then you define it but don't mandate
> >>> it. Not documenting it will only result in a mess where everyone will
> >>> put some clock into it, possibly with different semantics each and
> >>> every time.
> >>=20
> >> So you mean that we should require a dummy clock for the omap gpu node
> >> or did I misunderstand that?
> >>=20
> >> Well, yes there is of course a clock connection between the
> >> omap target-module and the sgx but it is IMHO pointless to
> >> describe it because it can't and does not need to be controlled
> >> separately.
> >>=20
> >> As said the target-module is already accepted and upstream and my
> >> proposal is to get the gpu node described there. There is simply
> >> no need for a clocks node for the omap.
> >=20
> > There is no need for a clocks property *currently* *on the OMAP*.
>=20
> Yes. But why "currently"? Do you think the OMAPs we already have
> defined and tested will change?

Like I said, DVFS is likely to be one in the future.

> >> What I also assume is that developers of DTS know what they do.
> >> So the risk that there is different semantics is IMHO very low.
> >=20
> > Well, they know what they do if you document the binding. Let's say I h=
ave two
> > clocks now on my SoC, and you just document that you want a clocks prop=
erty,
> > with a generic name in clock-names like "gpu".
>=20
> Yes, that is what I want to propose for v7:
>=20
>   clocks:
>     maxItems: 1
>=20
>   clock-names:
>     maxItems: 1
>     items:
>       - const: gpu

If you document what the "gpu" clock is supposed to be.

Is it the clock for the bus (clocking the register part of the GPU), the cl=
ock
for the GPU cores? Something else?

> >> If you agree I can add the clocks/clock-names property as an
> >> optional property. This should solve omap and all others.
> >=20
> > With the above example, what clock should I put in there? In which orde=
r? This
> > isn't some random example pulled out of nowhere. The Allwinner A31 has =
(at
> > least) 4 clocks for the GPU, 1 reset line and 1 regulator, so I can onl=
y assume
> > that the GPU actually needs at least that amount to be properly integra=
ted into
> > an SoC.
>=20
> Ah, now I understand your motivation: you have access and experience with
> the A31 and you know that our proposal doesn't fit to it.

Not only the A31. If you don't document what your expectations are for a ge=
neric
component like that, every SoC will assume that your GPU clock is something
different and you won't be able to make any sense of it in your driver.

> From what I know from your description is that the A31 is quite special w=
ith
> 4 GPU clocks... Are they all really for the GPU or 3 of them for the inte=
rface
> logic (like on OMAP which separates between "functional clocks" and "inte=
rface
> clocks")? Or are there 4 groups of GPU cores with a separate clock for ea=
ch one?

1 is the equivalent of the interface clock, the others seem to be for the
functional clocks.

> So what would be your proposal for the A31 DT?
>=20
> Then I get a chance to compare DT snippets and try to make a mixture for
> the bindings.

You'd have to know the GPU to do that, and I don't.

> >>> This has nothing to do with the binding being complete. And if you use
> >>> a binding like this one, you'll be severely limited when you'll want
> >>> to implement things like DVFS.
> >>=20
> >> Now you have unhooked me... Nobody seems to know if and how DVFS can be
> >> applied to SGX. IMHO we should bake small bread first and get initial
> >> support into mainline.
> >=20
> > On the software side, yes, of course. But the discussion here doesn't h=
ave much
> > to do with software support, this is about the hardware. No matter if y=
ou enable
> > DVFS or not, you'll have those resources connected to the GPU.
> >=20
> > And if you want to enable the strict minimum in DT for now and expand i=
t later
> > as the software gains support for more stuff, then you'll have to deal =
with the
> > minimal stuff in software later-on to keep the backward compatibility.
>=20
> That is IMHO common practise everywhere. Sometimes you even have to adapt
> years old DT to new limitations of the drivers (this happened recently for
> combination of SPI and GPIO).

To some extent, yes. But those old bindings that turn out to be wrong at le=
ast
contain most infos about the hardware, even though it's incomplete or flawe=
d.
Your proposal doesn't.

> And you can still write two different drivers for a single bindings docum=
ent
> or use the .data field of the compatibility table. And I think clocks and=
 regulators
> can also be referenced by name if they are not defined in DT. This is not=
 a
> "single variety" style, but a potential solution.
>=20
> What I want to say: there are many roads to Rome.

What I want to say is: all the roads you listed above are going to be painf=
ul.
Take your time, have a generic driver running from your generic binding you=
 want
to introduce on all the SoCs you want to support, and *then* start this
discussion again.

Maxime

--n2wbqupykynsjuri
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXp1XgwAKCRDj7w1vZxhR
xYvmAP9KHUdB4quNWFa7siduKh9jQCUA3ovI+3VM4p8xzh0qPgEA+ZPetkVI8hGE
xuIp0fgwWj1NWw9tW+3i+1pkI4J16Ag=
=zM/B
-----END PGP SIGNATURE-----

--n2wbqupykynsjuri--

--===============2050655022==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2050655022==--
