Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A36C32D71D
	for <lists+dri-devel@lfdr.de>; Thu,  4 Mar 2021 16:52:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 185556EA2C;
	Thu,  4 Mar 2021 15:52:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 848D26EA2C
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Mar 2021 15:52:03 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 3482F5C0068;
 Thu,  4 Mar 2021 10:52:00 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Thu, 04 Mar 2021 10:52:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=b57Uf8ioZOoGZyMVnhn75H7VYbW
 5wt1QrSdXz9JcpVI=; b=pzvrnuPPKKki3h8dAiU7pvwK+COwsO12yACUjB6O/kc
 tM+b5nvyeBtSGlM2E1xKrPdFuwD2VIcK1JNj4sk5iC2AR6TpDvGekDkCTHJYGqyZ
 Cpu9uwjSYn3chjLVWHYuZHruQH1QeHnihNZSob8KAAnh6Ys1dua2EDup6pcFIa1d
 pFHLcwuWgFRzAztj/nqJmMvOHvHX1zJniDE0s8EBEAJbIdeGtVA0TkCMhf8vu7Iq
 TmcqG1yr0cErkJ+/jglZD4lBL1dr8//2x0rSfn3IW7+TYvYIhrgzmDAvcxLPDUP+
 9lv4o6sp3vYV2Cod2cbqLSfkm5J4MzLp4T6QvC3Xvtw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=b57Uf8
 ioZOoGZyMVnhn75H7VYbW5wt1QrSdXz9JcpVI=; b=fHtWG78gQv5JoKvcgYwOsf
 bzFdqJi1tceGno4OftALuPWefUcVJlfpfKHVdM/wIW4UJW12wY6dRYDu210OSk11
 DypFIFDI40AJjE9QXcVyaazWQ2KNeDWX3wgo6AtvOJWYw8fBkRMYYrwuQ9O80x4n
 2V3b32tQsjPEq0mQ7sdbqn6nN3zS109sE5Xr8sJ5/KCdwUDs2VjKP+ZHbQw6UPkr
 rsf96m+PXF9HeShP+7GdY2lu0UOygpiVaz8fvR0cVta4QaCnfeD9D7h7e01AhiXw
 +bFceVIF7d327jP9LgqXAnGGoICPgRPx0oUZloMFXX+1Q3NoX05xgN8lPDGBwm4A
 ==
X-ME-Sender: <xms:HwJBYGGdEjS4XdKGFbTpo72cO57YAgbPSf7MiavfPxtAzPj-fVHnuQ>
 <xme:HwJBYHVEtGCXmb1QjR0tWwMvJTMoG02AFwIS3PchJo8hOPoCFLWzVr3iBAe1aPo9F
 2zOXgCSO5hOwUq6ULA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddtgedgjeehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddunecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepuddvudfhkeekhefgffetffelgffftdehffduffegveetffehueeivddvjedv
 gfevnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:HwJBYAKcfqvZk_e1zz8L86iRmZBcWYSlKlLb0TGA3uwRdXvYR02WZg>
 <xmx:HwJBYAGlzZcqS8KUjo7xXlX-KbzKMlqqxJDhnuMQ7quRpxJ7LXl5dQ>
 <xmx:HwJBYMXr_ZvTCPNGmXncrvvnLzBaaLBqMaT2zi2WokJchlXROvZOOg>
 <xmx:IAJBYDS2HILrIXemdKzG6CdLob_Yj8s5m5o31a4LNawWbAqCN166-Q>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id D379524005B;
 Thu,  4 Mar 2021 10:51:58 -0500 (EST)
Date: Thu, 4 Mar 2021 16:51:57 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Marjan Pascolo <marjan.pascolo@trexom.it>
Subject: Re: [PATCH] pinctrl/sunxi: adding input-debounce-ns property
Message-ID: <20210304155157.5mxw7h2ul4fb673r@gilmour>
References: <d244aa6b-00b7-d768-83cb-e5a228b7ee08@trexom.it>
 <20210114081732.9386-1-giulio.benetti@benettiengineering.com>
 <20210114114219.faulkwww3dhdqwmc@gilmour>
 <c3bc06e3-4193-dc0b-b2b3-d54636481e28@trexom.it>
 <20210217110313.ly5ly5u5vyh2s7dh@gilmour>
 <4171ad5c-97f1-5738-9127-078fea74bbf7@trexom.it>
MIME-Version: 1.0
In-Reply-To: <4171ad5c-97f1-5738-9127-078fea74bbf7@trexom.it>
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
Cc: linux-arm-kernel@lists.infradead.org, wens@csie.org,
 Jernej Skrabec <jernej.skrabec@siol.net>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============1601649358=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1601649358==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wzbll5gpg4mgw7pz"
Content-Disposition: inline


--wzbll5gpg4mgw7pz
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 26, 2021 at 01:53:00PM +0100, Marjan Pascolo wrote:
> Hi Maxime,
>=20
> Il 17/02/2021 12:03, Maxime Ripard ha scritto:
> > Hi,
> >=20
> > On Wed, Feb 10, 2021 at 05:22:37PM +0100, Marjan Pascolo wrote:
> > > On Allwinner SoC interrupt debounce can be controlled by two oscillat=
or
> > > (32KHz and 24MHz) and a prescale divider.
> > > Oscillator and prescale divider are set through
> > > device tree property "input-debounce" which have 1uS accuracy.
> > > For acheive nS precision a new device tree poperty is made
> > > named "input-debounce-ns".
> > > "input-debounce-ns" is checked only if "input-debounce"
> > > property is not defined.
> > >=20
> > > Suggested-by: Maxime Ripard <maxime@cerno.tech>
> > > Signed-off-by: Marjan Pascolo <marjan.pascolo@trexom.it>
> > > ---
> > > ---
> > >  =A0.../pinctrl/allwinner,sun4i-a10-pinctrl.yaml=A0 |=A0 9 +++++++
> > >  =A0drivers/pinctrl/sunxi/pinctrl-sunxi.c=A0=A0=A0=A0=A0=A0=A0=A0 | 2=
5 ++++++++++++++++---
> > >  =A02 files changed, 30 insertions(+), 4 deletions(-)
> > >=20
> > > diff --git
> > > a/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinct=
rl.yaml
> > > b/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinct=
rl.yaml
> > > index 5240487dfe50..346776de3a44 100644
> > > ---
> > > a/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinct=
rl.yaml
> > > +++
> > > b/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinct=
rl.yaml
> > > @@ -93,6 +93,15 @@ properties:
> > >  =A0=A0=A0=A0 minItems: 1
> > >  =A0=A0=A0=A0 maxItems: 5
> > >=20
> > > +=A0 input-debounce-ns:
> > > +=A0=A0=A0 description:
> > > +=A0=A0=A0=A0=A0 Debouncing periods in nanoseconds, one period per in=
terrupt
> > > +=A0=A0=A0=A0=A0 bank found in the controller.
> > > +=A0=A0=A0=A0=A0 Only checked if input-debounce is not present
> > > +=A0=A0=A0 $ref: /schemas/types.yaml#/definitions/uint32-array
> > > +=A0=A0=A0 minItems: 1
> > > +=A0=A0=A0 maxItems: 5
> > > +
> > This should be a separate patch, with the DT maintainers in Cc.
> >=20
> > You should enforce that the properties are mutually exclusive through
> > the schema too
>=20
> I'm sorry, I've ignored documentaion about /Documentation.
>=20
> I see that some additional YAML operator (like oneOf) are used.
>=20
> oneOf should fit the schema, but I can't understand if oneOf's options mu=
st
> be a literal value, or if could also be a node.
>=20
> Otherwise I'll use if ..then..else.

dependencies is what you're looking for, not oneOf or if

Maxime

--wzbll5gpg4mgw7pz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYEECHQAKCRDj7w1vZxhR
xbQNAQD7DNIY6ibok+p7Ri/WlH9zj11VeetLEFNL/J+sPfqHkwD/TuX1Muj5Vzk2
QlPPj3sJmotBVGEczGFFMoAmc/zR9gM=
=z3zV
-----END PGP SIGNATURE-----

--wzbll5gpg4mgw7pz--

--===============1601649358==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1601649358==--
