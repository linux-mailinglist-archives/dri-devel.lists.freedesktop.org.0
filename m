Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C191AEB33
	for <lists+dri-devel@lfdr.de>; Sat, 18 Apr 2020 11:26:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2601E6E417;
	Sat, 18 Apr 2020 09:26:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26EB56EB88
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 10:25:11 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 745C958044A;
 Fri, 17 Apr 2020 06:25:09 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 17 Apr 2020 06:25:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=6Fjyjvm8YMRLuu1BmCR24WjceIi
 +YAIylzDdqTQnb3g=; b=wFPCXDM9IltWfPw0iWL5vGXhLWQwfrvIxIJ5jtqH5LP
 iNYeF3dY1CbSLg8g63cxYe7g7OJrsLBzRTEV+CM7JGa0yjbulxBtPRDSQ7dvGn4K
 Y20sHZhdRUBJXsE5BnNBRASZtt8Lt2js0NSTOCFn/TCPG9VYO+c3kj4ykbR2HxV5
 FhPGRUT4sRAXTH5D/OtzTvAgS/rl8rGzjv5TMcdTR2+SZ2brDNijvCrJ/BMY6TXN
 5A4D+0eIeQKvvPQ42e9SSDm78Pytcy3PFCuJUYsrkFjTgeTaD863wMI+ZBy4ezeB
 +SG/SdXTccNJcWgTsLGSNRcmJIN0CRbG/fM5Xl7AsMg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=6Fjyjv
 m8YMRLuu1BmCR24WjceIi+YAIylzDdqTQnb3g=; b=AhWcqSBkWGz1YpKq4MYJZo
 a8nVeBhj8xS8Buguy6hDjd6IBa78G/FiJgIAbZIgu5KDP7HiVEJi2TidZxs+5gLF
 Y6BnyqZ1NuYsU22cO5nD8JhddlpqDW97r7w7/Adw+THs+MkqCOXtezggmHoa2awd
 vDWtHFMlTEXbzz8uaU0xPOXmnd4a/lieArch2a+dUpKV4uWJHD8+aZkrKFscMGhX
 45iIyT/IS3zXi12CGaaCxtCDmmmGnp7DUXhmW+AF7XEwBCk/0k6gixXN+eR+W0/C
 9h69MyD3jfgO9mdKsK6eUWr+HmMMGPxPtTuqVYUkFJqh+PwAMd/VMpbPFAY/8/7w
 ==
X-ME-Sender: <xms:_4OZXosKlW7Ziqa003eVVSDn-106QkPYgwtuzwnZBYp4KK8ICSRULg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrfeejgddvkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucfkphepledtrd
 ekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
 fhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:_4OZXsmQMbKzP6LsNMhzeUAWwm3Cj8oobZnq-LaWcg3Uk5z4DvDVkQ>
 <xmx:_4OZXmK4VR4Xxb523QGjyKeiCfxgYgl0IPU2KNe2NVn5i5Y1QLo2tg>
 <xmx:_4OZXk5436EodZEHPNEmPz7zqYFElXz76kJkCO0Qf2PbPpL6S_dq7A>
 <xmx:BYSZXntJ4j6vhjl9_WHrQ3dw04z48QodLpsvUEblcIDFocYkKxBhLg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 48A393280066;
 Fri, 17 Apr 2020 06:25:03 -0400 (EDT)
Date: Fri, 17 Apr 2020 12:25:00 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH v6 01/12] dt-bindings: add img, pvrsgx.yaml for
 Imagination GPUs
Message-ID: <20200417102500.erayf6quenp3cvn3@gilmour.lan>
References: <cover.1586939718.git.hns@goldelico.com>
 <06fb6569259bb9183d0a0d0fe70ec4f3033b8aab.1586939718.git.hns@goldelico.com>
 <20200415101251.o3wi5t6xvf56xmhq@gilmour.lan>
 <72919514-0657-4B71-902F-3E775E528F64@goldelico.com>
 <f4fdca8a-d18c-a8d2-7f51-d1ebbbab3647@baylibre.com>
 <535CAEBE-F43E-4BFC-B989-612C81F0D7EF@goldelico.com>
 <20200415142124.yzfh6mtqq7cdq22e@gilmour.lan>
 <DC0A2DE2-3D77-46F8-8DE1-55050FDACC9B@goldelico.com>
 <20200415162151.rwym4ioqz27migfn@gilmour.lan>
 <45F411C0-150B-4FBA-A0E1-B863B3F36DF6@goldelico.com>
MIME-Version: 1.0
In-Reply-To: <45F411C0-150B-4FBA-A0E1-B863B3F36DF6@goldelico.com>
X-Mailman-Approved-At: Sat, 18 Apr 2020 09:26:15 +0000
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
 James Hogan <jhogan@kernel.org>, dri-devel@lists.freedesktop.org,
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
 kernel@pyra-handheld.com, letux-kernel@openphoenux.org
Content-Type: multipart/mixed; boundary="===============0830111245=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0830111245==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2cdcxbvig57yd3pf"
Content-Disposition: inline


--2cdcxbvig57yd3pf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Apr 15, 2020 at 06:42:18PM +0200, H. Nikolaus Schaller wrote:
> > Am 15.04.2020 um 18:21 schrieb Maxime Ripard <maxime@cerno.tech>:
> >=20
> > On Wed, Apr 15, 2020 at 05:09:45PM +0200, H. Nikolaus Schaller wrote:
> >> Hi Maxime,
> >>=20
> >> Hm. Yes. We know that there likely are clocks and maybe reset
> >> but for some SoC this seems to be undocumented and the reset
> >> line the VHDL of the sgx gpu provides may be permanently tied
> >> to "inactive".
> >>=20
> >> So if clocks are optional and not provided, a driver simply can assume
> >> they are enabled somewhere else and does not have to care about. If
> >> they are specified, the driver can enable/disable them.
> >=20
> > Except that at the hardware level, the clock is always going to be
> > there. You can't control it, but it's there.
>=20
> Sure, we can deduce that from general hardware design knowledge.
> But not every detail must be described in DT. Only the important
> ones.
>=20
> >>> If OMAP is too much of a pain, you can also make
> >>> a separate binding for it, and a generic one for the rest of us.
> >>=20
> >> No, omap isn't any pain at all.
> >>=20
> >> The pain is that some other SoC are most easily defined by clocks in
> >> the gpu node which the omap doesn't need to explicitly specify.
> >>=20
> >> I would expect a much bigger nightmare if we split this into two
> >> bindings variants.
> >>=20
> >>> I'd say that it's pretty unlikely that the clocks, interrupts (and
> >>> even regulators) are optional. It might be fixed on some SoCs, but
> >>> that's up to the DT to express that using fixed clocks / regulators,
> >>> not the GPU binding itself.
> >>=20
> >> omap already has these defined them not to be part of the GPU binding.
> >> The reason seems to be that this needs special clock gating control
> >> especially for idle states which is beyond simple clock-enable.
> >>=20
> >> This sysc target-module@56000000 node is already merged and therefore
> >> we are only adding the gpu child node. Without defining clocks.
> >>=20
> >> For example:
> >>=20
> >> 		sgx_module: target-module@56000000 {
> >> 			compatible =3D "ti,sysc-omap4", "ti,sysc";
> >> 			reg =3D <0x5600fe00 0x4>,
> >> 			      <0x5600fe10 0x4>;
> >> 			reg-names =3D "rev", "sysc";
> >> 			ti,sysc-midle =3D <SYSC_IDLE_FORCE>,
> >> 					<SYSC_IDLE_NO>,
> >> 					<SYSC_IDLE_SMART>;
> >> 			ti,sysc-sidle =3D <SYSC_IDLE_FORCE>,
> >> 					<SYSC_IDLE_NO>,
> >> 					<SYSC_IDLE_SMART>;
> >> 			clocks =3D <&gpu_clkctrl OMAP5_GPU_CLKCTRL 0>;
> >> 			clock-names =3D "fck";
> >> 			#address-cells =3D <1>;
> >> 			#size-cells =3D <1>;
> >> 			ranges =3D <0 0x56000000 0x2000000>;
> >>=20
> >> 			gpu: gpu@0 {
> >> 				compatible =3D "ti,omap5-sgx544-116", "img,sgx544-116", "img,sgx54=
4";
> >> 				reg =3D <0x0 0x10000>;
> >> 				interrupts =3D <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
> >> 			};
> >> 		};
> >>=20
> >> The jz4780 example will like this:
> >>=20
> >> 	gpu: gpu@13040000 {
> >> 		compatible =3D "ingenic,jz4780-sgx540-130", "img,sgx540-130", "img,s=
gx540";
> >> 		reg =3D <0x13040000 0x4000>;
> >>=20
> >> 		clocks =3D <&cgu JZ4780_CLK_GPU>;
> >> 		clock-names =3D "gpu";
> >>=20
> >> 		interrupt-parent =3D <&intc>;
> >> 		interrupts =3D <63>;
> >> 	};
> >>=20
> >> So the question is which one is "generic for the rest of us"?
> >=20
> > I'd say the latter.
>=20
> Why?
>=20
> TI SoC seem to be the broadest number of available users
> of sgx5xx in the past and nowadays. Others are more the exception.

And maybe TI has some complicated stuff around the GPU that others don't ha=
ve?
If I look quickly at the Allwinner stuff, I see nothing looking alike in the
SoC, so making the binding like that for everyone just because TI did somet=
hing
doesn't really make much sense.

> > If your clock is optional, then you define it but don't mandate
> > it. Not documenting it will only result in a mess where everyone will
> > put some clock into it, possibly with different semantics each and
> > every time.
>=20
> So you mean that we should require a dummy clock for the omap gpu node
> or did I misunderstand that?
>
> Well, yes there is of course a clock connection between the
> omap target-module and the sgx but it is IMHO pointless to
> describe it because it can't and does not need to be controlled
> separately.
>=20
> As said the target-module is already accepted and upstream and my
> proposal is to get the gpu node described there. There is simply
> no need for a clocks node for the omap.

There is no need for a clocks property *currently* *on the OMAP*.

> What I also assume is that developers of DTS know what they do.
> So the risk that there is different semantics is IMHO very low.

Well, they know what they do if you document the binding. Let's say I have =
two
clocks now on my SoC, and you just document that you want a clocks property,
with a generic name in clock-names like "gpu".

> If you agree I can add the clocks/clock-names property as an
> optional property. This should solve omap and all others.

With the above example, what clock should I put in there? In which order? T=
his
isn't some random example pulled out of nowhere. The Allwinner A31 has (at
least) 4 clocks for the GPU, 1 reset line and 1 regulator, so I can only as=
sume
that the GPU actually needs at least that amount to be properly integrated =
into
an SoC.

This has nothing to do with being dumb or smart.

> > This has nothing to do with the binding being complete. And if you use
> > a binding like this one, you'll be severely limited when you'll want
> > to implement things like DVFS.
>=20
> Now you have unhooked me... Nobody seems to know if and how DVFS can be
> applied to SGX. IMHO we should bake small bread first and get initial
> support into mainline.

On the software side, yes, of course. But the discussion here doesn't have =
much
to do with software support, this is about the hardware. No matter if you e=
nable
DVFS or not, you'll have those resources connected to the GPU.

And if you want to enable the strict minimum in DT for now and expand it la=
ter
as the software gains support for more stuff, then you'll have to deal with=
 the
minimal stuff in software later-on to keep the backward compatibility.

But given that the current state on the Allwinner SoCs (at least) is that y=
ou
can't even read a register, it might be a good idea to delay the introducti=
on of
that binding until you have something that works to avoid drowning under the
number of special cases to deal with backward compatibility.

Maxime

--2cdcxbvig57yd3pf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXpmD/AAKCRDj7w1vZxhR
xS+DAQD1ud+4u/Gtzw+YK29b+79bwdplPbylCn4JhitPCi+ezgEAgOxiTpYRh+GB
1bgxLBKhqARErScbQPmvn22AzLAomAY=
=Hsz5
-----END PGP SIGNATURE-----

--2cdcxbvig57yd3pf--

--===============0830111245==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0830111245==--
