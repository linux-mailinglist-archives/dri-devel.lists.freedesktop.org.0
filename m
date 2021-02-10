Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A6F316944
	for <lists+dri-devel@lfdr.de>; Wed, 10 Feb 2021 15:40:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80E656EC92;
	Wed, 10 Feb 2021 14:40:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D21946EC92
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Feb 2021 14:40:51 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 635665802C7;
 Wed, 10 Feb 2021 09:40:48 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Wed, 10 Feb 2021 09:40:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=P2ztjygVeFiKQ5BAJ/ZTctF2Gnz
 2GbSXv/Mu4NHHWRY=; b=qEwIJymZrzmFRVK+c/s0yGIOxBOAX8YD/jfThN686uK
 rhdyNG0FvMMULp9fIB1bahDTLdRpb4K5/mf89fufSPe3dX2YS8W2jBr842ftq4hR
 oCprmSXWC6hgv7H5q8GIEe/yjq6+2/9lJ9ezHYFYV3MJAz9SwnmrARQLKIaieD7m
 obeqB6AuVmoB56NAKXfGfnOKeaHDDSjHj+ZhvKYhWOnOR/9NIU0zwvYbo2X1dyj0
 1HTGLVH1Aab+sdlQBlOF2NgsjGFyiu5NT9fJ57LCvb1npFT439wa7Dz0Ijb/Y9F8
 FNclmmBP4rcWT8KnfVpMmzxFzhi1JJrzN30CdtMpLqg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=P2ztjy
 gVeFiKQ5BAJ/ZTctF2Gnz2GbSXv/Mu4NHHWRY=; b=okRq03+9FqXZb+M4do/47P
 dyKgB9g+Zqzf9lDjb+Nq/Zr1gRQUUuWy0pgjYxkxN4yaPhlmBx7fQn8oJlk5f/WK
 lgHVyHxclHwNnkug0BEdDSkHETiO7vRcLmY3qN/nUhGmhtv4+RZJ7VfQpm+6ylgc
 jZwOv92bQYpoY3IrUfrcg0Znlv06pcVZ00ypvQlRgV8Sv6worDIIt38hIMxYxa0g
 xecMWzlDeI3uwgsFrl/W63A+1aPewE5JRWzgSpuKQqk4z5WV3Yn3khsYn2oIvqqb
 c10QlxE1g3Ntr36C2+M6ercVZn/q2n+wJFCGf3H7baVdrlLqUPcXUIFP28V0YNxw
 ==
X-ME-Sender: <xms:bvAjYCoIUAT89IKZqkyGTp3oMDvjh8ywX2go-4bdDDRFNuwCpyboGw>
 <xme:bvAjYApSF_hY1221zohC_wtCFzXkdP0t-DYH8u8utKwqwkXViyt3aEnV4ahNUYyDV
 C7zGTrviKDeW4Fvhho>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrheejgdeiiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:bvAjYHNCO9rvM45pL13AJW5ke72O_QDZJiHozfxL7iYnGxV6H7dcgw>
 <xmx:bvAjYB4J1mnOVJrspQl7to3FDiNxGo2yMM6shQFyViNE3dnVjTFKXQ>
 <xmx:bvAjYB6aPgRmu7jw_GqpGTKltfNSE4qRXKmTza5ZmWAqADCZMFF60Q>
 <xmx:cPAjYIrRdHovNap8ete9MsOtShn9D9DY9Jka0oTCZKnO_4sYLQh1yQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id C8D08240062;
 Wed, 10 Feb 2021 09:40:45 -0500 (EST)
Date: Wed, 10 Feb 2021 15:40:43 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH v2 14/15] ARM: dts: bcm2711: Add the BSC interrupt
 controller
Message-ID: <20210210144043.s4plyc7ekwnnu7k4@gilmour>
References: <20210111142309.193441-1-maxime@cerno.tech>
 <20210111142309.193441-15-maxime@cerno.tech>
 <CAPY8ntC7U1BAVT8xe0emX19p4mCu-BQOeBeC-CDgKjE+asZKRQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPY8ntC7U1BAVT8xe0emX19p4mCu-BQOeBeC-CDgKjE+asZKRQ@mail.gmail.com>
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
Cc: Florian Fainelli <f.fainelli@gmail.com>, David Airlie <airlied@linux.ie>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: multipart/mixed; boundary="===============0668395412=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0668395412==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="56a5x6qoevnvgc6k"
Content-Disposition: inline


--56a5x6qoevnvgc6k
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

On Tue, Feb 09, 2021 at 09:49:05AM +0000, Dave Stevenson wrote:
> On Mon, 11 Jan 2021 at 14:23, Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > The BSC controllers used for the HDMI DDC have an interrupt controller
> > shared between both instances. Let's add it to avoid polling.
>=20
> This seems to have unintended side effects.
> GIC interrupt 117 is shared between the standard I2C controllers
> (i2c-bcm2835) and the l2-intc block handling the HDMI I2C interrupts.
>=20
> Whilst i2c-bcm2835 requests the interrupt with IRQF_SHARED, that
> doesn't appear to be an option for l2-intc registering as an interrupt
> controller. i2c-bcm2835 therefore loses out and fails to register for
> the interrupt.
>=20
> Is there an equivalent flag that an interrupt controller can add to
> say that the parent interrupt is shared? Is that even supported?

Indeed, it looks like setting an equivalent to IRQF_SHARED would be the
solution, but I couldn't find anything that would allow us to in the
irqchip code.

Marc, Thomas, is it something that is allowed?

Thanks!
Maxime

--56a5x6qoevnvgc6k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYCPwawAKCRDj7w1vZxhR
xfz5AP9mEfV4z4O2puDJLRbQ7vq8rgfauEvYgK4B2X6lJbqcTQD/faR5cryNEgGR
UJkYFI2Z8uuR9+us+5z3CVcV6wOolQU=
=tX0n
-----END PGP SIGNATURE-----

--56a5x6qoevnvgc6k--

--===============0668395412==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0668395412==--
