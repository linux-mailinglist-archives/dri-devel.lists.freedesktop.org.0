Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A7C6592B82
	for <lists+dri-devel@lfdr.de>; Mon, 15 Aug 2022 12:41:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E557AAF56F;
	Mon, 15 Aug 2022 10:41:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AFD3B026A
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Aug 2022 10:40:48 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 4CAB758024F;
 Mon, 15 Aug 2022 06:40:46 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Mon, 15 Aug 2022 06:40:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1660560046; x=1660567246; bh=xZdyFzkGwx
 NMaSQo9f1nE23W8o0Knxs8zi25rNE/F+g=; b=K0y9jdKT7Kqzfipo6DBG31ePNj
 Fb0wyla4+TvyGQ/KrNeInN+6WERTOM9Nyjd3dYIhJfCozuQXBgY+BKkPTqQpHGOW
 2d7TWIlHQYfRafW2TQFflIOgPgCruZcXThcmkSWzd+41bi/FeV9bhRku3kkA8k+U
 jV4xFniD75iqFZYiDWBnTiHMCcuvb2AhkPg5iGdwlF9XB8Lua7lDzCOAkRW42IU3
 AXJmWiEuQyhGdCTnodHHzf3lItiiLT1Z0VrFFnGZrguStTTk/yDH11eO6AtR49za
 3jQ++ef7BBrPi2IuxaaDvS571gfD8ScZvA4gZYeWAjlIyeUdzn4MeHKPyfQw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1660560046; x=1660567246; bh=xZdyFzkGwxNMaSQo9f1nE23W8o0K
 nxs8zi25rNE/F+g=; b=KuELks6dtpN1WqhnN7uKXV+ed912oj+rJmyd1lNhf2CZ
 c/+JIhTQpRs9odLjPNmpgNH2T7eaqsJB+TSTK/UI83wcb+EFSY6zmMcfrbkZLCPj
 Tf6Gsg6+yzuwW25e8dKfs168TxSpyRDzA1KZ9HRku8dgyryvYtIXJ3sPkqQiCqwq
 ufocVBlrbMIyCs0gZmbuUJKnLFKXljZRBd8w1Puuudvmy/mJdWFphZD5HOlQcoGa
 6BpmTZR4CGaTiHWiocmSG8dqh2hTnOhm0CATBtm/hq7K5W6gPRP5GGPZ4B3HqgY3
 Ri/U1F28EdCPwNgmrsydQYAQwCHwsyCPsyhkugX8Wg==
X-ME-Sender: <xms:rCL6YhbbYH_kqaDn4cLbM_M0B9mDmlCm5zrZzg36ARp-nL9_ISA6mw>
 <xme:rCL6YoYoUZVON99FeMGEiNDuROvTBBhIhEGoEUCy-9iobL4dzdtHVVxJ8QS3ps1pi
 xVvKLd4fJrwa_-n1g4>
X-ME-Received: <xmr:rCL6Yj_93gSWPrkTEC3bWOTeTokDGtEeg0XtGHXA3Ud3Av6Ba9-bAPDfls-X>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehvddgfeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtudenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeejveefheefkeeiffegveelveetgffffeektdefuefhtedtgeejhefggedu
 ffffudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:rCL6YvrZb8d-70a2yCKLG23pvQYKghlC03ajxx8SGoIbIft-vVGjwg>
 <xmx:rCL6YsovMmOaDx-QoWNCODYJdhrHPFwrWAdwZt8KTlLJ2hWCVa1ngA>
 <xmx:rCL6YlRxbA4IVIfJXPfh5Oy9TI_xAgceXYr5NZwtlneMgj9nqxc6lg>
 <xmx:riL6YlY4P3xtxIziMyH_eBPDfULxza36rNr2CLomIy3NS99U_2Afww>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 15 Aug 2022 06:40:43 -0400 (EDT)
Date: Mon, 15 Aug 2022 12:40:41 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH v1 06/35] drm/connector: Only register TV mode property
 if present
Message-ID: <20220815104041.6ymspbhpjdxg2aoe@houat>
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
 <20220728-rpi-analog-tv-properties-v1-6-3d53ae722097@cerno.tech>
 <d96df677-a1a7-ae49-bda6-abad025dc974@tronnes.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="dvyzowdjas7acdtu"
Content-Disposition: inline
In-Reply-To: <d96df677-a1a7-ae49-bda6-abad025dc974@tronnes.org>
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
Cc: Emma Anholt <emma@anholt.net>, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Phil Elwell <phil@raspberrypi.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Samuel Holland <samuel@sholland.org>, Kevin Hilman <khilman@baylibre.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-sunxi@lists.linux.dev,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--dvyzowdjas7acdtu
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Aug 08, 2022 at 02:49:08PM +0200, Noralf Tr=F8nnes wrote:
> Den 29.07.2022 18.34, skrev Maxime Ripard:
> > The drm_create_tv_properties() will create the TV mode property
> > unconditionally.
> >=20
> > However, since we'll gradually phase it out, let's register it only if =
we
> > have a list passed as an argument. This will make the transition easier.
> >=20
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> >=20
>=20
> I don't understand why this makes the transition easier, but if you
> think so:

So the basic idea behind this series was to introduce the new property,
gradually convert the old drivers to the new one, and finally remove the
old one.

In order to keep the backward compatibility, we need to add to the
drivers some custom get/set_property hook to expose the old property and
fill the new one if needed.

That means that each driver would have to create the old property, which
will conflict with that code

Maxime

--dvyzowdjas7acdtu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYvoiqQAKCRDj7w1vZxhR
xaybAQC2LtyY3MToe9xoyVgcLBOfo1ql+NWQtjIn17TggFlnRgEAr4/9dmteOoOs
AoYm/Hq80I2UIc7K4NZgCJX6MSwZCQ4=
=bqI2
-----END PGP SIGNATURE-----

--dvyzowdjas7acdtu--
