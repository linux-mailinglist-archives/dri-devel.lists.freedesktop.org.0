Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8143C1BF193
	for <lists+dri-devel@lfdr.de>; Thu, 30 Apr 2020 09:33:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16F5C6EB76;
	Thu, 30 Apr 2020 07:33:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2E736EA88
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Apr 2020 08:47:35 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 9AB75580104;
 Wed, 29 Apr 2020 04:47:30 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 29 Apr 2020 04:47:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=+x1hnvO451DFLw58Xq3iUsbF2Jz
 alXMCx3P3fGnFW08=; b=mDylNO0ImdJQcBjcJhxqGwZ0gLH65YlOxSjvQREEP3f
 4qGYzmConM9HkJufYMjsnhf4/U5f/nMYa7Y4bpNHEPZRGxnLHIjQiWjERglE53zA
 oKMD/cPGAwRaPGqCJ5/SiN46qyNsjQGFSvMny9nDQB6IkO1SJfBgD9EdtiaVDZ7d
 A/0pbA75VQ1czsx3Ud3zZ0Ct1tM7dRs5LdgkX5nrL4wlzG5WiI+zMV3YRbG6e9lU
 EfEjiSIOEGi0F1dFrhGkZzyaX9IhNnWJBcdmGy3kakaIYmrgYV2DTu3hhEr3UJ+B
 5cyi95cQhZgjntybSHnjxI/ELKDeyPR6wO+DmEdIyNQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=+x1hnv
 O451DFLw58Xq3iUsbF2JzalXMCx3P3fGnFW08=; b=E2GG4YtpPx9b335eVlOleh
 Vf8483NTNxzjs95yfN4uRYnvVs2tiKuUvRyMMVSInBLyjh+qMlQ0dVtjSwJbsDUK
 WQWtSA+Bwb1TRuouQ6Rb6pdXfGYF71YpiWoLMMd4B0/gUi2rfcg5JorfqN0JJssQ
 b5NszxFBVjt1AJHxC1DJ+KMryBcTxX33yCPmx9xaU+gujbvcPTEUhLLXynjJE6yy
 miqhu3mWUKdKBcCgKILcyM6xOfgqmO5G1ZTnt75gOcYXtIUlupWdCgLceHSTqR8Q
 BUigUlYpBZcCXoJnGIlSKCLjDvyVjMLksV6GI/iUupM/vJJdPxnutvDdSf42SJBQ
 ==
X-ME-Sender: <xms:HT-pXhpN54g-6aCMfmUe-4DMD6dWLtA3usgSR6go2S5ER7rxsPhAww>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrieefgddtkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtudenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucfkphepledtrd
 ekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
 fhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:HT-pXrVffufAEMQkyDUZKoQp7m4gU6WDQH-928szCVw6XspkjR09Bw>
 <xmx:HT-pXkD0RZGaxlLx-cC-xX6d0cZb-LFHZKS3nww8to01I-3FCcWuVg>
 <xmx:HT-pXuTBDDqX0KhTqh3gFz8BYE7BbY0XahpKNhyToXMGSNRpH-Z_Jw>
 <xmx:Ij-pXvat0UK807ynw6DTDs5CBzCYKJ5Cy3QP0hnPHBSOnNjslvCryA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id D9FE03280066;
 Wed, 29 Apr 2020 04:47:24 -0400 (EDT)
Date: Wed, 29 Apr 2020 10:47:23 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Jonathan Bakker <xc-racer2@live.ca>
Subject: Re: [PATCH v7 08/12] arm: dts: s5pv210: Add node for SGX 540
Message-ID: <20200429084723.jxybvsakniinvivt@gilmour.lan>
References: <cover.1587760454.git.hns@goldelico.com>
 <3fd18c747426e15fd1f3500b9c4adce2db9ddd0c.1587760454.git.hns@goldelico.com>
 <NYBE9Q.YH08US7A7DC3@crapouillou.net>
 <BN6PR04MB0660A180D2069848E5C03D7EA3AE0@BN6PR04MB0660.namprd04.prod.outlook.com>
 <20200427154617.GA1798@pi3>
 <BN6PR04MB06605F014024061C894AFBA4A3AC0@BN6PR04MB0660.namprd04.prod.outlook.com>
 <BN6PR04MB0660044B5B1D45BE4CBCD2AAA3AC0@BN6PR04MB0660.namprd04.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <BN6PR04MB0660044B5B1D45BE4CBCD2AAA3AC0@BN6PR04MB0660.namprd04.prod.outlook.com>
X-Mailman-Approved-At: Thu, 30 Apr 2020 07:31:56 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, David Airlie <airlied@linux.ie>,
 "H. Nikolaus Schaller" <hns@goldelico.com>, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
 linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org,
 Paul Burton <paulburton@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Tony Lindgren <tony@atomide.com>, Chen-Yu Tsai <wens@csie.org>,
 Kukjin Kim <kgene@kernel.org>, James Hogan <jhogan@kernel.org>,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 letux-kernel@openphoenux.org, linux-arm-kernel@lists.infradead.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Philipp Rossak <embed3d@gmail.com>, openpvrsgx-devgroup@letux.org,
 linux-kernel@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>,
 =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
 kernel@pyra-handheld.com
Content-Type: multipart/mixed; boundary="===============0567165274=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0567165274==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="u22eiu3zouiknukx"
Content-Disposition: inline


--u22eiu3zouiknukx
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Apr 28, 2020 at 03:58:03PM -0700, Jonathan Bakker wrote:
> On 2020-04-28 2:39 p.m., Jonathan Bakker wrote:
> > On 2020-04-27 8:46 a.m., Krzysztof Kozlowski wrote:
> >> On Sun, Apr 26, 2020 at 07:57:12AM -0700, Jonathan Bakker wrote:
> >>> Hi Paul,
> >>>
> >>> On 2020-04-26 5:56 a.m., Paul Cercueil wrote:
> >>>>
> >>>>
> >>>> Le ven. 24 avril 2020 =E0 22:34, H. Nikolaus Schaller <hns@goldelico=
=2Ecom> a =E9crit :
> >>>>> From: Jonathan Bakker <xc-racer2@live.ca>
> >>>>>
> >>>>> All s5pv210 devices have a PowerVR SGX 540 (revision 120) attached.
> >>>>>
> >>>>> There is no external regulator for it so it can be enabled by defau=
lt.
> >>>>>
> >>>>> Signed-off-by: Jonathan Bakker <xc-racer2@live.ca>
> >>>>> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> >>>>> ---
> >>>>> =A0arch/arm/boot/dts/s5pv210.dtsi | 13 +++++++++++++
> >>>>> =A01 file changed, 13 insertions(+)
> >>>>>
> >>>>> diff --git a/arch/arm/boot/dts/s5pv210.dtsi b/arch/arm/boot/dts/s5p=
v210.dtsi
> >>>>> index 2ad642f51fd9..abbdda205c1b 100644
> >>>>> --- a/arch/arm/boot/dts/s5pv210.dtsi
> >>>>> +++ b/arch/arm/boot/dts/s5pv210.dtsi
> >>>>> @@ -512,6 +512,19 @@ vic3: interrupt-controller@f2300000 {
> >>>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 #interrupt-cells =3D <1>;
> >>>>> =A0=A0=A0=A0=A0=A0=A0=A0 };
> >>>>>
> >>>>> +=A0=A0=A0=A0=A0=A0=A0 gpu: gpu@f3000000 {
> >>>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 compatible =3D "samsung,s5pv210-=
sgx540-120";
> >>
> >> This should not pass the bindings check because you missed last
> >> compatibles.
> >>
> >=20
> > Thanks for pointing that out, I'll add it and make sure it passes the b=
indings check.
> >=20
> >>>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 reg =3D <0xf3000000 0x10000>;
> >>>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 interrupt-parent =3D <&vic2>;
> >>>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 interrupts =3D <10>;
> >>>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 clock-names =3D "core";
> >>>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 clocks =3D <&clocks CLK_G3D>;
> >>>>> +
> >>>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 assigned-clocks =3D <&clocks MOU=
T_G3D>, <&clocks DOUT_G3D>;
> >>>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 assigned-clock-rates =3D <0>, <6=
6700000>;
> >>>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 assigned-clock-parents =3D <&clo=
cks MOUT_MPLL>;
> >>>>
> >>>> What are these clocks for, and why are they reparented / reclocked?
> >>>>
> >>>> Shouldn't they be passed to 'clocks' as well?
> >>>>
> >>>> -Paul
> >>>>
> >>>
> >>> The G3D clock system can have multiple parents, and for stable operat=
ion
> >>> it's recommended to use the MPLL clock as the parent (which in turn
> >>> is actually a mux as well).  MOUT_G3D is simply the mux for CLK_G3D
> >>> (SGX core clock), DOUT_G3D is the divider.  DOUT_G3D could equally be=
 CLK_G3D
> >>> (and probably should be, for readability) as CLK_G3D is simply the ga=
te and
> >>> DOUT_G3D is the divider for it.
> >>
> >> Good point, it should be CLK_G3D instead of DOUT.  Can you fix this as
> >> well?
> >=20
> > Yep, will do.  Nikolaus, I'll send you an updated patch to include.
> >=20
>=20
> How are assigned-clocks handled in the yaml DT schema?  When running make=
 dtbs_check,
> I end up with messages such as
>=20
> arch/arm/boot/dts/s5pv210-aquila.dt.yaml: gpu@f3000000: 'assigned-clock-p=
arents', 'assigned-clock-rates', 'assigned-clocks' do not match any of the =
regexes: 'pinctrl-[0-9]+'
>=20
> Do they need to explicitly be listed as valid entries?

If you have additionalProperties set to false, yes. But you should really
consider not using them in the first place, since they provide no guarantee=
 on
whether the setup you did in the DT will remain during the life of the syst=
em.

I'm not sure why it's needed on that SoC in particular, but this should be =
fixed
in the driver itself (either the clock or the GPU driver).

Maxime

--u22eiu3zouiknukx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXqk/GwAKCRDj7w1vZxhR
xR+OAP9zSq/md3bxfVKk4er7ZI7jk8/dQzTxgBO3mo3r+wRqmwEAy6d+UHyzeb5t
qZLq2zIdK45SI8CMqYcGeBsbBQ1iVAc=
=VCha
-----END PGP SIGNATURE-----

--u22eiu3zouiknukx--

--===============0567165274==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0567165274==--
