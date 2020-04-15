Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE1FD1AB8F6
	for <lists+dri-devel@lfdr.de>; Thu, 16 Apr 2020 08:59:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A20E6EAE7;
	Thu, 16 Apr 2020 06:59:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 175996EA2B
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 16:21:57 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 3E027580133;
 Wed, 15 Apr 2020 12:21:55 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 15 Apr 2020 12:21:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=u9scvMZX0d04Kn3R0y+CYoy7IVW
 oF9BUIBhBMZ7xTQ4=; b=MTTjB7zbrBmqyMSWXv7QRhsmX2Q1vGgqO+YM7nHlyCz
 C1LNlyMorpxShEuJf2md4RxGK5nIGMKIcj6UroWHCoPMTZu2UZ1ZyWBcak71X57N
 bkCkS/SzxYxu3YP7dvK+R7C4J5j9sDlloifFD2Uny8p2t05p2OeyYQuMmppF80qv
 8UFAjNPuLiqCbBTrsY9wM/Oftztaw+6yI00noEzhHgbKDGIfLJI/fTLSQCkOLg0N
 Po90TKLlEJpDqyWTPaq+V3LPX1g3IGW0DSwranqmS4w0rr2q1hm3UUsTUIFYTmj1
 MPFdzeC65CKFW7CG3Z4SZ2PxMA3aOgLiGdShESqWBhA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=u9scvM
 ZX0d04Kn3R0y+CYoy7IVWoF9BUIBhBMZ7xTQ4=; b=VW+8LawDZdtk7jKnlusa8f
 0j0jUmRLsYCwbK6kqpfjHSPVbujw7FvpOjCiVzfg8PRdVY2igHyC0ffQ8Qs9CXI1
 6MaPtRW2y/VN1k1eKp7tX/503/m4whChKErTvNnwmlCB0qxBCt28TKnKE8Q5LBCD
 AJo4Zkfww+08FJ1kXQ6Tr1CdcxiWGRqCHfaLGfPy4HtRjpsW4a8y5cvzgZuNHYUM
 ufmUGKTz/SbpHvcomPx07lVUa06GkJnL73PjwH5CbRzCgZQwpkucTecpCPop1SEz
 X5ooxv+wfX+XCW7vHwMyz4i8+sgtAwql3AW++j2ZS1UpvvGggsD/54zLlNumMO/g
 ==
X-ME-Sender: <xms:oTSXXoIWnMvlqGVy8AaStKXEUhQPrkvTcQ86pmg8HWSqUs3uANtqTg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrfeefgdeltdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucfkphepledtrd
 ekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
 fhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:oTSXXsZWqwp5ohe7OpVmOzP-_EQI_bDpXSWr2pKmZzhJrg7nq6Qo7Q>
 <xmx:oTSXXjvDHO9_QmqdCkTjvg2-Zj78oQPE0lPP4iy7yWuuzc3-0kQdkw>
 <xmx:oTSXXpsrCdreATG0MCLBoDdeITl5U9d7Josa7Th3OY0r4Lnm0pgXKw>
 <xmx:ozSXXtSsjCJYztWsp3i-3gOwsHTwJ-4VBerx14NJRu-GtrkbjDF6bw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id D563D3280066;
 Wed, 15 Apr 2020 12:21:52 -0400 (EDT)
Date: Wed, 15 Apr 2020 18:21:51 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH v6 01/12] dt-bindings: add img, pvrsgx.yaml for
 Imagination GPUs
Message-ID: <20200415162151.rwym4ioqz27migfn@gilmour.lan>
References: <cover.1586939718.git.hns@goldelico.com>
 <06fb6569259bb9183d0a0d0fe70ec4f3033b8aab.1586939718.git.hns@goldelico.com>
 <20200415101251.o3wi5t6xvf56xmhq@gilmour.lan>
 <72919514-0657-4B71-902F-3E775E528F64@goldelico.com>
 <f4fdca8a-d18c-a8d2-7f51-d1ebbbab3647@baylibre.com>
 <535CAEBE-F43E-4BFC-B989-612C81F0D7EF@goldelico.com>
 <20200415142124.yzfh6mtqq7cdq22e@gilmour.lan>
 <DC0A2DE2-3D77-46F8-8DE1-55050FDACC9B@goldelico.com>
MIME-Version: 1.0
In-Reply-To: <DC0A2DE2-3D77-46F8-8DE1-55050FDACC9B@goldelico.com>
X-Mailman-Approved-At: Thu, 16 Apr 2020 06:59:07 +0000
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
Content-Type: multipart/mixed; boundary="===============1707226718=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1707226718==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tfobgrwcfdirkzal"
Content-Disposition: inline


--tfobgrwcfdirkzal
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 15, 2020 at 05:09:45PM +0200, H. Nikolaus Schaller wrote:
> Hi Maxime,
>
> > Am 15.04.2020 um 16:21 schrieb Maxime Ripard <maxime@cerno.tech>:
> >
> >>
> >> Well we could add clocks and resets as optional but that would
> >> allow to wrongly define omap.
> >>
> >> Or delegate them to a parent "simple-pm-bus" node.
> >>
> >> I have to study that material more to understand what you seem
> >> to expect.
> >
> > The thing is, once that binding is in, it has to be backward
> > compatible. So every thing that you leave out is something that you'll
> > need to support in the driver eventually.
>
> >
> > If you don't want it to be a complete nightmare, you'll want to figure
> > out as much as possible on how the GPU is integrated and make a
> > binding out of that.
>
> Hm. Yes. We know that there likely are clocks and maybe reset
> but for some SoC this seems to be undocumented and the reset
> line the VHDL of the sgx gpu provides may be permanently tied
> to "inactive".
>
> So if clocks are optional and not provided, a driver simply can assume
> they are enabled somewhere else and does not have to care about. If
> they are specified, the driver can enable/disable them.

Except that at the hardware level, the clock is always going to be
there. You can't control it, but it's there.

> > If OMAP is too much of a pain, you can also make
> > a separate binding for it, and a generic one for the rest of us.
>
> No, omap isn't any pain at all.
>
> The pain is that some other SoC are most easily defined by clocks in
> the gpu node which the omap doesn't need to explicitly specify.
>
> I would expect a much bigger nightmare if we split this into two
> bindings variants.
>
> > I'd say that it's pretty unlikely that the clocks, interrupts (and
> > even regulators) are optional. It might be fixed on some SoCs, but
> > that's up to the DT to express that using fixed clocks / regulators,
> > not the GPU binding itself.
>
> omap already has these defined them not to be part of the GPU binding.
> The reason seems to be that this needs special clock gating control
> especially for idle states which is beyond simple clock-enable.
>
> This sysc target-module@56000000 node is already merged and therefore
> we are only adding the gpu child node. Without defining clocks.
>
> For example:
>
> 		sgx_module: target-module@56000000 {
> 			compatible = "ti,sysc-omap4", "ti,sysc";
> 			reg = <0x5600fe00 0x4>,
> 			      <0x5600fe10 0x4>;
> 			reg-names = "rev", "sysc";
> 			ti,sysc-midle = <SYSC_IDLE_FORCE>,
> 					<SYSC_IDLE_NO>,
> 					<SYSC_IDLE_SMART>;
> 			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
> 					<SYSC_IDLE_NO>,
> 					<SYSC_IDLE_SMART>;
> 			clocks = <&gpu_clkctrl OMAP5_GPU_CLKCTRL 0>;
> 			clock-names = "fck";
> 			#address-cells = <1>;
> 			#size-cells = <1>;
> 			ranges = <0 0x56000000 0x2000000>;
>
> 			gpu: gpu@0 {
> 				compatible = "ti,omap5-sgx544-116", "img,sgx544-116", "img,sgx544";
> 				reg = <0x0 0x10000>;
> 				interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
> 			};
> 		};
>
> The jz4780 example will like this:
>
> 	gpu: gpu@13040000 {
> 		compatible = "ingenic,jz4780-sgx540-130", "img,sgx540-130", "img,sgx540";
> 		reg = <0x13040000 0x4000>;
>
> 		clocks = <&cgu JZ4780_CLK_GPU>;
> 		clock-names = "gpu";
>
> 		interrupt-parent = <&intc>;
> 		interrupts = <63>;
> 	};
>
> So the question is which one is "generic for the rest of us"?

I'd say the latter.

> And how can we make a single binding for the sgx. Not one for each
> special SoC variant that may exist.
>
> IMHO the best answer is to make clocks an optional property.
> Or if we do not want to define them explicitly, we use
> additionalProperties: true.

If your clock is optional, then you define it but don't mandate
it. Not documenting it will only result in a mess where everyone will
put some clock into it, possibly with different semantics each and
every time.

> An alternative could be to use a simple-pm-bus like:
>
> 	sgx_module: sgx_module@13040000 {
> 		compatible = "simple-pm-bus";
>
> 		clocks = <&cgu JZ4780_CLK_GPU>;
> 		clock-names = "gpu";
>
> 		#address-cells = <1>;
> 		#size-cells = <1>;
> 		ranges = <0 0x13040000 0x10000>;
>
> 		gpu: gpu@0 {
> 			compatible = "ingenic,jz4780-sgx540-130", "img,sgx540-130", "img,sgx540";
> 			reg = <0x0 0x4000>;
>
> 			interrupt-parent = <&intc>;
> 			interrupts = <63>;
> 		};
> 	};
>
> This gets rid of any clock, reset and pm definitions for the sgx bindings.
> But how this is done is outside this sgx bindings.
>
> With such a scheme, the binding I propose here would be complete and fully
> generic. We can even add additionalProperties: false.

This has nothing to do with the binding being complete. And if you use
a binding like this one, you'll be severely limited when you'll want
to implement things like DVFS.

Maxime

--tfobgrwcfdirkzal
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXpc0nwAKCRDj7w1vZxhR
xUDXAQCc7y/+vAoavZRmglq4lR2jquJFLRkH7PYZvWPuzBNdAAD/cb0ol1cdNUpA
oCJwB2WILZ+2E78cCeIXmjyL7nqW6AA=
=GQ1H
-----END PGP SIGNATURE-----

--tfobgrwcfdirkzal--

--===============1707226718==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1707226718==--
